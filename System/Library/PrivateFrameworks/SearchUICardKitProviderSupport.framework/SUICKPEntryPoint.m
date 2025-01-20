@interface SUICKPEntryPoint
- (NSString)providerIdentifier;
- (SUICKPEntryPoint)init;
- (SUICKPEntryPoint)initWithCATExecutor:(id)a3;
- (id)cardViewControllerForCard:(id)a3;
- (unint64_t)displayPriorityForCard:(id)a3;
- (void)mutateResponseSections:(id)a3 completion:(id)a4;
- (void)presentation:(id)a3 didApplyCardSectionViewSource:(id)a4 toCardViewController:(id)a5;
- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5;
- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5;
- (void)unregisterCardViewController:(id)a3;
@end

@implementation SUICKPEntryPoint

- (SUICKPEntryPoint)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUICKPEntryPoint;
  v2 = [(SUICKPEntryPoint *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SUICKPCardViewControllerProvider);
    cardViewControllerProvider = v2->_cardViewControllerProvider;
    v2->_cardViewControllerProvider = v3;

    v5 = objc_alloc_init(SUICKPCATExecutor);
    catExecutor = v2->_catExecutor;
    v2->_catExecutor = v5;

    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
  }
  return v2;
}

- (SUICKPEntryPoint)initWithCATExecutor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUICKPEntryPoint;
  v6 = [(SUICKPEntryPoint *)&v10 init];
  if (v6)
  {
    v7 = objc_alloc_init(SUICKPCardViewControllerProvider);
    cardViewControllerProvider = v6->_cardViewControllerProvider;
    v6->_cardViewControllerProvider = v7;

    objc_storeStrong((id *)&v6->_catExecutor, a3);
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
    +[CRKCardSectionViewController _registerWithCardKit];
  }

  return v6;
}

- (id)cardViewControllerForCard:(id)a3
{
  return [(SUICKPCardViewControllerProvider *)self->_cardViewControllerProvider cardViewControllerForCard:a3];
}

- (void)unregisterCardViewController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(SUICKPCardViewControllerProvider *)self->_cardViewControllerProvider unregisterCardViewController:v4];
  }
}

- (unint64_t)displayPriorityForCard:(id)a3
{
  return [(SUICKPCardViewControllerProvider *)self->_cardViewControllerProvider displayPriorityForCard:a3];
}

- (void)presentation:(id)a3 didApplyCardSectionViewSource:(id)a4 toCardViewController:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_opt_respondsToSelector()) {
    [(SUICKPCardViewControllerProvider *)self->_cardViewControllerProvider presentation:v10 didApplyCardSectionViewSource:v8 toCardViewController:v9];
  }
}

- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__SUICKPEntryPoint_requestCardSectionViewProviderForCard_delegate_reply___block_invoke;
  v10[3] = &unk_26490F6E0;
  id v11 = v8;
  id v9 = v8;
  [(SUICKPEntryPoint *)self requestIdentifiedCardSectionViewProviderForCard:a3 delegate:a4 reply:v10];
}

uint64_t __73__SUICKPEntryPoint_requestCardSectionViewProviderForCard_delegate_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [v8 resolvedCardSections];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __83__SUICKPEntryPoint_requestIdentifiedCardSectionViewProviderForCard_delegate_reply___block_invoke;
    v12[3] = &unk_26490F708;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    [(SUICKPEntryPoint *)self mutateResponseSections:v11 completion:v12];
  }
}

void __83__SUICKPEntryPoint_requestIdentifiedCardSectionViewProviderForCard_delegate_reply___block_invoke(void *a1)
{
  v2 = [[SUICKPCardSectionViewProvider alloc] initWithCard:a1[4]];
  [(SUICKPCardSectionViewProvider *)v2 setDelegate:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)mutateResponseSections:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v16 = a4;
  group = dispatch_group_create();
  queue = dispatch_queue_create("com.apple.siri.cardKit.visualCatExecution", MEMORY[0x263EF83A8]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          id v13 = [v12 backingCardSection];
        }
        else
        {
          id v13 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke;
          block[3] = &unk_26490F758;
          v22 = group;
          v23 = self;
          id v24 = v14;
          dispatch_group_async(v22, queue, block);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_21;
  v19[3] = &unk_26490F780;
  id v20 = v16;
  id v15 = v16;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], v19);
}

void __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 16);
  v3 = [*(id *)(a1 + 48) catModel];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_2;
  v4[3] = &unk_26490F730;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  [v2 responseProtoFromCATModel:v3 completion:v4];
}

void __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 visualResponse];

  if (v6 || !v7)
  {
    uint64_t v10 = (void *)*MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_2_cold_1(a1, v10, v6);
    }
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v5 visualResponse];
    [v8 setVisualCATOutput:v9];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)providerIdentifier
{
  return (NSString *)@"com.apple.cards.SearchUICardKitProvider";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catExecutor, 0);
  objc_storeStrong((id *)&self->_cardViewControllerProvider, 0);
}

void __54__SUICKPEntryPoint_mutateResponseSections_completion___block_invoke_2_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 catModel];
  id v7 = [v6 catIdentifier];
  uint64_t v8 = [a3 localizedDescription];
  int v9 = 138412546;
  uint64_t v10 = v7;
  __int16 v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_22C0E8000, v5, OS_LOG_TYPE_ERROR, "Error loading VisualCAT with id: %@. Failed with error: %@", (uint8_t *)&v9, 0x16u);
}

@end