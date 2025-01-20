@interface FTMutableBlazarMultiUserMessage
+ (Class)session_message_mutableClassForType:(int64_t)a3;
+ (int64_t)session_message_typeForMutableObject:(id)a3;
+ (int64_t)session_message_typeForObject:(id)a3;
- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded;
- (FTAudioPacket)session_messageAsFTAudioPacket;
- (FTClientSetupInfo)session_messageAsFTClientSetupInfo;
- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse;
- (FTFinalSpeechRecognitionResponse)session_messageAsFTFinalSpeechRecognitionResponse;
- (FTFinishAudio)session_messageAsFTFinishAudio;
- (FTMultiUserStartSpeechRequest)session_messageAsFTMultiUserStartSpeechRequest;
- (FTMutableBlazarMultiUserMessage)init;
- (FTPartialSpeechRecognitionResponse)session_messageAsFTPartialSpeechRecognitionResponse;
- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate;
- (FTRecognitionProgress)session_messageAsFTRecognitionProgress;
- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse;
- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer;
- (FTServerEndpointFeatures)session_messageAsFTServerEndpointFeatures;
- (FTSetAlternateRecognitionSausage)session_messageAsFTSetAlternateRecognitionSausage;
- (FTSetEndpointerState)session_messageAsFTSetEndpointerState;
- (FTSetRequestOrigin)session_messageAsFTSetRequestOrigin;
- (FTSetSpeechContext)session_messageAsFTSetSpeechContext;
- (FTSetSpeechProfile)session_messageAsFTSetSpeechProfile;
- (FTUpdateAudioInfo)session_messageAsFTUpdateAudioInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)session_message_type;
- (void)setSession_message:(id)a3;
- (void)setSession_messageAsFTAudioLimitExceeded:(id)a3;
- (void)setSession_messageAsFTAudioPacket:(id)a3;
- (void)setSession_messageAsFTClientSetupInfo:(id)a3;
- (void)setSession_messageAsFTFinalBlazarResponse:(id)a3;
- (void)setSession_messageAsFTFinalSpeechRecognitionResponse:(id)a3;
- (void)setSession_messageAsFTFinishAudio:(id)a3;
- (void)setSession_messageAsFTMultiUserStartSpeechRequest:(id)a3;
- (void)setSession_messageAsFTPartialSpeechRecognitionResponse:(id)a3;
- (void)setSession_messageAsFTRecognitionCandidate:(id)a3;
- (void)setSession_messageAsFTRecognitionProgress:(id)a3;
- (void)setSession_messageAsFTRequestStatsResponse:(id)a3;
- (void)setSession_messageAsFTResetServerEndpointer:(id)a3;
- (void)setSession_messageAsFTServerEndpointFeatures:(id)a3;
- (void)setSession_messageAsFTSetAlternateRecognitionSausage:(id)a3;
- (void)setSession_messageAsFTSetEndpointerState:(id)a3;
- (void)setSession_messageAsFTSetRequestOrigin:(id)a3;
- (void)setSession_messageAsFTSetSpeechContext:(id)a3;
- (void)setSession_messageAsFTSetSpeechProfile:(id)a3;
- (void)setSession_messageAsFTUpdateAudioInfo:(id)a3;
- (void)setSession_message_type:(int64_t)a3;
@end

@implementation FTMutableBlazarMultiUserMessage

- (FTMutableBlazarMultiUserMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableBlazarMultiUserMessage;
  v2 = [(FTMutableBlazarMultiUserMessage *)&v6 init];
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

- (int64_t)session_message_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setSession_message_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTMultiUserStartSpeechRequest)session_messageAsFTMultiUserStartSpeechRequest
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 1)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTMultiUserStartSpeechRequest *)v3;
}

- (void)setSession_messageAsFTMultiUserStartSpeechRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:1];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTUpdateAudioInfo)session_messageAsFTUpdateAudioInfo
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 2)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTUpdateAudioInfo *)v3;
}

