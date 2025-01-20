@interface _UIKeyShortcutHUDWindow
+ (BOOL)_isSystemWindow;
- (BOOL)_wantsFocusEngine;
- (NSArray)hudKeyCommands;
- (_UIKeyShortcutHUDWindow)initWithWindowScene:(id)a3;
- (_UIKeyShortcutHUDWindowDelegate)delegate;
- (id)_roleHint;
- (id)keyCommands;
- (void)_hudWindowSceneDidResignTargetOfKeyboardEventDeferringEnvironment:(id)a3;
- (void)resignKeyWindow;
- (void)setDelegate:(id)a3;
- (void)setHudKeyCommands:(id)a3;
@end

@implementation _UIKeyShortcutHUDWindow

- (_UIKeyShortcutHUDWindow)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIKeyShortcutHUDWindow;
  v5 = [(UIWindow *)&v11 initWithWindowScene:v4];
  v6 = v5;
  if (v5)
  {
    [(UIView *)v5 setOpaque:0];
    v7 = +[UIColor clearColor];
    [(UIView *)v6 setBackgroundColor:v7];

    [(UIWindow *)v6 setWindowLevel:2200.0];
    v8 = [(UIView *)v6 layer];
    [v8 setHitTestsAsOpaque:1];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__hudWindowSceneDidResignTargetOfKeyboardEventDeferringEnvironment_ name:@"_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification" object:v4];
  }
  return v6;
}

- (void)resignKeyWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDWindow;
  [(UIWindow *)&v4 resignKeyWindow];
  v3 = [(_UIKeyShortcutHUDWindow *)self delegate];
  [v3 keyShortcutHUDWindowDidResignKey:self];
}

- (void)_hudWindowSceneDidResignTargetOfKeyboardEventDeferringEnvironment:(id)a3
{
  id v4 = [(_UIKeyShortcutHUDWindow *)self delegate];
  [v4 keyShortcutHUDWindowSceneDidResignKeyboardFocus:self];
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)_wantsFocusEngine
{
  return 1;
}

- (id)_roleHint
{
  return @"_UIWindowRoleHintKeyCommandHUD";
}

- (id)keyCommands
{
  return self->_hudKeyCommands;
}

- (_UIKeyShortcutHUDWindowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIKeyShortcutHUDWindowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)hudKeyCommands
{
  return self->_hudKeyCommands;
}

- (void)setHudKeyCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hudKeyCommands, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end