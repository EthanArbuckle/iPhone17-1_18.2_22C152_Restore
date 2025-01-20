@interface VUISidebandMediaItem
- (BOOL)allowsManualDownloadRenewal;
- (BOOL)isFamilySharingContent;
- (BOOL)markedAsDeleted;
- (BOOL)renewsOfflineKeysAutomatically;
- (VUIMediaEntityAssetController)assetController;
- (VUISidebandMediaItem)initWithMediaLibrary:(id)a3 videoManagedObject:(id)a4 requestedProperties:(id)a5;
- (VUIVideoManagedObject)videoManagedObject;
- (id)HLSColorCapability;
- (id)addedDate;
- (id)assetType;
- (id)availabilityEndDate;
- (id)brandID;
- (id)brandName;
- (id)canonicalID;
- (id)colorCapability;
- (id)downloadExpirationDate;
- (id)duration;
- (id)episodeIndexInSeries;
- (id)episodeNumber;
- (id)fractionalEpisodeNumber;
- (id)genreTitle;
- (id)imageLoadParamsWithImageType:(unint64_t)a3;
- (id)isLocal;
- (id)isPlayable;
- (id)releaseDate;
- (id)seasonCanonicalID;
- (id)seasonIdentifier;
- (id)seasonNumber;
- (id)seasonTitle;
- (id)showCanonicalID;
- (id)showIdentifier;
- (id)showTitle;
- (id)storeID;
- (id)title;
- (void)_videoManagedObjectPlaybackExpirationWillChange:(id)a3;
- (void)dealloc;
- (void)setAssetController:(id)a3;
- (void)setVideoManagedObject:(id)a3;
@end

@implementation VUISidebandMediaItem

- (VUISidebandMediaItem)initWithMediaLibrary:(id)a3 videoManagedObject:(id)a4 requestedProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
    if (v9)
    {
LABEL_3:
      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"videoManagedObject" format];
  if (!v10) {
LABEL_4:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"requestedProperties" format];
LABEL_5:
  v11 = +[VUIMediaEntityType movie];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[VUIMediaEntityType movie];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v12 = +[VUIMediaEntityType episode];
  }
  v13 = (void *)v12;

  v11 = v13;
LABEL_10:
  v14 = [VUISidebandMediaEntityIdentifier alloc];
  v15 = [v9 objectID];
  v16 = [(VUISidebandMediaEntityIdentifier *)v14 initWithManagedObjectID:v15 mediaEntityType:v11];

  v17 = VUISidebandMediaItemKind();
  v22.receiver = self;
  v22.super_class = (Class)VUISidebandMediaItem;
  v18 = [(VUIMediaEntity *)&v22 initWithMediaLibrary:v8 identifier:v16 requestedProperties:v10 kind:v17];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_videoManagedObject, a4);
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v20 = [(VUIVideoManagedObject *)v18->_videoManagedObject objectID];
    [v19 addObserver:v18 selector:sel__videoManagedObjectPlaybackExpirationWillChange_ name:@"VUIVideoManagedObjectPlaybackExpirationWillChangeNotification" object:v20];
  }
  return v18;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUISidebandMediaItem;
  [(VUISidebandMediaItem *)&v4 dealloc];
}

- (id)assetType
{
  v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__29;
  v19 = __Block_byref_object_dispose__29;
  id v20 = 0;
  v3 = [v2 managedObjectContext];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __33__VUISidebandMediaItem_assetType__block_invoke;
  uint64_t v12 = &unk_1E6DF4B00;
  v14 = &v15;
  id v4 = v2;
  id v13 = v4;
  [v3 performBlockAndWait:&v9];

  v5 = (void *)v16[5];
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToNumber:", &unk_1F3F3D6E8, v9, v10, v11, v12)) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", v6, v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __33__VUISidebandMediaItem_assetType__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entitlementType];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isFamilySharingContent
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__29;
  v18 = __Block_byref_object_dispose__29;
  id v19 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __46__VUISidebandMediaItem_isFamilySharingContent__block_invoke;
  v11 = &unk_1E6DF4B00;
  id v13 = &v14;
  id v4 = v2;
  id v12 = v4;
  [v3 performBlockAndWait:&v8];

  v5 = (void *)v15[5];
  if (v5) {
    char v6 = objc_msgSend(v5, "isEqualToNumber:", &unk_1F3F3D6E8, v8, v9, v10, v11);
  }
  else {
    char v6 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __46__VUISidebandMediaItem_isFamilySharingContent__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entitlementType];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)canonicalID
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__VUISidebandMediaItem_canonicalID__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __35__VUISidebandMediaItem_canonicalID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) canonicalID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)markedAsDeleted
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__VUISidebandMediaItem_markedAsDeleted__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  id v8 = &v9;
  id v4 = v2;
  id v7 = v4;
  [v3 performBlockAndWait:v6];

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v3;
}

