@interface SiriSharedUIContentPlatterScrollView
- (BOOL)adjustContentSizeOnNextLayout;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isAutomaticScrollingEnabled;
- (BOOL)isInAmbientInteractivity;
- (SiriSharedUIContentPlatterScrollView)initWithCoder:(id)a3;
- (SiriSharedUIContentPlatterScrollView)initWithFrame:(CGRect)a3;
- (SiriSharedUIContentPlatterScrollViewDelegate)platterDelegate;
- (id)_parentScrollView;
- (void)_sharedInit;
- (void)layoutSubviews;
- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)setAdjustContentSizeOnNextLayout:(BOOL)a3;
- (void)setAutomaticScrollingEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setPlatterDelegate:(id)a3;
@end

@implementation SiriSharedUIContentPlatterScrollView

- (SiriSharedUIContentPlatterScrollView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriSharedUIContentPlatterScrollView;
  v3 = -[SiriSharedUIContentPlatterScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SiriSharedUIContentPlatterScrollView *)v3 _sharedInit];
    [(SiriSharedUIContentPlatterScrollView *)v4 setAdjustContentSizeOnNextLayout:1];
  }
  return v4;
}

- (SiriSharedUIContentPlatterScrollView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriSharedUIContentPlatterScrollView;
  v3 = [(SiriSharedUIContentPlatterScrollView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SiriSharedUIContentPlatterScrollView *)v3 _sharedInit];
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SiriSharedUIContentPlatterScrollView *)self setAdjustContentSizeOnNextLayout:1];
  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUIContentPlatterScrollView;
  -[SiriSharedUIContentPlatterScrollView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)SiriSharedUIContentPlatterScrollView;
  [(SiriSharedUIContentPlatterScrollView *)&v31 layoutSubviews];
  if ([(SiriSharedUIContentPlatterScrollView *)self adjustContentSizeOnNextLayout])
  {
    [(SiriSharedUIContentPlatterScrollView *)self setAdjustContentSizeOnNextLayout:0];
    [(SiriSharedUIContentPlatterScrollView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    [(SiriSharedUIStandardScrollView *)self safeAreaInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    BOOL v13 = [(SiriSharedUIStandardScrollView *)self isSemanticContentAttributeRightToLeft];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = [(SiriSharedUIStandardScrollView *)self contentViews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      if (v13) {
        double v10 = v12;
      }
      uint64_t v17 = *(void *)v28;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v27 + 1) + 8 * v18);
          objc_opt_class();
          if (objc_opt_respondsToSelector())
          {
            [(id)objc_opt_class() defaultHeight];
            double v21 = v20;
          }
          else
          {
            objc_msgSend(v19, "sizeThatFits:", v4, 1.79769313e308);
            double v21 = v22;
          }
          objc_msgSend(v19, "setFrame:", v10, v8, v4, v21);
          double v8 = v8 + v21;
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v16);
    }

    [(SiriSharedUIContentPlatterScrollView *)self contentInset];
    double v24 = v6 - v23;
    [(SiriSharedUIContentPlatterScrollView *)self contentInset];
    if (v8 > v24 - v25
      && [(SiriSharedUIContentPlatterScrollView *)self isAutomaticScrollingEnabled])
    {
      uint64_t v26 = 1;
    }
    else
    {
      uint64_t v26 = 0;
      double v8 = v6;
    }
    [(SiriSharedUIContentPlatterScrollView *)self setScrollEnabled:v26];
    -[SiriSharedUIContentPlatterScrollView setContentSize:](self, "setContentSize:", v4, v8);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  double v4 = self;
  double v5 = [(SiriSharedUIContentPlatterScrollView *)self platterDelegate];
  LOBYTE(v4) = [v5 shouldAllowSimultaneousGestureRecognizersForScrollView:v4];

  return (char)v4;
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(SiriSharedUIContentPlatterScrollView *)self traitCollection];
  int v11 = [v10 isAmbientPresented];

  if (([(SiriSharedUIContentPlatterScrollView *)self isScrollEnabled] & 1) == 0 && v11)
  {
    id v13 = [(SiriSharedUIContentPlatterScrollView *)self _parentScrollView];
    -[SiriSharedUIContentPlatterScrollView convertRect:toView:](self, "convertRect:toView:", v13, x, y, width, height);
    double v12 = v13;
    if (v13)
    {
      objc_msgSend(v13, "scrollRectToVisible:animated:", v4);
      double v12 = v13;
    }
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  self->_isInAmbientInteractivitdouble y = a3;
}

- (id)_parentScrollView
{
  v2 = self;
  while (v2)
  {
    double v3 = [(SiriSharedUIContentPlatterScrollView *)v2 superview];

    objc_opt_class();
    v2 = v3;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  double v3 = 0;
LABEL_6:
  return v3;
}

- (void)_sharedInit
{
  [(SiriSharedUIContentPlatterScrollView *)self setAutomaticScrollingEnabled:1];
  [(SiriSharedUIContentPlatterScrollView *)self setShowsVerticalScrollIndicator:0];
  [(SiriSharedUIContentPlatterScrollView *)self setShowsHorizontalScrollIndicator:0];
}

- (BOOL)isAutomaticScrollingEnabled
{
  return self->_automaticScrollingEnabled;
}

- (void)setAutomaticScrollingEnabled:(BOOL)a3
{
  self->_automaticScrollingEnabled = a3;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (SiriSharedUIContentPlatterScrollViewDelegate)platterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterDelegate);
  return (SiriSharedUIContentPlatterScrollViewDelegate *)WeakRetained;
}

- (void)setPlatterDelegate:(id)a3
{
}

- (BOOL)adjustContentSizeOnNextLayout
{
  return self->_adjustContentSizeOnNextLayout;
}

- (void)setAdjustContentSizeOnNextLayout:(BOOL)a3
{
  self->_adjustContentSizeOnNextLayout = a3;
}

- (void).cxx_destruct
{
}

@end