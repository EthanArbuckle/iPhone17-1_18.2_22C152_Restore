@interface FTMutableTextToSpeechSpeechFeatureOutputFeature
- (FTMutableTextToSpeechSpeechFeatureOutputFeature)init;
- (NSString)phone_name;
- (float)begin_time;
- (float)duration;
- (float)end_time;
- (float)energy;
- (float)pitch;
- (id)copyWithZone:(_NSZone *)a3;
- (int)word_id;
- (void)setBegin_time:(float)a3;
- (void)setDuration:(float)a3;
- (void)setEnd_time:(float)a3;
- (void)setEnergy:(float)a3;
- (void)setPhone_name:(id)a3;
- (void)setPitch:(float)a3;
- (void)setWord_id:(int)a3;
@end

@implementation FTMutableTextToSpeechSpeechFeatureOutputFeature

- (FTMutableTextToSpeechSpeechFeatureOutputFeature)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechSpeechFeatureOutputFeature;
  v2 = [(FTMutableTextToSpeechSpeechFeatureOutputFeature *)&v6 init];
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

- (NSString)phone_name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"phone_name"];
}

- (void)setPhone_name:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)begin_time
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"begin_time"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setBegin_time:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)end_time
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"end_time"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setEnd_time:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)duration
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"duration"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setDuration:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)pitch
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pitch"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setPitch:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)energy
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"energy"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setEnergy:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)word_id
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"word_id"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setWord_id:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end