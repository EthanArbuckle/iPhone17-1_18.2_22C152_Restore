@interface HVQueue
- (BOOL)cleanupWithError:(id *)a3 shouldContinueBlock:(id)a4;
- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4;
- (BOOL)dequeueContent:(id *)a3 dataSourceContentState:(id)a4 minimumLevelOfService:(unsigned __int8)a5 inMemoryItemsOnly:(BOOL)a6 error:(id *)a7;
- (BOOL)dequeuedContentConsumedWithError:(id *)a3;
- (BOOL)dequeuedContentNotConsumed:(id)a3 error:(id *)a4;
- (BOOL)enqueueContent:(id)a3 error:(id *)a4;
- (BOOL)ensureDeletionScanHasOccurredWithError:(id *)a3;
- (HVQueue)initWithIdentifier:(id)a3 biomeStream:(id)a4 memoryLimit:(signed __int16)a5 contentProtection:(id)a6 contentExpectedFromMultipleApps:(BOOL)a7;
- (NSString)contentProtection;
- (NSString)identifier;
- (_BYTE)_filterBlockForBundleIdentifier:(void *)a3 contentIdentifierSet:(void *)a4 domainSelection:;
- (__CFString)_bundleIdForEvent:(__CFString *)a1;
- (id)_identifierForContentWithUniqueIdentifier:(void *)a3 bundleId:;
- (id)description;
- (id)diskStorageStreamCount;
- (id)statsWithError:(id *)a3;
- (id)uniqueIdentifiersInDiskStorage;
- (id)uniqueIdentifiersInMemoryStorage;
- (uint64_t)_updateMemoryQueueTransactionExtendingTimer:(uint64_t)result;
- (unsigned)_identifierForContent:(unsigned __int8 *)a1;
- (unsigned)waitForDequeuedContentConsumedWithTimeout:(double)a3;
- (void)_deleteWithFilter:(int)a3 memory:(int)a4 disk:;
- (void)_writeEventsToDisk:(void *)a3 guardedData:;
@end

@implementation HVQueue

uint64_t __42__HVQueue_deleteContentWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 diskStorageIsKnownToBeEmpty] & 1) == 0)
  {
    v3 = [v5 diskContentBloomFilter];
    if (v3)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) matchesBloomFilter:v3];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        objc_msgSend(v5, "setBloomFilterHits:", objc_msgSend(v5, "bloomFilterHits") + 1);
      }
      else {
        objc_msgSend(v5, "setBloomFilterMisses:", objc_msgSend(v5, "bloomFilterMisses") + 1);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }

  return MEMORY[0x270F9A758]();
}

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = hv_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = identifier;
    _os_log_impl(&dword_226C41000, v6, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: deleteContentWithRequest: clearing queue", (uint8_t *)&buf, 0xCu);
  }

  if (!self->_contentExpectedFromMultipleApps)
  {
    uint64_t v8 = [v5 copyWithBundleIdentifier:&stru_26DAC8728];

    id v5 = (id)v8;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  lock = self->_lock;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __42__HVQueue_deleteContentWithRequest_error___block_invoke;
  v17 = &unk_2647D5118;
  v19 = &v20;
  id v10 = v5;
  id v18 = v10;
  [(_PASLock *)lock runWithLockAcquired:&v14];
  id v11 = v10;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__242;
  v30 = __Block_byref_object_dispose__243;
  id v31 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __42__HVQueue__filterBlockForDeletionRequest___block_invoke;
  v26[3] = &unk_2647D5408;
  v26[4] = self;
  v26[5] = &buf;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __42__HVQueue__filterBlockForDeletionRequest___block_invoke_2;
  v25[3] = &unk_2647D5430;
  v25[4] = self;
  v25[5] = &buf;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __42__HVQueue__filterBlockForDeletionRequest___block_invoke_3;
  v24[3] = &unk_2647D5480;
  v24[4] = self;
  v24[5] = &buf;
  objc_msgSend(v11, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:uniqueIdentifiersBlock:", v26, v25, v24, v14, v15, v16, v17);
  v12 = (void *)MEMORY[0x22A6669E0](*(void *)(*((void *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);

  -[HVQueue _deleteWithFilter:memory:disk:]((uint64_t)self, v12, 1, *((unsigned __int8 *)v21 + 24));
  _Block_object_dispose(&v20, 8);

  return 1;
}

uint64_t __42__HVQueue__filterBlockForDeletionRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[HVQueue _filterBlockForBundleIdentifier:contentIdentifierSet:domainSelection:](*(unsigned char **)(a1 + 32), a2, 0, a3);

  return MEMORY[0x270F9A758]();
}

- (_BYTE)_filterBlockForBundleIdentifier:(void *)a3 contentIdentifierSet:(void *)a4 domainSelection:
{
  id v7 = a2;
  unint64_t v8 = a3;
  unint64_t v9 = a4;
  id v10 = (void *)v9;
  if (a1)
  {
    if (v8 && v9)
    {
      uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:sel__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection_ object:a1 file:@"HVQueue.m" lineNumber:916 description:@"Deletion call specifies both unique identifiers and domains."];
    }
    else
    {
      if (!(v8 | v9))
      {
        if (!a1[24])
        {
          a1 = &__block_literal_global_261;
          goto LABEL_20;
        }
        if (!v7)
        {
          v16 = [MEMORY[0x263F08690] currentHandler];
          [v16 handleFailureInMethod:sel__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection_, a1, @"HVQueue.m", 921, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
        }
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke;
        v26[3] = &unk_2647D54A8;
        v26[4] = a1;
        id v11 = &v27;
        id v27 = v7;
        v12 = v26;
        goto LABEL_16;
      }
      if (!v9)
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_265;
        v18[3] = &unk_2647D54A8;
        v18[4] = a1;
        id v11 = &v19;
        id v19 = (id)v8;
        v12 = v18;
LABEL_16:
        a1 = (unsigned char *)MEMORY[0x22A6669E0](v12);
LABEL_19:

        goto LABEL_20;
      }
    }
    if (a1[24])
    {
      if (!v7)
      {
        v17 = [MEMORY[0x263F08690] currentHandler];
        [v17 handleFailureInMethod:sel__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection_, a1, @"HVQueue.m", 939, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
      }
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_2;
      v23[3] = &unk_2647D54F0;
      v23[4] = a1;
      id v11 = &v24;
      id v24 = v7;
      id v25 = v10;
      a1 = (unsigned char *)MEMORY[0x22A6669E0](v23);
      v13 = v25;
    }
    else
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_264;
      v20[3] = &unk_2647D54F0;
      v20[4] = a1;
      id v11 = &v21;
      id v21 = v7;
      id v22 = v10;
      a1 = (unsigned char *)MEMORY[0x22A6669E0](v20);
      v13 = v22;
    }

    goto LABEL_19;
  }
LABEL_20:

  return a1;
}

- (void)_deleteWithFilter:(int)a3 memory:(int)a4 disk:
{
  id v7 = a2;
  unint64_t v8 = v7;
  if (a1 && a3 | a4)
  {
    unint64_t v9 = *(void **)(a1 + 8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke;
    v10[3] = &unk_2647D53B8;
    char v12 = a4;
    char v13 = a3;
    v10[4] = a1;
    id v11 = v7;
    [v9 runWithLockAcquired:v10];
  }
}

void __41__HVQueue__deleteWithFilter_memory_disk___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 diskContentBloomFilter];

  if (*(unsigned char *)(a1 + 48)) {
    [v3 setDiskContentBloomFilter:0];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    id v5 = [v3 memoryStorage];
    v6 = [v5 indexesOfObjectsPassingTest:*(void *)(a1 + 40)];

    if ([v6 count])
    {
      id v7 = objc_opt_new();
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      v73[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_2;
      v73[3] = &unk_2647D5340;
      id v8 = v7;
      id v74 = v8;
      id v9 = v3;
      id v75 = v9;
      [v6 enumerateIndexesUsingBlock:v73];
      id v10 = v75;
      id v11 = v8;

      char v12 = hv_default_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 32);
        uint64_t v14 = [v6 count];
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_3;
        v72[3] = &unk_2647D51E0;
        v72[4] = *(void *)(a1 + 32);
        uint64_t v15 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v72);
        *(_DWORD *)long long buf = 138413059;
        uint64_t v77 = v13;
        __int16 v78 = 2048;
        *(void *)v79 = v14;
        *(_WORD *)&v79[8] = 2112;
        *(void *)&v79[10] = v15;
        *(_WORD *)&v79[18] = 2117;
        id v80 = v11;
        _os_log_impl(&dword_226C41000, v12, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: Deleting %tu items from memory %@: %{sensitive}@", buf, 0x2Au);
      }
      v16 = [v9 memoryStorage];
      [v16 removeObjectsAtIndexes:v6];

      -[HVQueue _updateMemoryQueueTransactionExtendingTimer:](*(void *)(a1 + 32), 0);
    }
  }
  if (*(unsigned char *)(a1 + 48) && ([v3 diskStorageIsKnownToBeEmpty] & 1) == 0)
  {
    unsigned int v17 = 2 * [v3 diskStorageEventCount];
    if (v17 <= 0x80) {
      unsigned int v17 = 128;
    }
    if (v17 >= 0x342A2) {
      unint64_t v19 = 213666;
    }
    else {
      unint64_t v19 = v17;
    }
    LODWORD(v18) = 1008981770;
    uint64_t v20 = [MEMORY[0x263F61E08] bloomFilterInMemoryWithNumberOfValuesN:v19 errorRateP:v18];
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2020000000;
    int v71 = 0;
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x2020000000;
    int v67 = 0;
    id v21 = objc_opt_new();
    id v22 = *(id *)(*(void *)(a1 + 32) + 32);
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_227;
    v61[3] = &unk_2647D5368;
    id v23 = v21;
    id v62 = v23;
    id v24 = v22;
    id v63 = v24;
    id v25 = (void *)MEMORY[0x22A6669E0](v61);
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    char v60 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    char v58 = 0;
    v26 = [MEMORY[0x263EFF910] now];
    [v26 timeIntervalSinceReferenceDate];
    uint64_t v28 = v27;

    uint64_t v29 = objc_opt_class();
    v30 = [v3 diskStorage];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_230;
    v44[3] = &unk_2647D5390;
    v51 = v59;
    id v31 = v24;
    id v45 = v31;
    v52 = &v68;
    uint64_t v56 = v28;
    uint64_t v55 = v29;
    v53 = v57;
    id v49 = *(id *)(a1 + 40);
    id v32 = v23;
    uint64_t v33 = *(void *)(a1 + 32);
    id v46 = v32;
    uint64_t v47 = v33;
    id v34 = v25;
    id v50 = v34;
    v54 = &v64;
    id v35 = v20;
    id v48 = v35;
    [v30 pruneWithPredicateBlock:v44];

    (*((void (**)(id, uint64_t))v34 + 2))(v34, 1);
    if (*((_DWORD *)v65 + 6)) {
      BOOL v36 = 1;
    }
    else {
      BOOL v36 = v4 == 0;
    }
    int v37 = !v36;
    v38 = hv_default_log_handle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 32);
      int v40 = *((_DWORD *)v65 + 6);
      v41 = &stru_26DAC8728;
      if (v37) {
        v41 = @" (!!! bloom filter false positive !!!!)";
      }
      int v42 = *((_DWORD *)v69 + 6);
      *(_DWORD *)long long buf = 138413058;
      uint64_t v77 = v39;
      __int16 v78 = 1024;
      *(_DWORD *)v79 = v40;
      *(_WORD *)&v79[4] = 2112;
      *(void *)&v79[6] = v41;
      *(_WORD *)&v79[14] = 1024;
      *(_DWORD *)&v79[16] = v42;
      _os_log_impl(&dword_226C41000, v38, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: deleteContentWithRequest: biome enumeration deleted %u events on-disk%@, %u events remain on-disk", buf, 0x22u);
    }

    unint64_t v43 = *((unsigned int *)v69 + 6);
    if (!v43 || v19 >> 2 > v43)
    {
      if (!v43) {
        [v3 setDiskStorageIsKnownToBeEmpty:1];
      }

      id v35 = 0;
      unint64_t v43 = *((unsigned int *)v69 + 6);
    }
    [v3 setDiskStorageEventCount:v43];
    [v3 setDiskContentBloomFilter:v35];
    if (v37) {
      objc_msgSend(v3, "setBloomFilterFalsePositives:", objc_msgSend(v3, "bloomFilterFalsePositives") + 1);
    }

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(v59, 8);

    _Block_object_dispose(&v64, 8);
    _Block_object_dispose(&v68, 8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentConsumedSemaphore, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)cleanupWithError:(id *)a3 shouldContinueBlock:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:-1209600.0];
  [v6 timeIntervalSinceReferenceDate];
  lock = self->_lock;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__HVQueue_cleanupWithError_shouldContinueBlock___block_invoke;
  v12[3] = &unk_2647D5590;
  v12[4] = self;
  id v13 = v6;
  id v14 = v5;
  uint64_t v15 = v8;
  id v9 = v5;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v12 shouldContinueBlock:v9];

  return 1;
}

