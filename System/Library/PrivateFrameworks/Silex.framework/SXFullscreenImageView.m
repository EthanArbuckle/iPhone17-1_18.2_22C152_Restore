@interface SXFullscreenImageView
- (BOOL)allowsDismissal;
- (BOOL)isZooming;
- (CGPoint)currentTranslation;
- (CGRect)contentViewFrame;
- (SXFullscreenImageView)initWithContentView:(id)a3 viewIndex:(unint64_t)a4;
- (SXFullscreenImageViewDelegate)delegate;
- (SXImageView)contentView;
- (UIActivityIndicatorView)activityIndicator;
- (UIScrollView)scrollView;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (double)currentScale;
- (unint64_t)activeGestureCount;
- (unint64_t)viewIndex;
- (void)handleDoubleTap:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidZoom:(id)a3;
- (void)setActiveGestureCount:(unint64_t)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewFrame:(CGRect)a3;
- (void)setCurrentScale:(double)a3;
- (void)setCurrentTranslation:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setIsZooming:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setup;
- (void)setupGestures;
- (void)showLoadingIndicator:(BOOL)a3;
@end

@implementation SXFullscreenImageView

- (SXFullscreenImageView)initWithContentView:(id)a3 viewIndex:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXFullscreenImageView;
  v8 = -[SXFullscreenImageView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contentView, a3);
    v9->_viewIndex = a4;
    [(SXFullscreenImageView *)v9 setup];
  }

  return v9;
}

- (void)setup
{
  id v3 = objc_alloc(MEMORY[0x263F1C940]);
  [(SXFullscreenImageView *)self bounds];
  v4 = objc_msgSend(v3, "initWithFrame:");
  [(SXFullscreenImageView *)self setScrollView:v4];

  v5 = [(SXFullscreenImageView *)self scrollView];
  [v5 setScrollsToTop:0];

  v6 = [(SXFullscreenImageView *)self scrollView];
  [v6 setScrollEnabled:0];

  id v7 = [(SXFullscreenImageView *)self scrollView];
  [v7 setBounces:1];

  v8 = [(SXFullscreenImageView *)self scrollView];
  [v8 setAlwaysBounceHorizontal:1];

  v9 = [(SXFullscreenImageView *)self scrollView];
  [v9 setAlwaysBounceVertical:1];

  v10 = [(SXFullscreenImageView *)self scrollView];
  [v10 setMinimumZoomScale:1.0];

  objc_super v11 = [(SXFullscreenImageView *)self scrollView];
  [v11 setMaximumZoomScale:2.0];

  v12 = [(SXFullscreenImageView *)self scrollView];
  [v12 setZoomScale:1.0];

  v13 = [(SXFullscreenImageView *)self scrollView];
  [v13 setDelegate:self];

  v14 = [(SXFullscreenImageView *)self scrollView];
  [v14 setShowsHorizontalScrollIndicator:0];

  v15 = [(SXFullscreenImageView *)self scrollView];
  [v15 setShowsVerticalScrollIndicator:0];

  v16 = [(SXFullscreenImageView *)self scrollView];
  v17 = [(SXFullscreenImageView *)self contentView];
  [v16 addSubview:v17];

  v18 = [(SXFullscreenImageView *)self scrollView];
  [(SXFullscreenImageView *)self addSubview:v18];

  [(SXFullscreenImageView *)self setupGestures];
}

