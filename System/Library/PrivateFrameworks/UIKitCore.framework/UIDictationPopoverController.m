@interface UIDictationPopoverController
- (BOOL)canPresentTip;
- (CGRect)clipBounds;
- (CGRect)rectInWindow:(CGRect)a3;
- (CGRect)sourceRect;
- (UIDictationPopoverController)initWithContentView:(id)a3 contentSize:(CGSize)a4 inputDelegate:(id)a5;
- (int64_t)overrideUserInterfaceStyle;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)dealloc;
- (void)dismissTip;
- (void)forwardRemoteDictationPopover:(BOOL)a3;
- (void)keyboardDidChange:(id)a3;
- (void)movePopoverView:(CGRect)a3;
- (void)movePopoverView:(CGRect)a3 editMenuFrame:(id)a4;
- (void)movePopoverViewForEditMenuFrame:(CGRect)a3;
- (void)movePopoverViewToCurrentCareLocation;
- (void)presentTip:(id)a3 tipDescription:(id)a4;
- (void)setRemoteDictationPopover:(id)a3;
- (void)textDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UIDictationPopoverController

- (UIDictationPopoverController)initWithContentView:(id)a3 contentSize:(CGSize)a4 inputDelegate:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v49.receiver = self;
  v49.super_class = (Class)UIDictationPopoverController;
  v12 = [(UIKeyboardPopoverController *)&v49 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dictationView, a3);
    -[UIViewController setPreferredContentSize:](v13, "setPreferredContentSize:", width, height);
    objc_storeStrong((id *)&v13->_inputDelegate, a5);
    v14 = [v11 selectedTextRange];
    v15 = [v14 start];
    [v11 caretRectForPosition:v15];
    v13->_initCaretRectInView.origin.x = v16;
    v13->_initCaretRectInView.origin.y = v17;
    v13->_initCaretRectInView.size.double width = v18;
    v13->_initCaretRectInView.size.double height = v19;

    if (!+[UIKeyboard isKeyboardProcess])
    {
      v20 = [(UITextInput *)v13->_inputDelegate textInputView];
      v21 = [v20 keyboardSceneDelegate];
      v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v23 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      }
      v24 = v23;

      uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
      scrollViews = v13->_scrollViews;
      v13->_scrollViews = (NSMutableArray *)v25;

      uint64_t v27 = [v11 textInputView];
      if (v27)
      {
        v28 = (void *)v27;
        do
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v29 = v13->_scrollViews;
            id v30 = v28;
            [(NSMutableArray *)v29 addObject:v30];
            [v30 _addScrollViewScrollObserver:v13];
          }
          uint64_t v31 = [v28 superview];

          v28 = (void *)v31;
        }
        while (v31);
      }
      v32 = [v24 containerRootController];
      uint64_t v33 = [v32 bottomEdgeView];
      bottomEdgeView = v13->_bottomEdgeView;
      v13->_bottomEdgeView = (UIView *)v33;

      v35 = [v24 containerRootController];
      v36 = [v35 inputViewSet];

      -[UIView _addGeometryChangeObserver:](&v13->_bottomEdgeView->super.super.isa, v13);
      [(UIView *)v13->_bottomEdgeView frame];
      v13->_bottomMargin = CGRectGetMinY(v50);
      v37 = [v11 textInputView];
      v38 = [v36 inputAccessoryView];
      char v39 = [v37 isDescendantOfView:v38];

      if (v39)
      {
        uint64_t v40 = [v36 inputAccessoryView];
        inputAccessoryView = v13->_inputAccessoryView;
        v13->_inputAccessoryView = (UIView *)v40;
      }
      v42 = [v11 selectedTextRange];
      v43 = [v11 selectionRectsForRange:v42];
      v44 = [v43 firstObject];
      v13->_isVerticalText = [v44 isVertical];

      v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v45 addObserver:v13 selector:sel_keyboardDidChange_ name:@"UIKeyboardDidShowNotification" object:0];

      v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v46 addObserver:v13 selector:sel_keyboardDidChange_ name:@"UIKeyboardDidHideNotification" object:0];

      v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v47 addObserver:v13 selector:sel_textDidChange_ name:*(void *)off_1E52D2350 object:0];
    }
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!+[UIKeyboard isKeyboardProcess])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v3 = self->_scrollViews;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v7++) _removeScrollViewScrollObserver:self];
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v5);
    }

    scrollViews = self->_scrollViews;
    self->_scrollViews = 0;

    -[UIView _removeGeometryChangeObserver:](&self->_bottomEdgeView->super.super.isa, self);
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v17[0] = @"UIKeyboardDidShowNotification";
    v17[1] = @"UIKeyboardDidHideNotification";
    v17[2] = *(void *)off_1E52D2350;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    -[NSNotificationCenter _uiRemoveObserver:names:](v9, self, v10);
  }
  inputDelegate = self->_inputDelegate;
  self->_inputDelegate = 0;

  v12.receiver = self;
  v12.super_class = (Class)UIDictationPopoverController;
  [(UIViewController *)&v12 dealloc];
}

