@interface FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan
- (FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan)init;
- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range)source_range;
- (NSArray)alternatives;
- (NSArray)projection_ranges;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlternatives:(id)a3;
- (void)setProjection_ranges:(id)a3;
- (void)setSource_range:(id)a3;
@end

@implementation FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan

- (FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan;
  v2 = [(FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan *)&v6 init];
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

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range)source_range
{
  return (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"source_range"];
}

- (void)setSource_range:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)projection_ranges
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"projection_ranges"];
}

- (void)setProjection_ranges:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)alternatives
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"alternatives"];
}

- (void)setAlternatives:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end