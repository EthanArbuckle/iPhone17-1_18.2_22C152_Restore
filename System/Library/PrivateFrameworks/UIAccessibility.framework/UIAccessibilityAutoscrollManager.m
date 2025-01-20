@interface UIAccessibilityAutoscrollManager
+ (id)sharedInstance;
- (BOOL)_autoscroll;
- (BOOL)_scrollViewIsOnScreen;
- (BOOL)autoscrollInDirection:(unint64_t)a3;
- (BOOL)isAutoscrolling;
- (UIAccessibilityAutoscrollManager)init;
- (UIScrollView)scrollView;
- (double)autoscrollSpeed;
- (id)targetToScroll;
- (unint64_t)availableAutoscrollDirections;
- (unint64_t)scrollDirection;
- (void)decrementAutoscrollSpeed;
- (void)incrementAutoscrollSpeed;
- (void)pause;
- (void)scrollToBottom;
- (void)scrollToTop;
- (void)setAutoscrollSpeed:(double)a3;
- (void)setAutoscrolling:(BOOL)a3;
- (void)setScrollDirection:(unint64_t)a3;
- (void)setScrollView:(id)a3;
- (void)setTargetToScroll:(id)a3;
@end

@implementation UIAccessibilityAutoscrollManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)sharedInstance__shared;

  return v2;
}

uint64_t __50__UIAccessibilityAutoscrollManager_sharedInstance__block_invoke()
{
  sharedInstance__shared = objc_alloc_init(UIAccessibilityAutoscrollManager);

  return MEMORY[0x1F41817F8]();
}

- (UIAccessibilityAutoscrollManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityAutoscrollManager;
  v2 = [(UIAccessibilityAutoscrollManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(UIAccessibilityAutoscrollManager *)v2 setAutoscrollSpeed:20.0];
    [(UIAccessibilityAutoscrollManager *)v3 setScrollDirection:4];
    v4 = v3;
  }

  return v3;
}

- (BOOL)autoscrollInDirection:(unint64_t)a3
{
  [(UIAccessibilityAutoscrollManager *)self setScrollDirection:a3];
  if (self->_autoscrolling) {
    [(UIAccessibilityAutoscrollManager *)self pause];
  }
  self->_autoscrolling = 1;

  return [(UIAccessibilityAutoscrollManager *)self _autoscroll];
}

- (unint64_t)availableAutoscrollDirections
{
  return 30;
}

- (void)pause
{
  self->_autoscrolling = 0;
  if ([(UIAccessibilityAutoscrollManager *)self scrollDirection] == 4) {
    double v3 = -0.01;
  }
  else {
    double v3 = dbl_19F349220[[(UIAccessibilityAutoscrollManager *)self scrollDirection] == 16];
  }
  v4 = [(UIAccessibilityAutoscrollManager *)self scrollView];
  [v4 contentOffset];
  double v6 = v3 + v5;
  v7 = [(UIAccessibilityAutoscrollManager *)self scrollView];
  [v7 contentOffset];
  double v9 = v3 + v8;

  id v10 = [(UIAccessibilityAutoscrollManager *)self scrollView];
  objc_msgSend(v10, "accessibilityApplyScrollContentOverride:sendScrollStatus:animateWithDuration:animationCurve:", 0, 3, v6, v9, 0.1);
}

- (void)incrementAutoscrollSpeed
{
  [(UIAccessibilityAutoscrollManager *)self autoscrollSpeed];
  double v4 = v3 + 10.0;
  if (v4 > 100.0) {
    double v4 = 100.0;
  }

  [(UIAccessibilityAutoscrollManager *)self setAutoscrollSpeed:v4];
}

- (void)decrementAutoscrollSpeed
{
  [(UIAccessibilityAutoscrollManager *)self autoscrollSpeed];
  double v4 = v3 + -10.0;
  if (v4 < 10.0) {
    double v4 = 10.0;
  }

  [(UIAccessibilityAutoscrollManager *)self setAutoscrollSpeed:v4];
}

- (void)setAutoscrollSpeed:(double)a3
{
  self->_autoscrollSpeed = a3;
  if (self->_autoscrolling && [(UIAccessibilityAutoscrollManager *)self _scrollViewIsOnScreen])
  {
    unint64_t v4 = [(UIAccessibilityAutoscrollManager *)self scrollDirection];
    [(UIAccessibilityAutoscrollManager *)self autoscrollInDirection:v4];
  }
}

