@interface FCResource
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnDisk;
- (FCAssetHandle)assetHandle;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (FCInterestToken)interestToken;
- (FCResource)initWithPermanentURLForResourceID:(id)a3 cacheLifetimeHint:(int64_t)a4 contentContext:(id)a5;
- (FCResource)initWithRecord:(id)a3 interestToken:(id)a4 assetManager:(id)a5;
- (FCResource)initWithResourceID:(id)a3 assetHandle:(id)a4 fetchDate:(id)a5;
- (NSDate)fetchDate;
- (NSString)resourceID;
- (NSURL)fileURL;
- (NTPBResourceRecord)resourceRecord;
- (unint64_t)hash;
- (void)setInterestToken:(id)a3;
- (void)setResourceRecord:(id)a3;
@end

@implementation FCResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_resourceRecord, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_assetHandle, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
}

- (NSURL)fileURL
{
  v2 = [(FCResource *)self assetHandle];
  v3 = [v2 fileURL];

  return (NSURL *)v3;
}

- (FCAssetHandle)assetHandle
{
  return self->_assetHandle;
}

- (FCResource)initWithRecord:(id)a3 interestToken:(id)a4 assetManager:(id)a5
{
  v24 = self;
  id v8 = a3;
  id v26 = a4;
  id v9 = a5;
  v10 = [v8 base];
  v11 = [v10 identifier];

  v12 = [v8 url];
  if (v12)
  {
    v13 = [v8 base];
    int v14 = [v13 cacheLifetimeHint];
    if (v14 == 2) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = v14 == 1;
    }
    v16 = objc_msgSend(v9, "assetHandleForCKAssetURLString:lifetimeHint:", v12, v15, v24, v26);
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)MEMORY[0x1E4F1C9C8];
  v18 = objc_msgSend(v8, "base", v24);
  v19 = [v18 fetchDate];
  v20 = [v17 dateWithPBDate:v19];

  uint64_t v21 = [v25 initWithResourceID:v11 assetHandle:v16 fetchDate:v20];
  v22 = (FCResource *)v21;
  if (v21)
  {
    objc_storeStrong((id *)(v21 + 32), a3);
    objc_storeStrong((id *)&v22->_interestToken, a4);
  }

  return v22;
}

- (FCResource)initWithPermanentURLForResourceID:(id)a3 cacheLifetimeHint:(int64_t)a4 contentContext:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v8 assetManager];
  v11 = [v8 internalContentContext];

  v12 = [v11 contentDatabase];
  v13 = [v10 assetHandleForRecordID:v9 field:3 lifetimeHint:a4 contentDatabase:v12];

  int v14 = [(FCResource *)self initWithResourceID:v9 assetHandle:v13 fetchDate:0];
  return v14;
}

- (FCResource)initWithResourceID:(id)a3 assetHandle:(id)a4 fetchDate:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "assetHandle != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCResource initWithResourceID:assetHandle:fetchDate:]";
    __int16 v19 = 2080;
    v20 = "FCResource.m";
    __int16 v21 = 1024;
    int v22 = 44;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v16.receiver = self;
  v16.super_class = (Class)FCResource;
  v12 = [(FCResource *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_resourceID, a3);
    objc_storeStrong((id *)&v13->_assetHandle, a4);
    objc_storeStrong((id *)&v13->_fetchDate, a5);
  }

  return v13;
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [(FCResource *)self resourceID];
    id v8 = [v6 resourceID];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(FCResource *)self resourceID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isOnDisk
{
  v2 = [(FCResource *)self assetHandle];
  unint64_t v3 = [v2 dataProvider];
  BOOL v4 = v3 != 0;

  return v4;
}

- (FCContentArchive)contentArchive
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__FCResource_contentArchive__block_invoke;
  v5[3] = &unk_1E5B4BF30;
  v5[4] = self;
  v2 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v5);
  unint64_t v3 = +[FCContentArchive archiveWithChildArchives:v2];

  return (FCContentArchive *)v3;
}

void __28__FCResource_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 resourceRecord];
  id v6 = +[FCContentArchive archiveWithRecord:v5];
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  id v8 = [*(id *)(a1 + 32) assetHandle];
  v7 = [v8 contentArchive];
  objc_msgSend(v4, "fc_safelyAddObject:", v7);
}

- (FCContentManifest)contentManifest
{
  unint64_t v3 = [FCContentManifest alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__FCResource_contentManifest__block_invoke;
  v7[3] = &unk_1E5B4BF30;
  v7[4] = self;
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v7);
  v5 = [(FCContentManifest *)v3 initWithManifests:v4];

  return v5;
}

void __29__FCResource_contentManifest__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 resourceRecord];
  id v6 = [v5 base];
  v7 = [v6 contentManifest];
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  id v9 = [*(id *)(a1 + 32) assetHandle];
  id v8 = [v9 contentManifest];
  objc_msgSend(v4, "fc_safelyAddObject:", v8);
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (NTPBResourceRecord)resourceRecord
{
  return self->_resourceRecord;
}

- (void)setResourceRecord:(id)a3
{
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void)setInterestToken:(id)a3
{
}

@end