@interface FTMutableTextToSpeechFeature
- (FTMutableTextToSpeechFeature)init;
- (NSArray)neural_phoneme_sequence;
- (NSArray)normalized_text;
- (NSArray)phoneme_sequence;
- (NSArray)prompts;
- (NSArray)replacement;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setNeural_phoneme_sequence:(id)a3;
- (void)setNormalized_text:(id)a3;
- (void)setPhoneme_sequence:(id)a3;
- (void)setPrompts:(id)a3;
- (void)setReplacement:(id)a3;
@end

@implementation FTMutableTextToSpeechFeature

- (FTMutableTextToSpeechFeature)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechFeature;
  v2 = [(FTMutableTextToSpeechFeature *)&v6 init];
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

- (NSArray)normalized_text
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"normalized_text"];
}

- (void)setNormalized_text:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)phoneme_sequence
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"phoneme_sequence"];
}

- (void)setPhoneme_sequence:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)prompts
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prompts"];
}

- (void)setPrompts:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)replacement
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"replacement"];
}

- (void)setReplacement:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)neural_phoneme_sequence
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
}

- (void)setNeural_phoneme_sequence:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end