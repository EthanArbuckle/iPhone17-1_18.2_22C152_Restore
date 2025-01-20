@interface NTKPigmentCollection
+ (id)collectionFromProtoBuffer:(id)a3;
+ (id)collectionFromProtoBuffer:(id)a3 sharedCollections:(id)a4;
+ (id)stubCollectionWithName:(id)a3;
- (BOOL)hasAddableCollection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRootCollection;
- (BOOL)isShared;
- (BOOL)isStub;
- (NSArray)collections;
- (NSArray)defaultGalleryColors;
- (NSDictionary)collectionsByName;
- (NSDictionary)migration;
- (NSMutableDictionary)faceSpecificPigmentsByFullname;
- (NSOrderedSet)allItems;
- (NSOrderedSet)items;
- (NSString)collectionName;
- (NTKPigmentCollection)initWithName:(id)a3;
- (NTKPigmentCollectionConfig)config;
- (NTKPigmentEditOption)defaultOption;
- (id)_pigmentForName:(id)a3;
- (id)buildNamesMappingWithPigments:(id)a3;
- (id)defaultOptionWithName:(id)a3;
- (id)description;
- (id)pigmentsFromMostRecentAddableCollection;
- (id)pigmentsFromMostRecentAddableCollections;
- (id)protoBuffer;
- (id)protoBufferIgnoringSharedCollections:(BOOL)a3;
- (unint64_t)count;
- (void)appendCollection:(id)a3;
- (void)fulfillWithSharedCollections:(id)a3;
- (void)mergeWithCollection:(id)a3;
- (void)setCollectionName:(id)a3;
- (void)setCollections:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDefaultGalleryColorWithNames:(id)a3;
- (void)setDefaultGalleryColors:(id)a3;
- (void)setDefaultOption:(id)a3;
- (void)setFaceSpecificPigmentsByFullname:(id)a3;
- (void)setItems:(id)a3;
- (void)setMigration:(id)a3;
- (void)setShared:(BOOL)a3;
- (void)setStub:(BOOL)a3;
@end

@implementation NTKPigmentCollection

- (NTKPigmentCollection)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKPigmentCollection;
  v6 = [(NTKPigmentCollection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collectionName, a3);
  }

  return v7;
}

+ (id)stubCollectionWithName:(id)a3
{
  id v3 = a3;
  v4 = [[NTKPigmentCollection alloc] initWithName:v3];

  [(NTKPigmentCollection *)v4 setStub:1];
  return v4;
}

- (NSOrderedSet)allItems
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_allItems)
  {
    id v3 = (void *)MEMORY[0x1E4F1CA70];
    v4 = [(NTKPigmentCollection *)v2 items];
    id v5 = [v4 array];
    v6 = [v3 orderedSetWithArray:v5];

    v7 = [(NTKPigmentCollection *)v2 config];
    v8 = [v7 isAddable];

    objc_super v9 = [(NTKPigmentCollection *)v2 collections];
    if (v8)
    {
      v10 = v16;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __32__NTKPigmentCollection_allItems__block_invoke;
      v16[3] = &unk_1E62C4040;
      v16[4] = v6;
      [v9 enumerateObjectsWithOptions:2 usingBlock:v16];
    }
    else
    {
      v10 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __32__NTKPigmentCollection_allItems__block_invoke_2;
      v15[3] = &unk_1E62C4040;
      v15[4] = v6;
      [v9 enumerateObjectsUsingBlock:v15];
    }

    v11 = [(NTKPigmentCollection *)v2 config];
    [v11 removeExcludedItemsFromList:v6];

    allItems = v2->_allItems;
    v2->_allItems = v6;
  }
  objc_sync_exit(v2);

  v13 = v2->_allItems;
  return v13;
}

void __32__NTKPigmentCollection_allItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 allItems];
  id v3 = [v4 array];
  [v2 addObjectsFromArray:v3];
}

void __32__NTKPigmentCollection_allItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 allItems];
  id v3 = [v4 array];
  [v2 addObjectsFromArray:v3];
}

