@interface ICTextViewController
+ (id)createTextViewUsingTextController:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4 note:(id)a5 containerWidth:(double)a6 forManualRendering:(BOOL)a7 scrollState:(id)a8 traitCollection:(id)a9;
+ (id)printFormatterForNote:(id)a3 withSize:(CGSize)a4 traitCollection:(id)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)ignoresTaps;
- (BOOL)performingInitialSetup;
- (BOOL)shouldAnimateTransitionForSplitViewController:(id)a3;
- (ICAttributionSidebarView)attributionSidebarView;
- (ICLayoutManager)layoutManager;
- (ICNote)note;
- (ICTextBackgroundView)backgroundView;
- (ICTextController)textController;
- (ICTextView)textView;
- (ICTextView)textViewIfLoaded;
- (ICTextViewController)initWithViewControllerManager:(id)a3 editorViewController:(id)a4 note:(id)a5 initialContainerWidth:(double)a6 scrollState:(id)a7;
- (ICTextViewScrollState)initialScrollState;
- (ICTextViewScrollState)transitionScrollState;
- (ICViewControllerManager)viewControllerManager;
- (NSArray)transitionConstraints;
- (NSDate)attributionSidebarOpenedDate;
- (NSLayoutConstraint)attributionSidebarTrailingConstraint;
- (NSLayoutConstraint)attributionSidebarWidthConstraint;
- (NSLayoutConstraint)textViewLeadingConstraint;
- (NSMutableSet)enabledSubviews;
- (UIColor)backgroundColor;
- (double)initialContainerWidth;
- (id)captureContentOffsetStateIfNecessary;
- (id)editorController;
- (id)splitViewControllerDidEndAnimatedTransitionToStateRequestHandler;
- (void)applyCapturedContentOffsetStateIfNecessary:(id)a3;
- (void)applyInitialScrollState;
- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5;
- (void)layoutManagerDidInvalidateLayout:(id)a3;
- (void)loadView;
- (void)setAttributionSidebarOpenedDate:(id)a3;
- (void)setAttributionSidebarView:(id)a3;
- (void)setAttributionSidebarWidth:(double)a3 isGestureActive:(BOOL)a4 animated:(BOOL)a5 currentVelocity:(double)a6;
- (void)setAttributionSidebarWidthConstraint:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setEnabledSubviews:(id)a3;
- (void)setIgnoresTaps:(BOOL)a3;
- (void)setInitialContainerWidth:(double)a3;
- (void)setInitialScrollState:(id)a3;
- (void)setNote:(id)a3;
- (void)setPerformingInitialSetup:(BOOL)a3;
- (void)setSplitViewControllerDidEndAnimatedTransitionToStateRequestHandler:(id)a3;
- (void)setTextController:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTransitionConstraints:(id)a3;
- (void)setTransitionScrollState:(id)a3;
- (void)splitViewControllerDidEndAnimatedTransitionToStateRequest:(id)a3;
- (void)splitViewControllerWillBeginAnimatedTransitionToStateRequest:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICTextViewController

- (ICTextViewController)initWithViewControllerManager:(id)a3 editorViewController:(id)a4 note:(id)a5 initialContainerWidth:(double)a6 scrollState:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v46.receiver = self;
  v46.super_class = (Class)ICTextViewController;
  v16 = [(ICTextViewController *)&v46 initWithNibName:0 bundle:0];
  if (v16)
  {
    id v45 = v14;
    v17 = (ICTextController *)objc_alloc_init(MEMORY[0x263F5B4E8]);
    textController = v16->_textController;
    v16->_textController = v17;

    objc_storeWeak((id *)&v16->_viewControllerManager, v12);
    objc_storeStrong((id *)&v16->_note, a5);
    v16->_initialContainerWidth = a6;
    objc_storeStrong((id *)&v16->_initialScrollState, a7);
    uint64_t v19 = [MEMORY[0x263EFF9C0] set];
    enabledSubviews = v16->_enabledSubviews;
    v16->_enabledSubviews = (NSMutableSet *)v19;

    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v16 selector:sel_splitViewControllerWillBeginAnimatedTransitionToStateRequest_ name:@"ICSplitViewControllerWillBeginAnimatedTransitionToStateRequest" object:0];

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v16 selector:sel_splitViewControllerDidEndAnimatedTransitionToStateRequest_ name:@"ICSplitViewControllerDidEndAnimatedTransitionToStateRequest" object:0];

    v23 = [MEMORY[0x263EFF910] now];
    v24 = objc_opt_class();
    v25 = [(ICTextViewController *)v16 textController];
    v26 = [(ICTextViewController *)v16 note];
    [(ICTextViewController *)v16 initialContainerWidth];
    double v28 = v27;
    v29 = [(ICTextViewController *)v16 transitionScrollState];
    v30 = [v13 traitCollection];
    uint64_t v31 = [v24 createTextViewUsingTextController:v25 stylingTextUsingSeparateTextStorageForRendering:0 note:v26 containerWidth:0 forManualRendering:v29 scrollState:v30 traitCollection:v28];
    textView = v16->_textView;
    v16->_textView = (ICTextView *)v31;

    [(ICTextView *)v16->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICTextView *)v16->_textView setClipsToBounds:0];
    v33 = [(ICTextView *)v16->_textView layoutManager];
    [v33 setDelegate:v16];

    [(ICBaseTextView *)v16->_textView setEditorController:v13];
    v34 = [MEMORY[0x263EFF910] date];
    [v34 timeIntervalSinceDate:v23];
    double v36 = v35;

    v37 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[ICTextViewController initWithViewControllerManager:editorViewController:note:initialContainerWidth:scrollState:](v16, v37, v36);
    }

    v38 = (ICTextBackgroundView *)objc_alloc_init(MEMORY[0x263F5B4D8]);
    backgroundView = v16->_backgroundView;
    v16->_backgroundView = v38;

    [(ICTextBackgroundView *)v16->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = [(ICBaseTextView *)v16->_textView editorController];
    char v41 = [v40 isEditingOnSystemPaper];

    if ((v41 & 1) == 0)
    {
      v42 = objc_alloc_init(ICAttributionSidebarView);
      attributionSidebarView = v16->_attributionSidebarView;
      v16->_attributionSidebarView = v42;

      [(ICAttributionSidebarView *)v16->_attributionSidebarView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(ICAttributionSidebarView *)v16->_attributionSidebarView setTextView:v16->_textView];
    }

    id v14 = v45;
  }

  return v16;
}

