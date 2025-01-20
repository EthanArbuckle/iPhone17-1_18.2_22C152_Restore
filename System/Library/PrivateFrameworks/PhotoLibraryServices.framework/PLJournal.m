@interface PLJournal
+ (BOOL)_finishFullSnapshotForBaseURL:(id)a3 snapshotSucceeded:(BOOL)a4 snapshotMode:(unsigned __int8)a5 journals:(id)a6 error:(id *)a7;
+ (BOOL)_performSnapshotsForBaseURL:(id)a3 snapshotMode:(unsigned __int8)a4 payloadClasses:(id)a5 snapshotJournalBlock:(id)a6 createOnlyIfNecessary:(BOOL)a7 error:(id *)a8;
+ (BOOL)appendSnapshotsForBaseURL:(id)a3 payloadClasses:(id)a4 snapshotJournalBlock:(id)a5 error:(id *)a6;
+ (BOOL)createSnapshotFinishMarkerForBaseURL:(id)a3 error:(id *)a4;
+ (BOOL)createSnapshotsForBaseURL:(id)a3 payloadClasses:(id)a4 snapshotJournalBlock:(id)a5 createOnlyIfNecessary:(BOOL)a6 error:(id *)a7;
+ (BOOL)recoverJournalsIfNecessaryForBaseURL:(id)a3 payloadClasses:(id)a4 error:(id *)a5;
+ (BOOL)removeSnapshotFinishMarkerForBaseURL:(id)a3 error:(id *)a4;
+ (BOOL)snapshotFinishMarkerExistsForBaseURL:(id)a3;
+ (id)journalURLForBaseURL:(id)a3 name:(id)a4 journalType:(id)a5;
+ (id)metadataURLForBaseURL:(id)a3 payloadClassId:(id)a4 pending:(BOOL)a5;
+ (id)snapshotFinishMarkerURLForBaseURL:(id)a3;
- (BOOL)_finishSnapshotWithMode:(unsigned __int8)a3 snapshotSuccess:(BOOL)a4 error:(id *)a5;
- (BOOL)_isPendingJournalAuthoritative;
- (BOOL)_performSnapshotWithMode:(unsigned __int8)a3 usingNextEntryBlock:(id)a4 createOnlyIfNecessary:(BOOL)a5 error:(id *)a6;
- (BOOL)_prepareForSnapshotWithMode:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)_recoverJournalWithError:(id *)a3;
- (BOOL)_removeMetadataPending:(BOOL)a3 error:(id *)a4;
- (BOOL)_replaceMetadataWithPendingMetadataError:(id *)a3;
- (BOOL)_updateMetadataWithMetadata:(id)a3 replace:(BOOL)a4 pending:(BOOL)a5 error:(id *)a6;
- (BOOL)appendChangeEntries:(id)a3 error:(id *)a4;
- (BOOL)appendChangeEntryAfterPrepare:(id)a3 error:(id *)a4;
- (BOOL)appendSnapshotUsingNextEntryBlock:(id)a3 error:(id *)a4;
- (BOOL)appendUpdatePayloadWithPayloadID:(id)a3 rawAttributes:(id)a4 error:(id *)a5;
- (BOOL)coalesceChangesToSnapshotWithError:(id *)a3;
- (BOOL)createSnapshotUsingNextPayloadBlock:(id)a3 createOnlyIfNecessary:(BOOL)a4 error:(id *)a5;
- (BOOL)enumerateEntriesUsingBlock:(id)a3 decodePayload:(BOOL)a4 error:(id *)a5;
- (BOOL)enumeratePayloadsUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)finishAppendChangeEntriesWithError:(id *)a3;
- (BOOL)finishCreateSnapshot:(BOOL)a3 error:(id *)a4;
- (BOOL)prepareForAppendChangeEntriesWithError:(id *)a3;
- (BOOL)prepareForCreateSnapshotWithError:(id *)a3;
- (BOOL)removeJournalFilesWithError:(id *)a3;
- (BOOL)snapshotJournalFileSize:(unint64_t *)a3 changeJournalFileSize:(unint64_t *)a4 error:(id *)a5;
- (Class)payloadClass;
- (NSDictionary)metadata;
- (NSURL)baseURL;
- (PLJournal)initWithBaseURL:(id)a3 name:(id)a4 payloadClass:(Class)a5 hasMetadata:(BOOL)a6;
- (PLJournal)initWithBaseURL:(id)a3 payloadClass:(Class)a4;
- (PLJournalFile)changeJournal;
- (PLJournalFile)pendingChangeJournal;
- (PLJournalFile)pendingSnapshotJournal;
- (PLJournalFile)prepareMarker;
- (PLJournalFile)snapshotJournal;
- (id)_payloadTooNewErrorWithPayloadVersion:(int64_t)a3;
- (id)_readMetadataPending:(BOOL)a3;
- (id)metadataURLPending:(BOOL)a3;
- (unint64_t)countOfInsertEntriesWithError:(id *)a3;
- (unint64_t)currentPayloadVersionWithError:(id *)a3;
- (void)removeMetadata;
@end

@implementation PLJournal

- (BOOL)appendUpdatePayloadWithPayloadID:(id)a3 rawAttributes:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 count])
  {
    v10 = [(PLJournal *)self payloadClass];
    v11 = objc_msgSend([v10 alloc], "initWithPayloadID:payloadVersion:nilAttributes:", v8, -[objc_class payloadVersion](v10, "payloadVersion"), 0);
    [v11 setRawPayloadAttributes:v9];
    id v12 = [[PLJournalEntry alloc] initForUpdateWithPayload:v11];
    v16[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    BOOL v14 = [(PLJournal *)self appendChangeEntries:v13 error:a5];
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prepareMarker, 0);
  objc_storeStrong((id *)&self->_pendingChangeJournal, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotJournal, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_fileHandleForAppendingUpdates, 0);
  objc_storeStrong((id *)&self->_changeJournal, 0);
  objc_storeStrong((id *)&self->_snapshotJournal, 0);
}

- (PLJournalFile)prepareMarker
{
  return self->_prepareMarker;
}

- (PLJournalFile)pendingChangeJournal
{
  return self->_pendingChangeJournal;
}

