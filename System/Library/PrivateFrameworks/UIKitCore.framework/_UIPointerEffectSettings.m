@interface _UIPointerEffectSettings
+ (BOOL)pointerSlipMatchesContentSlip;
+ (id)settingsControllerModule;
- (_UISpringAnimationPrototypeSettings)liftProgress;
- (double)dampedAnimationDampingRatio;
- (double)dampedAnimationResponse;
- (double)defaultPointerCornerRadius;
- (double)liftForceExponent;
- (double)liftForceFloor;
- (double)maxSlipPoints;
- (double)overrideSlipPoints;
- (double)parallaxAmount;
- (double)scaleUpAnimationDampingRatio;
- (double)scaleUpAnimationResponse;
- (double)scaleUpPoints;
- (double)slipFactorX;
- (double)slipFactorY;
- (void)setDampedAnimationDampingRatio:(double)a3;
- (void)setDampedAnimationResponse:(double)a3;
- (void)setDefaultPointerCornerRadius:(double)a3;
- (void)setDefaultValues;
- (void)setLiftForceExponent:(double)a3;
- (void)setLiftForceFloor:(double)a3;
- (void)setLiftProgress:(id)a3;
- (void)setMaxSlipPoints:(double)a3;
- (void)setOverrideSlipPoints:(double)a3;
- (void)setParallaxAmount:(double)a3;
- (void)setScaleUpAnimationDampingRatio:(double)a3;
- (void)setScaleUpAnimationResponse:(double)a3;
- (void)setScaleUpPoints:(double)a3;
- (void)setSlipFactorX:(double)a3;
- (void)setSlipFactorY:(double)a3;
@end

@implementation _UIPointerEffectSettings

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPointerEffectSettings;
  [(PTSettings *)&v5 setDefaultValues];
  [(_UIPointerEffectSettings *)self setDefaultPointerCornerRadius:8.0];
  [(_UIPointerEffectSettings *)self setSlipFactorX:0.099];
  [(_UIPointerEffectSettings *)self setSlipFactorY:0.09];
  [(_UIPointerEffectSettings *)self setParallaxAmount:0.3];
  [(_UIPointerEffectSettings *)self setMaxSlipPoints:15.0];
  [(_UIPointerEffectSettings *)self setScaleUpPoints:4.0];
  [(_UIPointerEffectSettings *)self setScaleUpAnimationResponse:0.32];
  [(_UIPointerEffectSettings *)self setScaleUpAnimationDampingRatio:0.7];
  [(_UIPointerEffectSettings *)self setDampedAnimationResponse:0.4];
  [(_UIPointerEffectSettings *)self setDampedAnimationDampingRatio:1.0];
  [(_UIPointerEffectSettings *)self setLiftForceFloor:0.1];
  [(_UIPointerEffectSettings *)self setLiftForceExponent:0.2];
  v3 = [(_UIPointerEffectSettings *)self liftProgress];
  [v3 setDampingRatio:1.0];

  v4 = [(_UIPointerEffectSettings *)self liftProgress];
  [v4 setResponse:0.5];
}

+ (BOOL)pointerSlipMatchesContentSlip
{
  return 0;
}