- (void)loadView
{
  v3 = [[ICTextViewControllerView alloc] initWithTextView:self->_textView];
  [(ICTextViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v72[4] = *MEMORY[0x263EF8340];
  v69.receiver = self;
  v69.super_class = (Class)ICTextViewController;
  [(ICTextViewController *)&v69 viewDidLoad];
  v3 = [(ICTextViewController *)self view];
  v4 = [(ICTextViewController *)self textView];
  [v3 addSubview:v4];

  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    v5 = [(ICTextViewController *)self textView];
    v6 = [(ICTextViewController *)self backgroundView];
    [v5 insertSubview:v6 atIndex:0];

    v7 = [(ICTextViewController *)self attributionSidebarView];

    if (v7)
    {
      v8 = [(ICTextViewController *)self textView];
      v9 = [(ICTextViewController *)self attributionSidebarView];
      [v8 insertSubview:v9 atIndex:0];

      objc_super v46 = (void *)MEMORY[0x263F08938];
      v67 = [(ICTextViewController *)self attributionSidebarView];
      v10 = [v67 widthAnchor];
      v63 = [(ICTextViewController *)self attributionSidebarView];
      [v63 fullContentWidth];
      v65 = v10;
      objc_msgSend(v10, "constraintEqualToConstant:");
      v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      attributionSidebarWidthConstraint = self->_attributionSidebarWidthConstraint;
      self->_attributionSidebarWidthConstraint = v11;

      v72[0] = v11;
      v61 = [(ICTextViewController *)self attributionSidebarView];
      id v13 = [v61 topAnchor];
      v57 = [(ICTextViewController *)self backgroundView];
      [v57 topAnchor];
      v55 = v59 = v13;
      v53 = objc_msgSend(v13, "constraintEqualToAnchor:");
      v72[1] = v53;
      v51 = [(ICTextViewController *)self attributionSidebarView];
      id v14 = [v51 trailingAnchor];
      id v15 = [(ICTextViewController *)self textView];
      v16 = [v15 leadingAnchor];
      v49 = v14;
      v17 = [v14 constraintEqualToAnchor:v16];
      v72[2] = v17;
      v18 = [(ICTextViewController *)self attributionSidebarView];
      uint64_t v19 = [v18 bottomAnchor];
      v20 = [(ICTextViewController *)self backgroundView];
      v21 = [v20 bottomAnchor];
      v22 = [v19 constraintEqualToAnchor:v21];
      v72[3] = v22;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:4];
      [v46 activateConstraints:v23];

LABEL_6:
    }
  }
  else
  {
    v24 = [(ICTextViewController *)self attributionSidebarView];

    if (v24)
    {
      v25 = [(ICTextViewController *)self textView];
      v26 = [(ICTextViewController *)self attributionSidebarView];
      [v25 insertSubview:v26 atIndex:0];

      v47 = (void *)MEMORY[0x263F08938];
      v67 = [(ICTextViewController *)self attributionSidebarView];
      double v27 = [v67 topAnchor];
      v63 = [(ICTextViewController *)self textView];
      [v63 topAnchor];
      v61 = v65 = v27;
      v59 = objc_msgSend(v27, "constraintEqualToAnchor:");
      v71[0] = v59;
      v57 = [(ICTextViewController *)self attributionSidebarView];
      double v28 = [v57 heightAnchor];
      v53 = [(ICTextViewController *)self textView];
      [v53 heightAnchor];
      v51 = v55 = v28;
      v49 = objc_msgSend(v28, "constraintEqualToAnchor:");
      v71[1] = v49;
      id v15 = [(ICTextViewController *)self attributionSidebarView];
      v16 = [v15 trailingAnchor];
      v17 = [(ICTextViewController *)self view];
      v18 = [v17 leadingAnchor];
      v29 = [v16 constraintEqualToAnchor:v18];
      attributionSidebarTrailingConstraint = self->_attributionSidebarTrailingConstraint;
      self->_attributionSidebarTrailingConstraint = v29;

      v71[2] = v29;
      uint64_t v19 = [(ICTextViewController *)self attributionSidebarView];
      v20 = [v19 widthAnchor];
      v21 = [(ICTextViewController *)self attributionSidebarView];
      [v21 fullContentWidth];
      objc_msgSend(v20, "constraintEqualToConstant:");
      uint64_t v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v32 = self->_attributionSidebarWidthConstraint;
      self->_attributionSidebarWidthConstraint = v31;

      v71[3] = v31;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:4];
      [v47 activateConstraints:v22];
      goto LABEL_6;
    }
  }
  v54 = (void *)MEMORY[0x263F08938];
  v68 = [(ICTextViewController *)self textView];
  v64 = [v68 leadingAnchor];
  v66 = [(ICTextViewController *)self view];
  v62 = [v66 leadingAnchor];
  v33 = [v64 constraintEqualToAnchor:v62];
  textViewLeadingConstraint = self->_textViewLeadingConstraint;
  self->_textViewLeadingConstraint = v33;

  v70[0] = v33;
  v60 = [(ICTextViewController *)self textView];
  v56 = [v60 topAnchor];
  v58 = [(ICTextViewController *)self view];
  v52 = [v58 topAnchor];
  v50 = [v56 constraintEqualToAnchor:v52];
  v70[1] = v50;
  v48 = [(ICTextViewController *)self textView];
  id v45 = [v48 widthAnchor];
  double v35 = [(ICTextViewController *)self view];
  double v36 = [v35 widthAnchor];
  v37 = [v45 constraintEqualToAnchor:v36];
  v70[2] = v37;
  v38 = [(ICTextViewController *)self textView];
  v39 = [v38 bottomAnchor];
  v40 = [(ICTextViewController *)self view];
  char v41 = [v40 bottomAnchor];
  v42 = [v39 constraintEqualToAnchor:v41];
  v70[3] = v42;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:4];
  [v54 activateConstraints:v43];

  v44 = [(ICTextViewController *)self textView];
  [v44 setFindInteractionEnabled:1];
}

