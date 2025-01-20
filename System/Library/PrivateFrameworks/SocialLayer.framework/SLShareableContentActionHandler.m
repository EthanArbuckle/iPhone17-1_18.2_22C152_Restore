@interface SLShareableContentActionHandler
+ (SLShareableContentActionHandler)sharedActionHandler;
- (id)activityItemsConfigurationForScene:(id)a3;
- (id)activityItemsConfigurationForSceneWithIdentifier:(id)a3;
- (id)lpMetadataForActivityItemsConfiguration:(id)a3;
- (id)respondToBSActions:(id)a3;
- (id)sceneWithIdentifier:(id)a3;
- (id)titleForActivityItemsConfiguration:(id)a3;
- (void)fulfillAsynchronousMetadataAction:(id)a3 linkMetadata:(id)a4;
- (void)fulfillAsynchronousMetadataAction:(id)a3 response:(id)a4;
- (void)fulfillContentAction:(id)a3 itemProvider:(id)a4;
- (void)fulfillMetadataAction:(id)a3 error:(id)a4;
- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5;
- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 containerSetupInfo:(id)a6;
- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 highlightURL:(id)a6 initiatorRequest:(id)a7;
- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 inPlaceFileURL:(id)a6;
- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 pendingCollaboration:(id)a6;
- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 sharingContext:(id)a6;
- (void)fulfillMetadataAction:(id)a3 response:(id)a4;
- (void)performAction:(id)a3;
- (void)performActions:(id)a3;
- (void)performFetchAsynchronousLPMetadataAction:(id)a3;
- (void)performFetchShareableContentAction:(id)a3;
- (void)performFetchShareableContentMetadataAction:(id)a3;
- (void)performSendShareableContentAction:(id)a3;
@end

@implementation SLShareableContentActionHandler

+ (SLShareableContentActionHandler)sharedActionHandler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SLShareableContentActionHandler_sharedActionHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedActionHandler_onceToken != -1) {
    dispatch_once(&sharedActionHandler_onceToken, block);
  }
  v2 = (void *)sharedActionHandler_sExtractor;
  return (SLShareableContentActionHandler *)v2;
}

uint64_t __54__SLShareableContentActionHandler_sharedActionHandler__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedActionHandler_sExtractor;
  sharedActionHandler_sExtractor = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (id)activityItemsConfigurationForScene:(id)a3
{
  return (id)[a3 _activityItemsConfiguration];
}

- (id)sceneWithIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  v5 = [v4 connectedScenes];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = objc_msgSend(v11, "_FBSScene", (void)v19);
        v13 = [v12 identifier];
        char v14 = [v13 isEqualToString:v3];

        if (v14) {
          break;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v15 = v11;

    if (!v15) {
      goto LABEL_13;
    }
    id v16 = v15;
  }
  else
  {
LABEL_10:

LABEL_13:
    v17 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SLShareableContentActionHandler sceneWithIdentifier:]();
    }

    id v16 = 0;
  }

  return v16;
}

