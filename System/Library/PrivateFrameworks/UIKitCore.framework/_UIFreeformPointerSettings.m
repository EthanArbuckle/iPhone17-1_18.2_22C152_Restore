@interface _UIFreeformPointerSettings
+ (id)settingsControllerModule;
- (double)defaultPointerCornerRadius;
- (double)slipFactorX;
- (double)slipFactorY;
- (void)setDefaultPointerCornerRadius:(double)a3;
- (void)setDefaultValues;
- (void)setSlipFactorX:(double)a3;
- (void)setSlipFactorY:(double)a3;
@end

@implementation _UIFreeformPointerSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFreeformPointerSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIFreeformPointerSettings *)self setDefaultPointerCornerRadius:8.0];
  [(_UIFreeformPointerSettings *)self setSlipFactorX:0.25];
  [(_UIFreeformPointerSettings *)self setSlipFactorY:0.1];
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

- (double)defaultPointerCornerRadius
{
  return self->_defaultPointerCornerRadius;
}

- (void)setDefaultPointerCornerRadius:(double)a3
{
  self->_defaultPointerCornerRadius = a3;
}

- (double)slipFactorX
{
  return self->_slipFactorX;
}

- (void)setSlipFactorX:(double)a3
{
  self->_slipFactorX = a3;
}

- (double)slipFactorY
{
  return self->_slipFactorY;
}

- (void)setSlipFactorY:(double)a3
{
  self->_slipFactorY = a3;
}

@end