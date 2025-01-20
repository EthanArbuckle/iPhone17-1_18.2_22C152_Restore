@interface PLPairing
- (BOOL)processPairingForEntireLibraryInContext:(id)a3 error:(id *)a4;
- (BOOL)processPairingForGroupIDs:(id)a3 inContext:(id)a4 deferredProcessingNeeded:(BOOL *)a5 error:(id *)a6;
- (PLPairing)init;
@end

@implementation PLPairing

- (void).cxx_destruct
{
}

- (BOOL)processPairingForGroupIDs:(id)a3 inContext:(id)a4 deferredProcessingNeeded:(BOOL *)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  if ((!MEMORY[0x19F38C0C0]() || (PLIsAssetsd() & 1) == 0) && (PLIsReallyAssetsd() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = NSStringFromSelector(a2);
    [v16 handleFailureInMethod:a2, self, @"PLPairing.m", 118, @"%@: Only do pairing in server", v17 object file lineNumber description];
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  if (v11 && ![v11 count])
  {
    BOOL v14 = 1;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(p_lock);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__PLPairing_processPairingForGroupIDs_inContext_deferredProcessingNeeded_error___block_invoke;
    v18[3] = &unk_1E5873D70;
    id v19 = v11;
    v21 = &v24;
    id v20 = v12;
    v22 = a5;
    v23 = a6;
    [v20 performBlockAndWait:v18];
    os_unfair_lock_unlock(p_lock);
    BOOL v14 = *((unsigned char *)v25 + 24) != 0;
  }
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __80__PLPairing_processPairingForGroupIDs_inContext_deferredProcessingNeeded_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EEBEEFA0];
  if ([v2 count])
  {
    v3 = objc_alloc_init(PLLivePhotoPairingProcessor);
    v4 = [(PLLivePhotoPairingProcessor *)v3 fetchRequestForSortedGroupIDs:v2];
    uint64_t v5 = *(void *)(a1 + 40);
    id v17 = 0;
    BOOL v6 = [(PLPairingProcessor *)v3 processPairingForFetchRequest:v4 inContext:v5 error:&v17];
    id v7 = v17;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  }
  else
  {
    id v7 = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:&unk_1EEBEEFB8];

    if ([v8 count])
    {
      v9 = objc_alloc_init(PLCTMPairingProcessor);
      v10 = [(PLCTMPairingProcessor *)v9 fetchRequestForSortedGroupIDs:v8];
      uint64_t v11 = *(void *)(a1 + 40);
      id v16 = 0;
      BOOL v12 = [(PLPairingProcessor *)v9 processPairingForFetchRequest:v10 inContext:v11 error:&v16];
      id v13 = v16;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (*(void *)(a1 + 56)) {
          **(unsigned char **)(a1 + 56) = [(PLCTMPairingProcessor *)v9 deferredProcessingNeeded];
        }
      }
      else
      {
        v15 = *(void **)(a1 + 64);
        if (v15) {
          void *v15 = v13;
        }
      }
    }
  }
  else
  {
    BOOL v14 = *(void **)(a1 + 64);
    if (v14) {
      *BOOL v14 = v7;
    }
    v8 = v2;
  }
}

- (BOOL)processPairingForEntireLibraryInContext:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ((!MEMORY[0x19F38C0C0]() || (PLIsAssetsd() & 1) == 0) && (PLIsReallyAssetsd() & 1) == 0)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"PLPairing.m", 89, @"%@: Only do pairing in server", v13 object file lineNumber description];
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  p_lock = &self->_lock;
  os_unfair_lock_lock(p_lock);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__PLPairing_processPairingForEntireLibraryInContext_error___block_invoke;
  v14[3] = &unk_1E5873ED8;
  id v16 = &v18;
  id v9 = v7;
  id v15 = v9;
  id v17 = a4;
  [v9 performBlockAndWait:v14];
  os_unfair_lock_unlock(p_lock);
  char v10 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __59__PLPairing_processPairingForEntireLibraryInContext_error___block_invoke(void *a1)
{
  v2 = objc_alloc_init(PLLivePhotoPairingProcessor);
  v3 = [(PLLivePhotoPairingProcessor *)v2 fetchRequestForLibrary];
  uint64_t v4 = a1[4];
  id v15 = 0;
  BOOL v5 = [(PLPairingProcessor *)v2 processPairingForFetchRequest:v3 inContext:v4 error:&v15];
  id v6 = v15;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;

  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v7 = objc_alloc_init(PLCTMPairingProcessor);
    v8 = [(PLCTMPairingProcessor *)v7 fetchRequestForLibrary];
    uint64_t v9 = a1[4];
    id v14 = 0;
    BOOL v10 = [(PLPairingProcessor *)v7 processPairingForFetchRequest:v8 inContext:v9 error:&v14];
    id v11 = v14;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v10;

    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      BOOL v12 = (void *)a1[6];
      if (v12) {
        *BOOL v12 = v11;
      }
    }
  }
  else
  {
    id v13 = (void *)a1[6];
    if (v13) {
      *id v13 = v6;
    }
  }
}

- (PLPairing)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLPairing;
  result = [(PLPairing *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end