- (void)viewDidLoad
{
  v32[4] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)UIDictationPopoverController;
  [(UIKeyboardPopoverController *)&v31 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  uint64_t v4 = [(UIViewController *)self view];
  [v4 setBackgroundColor:v3];

  uint64_t v5 = [(UIViewController *)self view];
  [v5 addSubview:self->_dictationView];

  [(UIView *)self->_dictationView setNeedsLayout];
  uint64_t v6 = [(UIView *)self->_dictationView topAnchor];
  uint64_t v7 = [(UIViewController *)self view];
  v8 = [v7 safeAreaLayoutGuide];
  v9 = [v8 topAnchor];
  id v10 = [v6 constraintEqualToAnchor:v9];
  dictationViewTopConstraint = self->_dictationViewTopConstraint;
  self->_dictationViewTopConstraint = v10;

  objc_super v12 = [(UIView *)self->_dictationView bottomAnchor];
  long long v13 = [(UIViewController *)self view];
  long long v14 = [v13 safeAreaLayoutGuide];
  long long v15 = [v14 bottomAnchor];
  long long v16 = [v12 constraintEqualToAnchor:v15];
  dictationViewBottomConstraint = self->_dictationViewBottomConstraint;
  self->_dictationViewBottomConstraint = v16;

  v29 = (void *)MEMORY[0x1E4F5B268];
  CGFloat v18 = self->_dictationViewBottomConstraint;
  v32[0] = self->_dictationViewTopConstraint;
  v32[1] = v18;
  id v30 = [(UIView *)self->_dictationView leadingAnchor];
  uint64_t v19 = [(UIViewController *)self view];
  v20 = [v19 safeAreaLayoutGuide];
  v21 = [v20 leadingAnchor];
  v22 = [v30 constraintEqualToAnchor:v21];
  v32[2] = v22;
  id v23 = [(UIView *)self->_dictationView trailingAnchor];
  v24 = [(UIViewController *)self view];
  uint64_t v25 = [v24 safeAreaLayoutGuide];
  v26 = [v25 trailingAnchor];
  uint64_t v27 = [v23 constraintEqualToAnchor:v26];
  v32[3] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  [v29 activateConstraints:v28];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIDictationPopoverController;
  [(UIViewController *)&v12 viewDidAppear:a3];
  [(UIDictationPopoverController *)self forwardRemoteDictationPopover:1];
  -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", self->_initCaretRectInView.origin.x, self->_initCaretRectInView.origin.y, self->_initCaretRectInView.size.width, self->_initCaretRectInView.size.height);
  self->_sourceRect.origin.x = v4;
  self->_sourceRect.origin.y = v5;
  self->_sourceRect.size.double width = v6;
  self->_sourceRect.size.double height = v7;
  [(UIDictationPopoverController *)self clipBounds];
  self->_clipBounds.origin.x = v8;
  self->_clipBounds.origin.y = v9;
  self->_clipBounds.size.double width = v10;
  self->_clipBounds.size.double height = v11;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIDictationPopoverController;
  [(UIViewController *)&v4 viewDidDisappear:a3];
  [(UIDictationPopoverController *)self forwardRemoteDictationPopover:0];
}

- (void)forwardRemoteDictationPopover:(BOOL)a3
{
  BOOL v3 = a3;
  v23[4] = *MEMORY[0x1E4F143B8];
  p_popoverFrame = &self->_popoverFrame;
  CGFloat v6 = [(UIViewController *)self popoverPresentationController];
  CGFloat v7 = [v6 popoverView];
  [v7 frame];
  p_popoverFrame->origin.x = v8;
  p_popoverFrame->origin.y = v9;
  p_popoverFrame->size.double width = v10;
  p_popoverFrame->size.double height = v11;

  objc_super v12 = [(UIViewController *)self popoverPresentationController];
  self->_arrowDirection = [v12 arrowDirection];

  if (+[UIKeyboard isKeyboardProcess])
  {
    long long v13 = +[UIKeyboardImpl activeInstance];
    long long v14 = [v13 inputDelegateManager];
    long long v15 = [v14 inputSystemSourceSession];

    if (v15)
    {
      long long v16 = [v15 textOperations];
      [v16 setCustomInfoType:0x1ED14BAA0];
      v22[0] = @"selector";
      CGFloat v17 = NSStringFromSelector(sel_setRemoteDictationPopover_);
      v23[0] = v17;
      v22[1] = @"appear";
      CGFloat v18 = [NSNumber numberWithBool:v3];
      v23[1] = v18;
      v22[2] = @"arrowDirection";
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:self->_arrowDirection];
      v23[2] = v19;
      v22[3] = @"popoverFrame";
      v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", p_popoverFrame->origin.x, p_popoverFrame->origin.y, p_popoverFrame->size.width, p_popoverFrame->size.height);
      v23[3] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
      [v16 setCustomInfo:v21];

      [v15 flushOperations];
    }
  }
}

