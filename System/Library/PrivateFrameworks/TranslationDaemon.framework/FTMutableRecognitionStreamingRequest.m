@interface FTMutableRecognitionStreamingRequest
+ (Class)content_mutableClassForType:(int64_t)a3;
+ (int64_t)content_typeForMutableObject:(id)a3;
+ (int64_t)content_typeForObject:(id)a3;
- (FTAudioPacket)contentAsFTAudioPacket;
- (FTCheckForSpeechRequest)contentAsFTCheckForSpeechRequest;
- (FTFinishAudio)contentAsFTFinishAudio;
- (FTMutableRecognitionStreamingRequest)init;
- (FTResetServerEndpointer)contentAsFTResetServerEndpointer;
- (FTSetAlternateRecognitionSausage)contentAsFTSetAlternateRecognitionSausage;
- (FTSetEndpointerState)contentAsFTSetEndpointerState;
- (FTSetRequestOrigin)contentAsFTSetRequestOrigin;
- (FTSetSpeechContext)contentAsFTSetSpeechContext;
- (FTSetSpeechProfile)contentAsFTSetSpeechProfile;
- (FTStartSpeechRequest)contentAsFTStartSpeechRequest;
- (FTUpdateAudioInfo)contentAsFTUpdateAudioInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)content_type;
- (void)setContent:(id)a3;
- (void)setContentAsFTAudioPacket:(id)a3;
- (void)setContentAsFTCheckForSpeechRequest:(id)a3;
- (void)setContentAsFTFinishAudio:(id)a3;
- (void)setContentAsFTResetServerEndpointer:(id)a3;
- (void)setContentAsFTSetAlternateRecognitionSausage:(id)a3;
- (void)setContentAsFTSetEndpointerState:(id)a3;
- (void)setContentAsFTSetRequestOrigin:(id)a3;
- (void)setContentAsFTSetSpeechContext:(id)a3;
- (void)setContentAsFTSetSpeechProfile:(id)a3;
- (void)setContentAsFTStartSpeechRequest:(id)a3;
- (void)setContentAsFTUpdateAudioInfo:(id)a3;
- (void)setContent_type:(int64_t)a3;
@end

@implementation FTMutableRecognitionStreamingRequest

- (FTMutableRecognitionStreamingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableRecognitionStreamingRequest;
  v2 = [(FTMutableRecognitionStreamingRequest *)&v6 init];
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

- (int64_t)content_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setContent_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTStartSpeechRequest)contentAsFTStartSpeechRequest
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 1)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTStartSpeechRequest *)v3;
}

- (void)setContentAsFTStartSpeechRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:1];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTUpdateAudioInfo)contentAsFTUpdateAudioInfo
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 2)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTUpdateAudioInfo *)v3;
}

- (void)setContentAsFTUpdateAudioInfo:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:2];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTSetRequestOrigin)contentAsFTSetRequestOrigin
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 3)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetRequestOrigin *)v3;
}

- (void)setContentAsFTSetRequestOrigin:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:3];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTSetSpeechContext)contentAsFTSetSpeechContext
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 4)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetSpeechContext *)v3;
}

- (void)setContentAsFTSetSpeechContext:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:4];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTSetSpeechProfile)contentAsFTSetSpeechProfile
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 5)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetSpeechProfile *)v3;
}

- (void)setContentAsFTSetSpeechProfile:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:5];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTSetEndpointerState)contentAsFTSetEndpointerState
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 6)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetEndpointerState *)v3;
}

- (void)setContentAsFTSetEndpointerState:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:6];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTAudioPacket)contentAsFTAudioPacket
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 7)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTAudioPacket *)v3;
}

- (void)setContentAsFTAudioPacket:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:7];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTFinishAudio)contentAsFTFinishAudio
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 8)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTFinishAudio *)v3;
}

- (void)setContentAsFTFinishAudio:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:8];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTResetServerEndpointer)contentAsFTResetServerEndpointer
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 9)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTResetServerEndpointer *)v3;
}

- (void)setContentAsFTResetServerEndpointer:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:9];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTCheckForSpeechRequest)contentAsFTCheckForSpeechRequest
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 10)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTCheckForSpeechRequest *)v3;
}

- (void)setContentAsFTCheckForSpeechRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:10];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTSetAlternateRecognitionSausage)contentAsFTSetAlternateRecognitionSausage
{
  if ([(FTMutableRecognitionStreamingRequest *)self content_type] == 11)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetAlternateRecognitionSausage *)v3;
}

- (void)setContentAsFTSetAlternateRecognitionSausage:(id)a3
{
  id v5 = a3;
  [(FTMutableRecognitionStreamingRequest *)self setContent_type:11];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (void)setContent:(id)a3
{
  id v5 = a3;
  -[FTMutableRecognitionStreamingRequest setContent_type:](self, "setContent_type:", objc_msgSend((id)objc_opt_class(), "content_typeForObject:", v5));
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

+ (Class)content_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (int64_t)content_typeForMutableObject:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 11;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)content_typeForObject:(id)a3
{
  id v3 = a3;
  if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  {
    int64_t v4 = 1;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 2;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 3;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 4;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 5;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 6;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 7;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 8;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 9;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 10;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 11;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end