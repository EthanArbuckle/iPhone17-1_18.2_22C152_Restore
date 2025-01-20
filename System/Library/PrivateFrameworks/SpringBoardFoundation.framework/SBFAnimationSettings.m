@interface SBFAnimationSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)_moduleWithSectionTitle:(id)a3;
+ (id)_moduleWithSectionTitle:(id)a3 delay:(BOOL)a4 frameRate:(BOOL)a5;
+ (id)settingsControllerModule;
- (PTFrameRateRangeSettings)preferredFrameRateRange;
- (PTPointSettings)controlPoint1Settings;
- (PTPointSettings)controlPoint2Settings;
- (SBFAnimationSettings)initWithDefaultValues;
- (double)calculatedDuration;
- (double)damping;
- (double)delay;
- (double)duration;
- (double)epsilon;
- (double)initialVelocity;
- (double)mass;
- (double)speed;
- (double)stiffness;
- (id)BSAnimationSettings;
- (int64_t)animationType;
- (unint64_t)curve;
- (unint64_t)frameRate;
- (void)dealloc;
- (void)setAnimationType:(int64_t)a3;
- (void)setControlPoint1Settings:(id)a3;
- (void)setControlPoint2Settings:(id)a3;
- (void)setCurve:(unint64_t)a3;
- (void)setDamping:(double)a3;
- (void)setDefaultValues;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setEpsilon:(double)a3;
- (void)setFrameRate:(unint64_t)a3;
- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4;
- (void)setInitialVelocity:(double)a3;
- (void)setMass:(double)a3;
- (void)setPreferredFrameRateRange:(id)a3;
- (void)setSpeed:(double)a3;
- (void)setStiffness:(double)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
@end

@implementation SBFAnimationSettings

- (id)BSAnimationSettings
{
  exportedSettings = self->_exportedSettings;
  if (!exportedSettings)
  {
    unint64_t v4 = [(SBFAnimationSettings *)self curve];
    if (v4 != 393216)
    {
      switch(__ROR8__(v4, 16))
      {
        case 0:
          v20 = (void *)MEMORY[0x1E4F39C10];
          v21 = (void *)MEMORY[0x1E4F3A490];
          goto LABEL_10;
        case 1:
          v20 = (void *)MEMORY[0x1E4F39C10];
          v21 = (void *)MEMORY[0x1E4F3A488];
          goto LABEL_10;
        case 2:
          v20 = (void *)MEMORY[0x1E4F39C10];
          v21 = (void *)MEMORY[0x1E4F3A498];
          goto LABEL_10;
        case 3:
          v20 = (void *)MEMORY[0x1E4F39C10];
          v21 = (void *)MEMORY[0x1E4F3A4A0];
LABEL_10:
          uint64_t v19 = [v20 functionWithName:*v21];
          goto LABEL_11;
        default:
          v22 = 0;
          goto LABEL_12;
      }
    }
    v5 = [(SBFAnimationSettings *)self controlPoint1Settings];
    [v5 pointValue];
    double v7 = v6;
    double v9 = v8;

    v10 = [(SBFAnimationSettings *)self controlPoint2Settings];
    [v10 pointValue];
    double v12 = v11;
    double v14 = v13;

    *(float *)&double v15 = v7;
    *(float *)&double v16 = v9;
    *(float *)&double v17 = v12;
    *(float *)&double v18 = v14;
    uint64_t v19 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v15 :v16 :v17 :v18];
LABEL_11:
    v22 = (void *)v19;
LABEL_12:
    if ([(SBFAnimationSettings *)self animationType] == 1)
    {
      v23 = (void *)MEMORY[0x1E4F4F7A8];
      [(SBFAnimationSettings *)self mass];
      double v25 = v24;
      [(SBFAnimationSettings *)self stiffness];
      double v27 = v26;
      [(SBFAnimationSettings *)self damping];
      double v29 = v28;
      [(SBFAnimationSettings *)self epsilon];
      double v31 = v30;
      [(SBFAnimationSettings *)self delay];
      v33 = [v23 settingsWithMass:v22 stiffness:v25 damping:v27 epsilon:v29 delay:v31 timingFunction:v32];
      [(SBFAnimationSettings *)self initialVelocity];
      objc_msgSend(v33, "setInitialVelocity:");
    }
    else
    {
      v34 = (void *)MEMORY[0x1E4F4F780];
      [(SBFAnimationSettings *)self duration];
      double v36 = v35;
      [(SBFAnimationSettings *)self delay];
      v33 = [v34 settingsWithDuration:v22 delay:v36 timingFunction:v37];
    }
    double speed = self->_speed;
    *(float *)&double speed = speed;
    [v33 setSpeed:speed];
    v39 = [(SBFAnimationSettings *)self preferredFrameRateRange];
    [v39 frameRateRange];
    BOOL IsEqualToRange = CAFrameRateRangeIsEqualToRange(v49, *MEMORY[0x1E4F39AF0]);

    if (IsEqualToRange)
    {
      unint64_t frameRate = self->_frameRate;
      if (frameRate) {
        [v33 setFrameInterval:1.0 / (double)frameRate];
      }
    }
    else
    {
      [(PTFrameRateRangeSettings *)self->_preferredFrameRateRange frameRateRange];
      objc_msgSend(v33, "setPreferredFrameRateRange:");
    }
    v42 = [(SBFAnimationSettings *)self preferredFrameRateRange];
    int v43 = [v42 highFrameRateReason];

    if (v43)
    {
      v44 = [(SBFAnimationSettings *)self preferredFrameRateRange];
      objc_msgSend(v33, "setHighFrameRateReason:", objc_msgSend(v44, "highFrameRateReason"));
    }
    v45 = (BSAnimationSettings *)[v33 copy];
    v46 = self->_exportedSettings;
    self->_exportedSettings = v45;

    exportedSettings = self->_exportedSettings;
  }
  return exportedSettings;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"calculatedDuration"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"speed"];
  }

  return v4;
}

