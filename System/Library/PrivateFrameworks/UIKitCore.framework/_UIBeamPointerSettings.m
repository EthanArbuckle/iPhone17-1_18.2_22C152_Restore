@interface _UIBeamPointerSettings
+ (id)settingsControllerModule;
- (double)maxLength;
- (double)maxSnapLength;
- (double)minLength;
- (double)width;
- (void)setDefaultValues;
- (void)setMaxLength:(double)a3;
- (void)setMaxSnapLength:(double)a3;
- (void)setMinLength:(double)a3;
- (void)setWidth:(double)a3;
@end

@implementation _UIBeamPointerSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBeamPointerSettings;
  [(_UIFreeformPointerSettings *)&v3 setDefaultValues];
  [(_UIFreeformPointerSettings *)self setSlipFactorX:0.5];
  [(_UIFreeformPointerSettings *)self setSlipFactorY:0.5];
  [(_UIBeamPointerSettings *)self setMinLength:24.0];
  [(_UIBeamPointerSettings *)self setMaxLength:100.0];
  [(_UIBeamPointerSettings *)self setMaxSnapLength:100.0];
  [(_UIBeamPointerSettings *)self setWidth:3.0];
}

+ (id)settingsControllerModule
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slip X" valueKeyPath:@"slipFactorX"];
  v4 = [v3 between:0.0 and:1.0];
  v5 = [v4 precision:3];
  v39[0] = v5;
  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slip Y" valueKeyPath:@"slipFactorY"];
  v7 = [v6 between:0.0 and:1.0];
  v8 = [v7 precision:3];
  v39[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v35 = [v2 sectionWithRows:v9 title:@"Pointer Motion"];

  v30 = (void *)MEMORY[0x1E4F94160];
  v34 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Length" valueKeyPath:@"minLength"];
  v33 = [v34 between:0.0 and:100.0];
  v32 = [v33 precision:1];
  v38[0] = v32;
  v10 = [MEMORY[0x1E4F94148] rowWithTitle:@"Max Length" valueKeyPath:@"maxLength"];
  v11 = [v10 between:0.0 and:10000.0];
  v12 = [v11 precision:1];
  v38[1] = v12;
  v13 = [MEMORY[0x1E4F94148] rowWithTitle:@"Max Snap Length" valueKeyPath:@"maxSnapLength"];
  v14 = [v13 between:0.0 and:10000.0];
  v15 = [v14 precision:1];
  v38[2] = v15;
  v16 = [MEMORY[0x1E4F94148] rowWithTitle:@"Width" valueKeyPath:@"width"];
  v17 = [v16 between:0.0 and:100.0];
  v18 = [v17 precision:1];
  v38[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  v31 = [v30 sectionWithRows:v19 title:@"Beam Attributes"];

  v20 = (void *)MEMORY[0x1E4F940F8];
  v21 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v22 = [v20 rowWithTitle:@"Restore Defaults" action:v21];

  v23 = (void *)MEMORY[0x1E4F94160];
  v37 = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v25 = [v23 sectionWithRows:v24];

  v26 = (void *)MEMORY[0x1E4F94160];
  v36[0] = v35;
  v36[1] = v31;
  v36[2] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  v28 = [v26 moduleWithTitle:0 contents:v27];

  return v28;
}

- (double)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(double)a3
{
  self->_minLength = a3;
}

- (double)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(double)a3
{
  self->_maxLength = a3;
}

- (double)maxSnapLength
{
  return self->_maxSnapLength;
}

- (void)setMaxSnapLength:(double)a3
{
  self->_maxSnapLength = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

@end