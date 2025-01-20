@interface WBSSafariExtensionStateObserver
- (BOOL)_shouldObserveExtension:(id)a3;
- (BOOL)_teardownObserverIfNecessary;
- (WBSSafariExtensionStateObserver)init;
- (WBSSafariExtensionStateObserver)initWithWebView:(id)a3 extensionsController:(id)a4;
- (void)_addIDsForExtension:(id)a3 toSet:(id)a4;
- (void)_addNamesForExtension:(id)a3 toMap:(id)a4;
- (void)_handleExtensionEnabledStateDidChange:(id)a3;
- (void)_handleExtensionWasAdded:(id)a3;
- (void)_handleExtensionWasRemoved:(id)a3;
- (void)_startObservingExtensionNotifications;
- (void)_stopObservingExtensionNotifications;
- (void)dealloc;
- (void)startObservingExtensionStateChanges;
@end

@implementation WBSSafariExtensionStateObserver

- (WBSSafariExtensionStateObserver)init
{
  return 0;
}

- (WBSSafariExtensionStateObserver)initWithWebView:(id)a3 extensionsController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSSafariExtensionStateObserver;
  v8 = [(WBSSafariExtensionStateObserver *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_webView, v6);
    objc_storeWeak((id *)&v9->_extensionsController, v7);
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  [(WBSSafariExtensionStateObserver *)self _stopObservingExtensionNotifications];
  v3.receiver = self;
  v3.super_class = (Class)WBSSafariExtensionStateObserver;
  [(WBSSafariExtensionStateObserver *)&v3 dealloc];
}

- (void)startObservingExtensionStateChanges
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(WBSSafariExtensionStateObserver *)self _startObservingExtensionNotifications];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
  v5 = objc_msgSend(WeakRetained, "enabledExtensions", 0);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        [(WBSSafariExtensionStateObserver *)self _addNamesForExtension:*(void *)(*((void *)&v10 + 1) + 8 * v8++) toMap:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    id v9 = objc_loadWeakRetained((id *)&self->_webView);
    [v9 _didEnableBrowserExtensions:v3];
  }
}

- (void)_startObservingExtensionNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleExtensionWasAdded_ name:*MEMORY[0x1E4F98568] object:0];
  [v3 addObserver:self selector:sel__handleExtensionWasRemoved_ name:*MEMORY[0x1E4F98570] object:0];
  [v3 addObserver:self selector:sel__handleExtensionEnabledStateDidChange_ name:*MEMORY[0x1E4F984D0] object:0];
}

- (void)_stopObservingExtensionNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F98568] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F98570] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F984D0] object:0];
}

- (BOOL)_shouldObserveExtension:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
  uint64_t v6 = objc_msgSend(v4, "sf_uniqueIdentifier");
  uint64_t v7 = [WeakRetained extensionWithUUID:v6];
  BOOL v8 = v7 != 0;

  return v8;
}

- (BOOL)_teardownObserverIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)&self->_extensionsController);

    if (v5) {
      return 0;
    }
  }
  [(WBSSafariExtensionStateObserver *)self _stopObservingExtensionNotifications];
  return 1;
}

- (void)_handleExtensionWasAdded:(id)a3
{
  id v9 = a3;
  if (![(WBSSafariExtensionStateObserver *)self _teardownObserverIfNecessary])
  {
    id v4 = [v9 object];
    if ([(WBSSafariExtensionStateObserver *)self _shouldObserveExtension:v4])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
      char v6 = [WeakRetained extensionIsEnabled:v4];

      if (v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
        [(WBSSafariExtensionStateObserver *)self _addNamesForExtension:v4 toMap:v7];
        id v8 = objc_loadWeakRetained((id *)&self->_webView);
        [v8 _didEnableBrowserExtensions:v7];
      }
    }
  }
}

- (void)_handleExtensionWasRemoved:(id)a3
{
  id v9 = a3;
  if (![(WBSSafariExtensionStateObserver *)self _teardownObserverIfNecessary])
  {
    id v4 = [v9 object];
    if ([(WBSSafariExtensionStateObserver *)self _shouldObserveExtension:v4])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
      char v6 = [WeakRetained extensionIsEnabled:v4];

      if (v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
        [(WBSSafariExtensionStateObserver *)self _addIDsForExtension:v4 toSet:v7];
        id v8 = objc_loadWeakRetained((id *)&self->_webView);
        [v8 _didDisableBrowserExtensions:v7];
      }
    }
  }
}

- (void)_handleExtensionEnabledStateDidChange:(id)a3
{
  id v9 = a3;
  if (![(WBSSafariExtensionStateObserver *)self _teardownObserverIfNecessary])
  {
    id v4 = [v9 object];
    if ([(WBSSafariExtensionStateObserver *)self _shouldObserveExtension:v4])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
      id v6 = objc_loadWeakRetained((id *)&self->_extensionsController);
      int v7 = [v6 extensionIsEnabled:v4];

      if (v7)
      {
        id v8 = [MEMORY[0x1E4F1CA60] dictionary];
        [(WBSSafariExtensionStateObserver *)self _addNamesForExtension:v4 toMap:v8];
        [WeakRetained _didEnableBrowserExtensions:v8];
      }
      else
      {
        id v8 = [MEMORY[0x1E4F1CA80] set];
        [(WBSSafariExtensionStateObserver *)self _addIDsForExtension:v4 toSet:v8];
        [WeakRetained _didDisableBrowserExtensions:v8];
      }
    }
  }
}

- (void)_addNamesForExtension:(id)a3 toMap:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
  id v8 = [WeakRetained extensionDataForExtension:v12];
  id v9 = [v8 displayName];
  long long v10 = [v8 safariExtensionBaseURI];
  long long v11 = [v10 host];
  [v6 setObject:v9 forKeyedSubscript:v11];
}

- (void)_addIDsForExtension:(id)a3 toSet:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
  id v8 = [WeakRetained extensionDataForExtension:v11];

  id v9 = [v8 safariExtensionBaseURI];
  long long v10 = [v9 host];

  if (v10) {
    [v6 addObject:v10];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionsController);
  objc_destroyWeak((id *)&self->_webView);
}

@end