@interface ML3Collection
+ (BOOL)_updateRepresentativeItemsForPersistentIDs:(id)a3 usingConnection:(id)a4;
+ (BOOL)canonicalizeCollectionRepresentativeItemsInLibrary:(id)a3 usingConnection:(id)a4;
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7;
+ (BOOL)libraryContentsChangeForProperty:(id)a3;
+ (BOOL)removeOrphanedCollectionsInLibrary:(id)a3 usingConnection:(id)a4;
+ (BOOL)updateRepresentativeItemPersistentIDsInLibrary:(id)a3 persistentIDs:(id)a4 usingConnection:(id)a5;
+ (id)artworkCacheIDProperty;
+ (id)collectionEntityClasses;
+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4;
+ (id)propertiesForGroupingKey;
+ (id)propertiesForGroupingUniqueCollections;
+ (id)trackForeignPersistentID;
+ (void)initialize;
- (ML3Collection)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6;
- (void)updateCloudStatus;
@end

@implementation ML3Collection

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  id v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ML3Collection;
  v7 = objc_msgSendSuper2(&v9, sel_foreignPropertyForProperty_entityClass_, v6, a4);
  if (!v7)
  {
    if ((Class)objc_opt_class() == a4)
    {
      v7 = [(id)ML3TrackForeignPropertyForML3CollectionProperties objectForKey:v6];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    ML3TrackForeignPropertyForML3CollectionProperties = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"item_artist_pid", @"item_artist_pid", @"album_pid", @"album_pid", @"ROWID", @"item_pid", 0);
    MEMORY[0x1F41817F8]();
  }
}

- (void)updateCloudStatus
{
  v3 = [(id)objc_opt_class() trackForeignPersistentID];
  v4 = +[ML3ComparisonPredicate predicateWithProperty:v3 equalToInt64:self->super._persistentID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  id v6 = +[ML3Entity queryWithLibrary:WeakRetained predicate:v4 orderingTerms:0];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObject:@"(item.remote_location_id >= 50 AND item.base_location_id < 250)"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__ML3Collection_updateCloudStatus__block_invoke;
  v12[3] = &unk_1E5FB46B8;
  v12[4] = &v17;
  v12[5] = &v13;
  [v6 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (*((unsigned char *)v18 + 24))
  {
    if (*((unsigned char *)v14 + 24)) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_super v9 = [(ML3Entity *)self valueForProperty:@"cloud_status"];
  uint64_t v10 = [v9 integerValue];

  if (v10 != v8)
  {
    v11 = [NSNumber numberWithInteger:v8];
    [(ML3Entity *)self setValue:v11 forProperty:@"cloud_status"];
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __34__ML3Collection_updateCloudStatus__block_invoke(uint64_t result, uint64_t a2, id *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v5 = result;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    *a5 = 1;
  }
  else
  {
    result = [*a3 BOOLValue];
    if (result) {
      uint64_t v6 = *(void *)(v5 + 32);
    }
    else {
      uint64_t v6 = *(void *)(v5 + 40);
    }
    *(unsigned char *)(*(void *)(v6 + 8) + 24) = 1;
  }
  return result;
}

- (ML3Collection)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 objectForKey:@"grouping_key"];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v25 = self;
    char v16 = [(id)objc_opt_class() propertiesForGroupingKey];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [v10 objectForKey:*(void *)(*((void *)&v27 + 1) + 8 * v20)];
          if ([v21 length])
          {
            uint64_t v15 = [v11 groupingKeyForString:v21];

            if (v15)
            {

              goto LABEL_15;
            }
          }
          else
          {
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }

    uint64_t v15 = [MEMORY[0x1E4F1C9B8] data];
    if (v15)
    {
LABEL_15:
      v22 = (void *)[v10 mutableCopy];
      [v22 setValue:v15 forKey:@"grouping_key"];

      id v10 = v22;
    }
    self = v25;
  }
  v26.receiver = self;
  v26.super_class = (Class)ML3Collection;
  v23 = [(ML3Entity *)&v26 initWithDictionary:v10 inLibrary:v11 cachedNameOrders:v12 usingConnection:v13];

  return v23;
}

+ (BOOL)_updateRepresentativeItemsForPersistentIDs:(id)a3 usingConnection:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v31 = a4;
  if ([v6 count])
  {
    v7 = [a1 trackForeignPersistentID];
    uint64_t v8 = [a1 databaseTable];
    objc_super v9 = [MEMORY[0x1E4F28E78] stringWithFormat:@"UPDATE %@ SET %@ = IFNULL( (SELECT item_pid FROM item LEFT OUTER JOIN best_artwork_token ON (item.ROWID = best_artwork_token.entity_pid AND best_artwork_token.entity_type = %ld) WHERE item.%@ = %@.ROWID ORDER BY item.media_type, best_artwork_token.available_artwork_token IS NOT NULL DESC LIMIT 1), 0)", v8, @"representative_item_pid", 0, v7, v8];
    if ((unint64_t)[v6 count] < 0x3E9)
    {
      [v9 appendString:@" WHERE ROWID"];
      id v11 = [v6 allObjects];
      id v13 = +[ML3DatabaseStatementRenderer defaultRenderer];
      uint64_t v14 = [v11 count];
      if (v14)
      {
        unint64_t v15 = v14;
        long long v30 = v13;
        long long v27 = v8;
        long long v28 = v7;
        id v29 = v6;
        char v16 = 0;
        unint64_t v17 = 0;
        uint64_t v18 = -1;
        while (1)
        {
          if (v15 - v17 >= 0x64) {
            uint64_t v19 = 100;
          }
          else {
            uint64_t v19 = v15 - v17;
          }
          uint64_t v20 = objc_msgSend(v11, "subarrayWithRange:", v17, v19);
          if (v18 != v19)
          {
            uint64_t v21 = [v30 statementWithPrefix:v9 inParameterCount:v19];

            uint64_t v18 = v19;
            char v16 = (void *)v21;
          }
          id v32 = 0;
          char v22 = [v31 executeUpdate:v16 withParameters:v20 error:&v32];
          id v23 = v32;
          v24 = v23;
          if ((v22 & 1) == 0) {
            break;
          }
          v17 += v19;

          if (v17 >= v15)
          {

            BOOL v12 = 1;
            goto LABEL_23;
          }
        }
        v25 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = v24;
          _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_ERROR, "Failed to update collection representative items with error: %{public}@", buf, 0xCu);
        }

        BOOL v12 = 0;
LABEL_23:
        v7 = v28;
        id v6 = v29;
        uint64_t v8 = v27;
        id v13 = v30;
      }
      else
      {
        BOOL v12 = 1;
      }
    }
    else
    {
      id v33 = 0;
      char v10 = [v31 executeUpdate:v9 withParameters:0 error:&v33];
      id v11 = v33;
      if (v10)
      {
        BOOL v12 = 1;
LABEL_25:

        goto LABEL_26;
      }
      id v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v11;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "Failed to update collection representative items with error: %{public}@", buf, 0xCu);
      }
      BOOL v12 = 0;
    }

    goto LABEL_25;
  }
  BOOL v12 = 1;
