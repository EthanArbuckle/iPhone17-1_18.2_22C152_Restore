@interface TUIKTSingleAccountViewController
- (NSDictionary)options;
- (TUIAccountKeySpecifierProvider)accountKeySpecifierProvider;
- (TUIKTSingleAccountViewController)initWithOptions:(id)a3;
- (id)specifiers;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setAccountKeySpecifierProvider:(id)a3;
- (void)setOptions:(id)a3;
- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4;
- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5;
@end

@implementation TUIKTSingleAccountViewController

- (TUIKTSingleAccountViewController)initWithOptions:(id)a3
{
  id v5 = a3;
  v6 = [(TUIKTSingleAccountViewController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
    if (!accountKeySpecifierProvider)
    {
      v7 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
      v8 = self->_accountKeySpecifierProvider;
      self->_accountKeySpecifierProvider = v7;

      [(TUIAccountKeySpecifierProvider *)self->_accountKeySpecifierProvider setDelegate:self];
      accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
    }
    v9 = [(TUIAccountKeySpecifierProvider *)accountKeySpecifierProvider specifiers];
    [v5 addObjectsFromArray:v9];

    v10 = (objc_class *)[v5 copy];
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v10;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [(TUIKTSingleAccountViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else {
    [(TUIKTSingleAccountViewController *)self showViewController:v6 sender:v7];
  }
}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5, &__block_literal_global_5);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __80__TUIKTSingleAccountViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5, &__block_literal_global_29);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __80__TUIKTSingleAccountViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5, &__block_literal_global_31);
  }
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "Reloading specifiers for provider %@", (uint8_t *)&v12, 0xCu);
  }
  if ([v9 count])
  {
    v11 = [v8 specifiers];
    [(TUIKTSingleAccountViewController *)self replaceContiguousSpecifiers:v9 withSpecifiers:v11 animated:v5];
  }
  else
  {
    [(TUIKTSingleAccountViewController *)self reloadSpecifiers];
  }
}

uint64_t __87__TUIKTSingleAccountViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5, &__block_literal_global_33);
  }
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "validateDataclassAccessForProvider:specifier:completion not implemented", v11, 2u);
  }
}

uint64_t __92__TUIKTSingleAccountViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (TUIAccountKeySpecifierProvider)accountKeySpecifierProvider
{
  return self->_accountKeySpecifierProvider;
}

- (void)setAccountKeySpecifierProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountKeySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end