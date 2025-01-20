@interface SBHRecentsDocumentExtensionProvider
- (BOOL)canShowRecentsDocumentExtensionProviderForBundleIdentifier:(id)a3;
- (BOOL)recentsDocumentExtensionWrappingViewControllerHasTransparentContent:(id)a3;
- (BOOL)usesIntrinsicContentSizeBasedOnScreenSize;
- (CGSize)compactPreferredContentSize;
- (NSExtension)extension;
- (SBHRecentsDocumentExtensionProvider)init;
- (SBHRecentsDocumentExtensionProviderDelegate)delegate;
- (SBHRecentsDocumentExtensionWrappingViewController)wrappingViewController;
- (SBUIPopoverExtensionHostViewController)hostViewController;
- (_SBUIPopoverExtensionRemoteInterface)remoteService;
- (id)_preferredExtensionIdentifier;
- (id)_viewControllerConfiguration:(id)a3;
- (id)recentsDocumentViewControllerForBundleIdentifier:(id)a3;
- (void)_extensionWillExit:(id)a3;
- (void)_loadExtensionWithCompletion:(id)a3;
- (void)_loadRemoteViewControllerWithConfiguration:(id)a3;
- (void)_setupHostViewController:(id)a3;
- (void)_teardownHostViewController;
- (void)dealloc;
- (void)popoverHostExtensionDidExit:(id)a3;
- (void)popoverHostExtensionRequestsDismiss:(id)a3;
- (void)setCompactPreferredContentSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setRemoteService:(id)a3;
- (void)setUsesIntrinsicContentSizeBasedOnScreenSize:(BOOL)a3;
- (void)setWrappingViewController:(id)a3;
@end

@implementation SBHRecentsDocumentExtensionProvider

- (SBHRecentsDocumentExtensionProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBHRecentsDocumentExtensionProvider;
  v2 = [(SBHRecentsDocumentExtensionProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(SBHRecentsDocumentExtensionProvider *)v2 _loadExtensionWithCompletion:0];
    uint64_t v4 = objc_opt_new();
    wrappingViewController = v3->_wrappingViewController;
    v3->_wrappingViewController = (SBHRecentsDocumentExtensionWrappingViewController *)v4;

    [(SBHRecentsDocumentExtensionWrappingViewController *)v3->_wrappingViewController setDelegate:v3];
  }
  return v3;
}

- (void)dealloc
{
  [(SBHRecentsDocumentExtensionProvider *)self _teardownHostViewController];
  v3.receiver = self;
  v3.super_class = (Class)SBHRecentsDocumentExtensionProvider;
  [(SBHRecentsDocumentExtensionProvider *)&v3 dealloc];
}

- (BOOL)usesIntrinsicContentSizeBasedOnScreenSize
{
  return [(SBHRecentsDocumentExtensionWrappingViewController *)self->_wrappingViewController usesIntrinsicContentSizeBasedOnScreenSize];
}

- (void)setUsesIntrinsicContentSizeBasedOnScreenSize:(BOOL)a3
{
}

- (BOOL)canShowRecentsDocumentExtensionProviderForBundleIdentifier:(id)a3
{
  return MEMORY[0x1F4117750](a3, a2);
}

- (id)recentsDocumentViewControllerForBundleIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SBHRecentsDocumentExtensionProvider *)self wrappingViewController];
  v6 = [(SBHRecentsDocumentExtensionProvider *)self hostViewController];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__SBHRecentsDocumentExtensionProvider_recentsDocumentViewControllerForBundleIdentifier___block_invoke;
  aBlock[3] = &unk_1E6AAF930;
  id v7 = v4;
  id v33 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v6)
  {
    v9 = [(SBHRecentsDocumentExtensionProvider *)self remoteService];
    v8[2](v8, v9);

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v34[0] = v5;
    v34[1] = v6;
    v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v34, 2, 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v26 + 1) + 8 * i) view];
          [v15 frame];
          objc_msgSend(v15, "setFrame:");
          [v15 setNeedsLayout];
          [v15 setNeedsUpdateConstraints];
          [v15 layoutIfNeeded];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v12);
    }
  }
  else
  {
    v10 = [(SBHRecentsDocumentExtensionProvider *)self extension];
    if (v10)
    {
      [(SBHRecentsDocumentExtensionProvider *)self _loadRemoteViewControllerWithConfiguration:v8];
    }
    else
    {
      v16 = SBLogRecentsDocumentExtension();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SBHRecentsDocumentExtensionProvider recentsDocumentViewControllerForBundleIdentifier:](v16, v17, v18, v19, v20, v21, v22, v23);
      }

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __88__SBHRecentsDocumentExtensionProvider_recentsDocumentViewControllerForBundleIdentifier___block_invoke_13;
      v30[3] = &unk_1E6AAF958;
      v30[4] = self;
      v31 = v8;
      [(SBHRecentsDocumentExtensionProvider *)self _loadExtensionWithCompletion:v30];
    }
  }

  id v24 = v5;
  return v24;
}