- (id)activityItemsConfigurationForSceneWithIdentifier:(id)a3
{
  v4 = [(SLShareableContentActionHandler *)self sceneWithIdentifier:a3];
  v5 = [(SLShareableContentActionHandler *)self activityItemsConfigurationForScene:v4];

  return v5;
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 firstObject];
  v12 = [v11 registeredTypeIdentifiersWithFileOptions:1];
  if ([v11 canLoadObjectOfClass:getCKPostSharingContextClass()])
  {
    id CKPostSharingContextClass = getCKPostSharingContextClass();
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke;
    v41[3] = &unk_1E58AA030;
    v41[4] = self;
    id v42 = v8;
    id v43 = v9;
    id v44 = v10;
    id v14 = (id)[v11 loadObjectOfClass:CKPostSharingContextClass completionHandler:v41];

    id v15 = v42;
LABEL_13:

    goto LABEL_14;
  }
  if ([v11 canLoadObjectOfClass:getCKContainerSetupInfoClass()])
  {
    id CKContainerSetupInfoClass = getCKContainerSetupInfoClass();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_13;
    v37[3] = &unk_1E58AA030;
    v37[4] = self;
    id v38 = v8;
    id v39 = v9;
    id v40 = v10;
    id v17 = (id)[v11 loadObjectOfClass:CKContainerSetupInfoClass completionHandler:v37];

    id v15 = v38;
    goto LABEL_13;
  }
  if ([v11 canLoadObjectOfClass:objc_opt_class()])
  {
    uint64_t v18 = objc_opt_class();
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_16;
    v33[3] = &unk_1E58AA030;
    v33[4] = self;
    id v34 = v8;
    id v35 = v9;
    id v36 = v10;
    id v19 = (id)[v11 loadObjectOfClass:v18 completionHandler:v33];

    id v15 = v34;
    goto LABEL_13;
  }
  long long v20 = [v12 firstObject];
  if ([v20 isEqualToString:*MEMORY[0x1E4F3BE40]])
  {
    int v21 = [v11 hasItemConformingToTypeIdentifier:@"public.file-url"];

    if (v21)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_21;
      v29[3] = &unk_1E58AA058;
      v29[4] = self;
      id v30 = v8;
      id v31 = v9;
      id v32 = v10;
      [v11 loadItemForTypeIdentifier:@"public.file-url" options:0 completionHandler:v29];

      id v15 = v30;
      goto LABEL_13;
    }
  }
  else
  {
  }
  if ([v12 count])
  {
    long long v22 = [v12 firstObject];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_24;
    v25[3] = &unk_1E58AA0A8;
    v25[4] = self;
    id v26 = v8;
    id v27 = v9;
    id v28 = v10;
    id v23 = (id)[v11 loadInPlaceFileRepresentationForTypeIdentifier:v22 completionHandler:v25];

    id v15 = v26;
    goto LABEL_13;
  }
  uint64_t v24 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v11;
    _os_log_impl(&dword_19BE17000, v24, OS_LOG_TYPE_DEFAULT, "Fulfilling action without initiator request for item provider without any registered collaborations: %@", buf, 0xCu);
  }

  [(SLShareableContentActionHandler *)self fulfillMetadataAction:v8 itemProviders:v9 linkMetadata:v10 highlightURL:0 initiatorRequest:0];
