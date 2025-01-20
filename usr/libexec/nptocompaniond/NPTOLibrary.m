@interface NPTOLibrary
+ (Class)assetCollectionType;
+ (Class)assetType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)assetCollections;
- (NSMutableArray)assets;
- (id)_npto_assetCollections;
- (id)_npto_assetIndices;
- (id)_npto_assetUUIDsInAssetCollection:(id)a3;
- (id)assetAtIndex:(unint64_t)a3;
- (id)assetCollectionAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)npto_assetCollectionsContainingAssetUUID:(id)a3;
- (id)npto_changesFromLibrary:(id)a3 excludingAssets:(id)a4;
- (int64_t)_npto_addAsset:(id)a3;
- (int64_t)npto_indexOfAsset:(id)a3;
- (unint64_t)assetCollectionsCount;
- (unint64_t)assetsCount;
- (unint64_t)hash;
- (void)addAsset:(id)a3;
- (void)addAssetCollection:(id)a3;
- (void)clearAssetCollections;
- (void)clearAssets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)npto_addAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5;
- (void)npto_addAssetCollections:(id)a3;
- (void)npto_addAssets:(id)a3;
- (void)setAssetCollections:(id)a3;
- (void)setAssets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPTOLibrary

- (void)clearAssets
{
}

- (void)addAsset:(id)a3
{
  id v4 = a3;
  assets = self->_assets;
  id v8 = v4;
  if (!assets)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_assets;
    self->_assets = v6;

    id v4 = v8;
    assets = self->_assets;
  }
  [(NSMutableArray *)assets addObject:v4];
}

- (unint64_t)assetsCount
{
  return (unint64_t)[(NSMutableArray *)self->_assets count];
}

- (id)assetAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_assets objectAtIndex:a3];
}

+ (Class)assetType
{
  return (Class)objc_opt_class();
}

- (void)clearAssetCollections
{
}

- (void)addAssetCollection:(id)a3
{
  id v4 = a3;
  assetCollections = self->_assetCollections;
  id v8 = v4;
  if (!assetCollections)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_assetCollections;
    self->_assetCollections = v6;

    id v4 = v8;
    assetCollections = self->_assetCollections;
  }
  [(NSMutableArray *)assetCollections addObject:v4];
}

- (unint64_t)assetCollectionsCount
{
  return (unint64_t)[(NSMutableArray *)self->_assetCollections count];
}

- (id)assetCollectionAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_assetCollections objectAtIndex:a3];
}

+ (Class)assetCollectionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPTOLibrary;
  v3 = [(NPTOLibrary *)&v7 description];
  id v4 = [(NPTOLibrary *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_assets count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_assets, "count")];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_assets;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"asset"];
  }
  if ([(NSMutableArray *)self->_assetCollections count])
  {
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_assetCollections, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_assetCollections;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)j) dictionaryRepresentation:v19];
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"assetCollection"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPTOLibraryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_assets;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_assetCollections;
  id v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(NPTOLibrary *)self assetsCount])
  {
    [v12 clearAssets];
    unint64_t v4 = [(NPTOLibrary *)self assetsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(NPTOLibrary *)self assetAtIndex:i];
        [v12 addAsset:v7];
      }
    }
  }
  if ([(NPTOLibrary *)self assetCollectionsCount])
  {
    [v12 clearAssetCollections];
    unint64_t v8 = [(NPTOLibrary *)self assetCollectionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(NPTOLibrary *)self assetCollectionAtIndex:j];
        [v12 addAssetCollection:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = self->_assets;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addAsset:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_assetCollections;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) copyWithZone:a3];
        [v5 addAssetCollection:v17];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((assets = self->_assets, !((unint64_t)assets | v4[2]))
     || -[NSMutableArray isEqual:](assets, "isEqual:")))
  {
    assetCollections = self->_assetCollections;
    if ((unint64_t)assetCollections | v4[1]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](assetCollections, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_assets hash];
  return (unint64_t)[(NSMutableArray *)self->_assetCollections hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NPTOLibrary *)self addAsset:*(void *)(*((void *)&v19 + 1) + 8 * (void)v9)];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NPTOLibrary addAssetCollection:](self, "addAssetCollection:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), (void)v15);
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (NSMutableArray)assetCollections
{
  return self->_assetCollections;
}

- (void)setAssetCollections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);

  objc_storeStrong((id *)&self->_assetCollections, 0);
}

