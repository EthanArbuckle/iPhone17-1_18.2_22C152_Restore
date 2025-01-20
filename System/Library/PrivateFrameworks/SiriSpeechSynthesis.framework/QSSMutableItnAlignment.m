@interface QSSMutableItnAlignment
- (QSSMutableItnAlignment)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)first_post_itn_char_pos;
- (int)first_pre_itn_token_index;
- (int)last_post_itn_char_pos;
- (int)last_pre_itn_token_index;
- (void)setFirst_post_itn_char_pos:(int)a3;
- (void)setFirst_pre_itn_token_index:(int)a3;
- (void)setLast_post_itn_char_pos:(int)a3;
- (void)setLast_pre_itn_token_index:(int)a3;
@end

@implementation QSSMutableItnAlignment

- (void)setLast_post_itn_char_pos:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)last_post_itn_char_pos
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"last_post_itn_char_pos"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setFirst_post_itn_char_pos:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)first_post_itn_char_pos
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"first_post_itn_char_pos"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setLast_pre_itn_token_index:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)last_pre_itn_token_index
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"last_pre_itn_token_index"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setFirst_pre_itn_token_index:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)first_pre_itn_token_index
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"first_pre_itn_token_index"];
  int v3 = [v2 intValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableItnAlignment)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableItnAlignment;
  v2 = [(QSSMutableItnAlignment *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end