- (PLJournalFile)pendingSnapshotJournal
{
  return self->_pendingSnapshotJournal;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (id)_payloadTooNewErrorWithPayloadVersion:(int64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F8C500];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v7 = NSString;
  id v8 = [(objc_class *)self->_payloadClass payloadClassID];
  id v9 = [v7 stringWithFormat:@"Payload (%@) too new, payload version %lu greater than payload class version %u", v8, a3, -[objc_class payloadVersion](self->_payloadClass, "payloadVersion")];
  v14[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = [v5 errorWithDomain:v6 code:51007 userInfo:v10];

  return v11;
}

- (BOOL)enumerateEntriesUsingBlock:(id)a3 decodePayload:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(PLJournal *)self snapshotJournal];
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__70261;
  v79 = __Block_byref_object_dispose__70262;
  id v80 = [(PLJournal *)self changeJournal];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  id v12 = (void *)v76[5];
  if (v12)
  {
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke;
    v67[3] = &unk_1E586E550;
    v67[4] = self;
    v70[1] = &v71;
    id v68 = v10;
    id v69 = v11;
    v70[0] = v31;
    int v13 = [v12 enumerateEntriesUsingBlock:v67 decodePayload:0 error:a5];
    v29 = &v69;
    v30 = &v68;
    v25 = (id *)v70;
    if (v72[3])
    {
      if (a5)
      {
        -[PLJournal _payloadTooNewErrorWithPayloadVersion:](self, "_payloadTooNewErrorWithPayloadVersion:");
        v15 = &v69;
        BOOL v14 = &v68;
        BOOL v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
LABEL_10:
      BOOL v16 = 0;
      v15 = &v69;
      BOOL v14 = &v68;
      goto LABEL_13;
    }
    if (!v13) {
      goto LABEL_10;
    }
    v27 = v11;
    v28 = v10;
    v24 = v9;
    v26 = v8;
  }
  else
  {
    v27 = v11;
    v28 = v10;
    v24 = v9;
    v26 = v8;
  }
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  char v66 = 1;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__70261;
  v63[4] = __Block_byref_object_dispose__70262;
  id v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  char v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  char v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__70261;
  v57[4] = __Block_byref_object_dispose__70262;
  id v58 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_2;
  v45[3] = &unk_1E586E5A0;
  v45[4] = self;
  v50 = &v71;
  id v46 = v31;
  v51 = v59;
  id v47 = v27;
  v52 = v57;
  BOOL v17 = a4;
  BOOL v56 = a4;
  id v48 = v28;
  v53 = v65;
  v54 = v63;
  id v49 = v26;
  v55 = v61;
  v18 = (void *)MEMORY[0x19F38D650](v45);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_4;
  v32[3] = &unk_1E586E5C8;
  v36 = v57;
  id v9 = v24;
  id v33 = v24;
  id v19 = v18;
  BOOL v44 = v17;
  v34 = self;
  id v35 = v19;
  v37 = &v71;
  v38 = v65;
  v39 = v63;
  v40 = v61;
  v41 = v59;
  v42 = &v75;
  v43 = a5;
  v20 = (uint64_t (**)(void, void))MEMORY[0x19F38D650](v32);
  v21 = (void *)v76[5];
  if (v21) {
    char v22 = [v21 openForReadingUsingBlock:v20 error:a5];
  }
  else {
    char v22 = v20[2](v20, 0);
  }
  v15 = v29;
  BOOL v14 = v30;
  BOOL v16 = v22;
  id v8 = v26;

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);

  _Block_object_dispose(v65, 8);
  id v11 = v27;
  id v10 = v28;
  if (v12) {
    goto LABEL_13;
  }
LABEL_14:
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(&v75, 8);
  return v16;
}

void __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  unsigned int v7 = [v14 payloadVersion];
  if (v7 > [*(id *)(*(void *)(a1 + 32) + 8) payloadVersion])
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v14 payloadVersion];
    *a4 = 1;
    goto LABEL_13;
  }
  id v8 = [v14 payloadID];
  id v9 = *(id *)(a1 + 40);
  id v10 = [v14 header];
  int v11 = [v10 entryType];

  switch(v11)
  {
    case 2:
      id v13 = [NSNumber numberWithUnsignedLongLong:a3];
      [*(id *)(a1 + 56) setObject:v13 forKeyedSubscript:v8];
LABEL_11:

      break;
    case 1:
LABEL_7:
      id v13 = [v9 objectForKeyedSubscript:v8];
      if (!v13)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        [v9 setObject:v13 forKeyedSubscript:v8];
      }
      [v13 addIndex:a3];
      goto LABEL_11;
    case 0:
      id v12 = *(id *)(a1 + 48);

      id v9 = v12;
      goto LABEL_7;
  }

LABEL_13:
}

void __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = [v7 header];
  int v9 = [v8 entryType];

  if (!v9)
  {
    unsigned int v10 = [v7 payloadVersion];
    if (v10 > [*(id *)(*(void *)(a1 + 32) + 8) payloadVersion])
    {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v7 payloadVersion];
      *a4 = 1;
      goto LABEL_25;
    }
    int v11 = [v7 payloadID];
    id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v11];
    id v13 = v12;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      if ([v12 unsignedLongLongValue] > a3) {
        goto LABEL_24;
      }
    }
    else if (v12)
    {
LABEL_24:

      goto LABEL_25;
    }
    id v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v11];
    v15 = v14;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      if (![v14 containsIndex:a3] || objc_msgSend(v15, "lastIndex") > a3) {
        goto LABEL_23;
      }
    }
    else if (v14)
    {
LABEL_23:

      goto LABEL_24;
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) && *(unsigned char *)(a1 + 120))
    {
      BOOL v17 = [*(id *)(a1 + 56) objectForKeyedSubscript:v11];
      if (v17)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        long long v18 = *(_OWORD *)(a1 + 96);
        long long v25 = *(_OWORD *)(a1 + 80);
        v22[2] = __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_3;
        v22[3] = &unk_1E586E578;
        unint64_t v27 = a3;
        v22[4] = *(void *)(a1 + 32);
        long long v26 = v18;
        id v23 = v16;
        id v24 = v7;
        [v17 enumerateIndexesUsingBlock:v22];
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      id v19 = [v7 payload];
      [v19 migrateMergedPayloadWithUpdatePayloads:v16];

      (*(void (**)(void, id, unsigned char *, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v7, a4, v20, v21);
      if (*a4) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
      }
    }
    else
    {
      *a4 = 1;
    }

    goto LABEL_23;
  }
LABEL_25:
}

uint64_t __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  uint64_t v5 = [*(id *)(a1 + 32) enumerateEntriesUsingBlock:*(void *)(a1 + 48) decodePayload:*(unsigned __int8 *)(a1 + 120) error:*(void *)(a1 + 112)];
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v6 = v5;
    int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) || !*(void *)(a1 + 112))
    {
      if (!v5) {
        goto LABEL_11;
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
LABEL_9:
        uint64_t v6 = v7 != 0;
        goto LABEL_11;
      }
    }
    else
    {
      **(void **)(a1 + 112) = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      if (!v6) {
        goto LABEL_11;
      }
      int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        goto LABEL_9;
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      int v7 = 1;
    }
    else
    {
      int v7 = 1;
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
        uint64_t v9 = [*(id *)(a1 + 40) changeJournal];
        uint64_t v10 = *(void *)(*(void *)(a1 + 104) + 8);
        int v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        id v12 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
        if (v12) {
          uint64_t v6 = [v12 enumerateEntriesUsingBlock:*(void *)(a1 + 48) decodePayload:*(unsigned __int8 *)(a1 + 120) error:*(void *)(a1 + 112)];
        }
        else {
          uint64_t v6 = 1;
        }
        int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) || !*(void *)(a1 + 112))
        {
          if (!v6) {
            goto LABEL_11;
          }
        }
        else
        {
          **(void **)(a1 + 112) = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          if (!v6) {
            goto LABEL_11;
          }
          int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        }
      }
    }
    goto LABEL_9;
  }
  if (*(void *)(a1 + 112))
  {
    objc_msgSend(*(id *)(a1 + 40), "_payloadTooNewErrorWithPayloadVersion:");
    uint64_t v6 = 0;
    **(void **)(a1 + 112) = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_11:

  return v6;
}

