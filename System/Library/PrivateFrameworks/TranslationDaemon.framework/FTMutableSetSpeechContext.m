@interface FTMutableSetSpeechContext
- (FTMutableSetSpeechContext)init;
- (NSArray)context_with_pron_hints;
- (NSArray)contextual_text;
- (NSString)left_context;
- (NSString)right_context;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContext_with_pron_hints:(id)a3;
- (void)setContextual_text:(id)a3;
- (void)setLeft_context:(id)a3;
- (void)setRight_context:(id)a3;
@end

@implementation FTMutableSetSpeechContext

- (FTMutableSetSpeechContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableSetSpeechContext;
  v2 = [(FTMutableSetSpeechContext *)&v6 init];
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

- (NSArray)contextual_text
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"contextual_text"];
}

- (void)setContextual_text:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)left_context
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"left_context"];
}

- (void)setLeft_context:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)right_context
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"right_context"];
}

- (void)setRight_context:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)context_with_pron_hints
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"context_with_pron_hints"];
}

- (void)setContext_with_pron_hints:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end