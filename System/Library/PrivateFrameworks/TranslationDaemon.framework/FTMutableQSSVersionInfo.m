@interface FTMutableQSSVersionInfo
- (FTMutableQSSVersionInfo)init;
- (NSString)qss_version_brane;
- (NSString)qss_version_server;
- (NSString)qss_version_serverkit;
- (NSString)qss_version_siritts;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setQss_version_brane:(id)a3;
- (void)setQss_version_server:(id)a3;
- (void)setQss_version_serverkit:(id)a3;
- (void)setQss_version_siritts:(id)a3;
@end

@implementation FTMutableQSSVersionInfo

- (FTMutableQSSVersionInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableQSSVersionInfo;
  v2 = [(FTMutableQSSVersionInfo *)&v6 init];
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

- (NSString)qss_version_server
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"qss_version_server"];
}

- (void)setQss_version_server:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)qss_version_brane
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"qss_version_brane"];
}

- (void)setQss_version_brane:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)qss_version_serverkit
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"qss_version_serverkit"];
}

- (void)setQss_version_serverkit:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)qss_version_siritts
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"qss_version_siritts"];
}

- (void)setQss_version_siritts:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end