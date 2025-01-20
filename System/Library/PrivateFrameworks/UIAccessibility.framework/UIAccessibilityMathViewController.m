@interface UIAccessibilityMathViewController
- (NSDictionary)mathDictionary;
- (UIAccessibilityMathViewController)initWithMathDictionary:(id)a3;
- (id)_htmlString;
- (void)_doneButtonTapped;
- (void)_styleBarButtonItem:(id)a3;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation UIAccessibilityMathViewController

- (UIAccessibilityMathViewController)initWithMathDictionary:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)UIAccessibilityMathViewController;
  v6 = [(UIAccessibilityMathViewController *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mathDictionary, a3);
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    v8 = (void *)getSCRCMathExpressionClass_softClass;
    uint64_t v28 = getSCRCMathExpressionClass_softClass;
    if (!getSCRCMathExpressionClass_softClass)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __getSCRCMathExpressionClass_block_invoke;
      v24[3] = &unk_1E59B89A0;
      v24[4] = &v25;
      __getSCRCMathExpressionClass_block_invoke((uint64_t)v24);
      v8 = (void *)v26[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v25, 8);
    uint64_t v10 = [v9 mathExpressionWithDictionary:v5];
    mathExpression = v7->_mathExpression;
    v7->_mathExpression = (SCRCMathExpression *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F427C0]);
    v13 = UIAccessibilityBundle();
    v14 = [v13 localizedStringForKey:@"DONE" value:&stru_1EF1680E8 table:@"Localized"];
    v15 = (void *)[v12 initWithTitle:v14 style:0 target:v7 action:sel__doneButtonTapped];

    [(UIAccessibilityMathViewController *)v7 _styleBarButtonItem:v15];
    v16 = [(UIAccessibilityMathViewController *)v7 navigationItem];
    [v16 setRightBarButtonItem:v15];

    id v17 = objc_alloc(MEMORY[0x1E4F427C0]);
    v18 = UIAccessibilityBundle();
    v19 = [v18 localizedStringForKey:@"BACK" value:&stru_1EF1680E8 table:@"Localized"];
    v20 = (void *)[v17 initWithTitle:v19 style:0 target:0 action:0];

    [(UIAccessibilityMathViewController *)v7 _styleBarButtonItem:v20];
    v21 = [(UIAccessibilityMathViewController *)v7 navigationItem];
    [v21 setBackBarButtonItem:v20];
  }
  return v7;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityMathViewController;
  [(UIAccessibilityMathViewController *)&v6 loadView];
  v3 = objc_alloc_init(UIAccessibilityMathWebView);
  webView = self->_webView;
  self->_webView = v3;

  [(UIAccessibilityMathWebView *)self->_webView setNavigationDelegate:self];
  id v5 = [(UIAccessibilityMathWebView *)self->_webView scrollView];
  [v5 setScrollEnabled:0];

  [(UIAccessibilityMathViewController *)self setView:self->_webView];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityMathViewController;
  [(UIAccessibilityMathViewController *)&v6 viewDidLoad];
  webView = self->_webView;
  v4 = [(UIAccessibilityMathViewController *)self _htmlString];
  id v5 = (id)[(UIAccessibilityMathWebView *)webView loadHTMLString:v4 baseURL:0];
}

- (id)_htmlString
{
  if (_htmlString_onceToken != -1) {
    dispatch_once(&_htmlString_onceToken, &__block_literal_global_15);
  }
  uint64_t v3 = _htmlString_HTMLFormat;
  if (_htmlString_HTMLFormat)
  {
    v4 = NSString;
    id v5 = [(SCRCMathExpression *)self->_mathExpression mathMLString];
    objc_msgSend(v4, "stringWithFormat:", v3, v5);
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v6 = &stru_1EF1680E8;
  }

  return v6;
}

void __48__UIAccessibilityMathViewController__htmlString__block_invoke()
{
  v0 = UIAccessibilityBundle();
  v1 = [v0 URLForResource:@"UIAccessibilityMathExpressionFormat" withExtension:@"html"];

  if (v1)
  {
    id v5 = 0;
    uint64_t v2 = [NSString stringWithContentsOfURL:v1 encoding:4 error:&v5];
    id v3 = v5;
    v4 = (void *)_htmlString_HTMLFormat;
    _htmlString_HTMLFormat = v2;

    if (v3) {
      _AXLogWithFacility();
    }
  }
  else
  {
    _AXLogWithFacility();
  }
}

- (void)_doneButtonTapped
{
  id v3 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v2 = [v3 accessibilityPresentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_styleBarButtonItem:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F428B8] clearColor];
  [v4 setShadowColor:v5];

  v9[0] = *MEMORY[0x1E4F42508];
  objc_super v6 = [MEMORY[0x1E4F42A30] fontWithName:@"Helvetica-Bold" size:12.0];
  v10[0] = v6;
  v9[1] = *MEMORY[0x1E4F42510];
  v7 = [MEMORY[0x1E4F428B8] blackColor];
  v9[2] = *MEMORY[0x1E4F42560];
  v10[1] = v7;
  v10[2] = v4;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v3 setTitleTextAttributes:v8 forState:0];
}

- (NSDictionary)mathDictionary
{
  return self->_mathDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathDictionary, 0);
  objc_storeStrong((id *)&self->_webView, 0);

  objc_storeStrong((id *)&self->_mathExpression, 0);
}

@end