- (void)setupGestures
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_handleDoubleTap_];
  [(SXFullscreenImageView *)self setDoubleTapGestureRecognizer:v3];

  v4 = [(SXFullscreenImageView *)self doubleTapGestureRecognizer];
  [v4 setDelegate:self];

  v5 = [(SXFullscreenImageView *)self doubleTapGestureRecognizer];
  [v5 setNumberOfTapsRequired:2];

  id v6 = [(SXFullscreenImageView *)self doubleTapGestureRecognizer];
  [(SXFullscreenImageView *)self addGestureRecognizer:v6];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenImageView;
  [(SXFullscreenImageView *)&v4 layoutSubviews];
  id v3 = [(SXFullscreenImageView *)self scrollView];
  [(SXFullscreenImageView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)handleDoubleTap:(id)a3
{
  id v22 = a3;
  if ([(SXFullscreenImageView *)self isZooming])
  {
    objc_super v4 = [(SXFullscreenImageView *)self scrollView];
    v5 = v4;
    double v6 = 1.0;
    uint64_t v7 = 1;
  }
  else
  {
    v8 = [v22 view];
    [v22 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    CGFloat v14 = *MEMORY[0x263F001A8];
    CGFloat v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    v15 = [(SXFullscreenImageView *)self scrollView];
    [v15 bounds];
    CGFloat v16 = CGRectGetWidth(v24) * 0.5;

    v17 = [(SXFullscreenImageView *)self scrollView];
    [v17 bounds];
    CGFloat v18 = CGRectGetHeight(v25) * 0.5;

    v26.origin.x = v14;
    v26.origin.y = v13;
    v26.size.width = v16;
    v26.size.height = v18;
    CGFloat v19 = v10 - CGRectGetMidX(v26);
    v27.origin.x = v19;
    v27.origin.y = v13;
    v27.size.width = v16;
    v27.size.height = v18;
    double v20 = v12 - CGRectGetMidY(v27);
    v21 = [(SXFullscreenImageView *)self scrollView];
    objc_msgSend(v21, "zoomToRect:animated:", 1, v19, v20, v16, v18);

    objc_super v4 = [(SXFullscreenImageView *)self scrollView];
    v5 = v4;
    double v6 = 2.0;
    uint64_t v7 = 0;
  }
  [v4 setZoomScale:v7 animated:v6];
}

- (void)setIsZooming:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SXFullscreenImageView *)self isZooming] != a3)
  {
    v5 = [(SXFullscreenImageView *)self scrollView];
    double v6 = v5;
    if (v3)
    {
      [v5 setScrollEnabled:1];

      uint64_t v7 = [(SXFullscreenImageView *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        double v9 = [(SXFullscreenImageView *)self delegate];
        [v9 fullScreenImageViewDidStartZooming:self];
LABEL_7:
      }
    }
    else
    {
      [v5 setScrollEnabled:0];

      double v10 = [(SXFullscreenImageView *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        double v9 = [(SXFullscreenImageView *)self delegate];
        [v9 fullScreenImageViewDidStopZooming:self];
        goto LABEL_7;
      }
    }
    self->_isZooming = v3;
  }
}

- (void)showLoadingIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SXFullscreenImageView *)self activityIndicator];
  double v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      char v8 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:1];
      [(SXFullscreenImageView *)self setActivityIndicator:v8];

      double v9 = [(SXFullscreenImageView *)self activityIndicator];
      [(SXFullscreenImageView *)self frame];
      CGFloat v10 = CGRectGetWidth(v14) * 0.5;
      [(SXFullscreenImageView *)self frame];
      objc_msgSend(v9, "setCenter:", v10, CGRectGetHeight(v15) * 0.5);

      char v11 = [(SXFullscreenImageView *)self activityIndicator];
      [(SXFullscreenImageView *)self addSubview:v11];

      id v12 = [(SXFullscreenImageView *)self activityIndicator];
      [v12 startAnimating];
    }
  }
  else
  {
    [v5 stopAnimating];

    uint64_t v7 = [(SXFullscreenImageView *)self activityIndicator];
    [v7 removeFromSuperview];

    [(SXFullscreenImageView *)self setActivityIndicator:0];
  }
}

