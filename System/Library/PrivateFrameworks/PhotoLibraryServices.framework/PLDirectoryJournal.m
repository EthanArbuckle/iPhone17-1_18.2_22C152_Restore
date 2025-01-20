@interface PLDirectoryJournal
- (BOOL)enumeratePayloadsUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)persistManagedObject:(id)a3 error:(id *)a4;
- (BOOL)removeAllPersistenceFilesWithError:(id *)a3;
- (BOOL)removePersistenceForManagedObject:(id)a3 error:(id *)a4;
- (BOOL)shouldPersistManagedObject:(id)a3;
- (Class)payloadClass;
- (PLDirectoryJournal)initWithPathManager:(id)a3 payloadClass:(Class)a4;
- (id)baseURLCreateIfNeeded:(BOOL)a3;
@end

@implementation PLDirectoryJournal

- (void).cxx_destruct
{
}

- (BOOL)enumeratePayloadsUsingBlock:(id)a3 error:(id *)a4
{
  v27 = a4;
  v61[2] = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  v30 = self;
  v31 = [(PLDirectoryJournal *)self baseURLCreateIfNeeded:0];
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 1;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__3350;
  v54 = __Block_byref_object_dispose__3351;
  id v55 = 0;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = *MEMORY[0x1E4F1C670];
  v61[0] = *MEMORY[0x1E4F1C6E8];
  v61[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __56__PLDirectoryJournal_enumeratePayloadsUsingBlock_error___block_invoke;
  v49[3] = &unk_1E5862EA8;
  v49[4] = &v50;
  v49[5] = &v56;
  v8 = [v5 enumeratorAtURL:v31 includingPropertiesForKeys:v7 options:5 errorHandler:v49];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v46;
    v28 = v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "lastPathComponent", v27, v28);
        unint64_t v13 = [v12 length];
        if (v13 < [MEMORY[0x1E4F8BA08] UUIDStringLength])
        {
          v14 = 0;
LABEL_16:

          continue;
        }
        v14 = objc_msgSend(v12, "substringWithRange:", 0, objc_msgSend(MEMORY[0x1E4F8BA08], "UUIDStringLength"));
        if (!v14 || (PLIsValidUUIDString() & 1) == 0) {
          goto LABEL_16;
        }
        v15 = [[PLJournal alloc] initWithBaseURL:v31 name:v14 payloadClass:v30->_payloadClass hasMetadata:0];
        v16 = [(PLJournal *)v15 snapshotJournal];
        v17 = [v16 url];
        v18 = [v17 lastPathComponent];
        char v19 = [v12 isEqualToString:v18];

        if ((v19 & 1) == 0)
        {

          goto LABEL_16;
        }
        v43[0] = 0;
        v43[1] = v43;
        v43[2] = 0x2020000000;
        char v44 = 0;
        uint64_t v39 = 0;
        v40 = &v39;
        uint64_t v41 = 0x2020000000;
        char v42 = 0;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v35[0] = __56__PLDirectoryJournal_enumeratePayloadsUsingBlock_error___block_invoke_2;
        v35[1] = &unk_1E5862ED0;
        v37 = v43;
        id v36 = v29;
        v38 = &v39;
        v20 = (id *)(v51 + 5);
        id v33 = (id)v51[5];
        BOOL v21 = [(PLJournal *)v15 enumeratePayloadsUsingBlock:v34 error:&v33];
        objc_storeStrong(v20, v33);
        *((unsigned char *)v57 + 24) = v21;
        if (*((unsigned char *)v40 + 24)) {
          BOOL v21 = 0;
        }

        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(v43, 8);

        if (!v21) {
          goto LABEL_19;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v9);
  }
LABEL_19:

  int v22 = *((unsigned __int8 *)v57 + 24);
  id v23 = (id)v51[5];
  v24 = v23;
  if (!v22 && v27) {
    id *v27 = v23;
  }

  BOOL v25 = *((unsigned char *)v57 + 24) != 0;
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v25;
}

uint64_t __56__PLDirectoryJournal_enumeratePayloadsUsingBlock_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = PLIsErrorFileNotFound();
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }

  return v6;
}

