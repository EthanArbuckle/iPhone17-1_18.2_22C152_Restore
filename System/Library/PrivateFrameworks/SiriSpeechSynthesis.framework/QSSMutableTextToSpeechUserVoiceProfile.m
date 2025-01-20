@interface QSSMutableTextToSpeechUserVoiceProfile
- (QSSMutableTextToSpeechUserVoiceProfile)init;
- (float)duration_mean;
- (float)duration_std;
- (float)energy_mean;
- (float)energy_std;
- (float)pitch_mean;
- (float)pitch_std;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDuration_mean:(float)a3;
- (void)setDuration_std:(float)a3;
- (void)setEnergy_mean:(float)a3;
- (void)setEnergy_std:(float)a3;
- (void)setPitch_mean:(float)a3;
- (void)setPitch_std:(float)a3;
@end

@implementation QSSMutableTextToSpeechUserVoiceProfile

- (void)setDuration_std:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)duration_std
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"duration_std"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setDuration_mean:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)duration_mean
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"duration_mean"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setEnergy_std:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)energy_std
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"energy_std"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setEnergy_mean:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)energy_mean
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"energy_mean"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setPitch_std:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)pitch_std
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pitch_std"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setPitch_mean:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)pitch_mean
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pitch_mean"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  double v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTextToSpeechUserVoiceProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechUserVoiceProfile;
  v2 = [(QSSMutableTextToSpeechUserVoiceProfile *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end