- (void)setRemoteDictationPopover:(id)a3
{
  p_popoverFrame = &self->_popoverFrame;
  id v5 = a3;
  CGFloat v6 = [v5 objectForKeyedSubscript:@"popoverFrame"];
  [v6 CGRectValue];
  p_popoverFrame->origin.x = v7;
  p_popoverFrame->origin.y = v8;
  p_popoverFrame->size.double width = v9;
  p_popoverFrame->size.double height = v10;

  CGFloat v11 = [v5 objectForKeyedSubscript:@"arrowDirection"];

  int v12 = [v11 intValue];
  if (self->_arrowDirection != v12)
  {
    self->_arrowDirection = v12;
    [(UIDictationPopoverController *)self clipBounds];
    self->_clipBounds.origin.x = v13;
    self->_clipBounds.origin.y = v14;
    self->_clipBounds.size.double width = v15;
    self->_clipBounds.size.double height = v16;
    -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", self->_initCaretRectInView.origin.x, self->_initCaretRectInView.origin.y, self->_initCaretRectInView.size.width, self->_initCaretRectInView.size.height);
    self->_sourceRect.origin.x = v17;
    self->_sourceRect.origin.y = v18;
    self->_sourceRect.size.double width = v19;
    self->_sourceRect.size.double height = v20;
  }
}