- (void)npto_addAssets:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        -[NPTOLibrary _npto_addAsset:](self, "_npto_addAsset:", v9, (void)v11);
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)npto_addAssetCollections:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        long long v11 = +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v9, 0, (void)v13);
        long long v12 = +[PHAsset fetchKeyAssetsInAssetCollection:v9 options:0];
        [(NPTOLibrary *)self npto_addAssetCollection:v9 assets:v11 keyAssets:v12];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)npto_addAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(NPTOLibrary *)self _npto_assetCollections];
  long long v12 = [v8 npto_uuid];
  v35 = v11;
  long long v13 = [v11 objectForKey:v12];

  if (!v13)
  {
    long long v13 = objc_alloc_init(NPTOAssetCollection);
    long long v14 = [v8 npto_uuid];
    long long v15 = [v14 npto_data];
    [(NPTOAssetCollection *)v13 setUuidData:v15];

    long long v16 = [v8 localizedTitle];
    [(NPTOAssetCollection *)v13 setTitle:v16];

    long long v17 = [v8 localizedSubtitle];
    [(NPTOAssetCollection *)v13 setDeprecatedSubtitle:v17];

    if ([v10 count])
    {
      long long v18 = [v10 firstObject];
      long long v19 = [v18 npto_uuid];
      long long v20 = [v19 npto_data];
      [(NPTOAssetCollection *)v13 setDeprecatedKeyAssetUUIDData:v20];
    }
    [(NPTOLibrary *)self addAssetCollection:v13];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v21 = v9;
  id v22 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      long long v25 = 0;
      do
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v25);
        [(NPTOAssetCollection *)v13 addAssetIndex:[(NPTOLibrary *)self _npto_addAsset:v26]];
        long long v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v23);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v28 = v10;
  id v29 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v37;
    do
    {
      v32 = 0;
      do
      {
        if (*(void *)v37 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v32);
        [(NPTOAssetCollection *)v13 addAssetIndex:[(NPTOLibrary *)self _npto_addAsset:v33]];
        v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      id v30 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v30);
  }
}

- (int64_t)npto_indexOfAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(NPTOLibrary *)self _npto_assetIndices];
  id v6 = [v4 localIdentifier];

  uint64_t v7 = [v5 objectForKey:v6];

  if (v7) {
    int64_t v8 = (int64_t)[v7 integerValue];
  }
  else {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)npto_changesFromLibrary:(id)a3 excludingAssets:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[NPTOLibraryChanges alloc] _initWithMasterLibrary:self clientLibrary:v7 excludedAssets:v6];

  return v8;
}

- (id)npto_assetCollectionsContainingAssetUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPTOLibrary *)self assetCollections];
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(NPTOLibrary *)self assetCollections];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = [(NPTOLibrary *)self _npto_assetUUIDsInAssetCollection:v12];
        unsigned int v14 = [v13 containsObject:v4];

        if (v14) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v15 = [v6 copy];

  return v15;
}

- (int64_t)_npto_addAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(NPTOLibrary *)self _npto_assetIndices];
  id v6 = [v4 localIdentifier];
  id v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    id v8 = objc_alloc_init(NPTOAsset);
    id v9 = [v4 npto_uuid];
    uint64_t v10 = [v9 npto_data];
    [(NPTOAsset *)v8 setUuidData:v10];

    long long v11 = [v4 modificationDate];
    if (v11)
    {
      [(NPTOAsset *)v8 setDateAsDate:v11];
    }
    else
    {
      uint64_t v12 = [v4 creationDate];
      [(NPTOAsset *)v8 setDateAsDate:v12];
    }
    [(NPTOLibrary *)self addAsset:v8];
    id v7 = +[NSNumber numberWithUnsignedInteger:(char *)[(NPTOLibrary *)self assetsCount] - 1];
    long long v13 = [v4 localIdentifier];
    [v5 setObject:v7 forKey:v13];
  }
  id v14 = [v7 integerValue];

  return (int64_t)v14;
}

- (id)_npto_assetIndices
{
  unint64_t v3 = objc_getAssociatedObject(self, "_npto_assetIndices");
  if (!v3)
  {
    unint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    objc_setAssociatedObject(self, "_npto_assetIndices", v3, (void *)1);
  }

  return v3;
}

- (id)_npto_assetCollections
{
  unint64_t v3 = objc_getAssociatedObject(self, "_npto_assetCollections");
  if (!v3)
  {
    unint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    objc_setAssociatedObject(self, "_npto_assetCollections", v3, (void *)1);
  }

  return v3;
}

- (id)_npto_assetUUIDsInAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 assetIndexsCount]);
  if ([v4 assetIndexsCount])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = -[NPTOLibrary assetAtIndex:](self, "assetAtIndex:", (int)[v4 assetIndexAtIndex:v6]);
      id v8 = [v7 uuidData];
      id v9 = [v8 npto_uuid];
      [v5 addObject:v9];

      ++v6;
    }
    while (v6 < (unint64_t)[v4 assetIndexsCount]);
  }
  id v10 = [v5 copy];

  return v10;
}

@end