@interface ICInAppMessageEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)didCacheRequiredResources;
- (BOOL)isBadgingApplication;
- (BOOL)shouldDownloadResources;
- (ICIAMApplicationMessage)applicationMessage;
- (ICInAppMessageEntry)initWithApplicationMessage:(id)a3 bundleIdentifier:(id)a4;
- (ICInAppMessageEntry)initWithCoder:(id)a3;
- (NSDictionary)metadata;
- (NSString)bundleIdentifier;
- (id)allCachedResourceLocations;
- (id)cachedLocationForResourceWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)clearCachedResources;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheLocation:(id)a3 forResourceWithIdentifier:(id)a4;
- (void)setDidCacheRequiredResources:(BOOL)a3;
- (void)setIsBadgingApplication:(BOOL)a3;
- (void)setShouldDownloadResources:(BOOL)a3;
- (void)updateMetadataValue:(id)a3 forKey:(id)a4;
@end

@implementation ICInAppMessageEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationMessage, 0);
  objc_storeStrong((id *)&self->_resourceCache, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setIsBadgingApplication:(BOOL)a3
{
  self->_isBadgingApplication = a3;
}

- (BOOL)isBadgingApplication
{
  return self->_isBadgingApplication;
}

- (void)setDidCacheRequiredResources:(BOOL)a3
{
  self->_didCacheRequiredResources = a3;
}

- (BOOL)didCacheRequiredResources
{
  return self->_didCacheRequiredResources;
}

- (void)setShouldDownloadResources:(BOOL)a3
{
  self->_shouldDownloadResources = a3;
}

- (BOOL)shouldDownloadResources
{
  return self->_shouldDownloadResources;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (ICIAMApplicationMessage)applicationMessage
{
  return self->_applicationMessage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[ICIAMApplicationMessage copyWithZone:](self->_applicationMessage, "copyWithZone:");
  v6 = (void *)[(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v7 = [+[ICInAppMessageEntry allocWithZone:a3] initWithApplicationMessage:v5 bundleIdentifier:v6];
  if (v7)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__ICInAppMessageEntry_copyWithZone___block_invoke;
    block[3] = &unk_1E5AC8EA0;
    block[4] = v7;
    block[5] = self;
    block[6] = a3;
    dispatch_sync(accessQueue, block);
  }

  return v7;
}

uint64_t __36__ICInAppMessageEntry_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 16) copyWithZone:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(a1 + 32), "setShouldDownloadResources:", objc_msgSend(*(id *)(a1 + 40), "shouldDownloadResources"));
  objc_msgSend(*(id *)(a1 + 32), "setDidCacheRequiredResources:", objc_msgSend(*(id *)(a1 + 40), "didCacheRequiredResources"));
  objc_msgSend(*(id *)(a1 + 32), "setIsBadgingApplication:", objc_msgSend(*(id *)(a1 + 40), "isBadgingApplication"));
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 32) copyWithZone:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  return MEMORY[0x1F41817F8](v5, v7);
}

