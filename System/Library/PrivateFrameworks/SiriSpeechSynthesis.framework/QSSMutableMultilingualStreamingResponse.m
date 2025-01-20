@interface QSSMutableMultilingualStreamingResponse
- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded;
- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse;
- (QSSFinalSpeechRecognitionResponse)contentAsQSSFinalSpeechRecognitionResponse;
- (QSSMutableMultilingualStreamingResponse)init;
- (QSSPartialSpeechRecognitionResponse)contentAsQSSPartialSpeechRecognitionResponse;
- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate;
- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)content_type;
- (void)setContentAsQSSAudioLimitExceeded:(id)a3;
- (void)setContentAsQSSFinalBlazarResponse:(id)a3;
- (void)setContentAsQSSFinalSpeechRecognitionResponse:(id)a3;
- (void)setContentAsQSSPartialSpeechRecognitionResponse:(id)a3;
- (void)setContentAsQSSRecognitionCandidate:(id)a3;
- (void)setContentAsQSSRequestStatsResponse:(id)a3;
- (void)setContent_type:(int64_t)a3;
@end

@implementation QSSMutableMultilingualStreamingResponse

- (void)setContentAsQSSFinalBlazarResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableMultilingualStreamingResponse *)self setContent_type:6];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse
{
  if ([(QSSMutableMultilingualStreamingResponse *)self content_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSFinalBlazarResponse *)v3;
}

- (void)setContentAsQSSAudioLimitExceeded:(id)a3
{
  id v5 = a3;
  [(QSSMutableMultilingualStreamingResponse *)self setContent_type:5];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded
{
  if ([(QSSMutableMultilingualStreamingResponse *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSAudioLimitExceeded *)v3;
}

- (void)setContentAsQSSRequestStatsResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableMultilingualStreamingResponse *)self setContent_type:4];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse
{
  if ([(QSSMutableMultilingualStreamingResponse *)self content_type] == 4)
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
  [(QSSMutableMultilingualStreamingResponse *)self setContent_type:3];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate
{
  if ([(QSSMutableMultilingualStreamingResponse *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSRecognitionCandidate *)v3;
}

- (void)setContentAsQSSPartialSpeechRecognitionResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableMultilingualStreamingResponse *)self setContent_type:2];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSPartialSpeechRecognitionResponse)contentAsQSSPartialSpeechRecognitionResponse
{
  if ([(QSSMutableMultilingualStreamingResponse *)self content_type] == 2)
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
  [(QSSMutableMultilingualStreamingResponse *)self setContent_type:1];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSFinalSpeechRecognitionResponse)contentAsQSSFinalSpeechRecognitionResponse
{
  if ([(QSSMutableMultilingualStreamingResponse *)self content_type] == 1)
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

- (QSSMutableMultilingualStreamingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableMultilingualStreamingResponse;
  v2 = [(QSSMutableMultilingualStreamingResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end