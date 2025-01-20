@interface WFActionContentPermissionRequestor
- (WFAction)action;
- (WFActionContentPermissionRequestor)initWithAction:(id)a3;
- (WFContactStore)contactStore;
- (WFUserInterfaceHost)userInterface;
- (void)_allowNetworkAccessAfterPromptingForURLs:(id)a3 completionHandler:(id)a4;
- (void)allowContactsAccessWithCompletionHandler:(id)a3;
- (void)allowNetworkAccessAfterPromptingForURLs:(id)a3 completionHandler:(id)a4;
- (void)allowNetworkAccessWithoutPromptingWithCompletionHandler:(id)a3;
- (void)requestUserConsentToLoadWebContentAtURL:(id)a3 completionHandler:(id)a4;
- (void)setContactStore:(id)a3;
- (void)setUserInterface:(id)a3;
@end

@implementation WFActionContentPermissionRequestor

- (WFActionContentPermissionRequestor)initWithAction:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFActionContentPermissionRequestor;
  v5 = [(WFActionContentPermissionRequestor *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_action, v4);
    uint64_t v7 = [v4 userInterface];
    userInterface = v6->_userInterface;
    v6->_userInterface = (WFUserInterfaceHost *)v7;

    if (!v6->_userInterface)
    {
      v9 = getWFSecurityLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[WFActionContentPermissionRequestor initWithAction:]";
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Creating a WFActionContentPermissionRequestor without userInterface. We won't be able to present any prompts, and requests will be denied.", buf, 0xCu);
      }
    }
    v10 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_userInterface, 0);
  objc_destroyWeak((id *)&self->_action);
}

- (void)setContactStore:(id)a3
{
}

- (void)setUserInterface:(id)a3
{
}

- (WFUserInterfaceHost)userInterface
{
  return self->_userInterface;
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (WFContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    id v4 = (WFContactStore *)objc_opt_new();
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)allowNetworkAccessWithoutPromptingWithCompletionHandler:(id)a3
{
}

- (void)allowNetworkAccessAfterPromptingForURLs:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (![v9 count])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"WFActionContentPermissionRequestor.m" lineNumber:114 description:@"Programming error: at least 1 URLs must be passed into allowNetworkAccessAfterPromptingForURLs:"];
  }
  [(WFActionContentPermissionRequestor *)self _allowNetworkAccessAfterPromptingForURLs:v9 completionHandler:v7];
}

- (void)_allowNetworkAccessAfterPromptingForURLs:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "if_objectsPassingTest:", &__block_literal_global_53223);
  uint64_t v9 = [v7 count];

  if (v9 && ![v8 count])
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F5AA48];
    v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    id v30 = 0;
    objc_super v12 = [v10 locationWithURLs:v11 error:&v30];
    id v13 = v30;

    if (v13)
    {
      ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v13);
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_2;
      aBlock[3] = &unk_1E6555300;
      v14 = v6;
      id v29 = v14;
      uint64_t v15 = _Block_copy(aBlock);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_3;
      v25[3] = &unk_1E6556CB8;
      v26 = v14;
      id v27 = v15;
      id v16 = v15;
      v17 = _Block_copy(v25);
      v18 = v17;
      if (v12)
      {
        v19 = [(WFActionContentPermissionRequestor *)self action];
        v20 = [(WFActionContentPermissionRequestor *)self userInterface];
        v21 = [(WFActionContentPermissionRequestor *)self action];
        v22 = [v21 runningDelegate];
        [v22 contentItemCache];
        v23 = id v24 = v16;
        [v19 performSmartPromptChecksWithUserInterface:v20 contentDestination:v12 contentItemCache:v23 isWebpageCoercion:1 completionHandler:v18];

        id v16 = v24;
      }
      else
      {
        (*((void (**)(void *, void))v17 + 2))(v17, 0);
      }
    }
  }
}

uint64_t __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB4890] sharedManager];
    v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"WFRemoteServerAccessResource"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_4;
    v6[3] = &unk_1E6556318;
    id v7 = *(id *)(a1 + 40);
    [v4 requestSandboxExtensionForRunningActionWithAccessResources:v5 completion:v6];
  }
}

uint64_t __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFileURL] ^ 1;
}

- (void)requestUserConsentToLoadWebContentAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([v6 isFileURL])
  {
    uint64_t v8 = [MEMORY[0x1E4F5A868] webpagesLocation];
  }
  else
  {
    id v20 = 0;
    uint64_t v8 = [MEMORY[0x1E4F5AA48] locationWithURL:v6 error:&v20];
    id v9 = v20;
    if (!v8)
    {
      v10 = [v6 scheme];
      if ([v10 isEqualToString:@"data"])
      {
      }
      else
      {
        v11 = [v6 scheme];
        int v12 = [v11 isEqualToString:@"about"];

        if (!v12)
        {
          v7[2](v7, 0, v9);
          goto LABEL_10;
        }
      }
      uint64_t v8 = [MEMORY[0x1E4F5A868] webpagesLocation];
    }
  }
  id v13 = [(WFActionContentPermissionRequestor *)self action];
  v14 = [(WFActionContentPermissionRequestor *)self userInterface];
  uint64_t v15 = [(WFActionContentPermissionRequestor *)self action];
  id v16 = [v15 runningDelegate];
  v17 = [v16 contentItemCache];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__WFActionContentPermissionRequestor_requestUserConsentToLoadWebContentAtURL_completionHandler___block_invoke;
  v18[3] = &unk_1E6555300;
  v19 = v7;
  [v13 performSmartPromptChecksWithUserInterface:v14 contentDestination:v8 contentItemCache:v17 isWebpageCoercion:1 completionHandler:v18];

  id v9 = (id)v8;
LABEL_10:
}

uint64_t __96__WFActionContentPermissionRequestor_requestUserConsentToLoadWebContentAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

- (void)allowContactsAccessWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB4890] sharedManager];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"WFContactAccessResource"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__WFActionContentPermissionRequestor_allowContactsAccessWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E65552D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 requestSandboxExtensionForRunningActionWithAccessResources:v6 completion:v8];
}

void __79__WFActionContentPermissionRequestor_allowContactsAccessWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a3)
  {
    id v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    v4(v5, 0);
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) contactStore];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
  }
}

@end