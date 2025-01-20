@interface PXExportContainer
+ (id)containersForRootCollection:(id)a3 destinationURL:(id)a4;
+ (id)containersForRootCollection:(id)a3 destinationURL:(id)a4 uniquifier:(id)a5 includeRootName:(BOOL)a6;
+ (void)_traverseStartingAt:(id)a3 prefix:(id)a4 storeIn:(id)a5 uniquifier:(id)a6;
- (NSString)localizedTitle;
- (NSURL)url;
- (PHFetchResult)assets;
- (PXExportContainer)init;
- (id)_initWithCollection:(id)a3;
- (id)description;
- (void)setUrl:(id)a3;
@end

@implementation PXExportContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; model = %@, url = %@>",
               objc_opt_class(),
               self,
               self->_collection,
               self->_url);
}

- (NSString)localizedTitle
{
  return [(PHCollection *)self->_collection localizedTitle];
}

- (PHFetchResult)assets
{
  if ([(PHCollection *)self->_collection canContainAssets])
  {
    v3 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:self->_collection options:0];
  }
  else
  {
    v3 = 0;
  }
  return (PHFetchResult *)v3;
}

- (PXExportContainer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_containersForRootCollection_destinationURL_);
  [v4 handleFailureInMethod:a2, self, @"PXExportContainer.m", 98, @"Use class factory method %@", v5 object file lineNumber description];

  return 0;
}

- (id)_initWithCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXExportContainer;
  v6 = [(PXExportContainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collection, a3);
  }

  return v7;
}

+ (void)_traverseStartingAt:(id)a3 prefix:(id)a4 storeIn:(id)a5 uniquifier:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [[PXExportContainer alloc] _initWithCollection:v9];
  [v13 setUrl:v10];
  v27 = v13;
  [v11 addObject:v13];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v28 = v9;
  id obj = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v9 options:0];
  uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v18 canContainCollections])
        {
          if ([v18 isTrashed]) {
            continue;
          }
          v19 = [v18 localizedTitle];
          id v20 = +[PXDragAndDropUtilities sanitizedFileNameForString:v19];

          v21 = (void *)[v10 copy];
          v22 = [v21 URLByAppendingPathComponent:v20];

          if (v12)
          {
            uint64_t v23 = [v12 ensureUniqueFileURL:v22];

            v22 = (void *)v23;
          }
          [a1 _traverseStartingAt:v18 prefix:v22 storeIn:v11 uniquifier:v12];
        }
        else
        {
          id v20 = [[PXExportContainer alloc] _initWithCollection:v18];
          v24 = [v18 localizedTitle];
          v22 = +[PXDragAndDropUtilities sanitizedFileNameForString:v24];

          v25 = [v10 URLByAppendingPathComponent:v22];
          if (v12)
          {
            uint64_t v26 = [v12 ensureUniqueFileURL:v25];

            v25 = (void *)v26;
          }
          [v20 setUrl:v25];
          [v11 addObject:v20];
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v15);
  }
}

+ (id)containersForRootCollection:(id)a3 destinationURL:(id)a4 uniquifier:(id)a5 includeRootName:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v10 canContainAssets])
  {
    id v14 = [[PXExportContainer alloc] _initWithCollection:v10];
    id v11 = v11;
    uint64_t v15 = v11;
    if (v6)
    {
      uint64_t v16 = [v10 localizedTitle];
      v17 = +[PXDragAndDropUtilities sanitizedFileNameForString:v16];

      uint64_t v15 = [v11 URLByAppendingPathComponent:v17];

      if (v12)
      {
        uint64_t v18 = [v12 ensureUniqueFileURL:v15];

        uint64_t v15 = (void *)v18;
      }
    }
    [v14 setUrl:v15];
    [v13 addObject:v14];
  }
  else
  {
    if (v6)
    {
      v19 = [v10 localizedTitle];
      id v20 = +[PXDragAndDropUtilities sanitizedFileNameForString:v19];

      v21 = [v11 URLByAppendingPathComponent:v20];

      if (v12)
      {
        uint64_t v22 = [v12 ensureUniqueFileURL:v21];

        v21 = (void *)v22;
      }

      id v11 = v21;
    }
    [a1 _traverseStartingAt:v10 prefix:v11 storeIn:v13 uniquifier:v12];
  }

  return v13;
}

+ (id)containersForRootCollection:(id)a3 destinationURL:(id)a4
{
  return (id)[a1 containersForRootCollection:a3 destinationURL:a4 uniquifier:0 includeRootName:0];
}

@end