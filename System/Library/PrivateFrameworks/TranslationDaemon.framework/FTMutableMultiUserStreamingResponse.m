@interface FTMutableMultiUserStreamingResponse
+ (Class)content_mutableClassForType:(int64_t)a3;
+ (int64_t)content_typeForMutableObject:(id)a3;
+ (int64_t)content_typeForObject:(id)a3;
- (FTAudioLimitExceeded)contentAsFTAudioLimitExceeded;
- (FTClientSetupInfo)contentAsFTClientSetupInfo;
- (FTFinalBlazarResponse)contentAsFTFinalBlazarResponse;
- (FTFinalSpeechRecognitionResponse)contentAsFTFinalSpeechRecognitionResponse;
- (FTMutableMultiUserStreamingResponse)init;
- (FTPartialSpeechRecognitionResponse)contentAsFTPartialSpeechRecognitionResponse;
- (FTRecognitionCandidate)contentAsFTRecognitionCandidate;
- (FTRecognitionProgress)contentAsFTRecognitionProgress;
- (FTRequestStatsResponse)contentAsFTRequestStatsResponse;
- (FTServerEndpointFeatures)contentAsFTServerEndpointFeatures;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)content_type;
- (void)setContent:(id)a3;
- (void)setContentAsFTAudioLimitExceeded:(id)a3;
- (void)setContentAsFTClientSetupInfo:(id)a3;
- (void)setContentAsFTFinalBlazarResponse:(id)a3;
- (void)setContentAsFTFinalSpeechRecognitionResponse:(id)a3;
- (void)setContentAsFTPartialSpeechRecognitionResponse:(id)a3;
- (void)setContentAsFTRecognitionCandidate:(id)a3;
- (void)setContentAsFTRecognitionProgress:(id)a3;
- (void)setContentAsFTRequestStatsResponse:(id)a3;
- (void)setContentAsFTServerEndpointFeatures:(id)a3;
- (void)setContent_type:(int64_t)a3;
@end

@implementation FTMutableMultiUserStreamingResponse

- (FTMutableMultiUserStreamingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableMultiUserStreamingResponse;
  v2 = [(FTMutableMultiUserStreamingResponse *)&v6 init];
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

- (FTFinalSpeechRecognitionResponse)contentAsFTFinalSpeechRecognitionResponse
{
  if ([(FTMutableMultiUserStreamingResponse *)self content_type] == 1)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTFinalSpeechRecognitionResponse *)v3;
}

- (void)setContentAsFTFinalSpeechRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableMultiUserStreamingResponse *)self setContent_type:1];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTPartialSpeechRecognitionResponse)contentAsFTPartialSpeechRecognitionResponse
{
  if ([(FTMutableMultiUserStreamingResponse *)self content_type] == 2)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTPartialSpeechRecognitionResponse *)v3;
}

- (void)setContentAsFTPartialSpeechRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableMultiUserStreamingResponse *)self setContent_type:2];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTRecognitionProgress)contentAsFTRecognitionProgress
{
  if ([(FTMutableMultiUserStreamingResponse *)self content_type] == 3)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTRecognitionProgress *)v3;
}

- (void)setContentAsFTRecognitionProgress:(id)a3
{
  id v5 = a3;
  [(FTMutableMultiUserStreamingResponse *)self setContent_type:3];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTRecognitionCandidate)contentAsFTRecognitionCandidate
{
  if ([(FTMutableMultiUserStreamingResponse *)self content_type] == 4)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTRecognitionCandidate *)v3;
}

- (void)setContentAsFTRecognitionCandidate:(id)a3
{
  id v5 = a3;
  [(FTMutableMultiUserStreamingResponse *)self setContent_type:4];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTRequestStatsResponse)contentAsFTRequestStatsResponse
{
  if ([(FTMutableMultiUserStreamingResponse *)self content_type] == 5)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTRequestStatsResponse *)v3;
}

- (void)setContentAsFTRequestStatsResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableMultiUserStreamingResponse *)self setContent_type:5];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTServerEndpointFeatures)contentAsFTServerEndpointFeatures
{
  if ([(FTMutableMultiUserStreamingResponse *)self content_type] == 6)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTServerEndpointFeatures *)v3;
}

- (void)setContentAsFTServerEndpointFeatures:(id)a3
{
  id v5 = a3;
  [(FTMutableMultiUserStreamingResponse *)self setContent_type:6];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTClientSetupInfo)contentAsFTClientSetupInfo
{
  if ([(FTMutableMultiUserStreamingResponse *)self content_type] == 7)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTClientSetupInfo *)v3;
}

- (void)setContentAsFTClientSetupInfo:(id)a3
{
  id v5 = a3;
  [(FTMutableMultiUserStreamingResponse *)self setContent_type:7];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTAudioLimitExceeded)contentAsFTAudioLimitExceeded
{
  if ([(FTMutableMultiUserStreamingResponse *)self content_type] == 8)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTAudioLimitExceeded *)v3;
}

- (void)setContentAsFTAudioLimitExceeded:(id)a3
{
  id v5 = a3;
  [(FTMutableMultiUserStreamingResponse *)self setContent_type:8];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTFinalBlazarResponse)contentAsFTFinalBlazarResponse
{
  if ([(FTMutableMultiUserStreamingResponse *)self content_type] == 9)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTFinalBlazarResponse *)v3;
}

- (void)setContentAsFTFinalBlazarResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableMultiUserStreamingResponse *)self setContent_type:9];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (void)setContent:(id)a3
{
  id v5 = a3;
  -[FTMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", objc_msgSend((id)objc_opt_class(), "content_typeForObject:", v5));
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

+ (Class)content_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8)
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
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 9;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end