- (unint64_t)count
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_allItems) {
    goto LABEL_5;
  }
  id v3 = [(NTKPigmentCollection *)v2 config];
  id v4 = [v3 exclusions];
  if ([v4 count])
  {

LABEL_5:
    v8 = [(NTKPigmentCollection *)v2 allItems];
    unint64_t v9 = [v8 count];

    goto LABEL_6;
  }
  id v5 = [(NTKPigmentCollection *)v2 config];
  v6 = [v5 excludesDuotone];
  char v7 = [v6 BOOLValue];

  if (v7) {
    goto LABEL_5;
  }
  v11 = [(NTKPigmentCollection *)v2 items];
  unint64_t v9 = [v11 count];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v12 = [(NTKPigmentCollection *)v2 collections];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        v9 += [*(id *)(*((void *)&v16 + 1) + 8 * v15++) count];
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

LABEL_6:
  objc_sync_exit(v2);

  return v9;
}

- (BOOL)hasAddableCollection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKPigmentCollection *)self config];
  id v4 = [v3 isAddable];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v7 = [(NTKPigmentCollection *)self collections];
    uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) hasAddableCollection])
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v6;
}

- (NSOrderedSet)items
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_items;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isRootCollection
{
  v2 = [(NTKPigmentCollection *)self collectionName];
  char v3 = [v2 containsString:@"."] ^ 1;

  return v3;
}

- (void)setItems:(id)a3
{
  id v11 = a3;
  char v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_items, a3);
  defaultOption = v5->_defaultOption;
  v5->_defaultOption = 0;

  allItems = v5->_allItems;
  v5->_allItems = 0;

  uint64_t v8 = [(NTKPigmentCollection *)v5 buildNamesMappingWithPigments:v11];
  itemsByName = v5->_itemsByName;
  v5->_itemsByName = (NSMutableDictionary *)v8;

  faceSpecificPigmentsByFullname = v5->_faceSpecificPigmentsByFullname;
  v5->_faceSpecificPigmentsByFullname = 0;

  objc_sync_exit(v5);
}

- (NSArray)collections
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_collections;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCollections:(id)a3
{
  id v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  collections = obj->_collections;
  obj->_collections = v4;
  uint64_t v6 = v4;

  collectionsByName = obj->_collectionsByName;
  obj->_collectionsByName = 0;

  defaultOption = obj->_defaultOption;
  obj->_defaultOption = 0;

  allItems = obj->_allItems;
  obj->_allItems = 0;

  faceSpecificPigmentsByFullname = obj->_faceSpecificPigmentsByFullname;
  obj->_faceSpecificPigmentsByFullname = 0;

  objc_sync_exit(obj);
}

- (void)appendCollection:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  uint64_t v6 = [(NTKPigmentCollection *)self collections];
  id v8 = [v4 arrayWithArray:v6];

  [v8 addObject:v5];
  char v7 = (void *)[v8 copy];
  [(NTKPigmentCollection *)self setCollections:v7];
}

- (NSDictionary)collectionsByName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  collectionsByName = self->_collectionsByName;
  if (!collectionsByName)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA60];
    id v5 = [(NTKPigmentCollection *)self collections];
    objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    char v7 = self->_collectionsByName;
    self->_collectionsByName = v6;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [(NTKPigmentCollection *)self collections];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          long long v14 = self->_collectionsByName;
          uint64_t v15 = [v13 collectionName];
          [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    collectionsByName = self->_collectionsByName;
  }
  return (NSDictionary *)collectionsByName;
}

- (NTKPigmentEditOption)defaultOption
{
  v2 = self;
  objc_sync_enter(v2);
  defaultOption = v2->_defaultOption;
  if (!defaultOption)
  {
    id v4 = [(NTKPigmentCollectionConfig *)v2->_config defaultColorOptionName];
    uint64_t v5 = [(NTKPigmentCollection *)v2 defaultOptionWithName:v4];
    uint64_t v6 = v2->_defaultOption;
    v2->_defaultOption = (NTKPigmentEditOption *)v5;

    defaultOption = v2->_defaultOption;
    if (!defaultOption)
    {
      char v7 = [(NTKPigmentCollectionConfig *)v2->_config fallbackDefaultColorOptionName];
      uint64_t v8 = [(NTKPigmentCollection *)v2 defaultOptionWithName:v7];
      uint64_t v9 = v2->_defaultOption;
      v2->_defaultOption = (NTKPigmentEditOption *)v8;

      defaultOption = v2->_defaultOption;
      if (!defaultOption)
      {
        uint64_t v10 = [(NTKPigmentCollection *)v2 allItems];
        uint64_t v11 = [v10 firstObject];
        long long v12 = v2->_defaultOption;
        v2->_defaultOption = (NTKPigmentEditOption *)v11;

        defaultOption = v2->_defaultOption;
      }
    }
  }
  long long v13 = defaultOption;
  objc_sync_exit(v2);

  return v13;
}

