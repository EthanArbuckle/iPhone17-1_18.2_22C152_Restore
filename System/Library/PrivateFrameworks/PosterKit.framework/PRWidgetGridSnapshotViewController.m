@interface PRWidgetGridSnapshotViewController
- (FBSScene)scene;
- (PRWidgetGridSnapshotViewController)initWithScene:(id)a3 complicationLayoutProvider:(id)a4 gridType:(unint64_t)a5;
- (PRWidgetGridViewController)widgetGridViewController;
- (void)invalidate;
- (void)setScene:(id)a3;
- (void)setWidgetGridViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PRWidgetGridSnapshotViewController

- (PRWidgetGridSnapshotViewController)initWithScene:(id)a3 complicationLayoutProvider:(id)a4 gridType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PRWidgetGridSnapshotViewController;
  v11 = [(PRWidgetGridSnapshotViewController *)&v39 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_scene, a3);
    v13 = [v9 settings];
    v14 = objc_msgSend(v13, "pui_posterContents");

    v34 = [v14 identity];
    if ([v34 type] == 3)
    {
      id v15 = -[PRPosterConfiguration _initWithPath:]([PRPosterConfiguration alloc], "_initWithPath:", v14, v34, v14);
      id v38 = 0;
      v16 = [v15 loadComplicationLayoutWithError:&v38];
      id v17 = v38;
      if (v17)
      {
        v18 = PRLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[PRWidgetGridSnapshotViewController initWithScene:complicationLayoutProvider:gridType:]((uint64_t)v15, (uint64_t)v17, v18);
        }
      }
    }
    else
    {
      v19 = objc_msgSend(v9, "settings", v34, v14);
      objc_msgSend(v19, "pui_previewIdentifier");
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      v16 = [v10 complicationLayoutForPreviewIdentifier:v15];
    }

    id v37 = v10;
    if (a5 == 1)
    {
      v20 = [v16 sidebarComplications];
      [v16 complicationIconLayout];
    }
    else
    {
      v20 = [v16 complications];
      [v16 sidebarComplicationIconLayout];
    v21 = };
    v22 = (void *)MEMORY[0x1E4F1CBF0];
    if (v16)
    {
      v23 = objc_msgSend(v20, "bs_map:", &__block_literal_global_16);
      v24 = objc_msgSend(v23, "bs_filter:", &__block_literal_global_4_1);
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v25 = [PRWidgetGridModel alloc];
    if (v24) {
      v26 = v24;
    }
    else {
      v26 = v22;
    }
    v27 = [(PRWidgetGridModel *)v25 initWithComplicationDescriptors:v26 iconLayout:v21 type:a5];
    v28 = [[PRWidgetGridViewController alloc] initWithModel:v27 iconViewProvider:0];
    widgetGridViewController = v12->_widgetGridViewController;
    v12->_widgetGridViewController = v28;

    v30 = v12->_widgetGridViewController;
    v31 = [v9 clientSettings];
    v32 = objc_msgSend(v31, "pr_vibrancyConfiguration");
    [(PRWidgetGridViewController *)v30 setVibrancyConfiguration:v32];

    id v10 = v37;
  }

  return v12;
}

PRComplicationDescriptor *__88__PRWidgetGridSnapshotViewController_initWithScene_complicationLayoutProvider_gridType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PRComplicationDescriptor alloc] initWithPRSWidget:v2];

  return v3;
}

uint64_t __88__PRWidgetGridSnapshotViewController_initWithScene_complicationLayoutProvider_gridType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasMatchingDescriptor];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PRWidgetGridSnapshotViewController;
  [(PRWidgetGridSnapshotViewController *)&v5 viewDidLoad];
  [(PRWidgetGridSnapshotViewController *)self bs_addChildViewController:self->_widgetGridViewController];
  widgetGridViewController = self->_widgetGridViewController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PRWidgetGridSnapshotViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E54DAFB8;
  v4[4] = self;
  [(PRWidgetGridViewController *)widgetGridViewController ensureContentWithTimeout:v4 completion:5.0];
}

void __49__PRWidgetGridSnapshotViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F927C0]) initWithInfo:0 responder:0];
  id v2 = [*(id *)(a1 + 32) scene];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [v2 sendActions:v3];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PRWidgetGridSnapshotViewController;
  [(PRWidgetGridSnapshotViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(PRWidgetGridViewController *)self->_widgetGridViewController view];
  id v4 = [(PRWidgetGridSnapshotViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)invalidate
{
}

- (FBSScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (PRWidgetGridViewController)widgetGridViewController
{
  return self->_widgetGridViewController;
}

- (void)setWidgetGridViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetGridViewController, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)initWithScene:(uint64_t)a1 complicationLayoutProvider:(uint64_t)a2 gridType:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Error loading complication layout from poster configuration %@: %@", (uint8_t *)&v3, 0x16u);
}

@end