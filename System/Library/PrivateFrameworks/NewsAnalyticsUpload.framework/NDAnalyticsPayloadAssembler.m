@interface NDAnalyticsPayloadAssembler
- (NDAnalyticsPayloadAssembler)init;
- (NDAnalyticsPayloadAssembler)initWithConfigProvider:(id)a3 maxPayloadSize:(unint64_t)a4;
- (NDAnalyticsPayloadAssemblerConfigProvider)configProvider;
- (unint64_t)maxPayloadSize;
- (void)_fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:(id)a3;
- (void)assemblePayloadsWithEntries:(id)a3 lastUploadDatesByContentType:(id)a4 droppedEnvelopeReasonsToUpload:(id)a5 envelopeSizeByEntry:(id)a6 completion:(id)a7;
- (void)determinePayloadDeliveryWindowForEntries:(id)a3 withLastUploadDatesByContentType:(id)a4 completion:(id)a5;
- (void)setConfigProvider:(id)a3;
- (void)setMaxPayloadSize:(unint64_t)a3;
@end

@implementation NDAnalyticsPayloadAssembler

- (NDAnalyticsPayloadAssembler)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAnalyticsPayloadAssembler init]";
    __int16 v9 = 2080;
    v10 = "NDAnalyticsPayloadAssembler.m";
    __int16 v11 = 1024;
    int v12 = 38;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_21FDD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NDAnalyticsPayloadAssembler init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NDAnalyticsPayloadAssembler)initWithConfigProvider:(id)a3 maxPayloadSize:(unint64_t)a4
{
  id v7 = a3;
  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadAssembler initWithConfigProvider:maxPayloadSize:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)NDAnalyticsPayloadAssembler;
  v8 = [(NDAnalyticsPayloadAssembler *)&v11 init];
  __int16 v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configProvider, a3);
    v9->_maxPayloadSize = a4;
  }

  return v9;
}

- (void)determinePayloadDeliveryWindowForEntries:(id)a3 withLastUploadDatesByContentType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsPayloadAssembler determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadAssembler determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:]();
  }
LABEL_6:
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadAssembler determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:]();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __116__NDAnalyticsPayloadAssembler_determinePayloadDeliveryWindowForEntries_withLastUploadDatesByContentType_completion___block_invoke;
  v14[3] = &unk_264538BA8;
  id v16 = v9;
  id v17 = v10;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(NDAnalyticsPayloadAssembler *)self _fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:v14];
}

void __116__NDAnalyticsPayloadAssembler_determinePayloadDeliveryWindowForEntries_withLastUploadDatesByContentType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v21 = a2;
  id v6 = a4;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "envelopeContentType"));
          v14 = [v7 objectForKeyedSubscript:v13];
          id v15 = [v12 envelopeSubmissionDate];
          id v16 = v15;
          if (v14)
          {
            id v17 = [v14 earlierDate:v15];
          }
          else
          {
            id v17 = v15;
          }
          v18 = v17;
          [v7 setObject:v17 forKeyedSubscript:v13];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v9);
    }

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__1;
    v37 = __Block_byref_object_dispose__1;
    id v38 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__1;
    v31 = __Block_byref_object_dispose__1;
    id v32 = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __116__NDAnalyticsPayloadAssembler_determinePayloadDeliveryWindowForEntries_withLastUploadDatesByContentType_completion___block_invoke_18;
    v22[3] = &unk_264538B80;
    id v23 = v21;
    id v24 = *(id *)(a1 + 40);
    v25 = &v33;
    v26 = &v27;
    [v7 enumerateKeysAndObjectsUsingBlock:v22];
    uint64_t v19 = v34[5];
    if (v19)
    {
      v20 = [MEMORY[0x263F59410] dateRangeWithEarlierDate:v19 laterDate:v28[5]];
    }
    else
    {
      v20 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    id v6 = 0;
  }
}

