@interface TUIKTConversationViewController
- (NSDictionary)options;
- (TUIAccountKeySpecifierProvider)peerAccountKeySpecifierProvider;
- (TUIAccountKeySpecifierProvider)selfAccountKeySpecifierProvider;
- (TUIAnalytics)analytics;
- (TUIKTConversationViewControllerDelegate)delegate;
- (TUIStaticIdentityManager)staticIdentityManager;
- (TUIStaticIdentitySpecifierProvider)staticIdentitySpecifierProvider;
- (id)initForMembers:(id)a3 options:(id)a4;
- (id)specifiers;
- (void)_doneButtonTapped;
- (void)_openWithNavigationController:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)requestPresentationStyleExpanded:(BOOL)a3;
- (void)setAnalytics:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPeerAccountKeySpecifierProvider:(id)a3;
- (void)setSelfAccountKeySpecifierProvider:(id)a3;
- (void)setStaticIdentityManager:(id)a3;
- (void)setStaticIdentitySpecifierProvider:(id)a3;
- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation TUIKTConversationViewController

- (id)initForMembers:(id)a3 options:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_7);
  }
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315906;
    v18 = "-[TUIKTConversationViewController initForMembers:options:]";
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    id v22 = v7;
    __int16 v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_DEFAULT, "%s conversationMembers = %{public}@, options = %{public}@ on %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  v9 = [(TUIKTConversationViewController *)self init];
  if (!v9) {
    goto LABEL_8;
  }
  if ([v6 count])
  {
    objc_storeStrong((id *)&v9->_options, a4);
    v10 = objc_alloc_init(TUIAnalytics);
    analytics = v9->_analytics;
    v9->_analytics = v10;

    v12 = [[TUIStaticIdentityManager alloc] initWithConversationMembers:v6 options:v7];
    staticIdentityManager = v9->_staticIdentityManager;
    v9->_staticIdentityManager = v12;

    [(TUIStaticIdentityManager *)v9->_staticIdentityManager requestSelfAccountKey];
LABEL_8:
    v14 = v9;
    goto LABEL_14;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_36);
  }
  v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_260338000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter, no conversation members", (uint8_t *)&v17, 2u);
  }
  v14 = 0;
LABEL_14:

  return v14;
}

uint64_t __58__TUIKTConversationViewController_initForMembers_options___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __58__TUIKTConversationViewController_initForMembers_options___block_invoke_34()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)willMoveToParentViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TUIKTConversationViewController;
  [(TUIKTConversationViewController *)&v9 willMoveToParentViewController:a3];
  uint64_t v4 = [(TUIKTConversationViewController *)self navigationController];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(TUIStaticIdentityManager *)self->_staticIdentityManager showAccountKeys:0];
      v8 = [(TUIKTConversationViewController *)self navigationController];
      [v8 setModalPresentationStyle:2];
    }
  }
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  v16[1] = *MEMORY[0x263EF8340];
  v5 = [(TUIKTConversationViewController *)self navigationController];
  id v6 = [v5 presentationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [(TUIKTConversationViewController *)self navigationController];
    objc_super v9 = [v8 presentationController];

    if (v3) {
      [MEMORY[0x263F1C988] largeDetent];
    }
    else {
    v10 = [MEMORY[0x263F1C988] mediumDetent];
    }
    v16[0] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v9 setDetents:v11];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__TUIKTConversationViewController_requestPresentationStyleExpanded___block_invoke;
    v13[3] = &unk_2655534A0;
    BOOL v15 = v3;
    id v14 = v9;
    id v12 = v9;
    [v12 animateChanges:v13];
  }
}

uint64_t __68__TUIKTConversationViewController_requestPresentationStyleExpanded___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1) {
    BOOL v3 = (void *)MEMORY[0x263F1D5D8];
  }
  else {
    BOOL v3 = (void *)MEMORY[0x263F1D5E0];
  }
  return [v2 setSelectedDetentIdentifier:*v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TUIKTConversationViewController;
  [(TUIKTConversationViewController *)&v8 viewWillAppear:a3];
  uint64_t v4 = [(TUIKTConversationViewController *)self navigationItem];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"STATIC_IDENTITY_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  [v4 setTitle:v6];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped];
  [v4 setRightBarButtonItem:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_54_0);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTConversationViewController viewDidAppear:]();
  }
  v5.receiver = self;
  v5.super_class = (Class)TUIKTConversationViewController;
  [(TUIKTConversationViewController *)&v5 viewDidAppear:v3];
  [(TUIAnalytics *)self->_analytics ktInteraction:@"conversationUIDisplayed"];
}