LABEL_26:

  return v12;
}

+ (id)collectionEntityClasses
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];

  return v2;
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___ML3Collection;
  return objc_msgSendSuper2(&v8, sel_deleteFromLibrary_deletionType_persistentIDs_count_usingConnection_, a3, *(void *)&a4, a5, a6, a7);
}

+ (BOOL)removeOrphanedCollectionsInLibrary:(id)a3 usingConnection:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = 138543362;
    uint64_t v43 = (uint64_t)v5;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "Checking for orphaned collections in library %{public}@", (uint8_t *)&v42, 0xCu);
  }

  objc_super v8 = [v6 executeQuery:@"SELECT album_pid FROM album WHERE album_pid NOT IN (SELECT album_pid FROM item)"];
  objc_super v9 = [v8 objectsInColumn:0];

  if ([v9 count])
  {
    char v10 = malloc_type_calloc([v9 count], 8uLL, 0x100004000313F17uLL);
    if ([v9 count])
    {
      unint64_t v11 = 0;
      do
      {
        BOOL v12 = [v9 objectAtIndexedSubscript:v11];
        v10[v11] = [v12 longLongValue];

        ++v11;
      }
      while (v11 < [v9 count]);
    }
    if (+[ML3Collection deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3Album, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v10, [v9 count], v6))
    {
      id v13 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = 138543362;
        uint64_t v43 = (uint64_t)v9;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Deleted Orphaned Album Pids=%{public}@", (uint8_t *)&v42, 0xCu);
      }
    }
    free(v10);
  }
  if (_os_feature_enabled_impl()) {
    [v6 executeQuery:@"SELECT album_artist_pid FROM album_artist WHERE ((album_artist_pid NOT IN (SELECT album_artist_pid FROM item) AND album_artist_pid NOT IN (SELECT album_artist_pid FROM album)) AND album_artist.liked_state=?)" withParameters:&unk_1F0910708];
  }
  else {
  uint64_t v14 = [v6 executeQuery:@"SELECT album_artist_pid FROM album_artist WHERE album_artist_pid NOT IN (SELECT album_artist_pid FROM item) AND album_artist_pid NOT IN (SELECT album_artist_pid FROM album)"];
  }
  unint64_t v15 = [v14 objectsInColumn:0];

  if ([v15 count])
  {
    char v16 = malloc_type_calloc([v15 count], 8uLL, 0x100004000313F17uLL);
    if ([v15 count])
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = [v15 objectAtIndexedSubscript:v17];
        v16[v17] = [v18 longLongValue];

        ++v17;
      }
      while (v17 < [v15 count]);
    }
    if (+[ML3AlbumArtist deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3AlbumArtist, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v16, [v15 count], v6))
    {
      uint64_t v19 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = 138543362;
        uint64_t v43 = (uint64_t)v15;
        _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "Deleted Orphaned Album Artist Pids=%{public}@", (uint8_t *)&v42, 0xCu);
      }
    }
    free(v16);
  }
  uint64_t v20 = [v6 executeQuery:@"SELECT item_artist_pid FROM item_artist WHERE item_artist_pid NOT IN (SELECT item_artist_pid FROM item)"];
  uint64_t v21 = [v20 objectsInColumn:0];

  if ([v21 count])
  {
    char v22 = malloc_type_calloc([v21 count], 8uLL, 0x100004000313F17uLL);
    if ([v21 count])
    {
      unint64_t v23 = 0;
      do
      {
        v24 = [v21 objectAtIndexedSubscript:v23];
        v22[v23] = [v24 longLongValue];

        ++v23;
      }
      while (v23 < [v21 count]);
    }
    if (+[ML3Collection deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3Artist, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v22, [v21 count], v6))
    {
      v25 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [v21 count];
        int v42 = 134217984;
        uint64_t v43 = v26;
        _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "Deleted %lu orphaned Artists", (uint8_t *)&v42, 0xCu);
      }
    }
    free(v22);
  }
  long long v27 = [v6 executeQuery:@"SELECT composer_pid FROM composer WHERE composer_pid NOT IN (SELECT composer_pid FROM item)"];
  long long v28 = [v27 objectsInColumn:0];

  if ([v28 count])
  {
    id v29 = malloc_type_calloc([v28 count], 8uLL, 0x100004000313F17uLL);
    if ([v28 count])
    {
      unint64_t v30 = 0;
      do
      {
        id v31 = [v28 objectAtIndexedSubscript:v30];
        v29[v30] = [v31 longLongValue];

        ++v30;
      }
      while (v30 < [v28 count]);
    }
    if (+[ML3Collection deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3Composer, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v29, [v28 count], v6))
    {
      id v32 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = [v28 count];
        int v42 = 134217984;
        uint64_t v43 = v33;
        _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_DEFAULT, "Deleted %lu orphaned Composers", (uint8_t *)&v42, 0xCu);
      }
    }
    free(v29);
  }
  v34 = [v6 executeQuery:@"SELECT genre_id FROM genre WHERE genre_id NOT IN (SELECT genre_id FROM item)"];
  id v35 = [v34 objectsInColumn:0];

  if ([v35 count])
  {
    uint64_t v36 = malloc_type_calloc([v35 count], 8uLL, 0x100004000313F17uLL);
    if ([v35 count])
    {
      unint64_t v37 = 0;
      do
      {
        v38 = [v35 objectAtIndexedSubscript:v37];
        v36[v37] = [v38 longLongValue];

        ++v37;
      }
      while (v37 < [v35 count]);
    }
    if (+[ML3Collection deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:](ML3Genre, "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", v5, 2, v36, [v35 count], v6))
    {
      v39 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = [v35 count];
        int v42 = 134217984;
        uint64_t v43 = v40;
        _os_log_impl(&dword_1B022D000, v39, OS_LOG_TYPE_DEFAULT, "Deleted %lu orphaned Genres", (uint8_t *)&v42, 0xCu);
      }
    }
    free(v36);
  }

  return 1;
}

