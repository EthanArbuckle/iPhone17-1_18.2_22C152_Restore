@interface SBSystemUISceneSettings
+ (id)settingsControllerModule;
- (BOOL)allowAnySceneSessionRole;
- (void)setAllowAnySceneSessionRole:(BOOL)a3;
- (void)setDefaultValues;
@end

@implementation SBSystemUISceneSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemUISceneSettings;
  [(PTSettings *)&v3 setDefaultValues];
  *(&self->super.__isObservingChildren + 1) = 0;
}

+ (id)settingsControllerModule
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941E8] rowWithTitle:@"allow any scene session role of an entitled client to request a SystemUI scene" valueKeyPath:@"allowAnySceneSessionRole"];
  objc_super v3 = (void *)MEMORY[0x1E4F94168];
  v18[0] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v5 = [v3 sectionWithRows:v4 title:@"General"];

  v6 = (void *)MEMORY[0x1E4F94100];
  v7 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v8 = [v6 rowWithTitle:@"Restore Defaults" action:v7];

  v9 = (void *)MEMORY[0x1E4F94168];
  v17 = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v11 = [v9 sectionWithRows:v10];

  v12 = (void *)MEMORY[0x1E4F94168];
  v16[0] = v5;
  v16[1] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v14 = [v12 moduleWithTitle:@"SystemUI Scene" contents:v13];

  return v14;
}

- (BOOL)allowAnySceneSessionRole
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setAllowAnySceneSessionRole:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

@end