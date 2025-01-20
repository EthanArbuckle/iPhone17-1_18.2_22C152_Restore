@interface W5DiagnosticsMode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDiagnosticsMode:(id)a3;
- (NSArray)peers;
- (NSDictionary)info;
- (NSMutableDictionary)timestamps;
- (NSUUID)uuid;
- (W5DiagnosticsMode)initWithCoder:(id)a3;
- (W5DiagnosticsMode)initWithConfiguration:(id)a3;
- (W5DiagnosticsMode)initWithConfiguration:(id)a3 uuid:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)timestampFor:(int64_t)a3;
- (int64_t)compareCollectionTimeLatestFirst:(id)a3;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInfo:(id)a3;
- (void)setPeers:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTimestamps:(id)a3;
- (void)setUuid:(id)a3;
- (void)updatePeer:(id)a3;
@end

@implementation W5DiagnosticsMode

- (W5DiagnosticsMode)initWithConfiguration:(id)a3
{
  return [(W5DiagnosticsMode *)self initWithConfiguration:a3 uuid:0];
}

- (W5DiagnosticsMode)initWithConfiguration:(id)a3 uuid:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)W5DiagnosticsMode;
  v8 = [(W5DiagnosticsMode *)&v22 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"Peers"];
    if (v9)
    {
      v10 = v9;
      objc_storeStrong((id *)&v8->_peers, v9);
      v11 = (void *)[v6 mutableCopy];
      [v11 removeObjectForKey:@"Peers"];
      objc_storeStrong((id *)&v8->_info, v11);
      if (v7)
      {
        v12 = (NSUUID *)v7;
        p_super = &v8->_uuid->super;
        v8->_uuid = v12;
      }
      else
      {
        uint64_t v14 = [MEMORY[0x263F08C38] UUID];
        uuid = v8->_uuid;
        v8->_uuid = (NSUUID *)v14;

        p_super = W5GetOSLog();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          v16 = [(W5DiagnosticsMode *)v8 uuid];
          int v23 = 136316162;
          v24 = "-[W5DiagnosticsMode initWithConfiguration:uuid:]";
          __int16 v25 = 2080;
          v26 = "W5DiagnosticsMode.m";
          __int16 v27 = 1024;
          int v28 = 44;
          __int16 v29 = 2114;
          id v30 = v16;
          __int16 v31 = 2114;
          id v32 = v6;
          _os_log_send_and_compose_impl();
        }
      }

      uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
      v18 = &v8->_timestamps->super.super;
      v8->_timestamps = (NSMutableDictionary *)v17;
      goto LABEL_8;
    }
    v21 = W5GetOSLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315906;
      v24 = "-[W5DiagnosticsMode initWithConfiguration:uuid:]";
      __int16 v25 = 2080;
      v26 = "W5DiagnosticsMode.m";
      __int16 v27 = 1024;
      int v28 = 34;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_send_and_compose_impl();
    }
  }
  v18 = W5GetOSLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315650;
    v24 = "-[W5DiagnosticsMode initWithConfiguration:uuid:]";
    __int16 v25 = 2080;
    v26 = "W5DiagnosticsMode.m";
    __int16 v27 = 1024;
    int v28 = 55;
    _os_log_send_and_compose_impl();
  }
  v10 = 0;
  v11 = 0;
  v8 = 0;
LABEL_8:

  v19 = v8;
  return v19;
}

- (void)updatePeer:(id)a3
{
  id v4 = a3;
  v5 = [(W5DiagnosticsMode *)self peers];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = W5GetOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(W5DiagnosticsMode *)self peers];
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    v8 = [(W5DiagnosticsMode *)self peers];
    v9 = (void *)[v8 mutableCopy];

    [v9 replaceObjectAtIndex:v6 withObject:v4];
    [(W5DiagnosticsMode *)self setPeers:v9];
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    timestamps = self->_timestamps;
    id v6 = [MEMORY[0x263EFF910] date];
    v5 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)timestamps setObject:v6 forKey:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[W5DiagnosticsMode allocWithZone:a3] init];
  [(W5DiagnosticsMode *)v4 setState:[(W5DiagnosticsMode *)self state]];
  v5 = [(W5DiagnosticsMode *)self peers];
  [(W5DiagnosticsMode *)v4 setPeers:v5];

  id v6 = [(W5DiagnosticsMode *)self uuid];
  [(W5DiagnosticsMode *)v4 setUuid:v6];

  id v7 = [(W5DiagnosticsMode *)self info];
  [(W5DiagnosticsMode *)v4 setInfo:v7];

  v8 = [(W5DiagnosticsMode *)self timestamps];
  [(W5DiagnosticsMode *)v4 setTimestamps:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"_state"];
  [v5 encodeObject:self->_peers forKey:@"_peers"];
  [v5 encodeObject:self->_uuid forKey:@"_uuid"];
  [v5 encodeObject:self->_info forKey:@"_info"];
  [v5 encodeObject:self->_timestamps forKey:@"_timestamps"];
}

