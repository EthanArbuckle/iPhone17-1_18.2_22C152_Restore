@interface SearchUIKeyboardableCollectionViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)canHighlightRowAtIndexPath:(id)a3;
- (BOOL)contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isOnCard;
- (BOOL)shouldHideTableCellsUnderKeyboard;
- (SearchUIKeyboardableCollectionViewController)init;
- (SearchUIKeyboardableTableViewDelegate)interactionDelegate;
- (UITextField)textField;
- (double)additionalKeyboardHeight;
- (double)adjustedVerticalOffset;
- (double)contentHeight;
- (double)currentKeyboardHeight;
- (id)indexPathForNextSelectableIndexPath:(id)a3 upward:(BOOL)a4;
- (id)indexPathToSelectForKeyboardOnQuickReturn;
- (void)addKeyCommandForKey:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)downArrowPressed:(id)a3;
- (void)escapeButtonPressed;
- (void)goBack;
- (void)highlightNextRowAtIndexPath:(id)a3 upward:(BOOL)a4;
- (void)highlightRowAtIndexPath:(id)a3;
- (void)keyboardFrameChanged:(id)a3;
- (void)leftArrowPressed;
- (void)moveCursorToBeginning;
- (void)moveCursorToEnd;
- (void)moveCursorToPosition:(id)a3;
- (void)returnKeyPressed;
- (void)rightArrowPressed;
- (void)scrollIndexPathToVisible:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)selectAllTextInTextField;
- (void)selectHighlightedRow;
- (void)setAdditionalKeyboardHeight:(double)a3;
- (void)setCollectionView:(id)a3;
- (void)setCurrentKeyboardHeight:(double)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setShouldHideTableCellsUnderKeyboard:(BOOL)a3;
- (void)setTextField:(id)a3;
- (void)showKeyboard;
- (void)upArrowPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation SearchUIKeyboardableCollectionViewController

- (double)currentKeyboardHeight
{
  return self->_currentKeyboardHeight;
}

- (void)setCurrentKeyboardHeight:(double)a3
{
  self->_currentKeyboardHeight = a3;
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  return (UITextField *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIKeyboardableCollectionViewController;
  id v4 = a3;
  [(SearchUIKeyboardableCollectionViewController *)&v7 setCollectionView:v4];
  v5 = objc_opt_new();
  objc_msgSend(v5, "setDelegate:", self, v7.receiver, v7.super_class);
  [v4 addGestureRecognizer:v5];
  v6 = [v4 panGestureRecognizer];

  [v6 requireGestureRecognizerToFail:v5];
}

- (SearchUIKeyboardableCollectionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIKeyboardableCollectionViewController;
  v2 = [(SearchUIKeyboardableCollectionViewController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_keyboardFrameChanged_ name:*MEMORY[0x1E4FB2C48] object:0];
  }
  return v2;
}

- (void)setAdditionalKeyboardHeight:(double)a3
{
  self->_additionalKeyboardHeight = a3;
}

- (void)setTextField:(id)a3
{
}

- (SearchUIKeyboardableTableViewDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  return (SearchUIKeyboardableTableViewDelegate *)WeakRetained;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(SearchUIKeyboardableCollectionViewController *)self adjustedVerticalOffset];
  double v6 = v5;
  int v7 = [v4 isTracking];

  if (v7)
  {
    if (v6 > 0.0
      && [(SearchUIKeyboardableCollectionViewController *)self contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField]&& !+[SearchUIUtilities isMinimizedHardwareKeyboardMode])
    {
      id v8 = [(SearchUIKeyboardableCollectionViewController *)self textField];
      [v8 resignFirstResponder];
    }
    else if (v6 < -50.0)
    {
      [(SearchUIKeyboardableCollectionViewController *)self showKeyboard];
    }
  }
}

- (double)adjustedVerticalOffset
{
  v2 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  [v2 contentOffset];
  double v4 = v3;
  [v2 adjustedContentInset];
  double v6 = v4 + v5;

  return v6;
}