- (void)setIgnoresTaps:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  self->_ignoresTaps = a3;
  if (a3)
  {
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    v5 = [(ICTextViewController *)self textView];
    v6 = [v5 subviews];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v11 isUserInteractionEnabled])
          {
            id v12 = [(ICTextViewController *)self enabledSubviews];
            [v12 addObject:v11];

            [v11 setUserInteractionEnabled:0];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    *((void *)&v19 + 1) = 0;
    long long v20 = 0uLL;
    id v13 = [(ICTextViewController *)self enabledSubviews];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * j) setUserInteractionEnabled:1];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }

    v6 = [(ICTextViewController *)self enabledSubviews];
    [v6 removeAllObjects];
  }

  v18 = [(ICTextViewController *)self textView];
  [v18 setSelectable:!v3];
}

- (void)setAttributionSidebarWidth:(double)a3 isGestureActive:(BOOL)a4 animated:(BOOL)a5 currentVelocity:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v11 = [(ICTextViewController *)self attributionSidebarView];

  if (!v11) {
    return;
  }
  id v12 = [(ICTextViewController *)self textViewLeadingConstraint];
  [v12 constant];
  double v14 = v13;

  if (v14 == a3)
  {
    uint64_t v15 = [(ICTextViewController *)self attributionSidebarView];
    [v15 setVisibleContentWidth:v8 isGestureActive:a3];

    if (a3 == 0.0)
    {
      [(ICTextViewController *)self setIgnoresTaps:0];
    }
    return;
  }
  uint64_t v16 = [(ICTextViewController *)self attributionSidebarOpenedDate];
  [v16 timeIntervalSinceNow];
  double v18 = v17;

  long long v19 = [(ICTextViewController *)self attributionSidebarView];
  [v19 visibleContentWidth];
  if (a3 == 0.0 && v20 > 0.0)
  {
    if (v18 < 0.0) {
      double v18 = -v18;
    }

    if (v18 <= 2.0) {
      goto LABEL_14;
    }
    long long v19 = [MEMORY[0x263EFF910] now];
    long long v21 = [(ICTextViewController *)self note];
    [v21 setLastAttributionsViewedDate:v19];
  }
LABEL_14:
  long long v22 = [(ICTextViewController *)self attributionSidebarView];
  [v22 fullContentWidth];
  double v24 = v23;

  if (v24 == a3)
  {
    long long v25 = [(ICTextViewController *)self textView];
    [v25 clampTextView];
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__ICTextViewController_setAttributionSidebarWidth_isGestureActive_animated_currentVelocity___block_invoke;
  aBlock[3] = &unk_2640BB808;
  aBlock[4] = self;
  BOOL v35 = v24 == a3;
  *(double *)&aBlock[5] = a3;
  long long v26 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  double v27 = [(ICTextViewController *)self attributionSidebarView];
  [v27 setVisibleContentWidth:v8 isGestureActive:a3];

  if (v7)
  {
    double v28 = 1.0;
    if (a6 > 0.0)
    {
      uint64_t v29 = [(ICTextViewController *)self attributionSidebarView];
      [v29 visibleContentWidth];
      double v28 = (a3 - v30) / a6;
    }
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __92__ICTextViewController_setAttributionSidebarWidth_isGestureActive_animated_currentVelocity___block_invoke_2;
    v33[3] = &unk_2640B94E8;
    v33[4] = self;
    *(double *)&v33[5] = a3;
    [MEMORY[0x263F82E00] animateWithDuration:0 delay:v33 usingSpringWithDamping:v26 initialSpringVelocity:0.3 options:0.0 animations:0.65 completion:v28];
  }
  else
  {
    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
    {
      uint64_t v31 = [(ICTextViewController *)self view];
      [v31 setNeedsLayout];
    }
    else
    {
      v32 = [(ICTextViewController *)self textViewLeadingConstraint];
      [v32 setConstant:a3];

      uint64_t v31 = [(ICTextViewController *)self attributionSidebarTrailingConstraint];
      [v31 setConstant:a3];
    }

    v26[2](v26, 1);
  }
}

void __92__ICTextViewController_setAttributionSidebarWidth_isGestureActive_animated_currentVelocity___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textView];
  [v2 unclampTextView];

  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setAttributionSidebarOpenedDate:v4];
  }
  else
  {
    if (*(double *)(a1 + 40) != 0.0) {
      return;
    }
    v4 = [*(id *)(a1 + 32) attributionSidebarView];
    [v4 reload];
  }

  v5 = *(void **)(a1 + 32);

  [v5 setIgnoresTaps:v3 != 0];
}

