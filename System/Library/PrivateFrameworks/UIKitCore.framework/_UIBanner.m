@interface _UIBanner
- (NSLayoutConstraint)hiddenConstraint;
- (NSLayoutConstraint)visibleConstraint;
- (NSMutableArray)dismissalAnimations;
- (NSMutableArray)dismissalCompletionHandlers;
- (NSMutableArray)tapHandlers;
- (_UIBannerContent)content;
- (_UIBannerManager)manager;
- (_UIBannerView)view;
- (int64_t)state;
- (void)addDismissalAnimations:(id)a3;
- (void)addDismissalCompletionHandler:(id)a3;
- (void)addTapHandler:(id)a3;
- (void)dismiss;
- (void)handleLongPressGesture:(id)a3;
- (void)present;
- (void)setContent:(id)a3;
- (void)setDismissalAnimations:(id)a3;
- (void)setDismissalCompletionHandlers:(id)a3;
- (void)setHiddenConstraint:(id)a3;
- (void)setManager:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTapHandlers:(id)a3;
- (void)setView:(id)a3;
- (void)setVisibleConstraint:(id)a3;
@end

@implementation _UIBanner

- (void)present
{
  if ((unint64_t)(self->_state - 1) >= 2)
  {
    if (!self->_view)
    {
      v3 = objc_alloc_init(_UIBannerView);
      [(_UIBanner *)self setView:v3];

      v4 = [(_UIBanner *)self content];
      [(_UIBannerView *)self->_view setContent:v4];

      if ([(NSMutableArray *)self->_tapHandlers count])
      {
        v5 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel_handleLongPressGesture_];
        [(UILongPressGestureRecognizer *)v5 setMinimumPressDuration:0.0];
        [(UIView *)self->_view addGestureRecognizer:v5];
      }
    }
    self->_state = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    v7 = [WeakRetained containerView];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __20___UIBanner_present__block_invoke;
    v8[3] = &unk_1E52DC3A0;
    v8[4] = self;
    [v7 _presentBanner:self completion:v8];
  }
}

- (void)handleLongPressGesture:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  switch([v4 state])
  {
    case 1:
      view = self->_view;
      BOOL v6 = 1;
      uint64_t v7 = 1;
      goto LABEL_4;
    case 2:
      [v4 locationInView:self->_view];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      [(UIView *)self->_view bounds];
      v23.x = v9;
      v23.y = v11;
      BOOL v6 = CGRectContainsPoint(v24, v23);
      view = self->_view;
      uint64_t v7 = 0;
LABEL_4:
      [(_UIBannerView *)view setHighlighted:v6 initialPress:v7];
      break;
    case 3:
      if ([(_UIBannerView *)self->_view highlighted])
      {
        [(_UIBannerView *)self->_view setHighlighted:0];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v12 = self->_tapHandlers;
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v18;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v18 != v15) {
                objc_enumerationMutation(v12);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v16) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v16));
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v14);
        }

        [(_UIBanner *)self dismiss];
      }
      break;
    case 4:
      [(_UIBannerView *)self->_view setHighlighted:0];
      break;
    default:
      break;
  }
}

- (void)dismiss
{
  int64_t state = self->_state;
  if (state) {
    BOOL v3 = state == 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    self->_int64_t state = 3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    BOOL v6 = [WeakRetained containerView];
    dismissalAnimations = self->_dismissalAnimations;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __20___UIBanner_dismiss__block_invoke;
    v8[3] = &unk_1E52DC3A0;
    v8[4] = self;
    [v6 _dismissBanner:self alongsideAnimations:dismissalAnimations completion:v8];
  }
}

- (void)addDismissalAnimations:(id)a3
{
  id v4 = a3;
  dismissalAnimations = self->_dismissalAnimations;
  aBlock = v4;
  if (!dismissalAnimations)
  {
    BOOL v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_dismissalAnimations;
    self->_dismissalAnimations = v6;

    id v4 = aBlock;
    dismissalAnimations = self->_dismissalAnimations;
  }
  double v8 = _Block_copy(v4);
  [(NSMutableArray *)dismissalAnimations addObject:v8];
}

- (void)addDismissalCompletionHandler:(id)a3
{
  id v4 = a3;
  dismissalCompletionHandlers = self->_dismissalCompletionHandlers;
  aBlock = v4;
  if (!dismissalCompletionHandlers)
  {
    BOOL v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_dismissalCompletionHandlers;
    self->_dismissalCompletionHandlers = v6;

    id v4 = aBlock;
    dismissalCompletionHandlers = self->_dismissalCompletionHandlers;
  }
  double v8 = _Block_copy(v4);
  [(NSMutableArray *)dismissalCompletionHandlers addObject:v8];
}

- (void)addTapHandler:(id)a3
{
  id v4 = a3;
  tapHandlers = self->_tapHandlers;
  aBlock = v4;
  if (!tapHandlers)
  {
    BOOL v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_tapHandlers;
    self->_tapHandlers = v6;

    id v4 = aBlock;
    tapHandlers = self->_tapHandlers;
  }
  double v8 = _Block_copy(v4);
  [(NSMutableArray *)tapHandlers addObject:v8];
}

- (_UIBannerView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (_UIBannerContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (_UIBannerManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (_UIBannerManager *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

- (NSLayoutConstraint)visibleConstraint
{
  return self->_visibleConstraint;
}

- (void)setVisibleConstraint:(id)a3
{
}

- (NSLayoutConstraint)hiddenConstraint
{
  return self->_hiddenConstraint;
}

- (void)setHiddenConstraint:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSMutableArray)dismissalAnimations
{
  return self->_dismissalAnimations;
}

- (void)setDismissalAnimations:(id)a3
{
}

- (NSMutableArray)dismissalCompletionHandlers
{
  return self->_dismissalCompletionHandlers;
}

- (void)setDismissalCompletionHandlers:(id)a3
{
}

- (NSMutableArray)tapHandlers
{
  return self->_tapHandlers;
}

- (void)setTapHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapHandlers, 0);
  objc_storeStrong((id *)&self->_dismissalCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_dismissalAnimations, 0);
  objc_storeStrong((id *)&self->_hiddenConstraint, 0);
  objc_storeStrong((id *)&self->_visibleConstraint, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end