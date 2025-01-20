@interface ML3BaseLocation
+ (BOOL)insertionChangesLibraryContents;
+ (id)databaseTable;
+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4;
- (void)enumerateOrphanedAssetsUsingBlock:(id)a3;
@end

@implementation ML3BaseLocation

+ (BOOL)insertionChangesLibraryContents
{
  return 0;
}

+ (id)databaseTable
{
  return @"base_location";
}

+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[v6 mutableCopy];
  v9 = [v6 objectForKey:@"ROWID"];

  if (!v9)
  {
    v10 = [v6 objectForKey:@"path"];
    v11 = v10;
    if (v10)
    {
      uint64_t v12 = ML3BaseLocationIDFromMediaRelativePathInLibrary(v10, v7);
      if (v12)
      {
        v13 = [NSNumber numberWithLongLong:v12];
        [v8 setObject:v13 forKey:@"ROWID"];
      }
    }
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___ML3BaseLocation;
  id v14 = objc_msgSendSuper2(&v16, sel_newWithDictionary_inLibrary_, v8, v7);

  return v14;
}

- (void)enumerateOrphanedAssetsUsingBlock:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  context = (void *)MEMORY[0x1B3E93C70]();
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v5 = [(ML3Entity *)self valueForProperty:@"ROWID"];
  id v6 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" equalToValue:v5];
  id v7 = +[ML3Entity queryWithLibrary:WeakRetained predicate:v6];

  v8 = [MEMORY[0x1E4F1CA80] set];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObject:@"item_extra.location"];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __53__ML3BaseLocation_enumerateOrphanedAssetsUsingBlock___block_invoke;
  v38[3] = &unk_1E5FB5218;
  id v30 = v8;
  id v39 = v30;
  v28 = v7;
  [v7 enumeratePersistentIDsAndProperties:v9 usingBlock:v38];

  uint64_t v10 = [(ML3Entity *)self valueForProperty:@"path"];
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  v26 = (void *)v10;
  uint64_t v12 = [v11 enumeratorAtPath:v10];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    uint64_t v17 = *MEMORY[0x1E4F283B8];
    uint64_t v18 = *MEMORY[0x1E4F283C8];
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * v19);
        v21 = [v13 fileAttributes];
        v22 = [v21 objectForKey:v17];
        int v23 = [v22 isEqualToString:v18];

        if (v23) {
          [v30 removeObject:v20];
        }
        ++v19;
      }
      while (v15 != v19);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v15);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __53__ML3BaseLocation_enumerateOrphanedAssetsUsingBlock___block_invoke_2;
  v31[3] = &unk_1E5FB5240;
  id v24 = v27;
  id v32 = v26;
  id v33 = v24;
  id v25 = v26;
  [v30 enumerateObjectsUsingBlock:v31];
}

uint64_t __53__ML3BaseLocation_enumerateOrphanedAssetsUsingBlock___block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  if (*a3) {
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  }
  return result;
}

uint64_t __53__ML3BaseLocation_enumerateOrphanedAssetsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end