void __92__ICTextViewController_setAttributionSidebarWidth_isGestureActive_animated_currentVelocity___block_invoke_2(uint64_t a1)
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    v2 = [*(id *)(a1 + 32) view];
    [v2 setNeedsLayout];
  }
  else
  {
    double v3 = *(double *)(a1 + 40);
    v4 = [*(id *)(a1 + 32) textViewLeadingConstraint];
    [v4 setConstant:v3];

    double v5 = *(double *)(a1 + 40);
    v2 = [*(id *)(a1 + 32) attributionSidebarTrailingConstraint];
    [v2 setConstant:v5];
  }

  id v6 = [*(id *)(a1 + 32) view];
  [v6 layoutIfNeeded];
}

- (ICTextView)textView
{
  textView = [(ICTextViewController *)self view];
  v4 = textView;
  if (textView) {
    textView = self->_textView;
  }
  double v5 = textView;

  return v5;
}

- (ICTextView)textViewIfLoaded
{
  textView = [(ICTextViewController *)self viewIfLoaded];
  v4 = textView;
  if (textView) {
    textView = self->_textView;
  }
  double v5 = textView;

  return v5;
}

- (id)editorController
{
  v2 = [(ICTextViewController *)self textView];
  double v3 = [v2 editorController];

  return v3;
}

- (ICLayoutManager)layoutManager
{
  objc_opt_class();
  double v3 = [(ICTextViewController *)self textView];
  v4 = [v3 layoutManager];
  double v5 = ICCheckedDynamicCast();

  return (ICLayoutManager *)v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  BOOL v8 = [(ICTextViewController *)self captureContentOffsetStateIfNecessary];
  [(ICTextViewController *)self setTransitionScrollState:v8];
  uint64_t v9 = [(ICTextViewController *)self textView];
  [v9 setIsTransitioningToNewSize:1];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__ICTextViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_2640BB830;
  v14[4] = self;
  id v15 = v8;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__ICTextViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_2640BB830;
  v12[4] = self;
  id v13 = v15;
  id v10 = v15;
  [v7 animateAlongsideTransition:v14 completion:v12];
  v11.receiver = self;
  v11.super_class = (Class)ICTextViewController;
  -[ICTextViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __75__ICTextViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyCapturedContentOffsetStateIfNecessary:*(void *)(a1 + 40)];
}

uint64_t __75__ICTextViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) applyCapturedContentOffsetStateIfNecessary:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) textView];
  [v2 setIsTransitioningToNewSize:0];

  double v3 = *(void **)(a1 + 32);

  return [v3 setTransitionScrollState:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICTextViewController;
  [(ICTextViewController *)&v4 viewDidAppear:a3];
  [(ICTextViewController *)self applyInitialScrollState];
}