- (void)encodeWithCoder:(id)a3
{
  applicationMessage = self->_applicationMessage;
  id v5 = a3;
  [v5 encodeObject:applicationMessage forKey:@"applicationMessage"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleID"];
  [v5 encodeObject:self->_metadata forKey:@"metadata"];
  objc_msgSend(v5, "encodeBool:forKey:", -[ICInAppMessageEntry shouldDownloadResources](self, "shouldDownloadResources"), @"shouldDownloadResources");
  objc_msgSend(v5, "encodeBool:forKey:", -[ICInAppMessageEntry didCacheRequiredResources](self, "didCacheRequiredResources"), @"didCacheRequiredResources");
  objc_msgSend(v5, "encodeBool:forKey:", -[ICInAppMessageEntry isBadgingApplication](self, "isBadgingApplication"), @"isBadgingApplication");
  [v5 encodeObject:self->_resourceCache forKey:@"resourceCache"];
}

- (ICInAppMessageEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationMessage"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  uint64_t v7 = [(ICInAppMessageEntry *)self initWithApplicationMessage:v5 bundleIdentifier:v6];
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"metadata"];
    metadata = v7->_metadata;
    v7->_metadata = (NSMutableDictionary *)v12;

    -[ICInAppMessageEntry setShouldDownloadResources:](v7, "setShouldDownloadResources:", [v4 decodeBoolForKey:@"shouldDownloadResources"]);
    -[ICInAppMessageEntry setDidCacheRequiredResources:](v7, "setDidCacheRequiredResources:", [v4 decodeBoolForKey:@"didCacheRequiredResources"]);
    -[ICInAppMessageEntry setIsBadgingApplication:](v7, "setIsBadgingApplication:", [v4 decodeBoolForKey:@"isBadgingApplication"]);
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"resourceCache"];
    resourceCache = v7->_resourceCache;
    v7->_resourceCache = (NSMutableDictionary *)v17;
  }
  return v7;
}

- (id)allCachedResourceLocations
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__10950;
  uint64_t v10 = __Block_byref_object_dispose__10951;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__ICInAppMessageEntry_allCachedResourceLocations__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __49__ICInAppMessageEntry_allCachedResourceLocations__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)clearCachedResources
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ICInAppMessageEntry_clearCachedResources__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __43__ICInAppMessageEntry_clearCachedResources__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 removeItemAtPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++) error:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
}

- (void)setCacheLocation:(id)a3 forResourceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ICInAppMessageEntry_setCacheLocation_forResourceWithIdentifier___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(accessQueue, block);
}

uint64_t __66__ICInAppMessageEntry_setCacheLocation_forResourceWithIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 32) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (id)cachedLocationForResourceWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10950;
  v16 = __Block_byref_object_dispose__10951;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ICInAppMessageEntry_cachedLocationForResourceWithIdentifier___block_invoke;
  block[3] = &unk_1E5ACCC88;
  id v10 = v4;
  long long v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __63__ICInAppMessageEntry_cachedLocationForResourceWithIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)updateMetadataValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ICInAppMessageEntry_updateMetadataValue_forKey___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, block);
}

uint64_t __50__ICInAppMessageEntry_updateMetadataValue_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setValue:a1[5] forKey:a1[6]];
}

- (NSDictionary)metadata
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__10950;
  id v10 = __Block_byref_object_dispose__10951;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__ICInAppMessageEntry_metadata__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __31__ICInAppMessageEntry_metadata__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)description
{
  if ([(ICIAMApplicationMessage *)self->_applicationMessage hasStartDate])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
    [(ICIAMApplicationMessage *)self->_applicationMessage startDate];
    uint64_t v4 = objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(ICIAMApplicationMessage *)self->_applicationMessage hasEndDate])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
    [(ICIAMApplicationMessage *)self->_applicationMessage endDate];
    uint64_t v6 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(ICIAMApplicationMessage *)self->_applicationMessage messageType];
  if v7 < 5 && ((0x17u >> v7))
  {
    uint64_t v8 = off_1E5AC8428[v7];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v9 = NSString;
  bundleIdentifier = self->_bundleIdentifier;
  id v11 = [(ICIAMApplicationMessage *)self->_applicationMessage identifier];
  id v12 = [v9 stringWithFormat:@"[%@:%@, %@, (valid from %@ - %@), download=%d]", bundleIdentifier, v11, v8, v4, v6, self->_shouldDownloadResources];

  return v12;
}

- (ICInAppMessageEntry)initWithApplicationMessage:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICInAppMessageEntry;
  id v9 = [(ICInAppMessageEntry *)&v20 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applicationMessage, a3);
    uint64_t v11 = [v8 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    metadata = v10->_metadata;
    v10->_metadata = (NSMutableDictionary *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageEntry.accessQueue", 0);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    resourceCache = v10->_resourceCache;
    v10->_resourceCache = (NSMutableDictionary *)v17;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end