uint64_t __49__TUIKTConversationViewController_viewDidAppear___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_61_1);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTConversationViewController viewDidDisappear:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)TUIKTConversationViewController;
  [(TUIKTConversationViewController *)&v15 viewDidDisappear:v3];
  [(TUIStaticIdentityManager *)self->_staticIdentityManager dismissDialog];
  objc_super v5 = [(TUIKTConversationViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_68_0);
    }
    uint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG)) {
      -[TUIKTConversationViewController viewDidDisappear:]((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
    }
    id v14 = [(TUIKTConversationViewController *)self delegate];
    [v14 keyTransparencyConversationViewControllerDidDismiss:self];
  }
}

uint64_t __52__TUIKTConversationViewController_viewDidDisappear___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __52__TUIKTConversationViewController_viewDidDisappear___block_invoke_66()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_doneButtonTapped
{
}

uint64_t __52__TUIKTConversationViewController__doneButtonTapped__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __52__TUIKTConversationViewController__doneButtonTapped__block_invoke_76()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [MEMORY[0x263EFF980] array];
    staticIdentitySpecifierProvider = self->_staticIdentitySpecifierProvider;
    if (!staticIdentitySpecifierProvider)
    {
      uint64_t v7 = [[TUIStaticIdentitySpecifierProvider alloc] initWithStaticIdentityManager:self->_staticIdentityManager analytics:self->_analytics];
      uint64_t v8 = self->_staticIdentitySpecifierProvider;
      self->_staticIdentitySpecifierProvider = v7;

      [(TUIStaticIdentitySpecifierProvider *)self->_staticIdentitySpecifierProvider setDelegate:self];
      staticIdentitySpecifierProvider = self->_staticIdentitySpecifierProvider;
    }
    uint64_t v9 = [(TUIStaticIdentitySpecifierProvider *)staticIdentitySpecifierProvider specifiers];
    [v5 addObjectsFromArray:v9];

    if ([(TUIStaticIdentityManager *)self->_staticIdentityManager accountKeysDisplayed])
    {
      uint64_t v10 = [[TUIAccountKeySpecifierProvider alloc] initWithStaticIdentityManager:self->_staticIdentityManager analytics:self->_analytics];
      peerAccountKeySpecifierProvider = self->_peerAccountKeySpecifierProvider;
      self->_peerAccountKeySpecifierProvider = v10;

      [(TUIAccountKeySpecifierProvider *)self->_peerAccountKeySpecifierProvider setDelegate:self];
      [(TUIAccountKeySpecifierProvider *)self->_peerAccountKeySpecifierProvider setIsPeerAccount:1];
      [(TUIAccountKeySpecifierProvider *)self->_peerAccountKeySpecifierProvider setIsExpanded:1];
      uint64_t v12 = [(TUIAccountKeySpecifierProvider *)self->_peerAccountKeySpecifierProvider specifiers];
      [v5 addObjectsFromArray:v12];

      selfAccountKeySpecifierProvider = self->_selfAccountKeySpecifierProvider;
      if (!selfAccountKeySpecifierProvider)
      {
        id v14 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
        objc_super v15 = self->_selfAccountKeySpecifierProvider;
        self->_selfAccountKeySpecifierProvider = v14;

        [(TUIAccountKeySpecifierProvider *)self->_selfAccountKeySpecifierProvider setIsExpanded:1];
        [(TUIAccountKeySpecifierProvider *)self->_selfAccountKeySpecifierProvider setDelegate:self];
        selfAccountKeySpecifierProvider = self->_selfAccountKeySpecifierProvider;
      }
      v16 = [(TUIAccountKeySpecifierProvider *)selfAccountKeySpecifierProvider specifiers];
      [v5 addObjectsFromArray:v16];
    }
    [(TUIKTConversationViewController *)self requestPresentationStyleExpanded:[(TUIStaticIdentityManager *)self->_staticIdentityManager accountKeysDisplayed]];
    int v17 = (objc_class *)[v5 copy];
    v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v17;

    uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 setDelegate:self];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
        [(TUIKTConversationViewController *)self presentViewController:v6 animated:1 completion:0];
      }
      else {
        [(TUIKTConversationViewController *)self showViewController:v6 sender:v7];
      }
      goto LABEL_9;
    }
  }
  [(TUIKTConversationViewController *)self _openWithNavigationController:v6];
