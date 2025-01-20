@interface QLSpotlightFetcher
+ (BOOL)supportsSecureCoding;
- (BOOL)isLongFetchOperation;
- (QLSpotlightFetcher)initWithCoder:(id)a3;
- (QLSpotlightFetcher)initWithSearchableItemUniqueIdentifier:(id)a3 queryString:(id)a4 applicationBundleIdentifier:(id)a5;
- (QLSpotlightSearchableItemInfo)info;
- (id)itemSize;
- (void)encodeWithCoder:(id)a3;
- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6;
@end

@implementation QLSpotlightFetcher

- (QLSpotlightFetcher)initWithSearchableItemUniqueIdentifier:(id)a3 queryString:(id)a4 applicationBundleIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)QLSpotlightFetcher;
  v12 = [(QLItemFetcher *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchableItemUniqueIdentifier, a3);
    objc_storeStrong((id *)&v13->_queryString, a4);
    objc_storeStrong((id *)&v13->_applicationBundleIdentifier, a5);
    uint64_t v14 = +[QLSpotlightSearchableItemInfo spotlightInfoWithUniqueIdentifier:v13->_searchableItemUniqueIdentifier queryString:v13->_queryString applicationBundleIdentifier:v13->_applicationBundleIdentifier];
    info = v13->_info;
    v13->_info = (QLSpotlightSearchableItemInfo *)v14;
  }
  return v13;
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__QLSpotlightFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
  v13[3] = &unk_1E6DD3C60;
  id v14 = v9;
  v15 = self;
  id v16 = v10;
  id v11 = v10;
  id v12 = v9;
  [a4 addOperationWithBlock:v13];
}

void __95__QLSpotlightFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) containsObject:objc_opt_class()])
  {
    [*(id *)(a1 + 40) setFetchingState:1];
    uint64_t v2 = *(void *)(a1 + 48);
    id v4 = [*(id *)(a1 + 40) info];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v4, 0);
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

- (id)itemSize
{
  return &unk_1F3DD2C68;
}

- (BOOL)isLongFetchOperation
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLSpotlightFetcher;
  id v4 = a3;
  [(QLItemFetcher *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchableItemUniqueIdentifier, @"searchableItemUniqueIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_queryString forKey:@"queryString"];
  [v4 encodeObject:self->_applicationBundleIdentifier forKey:@"applicationBundleIdentifier"];
}

- (QLSpotlightFetcher)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLSpotlightFetcher;
  objc_super v5 = [(QLItemFetcher *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchableItemUniqueIdentifier"];
    searchableItemUniqueIdentifier = v5->_searchableItemUniqueIdentifier;
    v5->_searchableItemUniqueIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryString"];
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifier"];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;
  }
  return v5;
}

- (QLSpotlightSearchableItemInfo)info
{
  return (QLSpotlightSearchableItemInfo *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_searchableItemUniqueIdentifier, 0);
}

@end