- (SBFAnimationSettings)initWithDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)SBFAnimationSettings;
  v2 = [(PTSettings *)&v5 initWithDefaultValues];
  id v3 = v2;
  if (v2) {
    [(PTSettings *)v2 addKeyPathObserver:v2];
  }
  return v3;
}

- (void)dealloc
{
  [(PTSettings *)self removeKeyPathObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBFAnimationSettings;
  [(PTSettings *)&v3 dealloc];
}

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)SBFAnimationSettings;
  [(PTSettings *)&v4 setDefaultValues];
  [(SBFAnimationSettings *)self setAnimationType:0];
  [(SBFAnimationSettings *)self setCurve:0];
  [(SBFAnimationSettings *)self setDuration:0.3];
  [(SBFAnimationSettings *)self setDelay:0.0];
  [(SBFAnimationSettings *)self setMass:1.0];
  [(SBFAnimationSettings *)self setStiffness:1000.0];
  [(SBFAnimationSettings *)self setDamping:500.0];
  [(SBFAnimationSettings *)self setInitialVelocity:0.0];
  [(SBFAnimationSettings *)self setSpeed:1.0];
  [(SBFAnimationSettings *)self setFrameRate:0];
  objc_super v3 = [(SBFAnimationSettings *)self preferredFrameRateRange];
  [v3 setDefaultValues];
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:@"calculatedDuration"] & 1) == 0)
  {
    exportedSettings = self->_exportedSettings;
    self->_exportedSettings = 0;

    [(PTSettings *)self invalidateValueForKey:@"calculatedDuration"];
  }
  v9.receiver = self;
  v9.super_class = (Class)SBFAnimationSettings;
  [(PTSettings *)&v9 settings:v6 changedValueForKeyPath:v7];
}

