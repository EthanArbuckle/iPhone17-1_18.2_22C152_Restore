@interface UIMultiscriptCandidateViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hidesExpandableButton;
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (BOOL)requiresKeyboard;
- (BOOL)updatingCandidates;
- (NSArray)displayedCandidates;
- (TIAutocorrectionList)cachedCandidates;
- (UIMultiscriptCandidateView)candidateView;
- (UIMultiscriptCandidateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIPredictiveViewController)currentViewController;
- (double)preferredHeightForTraitCollection:(id)a3;
- (id)alternativeCandidateAction;
- (id)alternativeCandidates;
- (id)predictionView;
- (int64_t)overrideUserInterfaceStyle;
- (void)autocorrectionListDidChange;
- (void)dealloc;
- (void)loadView;
- (void)reloadArrangedSubviews;
- (void)setCachedCandidates:(id)a3;
- (void)setCandidateView:(id)a3;
- (void)setCurrentViewController:(id)a3;
- (void)setUpdatingCandidates:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIMultiscriptCandidateViewController

- (UIMultiscriptCandidateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIMultiscriptCandidateViewController;
  v4 = [(UIViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[UIPredictionViewController alloc] initWithNibName:0 bundle:0];
    [(UIMultiscriptCandidateViewController *)v4 setCurrentViewController:v5];
  }
  return v4;
}

- (id)predictionView
{
  v2 = [(UIMultiscriptCandidateViewController *)self currentViewController];
  v3 = [v2 view];

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(UIMultiscriptCandidateViewController *)self currentViewController];
  char v9 = [v8 isVisibleForInputDelegate:v7 inputViews:v6];

  return v9;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [(UIMultiscriptCandidateViewController *)self currentViewController];
  [v5 preferredHeightForTraitCollection:v4];
  double v7 = v6;

  return v7;
}

- (BOOL)hidesExpandableButton
{
  v2 = [(UIMultiscriptCandidateViewController *)self currentViewController];
  char v3 = [v2 hidesExpandableButton];

  return v3;
}

- (NSArray)displayedCandidates
{
  v2 = [(UIMultiscriptCandidateViewController *)self currentViewController];
  char v3 = [v2 displayedCandidates];

  return (NSArray *)v3;
}

- (BOOL)requiresKeyboard
{
  v2 = [(UIMultiscriptCandidateViewController *)self currentViewController];
  char v3 = [v2 requiresKeyboard];

  return v3;
}

- (void)loadView
{
  char v3 = objc_alloc_init(UIMultiscriptCandidateView);
  [(UIMultiscriptCandidateViewController *)self setCandidateView:v3];
  [(UIViewController *)self setView:v3];

  id v4 = [(UIMultiscriptCandidateViewController *)self alternativeCandidateAction];
  v5 = [(UIMultiscriptCandidateViewController *)self candidateView];
  [v5 setAlternativeCandidateAction:v4];

  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_reloadArrangedSubviews name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];

  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_reloadArrangedSubviews name:@"UIKeyboardLayoutDidChangedNotification" object:0];

  [(UIMultiscriptCandidateViewController *)self reloadArrangedSubviews];
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"UIKeyboardLayoutDidChangedNotification" object:0];

  v5 = +[UIKeyboardImpl activeInstance];
  double v6 = [v5 autocorrectionController];
  [v6 removeAutocorrectionObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)UIMultiscriptCandidateViewController;
  [(UIViewController *)&v7 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIMultiscriptCandidateViewController;
  [(UIViewController *)&v4 viewWillAppear:a3];
  [(UIMultiscriptCandidateViewController *)self reloadArrangedSubviews];
}

- (id)alternativeCandidates
{
  v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 autocorrectionController];
  objc_super v4 = [v3 autocorrectionList];

  v5 = [v4 corrections];
  double v6 = [v5 autocorrection];

  if (!v6) {
    goto LABEL_6;
  }
  objc_super v7 = [v4 predictions];
  v8 = (char *)[v7 count];

  if (!v8) {
    goto LABEL_7;
  }
  char v9 = [v4 emojiList];
  unint64_t v10 = [v9 count] == 0;

  BOOL v11 = (unint64_t)v8 > v10;
  v12 = &v8[-v10];
  if (v11)
  {
    v13 = (void *)MEMORY[0x1E4FAE278];
    v14 = [v4 predictions];
    v15 = objc_msgSend(v14, "subarrayWithRange:", v10, v12);
    v8 = [v13 listWithCorrections:0 predictions:v15];
  }
  else
  {
LABEL_6:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (id)alternativeCandidateAction
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__UIMultiscriptCandidateViewController_alternativeCandidateAction__block_invoke;
  v4[3] = &unk_1E52DB038;
  v4[4] = self;
  v2 = +[UIAction actionWithHandler:v4];
  return v2;
}

