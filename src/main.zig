const std = @import("std");
const rl = @import("raylib");
const rg = @import("raygui");

const GameMode = enum { title, game };

const GameConfig = struct {
    mode: GameMode,
    screenWidth: i32,
    screenHeight: i32,
};

fn renderTitleScreen(config: GameConfig) void {
    rl.clearBackground(rl.Color.fromInt(0x5B7C99));
    rl.drawText("BATTLESHIP", @divTrunc(config.screenWidth, 5), @divTrunc(config.screenHeight, 3), 200, rl.Color.white);
    rl.drawText("Press enter to play", @divTrunc(config.screenWidth, 3) - 40, @divTrunc(config.screenHeight, 2), 80, rl.Color.white);
    rl.drawText("Made by Randae Garcia", @divTrunc(config.screenWidth, 3) + 120, config.screenHeight - 46 , 45, rl.Color.white);
}

pub fn main() !void {
    rl.initWindow(rl.getScreenWidth(), rl.getScreenWidth(), "Battleship");

    const State = GameConfig{
        .mode = GameMode.title,
        .screenWidth = rl.getScreenWidth(),
        .screenHeight = rl.getScreenHeight(),
    };

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.white);

        if (State.mode == GameMode.title) {
            renderTitleScreen(State);
        }
    }
}
