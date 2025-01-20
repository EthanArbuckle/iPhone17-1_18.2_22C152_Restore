@interface UIDocumentProperties
- (BOOL)wantsIconRepresentation;
- (LPLinkMetadata)_metadata;
- (LPLinkMetadata)metadata;
- (LPMetadataProvider)_metadataProvider;
- (NSURL)_representedURL;
- (NSURL)url;
- (UIAction)iconRepresentationAction;
- (UIDocumentProperties)initWithMetadata:(LPLinkMetadata *)metadata;
- (UIDocumentProperties)initWithURL:(NSURL *)url;
- (UINavigationItem)_associatedNavigationItem;
- (_UIDocumentPropertiesHeaderView)headerView;
- (_UIDocumentPropertiesIconView)iconView;
- (_UIDocumentURLChangeObserver)urlChangeObserver;
- (id)_headerViewForMenuInteraction:(id)a3 sourceViewProvider:(id)a4;
- (id)_iconView;
- (id)_placeholderMetadata;
- (id)_wantsIconRepresentationChangedHandler;
- (void)_didLoadMetadata:(id)a3;
- (void)_fetchMetadataIfNecessary:(BOOL)a3;
- (void)_performBlockAndCallIconRepresentationChangedHandlerIfNecessary:(id)a3;
- (void)_setAssociatedNavigationItem:(id)a3;
- (void)_setMetadata:(id)a3;
- (void)_setMetadataProvider:(id)a3;
- (void)_setWantsIconRepresentationChangedHandler:(id)a3;
- (void)_updateMetadataInUse;
- (void)activityViewControllerProvider;
- (void)dealloc;
- (void)dragItemsProvider;
- (void)setActivityViewControllerProvider:(void *)activityViewControllerProvider;
- (void)setDragItemsProvider:(void *)dragItemsProvider;
- (void)setHeaderView:(id)a3;
- (void)setIconRepresentationAction:(id)a3;
- (void)setIconView:(id)a3;
- (void)setMetadata:(LPLinkMetadata *)metadata;
- (void)setUrl:(id)a3;
- (void)setUrlChangeObserver:(id)a3;
- (void)setWantsIconRepresentation:(BOOL)wantsIconRepresentation;
@end

@implementation UIDocumentProperties

- (UIDocumentProperties)initWithURL:(NSURL *)url
{
  v6 = url;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UIDocumentProperties.m", 84, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)UIDocumentProperties;
  v7 = [(UIDocumentProperties *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_url, url);
    v9 = [[_UIDocumentURLChangeObserver alloc] initWithFileURL:v6];
    urlChangeObserver = v8->_urlChangeObserver;
    v8->_urlChangeObserver = v9;
  }
  return v8;
}

- (UIDocumentProperties)initWithMetadata:(LPLinkMetadata *)metadata
{
  v5 = metadata;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIDocumentProperties.m", 95, @"Invalid parameter not satisfying: %@", @"metadata != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)UIDocumentProperties;
  v6 = [(UIDocumentProperties *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [(LPLinkMetadata *)v5 copy];
    v8 = v6->_metadata;
    v6->_metadata = (LPLinkMetadata *)v7;
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(UIDocumentProperties *)self urlChangeObserver];
  int v4 = [v3 isObserving];

  if (v4)
  {
    v5 = [(UIDocumentProperties *)self urlChangeObserver];
    [v5 stopObserving];
  }
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentProperties;
  [(UIDocumentProperties *)&v6 dealloc];
}

- (void)_didLoadMetadata:(id)a3
{
  id v5 = a3;
  int v4 = [(UIDocumentProperties *)self url];

  if (v4) {
    [(UIDocumentProperties *)self _setMetadata:v5];
  }
}

