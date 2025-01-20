@interface WFSettingsDNS
+ (id)automaticConfig;
- (NSArray)searchDomains;
- (NSArray)serverAddresses;
- (NSDictionary)items;
- (NSString)description;
- (WFSettingsDNS)initWithDictionary:(id)a3;
- (WFSettingsDNS)initWithServerAddresses:(id)a3 searchDomains:(id)a4;
- (id)protocol;
- (void)setItems:(id)a3;
- (void)setSearchDomains:(id)a3;
- (void)setServerAddresses:(id)a3;
@end

@implementation WFSettingsDNS

+ (id)automaticConfig
{
  v2 = [[WFSettingsDNS alloc] initWithServerAddresses:0 searchDomains:0];
  return v2;
}

- (WFSettingsDNS)initWithDictionary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFSettingsDNS;
  v6 = [(WFSettingsDNS *)&v13 init];
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_storeStrong((id *)&v6->_items, a3);
      uint64_t v8 = [(NSDictionary *)v7->_items objectForKey:*MEMORY[0x263F1BCF0]];
      serverAddresses = v7->_serverAddresses;
      v7->_serverAddresses = (NSArray *)v8;

      uint64_t v10 = [(NSDictionary *)v7->_items objectForKey:*MEMORY[0x263F1BCE8]];
      searchDomains = v7->_searchDomains;
      v7->_searchDomains = (NSArray *)v10;
    }
    else
    {
      searchDomains = 0;
    }
  }
  else
  {
    searchDomains = v6;
    v7 = 0;
  }

  return v7;
}

- (WFSettingsDNS)initWithServerAddresses:(id)a3 searchDomains:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFSettingsDNS;
  v9 = [(WFSettingsDNS *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    objc_storeStrong((id *)&v9->_serverAddresses, a3);
    if (v7) {
      [(NSDictionary *)v10 setObject:v7 forKey:*MEMORY[0x263F1BCF0]];
    }
    objc_storeStrong((id *)&v9->_searchDomains, a4);
    if (v8) {
      [(NSDictionary *)v10 setObject:v8 forKey:*MEMORY[0x263F1BCE8]];
    }
    items = v9->_items;
    v9->_items = v10;
    v12 = v10;
  }
  return v9;
}

- (id)protocol
{
  return (id)*MEMORY[0x263F1BC38];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@- ", v5];

  v6 = [(WFSettingsDNS *)self serverAddresses];
  if ([v6 count])
  {
  }
  else
  {
    id v7 = [(WFSettingsDNS *)self searchDomains];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      objc_super v14 = @" Automatic Config";
      goto LABEL_11;
    }
  }
  [v3 appendString:@"Sever Addresses: "];
  if (self->_serverAddresses)
  {
    v9 = [(WFSettingsDNS *)self serverAddresses];
    uint64_t v10 = [v9 description];
    [v3 appendFormat:@"%@ ", v10];
  }
  else
  {
    [v3 appendString:@"(None) "];
  }
  [v3 appendString:@"| Search Domains: "];
  v11 = [(WFSettingsDNS *)self searchDomains];

  if (v11)
  {
    v12 = [(WFSettingsDNS *)self searchDomains];
    objc_super v13 = [v12 description];
    [v3 appendFormat:@"%@ ", v13];

    goto LABEL_12;
  }
  objc_super v14 = @"(None) ";
LABEL_11:
  [v3 appendString:v14];
LABEL_12:
  return (NSString *)v3;
}

- (NSArray)serverAddresses
{
  return self->_serverAddresses;
}

- (void)setServerAddresses:(id)a3
{
}

- (NSArray)searchDomains
{
  return self->_searchDomains;
}

- (void)setSearchDomains:(id)a3
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
  objc_storeStrong((id *)&self->_searchDomains, 0);
  objc_storeStrong((id *)&self->_serverAddresses, 0);
}

@end