+ (BOOL)canonicalizeCollectionRepresentativeItemsInLibrary:(id)a3 usingConnection:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v36 = (id)objc_opt_class();
    __int16 v37 = 2114;
    id v38 = v6;
    id v9 = v36;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Looking for representative items to update for collection type %{public}@ in library %{public}@", buf, 0x16u);
  }
  char v10 = [a1 trackForeignPersistentID];
  unint64_t v11 = [a1 databaseTable];
  uint64_t v12 = [NSString stringWithFormat:@"SELECT DISTINCT item.%@ FROM item JOIN %@ USING (%@) LEFT OUTER JOIN best_artwork_token ON (item.ROWID = best_artwork_token.entity_pid AND best_artwork_token.entity_type = %ld) WHERE %@.%@ = item.ROWID AND (((item.media_type & 1024) = 1024) OR best_artwork_token.available_artwork_token IS NULL)", v10, v11, v10, 0, v11, @"representative_item_pid"];
  id v13 = [MEMORY[0x1E4F1CA80] set];
  long long v28 = (void *)v12;
  uint64_t v14 = [v7 executeQuery:v12];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke;
  v33[3] = &unk_1E5FB83F8;
  id v15 = v13;
  id v34 = v15;
  [v14 enumerateRowsWithBlock:v33];

  long long v27 = [NSString stringWithFormat:@"SELECT %@.ROWID FROM %@ WHERE %@.%@ = 0", v11, v11, v11, @"representative_item_pid"];
  char v16 = objc_msgSend(v7, "executeQuery:");
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke_2;
  v31[3] = &unk_1E5FB83F8;
  id v17 = v15;
  id v32 = v17;
  [v16 enumerateRowsWithBlock:v31];

  uint64_t v18 = [NSString stringWithFormat:@"SELECT %@.ROWID FROM %@ LEFT OUTER JOIN item ON (%@.%@ = item.ROWID) where %@.ROWID != IFNULL(item.%@, 0)", v11, v11, v11, @"representative_item_pid", v11, v10];
  uint64_t v19 = [v7 executeQuery:v18];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke_3;
  v29[3] = &unk_1E5FB83F8;
  id v20 = v17;
  id v30 = v20;
  [v19 enumerateRowsWithBlock:v29];

  uint64_t v21 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    char v22 = (void *)[v20 count];
    unint64_t v23 = objc_opt_class();
    *(_DWORD *)buf = 134218498;
    id v36 = v22;
    __int16 v37 = 2114;
    id v38 = v23;
    __int16 v39 = 2114;
    id v40 = v6;
    id v24 = v23;
    _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_DEFAULT, "Updating %lu representative items for collection %{public}@ in library %{public}@", buf, 0x20u);
  }
  char v25 = [a1 _updateRepresentativeItemsForPersistentIDs:v20 usingConnection:v7];

  return v25;
}

