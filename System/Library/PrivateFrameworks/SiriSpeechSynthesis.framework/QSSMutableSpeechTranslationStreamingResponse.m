@interface QSSMutableSpeechTranslationStreamingResponse
- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded;
- (QSSClientSetupInfo)contentAsQSSClientSetupInfo;
- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse;
- (QSSMutableSpeechTranslationStreamingResponse)init;
- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate;
- (QSSRecognitionProgress)contentAsQSSRecognitionProgress;
- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse;
- (QSSServerEndpointFeatures)contentAsQSSServerEndpointFeatures;
- (QSSSpeechTranslationFinalRecognitionResponse)contentAsQSSSpeechTranslationFinalRecognitionResponse;
- (QSSSpeechTranslationMtResponse)contentAsQSSSpeechTranslationMtResponse;
- (QSSSpeechTranslationPartialRecognitionResponse)contentAsQSSSpeechTranslationPartialRecognitionResponse;
- (QSSSpeechTranslationServerEndpointFeatures)contentAsQSSSpeechTranslationServerEndpointFeatures;
- (QSSSpeechTranslationTextToSpeechResponse)contentAsQSSSpeechTranslationTextToSpeechResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)content_type;
- (void)setContentAsQSSAudioLimitExceeded:(id)a3;
- (void)setContentAsQSSClientSetupInfo:(id)a3;
- (void)setContentAsQSSFinalBlazarResponse:(id)a3;
- (void)setContentAsQSSRecognitionCandidate:(id)a3;
- (void)setContentAsQSSRecognitionProgress:(id)a3;
- (void)setContentAsQSSRequestStatsResponse:(id)a3;
- (void)setContentAsQSSServerEndpointFeatures:(id)a3;
- (void)setContentAsQSSSpeechTranslationFinalRecognitionResponse:(id)a3;
- (void)setContentAsQSSSpeechTranslationMtResponse:(id)a3;
- (void)setContentAsQSSSpeechTranslationPartialRecognitionResponse:(id)a3;
- (void)setContentAsQSSSpeechTranslationServerEndpointFeatures:(id)a3;
- (void)setContentAsQSSSpeechTranslationTextToSpeechResponse:(id)a3;
- (void)setContent_type:(int64_t)a3;
@end

@implementation QSSMutableSpeechTranslationStreamingResponse

- (void)setContentAsQSSSpeechTranslationServerEndpointFeatures:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:12];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSSpeechTranslationServerEndpointFeatures)contentAsQSSSpeechTranslationServerEndpointFeatures
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 12)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSSpeechTranslationServerEndpointFeatures *)v3;
}

- (void)setContentAsQSSClientSetupInfo:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:11];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSClientSetupInfo)contentAsQSSClientSetupInfo
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 11)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSClientSetupInfo *)v3;
}

- (void)setContentAsQSSServerEndpointFeatures:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:10];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSServerEndpointFeatures)contentAsQSSServerEndpointFeatures
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 10)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSServerEndpointFeatures *)v3;
}

- (void)setContentAsQSSRequestStatsResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:9];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 9)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSRequestStatsResponse *)v3;
}

- (void)setContentAsQSSRecognitionCandidate:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:8];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 8)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSRecognitionCandidate *)v3;
}

- (void)setContentAsQSSRecognitionProgress:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:7];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSRecognitionProgress)contentAsQSSRecognitionProgress
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 7)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSRecognitionProgress *)v3;
}

- (void)setContentAsQSSFinalBlazarResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:6];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSFinalBlazarResponse *)v3;
}

- (void)setContentAsQSSSpeechTranslationTextToSpeechResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:5];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSSpeechTranslationTextToSpeechResponse)contentAsQSSSpeechTranslationTextToSpeechResponse
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSSpeechTranslationTextToSpeechResponse *)v3;
}

- (void)setContentAsQSSSpeechTranslationMtResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:4];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSSpeechTranslationMtResponse)contentAsQSSSpeechTranslationMtResponse
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSSpeechTranslationMtResponse *)v3;
}

- (void)setContentAsQSSAudioLimitExceeded:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:3];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSAudioLimitExceeded *)v3;
}

- (void)setContentAsQSSSpeechTranslationFinalRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:2];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSSpeechTranslationFinalRecognitionResponse)contentAsQSSSpeechTranslationFinalRecognitionResponse
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSSpeechTranslationFinalRecognitionResponse *)v3;
}

- (void)setContentAsQSSSpeechTranslationPartialRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableSpeechTranslationStreamingResponse *)self setContent_type:1];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSSpeechTranslationPartialRecognitionResponse)contentAsQSSSpeechTranslationPartialRecognitionResponse
{
  if ([(QSSMutableSpeechTranslationStreamingResponse *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSSpeechTranslationPartialRecognitionResponse *)v3;
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

- (QSSMutableSpeechTranslationStreamingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableSpeechTranslationStreamingResponse;
  v2 = [(QSSMutableSpeechTranslationStreamingResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end