- (id)defaultOptionWithName:(id)a3
{
  id v12 = 0;
  double v13 = 0.0;
  id v11 = 0;
  +[NTKPigmentEditOption parseFullname:a3 collectionName:&v12 optionName:&v11 fraction:&v13];
  id v4 = v12;
  id v5 = v11;
  uint64_t v6 = +[NTKPigmentEditOption fullnameWithCollectionName:v4 optionName:v5];
  char v7 = [(NTKPigmentCollection *)self _pigmentForName:v6];
  if ([v7 supportsSlider])
  {
    [v7 colorFraction];
    if (v8 != v13)
    {
      uint64_t v9 = objc_msgSend(v7, "copyWithColorFraction:");

      char v7 = (void *)v9;
    }
  }

  return v7;
}

- (void)setDefaultOption:(id)a3
{
  id v4 = (NTKPigmentEditOption *)a3;
  obj = self;
  objc_sync_enter(obj);
  defaultOption = obj->_defaultOption;
  obj->_defaultOption = v4;

  objc_sync_exit(obj);
}

- (void)setDefaultGalleryColorWithNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[NTKPigmentCollection _pigmentForName:](self, "_pigmentForName:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];
  [(NTKPigmentCollection *)self setDefaultGalleryColors:v12];
}

- (id)buildNamesMappingWithPigments:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "effectiveOptionName", (void)v20);

        if (v11)
        {
          id v12 = [v10 effectiveOptionName];
          [v4 setObject:v10 forKeyedSubscript:v12];
        }
        long long v13 = [v10 optionName];

        if (v13)
        {
          long long v14 = [v10 optionName];
          [v4 setObject:v10 forKeyedSubscript:v14];
        }
        long long v15 = [v10 fullname];

        if (v15)
        {
          long long v16 = [v10 fullname];
          [v4 setObject:v10 forKeyedSubscript:v16];
        }
        long long v17 = [v10 identifier];

        if (v17)
        {
          uint64_t v18 = [v10 identifier];
          [v4 setObject:v10 forKeyedSubscript:v18];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_pigmentForName:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_itemsByName objectForKeyedSubscript:v4];
  if (!v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(NTKPigmentCollection *)v5 collections];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v6 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) _pigmentForName:v4];
        if (v6) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      uint64_t v6 = 0;
    }
  }
  objc_sync_exit(v5);

  return v6;
}

- (NSDictionary)migration
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  migration = v2->_migration;
  if (!migration)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA60];
    id v5 = [(NTKPigmentCollection *)v2 config];
    uint64_t v6 = [v5 migration];
    uint64_t v7 = [v4 dictionaryWithDictionary:v6];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [(NTKPigmentCollection *)v2 collections];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) migration];
          [v7 addEntriesFromDictionary:v12];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [v7 copy];
    long long v14 = v2->_migration;
    v2->_migration = (NSDictionary *)v13;

    migration = v2->_migration;
  }
  long long v15 = migration;
  objc_sync_exit(v2);

  return v15;
}

- (id)pigmentsFromMostRecentAddableCollection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(NTKPigmentCollection *)self allItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 isAddable])
        {
          if (!v8
            || ([v11 collectionName],
                long long v12 = objc_claimAutoreleasedReturnValue(),
                char v13 = [v12 isEqualToString:v8],
                v12,
                (v13 & 1) == 0))
          {
            if (v7 > 0) {
              goto LABEL_16;
            }
            uint64_t v14 = [v11 collectionName];

            uint64_t v7 = 1;
            uint64_t v8 = (void *)v14;
          }
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_16:

  return v3;
}

