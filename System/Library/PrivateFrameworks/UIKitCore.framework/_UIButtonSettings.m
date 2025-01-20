@interface _UIButtonSettings
+ (id)settingsControllerModule;
- (BOOL)highlightAlternateColor;
- (BOOL)highlightBelow;
- (BOOL)highlightIgnoresBars;
- (BOOL)highlightMode;
- (BOOL)highlightSubclasses;
- (_UIButtonSettings)initWithDefaultValues;
- (void)setDefaultValues;
- (void)setHighlightAlternateColor:(BOOL)a3;
- (void)setHighlightBelow:(BOOL)a3;
- (void)setHighlightIgnoresBars:(BOOL)a3;
- (void)setHighlightMode:(BOOL)a3;
- (void)setHighlightSubclasses:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation _UIButtonSettings

- (BOOL)highlightMode
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIButtonSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIButtonSettings *)self setHighlightMode:0];
  [(_UIButtonSettings *)self setHighlightSubclasses:1];
  [(_UIButtonSettings *)self setHighlightIgnoresBars:1];
  [(_UIButtonSettings *)self setHighlightBelow:0];
  [(_UIButtonSettings *)self setHighlightAlternateColor:0];
}

- (void)setHighlightSubclasses:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (void)setHighlightMode:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (void)setHighlightIgnoresBars:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (void)setHighlightBelow:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

- (void)setHighlightAlternateColor:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 5) = a3;
}

- (_UIButtonSettings)initWithDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonSettings;
  v2 = [(PTSettings *)&v5 initWithDefaultValues];
  objc_super v3 = v2;
  if (v2) {
    [(PTSettings *)v2 addKeyObserver:v2];
  }
  return v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        _recursivelyLayoutUIButtons(*(void **)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (id)settingsControllerModule
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v18 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Highlight UIButtons" valueKeyPath:@"highlightMode"];
  v20[0] = v18;
  v17 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Include Subclasses" valueKeyPath:@"highlightSubclasses"];
  v20[1] = v17;
  v16 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Ignore Bar Buttons" valueKeyPath:@"highlightIgnoresBars"];
  v20[2] = v16;
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Solid Highlight Below" valueKeyPath:@"highlightBelow"];
  v20[3] = v3;
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Alternate Color" valueKeyPath:@"highlightAlternateColor"];
  v20[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];
  uint64_t v6 = [v2 sectionWithRows:v5 title:@"Usage"];
  v21[0] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F94160];
  uint64_t v8 = (void *)MEMORY[0x1E4F940F8];
  long long v9 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  long long v10 = [v8 rowWithTitle:@"Restore Defaults" action:v9];
  v19 = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  long long v12 = [v7 sectionWithRows:v11];
  v21[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v14 = [v2 moduleWithTitle:0 contents:v13];

  return v14;
}

- (BOOL)highlightSubclasses
{
  return *(&self->super.__isObservingChildren + 2);
}

- (BOOL)highlightIgnoresBars
{
  return *(&self->super.__isObservingChildren + 3);
}

- (BOOL)highlightBelow
{
  return *(&self->super.__isObservingChildren + 4);
}

- (BOOL)highlightAlternateColor
{
  return *(&self->super.__isObservingChildren + 5);
}

@end