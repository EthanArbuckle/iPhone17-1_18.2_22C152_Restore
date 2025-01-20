@interface FTMutableServerEndpointFeatures
- (FTMutableServerEndpointFeatures)init;
- (NSArray)pause_counts;
- (NSString)speech_id;
- (NSString)task_name;
- (double)eos_likelihood;
- (double)silence_posterior;
- (id)copyWithZone:(_NSZone *)a3;
- (int)num_of_words;
- (int)processed_audio_duration_ms;
- (int)trailing_silence_duration;
- (void)setEos_likelihood:(double)a3;
- (void)setNum_of_words:(int)a3;
- (void)setPause_counts:(id)a3;
- (void)setProcessed_audio_duration_ms:(int)a3;
- (void)setSilence_posterior:(double)a3;
- (void)setSpeech_id:(id)a3;
- (void)setTask_name:(id)a3;
- (void)setTrailing_silence_duration:(int)a3;
@end

@implementation FTMutableServerEndpointFeatures

- (FTMutableServerEndpointFeatures)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableServerEndpointFeatures;
  v2 = [(FTMutableServerEndpointFeatures *)&v6 init];
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

- (int)processed_audio_duration_ms
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"processed_audio_duration_ms"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setProcessed_audio_duration_ms:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)num_of_words
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"num_of_words"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setNum_of_words:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)trailing_silence_duration
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"trailing_silence_duration"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setTrailing_silence_duration:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)eos_likelihood
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"eos_likelihood"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setEos_likelihood:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)pause_counts
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pause_counts"];
}

- (void)setPause_counts:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)silence_posterior
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"silence_posterior"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setSilence_posterior:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)task_name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"task_name"];
}

- (void)setTask_name:(id)a3
{
  id v4 = (id)[a3 copy];
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