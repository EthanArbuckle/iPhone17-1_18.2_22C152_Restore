@interface PBFGalleryViewController
- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3;
- (void)_fetchNewGalleryFromProactive:(unint64_t)a3;
- (void)_reload;
- (void)_reloadGalleryUsingProactive:(id)a3;
- (void)_selectEditingEnvironment;
- (void)_selectPreviewingEnvironment;
- (void)_selectRenderingEnvironment;
- (void)_setupDataProvider;
- (void)dealloc;
- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5;
- (void)posterExtensionDataStore:(id)a3 didUpdateGalleryConfiguration:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PBFGalleryViewController

- (void)dealloc
{
  [(BSInvalidatable *)self->_inUseAssertion invalidate];
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFGalleryViewController;
  [(PBFGalleryViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v47[3] = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)PBFGalleryViewController;
  [(PBFGalleryViewController *)&v45 viewDidLoad];
  v3 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
  glue = self->_glue;
  self->_glue = v3;

  v5 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
  [v5 addObserver:self];

  [(PBFGalleryViewController *)self _setupDataProvider];
  previewViewController = self->_previewViewController;
  if (!previewViewController)
  {
    v7 = [[PBFPosterGalleryPreviewViewController alloc] initWithNibName:0 bundle:0];
    v8 = self->_previewViewController;
    self->_previewViewController = v7;

    [(PBFPosterGalleryPreviewViewController *)self->_previewViewController setDelegate:self];
    [(PBFPosterGalleryPreviewViewController *)self->_previewViewController setEditingSceneDelegate:self];
    previewViewController = self->_previewViewController;
  }
  [(PBFPosterGalleryPreviewViewController *)previewViewController setDataProvider:self->_dataProvider];
  [(PBFGalleryViewController *)self bs_addChildViewController:self->_previewViewController];
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E4FB13F0];
  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"livephoto"];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __39__PBFGalleryViewController_viewDidLoad__block_invoke;
  v42[3] = &unk_1E69839F0;
  objc_copyWeak(&v43, &location);
  v11 = [v9 actionWithTitle:@"Rendering" image:v10 identifier:@"Rendering" handler:v42];
  renderingAction = self->_renderingAction;
  self->_renderingAction = v11;

  v13 = (void *)MEMORY[0x1E4FB13F0];
  v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"camera"];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __39__PBFGalleryViewController_viewDidLoad__block_invoke_2;
  v40[3] = &unk_1E69839F0;
  objc_copyWeak(&v41, &location);
  v15 = [v13 actionWithTitle:@"Previewing" image:v14 identifier:@"Previewing" handler:v40];
  previewingAction = self->_previewingAction;
  self->_previewingAction = v15;

  v17 = (void *)MEMORY[0x1E4FB13F0];
  v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.pencil"];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __39__PBFGalleryViewController_viewDidLoad__block_invoke_3;
  v38[3] = &unk_1E69839F0;
  objc_copyWeak(&v39, &location);
  v19 = [v17 actionWithTitle:@"Editing" image:v18 identifier:@"Editing" handler:v38];
  editingAction = self->_editingAction;
  self->_editingAction = v19;

  v21 = (void *)MEMORY[0x1E4FB1970];
  v22 = self->_previewingAction;
  v47[0] = self->_renderingAction;
  v47[1] = v22;
  v47[2] = self->_editingAction;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
  v24 = [v21 menuWithTitle:@"Environment" children:v23];

  v25 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Environment" menu:v24];
  environmentItem = self->_environmentItem;
  self->_environmentItem = v25;

  v27 = [(PBFGalleryViewController *)self navigationItem];
  [v27 setLeftBarButtonItem:self->_environmentItem];

  v28 = (void *)MEMORY[0x1E4FB1970];
  v29 = (void *)MEMORY[0x1E4FB13F0];
  v30 = [MEMORY[0x1E4FB1818] systemImageNamed:@"flame.fill"];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __39__PBFGalleryViewController_viewDidLoad__block_invoke_4;
  v36[3] = &unk_1E69839F0;
  objc_copyWeak(&v37, &location);
  v31 = [v29 actionWithTitle:@"Reload from Proactive" image:v30 identifier:@"ReloadFromProactive" handler:v36];
  v46 = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v33 = [v28 menuWithTitle:@"Reload" children:v32];

  v34 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Reload" menu:v33];
  v35 = [(PBFGalleryViewController *)self navigationItem];
  [v35 setRightBarButtonItem:v34];

  [(PBFGalleryViewController *)self _selectEditingEnvironment];
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __39__PBFGalleryViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _selectRenderingEnvironment];
}

void __39__PBFGalleryViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _selectPreviewingEnvironment];
}

void __39__PBFGalleryViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _selectEditingEnvironment];
}

void __39__PBFGalleryViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadGalleryUsingProactive:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBFGalleryViewController;
  [(PBFGalleryViewController *)&v6 viewWillAppear:a3];
  if (!self->_inUseAssertion)
  {
    objc_super v4 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue acquireSnapshotterInUseAssertionWithReason:@"GalleryViewController"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v4;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBFGalleryViewController;
  [(PBFGalleryViewController *)&v5 viewDidDisappear:a3];
  [(BSInvalidatable *)self->_inUseAssertion invalidate];
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;
}

