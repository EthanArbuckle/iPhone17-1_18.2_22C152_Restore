@interface SCUIMoreHelpWebViewController
- (SCUIMoreHelpWebViewController)init;
- (SCUIMoreHelpWebViewController)initWithType:(int64_t)a3;
- (SCUIMoreHelpWebViewController)initWithURL:(id)a3;
- (void)dismissMoreHelpView;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation SCUIMoreHelpWebViewController

- (SCUIMoreHelpWebViewController)init
{
  uint64_t v3 = SCUICurrentInterventionType();

  return [(SCUIMoreHelpWebViewController *)self initWithType:v3];
}

- (SCUIMoreHelpWebViewController)initWithType:(int64_t)a3
{
  v4 = +[SCUIMoreHelpWebResources waysToGetHelpURLForInterventionType:a3];
  v5 = [(SCUIMoreHelpWebViewController *)self initWithURL:v4];

  return v5;
}

- (SCUIMoreHelpWebViewController)initWithURL:(id)a3
{
  v49[4] = *MEMORY[0x263EF8340];
  v4 = (objc_class *)MEMORY[0x263F1FA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v46 = [MEMORY[0x263F1FA68] nonPersistentDataStore];
  objc_msgSend(v6, "setWebsiteDataStore:");
  id v7 = objc_alloc(MEMORY[0x263F1FA58]);
  v47 = v6;
  v8 = objc_msgSend(v7, "initWithFrame:configuration:", v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setNavigationDelegate:self];
  uint64_t v9 = [objc_alloc(MEMORY[0x263F08BD8]) initWithURL:v5];

  v45 = (void *)v9;
  id v10 = (id)[v8 loadRequest:v9];
  id v11 = objc_alloc_init(MEMORY[0x263F82E10]);
  v12 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v13 = [v11 view];
  [v13 setBackgroundColor:v12];

  v14 = [v11 view];
  [v14 addSubview:v8];

  v36 = (void *)MEMORY[0x263F08938];
  v42 = [v8 topAnchor];
  v43 = [v11 view];
  v41 = [v43 topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v49[0] = v40;
  v38 = [v8 leadingAnchor];
  v39 = [v11 view];
  v37 = [v39 leadingAnchor];
  v35 = [v38 constraintEqualToAnchor:v37];
  v49[1] = v35;
  v34 = [v8 bottomAnchor];
  v15 = [v11 view];
  v16 = [v15 bottomAnchor];
  v17 = [v34 constraintEqualToAnchor:v16];
  v49[2] = v17;
  v18 = [v8 trailingAnchor];
  v19 = [v11 view];
  v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v49[3] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
  [v36 activateConstraints:v22];

  [v8 setHidden:1];
  [v11 setEdgesForExtendedLayout:0];
  v48.receiver = self;
  v48.super_class = (Class)SCUIMoreHelpWebViewController;
  v23 = [(SCUIMoreHelpWebViewController *)&v48 initWithRootViewController:v11];
  v24 = v23;
  if (v23)
  {
    v25 = [(SCUIMoreHelpWebViewController *)v23 navigationBar];
    v26 = [v25 standardAppearance];
    v27 = (void *)[v26 copy];

    [v27 configureWithOpaqueBackground];
    v28 = [(SCUIMoreHelpWebViewController *)v24 navigationBar];
    [v28 setScrollEdgeAppearance:v27];

    v29 = [(SCUIMoreHelpWebViewController *)v24 navigationBar];
    [v29 setStandardAppearance:v27];

    v30 = [(SCUIMoreHelpWebViewController *)v24 navigationBar];
    [v30 setCompactAppearance:v27];

    [(SCUIMoreHelpWebViewController *)v24 setModalPresentationStyle:2];
    v31 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v24 action:sel_dismissMoreHelpView];
    v32 = [v11 navigationItem];
    [v32 setRightBarButtonItem:v31];
  }
  return v24;
}

- (void)dismissMoreHelpView
{
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
}

@end