void __48__HVQueue_cleanupWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 diskStorageIsKnownToBeEmpty] & 1) == 0)
  {
    v4 = hv_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: starting cleanup tasks with cutoff date %@", buf, 0x16u);
    }

    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    int v28 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    id v7 = [v3 diskStorage];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __48__HVQueue_cleanupWithError_shouldContinueBlock___block_invoke_318;
    id v14 = &unk_2647D5568;
    id v15 = *(id *)(a1 + 48);
    v16 = &v19;
    uint64_t v18 = *(void *)(a1 + 56);
    unsigned int v17 = buf;
    [v7 pruneWithPredicateBlock:&v11];

    if (!*((unsigned char *)v20 + 24))
    {
      objc_msgSend(v3, "setDiskStorageEventCount:", *(unsigned int *)(*(void *)&buf[8] + 24), v11, v12, v13, v14);
      if (!*(_DWORD *)(*(void *)&buf[8] + 24))
      {
        [v3 setDiskStorageIsKnownToBeEmpty:1];
        [v3 setDiskContentBloomFilter:0];
      }
    }
    uint64_t v8 = hv_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v20 + 24)) {
        id v9 = @"completed";
      }
      else {
        id v9 = @"was asked to defer during";
      }
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)id v23 = 138412546;
      id v24 = v9;
      __int16 v25 = 2114;
      uint64_t v26 = v10;
      _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: %{public}@ cleanup tasks.", v23, 0x16u);
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(buf, 8);
  }
}

BOOL __48__HVQueue_cleanupWithError_shouldContinueBlock___block_invoke_318(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v5 + 16);
  id v7 = a2;
  if ((v6(v5) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  [v7 timestamp];
  double v9 = v8;

  double v10 = *(double *)(a1 + 56);
  if (v9 >= v10) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  return v9 < v10;
}

- (id)diskStorageStreamCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__HVQueue_diskStorageStreamCount__block_invoke;
  v5[3] = &unk_2647D5540;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = [NSNumber numberWithUnsignedLongLong:v7[3]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__HVQueue_diskStorageStreamCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 diskStorage];
  v4 = [v3 publisherFromStartTime:0.0];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__HVQueue_diskStorageStreamCount__block_invoke_3;
  v6[3] = &unk_2647D5518;
  v6[4] = *(void *)(a1 + 32);
  id v5 = (id)[v4 sinkWithCompletion:&__block_literal_global_316 receiveInput:v6];
}

uint64_t __33__HVQueue_diskStorageStreamCount__block_invoke_3(uint64_t result)
{
  return result;
}

