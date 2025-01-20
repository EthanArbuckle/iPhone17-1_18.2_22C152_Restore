@interface WBSFaviconRequestsController
- (CGSize)size;
- (WBSFaviconRequestsController)initWithSiteMetadataManager:(id)a3;
- (WBSSiteMetadataManager)manager;
- (int64_t)priority;
- (void)_issueRequest:(id)a3 isOneTime:(BOOL)a4 withToken:(id)a5 completion:(id)a6;
- (void)cancelAllRegistrations;
- (void)cancelAllRegistrationsWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)registerOneTimeRequestForDomain:(id)a3 withToken:(id)a4 completion:(id)a5;
- (void)registerOneTimeRequestForURLString:(id)a3 withToken:(id)a4 completion:(id)a5;
- (void)registerOneTimeRequestForURLString:(id)a3 withToken:(id)a4 returnDefaultIconIfNoneAvailable:(BOOL)a5 iconSize:(CGSize)a6 isURLTypedByUser:(BOOL)a7 completion:(id)a8;
- (void)registerRequestForDomain:(id)a3 withToken:(id)a4 completion:(id)a5;
- (void)registerRequestForURLString:(id)a3 withToken:(id)a4 completion:(id)a5;
- (void)registerRequestForURLString:(id)a3 withToken:(id)a4 returnDefaultIconIfNoneAvailable:(BOOL)a5 iconSize:(CGSize)a6 isURLTypedByUser:(BOOL)a7 completion:(id)a8;
- (void)setPriority:(int64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation WBSFaviconRequestsController

- (WBSFaviconRequestsController)initWithSiteMetadataManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSFaviconRequestsController;
  v6 = [(WBSFaviconRequestsController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    tokenToRequestToken = v7->_tokenToRequestToken;
    v7->_tokenToRequestToken = (NSMapTable *)v8;

    v7->_priority = 0;
    v7->_size = (CGSize)WBSFaviconRequestSmallIconSize;
    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  v3 = self->_tokenToRequestToken;
  objc_sync_enter(v3);
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)WBSFaviconRequestsController;
  [(WBSFaviconRequestsController *)&v4 dealloc];
}

- (void)registerRequestForDomain:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [WBSFaviconRequest alloc];
  [(WBSFaviconRequestsController *)self size];
  objc_super v12 = -[WBSFaviconRequest initWithDomain:iconSize:fallbackType:](v11, "initWithDomain:iconSize:fallbackType:", v10, 1);

  [(WBSFaviconRequestsController *)self _issueRequest:v12 isOneTime:0 withToken:v9 completion:v8];
}

- (void)registerRequestForURLString:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(WBSFaviconRequestsController *)self size];
  double v12 = v11;
  double v14 = v13;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__WBSFaviconRequestsController_registerRequestForURLString_withToken_completion___block_invoke;
  v16[3] = &unk_1E5E42500;
  id v17 = v8;
  id v15 = v8;
  -[WBSFaviconRequestsController registerRequestForURLString:withToken:returnDefaultIconIfNoneAvailable:iconSize:isURLTypedByUser:completion:](self, "registerRequestForURLString:withToken:returnDefaultIconIfNoneAvailable:iconSize:isURLTypedByUser:completion:", v10, v9, 1, 0, v16, v12, v14);
}

uint64_t __81__WBSFaviconRequestsController_registerRequestForURLString_withToken_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerRequestForURLString:(id)a3 withToken:(id)a4 returnDefaultIconIfNoneAvailable:(BOOL)a5 iconSize:(CGSize)a6 isURLTypedByUser:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  double height = a6.height;
  double width = a6.width;
  BOOL v11 = a5;
  id v15 = (void *)MEMORY[0x1E4F1CB10];
  id v16 = a8;
  id v17 = a4;
  if (v8) {
    objc_msgSend(v15, "safari_URLWithUserTypedString:", a3);
  }
  else {
  id v19 = [v15 URLWithString:a3];
  }
  v18 = -[WBSFaviconRequest initWithURL:iconSize:fallbackType:isURLTypedByUser:]([WBSFaviconRequest alloc], "initWithURL:iconSize:fallbackType:isURLTypedByUser:", v19, v11, v8, width, height);
  [(WBSFaviconRequestsController *)self _issueRequest:v18 isOneTime:0 withToken:v17 completion:v16];
}

- (void)registerOneTimeRequestForURLString:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(WBSFaviconRequestsController *)self size];
  double v12 = v11;
  double v14 = v13;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__WBSFaviconRequestsController_registerOneTimeRequestForURLString_withToken_completion___block_invoke;
  v16[3] = &unk_1E5E42500;
  id v17 = v8;
  id v15 = v8;
  -[WBSFaviconRequestsController registerOneTimeRequestForURLString:withToken:returnDefaultIconIfNoneAvailable:iconSize:isURLTypedByUser:completion:](self, "registerOneTimeRequestForURLString:withToken:returnDefaultIconIfNoneAvailable:iconSize:isURLTypedByUser:completion:", v10, v9, 1, 0, v16, v12, v14);
}