- (CGRect)clipBounds
{
  unint64_t arrowDirection = self->_arrowDirection;
  objc_super v4 = [(UITextInput *)self->_inputDelegate textInputView];
  id v5 = [v4 keyboardSceneDelegate];
  CGFloat v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  }
  CGFloat v8 = v7;

  CGFloat v9 = [v8 containerRootController];
  CGFloat v10 = [v9 view];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  CGFloat v19 = [v8 containerRootController];
  CGFloat v20 = [v19 view];
  [v20 safeAreaInsets];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double height = self->_popoverFrame.size.height;
  if (arrowDirection == 2) {
    double v30 = self->_popoverFrame.size.height;
  }
  else {
    double v30 = 0.0;
  }
  if (arrowDirection == 2) {
    double height = 0.0;
  }
  double v31 = v12 + v24;
  double v32 = v14 + v22;
  double v33 = v16 - (v24 + v28);
  double v34 = v31 + 0.0;
  double v35 = v32 + v30;
  double v36 = v18 - (v22 + v26) - (v30 + height);

  double v37 = v34;
  double v38 = v35;
  double v39 = v33;
  double v40 = v36;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (int64_t)overrideUserInterfaceStyle
{
  BOOL v3 = [(UIViewController *)self view];
  objc_super v4 = [v3 window];
  if (v4)
  {
    id v5 = [(UIViewController *)self view];
    CGFloat v6 = [v5 _inheritedRenderConfig];
    if ([v6 lightKeyboard]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = 2;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (void)textDidChange:(id)a3
{
  if (self->_arrowDirection == 1 && CGRectIsEmpty(self->_editMenuFrame))
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__UIDictationPopoverController_textDidChange___block_invoke;
    block[3] = &unk_1E52D9960;
    objc_copyWeak(&v5, &location);
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __46__UIDictationPopoverController_textDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(void **)(*(void *)(a1 + 32) + 984);
  BOOL v3 = [v2 selectedTextRange];
  objc_super v4 = [v3 start];
  [v2 caretRectForPosition:v4];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double MinX = CGRectGetMinX(*(CGRect *)(*(void *)(a1 + 32) + 1000));
  v27.origin.double x = v6;
  v27.origin.double y = v8;
  v27.size.double width = v10;
  v27.size.double height = v12;
  double MinY = CGRectGetMinY(v27);
  double v24 = MinX;
  objc_msgSend(*(id *)(a1 + 32), "rectInWindow:", MinX, MinY, v10, v12);
  double x = v28.origin.x;
  double y = v28.origin.y;
  double width = v28.size.width;
  double height = v28.size.height;
  if (!CGRectIsNull(v28))
  {
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    double MaxY = CGRectGetMaxY(v29);
    if (MaxY > CGRectGetMinY(*(CGRect *)(*(void *)(a1 + 32) + 1192)))
    {
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.double width = width;
      v30.size.double height = height;
      double v20 = CGRectGetMaxY(v30);
      CGFloat v21 = CGRectGetHeight(*(CGRect *)(*(void *)(a1 + 32) + 1192));
      uint64_t v22 = *(void *)(a1 + 32);
      if (v20 + v21 < *(double *)(v22 + 1224))
      {
        double v23 = (double *)(v22 + 1000);
        *double v23 = v24;
        v23[1] = MinY;
        v23[2] = v10;
        v23[3] = v12;
        objc_msgSend(WeakRetained, "movePopoverView:", x, y, width, height);
      }
    }
  }
}

- (void)keyboardDidChange:(id)a3
{
  objc_super v4 = [(UITextInput *)self->_inputDelegate textInputView];
  double v5 = [v4 keyboardSceneDelegate];
  CGFloat v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  }
  id v11 = v7;

  CGFloat v8 = [v11 containerRootController];
  double v9 = [v8 bottomEdgeView];

  [(UIView *)v9 frame];
  self->_bottomMargin = CGRectGetMinY(v13);
  bottomEdgeView = self->_bottomEdgeView;
  if (v9 != bottomEdgeView)
  {
    -[UIView _removeGeometryChangeObserver:](bottomEdgeView, self);
    objc_storeStrong((id *)&self->_bottomEdgeView, v9);
    -[UIView _addGeometryChangeObserver:](&self->_bottomEdgeView->super.super.isa, self);
  }
  [(UIDictationPopoverController *)self _observeScrollViewDidScroll:0];
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v6 = a4;
  if ((a3->var0 & 2) != 0)
  {
    id v16 = v6;
    [v6 frame];
    double Width = CGRectGetWidth(v18);
    CGFloat v8 = [v16 window];
    [v8 frame];
    double v9 = vabdd_f64(Width, CGRectGetWidth(v19));

    id v6 = v16;
    if (v9 < 1.0)
    {
      [v16 frame];
      self->_double bottomMargin = CGRectGetMinY(v20);
      double MaxY = CGRectGetMaxY(self->_popoverFrame);
      double bottomMargin = self->_bottomMargin;
      [(UIView *)self->_inputAccessoryView frame];
      if (MaxY > bottomMargin + v12)
      {
        double MinX = CGRectGetMinX(self->_sourceRect);
        -[UIDictationPopoverController movePopoverView:](self, "movePopoverView:", MinX, self->_bottomMargin - CGRectGetHeight(self->_sourceRect), v14, v15);
      }
      [(UIDictationPopoverController *)self _observeScrollViewDidScroll:0];
      id v6 = v16;
    }
  }
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_arrowDirection != 1)
  {
    id v37 = v4;
    IsEmptCGFloat y = CGRectIsEmpty(self->_editMenuFrame);
    double v5 = v37;
    if (IsEmpty)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      inputDelegate = self->_inputDelegate;
      if (isKindOfClass)
      {
        double v9 = inputDelegate;
      }
      else
      {
        double v9 = [(UITextInput *)inputDelegate textInputView];
      }
      double v10 = v9;
      if (v9)
      {
        do
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          [v10 size];
          double v12 = v11;
          [v10 contentSize];
          if (v12 < v13) {
            break;
          }
          uint64_t v14 = [v10 superview];

          double v10 = (void *)v14;
        }
        while (v14);
      }
      [v10 bounds];
      objc_msgSend(v10, "convertRect:toView:", 0);
      v47.origin.CGFloat x = v15;
      v47.origin.CGFloat y = v16;
      v47.size.CGFloat width = v17;
      v47.size.CGFloat height = v18;
      CGRect v39 = CGRectIntersection(self->_clipBounds, v47);
      CGFloat x = v39.origin.x;
      CGFloat y = v39.origin.y;
      CGFloat width = v39.size.width;
      CGFloat height = v39.size.height;
      -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", self->_initCaretRectInView.origin.x, self->_initCaretRectInView.origin.y, self->_initCaretRectInView.size.width, self->_initCaretRectInView.size.height);
      CGFloat v22 = v40.origin.x;
      CGFloat v23 = v40.origin.y;
      CGFloat v24 = v40.size.width;
      CGFloat v25 = v40.size.height;
      BOOL isVerticalText = self->_isVerticalText;
      double MinX = CGRectGetMinX(v40);
      if (isVerticalText)
      {
        v41.origin.CGFloat x = x;
        v41.origin.CGFloat y = y;
        v41.size.CGFloat width = width;
        v41.size.CGFloat height = height;
        double v28 = fmax(MinX, CGRectGetMinX(v41));
        v42.origin.CGFloat x = x;
        v42.origin.CGFloat y = y;
        v42.size.CGFloat width = width;
        v42.size.CGFloat height = height;
        double MinX = fmin(v28, CGRectGetMaxX(v42));
        v43.origin.CGFloat x = v22;
        v43.origin.CGFloat y = v23;
        v43.size.CGFloat width = v24;
        v43.size.CGFloat height = v25;
        double MinY = CGRectGetMinY(v43);
      }
      else
      {
        v44.origin.CGFloat x = v22;
        v44.origin.CGFloat y = v23;
        v44.size.CGFloat width = v24;
        v44.size.CGFloat height = v25;
        double v30 = CGRectGetMinY(v44);
        v45.origin.CGFloat x = x;
        v45.origin.CGFloat y = y;
        v45.size.CGFloat width = width;
        v45.size.CGFloat height = height;
        double v31 = fmax(v30, CGRectGetMinY(v45));
        v46.origin.CGFloat x = x;
        v46.origin.CGFloat y = y;
        v46.size.CGFloat width = width;
        v46.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v46);
        double bottomMargin = self->_bottomMargin;
        [(UIView *)self->_inputAccessoryView frame];
        double MinY = fmin(v31, fmin(MaxY, bottomMargin + v34));
      }
      if (MinX != self->_sourceRect.origin.x || MinY != self->_sourceRect.origin.y) {
        -[UIDictationPopoverController movePopoverView:](self, "movePopoverView:", MinX, MinY, self->_sourceRect.size.width, self->_sourceRect.size.height);
      }

      double v5 = v37;
    }
  }
}

