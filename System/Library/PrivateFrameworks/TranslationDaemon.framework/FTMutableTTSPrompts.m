@interface FTMutableTTSPrompts
- (FTMutableTTSPrompts)init;
- (NSArray)prompts;
- (NSData)prompts_v2;
- (id)copyWithZone:(_NSZone *)a3;
- (void)prompts_v2:(id)a3;
- (void)setPrompts:(id)a3;
- (void)setPrompts_v2:(id)a3;
@end

@implementation FTMutableTTSPrompts

- (FTMutableTTSPrompts)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTTSPrompts;
  v2 = [(FTMutableTTSPrompts *)&v6 init];
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

- (NSArray)prompts
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prompts"];
}

- (void)setPrompts:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)prompts_v2
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prompts_v2"];
}

- (void)setPrompts_v2:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (void)prompts_v2:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(FTMutableTTSPrompts *)self prompts_v2];
  uint64_t v5 = [v4 bytes];
  objc_super v6 = [(FTMutableTTSPrompts *)self prompts_v2];
  v7[2](v7, v5, [v6 length]);
}

@end