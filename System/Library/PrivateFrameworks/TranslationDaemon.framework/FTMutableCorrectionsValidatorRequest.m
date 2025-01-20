@interface FTMutableCorrectionsValidatorRequest
- (FTMutableCorrectionsValidatorRequest)init;
- (FTRecognitionResult)recognition_result;
- (NSString)corrected_utterance;
- (NSString)language;
- (NSString)original_utterance;
- (NSString)session_id;
- (NSString)speech_id;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCorrected_utterance:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOriginal_utterance:(id)a3;
- (void)setRecognition_result:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
@end

@implementation FTMutableCorrectionsValidatorRequest

- (FTMutableCorrectionsValidatorRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableCorrectionsValidatorRequest;
  v2 = [(FTMutableCorrectionsValidatorRequest *)&v6 init];
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

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
}

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTRecognitionResult)recognition_result
{
  return (FTRecognitionResult *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"recognition_result"];
}

- (void)setRecognition_result:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)original_utterance
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"original_utterance"];
}

- (void)setOriginal_utterance:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)corrected_utterance
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"corrected_utterance"];
}

- (void)setCorrected_utterance:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end