- (void)movePopoverView:(CGRect)a3
{
}

- (void)movePopoverView:(CGRect)a3 editMenuFrame:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  self->_sourceRect.origin.double x = x;
  self->_sourceRect.origin.double y = y;
  self->_sourceRect.size.double width = width;
  self->_sourceRect.size.double height = height;
  if (+[UIKeyboard usesInputSystemUI])
  {
    double v10 = +[UIKeyboardImpl activeInstance];
    if (v9)
    {
      v21[0] = @"sourceRect";
      double v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", x, y, width, height);
      v21[1] = @"editMenuFrame";
      v22[0] = v11;
      v22[1] = v9;
      double v12 = (void *)MEMORY[0x1E4F1C9E8];
      double v13 = (void **)v22;
      uint64_t v14 = (__CFString **)v21;
      uint64_t v15 = 2;
    }
    else
    {
      CGRect v19 = @"sourceRect";
      double v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", x, y, width, height);
      CGRect v20 = v11;
      double v12 = (void *)MEMORY[0x1E4F1C9E8];
      double v13 = &v20;
      uint64_t v14 = &v19;
      uint64_t v15 = 1;
    }
    CGFloat v18 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
    objc_msgSend(v10, "forwardDictationEvent_movePopoverView:", v18);
  }
  else
  {
    CGFloat v16 = [(UIViewController *)self popoverPresentationController];
    [v16 _sendDelegateWillRepositionToRect];

    CGFloat v17 = [(UIViewController *)self popoverPresentationController];
    [(UIViewController *)self preferredContentSize];
    objc_msgSend(v17, "setPopoverContentSize:");

    [(UIDictationPopoverController *)self forwardRemoteDictationPopover:1];
  }
}

- (void)movePopoverViewToCurrentCareLocation
{
  p_initCaretRectInView = &self->_initCaretRectInView;
  inputDelegate = self->_inputDelegate;
  double v5 = [(UITextInput *)inputDelegate selectedTextRange];
  id v6 = [v5 start];
  [(UITextInput *)inputDelegate caretRectForPosition:v6];
  p_initCaretRectInView->origin.double x = v7;
  p_initCaretRectInView->origin.double y = v8;
  p_initCaretRectInView->size.double width = v9;
  p_initCaretRectInView->size.double height = v10;

  -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", p_initCaretRectInView->origin.x, p_initCaretRectInView->origin.y, p_initCaretRectInView->size.width, p_initCaretRectInView->size.height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", self->_editMenuFrame.origin.x, self->_editMenuFrame.origin.y, self->_editMenuFrame.size.width, self->_editMenuFrame.size.height);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDictationPopoverController movePopoverView:editMenuFrame:](self, "movePopoverView:editMenuFrame:", v19, v12, v14, v16, v18);
}

- (void)movePopoverViewForEditMenuFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v8 = [(UIViewController *)self popoverPresentationController];
  CGFloat v9 = [v8 popoverView];
  uint64_t v10 = [v9 arrowDirection];

  double v11 = [(UIViewController *)self view];
  double v12 = [v11 window];

  if (v12)
  {
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    if (CGRectIsEmpty(v37) || self->_needsRestoreArrowDirction) {
      goto LABEL_26;
    }
    p_popoverFrame = &self->_popoverFrame;
    p_editMenuFrame = &self->_editMenuFrame;
    double v15 = v10 == 1 ? -self->_editMenuFrame.size.height : self->_editMenuFrame.size.height;
    v38.origin.CGFloat x = p_popoverFrame->origin.x;
    v38.origin.CGFloat y = self->_popoverFrame.origin.y;
    v38.size.CGFloat width = self->_popoverFrame.size.width;
    v38.size.CGFloat height = self->_popoverFrame.size.height;
    CGRect v42 = CGRectOffset(v38, 0.0, v15);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    if (!CGRectIntersectsRect(v39, v42))
    {
LABEL_26:
      if (!CGRectIsEmpty(self->_editMenuFrame))
      {
        v40.origin.CGFloat x = x;
        v40.origin.CGFloat y = y;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        if (CGRectIsEmpty(v40))
        {
          if (self->_needsRestoreArrowDirction)
          {
            CGFloat v22 = [(UIViewController *)self popoverPresentationController];
            CGFloat v23 = [v22 popoverView];
            [v23 setArrowDirection:2];

            [(UIViewController *)self _updateContentOverlayInsetsFromParentIfNecessary];
            self->_needsRestoreArrowDirction = 0;
          }
          CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
          self->_editMenuFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
          self->_editMenuFrame.size = v24;
          -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", self->_initCaretRectInView.origin.x, self->_initCaretRectInView.origin.y, self->_initCaretRectInView.size.width, self->_initCaretRectInView.size.height);
          -[UIDictationPopoverController movePopoverView:](self, "movePopoverView:");
        }
      }
    }
    else
    {
      CGFloat v16 = x;
      CGFloat v17 = y;
      CGFloat v18 = width;
      CGFloat v19 = height;
      if (v10 == 1)
      {
        double MaxY = CGRectGetMaxY(*(CGRect *)&v16);
        double MinY = MaxY + CGRectGetHeight(self->_sourceRect);
      }
      else
      {
        double MinY = CGRectGetMinY(*(CGRect *)&v16);
      }
      double MinX = CGRectGetMinX(self->_sourceRect);
      double v26 = CGRectGetWidth(self->_sourceRect);
      double v27 = CGRectGetHeight(self->_sourceRect);
      v36.CGFloat x = MinX;
      v36.CGFloat y = MinY;
      if (CGRectContainsPoint(self->_clipBounds, v36))
      {
        -[UIDictationPopoverController movePopoverView:](self, "movePopoverView:", MinX, MinY, v26, v27);
      }
      else
      {
        double v28 = [(UIViewController *)self popoverPresentationController];
        CGRect v29 = [v28 popoverView];
        [v29 setArrowDirection:1];

        [(UIViewController *)self _updateContentOverlayInsetsFromParentIfNecessary];
        self->_needsRestoreArrowDirction = 1;
        v41.origin.CGFloat x = p_popoverFrame->origin.x;
        v41.origin.CGFloat y = self->_popoverFrame.origin.y;
        v41.size.CGFloat width = self->_popoverFrame.size.width;
        v41.size.CGFloat height = self->_popoverFrame.size.height;
        double v30 = CGRectGetMinX(v41);
        double v31 = CGRectGetMaxY(self->_sourceRect);
        double v32 = self->_popoverFrame.size.width;
        double v33 = self->_popoverFrame.size.height;
        double v34 = [(UIViewController *)self popoverPresentationController];
        objc_msgSend(v34, "setPopoverFrame:animated:", 1, v30, v31, v32, v33);
      }
      p_editMenuFrame->origin.CGFloat x = x;
      p_editMenuFrame->origin.CGFloat y = y;
      p_editMenuFrame->size.CGFloat width = width;
      p_editMenuFrame->size.CGFloat height = height;
    }
  }
  else
  {
    self->_editMenuFrame.origin.CGFloat x = x;
    self->_editMenuFrame.origin.CGFloat y = y;
    self->_editMenuFrame.size.CGFloat width = width;
    self->_editMenuFrame.size.CGFloat height = height;
  }
}

- (CGRect)rectInWindow:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v8 = [(UITextInput *)self->_inputDelegate textInputView];
  CGFloat v9 = [v8 keyboardSceneDelegate];
  if (v9)
  {
    uint64_t v10 = [(UITextInput *)self->_inputDelegate textInputView];
    double v11 = [v10 keyboardSceneDelegate];
    double v12 = [v11 containerWindow];
  }
  else
  {
    uint64_t v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v12 = [v10 containerWindow];
  }

  double v13 = [(UITextInput *)self->_inputDelegate textInputView];
  objc_msgSend(v12, "convertRect:fromView:", v13, x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  CGFloat v22 = [(UIViewController *)self view];
  CGFloat v23 = [v22 window];
  if (v23)
  {
    CGSize v24 = [(UIViewController *)self view];
    CGFloat v25 = [v24 window];
    objc_msgSend(v12, "convertRect:toView:", v25, v15, v17, v19, v21);
    double v15 = v26;
    double v17 = v27;
    double v19 = v28;
    double v21 = v29;
  }
  double v30 = v15;
  double v31 = v17;
  double v32 = v19;
  double v33 = v21;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)canPresentTip
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v4 = [v3 containerWindow];
  }
  else
  {
    BOOL v3 = [(UIViewController *)self popoverPresentationController];
    double v5 = [v3 popoverView];
    id v4 = [v5 superview];
  }
  p_popoverFrame = &self->_popoverFrame;
  if (self->_isVerticalText)
  {
    CGFloat x = p_popoverFrame->origin.x;
    CGFloat y = self->_popoverFrame.origin.y;
    CGFloat width = self->_popoverFrame.size.width;
    CGFloat height = self->_popoverFrame.size.height;
  }
  else
  {
    v21.origin.CGFloat x = p_popoverFrame->origin.x;
    v21.origin.CGFloat y = self->_popoverFrame.origin.y;
    v21.size.CGFloat width = self->_popoverFrame.size.width;
    v21.size.CGFloat height = self->_popoverFrame.size.height;
    CGRect v22 = CGRectOffset(v21, 0.0, self->_sourceRect.origin.y);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  double v11 = [(UIViewController *)self popoverPresentationController];
  double v12 = [v11 popoverView];
  uint64_t v13 = [v12 arrowDirection];

  if (v13 == 2)
  {
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGFloat v14 = CGRectGetMinY(v23) + -135.5;
    [v4 safeAreaInsets];
    BOOL v16 = v14 >= v15;
  }
  else
  {
    double v17 = [(UIViewController *)self popoverPresentationController];
    double v18 = [v17 popoverView];
    uint64_t v19 = [v18 arrowDirection];

    if (v19 == 1)
    {
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      BOOL v16 = CGRectGetMaxY(v24) + 135.5 < self->_bottomMargin;
    }
    else
    {
      BOOL v16 = 1;
    }
  }

  return v16;
}

