@interface QSSMutableRecognitionSausage
- (NSArray)positional_tok_phrase_alt;
- (QSSMutableRecognitionSausage)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPositional_tok_phrase_alt:(id)a3;
@end

@implementation QSSMutableRecognitionSausage

- (void)setPositional_tok_phrase_alt:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)positional_tok_phrase_alt
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"positional_tok_phrase_alt"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableRecognitionSausage)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableRecognitionSausage;
  v2 = [(QSSMutableRecognitionSausage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end