LABEL_14:
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2;
  v10[3] = &unk_1E58AA008;
  id v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2(uint64_t a1)
{
  getCKPostSharingContextClass();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v6 = *(void *)(a1 + 32);
    return [v2 fulfillMetadataAction:v3 itemProviders:v4 linkMetadata:v5 sharingContext:v6];
  }
  else
  {
    id v8 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_cold_1(a1, v8);
    }

    return [*(id *)(a1 + 48) fulfillMetadataAction:*(void *)(a1 + 56) error:*(void *)(a1 + 40)];
  }
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_14;
  v10[3] = &unk_1E58AA008;
  id v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_14(uint64_t a1)
{
  getCKContainerSetupInfoClass();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v6 = *(void *)(a1 + 32);
    return [v2 fulfillMetadataAction:v3 itemProviders:v4 linkMetadata:v5 containerSetupInfo:v6];
  }
  else
  {
    id v8 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_14_cold_1(a1, v8);
    }

    return [*(id *)(a1 + 48) fulfillMetadataAction:*(void *)(a1 + 56) error:*(void *)(a1 + 40)];
  }
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_17;
  v10[3] = &unk_1E58AA008;
  id v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_17(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v6 = *(void *)(a1 + 32);
    return [v2 fulfillMetadataAction:v3 itemProviders:v4 linkMetadata:v5 pendingCollaboration:v6];
  }
  else
  {
    id v8 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_17_cold_1(a1, v8);
    }

    return [*(id *)(a1 + 48) fulfillMetadataAction:*(void *)(a1 + 56) error:*(void *)(a1 + 40)];
  }
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_22;
  v10[3] = &unk_1E58AA008;
  id v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_22(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isFileURL])
  {
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v6 = *(void *)(a1 + 32);
    return [v2 fulfillMetadataAction:v3 itemProviders:v4 linkMetadata:v5 inPlaceFileURL:v6];
  }
  else
  {
    id v8 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_22_cold_1();
    }

    return [*(id *)(a1 + 48) fulfillMetadataAction:*(void *)(a1 + 56) error:*(void *)(a1 + 40)];
  }
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_24(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_25;
  block[3] = &unk_1E58AA080;
  char v19 = a3;
  id v13 = v7;
  id v14 = v8;
  id v9 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_25(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isFileURL] && *(unsigned char *)(a1 + 80))
  {
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v6 = *(void *)(a1 + 32);
    return [v2 fulfillMetadataAction:v3 itemProviders:v4 linkMetadata:v5 inPlaceFileURL:v6];
  }
  else
  {
    id v8 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_25_cold_1();
    }

    return [*(id *)(a1 + 48) fulfillMetadataAction:*(void *)(a1 + 56) error:*(void *)(a1 + 40)];
  }
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 sharingContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [SLShareableContentInitiatorRequest alloc];
  uint64_t v15 = [v10 containerSetupInfo];
  id v18 = [(SLShareableContentInitiatorRequest *)v14 initWithContainerSetupInfo:v15];

  id v16 = [v10 share];

  id v17 = [v16 URL];
  [(SLShareableContentActionHandler *)self fulfillMetadataAction:v13 itemProviders:v12 linkMetadata:v11 highlightURL:v17 initiatorRequest:v18];
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 containerSetupInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[SLShareableContentInitiatorRequest alloc] initWithContainerSetupInfo:v10];

  [(SLShareableContentActionHandler *)self fulfillMetadataAction:v13 itemProviders:v12 linkMetadata:v11 highlightURL:0 initiatorRequest:v14];
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 pendingCollaboration:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = [v12 collaborationMetadata];
  if (v14)
  {
    uint64_t v15 = [[SLShareableContentInitiatorRequest alloc] initWithCollaborationMetadata:v14];
    id v16 = [v12 fileURL];
    [(SLShareableContentActionHandler *)self fulfillMetadataAction:v13 itemProviders:v10 linkMetadata:v11 highlightURL:v16 initiatorRequest:v15];
  }
  else
  {
    id v17 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SLShareableContentActionHandler fulfillMetadataAction:itemProviders:linkMetadata:pendingCollaboration:](v17);
    }

    uint64_t v15 = +[SLShareableContentActionResponse response];
    [(SLShareableContentActionHandler *)self fulfillMetadataAction:v13 response:v15];
  }
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 inPlaceFileURL:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[SLShareableContentInitiatorRequest alloc] initWithFileURL:v10];
  [(SLShareableContentActionHandler *)self fulfillMetadataAction:v13 itemProviders:v12 linkMetadata:v11 highlightURL:v10 initiatorRequest:v14];
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 highlightURL:(id)a6 initiatorRequest:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v35 = a5;
  id v34 = a6;
  id v32 = a7;
  id v31 = [v11 sceneIdentifier];
  id v13 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v14 = [v13 bundleIdentifier];
  uint64_t v15 = (void *)v14;
  id v16 = &stru_1EEC19158;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  id v36 = v16;

  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v24 = [SLShareableContentRepresentationCollection alloc];
        v25 = objc_msgSend(v23, "sl_representations");
        id v26 = [v23 suggestedName];
        id v27 = [(SLShareableContentRepresentationCollection *)v24 initWithRepresentations:v25 suggestedFileName:v26];

        [v17 addObject:v27];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v20);
  }

  id v28 = [[SLShareableContentMetadata alloc] initWithSceneIdentifier:v31 bundleIdentifier:v36 representations:v17 metadata:v35 highlightURL:v34];
  v29 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v42 = v28;
    __int16 v43 = 2112;
    id v44 = v32;
    _os_log_impl(&dword_19BE17000, v29, OS_LOG_TYPE_DEFAULT, "Fulfilling action with metadata: %@ initiatorRequest: %@", buf, 0x16u);
  }

  id v30 = +[SLFetchShareableContentMetadataActionResponse responseWithMetadata:v28 initiatorRequest:v32];
  [(SLShareableContentActionHandler *)self fulfillMetadataAction:v11 response:v30];
}

