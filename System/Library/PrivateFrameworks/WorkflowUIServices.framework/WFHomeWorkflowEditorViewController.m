@interface WFHomeWorkflowEditorViewController
+ (void)preloadActionRegistryIfNeeded;
+ (void)preloadHomeManager;
- (WFComposeViewController)composeViewController;
- (WFHomeWorkflowEditorViewController)initWithHomeWorkflow:(id)a3 actionSetBuilder:(id)a4 home:(id)a5;
- (WFHomeWorkflowEditorViewControllerDelegate)delegate;
- (id)doneBarButtonItem;
- (void)composeViewControllerRequestsDismissal:(id)a3 forTutorial:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)didTapDone;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFHomeWorkflowEditorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (WFComposeViewController)composeViewController
{
  return self->_composeViewController;
}

- (void)setDelegate:(id)a3
{
}

- (WFHomeWorkflowEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFHomeWorkflowEditorViewControllerDelegate *)WeakRetained;
}

- (void)composeViewControllerRequestsDismissal:(id)a3 forTutorial:(BOOL)a4 withCompletionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__WFHomeWorkflowEditorViewController_composeViewControllerRequestsDismissal_forTutorial_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_2642A5798;
  id v10 = v9;
  id v24 = v10;
  v11 = (void (**)(void))_Block_copy(aBlock);
  if (!a4)
  {
    v12 = [v8 workflow];
    v13 = [v12 record];
    v14 = [v13 fileRepresentation];
    id v22 = 0;
    v15 = [v14 fileDataWithError:&v22];
    id v16 = v22;

    if (v15)
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2050000000;
      v17 = (void *)getWFHomeWorkflowClass_softClass;
      uint64_t v28 = getWFHomeWorkflowClass_softClass;
      if (!getWFHomeWorkflowClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getWFHomeWorkflowClass_block_invoke;
        v30 = &unk_2642A5AD8;
        v31 = &v25;
        __getWFHomeWorkflowClass_block_invoke((uint64_t)buf);
        v17 = (void *)v26[3];
      }
      v18 = v17;
      _Block_object_dispose(&v25, 8);
      v19 = [[v18 alloc] initWithData:v15];
      v20 = [(WFHomeWorkflowEditorViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v20, "homeWorkflowEditorViewController:didFinishWithHomeWorkflow:includesSecureAccessory:", self, v19, -[NSObject requiresDeviceUnlock](v19, "requiresDeviceUnlock"));
      }
      else {
        [(WFHomeWorkflowEditorViewController *)self dismissViewControllerAnimated:1 completion:v10];
      }
    }
    else
    {
      v19 = getWFGeneralLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v21 = [v8 workflow];
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[WFHomeWorkflowEditorViewController composeViewControllerRequestsDismissal:forTutorial:wit"
                             "hCompletionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2114;
        v30 = v16;
        _os_log_impl(&dword_2177E0000, v19, OS_LOG_TYPE_ERROR, "%s Failed to get file data from Workflow: %@. Error: %{public}@", buf, 0x20u);
      }
    }
  }
  v11[2](v11);
}

uint64_t __111__WFHomeWorkflowEditorViewController_composeViewControllerRequestsDismissal_forTutorial_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didTapDone
{
  v3 = [(WFHomeWorkflowEditorViewController *)self composeViewController];
  v4 = [v3 editorViewController];
  [v4 stop];

  id v5 = [(WFHomeWorkflowEditorViewController *)self composeViewController];
  [v5 finishEditing];
}

- (id)doneBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  v4 = WFLocalizedString(@"Next");
  id v5 = (void *)[v3 initWithTitle:v4 style:2 target:self action:sel_didTapDone];

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFHomeWorkflowEditorViewController;
  [(WFHomeWorkflowEditorViewController *)&v7 viewWillAppear:a3];
  [(id)objc_opt_class() preloadActionRegistryIfNeeded];
  v4 = objc_msgSend(MEMORY[0x263F825C8], "wf_homeTintColor");
  id v5 = [(WFHomeWorkflowEditorViewController *)self navigationController];
  v6 = [v5 navigationBar];
  [v6 setTintColor:v4];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)WFHomeWorkflowEditorViewController;
  [(WFHomeWorkflowEditorViewController *)&v14 viewDidLoad];
  id v3 = WFLocalizedString(@"Shortcut");
  [(WFHomeWorkflowEditorViewController *)self setTitle:v3];

  v4 = objc_msgSend(MEMORY[0x263F825C8], "wf_homeTintColor");
  id v5 = [(WFHomeWorkflowEditorViewController *)self view];
  [v5 setTintColor:v4];

  v6 = [(WFHomeWorkflowEditorViewController *)self composeViewController];

  if (v6)
  {
    objc_super v7 = [(WFHomeWorkflowEditorViewController *)self composeViewController];
    [(WFHomeWorkflowEditorViewController *)self addChildViewController:v7];

    id v8 = [(WFHomeWorkflowEditorViewController *)self view];
    id v9 = [(WFHomeWorkflowEditorViewController *)self composeViewController];
    id v10 = [v9 view];
    [v8 addSubview:v10];

    v11 = [(WFHomeWorkflowEditorViewController *)self composeViewController];
    [v11 didMoveToParentViewController:self];

    v12 = [(WFHomeWorkflowEditorViewController *)self doneBarButtonItem];
    v13 = [(WFHomeWorkflowEditorViewController *)self navigationItem];
    [v13 setRightBarButtonItem:v12];
  }
}

