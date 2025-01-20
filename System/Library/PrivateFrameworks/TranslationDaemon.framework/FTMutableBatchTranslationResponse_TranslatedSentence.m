@interface FTMutableBatchTranslationResponse_TranslatedSentence
- (BOOL)contains_masked_profanity;
- (FTMutableBatchTranslationResponse_TranslatedSentence)init;
- (FTSpan)source_span;
- (FTSpan)target_span;
- (NSArray)alternative_descriptions;
- (NSArray)n_best_choices;
- (NSString)engine_input;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlternative_descriptions:(id)a3;
- (void)setContains_masked_profanity:(BOOL)a3;
- (void)setEngine_input:(id)a3;
- (void)setN_best_choices:(id)a3;
- (void)setSource_span:(id)a3;
- (void)setTarget_span:(id)a3;
@end

@implementation FTMutableBatchTranslationResponse_TranslatedSentence

- (FTMutableBatchTranslationResponse_TranslatedSentence)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableBatchTranslationResponse_TranslatedSentence;
  v2 = [(FTMutableBatchTranslationResponse_TranslatedSentence *)&v6 init];
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

- (FTSpan)source_span
{
  return (FTSpan *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"source_span"];
}

- (void)setSource_span:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)engine_input
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"engine_input"];
}

- (void)setEngine_input:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTSpan)target_span
{
  return (FTSpan *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"target_span"];
}

- (void)setTarget_span:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)n_best_choices
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"n_best_choices"];
}

- (void)setN_best_choices:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)alternative_descriptions
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"alternative_descriptions"];
}

- (void)setAlternative_descriptions:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)contains_masked_profanity
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"contains_masked_profanity"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setContains_masked_profanity:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end