- (id)statsWithError:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__1010;
  uint64_t v11 = __Block_byref_object_dispose__1011;
  id v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__HVQueue_statsWithError___block_invoke;
  v6[3] = &unk_2647D5118;
  v6[4] = self;
  void v6[5] = &v7;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __26__HVQueue_statsWithError___block_invoke(uint64_t a1, void *a2)
{
  v33[6] = *MEMORY[0x263EF8340];
  id v6 = a2;
  v33[0] = *(void *)(*(void *)(a1 + 32) + 32);
  v32[0] = @"Identifier";
  v32[1] = @"Enqueued Count";
  uint64_t v7 = (void *)0x263F08000;
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "enqueuedCount"));
  v33[1] = v27;
  v32[2] = @"Dequeued Count";
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "dequeuedCount"));
  v33[2] = v26;
  v32[3] = @"Dequeued Identifiers";
  __int16 v25 = [v6 dequeuedContentIdentifiers];
  id v24 = [v25 allObjects];
  v33[3] = v24;
  v32[4] = @"Memory";
  v30[0] = @"count";
  uint64_t v8 = NSNumber;
  id v23 = [v6 memoryStorage];
  char v22 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
  v31[0] = v22;
  v30[1] = @"limit";
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v6, "memoryStorageLimit"));
  v31[1] = v21;
  v30[2] = @"full";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isMemoryStorageFull"));
  v31[2] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
  v33[4] = v10;
  v32[5] = @"Disk";
  uint64_t v11 = [v6 diskStorage];
  if (v11)
  {
    v28[0] = @"stream";
    uint64_t v20 = [v6 diskStorage];
    uint64_t v19 = [v20 identifier];
    v29[0] = v19;
    v28[1] = @"count";
    uint64_t v18 = [*(id *)(a1 + 32) diskStorageStreamCount];
    v29[1] = v18;
    v28[2] = @"known to be empty";
    unsigned int v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "diskStorageIsKnownToBeEmpty"));
    v29[2] = v17;
    v28[3] = @"Bookmark";
    v16 = [v6 bookmark];
    id v3 = [v16 jsonDict];
    v29[3] = v3;
    v28[4] = @"Bloom filter hits";
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "bloomFilterHits"));
    v29[4] = v4;
    v28[5] = @"Bloom filter hits (false positives)";
    v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "bloomFilterFalsePositives"));
    v29[5] = v2;
    v28[6] = @"Bloom filter misses";
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "bloomFilterMisses"));
    v29[6] = v7;
    id v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:7];
  }
  else
  {
    id v12 = @"no disk queue";
  }
  v33[5] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if (v11)
  {
  }
}

- (BOOL)ensureDeletionScanHasOccurredWithError:(id *)a3
{
  lock = self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__HVQueue_ensureDeletionScanHasOccurredWithError___block_invoke;
  v5[3] = &unk_2647D52D0;
  v5[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v5];
  return 1;
}

void __50__HVQueue_ensureDeletionScanHasOccurredWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 diskContentBloomFilter];
  if (v3)
  {
  }
  else if (([v4 diskStorageIsKnownToBeEmpty] & 1) == 0)
  {
    -[HVQueue _deleteWithFilter:memory:disk:](*(void *)(a1 + 32), &__block_literal_global_224, 0, 1);
  }
}

void __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) memoryStorage];
  id v4 = [v5 objectAtIndexedSubscript:a2];
  [v3 addObject:v4];
}

unsigned __int8 *__41__HVQueue__deleteWithFilter_memory_disk___block_invoke_3(uint64_t a1, void *a2)
{
  return -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), a2);
}

- (uint64_t)_updateMemoryQueueTransactionExtendingTimer:(uint64_t)result
{
  if (result)
  {
    v2 = *(void **)(result + 8);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __55__HVQueue__updateMemoryQueueTransactionExtendingTimer___block_invoke;
    v3[3] = &unk_2647D5140;
    char v4 = a2;
    v3[4] = result;
    return [v2 runWithLockAcquired:v3];
  }
  return result;
}

void __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_227(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v4 = [*(id *)(a1 + 32) count];
  unint64_t v5 = 63;
  if (a2) {
    unint64_t v5 = 0;
  }
  if (v4 > v5)
  {
    id v6 = (void *)MEMORY[0x22A6667F0]();
    uint64_t v7 = hv_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: deleteContentWithRequest: deleted identifiers %@", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) removeAllObjects];
  }
}

uint64_t __41__HVQueue__deleteWithFilter_memory_disk___block_invoke_230(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = (void *)MEMORY[0x22A6667F0]();
  unint64_t v5 = [v3 eventBody];
  if (!v5)
  {
    v16 = (void *)MEMORY[0x22A6667F0]();
LABEL_20:
    (*(void (**)(void, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 0);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    uint64_t v20 = 1;
    goto LABEL_21;
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 personaId];

    if (!v6)
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
      if (!*(unsigned char *)(v21 + 24))
      {
        *(unsigned char *)(v21 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
        uint64_t v11 = hv_default_log_handle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          int v26 = 138543362;
          uint64_t v27 = v22;
          uint64_t v13 = "HVQueue<%{public}@>: deleteContentWithRequest: deleting events likely stored in V1 Biome persistence!";
          goto LABEL_16;
        }
LABEL_17:
      }
LABEL_18:
      v16 = (void *)MEMORY[0x22A6667F0](v7);
      goto LABEL_19;
    }
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) >= 0xFBu && (objc_opt_isKindOfClass() & 1) != 0)
  {
    double v8 = *(double *)(a1 + 120);
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v8 - v9 > 432000.0)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8);
      if (!*(unsigned char *)(v10 + 24))
      {
        *(unsigned char *)(v10 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
        uint64_t v11 = hv_default_log_handle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          int v26 = 138543362;
          uint64_t v27 = v12;
          uint64_t v13 = "HVQueue<%{public}@>: deleteContentWithRequest: deleting old Messages event to mitigate 139207993!";
LABEL_16:
          _os_log_impl(&dword_226C41000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v26, 0xCu);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  uint64_t v14 = (void *)MEMORY[0x22A6667F0]();
  char v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  v16 = (void *)MEMORY[0x22A6667F0]();
  if (v15)
  {
LABEL_19:
    id v23 = *(void **)(a1 + 40);
    id v24 = -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 48), v5);
    [v23 addObject:v24];

    goto LABEL_20;
  }
  unsigned int v17 = -[HVQueue _bundleIdForEvent:](*(__CFString **)(a1 + 48), v5);
  uint64_t v18 = [v5 domainId];
  uint64_t v19 = [v5 uniqueId];
  +[HVSpotlightDeletionRequest addDeletableContentWithBundleIdentifier:v17 domainIdentifier:v18 uniqueIdentifier:v19 toBloomFilter:*(void *)(a1 + 56)];

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  uint64_t v20 = 0;
LABEL_21:

  return v20;
}

- (unsigned)_identifierForContent:(unsigned __int8 *)a1
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    int v5 = a1[24];
    id v6 = [v3 uniqueId];
    if (v5)
    {
      uint64_t v7 = [v4 bundleId];
      -[HVQueue _identifierForContentWithUniqueIdentifier:bundleId:]((uint64_t)a1, v6, v7);
      a1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HVQueue _identifierForContentWithUniqueIdentifier:bundleId:]((uint64_t)a1, v6, 0);
      a1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    }
  }

  return a1;
}

- (__CFString)_bundleIdForEvent:(__CFString *)a1
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    if (LOBYTE(a1->length))
    {
      a1 = [v3 bundleId];
    }
    else
    {
      a1 = &stru_26DAC8728;
    }
  }

  return a1;
}

