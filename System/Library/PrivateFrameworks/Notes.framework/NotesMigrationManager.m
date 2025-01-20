@interface NotesMigrationManager
- (BOOL)areStoreMetadata:(id)a3 matchingEntityVersionsInModel:(id)a4;
- (BOOL)migrateNotesStoreAtURL:(id)a3 storeType:(id)a4 managedObjectModel:(id)a5 options:(id)a6 error:(id *)a7;
- (BOOL)migrateNotesStoreAtURL:(id)a3 storeType:(id)a4 options:(id)a5 sourceModel:(id)a6 destinationModel:(id)a7 mappingModel:(id)a8 error:(id *)a9;
@end

@implementation NotesMigrationManager

- (BOOL)migrateNotesStoreAtURL:(id)a3 storeType:(id)a4 managedObjectModel:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v44 = v12;
  v16 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v13 URL:v12 error:a7];
  if (!v16)
  {
    BOOL v17 = 0;
    goto LABEL_31;
  }
  if (![(NotesMigrationManager *)self areStoreMetadata:v16 matchingEntityVersionsInModel:v14])
  {
    v43 = self;
    id v38 = v14;
    v18 = +[NotesMigrationMapping mappings];
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v50;
LABEL_7:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v49 + 1) + 8 * v24);
        [v19 insertObject:v25 atIndex:0];
        if ([v25 canMigrateStoreMetadata:v16]) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [v20 countByEnumeratingWithState:&v49 objects:v56 count:16];
          if (v22) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    if ([v19 count]
      && ([v19 objectAtIndex:0],
          v26 = objc_claimAutoreleasedReturnValue(),
          char v27 = [v26 canMigrateStoreMetadata:v16],
          v26,
          (v27 & 1) != 0))
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v19;
      uint64_t v41 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v41)
      {
        id v42 = v15;
        uint64_t v40 = *(void *)v46;
        while (2)
        {
          uint64_t v28 = 0;
          v29 = v16;
          do
          {
            if (*(void *)v46 != v40) {
              objc_enumerationMutation(obj);
            }
            v30 = *(void **)(*((void *)&v45 + 1) + 8 * v28);
            v31 = [v30 sourceModelForStoreMetadata:v29];
            v32 = [v30 destinationModel];
            v33 = [v30 mappingModelForStoreMetadata:v29];
            if (![(NotesMigrationManager *)v43 migrateNotesStoreAtURL:v44 storeType:v13 options:v42 sourceModel:v31 destinationModel:v32 mappingModel:v33 error:a7])
            {

              v16 = v29;
              id v15 = v42;
              goto LABEL_27;
            }
            v16 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v13 URL:v44 error:a7];

            if (!v16)
            {
              BOOL v17 = 0;
              goto LABEL_35;
            }
            ++v28;
            v29 = v16;
          }
          while (v41 != v28);
          BOOL v17 = 1;
          uint64_t v41 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v41) {
            continue;
          }
          break;
        }
LABEL_35:
        id v15 = v42;
      }
      else
      {
        BOOL v17 = 1;
      }
    }
    else
    {
      if (!a7)
      {
        BOOL v17 = 0;
        goto LABEL_30;
      }
      uint64_t v34 = [NSString stringWithFormat:@"No mapping claim to be able to migrate storeMetadata: %@", v16];
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F836C8];
      uint64_t v54 = *MEMORY[0x1E4F836D0];
      uint64_t v55 = v34;
      id obj = (id)v34;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      *a7 = [v35 errorWithDomain:v36 code:101 userInfo:v31];
LABEL_27:

      BOOL v17 = 0;
    }

LABEL_30:
    id v14 = v38;
    goto LABEL_31;
  }
  BOOL v17 = 1;
LABEL_31:

  return v17;
}

- (BOOL)areStoreMetadata:(id)a3 matchingEntityVersionsInModel:(id)a4
{
  id v5 = a3;
  v6 = [a4 entityVersionHashesByName];
  v7 = [v5 objectForKey:*MEMORY[0x1E4F1BF78]];

  LOBYTE(v5) = [v6 isEqual:v7];
  return (char)v5;
}

- (BOOL)migrateNotesStoreAtURL:(id)a3 storeType:(id)a4 options:(id)a5 sourceModel:(id)a6 destinationModel:(id)a7 mappingModel:(id)a8 error:(id *)a9
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v42 = v14;
  if (v19)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    uint64_t v21 = [v20 URLForDirectory:99 inDomain:1 appropriateForURL:v14 create:1 error:a9];
    if (v21)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __114__NotesMigrationManager_migrateNotesStoreAtURL_storeType_options_sourceModel_destinationModel_mappingModel_error___block_invoke;
      v43[3] = &unk_1E686E0C8;
      id v38 = v20;
      id v44 = v38;
      uint64_t v40 = v21;
      id v22 = v19;
      id v23 = v18;
      id v24 = v21;
      id v45 = v24;
      v39 = (void (**)(void))MEMORY[0x1D25DE760](v43);
      v25 = [v24 URLByAppendingPathComponent:@"tmpDB.sqlite" isDirectory:0];
      id v26 = objc_alloc(MEMORY[0x1E4F1C138]);
      uint64_t v41 = v23;
      id v27 = v23;
      id v19 = v22;
      uint64_t v28 = (void *)[v26 initWithSourceModel:v17 destinationModel:v27];
      id v29 = v14;
      v30 = v15;
      int v31 = [v28 migrateStoreFromURL:v29 type:v15 options:v16 withMappingModel:v22 toDestinationURL:v25 destinationType:v15 destinationOptions:v16 error:a9];
      char v32 = 0;
      if (v31)
      {
        if ([v38 removeItemAtURL:v42 error:a9]) {
          char v32 = [v38 moveItemAtURL:v25 toURL:v42 error:a9];
        }
        else {
          char v32 = 0;
        }
      }
      v39[2](v39);

      uint64_t v21 = v40;
      id v18 = v41;
    }
    else
    {
      v30 = v15;
      char v32 = 0;
    }

    goto LABEL_13;
  }
  v30 = v15;
  if (a9)
  {
    v33 = (void *)MEMORY[0x1E4F28C58];
    id v34 = v18;
    uint64_t v35 = *MEMORY[0x1E4F836C8];
    uint64_t v46 = *MEMORY[0x1E4F836D0];
    v47[0] = @"No mapping model specified";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    uint64_t v36 = v35;
    id v18 = v34;
    id v19 = 0;
    [v33 errorWithDomain:v36 code:101 userInfo:v20];
    char v32 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  char v32 = 0;
LABEL_14:

  return v32;
}

void __114__NotesMigrationManager_migrateNotesStoreAtURL_storeType_options_sourceModel_destinationModel_mappingModel_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) path];
  LODWORD(v2) = [v2 fileExistsAtPath:v3];

  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) path];
    id v7 = 0;
    LOBYTE(v4) = [v4 removeItemAtPath:v5 error:&v7];
    id v6 = v7;

    if ((v4 & 1) == 0) {
      NSLog(&cfstr_ErrorRemovingT.isa, v6);
    }
  }
}

@end