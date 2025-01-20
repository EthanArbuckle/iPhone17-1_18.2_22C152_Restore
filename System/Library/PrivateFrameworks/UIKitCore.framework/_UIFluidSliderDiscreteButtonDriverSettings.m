@interface _UIFluidSliderDiscreteButtonDriverSettings
+ (id)settingsControllerModule;
- (_UISpringAnimationPrototypeSettings)settle;
- (double)horizontalVolumeDownScale;
- (double)horizontalVolumeUpScale;
- (double)minimumPressDuration;
- (double)repeatCadence;
- (double)repeatDelay;
- (double)verticalVolumeDownScale;
- (double)verticalVolumeUpScale;
- (void)setDefaultValues;
- (void)setHorizontalVolumeDownScale:(double)a3;
- (void)setHorizontalVolumeUpScale:(double)a3;
- (void)setMinimumPressDuration:(double)a3;
- (void)setRepeatCadence:(double)a3;
- (void)setRepeatDelay:(double)a3;
- (void)setSettle:(id)a3;
- (void)setVerticalVolumeDownScale:(double)a3;
- (void)setVerticalVolumeUpScale:(double)a3;
@end

@implementation _UIFluidSliderDiscreteButtonDriverSettings

- (void)setDefaultValues
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFluidSliderDiscreteButtonDriverSettings;
  [(_UIFluidSliderDriverSettings *)&v7 setDefaultValues];
  [(_UIFluidSliderDiscreteButtonDriverSettings *)self setRepeatDelay:0.333];
  [(_UIFluidSliderDiscreteButtonDriverSettings *)self setRepeatCadence:0.0416666667];
  [(_UIFluidSliderDiscreteButtonDriverSettings *)self setMinimumPressDuration:0.25];
  [(_UIFluidSliderDiscreteButtonDriverSettings *)self setVerticalVolumeDownScale:0.92];
  [(_UIFluidSliderDiscreteButtonDriverSettings *)self setVerticalVolumeUpScale:1.06];
  [(_UIFluidSliderDiscreteButtonDriverSettings *)self setHorizontalVolumeDownScale:0.96];
  [(_UIFluidSliderDiscreteButtonDriverSettings *)self setHorizontalVolumeUpScale:1.03];
  v3 = [(_UIFluidSliderDriverSettings *)self update];
  [v3 setDampingRatio:1.0];

  v4 = [(_UIFluidSliderDriverSettings *)self update];
  [v4 setResponse:0.3];

  v5 = [(_UIFluidSliderDiscreteButtonDriverSettings *)self settle];
  [v5 setDampingRatio:1.0];

  v6 = [(_UIFluidSliderDiscreteButtonDriverSettings *)self settle];
  [v6 setResponse:0.6];
}

+ (id)settingsControllerModule
{
  v45[4] = *MEMORY[0x1E4F143B8];
  id v30 = (id)MEMORY[0x1E4F94160];
  v41.receiver = a1;
  v41.super_class = (Class)&OBJC_METACLASS____UIFluidSliderDiscreteButtonDriverSettings;
  v40 = objc_msgSendSuper2(&v41, sel_settingsControllerModule);
  v45[0] = v40;
  v2 = (void *)MEMORY[0x1E4F94160];
  v39 = [MEMORY[0x1E4F94130] rowWithTitle:@"Settle" childSettingsKeyPath:@"settle"];
  v44 = v39;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v37 = [v2 sectionWithRows:v38 title:@"Unique Animations"];
  v45[1] = v37;
  v3 = (void *)MEMORY[0x1E4F94160];
  v36 = [MEMORY[0x1E4F94148] rowWithTitle:@"Auto-repeat Delay" valueKeyPath:@"repeatDelay"];
  v35 = [v36 between:0.0 and:1.0];
  v34 = [v35 precision:2];
  v43[0] = v34;
  v33 = [MEMORY[0x1E4F94148] rowWithTitle:@"Auto-repeat Cadence" valueKeyPath:@"repeatCadence"];
  v32 = [v33 between:0.0 and:1.0];
  v29 = [v32 precision:2];
  v43[1] = v29;
  v28 = [MEMORY[0x1E4F94148] rowWithTitle:@"Minimum Press Duration" valueKeyPath:@"minimumPressDuration"];
  v27 = [v28 between:0.0 and:1.0];
  v26 = [v27 precision:2];
  v43[2] = v26;
  v25 = [MEMORY[0x1E4F94148] rowWithTitle:@"Volume Down Scale (Vertical)" valueKeyPath:@"verticalVolumeDownScale"];
  v24 = [v25 between:0.0 and:2.0];
  v23 = [v24 precision:2];
  v43[3] = v23;
  v22 = [MEMORY[0x1E4F94148] rowWithTitle:@"Volume Up Scale (Vertical)" valueKeyPath:@"verticalVolumeUpScale"];
  v21 = [v22 between:0.0 and:2.0];
  v20 = [v21 precision:2];
  v43[4] = v20;
  v19 = [MEMORY[0x1E4F94148] rowWithTitle:@"Volume Down Scale (Horizontal)" valueKeyPath:@"horizontalVolumeDownScale"];
  v18 = [v19 between:0.0 and:2.0];
  v17 = [v18 precision:2];
  v43[5] = v17;
  v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"Volume Up Scale (Horizontal)" valueKeyPath:@"horizontalVolumeUpScale"];
  v5 = [v4 between:0.0 and:2.0];
  v6 = [v5 precision:2];
  v43[6] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:7];
  v8 = [v3 sectionWithRows:v7 title:@"Behaviors"];
  v45[2] = v8;
  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = (void *)MEMORY[0x1E4F940F8];
  v11 = [MEMORY[0x1E4F94170] action];
  v12 = [v10 rowWithTitle:@"Restore Defaults" action:v11];
  v42 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v14 = [v9 sectionWithRows:v13];
  v45[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
  id v31 = [v30 moduleWithTitle:@"Volume Buttons" contents:v15];

  return v31;
}

- (double)repeatDelay
{
  return self->_repeatDelay;
}

- (void)setRepeatDelay:(double)a3
{
  self->_repeatDelay = a3;
}

- (double)repeatCadence
{
  return self->_repeatCadence;
}

- (void)setRepeatCadence:(double)a3
{
  self->_repeatCadence = a3;
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (double)verticalVolumeDownScale
{
  return self->_verticalVolumeDownScale;
}

- (void)setVerticalVolumeDownScale:(double)a3
{
  self->_verticalVolumeDownScale = a3;
}

- (double)verticalVolumeUpScale
{
  return self->_verticalVolumeUpScale;
}

- (void)setVerticalVolumeUpScale:(double)a3
{
  self->_verticalVolumeUpScale = a3;
}

- (double)horizontalVolumeDownScale
{
  return self->_horizontalVolumeDownScale;
}

- (void)setHorizontalVolumeDownScale:(double)a3
{
  self->_horizontalVolumeDownScale = a3;
}

- (double)horizontalVolumeUpScale
{
  return self->_horizontalVolumeUpScale;
}

- (void)setHorizontalVolumeUpScale:(double)a3
{
  self->_horizontalVolumeUpScale = a3;
}

- (_UISpringAnimationPrototypeSettings)settle
{
  return self->_settle;
}

- (void)setSettle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end