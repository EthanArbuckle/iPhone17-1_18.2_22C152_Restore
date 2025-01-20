@interface QSSMutableServiceDiscoveryRequest
- (NSString)app_id;
- (NSString)session_id;
- (NSString)zk_path;
- (QSSMutableServiceDiscoveryRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setApp_id:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setZk_path:(id)a3;
@end

@implementation QSSMutableServiceDiscoveryRequest

- (void)setZk_path:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)zk_path
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"zk_path"];
}

- (void)setApp_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)app_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"app_id"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableServiceDiscoveryRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableServiceDiscoveryRequest;
  v2 = [(QSSMutableServiceDiscoveryRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end