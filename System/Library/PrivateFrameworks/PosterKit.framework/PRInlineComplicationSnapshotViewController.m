@interface PRInlineComplicationSnapshotViewController
- (BOOL)isComplicationUserInteractionEnabled;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (PRComplicationDescriptor)complicationDescriptor;
- (PRInlineComplicationSnapshotViewController)initWithComplicationDescriptor:(id)a3;
- (PRInlineComplicationSnapshotViewController)initWithScene:(id)a3 complicationLayoutProvider:(id)a4;
- (id)_hostViewControllerForComplicationDescriptor:(id)a3;
- (void)complicationsDidEndDisplaying;
- (void)complicationsWillDisplay;
- (void)invalidate;
- (void)setComplicationDescriptor:(id)a3;
- (void)setComplicationUserInteractionEnabled:(BOOL)a3;
- (void)setVibrancyConfiguration:(id)a3;
- (void)viewDidLoad;
@end

@implementation PRInlineComplicationSnapshotViewController

- (PRInlineComplicationSnapshotViewController)initWithComplicationDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRInlineComplicationSnapshotViewController;
  v6 = [(PRInlineComplicationSnapshotViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_complicationDescriptor, a3);
  }

  return v7;
}

- (PRInlineComplicationSnapshotViewController)initWithScene:(id)a3 complicationLayoutProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_scene, a3);
  objc_super v9 = [v7 settings];
  v10 = objc_msgSend(v9, "pui_posterContents");

  v11 = [v10 identity];
  if ([v11 type] == 3)
  {
    id v12 = [[PRPosterConfiguration alloc] _initWithPath:v10];
    id v26 = 0;
    v13 = [v12 loadComplicationLayoutWithError:&v26];
    id v14 = v26;
    if (v14)
    {
      v15 = PRLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PRWidgetGridSnapshotViewController initWithScene:complicationLayoutProvider:gridType:]((uint64_t)v12, (uint64_t)v14, v15);
      }
      v16 = 0;
    }
    else
    {
      v21 = [PRComplicationDescriptor alloc];
      v15 = [v13 inlineComplication];
      v16 = [(PRComplicationDescriptor *)v21 initWithPRSWidget:v15];
    }
  }
  else
  {
    v17 = [v7 settings];
    objc_msgSend(v17, "pui_previewIdentifier");
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    v18 = [v8 complicationLayoutForPreviewIdentifier:v12];
    v19 = [PRComplicationDescriptor alloc];
    v20 = [v18 inlineComplication];
    v16 = [(PRComplicationDescriptor *)v19 initWithPRSWidget:v20];
  }
  if (![(PRComplicationDescriptor *)v16 hasMatchingDescriptor])
  {

    v16 = 0;
  }
  v22 = [(PRInlineComplicationSnapshotViewController *)self initWithComplicationDescriptor:v16];
  if (v22)
  {
    v23 = [v7 clientSettings];
    v24 = objc_msgSend(v23, "pr_vibrancyConfiguration");

    [(PRInlineComplicationSnapshotViewController *)v22 setVibrancyConfiguration:v24];
  }

  return v22;
}

- (void)invalidate
{
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PRInlineComplicationSnapshotViewController;
  [(PRInlineComplicationSnapshotViewController *)&v13 viewDidLoad];
  if (self->_complicationDescriptor
    && (-[PRInlineComplicationSnapshotViewController _hostViewControllerForComplicationDescriptor:](self, "_hostViewControllerForComplicationDescriptor:"), v3 = (CHUISWidgetHostViewController *)objc_claimAutoreleasedReturnValue(), v4 = self->_hostViewController, self->_hostViewController = v3, v4, self->_hostViewController))
  {
    -[PRInlineComplicationSnapshotViewController bs_addChildViewController:](self, "bs_addChildViewController:");
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    objc_initWeak(&location, self);
    hostViewController = self->_hostViewController;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PRInlineComplicationSnapshotViewController_viewDidLoad__block_invoke;
    v10[3] = &unk_1E54DC370;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)&Current;
    [(CHUISWidgetHostViewController *)hostViewController ensureContentWithTimeout:v10 completion:5.0];
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F927C0]) initWithInfo:0 responder:0];
    scene = self->_scene;
    objc_super v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    [(FBSScene *)scene sendActions:v9];
  }
}

void __57__PRInlineComplicationSnapshotViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    v6 = PRLogSnapshotter();
    id v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = WeakRetained[125];
        double v9 = Current - *(double *)(a1 + 40);
        int v15 = 138543874;
        uint64_t v16 = v8;
        __int16 v17 = 2048;
        double v18 = v9;
        __int16 v19 = 2114;
        id v20 = v3;
        _os_log_error_impl(&dword_18C1C4000, v7, OS_LOG_TYPE_ERROR, "Error loading content for snapshot %{public}@ (%f seconds elapsed): %{public}@", (uint8_t *)&v15, 0x20u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = WeakRetained[125];
      double v11 = Current - *(double *)(a1 + 40);
      int v15 = 138543618;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      double v18 = v11;
      _os_log_impl(&dword_18C1C4000, v7, OS_LOG_TYPE_DEFAULT, "Successfully loaded content for snapshot %{public}@ (%f seconds elapsed)", (uint8_t *)&v15, 0x16u);
    }

    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F927C0]) initWithInfo:0 responder:0];
    objc_super v13 = (void *)WeakRetained[122];
    id v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
    [v13 sendActions:v14];
  }
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v5 = (BSUIVibrancyConfiguration *)a3;
  if (self->_vibrancyConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
    [(CHUISWidgetHostViewController *)self->_hostViewController setVibrancyConfiguration:v5];
  }
}

- (BOOL)isComplicationUserInteractionEnabled
{
  return self->_touchBlockingView == 0;
}

- (void)setComplicationUserInteractionEnabled:(BOOL)a3
{
  touchBlockingView = self->_touchBlockingView;
  if ((((touchBlockingView != 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      [(UIView *)touchBlockingView removeFromSuperview];
      id v5 = self->_touchBlockingView;
      self->_touchBlockingView = 0;
    }
    else
    {
      uint64_t v10 = [(PRInlineComplicationSnapshotViewController *)self view];
      id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(UIView *)v10 bounds];
      id v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      [(UIView *)v7 setAutoresizingMask:18];
      uint64_t v8 = [(UIView *)v7 layer];
      [v8 setHitTestsAsOpaque:1];

      [(UIView *)v10 addSubview:v7];
      double v9 = self->_touchBlockingView;
      self->_touchBlockingView = v7;

      id v5 = v10;
    }
  }
}

- (void)complicationsWillDisplay
{
}

- (void)complicationsDidEndDisplaying
{
}

- (id)_hostViewControllerForComplicationDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F58F58]);
  id v6 = objc_msgSend(v5, "pr_initWithComplicationDescriptor:", v4);

  [v6 setDrawSystemBackgroundMaterialIfNecessary:0];
  [v6 setVisibility:2];
  [v6 setContentType:0];
  [v6 setColorScheme:2];
  id v7 = objc_alloc_init(MEMORY[0x1E4F58CE8]);
  [v7 setShowsDateAlongsideText:1];
  [v7 setSymbolScale:1];
  id v8 = objc_alloc_init(MEMORY[0x1E4F58CD0]);
  [v8 setSize:&unk_1ED9EF210];
  double v9 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
  [v8 setWeight:v9];

  [v7 setFontSpecification:v8];
  [v6 setInlineTextParameters:v7];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F58EE8]) initWithPrimaryTintColor:0 secondaryTintColor:0 filterStyle:2 fallbackFilterStyle:2 fraction:1.0];
  [v6 setTintParameters:v10];
  double v11 = [(PRInlineComplicationSnapshotViewController *)self vibrancyConfiguration];
  [v6 setVibrancyConfiguration:v11];

  [v6 setPresentationMode:2];
  id v12 = [v4 widget];
  objc_super v13 = PRSharedWidgetDescriptorProvider();
  id v14 = [v13 descriptorForPersonality:v12];

  uint64_t v15 = [v14 intentType];
  if (v15
    && (uint64_t v16 = (void *)v15,
        [v12 intent],
        __int16 v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__PRInlineComplicationSnapshotViewController__hostViewControllerForComplicationDescriptor___block_invoke;
    v19[3] = &unk_1E54DC398;
    id v20 = v6;
    id v21 = v12;
    id v22 = v4;
    [v14 loadDefaultIntent:v19];
  }
  else
  {
    [v6 setPresentationMode:2];
  }

  return v6;
}

void __91__PRInlineComplicationSnapshotViewController__hostViewControllerForComplicationDescriptor___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [a1[4] widget];
    id v5 = a1[5];

    if (v4 == v5)
    {
      id v6 = [a1[5] widgetByReplacingIntent:v3];
      [a1[6] setWidget:v6];
      [a1[4] setWidget:v6];
    }
    [a1[4] setPresentationMode:2];
  }
  else
  {
    id v7 = PRLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__PRInlineComplicationSnapshotViewController__hostViewControllerForComplicationDescriptor___block_invoke_cold_1((uint64_t)a1, v7);
    }
  }
}

- (PRComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (void)setComplicationDescriptor:(id)a3
{
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

void __91__PRInlineComplicationSnapshotViewController__hostViewControllerForComplicationDescriptor___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 40) extensionBundleIdentifier];
  id v5 = [*(id *)(a1 + 40) kind];
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  double v9 = v5;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "Default intent asked for but not provided: %@ - %@", (uint8_t *)&v6, 0x16u);
}

@end