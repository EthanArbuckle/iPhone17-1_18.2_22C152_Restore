@interface SBUIActionPlatterViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)reversesActions;
- (NSArray)actions;
- (SBUIActionPlatterViewController)initWithActions:(id)a3 gestureRecognizer:(id)a4;
- (SBUIActionPlatterViewController)initWithCoder:(id)a3;
- (SBUIActionPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBUIActionPlatterViewControllerDelegate)delegate;
- (UILongPressGestureRecognizer)gestureRecognizer;
- (int64_t)imagePosition;
- (unint64_t)systemInteractionStartIndex;
- (void)_handleLongPressGestureRecognizer:(id)a3;
- (void)_updateKeylineViews;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setImagePosition:(int64_t)a3;
- (void)setReversesActions:(BOOL)a3;
- (void)setSystemInteractionStartIndex:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBUIActionPlatterViewController

- (SBUIActionPlatterViewController)initWithActions:(id)a3 gestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUIActionPlatterViewController;
  v8 = [(SBUIActionPlatterViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    actions = v8->_actions;
    v8->_actions = (NSArray *)v9;

    objc_storeWeak((id *)&v8->_gestureRecognizer, v7);
    v8->_reversesActions = 0;
    v8->_imagePosition = 0;
    v8->_systemInteractionStartIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (SBUIActionPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF488];
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v5 raise:v6, @"%s is not a valid initializer. You must call -[%@ initWithActions:gestureRecognizer:].", "-[SBUIActionPlatterViewController initWithNibName:bundle:]", v8 format];

  return [(SBUIActionPlatterViewController *)self initWithActions:0 gestureRecognizer:0];
}

- (SBUIActionPlatterViewController)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  id v6 = a3;
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v4 raise:v5, @"%@ does not support unarchiving from a nib.", v8 format];

  v11.receiver = self;
  v11.super_class = (Class)SBUIActionPlatterViewController;
  uint64_t v9 = [(SBUIActionPlatterViewController *)&v11 initWithCoder:v6];

  return v9;
}

