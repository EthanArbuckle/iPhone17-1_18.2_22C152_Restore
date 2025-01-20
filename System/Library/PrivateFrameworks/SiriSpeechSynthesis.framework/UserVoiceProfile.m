@interface UserVoiceProfile
- (UserVoiceProfile)init;
- (UserVoiceProfile)initWithJson:(id)a3;
- (float)duration_mean;
- (float)duration_std;
- (float)energy_mean;
- (float)energy_std;
- (float)pitch_mean;
- (float)pitch_std;
- (void)setDuration_mean:(float)a3;
- (void)setDuration_std:(float)a3;
- (void)setEnergy_mean:(float)a3;
- (void)setEnergy_std:(float)a3;
- (void)setPitch_mean:(float)a3;
- (void)setPitch_std:(float)a3;
@end

@implementation UserVoiceProfile

- (void)setDuration_std:(float)a3
{
  self->_duration_std = a3;
}

- (float)duration_std
{
  return self->_duration_std;
}

- (void)setDuration_mean:(float)a3
{
  self->_duration_mean = a3;
}

- (float)duration_mean
{
  return self->_duration_mean;
}

- (void)setEnergy_std:(float)a3
{
  self->_energy_std = a3;
}

- (float)energy_std
{
  return self->_energy_std;
}

- (void)setEnergy_mean:(float)a3
{
  self->_energy_mean = a3;
}

- (float)energy_mean
{
  return self->_energy_mean;
}

- (void)setPitch_std:(float)a3
{
  self->_pitch_std = a3;
}

- (float)pitch_std
{
  return self->_pitch_std;
}

- (void)setPitch_mean:(float)a3
{
  self->_pitch_mean = a3;
}

- (float)pitch_mean
{
  return self->_pitch_mean;
}

- (UserVoiceProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)UserVoiceProfile;
  v2 = [(UserVoiceProfile *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (UserVoiceProfile)initWithJson:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UserVoiceProfile;
  v5 = [(UserVoiceProfile *)&v21 init];
  if (v5)
  {
    objc_super v6 = [v4 objectForKey:@"mean"];
    v7 = [v4 objectForKey:@"std"];
    v8 = [v6 objectAtIndexedSubscript:0];
    [v8 floatValue];
    v5->_pitch_mean = v9;

    v10 = [v7 objectAtIndexedSubscript:0];
    [v10 floatValue];
    v5->_pitch_std = v11;

    v12 = [v6 objectAtIndexedSubscript:1];
    [v12 floatValue];
    v5->_energy_mean = v13;

    v14 = [v7 objectAtIndexedSubscript:1];
    [v14 floatValue];
    v5->_energy_std = v15;

    v16 = [v6 objectAtIndexedSubscript:2];
    [v16 floatValue];
    v5->_duration_mean = v17;

    v18 = [v7 objectAtIndexedSubscript:2];
    [v18 floatValue];
    v5->_duration_std = v19;
  }
  return v5;
}

@end