- (void)applyInitialScrollState
{
  double v3 = [(ICTextViewController *)self initialScrollState];

  if (v3)
  {
    objc_super v4 = [(ICTextViewController *)self initialScrollState];
    [(ICTextViewController *)self applyCapturedContentOffsetStateIfNecessary:v4];
  }

  [(ICTextViewController *)self setInitialScrollState:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICTextViewController;
  [(ICTextViewController *)&v9 viewWillDisappear:a3];
  objc_super v4 = [(ICTextViewController *)self attributionSidebarView];

  if (v4)
  {
    double v5 = [(ICTextViewController *)self attributionSidebarView];
    [v5 unfocusAttributionDetails];

    id v6 = [(ICTextViewController *)self textView];
    id v7 = [v6 editorController];
    BOOL v8 = [v7 attributionSidebarController];
    [v8 hideSidebarAnimated:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)ICTextViewController;
  [(ICTextViewController *)&v22 viewDidLayoutSubviews];
  double v3 = [(ICTextViewController *)self textView];
  int v4 = [v3 isTransitioningToNewSize];

  if (v4)
  {
    uint64_t v5 = [(ICTextViewController *)self transitionScrollState];
LABEL_3:
    id v6 = (void *)v5;
    [(ICTextViewController *)self applyCapturedContentOffsetStateIfNecessary:v5];

    goto LABEL_8;
  }
  if (![(ICTextViewController *)self performingInitialSetup])
  {
    uint64_t v7 = [(ICTextViewController *)self initialScrollState];
    if (v7)
    {
      BOOL v8 = (void *)v7;
      objc_super v9 = [(ICTextViewController *)self textView];
      [v9 bounds];
      double v11 = v10;

      if (v11 > 0.0)
      {
        uint64_t v5 = [(ICTextViewController *)self initialScrollState];
        goto LABEL_3;
      }
    }
  }
LABEL_8:
  int v12 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  id v13 = [(ICTextViewController *)self attributionSidebarView];
  double v14 = v13;
  if (v12)
  {
    [v13 visibleContentWidth];
    double v16 = v15;
    double v17 = [(ICTextViewController *)self textViewLeadingConstraint];
    [v17 setConstant:v16];
  }
  else
  {

    if (!v14) {
      return;
    }
  }
  double v18 = [(ICTextViewController *)self attributionSidebarView];
  [v18 fullContentWidth];
  double v20 = v19;
  long long v21 = [(ICTextViewController *)self attributionSidebarWidthConstraint];
  [v21 setConstant:v20];
}

- (id)captureContentOffsetStateIfNecessary
{
  double v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v4 = [v3 BOOLForKey:*MEMORY[0x263F5AEF0]];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [(ICTextViewController *)self textView];
    uint64_t v5 = +[ICTextViewScrollState scrollStateForTextView:v6];
  }

  return v5;
}

- (void)applyCapturedContentOffsetStateIfNecessary:(id)a3
{
  id v7 = a3;
  char v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v5 = [v4 BOOLForKey:*MEMORY[0x263F5AEF0]];

  if (+[ICExtensionSafeAPIShims applicationState] != 2
    && (v5 & 1) == 0)
  {
    id v6 = [(ICTextViewController *)self textView];
    [v7 applyToTextView:v6];
  }
}

+ (id)createTextViewUsingTextController:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4 note:(id)a5 containerWidth:(double)a6 forManualRendering:(BOOL)a7 scrollState:(id)a8 traitCollection:(id)a9
{
  BOOL v11 = a7;
  BOOL v14 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v47 = a9;
  double v18 = objc_alloc_init(ICLayoutManager);
  [(ICLayoutManager *)v18 setShouldManuallyRenderSeparateSubviews:v11];
  if (createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection__onceToken != -1) {
    dispatch_once(&createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection__onceToken, &__block_literal_global_27);
  }
  double v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v20 = [v19 BOOLForKey:@"UseNonContiguousLayout"];

  if (v20)
  {
    [(ICLayoutManager *)v18 setAllowsNonContiguousLayout:1];
    long long v21 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[ICTextViewController createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:](v21);
    }
  }
  objc_super v46 = v17;
  objc_msgSend(v15, "setNote:stylingTextUsingSeparateTextStorageForRendering:withLayoutManager:traitCollection:firstVisibleCharLocation:", v16, v14, v18, v47, objc_msgSend(v17, "topLeftTextCharacterIndex"));
  objc_super v22 = objc_msgSend(objc_alloc(MEMORY[0x263F5B4E0]), "initWithSize:", a6, 1.79769313e308);
  [v22 setWidthTracksTextView:1];
  [(ICLayoutManager *)v18 addTextContainer:v22];
  double v23 = -[ICTextView initWithFrame:textContainer:]([ICTextView alloc], "initWithFrame:textContainer:", v22, 0.0, 0.0, a6, 0.0);
  int v24 = ICInternalSettingsDefaultToPaperKitAttachments();
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __173__ICTextViewController_createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection___block_invoke_55;
  v48[3] = &unk_2640BB290;
  v48[4] = &v53;
  v48[5] = &v49;
  [v16 enumerateAttachmentsInOrderUsingBlock:v48];
  long long v25 = [v16 calculateDocumentController];
  [v25 updateAffectingChangeCounts:0];
  if ([v25 hasExpressions])
  {
    int v43 = v24;
    id v44 = v16;
    id v45 = v15;
    id v26 = objc_alloc(MEMORY[0x263F089B8]);
    double v27 = [(ICBaseTextView *)v23 TTTextStorage];
    double v28 = [v27 attributedString];
    uint64_t v29 = (void *)[v26 initWithAttributedString:v28];

    uint64_t v30 = objc_msgSend(v29, "ic_range");
    objc_msgSend(v25, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v29, v30, v31, 0, 1);
    v32 = [(ICBaseTextView *)v23 TTTextStorage];
    v33 = [(ICBaseTextView *)v23 TTTextStorage];
    uint64_t v34 = objc_msgSend(v33, "ic_range");
    uint64_t v36 = v35;
    v37 = (void *)[v29 copy];
    objc_msgSend(v32, "replaceCharactersInRange:withAttributedString:", v34, v36, v37);

    id v16 = v44;
    id v15 = v45;
    int v24 = v43;
  }
  if ([MEMORY[0x263F5B468] isEnabled]
    && (*((unsigned char *)v50 + 24) || (!*((unsigned char *)v54 + 24) ? (int v38 = v24) : (int v38 = 0), v38 == 1))
    && ([v16 isUnsupported] & 1) == 0)
  {
    [(ICTextView *)v23 setPaperEnabled:1];
    if (*((unsigned char *)v54 + 24))
    {
      char v41 = [v16 managedObjectContext];
      if (v41)
      {
        v42 = [[_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc] initWithNote:v16 managedObjectContext:v41 textView:v23];
        [(ICInlineDrawingUpgradeHelper *)v42 upgradeAllAttachmentsInNote];
      }
    }
  }
  else
  {
    [(ICTextView *)v23 setStylusDrawingEnabled:1];
  }
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    v39 = [(ICTextView *)v23 ic_pkTiledView];
    [v39 setOverrideUserInterfaceStyle:1];
  }
  -[ICTextView _setContentScrollInset:](v23, "_setContentScrollInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  [(ICBaseLayoutManager *)v18 setTextView:v23];

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v23;
}

void __173__ICTextViewController_createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection___block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v2 = @"UseNonContiguousLayout";
  v3[0] = MEMORY[0x263EFFA88];
  v1 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  [v0 registerDefaults:v1];
}

