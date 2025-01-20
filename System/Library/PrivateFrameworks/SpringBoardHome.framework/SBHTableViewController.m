@interface SBHTableViewController
+ (Class)tableViewClass;
- (BOOL)showNoResultsView;
- (CGRect)keyboardFrame;
- (double)headerTopOccludingInset;
- (void)_keyboardWillDismiss:(id)a3;
- (void)_keyboardWillResize:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_reloadNoResultsViewForKeyboardNotification:(id)a3;
- (void)setShowNoResultsView:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBHTableViewController

+ (Class)tableViewClass
{
  return 0;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)SBHTableViewController;
  [(SBHTableViewController *)&v9 viewDidLoad];
  uint64_t v3 = [(id)objc_opt_class() tableViewClass];
  if (v3)
  {
    v4 = (objc_class *)v3;
    v5 = [(SBHTableViewController *)self tableView];
    id v6 = [v4 alloc];
    v7 = [(SBHTableViewController *)self view];
    [v7 frame];
    v8 = objc_msgSend(v6, "initWithFrame:");

    objc_msgSend(v8, "setAutoresizingMask:", objc_msgSend(v5, "autoresizingMask"));
    [(SBHTableViewController *)self setTableView:v8];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHTableViewController;
  [(SBHTableViewController *)&v5 viewWillAppear:a3];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v4 addObserver:self selector:sel__keyboardWillDismiss_ name:*MEMORY[0x1E4FB2C50] object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHTableViewController;
  [(SBHTableViewController *)&v5 viewWillDisappear:a3];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C48] object:0];
}

- (CGRect)keyboardFrame
{
  uint64_t v3 = [(SBHTableViewController *)self view];
  objc_msgSend(v3, "convertRect:fromView:", 0, self->_rawKeyboardFrame.origin.x, self->_rawKeyboardFrame.origin.y, self->_rawKeyboardFrame.size.width, self->_rawKeyboardFrame.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setShowNoResultsView:(BOOL)a3
{
  if (self->_showNoResultsView != a3)
  {
    BOOL v3 = a3;
    self->_showNoResultsView = a3;
    double v5 = [(SBHTableViewController *)self tableView];
    id v6 = v5;
    if (v3)
    {
      self->_styleBeforeShowingNoResults = [v5 separatorStyle];
      [v6 setSeparatorStyle:0];
    }
    else
    {
      [v5 setSeparatorStyle:self->_styleBeforeShowingNoResults];
      self->_styleBeforeShowingNoResults = 0;
    }
  }
}

- (double)headerTopOccludingInset
{
  v2 = [(SBHTableViewController *)self tableView];
  [v2 adjustedContentInset];
  double v4 = v3;

  return v4;
}

- (void)_keyboardWillShow:(id)a3
{
  id v10 = [a3 userInfo];
  double v4 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  self->_rawKeyboardFrame.origin.x = v5;
  self->_rawKeyboardFrame.origin.y = v6;
  self->_rawKeyboardFrame.size.width = v7;
  self->_rawKeyboardFrame.size.height = v8;

  [(SBHTableViewController *)self _reloadNoResultsViewForKeyboardNotification:v10];
  double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__keyboardWillResize_ name:*MEMORY[0x1E4FB2C48] object:0];
}

- (void)_keyboardWillDismiss:(id)a3
{
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_rawKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_rawKeyboardFrame.size = v4;
  CGFloat v5 = [a3 userInfo];
  [(SBHTableViewController *)self _reloadNoResultsViewForKeyboardNotification:v5];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4FB2C48] object:0];
}

- (void)_keyboardWillResize:(id)a3
{
  id v9 = [a3 userInfo];
  CGSize v4 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  self->_rawKeyboardFrame.origin.x = v5;
  self->_rawKeyboardFrame.origin.y = v6;
  self->_rawKeyboardFrame.size.width = v7;
  self->_rawKeyboardFrame.size.height = v8;

  [(SBHTableViewController *)self _reloadNoResultsViewForKeyboardNotification:v9];
}

- (void)_reloadNoResultsViewForKeyboardNotification:(id)a3
{
  if (self->_showNoResultsView)
  {
    uint64_t v4 = *MEMORY[0x1E4FB2BA8];
    id v5 = a3;
    CGFloat v6 = [v5 objectForKeyedSubscript:v4];
    [v6 doubleValue];
    double v8 = v7;

    id v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB2BA0]];

    uint64_t v10 = [v9 integerValue];
    double v11 = [(SBHTableViewController *)self view];
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v13 = (v10 << 16) | 4;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__SBHTableViewController__reloadNoResultsViewForKeyboardNotification___block_invoke;
    v15[3] = &unk_1E6AAC810;
    id v16 = v11;
    id v14 = v11;
    [v12 animateWithDuration:v13 delay:v15 options:0 animations:v8 completion:0.0];
  }
}

uint64_t __70__SBHTableViewController__reloadNoResultsViewForKeyboardNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)showNoResultsView
{
  return self->_showNoResultsView;
}

@end