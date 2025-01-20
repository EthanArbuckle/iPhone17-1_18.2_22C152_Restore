@interface NSItemProvider(Sharing)
- (id)preferredContentTypeForSavingWithCanOpenInPlace:()Sharing;
- (uint64_t)supportsMessagesSendCopyRepresentation;
- (uint64_t)supportsShareSheetSendCopyRepresentation;
- (void)loadFileURLRequiringOpenInPlace:()Sharing completionHandler:;
- (void)loadURLClassWithPreviousError:()Sharing completionHandler:;
- (void)sf_loadSecurityContextWithCompletionHandler:()Sharing;
@end

@implementation NSItemProvider(Sharing)

- (uint64_t)supportsShareSheetSendCopyRepresentation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = objc_msgSend(a1, "registeredTypeIdentifiers", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    uint64_t v5 = *MEMORY[0x1E4F44408];
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        v7 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * v6)];
        char v8 = [v7 conformsToType:v5];

        if (v8)
        {
          uint64_t v9 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (uint64_t)supportsMessagesSendCopyRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v1 = objc_msgSend(a1, "registeredTypeIdentifiers", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    uint64_t v5 = *MEMORY[0x1E4F44408];
    uint64_t v6 = *MEMORY[0x1E4F44470];
    uint64_t v7 = *MEMORY[0x1E4F444F8];
    uint64_t v8 = *MEMORY[0x1E4F443B8];
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v1);
        }
        v10 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
        if ([v10 conformsToType:v5]
          && ([v10 conformsToType:v6] & 1) == 0
          && (![v10 conformsToType:v7]
           || [v10 conformsToType:v8]))
        {

          uint64_t v11 = 1;
          goto LABEL_14;
        }

        ++v9;
      }
      while (v3 != v9);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_14:

  return v11;
}

- (id)preferredContentTypeForSavingWithCanOpenInPlace:()Sharing
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 registeredContentTypesForOpenInPlace];
  uint64_t v6 = +[SFCollaborationUtilities _copyRepresentationTypeIdentifier];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v27 = a3;
    id v10 = 0;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v14 = [v13 identifier];
        char v15 = [v14 isEqualToString:v6];

        if ((v15 & 1) == 0)
        {
          id v16 = v13;

          id v10 = v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);

    a3 = v27;
    if (v10)
    {
      char v17 = 1;
      if (!v27) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else
  {
  }
  [a1 registeredContentTypes];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    uint64_t v22 = *MEMORY[0x1E4F44408];
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        if ([v24 conformsToType:v22])
        {
          id v10 = v24;
          goto LABEL_24;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_24:

  char v17 = 0;
  if (a3) {
LABEL_25:
  }
    *a3 = v17;
LABEL_26:
  id v25 = v10;

  return v25;
}

- (void)loadURLClassWithPreviousError:()Sharing completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 canLoadObjectOfClass:objc_opt_class()])
  {
    uint64_t v8 = objc_opt_class();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__NSItemProvider_Sharing__loadURLClassWithPreviousError_completionHandler___block_invoke;
    v10[3] = &unk_1E5BBF688;
    id v11 = v7;
    id v9 = (id)[a1 loadObjectOfClass:v8 completionHandler:v10];
  }
  else
  {
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v6);
  }
}

- (void)loadFileURLRequiringOpenInPlace:()Sharing completionHandler:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v18 = 0;
  uint64_t v7 = [a1 preferredContentTypeForSavingWithCanOpenInPlace:&v18];
  uint64_t v8 = (void *)v7;
  if (v18) {
    int v9 = 0;
  }
  else {
    int v9 = a3;
  }
  if (!v7 || (v9 & 1) != 0)
  {
    if (v7 && ((v9 ^ 1) & 1) == 0)
    {
      id v11 = framework_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        long long v12 = [v8 identifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v12;
        _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "Not loading file representation for content type %@ because it can't be opened in place", buf, 0xCu);
      }
    }
    [a1 loadURLClassWithPreviousError:0 completionHandler:v6];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke;
    v13[3] = &unk_1E5BC0C40;
    char v17 = a3;
    id v16 = v6;
    id v14 = v8;
    char v15 = a1;
    id v10 = (id)[a1 loadFileRepresentationForContentType:v14 openInPlace:a3 completionHandler:v13];
  }
}

- (void)sf_loadSecurityContextWithCompletionHandler:()Sharing
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__NSItemProvider_Sharing__sf_loadSecurityContextWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5BC0C68;
  id v7 = v4;
  id v5 = v4;
  [a1 loadItemForTypeIdentifier:@"com.apple.ShareUI.airdrop.supplementalSecurityContext" options:0 completionHandler:v6];
}

@end