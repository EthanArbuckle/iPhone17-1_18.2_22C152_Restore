@interface NPTunnelTuscanyEndpoint
+ (BOOL)supportsResolverCallback;
+ (BOOL)supportsSecureCoding;
+ (id)encodeHosts:(id)a3;
+ (unsigned)endpointType;
- (NPTunnelTuscanyEndpoint)initWithCoder:(id)a3;
- (NPTunnelTuscanyEndpoint)initWithEncodedData:(id)a3;
- (NPTunnelTuscanyEndpoint)initWithHosts:(id)a3;
- (NSArray)hosts;
- (NSData)hostsData;
- (id)copyHostsWithPort:(id)a3;
- (id)description;
- (id)encodedData;
- (void)encodeWithCoder:(id)a3;
- (void)resolveEndpointWithCompletionHandler:(id)a3;
@end

@implementation NPTunnelTuscanyEndpoint

+ (unsigned)endpointType
{
  return 2000;
}

- (NPTunnelTuscanyEndpoint)initWithHosts:(id)a3
{
  id v5 = a3;
  v6 = +[NPTunnelTuscanyEndpoint encodeHosts:v5];
  if ([v6 length])
  {
    v11.receiver = self;
    v11.super_class = (Class)NPTunnelTuscanyEndpoint;
    v7 = [(NWEndpoint *)&v11 initWithEncodedData:v6];
    p_isa = (id *)&v7->super.super.isa;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_hosts, a3);
      objc_storeStrong(p_isa + 3, v6);
    }
    self = p_isa;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NPTunnelTuscanyEndpoint)initWithEncodedData:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NPTunnelTuscanyEndpoint;
  id v5 = [(NWEndpoint *)&v24 initWithEncodedData:v4];
  if (!v5) {
    goto LABEL_29;
  }
  if (![v4 length])
  {
    v9 = 0;
LABEL_31:

    v22 = 0;
    goto LABEL_32;
  }
  id v6 = v4;
  v7 = (unsigned __int8 *)[v6 bytes];
  uint64_t v8 = [v6 length];
  v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8 >= 1)
  {
    v10 = &v7[v8];
    do
    {
      unint64_t v11 = v10 - v7;
      unint64_t v12 = *v7;
      if (*v7) {
        BOOL v13 = v11 >= 0x10;
      }
      else {
        BOOL v13 = 0;
      }
      if (!v13 || v11 < v12) {
        break;
      }
      int v15 = v7[1];
      if (v15 == 30)
      {
        if (v12 < 0x1C || v11 < 0x1C) {
          break;
        }
      }
      else if (v15 != 2 || v12 < 0x10)
      {
        break;
      }
      v18 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v7];
      if (v18) {
        [(NSArray *)v9 addObject:v18];
      }
      uint64_t v19 = *v7;

      v7 += v19;
    }
    while (v7 < v10);
  }
  if (![(NSArray *)v9 count]) {
    goto LABEL_31;
  }
  hosts = v5->_hosts;
  v5->_hosts = v9;
  v21 = v9;

  objc_storeStrong((id *)&v5->_hostsData, v6);
LABEL_29:
  v22 = v5;
LABEL_32:

  return v22;
}

- (id)encodedData
{
  return self->_hostsData;
}

+ (id)encodeHosts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v11 = objc_msgSend(v10, "addressData", (void)v14);
          [v4 appendData:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([v4 length]) {
    id v12 = v4;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"( ");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NPTunnelTuscanyEndpoint *)self hosts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@ ", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@""]);
  return v3;
}

+ (BOOL)supportsResolverCallback
{
  return 1;
}

- (void)resolveEndpointWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, uint64_t))a3;
  uint64_t v5 = nplog_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    uint64_t v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = [(NPTunnelTuscanyEndpoint *)self hosts];
      int v10 = 138412290;
      long long v11 = v9;
      _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Tuscany endpoint resolve custom endpoint %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v8 = [(NPTunnelTuscanyEndpoint *)self hosts];
  v4[2](v4, v8, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTunnelTuscanyEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EncodedData"];

  BOOL v6 = [(NPTunnelTuscanyEndpoint *)self initWithEncodedData:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyHostsWithPort:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = self;
  uint64_t v5 = [(NPTunnelTuscanyEndpoint *)self hosts];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F38BC8];
          long long v13 = [v11 hostname];
          long long v14 = [v12 endpointWithHostname:v13 port:v4];

          if (!v8)
          {
            id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
            long long v16 = [(NPTunnelTuscanyEndpoint *)v19 hosts];
            uint64_t v8 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));
          }
          [v8 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v8];
  return v17;
}

- (NSArray)hosts
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)hostsData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostsData, 0);
  objc_storeStrong((id *)&self->_hosts, 0);
}

@end