void __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_3(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) || *(void *)(a1 + 88) < a2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) seekToFileOffset:a2];
    uint64_t v5 = objc_alloc_init(PLJournalEntry);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v7 = [*(id *)(a1 + 32) payloadClass];
    uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v8 + 40);
    LOBYTE(v6) = [(PLJournalEntry *)v5 readFromFileHandle:v6 decodePayload:1 payloadClass:v7 entryOffset:0 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      uint64_t v9 = [(PLJournalEntry *)v5 payload];

      if (v9)
      {
        uint64_t v10 = *(void **)(a1 + 40);
        int v11 = [(PLJournalEntry *)v5 payload];
        [v10 addObject:v11];

        id v12 = [*(id *)(a1 + 48) payload];
        id v13 = [(PLJournalEntry *)v5 payload];
        [v12 mergePayload:v13];
      }
    }
    else
    {
      *a3 = 1;
    }
  }
}

- (unint64_t)currentPayloadVersionWithError:(id *)a3
{
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v5 = [(PLJournal *)self metadata];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"currentPayloadVersion"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v19 = v7;
  unint64_t v8 = v17[3];
  if (!v8)
  {
    uint64_t v9 = [(PLJournal *)self changeJournal];
    uint64_t v10 = v9;
    if (v9
      && (v15[0] = MEMORY[0x1E4F143A8],
          v15[1] = 3221225472,
          v15[2] = __44__PLJournal_currentPayloadVersionWithError___block_invoke,
          v15[3] = &unk_1E586E528,
          v15[4] = &v16,
          ([v9 enumerateEntriesUsingBlock:v15 decodePayload:0 error:a3] & 1) == 0))
    {
      v17[3] = 0;
    }
    else if (!v17[3])
    {
      int v11 = [(PLJournal *)self snapshotJournal];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __44__PLJournal_currentPayloadVersionWithError___block_invoke_2;
      v14[3] = &unk_1E586E528;
      v14[4] = &v16;
      int v12 = [v11 enumerateEntriesUsingBlock:v14 decodePayload:0 error:a3];

      if (v12)
      {
        if (a3 && !v17[3])
        {
          *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:51006 userInfo:0];
        }
      }
    }

    unint64_t v8 = v17[3];
  }
  _Block_object_dispose(&v16, 8);
  return v8;
}

void __44__PLJournal_currentPayloadVersionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < (unint64_t)[v3 payloadVersion]) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 payloadVersion];
  }
}

uint64_t __44__PLJournal_currentPayloadVersionWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 payloadVersion];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = 1;
  return result;
}

- (unint64_t)countOfInsertEntriesWithError:(id *)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PLJournal_countOfInsertEntriesWithError___block_invoke;
  v5[3] = &unk_1E586E500;
  v5[4] = &v6;
  [(PLJournal *)self enumerateEntriesUsingBlock:v5 decodePayload:0 error:a3];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__PLJournal_countOfInsertEntriesWithError___block_invoke(uint64_t result)
{
  return result;
}

- (BOOL)enumeratePayloadsUsingBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PLJournal_enumeratePayloadsUsingBlock_error___block_invoke;
  v9[3] = &unk_1E586E4D8;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [(PLJournal *)self enumerateEntriesUsingBlock:v9 decodePayload:1 error:a4];

  return (char)a4;
}

void __47__PLJournal_enumeratePayloadsUsingBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 payloadID];

  if (!v6)
  {
    id v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      int v11 = "Skipping nil payloadID on enumeration for entry: %@";
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  id v7 = [v5 payload];

  if (!v7)
  {
    id v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      int v11 = "Skipping nil payload on enumeration for entry: %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v5 payload];
  (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))(v8, v9, a3);

LABEL_10:
}

- (PLJournalFile)changeJournal
{
  if ([(PLJournal *)self _isPendingJournalAuthoritative])
  {
    if ([(PLJournalFile *)self->_pendingSnapshotJournal fileExists])
    {
      unint64_t v3 = 0;
      goto LABEL_8;
    }
    pendingChangeJournal = self->_pendingChangeJournal;
    p_pendingChangeJournal = &self->_pendingChangeJournal;
    BOOL v7 = [(PLJournalFile *)pendingChangeJournal fileExists];
    p_changeJournal = p_pendingChangeJournal - 5;
    if (v7) {
      p_changeJournal = p_pendingChangeJournal;
    }
  }
  else
  {
    p_changeJournal = &self->_changeJournal;
  }
  unint64_t v3 = *p_changeJournal;
LABEL_8:
  return v3;
}

- (PLJournalFile)snapshotJournal
{
  if (![(PLJournal *)self _isPendingJournalAuthoritative]
    || (p_snapshotJournal = &self->_pendingSnapshotJournal,
        ![(PLJournalFile *)self->_pendingSnapshotJournal fileExists]))
  {
    p_snapshotJournal = &self->_snapshotJournal;
  }
  id v4 = *p_snapshotJournal;
  return v4;
}

- (BOOL)snapshotJournalFileSize:(unint64_t *)a3 changeJournalFileSize:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v9 = [(PLJournal *)self changeJournal];
  *a4 = 0;
  id v10 = [(PLJournal *)self snapshotJournal];
  if ([v10 fileSize:a3 error:a5])
  {
    if (v9) {
      char v11 = [v9 fileSize:a4 error:a5];
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)finishAppendChangeEntriesWithError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  fileHandleForAppendingUpdates = self->_fileHandleForAppendingUpdates;
  if (!fileHandleForAppendingUpdates) {
    return 1;
  }
  self->_fileHandleForAppendingUpdates = 0;

  if (!self->_hasMetadata) {
    return 1;
  }
  id v10 = @"currentPayloadVersion";
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[objc_class payloadVersion](self->_payloadClass, "payloadVersion"));
  v11[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v8 = [(PLJournal *)self _updateMetadataWithMetadata:v7 replace:0 pending:0 error:a3];

  return v8;
}

- (BOOL)appendChangeEntryAfterPrepare:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self->_fileHandleForAppendingUpdates)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PLJournalException" reason:@"Call prepareForAppendChangeEntriesWithError before appendChangeEntryAfterPrepare" userInfo:0];
    objc_exception_throw(v11);
  }
  BOOL v7 = v6;
  BOOL v8 = (objc_class *)[v6 payloadClass];
  if (v8 != [(PLJournal *)self payloadClass])
  {
    int v12 = (void *)MEMORY[0x1E4F1CA00];
    id v13 = [NSString stringWithFormat:@"Payload classes don't match: %@, %@", objc_msgSend(v7, "payloadClass"), -[PLJournal payloadClass](self, "payloadClass")];
    id v14 = [v12 exceptionWithName:@"PLJournalException" reason:v13 userInfo:0];

    objc_exception_throw(v14);
  }
  char v9 = [v7 writeToFileHandle:self->_fileHandleForAppendingUpdates checksumContext:0 error:a4];

  return v9;
}