- (void)keyboardFrameChanged:(id)a3
{
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v14 = [(SearchUIKeyboardableCollectionViewController *)self view];
  v15 = objc_msgSend(v14, "tlks_screen");
  [v15 bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  v28.origin.x = v17;
  v28.origin.y = v19;
  v28.size.width = v21;
  v28.size.height = v23;
  CGRect v27 = CGRectIntersection(v26, v28);
  double Height = CGRectGetHeight(v27);
  [(SearchUIKeyboardableCollectionViewController *)self setCurrentKeyboardHeight:Height];
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C48] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SearchUIKeyboardableCollectionViewController;
  [(SearchUIKeyboardableCollectionViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SearchUIKeyboardableCollectionViewController;
  [(SearchUIKeyboardableCollectionViewController *)&v2 viewDidLoad];
}

- (void)addKeyCommandForKey:(id)a3 action:(SEL)a4
{
  double v6 = (void *)MEMORY[0x1E4FB18D0];
  id v7 = a3;
  double v8 = [v6 keyCommandWithInput:v7 modifierFlags:0 action:a4];
  [(SearchUIKeyboardableCollectionViewController *)self addKeyCommand:v8];

  id v9 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v7 modifierFlags:0x100000 action:a4];

  [(SearchUIKeyboardableCollectionViewController *)self addKeyCommand:v9];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)isOnCard
{
  objc_super v2 = [(SearchUIKeyboardableCollectionViewController *)self navigationController];
  double v3 = [v2 viewControllers];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)escapeButtonPressed
{
  objc_super v2 = [(SearchUIKeyboardableCollectionViewController *)self navigationController];
  double v3 = [v2 topViewController];
  BOOL v4 = [v3 navigationItem];
  id v8 = [v4 rightBarButtonItem];

  double v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v6 = [v8 action];
  id v7 = [v8 target];
  [v5 sendAction:v6 to:v7 from:0 forEvent:0];
}

- (void)rightArrowPressed
{
  if ([MEMORY[0x1E4FAE100] isLTR])
  {
    [(SearchUIKeyboardableCollectionViewController *)self selectHighlightedRow];
  }
  else
  {
    [(SearchUIKeyboardableCollectionViewController *)self goBack];
  }
}

- (void)leftArrowPressed
{
  if ([MEMORY[0x1E4FAE100] isLTR])
  {
    [(SearchUIKeyboardableCollectionViewController *)self goBack];
  }
  else
  {
    [(SearchUIKeyboardableCollectionViewController *)self selectHighlightedRow];
  }
}

- (void)goBack
{
  id v3 = [(SearchUIKeyboardableCollectionViewController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (void)returnKeyPressed
{
  id v3 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  BOOL v4 = [v3 indexPathsForSelectedItems];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    uint64_t v6 = [(SearchUIKeyboardableCollectionViewController *)self indexPathToSelectForKeyboardOnQuickReturn];
    [(SearchUIKeyboardableCollectionViewController *)self highlightNextRowAtIndexPath:v6 upward:0];
  }
  [(SearchUIKeyboardableCollectionViewController *)self selectHighlightedRow];
}

- (id)indexPathToSelectForKeyboardOnQuickReturn
{
  return (id)[MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
}

- (void)highlightRowAtIndexPath:(id)a3
{
  id v5 = a3;
  if (v5 || [0 section] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
    [v4 selectItemAtIndexPath:v5 animated:0 scrollPosition:0];
  }
}

- (void)upArrowPressed:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 indexPathsForSelectedItems];
  id v17 = [v6 firstObject];

  int v7 = [v4 modifierFlags];
  uint64_t v8 = [v17 section];
  uint64_t v9 = [v17 row];
  if (v17)
  {
    if ([v17 row] < 1)
    {
      uint64_t v10 = [v17 section];
      uint64_t v11 = v10 - 1;
      if (v10 < 1)
      {
        CGFloat v13 = [(SearchUIKeyboardableCollectionViewController *)self textField];

        if (v13) {
          uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      else
      {
        if ((v7 & 0x100000) != 0)
        {
          uint64_t v9 = 0;
        }
        else
        {
          double v12 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
          uint64_t v9 = [v12 numberOfItemsInSection:v11] - 1;
        }
        uint64_t v8 = v11;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = [v17 row] - 1;
    }
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:v8];
  [(SearchUIKeyboardableCollectionViewController *)self highlightNextRowAtIndexPath:v14 upward:1];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = [(SearchUIKeyboardableCollectionViewController *)self textField];
    [v15 becomeFirstResponder];

    if ([v17 section] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(SearchUIKeyboardableCollectionViewController *)self moveCursorToBeginning];
    }
    else
    {
      double v16 = [(SearchUIKeyboardableCollectionViewController *)self textField];
      [v16 selectAll:0];
    }
  }
}

- (void)downArrowPressed:(id)a3
{
  id v4 = a3;
  [(SearchUIKeyboardableCollectionViewController *)self moveCursorToEnd];
  id v5 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 indexPathsForSelectedItems];
  id v20 = [v6 firstObject];

  int v7 = [v4 modifierFlags];
  uint64_t v8 = [v20 section];
  [v20 row];
  if (v20)
  {
    uint64_t v9 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
    uint64_t v10 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v20, "section"));
    uint64_t v11 = [v20 row] + 1;

    if (v10 <= v11)
    {
      uint64_t v12 = 0;
      uint64_t v8 = [v20 section] + 1;
    }
    else if ((v7 & 0x100000) != 0)
    {
      uint64_t v13 = [v20 section] + 1;
      v14 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
      uint64_t v15 = [v14 numberOfSections];

      if (v13 >= v15)
      {
        double v16 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
        uint64_t v12 = objc_msgSend(v16, "numberOfItemsInSection:", objc_msgSend(v20, "section")) - 1;
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v8 = v13;
      }
    }
    else
    {
      uint64_t v12 = [v20 row] + 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v12 = 0;
  }
  id v17 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  if (v8 < [v17 numberOfSections])
  {
    double v18 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
    uint64_t v19 = [v18 numberOfItemsInSection:v8];

    if (v12 >= v19) {
      goto LABEL_14;
    }
    id v17 = [MEMORY[0x1E4F28D58] indexPathForRow:v12 inSection:v8];
    [(SearchUIKeyboardableCollectionViewController *)self highlightNextRowAtIndexPath:v17 upward:0];
  }

LABEL_14:
}

- (void)highlightNextRowAtIndexPath:(id)a3 upward:(BOOL)a4
{
  id v5 = [(SearchUIKeyboardableCollectionViewController *)self indexPathForNextSelectableIndexPath:a3 upward:a4];
  if ([v5 section] != 0x7FFFFFFFFFFFFFFFLL) {
    [(SearchUIKeyboardableCollectionViewController *)self scrollIndexPathToVisible:v5];
  }
  [(SearchUIKeyboardableCollectionViewController *)self highlightRowAtIndexPath:v5];
}

- (id)indexPathForNextSelectableIndexPath:(id)a3 upward:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 row] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "section") == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v6;
    goto LABEL_4;
  }
  uint64_t v9 = [v6 section];
  uint64_t v10 = v9;
  if (v4)
  {
    if ((v9 & 0x8000000000000000) == 0)
    {
      while (1)
      {
        if (v10 == [v6 section])
        {
          uint64_t v11 = [v6 row];
          if ((v11 & 0x8000000000000000) == 0) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v12 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
          uint64_t v11 = [v12 numberOfItemsInSection:v10] - 1;

          if ((v11 & 0x8000000000000000) == 0)
          {
LABEL_13:
            do
            {
              id v7 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 inSection:v10];
              if ([(SearchUIKeyboardableCollectionViewController *)self canHighlightRowAtIndexPath:v7])
              {
                goto LABEL_4;
              }

              BOOL v13 = v11-- <= 0;
            }
            while (!v13);
          }
        }
        id v7 = 0;
        BOOL v13 = v10-- < 1;
        if (v13) {
          goto LABEL_4;
        }
      }
    }
