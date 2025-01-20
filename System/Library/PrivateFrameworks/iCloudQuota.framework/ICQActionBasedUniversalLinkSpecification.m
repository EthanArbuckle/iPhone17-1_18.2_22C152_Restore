@interface ICQActionBasedUniversalLinkSpecification
- (ICQActionBasedUniversalLinkSpecification)initWithServerDictionary:(id)a3;
- (ICQLink)defaultLink;
- (NSDictionary)links;
- (NSString)defaultPurchaseAttribution;
- (NSURL)defaultDynamicUIRouteURL;
- (NSURL)defaultServerUIURL;
- (id)dynamicUIRouteURLForKey:(id)a3;
- (id)icqLinkForContext:(id)a3;
- (id)purchaseAttributionForKey:(id)a3;
- (id)serverUIURLForKey:(id)a3;
@end

@implementation ICQActionBasedUniversalLinkSpecification

- (ICQActionBasedUniversalLinkSpecification)initWithServerDictionary:(id)a3
{
  id v5 = a3;
  v6 = [(ICQActionBasedUniversalLinkSpecification *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverDict, a3);
    uint64_t v8 = _ICQLinksForServerActionBasedUniversalLink(v5);
    links = v7->_links;
    v7->_links = (NSDictionary *)v8;
  }
  return v7;
}

- (ICQLink)defaultLink
{
  v2 = [(ICQActionBasedUniversalLinkSpecification *)self links];
  v3 = [v2 valueForKey:@"default"];

  return (ICQLink *)v3;
}

- (NSURL)defaultServerUIURL
{
  return (NSURL *)[(ICQActionBasedUniversalLinkSpecification *)self serverUIURLForKey:@"default"];
}

- (NSURL)defaultDynamicUIRouteURL
{
  return (NSURL *)[(ICQActionBasedUniversalLinkSpecification *)self dynamicUIRouteURLForKey:@"default"];
}

- (NSString)defaultPurchaseAttribution
{
  return (NSString *)[(ICQActionBasedUniversalLinkSpecification *)self purchaseAttributionForKey:@"default"];
}

- (id)serverUIURLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQActionBasedUniversalLinkSpecification *)self links];
  v6 = [v5 valueForKey:v4];

  v7 = [v6 actionURL];

  return v7;
}

- (id)dynamicUIRouteURLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQActionBasedUniversalLinkSpecification *)self links];
  v6 = [v5 valueForKey:v4];

  v7 = [v6 dynamicUIRouteURL];

  return v7;
}

- (id)purchaseAttributionForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQActionBasedUniversalLinkSpecification *)self links];
  v6 = [v5 valueForKey:v4];

  v7 = [v6 purchaseAttribution];

  return v7;
}

- (id)icqLinkForContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  if (!v24) {
    goto LABEL_17;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v24];
  if (!v4) {
    goto LABEL_17;
  }
  v23 = v4;
  id v5 = [v4 queryItems];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v12 = [v11 name];
        int v13 = [v12 isEqualToString:@"universalLinkAction"];

        if (v13)
        {
          v14 = _ICQGetLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [v11 value];
            *(_DWORD *)buf = 138412546;
            id v30 = v15;
            __int16 v31 = 2112;
            id v32 = v24;
            _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "icqLinkForContext: found link: %@ for context: %@", buf, 0x16u);
          }
          v16 = [(ICQActionBasedUniversalLinkSpecification *)self links];
          v17 = [v11 value];
          uint64_t v18 = [v16 objectForKeyedSubscript:v17];

          uint64_t v8 = (void *)v18;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  if (!v8)
  {
LABEL_17:
    v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v24;
      _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, "icqLinkForContext: Did not find a specific action for context: %@", buf, 0xCu);
    }

    uint64_t v8 = [(ICQActionBasedUniversalLinkSpecification *)self defaultLink];
  }
  v20 = [v8 serverUIURL];
  v21 = objc_msgSend(v20, "icq_URLByAppendingQueryParamtersFromContext:", v24);

  [v8 setServerUIURL:v21];
  return v8;
}

- (NSDictionary)links
{
  return self->_links;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

@end