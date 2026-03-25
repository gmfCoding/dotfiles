
function ttprint()
{
//	print.apply(null, arguments);
}

var ObjectType = {
    TileTopLeft: 0,
    TileTopRight: 1
};

function getQuickTileState(client) {
    if (!client) return null;
    var output = client.output || workspace.activeScreen;
    if (!output) return null;
    var screenArea = workspace.clientArea(KWin.MaximizeFullArea, output, workspace.currentDesktop);
    var g = client.frameGeometry;
    var halfHeight = Math.floor(screenArea.height / 2);
    ttprint("TileTopToMax: screenArea:", screenArea, "frameGeometry:", g, "halfH:", halfHeight);
    if (g.y === screenArea.y && g.height <= halfHeight + 5) {
        var mid = screenArea.x + Math.floor(screenArea.width/2);
        if (g.x < mid) return ObjectType.TileTopLeft;
        return ObjectType.TileTopRight;
    }
    return null;
}

function isEffectivelyMaximized(client) {
    return client.maximizedHorizontally && client.maximizedVertically;
}



ttprint("TileTopToMax: Script loaded 2.0");

registerShortcut("QuickTileTopEnh", "Quick Tile Top (enhanced)", "Meta+Up", function () {
    var client = workspace.activeWindow;
    ttprint("TileTopToMax: shortcut triggered, client:", client);
    if (!client) {
        ttprint("TileTopToMax: no active client");
        return;
    }

    ttprint("TileTopToMax: frameGeometry:", client.frameGeometry);
    ttprint("TileTopToMax: maximized:", client.maximizedHorizontally, client.maximizedVertically);

    var state = getQuickTileState(client);
    ttprint("TileTopToMax: state:", state);
    if (state === ObjectType.TileTopLeft || state === ObjectType.TileTopRight) {
        ttprint("TileTopToMax: maximizing window");
    	    // Get the available client area for the window.
    	let clientArea = workspace.clientArea(KWin.MaximizeArea, workspace.activeWindow);
	client.frameGeometry = clientArea;
    } else {
       ttprint("TileTopToMax: tiling to top");
       workspace.slotWindowQuickTileTop();
   }
});
