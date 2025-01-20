@interface _UIFocusDebugWindow
+ (BOOL)_isSystemWindow;
+ (BOOL)_supportsInvalidatingFocusCache;
+ (BOOL)hasAnyModules;
+ (id)moduleClasses;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isEligibleForFocusOcclusion;
- (BOOL)_shouldInformFocusAboutBecomingVisible;
- (BOOL)canBecomeKeyWindow;
- (BOOL)isTransparentFocusItem;
- (_UIFocusDebugWindow)initWithWindowScene:(id)a3;
- (id)focusItemsInRect:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_update:(id)a3;
- (void)_updateTimer;
- (void)drag:(id)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation _UIFocusDebugWindow

+ (id)moduleClasses
{
  if (qword_1EB261750 != -1) {
    dispatch_once(&qword_1EB261750, &__block_literal_global_318);
  }
  v2 = (void *)qword_1EB261748;
  return v2;
}

+ (BOOL)hasAnyModules
{
  v2 = [a1 moduleClasses];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (_UIFocusDebugWindow)initWithWindowScene:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)_UIFocusDebugWindow;
  v5 = [(UIWindow *)&v61 initWithWindowScene:v4];
  v6 = v5;
  if (v5)
  {
    id v39 = v4;
    [(UIWindow *)v5 setWindowLevel:16000000.0];
    [(_UIFocusDebugWindow *)v6 _updateTimer];
    v7 = objc_opt_new();
    [(UIView *)v6 bounds];
    objc_msgSend(v7, "setFrame:", 10.0, 30.0, 320.0, CGRectGetHeight(v66));
    [v7 setAutoresizingMask:16];
    [(UIView *)v6 addSubview:v7];
    objc_storeStrong((id *)&v6->_scrollView, v7);
    v8 = objc_opt_new();
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v38 = v6;
    id obj = [(id)objc_opt_class() moduleClasses];
    v44 = v7;
    uint64_t v45 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
    if (v45)
    {
      uint64_t v43 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v58 != v43) {
            objc_enumerationMutation(obj);
          }
          id v56 = objc_alloc_init(*(Class *)(*((void *)&v57 + 1) + 8 * i));
          v10 = [[_UIFocusDebugModuleContainer alloc] initWithModule:v56];
          [(UIView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v7 addSubview:v10];
          v11 = [(UIView *)v10 widthAnchor];
          v12 = [v7 widthAnchor];
          v13 = [v11 constraintEqualToAnchor:v12];

          LODWORD(v14) = 1140457472;
          [v13 setPriority:v14];
          v46 = (void *)MEMORY[0x1E4F5B268];
          v55 = v13;
          v63[0] = v13;
          v15 = [(UIView *)v10 leadingAnchor];
          v53 = [v7 contentLayoutGuide];
          [v53 leadingAnchor];
          v52 = v54 = v15;
          v51 = objc_msgSend(v15, "constraintEqualToAnchor:");
          v63[1] = v51;
          v16 = [(UIView *)v10 trailingAnchor];
          v49 = [v7 contentLayoutGuide];
          [v49 trailingAnchor];
          v48 = v50 = v16;
          v47 = objc_msgSend(v16, "constraintEqualToAnchor:");
          v63[2] = v47;
          v17 = [(UIView *)v10 topAnchor];
          v18 = [v8 lastObject];
          v19 = [v18 superview];
          v20 = [v19 bottomAnchor];
          uint64_t v21 = (uint64_t)v20;
          if (!v20)
          {
            v42 = [v7 contentLayoutGuide];
            uint64_t v21 = [v42 topAnchor];
            v41 = (void *)v21;
          }
          v22 = [v8 lastObject];
          if (v22) {
            double v23 = 10.0;
          }
          else {
            double v23 = 0.0;
          }
          v24 = [v17 constraintEqualToAnchor:v21 constant:v23];
          v63[3] = v24;
          v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];
          [v46 activateConstraints:v25];

          if (!v20)
          {
          }
          [v8 addObject:v56];

          v7 = v44;
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
      }
      while (v45);
    }

    if ([v8 count])
    {
      v26 = (void *)MEMORY[0x1E4F5B268];
      v27 = [v8 lastObject];
      v28 = [v27 superview];
      v29 = [v28 bottomAnchor];
      v30 = [v7 contentLayoutGuide];
      v31 = [v30 bottomAnchor];
      v32 = [v29 constraintEqualToAnchor:v31];
      v62 = v32;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
      [v26 activateConstraints:v33];

      v7 = v44;
    }
    uint64_t v34 = [v8 copy];
    v6 = v38;
    cacheModules = v38->_cacheModules;
    v38->_cacheModules = (NSArray *)v34;

    v36 = [[UILongPressGestureRecognizer alloc] initWithTarget:v38 action:sel_drag_];
    [(UILongPressGestureRecognizer *)v36 setNumberOfTapsRequired:1];
    [(UILongPressGestureRecognizer *)v36 setMinimumPressDuration:0.2];
    [(UIView *)v38 addGestureRecognizer:v36];

    id v4 = v39;
  }

  return v6;
}

- (void)drag:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 state];

  if (v9 == 2)
  {
    double v10 = v6 - self->_lastDragPoint.x;
    double v11 = v8 - self->_lastDragPoint.y;
    [(UIView *)self->_scrollView frame];
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v10 + v12, v11 + v13);
  }
  self->_lastDragPoint.x = v6;
  self->_lastDragPoint.y = v8;
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIFocusDebugWindow;
  [(UIWindow *)&v4 setHidden:a3];
  [(_UIFocusDebugWindow *)self _updateTimer];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_UIFocusDebugWindow;
  -[UIView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (_UIFocusDebugWindow *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self)
  {
    double v11 = 0;
  }
  else
  {
    double v7 = v5;
    double v8 = v7;
    if (v7)
    {
      uint64_t v9 = v7;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v10 = [v9 superview];

        uint64_t v9 = (void *)v10;
        if (!v10)
        {
          double v8 = 0;
          break;
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    double v11 = v8;
  }
  return v11;
}

- (BOOL)_shouldInformFocusAboutBecomingVisible
{
  return 0;
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (void)_updateTimer
{
  p_timer = &self->_timer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timer);
  [WeakRetained invalidate];

  if (![(UIView *)self isHidden])
  {
    double v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__update_ selector:0 userInfo:1 repeats:1.0];
    objc_storeWeak((id *)p_timer, v5);

    id v6 = objc_loadWeakRetained((id *)p_timer);
    [(_UIFocusDebugWindow *)self _update:v6];
  }
}

- (void)_update:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _UIKitProcessIsBeingDebugged() ^ 1;
  [(UIView *)self->_scrollView setHidden:v4];
  if ((v4 & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    double v5 = self->_cacheModules;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "update", (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_cacheModules, 0);
  objc_destroyWeak((id *)&self->_timer);
}

@end