- (BOOL)prepareForAppendChangeEntriesWithError:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[PLJournal _recoverJournalWithError:](self, "_recoverJournalWithError:");
  if (v5)
  {
    if (!self->_hasMetadata
      || (id v11 = @"currentPayloadVersion",
          v12[0] = &unk_1EEBEF660,
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1],
          id v6 = objc_claimAutoreleasedReturnValue(),
          BOOL v7 = [(PLJournal *)self _updateMetadataWithMetadata:v6 replace:0 pending:0 error:a3], v6, LOBYTE(v5) = 0, v7))
    {
      BOOL v8 = [(PLJournalFile *)self->_changeJournal fileHandleForWritingWithError:a3];
      fileHandleForAppendingUpdates = self->_fileHandleForAppendingUpdates;
      self->_fileHandleForAppendingUpdates = v8;

      LOBYTE(v5) = self->_fileHandleForAppendingUpdates != 0;
    }
  }
  return v5;
}

- (BOOL)appendChangeEntries:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(PLJournal *)self _recoverJournalWithError:a4])
  {
    if (!self->_hasMetadata) {
      goto LABEL_4;
    }
    int v12 = @"currentPayloadVersion";
    BOOL v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[objc_class payloadVersion](self->_payloadClass, "payloadVersion"));
    v13[0] = v7;
    BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    BOOL v9 = [(PLJournal *)self _updateMetadataWithMetadata:v8 replace:0 pending:0 error:a4];

    BOOL v10 = 0;
    if (v9) {
LABEL_4:
    }
      BOOL v10 = [(PLJournalFile *)self->_changeJournal appendEntries:v6 error:a4];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)coalesceChangesToSnapshotWithError:(id *)a3
{
  v21[4] = *MEMORY[0x1E4F143B8];
  if (self->_snapshotMode)
  {
    if (self->_snapshotMode != 1)
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PLJournalException" reason:@"Must perform coalesce after preparing in create mode" userInfo:0];
      objc_exception_throw(v17);
    }
    int v5 = 0;
  }
  else
  {
    int v5 = 1;
    if (![(PLJournal *)self _prepareForSnapshotWithMode:1 error:a3])
    {
      LOBYTE(v7) = 0;
      return v7;
    }
  }
  pendingSnapshotJournal = self->_pendingSnapshotJournal;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__PLJournal_coalesceChangesToSnapshotWithError___block_invoke;
  v19[3] = &unk_1E586E4B0;
  v19[4] = self;
  v19[5] = a3;
  uint64_t v7 = [(PLJournalFile *)pendingSnapshotJournal openForWritingUsingBlock:v19 error:a3];
  if (v7 && self->_hasMetadata)
  {
    uint64_t v8 = [(objc_class *)self->_payloadClass payloadVersion];
    v20[0] = @"coalescePayloadVersion";
    BOOL v9 = [NSNumber numberWithUnsignedInt:v8];
    v21[0] = v9;
    v20[1] = @"coalesceDate";
    BOOL v10 = [MEMORY[0x1E4F1C9C8] date];
    v21[1] = v10;
    v20[2] = @"currentPayloadVersion";
    id v11 = [NSNumber numberWithUnsignedInt:v8];
    v20[3] = @"snapshotChecksum";
    v21[2] = v11;
    v21[3] = &stru_1EEB2EB80;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    uint64_t v7 = [(PLJournal *)self _updateMetadataWithMetadata:v12 replace:0 pending:1 error:a3];

    if ((v5 & 1) == 0) {
      return v7;
    }
  }
  else if (!v5)
  {
    return v7;
  }
  id v18 = 0;
  BOOL v13 = [(PLJournal *)self _finishSnapshotWithMode:1 snapshotSuccess:v7 error:&v18];
  id v14 = v18;
  v15 = v14;
  if (!v13)
  {
    if (v7)
    {
      LOBYTE(v7) = 0;
      if (a3) {
        *a3 = v14;
      }
    }
  }

  return v7;
}

BOOL __48__PLJournal_coalesceChangesToSnapshotWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__70261;
  id v17 = __Block_byref_object_dispose__70262;
  id v18 = 0;
  id v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PLJournal_coalesceChangesToSnapshotWithError___block_invoke_2;
  v9[3] = &unk_1E586E488;
  id v11 = &v19;
  id v5 = v3;
  id v10 = v5;
  int v12 = &v13;
  int v6 = [v4 enumeratePayloadsUsingBlock:v9 error:*(void *)(a1 + 40)];
  if (!*((unsigned char *)v20 + 24) && *(void *)(a1 + 40)) {
    **(void **)(a1 + 40) = (id) v14[5];
  }
  if (v6) {
    BOOL v7 = *((unsigned char *)v20 + 24) != 0;
  }
  else {
    BOOL v7 = 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __48__PLJournal_coalesceChangesToSnapshotWithError___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  int v6 = (void *)MEMORY[0x19F38D3B0]();
  id v7 = [[PLJournalEntry alloc] initForInsertWithPayload:v5];
  uint64_t v8 = a1[4];
  uint64_t v9 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v7 writeToFileHandle:v8 checksumContext:0 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v10;
  if ((v10 & 1) == 0) {
    *a3 = 1;
  }
}

- (BOOL)appendSnapshotUsingNextEntryBlock:(id)a3 error:(id *)a4
{
  return [(PLJournal *)self _performSnapshotWithMode:2 usingNextEntryBlock:a3 createOnlyIfNecessary:0 error:a4];
}

- (BOOL)createSnapshotUsingNextPayloadBlock:(id)a3 createOnlyIfNecessary:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __77__PLJournal_createSnapshotUsingNextPayloadBlock_createOnlyIfNecessary_error___block_invoke;
  v11[3] = &unk_1E586E460;
  id v12 = v8;
  id v9 = v8;
  LOBYTE(a5) = [(PLJournal *)self _performSnapshotWithMode:1 usingNextEntryBlock:v11 createOnlyIfNecessary:v6 error:a5];

  return (char)a5;
}