- (id)pigmentsFromMostRecentAddableCollections
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(NTKPigmentCollection *)self allItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 isAddable])
        {
          if (!v7
            || ([v10 collectionName],
                id v11 = objc_claimAutoreleasedReturnValue(),
                char v12 = [v11 isEqualToString:v7],
                v11,
                (v12 & 1) == 0))
          {
            if ((unint64_t)[v3 count] > 1) {
              goto LABEL_16;
            }
            uint64_t v13 = [v10 collectionName];

            uint64_t v7 = (void *)v13;
          }
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_16:

  return v3;
}

- (void)mergeWithCollection:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 items];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v10 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = [(NTKPigmentCollection *)self items];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [v4 items];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __44__NTKPigmentCollection_mergeWithCollection___block_invoke;
  v66[3] = &unk_1E62C4068;
  id v10 = v8;
  id v67 = v10;
  [v9 enumerateObjectsUsingBlock:v66];

  id v11 = [(NTKPigmentCollection *)self config];
  char v12 = [v11 collectionOverride];
  if ([v12 length])
  {
    uint64_t v13 = [v4 config];
    uint64_t v14 = [v13 collectionOverride];
    uint64_t v15 = [v14 length];

    if (!v15)
    {
      long long v16 = [(NTKPigmentCollection *)self config];
      [v16 applyCollectionOverrideNameOnItems:v10];
      goto LABEL_8;
    }
  }
  else
  {
  }
  long long v16 = [v4 config];
  long long v17 = [v16 collectionOverride];
  long long v18 = [(NTKPigmentCollection *)self config];
  [v18 setCollectionOverride:v17];

LABEL_8:
  id v19 = [(NTKPigmentCollection *)self config];
  uint64_t v20 = [v19 isAddable];
  if (!v20)
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v21 = (void *)v20;
  uint64_t v22 = [v4 config];
  long long v23 = [v22 isAddable];

  if (!v23)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v19 = v10;
    uint64_t v24 = [v19 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v63 != v26) {
            objc_enumerationMutation(v19);
          }
          v28 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v29 = [(NTKPigmentCollection *)self config];
          v30 = [v29 isAddable];
          objc_msgSend(v28, "setIsAddable:", objc_msgSend(v30, "BOOLValue"));
        }
        uint64_t v25 = [v19 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v25);
    }
    goto LABEL_17;
  }
LABEL_18:

LABEL_19:
  v31 = [(NTKPigmentCollection *)self config];

  if (!v31)
  {
    v32 = objc_alloc_init(NTKPigmentCollectionConfig);
    [(NTKPigmentCollection *)self setConfig:v32];
  }
  v33 = [v4 config];
  v34 = [v33 defaultGalleryColorNames];

  if (v34)
  {
    v35 = [v4 config];
    v36 = [v35 defaultGalleryColorNames];
    v37 = [(NTKPigmentCollection *)self config];
    [v37 setDefaultGalleryColorNames:v36];

    v38 = [(NTKPigmentCollection *)self config];
    v39 = [v38 defaultGalleryColorNames];
    [(NTKPigmentCollection *)self setDefaultGalleryColorWithNames:v39];
  }
  v40 = [v4 config];
  v41 = [v40 defaultColorOptionName];

  if (v41)
  {
    v42 = [v4 config];
    v43 = [v42 defaultColorOptionName];
    v44 = [(NTKPigmentCollection *)self config];
    [v44 setDefaultColorOptionName:v43];

    [(NTKPigmentCollection *)self setDefaultOption:0];
  }
  v45 = [v4 config];
  v46 = [v45 exclusions];

  if (v46)
  {
    v47 = [(NTKPigmentCollection *)self config];
    v48 = [v47 exclusions];
    v49 = [v46 arrayByAddingObjectsFromArray:v48];
    v50 = [(NTKPigmentCollection *)self config];
    [v50 setExclusions:v49];
  }
  if (v10)
  {
    [(NTKPigmentCollection *)self setItems:v10];
    v51 = [(NTKPigmentCollection *)self items];
    [v4 setItems:v51];
  }
  v52 = [v4 collections];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __44__NTKPigmentCollection_mergeWithCollection___block_invoke_2;
  v61[3] = &unk_1E62C4040;
  v61[4] = self;
  [v52 enumerateObjectsUsingBlock:v61];

  v53 = [(NTKPigmentCollection *)self collections];
  [v4 setCollections:v53];

  v54 = [(NTKPigmentCollection *)self config];
  v55 = [v54 isAddable];
  int v56 = [v55 BOOLValue];

  if (v56)
  {
    v57 = [v4 allItems];
    [v57 enumerateObjectsUsingBlock:&__block_literal_global_63];
  }
  v58 = self;
  objc_sync_enter(v58);
  allItems = v58->_allItems;
  v58->_allItems = 0;

  faceSpecificPigmentsByFullname = v58->_faceSpecificPigmentsByFullname;
  v58->_faceSpecificPigmentsByFullname = 0;

  objc_sync_exit(v58);
}

