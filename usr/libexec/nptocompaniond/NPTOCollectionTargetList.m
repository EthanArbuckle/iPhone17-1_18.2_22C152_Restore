@interface NPTOCollectionTargetList
+ (Class)collectionTargetItemType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)collectionTargetItems;
- (id)collectionTargetItemAtIndex:(unint64_t)a3;
- (id)collectionTargetMapWithLibrary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)collectionTargetItemsCount;
- (unint64_t)hash;
- (void)addCollectionTargetItem:(id)a3;
- (void)clearCollectionTargetItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionTargetItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPTOCollectionTargetList

- (id)collectionTargetMapWithLibrary:(id)a3
{
  id v4 = a3;
  id v46 = objc_alloc_init((Class)NSMutableDictionary);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = [(NPTOCollectionTargetList *)self collectionTargetItems];
  id v44 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v48;
    uint64_t v42 = NPTOLibraryAssetCollectionAssetUUIDsKey;
    uint64_t v41 = NPTOLibraryAssetCollectionKeyAssetUUIDsKey;
    uint64_t v40 = NPTOLibraryAssetCollectionTitleKey;
    uint64_t v39 = NPTOLibraryAssetCollectionSubtitleKey;
    uint64_t v38 = NPTOLibraryAssetCollectionMetadataKey;
    v5 = &_sSo8NSObjectCSH10ObjectiveCMc_ptr;
    uint64_t v45 = NPTOLibraryAssetCollectionSubtypeKey;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v48 != v43) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v8 = objc_alloc_init((Class)NSMutableDictionary);
        id v9 = objc_alloc_init((Class)v5[75]);
        if ([v7 assetIndexsCount])
        {
          unint64_t v10 = 0;
          do
          {
            v11 = [v4 assetAtIndex:[v7 assetIndexAtIndex:v10]];
            v12 = [v11 uuidData];
            v13 = [v12 npto_uuid];
            [v9 addObject:v13];

            ++v10;
          }
          while (v10 < (unint64_t)[v7 assetIndexsCount]);
        }
        if ([v9 count])
        {
          id v14 = [v9 copy];
          [v8 setObject:v14 forKeyedSubscript:v42];
        }
        id v15 = objc_alloc_init((Class)v5[75]);
        if ([v7 keyAssetIndexsCount])
        {
          unint64_t v16 = 0;
          do
          {
            v17 = [v4 assetAtIndex:[v7 keyAssetIndexAtIndex:v16]];
            v18 = [v17 uuidData];
            v19 = [v18 npto_uuid];
            [v15 addObject:v19];

            ++v16;
          }
          while (v16 < (unint64_t)[v7 keyAssetIndexsCount]);
        }
        if ([v15 count])
        {
          id v20 = [v15 copy];
          [v8 setObject:v20 forKeyedSubscript:v41];
        }
        v21 = [v7 title];

        if (v21)
        {
          v22 = [v7 title];
          [v8 setObject:v22 forKeyedSubscript:v40];
        }
        v23 = [v7 subtitle];

        if (v23)
        {
          v24 = [v7 subtitle];
          [v8 setObject:v24 forKeyedSubscript:v39];
        }
        v25 = [v7 collectionMetadata];

        if (v25)
        {
          v26 = [v7 collectionMetadata];
          [v8 setObject:v26 forKeyedSubscript:v38];
        }
        if ([v7 type])
        {
          v27 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 type]);
          [v8 setObject:v27 forKeyedSubscript:v45];
        }
        if ([v7 subtype])
        {
          v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 subtype]);
          [v8 setObject:v28 forKeyedSubscript:v45];
        }
        v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 collectionTarget]);
        id v30 = [v46 objectForKeyedSubscript:v29];

        if (!v30)
        {
          id v30 = objc_alloc_init((Class)NSMutableDictionary);
          v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 collectionTarget]);
          [v46 setObject:v30 forKeyedSubscript:v31];
        }
        id v32 = [v8 copy];
        v33 = [v7 uuidData];
        v34 = [v33 npto_uuid];
        [v30 setObject:v32 forKeyedSubscript:v34];

        v5 = &_sSo8NSObjectCSH10ObjectiveCMc_ptr;
      }
      id v44 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v44);
  }

  id v35 = [v46 copy];

  return v35;
}

- (void)clearCollectionTargetItems
{
}

- (void)addCollectionTargetItem:(id)a3
{
  id v4 = a3;
  collectionTargetItems = self->_collectionTargetItems;
  id v8 = v4;
  if (!collectionTargetItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_collectionTargetItems;
    self->_collectionTargetItems = v6;

    id v4 = v8;
    collectionTargetItems = self->_collectionTargetItems;
  }
  [(NSMutableArray *)collectionTargetItems addObject:v4];
}

- (unint64_t)collectionTargetItemsCount
{
  return (unint64_t)[(NSMutableArray *)self->_collectionTargetItems count];
}

- (id)collectionTargetItemAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_collectionTargetItems objectAtIndex:a3];
}

+ (Class)collectionTargetItemType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPTOCollectionTargetList;
  v3 = [(NPTOCollectionTargetList *)&v7 description];
  id v4 = [(NPTOCollectionTargetList *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_collectionTargetItems count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_collectionTargetItems, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_collectionTargetItems;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation:v12];
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"collectionTargetItem"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPTOCollectionTargetListReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_collectionTargetItems;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(NPTOCollectionTargetList *)self collectionTargetItemsCount])
  {
    [v8 clearCollectionTargetItems];
    unint64_t v4 = [(NPTOCollectionTargetList *)self collectionTargetItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(NPTOCollectionTargetList *)self collectionTargetItemAtIndex:i];
        [v8 addCollectionTargetItem:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_collectionTargetItems;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [[*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addCollectionTargetItem:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    collectionTargetItems = self->_collectionTargetItems;
    if ((unint64_t)collectionTargetItems | v4[1]) {
      unsigned __int8 v6 = -[NSMutableArray isEqual:](collectionTargetItems, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->_collectionTargetItems hash];
}

- (void)mergeFrom:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NPTOCollectionTargetList addCollectionTargetItem:](self, "addCollectionTargetItem:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)collectionTargetItems
{
  return self->_collectionTargetItems;
}

- (void)setCollectionTargetItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end