void __116__NDAnalyticsPayloadAssembler_determinePayloadDeliveryWindowForEntries_withLastUploadDatesByContentType_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v17];
  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v17];
    id v8 = NDAnalyticsEntryDeliveryWindow(v5, v7, v6);
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = [v8 earlierDate];
    id v11 = (void *)v10;
    if (v9)
    {
      id v12 = [v9 earlierDate:v10];
    }
    else
    {
      id v12 = (void *)v10;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
    if (v9) {

    }
    id v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v14 = [v8 laterDate];
    id v15 = (void *)v14;
    if (v13)
    {
      id v16 = [v13 earlierDate:v14];
    }
    else
    {
      id v16 = (void *)v14;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v16);
    if (v13) {
  }
    }
}

- (void)assemblePayloadsWithEntries:(id)a3 lastUploadDatesByContentType:(id)a4 droppedEnvelopeReasonsToUpload:(id)a5 envelopeSizeByEntry:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:].cold.6();
    if (v13) {
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:].cold.5();
  }
LABEL_6:
  if (!v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:].cold.4();
  }
  if ([v14 containsObject:&unk_26D195DA8]
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:]();
    if (v15) {
      goto LABEL_14;
    }
  }
  else if (v15)
  {
    goto LABEL_14;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:]();
  }
LABEL_14:
  if (!v16 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadAssembler assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:]();
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke;
  v22[3] = &unk_264538D48;
  id v23 = v14;
  id v24 = v12;
  id v25 = v13;
  v26 = self;
  id v27 = v15;
  id v28 = v16;
  id v17 = v15;
  id v18 = v13;
  id v19 = v16;
  id v20 = v12;
  id v21 = v14;
  [(NDAnalyticsPayloadAssembler *)self _fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:v22];
}

void __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  v63[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    if ([*(id *)(a1 + 32) containsObject:&unk_26D195DA8])
    {
      uint64_t v9 = (void *)MEMORY[0x263EFFA78];
    }
    else
    {
      uint64_t v34 = *(void *)(a1 + 40);
      v62 = &unk_26D195DA8;
      v63[0] = v34;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v63 forKeys:&v62 count:1];
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    id v11 = *(void **)(a1 + 40);
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_2;
    v58[3] = &unk_264538BD0;
    id v40 = v7;
    id v12 = v7;
    id v59 = v12;
    id v37 = v10;
    id v60 = v37;
    id v61 = *(id *)(a1 + 48);
    long long v39 = objc_msgSend(v11, "fc_arrayOfObjectsPassingTest:", v58);
    id v13 = objc_msgSend(v39, "fc_dictionaryOfSortedObjectsWithKeyBlock:", &__block_literal_global_3);
    id v14 = objc_opt_new();
    id v15 = [v13 allKeys];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_4;
    v56[3] = &unk_264538BF8;
    id v16 = v12;
    id v57 = v16;
    id v17 = objc_msgSend(v15, "fc_setOfObjectsPassingTest:", v56);

    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_5;
    v54[3] = &unk_264538C20;
    id v18 = v13;
    id v55 = v18;
    id v38 = v17;
    id v19 = objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", v54);
    id v20 = objc_msgSend(v19, "fc_arrayByFlattening");

    if ([v20 count])
    {
      id v21 = (void *)[v20 mutableCopy];
      [v14 setObject:v21 forKeyedSubscript:&unk_26D195DA8];
    }
    v22 = objc_opt_new();
    id v23 = objc_opt_new();
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_6;
    v50[3] = &unk_264538C48;
    id v51 = v18;
    id v52 = v22;
    id v24 = v23;
    id v53 = v24;
    id v25 = v22;
    id v36 = v18;
    [v16 enumerateKeysAndObjectsUsingBlock:v50];
    v26 = objc_opt_new();
    unint64_t v27 = [*(id *)(a1 + 56) maxPayloadSize];
    if (v27 >= a3) {
      unint64_t v28 = a3;
    }
    else {
      unint64_t v28 = v27;
    }
    uint64_t v29 = FCDeviceIdentifierForVendor();
    uint64_t v35 = v20;
    unint64_t v30 = [v29 hash] % 0x64uLL;

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_7;
    v41[3] = &unk_264538D20;
    id v42 = v24;
    id v43 = *(id *)(a1 + 32);
    id v44 = v14;
    id v45 = v16;
    unint64_t v48 = v30;
    unint64_t v49 = v28;
    id v46 = *(id *)(a1 + 64);
    id v47 = v26;
    id v31 = v26;
    id v32 = v14;
    id v33 = v24;
    [v25 enumerateKeysAndObjectsUsingBlock:v41];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

    id v7 = v40;
    uint64_t v9 = v37;
  }
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "envelopeContentType"));
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = [v3 envelopeSubmissionDate];
    id v7 = *(void **)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    uint64_t CanBeUploaded = NDAnalyticsEntryCanBeUploaded(v6, v7, v8, v5);
  }
  else
  {
    uint64_t CanBeUploaded = 1;
  }

  return CanBeUploaded;
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 envelopeContentType];

  return [v2 numberWithInt:v3];
}

