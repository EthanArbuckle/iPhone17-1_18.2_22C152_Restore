@interface QSSMutableRecognitionStreamingResponse
- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded;
- (QSSCheckForSpeechResponse)contentAsQSSCheckForSpeechResponse;
- (QSSClientSetupInfo)contentAsQSSClientSetupInfo;
- (QSSEndPointCandidate)contentAsQSSEndPointCandidate;
- (QSSEndPointLikelihood)contentAsQSSEndPointLikelihood;
- (QSSFinalSpeechRecognitionResponse)contentAsQSSFinalSpeechRecognitionResponse;
- (QSSMutableRecognitionStreamingResponse)init;
- (QSSPartialSpeechRecognitionResponse)contentAsQSSPartialSpeechRecognitionResponse;
- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate;
- (QSSRecognitionProgress)contentAsQSSRecognitionProgress;
- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse;
- (QSSServerEndpointFeatures)contentAsQSSServerEndpointFeatures;
- (QSSUpdatedAcousticProfile)contentAsQSSUpdatedAcousticProfile;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)content_type;
- (void)setContentAsQSSAudioLimitExceeded:(id)a3;
- (void)setContentAsQSSCheckForSpeechResponse:(id)a3;
- (void)setContentAsQSSClientSetupInfo:(id)a3;
- (void)setContentAsQSSEndPointCandidate:(id)a3;
- (void)setContentAsQSSEndPointLikelihood:(id)a3;
- (void)setContentAsQSSFinalSpeechRecognitionResponse:(id)a3;
- (void)setContentAsQSSPartialSpeechRecognitionResponse:(id)a3;
- (void)setContentAsQSSRecognitionCandidate:(id)a3;
- (void)setContentAsQSSRecognitionProgress:(id)a3;
- (void)setContentAsQSSRequestStatsResponse:(id)a3;
- (void)setContentAsQSSServerEndpointFeatures:(id)a3;
- (void)setContentAsQSSUpdatedAcousticProfile:(id)a3;
- (void)setContent_type:(int64_t)a3;
@end

@implementation QSSMutableRecognitionStreamingResponse

- (void)setContentAsQSSAudioLimitExceeded:(id)a3
{
  id v5 = a3;
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:12];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 12)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSAudioLimitExceeded *)v3;
}

- (void)setContentAsQSSClientSetupInfo:(id)a3
{
  id v5 = a3;
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:11];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSClientSetupInfo)contentAsQSSClientSetupInfo
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 11)
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
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:10];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSServerEndpointFeatures)contentAsQSSServerEndpointFeatures
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 10)
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
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:9];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 9)
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
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:8];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 8)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSRecognitionCandidate *)v3;
}

- (void)setContentAsQSSCheckForSpeechResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:7];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSCheckForSpeechResponse)contentAsQSSCheckForSpeechResponse
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 7)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSCheckForSpeechResponse *)v3;
}

- (void)setContentAsQSSRecognitionProgress:(id)a3
{
  id v5 = a3;
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:6];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSRecognitionProgress)contentAsQSSRecognitionProgress
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSRecognitionProgress *)v3;
}

- (void)setContentAsQSSEndPointCandidate:(id)a3
{
  id v5 = a3;
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:5];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSEndPointCandidate)contentAsQSSEndPointCandidate
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSEndPointCandidate *)v3;
}

- (void)setContentAsQSSEndPointLikelihood:(id)a3
{
  id v5 = a3;
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:4];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSEndPointLikelihood)contentAsQSSEndPointLikelihood
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSEndPointLikelihood *)v3;
}

- (void)setContentAsQSSUpdatedAcousticProfile:(id)a3
{
  id v5 = a3;
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:3];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSUpdatedAcousticProfile)contentAsQSSUpdatedAcousticProfile
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSUpdatedAcousticProfile *)v3;
}

- (void)setContentAsQSSPartialSpeechRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:2];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSPartialSpeechRecognitionResponse)contentAsQSSPartialSpeechRecognitionResponse
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSPartialSpeechRecognitionResponse *)v3;
}

- (void)setContentAsQSSFinalSpeechRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableRecognitionStreamingResponse *)self setContent_type:1];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSFinalSpeechRecognitionResponse)contentAsQSSFinalSpeechRecognitionResponse
{
  if ([(QSSMutableRecognitionStreamingResponse *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSFinalSpeechRecognitionResponse *)v3;
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

- (QSSMutableRecognitionStreamingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableRecognitionStreamingResponse;
  v2 = [(QSSMutableRecognitionStreamingResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end