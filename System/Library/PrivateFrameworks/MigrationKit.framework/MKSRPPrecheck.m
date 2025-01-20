@interface MKSRPPrecheck
- (MKSRPPrecheck)initWithPassword:(id)a3;
- (NSString)password;
- (id)serverForKey:(id)a3;
- (void)removeServerForKey:(id)a3;
- (void)setPassword:(id)a3;
- (void)setServerForKey:(id)a3;
@end

@implementation MKSRPPrecheck

- (MKSRPPrecheck)initWithPassword:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKSRPPrecheck;
  v5 = [(MKSRPPrecheck *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(MKSRPPrecheck *)v5 setPassword:v4];
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    servers = v6->_servers;
    v6->_servers = v7;
  }
  return v6;
}

- (void)setServerForKey:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [[MKSRPServer alloc] initWithPassword:v4->_password];
  [(NSMutableDictionary *)v4->_servers setObject:v5 forKey:v6];

  objc_sync_exit(v4);
}

- (id)serverForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_servers objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)removeServerForKey:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_servers removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_servers, 0);
}

@end