id __77__PLJournal_createSnapshotUsingNextPayloadBlock_createOnlyIfNecessary_error___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v1) {
    id v2 = [[PLJournalEntry alloc] initForInsertWithPayload:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (BOOL)finishCreateSnapshot:(BOOL)a3 error:(id *)a4
{
  return [(PLJournal *)self _finishSnapshotWithMode:1 snapshotSuccess:a3 error:a4];
}

- (BOOL)prepareForCreateSnapshotWithError:(id *)a3
{
  return [(PLJournal *)self _prepareForSnapshotWithMode:1 error:a3];
}

- (BOOL)_performSnapshotWithMode:(unsigned __int8)a3 usingNextEntryBlock:(id)a4 createOnlyIfNecessary:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = a3;
  v53[3] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  if (!v8)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PLJournal.m", 1136, @"Invalid parameter not satisfying: %@", @"snapshotMode != PLJournalSnapshotModeNone" object file lineNumber description];
  }
  if (self->_snapshotMode)
  {
    if (self->_snapshotMode != v8)
    {
      id v41 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PLJournalException" reason:@"Must perform snapshot in the same mode as it was prepared" userInfo:0];
      objc_exception_throw(v41);
    }
    BOOL v12 = 0;
    int v13 = 1;
  }
  else
  {
    BOOL v12 = [(PLJournal *)self _prepareForSnapshotWithMode:v8 error:a6];
    int v13 = v12;
  }
  id v14 = 0;
  if (v8 == 1 && v7) {
    id v14 = objc_alloc_init(PLJournalChecksumContext);
  }
  if (!v13) {
    goto LABEL_19;
  }
  uint64_t v15 = 72;
  if (v8 == 1) {
    uint64_t v15 = 64;
  }
  uint64_t v16 = *(Class *)((char *)&self->super.isa + v15);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __86__PLJournal__performSnapshotWithMode_usingNextEntryBlock_createOnlyIfNecessary_error___block_invoke;
  v46[3] = &unk_1E586E438;
  id v48 = v11;
  v46[4] = self;
  id v17 = v14;
  id v47 = v17;
  id v49 = a6;
  id v18 = v16;
  int v19 = [v18 openForWritingUsingBlock:v46 error:a6];

  if (!v19)
  {
LABEL_19:
    BOOL v26 = 0;
    if (!v12) {
      goto LABEL_33;
    }
    goto LABEL_20;
  }
  if (!self->_hasMetadata)
  {
    BOOL v26 = 1;
    if (!v12) {
      goto LABEL_33;
    }
    goto LABEL_20;
  }
  id v44 = v11;
  uint64_t v20 = [(objc_class *)self->_payloadClass payloadVersion];
  id v42 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v52[0] = @"snapshotPayloadVersion";
  v43 = [NSNumber numberWithUnsignedInt:v20];
  v53[0] = v43;
  v52[1] = @"snapshotDate";
  uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
  v53[1] = v21;
  v52[2] = @"currentPayloadVersion";
  char v22 = [NSNumber numberWithUnsignedInt:v20];
  v53[2] = v22;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  id v24 = (void *)[v42 initWithDictionary:v23];

  if (v17)
  {
    long long v25 = [(PLJournalChecksumContext *)v17 finalizedChecksum];
    [v24 setObject:v25 forKeyedSubscript:@"snapshotChecksum"];
  }
  BOOL v26 = [(PLJournal *)self _updateMetadataWithMetadata:v24 replace:1 pending:1 error:a6];

  id v11 = v44;
  if (v12)
  {
LABEL_20:
    if (v14)
    {
      unint64_t v27 = [(PLJournal *)self metadata];
      v28 = [v27 objectForKeyedSubscript:@"snapshotChecksum"];

      v29 = [(PLJournalChecksumContext *)v14 finalizedChecksum];
      int v30 = [v28 isEqualToString:v29];

      if (v30)
      {
        id v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = *MEMORY[0x1E4F8C500];
        uint64_t v50 = *MEMORY[0x1E4F28228];
        v51 = @"Existing snapshot is the same as the pending one";
        id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        v34 = [v31 errorWithDomain:v32 code:51012 userInfo:v33];
        id v35 = v34;
        if (a6) {
          *a6 = v34;
        }

        BOOL v26 = 0;
      }
    }
    id v45 = 0;
    BOOL v36 = [(PLJournal *)self _finishSnapshotWithMode:v8 snapshotSuccess:v26 error:&v45];
    id v37 = v45;
    v38 = v37;
    if (!v36 && v26)
    {
      LOBYTE(v26) = 0;
      if (a6) {
        *a6 = v37;
      }
    }
  }
LABEL_33:

  return v26;
}

uint64_t __86__PLJournal__performSnapshotWithMode_usingNextEntryBlock_createOnlyIfNecessary_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  char v24 = 0;
  id v4 = (*(void (**)(void))(a1[6] + 16))();
  if (v4)
  {
    BOOL v7 = 0;
    while (1)
    {
      uint64_t v8 = (void *)MEMORY[0x19F38D3B0]();
      id v9 = [v4 payload];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1[4] + 8);

      if (v10 != v11)
      {
        id v18 = (void *)MEMORY[0x1E4F1CA00];
        int v19 = NSString;
        uint64_t v20 = [v4 payload];
        uint64_t v21 = [v19 stringWithFormat:@"Payload classes don't match: %@, %@", objc_opt_class(), *(void *)(a1[4] + 8)];
        id v22 = [v18 exceptionWithName:@"PLJournalException" reason:v21 userInfo:0];

        objc_exception_throw(v22);
      }
      uint64_t v12 = a1[5];
      id v23 = v7;
      int v13 = [v4 writeToFileHandle:v3 checksumContext:v12 error:&v23];
      id v5 = v23;

      if (!v13) {
        break;
      }
      uint64_t v14 = (*(void (**)(void))(a1[6] + 16))();

      if (v14) {
        BOOL v15 = v24 == 0;
      }
      else {
        BOOL v15 = 0;
      }
      id v4 = (void *)v14;
      BOOL v7 = v5;
      if (!v15)
      {
        LODWORD(v6) = 1;
        id v4 = (void *)v14;
        goto LABEL_13;
      }
    }
    uint64_t v6 = a1[7];
    if (v6)
    {
      id v5 = v5;
      LODWORD(v6) = 0;
      *(void *)a1[7] = v5;
    }
  }
  else
  {
    id v5 = 0;
    LODWORD(v6) = 1;
  }
LABEL_13:
  if (v24) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v6;
  }

  return v16;
}