- (void)_fetchMetadataIfNecessary:(BOOL)a3
{
  if (a3)
  {
LABEL_2:
    [(UIDocumentProperties *)self _setMetadataProvider:0];
    id v5 = [(UIDocumentProperties *)self url];
    if (!v5)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"UIDocumentProperties.m" lineNumber:128 description:@"No metadata is provided but also no URL is present. This should never happen."];
    }
    objc_super v6 = [(UIDocumentProperties *)self urlChangeObserver];
    char v7 = [v6 isObserving];

    if ((v7 & 1) == 0)
    {
      objc_initWeak(location, self);
      v8 = [(UIDocumentProperties *)self urlChangeObserver];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke;
      v17[3] = &unk_1E530E108;
      objc_copyWeak(&v19, location);
      id v18 = v5;
      [v8 startObservingWithChangeHandler:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak(location);
    }
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v9 = (void *)getLPMetadataProviderClass_softClass;
    uint64_t v24 = getLPMetadataProviderClass_softClass;
    if (!getLPMetadataProviderClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getLPMetadataProviderClass_block_invoke;
      location[3] = &unk_1E52D9900;
      location[4] = &v21;
      __getLPMetadataProviderClass_block_invoke((uint64_t)location);
      v9 = (void *)v22[3];
    }
    v10 = v9;
    _Block_object_dispose(&v21, 8);
    id v11 = objc_alloc_init(v10);
    [(UIDocumentProperties *)self _setMetadataProvider:v11];
    v12 = [(UIDocumentProperties *)self url];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke_2;
    v16[3] = &unk_1E530E130;
    v16[4] = self;
    [v11 startFetchingMetadataForURL:v12 completionHandler:v16];

    return;
  }
  objc_super v13 = [(UIDocumentProperties *)self _metadata];
  if (!v13)
  {
    v14 = [(UIDocumentProperties *)self _metadataProvider];

    if (v14) {
      return;
    }
    goto LABEL_2;
  }
}

void __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    int v4 = [WeakRetained url];
    id v5 = *(void **)(a1 + 32);

    if (v4 == v5) {
      [WeakRetained setUrl:v6];
    }
  }
  [WeakRetained _fetchMetadataIfNecessary:1];
}

void __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v7 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v8 = _UIInternalPreference_UIDocumentHeaderMetadataReloadDelay;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UIDocumentHeaderMetadataReloadDelay)
      {
        while (v7 >= v8)
        {
          _UIInternalPreferenceSync(v7, &_UIInternalPreference_UIDocumentHeaderMetadataReloadDelay, @"UIDocumentHeaderMetadataReloadDelay", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
          int v8 = _UIInternalPreference_UIDocumentHeaderMetadataReloadDelay;
          if (v7 == _UIInternalPreference_UIDocumentHeaderMetadataReloadDelay) {
            goto LABEL_5;
          }
        }
        unsigned int v9 = qword_1E8FD5530;
        if (qword_1E8FD5530 >= 1)
        {
          v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("DocumentProperties", &_UIDocumentPropertiesHeaderPointerRegionShare_block_invoke___s_category)+ 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v14 = v9;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Delaying reload by %d seconds for debugging purposes.", buf, 8u);
          }
          sleep(v9);
        }
      }
    }
LABEL_5:
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke_24;
    v11[3] = &unk_1E52D9F98;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

uint64_t __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didLoadMetadata:*(void *)(a1 + 40)];
}

- (id)_headerViewForMenuInteraction:(id)a3 sourceViewProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);

  if (WeakRetained)
  {
    unsigned int v9 = (_UIDocumentPropertiesHeaderView *)objc_loadWeakRetained((id *)&self->_headerView);
  }
  else
  {
    v10 = [_UIDocumentPropertiesHeaderView alloc];
    id v11 = [(UIDocumentProperties *)self _metadata];
    if (v11)
    {
      unsigned int v9 = [(_UIDocumentPropertiesHeaderView *)v10 initWithProperties:self metadata:v11 menuInteraction:v6 sourceViewProvider:v7];
    }
    else
    {
      id v12 = [(UIDocumentProperties *)self _placeholderMetadata];
      unsigned int v9 = [(_UIDocumentPropertiesHeaderView *)v10 initWithProperties:self metadata:v12 menuInteraction:v6 sourceViewProvider:v7];
    }
    objc_storeWeak((id *)&self->_headerView, v9);
    [(UIDocumentProperties *)self _fetchMetadataIfNecessary:0];
  }

  return v9;
}

- (id)_iconView
{
  p_iconView = &self->_iconView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);

  if (WeakRetained)
  {
    id v5 = (_UIDocumentPropertiesIconView *)objc_loadWeakRetained((id *)p_iconView);
  }
  else
  {
    id v6 = [_UIDocumentPropertiesIconView alloc];
    id v7 = [(UIDocumentProperties *)self _metadata];
    if (v7)
    {
      id v5 = [(_UIDocumentPropertiesIconView *)v6 initWithProperties:self metadata:v7];
    }
    else
    {
      int v8 = [(UIDocumentProperties *)self _placeholderMetadata];
      id v5 = [(_UIDocumentPropertiesIconView *)v6 initWithProperties:self metadata:v8];
    }
    objc_storeWeak((id *)p_iconView, v5);
    [(UIDocumentProperties *)self _fetchMetadataIfNecessary:0];
  }
  return v5;
}