- (WFHomeWorkflowEditorViewController)initWithHomeWorkflow:(id)a3 actionSetBuilder:(id)a4 home:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v48 = a4;
  id v49 = a5;
  v54.receiver = self;
  v54.super_class = (Class)WFHomeWorkflowEditorViewController;
  id v9 = [(WFHomeWorkflowEditorViewController *)&v54 initWithNibName:0 bundle:0];
  if (!v9)
  {
    id v22 = 0;
    goto LABEL_33;
  }
  v55 = 0;
  if (!ActionKitLibraryCore_frameworkLibrary)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __ActionKitLibraryCore_block_invoke;
    v59 = &__block_descriptor_40_e5_v8__0l;
    v60 = &v55;
    long long v61 = xmmword_2642A55A0;
    uint64_t v62 = 0;
    ActionKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ActionKitLibraryCore_frameworkLibrary)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    v46 = [NSString stringWithUTF8String:"void *ActionKitLibrary(void)"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v46, @"WFHomeWorkflowEditorViewController.m", 20, @"%s", v55);

    goto LABEL_35;
  }
  id v10 = v55;
  if (v55) {
    goto LABEL_36;
  }
  while (1)
  {
    v11 = [v8 data];
    if (v11)
    {
      *(void *)&long long v61 = 0;
      *((void *)&v61 + 1) = &v61;
      uint64_t v62 = 0x2050000000;
      v12 = (void *)getWFWorkflowFileClass_softClass;
      v63 = (void *)getWFWorkflowFileClass_softClass;
      if (!getWFWorkflowFileClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getWFWorkflowFileClass_block_invoke;
        v59 = &unk_2642A5AD8;
        v60 = (void **)&v61;
        __getWFWorkflowFileClass_block_invoke((uint64_t)buf);
        v12 = *(void **)(*((void *)&v61 + 1) + 24);
      }
      v13 = v12;
      _Block_object_dispose(&v61, 8);
      id v14 = [v13 alloc];
      id v53 = 0;
      v15 = [v14 initWithFileData:v11 name:0 error:&v53];
      id v16 = v53;
      id v52 = v16;
      v17 = [v15 recordRepresentationWithError:&v52];
      id v18 = v52;

      if (v17)
      {
        id v19 = objc_alloc((Class)getWFWorkflowClass());
        id v51 = v18;
        v20 = [v19 initWithRecord:v17 reference:0 storageProvider:0 migrateIfNecessary:1 environment:2 error:&v51];
        id v21 = v51;

        id v18 = v21;
        goto LABEL_21;
      }
      v43 = getWFGeneralLogObject();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[WFHomeWorkflowEditorViewController initWithHomeWorkflow:actionSetBuilder:home:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_2177E0000, v43, OS_LOG_TYPE_ERROR, "%s Could not load shortcut record from file data. error: %{public}@", buf, 0x16u);
      }

LABEL_31:
      id v22 = 0;
      goto LABEL_32;
    }
    if (!v48)
    {
      id v18 = 0;
LABEL_29:
      v15 = getWFHomeLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = [v11 length];
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[WFHomeWorkflowEditorViewController initWithHomeWorkflow:actionSetBuilder:home:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2112;
        v59 = v18;
        _os_log_impl(&dword_2177E0000, v15, OS_LOG_TYPE_ERROR, "%s Could not create workflow from data: %lu with error: %@", buf, 0x20u);
      }
      goto LABEL_31;
    }
    id v23 = objc_alloc((Class)getWFWorkflowClass());
    *(void *)&long long v61 = 0;
    *((void *)&v61 + 1) = &v61;
    uint64_t v62 = 0x2050000000;
    id v24 = (void *)getWFWorkflowRecordClass_softClass;
    v63 = (void *)getWFWorkflowRecordClass_softClass;
    if (!getWFWorkflowRecordClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getWFWorkflowRecordClass_block_invoke;
      v59 = &unk_2642A5AD8;
      v60 = (void **)&v61;
      __getWFWorkflowRecordClass_block_invoke((uint64_t)buf);
      id v24 = *(void **)(*((void *)&v61 + 1) + 24);
    }
    uint64_t v25 = v24;
    _Block_object_dispose(&v61, 8);
    id v26 = objc_alloc_init(v25);
    id v50 = 0;
    v20 = [v23 initWithRecord:v26 reference:0 storageProvider:0 migrateIfNecessary:1 environment:2 error:&v50];
    id v18 = v50;

    *(void *)&long long v61 = 0;
    *((void *)&v61 + 1) = &v61;
    uint64_t v62 = 0x2050000000;
    uint64_t v27 = (void *)getWFHFTriggerActionSetsBuilderParameterStateClass_softClass;
    v63 = (void *)getWFHFTriggerActionSetsBuilderParameterStateClass_softClass;
    if (!getWFHFTriggerActionSetsBuilderParameterStateClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getWFHFTriggerActionSetsBuilderParameterStateClass_block_invoke;
      v59 = &unk_2642A5AD8;
      v60 = (void **)&v61;
      __getWFHFTriggerActionSetsBuilderParameterStateClass_block_invoke((uint64_t)buf);
      uint64_t v27 = *(void **)(*((void *)&v61 + 1) + 24);
    }
    uint64_t v28 = v27;
    _Block_object_dispose(&v61, 8);
    id v29 = [v28 alloc];
    v30 = [v48 allActionSets];
    id v31 = v49;
    *(void *)&long long v61 = 0;
    *((void *)&v61 + 1) = &v61;
    uint64_t v62 = 0x2020000000;
    uint64_t v32 = (void (*)(id))getWFSerializableHomeIdentifierSymbolLoc_ptr;
    v63 = getWFSerializableHomeIdentifierSymbolLoc_ptr;
    if (!getWFSerializableHomeIdentifierSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getWFSerializableHomeIdentifierSymbolLoc_block_invoke;
      v59 = &unk_2642A5AD8;
      v60 = (void **)&v61;
      v33 = WorkflowKitLibrary();
      v34 = dlsym(v33, "WFSerializableHomeIdentifier");
      *((void *)v60[1] + 3) = v34;
      getWFSerializableHomeIdentifierSymbolLoc_ptr = (_UNKNOWN *)*((void *)v60[1] + 3);
      uint64_t v32 = *(void (**)(id))(*((void *)&v61 + 1) + 24);
    }
    _Block_object_dispose(&v61, 8);
    if (v32) {
      break;
    }
    id v8 = [MEMORY[0x263F08690] currentHandler];
    v47 = [NSString stringWithUTF8String:"NSString * _Nonnull soft_WFSerializableHomeIdentifier(HMHome * _Nonnull __strong)"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v47, @"WFHomeWorkflowEditorViewController.m", 133, @"%s", dlerror());