- (void)presentTip:(id)a3 tipDescription:(id)a4
{
  v118[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!+[UIKeyboard usesInputSystemUI])
  {
    title = self->_title;
    if (title)
    {
LABEL_12:
      [(UILabel *)title setText:v6];
      [(UITextView *)self->_textView setText:v7];

      CGFloat v8 = [(UIViewController *)self popoverPresentationController];
      [(UIViewController *)self preferredContentSize];
      double v85 = v84;
      [(UIViewController *)self preferredContentSize];
      objc_msgSend(v8, "setPopoverContentSize:", v85, v86 + 135.5);
      goto LABEL_13;
    }
    id v106 = v7;
    id v107 = v6;
    v113 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = [UILabel alloc];
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v15 = -[UILabel initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    BOOL v16 = self->_title;
    self->_title = v15;

    double v17 = [off_1E52D39B8 boldSystemFontOfSize:15.0];
    [(UILabel *)self->_title setFont:v17];

    [(UILabel *)self->_title setTextAlignment:1];
    [(UIView *)self->_title setTranslatesAutoresizingMaskIntoConstraints:0];
    double v18 = [(UIViewController *)self view];
    [v18 insertSubview:self->_title below:self->_dictationView];

    v111 = [(UIView *)self->_title heightAnchor];
    v108 = [v111 constraintEqualToConstant:20.0];
    v118[0] = v108;
    v100 = [(UIView *)self->_title leadingAnchor];
    v105 = [(UIViewController *)self view];
    v96 = [v105 safeAreaLayoutGuide];
    uint64_t v19 = [v96 leadingAnchor];
    double v20 = [v100 constraintEqualToAnchor:v19];
    v118[1] = v20;
    CGRect v21 = [(UIView *)self->_title trailingAnchor];
    CGRect v22 = [(UIViewController *)self view];
    CGRect v23 = [v22 safeAreaLayoutGuide];
    CGRect v24 = [v23 trailingAnchor];
    CGFloat v25 = [v21 constraintEqualToAnchor:v24];
    v118[2] = v25;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:3];
    [v113 addObjectsFromArray:v26];

    double v27 = -[UITextView initWithFrame:textContainer:]([UITextView alloc], "initWithFrame:textContainer:", 0, v11, v12, v13, v14);
    textView = self->_textView;
    self->_textView = v27;

    [(UITextView *)self->_textView setEditable:0];
    [(UITextView *)self->_textView setSelectable:0];
    double v29 = [off_1E52D39B8 systemFontOfSize:14.0];
    [(UITextView *)self->_textView setFont:v29];

    double v30 = +[UIColor lightGrayColor];
    [(UITextView *)self->_textView setTextColor:v30];

    [(UITextView *)self->_textView setTextAlignment:1];
    [(UIView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v31 = [(UIViewController *)self view];
    [v31 insertSubview:self->_textView below:self->_dictationView];

    v109 = [(UIView *)self->_textView topAnchor];
    v101 = [(UIView *)self->_title bottomAnchor];
    v97 = [v109 constraintEqualToAnchor:v101];
    v117[0] = v97;
    v90 = [(UIView *)self->_textView leadingAnchor];
    v93 = [(UIViewController *)self view];
    double v32 = [v93 safeAreaLayoutGuide];
    double v33 = [v32 leadingAnchor];
    double v34 = [v90 constraintEqualToAnchor:v33 constant:8.0];
    v117[1] = v34;
    double v35 = [(UIView *)self->_textView trailingAnchor];
    CGPoint v36 = [(UIViewController *)self view];
    CGRect v37 = [v36 safeAreaLayoutGuide];
    CGRect v38 = [v37 trailingAnchor];
    CGRect v39 = [v35 constraintEqualToAnchor:v38 constant:-8.0];
    v117[2] = v39;
    CGRect v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:3];
    [v113 addObjectsFromArray:v40];

    CGRect v41 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v11, v12, v13, v14);
    CGRect v42 = +[UIColor lightGrayColor];
    [(UIView *)v41 setBackgroundColor:v42];

    [(UIView *)v41 setTranslatesAutoresizingMaskIntoConstraints:0];
    CGRect v43 = [(UIViewController *)self view];
    [v43 insertSubview:v41 below:self->_dictationView];

    v102 = [(UIView *)v41 heightAnchor];
    v98 = [v102 constraintEqualToConstant:0.5];
    v116[0] = v98;
    v91 = [(UIView *)v41 leadingAnchor];
    v94 = [(UIViewController *)self view];
    CGRect v44 = [v94 safeAreaLayoutGuide];
    CGRect v45 = [v44 leadingAnchor];
    CGRect v46 = [v91 constraintEqualToAnchor:v45];
    v116[1] = v46;
    v110 = v41;
    CGRect v47 = [(UIView *)v41 trailingAnchor];
    v48 = [(UIViewController *)self view];
    objc_super v49 = [v48 safeAreaLayoutGuide];
    CGRect v50 = [v49 trailingAnchor];
    v51 = [v47 constraintEqualToAnchor:v50];
    v116[2] = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:3];
    [v113 addObjectsFromArray:v52];

    v53 = [(UIViewController *)self view];
    v54 = [v53 backgroundColor];
    [(UIView *)self->_dictationView setBackgroundColor:v54];

    v55 = [(UIViewController *)self popoverPresentationController];
    v56 = [v55 popoverView];
    if ([v56 arrowDirection] == 2)
    {

      v57 = v110;
LABEL_10:
      [(NSLayoutConstraint *)self->_dictationViewTopConstraint setActive:0];
      v79 = [(UIView *)self->_dictationView topAnchor];
      v99 = [(UIView *)v57 bottomAnchor];
      v104 = v79;
      v95 = [v79 constraintEqualToAnchor:v99];
      v115[0] = v95;
      v80 = [(UIView *)self->_dictationView topAnchor];
      v92 = [(UIViewController *)self view];
      v89 = [v92 safeAreaLayoutGuide];
      uint64_t v81 = [v89 bottomAnchor];
      [(UIViewController *)self preferredContentSize];
      v112 = v80;
      v88 = (void *)v81;
      v87 = [v80 constraintEqualToAnchor:v81 constant:-v82];
      v115[1] = v87;
      v71 = [(UIView *)self->_textView bottomAnchor];
      v72 = [(UIView *)v57 bottomAnchor];
      v73 = [v71 constraintEqualToAnchor:v72];
      v115[2] = v73;
      v74 = [(UIView *)self->_title topAnchor];
      v75 = [(UIViewController *)self view];
      v76 = [v75 topAnchor];
      v77 = [v74 constraintEqualToAnchor:v76 constant:15.0];
      v115[3] = v77;
      v78 = v115;
      goto LABEL_11;
    }
    v58 = [(UIViewController *)self popoverPresentationController];
    v59 = [v58 popoverView];
    if ([v59 arrowDirection] == 1)
    {

      v57 = v110;
    }
    else
    {
      v103 = [(UIViewController *)self popoverPresentationController];
      v60 = [v103 popoverView];
      [v60 frame];
      CGFloat v61 = CGRectGetMinY(v119) + -135.5;
      v62 = [(UIViewController *)self popoverPresentationController];
      v63 = [v62 popoverView];
      v64 = [v63 superview];
      [v64 safeAreaInsets];
      double v66 = v65;

      v57 = v110;
      if (v61 >= v66) {
        goto LABEL_10;
      }
    }
    [(NSLayoutConstraint *)self->_dictationViewBottomConstraint setActive:0];
    v67 = [(UIView *)self->_dictationView bottomAnchor];
    v99 = [(UIView *)v57 topAnchor];
    v104 = v67;
    v95 = [v67 constraintEqualToAnchor:v99];
    v114[0] = v95;
    v68 = [(UIView *)self->_dictationView bottomAnchor];
    v92 = [(UIViewController *)self view];
    v89 = [v92 safeAreaLayoutGuide];
    uint64_t v69 = [v89 topAnchor];
    [(UIViewController *)self preferredContentSize];
    v112 = v68;
    v88 = (void *)v69;
    v87 = [v68 constraintEqualToAnchor:v69 constant:v70];
    v114[1] = v87;
    v71 = [(UIView *)self->_textView bottomAnchor];
    v72 = [(UIViewController *)self view];
    v73 = [v72 bottomAnchor];
    v74 = [v71 constraintEqualToAnchor:v73];
    v114[2] = v74;
    v75 = [(UIView *)self->_title topAnchor];
    v76 = [(UIView *)v57 bottomAnchor];
    v77 = [v75 constraintEqualToAnchor:v76 constant:15.0];
    v114[3] = v77;
    v78 = v114;
LABEL_11:
    v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:4];
    [v113 addObjectsFromArray:v83];

    [MEMORY[0x1E4F5B268] activateConstraints:v113];
    title = self->_title;
    id v7 = v106;
    id v6 = v107;
    goto LABEL_12;
  }
  CGFloat v8 = +[UIKeyboardImpl activeInstance];
  objc_msgSend(v8, "forwardDictationEvent_handleTip:title:", v6, v7);

LABEL_13:
}

- (void)dismissTip
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v3 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v3, "forwardDictationEvent_handleTip:title:", 0, 0);
  }
  else
  {
    id v3 = [(UIViewController *)self popoverPresentationController];
    [(UIViewController *)self preferredContentSize];
    objc_msgSend(v3, "setPopoverContentSize:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomEdgeView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dictationViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_dictationViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_dictationView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_scrollViews, 0);
  objc_storeStrong((id *)&self->_inputDelegate, 0);
}

@end