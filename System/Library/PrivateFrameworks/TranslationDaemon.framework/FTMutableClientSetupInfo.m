@interface FTMutableClientSetupInfo
- (BOOL)endpoint_extra_delay;
- (FTMutableClientSetupInfo)init;
- (NSString)speech_id;
- (float)endpoint_threshold;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEndpoint_extra_delay:(BOOL)a3;
- (void)setEndpoint_threshold:(float)a3;
- (void)setSpeech_id:(id)a3;
@end

@implementation FTMutableClientSetupInfo

- (FTMutableClientSetupInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableClientSetupInfo;
  v2 = [(FTMutableClientSetupInfo *)&v6 init];
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

- (float)endpoint_threshold
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"endpoint_threshold"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setEndpoint_threshold:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)endpoint_extra_delay
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"endpoint_extra_delay"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEndpoint_extra_delay:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end