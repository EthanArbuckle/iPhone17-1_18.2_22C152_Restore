@interface PXPhotoKitCollectionMenuNode
+ (id)rootNodeForAssetCollectionsContainingAsset:(id)a3 excludedAssetCollection:(id)a4;
- (NSArray)childNodes;
- (NSString)localizedTitle;
- (NSString)symbolName;
- (PHCollection)collection;
- (PXPhotoKitCollectionMenuNode)init;
- (PXPhotoKitCollectionMenuNode)initWithCollection:(id)a3;
- (void)addChildNode:(id)a3;
- (void)sortChildNodes;
@end

@implementation PXPhotoKitCollectionMenuNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_childNodesByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_childNodes, 0);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (PHCollection)collection
{
  return self->_collection;
}

- (void)sortChildNodes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(PXPhotoKitCollectionMenuNode *)self collection];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;

    if (v4 && (unint64_t)[(NSMutableDictionary *)self->_childNodesByLocalIdentifier count] >= 2)
    {
      v5 = [v4 photoLibrary];
      v6 = [v5 librarySpecificFetchOptions];

      v7 = (void *)MEMORY[0x1E4F28F60];
      v8 = [(NSMutableDictionary *)self->_childNodesByLocalIdentifier allKeys];
      v9 = [v7 predicateWithFormat:@"localIdentifier in (%@)", v8];
      [v6 setPredicate:v9];

      v10 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v4 options:v6];
      [(NSMutableArray *)self->_childNodes removeAllObjects];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            childNodesByLocalIdentifier = self->_childNodesByLocalIdentifier;
            v17 = [*(id *)(*((void *)&v19 + 1) + 8 * v15) localIdentifier];
            v18 = [(NSMutableDictionary *)childNodesByLocalIdentifier objectForKey:v17];

            [(NSMutableArray *)self->_childNodes addObject:v18];
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }
    }
  }
  else
  {

    id v4 = 0;
  }
}

- (void)addChildNode:(id)a3
{
  childNodesByLocalIdentifier = self->_childNodesByLocalIdentifier;
  id v7 = a3;
  v5 = [v7 collection];
  v6 = [v5 localIdentifier];
  [(NSMutableDictionary *)childNodesByLocalIdentifier setObject:v7 forKey:v6];

  [(NSMutableArray *)self->_childNodes addObject:v7];
}

- (NSArray)childNodes
{
  v2 = (void *)[(NSMutableArray *)self->_childNodes copy];
  return (NSArray *)v2;
}

- (NSString)localizedTitle
{
  v2 = [(PXPhotoKitCollectionMenuNode *)self collection];
  v3 = [v2 localizedTitle];

  return (NSString *)v3;
}

- (PXPhotoKitCollectionMenuNode)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitCollectionMenuNode.m", 66, @"%s is not available as initializer", "-[PXPhotoKitCollectionMenuNode init]");

  abort();
}

- (PXPhotoKitCollectionMenuNode)initWithCollection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotoKitCollectionMenuNode;
  v6 = [(PXPhotoKitCollectionMenuNode *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    if ([v5 canContainAssets]) {
      v8 = @"rectangle.stack";
    }
    else {
      v8 = @"folder";
    }
    objc_storeStrong((id *)&v7->_symbolName, v8);
    uint64_t v9 = objc_opt_new();
    childNodes = v7->_childNodes;
    v7->_childNodes = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    childNodesByLocalIdentifier = v7->_childNodesByLocalIdentifier;
    v7->_childNodesByLocalIdentifier = (NSMutableDictionary *)v11;
  }
  return v7;
}

+ (id)rootNodeForAssetCollectionsContainingAsset:(id)a3 excludedAssetCollection:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 photoLibrary];
  uint64_t v9 = [v8 librarySpecificFetchOptions];

  v27 = (void *)v9;
  v10 = [MEMORY[0x1E4F39008] fetchRootAlbumCollectionListWithOptions:v9];
  uint64_t v11 = [v10 firstObject];

  v26 = (void *)v11;
  id v32 = (id)[objc_alloc((Class)a1) initWithCollection:v11];
  uint64_t v12 = objc_opt_new();
  v28 = v7;
  v29 = v6;
  objc_msgSend(MEMORY[0x1E4F38EE8], "px_fetchContainingCollectionsForAsset:excludedAssetCollection:", v6, v7);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v40;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v13;
        objc_super v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
        id v15 = v32;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v16 = objc_msgSend(v14, "px_fetchAncestryIncludingRoot:", 0);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v36;
          do
          {
            uint64_t v20 = 0;
            long long v21 = v15;
            do
            {
              if (*(void *)v36 != v19) {
                objc_enumerationMutation(v16);
              }
              long long v22 = *(void **)(*((void *)&v35 + 1) + 8 * v20);
              if ([v22 canContainCollections])
              {
                v23 = [v22 localIdentifier];
                id v15 = [v12 objectForKeyedSubscript:v23];

                if (v15) {
                  goto LABEL_16;
                }
                id v15 = (id)[objc_alloc((Class)a1) initWithCollection:v22];
                uint64_t v24 = [v22 localIdentifier];
                [v12 setObject:v15 forKeyedSubscript:v24];
              }
              else
              {
                id v15 = (id)[objc_alloc((Class)a1) initWithCollection:v22];
              }
              [v21 addChildNode:v15];
LABEL_16:

              ++v20;
              long long v21 = v15;
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v18);
        }

        uint64_t v13 = v34 + 1;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v33);
  }

  return v32;
}

@end