@interface PLPairingProcessor
- (BOOL)_copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)_copyResourceOfType:(unsigned int)a3 onAsset:(id)a4 toType:(unsigned int)a5 onAsset:(id)a6 error:(id *)a7;
- (BOOL)processPairingForFetchRequest:(id)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)updatePrimaryAsset:(id)a3 andRemoveAssetIfPossible:(id)a4;
- (NSPredicate)locatedInUsersPhotoLibrary;
- (PLPairingProcessor)init;
- (id)combinePair:(id)a3 error:(id *)a4;
- (id)fetchRequestForLibrary;
- (id)fetchRequestForSortedGroupIDs:(id)a3;
- (id)firstGroupFromAssets:(id)a3;
- (id)groupIDForAsset:(id)a3;
- (void)_deleteResourceOfType:(unsigned int)a3 forAsset:(id)a4 verifyInserted:(BOOL)a5 deleteFile:(BOOL)a6;
- (void)setLocatedInUsersPhotoLibrary:(id)a3;
@end

@implementation PLPairingProcessor

- (void).cxx_destruct
{
}

- (void)setLocatedInUsersPhotoLibrary:(id)a3
{
}

- (NSPredicate)locatedInUsersPhotoLibrary
{
  return self->_locatedInUsersPhotoLibrary;
}

- (void)_deleteResourceOfType:(unsigned int)a3 forAsset:(id)a4 verifyInserted:(BOOL)a5 deleteFile:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v10 = _originalResourceOfType(v9, a3);
  v11 = v10;
  if (v10 && (!v7 || [v10 isInserted])) {
    [v11 deleteResource];
  }
  if (v6)
  {
    v12 = _pathForResourceType(v9, a3);
    if (v12)
    {
      v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
      v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v18 = 0;
      char v15 = [v14 removeItemAtURL:v13 error:&v18];
      id v16 = v18;

      if ((v15 & 1) == 0)
      {
        v17 = PLBackendGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v13;
          __int16 v21 = 2112;
          id v22 = v16;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Error trying to clean up copy at %@: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v13 = PLBackendGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = 0;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Error trying to clean up copy at %@: path was nil", buf, 0xCu);
      }
    }
  }
}

- (BOOL)updatePrimaryAsset:(id)a3 andRemoveAssetIfPossible:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [v6 hasAdjustments];
  if ((v7 & 1) == 0)
  {
    v8 = [v6 albums];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v13 kindValue] == 2)
          {
            v14 = [v13 mutableAssets];
            uint64_t v15 = [v14 indexOfObject:v6];
            if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
              [v14 insertObject:v5 atIndex:v15];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v10);
    }
    id v16 = [v6 addedDate];
    [v16 timeIntervalSinceReferenceDate];
    double v18 = v17;
    v19 = [v5 addedDate];
    [v19 timeIntervalSinceReferenceDate];
    double v21 = v18 - v20;

    if (v21 > 0.0)
    {
      id v22 = [v6 importSession];
      [v5 setImportSession:v22];

      uint64_t v23 = [v5 importSession];
      [v23 updateImportDatesFromAddedAsset:v5];
    }
    v24 = PLBackendGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = [v6 additionalAttributes];
      v26 = [v25 originalFilename];
      *(_DWORD *)buf = 138412290;
      v38 = v26;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEBUG, "PLPairing: deleting asset %@", buf, 0xCu);
    }
    v27 = NSString;
    v28 = [v6 uuid];
    v29 = [v5 uuid];
    v30 = [v27 stringWithFormat:@"Asset (%@) was paired as a resource of another asset (%@)", v28, v29];
    v31 = +[PLAssetTransactionReason transactionReason:v30];
    [v6 deleteWithReason:v31];
  }
  return v7 ^ 1;
}

- (BOOL)_copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v7 = a3;
  v8 = a4;
  uint64_t v9 = PLBackendGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    double v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "PLPairing: copying %@ to %@", buf, 0x16u);
  }

  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  int v11 = [v10 copyItemAtURL:v7 toURL:v8 error:&v19];
  id v12 = v19;

  if (v11)
  {
    uint64_t v13 = *MEMORY[0x1E4F8C3F0];
    id v18 = 0;
    char v14 = [MEMORY[0x1E4F8B908] stripExtendedAttributesFromFileAtURL:v8 inDomain:v13 error:&v18];
    uint64_t v15 = v18;
    if ((v14 & 1) == 0)
    {
      id v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        double v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to strip extended attributes from %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      double v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Error trying to copy %@ to %@: %@", buf, 0x20u);
    }
  }

  if (a5) {
    *a5 = v12;
  }

  return v12 == 0;
}