- (void)setSpeed:(double)a3
{
  if (self->_speed != a3)
  {
    self->_double speed = a3;
    self->_exportedSettings = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  id v11 = [(SBFAnimationSettings *)self preferredFrameRateRange];
  *(float *)&double v8 = minimum;
  *(float *)&double v9 = maximum;
  *(float *)&double v10 = preferred;
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", v4, v8, v9, v10);
}

- (double)calculatedDuration
{
  v2 = [(SBFAnimationSettings *)self BSAnimationSettings];
  [v2 duration];
  double v4 = v3;

  return v4;
}

+ (id)settingsControllerModule
{
  return (id)[a1 _moduleWithSectionTitle:@"Animation"];
}

+ (id)_moduleWithSectionTitle:(id)a3
{
  return (id)[a1 _moduleWithSectionTitle:a3 delay:1 frameRate:1];
}

+ (id)_moduleWithSectionTitle:(id)a3 delay:(BOOL)a4 frameRate:(BOOL)a5
{
  BOOL v55 = a5;
  BOOL v5 = a4;
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"animationType == %d", 1);
  double v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"animationType == %d", 0);
  double v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curve == %d", 393216);
  double v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [MEMORY[0x1E4F94110] rowWithTitle:@"Animation" valueKeyPath:@"animationType"];
  double v12 = [v11 possibleValues:&unk_1ED89EB00 titles:&unk_1ED89EB18];
  [v10 addObject:v12];

  double v13 = [MEMORY[0x1E4F94140] rowWithTitle:@"Duration" valueKeyPath:@"duration"];
  double v14 = [v13 between:0.0 and:10.0];
  double v15 = [v14 condition:v8];
  [v10 addObject:v15];

  if (v5)
  {
    double v16 = [MEMORY[0x1E4F94140] rowWithTitle:@"Delay" valueKeyPath:@"delay"];
    double v17 = [v16 between:-1.0 and:10.0];
    [v10 addObject:v17];
  }
  double v18 = [MEMORY[0x1E4F94140] rowWithTitle:@"Mass" valueKeyPath:@"mass"];
  uint64_t v19 = [v18 between:0.0 and:10000.0];
  v20 = [v19 condition:v7];
  [v10 addObject:v20];

  v21 = [MEMORY[0x1E4F94140] rowWithTitle:@"Stiffness" valueKeyPath:@"stiffness"];
  v22 = [v21 between:0.0 and:1000000.0];
  v23 = [v22 precision:2];
  double v24 = [v23 condition:v7];
  [v10 addObject:v24];

  double v25 = [MEMORY[0x1E4F94140] rowWithTitle:@"Damping" valueKeyPath:@"damping"];
  double v26 = [v25 between:0.0 and:1000000.0];
  double v27 = [v26 precision:2];
  double v28 = [v27 condition:v7];
  [v10 addObject:v28];

  double v29 = [MEMORY[0x1E4F94140] rowWithTitle:@"Epsilon" valueKeyPath:@"epsilon"];
  double v30 = [v29 between:0.0 and:0.5];
  double v31 = [v30 precision:4];
  double v32 = [v31 condition:v7];
  [v10 addObject:v32];

  v33 = [MEMORY[0x1E4F94140] rowWithTitle:@"Initial Velocity" valueKeyPath:@"initialVelocity"];
  v34 = [v33 between:0.0 and:10000.0];
  double v35 = [v34 precision:2];
  double v36 = [v35 condition:v7];
  [v10 addObject:v36];

  double v37 = +[SBReadonlyRow rowWithTitle:@"Calculated Duration" valueKeyPath:@"calculatedDuration"];
  v38 = [v37 condition:v7];
  v39 = [v38 valueFormatter:&__block_literal_global_27];
  [v10 addObject:v39];

  v40 = [MEMORY[0x1E4F94110] rowWithTitle:@"Curve" valueKeyPath:@"curve"];
  v41 = [v40 possibleValues:&unk_1ED89EB48 titles:&unk_1ED89EB30];
  [v10 addObject:v41];

  v42 = [MEMORY[0x1E4F94138] rowWithTitle:@"Control Point 1" childSettingsKeyPath:@"controlPoint1Settings"];
  int v43 = [v42 condition:v9];
  [v10 addObject:v43];

  v44 = [MEMORY[0x1E4F94138] rowWithTitle:@"Control Point 2" childSettingsKeyPath:@"controlPoint2Settings"];
  v45 = [v44 condition:v9];
  [v10 addObject:v45];

  if (v55)
  {
    v46 = [MEMORY[0x1E4F94138] rowWithTitle:@"Frame Rate Range" childSettingsKeyPath:@"preferredFrameRateRange"];
    [v10 addObject:v46];

    v47 = [MEMORY[0x1E4F94110] rowWithTitle:@"Frame Rate (Deprecated)" valueKeyPath:@"frameRate"];
    v48 = [v47 possibleValues:&unk_1ED89EB90 titles:&unk_1ED89EB60];
    CAFrameRateRange v49 = [v48 possibleShortTitles:&unk_1ED89EB78];
    [v10 addObject:v49];
  }
  v50 = (void *)MEMORY[0x1E4F94168];
  v51 = [MEMORY[0x1E4F94168] sectionWithRows:v10 title:v6];
  v56[0] = v51;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
  v53 = [v50 moduleWithTitle:0 contents:v52];

  return v53;
}

uint64_t __64__SBFAnimationSettings__moduleWithSectionTitle_delay_frameRate___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  [a2 doubleValue];
  return objc_msgSend(v2, "stringWithFormat:", @"%g", v3);
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (unint64_t)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(unint64_t)a3
{
  self->_unint64_t frameRate = a3;
}

- (unint64_t)curve
{
  return self->_curve;
}

- (void)setCurve:(unint64_t)a3
{
  self->_curve = a3;
}

- (PTPointSettings)controlPoint1Settings
{
  return self->_controlPoint1Settings;
}

- (void)setControlPoint1Settings:(id)a3
{
}

- (PTPointSettings)controlPoint2Settings
{
  return self->_controlPoint2Settings;
}

- (void)setControlPoint2Settings:(id)a3
{
}

- (PTFrameRateRangeSettings)preferredFrameRateRange
{
  return self->_preferredFrameRateRange;
}

- (void)setPreferredFrameRateRange:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)mass
{
  return self->_mass;
}

- (void)setMass:(double)a3
{
  self->_mass = a3;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (void)setStiffness:(double)a3
{
  self->_stiffness = a3;
}

- (double)damping
{
  return self->_damping;
}

- (void)setDamping:(double)a3
{
  self->_damping = a3;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (void)setEpsilon:(double)a3
{
  self->_epsilon = a3;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (void)setInitialVelocity:(double)a3
{
  self->_initialVelocity = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFrameRateRange, 0);
  objc_storeStrong((id *)&self->_controlPoint2Settings, 0);
  objc_storeStrong((id *)&self->_controlPoint1Settings, 0);
  objc_storeStrong((id *)&self->_exportedSettings, 0);
}

@end