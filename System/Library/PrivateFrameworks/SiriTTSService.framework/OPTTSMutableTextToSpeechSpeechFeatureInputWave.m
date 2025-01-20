@interface OPTTSMutableTextToSpeechSpeechFeatureInputWave
- (NSData)pcm_data;
- (OPTTSMutableTextToSpeechSpeechFeatureInputWave)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)sample_rate;
- (void)pcm_data:(id)a3;
- (void)setPcm_data:(id)a3;
- (void)setSample_rate:(int)a3;
@end

@implementation OPTTSMutableTextToSpeechSpeechFeatureInputWave

- (void)pcm_data:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(OPTTSMutableTextToSpeechSpeechFeatureInputWave *)self pcm_data];
  uint64_t v5 = [v4 bytes];
  v6 = [(OPTTSMutableTextToSpeechSpeechFeatureInputWave *)self pcm_data];
  v7[2](v7, v5, [v6 length]);
}

- (void)setPcm_data:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)pcm_data
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pcm_data"];
}

- (void)setSample_rate:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)sample_rate
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sample_rate"];
  int v3 = [v2 intValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (OPTTSMutableTextToSpeechSpeechFeatureInputWave)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTextToSpeechSpeechFeatureInputWave;
  v2 = [(OPTTSMutableTextToSpeechSpeechFeatureInputWave *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end