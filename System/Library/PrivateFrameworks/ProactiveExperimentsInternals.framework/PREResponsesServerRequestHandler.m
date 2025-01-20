@interface PREResponsesServerRequestHandler
- (NSString)clientProcessName;
- (_PASBundleIdResolver)bundleIdResolver;
- (id)preResponseItemArrayFromQuickResponses:(id)a3;
- (void)preResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationTurns:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 recipientHandles:(id)a9 modelFilePath:(id)a10 modelConfigPath:(id)a11 espressoBinFilePath:(id)a12 vocabFilePath:(id)a13 registerDisplayed:(BOOL)a14 includeCustomResponses:(BOOL)a15 includeResponsesToRobots:(BOOL)a16 completion:(id)a17;
- (void)predictForMessage:(id)a3 conversationTurns:(id)a4 language:(id)a5 plistPath:(id)a6 espressoBinPath:(id)a7 vocabPath:(id)a8 heads:(id)a9 completion:(id)a10;
- (void)registerResponse:(id)a3 position:(id)a4 isCanned:(BOOL)a5 isUsingQuickResponses:(BOOL)a6 locale:(id)a7 modelConfigPath:(id)a8 vocabPath:(id)a9;
- (void)setBundleIdResolver:(id)a3;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
@end

@implementation PREResponsesServerRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

- (void)setBundleIdResolver:(id)a3
{
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setClientProcessName:(id)a3
{
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)registerResponse:(id)a3 position:(id)a4 isCanned:(BOOL)a5 isUsingQuickResponses:(BOOL)a6 locale:(id)a7 modelConfigPath:(id)a8 vocabPath:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  v20 = pre_sv_responses_handle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235566000, v20, OS_LOG_TYPE_DEFAULT, "PREInternal - Server registerResponse called", buf, 2u);
  }

  [MEMORY[0x263F382C8] registerResponse:v19 position:v18 isCanned:v12 isUsingQuickResponses:v11 locale:v17 plistPath:v16 vocabPath:v15];
}

- (id)preResponseItemArrayFromQuickResponses:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v26 = *(void *)v28;
    id v19 = v4;
    do
    {
      uint64_t v7 = 0;
      uint64_t v21 = v6;
      do
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [v8 proactiveTrigger];

          if (v9)
          {
            v10 = pre_sv_responses_handle();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            {
              BOOL v11 = [v8 proactiveTrigger];
              *(_DWORD *)buf = 138412290;
              v32 = v11;
              _os_log_fault_impl(&dword_235566000, v10, OS_LOG_TYPE_FAULT, "PREInternal - Unexpected proactive trigger received %@", buf, 0xCu);
            }
          }
          else
          {
            id v12 = objc_alloc(MEMORY[0x263F618B0]);
            v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "categoryId"));
            v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "modelId"));
            v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "semanticClassId"));
            v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "styleGroupId"));
            v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "replyTextId"));
            v14 = [v8 text];
            id v15 = [v8 lang];
            id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isCustomResponse"));
            id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isRobotResponse"));
            v10 = [v12 initWithCategoryId:v13 modelId:v25 responseClassId:v24 replySubgroupId:v22 replyTextId:v23 replyText:v14 language:v15 isCustomResponse:v16 isRobotResponse:v17];

            uint64_t v6 = v21;
            id v4 = v19;

            [v20 addObject:v10];
          }
        }
        else
        {
          v10 = pre_sv_responses_handle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_235566000, v10, OS_LOG_TYPE_FAULT, "PREInternal - Unexpected type received when expecting SGQuickResponse", buf, 2u);
          }
        }

        ++v7;
      }
      while (v6 != v7);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }

  return v20;
}