uint64_t __88__SBHRecentsDocumentExtensionProvider_recentsDocumentViewControllerForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateForBundleIdentifier:*(void *)(a1 + 32)];
}

uint64_t __88__SBHRecentsDocumentExtensionProvider_recentsDocumentViewControllerForBundleIdentifier___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadRemoteViewControllerWithConfiguration:*(void *)(a1 + 40)];
}

- (void)popoverHostExtensionRequestsDismiss:(id)a3
{
  id v5 = [(SBHRecentsDocumentExtensionProvider *)self delegate];
  id v4 = [(SBHRecentsDocumentExtensionProvider *)self wrappingViewController];
  [v5 recentsDocumentExtensionViewControllerRequestsDismiss:v4];
}

- (void)popoverHostExtensionDidExit:(id)a3
{
  [(SBHRecentsDocumentExtensionProvider *)self _extensionWillExit:a3];
  id v5 = [(SBHRecentsDocumentExtensionProvider *)self delegate];
  id v4 = [(SBHRecentsDocumentExtensionProvider *)self wrappingViewController];
  [v5 recentsDocumentExtensionViewControllerRequestsDismiss:v4];
}

- (BOOL)recentsDocumentExtensionWrappingViewControllerHasTransparentContent:(id)a3
{
  return 0;
}

- (void)_extensionWillExit:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHRecentsDocumentExtensionProvider *)self delegate];
  [v5 recentsDocumentExtensionViewControllerRequestsDismiss:v4];

  [(SBHRecentsDocumentExtensionProvider *)self setExtension:0];
  [(SBHRecentsDocumentExtensionProvider *)self _teardownHostViewController];
}

- (id)_preferredExtensionIdentifier
{
  return @"com.apple.DocumentManagerUICore.RecentsAppPopover";
}

- (void)_loadExtensionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = objc_opt_new();
  [v5 setObject:@"com.apple.internal.springboard.app-popover" forKeyedSubscript:*MEMORY[0x1E4F282B0]];
  v6 = [(SBHRecentsDocumentExtensionProvider *)self _preferredExtensionIdentifier];
  uint64_t v7 = *MEMORY[0x1E4F28290];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28290]];

  id v21 = 0;
  v8 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v5 error:&v21];
  id v9 = v21;
  if ([v8 count]) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v11 = SBLogRecentsDocumentExtension();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBHRecentsDocumentExtensionProvider _loadExtensionWithCompletion:]();
    }

    [v5 removeObjectForKey:v7];
    id v20 = v9;
    uint64_t v12 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v5 error:&v20];
    id v13 = v20;

    v8 = (void *)v12;
  }
  v14 = [v8 firstObject];
  [(SBHRecentsDocumentExtensionProvider *)self setExtension:v14];

  if (v13)
  {
    v15 = SBLogRecentsDocumentExtension();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHRecentsDocumentExtensionProvider _loadExtensionWithCompletion:]();
    }
  }
  if (v4)
  {
    uint64_t v16 = [(SBHRecentsDocumentExtensionProvider *)self extension];
    uint64_t v17 = (void *)v16;
    if (v13) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v16 == 0;
    }
    uint64_t v19 = !v18;
    v4[2](v4, v19);
  }
}

