@interface FTMutableFinishAudio
- (FTMutableFinishAudio)init;
- (NSArray)features_at_endpoint;
- (NSArray)server_feature_latency_distribution;
- (float)total_audio_recorded_seconds;
- (id)copyWithZone:(_NSZone *)a3;
- (int)packet_count;
- (void)setFeatures_at_endpoint:(id)a3;
- (void)setPacket_count:(int)a3;
- (void)setServer_feature_latency_distribution:(id)a3;
- (void)setTotal_audio_recorded_seconds:(float)a3;
@end

@implementation FTMutableFinishAudio

- (FTMutableFinishAudio)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableFinishAudio;
  v2 = [(FTMutableFinishAudio *)&v6 init];
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

- (int)packet_count
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"packet_count"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setPacket_count:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)total_audio_recorded_seconds
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"total_audio_recorded_seconds"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setTotal_audio_recorded_seconds:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)features_at_endpoint
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"features_at_endpoint"];
}

- (void)setFeatures_at_endpoint:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)server_feature_latency_distribution
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"server_feature_latency_distribution"];
}

- (void)setServer_feature_latency_distribution:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end