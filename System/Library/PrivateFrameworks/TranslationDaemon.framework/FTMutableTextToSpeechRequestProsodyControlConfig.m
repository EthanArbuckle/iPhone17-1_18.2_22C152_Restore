@interface FTMutableTextToSpeechRequestProsodyControlConfig
- (FTMutableTextToSpeechRequestProsodyControlConfig)init;
- (float)global_energy;
- (float)global_pitch;
- (float)global_rate;
- (float)global_sent_duration;
- (float)global_sent_energy;
- (float)global_sent_pitch;
- (float)global_sent_pitchrange;
- (float)global_sent_tilt;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setGlobal_energy:(float)a3;
- (void)setGlobal_pitch:(float)a3;
- (void)setGlobal_rate:(float)a3;
- (void)setGlobal_sent_duration:(float)a3;
- (void)setGlobal_sent_energy:(float)a3;
- (void)setGlobal_sent_pitch:(float)a3;
- (void)setGlobal_sent_pitchrange:(float)a3;
- (void)setGlobal_sent_tilt:(float)a3;
@end

@implementation FTMutableTextToSpeechRequestProsodyControlConfig

- (FTMutableTextToSpeechRequestProsodyControlConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechRequestProsodyControlConfig;
  v2 = [(FTMutableTextToSpeechRequestProsodyControlConfig *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  objc_super v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (float)global_rate
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"global_rate"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setGlobal_rate:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)global_pitch
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"global_pitch"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setGlobal_pitch:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)global_energy
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"global_energy"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setGlobal_energy:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)global_sent_pitch
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"global_sent_pitch"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setGlobal_sent_pitch:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)global_sent_pitchrange
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"global_sent_pitchrange"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setGlobal_sent_pitchrange:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)global_sent_duration
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"global_sent_duration"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setGlobal_sent_duration:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)global_sent_energy
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"global_sent_energy"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setGlobal_sent_energy:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)global_sent_tilt
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"global_sent_tilt"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setGlobal_sent_tilt:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end