- (BOOL)_copyResourceOfType:(unsigned int)a3 onAsset:(id)a4 toType:(unsigned int)a5 onAsset:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v33 = a6;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__60864;
  v43 = __Block_byref_object_dispose__60865;
  id v44 = 0;
  id v12 = _originalResourceOfType(v11, a3);
  uint64_t v13 = v12;
  if (v12)
  {
    char v14 = [v12 fileURL];
    if (v14)
    {
      uint64_t v15 = [v11 pathManager];
      if ([v15 isUBF])
      {
        id v30 = objc_alloc(MEMORY[0x1E4F8B978]);
        v31 = [v33 uuid];
        id v16 = [v13 uniformTypeIdentifier];
        double v17 = [v16 identifier];
        id v18 = [v13 fileURL];
        id v19 = [v18 lastPathComponent];
        id v20 = (id)[v30 initWithAssetUuid:v31 bundleScope:0 uti:v17 resourceVersion:0 resourceType:v9 recipeID:0 originalFilename:v19];

        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __71__PLPairingProcessor__copyResourceOfType_onAsset_toType_onAsset_error___block_invoke;
        v35[3] = &unk_1E586C2C8;
        id v36 = v14;
        v37 = self;
        v38 = &v39;
        [v15 obtainAccessAndWaitWithFileWithIdentifier:v20 mode:2 toURLWithHandler:v35];
        double v21 = v36;
      }
      else
      {
        double v21 = _pathForResourceType(v33, v9);
        if (v21)
        {
          v27 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v21];
          v28 = PLBackendGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v14;
            __int16 v49 = 2112;
            v50 = v27;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "PLPairing: copying %@ to %@", buf, 0x16u);
          }

          id v34 = 0;
          [(PLPairingProcessor *)self _copyFromURL:v14 toURL:v27 error:&v34];
          id v20 = v34;
        }
        else
        {
          id v20 = 0;
        }
      }
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28228];
      v46[0] = @"Couldn't get file URL.";
      v45[0] = v24;
      v45[1] = @"Resource Object Id";
      uint64_t v15 = [v13 objectID];
      v46[1] = v15;
      v45[2] = @"Asset UUID";
      id v20 = [v11 uuid];
      v46[2] = v20;
      double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
      uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v21];
      uint64_t v26 = (void *)v40[5];
      v40[5] = v25;
    }
    BOOL v22 = v40[5] == 0;
  }
  else
  {
    BOOL v22 = 0;
  }
  if (a7) {
    *a7 = (id) v40[5];
  }

  _Block_object_dispose(&v39, 8);
  return v22;
}

void __71__PLPairingProcessor__copyResourceOfType_onAsset_toType_onAsset_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    char v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = a1[4];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "PLPairing: copying %@ to %@", buf, 0x16u);
    }

    uint64_t v10 = a1[4];
    uint64_t v9 = (void *)a1[5];
    uint64_t v11 = *(void *)(a1[6] + 8);
    char v14 = *(void **)(v11 + 40);
    [v9 _copyFromURL:v10 toURL:v5 error:&v14];
    id v12 = v14;
    uint64_t v13 = (id *)(v11 + 40);
  }
  else
  {
    uint64_t v13 = (id *)(*(void *)(a1[6] + 8) + 40);
    id v12 = a3;
  }
  objc_storeStrong(v13, v12);
}

- (id)combinePair:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)firstGroupFromAssets:(id)a3
{
  return 0;
}

- (id)fetchRequestForSortedGroupIDs:(id)a3
{
  return 0;
}

- (id)fetchRequestForLibrary
{
  return 0;
}

- (id)groupIDForAsset:(id)a3
{
  return 0;
}

- (BOOL)processPairingForFetchRequest:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ((!MEMORY[0x19F38C0C0]() || (PLIsAssetsd() & 1) == 0) && (PLIsReallyAssetsd() & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = NSStringFromSelector(a2);
    [v27 handleFailureInMethod:a2, self, @"PLPairing.m", 206, @"%@: Only do pairing in server", v28 object file lineNumber description];

    if (v9) {
      goto LABEL_5;
    }
LABEL_24:
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F8C500];
    uint64_t v44 = *MEMORY[0x1E4F28228];
    v45 = @"Couldn't make a request for assets with live photo group UUIDs in the library.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    id v17 = [v29 errorWithDomain:v30 code:41003 userInfo:v14];
    goto LABEL_25;
  }
  if (!v9) {
    goto LABEL_24;
  }
LABEL_5:
  id v33 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v43 = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __68__PLPairingProcessor_processPairingForFetchRequest_inContext_error___block_invoke;
  v41[3] = &unk_1E5875CB8;
  v41[4] = self;
  id v12 = v11;
  id v42 = v12;
  id v32 = v10;
  id v34 = v9;
  id v13 = (id)[v10 enumerateObjectsFromFetchRequest:v9 count:&v43 batchSize:100 usingBlock:v41];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = 0;
    uint64_t v35 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v20 = (void *)MEMORY[0x19F38D3B0]();
        double v21 = [v14 objectForKeyedSubscript:v19];
        if ((unint64_t)[v21 count] >= 2)
        {
          BOOL v22 = v17;
          while (1)
          {
            uint64_t v23 = [(PLPairingProcessor *)self firstGroupFromAssets:v21];
            if (!v23) {
              break;
            }
            uint64_t v24 = (void *)v23;
            id v36 = v22;
            uint64_t v25 = [(PLPairingProcessor *)self combinePair:v23 error:&v36];
            id v17 = v36;

            if (v25) {
              [(PLPairingProcessor *)self setDeferredProcessingIfNescessaryForAsset:v25];
            }
            uint64_t v26 = [v24 allValues];
            [v21 removeObjectsInArray:v26];

            BOOL v22 = v17;
            if ((unint64_t)[v21 count] <= 1) {
              goto LABEL_18;
            }
          }
          id v17 = v22;
        }
LABEL_18:
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v16);
  }
  else
  {
    id v17 = 0;
  }

  a5 = v33;
  id v9 = v34;
  id v10 = v32;
LABEL_25:

  if (a5) {
    *a5 = v17;
  }

  return v17 == 0;
}

void __68__PLPairingProcessor_processPairingForFetchRequest_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "groupIDForAsset:");
  v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:v3];
  }
  [v4 addObject:v5];
}

- (PLPairingProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLPairingProcessor;
  v2 = [(PLPairingProcessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForUserLibrary"), 0);
    locatedInUsersPhotoLibrary = v2->_locatedInUsersPhotoLibrary;
    v2->_locatedInUsersPhotoLibrary = (NSPredicate *)v3;
  }
  return v2;
}

@end