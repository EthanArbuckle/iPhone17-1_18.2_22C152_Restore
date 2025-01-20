@interface SBHCredenzaSettings
+ (id)settingsControllerModule;
+ (void)addAppLibrarySectionsIfNeededToSection:(id)a3;
- (BOOL)shouldPinLibraryList;
- (void)setDefaultValues;
- (void)setShouldPinLibraryList:(BOOL)a3;
@end

@implementation SBHCredenzaSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHCredenzaSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBHCredenzaSettings *)self setShouldPinLibraryList:0];
}

+ (id)settingsControllerModule
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v3 = (void *)MEMORY[0x1E4F940F8];
  v4 = [MEMORY[0x1E4F94170] action];
  v5 = [v3 rowWithTitle:@"Restore Defaults" action:v4];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  v7 = [MEMORY[0x1E4F94160] sectionWithRows:v6 title:@"Restore Defaults"];
  [v2 addObject:v7];
  [(id)objc_opt_class() addAppLibrarySectionsIfNeededToSection:v2];
  v8 = [MEMORY[0x1E4F94160] moduleWithTitle:0 contents:v2];

  return v8;
}

+ (void)addAppLibrarySectionsIfNeededToSection:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v7 = v3;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (SBHFeatureEnabled(0))
    {
      v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Pin Library List" valueKeyPath:@"shouldPinLibraryList"];
      [v4 addObject:v5];
    }
    if ([v4 count])
    {
      v6 = [MEMORY[0x1E4F94160] sectionWithRows:v4 title:@"App Library"];
      [v7 addObject:v6];
    }
    id v3 = v7;
  }
}

- (BOOL)shouldPinLibraryList
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setShouldPinLibraryList:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

@end