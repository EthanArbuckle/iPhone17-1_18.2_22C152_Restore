@interface SHSheetGroupActivitySharingController
- (GPGroupActivitySharingControllerHelpers)groupActivitySharingController;
- (NSString)shareSheetSessionID;
- (SHSheetGroupActivitySharingController)initWithItemProvider:(id)a3;
- (SHSheetGroupActivitySharingControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setGroupActivitySharingController:(id)a3;
- (void)setShareSheetSessionID:(id)a3;
- (void)viewDidLoad;
@end

@implementation SHSheetGroupActivitySharingController

- (SHSheetGroupActivitySharingController)initWithItemProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SHSheetGroupActivitySharingController;
  v5 = [(SHSheetGroupActivitySharingController *)&v16 initWithNibName:0 bundle:0];
  if (v5)
  {
    if (_GroupActivities_UIKitLibrary_sOnce != -1) {
      dispatch_once(&_GroupActivities_UIKitLibrary_sOnce, &__block_literal_global_5);
    }
    Class v6 = NSClassFromString(&cfstr_Groupactivitie.isa);
    if (v6)
    {
      v7 = v6;
      if ([(objc_class *)v6 instancesRespondToSelector:sel_initWithItemProvider_])
      {
        uint64_t v8 = [[v7 alloc] initWithItemProvider:v4];
        groupActivitySharingController = v5->_groupActivitySharingController;
        v5->_groupActivitySharingController = (GPGroupActivitySharingControllerHelpers *)v8;

        id location = 0;
        objc_initWeak(&location, v5);
        v10 = v5->_groupActivitySharingController;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __62__SHSheetGroupActivitySharingController_initWithItemProvider___block_invoke;
        v13[3] = &unk_1E5A218B8;
        objc_copyWeak(&v14, &location);
        [(GPGroupActivitySharingControllerHelpers *)v10 registerWithResultHandler:v13];
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
      v11 = share_sheet_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SHSheetGroupActivitySharingController initWithItemProvider:](v11);
      }
    }
    else
    {
      v11 = share_sheet_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SHSheetGroupActivitySharingController initWithItemProvider:](v11);
      }
    }
  }
LABEL_12:

  return v5;
}

void __62__SHSheetGroupActivitySharingController_initWithItemProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];
  id v5 = objc_loadWeakRetained(v3);
  [v4 groupActivitySharingController:v5 didFinish:a2];
}

- (void)viewDidLoad
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)SHSheetGroupActivitySharingController;
  [(SHSheetGroupActivitySharingController *)&v32 viewDidLoad];
  groupActivitySharingController = self->_groupActivitySharingController;
  if (groupActivitySharingController)
  {
    [(GPGroupActivitySharingControllerHelpers *)groupActivitySharingController willMoveToParentViewController:self];
    [(SHSheetGroupActivitySharingController *)self addChildViewController:self->_groupActivitySharingController];
    id v4 = [(SHSheetGroupActivitySharingController *)self view];
    id v5 = [(GPGroupActivitySharingControllerHelpers *)self->_groupActivitySharingController view];
    [v4 addSubview:v5];

    v21 = (void *)MEMORY[0x1E4F28DC8];
    v31 = [(GPGroupActivitySharingControllerHelpers *)self->_groupActivitySharingController view];
    v29 = [v31 leadingAnchor];
    v30 = [(SHSheetGroupActivitySharingController *)self view];
    v28 = [v30 safeAreaLayoutGuide];
    v27 = [v28 leadingAnchor];
    v26 = [v29 constraintEqualToAnchor:v27];
    v33[0] = v26;
    v25 = [(GPGroupActivitySharingControllerHelpers *)self->_groupActivitySharingController view];
    v23 = [v25 trailingAnchor];
    v24 = [(SHSheetGroupActivitySharingController *)self view];
    v22 = [v24 safeAreaLayoutGuide];
    v20 = [v22 trailingAnchor];
    v19 = [v23 constraintEqualToAnchor:v20];
    v33[1] = v19;
    v18 = [(GPGroupActivitySharingControllerHelpers *)self->_groupActivitySharingController view];
    objc_super v16 = [v18 topAnchor];
    v17 = [(SHSheetGroupActivitySharingController *)self view];
    v15 = [v17 safeAreaLayoutGuide];
    id v14 = [v15 topAnchor];
    Class v6 = [v16 constraintEqualToAnchor:v14];
    v33[2] = v6;
    v7 = [(GPGroupActivitySharingControllerHelpers *)self->_groupActivitySharingController view];
    uint64_t v8 = [v7 bottomAnchor];
    v9 = [(SHSheetGroupActivitySharingController *)self view];
    v10 = [v9 safeAreaLayoutGuide];
    v11 = [v10 bottomAnchor];
    v12 = [v8 constraintEqualToAnchor:v11];
    v33[3] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [v21 activateConstraints:v13];

    [(GPGroupActivitySharingControllerHelpers *)self->_groupActivitySharingController didMoveToParentViewController:self];
  }
}

- (void)setShareSheetSessionID:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_shareSheetSessionID, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_shareSheetSessionID, a3);
    [(GPGroupActivitySharingControllerHelpers *)self->_groupActivitySharingController setShareSheetSessionID:v5];
  }
}

- (SHSheetGroupActivitySharingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetGroupActivitySharingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)shareSheetSessionID
{
  return self->_shareSheetSessionID;
}

- (GPGroupActivitySharingControllerHelpers)groupActivitySharingController
{
  return self->_groupActivitySharingController;
}

- (void)setGroupActivitySharingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupActivitySharingController, 0);
  objc_storeStrong((id *)&self->_shareSheetSessionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithItemProvider:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "SharePlay: Could not load GroupActivitySharingController class", v1, 2u);
}

- (void)initWithItemProvider:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "SharePlay: GroupActivitySharingController instances do not respond to initWithItemProvider", v1, 2u);
}

@end