void __44__NTKPigmentCollection_mergeWithCollection___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 desiredPosition];
  if (v3
    && (id v4 = (void *)v3,
        [v10 desiredPosition],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 integerValue],
        unint64_t v7 = [*(id *)(a1 + 32) count] - 1,
        v5,
        v4,
        v6 <= v7))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v10 desiredPosition];
    objc_msgSend(v8, "insertObject:atIndex:", v10, objc_msgSend(v9, "integerValue"));
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v10];
  }
}

void __44__NTKPigmentCollection_mergeWithCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) collectionsByName];
  id v4 = [v6 collectionName];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5) {
    [*(id *)(a1 + 32) appendCollection:v6];
  }
}

uint64_t __44__NTKPigmentCollection_mergeWithCollection___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setIsAddable:1];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)[(NSString *)v5->_collectionName copy];
  unint64_t v7 = [(NTKPigmentCollection *)v5 defaultOption];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = (void *)[(NSOrderedSet *)v5->_items copy];
  id v10 = (void *)[(NSArray *)v5->_defaultGalleryColors copy];
  id v11 = (void *)[(NSArray *)v5->_collections copy];
  char v12 = (void *)[(NTKPigmentCollectionConfig *)v5->_config copy];
  int shared = v5->_shared;
  objc_sync_exit(v5);

  if (!v4) {
    goto LABEL_22;
  }
  uint64_t v14 = [v4 collectionName];
  int v15 = NTKEqualObjects(v6, v14);

  if (!v15) {
    goto LABEL_22;
  }
  if (shared == [v4 isShared]
    && ([v4 defaultOption],
        long long v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = NTKEqualObjects(v8, v16),
        v16,
        v17))
  {
    v46 = v10;
    uint64_t v18 = [v9 count];
    id v19 = [v4 items];
    uint64_t v20 = [v19 count];

    if (v18 != v20) {
      goto LABEL_24;
    }
    uint64_t v21 = [v46 count];
    uint64_t v22 = [v4 defaultGalleryColors];
    uint64_t v23 = [v22 count];

    if (v21 != v23
      || (uint64_t v24 = [v11 count],
          [v4 collections],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          uint64_t v26 = [v25 count],
          v25,
          v24 != v26))
    {
LABEL_24:
      char v42 = 0;
LABEL_25:
      id v10 = v46;
      goto LABEL_23;
    }
    v44 = v8;
    if ([v9 count])
    {
      uint64_t v27 = 0;
      do
      {
        v28 = [v9 objectAtIndexedSubscript:v27];
        v29 = [v4 items];
        v30 = [v29 objectAtIndexedSubscript:v27];
        char v31 = [v28 isEqual:v30];

        if ((v31 & 1) == 0) {
          goto LABEL_26;
        }
      }
      while ([v9 count] > (unint64_t)++v27);
    }
    v32 = [v4 config];
    int v33 = NTKEqualObjects(v12, v32);

    if (!v33)
    {
LABEL_26:
      char v42 = 0;
LABEL_27:
      uint64_t v8 = v44;
      goto LABEL_25;
    }
    id v10 = v46;
    if (![v46 count])
    {
LABEL_17:
      uint64_t v8 = v44;
      if (![v11 count])
      {
        char v42 = 1;
        goto LABEL_23;
      }
      unint64_t v38 = 0;
      while (1)
      {
        v39 = [v11 objectAtIndexedSubscript:v38];
        v40 = [v4 collections];
        v41 = [v40 objectAtIndexedSubscript:v38];
        char v42 = [v39 isEqual:v41];

        if ((v42 & 1) == 0) {
          goto LABEL_27;
        }
        ++v38;
        uint64_t v8 = v44;
        id v10 = v46;
        if ([v11 count] <= v38) {
          goto LABEL_23;
        }
      }
    }
    uint64_t v34 = 0;
    while (1)
    {
      v35 = [v46 objectAtIndexedSubscript:v34];
      v36 = [v4 defaultGalleryColors];
      v37 = [v36 objectAtIndexedSubscript:v34];
      char v45 = [v35 isEqual:v37];

      if ((v45 & 1) == 0) {
        break;
      }
      if ([v46 count] <= (unint64_t)++v34) {
        goto LABEL_17;
      }
    }
    char v42 = 0;
    uint64_t v8 = v44;
  }
  else
  {
LABEL_22:
    char v42 = 0;
  }