- (void)fulfillMetadataAction:(id)a3 response:(id)a4
{
  id v5 = a4;
  id v7 = a3;
  uint64_t v6 = +[SLShareableContentObserver sharedObserver];
  [v6 setNeedsRefresh];

  [v7 fulfillWithResponse:v5];
}

- (void)fulfillMetadataAction:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v7 = a3;
  uint64_t v6 = +[SLShareableContentObserver sharedObserver];
  [v6 setNeedsRefresh];

  [v7 failWithError:v5];
}

- (void)fulfillAsynchronousMetadataAction:(id)a3 linkMetadata:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "Fulfilling action with metadata: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = +[SLFetchAsynchronousLPMetadataActionResponse responseWithMetadata:v6];
  [(SLShareableContentActionHandler *)self fulfillAsynchronousMetadataAction:v7 response:v9];
}

- (void)fulfillAsynchronousMetadataAction:(id)a3 response:(id)a4
{
  id v5 = a4;
  id v7 = a3;
  id v6 = +[SLShareableContentObserver sharedObserver];
  [v6 setNeedsRefresh];

  [v7 fulfillWithResponse:v5];
}

- (void)performFetchShareableContentMetadataAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 sceneIdentifier];
    int v18 = 138412290;
    uint64_t v19 = v6;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "Fetching on screen content for scene identifier: %@", (uint8_t *)&v18, 0xCu);
  }
  id v7 = [v4 sceneIdentifier];
  id v8 = [(SLShareableContentActionHandler *)self activityItemsConfigurationForSceneWithIdentifier:v7];

  if (v8)
  {
    id v9 = [v8 itemProvidersForActivityItemsConfiguration];
    int v10 = v9;
    if (!v9 || ![v9 count])
    {
      id v13 = SLShareableContentLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v4 sceneIdentifier];
        int v18 = 138412290;
        uint64_t v19 = v14;
        _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_DEFAULT, "Could not find content attached to the given scene with identifier: %@", (uint8_t *)&v18, 0xCu);
      }
      id v12 = +[SLShareableContentActionResponse response];
      [(SLShareableContentActionHandler *)self fulfillMetadataAction:v4 response:v12];
      goto LABEL_19;
    }
    if (objc_opt_respondsToSelector())
    {
      id v11 = [v8 activityItemsConfigurationMetadataForKey:*MEMORY[0x1E4FB25E0]];
      if (v11)
      {
        objc_opt_class();
        id v12 = v11;
        if (objc_opt_isKindOfClass()) {
          goto LABEL_18;
        }
      }
    }
    else
    {
      id v11 = 0;
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F30A78]);

    id v17 = [(SLShareableContentActionHandler *)self titleForActivityItemsConfiguration:v8];
    [v12 setTitle:v17];

LABEL_18:
    [(SLShareableContentActionHandler *)self fulfillMetadataAction:v4 itemProviders:v10 linkMetadata:v12];
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v15 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v4 sceneIdentifier];
    int v18 = 138412290;
    uint64_t v19 = v16;
    _os_log_impl(&dword_19BE17000, v15, OS_LOG_TYPE_DEFAULT, "Could not find an activity items configuration for the requested scene: %@", (uint8_t *)&v18, 0xCu);
  }
  int v10 = +[SLShareableContentActionResponse response];
  [(SLShareableContentActionHandler *)self fulfillMetadataAction:v4 response:v10];
LABEL_20:
}

