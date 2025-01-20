@interface ICQQuotaAppDetailsResponse
- (ICQQuotaAppDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSArray)apps;
- (id)description;
- (void)addApps:(id)a3;
@end

@implementation ICQQuotaAppDetailsResponse

- (ICQQuotaAppDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)ICQQuotaAppDetailsResponse;
  v24 = [(AAResponse *)&v29 initWithHTTPResponse:a3 data:a4];
  if (v24)
  {
    v4 = [(AAResponse *)v24 responseDictionary];
    v5 = [v4 objectForKey:@"results"];

    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    apps = v24->_apps;
    uint64_t v23 = 64;
    v24->_apps = (NSMutableArray *)v6;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * v12), v23);
          v14 = objc_alloc_init(ICQQuotaApp);
          v15 = [v13 objectForKey:@"bundle_id"];
          [(ICQQuotaApp *)v14 setBundleID:v15];

          v16 = [v13 objectForKey:@"application_name"];
          [(ICQQuotaApp *)v14 setName:v16];

          v17 = [v13 objectForKey:@"localized_application_name"];
          [(ICQQuotaApp *)v14 setLocalizedName:v17];

          v18 = [v13 objectForKey:@"icon_url"];
          if (v18)
          {
            v19 = [NSURL URLWithString:v18];
            [(ICQQuotaApp *)v14 setIconURL:v19];
          }
          v20 = [v13 objectForKey:@"thumbnail_url"];
          if (v20)
          {
            v21 = [NSURL URLWithString:v20];
            [(ICQQuotaApp *)v14 setThumbnailURL:v21];
          }
          [*(id *)((char *)&v24->super.super.isa + v23) addObject:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }
  }
  return v24;
}

- (void)addApps:(id)a3
{
  id v4 = a3;
  apps = self->_apps;
  id v8 = v4;
  if (!apps)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_apps;
    self->_apps = v6;

    id v4 = v8;
    apps = self->_apps;
  }
  [(NSMutableArray *)apps addObjectsFromArray:v4];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ICQQuotaAppDetailsResponse *)self apps];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p with apps: %@>", v4, self, v5];

  return v6;
}

- (NSArray)apps
{
  return &self->_apps->super;
}

- (void).cxx_destruct
{
}

@end