- (NSURL)_representedURL
{
  v3 = [(UIDocumentProperties *)self url];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(UIDocumentProperties *)self metadata];
    id v5 = [v6 originalURL];
  }
  return (NSURL *)v5;
}

- (void)setActivityViewControllerProvider:(void *)activityViewControllerProvider
{
  int v4 = (void *)[activityViewControllerProvider copy];
  id v5 = self->_activityViewControllerProvider;
  self->_activityViewControllerProvider = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
  [WeakRetained update];
}

- (void)_performBlockAndCallIconRepresentationChangedHandlerIfNecessary:(id)a3
{
  int v4 = (void (**)(void))a3;
  BOOL v5 = [(UIDocumentProperties *)self wantsIconRepresentation];
  v4[2](v4);

  BOOL v6 = [(UIDocumentProperties *)self wantsIconRepresentation];
  id wantsIconRepresentationChangedHandler = self->__wantsIconRepresentationChangedHandler;
  int v8 = v5 ^ v6;
  if (wantsIconRepresentationChangedHandler) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v10 = (void (*)(void))*((void *)wantsIconRepresentationChangedHandler + 2);
    v10();
  }
}

- (BOOL)wantsIconRepresentation
{
  return self->_iconRepresentationAction || self->_wantsIconRepresentation;
}

- (void)setWantsIconRepresentation:(BOOL)wantsIconRepresentation
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__UIDocumentProperties_setWantsIconRepresentation___block_invoke;
  v3[3] = &unk_1E52D9FC0;
  v3[4] = self;
  BOOL v4 = wantsIconRepresentation;
  [(UIDocumentProperties *)self _performBlockAndCallIconRepresentationChangedHandlerIfNecessary:v3];
}

uint64_t __51__UIDocumentProperties_setWantsIconRepresentation___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setIconRepresentationAction:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__UIDocumentProperties_setIconRepresentationAction___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIDocumentProperties *)self _performBlockAndCallIconRepresentationChangedHandlerIfNecessary:v6];
}

void __52__UIDocumentProperties_setIconRepresentationAction___block_invoke(uint64_t a1)
{
}

- (void)_setAssociatedNavigationItem:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_associatedNavigationItem = &self->_associatedNavigationItem;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedNavigationItem);
  id v7 = WeakRetained;
  if (WeakRetained != v4 && v4 != 0 && WeakRetained != 0)
  {
    v10 = *(id *)(__UILogGetCategoryCachedImpl("UINavigationItem", &_setAssociatedNavigationItem____s_category)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v11 = NSString;
        id v12 = self;
        objc_super v13 = (objc_class *)objc_opt_class();
        unsigned int v14 = NSStringFromClass(v13);
        uint64_t v15 = [v11 stringWithFormat:@"<%@: %p>", v14, v12];
      }
      else
      {
        uint64_t v15 = @"(nil)";
      }
      v16 = NSString;
      id v17 = v4;
      v27 = v15;
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      v20 = [v16 stringWithFormat:@"<%@: %p>", v19, v17];

      uint64_t v21 = NSString;
      id v22 = v7;
      id v23 = v20;
      uint64_t v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      v26 = [v21 stringWithFormat:@"<%@: %p>", v25, v22];

      *(_DWORD *)buf = 138412802;
      v29 = v15;
      __int16 v30 = 2112;
      v31 = v20;
      __int16 v32 = 2112;
      v33 = v26;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Setting %@ as the documentProperties object on %@ while already associated with %@ will result in the old navigation item's documentProperties to become nil.", buf, 0x20u);
    }
    [v7 setDocumentProperties:0];
  }
  objc_storeWeak((id *)p_associatedNavigationItem, v4);
}

- (id)_placeholderMetadata
{
  id v4 = [(UIDocumentProperties *)self url];
  if (!v4)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIDocumentProperties.m", 250, @"No URL available, unable to create placeholder metadata. This is a UIKit bug." object file lineNumber description];
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v5 = (void *)getLPLinkMetadataClass_softClass;
  uint64_t v14 = getLPLinkMetadataClass_softClass;
  if (!getLPLinkMetadataClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getLPLinkMetadataClass_block_invoke_0;
    v10[3] = &unk_1E52D9900;
    v10[4] = &v11;
    __getLPLinkMetadataClass_block_invoke_0((uint64_t)v10);
    id v5 = (void *)v12[3];
  }
  BOOL v6 = v5;
  _Block_object_dispose(&v11, 8);
  id v7 = objc_alloc_init(v6);
  [v7 setOriginalURL:v4];
  [v7 setURL:v4];

  return v7;
}

