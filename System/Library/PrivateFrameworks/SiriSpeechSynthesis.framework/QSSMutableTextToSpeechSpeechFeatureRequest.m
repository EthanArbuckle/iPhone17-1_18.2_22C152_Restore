@interface QSSMutableTextToSpeechSpeechFeatureRequest
- (NSString)session_id;
- (NSString)speech_id;
- (QSSMutableTextToSpeechSpeechFeatureRequest)init;
- (QSSTextToSpeechSpeechFeatureInputText)text;
- (QSSTextToSpeechSpeechFeatureInputWave)wave_data;
- (QSSTextToSpeechSpeechFeatureModelIdentifier)model_id;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setModel_id:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setText:(id)a3;
- (void)setWave_data:(id)a3;
@end

@implementation QSSMutableTextToSpeechSpeechFeatureRequest

- (void)setWave_data:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechSpeechFeatureInputWave)wave_data
{
  return (QSSTextToSpeechSpeechFeatureInputWave *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"wave_data"];
}

- (void)setText:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechSpeechFeatureInputText)text
{
  return (QSSTextToSpeechSpeechFeatureInputText *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text"];
}

- (void)setModel_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechSpeechFeatureModelIdentifier)model_id
{
  return (QSSTextToSpeechSpeechFeatureModelIdentifier *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"model_id"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTextToSpeechSpeechFeatureRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechSpeechFeatureRequest;
  v2 = [(QSSMutableTextToSpeechSpeechFeatureRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end