- (BOOL)_finishSnapshotWithMode:(unsigned __int8)a3 snapshotSuccess:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  int v7 = a3;
  if (!a3)
  {
    BOOL v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLJournal.m", 1083, @"Invalid parameter not satisfying: %@", @"snapshotMode != PLJournalSnapshotModeNone" object file lineNumber description];
  }
  if (self->_snapshotMode != v7)
  {
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PLJournalException" reason:@"Cannot finish snapshot without preparing first using the same snapshot mode" userInfo:0];
    objc_exception_throw(v16);
  }
  if (v6)
  {
    BOOL v9 = [(PLJournalFile *)self->_prepareMarker removeFileWithError:a5];
    if (v7 == 2)
    {
      if (!v9) {
        goto LABEL_25;
      }
      pendingChangeJournal = self->_pendingChangeJournal;
      changeJournal = self->_changeJournal;
      goto LABEL_16;
    }
    if (v7 != 1)
    {
      if (!v9) {
        goto LABEL_25;
      }
LABEL_22:
      LOBYTE(v9) = !self->_hasMetadata
                || [(PLJournal *)self _replaceMetadataWithPendingMetadataError:a5];
      goto LABEL_25;
    }
    if (v9)
    {
      BOOL v9 = [(PLJournalFile *)self->_changeJournal removeFileWithError:a5];
      if (v9)
      {
        pendingChangeJournal = self->_pendingSnapshotJournal;
        changeJournal = self->_snapshotJournal;
LABEL_16:
        uint64_t v12 = [(PLJournalFile *)changeJournal url];
        BOOL v13 = [(PLJournalFile *)pendingChangeJournal moveToURL:v12 error:a5];

        if (!v13)
        {
LABEL_17:
          LOBYTE(v9) = 0;
          goto LABEL_25;
        }
        goto LABEL_22;
      }
    }
  }
  else
  {
    if (v7 == 1)
    {
      BOOL v9 = [(PLJournalFile *)self->_pendingSnapshotJournal removeFileWithError:a5];
      if (!v9) {
        goto LABEL_25;
      }
    }
    else if (v7 != 2 || ![(PLJournalFile *)self->_pendingChangeJournal removeFileWithError:a5])
    {
      goto LABEL_17;
    }
    BOOL v9 = [(PLJournal *)self _removeMetadataPending:1 error:a5];
    if (v9) {
      LOBYTE(v9) = [(PLJournalFile *)self->_prepareMarker removeFileWithError:a5];
    }
  }
LABEL_25:
  self->_snapshotMode = 0;
  return v9;
}

- (BOOL)_prepareForSnapshotWithMode:(unsigned __int8)a3 error:(id *)a4
{
  int v5 = a3;
  if (!a3)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLJournal.m", 1065, @"Invalid parameter not satisfying: %@", @"snapshotMode != PLJournalSnapshotModeNone" object file lineNumber description];
  }
  if (self->_snapshotMode)
  {
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PLJournalException" reason:@"Cannot prepare snapshot more than once without finishing" userInfo:0];
    objc_exception_throw(v13);
  }
  BOOL v7 = [(PLJournal *)self _recoverJournalWithError:a4];
  if (v7)
  {
    BOOL v7 = [(PLJournalFile *)self->_prepareMarker createEmptyFileWithError:a4];
    if (v5 == 2 && v7)
    {
      changeJournal = self->_changeJournal;
      BOOL v9 = [(PLJournalFile *)self->_pendingChangeJournal url];
      BOOL v10 = [(PLJournalFile *)changeJournal copyToURL:v9 error:a4];

      if (!v10)
      {
        LOBYTE(v7) = 0;
        return v7;
      }
    }
    else if (!v7)
    {
      return v7;
    }
    self->_snapshotMode = v5;
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)_recoverJournalWithError:(id *)a3
{
  fileHandleForAppendingUpdates = self->_fileHandleForAppendingUpdates;
  self->_fileHandleForAppendingUpdates = 0;

  BOOL v6 = [(PLJournal *)self _isPendingJournalAuthoritative];
  pendingSnapshotJournal = self->_pendingSnapshotJournal;
  if (v6)
  {
    BOOL v8 = [(PLJournalFile *)pendingSnapshotJournal fileExists];
    BOOL v9 = [(PLJournalFile *)self->_pendingChangeJournal fileExists];
    BOOL v10 = [(PLJournal *)self metadataURLPending:1];
    BOOL v11 = +[PLJournalFile fileExistsAtURL:v10];

    if (!v8 && !v9 && !v11) {
      goto LABEL_5;
    }
    if (v8)
    {
      BOOL v12 = [(PLJournal *)self removeJournalFilesWithError:a3];
      if (!v12) {
        return v12;
      }
      id v13 = self->_pendingSnapshotJournal;
      uint64_t v14 = [(PLJournalFile *)self->_snapshotJournal url];
      int v15 = [(PLJournalFile *)v13 moveToURL:v14 error:a3];
    }
    else
    {
      int v15 = 1;
    }
    if ((v15 & v9) == 1)
    {
      pendingChangeJournal = self->_pendingChangeJournal;
      id v17 = [(PLJournalFile *)self->_changeJournal url];
      int v15 = [(PLJournalFile *)pendingChangeJournal moveToURL:v17 error:a3];
    }
    if ((v15 & v11) == 1)
    {
      if (![(PLJournal *)self _replaceMetadataWithPendingMetadataError:a3])goto LABEL_20; {
LABEL_5:
      }
      [(PLJournalFile *)self->_prepareMarker removeFileWithError:0];
      LOBYTE(v12) = 1;
      return v12;
    }
    if (v15) {
      goto LABEL_5;
    }
LABEL_20:
    LOBYTE(v12) = 0;
    return v12;
  }
  BOOL v12 = [(PLJournalFile *)pendingSnapshotJournal removeFileWithError:a3];
  if (v12)
  {
    BOOL v12 = [(PLJournalFile *)self->_pendingChangeJournal removeFileWithError:a3];
    if (v12)
    {
      if ([(PLJournal *)self _removeMetadataPending:1 error:a3]) {
        goto LABEL_5;
      }
      goto LABEL_20;
    }
  }
  return v12;
}

- (BOOL)_isPendingJournalAuthoritative
{
  char v3 = [(id)objc_opt_class() snapshotFinishMarkerExistsForBaseURL:self->_baseURL];
  return ![(PLJournalFile *)self->_prepareMarker fileExists] | v3;
}

- (BOOL)removeJournalFilesWithError:(id *)a3
{
  BOOL v5 = -[PLJournalFile removeFileWithError:](self->_snapshotJournal, "removeFileWithError:");
  if (v5)
  {
    changeJournal = self->_changeJournal;
    LOBYTE(v5) = [(PLJournalFile *)changeJournal removeFileWithError:a3];
  }
  return v5;
}

- (BOOL)_updateMetadataWithMetadata:(id)a3 replace:(BOOL)a4 pending:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!a4)
  {
    BOOL v12 = [(PLJournal *)self _readMetadataPending:0];
    if (v12) {
      [v11 addEntriesFromDictionary:v12];
    }
  }
  if (v10) {
    [v11 addEntriesFromDictionary:v10];
  }
  id v13 = [(PLJournal *)self metadataURLPending:v7];
  uint64_t v14 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:100 options:0 error:0];
  int v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = [(NSURL *)self->_baseURL path];
  [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:0];

  BOOL v17 = +[PLJournalFile writeData:v14 toURL:v13 atomically:v7 ^ 1 error:a6];
  return v17;
}

- (id)_readMetadataPending:(BOOL)a3
{
  char v3 = (void *)MEMORY[0x1E4F1C9B8];
  id v4 = [(PLJournal *)self metadataURLPending:a3];
  BOOL v5 = [v3 dataWithContentsOfURL:v4];

  if (!v5)
  {
    id v10 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = 0;
  BOOL v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:&v12 error:0];
  BOOL v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  BOOL v8 = [v6 objectForKeyedSubscript:@"snapshotPayloadVersion"];
  if ([v8 integerValue] <= 0)
  {

    goto LABEL_8;
  }
  BOOL v9 = [v7 objectForKeyedSubscript:@"snapshotDate"];

  if (!v9)
  {
LABEL_8:
    id v10 = 0;
    goto LABEL_9;
  }
  id v10 = v7;
LABEL_9:

LABEL_10:
  return v10;
}

