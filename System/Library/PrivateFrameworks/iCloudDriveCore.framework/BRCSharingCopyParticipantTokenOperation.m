@interface BRCSharingCopyParticipantTokenOperation
- (BRCSharingCopyParticipantTokenOperation)initWithItem:(id)a3 sessionContext:(id)a4;
- (id)createActivity;
- (void)_completeWithResult:(id)a3 participantKey:(id)a4;
- (void)_fetchBaseTokenWithCompletion:(id)a3;
- (void)_fetchParticipantDocumentTokenWithCompletion:(id)a3;
- (void)_fetchParticipantKeyWithCompletion:(id)a3;
- (void)main;
@end

@implementation BRCSharingCopyParticipantTokenOperation

- (BRCSharingCopyParticipantTokenOperation)initWithItem:(id)a3 sessionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 itemID];
  v9 = [v8 debugItemIDString];
  v10 = [@"sharing/copyParticipantToken" stringByAppendingPathComponent:v9];

  v11 = [v6 serverZone];
  v12 = [v11 metadataSyncContext];
  v23.receiver = self;
  v23.super_class = (Class)BRCSharingCopyParticipantTokenOperation;
  v13 = [(_BRCOperation *)&v23 initWithName:v10 syncContext:v12 sessionContext:v7];

  if (v13)
  {
    v14 = [v6 st];
    v13->_iWorkShareable = [v14 iWorkShareable];

    uint64_t v15 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v6);
    shareID = v13->_shareID;
    v13->_shareID = (CKRecordID *)v15;

    if (!v13->_shareID)
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[BRCSharingCopyParticipantTokenOperation initWithItem:sessionContext:]();
      }
    }
    uint64_t v17 = [v6 documentRecordID];
    contentRecordID = v13->_contentRecordID;
    v13->_contentRecordID = (CKRecordID *)v17;

    if (([v6 sharingOptions] & 4) == 0 && (objc_msgSend(v6, "sharingOptions") & 0x48) != 0) {
      v13->_isChildOfShare = 1;
    }
    [(_BRCOperation *)v13 setNonDiscretionary:1];
    v19 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
    [(_BRCOperation *)v13 setGroup:v19];
  }
  return v13;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing/copyParticipantToken", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_fetchBaseTokenWithCompletion:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (self->_iWorkShareable && !self->_isChildOfShare)
  {
    id v6 = objc_alloc(MEMORY[0x263EFD6D8]);
    v13[0] = self->_contentRecordID;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v8 = (void *)[v6 initWithRecordIDs:v7];

    uint64_t v12 = *MEMORY[0x263EFD598];
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    [v8 setDesiredKeys:v9];

    [v8 setShouldFetchAssetContent:0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __73__BRCSharingCopyParticipantTokenOperation__fetchBaseTokenWithCompletion___block_invoke;
    v10[3] = &unk_2650831A0;
    v10[4] = self;
    id v11 = v5;
    [v8 setFetchRecordsCompletionBlock:v10];
    [(_BRCOperation *)self addSubOperation:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __73__BRCSharingCopyParticipantTokenOperation__fetchBaseTokenWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 528)];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263EFD598]];
  if (v7)
  {
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = [v6 baseToken];
    if (!(v5 | v8))
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        __73__BRCSharingCopyParticipantTokenOperation__fetchBaseTokenWithCompletion___block_invoke_cold_1();
      }

      uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: No base token so the share token we would return would be invalid for iwork");
      uint64_t v8 = 0;
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = objc_msgSend((id)v5, "brc_cloudKitErrorForRecordID:", *(void *)(*(void *)(a1 + 32) + 528));
  (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v8, v12);
}

- (void)_fetchParticipantKeyWithCompletion:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFD6F0]);
  v20[0] = self->_shareID;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  uint64_t v7 = (void *)[v5 initWithShareIDs:v6];

  baseToken = self->_baseToken;
  if (baseToken)
  {
    shareID = self->_shareID;
    v19 = baseToken;
    v9 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&shareID count:1];
    [v7 setBaseTokensByShareID:v9];
  }
  if (self->_isChildOfShare)
  {
    contentRecordID = self->_contentRecordID;
    v16 = self->_shareID;
    uint64_t v17 = contentRecordID;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v7 setChildRecordIDsByShareID:v11];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke;
  v15[3] = &unk_2650855C0;
  v15[4] = self;
  [v7 setShareParticipantKeyFetchedBlock:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke_2;
  v13[3] = &unk_265080B38;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v7 setShareParticipantKeyCompletionBlock:v13];
  [(_BRCOperation *)self addSubOperation:v7];
}

void __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 544);
  *(void *)(v8 + 544) = v6;
  id v12 = v6;

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 560);
  *(void *)(v10 + 560) = v7;
}

void __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
LABEL_2:
    id v4 = v3;
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 560) && !*(void *)(v5 + 544))
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke_2_cold_1();
    }

    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no error and no participantKey");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_2;
  }
  id v4 = 0;
LABEL_6:
  if (*(void *)(*(void *)(a1 + 32) + 560)) {
    id v6 = *(void **)(*(void *)(a1 + 32) + 560);
  }
  else {
    id v6 = v4;
  }
  (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6);
}

- (void)_fetchParticipantDocumentTokenWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"participantKey", self->_participantKey];
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFD7B0]) initWithRecordType:@"FetchParticipantDocumentToken" predicate:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFD7C0]) initWithQuery:v6];
  uint64_t v8 = [(CKRecordID *)self->_shareID zoneID];
  [v7 setZoneID:v8];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke;
  v13[3] = &unk_2650855E8;
  v13[4] = self;
  [v7 setRecordMatchedBlock:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke_2;
  v10[3] = &unk_265083B50;
  id v11 = v4;
  id v12 = v7;
  v10[4] = self;
  id v9 = v4;
  [v7 setQueryCompletionBlock:v10];
  [(_BRCOperation *)self addSubOperation:v7];
}

void __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = v8;
    id v12 = *(void **)(v10 + 560);
    *(void *)(v10 + 560) = v11;
  }
  else
  {
    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v13 = [v7 objectForKeyedSubscript:@"participantDocumentToken"];
    uint64_t v14 = *(void *)(a1 + 32);
    id v12 = *(void **)(v14 + 536);
    *(void *)(v14 + 536) = v13;
  }

LABEL_6:
}

void __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSharingCopyParticipantTokenOperation _fetchParticipantDocumentTokenWithCompletion:]_block_invoke_2", 900, v15);
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[6];
    id v12 = @"success";
    if (v6) {
      id v12 = v6;
    }
    *(_DWORD *)buf = 134218754;
    uint64_t v17 = v15[0];
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    v21 = v12;
    __int16 v22 = 2112;
    objc_super v23 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx handling result of %@: %@%@", buf, 0x2Au);
  }

  if (!v6)
  {
    uint64_t v9 = a1[4];
    if (*(void *)(v9 + 560) || *(void *)(v9 + 536))
    {
      id v6 = 0;
    }
    else
    {
      uint64_t v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke_2_cold_1();
      }

      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no error and no participantDocumentToken");
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (*(void *)(a1[4] + 560)) {
    uint64_t v10 = *(__CFString **)(a1[4] + 560);
  }
  else {
    uint64_t v10 = v6;
  }
  (*(void (**)(void, __CFString *))(a1[5] + 16))(a1[5], v10);
  __brc_leave_section(v15);
}

- (void)_completeWithResult:(id)a3 participantKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = v7;
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:@"participantKey"];
  }
  if (v9) {
    [v8 setObject:v9 forKeyedSubscript:@"baseToken"];
  }
  [(_BRCOperation *)self completedWithResult:v8 error:0];
}

- (void)main
{
  if (self->_shareID)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke;
    v4[3] = &unk_265084440;
    v4[4] = self;
    [(BRCSharingCopyParticipantTokenOperation *)self _fetchBaseTokenWithCompletion:v4];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"shareID", 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(_BRCOperation *)self completedWithResult:0 error:v3];
  }
}

void __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v7 = *(id **)(a1 + 32);
  if (a3)
  {
    [v7 completedWithResult:0 error:a3];
  }
  else
  {
    objc_storeStrong(v7 + 69, a2);
    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke_2;
    v9[3] = &unk_26507EBD8;
    v9[4] = v8;
    [v8 _fetchParticipantKeyWithCompletion:v9];
  }
}

uint64_t __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  os_activity_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    return [v2 completedWithResult:0 error:a2];
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke_3;
    v4[3] = &unk_26507EBD8;
    v4[4] = v2;
    return [v2 _fetchParticipantDocumentTokenWithCompletion:v4];
  }
}

void __47__BRCSharingCopyParticipantTokenOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCSharingCopyParticipantTokenOperation main]_block_invoke_3", 947, &v10);
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 520);
      *(_DWORD *)buf = 134218754;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      __int16 v19 = 2112;
      __int16 v20 = v4;
      _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Failed to get participantDocumentToken for item: %@ with error %@%@", buf, 0x2Au);
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v3];
    __brc_leave_section(&v10);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCSharingCopyParticipantTokenOperation main]_block_invoke", 951, &v10);
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 520);
      *(_DWORD *)buf = 134218498;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Succeed to get participantDocumentToken. item: %@%@", buf, 0x20u);
    }

    [*(id *)(a1 + 32) _completeWithResult:*(void *)(*(void *)(a1 + 32) + 552) participantKey:*(void *)(*(void *)(a1 + 32) + 536)];
    __brc_leave_section(&v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_participantKey, 0);
  objc_storeStrong((id *)&self->_participantDocumentToken, 0);
  objc_storeStrong((id *)&self->_contentRecordID, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
}

- (void)initWithItem:sessionContext:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Can't fetch shareID for item %@%@");
}

void __73__BRCSharingCopyParticipantTokenOperation__fetchBaseTokenWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: No base token so the share token we would return would be invalid for iwork%@", v2, v3, v4, v5, v6);
}

void __78__BRCSharingCopyParticipantTokenOperation__fetchParticipantKeyWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no error and no participantKey%@", v2, v3, v4, v5, v6);
}

void __88__BRCSharingCopyParticipantTokenOperation__fetchParticipantDocumentTokenWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no error and no participantDocumentToken%@", v2, v3, v4, v5, v6);
}

@end