- (void)performFetchAsynchronousLPMetadataAction:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 sceneIdentifier];
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous metdata for on screen content for scene identifier: %@", buf, 0xCu);
  }
  id v7 = [v4 sceneIdentifier];
  id v8 = [(SLShareableContentActionHandler *)self activityItemsConfigurationForSceneWithIdentifier:v7];

  if (v8)
  {
    id v9 = [(SLShareableContentActionHandler *)self lpMetadataForActivityItemsConfiguration:v8];
    int v10 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v9;
      _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "Fetched synchronous previewMetadata %@", buf, 0xCu);
    }

    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v11 = v9;
    }
    else
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F30A78]);

      id v12 = [(SLShareableContentActionHandler *)self titleForActivityItemsConfiguration:v8];
      [v11 setTitle:v12];

      if (objc_opt_respondsToSelector())
      {
        id v13 = objc_msgSend(v8, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", 0, *MEMORY[0x1E4FB2600], 64.0, 64.0);
        [v11 setIconProvider:v13];

        uint64_t v14 = objc_msgSend(v8, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", 0, *MEMORY[0x1E4FB25F8], 512.0, 512.0);
        [v11 setImageProvider:v14];
      }
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__SLShareableContentActionHandler_performFetchAsynchronousLPMetadataAction___block_invoke;
    v18[3] = &unk_1E58A9F88;
    id v19 = v11;
    uint64_t v20 = self;
    id v21 = v4;
    id v15 = v11;
    [v15 _loadAsynchronousFieldsWithUpdateHandler:v18];
  }
  else
  {
    id v16 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v4 sceneIdentifier];
      *(_DWORD *)buf = 138412290;
      id v23 = v17;
      _os_log_impl(&dword_19BE17000, v16, OS_LOG_TYPE_DEFAULT, "Could not find an activity items configuration for the requested scene: %@", buf, 0xCu);
    }
    id v15 = +[SLShareableContentActionResponse response];
    [(SLShareableContentActionHandler *)self fulfillAsynchronousMetadataAction:v4 response:v15];
  }
}

uint64_t __76__SLShareableContentActionHandler_performFetchAsynchronousLPMetadataAction___block_invoke(uint64_t result, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(v2 + 32);
      id v5 = [v4 image];
      int v6 = 138412546;
      id v7 = v4;
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "Completed loading asynchronous fields for previewMetadata %@ %@", (uint8_t *)&v6, 0x16u);
    }
    return [*(id *)(v2 + 40) fulfillAsynchronousMetadataAction:*(void *)(v2 + 48) linkMetadata:*(void *)(v2 + 32)];
  }
  return result;
}

- (void)fulfillContentAction:(id)a3 itemProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 requestedTypeIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SLShareableContentActionHandler_fulfillContentAction_itemProvider___block_invoke;
  v9[3] = &unk_1E58AA0D0;
  id v10 = v5;
  id v8 = v5;
  objc_msgSend(v6, "sl_loadRepresentationForTypeIdentifier:completionHandler:", v7, v9);
}

void __69__SLShareableContentActionHandler_fulfillContentAction_itemProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[SLFetchShareableContentActionResponse responseWithResult:a2];
  [v2 fulfillWithResponse:v3];
}

- (void)performFetchShareableContentAction:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 sceneIdentifier];
    id v7 = [v4 requestedTypeIdentifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "Fetching on screen content representation for scene identifier: %@ requested type identifier: %@", buf, 0x16u);
  }
  id v8 = [v4 requestedTypeIdentifier];

  if (v8)
  {
    id v9 = [v4 sceneIdentifier];
    id v10 = [(SLShareableContentActionHandler *)self activityItemsConfigurationForSceneWithIdentifier:v9];

    if (!v10)
    {
      id v17 = SLShareableContentLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SLShareableContentActionHandler performFetchShareableContentAction:](v4);
      }

      int v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28798];
      uint64_t v21 = *MEMORY[0x1E4F28228];
      long long v22 = @"Could not find an activity items configuration for the requested scene.";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v12 = [v18 errorWithDomain:v19 code:2 userInfo:v20];

      [v4 failWithError:v12];
      goto LABEL_21;
    }
    id v11 = [v10 itemProvidersForActivityItemsConfiguration];
    id v12 = v11;
    if (v11 && [v11 count])
    {
      unint64_t v13 = [v4 requestedItemProviderIndex];
      if (v13 < [v12 count])
      {
        uint64_t v14 = [v12 objectAtIndexedSubscript:v13];
        [(SLShareableContentActionHandler *)self fulfillContentAction:v4 itemProvider:v14];
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      id v16 = SLShareableContentLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        [(SLShareableContentActionHandler *)v4 performFetchShareableContentAction:v16];
      }
    }
    else
    {
      id v16 = SLShareableContentLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SLShareableContentActionHandler performFetchShareableContentAction:](v4);
      }
    }

    uint64_t v14 = +[SLShareableContentActionResponse response];
    [v4 fulfillWithResponse:v14];
    goto LABEL_20;
  }
  id v15 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[SLShareableContentActionHandler performFetchShareableContentAction:](v4);
  }

  id v10 = +[SLShareableContentActionResponse response];
  [v4 fulfillWithResponse:v10];
