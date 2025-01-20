@interface ICInAppMessageMetadataEntry
+ (BOOL)supportsSecureCoding;
- (ICInAppMessageMetadataEntry)init;
- (ICInAppMessageMetadataEntry)initWithCoder:(id)a3;
- (id)allMetadataValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)metadataValueForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMetadataValue:(id)a3 forKey:(id)a4;
@end

@implementation ICInAppMessageMetadataEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_metadataValues, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ICInAppMessageMetadataEntry allocWithZone:](ICInAppMessageMetadataEntry, "allocWithZone:") init];
  if (v5)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__ICInAppMessageMetadataEntry_copyWithZone___block_invoke;
    block[3] = &unk_1E5AC8EA0;
    block[4] = v5;
    block[5] = self;
    block[6] = a3;
    dispatch_sync(accessQueue, block);
  }
  return v5;
}

uint64_t __44__ICInAppMessageMetadataEntry_copyWithZone___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[5] + 8) copyWithZone:a1[6]];
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICInAppMessageMetadataEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICInAppMessageMetadataEntry *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"metadata"];

    if (_NSIsNSDictionary())
    {
      uint64_t v11 = [v10 mutableCopy];
      metadataValues = v5->_metadataValues;
      v5->_metadataValues = (NSMutableDictionary *)v11;
    }
  }

  return v5;
}

- (id)allMetadataValues
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14373;
  v10 = __Block_byref_object_dispose__14374;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__ICInAppMessageMetadataEntry_allMetadataValues__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __48__ICInAppMessageMetadataEntry_allMetadataValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)metadataValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14373;
  v16 = __Block_byref_object_dispose__14374;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ICInAppMessageMetadataEntry_metadataValueForKey___block_invoke;
  block[3] = &unk_1E5ACCC88;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __51__ICInAppMessageMetadataEntry_metadataValueForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ICInAppMessageMetadataEntry_setMetadataValue_forKey___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(accessQueue, block);
}

uint64_t __55__ICInAppMessageMetadataEntry_setMetadataValue_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (ICInAppMessageMetadataEntry)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICInAppMessageMetadataEntry;
  uint64_t v2 = [(ICInAppMessageMetadataEntry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    metadataValues = v2->_metadataValues;
    v2->_metadataValues = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageMetadataEntry.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end