BOOL __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_6(id *a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = [a1[4] objectForKeyedSubscript:v15];

  if (v6)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "groupingTag"));
    id v8 = [a1[5] objectForKeyedSubscript:v7];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = (id)objc_opt_new();
      [a1[5] setObject:v10 forKeyedSubscript:v7];
    }

    id v11 = [a1[4] objectForKeyedSubscript:v15];
    [v10 addObjectsFromArray:v11];

    id v12 = NSURL;
    id v13 = [v5 endpointURLString];
    id v14 = [v12 URLWithString:v13];

    [a1[6] setObject:v14 forKeyedSubscript:v7];
  }
}

void __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v53 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v6 = objc_opt_new();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_8;
  aBlock[3] = &unk_264538C70;
  id v65 = *(id *)(a1 + 40);
  id v7 = v6;
  id v66 = v7;
  id v67 = *(id *)(a1 + 48);
  id v8 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_9;
  v61[3] = &unk_264538C98;
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 80);
  id v62 = v9;
  uint64_t v63 = v10;
  id v11 = objc_msgSend(v5, "fc_dictionaryOfSortedObjectsWithKeyBlock:", v61);
  id v12 = [v11 objectForKeyedSubscript:MEMORY[0x263EFFA80]];
  v8[2](v8, 2, v12);

  uint64_t v13 = [v11 objectForKeyedSubscript:MEMORY[0x263EFFA88]];
  id v14 = (void *)v13;
  id v15 = (void *)MEMORY[0x263EFFA68];
  if (v13) {
    id v15 = (void *)v13;
  }
  id v16 = v15;

  id v52 = v16;
  id v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_38];
  id v18 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
  id v60 = 0;
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_11;
  v58[3] = &unk_264538A48;
  id v59 = *(id *)(a1 + 64);
  id v19 = objc_msgSend(v17, "fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:accumulator:comparator:", v18, &v60, v58, &__block_literal_global_41, &__block_literal_global_44);
  id v20 = v60;

  v50 = v20;
  id v51 = v17;
  id v21 = [v17 objectsAtIndexes:v20];
  v8[2](v8, 1, v21);

  unint64_t v49 = v19;
  v22 = [v19 firstObject];
  if ([v22 count])
  {
    id v44 = v11;
    id v45 = v8;
    id v47 = v7;
    id v48 = v5;
    id v23 = (void *)MEMORY[0x263EFFA08];
    id v43 = v22;
    id v24 = NDAnalyticsEnvelopeContentTypesFromEntries(v22);
    id v25 = [v23 setWithArray:v24];

    v26 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v46 = a1;
    unint64_t v27 = *(void **)(a1 + 56);
    id v42 = v25;
    unint64_t v28 = [v25 allObjects];
    uint64_t v29 = objc_msgSend(v27, "nf_objectsForKeysWithoutMarker:", v28);

    uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v55 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v35 = [v34 contentHeaderName];
          if (v35)
          {
            id v36 = [v26 objectForKeyedSubscript:v35];
            id v37 = v36;
            if (v36)
            {
              id v38 = v36;
            }
            else
            {
              id v38 = (id)objc_opt_new();
              [v26 setObject:v38 forKeyedSubscript:v35];
            }

            long long v39 = [v34 contentHeaderValue];
            [v38 addObject:v39];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v54 objects:v68 count:16];
      }
      while (v31);
    }

    id v40 = objc_opt_new();
    long long v41 = (void *)v53;
    [v40 setEndpointURL:v53];
    [v40 setValuesByHTTPHeaderField:v26];
    v22 = v43;
    [v40 setEntriesToUpload:v43];

    id v7 = v47;
    id v5 = v48;
    if (![v47 count])
    {
      id v8 = v45;
      a1 = v46;
      id v11 = v44;
      if (!v40) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    id v8 = v45;
    a1 = v46;
    id v11 = v44;
    if (v40)
    {
      [v40 setDroppedEntriesByReason:v47];
LABEL_21:
      [*(id *)(a1 + 72) addObject:v40];

      goto LABEL_22;
    }
  }
  else
  {
    long long v41 = (void *)v53;
    if (![v7 count]) {
      goto LABEL_22;
    }
  }
  id v40 = objc_opt_new();
  [v40 setEndpointURL:v41];
  [v40 setEntriesToUpload:MEMORY[0x263EFFA68]];
  [v40 setDroppedEntriesByReason:v7];
  if (v40) {
    goto LABEL_21;
  }
