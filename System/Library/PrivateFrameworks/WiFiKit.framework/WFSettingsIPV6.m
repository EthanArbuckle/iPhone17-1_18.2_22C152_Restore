@interface WFSettingsIPV6
+ (id)automaticConfig;
+ (id)linkLocalConfig;
- (NSArray)addresses;
- (NSArray)prefixLengths;
- (NSDictionary)items;
- (NSString)description;
- (NSString)router;
- (WFSettingsIPV6)initWithDictionary:(id)a3;
- (WFSettingsIPV6)initWithMethod:(int64_t)a3 addresses:(id)a4 prefixLengths:(id)a5 router:(id)a6;
- (id)protocol;
- (int64_t)method;
- (void)setAddresses:(id)a3;
- (void)setItems:(id)a3;
- (void)setMethod:(int64_t)a3;
- (void)setPrefixLengths:(id)a3;
- (void)setRouter:(id)a3;
@end

@implementation WFSettingsIPV6

- (WFSettingsIPV6)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFSettingsIPV6;
  v6 = [(WFSettingsIPV6 *)&v21 init];
  v7 = v6;
  v8 = 0;
  if (!v5 || !v6)
  {
    router = v6;
    v7 = 0;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_items, a3);
  v9 = [(NSDictionary *)v7->_items objectForKey:*MEMORY[0x263F1BD70]];
  v8 = v9;
  if (!v9)
  {
    v18 = WFLogForCategory(0);
    os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18)
    {
      if (os_log_type_enabled(v18, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v18, v20, "Missing kSCPropNetIPv6ConfigMethod in dictionary.", buf, 2u);
      }
      v8 = 0;
    }
    goto LABEL_16;
  }
  if (([v9 isEqualToString:*MEMORY[0x263F1BE78]] & 1) == 0)
  {
    if ([v8 isEqualToString:*MEMORY[0x263F1BE88]])
    {
      uint64_t v10 = 3;
      goto LABEL_10;
    }
    if ([v8 isEqualToString:*MEMORY[0x263F1BE80]])
    {
      uint64_t v10 = 2;
      goto LABEL_10;
    }
    v18 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v8;
      _os_log_impl(&dword_226071000, v18, v19, "Uknown IPv6 config method %{public}@", buf, 0xCu);
    }
LABEL_16:

    router = v7;
    v7 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = 1;
LABEL_10:
  v7->_method = v10;
  uint64_t v11 = [(NSDictionary *)v7->_items objectForKey:*MEMORY[0x263F1BD88]];
  prefixLengths = v7->_prefixLengths;
  v7->_prefixLengths = (NSArray *)v11;

  uint64_t v13 = [(NSDictionary *)v7->_items objectForKey:*MEMORY[0x263F1BD68]];
  addresses = v7->_addresses;
  v7->_addresses = (NSArray *)v13;

  uint64_t v15 = [(NSDictionary *)v7->_items objectForKey:*MEMORY[0x263F1BD90]];
  router = (WFSettingsIPV6 *)v7->_router;
  v7->_router = (NSString *)v15;
LABEL_11:

  return v7;
}

- (WFSettingsIPV6)initWithMethod:(int64_t)a3 addresses:(id)a4 prefixLengths:(id)a5 router:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)WFSettingsIPV6;
  uint64_t v13 = [(WFSettingsIPV6 *)&v28 init];
  if (v13)
  {
    v14 = (id *)MEMORY[0x263F1BE78];
    switch(a3)
    {
      case 0:
      case 4:
      case 5:
        uint64_t v15 = WFLogForCategory(0);
        os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
        if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v16)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 134349056;
        int64_t v30 = a3;
        v17 = "Unsupported WFIPv6ConfigMethod used %{public}ld";
        v18 = v15;
        os_log_type_t v19 = v16;
        uint32_t v20 = 12;
        goto LABEL_12;
      case 1:
        goto LABEL_18;
      case 2:
        v14 = (id *)MEMORY[0x263F1BE80];
        goto LABEL_18;
      case 3:
        v14 = (id *)MEMORY[0x263F1BE88];
LABEL_18:
        id v23 = *v14;
        if (v23)
        {
          v25 = [MEMORY[0x263EFF9A0] dictionary];
          [v25 setObject:v23 forKey:*MEMORY[0x263F1BD70]];
          if (v11) {
            [v25 setObject:v11 forKey:*MEMORY[0x263F1BD88]];
          }
          if (v10) {
            [v25 setObject:v10 forKey:*MEMORY[0x263F1BD68]];
          }
          if (v12) {
            [v25 setObject:v12 forKey:*MEMORY[0x263F1BD90]];
          }
          v22 = v25;
          items = v13->_items;
          v13->_items = v22;
        }
        else
        {
          v22 = 0;
LABEL_15:
          items = v13;
          uint64_t v13 = 0;
        }
        break;
      default:
        if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v15 = WFLogForCategory(0);
          os_log_type_t v21 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v21))
          {
            *(_WORD *)buf = 0;
            v17 = "Unknown WFIPv6ConfigMethod used";
            v18 = v15;
            os_log_type_t v19 = v21;
            uint32_t v20 = 2;
LABEL_12:
            _os_log_impl(&dword_226071000, v18, v19, v17, buf, v20);
          }
LABEL_13:
        }
        v22 = 0;
        id v23 = 0;
        goto LABEL_15;
    }
  }
  else
  {
    v22 = 0;
    id v23 = 0;
    items = 0;
  }

  v26 = v13;
  return v26;
}

+ (id)automaticConfig
{
  v2 = [[WFSettingsIPV6 alloc] initWithMethod:1 addresses:0 prefixLengths:0 router:0];
  return v2;
}

+ (id)linkLocalConfig
{
  v2 = [[WFSettingsIPV6 alloc] initWithMethod:2 addresses:0 prefixLengths:0 router:0];
  return v2;
}

- (id)protocol
{
  return (id)*MEMORY[0x263F1BC58];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@- ", v5];

  v6 = [(WFSettingsIPV6 *)self items];
  v7 = [v6 objectForKey:*MEMORY[0x263F1BD70]];
  [v3 appendFormat:@"ConfigMethod: %@ ", v7];

  [v3 appendString:@"| Addresses: "];
  v8 = [(WFSettingsIPV6 *)self addresses];

  if (v8)
  {
    v9 = [(WFSettingsIPV6 *)self addresses];
    id v10 = [v9 description];
    [v3 appendFormat:@"%@ ", v10];
  }
  else
  {
    [v3 appendString:@"(None) "];
  }
  [v3 appendString:@"| Router: "];
  id v11 = [(WFSettingsIPV6 *)self router];

  if (v11)
  {
    id v12 = [(WFSettingsIPV6 *)self router];
    [v3 appendFormat:@"%@ ", v12];
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

- (NSArray)prefixLengths
{
  return self->_prefixLengths;
}

- (void)setPrefixLengths:(id)a3
{
}

- (NSString)router
{
  return self->_router;
}

- (void)setRouter:(id)a3
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
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_prefixLengths, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end