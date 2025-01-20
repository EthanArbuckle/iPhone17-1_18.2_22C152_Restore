@interface ReusableTabManager
- (id)faviconForUUID:(id)a3;
- (id)reusableTabDocumentWithUUID:(id)a3;
- (id)tabGroupManager;
- (id)windowStates;
- (void)enumerateReusableTabDocuments:(id)a3;
@end

@implementation ReusableTabManager

- (id)faviconForUUID:(id)a3
{
  v3 = [(WBReusableTabManager *)self referenceToTabWithUUID:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 tabCollectionItem];
    v6 = [v5 icon];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)reusableTabDocumentWithUUID:(id)a3
{
  v3 = [(WBReusableTabManager *)self referenceToTabWithUUID:a3];
  return v3;
}

- (void)enumerateReusableTabDocuments:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__ReusableTabManager_enumerateReusableTabDocuments___block_invoke;
  v6[3] = &unk_1E6D7A710;
  id v7 = v4;
  id v5 = v4;
  [(WBReusableTabManager *)self enumerateReusableTabs:v6];
}

uint64_t __52__ReusableTabManager_enumerateReusableTabDocuments___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)windowStates
{
  v2 = +[Application sharedApplication];
  v3 = [v2 browserControllers];
  id v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_14);

  return v4;
}

id __34__ReusableTabManager_windowStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 tabController];
  v3 = [v2 windowState];

  return v3;
}

- (id)tabGroupManager
{
  v2 = +[Application sharedApplication];
  v3 = [v2 tabGroupManager];

  return v3;
}

@end