@interface FTMutableBlazarMultilingualMessage
+ (Class)session_message_mutableClassForType:(int64_t)a3;
+ (int64_t)session_message_typeForMutableObject:(id)a3;
+ (int64_t)session_message_typeForObject:(id)a3;
- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded;
- (FTAudioPacket)session_messageAsFTAudioPacket;
- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse;
- (FTFinalSpeechRecognitionResponse)session_messageAsFTFinalSpeechRecognitionResponse;
- (FTFinishAudio)session_messageAsFTFinishAudio;
- (FTLanguageDetected)session_messageAsFTLanguageDetected;
- (FTMutableBlazarMultilingualMessage)init;
- (FTPartialSpeechRecognitionResponse)session_messageAsFTPartialSpeechRecognitionResponse;
- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate;
- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse;
- (FTSetRequestOrigin)session_messageAsFTSetRequestOrigin;
- (FTSetSpeechContext)session_messageAsFTSetSpeechContext;
- (FTSetSpeechProfile)session_messageAsFTSetSpeechProfile;
- (FTStartMultilingualSpeechRequest)session_messageAsFTStartMultilingualSpeechRequest;
- (FTUpdateAudioInfo)session_messageAsFTUpdateAudioInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)session_message_type;
- (void)setSession_message:(id)a3;
- (void)setSession_messageAsFTAudioLimitExceeded:(id)a3;
- (void)setSession_messageAsFTAudioPacket:(id)a3;
- (void)setSession_messageAsFTFinalBlazarResponse:(id)a3;
- (void)setSession_messageAsFTFinalSpeechRecognitionResponse:(id)a3;
- (void)setSession_messageAsFTFinishAudio:(id)a3;
- (void)setSession_messageAsFTLanguageDetected:(id)a3;
- (void)setSession_messageAsFTPartialSpeechRecognitionResponse:(id)a3;
- (void)setSession_messageAsFTRecognitionCandidate:(id)a3;
- (void)setSession_messageAsFTRequestStatsResponse:(id)a3;
- (void)setSession_messageAsFTSetRequestOrigin:(id)a3;
- (void)setSession_messageAsFTSetSpeechContext:(id)a3;
- (void)setSession_messageAsFTSetSpeechProfile:(id)a3;
- (void)setSession_messageAsFTStartMultilingualSpeechRequest:(id)a3;
- (void)setSession_messageAsFTUpdateAudioInfo:(id)a3;
- (void)setSession_message_type:(int64_t)a3;
@end

@implementation FTMutableBlazarMultilingualMessage

- (FTMutableBlazarMultilingualMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableBlazarMultilingualMessage;
  v2 = [(FTMutableBlazarMultilingualMessage *)&v6 init];
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

- (FTStartMultilingualSpeechRequest)session_messageAsFTStartMultilingualSpeechRequest
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 1)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTStartMultilingualSpeechRequest *)v3;
}

- (void)setSession_messageAsFTStartMultilingualSpeechRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:1];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTUpdateAudioInfo)session_messageAsFTUpdateAudioInfo
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 2)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:2];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSetRequestOrigin)session_messageAsFTSetRequestOrigin
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 3)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:3];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSetSpeechContext)session_messageAsFTSetSpeechContext
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 4)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:4];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTSetSpeechProfile)session_messageAsFTSetSpeechProfile
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 5)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:5];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTAudioPacket)session_messageAsFTAudioPacket
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 6)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:6];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTFinishAudio)session_messageAsFTFinishAudio
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 7)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:7];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTLanguageDetected)session_messageAsFTLanguageDetected
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 8)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:8];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTFinalSpeechRecognitionResponse)session_messageAsFTFinalSpeechRecognitionResponse
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 9)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:9];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTPartialSpeechRecognitionResponse)session_messageAsFTPartialSpeechRecognitionResponse
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 10)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:10];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 11)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:11];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 12)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:12];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 13)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:13];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse
{
  if ([(FTMutableBlazarMultilingualMessage *)self session_message_type] == 14)
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
  [(FTMutableBlazarMultilingualMessage *)self setSession_message_type:14];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (void)setSession_message:(id)a3
{
  id v5 = a3;
  -[FTMutableBlazarMultilingualMessage setSession_message_type:](self, "setSession_message_type:", objc_msgSend((id)objc_opt_class(), "session_message_typeForObject:", v5));
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

+ (Class)session_message_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD)
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
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 14;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 14;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end