- (id)_identifierForContentWithUniqueIdentifier:(void *)a3 bundleId:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 24))
    {
      double v8 = (void *)MEMORY[0x22A6667F0]();
      if (!v7)
      {
        char v15 = [MEMORY[0x263F08690] currentHandler];
        [v15 handleFailureInMethod:sel__identifierForContentWithUniqueIdentifier_bundleId_, a1, @"HVQueue.m", 619, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
      }
      self;
      if (_bundleIdAllowedCharacterSet__pasOnceToken30 != -1) {
        dispatch_once(&_bundleIdAllowedCharacterSet__pasOnceToken30, &__block_literal_global_205);
      }
      id v9 = (id)_bundleIdAllowedCharacterSet__pasExprOnceResult;
      uint64_t v10 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v9];

      if (!v5)
      {
        id v5 = (id)[[NSString alloc] initWithFormat:@"%@", 0];
        uint64_t v11 = hv_default_log_handle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v18 = v14;
          __int16 v19 = 2112;
          uint64_t v20 = v10;
          _os_log_fault_impl(&dword_226C41000, v11, OS_LOG_TYPE_FAULT, "HVQueue<%@>: _identifierForContentWithUniqueIdentifier called with nil uniqueId for bundleId %@", buf, 0x16u);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
          abort();
        }
      }
      v16[0] = v10;
      v16[1] = v5;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
      a1 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @":");
    }
    else
    {
      id v5 = v5;
      uint64_t v10 = v7;
      a1 = (uint64_t)v5;
    }
  }
  else
  {
    uint64_t v10 = v6;
  }

  return (id)a1;
}

void __39__HVQueue__bundleIdAllowedCharacterSet__block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  v1 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"%:"];
  uint64_t v2 = [v1 invertedSet];
  id v3 = (void *)_bundleIdAllowedCharacterSet__pasExprOnceResult;
  _bundleIdAllowedCharacterSet__pasExprOnceResult = v2;
}

void __55__HVQueue__updateMemoryQueueTransactionExtendingTimer___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  id v3 = [v19 diskStorage];

  if (v3)
  {
    unint64_t v4 = [v19 memoryStorage];
    if ([v4 count])
    {

      id v5 = v19;
    }
    else
    {
      v16 = [v19 memoryStorageTransaction];

      id v5 = v19;
      if (v16)
      {
        [v19 setDiskStorageSource:0];
        [v19 setMemoryStorageTransaction:0];
        unsigned int v17 = [v19 memoryStorageSigtermSource];
        dispatch_suspend(v17);

        uint64_t v18 = [v19 memoryStorageIdleSource];
        dispatch_suspend(v18);

        goto LABEL_11;
      }
    }
    id v6 = [v5 memoryStorage];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        double v8 = [v19 memoryStorageIdleSource];
        dispatch_time_t v9 = dispatch_time(0, 60000000000);
        dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
      }
      uint64_t v10 = [v19 memoryStorageTransaction];

      if (!v10)
      {
        uint64_t v11 = (void *)MEMORY[0x22A6667F0]();
        id v12 = [@"HVQueue-Memory-" stringByAppendingString:*(void *)(*(void *)(a1 + 32) + 32)];
        [v12 UTF8String];
        uint64_t v13 = (void *)os_transaction_create();
        [v19 setMemoryStorageTransaction:v13];

        uint64_t v14 = [v19 memoryStorageSigtermSource];
        dispatch_resume(v14);

        char v15 = [v19 memoryStorageIdleSource];
        dispatch_resume(v15);
      }
    }
  }
LABEL_11:
}

uint64_t __50__HVQueue_ensureDeletionScanHasOccurredWithError___block_invoke_2()
{
  return 0;
}

uint64_t __42__HVQueue__filterBlockForDeletionRequest___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[HVQueue _filterBlockForBundleIdentifier:contentIdentifierSet:domainSelection:](*(unsigned char **)(a1 + 32), a2, 0, 0);

  return MEMORY[0x270F9A758]();
}

void __42__HVQueue__filterBlockForDeletionRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__HVQueue__filterBlockForDeletionRequest___block_invoke_4;
  v11[3] = &unk_2647D5458;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(a3, "_pas_mappedSetWithTransform:", v11);
  uint64_t v8 = -[HVQueue _filterBlockForBundleIdentifier:contentIdentifierSet:domainSelection:](*(unsigned char **)(a1 + 32), v6, v7, 0);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

id __42__HVQueue__filterBlockForDeletionRequest___block_invoke_4(uint64_t a1, void *a2)
{
  return -[HVQueue _identifierForContentWithUniqueIdentifier:bundleId:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 bundleId];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = hv_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_fault_impl(&dword_226C41000, v6, OS_LOG_TYPE_FAULT, "HVQueue<%@>: deletion for bundle %@ encountered event which does not respond to bundleId", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    unint64_t v4 = hv_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 32);
      int v19 = 138412290;
      uint64_t v20 = v7;
      uint64_t v8 = "HVQueue<%@>: deleting null event";
      uint64_t v9 = v4;
      uint32_t v10 = 12;
LABEL_11:
      _os_log_fault_impl(&dword_226C41000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v19, v10);
    }
LABEL_16:
    uint64_t v6 = 1;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    unint64_t v4 = hv_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 32);
      uint64_t v13 = *(void *)(a1 + 48);
      int v19 = 138412802;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      uint64_t v8 = "HVQueue<%@>: deletion for bundle %@ domain %@ encountered event which does not respond to bundleId";
      uint64_t v9 = v4;
      uint32_t v10 = 32;
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  unint64_t v4 = [v3 bundleId];
  if (![v4 isEqualToString:*(void *)(a1 + 40)])
  {
    uint64_t v6 = 0;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v14 = hv_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 32);
      uint64_t v18 = *(void *)(a1 + 48);
      int v19 = 138412802;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_fault_impl(&dword_226C41000, v14, OS_LOG_TYPE_FAULT, "HVQueue<%@>: deletion for bundle %@ domain %@ encountered event which does not respond to domainId", (uint8_t *)&v19, 0x20u);
    }

    goto LABEL_16;
  }
  uint64_t v5 = [v3 domainId];
  if (v5) {
    uint64_t v6 = [*(id *)(a1 + 48) containsDomain:v5];
  }
  else {
    uint64_t v6 = 0;
  }

LABEL_17:
  return v6;
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_264(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v6 = hv_default_log_handle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      uint64_t v5 = 1;
      goto LABEL_11;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 32);
    int v15 = 138412290;
    uint64_t v16 = v7;
    uint64_t v8 = "HVQueue<%@>: deleting null event";
    uint64_t v9 = v6;
    uint32_t v10 = 12;
LABEL_13:
    _os_log_fault_impl(&dword_226C41000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v15, v10);
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v6 = hv_default_log_handle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    int v15 = 138412802;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    uint64_t v8 = "HVQueue<%@>: deletion for bundle %@ domain %@ encountered event which does not respond to domainId";
    uint64_t v9 = v6;
    uint32_t v10 = 32;
    goto LABEL_13;
  }
  unint64_t v4 = [v3 domainId];
  if (v4) {
    uint64_t v5 = [*(id *)(a1 + 48) containsDomain:v4];
  }
  else {
    uint64_t v5 = 0;
  }

LABEL_11:
  return v5;
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_265(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v5 = hv_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 32);
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_fault_impl(&dword_226C41000, v5, OS_LOG_TYPE_FAULT, "HVQueue<%@>: deleting null event", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v4 = -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), v3);
  if (!v4)
  {
    uint64_t v8 = hv_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 32);
      int v11 = 138412547;
      uint64_t v12 = v10;
      __int16 v13 = 2117;
      id v14 = v3;
      _os_log_fault_impl(&dword_226C41000, v8, OS_LOG_TYPE_FAULT, "HVQueue<%@>: unable to generate content identifier for event, will delete to be safe: %{sensitive}@", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v5 = 0;
LABEL_9:
    uint64_t v6 = 1;
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 40) containsObject:v4];
LABEL_10:

  return v6;
}

uint64_t __80__HVQueue__filterBlockForBundleIdentifier_contentIdentifierSet_domainSelection___block_invoke_259()
{
  return 1;
}

- (BOOL)dequeuedContentNotConsumed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__HVQueue_dequeuedContentNotConsumed_error___block_invoke;
  v9[3] = &unk_2647D52F8;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  [(_PASLock *)lock runWithLockAcquired:v9];

  return 1;
}

void __44__HVQueue_dequeuedContentNotConsumed_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = -[HVQueue _identifierForContent:](v3, v4);
  id v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 32) identifier];
    int v10 = 138412546;
    int v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v6;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeuedContentNotConsumed: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = [v5 dequeuedContentIdentifiers];

  [v9 removeObject:v6];
}