- (void)scrollToTop
{
  double v3 = [(UIAccessibilityAutoscrollManager *)self scrollView];
  [v3 _accessibilityVisibleContentInset];
  double v5 = v4;
  double v7 = v6;

  double v8 = *MEMORY[0x1E4F1DAD8] - v7;
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) - v5;
  id v10 = [(UIAccessibilityAutoscrollManager *)self scrollView];
  objc_msgSend(v10, "setContentOffset:animated:", !self->_autoscrolling, v8, v9);
}

- (void)scrollToBottom
{
  id v12 = [(UIAccessibilityAutoscrollManager *)self scrollView];
  [v12 _accessibilityVisibleContentInset];
  double v4 = v3;
  double v6 = *MEMORY[0x1E4F1DAD8] - v5;
  [v12 contentSize];
  double v8 = v7;
  [v12 bounds];
  double v10 = v4 + v8 - v9;
  v11 = [(UIAccessibilityAutoscrollManager *)self scrollView];
  objc_msgSend(v11, "setContentOffset:animated:", 1, v6, v10);
}

- (BOOL)_scrollViewIsOnScreen
{
  double v3 = [(UIAccessibilityAutoscrollManager *)self scrollView];
  double v4 = [v3 window];
  if (v4)
  {
    double v5 = [(UIAccessibilityAutoscrollManager *)self scrollView];
    if ([v5 isHidden])
    {
      BOOL v6 = 0;
    }
    else
    {
      double v7 = [(UIAccessibilityAutoscrollManager *)self scrollView];
      [v7 alpha];
      BOOL v6 = v8 > 0.0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_autoscroll
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIAccessibilityAutoscrollManager *)self scrollView];
  if ([(UIAccessibilityAutoscrollManager *)self _scrollViewIsOnScreen])
  {
    if (self->_autoscrolling)
    {
      unint64_t v4 = [(UIAccessibilityAutoscrollManager *)self scrollDirection];
      [v3 contentOffset];
      double v6 = v5;
      double v8 = v7;
      [v3 contentSize];
      double v10 = v9;
      double v12 = v11;
      [v3 bounds];
      *((void *)&v15 + 1) = v4;
      *(void *)&long long v15 = v4 - 2;
      double v16 = 0.0;
      switch((unint64_t)(v15 >> 1))
      {
        case 0uLL:
          if (v8 <= 0.0) {
            goto LABEL_17;
          }
          double v16 = fabs(v8);
          double v8 = 0.0;
          goto LABEL_19;
        case 1uLL:
          if (v8 + v14 > v12) {
            goto LABEL_17;
          }
          double v16 = vabdd_f64(v8, v12 - v14);
          double v8 = v12 - v14;
          goto LABEL_19;
        case 3uLL:
          if (v6 <= 0.0) {
            goto LABEL_17;
          }
          double v16 = fabs(v6);
          double v6 = 0.0;
          goto LABEL_19;
        case 7uLL:
          if (v6 + v13 <= v10)
          {
            double v16 = vabdd_f64(v6, v10 - v13);
            double v6 = v10 - v13;
LABEL_19:
            objc_msgSend(v3, "accessibilityApplyScrollContentOverride:sendScrollStatus:animateWithDuration:animationCurve:", 0, 3, v6, v8, v16 / (self->_autoscrollSpeed + self->_autoscrollSpeed));
            BOOL v19 = 1;
          }
          else
          {
LABEL_17:
            BOOL v19 = 0;
            self->_autoscrolling = 0;
          }
          break;
        default:
          goto LABEL_19;
      }
      goto LABEL_20;
    }
  }
  else
  {
    v17 = AXLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      v22 = v3;
      _os_log_impl(&dword_19F2DB000, v17, OS_LOG_TYPE_INFO, "scroll view is not onscreen any longer. Stopping autoscroll: %@", (uint8_t *)&v21, 0xCu);
    }

    self->_autoscrolling = 0;
  }
  v18 = AXLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412290;
    v22 = v3;
    _os_log_impl(&dword_19F2DB000, v18, OS_LOG_TYPE_INFO, "stopping autoscroll now: %@", (uint8_t *)&v21, 0xCu);
  }

  BOOL v19 = 0;
LABEL_20:

  return v19;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)isAutoscrolling
{
  return self->_autoscrolling;
}

- (void)setAutoscrolling:(BOOL)a3
{
  self->_autoscrolling = a3;
}

- (unint64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (void)setScrollDirection:(unint64_t)a3
{
  self->_scrollDirection = a3;
}

- (double)autoscrollSpeed
{
  return self->_autoscrollSpeed;
}

- (id)targetToScroll
{
  return self->_targetToScroll;
}

- (void)setTargetToScroll:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_targetToScroll, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end