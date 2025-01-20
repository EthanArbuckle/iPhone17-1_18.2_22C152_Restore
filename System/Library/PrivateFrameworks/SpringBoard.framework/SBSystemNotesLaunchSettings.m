@interface SBSystemNotesLaunchSettings
+ (id)settingsControllerModule;
- (NSString)applicationBundleID;
- (void)setApplicationBundleID:(id)a3;
- (void)setDefaultValues;
@end

@implementation SBSystemNotesLaunchSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesLaunchSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBSystemNotesLaunchSettings *)self setApplicationBundleID:@"com.apple.mobilenotes"];
}

+ (id)settingsControllerModule
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  objc_super v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v4 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v5 = [MEMORY[0x1E4F94150] rowWithTitle:@"BundleID" valueKeyPath:@"applicationBundleID"];
  v6 = (void *)MEMORY[0x1E4F94168];
  v14[0] = v4;
  v14[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v8 = [v6 sectionWithRows:v7 title:0];

  v9 = (void *)MEMORY[0x1E4F94168];
  v13 = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11 = [v9 moduleWithTitle:@"Application Launch Settings" contents:v10];

  return v11;
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)setApplicationBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end