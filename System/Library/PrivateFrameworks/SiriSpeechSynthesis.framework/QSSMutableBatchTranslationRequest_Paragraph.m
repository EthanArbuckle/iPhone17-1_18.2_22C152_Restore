@interface QSSMutableBatchTranslationRequest_Paragraph
- (NSArray)span;
- (NSString)paragraph_id;
- (NSString)text;
- (QSSMutableBatchTranslationRequest_Paragraph)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setParagraph_id:(id)a3;
- (void)setSpan:(id)a3;
- (void)setText:(id)a3;
@end

@implementation QSSMutableBatchTranslationRequest_Paragraph

- (void)setSpan:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)span
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"span"];
}

- (void)setText:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)text
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text"];
}

- (void)setParagraph_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)paragraph_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"paragraph_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableBatchTranslationRequest_Paragraph)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableBatchTranslationRequest_Paragraph;
  v2 = [(QSSMutableBatchTranslationRequest_Paragraph *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end