LABEL_28:
    id v7 = 0;
    goto LABEL_4;
  }
  v14 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  uint64_t v15 = [v14 numberOfSections];

  if (v10 >= v15) {
    goto LABEL_28;
  }
  do
  {
    if (v10 == [v6 section]) {
      uint64_t v16 = [v6 row];
    }
    else {
      uint64_t v16 = 0;
    }
    while (1)
    {
      id v17 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
      uint64_t v18 = [v17 numberOfItemsInSection:v10];

      if (v16 >= v18) {
        break;
      }
      id v7 = [MEMORY[0x1E4F28D58] indexPathForRow:v16 inSection:v10];
      if ([(SearchUIKeyboardableCollectionViewController *)self canHighlightRowAtIndexPath:v7])
      {
        goto LABEL_4;
      }

      ++v16;
    }
    ++v10;
    uint64_t v19 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
    uint64_t v20 = [v19 numberOfSections];

    id v7 = 0;
  }
  while (v10 < v20);
LABEL_4:

  return v7;
}

- (void)selectHighlightedRow
{
  id v3 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  BOOL v4 = [v3 indexPathsForSelectedItems];
  id v6 = [v4 firstObject];

  if (v6)
  {
    [(SearchUIKeyboardableCollectionViewController *)self scrollIndexPathToVisible:v6];
    id v5 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
    [v5 selectItemAtIndexPath:v6 animated:0 scrollPosition:0];
  }
}

