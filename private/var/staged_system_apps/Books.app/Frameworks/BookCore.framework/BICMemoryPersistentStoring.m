@interface BICMemoryPersistentStoring
- (BICMemoryPersistentStoring)initWithURL:(id)a3;
- (NSMutableDictionary)imageSets;
- (id)addNewImageEntryToSet:(id)a3;
- (id)addNewImageSetWithIdentifier:(id)a3;
- (id)fetchAllImageSets;
- (id)fetchImageEntriesMatchingAddedEntries:(id)a3;
- (id)fetchImageEntriesWithLocations:(id)a3;
- (id)fetchImageSetsWithDescribedImages:(id)a3;
- (id)fetchImageSetsWithIDs:(id)a3;
- (id)fetchToBeDeletedImageEntriesInLevelID:(signed __int16)a3;
- (id)imageSetForIdentifier:(id)a3;
- (int64_t)totalNumberOfImageEntries;
- (int64_t)totalNumberOfImageSets;
- (void)clean:(id)a3;
- (void)deleteObject:(id)a3;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)removeImageSets:(id)a3;
- (void)setImageSets:(id)a3;
@end

@implementation BICMemoryPersistentStoring

- (BICMemoryPersistentStoring)initWithURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BICMemoryPersistentStoring;
  v3 = [(BICMemoryPersistentStoring *)&v7 init];
  if (v3)
  {
    uint64_t v4 = +[NSMutableDictionary dictionary];
    imageSets = v3->_imageSets;
    v3->_imageSets = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (id)imageSetForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(BICMemoryPersistentStoring *)self imageSets];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)addNewImageSetWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(BICMemoryImageSet);
  [(BICMemoryImageSet *)v5 setIdentifier:v4];
  v6 = [(BICMemoryPersistentStoring *)self imageSets];
  [v6 setObject:v5 forKeyedSubscript:v4];

  return v5;
}

- (id)addNewImageEntryToSet:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(BICMemoryImageEntry);
  [v3 addEntry:v4];

  return v4;
}

- (void)performBlock:(id)a3
{
  id v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

- (void)performBlockAndWait:(id)a3
{
  id v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

- (void)deleteObject:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  id v4 = BUDynamicCast();
  if (v4)
  {
    v5 = [(BICMemoryPersistentStoring *)self imageSets];
    v6 = [v4 identifier];
    [v5 setObject:0 forKeyedSubscript:v6];
  }
  objc_opt_class();
  objc_super v7 = BUDynamicCast();
  v8 = v7;
  if (v7) {
    [v7 deleteEntry];
  }
}

- (id)fetchAllImageSets
{
  v2 = [(BICMemoryPersistentStoring *)self imageSets];
  id v3 = [v2 allValues];

  return v3;
}

- (id)fetchImageSetsWithIDs:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = [(BICMemoryPersistentStoring *)self imageSets];
        v13 = [v12 objectForKeyedSubscript:v11];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = [v5 allObjects];

  return v14;
}

- (id)fetchImageSetsWithDescribedImages:(id)a3
{
  id v4 = [a3 valueForKey:@"identifier"];
  v5 = [(BICMemoryPersistentStoring *)self fetchImageSetsWithIDs:v4];

  return v5;
}

- (void)removeImageSets:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        v10 = [(BICMemoryPersistentStoring *)self imageSets];
        [v10 setObject:0 forKeyedSubscript:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)fetchToBeDeletedImageEntriesInLevelID:(signed __int16)a3
{
  int v3 = a3;
  id v5 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [(BICMemoryPersistentStoring *)self imageSets];
  uint64_t v7 = [v6 allValues];

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v13 = [v12 imageEntries];
        id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v22;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
              if ([v18 state] == 3 && objc_msgSend(v18, "level") == v3) {
                [v5 addObject:v18];
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v15);
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)fetchImageEntriesMatchingAddedEntries:(id)a3
{
  id v4 = [a3 valueForKey:@"entryLocation"];
  id v5 = [(BICMemoryPersistentStoring *)self fetchImageEntriesWithLocations:v4];

  return v5;
}

- (id)fetchImageEntriesWithLocations:(id)a3
{
  id v4 = +[NSSet setWithArray:a3];
  id v5 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [(BICMemoryPersistentStoring *)self imageSets];
  uint64_t v7 = [v6 allValues];

  id obj = v7;
  id v21 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v10 = [v9 imageEntries];
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
              uint64_t v16 = [v15 entryLocation];
              unsigned int v17 = [v4 containsObject:v16];

              if (v17) {
                [v5 addObject:v15];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  return v5;
}

- (void)clean:(id)a3
{
  id v4 = a3;
  id v5 = [(BICMemoryPersistentStoring *)self imageSets];
  [v5 removeAllObjects];

  id v7 = objc_retainBlock(v4);
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (int64_t)totalNumberOfImageSets
{
  v2 = [(BICMemoryPersistentStoring *)self imageSets];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (int64_t)totalNumberOfImageEntries
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(BICMemoryPersistentStoring *)self imageSets];
  id v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) imageEntries];
        v6 += (int64_t)[v9 count];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (NSMutableDictionary)imageSets
{
  return self->_imageSets;
}

- (void)setImageSets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end