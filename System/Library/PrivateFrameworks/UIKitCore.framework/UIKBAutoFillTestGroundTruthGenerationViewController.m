@interface UIKBAutoFillTestGroundTruthGenerationViewController
- (UIKBAutoFillTestGroundTruthGenerationViewController)initWithAutoFillTestViewController:(id)a3;
- (UIKBAutoFillTestGroundTruthGenerationViewControllerDelegate)delegate;
- (UIKBAutoFillTestViewController)testViewController;
- (int64_t)taggerView:(id)a3 selectedTypeForFormRequest:(id)a4;
- (int64_t)taggerView:(id)a3 selectedTypeForTextFieldRequest:(id)a4;
- (void)_cancelBarButtonItemAction:(id)a3;
- (void)_enumerateSubviewsOfRootView:(id)a3 usingBlock:(id)a4;
- (void)_moveTaggerHighlightViewOverView:(id)a3;
- (void)_removeTaggerHighlightView;
- (void)setDelegate:(id)a3;
- (void)taggerView:(id)a3 didTagFormRequest:(id)a4 withSelectedType:(int64_t)a5;
- (void)taggerView:(id)a3 didTagTextFieldRequest:(id)a4 withSelectedType:(int64_t)a5;
- (void)taggerView:(id)a3 willTagRequest:(id)a4;
- (void)taggerViewDidFinish:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UIKBAutoFillTestGroundTruthGenerationViewController

- (UIKBAutoFillTestGroundTruthGenerationViewController)initWithAutoFillTestViewController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKBAutoFillTestGroundTruthGenerationViewController;
  v6 = [(UIViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_testViewController, a3);
    v8 = objc_alloc_init(UIKBAutoFillTestExpectedResult);
    expectedResult = v7->_expectedResult;
    v7->_expectedResult = v8;

    v10 = v7;
  }

  return v7;
}

- (void)_enumerateSubviewsOfRootView:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, char *, _WORD *))a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  [v7 addObject:v5];
  if ([v7 count])
  {
    while (1)
    {
      v9 = [v7 firstObject];
      [v7 removeObjectAtIndex:0];
      __int16 v11 = 0;
      v6[2](v6, v9, (char *)&v11 + 1, &v11);
      if ((_BYTE)v11) {
        break;
      }
      if (!HIBYTE(v11))
      {
        v10 = [v9 subviews];
        [v7 addObjectsFromArray:v10];
      }
      if (![v7 count]) {
        goto LABEL_8;
      }
    }
  }
LABEL_8:
}