LABEL_23:

  return v42;
}

- (id)description
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v5 = [(NTKPigmentCollection *)v3 items];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __35__NTKPigmentCollection_description__block_invoke;
  v28[3] = &unk_1E62C4068;
  id v6 = v4;
  id v29 = v6;
  [v5 enumerateObjectsUsingBlock:v28];

  if ([v6 length]) {
    unint64_t v7 = @"");
  }
  else {
    unint64_t v7 = @"()";
  }
  [v6 appendString:v7];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v9 = [(NTKPigmentCollection *)v3 collections];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __35__NTKPigmentCollection_description__block_invoke_2;
  v26[3] = &unk_1E62C4040;
  id v10 = v8;
  id v27 = v10;
  [v9 enumerateObjectsUsingBlock:v26];

  if ([v10 length]) {
    id v11 = @"");
  }
  else {
    id v11 = @"()";
  }
  [v10 appendString:v11];
  uint64_t v23 = NSString;
  uint64_t v24 = [(NTKPigmentCollection *)v3 collectionName];
  uint64_t v25 = [(NTKPigmentCollection *)v3 config];
  char v12 = [v25 exclusions];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    uint64_t v14 = NSString;
    uint64_t v22 = [(NTKPigmentCollection *)v3 config];
    uint64_t v21 = [v22 exclusions];
    v2 = objc_msgSend(v21, "ntk_flatDescription");
    int v15 = [v14 stringWithFormat:@", exclusions: %@", v2];
  }
  else
  {
    int v15 = &stru_1F1635E90;
  }
  long long v16 = [(NTKPigmentCollection *)v3 config];
  int v17 = [v16 excludesDuotone];
  uint64_t v18 = @", excludesDuotone";
  if (!v17) {
    uint64_t v18 = &stru_1F1635E90;
  }
  id v19 = [v23 stringWithFormat:@"%@ [items: %@, collections: %@%@%@]", v24, v6, v10, v15, v18];

  if (v13)
  {
  }
  objc_sync_exit(v3);

  return v19;
}

void __35__NTKPigmentCollection_description__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 length]) {
    uint64_t v5 = @", ";
  }
  else {
    uint64_t v5 = CFSTR("(");
  }
  [*(id *)(a1 + 32) appendString:v5];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v4 description];

  [v6 appendString:v7];
}

void __35__NTKPigmentCollection_description__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 length]) {
    uint64_t v5 = @", ";
  }
  else {
    uint64_t v5 = CFSTR("(");
  }
  [*(id *)(a1 + 32) appendString:v5];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v4 collectionName];

  [v6 appendString:v7];
}

+ (id)collectionFromProtoBuffer:(id)a3
{
  return (id)[a1 collectionFromProtoBuffer:a3 sharedCollections:0];
}