uint64_t __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectAtIndexedSubscript:0];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectAtIndexedSubscript:0];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __84__ML3Collection_canonicalizeCollectionRepresentativeItemsInLibrary_usingConnection___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectAtIndexedSubscript:0];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)updateRepresentativeItemPersistentIDsInLibrary:(id)a3 persistentIDs:(id)a4 usingConnection:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a1 trackForeignPersistentID];
  id v28 = a1;
  uint64_t v11 = [a1 databaseTable];
  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = (void *)v11;
  id v29 = (void *)v10;
  id v32 = [NSString stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = 0 OR %@", v10, v11, @"representative_item_pid", @"representative_item_pid"];
  id v31 = +[ML3DatabaseStatementRenderer defaultRenderer];
  uint64_t v13 = [v8 count];
  if (v13)
  {
    unint64_t v14 = v13;
    id v15 = 0;
    unint64_t v16 = 0;
    uint64_t v17 = -1;
    do
    {
      if (v14 - v16 >= 0x64) {
        uint64_t v18 = 100;
      }
      else {
        uint64_t v18 = v14 - v16;
      }
      uint64_t v19 = objc_msgSend(v8, "subarrayWithRange:", v16, v18);
      if (v17 != v18)
      {
        [v31 statementWithPrefix:v32 inParameterCount:v18];
        id v20 = v12;
        id v21 = v9;
        v23 = id v22 = v8;

        uint64_t v17 = v18;
        id v15 = (void *)v23;
        id v8 = v22;
        id v9 = v21;
        uint64_t v12 = v20;
      }
      v16 += v18;
      id v24 = [v9 executeQuery:v15 withParameters:v19];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __94__ML3Collection_updateRepresentativeItemPersistentIDsInLibrary_persistentIDs_usingConnection___block_invoke;
      v33[3] = &unk_1E5FB83F8;
      id v34 = v12;
      [v24 enumerateRowsWithBlock:v33];
    }
    while (v16 < v14);
  }
  else
  {
    id v15 = 0;
  }
  char v25 = [v28 _updateRepresentativeItemsForPersistentIDs:v12 usingConnection:v9];

  return v25;
}

uint64_t __94__ML3Collection_updateRepresentativeItemPersistentIDsInLibrary_persistentIDs_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectAtIndexedSubscript:0];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"cloud_status"] & 1) != 0
    || ([v4 isEqualToString:@"representative_item_pid"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___ML3Collection;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_libraryContentsChangeForProperty_, v4);
  }

  return v5;
}

+ (id)artworkCacheIDProperty
{
  return 0;
}

+ (id)propertiesForGroupingUniqueCollections
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"grouping_key";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)trackForeignPersistentID
{
  return 0;
}

+ (id)propertiesForGroupingKey
{
  return 0;
}

@end