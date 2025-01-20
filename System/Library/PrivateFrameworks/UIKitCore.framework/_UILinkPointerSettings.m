@interface _UILinkPointerSettings
+ (id)settingsControllerModule;
- (void)setDefaultValues;
@end

@implementation _UILinkPointerSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UILinkPointerSettings;
  [(_UIFreeformPointerSettings *)&v3 setDefaultValues];
  [(_UIFreeformPointerSettings *)self setSlipFactorX:0.5];
  [(_UIFreeformPointerSettings *)self setSlipFactorX:0.5];
}

+ (id)settingsControllerModule
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slip X" valueKeyPath:@"slipFactorX"];
  v4 = [v3 between:0.0 and:1.0];
  v5 = [v4 precision:3];
  v23[0] = v5;
  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slip Y" valueKeyPath:@"slipFactorY"];
  v7 = [v6 between:0.0 and:1.0];
  v8 = [v7 precision:3];
  v23[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v10 = [v2 sectionWithRows:v9 title:@"Pointer Motion"];

  v11 = (void *)MEMORY[0x1E4F940F8];
  v12 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v13 = [v11 rowWithTitle:@"Restore Defaults" action:v12];

  v14 = (void *)MEMORY[0x1E4F94160];
  v22 = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v16 = [v14 sectionWithRows:v15];

  v17 = (void *)MEMORY[0x1E4F94160];
  v21[0] = v10;
  v21[1] = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v19 = [v17 moduleWithTitle:0 contents:v18];

  return v19;
}

@end