uint64_t __56__PLDirectoryJournal_enumeratePayloadsUsingBlock_error___block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    uint64_t v3 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)removeAllPersistenceFilesWithError:(id *)a3
{
  v4 = [(PLDirectoryJournal *)self baseURLCreateIfNeeded:0];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  int v6 = [v5 removeItemAtURL:v4 error:&v12];
  id v7 = v12;

  int v8 = PLIsErrorFileNotFound() | v6;
  id v9 = v7;
  uint64_t v10 = v9;
  if ((v8 & 1) == 0 && a3) {
    *a3 = v9;
  }

  return v8;
}

- (BOOL)removePersistenceForManagedObject:(id)a3 error:(id *)a4
{
  int v6 = [(objc_class *)self->_payloadClass payloadAdapterForManagedObject:a3];
  id v7 = [v6 payloadID];

  if (v7)
  {
    int v8 = [PLJournal alloc];
    id v9 = [(PLDirectoryJournal *)self baseURLCreateIfNeeded:0];
    uint64_t v10 = [v6 payloadID];
    v11 = [v10 payloadIDString];
    id v12 = [(PLJournal *)v8 initWithBaseURL:v9 name:v11 payloadClass:self->_payloadClass hasMetadata:0];

    char v13 = [(PLJournal *)v12 removeJournalFilesWithError:a4];
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

- (BOOL)persistManagedObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(objc_class *)self->_payloadClass payloadAdapterForManagedObject:v6];
  int v8 = [v7 payloadID];

  if (v8)
  {
    if ([v7 isValidForJournalPersistence])
    {
      id v9 = [PLJournal alloc];
      uint64_t v10 = [(PLDirectoryJournal *)self baseURLCreateIfNeeded:1];
      v11 = [v7 payloadID];
      id v12 = [v11 payloadIDString];
      char v13 = [(PLJournal *)v9 initWithBaseURL:v10 name:v12 payloadClass:self->_payloadClass hasMetadata:0];

      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      char v20 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __49__PLDirectoryJournal_persistManagedObject_error___block_invoke;
      v16[3] = &unk_1E5862E80;
      v18 = v19;
      id v17 = v7;
      char v14 = [(PLJournal *)v13 createSnapshotUsingNextPayloadBlock:v16 createOnlyIfNecessary:0 error:a4];

      _Block_object_dispose(v19, 8);
    }
    else
    {
      char v14 = [(PLDirectoryJournal *)self removePersistenceForManagedObject:v6 error:a4];
    }
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

id __49__PLDirectoryJournal_persistManagedObject_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    v2 = 0;
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
    v2 = [*(id *)(a1 + 32) payloadForChangedKeys:0];
  }
  return v2;
}

- (BOOL)shouldPersistManagedObject:(id)a3
{
  id v4 = a3;
  if ([v4 isDeleted])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    if ([v4 isInserted]) {
      goto LABEL_8;
    }
    id v6 = [v4 changedValues];
    if ([v6 count])
    {
      id v7 = (void *)MEMORY[0x1E4F1CAD0];
      int v8 = [v4 changedValues];
      id v9 = [v8 allKeys];
      uint64_t v10 = [v7 setWithArray:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }

    Class payloadClass = self->_payloadClass;
    id v12 = [(objc_class *)payloadClass entityName];
    int v5 = [(objc_class *)payloadClass shouldPersistForChangedKeys:v10 entityName:v12];

    if (v5) {
LABEL_8:
    }
      LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)baseURLCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  pathManager = self->_pathManager;
  int v5 = [(objc_class *)self->_payloadClass payloadClassID];
  id v6 = [(PLPhotoLibraryPathManager *)pathManager photoDirectoryWithType:8 leafType:1 additionalPathComponents:v5 createIfNeeded:v3 error:0];

  id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];

  return v7;
}

- (Class)payloadClass
{
  return self->_payloadClass;
}

- (PLDirectoryJournal)initWithPathManager:(id)a3 payloadClass:(Class)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLDirectoryJournal;
  int v8 = [(PLDirectoryJournal *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pathManager, a3);
    v9->_Class payloadClass = a4;
  }

  return v9;
}

@end