void __173__ICTextViewController_createTextViewUsingTextController_stylingTextUsingSeparateTextStorageForRendering_note_containerWidth_forManualRendering_scrollState_traitCollection___block_invoke_55(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 attachmentType] == 10)
  {
    double v3 = (unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    char v4 = v6;
LABEL_6:
    unsigned char *v3 = 1;
    goto LABEL_7;
  }
  BOOL v5 = [v6 attachmentType] == 13;
  char v4 = v6;
  if (v5)
  {
    double v3 = (unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    goto LABEL_6;
  }
LABEL_7:
}

+ (id)printFormatterForNote:(id)a3 withSize:(CGSize)a4 traitCollection:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  BOOL v8 = (objc_class *)MEMORY[0x263F5B4E8];
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  [v11 setDisableSingleLineA:1];
  uint64_t v12 = [v9 userInterfaceStyle];
  [v11 setOverrideAppearanceType:v12 == 2];
  [v11 setIsForPrint:1];
  id v13 = +[ICTextViewController createTextViewUsingTextController:v11 stylingTextUsingSeparateTextStorageForRendering:1 note:v10 containerWidth:1 forManualRendering:0 scrollState:v9 traitCollection:width];

  BOOL v14 = objc_msgSend(MEMORY[0x263F825C8], "ic_tintColorWithTraitCollection:", v9);
  [v13 setTintColor:v14];

  objc_opt_class();
  id v15 = [v13 textStorage];
  int v43 = ICDynamicCast();

  [v43 setStyler:v11];
  [v13 setOverrideUserInterfaceStyle:v12];
  id v16 = [MEMORY[0x263F825C8] preferredDefaultFontColor];
  id v17 = [v16 resolvedColorWithTraitCollection:v9];

  double v18 = [v13 textStorage];
  [v18 beginEditing];

  double v19 = [v13 textStorage];
  uint64_t v20 = *MEMORY[0x263F81500];
  long long v21 = [v13 textStorage];
  uint64_t v22 = objc_msgSend(v21, "ic_range");
  uint64_t v24 = v23;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __71__ICTextViewController_printFormatterForNote_withSize_traitCollection___block_invoke;
  v47[3] = &unk_2640B8C78;
  id v48 = v13;
  id v49 = v17;
  id v42 = v17;
  id v25 = v13;
  objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v20, v22, v24, 0, v47);

  objc_opt_class();
  id v26 = [v25 layoutManager];
  double v27 = ICDynamicCast();

  [v27 setIsRenderingImageForPrint:1];
  double v28 = [v25 textStorage];
  uint64_t v29 = *MEMORY[0x263F814A0];
  uint64_t v30 = [v25 textStorage];
  uint64_t v31 = objc_msgSend(v30, "ic_range");
  uint64_t v33 = v32;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __71__ICTextViewController_printFormatterForNote_withSize_traitCollection___block_invoke_2;
  v44[3] = &unk_2640BB858;
  id v45 = v27;
  uint64_t v46 = v12;
  id v34 = v27;
  objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v29, v31, v33, 0, v44);

  uint64_t v35 = [v25 textStorage];
  [v35 endEditing];

  objc_opt_class();
  uint64_t v36 = [v25 layoutManager];
  v37 = ICDynamicCast();
  [v37 setShouldAdjustTodoButtonFramesForPrinting:1];

  objc_opt_class();
  int v38 = [v25 layoutManager];
  v39 = ICDynamicCast();
  [v39 setOverrideTraitCollection:v9];

  objc_msgSend(v25, "setFrame:", 0.0, 0.0, width, height);
  v40 = [v25 viewPrintFormatter];
  objc_msgSend(v40, "setPerPageContentInsets:", 8.0, 8.0, 8.0, 8.0);
  [v11 setIsForPrint:0];

  return v40;
}

void __71__ICTextViewController_printFormatterForNote_withSize_traitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (void *)MEMORY[0x263F825C8];
  id v8 = a2;
  id v9 = [v7 preferredDefaultFontColor];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) textStorage];
    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x263F81500], *(void *)(a1 + 40), a3, a4);
  }
}

void __71__ICTextViewController_printFormatterForNote_withSize_traitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  char v4 = v6;
  if (v6)
  {
    BOOL v5 = [*(id *)(a1 + 32) viewForTextAttachment:v6];
    [v5 setOverrideUserInterfaceStyle:*(void *)(a1 + 40)];

    char v4 = v6;
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (void)setBackgroundColor:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    id v5 = 0;
  }
  else {
    id v5 = v9;
  }
  id v6 = [(ICTextViewController *)self textView];
  [v6 setBackgroundColor:v5];

  id v7 = [(ICTextViewController *)self backgroundView];
  [v7 setBackgroundColor:v9];

  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    id v8 = [(ICTextViewController *)self view];
    [v8 setBackgroundColor:v9];
  }
}

- (void)splitViewControllerWillBeginAnimatedTransitionToStateRequest:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v47 = v4;
  id v5 = [v4 object];
  id v48 = ICCheckedDynamicCast();

  id v6 = [(ICTextViewController *)self splitViewControllerDidEndAnimatedTransitionToStateRequestHandler];
  if (!v6)
  {
    id v7 = objc_msgSend(v48, "ic_viewControllerManager");
    id v8 = [(ICTextViewController *)self ic_viewControllerManager];

    if (v7 != v8) {
      goto LABEL_30;
    }
    objc_initWeak(&location, self);
    id v9 = [(ICTextViewController *)self layoutManager];
    int v10 = [(ICTextViewController *)self textView];
    [v10 setIsTransitioningToNewSize:1];
    id v11 = [(ICTextViewController *)self captureContentOffsetStateIfNecessary];
    [(ICTextViewController *)self setTransitionScrollState:v11];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke;
    v64[3] = &unk_2640BB880;
    id v44 = &v68;
    objc_copyWeak(&v68, &location);
    id v43 = v11;
    id v65 = v43;
    id v42 = v9;
    id v66 = v42;
    id v12 = v10;
    id v67 = v12;
    [(ICTextViewController *)self setSplitViewControllerDidEndAnimatedTransitionToStateRequestHandler:v64];
    objc_opt_class();
    id v13 = [v47 object];
    ICDynamicCast();
    id v46 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    BOOL v14 = [v47 userInfo];
    id v15 = [v14 objectForKeyedSubscript:@"ICSplitViewControllerPredictedDetailSizeUserInfo"];
    id v45 = ICDynamicCast();

    id v49 = [(ICTextViewController *)self viewControllerManager];
    id v16 = [v49 mainSplitViewController];
    if (v46 != v16
      || !-[ICTextViewController shouldAnimateTransitionForSplitViewController:](self, "shouldAnimateTransitionForSplitViewController:", v42, v43, &v68))
    {
      goto LABEL_28;
    }

    if (!v45)
    {
LABEL_29:

      objc_destroyWeak(v44);
      objc_destroyWeak(&location);
      goto LABEL_30;
    }
    [v45 CGSizeValue];
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    id v49 = [MEMORY[0x263EFF980] array];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v21 = [v12 superview];
    obuint64_t j = [v21 constraints];

    uint64_t v22 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (!v22) {
      goto LABEL_25;
    }
    uint64_t v51 = *(void *)v61;
LABEL_9:
    uint64_t v52 = v22;
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v61 != v51) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void **)(*((void *)&v60 + 1) + 8 * v23);
      id v25 = [v24 firstItem];
      if (v25 != v12)
      {
        id v26 = [v24 secondItem];
        id v3 = v12;
        if (v26 != v12) {
          goto LABEL_18;
        }
      }
      double v27 = [v24 firstItem];
      double v28 = [(ICTextViewController *)self attributionSidebarView];
      uint64_t v29 = v28;
      if (v27 != v28)
      {
        uint64_t v30 = [v24 secondItem];
        uint64_t v31 = [(ICTextViewController *)self attributionSidebarView];

        BOOL v32 = v30 == v31;
        if (v25 == v12)
        {
        }
        else
        {
        }
        if (!v32) {
          [v49 addObject:v24];
        }
        goto LABEL_23;
      }

      id v26 = v3;
      uint64_t v33 = v12;
      if (v25 != v12)
      {
LABEL_18:

        uint64_t v33 = v25;
        id v3 = v26;
      }