+ (id)collectionFromProtoBuffer:(id)a3 sharedCollections:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 name];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    if ([v5 isStub])
    {
      if (v6
        && ([v5 name],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [v6 objectForKeyedSubscript:v9],
            id v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            v9,
            v10))
      {
        id v11 = [v5 name];
        uint64_t v12 = [v6 objectForKeyedSubscript:v11];

        if (v12) {
          goto LABEL_19;
        }
        uint64_t v13 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[NTKPigmentCollection collectionFromProtoBuffer:sharedCollections:](v5);
        }
      }
      else
      {
        uint64_t v13 = [v5 name];
        uint64_t v12 = +[NTKPigmentCollection stubCollectionWithName:v13];
      }
      goto LABEL_18;
    }
    int v15 = [NTKPigmentCollection alloc];
    long long v16 = [v5 name];
    uint64_t v12 = [(NTKPigmentCollection *)v15 initWithName:v16];

    *(unsigned char *)(v12 + 32) = [v5 isShared];
    *(unsigned char *)(v12 + 33) = [v5 isStub];
    int v17 = [v5 config];
    uint64_t v18 = +[NTKPigmentCollectionConfig collectionConfigFromProtoBuffer:v17];
    id v19 = *(void **)(v12 + 72);
    *(void *)(v12 + 72) = v18;

    uint64_t v20 = [NTKPigmentEditOption alloc];
    uint64_t v21 = [v5 defaultOption];
    uint64_t v22 = [(NTKPigmentEditOption *)v20 initWithProtoBuffer:v21];
    uint64_t v23 = *(void **)(v12 + 56);
    *(void *)(v12 + 56) = v22;

    uint64_t v24 = [v5 items];

    if (v24)
    {
      uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v5, "itemsCount"));
      uint64_t v26 = [v5 items];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke;
      v50[3] = &unk_1E62C40B0;
      id v51 = v25;
      id v52 = v5;
      id v27 = v25;
      [v26 enumerateObjectsUsingBlock:v50];

      v28 = (void *)[v27 copy];
      [(id)v12 setItems:v28];
    }
    id v29 = [v5 defaultGalleryColors];

    if (v29)
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "defaultGalleryColorsCount"));
      char v31 = [v5 defaultGalleryColors];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_33;
      v47[3] = &unk_1E62C40B0;
      id v48 = v30;
      id v49 = v5;
      id v32 = v30;
      [v31 enumerateObjectsUsingBlock:v47];

      uint64_t v33 = [v32 copy];
      uint64_t v34 = *(void **)(v12 + 80);
      *(void *)(v12 + 80) = v33;
    }
    v35 = [v5 collections];

    if (v35)
    {
      v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "collectionsCount"));
      v37 = [v5 collections];
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      v43 = __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_34;
      v44 = &unk_1E62C40D8;
      id v45 = v6;
      id v46 = v36;
      uint64_t v13 = v36;
      [v37 enumerateObjectsUsingBlock:&v41];

      uint64_t v38 = [v13 copy];
      v39 = *(void **)(v12 + 48);
      *(void *)(v12 + 48) = v38;

LABEL_18:
    }
  }
  else
  {
    uint64_t v14 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[NTKPigmentCollection collectionFromProtoBuffer:sharedCollections:]((uint64_t)v5, v14);
    }

    uint64_t v12 = 0;
  }
LABEL_19:

  return (id)v12;
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[NTKPigmentEditOption alloc] initWithProtoBuffer:v3];
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    id v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_cold_1(a1, v3);
    }
  }
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[NTKPigmentEditOption alloc] initWithProtoBuffer:v3];
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    id v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_33_cold_1(a1, v3);
    }
  }
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_34(uint64_t a1, uint64_t a2)
{
  id v3 = +[NTKPigmentCollection collectionFromProtoBuffer:a2 sharedCollections:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)protoBuffer
{
  return [(NTKPigmentCollection *)self protoBufferIgnoringSharedCollections:0];
}

- (id)protoBufferIgnoringSharedCollections:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = objc_alloc_init(NTKProtoPigmentCollection);
  [(NTKProtoPigmentCollection *)v5 setIsShared:v4->_shared];
  [(NTKProtoPigmentCollection *)v5 setIsStub:v4->_stub];
  [(NTKProtoPigmentCollection *)v5 setName:v4->_collectionName];
  id v6 = [(NTKPigmentCollectionConfig *)v4->_config protoBuffer];
  [(NTKProtoPigmentCollection *)v5 setConfig:v6];

  id v7 = [(NTKPigmentCollection *)v4 defaultOption];
  uint64_t v8 = [v7 protoBuffer];
  [(NTKProtoPigmentCollection *)v5 setDefaultOption:v8];

  items = v4->_items;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke;
  v23[3] = &unk_1E62C4068;
  id v10 = v5;
  uint64_t v24 = v10;
  [(NSOrderedSet *)items enumerateObjectsUsingBlock:v23];
  defaultGalleryColors = v4->_defaultGalleryColors;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke_2;
  v21[3] = &unk_1E62C4068;
  uint64_t v12 = v10;
  uint64_t v22 = v12;
  [(NSArray *)defaultGalleryColors enumerateObjectsUsingBlock:v21];
  collections = v4->_collections;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke_3;
  v18[3] = &unk_1E62C4100;
  uint64_t v14 = v12;
  id v19 = v14;
  BOOL v20 = a3;
  [(NSArray *)collections enumerateObjectsUsingBlock:v18];
  int v15 = v19;
  long long v16 = v14;

  objc_sync_exit(v4);
  return v16;
}

