@interface FTMutableBatchTranslationResponse_TranslationPhrase
- (BOOL)contains_masked_profanity;
- (BOOL)low_confidence;
- (FTMutableBatchTranslationResponse_TranslationPhrase)init;
- (FTTranslationPhraseMetaInfo)meta_info_data;
- (NSArray)repeated_spans;
- (NSString)meta_info;
- (NSString)translation_phrase;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConfidence:(float)a3;
- (void)setContains_masked_profanity:(BOOL)a3;
- (void)setLow_confidence:(BOOL)a3;
- (void)setMeta_info:(id)a3;
- (void)setMeta_info_data:(id)a3;
- (void)setRepeated_spans:(id)a3;
- (void)setTranslation_phrase:(id)a3;
@end

@implementation FTMutableBatchTranslationResponse_TranslationPhrase

- (FTMutableBatchTranslationResponse_TranslationPhrase)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableBatchTranslationResponse_TranslationPhrase;
  v2 = [(FTMutableBatchTranslationResponse_TranslationPhrase *)&v6 init];
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

- (float)confidence
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"confidence"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setConfidence:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)translation_phrase
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translation_phrase"];
}

- (void)setTranslation_phrase:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)meta_info
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info"];
}

- (void)setMeta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)low_confidence
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"low_confidence"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setLow_confidence:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)repeated_spans
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"repeated_spans"];
}

- (void)setRepeated_spans:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTranslationPhraseMetaInfo)meta_info_data
{
  return (FTTranslationPhraseMetaInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info_data"];
}

- (void)setMeta_info_data:(id)a3
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