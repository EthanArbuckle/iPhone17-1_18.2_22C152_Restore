@interface FTMutableTextToSpeechSpeechFeatureRequest
- (BOOL)support_homograph;
- (FTMutableTextToSpeechSpeechFeatureRequest)init;
- (FTTextToSpeechSpeechFeatureInputText)text;
- (FTTextToSpeechSpeechFeatureInputWave)wave_data;
- (FTTextToSpeechSpeechFeatureModelIdentifier)model_id;
- (NSArray)lexicon;
- (NSString)session_id;
- (NSString)speech_id;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLexicon:(id)a3;
- (void)setModel_id:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setSupport_homograph:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setWave_data:(id)a3;
@end

@implementation FTMutableTextToSpeechSpeechFeatureRequest

- (FTMutableTextToSpeechSpeechFeatureRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechSpeechFeatureRequest;
  v2 = [(FTMutableTextToSpeechSpeechFeatureRequest *)&v6 init];
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

- (FTTextToSpeechSpeechFeatureModelIdentifier)model_id
{
  return (FTTextToSpeechSpeechFeatureModelIdentifier *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"model_id"];
}

- (void)setModel_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechSpeechFeatureInputText)text
{
  return (FTTextToSpeechSpeechFeatureInputText *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text"];
}

- (void)setText:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechSpeechFeatureInputWave)wave_data
{
  return (FTTextToSpeechSpeechFeatureInputWave *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"wave_data"];
}

- (void)setWave_data:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)lexicon
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"lexicon"];
}

- (void)setLexicon:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)support_homograph
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"support_homograph"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSupport_homograph:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end