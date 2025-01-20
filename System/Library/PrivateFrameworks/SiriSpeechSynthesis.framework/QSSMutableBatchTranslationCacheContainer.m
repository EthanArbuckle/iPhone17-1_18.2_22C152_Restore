@interface QSSMutableBatchTranslationCacheContainer
- (NSArray)spans;
- (NSString)request_id;
- (NSString)translated_text;
- (QSSMutableBatchTranslationCacheContainer)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)sentence_count;
- (void)setRequest_id:(id)a3;
- (void)setSentence_count:(int)a3;
- (void)setSpans:(id)a3;
- (void)setTranslated_text:(id)a3;
@end

@implementation QSSMutableBatchTranslationCacheContainer

- (void)setSentence_count:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)sentence_count
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sentence_count"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setSpans:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)spans
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"spans"];
}

- (void)setTranslated_text:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)translated_text
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translated_text"];
}

- (void)setRequest_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableBatchTranslationCacheContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableBatchTranslationCacheContainer;
  v2 = [(QSSMutableBatchTranslationCacheContainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end