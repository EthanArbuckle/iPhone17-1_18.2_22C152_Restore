@interface WFFileArbiter
- (void)extendDocumentURL:(id)a3 workflowID:(id)a4 completion:(id)a5;
- (void)extendDocumentURLs:(id)a3 workflowID:(id)a4 completion:(id)a5;
@end

@implementation WFFileArbiter

- (void)extendDocumentURL:(id)a3 workflowID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__20462;
  v16[4] = __Block_byref_object_dispose__20463;
  id v17 = 0;
  v14[4] = v16;
  id v15 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__WFFileArbiter_extendDocumentURL_workflowID_completion___block_invoke;
  v14[3] = &unk_1E6551F10;
  [v10 coordinateReadingItemAtURL:v7 options:0 error:&v15 byAccessor:v14];
  id v11 = v15;
  id v13 = v9;
  id v12 = v8;
  FPExtendBookmarkForDocumentURL();

  _Block_object_dispose(v16, 8);
}

void __57__WFFileArbiter_extendDocumentURL_workflowID_completion___block_invoke(uint64_t a1, void *a2)
{
}

void __57__WFFileArbiter_extendDocumentURL_workflowID_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v5 = [MEMORY[0x1E4FB4540] standardClient];
    v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) path];
    uint64_t v7 = a1[4];
    id v17 = 0;
    id v8 = [v5 createBookmarkWithBookmarkableString:a2 path:v6 workflowID:v7 error:&v17];
    id v9 = v17;

    v10 = getWFFilesLogObject();
    id v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[WFFileArbiter extendDocumentURL:workflowID:completion:]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s Successfully created bookmark", buf, 0xCu);
      }

      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[WFFileArbiter extendDocumentURL:workflowID:completion:]_block_invoke";
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Could not create bookmark with error: %@ ", buf, 0x16u);
      }

      uint64_t v14 = a1[5];
      if (objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "wf_fileExists")) {
        uint64_t v15 = 257;
      }
      else {
        uint64_t v15 = 4;
      }
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:v15 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v16);
    }
  }
  else
  {
    id v13 = getWFFilesLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFFileArbiter extendDocumentURL:workflowID:completion:]_block_invoke_2";
      __int16 v20 = 2112;
      id v21 = a3;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Could not extend bookmark with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)extendDocumentURLs:(id)a3 workflowID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke;
  v14[3] = &unk_1E654FCC8;
  v14[4] = self;
  id v15 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke_3;
  v12[3] = &unk_1E654FCF0;
  id v13 = v9;
  id v10 = v9;
  id v11 = v8;
  objc_msgSend(a3, "if_enumerateAsynchronously:completionHandler:", v14, v12);
}

void __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke_2;
  v10[3] = &unk_1E6558110;
  id v11 = v6;
  id v9 = v6;
  [v8 extendDocumentURL:a2 workflowID:v7 completion:v10];
}

uint64_t __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 == 0);
}

uint64_t __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

@end