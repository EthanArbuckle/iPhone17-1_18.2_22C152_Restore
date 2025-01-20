@interface WBSUISafariSandboxBroker
- (void)getLinkMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4;
- (void)loadLinkPresentationMetdataForMessageWithGUID:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSUISafariSandboxBroker

- (void)loadLinkPresentationMetdataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke;
    v8[3] = &unk_1E5E420C8;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  else
  {
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:0];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v7);
  }
}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  IMSPIQueryMessageWithGUIDAndLoadAttachments();
}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1AD114F10]();
  if ([v3 count])
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__31;
    v27 = __Block_byref_object_dispose__31;
    id v28 = 0;
    id v5 = [v3 firstObject];
    id v6 = [v5 richLinkMetadata];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_34;
    v22[3] = &unk_1E5E45F28;
    v22[4] = &v23;
    v7 = (void *)MEMORY[0x1AD115160](v22);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_38;
    v20 = &unk_1E5E42B10;
    id v8 = v7;
    id v21 = v8;
    id v9 = (void (**)(void, void))MEMORY[0x1AD115160](&v17);
    id v10 = objc_msgSend(v6, "image", v17, v18, v19, v20);
    (*((void (**)(id, void *))v8 + 2))(v8, v10);

    v11 = [v6 alternateImages];
    ((void (**)(void, void *))v9)[2](v9, v11);

    v12 = [v6 icon];
    (*((void (**)(id, void *))v8 + 2))(v8, v12);

    uint64_t v13 = *(void *)(a1 + 32);
    v14 = [v6 title];
    (*(void (**)(uint64_t, void *, uint64_t, void))(v13 + 16))(v13, v14, v24[5], 0);

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v15 + 16))(v15, 0, 0, v16);
  }
}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = [a2 platformImage];
  v4 = v3;
  if (v3)
  {
    [v3 size];
    double v6 = v5;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) size];
    if (v6 > v7)
    {
      [v4 size];
      double v9 = v8;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) size];
      if (v9 > v10)
      {
        [v4 size];
        if (v11 <= 8192.0 && ([v4 size], v12 <= 8192.0))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v4);
        }
        else
        {
          uint64_t v13 = WBS_LOG_CHANNEL_PREFIXStartPage();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
            __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_34_cold_1(v13, v4, &v14);
          }
        }
      }
    }
  }
}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)getLinkMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__WBSUISafariSandboxBroker_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke;
    v8[3] = &unk_1E5E420C8;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v7);
  }
}

void __80__WBSUISafariSandboxBroker_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  IMSPIQueryMessageWithGUIDAndLoadAttachments();
}

void __80__WBSUISafariSandboxBroker_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)MEMORY[0x1AD114F10]();
  uint64_t v4 = [v8 count];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = [v8 firstObject];
    uint64_t v7 = [v6 richLinkMetadata];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v7, 0);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_34_cold_1(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F29238];
  id v6 = a1;
  [a2 size];
  *a3 = v7;
  a3[1] = v8;
  id v9 = [v5 valueWithBytes:a3 objCType:"{CGSize=dd}"];
  int v10 = 138543362;
  long long v11 = v9;
  _os_log_fault_impl(&dword_1ABB70000, v6, OS_LOG_TYPE_FAULT, "IMCore platform image too large: %{public}@", (uint8_t *)&v10, 0xCu);
}

@end