- (BOOL)allowsDismissal
{
  BOOL v3 = [(SXFullscreenImageView *)self scrollView];
  if ([v3 isZooming])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = [(SXFullscreenImageView *)self scrollView];
    [v5 zoomScale];
    if (v6 <= 1.0) {
      BOOL v4 = ![(SXFullscreenImageView *)self isZooming];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)setContentViewFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  char v8 = [(SXFullscreenImageView *)self scrollView];
  [v8 zoomScale];
  double v10 = v9;

  if (v10 != 1.0)
  {
    char v11 = [(SXFullscreenImageView *)self scrollView];
    [v11 setZoomScale:0 animated:1.0];
  }
  self->_contentViewFrame.origin.CGFloat x = x;
  self->_contentViewFrame.origin.CGFloat y = y;
  self->_contentViewFrame.size.CGFloat width = width;
  self->_contentViewFrame.size.CGFloat height = height;
  id v12 = [(SXFullscreenImageView *)self contentView];
  [(SXFullscreenImageView *)self contentViewFrame];
  objc_msgSend(v12, "setFrame:");

  id v16 = [(SXFullscreenImageView *)self scrollView];
  CGFloat v13 = [(SXFullscreenImageView *)self scrollView];
  [v13 bounds];
  objc_msgSend(v16, "setContentSize:", v14, v15);
}

- (void)scrollViewDidZoom:(id)a3
{
  [a3 zoomScale];
  [(SXFullscreenImageView *)self setIsZooming:v4 > 1.0];
  uint64_t v5 = [(SXFullscreenImageView *)self contentView];
  [(id)v5 frame];
  double v7 = v6;
  char v8 = [(SXFullscreenImageView *)self contentView];
  [v8 frame];
  double v10 = v9;

  LOBYTE(v5) = [(SXFullscreenImageView *)self isZooming];
  [(SXFullscreenImageView *)self contentViewFrame];
  double v12 = v11;
  double v14 = v13;
  [(SXFullscreenImageView *)self contentViewFrame];
  if ((v5 & 1) == 0)
  {
    double v18 = v12 + v15 * 0.5;
    [(SXFullscreenImageView *)self contentViewFrame];
    double v29 = v28;
    [(SXFullscreenImageView *)self contentViewFrame];
    double v19 = v29 + v30 * 0.5;
    goto LABEL_9;
  }
  double v17 = v16;
  double v18 = v7 * 0.5;
  double v19 = v10 * 0.5;
  [(SXFullscreenImageView *)self bounds];
  double v21 = v20;
  [(SXFullscreenImageView *)self bounds];
  if (v14 <= v17)
  {
    if (v21 <= v22) {
      goto LABEL_9;
    }
    v23 = [(SXFullscreenImageView *)self scrollView];
    [v23 bounds];
    double v32 = v31;
    CGRect v26 = [(SXFullscreenImageView *)self scrollView];
    [v26 contentSize];
    double v18 = v18 + (v32 - v33) * 0.5;
  }
  else
  {
    if (v21 >= v22) {
      goto LABEL_9;
    }
    v23 = [(SXFullscreenImageView *)self scrollView];
    [v23 bounds];
    double v25 = v24;
    CGRect v26 = [(SXFullscreenImageView *)self scrollView];
    [v26 contentSize];
    double v19 = v19 + (v25 - v27) * 0.5;
  }

LABEL_9:
  id v34 = [(SXFullscreenImageView *)self contentView];
  objc_msgSend(v34, "setCenter:", v18, v19);
}

- (SXFullscreenImageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXFullscreenImageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXImageView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (CGRect)contentViewFrame
{
  double x = self->_contentViewFrame.origin.x;
  double y = self->_contentViewFrame.origin.y;
  double width = self->_contentViewFrame.size.width;
  double height = self->_contentViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (unint64_t)viewIndex
{
  return self->_viewIndex;
}

- (BOOL)isZooming
{
  return self->_isZooming;
}

- (unint64_t)activeGestureCount
{
  return self->_activeGestureCount;
}

- (void)setActiveGestureCount:(unint64_t)a3
{
  self->_activeGestureCount = a3;
}

- (CGPoint)currentTranslation
{
  double x = self->_currentTranslation.x;
  double y = self->_currentTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentTranslation:(CGPoint)a3
{
  self->_currentTranslation = a3;
}

- (double)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(double)a3
{
  self->_currentScale = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end