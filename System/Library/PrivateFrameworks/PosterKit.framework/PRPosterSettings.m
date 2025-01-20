@interface PRPosterSettings
+ (id)settingsControllerModule;
- (double)linearWakeDuration;
- (double)wakeDamping;
- (double)wakeDuration;
- (double)wakeMass;
- (double)wakeStiffness;
- (void)setDefaultValues;
- (void)setLinearWakeDuration:(double)a3;
- (void)setWakeDamping:(double)a3;
- (void)setWakeDuration:(double)a3;
- (void)setWakeMass:(double)a3;
- (void)setWakeStiffness:(double)a3;
@end

@implementation PRPosterSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PRPosterSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PRPosterSettings *)self setWakeDuration:1.2];
  [(PRPosterSettings *)self setWakeMass:1.0];
  [(PRPosterSettings *)self setWakeStiffness:61.69];
  [(PRPosterSettings *)self setWakeDamping:15.71];
  [(PRPosterSettings *)self setLinearWakeDuration:1.2];
}

+ (id)settingsControllerModule
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v22 = [MEMORY[0x1E4F94148] rowWithTitle:@"Duration" valueKeyPath:@"wakeDuration"];
  v21 = [MEMORY[0x1E4F94148] rowWithTitle:@"Mass" valueKeyPath:@"wakeMass"];
  v20 = [MEMORY[0x1E4F94148] rowWithTitle:@"Stiffness" valueKeyPath:@"wakeStiffness"];
  v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"Damping" valueKeyPath:@"wakeDamping"];
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v26[0] = v22;
  v26[1] = v21;
  v26[2] = v20;
  v26[3] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  v5 = [v3 sectionWithRows:v4 title:@"Wallpaper Wake Animation"];

  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Duration" valueKeyPath:@"linearWakeDuration"];
  v7 = (void *)MEMORY[0x1E4F94160];
  v25 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v9 = [v7 sectionWithRows:v8 title:@"Wallpaper Linear Wake Animation"];

  v10 = (void *)MEMORY[0x1E4F940F8];
  v11 = [MEMORY[0x1E4F94170] action];
  v12 = [v10 rowWithTitle:@"Restore Defaults" action:v11];

  v13 = (void *)MEMORY[0x1E4F94160];
  v24 = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v15 = [v13 sectionWithRows:v14 title:@"Restore Defaults"];

  v16 = (void *)MEMORY[0x1E4F94160];
  v23[0] = v5;
  v23[1] = v9;
  v23[2] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v18 = [v16 moduleWithTitle:@"Wake Animation" contents:v17];

  return v18;
}

- (double)wakeDuration
{
  return self->_wakeDuration;
}

- (void)setWakeDuration:(double)a3
{
  self->_wakeDuration = a3;
}

- (double)wakeMass
{
  return self->_wakeMass;
}

- (void)setWakeMass:(double)a3
{
  self->_wakeMass = a3;
}

- (double)wakeStiffness
{
  return self->_wakeStiffness;
}

- (void)setWakeStiffness:(double)a3
{
  self->_wakeStiffness = a3;
}

- (double)wakeDamping
{
  return self->_wakeDamping;
}

- (void)setWakeDamping:(double)a3
{
  self->_wakeDamping = a3;
}

- (double)linearWakeDuration
{
  return self->_linearWakeDuration;
}

- (void)setLinearWakeDuration:(double)a3
{
  self->_linearWakeDuration = a3;
}

@end