- (BOOL)dequeuedContentConsumedWithError:(id *)a3
{
  lock = self->_lock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HVQueue_dequeuedContentConsumedWithError___block_invoke;
  v6[3] = &unk_2647D52D0;
  v6[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v6];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_contentConsumedSemaphore);
  return 1;
}

void __44__HVQueue_dequeuedContentConsumedWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = hv_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 32);
    uint64_t v6 = [v3 dequeuedContentIdentifiers];
    uint64_t v7 = [v6 count];
    uint64_t v8 = [v3 dequeuedContentIdentifiers];
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v5;
    __int16 v67 = 2048;
    uint64_t v68 = v7;
    __int16 v69 = 2112;
    uint64_t v70 = v8;
    _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeuedContentConsumedWithError count:%tu, content:%@", buf, 0x20u);
  }
  uint64_t v9 = [v3 dequeuedContentIdentifiers];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    int v11 = [v3 diskContentBloomFilter];

    if (v11)
    {
      __int16 v12 = *(unsigned char **)(a1 + 32);
      id v13 = [v3 dequeuedContentIdentifiers];
      if (v12)
      {
        if (v12[24])
        {
          v51 = v12;
          uint64_t v49 = a1;
          id v50 = v3;
          context = (void *)MEMORY[0x22A6667F0]();
          v52 = objc_opt_new();
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v48 = v13;
          obuint64_t j = v13;
          uint64_t v14 = [obj countByEnumeratingWithState:&v58 objects:buf count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v59;
            __int16 v17 = @":";
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v59 != v16) {
                  objc_enumerationMutation(obj);
                }
                __int16 v19 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                uint64_t v20 = (void *)MEMORY[0x22A6667F0]();
                uint64_t v21 = [v19 rangeOfString:v17 options:2];
                if (v21 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  __int16 v23 = hv_default_log_handle();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
                  {
                    uint64_t v33 = *((void *)v51 + 4);
                    *(_DWORD *)id v63 = 138412547;
                    *(void *)&v63[4] = v33;
                    *(_WORD *)&v63[12] = 2113;
                    *(void *)&v63[14] = v19;
                    _os_log_fault_impl(&dword_226C41000, v23, OS_LOG_TYPE_FAULT, "HVQueue<%@>: _spotlightDeletionRequestsForContentIdentifiers found a contentIdentifier missing a colon even though _contentExpectedFromMultipleApps=YES: %{private}@", v63, 0x16u);
                  }

                  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
                    abort();
                  }
                }
                else
                {
                  uint64_t v24 = v21;
                  uint64_t v25 = v22;
                  int v26 = v17;
                  uint64_t v27 = [v19 substringToIndex:v21];
                  uint64_t v28 = [v27 stringByRemovingPercentEncoding];

                  if (!v28)
                  {
                    id v34 = [MEMORY[0x263F08690] currentHandler];
                    [v34 handleFailureInMethod:sel__spotlightDeletionRequestsForContentIdentifiers_, v51, @"HVQueue.m", 848, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
                  }
                  uint64_t v29 = [v19 substringFromIndex:v24 + v25];
                  v30 = [v52 objectForKeyedSubscript:v28];
                  id v31 = v30;
                  if (v30)
                  {
                    id v32 = v30;
                  }
                  else
                  {
                    id v32 = (id)objc_opt_new();
                    [v52 setObject:v32 forKeyedSubscript:v28];
                  }
                  __int16 v17 = v26;

                  [v32 addObject:v29];
                }
              }
              uint64_t v15 = [obj countByEnumeratingWithState:&v58 objects:buf count:16];
            }
            while (v15);
          }

          id v35 = [v52 allKeys];
          *(void *)id v63 = MEMORY[0x263EF8330];
          *(void *)&v63[8] = 3221225472;
          *(void *)&v63[16] = __59__HVQueue__spotlightDeletionRequestsForContentIdentifiers___block_invoke;
          uint64_t v64 = &unk_2647D53E0;
          id v65 = v52;
          id v36 = v52;
          objc_msgSend(v35, "_pas_mappedArrayWithTransform:", v63);
          __int16 v12 = (unsigned char *)objc_claimAutoreleasedReturnValue();

          a1 = v49;
          id v3 = v50;
          id v13 = v48;
        }
        else
        {
          v38 = [[HVSpotlightDeletionRequest alloc] initWithBundleIdentifier:&stru_26DAC8728 uniqueIdentifiers:v13];
          *(void *)long long buf = v38;
          __int16 v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
        }
      }

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v39 = v12;
      uint64_t v37 = [v39 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v37)
      {
        uint64_t v40 = *(void *)v55;
        while (2)
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v55 != v40) {
              objc_enumerationMutation(v39);
            }
            int v42 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            unint64_t v43 = [v3 diskContentBloomFilter];
            LOBYTE(v42) = [v42 matchesBloomFilter:v43];

            if (v42)
            {
              LODWORD(v37) = 1;
              goto LABEL_38;
            }
          }
          uint64_t v37 = [v39 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v37) {
            continue;
          }
          break;
        }
      }
LABEL_38:
    }
    else
    {
      LODWORD(v37) = 1;
    }
    v44 = *(unsigned char **)(a1 + 32);
    id v45 = [v3 dequeuedContentIdentifiers];
    if (v44)
    {
      -[HVQueue _filterBlockForBundleIdentifier:contentIdentifierSet:domainSelection:](v44, 0, v45, 0);
      v44 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    }

    -[HVQueue _deleteWithFilter:memory:disk:](*(void *)(a1 + 32), v44, 1, v37);
    id v46 = [v3 dequeuedContentIdentifiers];
    [v46 removeAllObjects];
  }
}

HVSpotlightDeletionRequest *__59__HVQueue__spotlightDeletionRequestsForContentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [HVSpotlightDeletionRequest alloc];
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v6 = [(HVSpotlightDeletionRequest *)v4 initWithBundleIdentifier:v3 uniqueIdentifiers:v5];

  return v6;
}