uint64_t __88__WBSFaviconRequestsController_registerOneTimeRequestForURLString_withToken_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerOneTimeRequestForURLString:(id)a3 withToken:(id)a4 returnDefaultIconIfNoneAvailable:(BOOL)a5 iconSize:(CGSize)a6 isURLTypedByUser:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  double height = a6.height;
  double width = a6.width;
  BOOL v11 = a5;
  id v15 = (void *)MEMORY[0x1E4F1CB10];
  id v16 = a8;
  id v17 = a4;
  if (v8) {
    objc_msgSend(v15, "safari_URLWithUserTypedString:", a3);
  }
  else {
  id v19 = [v15 URLWithString:a3];
  }
  v18 = -[WBSFaviconRequest initWithURL:iconSize:fallbackType:isURLTypedByUser:]([WBSFaviconRequest alloc], "initWithURL:iconSize:fallbackType:isURLTypedByUser:", v19, v11, v8, width, height);
  [(WBSFaviconRequestsController *)self _issueRequest:v18 isOneTime:1 withToken:v17 completion:v16];
}

- (void)registerOneTimeRequestForDomain:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [WBSFaviconRequest alloc];
  [(WBSFaviconRequestsController *)self size];
  double v12 = -[WBSFaviconRequest initWithDomain:iconSize:fallbackType:](v11, "initWithDomain:iconSize:fallbackType:", v10, 1);

  [(WBSFaviconRequestsController *)self _issueRequest:v12 isOneTime:1 withToken:v9 completion:v8];
}

- (void)cancelAllRegistrationsWithCompletionHandler:(id)a3
{
  id v8 = a3;
  objc_super v4 = self->_tokenToRequestToken;
  objc_sync_enter(v4);
  manager = self->_manager;
  v6 = [(NSMapTable *)self->_tokenToRequestToken objectEnumerator];
  v7 = [v6 allObjects];
  [(WBSSiteMetadataManager *)manager cancelRequestsWithTokens:v7 completionHandler:v8];

  [(NSMapTable *)self->_tokenToRequestToken removeAllObjects];
  objc_sync_exit(v4);
}

- (void)cancelAllRegistrations
{
}

- (void)_issueRequest:(id)a3 isOneTime:(BOOL)a4 withToken:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = self->_tokenToRequestToken;
  objc_sync_enter(v13);
  manager = self->_manager;
  id v15 = [(NSMapTable *)self->_tokenToRequestToken objectForKey:v11];
  [(WBSSiteMetadataManager *)manager cancelRequestWithToken:v15];

  [(NSMapTable *)self->_tokenToRequestToken removeObjectForKey:v11];
  uint64_t v31 = 0;
  v32 = (id *)&v31;
  uint64_t v33 = 0x3042000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  id v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  objc_initWeak(&location, self);
  id v16 = self->_manager;
  int64_t v17 = [(WBSFaviconRequestsController *)self priority];
  if (v8)
  {
    v18 = v24;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __77__WBSFaviconRequestsController__issueRequest_isOneTime_withToken_completion___block_invoke;
    v24[3] = &unk_1E5E42528;
    id v19 = &v25;
    objc_copyWeak(&v25, &location);
    v24[6] = &v27;
    v24[7] = &v31;
    v24[4] = v11;
    v24[5] = v12;
    uint64_t v20 = [(WBSSiteMetadataManager *)v16 registerOneTimeRequest:v10 priority:v17 responseHandler:v24];
  }
  else
  {
    v18 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__WBSFaviconRequestsController__issueRequest_isOneTime_withToken_completion___block_invoke_2;
    v22[3] = &unk_1E5E42528;
    id v19 = &v23;
    objc_copyWeak(&v23, &location);
    v22[6] = &v27;
    v22[7] = &v31;
    v22[4] = v11;
    v22[5] = v12;
    uint64_t v20 = [(WBSSiteMetadataManager *)v16 registerRequest:v10 priority:v17 responseHandler:v22];
  }
  v21 = (void *)v20;

  objc_destroyWeak(v19);
  *((unsigned char *)v28 + 24) = 1;
  if (v21)
  {
    objc_storeWeak(v32 + 5, v21);
    [(NSMapTable *)self->_tokenToRequestToken setObject:v21 forKey:v11];
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  objc_destroyWeak(&v36);

  objc_sync_exit(v13);
}

void __77__WBSFaviconRequestsController__issueRequest_isOneTime_withToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v5 = WeakRetained[1];
      objc_sync_enter(v5);
      id v6 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      if (!v6
        || ([v4[1] objectForKey:*(void *)(a1 + 32)],
            id v7 = (id)objc_claimAutoreleasedReturnValue(),
            v7,
            v7 != v6))
      {

        objc_sync_exit(v5);
LABEL_8:

        goto LABEL_9;
      }
      [v4[1] removeObjectForKey:*(void *)(a1 + 32)];

      objc_sync_exit(v5);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v5 = [v9 favicon];
    (*(void (**)(uint64_t, id, BOOL))(v8 + 16))(v8, v5, [v9 faviconType] == 0);
    goto LABEL_8;
  }
LABEL_9:
}

void __77__WBSFaviconRequestsController__issueRequest_isOneTime_withToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v5 = WeakRetained[1];
      objc_sync_enter(v5);
      id v6 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      if (!v6)
      {
        objc_sync_exit(v5);
        goto LABEL_7;
      }
      id v7 = v6;
      uint64_t v8 = [v4[1] objectForKey:*(void *)(a1 + 32)];

      objc_sync_exit(v5);
      if (v8 != v7) {
        goto LABEL_8;
      }
    }
    uint64_t v9 = *(void *)(a1 + 40);
    id v5 = [v10 favicon];
    (*(void (**)(uint64_t, id, BOOL))(v9 + 16))(v9, v5, [v10 faviconType] == 0);
LABEL_7:
  }
LABEL_8:
}

- (WBSSiteMetadataManager)manager
{
  return self->_manager;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_tokenToRequestToken, 0);
}

@end