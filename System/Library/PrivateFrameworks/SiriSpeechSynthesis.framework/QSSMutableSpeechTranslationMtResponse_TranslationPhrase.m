@interface QSSMutableSpeechTranslationMtResponse_TranslationPhrase
- (BOOL)low_confidence;
- (NSString)meta_info;
- (NSString)translation_phrase;
- (QSSMutableSpeechTranslationMtResponse_TranslationPhrase)init;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConfidence:(float)a3;
- (void)setLow_confidence:(BOOL)a3;
- (void)setMeta_info:(id)a3;
- (void)setTranslation_phrase:(id)a3;
@end

@implementation QSSMutableSpeechTranslationMtResponse_TranslationPhrase

- (void)setLow_confidence:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)low_confidence
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"low_confidence"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setMeta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)meta_info
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info"];
}

- (void)setTranslation_phrase:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)translation_phrase
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translation_phrase"];
}

- (void)setConfidence:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)confidence
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"confidence"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  double v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableSpeechTranslationMtResponse_TranslationPhrase)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableSpeechTranslationMtResponse_TranslationPhrase;
  v2 = [(QSSMutableSpeechTranslationMtResponse_TranslationPhrase *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end