- (void)viewDidLoad
{
  v49[8] = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)UIKBAutoFillTestGroundTruthGenerationViewController;
  [(UIViewController *)&v47 viewDidLoad];
  [(UIViewController *)self setTitle:@"AutoFill Test Case"];
  v3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:1 target:self action:sel__cancelBarButtonItemAction_];
  v4 = [(UIViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  id v5 = [(UIViewController *)self view];
  v6 = +[UIColor whiteColor];
  [v5 setBackgroundColor:v6];

  v7 = [UIScrollView alloc];
  [v5 bounds];
  v8 = -[UIScrollView initWithFrame:](v7, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  [(UIView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:self->_scrollView];
  [(UIViewController *)self addChildViewController:self->_testViewController];
  v46 = [(UIViewController *)self->_testViewController view];
  [v46 frame];
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(v46, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(UIView *)self->_scrollView addSubview:v46];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v11, v13);
  [(UIViewController *)self->_testViewController didMoveToParentViewController:self];
  v14 = -[UIKBAutoFillTestTaggerView initWithFrame:]([UIKBAutoFillTestTaggerView alloc], "initWithFrame:", 0.0, 0.0, 320.0, 280.0);
  taggerView = self->_taggerView;
  self->_taggerView = v14;

  [(UIKBAutoFillTestTaggerView *)self->_taggerView setDelegate:self];
  [(UIView *)self->_taggerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:self->_taggerView];
  v34 = (void *)MEMORY[0x1E4F5B268];
  v44 = [(UIView *)self->_scrollView topAnchor];
  v45 = [v5 safeAreaLayoutGuide];
  v43 = [v45 topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v49[0] = v42;
  v41 = [(UIView *)self->_scrollView leadingAnchor];
  v40 = [v5 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v49[1] = v39;
  v37 = [(UIView *)self->_scrollView trailingAnchor];
  v36 = [v5 trailingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v49[2] = v35;
  v33 = [(UIView *)self->_scrollView bottomAnchor];
  v32 = [(UIView *)self->_taggerView topAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v49[3] = v31;
  v30 = [(UIView *)self->_taggerView leadingAnchor];
  v29 = [v5 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v49[4] = v28;
  v27 = [(UIView *)self->_taggerView trailingAnchor];
  v16 = v5;
  v38 = v5;
  v17 = [v5 trailingAnchor];
  v18 = [v27 constraintEqualToAnchor:v17];
  v49[5] = v18;
  v19 = [(UIView *)self->_taggerView bottomAnchor];
  v20 = [v16 bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v49[6] = v21;
  v22 = [(UIView *)self->_taggerView heightAnchor];
  v23 = [v22 constraintEqualToConstant:280.0];
  v49[7] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:8];
  [v34 activateConstraints:v24];

  v25 = [[UIKBAutoFillTestTagRequest alloc] initWithRequestType:0 view:0];
  v48 = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  [(UIKBAutoFillTestTaggerView *)self->_taggerView setTagRequests:v26];
}

- (void)_cancelBarButtonItemAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained autoFillTestGroundTruthGenerationViewController:self didFinishWithResult:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIKBAutoFillTestGroundTruthGenerationViewController;
  [(UIViewController *)&v11 viewDidAppear:a3];
  v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [[UIKBAutoFillTestTagRequest alloc] initWithRequestType:0 view:0];
  [v4 addObject:v5];

  v6 = [(UIViewController *)self->_testViewController view];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__UIKBAutoFillTestGroundTruthGenerationViewController_viewDidAppear___block_invoke;
  v9[3] = &unk_1E52F2FF8;
  id v10 = v4;
  id v7 = v4;
  [(UIKBAutoFillTestGroundTruthGenerationViewController *)self _enumerateSubviewsOfRootView:v6 usingBlock:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__UIKBAutoFillTestGroundTruthGenerationViewController_viewDidAppear___block_invoke_2;
  v8[3] = &unk_1E52F3020;
  v8[4] = self;
  [v7 sortUsingComparator:v8];
  [(UIKBAutoFillTestTaggerView *)self->_taggerView setTagRequests:v7];
}

void __69__UIKBAutoFillTestGroundTruthGenerationViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 setScrollEnabled:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v13 frame];
      CGFloat v4 = v3;
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      if (([v13 isHidden] & 1) == 0)
      {
        v15.origin.x = v4;
        v15.origin.y = v6;
        v15.size.width = v8;
        v15.size.height = v10;
        if (CGRectGetWidth(v15) >= 15.0)
        {
          v16.origin.x = v4;
          v16.origin.y = v6;
          v16.size.width = v8;
          v16.size.height = v10;
          if (CGRectGetHeight(v16) >= 15.0)
          {
            objc_super v11 = *(void **)(a1 + 32);
            double v12 = [[UIKBAutoFillTestTagRequest alloc] initWithRequestType:1 view:v13];
            [v11 addObject:v12];
          }
        }
      }
    }
  }
}

uint64_t __69__UIKBAutoFillTestGroundTruthGenerationViewController_viewDidAppear___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 requestType];
  uint64_t v8 = [v6 requestType];
  if (v7 == v8)
  {
    double v9 = [v5 view];
    CGFloat v10 = [v6 view];
    objc_super v11 = [*(id *)(a1 + 32) view];
    [v9 frame];
    double v13 = v12;
    double v15 = v14;
    CGRect v16 = [v9 superview];
    objc_msgSend(v11, "convertPoint:fromView:", v16, v13, v15);
    double v18 = v17;

    v19 = [*(id *)(a1 + 32) view];
    [v10 frame];
    double v21 = v20;
    double v23 = v22;
    v24 = [v10 superview];
    objc_msgSend(v19, "convertPoint:fromView:", v24, v21, v23);
    double v26 = v25;

    v27 = [NSNumber numberWithDouble:v18];
    v28 = [NSNumber numberWithDouble:v26];
    uint64_t v29 = [v27 compare:v28];
  }
  else
  {
    uint64_t v30 = v8;
    double v9 = [NSNumber numberWithInteger:v7];
    CGFloat v10 = [NSNumber numberWithInteger:v30];
    uint64_t v29 = [v9 compare:v10];
  }

  return v29;
}

- (void)_moveTaggerHighlightViewOverView:(id)a3
{
  id v4 = a3;
  if (!self->_highlightView)
  {
    id v5 = objc_alloc_init(UIView);
    highlightView = self->_highlightView;
    self->_highlightView = v5;

    uint64_t v7 = +[UIColor colorWithWhite:0.2 alpha:0.8];
    [(UIView *)self->_highlightView setBackgroundColor:v7];

    uint64_t v8 = [(UIView *)self->_highlightView layer];
    [v8 setAllowsGroupBlending:1];

    double v9 = objc_alloc_init(UIView);
    highlightBox = self->_highlightBox;
    self->_highlightBox = v9;

    objc_super v11 = +[UIColor blackColor];
    [(UIView *)self->_highlightBox setBackgroundColor:v11];

    uint64_t v12 = *MEMORY[0x1E4F3A098];
    double v13 = [(UIView *)self->_highlightBox layer];
    [v13 setCompositingFilter:v12];

    double v14 = [(UIView *)self->_highlightBox layer];
    [v14 setCornerRadius:8.0];

    double v15 = [(UIView *)self->_highlightBox layer];
    [v15 setMasksToBounds:1];

    uint64_t v16 = *MEMORY[0x1E4F39EA8];
    double v17 = [(UIView *)self->_highlightBox layer];
    [v17 setCornerCurve:v16];

    [(UIView *)self->_highlightView addSubview:self->_highlightBox];
  }
  [(UIScrollView *)self->_scrollView contentSize];
  double v19 = v18;
  [(UIScrollView *)self->_scrollView contentSize];
  -[UIView setFrame:](self->_highlightView, "setFrame:", 0.0, 0.0, v19, v20);
  scrollView = self->_scrollView;
  [v4 frame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  uint64_t v30 = [v4 superview];
  -[UIView convertRect:fromView:](scrollView, "convertRect:fromView:", v30, v23, v25, v27, v29);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  v39 = [(UIView *)self->_highlightView superview];

  if (!v39)
  {
    [(UIView *)self->_scrollView addSubview:self->_highlightView];
    -[UIView setFrame:](self->_highlightBox, "setFrame:", v32, v34, v36, v38);
    [(UIView *)self->_highlightView setAlpha:0.0];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __88__UIKBAutoFillTestGroundTruthGenerationViewController__moveTaggerHighlightViewOverView___block_invoke;
    v41[3] = &unk_1E52D9F70;
    v41[4] = self;
    +[UIView animateWithDuration:65540 delay:v41 options:0 animations:0.25 completion:0.0];
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __88__UIKBAutoFillTestGroundTruthGenerationViewController__moveTaggerHighlightViewOverView___block_invoke_2;
  v40[3] = &unk_1E52DA520;
  v40[4] = self;
  *(double *)&v40[5] = v32;
  *(double *)&v40[6] = v34;
  *(double *)&v40[7] = v36;
  *(double *)&v40[8] = v38;
  +[UIView animateWithDuration:131076 delay:v40 options:0 animations:0.25 completion:0.0];
  -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1, v32, v34, v36, v38);
}

uint64_t __88__UIKBAutoFillTestGroundTruthGenerationViewController__moveTaggerHighlightViewOverView___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setAlpha:1.0];
}