- (void)posterExtensionDataStore:(id)a3 didUpdateGalleryConfiguration:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PBFGalleryViewController_posterExtensionDataStore_didUpdateGalleryConfiguration___block_invoke;
  v7[3] = &unk_1E69808E8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __83__PBFGalleryViewController_posterExtensionDataStore_didUpdateGalleryConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) configureForGallery:*(void *)(a1 + 40)];
}

- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if ([(UIAction *)self->_renderingAction state])
  {
    if ([(UIAction *)self->_previewingAction state]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(PBFPosterGalleryPreviewViewController *)self->_previewViewController presentPreview:v9 withMode:v8 fromView:v7];
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  id v5 = [(PBFGalleryViewController *)self view];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];
  uint64_t v8 = [v7 _FBSScene];
  id v18 = [v8 settings];

  objc_msgSend(v18, "prui_leadingTopButtonFrame");
  retstr->leadingTopButtonFrame.origin.x = v9;
  retstr->leadingTopButtonFrame.origin.y = v10;
  retstr->leadingTopButtonFrame.size.width = v11;
  retstr->leadingTopButtonFrame.size.height = v12;
  objc_msgSend(v18, "prui_trailingTopButtonFrame");
  retstr->trailingTopButtonFrame.origin.x = v13;
  retstr->trailingTopButtonFrame.origin.y = v14;
  retstr->trailingTopButtonFrame.size.width = v15;
  retstr->trailingTopButtonFrame.size.height = v16;

  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a4 == 1)
  {
    CGFloat v15 = [v11 contentsIdentity];
    CGFloat v16 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
    v17 = [v16 dataStore];

    id v18 = objc_alloc(MEMORY[0x1E4F925C0]);
    v19 = [v12 _path];
    v20 = (void *)[v18 initWithNewPath:v19 destinationPosterUUID:0 sourceIdentity:v15 configuredProperties:v13 attributes:0];

    v21 = [v17 switcherConfiguration];
    v22 = (void *)[v21 mutableCopy];

    [v22 ingestNewPosterConfiguration:v20];
    id v30 = 0;
    id v23 = (id)[v17 updateDataStoreForSwitcherConfiguration:v22 reason:@"ingest new poster from gallery" error:&v30];
    id v24 = v30;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __140__PBFGalleryViewController_editingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke;
    v26[3] = &unk_1E6983A18;
    id v27 = v11;
    id v28 = v24;
    id v29 = v14;
    id v25 = v24;
    dispatch_async(MEMORY[0x1E4F14428], v26);
  }
  else
  {
    [v11 dismissViewControllerAnimated:1 completion:0];
    (*((void (**)(id, void))v14 + 2))(v14, 0);
  }
}

uint64_t __140__PBFGalleryViewController_editingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)_setupDataProvider
{
  if (!self->_dataProvider)
  {
    v3 = objc_alloc_init(PBFGalleryMutableDataProvider);
    dataProvider = self->_dataProvider;
    self->_dataProvider = v3;

    [(PBFGalleryViewController *)self _reload];
  }
}

- (void)_fetchNewGalleryFromProactive:(unint64_t)a3
{
  id v5 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke;
  v6[3] = &unk_1E69815C0;
  v6[4] = self;
  [v5 fetchGalleryConfigurationWithOptions:a3 completion:v6];
}

void __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if (v6)
  {
    id v7 = PBFLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke_53;
  block[3] = &unk_1E69808C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reload];
}

- (void)_reload
{
  v3 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self->_glue dataStore];
  id v4 = [v3 currentGalleryConfiguration];

  [(PBFGalleryMutableDataProvider *)self->_dataProvider configureForGallery:v4];
}

- (void)_selectRenderingEnvironment
{
  [(UIAction *)self->_renderingAction setState:0];
  [(UIAction *)self->_previewingAction setState:1];
  [(UIAction *)self->_editingAction setState:1];
  environmentItem = self->_environmentItem;
  [(UIBarButtonItem *)environmentItem setTitle:@"On Tap: Rendering"];
}

- (void)_selectPreviewingEnvironment
{
  [(UIAction *)self->_renderingAction setState:1];
  [(UIAction *)self->_previewingAction setState:0];
  [(UIAction *)self->_editingAction setState:1];
  environmentItem = self->_environmentItem;
  [(UIBarButtonItem *)environmentItem setTitle:@"On Tap: Previewing"];
}

- (void)_selectEditingEnvironment
{
  [(UIAction *)self->_renderingAction setState:1];
  [(UIAction *)self->_previewingAction setState:1];
  [(UIAction *)self->_editingAction setState:0];
  environmentItem = self->_environmentItem;
  [(UIBarButtonItem *)environmentItem setTitle:@"On Tap: Editing"];
}

- (void)_reloadGalleryUsingProactive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_environmentItem, 0);
  objc_storeStrong((id *)&self->_editingAction, 0);
  objc_storeStrong((id *)&self->_previewingAction, 0);
  objc_storeStrong((id *)&self->_renderingAction, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_glue, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
}

void __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "Error updating face gallery configuration: %@", (uint8_t *)&v2, 0xCu);
}

@end