@interface QSSMutableBatchTranslationResponse_TranslatedSentence
- (NSArray)n_best_choices;
- (NSString)engine_input;
- (QSSMutableBatchTranslationResponse_TranslatedSentence)init;
- (QSSSpan)source_span;
- (QSSSpan)target_span;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEngine_input:(id)a3;
- (void)setN_best_choices:(id)a3;
- (void)setSource_span:(id)a3;
- (void)setTarget_span:(id)a3;
@end

@implementation QSSMutableBatchTranslationResponse_TranslatedSentence

- (void)setN_best_choices:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)n_best_choices
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"n_best_choices"];
}

- (void)setTarget_span:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSSpan)target_span
{
  return (QSSSpan *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"target_span"];
}

- (void)setEngine_input:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)engine_input
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"engine_input"];
}

- (void)setSource_span:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSSpan)source_span
{
  return (QSSSpan *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"source_span"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableBatchTranslationResponse_TranslatedSentence)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableBatchTranslationResponse_TranslatedSentence;
  v2 = [(QSSMutableBatchTranslationResponse_TranslatedSentence *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end