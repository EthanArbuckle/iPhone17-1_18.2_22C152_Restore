@interface W5DiagnosticsModePeer
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)info;
- (W5DiagnosticsModePeer)initWithCoder:(id)a3;
- (W5DiagnosticsModePeer)initWithRole:(int64_t)a3 peer:(id)a4;
- (W5DiagnosticsModePeer)initWithRole:(int64_t)a3 peer:(id)a4 info:(id)a5;
- (W5Peer)peer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)role;
- (void)encodeWithCoder:(id)a3;
- (void)setInfo:(id)a3;
- (void)setPeer:(id)a3;
- (void)setRole:(int64_t)a3;
@end

@implementation W5DiagnosticsModePeer

- (W5DiagnosticsModePeer)initWithRole:(int64_t)a3 peer:(id)a4
{
  return [(W5DiagnosticsModePeer *)self initWithRole:a3 peer:a4 info:0];
}

- (W5DiagnosticsModePeer)initWithRole:(int64_t)a3 peer:(id)a4 info:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)W5DiagnosticsModePeer;
  v11 = [(W5DiagnosticsModePeer *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_role = a3;
    objc_storeStrong((id *)&v11->_peer, a4);
    v13 = (NSMutableDictionary *)v10;
    p_super = &v12->_info->super.super;
    v12->_info = v13;
  }
  else
  {
    p_super = W5GetOSLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      v18 = "-[W5DiagnosticsModePeer initWithRole:peer:info:]";
      __int16 v19 = 2080;
      v20 = "W5DiagnosticsModePeer.m";
      __int16 v21 = 1024;
      int v22 = 37;
      _os_log_send_and_compose_impl();
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5DiagnosticsModePeer allocWithZone:a3] init];
  [(W5DiagnosticsModePeer *)v4 setRole:[(W5DiagnosticsModePeer *)self role]];
  v5 = [(W5DiagnosticsModePeer *)self peer];
  [(W5DiagnosticsModePeer *)v4 setPeer:v5];

  v6 = [(W5DiagnosticsModePeer *)self info];
  [(W5DiagnosticsModePeer *)v4 setInfo:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t role = self->_role;
  id v5 = a3;
  [v5 encodeInteger:role forKey:@"_role"];
  [v5 encodeObject:self->_peer forKey:@"_peer"];
  [v5 encodeObject:self->_info forKey:@"_info"];
}

- (W5DiagnosticsModePeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)W5DiagnosticsModePeer;
  id v5 = [(W5DiagnosticsModePeer *)&v22 init];
  if (v5)
  {
    v5->_int64_t role = [v4 decodeIntegerForKey:@"_role"];
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_peer"];
    peer = v5->_peer;
    v5->_peer = (W5Peer *)v7;

    __int16 v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    int v17 = objc_msgSend(v21, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_info"];
    info = v5->_info;
    v5->_info = (NSMutableDictionary *)v18;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = W5DescriptionForDiagnosticsRole(self->_role);
  id v5 = [v3 stringWithFormat:@"Diagnostics Mode Peer role='%@ (%ld)' with peer='%@' info='%@'", v4, self->_role, self->_peer, self->_info];

  return v5;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_int64_t role = a3;
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (NSMutableDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

@end