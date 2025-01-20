@interface QSSMutableSpan
- (BOOL)do_not_translate;
- (NSString)meta_info;
- (QSSMutableSpan)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)end_index;
- (int)start_index;
- (void)setDo_not_translate:(BOOL)a3;
- (void)setEnd_index:(int)a3;
- (void)setMeta_info:(id)a3;
- (void)setStart_index:(int)a3;
@end

@implementation QSSMutableSpan

- (void)setMeta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)meta_info
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info"];
}

- (void)setDo_not_translate:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)do_not_translate
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"do_not_translate"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEnd_index:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)end_index
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"end_index"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setStart_index:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)start_index
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"start_index"];
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

- (QSSMutableSpan)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableSpan;
  v2 = [(QSSMutableSpan *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end