- (BOOL)dequeueContent:(id *)a3 dataSourceContentState:(id)a4 minimumLevelOfService:(unsigned __int8)a5 inMemoryItemsOnly:(BOOL)a6 error:(id *)a7
{
  id v13 = a4;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1010;
  id v31 = __Block_byref_object_dispose__1011;
  id v32 = 0;
  lock = self->_lock;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke;
  v19[3] = &unk_2647D52A8;
  v19[4] = self;
  id v15 = v13;
  unsigned __int8 v25 = a5;
  id v20 = v15;
  uint64_t v21 = &v33;
  BOOL v26 = a6;
  __int16 v23 = a3;
  SEL v24 = a2;
  uint64_t v22 = &v27;
  [(_PASLock *)lock runWithLockAcquired:v19];
  int v16 = *((unsigned __int8 *)v34 + 24);
  if (a7 && !*((unsigned char *)v34 + 24))
  {
    *a7 = (id) v28[5];
    int v16 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v17 = v16 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 memoryStorage];
  uint64_t v5 = [v4 count];

  if (!v5) {
    goto LABEL_22;
  }
  uint64_t v6 = hv_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v60 = v7;
    _os_log_impl(&dword_226C41000, v6, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: reading from memory", buf, 0xCu);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v8 = [v3 memoryStorage];
  uint64_t v9 = [v8 reverseObjectEnumerator];

  obuint64_t j = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v56;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v56 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v15 = (void *)MEMORY[0x22A6667F0]();
        int v16 = -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), v14);
        BOOL v17 = [v3 dequeuedContentIdentifiers];
        char v18 = [v17 containsObject:v16];

        if ((v18 & 1) == 0)
        {
          context = v15;
          uint64_t v19 = v11;
          uint64_t v20 = v12;
          uint64_t v21 = [*(id *)(a1 + 40) deferredContentStates];
          uint64_t v22 = HVDataSourceContentStateKey([*(id *)(a1 + 40) dataSource], v14);
          __int16 v23 = [v21 objectForKeyedSubscript:v22];

          if (!v23 || (unsigned int v24 = *(unsigned __int8 *)(a1 + 80), v24 < [v23 levelOfService]))
          {
            objc_storeStrong(*(id **)(a1 + 64), v14);
            unsigned __int8 v25 = [v3 dequeuedContentIdentifiers];
            [v25 addObject:v16];

            goto LABEL_17;
          }

          uint64_t v12 = v20;
          uint64_t v11 = v19;
          id v15 = context;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if (**(void **)(a1 + 64))
  {
    BOOL v26 = (void *)MEMORY[0x22A6667F0]();
    uint64_t v27 = hv_default_log_handle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      uint64_t v29 = *(void *)(v28 + 32);
      v30 = -[HVQueue _identifierForContent:]((unsigned __int8 *)v28, **(void ***)(a1 + 64));
      uint64_t v31 = **(void **)(a1 + 64);
      *(_DWORD *)long long buf = 138412803;
      uint64_t v60 = v29;
      __int16 v61 = 2112;
      id v62 = v30;
      __int16 v63 = 2117;
      uint64_t v64 = v31;
      _os_log_impl(&dword_226C41000, v27, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: read %@ from memory: %{sensitive}@", buf, 0x20u);
    }
    objc_msgSend(v3, "setDequeuedCount:", objc_msgSend(v3, "dequeuedCount") + 1);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  else
  {
LABEL_22:
    if (!*(unsigned char *)(a1 + 81) && ([v3 diskStorageIsKnownToBeEmpty] & 1) == 0)
    {
      id v32 = (void *)MEMORY[0x22A6667F0]();
      uint64_t v33 = [v3 bookmark];
      int v34 = [v33 los];
      int v35 = *(unsigned __int8 *)(a1 + 80);

      if (v34 != v35)
      {
        char v36 = [v3 bookmark];
        [v36 reset];

        uint64_t v37 = *(unsigned __int8 *)(a1 + 80);
        v38 = [v3 bookmark];
        [v38 setLos:v37];
      }
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_190;
      v49[3] = &unk_2647D5280;
      long long v53 = *(_OWORD *)(a1 + 64);
      v49[4] = *(void *)(a1 + 32);
      id v39 = v3;
      id v50 = v39;
      id v51 = *(id *)(a1 + 40);
      char v54 = *(unsigned char *)(a1 + 80);
      int8x16_t v52 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
      uint64_t v40 = (void (**)(void, void))MEMORY[0x22A6669E0](v49);
      v40[2](v40, 1);
      if (!**(void **)(a1 + 64)) {
        v40[2](v40, 0);
      }

      v41 = **(void ***)(a1 + 64);
      if (v41)
      {
        int v42 = -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), v41);
        unint64_t v43 = hv_default_log_handle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v44 = *(void *)(*(void *)(a1 + 32) + 32);
          uint64_t v45 = **(void **)(a1 + 64);
          *(_DWORD *)long long buf = 138412803;
          uint64_t v60 = v44;
          __int16 v61 = 2112;
          id v62 = v42;
          __int16 v63 = 2117;
          uint64_t v64 = v45;
          _os_log_impl(&dword_226C41000, v43, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: read %@ from disk: %{sensitive}@", buf, 0x20u);
        }

        id v46 = [v39 dequeuedContentIdentifiers];
        [v46 addObject:v42];

        objc_msgSend(v39, "setDequeuedCount:", objc_msgSend(v39, "dequeuedCount") + 1);
        objc_msgSend(v39, "setDiskStorageEventCount:", objc_msgSend(v39, "diskStorageEventCount")- (objc_msgSend(v39, "diskStorageEventCount") != 0));
      }
    }
  }
}

void __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_190(uint64_t a1, int a2)
{
  if (**(void **)(a1 + 72))
  {
    __int16 v23 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v24 = *(void *)(a1 + 32);
    if (a2) {
      unsigned __int8 v25 = @"YES";
    }
    else {
      unsigned __int8 v25 = @"NO";
    }
    uint64_t v26 = *(void *)(a1 + 80);
    uint64_t v27 = -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), **(void ***)(a1 + 72));
    [v23 handleFailureInMethod:v26, v24, @"HVQueue.m", 451, @"enumerateBiome(%@) called even though *content is nonnil (%@)", v25, v27 object file lineNumber description];
  }
  uint64_t v4 = [*(id *)(a1 + 40) bookmark];
  uint64_t v5 = v4;
  if (a2)
  {
    uint64_t v6 = [v4 futureCutoff];

    if (!v6) {
      return;
    }
    uint64_t v7 = [*(id *)(a1 + 40) bookmark];
    uint64_t v8 = [v7 futureBookmark];

    uint64_t v5 = [*(id *)(a1 + 40) bookmark];
    uint64_t v9 = [v5 futureCutoff];
  }
  else
  {
    uint64_t v8 = [v4 pastBookmark];
    uint64_t v9 = 0;
  }

  uint64_t v10 = [*(id *)(a1 + 40) diskStorage];
  uint64_t v11 = [v10 publisherWithStartTime:0 endTime:v9 maxEvents:0 reversed:1];

  uint64_t v42 = 0;
  unint64_t v43 = (double *)&v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_2;
  v36[3] = &unk_2647D5208;
  uint64_t v40 = &v42;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v37 = v12;
  uint64_t v38 = v13;
  id v39 = *(id *)(a1 + 48);
  char v41 = *(unsigned char *)(a1 + 88);
  uint64_t v14 = [v11 filterWithIsIncluded:v36];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_3;
  void v31[3] = &unk_2647D5230;
  char v35 = a2;
  id v15 = *(void **)(a1 + 40);
  v31[4] = *(void *)(a1 + 32);
  id v16 = v15;
  uint64_t v17 = *(void *)(a1 + 56);
  id v32 = v16;
  uint64_t v33 = v17;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_202;
  v28[3] = &unk_2647D5258;
  v28[4] = *(void *)(a1 + 32);
  char v30 = a2;
  long long v18 = *(_OWORD *)(a1 + 64);
  uint64_t v34 = *(void *)(a1 + 64);
  long long v29 = v18;
  id v19 = (id)[v14 drivableSinkWithBookmark:v8 completion:v31 shouldContinue:v28];

  if (a2)
  {
    if (**(void **)(a1 + 72) || v43[3] == 0.0) {
      goto LABEL_14;
    }
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithDouble:");
    uint64_t v21 = [*(id *)(a1 + 40) bookmark];
    [v21 setFutureCutoff:v20];
    goto LABEL_13;
  }
  uint64_t v20 = [*(id *)(a1 + 40) bookmark];
  uint64_t v21 = [v20 futureCutoff];
  if (v21)
  {
LABEL_13:

    goto LABEL_14;
  }
  double v22 = v43[3];

  if (v22 != 0.0)
  {
    uint64_t v20 = [NSNumber numberWithDouble:v43[3]];
    uint64_t v21 = [*(id *)(a1 + 40) bookmark];
    [v21 setFutureCutoff:v20];
    goto LABEL_13;
  }
LABEL_14:

  _Block_object_dispose(&v42, 8);
}

BOOL __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x22A6667F0]();
  double v5 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  [v3 timestamp];
  if (v5 >= v6) {
    double v6 = v5;
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v6;
  uint64_t v7 = [v3 eventBody];
  if (v7
    && ([*(id *)(a1 + 32) dequeuedContentIdentifiers],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 40), v7),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 containsObject:v9],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    id v12 = [*(id *)(a1 + 48) deferredContentStates];
    uint64_t v13 = HVDataSourceContentStateKey([*(id *)(a1 + 48) dataSource], v7);
    uint64_t v14 = [v12 objectForKeyedSubscript:v13];

    BOOL v11 = 1;
    if (v14)
    {
      unsigned int v15 = *(unsigned __int8 *)(a1 + 64);
      if (v15 >= [v14 levelOfService]) {
        BOOL v11 = 0;
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 state])
  {
    uint64_t v7 = hv_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 64)) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
      char v10 = [v5 error];
      int v17 = 138412802;
      long long v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      double v22 = v10;
      _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: drivableSinkWithBookmark frontfill: %@ error: %@", (uint8_t *)&v17, 0x20u);
    }
    int v11 = *(unsigned __int8 *)(a1 + 64);
    id v12 = [*(id *)(a1 + 40) bookmark];
    uint64_t v13 = v12;
    if (v11) {
      [v12 setFutureBookmark:v6];
    }
    else {
      [v12 setPastBookmark:v6];
    }

    uint64_t v14 = [v5 error];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
}

