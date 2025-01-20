@interface W5PeerDiscoveryEvent
+ (BOOL)supportsSecureCoding;
- (NSArray)peersFound;
- (NSArray)peersLost;
- (NSDictionary)info;
- (W5PeerDiscoveryEvent)initWithCoder:(id)a3;
- (W5PeerDiscoveryEvent)initWithPeersFound:(id)a3 peersLost:(id)a4 info:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInfo:(id)a3;
- (void)setPeersFound:(id)a3;
- (void)setPeersLost:(id)a3;
@end

@implementation W5PeerDiscoveryEvent

- (W5PeerDiscoveryEvent)initWithPeersFound:(id)a3 peersLost:(id)a4 info:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)W5PeerDiscoveryEvent;
  v12 = [(W5PeerDiscoveryEvent *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_peersFound, a3);
    objc_storeStrong((id *)&v13->_peersLost, a4);
    v14 = (NSDictionary *)v11;
    p_super = &v13->_info->super;
    v13->_info = v14;
  }
  else
  {
    p_super = W5GetOSLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      v19 = "-[W5PeerDiscoveryEvent initWithPeersFound:peersLost:info:]";
      __int16 v20 = 2080;
      v21 = "W5PeerDiscoveryEvent.m";
      __int16 v22 = 1024;
      int v23 = 33;
      _os_log_send_and_compose_impl();
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5PeerDiscoveryEvent allocWithZone:a3] init];
  v5 = [(W5PeerDiscoveryEvent *)self peersFound];
  [(W5PeerDiscoveryEvent *)v4 setPeersFound:v5];

  v6 = [(W5PeerDiscoveryEvent *)self peersLost];
  [(W5PeerDiscoveryEvent *)v4 setPeersLost:v6];

  v7 = [(W5PeerDiscoveryEvent *)self info];
  [(W5PeerDiscoveryEvent *)v4 setInfo:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  peersFound = self->_peersFound;
  id v5 = a3;
  [v5 encodeObject:peersFound forKey:@"_peersFound"];
  [v5 encodeObject:self->_peersLost forKey:@"_peersLost"];
  [v5 encodeObject:self->_info forKey:@"_info"];
}

- (W5PeerDiscoveryEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)W5PeerDiscoveryEvent;
  id v5 = [(W5PeerDiscoveryEvent *)&v27 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_peersFound"];
    peersFound = v5->_peersFound;
    v5->_peersFound = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_peersLost"];
    peersLost = v5->_peersLost;
    v5->_peersLost = (NSArray *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    int v23 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"_info"];
    info = v5->_info;
    v5->_info = (NSDictionary *)v24;
  }
  return v5;
}

- (NSArray)peersFound
{
  return self->_peersFound;
}

- (void)setPeersFound:(id)a3
{
}

- (NSArray)peersLost
{
  return self->_peersLost;
}

- (void)setPeersLost:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_peersLost, 0);
  objc_storeStrong((id *)&self->_peersFound, 0);
}

@end