- (BOOL)canHighlightRowAtIndexPath:(id)a3
{
  return 1;
}

- (void)moveCursorToBeginning
{
  id v4 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  id v3 = [v4 beginningOfDocument];
  [(SearchUIKeyboardableCollectionViewController *)self moveCursorToPosition:v3];
}

- (void)moveCursorToEnd
{
  id v4 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  id v3 = [v4 endOfDocument];
  [(SearchUIKeyboardableCollectionViewController *)self moveCursorToPosition:v3];
}

- (void)moveCursorToPosition:(id)a3
{
  id v4 = a3;
  id v7 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  id v5 = [v7 textRangeFromPosition:v4 toPosition:v4];

  id v6 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  [v6 setSelectedTextRange:v5];
}

- (void)scrollIndexPathToVisible:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  [v5 scrollToItemAtIndexPath:v4 atScrollPosition:0 animated:0];

  id v6 = [(SearchUIKeyboardableCollectionViewController *)self interactionDelegate];
  [v6 didBeginScrolling];
}

- (double)contentHeight
{
  id v2 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  [v2 contentSize];
  double v4 = v3;

  return v4;
}

- (BOOL)contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField
{
  double v3 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  double v4 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  [v4 bounds];
  objc_msgSend(v3, "convertRect:toView:", 0);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  BOOL v13 = [(SearchUIKeyboardableCollectionViewController *)self view];
  v14 = [v13 window];
  uint64_t v15 = [v14 screen];
  [v15 bounds];
  double Height = CGRectGetHeight(v30);

  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  double MinY = CGRectGetMinY(v31);
  [(SearchUIKeyboardableCollectionViewController *)self additionalKeyboardHeight];
  if (v18 <= 0.0)
  {
    [(SearchUIKeyboardableCollectionViewController *)self currentKeyboardHeight];
    double v19 = v20;
  }
  else
  {
    double v19 = Height - MinY;
  }
  CGFloat v21 = [(SearchUIKeyboardableCollectionViewController *)self view];
  double v22 = [(SearchUIKeyboardableCollectionViewController *)self view];
  [v22 bounds];
  objc_msgSend(v21, "convertRect:toView:", 0);
  double v23 = CGRectGetMinY(v32);

  if (v19 == 0.0) {
    return 0;
  }
  [(SearchUIKeyboardableCollectionViewController *)self contentHeight];
  double v25 = v23 + v24;
  CGRect v26 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
  [v26 adjustedContentInset];
  BOOL v28 = v25 + v27 + 2.0 > Height - v19;

  return v28;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v21 = a3;
  double v4 = [(SearchUIKeyboardableCollectionViewController *)self interactionDelegate];

  if (v4)
  {
    double v5 = [(SearchUIKeyboardableCollectionViewController *)self interactionDelegate];
    [v5 didBeginScrolling];

    CGFloat v6 = [(SearchUIKeyboardableCollectionViewController *)self interactionDelegate];
    int v7 = [v6 shouldMonitorScrollingPastBottomOfContent];

    if (v7)
    {
      CGFloat v8 = [(SearchUIKeyboardableCollectionViewController *)self collectionView];
      [v8 contentOffset];
      double v10 = v9;
      [v8 contentSize];
      double v12 = v11;
      [v8 bounds];
      double Height = CGRectGetHeight(v23);
      [v8 adjustedContentInset];
      double v15 = v14;
      uint64_t v16 = [v8 panGestureRecognizer];
      id v17 = [v21 window];
      [v16 velocityInView:v17];
      if (v18 < 0.0)
      {
        if ([(SearchUIKeyboardableCollectionViewController *)self contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField])
        {
          if (v10 < v12 - Height + v15) {
            goto LABEL_6;
          }
          [(SearchUIKeyboardableCollectionViewController *)self currentKeyboardHeight];
          double v20 = v19;

          if (v20 != 0.0)
          {
LABEL_11:

            goto LABEL_12;
          }
        }
        else
        {
        }
        [v21 setScrollEnabled:0];
        [v21 setScrollEnabled:1];
        uint64_t v16 = [(SearchUIKeyboardableCollectionViewController *)self interactionDelegate];
        [v16 didScrollPastBottomOfContent];
        goto LABEL_10;
      }
LABEL_6:

LABEL_10:
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (a4.y > 0.0
    && ![(SearchUIKeyboardableCollectionViewController *)self shouldHideTableCellsUnderKeyboard]&& [(SearchUIKeyboardableCollectionViewController *)self contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField]&& !+[SearchUIUtilities isMinimizedHardwareKeyboardMode])
  {
    id v6 = [(SearchUIKeyboardableCollectionViewController *)self textField];
    [v6 resignFirstResponder];
  }
}

- (void)showKeyboard
{
  double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  char v4 = [v3 isRunningTest];

  if ((v4 & 1) == 0
    && [(SearchUIKeyboardableCollectionViewController *)self _appearState] - 1 <= 1)
  {
    double v5 = [(SearchUIKeyboardableCollectionViewController *)self textField];
    int v6 = [v5 isFirstResponder];

    if (v6)
    {
      [(SearchUIKeyboardableCollectionViewController *)self selectAllTextInTextField];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__SearchUIKeyboardableCollectionViewController_showKeyboard__block_invoke;
      block[3] = &unk_1E6E72730;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __60__SearchUIKeyboardableCollectionViewController_showKeyboard__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textField];
  int v3 = [v2 becomeFirstResponder];

  if (v3)
  {
    char v4 = *(void **)(a1 + 32);
    [v4 selectAllTextInTextField];
  }
}

- (void)selectAllTextInTextField
{
  int v3 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  char v4 = [v3 selectedTextRange];
  if (([v4 isEmpty] & 1) == 0)
  {
    double v5 = [(SearchUIKeyboardableCollectionViewController *)self textField];
    int v6 = [v5 selectedTextRange];
    int v7 = [v6 start];
    CGFloat v8 = [(SearchUIKeyboardableCollectionViewController *)self textField];
    double v9 = [v8 beginningOfDocument];
    if ([v7 isEqual:v9])
    {
      double v15 = [(SearchUIKeyboardableCollectionViewController *)self textField];
      double v10 = [v15 selectedTextRange];
      [v10 end];
      double v11 = v17 = v5;
      double v12 = [(SearchUIKeyboardableCollectionViewController *)self textField];
      [v12 endOfDocument];
      BOOL v13 = v14 = v6;
      char v16 = [v11 isEqual:v13];

      if (v16) {
        return;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  id v18 = [(SearchUIKeyboardableCollectionViewController *)self textField];
  [v18 selectAll:0];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 0;
}

- (double)additionalKeyboardHeight
{
  return self->_additionalKeyboardHeight;
}

- (BOOL)shouldHideTableCellsUnderKeyboard
{
  return self->_shouldHideTableCellsUnderKeyboard;
}

- (void)setShouldHideTableCellsUnderKeyboard:(BOOL)a3
{
  self->_shouldHideTableCellsUnderKeyboard = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_destroyWeak((id *)&self->_textField);
}

@end