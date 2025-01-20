@interface PLPhotoStreamAlbum
+ (id)entityName;
+ (id)keyPathsForValuesAffectingPersonID;
+ (id)photoStreamAlbumWithStreamID:(id)a3 inPhotoLibrary:(id)a4 createIfNeeded:(BOOL)a5;
- (BOOL)shouldDeleteWhenEmpty;
- (void)addAssetOrderedByDataTaken:(id)a3;
- (void)awakeFromInsert;
@end

@implementation PLPhotoStreamAlbum

- (void)addAssetOrderedByDataTaken:(id)a3
{
  id v22 = a3;
  v4 = [(PLManagedAlbum *)self mutableAssets];
  v5 = [v22 dateCreated];
  uint64_t v6 = [v4 count];
  if (!v6 || !v5)
  {
    [v4 addObject:v22];
    goto LABEL_21;
  }
  uint64_t v7 = v6;
  unint64_t v8 = v6 - 1;
  v9 = [v4 objectAtIndex:v6 - 1];
  v10 = [v9 dateCreated];
  uint64_t v11 = [v10 compare:v5];

  if (v11 == -1)
  {
    v20 = v4;
    id v21 = v22;
  }
  else
  {
    if ((v8 & 0x8000000000000000) != 0)
    {
      uint64_t v17 = -(uint64_t)((unint64_t)(1 - v7) >> 1);
    }
    else
    {
      uint64_t v12 = 0;
      v13 = 0;
      int64_t v14 = v8;
      do
      {
        v15 = v13;
        uint64_t v16 = v14 - v12;
        if (v14 < v12) {
          ++v16;
        }
        uint64_t v17 = v12 + (v16 >> 1);
        v13 = [v4 objectAtIndex:v17];

        v18 = [v13 dateCreated];
        uint64_t v19 = [v18 compare:v5];

        if (v19 == 1)
        {
          int64_t v14 = v17 - 1;
        }
        else
        {
          if (v19 != -1) {
            break;
          }
          uint64_t v12 = ++v17;
        }
      }
      while (v12 <= v14);
    }
    id v21 = v22;
    v20 = v4;
    if ((v17 & (unint64_t)~(v17 >> 63)) <= v8)
    {
      objc_msgSend(v4, "insertObject:atIndex:", v22);
      goto LABEL_20;
    }
  }
  [v20 addObject:v21];
LABEL_20:

LABEL_21:
}

- (BOOL)shouldDeleteWhenEmpty
{
  return 0;
}

- (void)awakeFromInsert
{
  v3.receiver = self;
  v3.super_class = (Class)PLPhotoStreamAlbum;
  [(PLGenericAlbum *)&v3 awakeFromInsert];
  [(PLGenericAlbum *)self setKindValue:1500];
}

+ (id)keyPathsForValuesAffectingPersonID
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"title"];
}

+ (id)entityName
{
  return @"PhotoStreamAlbum";
}

+ (id)photoStreamAlbumWithStreamID:(id)a3 inPhotoLibrary:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v11 = [v9 managedObjectContext];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v13 = [a1 entityInManagedObjectContext:v11];
  [v12 setEntity:v13];

  id v42 = 0;
  int64_t v14 = [v11 executeFetchRequest:v12 error:&v42];
  id v15 = v42;
  if (!v14) {
    goto LABEL_30;
  }
  if ((unint64_t)[v14 count] < 2)
  {
    if ([v14 count] == 1)
    {
      uint64_t v25 = [v14 lastObject];
      goto LABEL_26;
    }
    if (v5)
    {
      if (PLIsAssetsd())
      {
        [v9 createPhotoStreamAlbumWithStreamID:v8];
      }
      else
      {
        v26 = [v9 assetsdClient];
        v27 = [v26 cloudInternalClient];
        [v27 createPhotostreamAlbumWithStreamID:v8];
      }
      uint64_t v25 = +[PLPhotoStreamAlbum photoStreamAlbumWithStreamID:v8 inPhotoLibrary:v9 createIfNeeded:0];
LABEL_26:
      uint64_t v19 = (void *)v25;
      if (!v8) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
LABEL_30:
    uint64_t v19 = 0;
    goto LABEL_31;
  }
  id v33 = v15;
  id v35 = v12;
  v36 = v10;
  id v37 = v9;
  NSLog(&cfstr_WarningThePhot.isa, v8);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v34 = v14;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v16);
        }
        id v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v23 = [v22 personID];
        }
        else
        {
          v23 = 0;
        }
        NSLog(&cfstr_FoundAlbumWith_0.isa, v23);
        if ([v23 isEqualToString:v8])
        {
          id v24 = v22;

          uint64_t v19 = v24;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v19 = 0;
  }

  v10 = v36;
  id v9 = v37;
  id v12 = v35;
  id v15 = v33;
  int64_t v14 = v34;
  if (v8)
  {
LABEL_27:
    if (!v19) {
      goto LABEL_31;
    }
    v28 = [v19 personID];
    char v29 = [v28 isEqualToString:v8];

    if (v29) {
      goto LABEL_31;
    }
    v30 = [v19 personID];
    NSLog(&cfstr_WarningPhotoSt.isa, v30, v8);

    goto LABEL_30;
  }
LABEL_31:

  if (v14) {
    id v31 = v19;
  }
  else {
    id v31 = 0;
  }

  return v31;
}

@end