LABEL_23:
      if (v52 == ++v23)
      {
        uint64_t v22 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (!v22)
        {
LABEL_25:

          [(ICTextViewController *)self setTransitionConstraints:v49];
          [MEMORY[0x263F08938] deactivateConstraints:v49];
          [v12 setTranslatesAutoresizingMaskIntoConstraints:1];
          id v34 = [v47 userInfo];
          uint64_t v35 = [v34 objectForKeyedSubscript:@"ICSplitViewControllerPredictedDurationUserInfo"];
          uint64_t v36 = (void *)v35;
          v37 = &unk_26C1391C0;
          if (v35) {
            v37 = (void *)v35;
          }
          id v16 = v37;

          int v38 = (void *)MEMORY[0x263F82E00];
          [v16 floatValue];
          double v40 = v39;
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_74;
          v56[3] = &unk_2640B8A70;
          v56[4] = self;
          id v41 = v12;
          id v57 = v41;
          uint64_t v58 = v18;
          uint64_t v59 = v20;
          [v38 transitionWithView:v41 duration:5242880 options:v56 animations:0 completion:v40];
          [v41 setAlpha:0.0];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_2;
          block[3] = &unk_2640B82D8;
          block[4] = self;
          id v55 = v41;
          dispatch_async(MEMORY[0x263EF83A0], block);

LABEL_28:
          goto LABEL_29;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_30:
}

uint64_t __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained applyCapturedContentOffsetStateIfNecessary:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 setTransitionScrollState:0];

  id v5 = *(void **)(a1 + 40);
  [*(id *)(a1 + 48) bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [*(id *)(a1 + 48) textContainer];
  uint64_t v15 = objc_msgSend(v5, "glyphRangeForBoundingRect:inTextContainer:", v14, v7, v9, v11, v13);
  uint64_t v17 = v16;

  uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "characterRangeForGlyphRange:actualGlyphRange:", v15, v17, 0);
  uint64_t v20 = v19;
  objc_msgSend(*(id *)(a1 + 40), "invalidateLayoutForCharacterRange:actualCharacterRange:", v18, v19, 0);
  objc_msgSend(*(id *)(a1 + 40), "invalidateDisplayForCharacterRange:", v18, v20);
  objc_msgSend(*(id *)(a1 + 40), "ensureLayoutForCharacterRange:", v18, v20);
  long long v21 = *(void **)(a1 + 40);

  return [v21 updateVisibleSupplementalViews];
}

uint64_t __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_74(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attributionSidebarView];
  [v2 visibleContentWidth];
  CGFloat v4 = v3;

  v8.size.double width = *(CGFloat *)(a1 + 48);
  v8.size.double height = *(CGFloat *)(a1 + 56);
  v8.origin.y = 0.0;
  v8.origin.x = v4;
  CGRect v9 = CGRectIntegral(v8);
  id v5 = *(void **)(a1 + 40);

  return objc_msgSend(v5, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

void __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) splitViewControllerDidEndAnimatedTransitionToStateRequestHandler];

  if (v2)
  {
    double v3 = [*(id *)(a1 + 32) splitViewControllerDidEndAnimatedTransitionToStateRequestHandler];
    v3[2]();
  }
  CGFloat v4 = (void *)MEMORY[0x263F82E00];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_3;
  v5[3] = &unk_2640B8140;
  id v6 = *(id *)(a1 + 40);
  [v4 animateWithDuration:v5 animations:0.3];
}