- (void)predictForMessage:(id)a3 conversationTurns:(id)a4 language:(id)a5 plistPath:(id)a6 espressoBinPath:(id)a7 vocabPath:(id)a8 heads:(id)a9 completion:(id)a10
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v29 = a4;
  id v30 = a5;
  id v31 = a6;
  id v32 = a7;
  id v33 = a8;
  id v34 = a9;
  long long v27 = (void (**)(id, void *, void))a10;
  id v15 = pre_sv_responses_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235566000, v15, OS_LOG_TYPE_DEFAULT, "PREInternal - Server predictForMessage called", buf, 2u);
  }

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  id v16 = (void *)getSGMultiHeadInferenceClass_softClass;
  uint64_t v47 = getSGMultiHeadInferenceClass_softClass;
  if (!getSGMultiHeadInferenceClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getSGMultiHeadInferenceClass_block_invoke;
    v42 = &unk_264C5C720;
    v43 = &v44;
    __getSGMultiHeadInferenceClass_block_invoke((uint64_t)buf);
    id v16 = (void *)v45[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v44, 8);
  id v18 = [v17 predictForMessage:v28 conversationTurns:v29 localeIdentifier:v30 plistPath:v31 espressoBinPath:v32 vocabPath:v33 heads:v34];
  if (v18)
  {
    id v19 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v25 = [v20 objectForKeyedSubscript:v24];
          uint64_t v26 = objc_msgSend(v25, "_pas_mappedArrayWithTransform:", &__block_literal_global_89);
          [v19 setObject:v26 forKeyedSubscript:v24];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v48 count:16];
      }
      while (v21);
    }

    v27[2](v27, v19, 0);
  }
  else
  {
    v27[2](v27, 0, 0);
  }
}

id __134__PREResponsesServerRequestHandler_predictForMessage_conversationTurns_language_plistPath_espressoBinPath_vocabPath_heads_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F618A8];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 score];
  uint64_t v6 = [v3 label];

  uint64_t v7 = (void *)[v4 initWithScore:v5 label:v6];
  return v7;
}

- (void)preResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationTurns:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 recipientHandles:(id)a9 modelFilePath:(id)a10 modelConfigPath:(id)a11 espressoBinFilePath:(id)a12 vocabFilePath:(id)a13 registerDisplayed:(BOOL)a14 includeCustomResponses:(BOOL)a15 includeResponsesToRobots:(BOOL)a16 completion:(id)a17
{
  id v37 = a3;
  id v21 = a5;
  id v39 = a6;
  id v38 = a7;
  id v41 = a8;
  id v22 = a9;
  id v40 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  uint64_t v26 = (void (**)(id, void *, void))a17;
  long long v27 = pre_sv_responses_handle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235566000, v27, OS_LOG_TYPE_DEFAULT, "PREInternal - Server responsesForMessage called", buf, 2u);
  }

  if (v21)
  {
    BYTE2(v33) = a16;
    BYTE1(v33) = a15;
    LOBYTE(v33) = 1;
    id v28 = v37;
    id v29 = v22;
    objc_msgSend(MEMORY[0x263F382C8], "quickResponsesForMessage:conversationTurns:maxResponses:localeIdentifier:recipientHandles:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:useContactNames:includeCustomResponses:includeResponsesToRobots:", v37, v21, a4, v41, v22, v40, v23, v24, v25, v33);
  }
  else
  {
    LOWORD(v34) = __PAIR16__(a16, a15);
    id v28 = v37;
    id v29 = v22;
    objc_msgSend(MEMORY[0x263F382C8], "quickResponsesForMessage:context:time:maxResponses:locale:recipientHandles:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:includeCustomResponses:includeResponsesToRobots:", v37, v39, v38, a4, v41, v22, v40, v23, v24, v25, v34);
  id v30 = };
  if (v30)
  {
    id v31 = [(PREResponsesServerRequestHandler *)self preResponseItemArrayFromQuickResponses:v30];
  }
  else
  {
    id v31 = 0;
  }
  v26[2](v26, v31, 0);
  if (a14 && [v30 count])
  {
    id v32 = pre_sv_responses_handle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_235566000, v32, OS_LOG_TYPE_DEFAULT, "PREInternal - registerDisplayedQuickResponses", v42, 2u);
    }

    [MEMORY[0x263F382C8] registerDisplayedQuickResponses:v30 plistPath:v23 vocabPath:v25];
  }
}

- (void)setRemoteObjectProxy:(id)a3
{
}

@end