@interface QSSMutableSpeechTranslationStreamingRequest
- (QSSAudioPacket)contentAsQSSAudioPacket;
- (QSSFinishAudio)contentAsQSSFinishAudio;
- (QSSLanguageDetected)contentAsQSSLanguageDetected;
- (QSSMutableSpeechTranslationStreamingRequest)init;
- (QSSResetServerEndpointer)contentAsQSSResetServerEndpointer;
- (QSSSetEndpointerState)contentAsQSSSetEndpointerState;
- (QSSSpeechTranslationAudioPacket)contentAsQSSSpeechTranslationAudioPacket;
- (QSSStartSpeechTranslationLoggingRequest)contentAsQSSStartSpeechTranslationLoggingRequest;
- (QSSStartSpeechTranslationRequest)contentAsQSSStartSpeechTranslationRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)content_type;
- (void)setContentAsQSSAudioPacket:(id)a3;
- (void)setContentAsQSSFinishAudio:(id)a3;
- (void)setContentAsQSSLanguageDetected:(id)a3;
- (void)setContentAsQSSResetServerEndpointer:(id)a3;
- (void)setContentAsQSSSetEndpointerState:(id)a3;
- (void)setContentAsQSSSpeechTranslationAudioPacket:(id)a3;
- (void)setContentAsQSSStartSpeechTranslationLoggingRequest:(id)a3;
- (void)setContentAsQSSStartSpeechTranslationRequest:(id)a3;
- (void)setContent_type:(int64_t)a3;
@end

@implementation QSSMutableSpeechTranslationStreamingRequest

- (void)setContentAsQSSStartSpeechTranslationLoggingRequest:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingRequest *)self setContent_type:8];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSStartSpeechTranslationLoggingRequest)contentAsQSSStartSpeechTranslationLoggingRequest
{
  if ([(QSSMutableSpeechTranslationStreamingRequest *)self content_type] == 8)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSStartSpeechTranslationLoggingRequest *)v3;
}

- (void)setContentAsQSSResetServerEndpointer:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingRequest *)self setContent_type:7];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSResetServerEndpointer)contentAsQSSResetServerEndpointer
{
  if ([(QSSMutableSpeechTranslationStreamingRequest *)self content_type] == 7)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSResetServerEndpointer *)v3;
}

- (void)setContentAsQSSSetEndpointerState:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingRequest *)self setContent_type:6];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSSetEndpointerState)contentAsQSSSetEndpointerState
{
  if ([(QSSMutableSpeechTranslationStreamingRequest *)self content_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSSetEndpointerState *)v3;
}

- (void)setContentAsQSSFinishAudio:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingRequest *)self setContent_type:5];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSFinishAudio)contentAsQSSFinishAudio
{
  if ([(QSSMutableSpeechTranslationStreamingRequest *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSFinishAudio *)v3;
}

- (void)setContentAsQSSSpeechTranslationAudioPacket:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingRequest *)self setContent_type:4];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSSpeechTranslationAudioPacket)contentAsQSSSpeechTranslationAudioPacket
{
  if ([(QSSMutableSpeechTranslationStreamingRequest *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSSpeechTranslationAudioPacket *)v3;
}

- (void)setContentAsQSSAudioPacket:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingRequest *)self setContent_type:3];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSAudioPacket)contentAsQSSAudioPacket
{
  if ([(QSSMutableSpeechTranslationStreamingRequest *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSAudioPacket *)v3;
}

- (void)setContentAsQSSLanguageDetected:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingRequest *)self setContent_type:2];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSLanguageDetected)contentAsQSSLanguageDetected
{
  if ([(QSSMutableSpeechTranslationStreamingRequest *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSLanguageDetected *)v3;
}

- (void)setContentAsQSSStartSpeechTranslationRequest:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingRequest *)self setContent_type:1];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSStartSpeechTranslationRequest)contentAsQSSStartSpeechTranslationRequest
{
  if ([(QSSMutableSpeechTranslationStreamingRequest *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSStartSpeechTranslationRequest *)v3;
}

- (void)setContent_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)content_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content_type"];
  int64_t v3 = [v2 integerValue];

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

- (QSSMutableSpeechTranslationStreamingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableSpeechTranslationStreamingRequest;
  v2 = [(QSSMutableSpeechTranslationStreamingRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end