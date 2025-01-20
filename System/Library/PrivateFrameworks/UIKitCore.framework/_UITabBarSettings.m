@interface _UITabBarSettings
+ (id)settingsControllerModule;
- (BOOL)highlightSystemItems;
- (BOOL)showAlignmentGuides;
- (void)setDefaultValues;
- (void)setHighlightSystemItems:(BOOL)a3;
- (void)setShowAlignmentGuides:(BOOL)a3;
@end

@implementation _UITabBarSettings

- (BOOL)showAlignmentGuides
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UITabBarSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UITabBarSettings *)self setHighlightSystemItems:0];
  [(_UITabBarSettings *)self setShowAlignmentGuides:0];
}

- (void)setShowAlignmentGuides:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (void)setHighlightSystemItems:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

+ (id)settingsControllerModule
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Highlight System Items" valueKeyPath:@"highlightSystemItems"];
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Image Alignment Guides" valueKeyPath:@"showAlignmentGuides"];
  v4 = (void *)MEMORY[0x1E4F940F8];
  v5 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v6 = [v4 rowWithTitle:@"Restore Defaults" action:v5];

  v7 = (void *)MEMORY[0x1E4F94160];
  v17[0] = v2;
  v17[1] = v3;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v9 = [v7 sectionWithRows:v8];
  v18[0] = v9;
  v10 = (void *)MEMORY[0x1E4F94160];
  v16 = v6;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v12 = [v10 sectionWithRows:v11];
  v18[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v14 = [v7 moduleWithTitle:0 contents:v13];

  return v14;
}

- (BOOL)highlightSystemItems
{
  return *(&self->super.__isObservingChildren + 1);
}

@end