LABEL_35:
    __break(1u);
LABEL_36:
    free(v10);
  }
  v35 = v32(v31);

  v15 = [v29 initWithActionSets:v30 homeIdentifier:v35];
  v36 = [getWFActionRegistryClass() sharedRegistry];
  v56 = @"WFHomeTriggerActionSets";
  v37 = [v15 serializedRepresentation];
  v57 = v37;
  v38 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  v17 = [v36 createActionWithIdentifier:@"is.workflow.actions.homeaccessory" serializedParameters:v38];

  [v20 addAction:v17];
LABEL_21:

  if (!v20) {
    goto LABEL_29;
  }
  *(void *)&long long v61 = 0;
  *((void *)&v61 + 1) = &v61;
  uint64_t v62 = 0x2050000000;
  v39 = (void *)getWFComposeViewControllerClass_softClass;
  v63 = (void *)getWFComposeViewControllerClass_softClass;
  if (!getWFComposeViewControllerClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getWFComposeViewControllerClass_block_invoke;
    v59 = &unk_2642A5AD8;
    v60 = (void **)&v61;
    __getWFComposeViewControllerClass_block_invoke((uint64_t)buf);
    v39 = *(void **)(*((void *)&v61 + 1) + 24);
  }
  v40 = v39;
  _Block_object_dispose(&v61, 8);
  uint64_t v41 = [[v40 alloc] initWithWorkflow:v20 database:0 home:v49 shouldShowShareButton:0];
  composeViewController = v9->_composeViewController;
  v9->_composeViewController = (WFComposeViewController *)v41;

  [(WFComposeViewController *)v9->_composeViewController setDelegate:v9];
  id v22 = v9;
  v15 = v20;
LABEL_32:

LABEL_33:
  return v22;
}

+ (void)preloadActionRegistryIfNeeded
{
  id v2 = [getWFActionRegistryClass() sharedRegistry];
  [v2 fill];
}

+ (void)preloadHomeManager
{
  id v2 = [getWFHomeManagerClass() sharedManager];
  char v3 = [v2 hasLoadedHomes];

  if ((v3 & 1) == 0)
  {
    id v4 = [getWFHomeManagerClass() sharedManager];
    [v4 reloadData];
  }
}

@end