@interface QSSMutableTTSPrompts
- (NSArray)prompts;
- (NSData)prompts_v2;
- (QSSMutableTTSPrompts)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)prompts_v2:(id)a3;
- (void)setPrompts:(id)a3;
- (void)setPrompts_v2:(id)a3;
@end

@implementation QSSMutableTTSPrompts

- (void)prompts_v2:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(QSSMutableTTSPrompts *)self prompts_v2];
  uint64_t v5 = [v4 bytes];
  v6 = [(QSSMutableTTSPrompts *)self prompts_v2];
  v7[2](v7, v5, [v6 length]);
}

- (void)setPrompts_v2:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)prompts_v2
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prompts_v2"];
}

- (void)setPrompts:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)prompts
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prompts"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTTSPrompts)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTTSPrompts;
  v2 = [(QSSMutableTTSPrompts *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end