- (BOOL)_replaceMetadataWithPendingMetadataError:(id *)a3
{
  BOOL v5 = [(PLJournal *)self metadataURLPending:1];
  BOOL v6 = [(PLJournal *)self metadataURLPending:0];
  LOBYTE(a3) = +[PLJournalFile moveURL:v5 toURL:v6 error:a3];

  return (char)a3;
}

- (BOOL)_removeMetadataPending:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = [(PLJournal *)self metadataURLPending:a3];
  LOBYTE(a4) = +[PLJournalFile removeURL:v5 error:a4];

  return (char)a4;
}

- (id)metadataURLPending:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = objc_opt_class();
  baseURL = self->_baseURL;
  BOOL v7 = [(objc_class *)self->_payloadClass payloadClassID];
  BOOL v8 = [v5 metadataURLForBaseURL:baseURL payloadClassId:v7 pending:v3];

  return v8;
}

- (NSDictionary)metadata
{
  if ([(PLJournal *)self _isPendingJournalAuthoritative])
  {
    BOOL v3 = [(PLJournal *)self metadataURLPending:1];
    BOOL v4 = +[PLJournalFile fileExistsAtURL:v3];
  }
  else
  {
    BOOL v4 = 0;
  }
  return (NSDictionary *)[(PLJournal *)self _readMetadataPending:v4];
}

- (void)removeMetadata
{
  [(PLJournal *)self _removeMetadataPending:0 error:0];
  [(PLJournal *)self _removeMetadataPending:1 error:0];
}

- (Class)payloadClass
{
  return self->_payloadClass;
}

- (PLJournal)initWithBaseURL:(id)a3 name:(id)a4 payloadClass:(Class)a5 hasMetadata:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PLJournal;
  id v13 = [(PLJournal *)&v36 init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_baseURL, a3);
    v14->_payloadClass = a5;
    v14->_hasMetadata = a6;
    int v15 = [PLJournalFile alloc];
    id v16 = [(id)objc_opt_class() journalURLForBaseURL:v11 name:v12 journalType:@"snapshot"];
    uint64_t v17 = [(PLJournalFile *)v15 initWithURL:v16 payloadClass:a5];
    snapshotJournal = v14->_snapshotJournal;
    v14->_snapshotJournal = (PLJournalFile *)v17;

    int v19 = [PLJournalFile alloc];
    uint64_t v20 = [(id)objc_opt_class() journalURLForBaseURL:v11 name:v12 journalType:@"change"];
    uint64_t v21 = [(PLJournalFile *)v19 initWithURL:v20 payloadClass:a5];
    changeJournal = v14->_changeJournal;
    v14->_changeJournal = (PLJournalFile *)v21;

    id v23 = [PLJournalFile alloc];
    char v24 = [(id)objc_opt_class() journalURLForBaseURL:v14->_baseURL name:v12 journalType:@"pending-snapshot"];
    uint64_t v25 = [(PLJournalFile *)v23 initWithURL:v24 payloadClass:a5];
    pendingSnapshotJournal = v14->_pendingSnapshotJournal;
    v14->_pendingSnapshotJournal = (PLJournalFile *)v25;

    unint64_t v27 = [PLJournalFile alloc];
    v28 = [(id)objc_opt_class() journalURLForBaseURL:v14->_baseURL name:v12 journalType:@"pending-change"];
    uint64_t v29 = [(PLJournalFile *)v27 initWithURL:v28 payloadClass:a5];
    pendingChangeJournal = v14->_pendingChangeJournal;
    v14->_pendingChangeJournal = (PLJournalFile *)v29;

    id v31 = [PLJournalFile alloc];
    uint64_t v32 = [(id)objc_opt_class() journalURLForBaseURL:v14->_baseURL name:v12 journalType:@"prepare-marker"];
    uint64_t v33 = [(PLJournalFile *)v31 initWithURL:v32 payloadClass:a5];
    prepareMarker = v14->_prepareMarker;
    v14->_prepareMarker = (PLJournalFile *)v33;
  }
  return v14;
}

- (PLJournal)initWithBaseURL:(id)a3 payloadClass:(Class)a4
{
  id v6 = a3;
  BOOL v7 = [(objc_class *)a4 payloadClassID];
  BOOL v8 = [(PLJournal *)self initWithBaseURL:v6 name:v7 payloadClass:a4 hasMetadata:1];

  return v8;
}

