@interface NCScrollViewExclusionSettings
+ (id)moduleWithSectionTitle:(id)a3;
+ (id)settingsControllerModule;
- (BOOL)isRubberbandingEnabled;
- (double)damping;
- (double)hysteresis;
- (double)response;
- (double)rubberbandingCoefficient;
- (void)setDamping:(double)a3;
- (void)setDefaultValues;
- (void)setHysteresis:(double)a3;
- (void)setResponse:(double)a3;
- (void)setRubberbandingCoefficient:(double)a3;
- (void)setRubberbandingEnabled:(BOOL)a3;
@end

@implementation NCScrollViewExclusionSettings

+ (id)moduleWithSectionTitle:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Rubberbanding coefficient" valueKeyPath:@"rubberbandingCoefficient"];
  v7 = [v6 between:0.0 and:1.0];
  v8 = [v7 precision:3];
  [v5 addObject:v8];

  v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Rubberbanding Enabled" valueKeyPath:@"rubberbandingEnabled"];
  [v5 addObject:v9];

  v10 = [MEMORY[0x1E4F94148] rowWithTitle:@"Hysteresis" valueKeyPath:@"hysteresis"];
  v11 = [v10 between:0.0 and:1.0];
  v12 = [v11 precision:3];
  [v5 addObject:v12];

  v13 = [MEMORY[0x1E4F94148] rowWithTitle:@"Damping" valueKeyPath:@"damping"];
  v14 = [v13 between:0.0 and:1.0];
  v15 = [v14 precision:3];
  [v5 addObject:v15];

  v16 = [MEMORY[0x1E4F94148] rowWithTitle:@"Response" valueKeyPath:@"response"];
  v17 = [v16 between:0.0 and:1.0];
  v18 = [v17 precision:3];
  [v5 addObject:v18];

  v19 = (void *)MEMORY[0x1E4F94160];
  v20 = [MEMORY[0x1E4F94160] sectionWithRows:v5 title:v4];

  v24[0] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v22 = [v19 moduleWithTitle:0 contents:v21];

  return v22;
}

+ (id)settingsControllerModule
{
  return (id)[a1 moduleWithSectionTitle:@"Scroll View Exclusion"];
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)NCScrollViewExclusionSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(NCScrollViewExclusionSettings *)self setRubberbandingCoefficient:0.55];
  [(NCScrollViewExclusionSettings *)self setRubberbandingEnabled:0];
  [(NCScrollViewExclusionSettings *)self setDamping:0.7333];
  [(NCScrollViewExclusionSettings *)self setResponse:0.62832];
  [(NCScrollViewExclusionSettings *)self setHysteresis:0.6];
}

- (double)rubberbandingCoefficient
{
  return self->_rubberbandingCoefficient;
}

- (void)setRubberbandingCoefficient:(double)a3
{
  self->_rubberbandingCoefficient = a3;
}

- (BOOL)isRubberbandingEnabled
{
  return self->_rubberbandingEnabled;
}

- (void)setRubberbandingEnabled:(BOOL)a3
{
  self->_rubberbandingEnabled = a3;
}

- (double)damping
{
  return self->_damping;
}

- (void)setDamping:(double)a3
{
  self->_damping = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

@end