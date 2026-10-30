const std = @import("std");
const rl = @import("raylib");
const rg = @import("raygui");

const GameMode = enum { title, game };
const GameConfig = struct { mode: GameMode };

fn renderTitleScreen() void {

}

pub fn main() !void {
    rl.initWindow(rl.getScreenWidth(), rl.getScreenWidth(), "Battleship");

    const State = GameConfig{ .mode = GameMode.title };

    const screenWidth = rl.getScreenWidth();
    const screenHeight = rl.getScreenHeight();
    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.white);

        if (State.mode == GameMode.title) {
            rl.drawText("BATTLESHIP", @divTrunc(screenWidth, 3), @divTrunc(screenHeight, 2), 100, rl.Color.red);
        }
    }
}
