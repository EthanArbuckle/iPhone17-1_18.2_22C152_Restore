@interface IMContentLookupService
- (AMSLookup)amsLookup;
- (IMContentLookupService)init;
- (IMContentLookupService)initWithIds:(id)a3;
- (NSArray)ids;
- (NSString)artworkType;
- (NSString)profile;
- (int64_t)version;
- (void)_configureRequest;
- (void)request:(id)a3;
- (void)setAmsLookup:(id)a3;
- (void)setArtworkType:(id)a3;
- (void)setIds:(id)a3;
- (void)setProfile:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation IMContentLookupService

- (IMContentLookupService)initWithIds:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMContentLookupService;
  v5 = [(IMContentLookupService *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(IMContentLookupService *)v5 setIds:v4];
    id v7 = objc_alloc(MEMORY[0x1E4F4DCF0]);
    v8 = +[IMURLBag sharedInstance];
    v9 = [MEMORY[0x1E4F4DDC8] currentProcess];
    v10 = [v9 bundleIdentifier];
    v11 = (void *)[v7 initWithBag:v8 caller:v10 keyProfile:v6->_profile];
    [(IMContentLookupService *)v6 setAmsLookup:v11];

    [(IMContentLookupService *)v6 setVersion:1];
  }

  return v6;
}

- (IMContentLookupService)init
{
  return [(IMContentLookupService *)self initWithIds:0];
}

- (void)request:(id)a3
{
  id v4 = a3;
  [(IMContentLookupService *)self _configureRequest];
  v5 = [(IMContentLookupService *)self ids];

  if (v5)
  {
    amsLookup = self->_amsLookup;
    id v7 = [(IMContentLookupService *)self ids];
    v8 = [(AMSLookup *)amsLookup performLookupWithBundleIdentifiers:0 itemIdentifiers:v7];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __34__IMContentLookupService_request___block_invoke;
    v9[3] = &unk_1E5E612C0;
    v9[4] = self;
    id v10 = v4;
    [v8 addFinishBlock:v9];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, MEMORY[0x1E4F1CC08]);
  }
}

void __34__IMContentLookupService_request___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v5 = [*(id *)(a1 + 32) ids];
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_msgSend(v3, "allItems", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_super v13 = [v12 itemDictionary];
        if (v13)
        {
          v14 = [v12 iTunesStoreIdentifier];
          v15 = [v14 stringValue];

          [v6 setObject:v13 forKey:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_configureRequest
{
  [(AMSLookup *)self->_amsLookup setKeyProfile:self->_profile];
  [(AMSLookup *)self->_amsLookup setImageProfile:self->_artworkType];
  int64_t v3 = [(IMContentLookupService *)self version];
  amsLookup = self->_amsLookup;
  [(AMSLookup *)amsLookup setVersion:v3];
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)artworkType
{
  return self->_artworkType;
}

- (void)setArtworkType:(id)a3
{
}

- (NSArray)ids
{
  return self->_ids;
}

- (void)setIds:(id)a3
{
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (AMSLookup)amsLookup
{
  return self->_amsLookup;
}

- (void)setAmsLookup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsLookup, 0);
  objc_storeStrong((id *)&self->_ids, 0);
  objc_storeStrong((id *)&self->_artworkType, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end