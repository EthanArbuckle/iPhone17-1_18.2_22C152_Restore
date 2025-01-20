@interface FTMutableTranslationResponse_TranslationPhrase
- (BOOL)low_confidence;
- (FTMutableTranslationResponse_TranslationPhrase)init;
- (FTTranslationPhraseMetaInfo)meta_info_data;
- (NSArray)spans;
- (NSArray)translated_tokens;
- (NSString)meta_info;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConfidence:(float)a3;
- (void)setLow_confidence:(BOOL)a3;
- (void)setMeta_info:(id)a3;
- (void)setMeta_info_data:(id)a3;
- (void)setSpans:(id)a3;
- (void)setTranslated_tokens:(id)a3;
@end

@implementation FTMutableTranslationResponse_TranslationPhrase

- (FTMutableTranslationResponse_TranslationPhrase)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTranslationResponse_TranslationPhrase;
  v2 = [(FTMutableTranslationResponse_TranslationPhrase *)&v6 init];
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

- (NSArray)translated_tokens
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translated_tokens"];
}

- (void)setTranslated_tokens:(id)a3
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

- (NSArray)spans
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"spans"];
}

- (void)setSpans:(id)a3
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

- (FTTranslationPhraseMetaInfo)meta_info_data
{
  return (FTTranslationPhraseMetaInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info_data"];
}

- (void)setMeta_info_data:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end