uint64_t __88__UIKBAutoFillTestGroundTruthGenerationViewController__moveTaggerHighlightViewOverView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1024), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_removeTaggerHighlightView
{
  v2[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__UIKBAutoFillTestGroundTruthGenerationViewController__removeTaggerHighlightView__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __81__UIKBAutoFillTestGroundTruthGenerationViewController__removeTaggerHighlightView__block_invoke_2;
  v2[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:131076 delay:v3 options:v2 animations:0.25 completion:0.0];
}

uint64_t __81__UIKBAutoFillTestGroundTruthGenerationViewController__removeTaggerHighlightView__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setAlpha:0.0];
}

uint64_t __81__UIKBAutoFillTestGroundTruthGenerationViewController__removeTaggerHighlightView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) removeFromSuperview];
}

- (void)taggerViewDidFinish:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained autoFillTestGroundTruthGenerationViewController:self didFinishWithResult:self->_expectedResult];
  }
}

- (void)taggerView:(id)a3 willTagRequest:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "view", a3);
  id v6 = (id)v5;
  if (v5) {
    [(UIKBAutoFillTestGroundTruthGenerationViewController *)self _moveTaggerHighlightViewOverView:v5];
  }
  else {
    [(UIKBAutoFillTestGroundTruthGenerationViewController *)self _removeTaggerHighlightView];
  }
}

- (int64_t)taggerView:(id)a3 selectedTypeForFormRequest:(id)a4
{
  return [(UIKBAutoFillTestExpectedResult *)self->_expectedResult formType];
}

- (int64_t)taggerView:(id)a3 selectedTypeForTextFieldRequest:(id)a4
{
  expectedResult = self->_expectedResult;
  uint64_t v5 = objc_msgSend(a4, "view", a3);
  int64_t v6 = -[UIKBAutoFillTestExpectedResult typeForTextFieldWithTag:](expectedResult, "typeForTextFieldWithTag:", [v5 tag]);

  return v6;
}

- (void)taggerView:(id)a3 didTagFormRequest:(id)a4 withSelectedType:(int64_t)a5
{
}

- (void)taggerView:(id)a3 didTagTextFieldRequest:(id)a4 withSelectedType:(int64_t)a5
{
  expectedResult = self->_expectedResult;
  objc_msgSend(a4, "view", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBAutoFillTestExpectedResult setType:forTextFieldWithTag:](expectedResult, "setType:forTextFieldWithTag:", a5, [v7 tag]);
}

- (UIKBAutoFillTestGroundTruthGenerationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKBAutoFillTestGroundTruthGenerationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIKBAutoFillTestViewController)testViewController
{
  return self->_testViewController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_highlightBox, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_taggerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_expectedResult, 0);
  objc_storeStrong((id *)&self->_testViewController, 0);
}

@end