@interface SYDocumentWorkflowsActivityObserver
- (SYDocumentWorkflowsActivityChangeHandler)handler;
- (SYDocumentWorkflowsActivityObserver)init;
- (void)_handleActiveUserActivityChange:(id)a3;
- (void)_handleActiveUserActivityChangeAfterDelay:(id)a3;
- (void)_handleAppBecomeActive:(id)a3;
- (void)_handleAppResignActive:(id)a3;
- (void)_updateLinkedDocuments;
- (void)dealloc;
- (void)registerForAppStateNotifications;
- (void)setHandler:(id)a3;
- (void)userActivityDidBecomeCurrent:(id)a3 current:(BOOL)a4;
- (void)userActivityPersistentIdentifierWasChanged:(id)a3 persistentIdentifier:(id)a4 previousValue:(id)a5;
@end

@implementation SYDocumentWorkflowsActivityObserver

- (void)_handleActiveUserActivityChangeAfterDelay:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_appStateObserver);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke;
  block[3] = &unk_1E6463EA0;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));

    if (v5)
    {
      id v6 = objc_loadWeakRetained(v2);
      v7 = [v6 handler];
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = objc_loadWeakRetained((id *)(a1 + 48));
      LOBYTE(v8) = [v7 canHandleUserActivityChange:v8 appStateObserver:v9];

      if (v8)
      {
        id v12 = objc_loadWeakRetained(v2);
        id v10 = [v12 handler];
        [v10 handleActiveUserActivityChange:*(void *)(a1 + 32) withCompletion:&__block_literal_global_6];
      }
      else
      {
        v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_INFO, "Can't handle user activity change", buf, 2u);
        }
      }
    }
  }
}

- (SYDocumentWorkflowsActivityChangeHandler)handler
{
  return self->_handler;
}

- (void)registerForAppStateNotifications
{
  if (!self->_appStateObserver)
  {
    objc_initWeak(&location, self);
    v3 = [SYApplicationStateObserver alloc];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__SYDocumentWorkflowsActivityObserver_registerForAppStateNotifications__block_invoke;
    v8[3] = &unk_1E6463E30;
    objc_copyWeak(&v9, &location);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__SYDocumentWorkflowsActivityObserver_registerForAppStateNotifications__block_invoke_2;
    v6[3] = &unk_1E6463E30;
    objc_copyWeak(&v7, &location);
    id v4 = [(SYApplicationStateObserver *)v3 initWithBecomeActiveHandler:v8 resignActiveHandler:v6];
    appStateObserver = self->_appStateObserver;
    self->_appStateObserver = v4;

    [(SYApplicationStateObserver *)self->_appStateObserver registerForAppStateNotifications];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (SYDocumentWorkflowsActivityObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)SYDocumentWorkflowsActivityObserver;
  v2 = [(SYDocumentWorkflowsActivityObserver *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.DocumentWorkflowActivityObserver", v3);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc_init(SYDocumentWorkflowsActivityChangeHandler);
    handler = v2->_handler;
    v2->_handler = v6;
  }
  return v2;
}

void __71__SYDocumentWorkflowsActivityObserver_registerForAppStateNotifications__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleAppBecomeActive:v3];
}

- (void)_handleAppBecomeActive:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "application did become active: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SYDocumentWorkflowsActivityObserver__handleAppBecomeActive___block_invoke;
  v6[3] = &unk_1E6463E58;
  void v6[4] = self;
  [MEMORY[0x1E4F22488] _syFetchCurrentUserActivityWithCompletion:v6];
}

- (void)userActivityDidBecomeCurrent:(id)a3 current:(BOOL)a4
{
  id v5 = a3;
  id v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_INFO, "user activity did become current", v7, 2u);
  }

  [(SYDocumentWorkflowsActivityObserver *)self _handleActiveUserActivityChange:v5];
}

- (void)_handleActiveUserActivityChange:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v5 = a3;
  [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel__handleActiveUserActivityChangeAfterDelay_ object:v5];
  [(SYDocumentWorkflowsActivityObserver *)self performSelector:sel__handleActiveUserActivityChangeAfterDelay_ withObject:v5 afterDelay:0.1];
}

uint64_t __62__SYDocumentWorkflowsActivityObserver__handleAppBecomeActive___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _handleActiveUserActivityChange:a2];
  }
  return result;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_INFO, "deallocating: %p", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)SYDocumentWorkflowsActivityObserver;
  [(SYDocumentWorkflowsActivityObserver *)&v4 dealloc];
}

void __71__SYDocumentWorkflowsActivityObserver_registerForAppStateNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleAppResignActive:v3];
}

- (void)_handleAppResignActive:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "application did resign active: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SYDocumentWorkflowsActivityObserver *)self _updateLinkedDocuments];
}

- (void)userActivityPersistentIdentifierWasChanged:(id)a3 persistentIdentifier:(id)a4 previousValue:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_INFO, "user activity persistent identifier was changed from %@ to %@", (uint8_t *)&v12, 0x16u);
  }

  [(SYDocumentWorkflowsActivityObserver *)self _handleActiveUserActivityChange:v10];
}

void __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke_12(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke_12_cold_1((uint64_t)v4, v5);
    }
  }
}

- (void)_updateLinkedDocuments
{
  if (SYIsMailApp())
  {
    v2 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_INFO, "Updating linked documents started...", v4, 2u);
    }

    id v3 = objc_alloc_init(SYDocumentWorkflowsClient);
    [(SYDocumentWorkflowsClient *)v3 updateLinkedDocumentsWithCompletion:&__block_literal_global_17];
  }
}

void __61__SYDocumentWorkflowsActivityObserver__updateLinkedDocuments__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __61__SYDocumentWorkflowsActivityObserver__updateLinkedDocuments__block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
  int v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_INFO, "Updating linked documents finished, success: %d", (uint8_t *)v7, 8u);
  }
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_closeConfirmationSettings, 0);
  objc_storeStrong((id *)&self->_appStateObserver, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

void __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Handling user activity change failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void __61__SYDocumentWorkflowsActivityObserver__updateLinkedDocuments__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Unable to update linked documents, error: %@", (uint8_t *)&v2, 0xCu);
}

@end