- (void)setSession_messageAsFTUpdateAudioInfo:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:2];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSetRequestOrigin)session_messageAsFTSetRequestOrigin
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 3)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetRequestOrigin *)v3;
}

- (void)setSession_messageAsFTSetRequestOrigin:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:3];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSetSpeechContext)session_messageAsFTSetSpeechContext
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 4)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetSpeechContext *)v3;
}

- (void)setSession_messageAsFTSetSpeechContext:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:4];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSetSpeechProfile)session_messageAsFTSetSpeechProfile
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 5)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetSpeechProfile *)v3;
}

- (void)setSession_messageAsFTSetSpeechProfile:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:5];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSetEndpointerState)session_messageAsFTSetEndpointerState
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 6)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetEndpointerState *)v3;
}

- (void)setSession_messageAsFTSetEndpointerState:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:6];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTAudioPacket)session_messageAsFTAudioPacket
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 7)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTAudioPacket *)v3;
}

- (void)setSession_messageAsFTAudioPacket:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:7];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTFinishAudio)session_messageAsFTFinishAudio
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 8)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTFinishAudio *)v3;
}

- (void)setSession_messageAsFTFinishAudio:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:8];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 9)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTResetServerEndpointer *)v3;
}

- (void)setSession_messageAsFTResetServerEndpointer:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:9];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSetAlternateRecognitionSausage)session_messageAsFTSetAlternateRecognitionSausage
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 10)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSetAlternateRecognitionSausage *)v3;
}

- (void)setSession_messageAsFTSetAlternateRecognitionSausage:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:10];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTFinalSpeechRecognitionResponse)session_messageAsFTFinalSpeechRecognitionResponse
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 11)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTFinalSpeechRecognitionResponse *)v3;
}

- (void)setSession_messageAsFTFinalSpeechRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:11];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTPartialSpeechRecognitionResponse)session_messageAsFTPartialSpeechRecognitionResponse
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 12)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTPartialSpeechRecognitionResponse *)v3;
}

- (void)setSession_messageAsFTPartialSpeechRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:12];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTRecognitionProgress)session_messageAsFTRecognitionProgress
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 13)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTRecognitionProgress *)v3;
}

- (void)setSession_messageAsFTRecognitionProgress:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:13];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 14)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTRecognitionCandidate *)v3;
}

- (void)setSession_messageAsFTRecognitionCandidate:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:14];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 15)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTRequestStatsResponse *)v3;
}

- (void)setSession_messageAsFTRequestStatsResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:15];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTServerEndpointFeatures)session_messageAsFTServerEndpointFeatures
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 16)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTServerEndpointFeatures *)v3;
}

- (void)setSession_messageAsFTServerEndpointFeatures:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:16];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTClientSetupInfo)session_messageAsFTClientSetupInfo
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 17)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTClientSetupInfo *)v3;
}

- (void)setSession_messageAsFTClientSetupInfo:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:17];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 18)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTAudioLimitExceeded *)v3;
}

- (void)setSession_messageAsFTAudioLimitExceeded:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:18];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse
{
  if ([(FTMutableBlazarMultiUserMessage *)self session_message_type] == 19)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTFinalBlazarResponse *)v3;
}

- (void)setSession_messageAsFTFinalBlazarResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultiUserMessage *)self setSession_message_type:19];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (void)setSession_message:(id)a3
{
  id v5 = a3;
  -[FTMutableBlazarMultiUserMessage setSession_message_type:](self, "setSession_message_type:", objc_msgSend((id)objc_opt_class(), "session_message_typeForObject:", v5));
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

+ (Class)session_message_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x12)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (int64_t)session_message_typeForMutableObject:(id)a3
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
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 14;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 15;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 16;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 17;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 18;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 19;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)session_message_typeForObject:(id)a3
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
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 11;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 12;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 13;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 14;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 15;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 16;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 17;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 18;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 19;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 19;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end