LABEL_9:
}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_87);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __79__TUIKTConversationViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_89_0);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __79__TUIKTConversationViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_91);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "Reloading specifiers for provider %@", (uint8_t *)&v8, 0xCu);
  }
  [(TUIKTConversationViewController *)self reloadSpecifiers];
}

uint64_t __86__TUIKTConversationViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_93_0);
  }
  uint64_t v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "validateDataclassAccessForProvider:specifier:completion not implemented", v11, 2u);
  }
}

uint64_t __91__TUIKTConversationViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_95);
  }
  id v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTConversationViewController contactViewController:didCompleteWithContact:]((uint64_t)v7, (uint64_t)self, v8);
  }
  id location = 0;
  objc_initWeak(&location, self);
  staticIdentityManager = self->_staticIdentityManager;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_96;
  uint64_t v13 = &unk_265553128;
  objc_copyWeak(&v14, &location);
  [(TUIStaticIdentityManager *)staticIdentityManager verifyConversationWithContact:v7 completionHandler:&v10];
  -[TUIKTConversationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_96(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained analytics];
    uint64_t v4 = [v2 staticIdentityManager];
    uint64_t v5 = [v4 conversationVerified];
    id v6 = [v2 staticIdentityManager];
    id v7 = [v6 sasCodeString];
    id v8 = [v2 staticIdentityManager];
    objc_msgSend(v3, "ktMarkAsVerified:sasCodeGenerated:publicKeyVisible:", v5, v7 != 0, objc_msgSend(v8, "accountKeysDisplayed"));

    id v9 = [v2 staticIdentityManager];
    LODWORD(v4) = [v9 conversationVerified];

    if (v4)
    {
      *(void *)id location = 0;
      objc_initWeak((id *)location, v2);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_99;
      block[3] = &unk_265553128;
      objc_copyWeak(&v12, (id *)location);
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_98);
    }
    uint64_t v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315138;
      *(void *)&location[4] = "-[TUIKTConversationViewController contactViewController:didCompleteWithContact:]_block_invoke";
      _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", location, 0xCu);
    }
  }
}

uint64_t __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_99(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_102);
    }
    uint64_t v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[TUIKTConversationViewController contactViewController:didCompleteWithContact:]_block_invoke";
      _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_2_100()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  id v6 = a5;
  BOOL v7 = [v6 section] || objc_msgSend(v6, "row");
  [v8 setSeparatorStyle:v7];
}

- (void)_openWithNavigationController:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__TUIKTConversationViewController__openWithNavigationController___block_invoke;
  block[3] = &unk_265552FE8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __65__TUIKTConversationViewController__openWithNavigationController___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:*(void *)(a1 + 32)];
    id v4 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = -2;
    }
    [v3 setModalPresentationStyle:v6];
    [WeakRetained presentViewController:v3 animated:1 completion:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_104);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[TUIKTConversationViewController _openWithNavigationController:]_block_invoke";
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v8, 0xCu);
    }
  }
}

uint64_t __65__TUIKTConversationViewController__openWithNavigationController___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (TUIKTConversationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIKTConversationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (TUIStaticIdentitySpecifierProvider)staticIdentitySpecifierProvider
{
  return self->_staticIdentitySpecifierProvider;
}

- (void)setStaticIdentitySpecifierProvider:(id)a3
{
}

- (TUIAccountKeySpecifierProvider)selfAccountKeySpecifierProvider
{
  return self->_selfAccountKeySpecifierProvider;
}

- (void)setSelfAccountKeySpecifierProvider:(id)a3
{
}

- (TUIAccountKeySpecifierProvider)peerAccountKeySpecifierProvider
{
  return self->_peerAccountKeySpecifierProvider;
}

- (void)setPeerAccountKeySpecifierProvider:(id)a3
{
}

- (TUIStaticIdentityManager)staticIdentityManager
{
  return self->_staticIdentityManager;
}

- (void)setStaticIdentityManager:(id)a3
{
}

- (TUIAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_staticIdentityManager, 0);
  objc_storeStrong((id *)&self->_peerAccountKeySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_selfAccountKeySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_staticIdentitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewDidAppear:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)viewDidDisappear:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewDidDisappear:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)contactViewController:(os_log_t)log didCompleteWithContact:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "-[TUIKTConversationViewController contactViewController:didCompleteWithContact:]";
  __int16 v5 = 1024;
  BOOL v6 = a1 != 0;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_260338000, log, OS_LOG_TYPE_DEBUG, "%s contact updated = %d on %{public}@", (uint8_t *)&v3, 0x1Cu);
}

@end