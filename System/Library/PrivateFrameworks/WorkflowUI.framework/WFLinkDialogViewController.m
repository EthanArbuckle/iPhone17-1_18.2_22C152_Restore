@interface WFLinkDialogViewController
- (UIViewController)snippetViewController;
- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4;
- (id)snippetInteractedResponseWithURL:(id)a3;
- (void)setSnippetViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFLinkDialogViewController

- (void).cxx_destruct
{
}

- (void)setSnippetViewController:(id)a3
{
}

- (UIViewController)snippetViewController
{
  return self->_snippetViewController;
}

- (id)snippetInteractedResponseWithURL:(id)a3
{
  return 0;
}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  v4 = [(WFLinkDialogViewController *)self snippetViewController];
  v5 = [v4 view];
  [v5 intrinsicContentSize];
  double v7 = v6;

  return v7;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)WFLinkDialogViewController;
  [(WFLinkDialogViewController *)&v10 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  v4 = [MEMORY[0x263F825C8] systemPurpleColor];
  [v3 setBackgroundColor:v4];

  v5 = [(WFCompactDialogViewController *)self request];
  double v6 = [v5 viewSnippet];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__WFLinkDialogViewController_viewDidLoad__block_invoke;
  v9[3] = &unk_2649CBA08;
  v9[4] = self;
  double v7 = [v6 viewControllerWithTapHandler:v9];

  [(WFCompactPlatterViewController *)self setContentViewController:v7];
  snippetViewController = self->_snippetViewController;
  self->_snippetViewController = v7;
}

void __41__WFLinkDialogViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) snippetInteractedResponseWithURL:a2];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 32) finishWithResponse:v3];
    id v3 = v4;
  }
}

@end