LABEL_22:
}

void __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  if ([v12 count])
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a2];
    int v6 = [*(id *)(a1 + 32) containsObject:v5];
    uint64_t v7 = 48;
    if (v6) {
      uint64_t v7 = 40;
    }
    id v8 = *(id *)(a1 + v7);
    id v9 = [v8 objectForKeyedSubscript:v5];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = (id)objc_opt_new();
      [v8 setObject:v11 forKeyedSubscript:v5];
    }

    [v11 addObjectsFromArray:v12];
  }
}

id __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_9(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "envelopeContentType"));
  id v5 = [v3 objectForKeyedSubscript:v4];

  int v6 = NSNumber;
  unint64_t v7 = *(void *)(a1 + 40);
  if (v7 >= [v5 samplingFloor])
  {
    unint64_t v9 = *(void *)(a1 + 40);
    BOOL v8 = v9 < [v5 samplingCeiling];
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v10 = [v6 numberWithInt:v8];

  return v10;
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 envelopeSubmissionDate];
  int v6 = [v4 envelopeSubmissionDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  uint64_t v7 = [v5 unsignedIntegerValue];

  return [v4 numberWithUnsignedInteger:v7 + v6];
}

uint64_t __150__NDAnalyticsPayloadAssembler_assemblePayloadsWithEntries_lastUploadDatesByContentType_droppedEnvelopeReasonsToUpload_envelopeSizeByEntry_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 unsignedIntegerValue];
  unint64_t v6 = [v4 unsignedIntegerValue];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (void)_fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsPayloadAssembler _fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:]();
  }
  unint64_t v5 = [(NDAnalyticsPayloadAssembler *)self configProvider];
  [v5 fetchConfigWithCompletion:v4];
}

- (NDAnalyticsPayloadAssemblerConfigProvider)configProvider
{
  return self->_configProvider;
}

- (void)setConfigProvider:(id)a3
{
}

- (unint64_t)maxPayloadSize
{
  return self->_maxPayloadSize;
}

- (void)setMaxPayloadSize:(unint64_t)a3
{
  self->_maxPayloadSize = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithConfigProvider:maxPayloadSize:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configProvider", v6, 2u);
}

- (void)determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastUploadDatesByContentType", v6, 2u);
}

- (void)determinePayloadDeliveryWindowForEntries:withLastUploadDatesByContentType:completion:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeSizeByEntry", v6, 2u);
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![droppedEnvelopeReasonsToUpload containsObject:@(NDAnalyticsPayloadAssemblerDroppedEnvelopeReasonMissingConfigForContentType)]", v6, 2u);
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"droppedEnvelopeReasonsToUpload", v6, 2u);
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastUploadDatesByContentType", v6, 2u);
}

- (void)assemblePayloadsWithEntries:lastUploadDatesByContentType:droppedEnvelopeReasonsToUpload:envelopeSizeByEntry:completion:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);
}

- (void)_fetchAnalyticsEnvelopeContentTypeConfigsWithCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

@end