LABEL_22:
}

- (void)performSendShareableContentAction:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 sceneIdentifier];
    int v24 = 138412290;
    __int16 v25 = v6;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "Presenting message compose sheet to send on screen content for scene identifier: %@", (uint8_t *)&v24, 0xCu);
  }
  id v7 = [v4 sceneIdentifier];
  id v8 = [(SLShareableContentActionHandler *)self sceneWithIdentifier:v7];

  if (v8)
  {
    id v9 = [v4 sceneIdentifier];
    id v10 = [(SLShareableContentActionHandler *)self activityItemsConfigurationForSceneWithIdentifier:v9];

    if (v10)
    {
      id v11 = [v10 itemProvidersForActivityItemsConfiguration];
      id v12 = [v11 firstObject];

      if (v12)
      {
        unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F3BDE0]) initWithCollaborationIdentifier:&stru_1EEC19158 title:&stru_1EEC19158 defaultShareOptions:0];
        id v14 = +[SLSoftLinks newComposeViewControllerInstance];
        id v15 = [MEMORY[0x1E4F1C978] array];
        [v14 insertCollaborationItemProvider:v12 collaborationOptions:v15 collaborationMetadata:v13 isCollaboration:1];

        objc_msgSend(v14, "setSl_messageComposeResultHandler:", &__block_literal_global_18);
        id v16 = [v8 keyWindow];
        id v17 = [MEMORY[0x1E4FB1EC0] _viewControllerForFullScreenPresentationFromView:v16];
        int v18 = v17;
        if (v17)
        {
          [v17 presentViewController:v14 animated:1 completion:0];
        }
        else
        {
          uint64_t v21 = SLShareableContentLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 138412290;
            __int16 v25 = v8;
            _os_log_impl(&dword_19BE17000, v21, OS_LOG_TYPE_DEFAULT, "Could not find a suitable presenting view controller for scene: %@. Content will be presented from a fallback view controller", (uint8_t *)&v24, 0xCu);
          }

          id v22 = objc_alloc_init(MEMORY[0x1E4FB20F8]);
          [v22 _presentViewController:v14 sendingView:v16 animated:1];
        }
        id v23 = +[SLShareableContentActionResponse response];
        [v4 fulfillWithResponse:v23];
      }
      else
      {
        uint64_t v20 = SLShareableContentLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[SLShareableContentActionHandler performFetchShareableContentAction:](v4);
        }

        unint64_t v13 = +[SLShareableContentActionResponse response];
        [v4 fulfillWithResponse:v13];
      }
    }
    else
    {
      uint64_t v19 = SLShareableContentLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SLShareableContentActionHandler performFetchShareableContentAction:](v4);
      }

      id v12 = +[SLShareableContentActionResponse response];
      [v4 fulfillWithResponse:v12];
    }
  }
  else
  {
    id v10 = +[SLShareableContentActionResponse response];
    [v4 fulfillWithResponse:v10];
  }
}

void __69__SLShareableContentActionHandler_performSendShareableContentAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SLShareableContentActionHandler *)self performFetchShareableContentMetadataAction:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SLShareableContentActionHandler *)self performFetchShareableContentAction:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(SLShareableContentActionHandler *)self performSendShareableContentAction:v4];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SLShareableContentActionHandler *)self performFetchAsynchronousLPMetadataAction:v4];
        }
      }
    }
  }
}

- (void)performActions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SLShareableContentActionHandler *)self performAction:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)respondToBSActions:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __54__SLShareableContentActionHandler_respondToBSActions___block_invoke;
  id v16 = &unk_1E58AA118;
  id v17 = v6;
  id v18 = v7;
  id v8 = v7;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:&v13];
  -[SLShareableContentActionHandler performActions:](self, "performActions:", v9, v13, v14, v15, v16);
  long long v10 = (void *)[v5 mutableCopy];

  [v10 minusSet:v8];
  long long v11 = (void *)[v10 copy];

  return v11;
}

