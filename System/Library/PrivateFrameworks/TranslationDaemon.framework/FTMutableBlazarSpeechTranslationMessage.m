@interface FTMutableBlazarSpeechTranslationMessage
+ (Class)session_message_mutableClassForType:(int64_t)a3;
+ (int64_t)session_message_typeForMutableObject:(id)a3;
+ (int64_t)session_message_typeForObject:(id)a3;
- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded;
- (FTAudioPacket)session_messageAsFTAudioPacket;
- (FTClientSetupInfo)session_messageAsFTClientSetupInfo;
- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse;
- (FTFinishAudio)session_messageAsFTFinishAudio;
- (FTLanguageDetected)session_messageAsFTLanguageDetected;
- (FTMutableBlazarSpeechTranslationMessage)init;
- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate;
- (FTRecognitionProgress)session_messageAsFTRecognitionProgress;
- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse;
- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer;
- (FTServerEndpointFeatures)session_messageAsFTServerEndpointFeatures;
- (FTSetEndpointerState)session_messageAsFTSetEndpointerState;
- (FTSpeechTranslationAudioPacket)session_messageAsFTSpeechTranslationAudioPacket;
- (FTSpeechTranslationFinalRecognitionResponse)session_messageAsFTSpeechTranslationFinalRecognitionResponse;
- (FTSpeechTranslationMtResponse)session_messageAsFTSpeechTranslationMtResponse;
- (FTSpeechTranslationPartialRecognitionResponse)session_messageAsFTSpeechTranslationPartialRecognitionResponse;
- (FTSpeechTranslationServerEndpointFeatures)session_messageAsFTSpeechTranslationServerEndpointFeatures;
- (FTSpeechTranslationTextToSpeechResponse)session_messageAsFTSpeechTranslationTextToSpeechResponse;
- (FTStartSpeechTranslationLoggingRequest)session_messageAsFTStartSpeechTranslationLoggingRequest;
- (FTStartSpeechTranslationRequest)session_messageAsFTStartSpeechTranslationRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)session_message_type;
- (void)setSession_message:(id)a3;
- (void)setSession_messageAsFTAudioLimitExceeded:(id)a3;
- (void)setSession_messageAsFTAudioPacket:(id)a3;
- (void)setSession_messageAsFTClientSetupInfo:(id)a3;
- (void)setSession_messageAsFTFinalBlazarResponse:(id)a3;
- (void)setSession_messageAsFTFinishAudio:(id)a3;
- (void)setSession_messageAsFTLanguageDetected:(id)a3;
- (void)setSession_messageAsFTRecognitionCandidate:(id)a3;
- (void)setSession_messageAsFTRecognitionProgress:(id)a3;
- (void)setSession_messageAsFTRequestStatsResponse:(id)a3;
- (void)setSession_messageAsFTResetServerEndpointer:(id)a3;
- (void)setSession_messageAsFTServerEndpointFeatures:(id)a3;
- (void)setSession_messageAsFTSetEndpointerState:(id)a3;
- (void)setSession_messageAsFTSpeechTranslationAudioPacket:(id)a3;
- (void)setSession_messageAsFTSpeechTranslationFinalRecognitionResponse:(id)a3;
- (void)setSession_messageAsFTSpeechTranslationMtResponse:(id)a3;
- (void)setSession_messageAsFTSpeechTranslationPartialRecognitionResponse:(id)a3;
- (void)setSession_messageAsFTSpeechTranslationServerEndpointFeatures:(id)a3;
- (void)setSession_messageAsFTSpeechTranslationTextToSpeechResponse:(id)a3;
- (void)setSession_messageAsFTStartSpeechTranslationLoggingRequest:(id)a3;
- (void)setSession_messageAsFTStartSpeechTranslationRequest:(id)a3;
- (void)setSession_message_type:(int64_t)a3;
@end

@implementation FTMutableBlazarSpeechTranslationMessage

- (FTMutableBlazarSpeechTranslationMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableBlazarSpeechTranslationMessage;
  v2 = [(FTMutableBlazarSpeechTranslationMessage *)&v6 init];
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

- (FTStartSpeechTranslationRequest)session_messageAsFTStartSpeechTranslationRequest
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 1)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTStartSpeechTranslationRequest *)v3;
}

- (void)setSession_messageAsFTStartSpeechTranslationRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:1];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTLanguageDetected)session_messageAsFTLanguageDetected
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 2)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTLanguageDetected *)v3;
}

- (void)setSession_messageAsFTLanguageDetected:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:2];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTAudioPacket)session_messageAsFTAudioPacket
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 3)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:3];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSpeechTranslationAudioPacket)session_messageAsFTSpeechTranslationAudioPacket
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 4)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSpeechTranslationAudioPacket *)v3;
}

- (void)setSession_messageAsFTSpeechTranslationAudioPacket:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:4];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTFinishAudio)session_messageAsFTFinishAudio
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 5)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:5];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSetEndpointerState)session_messageAsFTSetEndpointerState
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 6)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:6];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 7)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:7];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTStartSpeechTranslationLoggingRequest)session_messageAsFTStartSpeechTranslationLoggingRequest
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 8)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTStartSpeechTranslationLoggingRequest *)v3;
}

- (void)setSession_messageAsFTStartSpeechTranslationLoggingRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:8];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSpeechTranslationPartialRecognitionResponse)session_messageAsFTSpeechTranslationPartialRecognitionResponse
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 9)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSpeechTranslationPartialRecognitionResponse *)v3;
}

- (void)setSession_messageAsFTSpeechTranslationPartialRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:9];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSpeechTranslationFinalRecognitionResponse)session_messageAsFTSpeechTranslationFinalRecognitionResponse
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 10)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSpeechTranslationFinalRecognitionResponse *)v3;
}

- (void)setSession_messageAsFTSpeechTranslationFinalRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:10];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 11)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:11];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSpeechTranslationMtResponse)session_messageAsFTSpeechTranslationMtResponse
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 12)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSpeechTranslationMtResponse *)v3;
}

- (void)setSession_messageAsFTSpeechTranslationMtResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:12];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSpeechTranslationTextToSpeechResponse)session_messageAsFTSpeechTranslationTextToSpeechResponse
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 13)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSpeechTranslationTextToSpeechResponse *)v3;
}

- (void)setSession_messageAsFTSpeechTranslationTextToSpeechResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:13];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 14)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:14];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTRecognitionProgress)session_messageAsFTRecognitionProgress
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 15)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:15];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 16)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:16];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 17)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:17];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTServerEndpointFeatures)session_messageAsFTServerEndpointFeatures
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 18)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:18];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTClientSetupInfo)session_messageAsFTClientSetupInfo
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 19)
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
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:19];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSpeechTranslationServerEndpointFeatures)session_messageAsFTSpeechTranslationServerEndpointFeatures
{
  if ([(FTMutableBlazarSpeechTranslationMessage *)self session_message_type] == 20)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTSpeechTranslationServerEndpointFeatures *)v3;
}

- (void)setSession_messageAsFTSpeechTranslationServerEndpointFeatures:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarSpeechTranslationMessage *)self setSession_message_type:20];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (void)setSession_message:(id)a3
{
  id v5 = a3;
  -[FTMutableBlazarSpeechTranslationMessage setSession_message_type:](self, "setSession_message_type:", objc_msgSend((id)objc_opt_class(), "session_message_typeForObject:", v5));
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

+ (Class)session_message_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13)
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
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 20;
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
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 19;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 20;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 20;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end