@interface SFCollaborationCompositionDictionaryProvider
- (DummySFCollaborationService)collaborationService;
- (OS_dispatch_queue)queue;
- (SFCollaborationCompositionDictionaryProvider)initWithItemProvider:(id)a3 delegate:(id)a4;
- (SFCollaborationCompositionDictionaryProviderDelegate)delegate;
- (SFCollaborationItemsProvider)collaborationItemsProvider;
- (id)collaborationItemsProvider:(id)a3 resolveActivityItem:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4;
- (void)setCollaborationItemsProvider:(id)a3;
- (void)setCollaborationService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SFCollaborationCompositionDictionaryProvider

- (SFCollaborationCompositionDictionaryProvider)initWithItemProvider:(id)a3 delegate:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SFCollaborationCompositionDictionaryProvider;
  v8 = [(SFCollaborationCompositionDictionaryProvider *)&v22 init];
  if (v8)
  {
    v9 = [SFCollaborationItemsProvider alloc];
    v23[0] = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    uint64_t v11 = [(SFCollaborationItemsProvider *)v9 initWithActivityItems:v10 delegate:v8];
    collaborationItemsProvider = v8->_collaborationItemsProvider;
    v8->_collaborationItemsProvider = (SFCollaborationItemsProvider *)v11;

    v13 = objc_alloc_init(DummySFCollaborationService);
    collaborationService = v8->_collaborationService;
    v8->_collaborationService = v13;

    objc_storeStrong((id *)&v8->_delegate, a4);
    v15 = [(SFCollaborationCompositionDictionaryProvider *)v8 collaborationItemsProvider];
    v16 = [v15 collaborationItems];
    v17 = [v16 firstObject];

    if (v17)
    {
      v18 = [(SFCollaborationCompositionDictionaryProvider *)v8 collaborationItemsProvider];
      v19 = [v18 collaborationItems];
      v20 = [v19 firstObject];
      [v20 registerChangeObserver:v8];
    }
  }

  return v8;
}

- (id)collaborationItemsProvider:(id)a3 resolveActivityItem:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = a4;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a4;
  id v6 = [v4 arrayWithObjects:v8 count:1];

  return v6;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4
{
  char v4 = a4;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((v4 & 4) != 0)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__14;
    v24 = __Block_byref_object_dispose__14;
    id v25 = 0;
    id v25 = +[SFCollaborationUtilities baseCollaborationDictionaryFromCollaborationItem:v6];
    if ([v6 type] == 1)
    {
      id location = 0;
      objc_initWeak(&location, self);
      id v7 = [v6 itemProvider];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __69__SFCollaborationCompositionDictionaryProvider_observable_didChange___block_invoke;
      v17[3] = &unk_1E5BC0FE8;
      objc_copyWeak(&v18, &location);
      v17[4] = &v20;
      +[SFCollaborationUtilities loadCKShareItemProvider:v7 completionHandler:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else if ([v6 type] == 2)
    {
      v8 = [v6 pendingCollaboration];
      [(id)v21[5] setObject:v8 forKeyedSubscript:@"SFPendingCollaborationKey"];

      v9 = [(SFCollaborationCompositionDictionaryProvider *)self delegate];
      [v9 dictionaryDidBecomeAvailable:v21[5] forProvider:self];
    }
    else if (![v6 type] && objc_msgSend(v6, "conformsToProtocol:", &unk_1EFA17D90))
    {
      v10 = [v6 fileURL];
      v26[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      v12 = +[SFCollaborationUtilities fileShareDictionaryFromFileURLItems:v11];
      [(id)v21[5] setObject:v12 forKeyedSubscript:@"fileObjects"];

      id v13 = [v6 fileURL];
      [v13 fileSystemRepresentation];
      uint64_t v14 = sandbox_extension_issue_file();

      if (v14)
      {
        v15 = [NSString stringWithUTF8String:v14];
        [(id)v21[5] setObject:v15 forKeyedSubscript:@"token"];
      }
      v16 = [(SFCollaborationCompositionDictionaryProvider *)self delegate];
      [v16 dictionaryDidBecomeAvailable:v21[5] forProvider:self];
    }
    _Block_object_dispose(&v20, 8);
  }
}

void __69__SFCollaborationCompositionDictionaryProvider_observable_didChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  v8 = +[SFCollaborationUtilities ckShareDictionaryFromCKShare:v7 setupInfo:v6];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v8 forKeyedSubscript:@"CKShare"];
  v9 = [WeakRetained delegate];
  [v9 dictionaryDidBecomeAvailable:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) forProvider:WeakRetained];
}

- (SFCollaborationItemsProvider)collaborationItemsProvider
{
  return self->_collaborationItemsProvider;
}

- (void)setCollaborationItemsProvider:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (DummySFCollaborationService)collaborationService
{
  return self->_collaborationService;
}

- (void)setCollaborationService:(id)a3
{
}

- (SFCollaborationCompositionDictionaryProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_collaborationService, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_collaborationItemsProvider, 0);
}

@end