uint64_t __95__HVQueue_dequeueContent_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke_202(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = hv_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 32);
    id v6 = @"YES";
    if (!*(unsigned char *)(a1 + 56)) {
      id v6 = @"NO";
    }
    int v11 = 138412546;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: dequeueContent: reading from disk (frontfill: %@)", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v7 = [v3 eventBody];

  uint64_t v8 = *(void ***)(a1 + 48);
  uint64_t v9 = *v8;
  *uint64_t v8 = (void *)v7;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return 0;
}

- (BOOL)enqueueContent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__HVQueue_enqueueContent_error___block_invoke;
  v9[3] = &unk_2647D51B8;
  v9[4] = self;
  id v7 = v5;
  id v10 = v7;
  int v11 = &v12;
  [(_PASLock *)lock runWithLockAcquired:v9];
  LOBYTE(lock) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)lock;
}

void __32__HVQueue_enqueueContent_error___block_invoke(uint64_t a1, void *a2)
{
  v53[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x22A6667F0]();
  id v5 = -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), *(void **)(a1 + 40));
  id v6 = (void *)MEMORY[0x22A6667F0]();
  id v7 = [v3 dequeuedContentIdentifiers];
  [v7 removeObject:v5];

  uint64_t v8 = [v3 memoryStorage];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __32__HVQueue_enqueueContent_error___block_invoke_2;
  v42[3] = &unk_2647D5190;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 32);
  id v43 = v9;
  uint64_t v44 = v10;
  id v11 = v3;
  id v45 = v11;
  [v8 enumerateObjectsUsingBlock:v42];

  if (![v11 isMemoryStorageFull]
    || [v11 memoryStorageLimit]
    && ([v11 diskStorage], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    if ([v11 isMemoryStorageFull])
    {
      __int16 v13 = [v11 memoryStorage];
      uint64_t v14 = [v13 firstObject];

      char v15 = hv_default_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 32);
        if (v14)
        {
          int v17 = (void *)MEMORY[0x22A6667F0]();
          long long v18 = -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), v14);
        }
        else
        {
          long long v18 = 0;
        }
        *(_DWORD *)long long buf = 138412802;
        uint64_t v49 = v16;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v9;
        __int16 v52 = 2112;
        v53[0] = v18;
        _os_log_impl(&dword_226C41000, v15, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: writing %@ to memory (and flushing oldest in-memory item %@ to disk to make room)", buf, 0x20u);
        if (v14) {
      }
        }
      if (v14)
      {
        uint64_t v24 = (void *)MEMORY[0x22A6667F0]();
        unsigned __int8 v25 = *(__CFString **)(a1 + 32);
        uint64_t v47 = v14;
        uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
        -[HVQueue _writeEventsToDisk:guardedData:](v25, v26, v11);

        uint64_t v27 = [v11 memoryStorage];
        [v27 removeObjectAtIndex:0];
      }
      else
      {
        uint64_t v31 = hv_default_log_handle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        {
          uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 32);
          uint64_t v38 = [v11 memoryStorage];
          uint64_t v39 = [v38 count];
          int v40 = [v11 memoryStorageLimit];
          char v41 = [v11 memoryStorage];
          *(_DWORD *)long long buf = 138413059;
          uint64_t v49 = v37;
          __int16 v50 = 2048;
          uint64_t v51 = v39;
          __int16 v52 = 1024;
          LODWORD(v53[0]) = v40;
          WORD2(v53[0]) = 2113;
          *(void *)((char *)v53 + 6) = v41;
          _os_log_fault_impl(&dword_226C41000, v31, OS_LOG_TYPE_FAULT, "HVQueue<%@>: enqueueContent: isMemoryStorageFull==YES but memoryStorage.firstObject was nil (memoryStorage.count=%tu, memoryStorageLimit=%d, memoryStorage=%{private}@)", buf, 0x26u);
        }
        if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
          abort();
        }
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = hv_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 32);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v49 = v19;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v9;
        _os_log_impl(&dword_226C41000, v14, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: writing %@ to memory", buf, 0x16u);
      }
    }

    uint64_t v28 = hv_default_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void *)(a1 + 40);
      uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)long long buf = 138412803;
      uint64_t v49 = v30;
      __int16 v50 = 2112;
      uint64_t v51 = (uint64_t)v9;
      __int16 v52 = 2117;
      v53[0] = v29;
      _os_log_impl(&dword_226C41000, v28, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: %@ %{sensitive}@", buf, 0x20u);
    }

    uint64_t v20 = [v11 memoryStorage];
    [v20 addObject:*(void *)(a1 + 40)];
    char v23 = 1;
  }
  else if ([v11 memoryStorageLimit] {
         || ([v11 diskStorage], id v32 = objc_claimAutoreleasedReturnValue(),
  }
                                               v32,
                                               !v32))
  {
    uint64_t v20 = hv_default_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)long long buf = 138412803;
      uint64_t v49 = v22;
      __int16 v50 = 2112;
      uint64_t v51 = (uint64_t)v9;
      __int16 v52 = 2117;
      v53[0] = v21;
      _os_log_impl(&dword_226C41000, v20, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: memory storage full, no disk fallback -- dropping item %@! %{sensitive}@", buf, 0x20u);
    }
    char v23 = 0;
  }
  else
  {
    uint64_t v33 = hv_default_log_handle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = *(void *)(a1 + 40);
      uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)long long buf = 138412803;
      uint64_t v49 = v35;
      __int16 v50 = 2112;
      uint64_t v51 = (uint64_t)v9;
      __int16 v52 = 2117;
      v53[0] = v34;
      _os_log_impl(&dword_226C41000, v33, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: memory storage capacity is zero, immediately falling back to disk for newly enqueued item %@! %{sensitive}@", buf, 0x20u);
    }

    char v36 = *(__CFString **)(a1 + 32);
    uint64_t v46 = *(void *)(a1 + 40);
    char v23 = 1;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
    -[HVQueue _writeEventsToDisk:guardedData:](v36, v20, v11);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v23;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    objc_msgSend(v11, "setEnqueuedCount:", objc_msgSend(v11, "enqueuedCount") + 1);
  }
  -[HVQueue _updateMemoryQueueTransactionExtendingTimer:](*(void *)(a1 + 32), 1);
}

void __32__HVQueue_enqueueContent_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v10 = -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 40), v7);
  LODWORD(v8) = [v8 isEqual:v10];

  if (v8)
  {
    id v11 = hv_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 32);
      int v15 = 138412802;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = a3;
      _os_log_impl(&dword_226C41000, v11, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: enqueueContent: %@ is already in memory queue at position %tu, existing item will be removed for updated item sharing identical identifier", (uint8_t *)&v15, 0x20u);
    }

    uint64_t v14 = [*(id *)(a1 + 48) memoryStorage];
    [v14 removeObjectAtIndex:a3];

    *a4 = 1;
  }
}

