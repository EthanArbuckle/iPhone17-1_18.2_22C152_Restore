@interface SBHFileWidgetExtensionProvider
- (BOOL)_extensionHasTransparencyEntitlement:(id)a3;
- (BOOL)widgetHasTransparentBackground;
- (SBHFileWidgetExtensionProvider)init;
- (id)_preferredExtensionIdentifier;
- (id)filesWidgetViewControllerWithConfiguration:(id)a3;
- (void)_setupHostViewController:(id)a3;
- (void)setWidgetConfiguration:(id)a3;
- (void)setWidgetHasTransparentBackground:(BOOL)a3;
@end

@implementation SBHFileWidgetExtensionProvider

- (SBHFileWidgetExtensionProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHFileWidgetExtensionProvider;
  v2 = [(SBHRecentsDocumentExtensionProvider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(SBHRecentsDocumentExtensionProvider *)v2 extension];
    if (v4) {
      v3->_widgetHasTransparentBackground = [(SBHFileWidgetExtensionProvider *)v3 _extensionHasTransparencyEntitlement:v4];
    }
  }
  return v3;
}

- (id)filesWidgetViewControllerWithConfiguration:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SBHRecentsDocumentExtensionProvider *)self wrappingViewController];
  objc_super v6 = [(SBHRecentsDocumentExtensionProvider *)self hostViewController];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__SBHFileWidgetExtensionProvider_filesWidgetViewControllerWithConfiguration___block_invoke;
  aBlock[3] = &unk_1E6AAF930;
  id v7 = v4;
  id v39 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v6)
  {
    v9 = [(SBHRecentsDocumentExtensionProvider *)self remoteService];
    v8[2](v8, v9);

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v40[0] = v5;
    v40[1] = v6;
    v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v40, 2, 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v32 + 1) + 8 * i) view];
          [v15 frame];
          double v17 = v16;
          double v19 = v18;
          [(SBHRecentsDocumentExtensionProvider *)self compactPreferredContentSize];
          objc_msgSend(v15, "setFrame:", v17, v19, v20, v21);
          [v15 setNeedsLayout];
          [v15 setNeedsUpdateConstraints];
          [v15 layoutIfNeeded];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
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
      v22 = SBLogRecentsDocumentExtension();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SBHRecentsDocumentExtensionProvider recentsDocumentViewControllerForBundleIdentifier:](v22, v23, v24, v25, v26, v27, v28, v29);
      }

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __77__SBHFileWidgetExtensionProvider_filesWidgetViewControllerWithConfiguration___block_invoke_130;
      v36[3] = &unk_1E6AAF958;
      v36[4] = self;
      v37 = v8;
      [(SBHRecentsDocumentExtensionProvider *)self _loadExtensionWithCompletion:v36];
    }
  }

  id v30 = v5;
  return v30;
}

uint64_t __77__SBHFileWidgetExtensionProvider_filesWidgetViewControllerWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateForWidgetConfiguration:*(void *)(a1 + 32)];
}

uint64_t __77__SBHFileWidgetExtensionProvider_filesWidgetViewControllerWithConfiguration___block_invoke_130(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadRemoteViewControllerWithConfiguration:*(void *)(a1 + 40)];
}

- (void)setWidgetConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHRecentsDocumentExtensionProvider *)self remoteService];
  [v5 _updateForWidgetConfiguration:v4];
}

- (id)_preferredExtensionIdentifier
{
  return @"com.apple.DocumentManagerUICore.RecentsAvocado";
}

- (void)_setupHostViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHFileWidgetExtensionProvider;
  id v3 = a3;
  [(SBHRecentsDocumentExtensionProvider *)&v4 _setupHostViewController:v3];
  objc_msgSend(v3, "setServiceViewShouldShareTouchesWithHost:", 1, v4.receiver, v4.super_class);
}

- (BOOL)_extensionHasTransparencyEntitlement:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F223A0];
  id v4 = a3;
  id v5 = [v3 alloc];
  objc_super v6 = [v4 identifier];

  id v7 = (void *)[v5 initWithBundleIdentifier:v6 error:0];
  v8 = [v7 entitlements];
  v9 = [v8 objectForKey:@"com.apple.springboard.temporary.files-widget-transparency" ofClass:objc_opt_class()];
  char v10 = [v9 BOOLValue];

  return v10;
}

- (BOOL)widgetHasTransparentBackground
{
  return self->_widgetHasTransparentBackground;
}

- (void)setWidgetHasTransparentBackground:(BOOL)a3
{
  self->_widgetHasTransparentBackground = a3;
}

@end