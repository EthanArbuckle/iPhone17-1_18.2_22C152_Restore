@interface WFChooseFromListDataStore
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)contentItems;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (WFChooseFromListDataStore)init;
- (os_unfair_lock_s)contentItemsLock;
- (void)addContentItem:(id)a3 withIdentifier:(id)a4;
- (void)hasAltTextForIdentifier:(id)a3 completion:(id)a4;
- (void)hasImageForIdentifier:(id)a3 completion:(id)a4;
- (void)hasSubtitleForIdentifier:(id)a3 completion:(id)a4;
- (void)loadAltTextWithIdentifier:(id)a3 completion:(id)a4;
- (void)loadImageWithIdentifier:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)loadSubtitleWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeContentItemWithIdentifier:(id)a3;
- (void)setContentItems:(id)a3;
@end

@implementation WFChooseFromListDataStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (os_unfair_lock_s)contentItemsLock
{
  return self->_contentItemsLock;
}

- (void)setContentItems:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)hasSubtitleForIdentifier:(id)a3 completion:(id)a4
{
  v9 = (void (**)(id, void))a4;
  id v6 = a3;
  v7 = [(WFChooseFromListDataStore *)self contentItems];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8) {
    v9[2](v9, 0);
  }
  v9[2](v9, [v8 getListSubtitle:0]);
}

- (void)hasImageForIdentifier:(id)a3 completion:(id)a4
{
  v9 = (void (**)(id, void))a4;
  id v6 = a3;
  v7 = [(WFChooseFromListDataStore *)self contentItems];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8) {
    v9[2](v9, 0);
  }
  v9[2](v9, objc_msgSend(v8, "getListThumbnail:forSize:", 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8)));
}

- (void)hasAltTextForIdentifier:(id)a3 completion:(id)a4
{
  v9 = (void (**)(id, void))a4;
  id v6 = a3;
  v7 = [(WFChooseFromListDataStore *)self contentItems];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8) {
    v9[2](v9, 0);
  }
  v9[2](v9, [v8 getListAltText:0]);
}

- (void)loadImageWithIdentifier:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a5;
  id v9 = a3;
  v10 = [(WFChooseFromListDataStore *)self contentItems];
  v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11 || (objc_msgSend(v11, "getListThumbnail:forSize:", v12, width, height) & 1) == 0) {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

- (void)loadAltTextWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFChooseFromListDataStore *)self contentItems];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__WFChooseFromListDataStore_loadAltTextWithIdentifier_completion___block_invoke;
    v11[3] = &unk_1E6554600;
    id v10 = v6;
    id v12 = v10;
    if (([v9 getListAltText:v11] & 1) == 0) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __66__WFChooseFromListDataStore_loadAltTextWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadSubtitleWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFChooseFromListDataStore *)self contentItems];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__WFChooseFromListDataStore_loadSubtitleWithIdentifier_completion___block_invoke;
    v11[3] = &unk_1E65545D8;
    id v10 = v6;
    id v13 = v10;
    id v12 = v9;
    if (([v12 getListSubtitle:v11] & 1) == 0) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __67__WFChooseFromListDataStore_loadSubtitleWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4);
  }
  else
  {
    id v5 = [(id)objc_opt_class() localizedTypeDescription];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
}

- (void)removeContentItemWithIdentifier:(id)a3
{
  p_contentItemsLock = &self->_contentItemsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_contentItemsLock);
  [(NSMutableDictionary *)self->_contentItems setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_contentItemsLock);
}

- (void)addContentItem:(id)a3 withIdentifier:(id)a4
{
  p_contentItemsLock = &self->_contentItemsLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_contentItemsLock);
  [(NSMutableDictionary *)self->_contentItems setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_contentItemsLock);
}

- (NSMutableDictionary)contentItems
{
  p_contentItemsLock = &self->_contentItemsLock;
  os_unfair_lock_lock(&self->_contentItemsLock);
  uint64_t v4 = self->_contentItems;
  os_unfair_lock_unlock(p_contentItemsLock);
  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  id v7 = [v5 interfaceWithProtocol:&unk_1F2327C88];
  [v6 setExportedInterface:v7];

  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (WFChooseFromListDataStore)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFChooseFromListDataStore;
  uint64_t v2 = [(WFChooseFromListDataStore *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    contentItems = v2->_contentItems;
    v2->_contentItems = v3;

    v2->_contentItemsLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    uint64_t v7 = [(NSXPCListener *)v2->_listener endpoint];
    endpoint = v2->_endpoint;
    v2->_endpoint = (NSXPCListenerEndpoint *)v7;

    id v9 = v2;
  }

  return v2;
}

@end