- (void)loadView
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0x263F1C000uLL;
  id v4 = objc_alloc(MEMORY[0x263F1CB60]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  id v10 = [(SBUIActionPlatterViewController *)self actions];
  if ([v10 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([(SBUIActionPlatterViewController *)self reversesActions])
    {
      objc_super v12 = [v10 reverseObjectEnumerator];
      uint64_t v13 = [v12 allObjects];

      id v10 = (id)v13;
    }
    int64_t v14 = [(SBUIActionPlatterViewController *)self imagePosition];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v10 = v10;
    uint64_t v15 = [v10 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v57 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          v20 = [SBUIActionView alloc];
          v21 = -[SBUIActionView initWithAction:](v20, "initWithAction:", v19, (void)v56);
          [(SBUIActionView *)v21 setImagePosition:v14];
          [(SBUIActionView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v11 addObject:v21];
        }
        uint64_t v16 = [v10 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v16);
    }

    v22 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];

    unint64_t v3 = 0x263F1C000;
  }
  else
  {
    v22 = 0;
  }
  v23 = (UIStackView *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v22];
  stackView = self->_stackView;
  self->_stackView = v23;

  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 addSubview:self->_stackView];
  v25 = (UIView *)objc_msgSend(objc_alloc(*(Class *)(v3 + 2912)), "initWithFrame:", v5, v6, v7, v8);
  keylinesContainerView = self->_keylinesContainerView;
  self->_keylinesContainerView = v25;

  [(UIView *)self->_keylinesContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 addSubview:self->_keylinesContainerView];
  [(SBUIActionPlatterViewController *)self _updateKeylineViews];
  v27 = [(UIStackView *)self->_stackView leftAnchor];
  v28 = [v9 leftAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  v30 = [(UIStackView *)self->_stackView rightAnchor];
  v31 = [v9 rightAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [(UIStackView *)self->_stackView topAnchor];
  v34 = [v9 topAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = [(UIStackView *)self->_stackView bottomAnchor];
  v37 = [v9 bottomAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  v39 = [(UIView *)self->_keylinesContainerView leftAnchor];
  v40 = [v9 leftAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [v41 setActive:1];

  v42 = [(UIView *)self->_keylinesContainerView rightAnchor];
  v43 = [v9 rightAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(UIView *)self->_keylinesContainerView topAnchor];
  v46 = [v9 topAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  [v47 setActive:1];

  v48 = [(UIView *)self->_keylinesContainerView bottomAnchor];
  v49 = [v9 bottomAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  [v50 setActive:1];

  v51 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel__handleLongPressGestureRecognizer_];
  [v51 setDelegate:self];
  [v51 setMinimumPressDuration:0.0];
  [v9 addGestureRecognizer:v51];
  id v52 = objc_alloc(MEMORY[0x263F1C970]);
  v53 = [MEMORY[0x263F1CD28] defaultConfiguration];
  v54 = (UISelectionFeedbackGenerator *)[v52 initWithConfiguration:v53 coordinateSpace:v9];
  feedbackRetargetBehavior = self->_feedbackRetargetBehavior;
  self->_feedbackRetargetBehavior = v54;

  [(SBUIActionPlatterViewController *)self setView:v9];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBUIActionPlatterViewController;
  [(SBUIActionPlatterViewController *)&v5 viewDidAppear:a3];
  id v4 = [(SBUIActionPlatterViewController *)self gestureRecognizer];
  [v4 addTarget:self action:sel__handleLongPressGestureRecognizer_];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBUIActionPlatterViewController;
  [(SBUIActionPlatterViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(SBUIActionPlatterViewController *)self gestureRecognizer];
  [v4 removeTarget:self action:sel__handleLongPressGestureRecognizer_];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setSystemInteractionStartIndex:(unint64_t)a3
{
  if (self->_systemInteractionStartIndex != a3)
  {
    self->_systemInteractionStartIndex = a3;
    [(SBUIActionPlatterViewController *)self _updateKeylineViews];
  }
}

- (void)setReversesActions:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_reversesActions != a3)
  {
    self->_reversesActions = a3;
    if ([(SBUIActionPlatterViewController *)self isViewLoaded])
    {
      id v4 = [(UIStackView *)self->_stackView arrangedSubviews];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      objc_super v5 = objc_msgSend(v4, "reverseObjectEnumerator", 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            [(UIStackView *)self->_stackView addArrangedSubview:*(void *)(*((void *)&v10 + 1) + 8 * i)];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }

      [(SBUIActionPlatterViewController *)self _updateKeylineViews];
    }
  }
}

- (void)setImagePosition:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_imagePosition != a3)
  {
    self->_imagePosition = a3;
    if ([(SBUIActionPlatterViewController *)self isViewLoaded])
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      objc_super v5 = [(UIStackView *)self->_stackView arrangedSubviews];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v10 + 1) + 8 * i) setImagePosition:a3];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v5) {
      *(unsigned char *)&self->_delegateRespondsTo &= ~1u;
    }
    id v6 = objc_storeWeak((id *)&self->_delegate, obj);

    if (obj)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
    }
  }
}