+ (BOOL)_finishFullSnapshotForBaseURL:(id)a3 snapshotSucceeded:(BOOL)a4 snapshotMode:(unsigned __int8)a5 journals:(id)a6 error:(id *)a7
{
  uint64_t v9 = a5;
  BOOL v10 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  if (v9)
  {
    if (!v10) {
      goto LABEL_4;
    }
  }
  else
  {
    BOOL v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PLJournal.m", 920, @"Invalid parameter not satisfying: %@", @"snapshotMode != PLJournalSnapshotModeNone" object file lineNumber description];

    if (!v10) {
      goto LABEL_4;
    }
  }
  if (![a1 createSnapshotFinishMarkerForBaseURL:v13 error:a7])
  {
    char v24 = 0;
    goto LABEL_18;
  }
LABEL_4:
  SEL v27 = a2;
  id v28 = a1;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v29 = v14;
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        int v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v20 = [v19 baseURL];
        char v21 = [v20 isEqual:v13];

        if ((v21 & 1) == 0)
        {
          id v22 = [MEMORY[0x1E4F28B00] currentHandler];
          id v23 = [v19 baseURL];
          [v22 handleFailureInMethod:v27, v28, @"PLJournal.m", 928, @"Journal base URL: %@ not the same as provided baseURL: %@", v23, v13 object file lineNumber description];
        }
        if (![v19 _finishSnapshotWithMode:v9 snapshotSuccess:v10 error:a7])
        {

          char v24 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  char v24 = [v28 removeSnapshotFinishMarkerForBaseURL:v13 error:a7];
LABEL_16:
  id v14 = v29;
LABEL_18:

  return v24;
}

+ (BOOL)_performSnapshotsForBaseURL:(id)a3 snapshotMode:(unsigned __int8)a4 payloadClasses:(id)a5 snapshotJournalBlock:(id)a6 createOnlyIfNecessary:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v12 = a4;
  v59[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  if (!v12)
  {
    long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"PLJournal.m", 862, @"Invalid parameter not satisfying: %@", @"snapshotMode != PLJournalSnapshotModeNone" object file lineNumber description];
  }
  uint64_t v52 = 0;
  v53 = (id *)&v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__70261;
  BOOL v56 = __Block_byref_object_dispose__70262;
  id v57 = 0;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  id obj = 0;
  char v18 = [a1 recoverJournalsIfNecessaryForBaseURL:v15 payloadClasses:v16 error:&obj];
  objc_storeStrong(&v57, obj);
  char v51 = v18;
  int v19 = *((unsigned __int8 *)v49 + 24);
  if (*((unsigned char *)v49 + 24))
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __118__PLJournal__performSnapshotsForBaseURL_snapshotMode_payloadClasses_snapshotJournalBlock_createOnlyIfNecessary_error___block_invoke;
    v40[3] = &unk_1E586E3E8;
    id v21 = v15;
    id v41 = v21;
    id v44 = &v48;
    char v46 = v12;
    id v45 = &v52;
    id v22 = v20;
    id v42 = v22;
    id v43 = v17;
    [v16 enumerateObjectsUsingBlock:v40];
    if (v12 == 1 && v9)
    {
      uint64_t v36 = 0;
      id v37 = &v36;
      uint64_t v38 = 0x2020000000;
      char v39 = 1;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __118__PLJournal__performSnapshotsForBaseURL_snapshotMode_payloadClasses_snapshotJournalBlock_createOnlyIfNecessary_error___block_invoke_2;
      v35[3] = &unk_1E586E410;
      v35[4] = &v36;
      [v22 enumerateObjectsUsingBlock:v35];
      if (*((unsigned char *)v37 + 24))
      {
        *((unsigned char *)v49 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
        id v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v58 = *MEMORY[0x1E4F28228];
        v59[0] = @"All existing snapshots are the same as the pending ones";
        char v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
        uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x1E4F8C500] code:51012 userInfo:v24];
        id v26 = v53[5];
        void v53[5] = (id)v25;
      }
      _Block_object_dispose(&v36, 8);
    }
    uint64_t v27 = *((unsigned __int8 *)v49 + 24);
    id v34 = 0;
    BOOL v28 = +[PLJournal _finishFullSnapshotForBaseURL:v21 snapshotSucceeded:v27 snapshotMode:v12 journals:v22 error:&v34];
    id v29 = v34;
    id v30 = v34;
    if (!v28 && *((unsigned char *)v49 + 24))
    {
      objc_storeStrong(v53 + 5, v29);
      *((unsigned char *)v49 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v28;
    }

    int v19 = *((unsigned __int8 *)v49 + 24);
  }
  if (a8 && !v19)
  {
    *a8 = v53[5];
    int v19 = *((unsigned __int8 *)v49 + 24);
  }
  BOOL v31 = v19 != 0;
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v31;
}

void __118__PLJournal__performSnapshotsForBaseURL_snapshotMode_payloadClasses_snapshotJournalBlock_createOnlyIfNecessary_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL v7 = (void *)MEMORY[0x19F38D3B0]();
  BOOL v8 = [[PLJournal alloc] initWithBaseURL:*(void *)(a1 + 32) payloadClass:a2];
  uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v10 + 40);
  BOOL v11 = [(PLJournal *)v8 _prepareForSnapshotWithMode:v9 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v11;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) {
    || ([*(id *)(a1 + 40) addObject:v8],
  }
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))()) == 0))
  {
    *a4 = 1;
  }
}

void __118__PLJournal__performSnapshotsForBaseURL_snapshotMode_payloadClasses_snapshotJournalBlock_createOnlyIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v11 = [v6 _readMetadataPending:0];
  BOOL v7 = [v6 _readMetadataPending:1];

  BOOL v8 = [v7 objectForKeyedSubscript:@"snapshotChecksum"];
  if (!v8
    || ([v11 objectForKeyedSubscript:@"snapshotChecksum"],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqualToString:v8],
        v9,
        (v10 & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (BOOL)appendSnapshotsForBaseURL:(id)a3 payloadClasses:(id)a4 snapshotJournalBlock:(id)a5 error:(id *)a6
{
  return [a1 _performSnapshotsForBaseURL:a3 snapshotMode:2 payloadClasses:a4 snapshotJournalBlock:a5 createOnlyIfNecessary:0 error:a6];
}

+ (BOOL)createSnapshotsForBaseURL:(id)a3 payloadClasses:(id)a4 snapshotJournalBlock:(id)a5 createOnlyIfNecessary:(BOOL)a6 error:(id *)a7
{
  return [a1 _performSnapshotsForBaseURL:a3 snapshotMode:1 payloadClasses:a4 snapshotJournalBlock:a5 createOnlyIfNecessary:a6 error:a7];
}

+ (BOOL)recoverJournalsIfNecessaryForBaseURL:(id)a3 payloadClasses:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([a1 snapshotFinishMarkerExistsForBaseURL:v8])
  {
    id v19 = a1;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [[PLJournal alloc] initWithBaseURL:v8 payloadClass:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          BOOL v16 = [(PLJournal *)v15 _recoverJournalWithError:a5];

          if (!v16)
          {

            char v17 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    char v17 = [v19 removeSnapshotFinishMarkerForBaseURL:v8 error:a5];
  }
  else
  {
    char v17 = 1;
  }
LABEL_13:

  return v17;
}

+ (BOOL)snapshotFinishMarkerExistsForBaseURL:(id)a3
{
  BOOL v3 = [a1 snapshotFinishMarkerURLForBaseURL:a3];
  char v4 = [v3 checkResourceIsReachableAndReturnError:0];

  return v4;
}

+ (BOOL)removeSnapshotFinishMarkerForBaseURL:(id)a3 error:(id *)a4
{
  BOOL v5 = [a1 snapshotFinishMarkerURLForBaseURL:a3];
  LOBYTE(a4) = +[PLJournalFile removeURL:v5 error:a4];

  return (char)a4;
}

+ (BOOL)createSnapshotFinishMarkerForBaseURL:(id)a3 error:(id *)a4
{
  BOOL v5 = [a1 snapshotFinishMarkerURLForBaseURL:a3];
  LOBYTE(a4) = +[PLJournalFile createEmptyURL:v5 error:a4];

  return (char)a4;
}

+ (id)snapshotFinishMarkerURLForBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"SnapshotFinishMarker"];
}

+ (id)metadataURLForBaseURL:(id)a3 payloadClassId:(id)a4 pending:(BOOL)a5
{
  if (a5)
  {
    id v6 = NSString;
    id v7 = a3;
    id v8 = [v6 stringWithFormat:@"%@-pending", a4];
    id v9 = [v7 URLByAppendingPathComponent:v8];

    id v10 = [v9 URLByAppendingPathExtension:@"plist"];
  }
  else
  {
    id v11 = a3;
    id v8 = [v11 URLByAppendingPathComponent:a4];

    id v10 = [v8 URLByAppendingPathExtension:@"plist"];
  }

  return v10;
}

+ (id)journalURLForBaseURL:(id)a3 name:(id)a4 journalType:(id)a5
{
  id v7 = NSString;
  id v8 = a3;
  id v9 = [v7 stringWithFormat:@"%@-%@", a4, a5];
  id v10 = [v8 URLByAppendingPathComponent:v9];

  id v11 = [v10 URLByAppendingPathExtension:@"plj"];

  return v11;
}

@end