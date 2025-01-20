@interface WFSettingsIPV4
+ (id)automaticConfig;
+ (id)bootPConfig;
- (NSArray)addresses;
- (NSArray)subnetMasks;
- (NSDictionary)items;
- (NSString)description;
- (NSString)dhcpClientID;
- (NSString)router;
- (WFSettingsIPV4)initWithDictionary:(id)a3;
- (WFSettingsIPV4)initWithMethod:(int64_t)a3 addresses:(id)a4 subnetMasks:(id)a5 router:(id)a6 dhcpClientID:(id)a7;
- (id)protocol;
- (int64_t)method;
- (void)setAddresses:(id)a3;
- (void)setDhcpClientID:(id)a3;
- (void)setItems:(id)a3;
- (void)setMethod:(int64_t)a3;
- (void)setRouter:(id)a3;
- (void)setSubnetMasks:(id)a3;
@end

@implementation WFSettingsIPV4

+ (id)automaticConfig
{
  v2 = [[WFSettingsIPV4 alloc] initWithMethod:1 addresses:0 subnetMasks:0 router:0 dhcpClientID:0];
  return v2;
}

+ (id)bootPConfig
{
  v2 = [[WFSettingsIPV4 alloc] initWithMethod:5 addresses:0 subnetMasks:0 router:0 dhcpClientID:0];
  return v2;
}

- (WFSettingsIPV4)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_17;
  }
  objc_storeStrong((id *)&self->_items, a3);
  v6 = [(NSDictionary *)self->_items objectForKey:*MEMORY[0x263F1BD40]];
  v7 = v6;
  if (!v6)
  {
    v18 = WFLogForCategory(0);
    os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18)
    {
      if (os_log_type_enabled(v18, v20))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_226071000, v18, v20, "Missing kSCPropNetIPv4ConfigMethod in dictionary.", (uint8_t *)&v21, 2u);
      }
      v7 = 0;
    }
LABEL_16:

LABEL_17:
    self = 0;
    goto LABEL_7;
  }
  if (([v6 isEqualToString:*MEMORY[0x263F1BE38]] & 1) == 0
    && ([v7 isEqualToString:*MEMORY[0x263F1BE48]] & 1) == 0)
  {
    if ([v7 isEqualToString:*MEMORY[0x263F1BE60]])
    {
      int64_t v8 = 4;
      goto LABEL_6;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F1BE40]])
    {
      int64_t v8 = 5;
      goto LABEL_6;
    }
    v18 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      int v21 = 138543362;
      v22 = v7;
      _os_log_impl(&dword_226071000, v18, v19, "Unsupported IPv4 config method %{public}@", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_16;
  }
  int64_t v8 = 1;
LABEL_6:
  self->_method = v8;
  v9 = [(NSDictionary *)self->_items objectForKey:*MEMORY[0x263F1BD38]];
  addresses = self->_addresses;
  self->_addresses = v9;

  v11 = [(NSDictionary *)self->_items objectForKey:*MEMORY[0x263F1BD60]];
  subnetMasks = self->_subnetMasks;
  self->_subnetMasks = v11;

  v13 = [(NSDictionary *)self->_items objectForKey:*MEMORY[0x263F1BD58]];
  router = self->_router;
  self->_router = v13;

  v15 = [(NSDictionary *)self->_items objectForKey:*MEMORY[0x263F1BD48]];
  dhcpClientID = self->_dhcpClientID;
  self->_dhcpClientID = v15;

LABEL_7:
  return self;
}