uint64_t __85__ICTextViewController_splitViewControllerWillBeginAnimatedTransitionToStateRequest___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)splitViewControllerDidEndAnimatedTransitionToStateRequest:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Icmainsplitvie.isa);
  id v5 = [v4 object];

  ICCheckedDynamicCast();
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(ICTextViewController *)self viewControllerManager];
  id v7 = [v6 mainSplitViewController];

  CGRect v8 = v20;
  if (v7 == v20)
  {
    CGRect v9 = [(ICTextViewController *)self textView];
    [v9 setIsTransitioningToNewSize:0];
    double v10 = [(ICTextViewController *)self splitViewControllerDidEndAnimatedTransitionToStateRequestHandler];

    if (v10)
    {
      double v11 = [(ICTextViewController *)self splitViewControllerDidEndAnimatedTransitionToStateRequestHandler];
      v11[2]();

      [(ICTextViewController *)self setSplitViewControllerDidEndAnimatedTransitionToStateRequestHandler:0];
    }
    double v12 = [(ICTextViewController *)self transitionScrollState];
    [(ICTextViewController *)self applyCapturedContentOffsetStateIfNecessary:v12];

    [(ICTextViewController *)self setTransitionScrollState:0];
    uint64_t v13 = [v9 window];
    if (v13)
    {
      BOOL v14 = (void *)v13;
      int v15 = [v9 translatesAutoresizingMaskIntoConstraints];

      if (v15)
      {
        [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
        uint64_t v16 = [v9 superview];
        uint64_t v17 = [(ICTextViewController *)self transitionConstraints];
        [v16 addConstraints:v17];

        uint64_t v18 = (void *)MEMORY[0x263F08938];
        uint64_t v19 = [(ICTextViewController *)self transitionConstraints];
        [v18 activateConstraints:v19];

        [(ICTextViewController *)self setTransitionConstraints:0];
      }
    }

    CGRect v8 = v20;
  }
}

- (BOOL)shouldAnimateTransitionForSplitViewController:(id)a3
{
  return [a3 displayMode] != 3;
}

- (void)layoutManagerDidInvalidateLayout:(id)a3
{
  id v3 = [(ICTextViewController *)self layoutManager];
  [v3 clearLayoutEnsuredBounds];
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  id v6 = [(ICTextViewController *)self layoutManager];
  [v6 updateVisibleSupplementalViews];

  objc_opt_class();
  id v7 = [(ICTextViewController *)self textView];
  ICDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = objc_msgSend(v12, "ic_visibleRange");
  objc_msgSend(v12, "updateStyleLayersInRange:", v8, v9);
  double v10 = [MEMORY[0x263F08A00] defaultCenter];
  double v11 = [(ICTextViewController *)self textView];
  [v10 postNotificationName:@"ICTextViewLayoutDidChangeNotification" object:v11];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setTextView:(id)a3
{
}

- (ICTextController)textController
{
  return self->_textController;
}

- (void)setTextController:(id)a3
{
}

- (BOOL)performingInitialSetup
{
  return self->_performingInitialSetup;
}

- (void)setPerformingInitialSetup:(BOOL)a3
{
  self->_performingInitialSetup = a3;
}

- (ICAttributionSidebarView)attributionSidebarView
{
  return self->_attributionSidebarView;
}

- (void)setAttributionSidebarView:(id)a3
{
}

- (NSLayoutConstraint)textViewLeadingConstraint
{
  return self->_textViewLeadingConstraint;
}

- (ICViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (BOOL)ignoresTaps
{
  return self->_ignoresTaps;
}

- (ICTextBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (double)initialContainerWidth
{
  return self->_initialContainerWidth;
}

- (void)setInitialContainerWidth:(double)a3
{
  self->_initialContainerWidth = a3;
}

- (id)splitViewControllerDidEndAnimatedTransitionToStateRequestHandler
{
  return self->_splitViewControllerDidEndAnimatedTransitionToStateRequestHandler;
}

- (void)setSplitViewControllerDidEndAnimatedTransitionToStateRequestHandler:(id)a3
{
}

- (ICTextViewScrollState)transitionScrollState
{
  return self->_transitionScrollState;
}

- (void)setTransitionScrollState:(id)a3
{
}

- (ICTextViewScrollState)initialScrollState
{
  return self->_initialScrollState;
}

- (void)setInitialScrollState:(id)a3
{
}

- (NSArray)transitionConstraints
{
  return self->_transitionConstraints;
}

- (void)setTransitionConstraints:(id)a3
{
}

- (NSMutableSet)enabledSubviews
{
  return self->_enabledSubviews;
}

- (void)setEnabledSubviews:(id)a3
{
}

- (NSLayoutConstraint)attributionSidebarWidthConstraint
{
  return self->_attributionSidebarWidthConstraint;
}

- (void)setAttributionSidebarWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)attributionSidebarTrailingConstraint
{
  return self->_attributionSidebarTrailingConstraint;
}

- (NSDate)attributionSidebarOpenedDate
{
  return self->_attributionSidebarOpenedDate;
}

- (void)setAttributionSidebarOpenedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSidebarOpenedDate, 0);
  objc_storeStrong((id *)&self->_attributionSidebarTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_attributionSidebarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_enabledSubviews, 0);
  objc_storeStrong((id *)&self->_transitionConstraints, 0);
  objc_storeStrong((id *)&self->_initialScrollState, 0);
  objc_storeStrong((id *)&self->_transitionScrollState, 0);
  objc_storeStrong(&self->_splitViewControllerDidEndAnimatedTransitionToStateRequestHandler, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_attributionSidebarView, 0);
  objc_storeStrong((id *)&self->_textController, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

- (void)initWithViewControllerManager:(double)a3 editorViewController:note:initialContainerWidth:scrollState:.cold.1(void *a1, NSObject *a2, double a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [a1 note];
  id v6 = [v5 identifier];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2048;
  unint64_t v10 = (unint64_t)(a3 * 1000.0);
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "TextView for note %@ loaded in: %ld ms", (uint8_t *)&v7, 0x16u);
}

+ (void)createTextViewUsingTextController:(os_log_t)log stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "Using non-contiguous layout for text view", v1, 2u);
}

@end