void __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 protoBuffer];
  [v2 addItems:v3];
}

void __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 protoBuffer];
  [v2 addDefaultGalleryColors:v3];
}

void __61__NTKPigmentCollection_protoBufferIgnoringSharedCollections___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = v7;
  if ([v7 isShared])
  {
    id v4 = [v7 collectionName];
    id v3 = +[NTKPigmentCollection stubCollectionWithName:v4];
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 protoBufferIgnoringSharedCollections:*(unsigned __int8 *)(a1 + 40)];
  [v5 addCollections:v6];
}

- (void)fulfillWithSharedCollections:(id)a3
{
  id v17 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NTKPigmentCollection *)v4 collections];
  id v6 = (void *)[v5 mutableCopy];

  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v8 = [(NTKPigmentCollection *)v4 collections];
    unint64_t v9 = [v8 count];

    if (v9 <= i) {
      break;
    }
    id v10 = [(NTKPigmentCollection *)v4 collections];
    id v11 = [v10 objectAtIndexedSubscript:i];

    if ([v11 isStub])
    {
      uint64_t v12 = [v11 collectionName];
      if (v12)
      {
        uint64_t v13 = [v11 collectionName];
        uint64_t v14 = [v17 objectForKeyedSubscript:v13];

        if (v14)
        {
          int v15 = [v11 collectionName];
          long long v16 = [v17 objectForKeyedSubscript:v15];
          [v6 setObject:v16 atIndexedSubscript:i];
        }
      }
    }
  }
  [(NTKPigmentCollection *)v4 setCollections:v6];

  objc_sync_exit(v4);
}

- (NSString)collectionName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCollectionName:(id)a3
{
}

- (NTKPigmentCollectionConfig)config
{
  return (NTKPigmentCollectionConfig *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConfig:(id)a3
{
}

- (NSArray)defaultGalleryColors
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDefaultGalleryColors:(id)a3
{
}

- (NSMutableDictionary)faceSpecificPigmentsByFullname
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFaceSpecificPigmentsByFullname:(id)a3
{
}

- (void)setMigration:(id)a3
{
}

- (BOOL)isShared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_int shared = a3;
}

- (BOOL)isStub
{
  return self->_stub;
}

- (void)setStub:(BOOL)a3
{
  self->_stub = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migration, 0);
  objc_storeStrong((id *)&self->_faceSpecificPigmentsByFullname, 0);
  objc_storeStrong((id *)&self->_defaultGalleryColors, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_defaultOption, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_collectionsByName, 0);
  objc_storeStrong((id *)&self->_itemsByName, 0);
}

+ (void)collectionFromProtoBuffer:(uint64_t)a1 sharedCollections:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "#color-sync Failure while creating pigment collection from protobuffer. Collection name can not be empty - %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)collectionFromProtoBuffer:(void *)a1 sharedCollections:.cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "#color-sync shared collection for %{public}@ could not be found in shared collections while decoding protobuffer object. Collection will be nil %{public}@", v4, v5, v6, v7, 2u);
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 40) name];
  uint64_t v4 = [a2 formattedText];
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v5, v6, "#color-sync Failure while decoding collection's items from protobuffer. %{publib}@ - pigment protobuffer: %{public}@ ", v7, v8, v9, v10, v11);
}

void __68__NTKPigmentCollection_collectionFromProtoBuffer_sharedCollections___block_invoke_33_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 40) name];
  uint64_t v4 = [a2 formattedText];
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v5, v6, "#color-sync Failure while decoding collection's defaultGalleryColors from protobuffer. %{publib}@ - pigment protobuffer: %{public}@ ", v7, v8, v9, v10, v11);
}

@end