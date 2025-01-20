@interface WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor
+ (id)_correctionsSchema;
+ (id)_schemaWithExpectedClass:(Class)a3 errorCode:(int64_t)a4 isOptional:(BOOL)a5;
- (WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor)initWithCorrectionsStore:(id)a3;
- (void)getLastCorrectionsRetrievalURLStringWithResultHandler:(id)a3;
- (void)setCorrectionsWithJSONData:(id)a3 retrievalURLString:(id)a4;
@end

@implementation WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor

+ (id)_correctionsSchema
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v19 = [a1 _schemaWithExpectedClass:objc_opt_class() errorCode:2 isOptional:1];
  v18 = [a1 _schemaWithExpectedClass:objc_opt_class() errorCode:1 isOptional:0];
  v26[0] = @"version";
  v3 = [a1 _schemaWithExpectedClass:objc_opt_class() errorCode:3 isOptional:0];
  v27[0] = v3;
  v26[1] = @"origins";
  v24[0] = @"origin";
  v24[1] = @"corrections";
  v25[0] = v19;
  v22[1] = @"corrections";
  v23[0] = v18;
  v22[0] = @"fingerprint";
  v4 = +[WBSParsecSchema schemaWithExpectedClass:objc_opt_class()];
  v23[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v6 = +[WBSParsecSchema schemaForDictionaryWithStructure:v5];
  v7 = +[WBSParsecSchema schemaForArrayWithElementSchema:v6];
  v25[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v9 = +[WBSParsecSchema schemaForDictionaryWithStructure:v8];
  v10 = +[WBSParsecSchema schemaForArrayWithElementSchema:v9];
  v27[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  v20 = @"correction_sets";
  v12 = +[WBSParsecSchema schemaForDictionaryWithStructure:v11];
  v13 = +[WBSParsecSchema schemaForArrayWithElementSchema:v12];
  v21 = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SafariShared.FormAutoFillParsecCrowdsourcedCorrectionsErrorDomain" code:4 userInfo:0];
  v16 = +[WBSParsecSchema schemaForDictionaryWithStructure:v14 associatedError:v15];

  return v16;
}

+ (id)_schemaWithExpectedClass:(Class)a3 errorCode:(int64_t)a4 isOptional:(BOOL)a5
{
  BOOL v5 = a5;
  v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SafariShared.FormAutoFillParsecCrowdsourcedCorrectionsErrorDomain" code:a4 userInfo:0];
  v8 = +[WBSParsecSchema schemaWithExpectedClass:a3 associatedError:v7 isOptional:v5];

  return v8;
}

- (WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor)initWithCorrectionsStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor;
  v6 = [(WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_correctionsStore, a3);
    v8 = v7;
  }

  return v7;
}

- (void)getLastCorrectionsRetrievalURLStringWithResultHandler:(id)a3
{
  id v4 = a3;
  correctionsStore = self->_correctionsStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_getLastCorrectionsRetrievalURLStringWithResultHandler___block_invoke;
  v7[3] = &unk_1E5C9B218;
  id v8 = v4;
  id v6 = v4;
  [(WBSFormAutoFillCorrectionsStore *)correctionsStore getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler:v7];
}

void __111__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_getLastCorrectionsRetrievalURLStringWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_getLastCorrectionsRetrievalURLStringWithResultHandler___block_invoke_2;
  v6[3] = &unk_1E5C8DDF0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __111__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_getLastCorrectionsRetrievalURLStringWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setCorrectionsWithJSONData:(id)a3 retrievalURLString:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor setCorrectionsWithJSONData:retrievalURLString:](buf, [v6 length], v8);
  }

  v9 = (void *)[v6 copy];
  objc_super v10 = (void *)[v7 copy];
  v11 = [(id)objc_opt_class() _correctionsSchema];
  correctionsStore = self->_correctionsStore;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke;
  v16[3] = &unk_1E5C9B290;
  objc_copyWeak(&v20, &location);
  id v13 = v10;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v11;
  id v19 = v15;
  [(WBSFormAutoFillCorrectionsStore *)correctionsStore getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained && a1[4] != v3 && (objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    id v5 = dispatch_get_global_queue(-32768, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2;
    v6[3] = &unk_1E5C9B268;
    objc_copyWeak(&v10, a1 + 7);
    id v7 = a1[5];
    id v8 = a1[6];
    id v9 = a1[4];
    dispatch_async(v5, v6);

    objc_destroyWeak(&v10);
  }
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v25 = a1;
    uint64_t v2 = *(void *)(a1 + 32);
    id v50 = 0;
    v28 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v2 options:0 error:&v50];
    id v26 = v50;
    if (v26)
    {
      id v3 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_3(v3, v26);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      char v49 = 1;
      id v4 = *(void **)(v25 + 40);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_26;
      v43[3] = &unk_1E5C9B240;
      id v5 = v28;
      id v44 = v5;
      v45 = &v46;
      [v4 validateObject:v5 withErrorHandler:v43];
      if (*((unsigned char *)v47 + 24))
      {
        v24 = [v5 objectForKeyedSubscript:@"correction_sets"];
        if ([v24 count] == 1)
        {
          id v23 = WeakRetained[1];
          id v6 = objc_alloc_init(WBSFormAutoFillClassificationToCorrectionsTransformer);
          id v7 = [v24 objectAtIndexedSubscript:0];
          id v8 = [v7 objectForKeyedSubscript:@"origins"];

          v31 = [MEMORY[0x1E4F1CA48] array];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          obuint64_t j = v8;
          uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
          if (v32)
          {
            uint64_t v30 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v40 != v30) {
                  objc_enumerationMutation(obj);
                }
                id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                v33 = objc_msgSend(v9, "objectForKeyedSubscript:", @"origin", v23);
                id v10 = [v9 objectForKeyedSubscript:@"corrections"];
                v11 = [MEMORY[0x1E4F1CA60] dictionary];
                long long v37 = 0u;
                long long v38 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                id v12 = v10;
                uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v51 count:16];
                if (v13)
                {
                  uint64_t v14 = *(void *)v36;
                  do
                  {
                    for (uint64_t j = 0; j != v13; ++j)
                    {
                      if (*(void *)v36 != v14) {
                        objc_enumerationMutation(v12);
                      }
                      v16 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                      id v17 = [v16 objectForKeyedSubscript:@"fingerprint"];
                      id v18 = [v16 objectForKeyedSubscript:@"corrections"];
                      id v19 = [(WBSFormAutoFillClassificationToCorrectionsTransformer *)v6 reverseTransformedValue:v18];

                      [v11 setObject:v19 forKeyedSubscript:v17];
                    }
                    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v51 count:16];
                  }
                  while (v13);
                }

                id v20 = [[WBSFormAutoFillCorrectionSet alloc] initWithDomain:v33 fingerprintsToClassifications:v11];
                [v31 addObject:v20];
              }
              uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
            }
            while (v32);
          }

          [v23 replaceCrowdsourcedCorrectionSetsWithCorrectionSets:v31 retrievalURLString:*(void *)(v25 + 48) completionHandler:0];
        }
        else
        {
          v22 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_1(v22);
          }
        }
      }
      _Block_object_dispose(&v46, 8);
    }
    else
    {
      v21 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_2((uint64_t)v28, v21);
      }
    }
  }
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_26_cold_1(v4, v3, a1);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

- (void).cxx_destruct
{
}

- (void)setCorrectionsWithJSONData:(os_log_t)log retrievalURLString:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Setting cloud AutoFill corrections with JSON data of length %lu", buf, 0xCu);
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Versions count is not 1 in correctionsDictionary", v1, 2u);
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Corrections JSON data is not of kind dictionary: %{private}@", (uint8_t *)&v2, 0xCu);
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_3(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "JSON deserialization failed with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_26_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = a1;
  id v6 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  uint64_t v7 = *(void *)(a3 + 32);
  int v8 = 138543619;
  id v9 = v6;
  __int16 v10 = 2113;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to validate cloud AutoFill corrections: %{public}@, %{private}@", (uint8_t *)&v8, 0x16u);
}

@end