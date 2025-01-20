@interface FTMutableBatchTranslationCacheContainer
- (BOOL)contains_masked_profanity;
- (FTMutableBatchTranslationCacheContainer)init;
- (NSArray)spans;
- (NSString)request_id;
- (NSString)translated_text;
- (NSString)translated_text_romanized;
- (id)copyWithZone:(_NSZone *)a3;
- (int)sentence_count;
- (void)setContains_masked_profanity:(BOOL)a3;
- (void)setRequest_id:(id)a3;
- (void)setSentence_count:(int)a3;
- (void)setSpans:(id)a3;
- (void)setTranslated_text:(id)a3;
- (void)setTranslated_text_romanized:(id)a3;
@end

@implementation FTMutableBatchTranslationCacheContainer

- (FTMutableBatchTranslationCacheContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableBatchTranslationCacheContainer;
  v2 = [(FTMutableBatchTranslationCacheContainer *)&v6 init];
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

- (NSString)request_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_id"];
}

- (void)setRequest_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)translated_text
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translated_text"];
}

- (void)setTranslated_text:(id)a3
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

- (int)sentence_count
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sentence_count"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setSentence_count:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)translated_text_romanized
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translated_text_romanized"];
}

- (void)setTranslated_text_romanized:(id)a3
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