- (void)_writeEventsToDisk:(void *)a3 guardedData:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v28 = a1;
  if (a1)
  {
    id v7 = (void *)MEMORY[0x22A6667F0]();
    if ([v5 count])
    {
      unsigned __int8 v25 = v7;
      uint64_t v8 = hv_default_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        isa = v28[1].isa;
        uint64_t v10 = [v5 count];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __42__HVQueue__writeEventsToDisk_guardedData___block_invoke;
        v33[3] = &unk_2647D51E0;
        v33[4] = v28;
        id v11 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v33);
        *(_DWORD *)long long buf = 138412802;
        char v36 = isa;
        __int16 v37 = 2048;
        uint64_t v38 = v10;
        __int16 v39 = 2112;
        int v40 = v11;
        _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: _writeEventsToDisk will write %tu items to disk: %@", buf, 0x20u);
      }
      if (v6) {
        [v6[12] setFutureBookmark:0];
      }
      [v6 setDiskStorageIsKnownToBeEmpty:0];
      objc_msgSend(v6, "setDiskStorageEventCount:", objc_msgSend(v6, "diskStorageEventCount") + objc_msgSend(v5, "count"));
      uint64_t v12 = [v6 diskContentBloomFilter];
      uint64_t v13 = [v6 diskStorageSource];
      if (!v13)
      {
        uint64_t v14 = [v6 diskStorage];
        uint64_t v13 = [v14 source];

        [v6 setDiskStorageSource:v13];
        if (!v13)
        {
          uint64_t v24 = [MEMORY[0x263F08690] currentHandler];
          [v24 handleFailureInMethod:sel__writeEventsToDisk_guardedData_, v28, @"HVQueue.m", 380, @"Invalid parameter not satisfying: %@", @"diskStorageSource" object file lineNumber description];

          uint64_t v13 = 0;
        }
      }
      id v26 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      obuint64_t j = v5;
      uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(obj);
            }
            __int16 v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v20 = (void *)MEMORY[0x22A6667F0]();
            [v13 sendEvent:v19];
            if (v12)
            {
              uint64_t v21 = -[HVQueue _bundleIdForEvent:](v28, v19);
              uint64_t v22 = [v19 domainId];
              char v23 = [v19 uniqueId];
              +[HVSpotlightDeletionRequest addDeletableContentWithBundleIdentifier:v21 domainIdentifier:v22 uniqueIdentifier:v23 toBloomFilter:v12];
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v16);
      }

      id v5 = v26;
      id v7 = v25;
    }
  }
}

unsigned __int8 *__42__HVQueue__writeEventsToDisk_guardedData___block_invoke(uint64_t a1, void *a2)
{
  return -[HVQueue _identifierForContent:](*(unsigned __int8 **)(a1 + 32), a2);
}

- (id)description
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1010;
  uint64_t v10 = __Block_byref_object_dispose__1011;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22__HVQueue_description__block_invoke;
  v5[3] = &unk_2647D5118;
  v5[4] = self;
  void v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __22__HVQueue_description__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
  id v15 = [v4 memoryStorage];
  uint64_t v7 = [v15 count];
  int v8 = [v4 memoryStorageLimit];
  unsigned int v9 = [v4 isMemoryStorageFull];
  uint64_t v10 = [v4 diskStorage];
  id v11 = [v4 dequeuedContentIdentifiers];

  uint64_t v12 = [v5 initWithFormat:@"<HVQueue i:%@ m.count:%tu m.limit:%hi m.full:%d d:%@ dc.count:%tu>", v6, v7, v8, v9, v10, objc_msgSend(v11, "count")];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (HVQueue)initWithIdentifier:(id)a3 biomeStream:(id)a4 memoryLimit:(signed __int16)a5 contentProtection:(id)a6 contentExpectedFromMultipleApps:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v29.receiver = self;
  v29.super_class = (Class)HVQueue;
  uint64_t v16 = [(HVQueue *)&v29 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    if (v14)
    {
      id location = 0;
      objc_initWeak(&location, v17);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __104__HVQueue_initWithIdentifier_biomeStream_memoryLimit_contentProtection_contentExpectedFromMultipleApps___block_invoke;
      v26[3] = &unk_2647D56C8;
      objc_copyWeak(&v27, &location);
      uint64_t v18 = (void *)MEMORY[0x22A6669E0](v26);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
      __int16 v19 = (void *)MEMORY[0x22A6669E0](v18);

      uint64_t v20 = -[HVQueueGuardedData initWithBiomeStream:memoryLimit:memoryStorageFlushCallback:]((char *)[HVQueueGuardedData alloc], v14, a5, v19);
    }
    else
    {
      uint64_t v20 = -[HVQueueGuardedData initWithBiomeStream:memoryLimit:memoryStorageFlushCallback:]((char *)[HVQueueGuardedData alloc], 0, a5, 0);
      __int16 v19 = 0;
    }
    uint64_t v21 = [objc_alloc(MEMORY[0x263F61E70]) initWithGuardedData:v20];
    lock = v17->_lock;
    v17->_lock = (_PASLock *)v21;

    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    contentConsumedSemaphore = v17->_contentConsumedSemaphore;
    v17->_contentConsumedSemaphore = (OS_dispatch_semaphore *)v23;

    objc_storeStrong((id *)&v17->_contentProtection, a6);
    v17->_contentExpectedFromMultipleApps = a7;
  }
  return v17;
}

uint64_t __104__HVQueue_initWithIdentifier_biomeStream_memoryLimit_contentProtection_contentExpectedFromMultipleApps___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[1];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __34__HVQueue__flushMemoryQueueToDisk__block_invoke;
    v5[3] = &unk_2647D5168;
    v5[4] = v2;
    void v5[5] = sel__flushMemoryQueueToDisk;
    [v3 runWithLockAcquired:v5];
  }

  return MEMORY[0x270F9A758]();
}

void __34__HVQueue__flushMemoryQueueToDisk__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 diskStorage];

  if (!v4)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"HVQueue.m", 283, @"Invalid parameter not satisfying: %@", @"guardedData.diskStorage != nil" object file lineNumber description];
  }
  id v5 = [v3 memoryStorage];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = hv_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 32);
      unsigned int v9 = [v3 memoryStorage];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = [v9 count];
      _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVQueue<%@>: Flushing memory queue to disk (%tu items)", buf, 0x16u);
    }
    uint64_t v10 = *(__CFString **)(a1 + 32);
    id v11 = [v3 memoryStorage];
    -[HVQueue _writeEventsToDisk:guardedData:](v10, v11, v3);

    uint64_t v12 = [v3 memoryStorage];
    [v12 removeAllObjects];

    -[HVQueue _updateMemoryQueueTransactionExtendingTimer:](*(void *)(a1 + 32), 0);
  }
}

- (id)uniqueIdentifiersInMemoryStorage
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned int v9 = __Block_byref_object_copy__1010;
  uint64_t v10 = __Block_byref_object_dispose__1011;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__HVQueue_TestHelpers__uniqueIdentifiersInMemoryStorage__block_invoke;
  v5[3] = &unk_2647D5540;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__HVQueue_TestHelpers__uniqueIdentifiersInMemoryStorage__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 memoryStorage];
  uint64_t v3 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_367);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __56__HVQueue_TestHelpers__uniqueIdentifiersInMemoryStorage__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uniqueId];
}

- (id)uniqueIdentifiersInDiskStorage
{
  uint64_t v3 = objc_opt_new();
  lock = self->_lock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HVQueue_TestHelpers__uniqueIdentifiersInDiskStorage__block_invoke;
  v7[3] = &unk_2647D52D0;
  id v5 = v3;
  id v8 = v5;
  [(_PASLock *)lock runWithLockAcquired:v7];

  return v5;
}

void __54__HVQueue_TestHelpers__uniqueIdentifiersInDiskStorage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 diskStorage];
  uint64_t v4 = [v3 publisherFromStartTime:0.0];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__HVQueue_TestHelpers__uniqueIdentifiersInDiskStorage__block_invoke_3;
  v6[3] = &unk_2647D5858;
  id v7 = *(id *)(a1 + 32);
  id v5 = (id)[v4 sinkWithCompletion:&__block_literal_global_363 receiveInput:v6];
}

void __54__HVQueue_TestHelpers__uniqueIdentifiersInDiskStorage__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [a2 eventBody];
  uint64_t v3 = [v4 uniqueId];
  [v2 addObject:v3];
}

- (unsigned)waitForDequeuedContentConsumedWithTimeout:(double)a3
{
  return [MEMORY[0x263F61E38] waitForSemaphore:self->_contentConsumedSemaphore timeoutSeconds:a3];
}

@end