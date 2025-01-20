@interface FTMutableRecognitionProgress
- (FTMutableRecognitionProgress)init;
- (NSString)speech_id;
- (id)copyWithZone:(_NSZone *)a3;
- (int)processed_audio_duration_ms;
- (void)setProcessed_audio_duration_ms:(int)a3;
- (void)setSpeech_id:(id)a3;
@end

@implementation FTMutableRecognitionProgress

- (FTMutableRecognitionProgress)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableRecognitionProgress;
  v2 = [(FTMutableRecognitionProgress *)&v6 init];
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