+ (id)settingsControllerModule
{
  v66[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F94160];
  v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"Default Corner Radius" valueKeyPath:@"defaultPointerCornerRadius"];
  objc_super v5 = [v4 between:0.0 and:2.0];
  v6 = [v5 precision:1];
  v66[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
  v61 = [v3 sectionWithRows:v7 title:@"Pointer Appearance"];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", objc_msgSend(a1, "pointerSlipMatchesContentSlip") ^ 1);
  v58 = (void *)MEMORY[0x1E4F94160];
  v60 = (void *)v8;
  v56 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slip X" valueKeyPath:@"slipFactorX"];
  v54 = [v56 between:0.0 and:1.0];
  v52 = [v54 precision:3];
  v65[0] = v52;
  v50 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slip Y" valueKeyPath:@"slipFactorY"];
  v48 = [v50 between:0.0 and:1.0];
  v46 = [v48 precision:3];
  v65[1] = v46;
  v43 = [MEMORY[0x1E4F94148] rowWithTitle:@"Parallax Amount" valueKeyPath:@"parallaxAmount"];
  v41 = [v43 between:0.0 and:1.0];
  v40 = [v41 precision:3];
  v39 = [v40 condition:v8];
  v65[2] = v39;
  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Max Slip Points" valueKeyPath:@"maxSlipPoints"];
  v10 = [v9 between:0.0 and:100.0];
  v11 = [v10 precision:1];
  v65[3] = v11;
  v12 = [MEMORY[0x1E4F94148] rowWithTitle:@"Lift Force Floor" valueKeyPath:@"liftForceFloor"];
  v13 = [v12 between:0.0 and:1.0];
  v14 = [v13 precision:3];
  v65[4] = v14;
  v15 = [MEMORY[0x1E4F94148] rowWithTitle:@"Lift Force Exponent" valueKeyPath:@"liftForceExponent"];
  v16 = [v15 between:0.0 and:1.0];
  v17 = [v16 precision:3];
  v65[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:6];
  v59 = [v58 sectionWithRows:v18 title:@"Pointer & Effect Motion"];

  v44 = (void *)MEMORY[0x1E4F94160];
  v57 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Up Points" valueKeyPath:@"scaleUpPoints"];
  v55 = [v57 between:0.0 and:20.0];
  v53 = [v55 precision:1];
  v64[0] = v53;
  v51 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Animation Response" valueKeyPath:@"scaleUpAnimationResponse"];
  v49 = [v51 between:0.0 and:1.0];
  v47 = [v49 precision:2];
  v64[1] = v47;
  v42 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Animation Damping Ratio" valueKeyPath:@"scaleUpAnimationDampingRatio"];
  v19 = [v42 between:0.0 and:1.0];
  v20 = [v19 precision:2];
  v64[2] = v20;
  v21 = [MEMORY[0x1E4F94148] rowWithTitle:@"Shadow & Tint Animation Response" valueKeyPath:@"dampedAnimationResponse"];
  v22 = [v21 between:0.0 and:1.0];
  v23 = [v22 precision:2];
  v64[3] = v23;
  v24 = [MEMORY[0x1E4F94148] rowWithTitle:@"Shadow & Tint Animation Damping Ratio" valueKeyPath:@"dampedAnimationDampingRatio"];
  v25 = [v24 between:0.0 and:1.0];
  v26 = [v25 precision:2];
  v64[4] = v26;
  v27 = [MEMORY[0x1E4F94130] rowWithTitle:@"Lift Progress Animation" childSettingsKeyPath:@"liftProgress"];
  v64[5] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:6];
  v45 = [v44 sectionWithRows:v28 title:@"Effect Animations"];

  v29 = (void *)MEMORY[0x1E4F940F8];
  v30 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v31 = [v29 rowWithTitle:@"Restore Defaults" action:v30];

  v32 = (void *)MEMORY[0x1E4F94160];
  v63 = v31;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  v34 = [v32 sectionWithRows:v33];

  v35 = (void *)MEMORY[0x1E4F94160];
  v62[0] = v61;
  v62[1] = v59;
  v62[2] = v45;
  v62[3] = v34;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
  v37 = [v35 moduleWithTitle:0 contents:v36];

  return v37;
}

- (double)defaultPointerCornerRadius
{
  return self->_defaultPointerCornerRadius;
}

- (void)setDefaultPointerCornerRadius:(double)a3
{
  self->_defaultPointerCornerRadius = a3;
}

- (double)overrideSlipPoints
{
  return self->_overrideSlipPoints;
}

- (void)setOverrideSlipPoints:(double)a3
{
  self->_overrideSlipPoints = a3;
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

- (double)parallaxAmount
{
  return self->_parallaxAmount;
}

- (void)setParallaxAmount:(double)a3
{
  self->_parallaxAmount = a3;
}

- (double)maxSlipPoints
{
  return self->_maxSlipPoints;
}

- (void)setMaxSlipPoints:(double)a3
{
  self->_maxSlipPoints = a3;
}

- (double)scaleUpPoints
{
  return self->_scaleUpPoints;
}

- (void)setScaleUpPoints:(double)a3
{
  self->_scaleUpPoints = a3;
}

- (double)scaleUpAnimationResponse
{
  return self->_scaleUpAnimationResponse;
}

- (void)setScaleUpAnimationResponse:(double)a3
{
  self->_scaleUpAnimationResponse = a3;
}

- (double)scaleUpAnimationDampingRatio
{
  return self->_scaleUpAnimationDampingRatio;
}

- (void)setScaleUpAnimationDampingRatio:(double)a3
{
  self->_scaleUpAnimationDampingRatio = a3;
}

- (double)dampedAnimationResponse
{
  return self->_dampedAnimationResponse;
}

- (void)setDampedAnimationResponse:(double)a3
{
  self->_dampedAnimationResponse = a3;
}

- (double)dampedAnimationDampingRatio
{
  return self->_dampedAnimationDampingRatio;
}

- (void)setDampedAnimationDampingRatio:(double)a3
{
  self->_dampedAnimationDampingRatio = a3;
}

- (double)liftForceFloor
{
  return self->_liftForceFloor;
}

- (void)setLiftForceFloor:(double)a3
{
  self->_liftForceFloor = a3;
}

- (double)liftForceExponent
{
  return self->_liftForceExponent;
}

- (void)setLiftForceExponent:(double)a3
{
  self->_liftForceExponent = a3;
}

- (_UISpringAnimationPrototypeSettings)liftProgress
{
  return self->_liftProgress;
}

- (void)setLiftProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end