uint64_t __39__VUISidebandMediaItem_markedAsDeleted__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) markedAsDeleted];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)title
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__29;
  id v15 = __Block_byref_object_dispose__29;
  id v16 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__VUISidebandMediaItem_title__block_invoke;
  v8[3] = &unk_1E6DF4B00;
  uint64_t v10 = &v11;
  id v4 = v2;
  id v9 = v4;
  [v3 performBlockAndWait:v8];

  id v5 = (void *)v12[5];
  if (!v5)
  {
    v12[5] = (uint64_t)&stru_1F3E921E0;

    id v5 = (void *)v12[5];
  }
  id v6 = v5;

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __29__VUISidebandMediaItem_title__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)duration
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__VUISidebandMediaItem_duration__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __32__VUISidebandMediaItem_duration__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) duration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)genreTitle
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = &stru_1F3E921E0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__VUISidebandMediaItem_genreTitle__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __34__VUISidebandMediaItem_genreTitle__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) genreName];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)addedDate
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__VUISidebandMediaItem_addedDate__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __33__VUISidebandMediaItem_addedDate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dateAdded];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)releaseDate
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__VUISidebandMediaItem_releaseDate__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __35__VUISidebandMediaItem_releaseDate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) releaseDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)storeID
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__VUISidebandMediaItem_storeID__block_invoke;
  v7[3] = &unk_1E6DF4130;
  id v4 = v2;
  id v8 = v4;
  id v9 = &v10;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __31__VUISidebandMediaItem_storeID__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) adamID];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)colorCapability
{
  return &unk_1F3F3D700;
}

- (id)HLSColorCapability
{
  return &unk_1F3F3D700;
}

- (id)isLocal
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = (id)MEMORY[0x1E4F1CC28];
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__VUISidebandMediaItem_isLocal__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __31__VUISidebandMediaItem_isLocal__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "downloadState") == 2);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)isPlayable
{
  return (id)MEMORY[0x1E4F1CC38];
}

- (id)showTitle
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__29;
  v18 = __Block_byref_object_dispose__29;
  id v19 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    id v6 = [v5 managedObjectContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__VUISidebandMediaItem_showTitle__block_invoke;
    v11[3] = &unk_1E6DF4B00;
    uint64_t v13 = &v14;
    id v7 = v5;
    id v12 = v7;
    [v6 performBlockAndWait:v11];
  }
  id v8 = (void *)v15[5];
  if (!v8)
  {
    v15[5] = (uint64_t)&stru_1F3E921E0;

    id v8 = (void *)v15[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __33__VUISidebandMediaItem_showTitle__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) series];
  uint64_t v2 = [v5 title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)showIdentifier
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    id v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__VUISidebandMediaItem_showIdentifier__block_invoke;
    v10[3] = &unk_1E6DF4130;
    id v7 = v5;
    id v11 = v7;
    id v12 = &v13;
    [v6 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __38__VUISidebandMediaItem_showIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) series];
  id v8 = [v2 objectID];

  if (v8)
  {
    uint64_t v3 = [VUISidebandMediaEntityIdentifier alloc];
    id v4 = +[VUIMediaEntityType show];
    uint64_t v5 = [(VUISidebandMediaEntityIdentifier *)v3 initWithManagedObjectID:v8 mediaEntityType:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)seasonNumber
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    uint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__VUISidebandMediaItem_seasonNumber__block_invoke;
    v10[3] = &unk_1E6DF4B00;
    id v12 = &v13;
    id v7 = v5;
    id v11 = v7;
    [v6 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __36__VUISidebandMediaItem_seasonNumber__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) season];
  uint64_t v2 = [v5 seasonNumber];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)seasonTitle
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    uint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__VUISidebandMediaItem_seasonTitle__block_invoke;
    v10[3] = &unk_1E6DF4B00;
    id v12 = &v13;
    id v7 = v5;
    id v11 = v7;
    [v6 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __35__VUISidebandMediaItem_seasonTitle__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) season];
  uint64_t v2 = [v5 title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)seasonIdentifier
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    uint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__VUISidebandMediaItem_seasonIdentifier__block_invoke;
    v10[3] = &unk_1E6DF4130;
    id v7 = v5;
    id v11 = v7;
    id v12 = &v13;
    [v6 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __40__VUISidebandMediaItem_seasonIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) season];
  id v13 = [v2 objectID];

  uint64_t v3 = [*(id *)(a1 + 32) series];
  id v4 = [v3 objectID];

  if (v13)
  {
    id v5 = [VUISidebandMediaEntityIdentifier alloc];
    uint64_t v6 = +[VUIMediaEntityType season];
    id v7 = v5;
    id v8 = v13;
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v9 = [VUISidebandMediaEntityIdentifier alloc];
    uint64_t v6 = +[VUIMediaEntityType season];
    id v7 = v9;
    id v8 = v4;
  }
  uint64_t v10 = [(VUISidebandMediaEntityIdentifier *)v7 initWithManagedObjectID:v8 mediaEntityType:v6];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_6:
}

