@interface QSSMutableSetEndpointerState
- (BOOL)enable_server_side_endpoint;
- (QSSMutableSetEndpointerState)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEnable_server_side_endpoint:(BOOL)a3;
@end

@implementation QSSMutableSetEndpointerState

- (void)setEnable_server_side_endpoint:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)enable_server_side_endpoint
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_server_side_endpoint"];
  char v3 = [v2 BOOLValue];

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

- (QSSMutableSetEndpointerState)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableSetEndpointerState;
  v2 = [(QSSMutableSetEndpointerState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end