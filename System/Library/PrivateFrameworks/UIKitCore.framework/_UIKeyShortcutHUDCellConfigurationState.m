@interface _UIKeyShortcutHUDCellConfigurationState
- (BOOL)drawsBackground;
- (BOOL)isCategoryVisible;
- (BOOL)isFlashing;
- (_UIKeyShortcutHUDCellConfigurationState)initWithCellConfigurationState:(id)a3;
- (void)setCategoryVisible:(BOOL)a3;
- (void)setDrawsBackground:(BOOL)a3;
- (void)setFlashing:(BOOL)a3;
@end

@implementation _UIKeyShortcutHUDCellConfigurationState

- (_UIKeyShortcutHUDCellConfigurationState)initWithCellConfigurationState:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDCellConfigurationState;
  return (_UIKeyShortcutHUDCellConfigurationState *)[(UICellConfigurationState *)&v4 _initWithState:a3];
}

- (BOOL)isFlashing
{
  v2 = [(UIViewConfigurationState *)self objectForKeyedSubscript:@"com.apple.uikit.key-shortcut-hud.flashing-configuration-state"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setFlashing:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIViewConfigurationState *)self setObject:v4 forKeyedSubscript:@"com.apple.uikit.key-shortcut-hud.flashing-configuration-state"];
}

- (BOOL)isCategoryVisible
{
  v2 = [(UIViewConfigurationState *)self objectForKeyedSubscript:@"com.apple.uikit.key-shortcut-hud.category-visible-configuration-state"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setCategoryVisible:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIViewConfigurationState *)self setObject:v4 forKeyedSubscript:@"com.apple.uikit.key-shortcut-hud.category-visible-configuration-state"];
}

- (BOOL)drawsBackground
{
  v2 = [(UIViewConfigurationState *)self objectForKeyedSubscript:@"com.apple.uikit.key-shortcut-hud.draws-background-configuration-state"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDrawsBackground:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIViewConfigurationState *)self setObject:v4 forKeyedSubscript:@"com.apple.uikit.key-shortcut-hud.draws-background-configuration-state"];
}

@end