void __66__UIMultiscriptCandidateViewController_alternativeCandidateAction__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachedCandidates];

  if (v2)
  {
    [*(id *)(a1 + 32) setUpdatingCandidates:1];
    id v9 = [*(id *)(a1 + 32) cachedCandidates];
    [*(id *)(a1 + 32) setCachedCandidates:0];
  }
  else
  {
    char v3 = +[UIKeyboardImpl activeInstance];
    objc_super v4 = [v3 autocorrectionController];
    v5 = [v4 autocorrectionList];
    [*(id *)(a1 + 32) setCachedCandidates:v5];

    double v6 = [*(id *)(a1 + 32) alternativeCandidates];
    if (!v6) {
      goto LABEL_6;
    }
    id v9 = v6;
    [*(id *)(a1 + 32) setUpdatingCandidates:1];
  }
  objc_super v7 = +[UIKeyboardImpl activeInstance];
  v8 = [v7 autocorrectionController];
  [v8 setAutocorrectionList:v9];

  [*(id *)(a1 + 32) setUpdatingCandidates:0];
  double v6 = v9;
LABEL_6:
}

- (void)autocorrectionListDidChange
{
  if (![(UIMultiscriptCandidateViewController *)self updatingCandidates]) {
    [(UIMultiscriptCandidateViewController *)self setCachedCandidates:0];
  }
  char v3 = [(UIMultiscriptCandidateViewController *)self cachedCandidates];

  if (v3)
  {
    id v8 = [(UIMultiscriptCandidateViewController *)self candidateView];
    objc_super v4 = [v8 alternativeCandidatesButton];
    v5 = v4;
    uint64_t v6 = 1;
  }
  else
  {
    objc_super v7 = [(UIMultiscriptCandidateViewController *)self alternativeCandidates];

    id v8 = [(UIMultiscriptCandidateViewController *)self candidateView];
    objc_super v4 = [v8 alternativeCandidatesButton];
    v5 = v4;
    if (v7) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  [v4 setButtonState:v6];
}

- (void)reloadArrangedSubviews
{
  char v3 = [(UIMultiscriptCandidateViewController *)self currentViewController];
  objc_super v4 = [v3 view];
  v5 = [v4 superview];
  uint64_t v6 = [(UIMultiscriptCandidateViewController *)self candidateView];

  if (v5 == v6)
  {
    BOOL v11 = [(UIMultiscriptCandidateViewController *)self candidateView];
    v12 = [(UIMultiscriptCandidateViewController *)self currentViewController];
    v13 = [v12 view];
    [v11 reloadArrangedSubviews:v13];
  }
  else
  {
    objc_super v7 = [(UIMultiscriptCandidateViewController *)self currentViewController];
    [(UIViewController *)self addChildViewController:v7];

    id v8 = [(UIMultiscriptCandidateViewController *)self candidateView];
    id v9 = [(UIMultiscriptCandidateViewController *)self currentViewController];
    unint64_t v10 = [v9 view];
    [v8 reloadArrangedSubviews:v10];

    BOOL v11 = [(UIMultiscriptCandidateViewController *)self currentViewController];
    [v11 didMoveToParentViewController:self];
  }

  v14 = [(UIMultiscriptCandidateViewController *)self candidateView];
  int v15 = [v14 requiresAlternativeCandidatesButton];

  if (v15)
  {
    id v17 = +[UIKeyboardImpl activeInstance];
    v16 = [v17 autocorrectionController];
    [v16 addAutocorrectionObserver:self];
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  v2 = [(UIMultiscriptCandidateViewController *)self currentViewController];
  int64_t v3 = [v2 overrideUserInterfaceStyle];

  return v3;
}

- (UIPredictiveViewController)currentViewController
{
  return self->_currentViewController;
}

- (void)setCurrentViewController:(id)a3
{
}

- (UIMultiscriptCandidateView)candidateView
{
  return self->_candidateView;
}

- (void)setCandidateView:(id)a3
{
}

- (TIAutocorrectionList)cachedCandidates
{
  return self->_cachedCandidates;
}

- (void)setCachedCandidates:(id)a3
{
}

- (BOOL)updatingCandidates
{
  return self->_updatingCandidates;
}

- (void)setUpdatingCandidates:(BOOL)a3
{
  self->_updatingCandidates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCandidates, 0);
  objc_storeStrong((id *)&self->_candidateView, 0);
  objc_storeStrong((id *)&self->_currentViewController, 0);
}

@end