- (id)_viewControllerConfiguration:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(SBHRecentsDocumentExtensionProvider *)self wrappingViewController];
  v6 = [(SBHRecentsDocumentExtensionProvider *)self hostViewController];
  if (v6)
  {
    uint64_t v7 = [(SBHRecentsDocumentExtensionProvider *)self remoteService];
    v4[2](v4, v7);

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v29[0] = v5;
    v29[1] = v6;
    v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 2, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) view];
          [v13 frame];
          objc_msgSend(v13, "setFrame:");
          [v13 setNeedsLayout];
          [v13 setNeedsUpdateConstraints];
          [v13 layoutIfNeeded];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v8 = [(SBHRecentsDocumentExtensionProvider *)self extension];
    if (v8)
    {
      [(SBHRecentsDocumentExtensionProvider *)self _loadRemoteViewControllerWithConfiguration:v4];
    }
    else
    {
      v14 = SBLogRecentsDocumentExtension();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SBHRecentsDocumentExtensionProvider recentsDocumentViewControllerForBundleIdentifier:](v14, v15, v16, v17, v18, v19, v20, v21);
      }

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __68__SBHRecentsDocumentExtensionProvider__viewControllerConfiguration___block_invoke;
      v27[3] = &unk_1E6AAF958;
      v27[4] = self;
      long long v28 = v4;
      [(SBHRecentsDocumentExtensionProvider *)self _loadExtensionWithCompletion:v27];
    }
  }

  return v5;
}

uint64_t __68__SBHRecentsDocumentExtensionProvider__viewControllerConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadRemoteViewControllerWithConfiguration:*(void *)(a1 + 40)];
}

- (void)_loadRemoteViewControllerWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHRecentsDocumentExtensionProvider *)self extension];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke;
  v7[3] = &unk_1E6AAF9A0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 instantiateViewControllerWithInputItems:0 connectionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (v7)
  {
    uint64_t v10 = SBLogRecentsDocumentExtension();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_cold_1();
    }
  }
  else if (WeakRetained)
  {
    id v11 = v6;
    uint64_t v12 = [v11 serviceViewControllerProxyWithErrorHandler:&__block_literal_global_27];
    id v13 = (void *)v9[5];
    v9[5] = v12;

    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = [v9 remoteService];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    [v9 _setupHostViewController:v11];
  }
}

void __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = SBLogRecentsDocumentExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_18_cold_1();
  }
}

- (void)_setupHostViewController:(id)a3
{
  id v4 = a3;
  id v9 = [(SBHRecentsDocumentExtensionProvider *)self wrappingViewController];
  if (!self->_hostViewController)
  {
    [v9 preferredContentSize];
    self->_compactPreferredContentSize.width = v5;
    self->_compactPreferredContentSize.height = v6;
  }
  [v4 setDelegate:self];
  hostViewController = self->_hostViewController;
  self->_hostViewController = (SBUIPopoverExtensionHostViewController *)v4;
  id v8 = v4;

  [v9 wrapRemoteViewController:v8];
}

- (void)_teardownHostViewController
{
  objc_super v3 = [(SBHRecentsDocumentExtensionProvider *)self wrappingViewController];
  [v3 wrapRemoteViewController:0];

  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;

  id v5 = [(SBHRecentsDocumentExtensionProvider *)self remoteService];
  [v5 _invalidateSBUIPopoverExtension];
}

- (SBHRecentsDocumentExtensionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHRecentsDocumentExtensionProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBHRecentsDocumentExtensionWrappingViewController)wrappingViewController
{
  return self->_wrappingViewController;
}

- (void)setWrappingViewController:(id)a3
{
}

- (SBUIPopoverExtensionHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (_SBUIPopoverExtensionRemoteInterface)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
}

- (CGSize)compactPreferredContentSize
{
  double width = self->_compactPreferredContentSize.width;
  double height = self->_compactPreferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCompactPreferredContentSize:(CGSize)a3
{
  self->_compactPreferredContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_wrappingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)recentsDocumentViewControllerForBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_loadExtensionWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Failed to find extensions with error %@", v2, v3, v4, v5, v6);
}

- (void)_loadExtensionWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Failed to find extensions with error %@, falling back to basic attributes", v2, v3, v4, v5, v6);
}

void __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Failed to instantiate SBUIPopoverExtensionHostViewController from extension with error %@", v2, v3, v4, v5, v6);
}

void __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Failed to get remote service with error %@", v2, v3, v4, v5, v6);
}

@end