- (WFSettingsIPV4)initWithMethod:(int64_t)a3 addresses:(id)a4 subnetMasks:(id)a5 router:(id)a6 dhcpClientID:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v26 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)WFSettingsIPV4;
  v16 = [(WFSettingsIPV4 *)&v27 init];
  if (v16)
  {
    v17 = (id *)MEMORY[0x263F1BE48];
    switch(a3)
    {
      case 0:
      case 2:
      case 6:
      case 7:
        goto LABEL_3;
      case 1:
      case 3:
        goto LABEL_13;
      case 4:
        v17 = (id *)MEMORY[0x263F1BE60];
        goto LABEL_13;
      case 5:
        v17 = (id *)MEMORY[0x263F1BE40];
LABEL_13:
        id v21 = *v17;
        if (v21)
        {
          v16->_method = a3;
          uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
          [v23 setObject:v21 forKey:*MEMORY[0x263F1BD40]];
          if (v26)
          {
            objc_storeStrong((id *)&v16->_addresses, a4);
            [v23 setObject:v26 forKey:*MEMORY[0x263F1BD38]];
          }
          if (v13)
          {
            objc_storeStrong((id *)&v16->_subnetMasks, a5);
            [v23 setObject:v13 forKey:*MEMORY[0x263F1BD60]];
          }
          if (v14)
          {
            objc_storeStrong((id *)&v16->_router, a6);
            [v23 setObject:v14 forKey:*MEMORY[0x263F1BD58]];
          }
          if (v15)
          {
            objc_storeStrong((id *)&v16->_dhcpClientID, a7);
            [v23 setObject:v15 forKey:*MEMORY[0x263F1BD48]];
          }
          os_log_type_t v20 = v23;
          items = v16->_items;
          v16->_items = v20;
        }
        else
        {
          os_log_type_t v20 = 0;
          items = v16;
          v16 = 0;
        }
        break;
      default:
        if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_3:
          v18 = WFLogForCategory(0);
          os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
          {
            *(_DWORD *)buf = 134217984;
            int64_t v29 = a3;
            _os_log_impl(&dword_226071000, v18, v19, "Unsupported WFIPv4ConfigMethod used %lu", buf, 0xCu);
          }
        }
        os_log_type_t v20 = 0;
        id v21 = 0;
        items = v16;
        v16 = 0;
        break;
    }
  }
  else
  {
    os_log_type_t v20 = 0;
    id v21 = 0;
    items = 0;
  }

  v24 = v16;
  return v24;
}

- (id)protocol
{
  return (id)*MEMORY[0x263F1BC50];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@- ", v5];

  v6 = [(WFSettingsIPV4 *)self items];
  v7 = [v6 objectForKey:*MEMORY[0x263F1BD40]];
  [v3 appendFormat:@"ConfigMethod: %@ ", v7];

  [v3 appendString:@"| Addresses: "];
  int64_t v8 = [(WFSettingsIPV4 *)self addresses];

  if (v8)
  {
    v9 = [(WFSettingsIPV4 *)self addresses];
    v10 = [v9 description];
    [v3 appendFormat:@"%@ ", v10];
  }
  else
  {
    [v3 appendString:@"(None) "];
  }
  [v3 appendString:@"| SubnetMasks: "];
  v11 = [(WFSettingsIPV4 *)self subnetMasks];

  if (v11)
  {
    v12 = [(WFSettingsIPV4 *)self subnetMasks];
    id v13 = [v12 description];
    [v3 appendFormat:@"%@ ", v13];
  }
  else
  {
    [v3 appendString:@"(None) "];
  }
  [v3 appendString:@"| Router: "];
  id v14 = [(WFSettingsIPV4 *)self router];

  if (v14)
  {
    id v15 = [(WFSettingsIPV4 *)self router];
    [v3 appendFormat:@"%@ ", v15];
  }
  else
  {
    [v3 appendString:@"(None) "];
  }
  [v3 appendString:@"| DHCP Client ID: "];
  v16 = [(WFSettingsIPV4 *)self dhcpClientID];

  if (v16)
  {
    v17 = [(WFSettingsIPV4 *)self dhcpClientID];
    [v3 appendFormat:@"%@ ", v17];
  }
  else
  {
    [v3 appendString:@"(None) "];
  }
  return (NSString *)v3;
}

- (int64_t)method
{
  return self->_method;
}

- (void)setMethod:(int64_t)a3
{
  self->_method = a3;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (NSArray)subnetMasks
{
  return self->_subnetMasks;
}

- (void)setSubnetMasks:(id)a3
{
}

- (NSString)router
{
  return self->_router;
}

- (void)setRouter:(id)a3
{
}

- (NSString)dhcpClientID
{
  return self->_dhcpClientID;
}

- (void)setDhcpClientID:(id)a3
{
}

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dhcpClientID, 0);
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_subnetMasks, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end