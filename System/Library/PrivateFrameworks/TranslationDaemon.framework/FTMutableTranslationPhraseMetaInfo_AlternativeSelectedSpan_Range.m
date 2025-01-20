@interface FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range
- (FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)length;
- (int)start;
- (void)setLength:(int)a3;
- (void)setStart:(int)a3;
@end

@implementation FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range

- (FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range;
  v2 = [(FTMutableTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *)&v6 init];
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

- (int)start
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"start"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setStart:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)length
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"length"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setLength:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end