void __54__SLShareableContentActionHandler_respondToBSActions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = +[SLShareableContentAction actionWithBSAction:](SLShareableContentAction, "actionWithBSAction:");
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (id)titleForActivityItemsConfiguration:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 activityItemsConfigurationMetadataForKey:*MEMORY[0x1E4FB25F0]];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [v3 itemProvidersForActivityItemsConfiguration];
  uint64_t v6 = [v5 count];

  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || !v6) {
      goto LABEL_13;
    }
    uint64_t v8 = 0;
    uint64_t v9 = *MEMORY[0x1E4FB25F0];
    while (1)
    {
      uint64_t v10 = [v3 activityItemsConfigurationMetadataForItemAtIndex:v8 key:v9];
      if (v10) {
        break;
      }
      if (v6 == ++v8)
      {
        id v4 = 0;
        goto LABEL_13;
      }
    }
    id v4 = (void *)v10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v4 string];

    id v4 = (void *)v7;
  }
LABEL_13:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v11 = v4;
  }
  else {
    long long v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)lpMetadataForActivityItemsConfiguration:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 activityItemsConfigurationMetadataForKey:*MEMORY[0x1E4FB25E0]];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [v3 itemProvidersForActivityItemsConfiguration];
  uint64_t v6 = [v5 count];

  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0 && v6)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *MEMORY[0x1E4FB25E0];
    while (1)
    {
      uint64_t v12 = [v3 activityItemsConfigurationMetadataForItemAtIndex:v10 key:v11];
      if (v12) {
        break;
      }
      if (v6 == ++v10)
      {
        id v4 = 0;
        goto LABEL_5;
      }
    }
    id v4 = (void *)v12;
  }
LABEL_5:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)sceneWithIdentifier:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_19BE17000, v1, OS_LOG_TYPE_ERROR, "Could not find the requested scene with identifier: %@ in connected scenes: %@", v2, 0x16u);
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_19BE17000, a2, OS_LOG_TYPE_FAULT, "Unexpectedly failed to load CKPostSharingContext from item provider: %@", (uint8_t *)&v3, 0xCu);
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_14_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_19BE17000, a2, OS_LOG_TYPE_FAULT, "Unexpectedly failed to load CKContainerSetupInfo from item provider: %@", (uint8_t *)&v3, 0xCu);
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_17_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_3();
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_fault_impl(&dword_19BE17000, a2, OS_LOG_TYPE_FAULT, "Unexpectedly failed to load a %@ from item provider: %@", v6, 0x16u);
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_22_cold_1()
{
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_3_5(&dword_19BE17000, v0, v1, "Unexpectedly failed to load item for type public.file-url of %@: %@");
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_25_cold_1()
{
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_3_5(&dword_19BE17000, v0, v1, "Unexpectedly failed to load in-place file representation of %@: %@");
}

- (void)fulfillMetadataAction:(os_log_t)log itemProviders:linkMetadata:pendingCollaboration:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "Pending collaboration contains no metadata", v1, 2u);
}

- (void)performFetchShareableContentAction:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 sceneIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "No requested type identifier to fetch content from scene: %@", v4, v5, v6, v7, v8);
}

- (void)performFetchShareableContentAction:(void *)a1 .cold.2(void *a1)
{
  os_log_t v1 = [a1 sceneIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "Could not find an activity items configuration for the requested scene: %@", v4, v5, v6, v7, v8);
}

- (void)performFetchShareableContentAction:(void *)a1 .cold.3(void *a1)
{
  os_log_t v1 = [a1 sceneIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "Could not find content attached to the given scene with identifier: %@", v4, v5, v6, v7, v8);
}

- (void)performFetchShareableContentAction:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 sceneIdentifier];
  int v6 = 134218242;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_19BE17000, a3, OS_LOG_TYPE_ERROR, "Could not find requested item provider for index:%ld to the given scene with identifier: %@", (uint8_t *)&v6, 0x16u);
}

@end