- (void)_updateKeylineViews
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v3 = [(UIView *)self->_keylinesContainerView subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(UIStackView *)self->_stackView arrangedSubviews];
  if ((unint64_t)[v8 count] >= 2)
  {
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    unint64_t v13 = 1;
    do
    {
      int64_t v14 = [v8 objectAtIndexedSubscript:v13];
      uint64_t v15 = -[SBUIActionKeylineView initWithFrame:]([SBUIActionKeylineView alloc], "initWithFrame:", v9, v10, v11, v12);
      [(SBUIActionKeylineView *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_keylinesContainerView addSubview:v15];
      uint64_t v16 = [(SBUIActionKeylineView *)v15 leadingAnchor];
      uint64_t v17 = [v14 leadingAnchor];
      [v14 leadingContentMargin];
      v18 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);
      [v18 setActive:1];

      uint64_t v19 = [(SBUIActionKeylineView *)v15 trailingAnchor];
      v20 = [v14 trailingAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      [v21 setActive:1];

      v22 = [(SBUIActionKeylineView *)v15 topAnchor];
      v23 = [v14 topAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      [v24 setActive:1];

      if (v13 == self->_systemInteractionStartIndex) {
        double v25 = 3.0;
      }
      else {
        double v25 = 1.0;
      }
      [(SBUIActionKeylineView *)v15 setHeight:v25];

      ++v13;
    }
    while (v13 < [v8 count]);
  }
}

- (void)_handleLongPressGestureRecognizer:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UIStackView *)self->_stackView arrangedSubviews];
  if ([v5 count])
  {
    if (*(unsigned char *)&self->_delegateRespondsTo)
    {
      uint64_t v7 = [(SBUIActionPlatterViewController *)self delegate];
      int v6 = [v7 actionPlatterViewControllerShouldRespondToTouches:self];
    }
    else
    {
      int v6 = 1;
    }
    uint64_t v8 = [v4 state];
    if ((unint64_t)(v8 - 3) < 2)
    {
      if ([(UISelectionFeedbackGenerator *)self->_feedbackRetargetBehavior isActive]) {
        [(UISelectionFeedbackGenerator *)self->_feedbackRetargetBehavior deactivate];
      }
    }
    else if ((unint64_t)(v8 - 1) <= 1 {
           && ([(UISelectionFeedbackGenerator *)self->_feedbackRetargetBehavior isActive] & 1) == 0)
    }
    {
      [(UISelectionFeedbackGenerator *)self->_feedbackRetargetBehavior activateWithCompletionBlock:0];
    }
    if (v6)
    {
      long long v42 = 0uLL;
      long long v43 = 0uLL;
      long long v40 = 0uLL;
      long long v41 = 0uLL;
      id v9 = v5;
      id v10 = (id)[v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v41 != v11) {
              objc_enumerationMutation(v9);
            }
            unint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            [v4 locationInView:v13];
            CGFloat v15 = v14;
            CGFloat v17 = v16;
            [v13 bounds];
            v48.x = v15;
            v48.y = v17;
            if (CGRectContainsPoint(v49, v48))
            {
              id v10 = v13;
              goto LABEL_30;
            }
          }
          id v10 = (id)[v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_30:

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v22 = v9;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v37 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = *(id *)(*((void *)&v36 + 1) + 8 * j);
            if ([v4 state] == 2) {
              feedbackRetargetBehavior = self->_feedbackRetargetBehavior;
            }
            else {
              feedbackRetargetBehavior = 0;
            }
            [v27 setHighlighted:v27 == v10 withFeedbackRetargetBehavior:feedbackRetargetBehavior];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v24);
      }

      if ([v4 state] == 3)
      {
        long long v29 = [v10 action];
        v30 = v29;
        if (v29)
        {
          uint64_t v31 = [v29 handler];
          v31[2]();
        }
      }
    }
    else
    {
      long long v34 = 0uLL;
      long long v35 = 0uLL;
      long long v32 = 0uLL;
      long long v33 = 0uLL;
      id v10 = v5;
      uint64_t v18 = [v10 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v33;
        do
        {
          for (uint64_t k = 0; k != v19; ++k)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "setHighlighted:", 0, (void)v32);
          }
          uint64_t v19 = [v10 countByEnumeratingWithState:&v32 objects:v44 count:16];
        }
        while (v19);
      }
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_delegateRespondsTo & 1) != 0
    && ([(SBUIActionPlatterViewController *)self delegate],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 actionPlatterViewControllerShouldRespondToTouches:self],
        v5,
        !v6))
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v7 = [(SBUIActionPlatterViewController *)self gestureRecognizer];
    uint64_t v8 = v7;
    if (v7) {
      BOOL v9 = [v7 state] == 0;
    }
    else {
      BOOL v9 = 1;
    }
  }
  return v9;
}

- (NSArray)actions
{
  return self->_actions;
}

- (unint64_t)systemInteractionStartIndex
{
  return self->_systemInteractionStartIndex;
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizer);

  return (UILongPressGestureRecognizer *)WeakRetained;
}

- (BOOL)reversesActions
{
  return self->_reversesActions;
}

- (int64_t)imagePosition
{
  return self->_imagePosition;
}

- (SBUIActionPlatterViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SBUIActionPlatterViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_gestureRecognizer);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_feedbackRetargetBehavior, 0);
  objc_storeStrong((id *)&self->_keylinesContainerView, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end