- (W5DiagnosticsMode)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)W5DiagnosticsMode;
  id v5 = [(W5DiagnosticsMode *)&v33 init];
  if (v5)
  {
    v5->_int64_t state = [v4 decodeIntegerForKey:@"_state"];
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_peers"];
    peers = v5->_peers;
    v5->_peers = (NSArray *)v9;

    v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v12;

    id v32 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    objc_super v22 = objc_msgSend(v32, "setWithObjects:", v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"_info"];
    info = v5->_info;
    v5->_info = (NSDictionary *)v23;

    __int16 v25 = (void *)MEMORY[0x263EFFA08];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    int v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"_timestamps"];
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSMutableDictionary *)v29;
  }
  return v5;
}

- (id)description
{
  v2 = self;
  uint64_t v50 = *MEMORY[0x263EF8340];
  v3 = (void *)[(NSDictionary *)self->_info mutableCopy];
  id v4 = [v3 objectForKey:@"Faults"];

  v37 = v2;
  if (v4)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v6 = [v3 objectForKeyedSubscript:@"Faults"];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v45 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v12 = NSString;
          v13 = W5DescriptionForDiagnosticsFaultType([v11 integerValue]);
          uint64_t v14 = [v12 stringWithFormat:@"%@ (%@)", v13, v11];

          [v5 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v8);
    }

    uint64_t v15 = [v5 componentsJoinedByString:@","];
    [v3 setObject:v15 forKeyedSubscript:@"Faults"];

    v2 = v37;
  }
  uint64_t v16 = [v3 objectForKey:@"DetectedFaults"];

  if (v16)
  {
    uint64_t v17 = [MEMORY[0x263EFF980] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v18 = [v3 objectForKeyedSubscript:@"DetectedFaults"];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          v24 = NSString;
          __int16 v25 = W5DescriptionForDiagnosticsFaultType([v23 integerValue]);
          uint64_t v26 = [v24 stringWithFormat:@"%@ (%@)", v25, v23];

          [v17 addObject:v26];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v20);
    }

    uint64_t v27 = [v17 componentsJoinedByString:@","];
    [v3 setObject:v27 forKeyedSubscript:@"DetectedFaults"];

    v2 = v37;
  }
  int v28 = (void *)MEMORY[0x263F089D8];
  uuid = v2->_uuid;
  id v30 = W5DescriptionForDiagnosticsState(v2->_state);
  __int16 v31 = [v28 stringWithFormat:@"Diagnostics Mode UUID='%@' State='%@ (%ld)' with peers='%@' info='%@'", uuid, v30, v2->_state, v2->_peers, v3];

  if ([(NSMutableDictionary *)v2->_timestamps count])
  {
    id v32 = [MEMORY[0x263EFF9A0] dictionary];
    timestamps = v2->_timestamps;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __32__W5DiagnosticsMode_description__block_invoke;
    v38[3] = &unk_2641FDB60;
    id v39 = v32;
    id v34 = v32;
    [(NSMutableDictionary *)timestamps enumerateKeysAndObjectsUsingBlock:v38];
    v35 = [NSString stringWithFormat:@" timestamps='%@'", v34];
    [v31 appendString:v35];
  }
  return v31;
}

void __32__W5DiagnosticsMode_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  W5NSDateToISO8601Description(a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(a1 + 32);
  unint64_t v7 = [v5 integerValue];

  uint64_t v8 = W5DescriptionForDiagnosticsState(v7);
  [v6 setObject:v9 forKeyedSubscript:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (W5DiagnosticsMode *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(W5DiagnosticsMode *)self isEqualToDiagnosticsMode:v5];

  return v6;
}

- (BOOL)isEqualToDiagnosticsMode:(id)a3
{
  id v4 = a3;
  id v5 = [(W5DiagnosticsMode *)self uuid];
  BOOL v6 = [v4 uuid];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(W5DiagnosticsMode *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)compareCollectionTimeLatestFirst:(id)a3
{
  id v4 = a3;
  id v5 = [(W5DiagnosticsMode *)self timestamps];
  BOOL v6 = [v5 objectForKey:&unk_26C509FB0];

  unint64_t v7 = [v4 timestamps];

  uint64_t v8 = [v7 objectForKey:&unk_26C509FB0];

  int64_t v9 = 0;
  if (v6 && v8) {
    int64_t v9 = [v8 compare:v6];
  }

  return v9;
}

- (id)timestampFor:(int64_t)a3
{
  id v5 = [(W5DiagnosticsMode *)self timestamps];

  if (v5)
  {
    BOOL v6 = [(W5DiagnosticsMode *)self timestamps];
    unint64_t v7 = [NSNumber numberWithInteger:a3];
    uint64_t v8 = [v6 objectForKey:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (NSArray)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSMutableDictionary)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end