- (id)seasonCanonicalID
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    uint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__VUISidebandMediaItem_seasonCanonicalID__block_invoke;
    v10[3] = &unk_1E6DF4B00;
    id v12 = &v13;
    id v7 = v5;
    id v11 = v7;
    [v6 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __41__VUISidebandMediaItem_seasonCanonicalID__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) season];
  uint64_t v2 = [v5 canonicalID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)showCanonicalID
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    uint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__VUISidebandMediaItem_showCanonicalID__block_invoke;
    v10[3] = &unk_1E6DF4B00;
    id v12 = &v13;
    id v7 = v5;
    id v11 = v7;
    [v6 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __39__VUISidebandMediaItem_showCanonicalID__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) series];
  uint64_t v2 = [v5 canonicalID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)episodeNumber
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    uint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__VUISidebandMediaItem_episodeNumber__block_invoke;
    v10[3] = &unk_1E6DF4B00;
    id v12 = &v13;
    id v7 = v5;
    id v11 = v7;
    [v6 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __37__VUISidebandMediaItem_episodeNumber__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) episodeNumberInSeason];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)fractionalEpisodeNumber
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    uint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__VUISidebandMediaItem_fractionalEpisodeNumber__block_invoke;
    v10[3] = &unk_1E6DF4B00;
    id v12 = &v13;
    id v7 = v5;
    id v11 = v7;
    [v6 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __47__VUISidebandMediaItem_fractionalEpisodeNumber__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fractionalEpisodeNumberInSeason];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)episodeIndexInSeries
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  uint64_t v3 = [(VUISidebandMediaItem *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    uint64_t v6 = [v5 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__VUISidebandMediaItem_episodeIndexInSeries__block_invoke;
    v10[3] = &unk_1E6DF4B00;
    id v12 = &v13;
    id v7 = v5;
    id v11 = v7;
    [v6 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __44__VUISidebandMediaItem_episodeIndexInSeries__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) episodeNumberInSeries];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)downloadExpirationDate
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__VUISidebandMediaItem_downloadExpirationDate__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __46__VUISidebandMediaItem_downloadExpirationDate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) expirationDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)availabilityEndDate
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__VUISidebandMediaItem_availabilityEndDate__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __43__VUISidebandMediaItem_availabilityEndDate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) availabilityEndDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)allowsManualDownloadRenewal
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VUISidebandMediaItem_allowsManualDownloadRenewal__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  id v8 = &v9;
  id v4 = v2;
  id v7 = v4;
  [v3 performBlockAndWait:v6];

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v3;
}

uint64_t __51__VUISidebandMediaItem_allowsManualDownloadRenewal__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) allowsManualRenewal];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)renewsOfflineKeysAutomatically
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__VUISidebandMediaItem_renewsOfflineKeysAutomatically__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  id v8 = &v9;
  id v4 = v2;
  id v7 = v4;
  [v3 performBlockAndWait:v6];

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v3;
}

void __54__VUISidebandMediaItem_renewsOfflineKeysAutomatically__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) offlineKeyRenewalPolicy];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue] == 1;
}

- (id)brandID
{
  id v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__VUISidebandMediaItem_brandID__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __31__VUISidebandMediaItem_brandID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) brandID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)brandName
{
  uint64_t v2 = [(VUISidebandMediaItem *)self videoManagedObject];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  uint64_t v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__VUISidebandMediaItem_brandName__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __33__VUISidebandMediaItem_brandName__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) brandName];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (VUIMediaEntityAssetController)assetController
{
  assetController = self->_assetController;
  if (!assetController)
  {
    id v4 = [VUIUniversalAssetController alloc];
    id v5 = [(VUISidebandMediaItem *)self videoManagedObject];
    uint64_t v6 = [(VUIUniversalAssetController *)v4 initWithVideoManagedObject:v5];
    id v7 = self->_assetController;
    self->_assetController = v6;

    assetController = self->_assetController;
  }
  return assetController;
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  id v5 = [VUISidebandMediaEntityImageLoadParams alloc];
  uint64_t v6 = [(VUISidebandMediaItem *)self videoManagedObject];
  id v7 = [(VUISidebandMediaEntityImageLoadParams *)v5 initWithVideoManagedObject:v6 imageType:a3];

  return v7;
}

- (void)_videoManagedObjectPlaybackExpirationWillChange:(id)a3
{
}

- (VUIVideoManagedObject)videoManagedObject
{
  return self->_videoManagedObject;
}

- (void)setVideoManagedObject:(id)a3
{
}

- (void)setAssetController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_videoManagedObject, 0);
}

@end