- (void)_setMetadata:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIDocumentProperties.m", 261, @"Invalid parameter not satisfying: %@", @"metadata != nil" object file lineNumber description];
  }
  if (pthread_main_np() != 1)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"UIDocumentProperties.m" lineNumber:265 description:@"Call must be made on main thread"];
  }
  [(UIDocumentProperties *)self _setMetadataProvider:0];
  BOOL v6 = (void *)[v5 copy];
  objc_storeStrong((id *)&self->_metadata, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__UIDocumentProperties__setMetadata___block_invoke;
  v10[3] = &unk_1E52DA660;
  id v11 = v6;
  id v12 = self;
  id v7 = v6;
  [v7 _loadAsynchronousFieldsWithUpdateHandler:v10];
}

void __37__UIDocumentProperties__setMetadata___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) _metadata];

    if (v3 == v4)
    {
      id v5 = *(void **)(a1 + 40);
      [v5 _updateMetadataInUse];
    }
  }
}

- (void)_updateMetadataInUse
{
  if (pthread_main_np() != 1)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIDocumentProperties.m" lineNumber:289 description:@"Call must be made on main thread"];
  }
  metadata = self->_metadata;
  id v5 = [(UIDocumentProperties *)self headerView];
  BOOL v6 = [v5 linkView];
  [v6 setMetadata:metadata];

  id v7 = self->_metadata;
  id v9 = [(UIDocumentProperties *)self iconView];
  [v9 setMetadata:v7];
}

- (void)_setMetadataProvider:(id)a3
{
  id v4 = (LPMetadataProvider *)a3;
  [(LPMetadataProvider *)self->__metadataProvider cancel];
  metadataProvider = self->__metadataProvider;
  self->__metadataProvider = v4;
}

- (void)setMetadata:(LPLinkMetadata *)metadata
{
  [(UIDocumentProperties *)self _setMetadata:metadata];
  [(UIDocumentProperties *)self _setMetadataProvider:0];
  [(UIDocumentProperties *)self setUrl:0];
  id v4 = [(UIDocumentProperties *)self urlChangeObserver];
  int v5 = [v4 isObserving];

  if (v5)
  {
    BOOL v6 = [(UIDocumentProperties *)self urlChangeObserver];
    [v6 stopObserving];
  }
  [(UIDocumentProperties *)self setUrlChangeObserver:0];
}

- (LPLinkMetadata)metadata
{
  v3 = [(UIDocumentProperties *)self _metadata];
  id v4 = (void *)[v3 copy];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIDocumentProperties *)self _placeholderMetadata];
  }
  id v7 = v6;

  return (LPLinkMetadata *)v7;
}

- (UINavigationItem)_associatedNavigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedNavigationItem);
  return (UINavigationItem *)WeakRetained;
}

- (LPLinkMetadata)_metadata
{
  return self->_metadata;
}

- (void)dragItemsProvider
{
  return self->_dragItemsProvider;
}

- (void)setDragItemsProvider:(void *)dragItemsProvider
{
}

- (void)activityViewControllerProvider
{
  return self->_activityViewControllerProvider;
}

- (_UIDocumentPropertiesHeaderView)headerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
  return (_UIDocumentPropertiesHeaderView *)WeakRetained;
}

- (void)setHeaderView:(id)a3
{
}

- (_UIDocumentPropertiesIconView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  return (_UIDocumentPropertiesIconView *)WeakRetained;
}

- (void)setIconView:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (_UIDocumentURLChangeObserver)urlChangeObserver
{
  return self->_urlChangeObserver;
}

- (void)setUrlChangeObserver:(id)a3
{
}

- (LPMetadataProvider)_metadataProvider
{
  return self->__metadataProvider;
}

- (id)_wantsIconRepresentationChangedHandler
{
  return self->__wantsIconRepresentationChangedHandler;
}

- (void)_setWantsIconRepresentationChangedHandler:(id)a3
{
}

- (UIAction)iconRepresentationAction
{
  return self->_iconRepresentationAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconRepresentationAction, 0);
  objc_storeStrong(&self->__wantsIconRepresentationChangedHandler, 0);
  objc_storeStrong((id *)&self->__metadataProvider, 0);
  objc_storeStrong((id *)&self->_urlChangeObserver, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_headerView);
  objc_storeStrong(&self->_activityViewControllerProvider, 0);
  objc_storeStrong(&self->_dragItemsProvider, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_associatedNavigationItem);
}

@end