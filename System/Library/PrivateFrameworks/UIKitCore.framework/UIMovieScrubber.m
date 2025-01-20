@interface UIMovieScrubber
+ (BOOL)_allowActionsToQueue;
+ (id)timeStringForSeconds:(int)a3 forceFullWidthComponents:(BOOL)a4 isElapsed:(BOOL)a5;
- (BOOL)cancelTouchTracking;
- (BOOL)forceZoom;
- (BOOL)isAnimatingValueChange;
- (BOOL)isContinuous;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isInsideNavigationBar;
- (BOOL)isZoomAnimating;
- (BOOL)pointInsideThumb:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showTimeViews;
- (BOOL)thumbIsVisible;
- (CGRect)_editingRect;
- (CGRect)_editingRectForStartTime:(double)a3 endTime:(double)a4;
- (CGRect)thumbRectForValue:(double)a3;
- (CGRect)trackRect;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (UIEdgeInsets)alignmentMargins;
- (UIMovieScrubber)init;
- (UIMovieScrubber)initWithFrame:(CGRect)a3;
- (UIMovieScrubberDataSource)dataSource;
- (UIMovieScrubberDelegate)delegate;
- (double)_valueForLocatable:(id)a3;
- (double)duration;
- (double)edgeInset;
- (double)maximumTrimLength;
- (double)minimumTrimLength;
- (double)movieScrubberTrackViewDuration:(id)a3;
- (double)movieScrubberTrackViewThumbnailAspectRatio:(id)a3;
- (double)movieScrubberTrackViewZoomAnimationDelay:(id)a3;
- (double)movieScrubberTrackViewZoomAnimationDuration:(id)a3;
- (double)trimEndValue;
- (double)trimStartValue;
- (double)value;
- (double)zoomDelay;
- (double)zoomMaximumValue;
- (double)zoomMinimumValue;
- (id)movieScrubberTrackView:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6;
- (int)_editingHandleWithLocatable:(id)a3;
- (void)_animateAfterEdit:(BOOL)a3;
- (void)_beginTrackPressWithLocatable:(id)a3 touchesBegan:(BOOL)a4;
- (void)_cancelTrackPress:(BOOL)a3;
- (void)_cancelTrackPressIfNeccessaryWithLocatable:(id)a3;
- (void)_computeTrackRectForBounds:(CGRect)a3;
- (void)_handlePanGesture:(id)a3;
- (void)_initSubviews;
- (void)_setValue:(double)a3 andSendAction:(BOOL)a4;
- (void)_setZoomAnimating:(BOOL)a3;
- (void)_sliderAnimationDidStop:(BOOL)a3;
- (void)_sliderAnimationWillStart;
- (void)_sliderValueDidChange:(id)a3;
- (void)_trackPressWasHeld;
- (void)_trimAnimationDidStop:(BOOL)a3 glassView:(id)a4;
- (void)_updateThumbLocation;
- (void)_updateTimes;
- (void)animateAfterEdit;
- (void)animateCancelEdit;
- (void)beginTrackingWithLocatable:(id)a3;
- (void)continueTrackingWithLocatable:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)endTrackingWithLocatable:(id)a3;
- (void)forceUnzoom;
- (void)layoutSubviews;
- (void)movieScrubberTrackView:(id)a3 clampedSizeWidthDelta:(double)a4 actualSizeWidthDelta:(double)a5 originXDelta:(double)a6 minimumVisibleValue:(double)a7 maximumVisibleValue:(double)a8;
- (void)movieScrubberTrackView:(id)a3 requestThumbnailImageForTimestamp:(id)a4 isSummaryThumbnail:(BOOL)a5;
- (void)movieScrubberTrackViewDidCollapse:(id)a3;
- (void)movieScrubberTrackViewDidExpand:(id)a3;
- (void)movieScrubberTrackViewDidFinishRequestingThumbnails:(id)a3;
- (void)movieScrubberTrackViewWillBeginRequestingThumbnails:(id)a3;
- (void)reloadData;
- (void)setContinuous:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEdgeInset:(double)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setMaximumTrimLength:(double)a3;
- (void)setMinimumTrimLength:(double)a3;
- (void)setRotationDisabled:(BOOL)a3;
- (void)setShowTimeViews:(BOOL)a3;
- (void)setThumbIsVisible:(BOOL)a3;
- (void)setThumbnailImage:(CGImage *)a3 forTimestamp:(id)a4;
- (void)setTrimEndValue:(double)a3;
- (void)setTrimStartValue:(double)a3;
- (void)setValue:(double)a3;
- (void)setValue:(double)a3 animated:(BOOL)a4;
- (void)setZoomAnimationDuration:(double)a3;
- (void)setZoomDelay:(double)a3;
@end

@implementation UIMovieScrubber

+ (BOOL)_allowActionsToQueue
{
  return 1;
}

- (UIMovieScrubber)init
{
  return -[UIMovieScrubber initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, 39.0);
}

- (UIMovieScrubber)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIMovieScrubber;
  v3 = -[UIControl initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, 39.0);
  v4 = v3;
  if (v3)
  {
    *((unsigned char *)&v3->_sliderFlags + 8) |= 0x10u;
    *(unsigned char *)&v3->_sliderFlags |= 1u;
    v3->_maximumValue = 0.0;
    v3->_value = 0.0;
    v3->_zoomDelay = 1.0;
    v3->_showTimeViews = 0;
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsGroupOpacity:1];

    v6 = [[UIPanGestureRecognizer alloc] initWithTarget:v4 action:sel__handlePanGesture_];
    panGestureRecognizer = v4->_panGestureRecognizer;
    v4->_panGestureRecognizer = v6;

    [(UIView *)v4 addGestureRecognizer:v4->_panGestureRecognizer];
    [(UIView *)v4 setOpaque:0];
    [(UIView *)v4 setAutoresizesSubviews:1];
    [(UIControl *)v4 addTarget:v4 action:sel__sliderValueDidChange_ forControlEvents:4096];
  }
  return v4;
}

- (void)dealloc
{
  [(UIMovieScrubberTrackView *)self->_trackView setDataSource:0];
  [(UIMovieScrubberTrackView *)self->_trackView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)UIMovieScrubber;
  [(UIView *)&v3 dealloc];
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 0x4000;
    }
    else {
      __int16 v6 = 0;
    }
    *((_WORD *)&self->_sliderFlags + 10) = *((_WORD *)&self->_sliderFlags + 10) & 0xBFFF | v6;
    [(UIMovieScrubber *)self reloadData];
    v5 = obj;
  }
}

- (UIMovieScrubberDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (UIMovieScrubberDataSource *)WeakRetained;
}

- (void)reloadData
{
  *(unsigned char *)&self->_sliderFlags |= 8u;
  [(UIMovieScrubberTrackView *)self->_trackView clear];
  [(UIView *)self setNeedsLayout];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_sliderFlags = &self->_sliderFlags;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 2;
    }
    else {
      __int16 v7 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFFD | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 4;
    }
    else {
      __int16 v8 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFFB | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 8;
    }
    else {
      __int16 v9 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFF7 | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 16;
    }
    else {
      __int16 v10 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFEF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 32;
    }
    else {
      __int16 v11 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFDF | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 64;
    }
    else {
      __int16 v12 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFBF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 256;
    }
    else {
      __int16 v13 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFEFF | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 128;
    }
    else {
      __int16 v14 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFF7F | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 512;
    }
    else {
      __int16 v15 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFDFF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 1024;
    }
    else {
      __int16 v16 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFBFF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 2048;
    }
    else {
      __int16 v17 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xF7FF | v17;
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = 4096;
    }
    else {
      __int16 v18 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xEFFF | v18;
    char v19 = objc_opt_respondsToSelector();
    v5 = obj;
    if (v19) {
      __int16 v20 = 0x2000;
    }
    else {
      __int16 v20 = 0;
    }
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xDFFF | v20;
  }
}

- (UIMovieScrubberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIMovieScrubberDelegate *)WeakRetained;
}

- (BOOL)thumbIsVisible
{
  return (*((unsigned __int8 *)&self->_sliderFlags + 8) >> 4) & 1;
}

- (void)setThumbIsVisible:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_sliderFlags + 8);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 16;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)&self->_sliderFlags + 8) = v3 & 0xEF | v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__UIMovieScrubber_setThumbIsVisible___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView animateWithDuration:v5 animations:0.25];
  }
}

uint64_t __37__UIMovieScrubber_setThumbIsVisible___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:(double)((*(unsigned __int8 *)(*(void *)(a1 + 32) + 704) >> 4) & 1)];
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)&self->_sliderFlags + 8) & 8) != 0)
  {
    self->_editable = a3;
  }
  else
  {
    if (!a3) {
      [(UIMovieScrubber *)self setEditing:0];
    }
    self->_editable = v3;
    editingView = self->_editingView;
    if (editingView)
    {
      [(UIMovieScrubberEditingView *)editingView setEnabled:v3];
    }
    else
    {
      [(UIMovieScrubber *)self _initSubviews];
      [(UIMovieScrubber *)self layoutSubviews];
    }
  }
}

- (void)setContinuous:(BOOL)a3
{
  *(unsigned char *)&self->_sliderFlags = *(unsigned char *)&self->_sliderFlags & 0xFE | a3;
}

- (BOOL)isContinuous
{
  return *(unsigned char *)&self->_sliderFlags & 1;
}

- (void)_animateAfterEdit:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_editingView frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIMovieScrubber *)self _editingRect];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  if (self->_editable)
  {
    v21 = -[UIMovieScrubberEditingView initWithFrame:]([UIMovieScrubberEditingView alloc], "initWithFrame:", v6, v8, v10, v12);
    [(UIMovieScrubberEditingView *)v21 layoutSubviews];
    [(UIView *)v21 setUserInteractionEnabled:0];
    [(UIView *)v21 setAlpha:0.0];
    [(UIMovieScrubberEditingView *)v21 setEnabled:self->_editable];
    [(UIMovieScrubberEditingView *)v21 setEdgeInset:self->_edgeInset];
    [(UIView *)self insertSubview:v21 below:self->_thumbView];
  }
  else
  {
    v21 = 0;
  }
  *((unsigned char *)&self->_sliderFlags + 8) |= 8u;
  if (v3) {
    double v22 = 0.5;
  }
  else {
    double v22 = 0.25;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __37__UIMovieScrubber__animateAfterEdit___block_invoke;
  v27[3] = &unk_1E52DF1E0;
  uint64_t v30 = v14;
  uint64_t v31 = v16;
  uint64_t v32 = v18;
  uint64_t v33 = v20;
  v28 = v21;
  v29 = self;
  BOOL v34 = v3;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __37__UIMovieScrubber__animateAfterEdit___block_invoke_2;
  v24[3] = &unk_1E52DF270;
  BOOL v26 = v3;
  v24[4] = self;
  v25 = v28;
  v23 = v28;
  +[UIView animateWithDuration:0 delay:v27 options:v24 animations:v22 completion:0.0];
}

uint64_t __37__UIMovieScrubber__animateAfterEdit___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(a1 + 32) layoutSubviews];
  [*(id *)(*(void *)(a1 + 40) + 472) setAlpha:0.0];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 472), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(*(void *)(a1 + 40) + 472) layoutSubviews];
  v2 = *(void **)(*(void *)(a1 + 40) + 464);
  if (*(unsigned char *)(a1 + 80))
  {
    return [v2 setEditing:0];
  }
  else
  {
    return [v2 animateFillFramesAway];
  }
}

uint64_t __37__UIMovieScrubber__animateAfterEdit___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trimAnimationDidStop:*(unsigned __int8 *)(a1 + 48) glassView:*(void *)(a1 + 40)];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editable)
  {
    BOOL v4 = a3;
    p_sliderFlags = &self->_sliderFlags;
    unsigned int v7 = *((unsigned __int8 *)&self->_sliderFlags + 8);
    if (a3 != v7 >> 7)
    {
      BOOL v8 = a4;
      if (a3) {
        char v9 = 0x80;
      }
      else {
        char v9 = 0;
      }
      *((unsigned char *)&self->_sliderFlags + 8) = v9 & 0x80 | v7 & 0x7F;
      if ((*(unsigned char *)p_sliderFlags & 8) != 0) {
        [(UIMovieScrubber *)self layoutSubviews];
      }
      if (!v8 || v4) {
        [(UIMovieScrubber *)self setThumbIsVisible:!v4];
      }
      if (*((char *)p_sliderFlags + 8) < 0) {
        double v10 = 0.0;
      }
      else {
        double v10 = 1.0;
      }
      [(UIView *)self->_elapsedLabel setAlpha:v10];
      [(UIView *)self->_remainingLabel setAlpha:v10];
      if (*((char *)p_sliderFlags + 8) < 0)
      {
        if (self->_maxTrimmedLength == 0.0)
        {
          [(UIMovieScrubber *)self duration];
          self->_double maxTrimmedLength = v11;
        }
        self->_trimStartValue = 0.0;
        double minTrimmedLength = self->_minTrimmedLength;
        [(UIMovieScrubber *)self duration];
        double v14 = v13;
        [(UIView *)self->_trackView frame];
        double maxTrimmedLength = v14 / v15 * 13.0;
        if (minTrimmedLength > maxTrimmedLength) {
          double maxTrimmedLength = minTrimmedLength;
        }
        self->_double minTrimmedLength = maxTrimmedLength;
        if (maxTrimmedLength < self->_maxTrimmedLength) {
          double maxTrimmedLength = self->_maxTrimmedLength;
        }
        self->_trimEndValue = maxTrimmedLength;
        [(UIMovieScrubberTrackView *)self->_trackView setEditing:1];
        [(UIMovieScrubber *)self _editingRectForStartTime:self->_trimStartValue endTime:self->_trimEndValue];
        -[UIView setFrame:](self->_editingView, "setFrame:");
        [(UIMovieScrubberEditingView *)self->_editingView setEditing:1];
        [(UIMovieScrubberTrackView *)self->_trackView setStartValue:self->_trimStartValue];
        [(UIMovieScrubberTrackView *)self->_trackView setEndValue:self->_trimEndValue];
        if (v8) {
          [(UIMovieScrubberEditingView *)self->_editingView bounce];
        }
        if ((*((_WORD *)p_sliderFlags + 10) & 0x80) != 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained movieScrubberDidBeginEditing:self];
        }
      }
      else
      {
        [(UIMovieScrubber *)self _cancelTrackPress:0];
        if (v8)
        {
          [(UIMovieScrubber *)self animateCancelEdit];
        }
        else
        {
          [(UIMovieScrubberTrackView *)self->_trackView setEditing:0];
          editingView = self->_editingView;
          [(UIMovieScrubber *)self _editingRect];
          -[UIView setFrame:](editingView, "setFrame:");
          uint64_t v18 = self->_editingView;
          [(UIMovieScrubberEditingView *)v18 setEditing:0];
        }
      }
    }
  }
}

- (void)animateAfterEdit
{
}

- (void)animateCancelEdit
{
}

- (void)_trimAnimationDidStop:(BOOL)a3 glassView:(id)a4
{
  BOOL v4 = a3;
  double v6 = (UIMovieScrubberEditingView *)a4;
  *((unsigned char *)&self->_sliderFlags + 8) &= 0x77u;
  [(UIView *)self->_editingView removeFromSuperview];
  editingView = self->_editingView;
  self->_editingView = v6;
  BOOL v8 = v6;

  [(UIMovieScrubberEditingView *)self->_editingView setEnabled:self->_editable];
  if (v4)
  {
    [(UIMovieScrubber *)self setValue:0 animated:0.0];
    [(UIMovieScrubber *)self setThumbIsVisible:1];
    if ((*((_WORD *)&self->_sliderFlags + 10) & 0x200) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained movieScrubberEditingAnimationFinished:self];
    }
  }
  else
  {
    [(UIMovieScrubber *)self setThumbIsVisible:1];
  }
}

- (void)setEditing:(BOOL)a3
{
}

- (BOOL)isEditing
{
  return *((unsigned __int8 *)&self->_sliderFlags + 8) >> 7;
}

- (void)setZoomAnimationDuration:(double)a3
{
}

- (void)_computeTrackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  double edgeInset = self->_edgeInset;
  double v7 = a3.origin.x + edgeInset;
  double v8 = a3.size.width - (edgeInset + edgeInset);
  if ((*(unsigned char *)&self->_sliderFlags & 0x10) != 0 || !self->_showTimeViews)
  {
    double v7 = v7 + 12.0;
    double v8 = v8 + -24.0;
  }
  else
  {
    elapsedLabel = self->_elapsedLabel;
    if (elapsedLabel)
    {
      [(UIView *)elapsedLabel frame];
      double v12 = v10 + v11 + 5.0;
      double v7 = v7 + v12;
      double v8 = v8 - v12;
    }
    remainingLabel = self->_remainingLabel;
    if (remainingLabel)
    {
      [(UIView *)remainingLabel frame];
      double v8 = v8 - (v14 + 4.0);
    }
  }
  self->_trackRect.origin.x = v7;
  self->_trackRect.origin.double y = y + 3.0;
  self->_trackRect.size.width = v8;
  self->_trackRect.size.double height = height + -7.0;
}

- (CGRect)trackRect
{
  if ((*(unsigned char *)&self->_sliderFlags & 0x20) != 0)
  {
    [(UIView *)self bounds];
    -[UIMovieScrubber _computeTrackRectForBounds:](self, "_computeTrackRectForBounds:");
    *(unsigned char *)&self->_sliderFlags &= ~0x20u;
  }
  double x = self->_trackRect.origin.x;
  double y = self->_trackRect.origin.y;
  double width = self->_trackRect.size.width;
  double height = self->_trackRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_editingRect
{
  [(UIMovieScrubber *)self _editingRectForStartTime:self->_minimumValue endTime:self->_maximumValue];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)_editingRectForStartTime:(double)a3 endTime:(double)a4
{
  [(UIMovieScrubber *)self trackRect];
  double minimumValue = self->_minimumValue;
  double maximumValue = self->_maximumValue;
  double v11 = maximumValue - minimumValue;
  if (maximumValue - minimumValue <= 0.0)
  {
    double v15 = 0.0;
  }
  else
  {
    if (a4 >= a3) {
      double v12 = a3;
    }
    else {
      double v12 = a4;
    }
    if (a4 >= a3) {
      double v13 = a4;
    }
    else {
      double v13 = a3;
    }
    if (v13 >= maximumValue) {
      double v13 = self->_maximumValue;
    }
    if (v12 < minimumValue) {
      double v12 = self->_minimumValue;
    }
    double v14 = rint(v8 * ((v12 - minimumValue) / v11));
    double v7 = v7 + v14;
    double v15 = v8 - (v14 + rint(v8 * ((maximumValue - v13) / v11)));
  }
  double v16 = self->_edgeInset + 12.0;
  double v17 = v7 - v16;
  double v18 = v15 + v16 + v16;
  double v19 = 36.0;
  double v20 = 1.0;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v20;
  result.origin.double x = v17;
  return result;
}

- (CGRect)thumbRectForValue:(double)a3
{
  double minimumValue = self->_minimumValue;
  double maximumValue = self->_maximumValue;
  [(UIView *)self->_trackView frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = self->_maximumValue;
  double v14 = self->_minimumValue;
  double v15 = 0.0;
  if (v13 != v14)
  {
    if (minimumValue <= a3) {
      double v16 = a3;
    }
    else {
      double v16 = minimumValue;
    }
    if (v16 > maximumValue) {
      double v16 = maximumValue;
    }
    double v15 = (v16 - v14) / (v13 - v14);
  }
  double v17 = _GetScrubberThumbImage();
  [v17 size];
  double v19 = v18;
  double v21 = v20;

  double v22 = v8 + round(v15 * (v12 - v19));
  double v23 = v10 + -3.0;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)UIMovieScrubber;
  -[UIView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  if (!CGRectEqualToRect(v17, v18))
  {
    *(unsigned char *)&self->_sliderFlags |= 0x20u;
    if (*((char *)&self->_sliderFlags + 8) < 0) {
      [(UIMovieScrubber *)self _editingRectForStartTime:self->_trimStartValue endTime:self->_trimEndValue];
    }
    else {
      [(UIMovieScrubber *)self _editingRect];
    }
    -[UIView setFrame:](self->_editingView, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (result.width < 35.0) {
    result.double width = 35.0;
  }
  double v3 = 39.0;
  result.double height = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self bounds];
  -[UIMovieScrubber sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)layoutSubviews
{
  p_sliderFlags = &self->_sliderFlags;
  if ((*(unsigned char *)&self->_sliderFlags & 4) == 0 && (*((unsigned char *)&self->_sliderFlags + 8) & 3) == 0)
  {
    [(UIView *)self bounds];
    double v5 = v4;
    char v6 = *(unsigned char *)p_sliderFlags;
    char v7 = *(unsigned char *)p_sliderFlags | 0x20;
    *(unsigned char *)p_sliderFlags = v7;
    if ((v6 & 8) != 0)
    {
      *(unsigned char *)p_sliderFlags = v7 & 0xF7;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      [WeakRetained movieScrubberDuration:self];
      -[UIMovieScrubber setDuration:](self, "setDuration:");

      [(UIMovieScrubberTrackView *)self->_trackView reloadData];
    }
    [(UIMovieScrubber *)self duration];
    if (v9 != 0.0)
    {
      if (!self->_thumbView)
      {
        [(UIMovieScrubber *)self _initSubviews];
        [(UIMovieScrubberTrackView *)self->_trackView reloadData];
      }
      [(UIMovieScrubber *)self _updateTimes];
      [(UIView *)self->_elapsedLabel sizeToFit];
      [(UIView *)self->_remainingLabel sizeToFit];
      double v10 = *(double *)&layoutSubviews___timeLabelFontAscent;
      if (*(double *)&layoutSubviews___timeLabelFontAscent == 0.0)
      {
        CGFloat v11 = [off_1E52D39B8 boldSystemFontOfSize:14.0];
        [v11 ascender];
        layoutSubviews___timeLabelFontAscent = v12;
      }
      [(UIMovieScrubber *)self trackRect];
      double v14 = v13;
      double v15 = (double)self->_timeComponents * 19.0;
      [(UIView *)self->_elapsedLabel frame];
      double v17 = floor((v14 - v16) * 0.5);
      -[UILabel setFrame:](self->_elapsedLabel, "setFrame:", 0.0, v17, v15);
      [(UIView *)self->_remainingLabel frame];
      -[UILabel setFrame:](self->_remainingLabel, "setFrame:", v5 - v15, v17, v15);
      *(unsigned char *)p_sliderFlags = *(unsigned char *)p_sliderFlags & 0xCF | 0x20;
      trackView = self->_trackView;
      [(UIMovieScrubber *)self trackRect];
      -[UIView setFrame:](trackView, "setFrame:");
      int v19 = *((char *)p_sliderFlags + 8);
      if ((v19 & 0x80000000) == 0)
      {
        if ((v19 & 8) == 0) {
          [(UIView *)self->_editingView setAlpha:1.0];
        }
        editingView = self->_editingView;
        [(UIMovieScrubber *)self _editingRect];
        -[UIView setFrame:](editingView, "setFrame:");
      }
      [(UIMovieScrubber *)self _updateThumbLocation];
      v21.receiver = self;
      v21.super_class = (Class)UIMovieScrubber;
      [(UIView *)&v21 layoutSubviews];
    }
  }
}

- (void)_initSubviews
{
  *(unsigned char *)&self->_sliderFlags |= 0x20u;
  [(UIMovieScrubber *)self trackRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (!self->_elapsedLabel && self->_showTimeViews)
  {
    CGFloat v11 = objc_alloc_init(UILabel);
    elapsedLabel = self->_elapsedLabel;
    self->_elapsedLabel = v11;

    [(UIView *)self->_elapsedLabel setOpaque:0];
    double v13 = self->_elapsedLabel;
    double v14 = [off_1E52D39B8 boldSystemFontOfSize:14.0];
    [(UILabel *)v13 setFont:v14];

    double v15 = self->_elapsedLabel;
    double v16 = +[UIColor whiteColor];
    [(UILabel *)v15 setTextColor:v16];

    double v17 = self->_elapsedLabel;
    CGRect v18 = +[UIColor clearColor];
    [(UIView *)v17 setBackgroundColor:v18];

    [(UILabel *)self->_elapsedLabel setTextAlignment:1];
    [(UIView *)self->_elapsedLabel setAutoresizingMask:4];
    [(UIView *)self addSubview:self->_elapsedLabel];
    *(unsigned char *)&self->_sliderFlags |= 0x10u;
  }
  if (!self->_remainingLabel && self->_showTimeViews)
  {
    int v19 = objc_alloc_init(UILabel);
    remainingLabel = self->_remainingLabel;
    self->_remainingLabel = v19;

    [(UIView *)self->_remainingLabel setOpaque:0];
    objc_super v21 = self->_remainingLabel;
    double v22 = [off_1E52D39B8 boldSystemFontOfSize:14.0];
    [(UILabel *)v21 setFont:v22];

    double v23 = self->_remainingLabel;
    double v24 = +[UIColor whiteColor];
    [(UILabel *)v23 setTextColor:v24];

    double v25 = self->_remainingLabel;
    BOOL v26 = +[UIColor clearColor];
    [(UIView *)v25 setBackgroundColor:v26];

    [(UILabel *)self->_remainingLabel setTextAlignment:1];
    [(UIView *)self->_remainingLabel setAutoresizingMask:1];
    [(UIView *)self addSubview:self->_remainingLabel];
    *(unsigned char *)&self->_sliderFlags |= 0x10u;
  }
  if (!self->_trackView)
  {
    v27 = -[UIMovieScrubberTrackView initWithFrame:]([UIMovieScrubberTrackView alloc], "initWithFrame:", v4, v6, v8, v10);
    trackView = self->_trackView;
    self->_trackView = v27;

    [(UIView *)self->_trackView setAutoresizingMask:2];
    [(UIMovieScrubberTrackView *)self->_trackView setDataSource:self];
    [(UIMovieScrubberTrackView *)self->_trackView setDelegate:self];
    [(UIView *)self addSubview:self->_trackView];
  }
  if (!self->_thumbView)
  {
    [(UIMovieScrubber *)self thumbRectForValue:0.0];
    uint64_t v33 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v29, v30, v31, v32);
    thumbView = self->_thumbView;
    self->_thumbView = v33;

    [(UIImageView *)self->_thumbView setContentMode:4];
    [(UIView *)self->_thumbView setUserInteractionEnabled:0];
    v35 = self->_thumbView;
    v36 = _GetScrubberThumbImage();
    [(UIImageView *)v35 setImage:v36];

    [(UIView *)self->_thumbView setOpaque:0];
    [(UIView *)self->_thumbView setAutoresizingMask:0];
    [(UIView *)self addSubview:self->_thumbView];
  }
  if (!self->_editingView)
  {
    v37 = -[UIMovieScrubberEditingView initWithFrame:]([UIMovieScrubberEditingView alloc], "initWithFrame:", v4, v6, v8, v10);
    editingView = self->_editingView;
    self->_editingView = v37;

    [(UIView *)self->_editingView setUserInteractionEnabled:0];
    [(UIMovieScrubberEditingView *)self->_editingView setEnabled:self->_editable];
    [(UIMovieScrubberEditingView *)self->_editingView setEdgeInset:self->_edgeInset];
    v39 = self->_editingView;
    v40 = self->_thumbView;
    [(UIView *)self insertSubview:v39 below:v40];
  }
}

- (void)_updateTimes
{
  if ((*((unsigned char *)&self->_sliderFlags + 8) & 1) == 0 && self->_showTimeViews)
  {
    [(UIMovieScrubber *)self value];
    double v4 = floor(v3);
    int v5 = vcvtmd_s64_f64(v3);
    [(UIMovieScrubber *)self duration];
    __CopyProgressStringForSeconds(v5, 0, 1);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(UIMovieScrubber *)self duration];
    int v7 = (int)-floor(v6 - v4);
    [(UIMovieScrubber *)self duration];
    double v8 = __CopyProgressStringForSeconds(v7, 0, 0);
    [(UILabel *)self->_elapsedLabel setText:v9];
    [(UILabel *)self->_remainingLabel setText:v8];
  }
}

- (void)didMoveToSuperview
{
  *((_WORD *)&self->_sliderFlags + 10) = *((_WORD *)&self->_sliderFlags + 10) & 0xFFFE | IsInNavigationBar(self);
}

- (void)didMoveToWindow
{
  *((_WORD *)&self->_sliderFlags + 10) = *((_WORD *)&self->_sliderFlags + 10) & 0xFFFE | IsInNavigationBar(self);
}

- (BOOL)isInsideNavigationBar
{
  return *((_WORD *)&self->_sliderFlags + 10) & 1;
}

- (void)setEdgeInset:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (self->_edgeInset != a3)
  {
    self->_double edgeInset = a3;
    *(unsigned char *)&self->_sliderFlags |= 0x20u;
    [(UIMovieScrubberEditingView *)self->_editingView setEdgeInset:self->_edgeInset];
    [(UIMovieScrubber *)self layoutSubviews];
  }
}

- (UIEdgeInsets)alignmentMargins
{
  double v2 = 10.0;
  if (self->_editable) {
    double v2 = 0.0;
  }
  double v3 = 1.0;
  double v4 = 2.0;
  double v5 = v2;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
}

- (void)setValue:(double)a3 animated:(BOOL)a4
{
  if (a4)
  {
    int v5 = *((char *)&self->_sliderFlags + 8);
    BOOL v6 = v5 < 0;
    if (v5 < 0) {
      int v7 = &OBJC_IVAR___UIMovieScrubber__trimStartValue;
    }
    else {
      int v7 = &OBJC_IVAR___UIMovieScrubber__minimumValue;
    }
    double v8 = *(double *)((char *)&self->super.super.super.super.isa + *v7);
    id v9 = &OBJC_IVAR___UIMovieScrubber__trimEndValue;
    if (!v6) {
      id v9 = &OBJC_IVAR___UIMovieScrubber__maximumValue;
    }
    uint64_t v10 = *v9;
    if (v8 > a3) {
      a3 = v8;
    }
    if (a3 <= *(double *)((char *)&self->super.super.super.super.isa + v10)) {
      double v11 = a3;
    }
    else {
      double v11 = *(double *)((char *)&self->super.super.super.super.isa + v10);
    }
    [(UIMovieScrubber *)self trackRect];
    double v13 = v12;
    double v14 = [(UIView *)self->_thumbView layer];
    double v15 = [v14 presentationLayer];
    [v15 frame];
    double v17 = v16;

    [(UIMovieScrubber *)self thumbRectForValue:v11];
    v20[4] = self;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __37__UIMovieScrubber_setValue_animated___block_invoke;
    v21[3] = &unk_1E52D9CD0;
    v21[4] = self;
    *(double *)&v21[5] = v11;
    v19[4] = self;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __37__UIMovieScrubber_setValue_animated___block_invoke_2;
    v20[3] = &unk_1E52D9F70;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __37__UIMovieScrubber_setValue_animated___block_invoke_3;
    v19[3] = &unk_1E52DC3A0;
    +[UIView _animateWithDuration:4 delay:v21 options:v20 animations:v19 start:vabdd_f64(v17, v18) / v13 * 0.25 completion:0.0];
  }
  else
  {
    -[UIMovieScrubber _setValue:andSendAction:](self, "_setValue:andSendAction:", a3);
  }
}

uint64_t __37__UIMovieScrubber_setValue_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setValue:0 andSendAction:*(double *)(a1 + 40)];
}

uint64_t __37__UIMovieScrubber_setValue_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sliderAnimationWillStart];
}

uint64_t __37__UIMovieScrubber_setValue_animated___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sliderAnimationDidStop:a2];
}

- (void)_updateThumbLocation
{
  thumbView = self->_thumbView;
  [(UIMovieScrubber *)self value];
  -[UIMovieScrubber thumbRectForValue:](self, "thumbRectForValue:");
  -[UIImageView setFrame:](thumbView, "setFrame:");
}

- (void)_setValue:(double)a3 andSendAction:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = *((char *)&self->_sliderFlags + 8);
  BOOL v7 = v6 < 0;
  if (v6 < 0) {
    double v8 = &OBJC_IVAR___UIMovieScrubber__trimStartValue;
  }
  else {
    double v8 = &OBJC_IVAR___UIMovieScrubber__minimumValue;
  }
  double v9 = *(double *)((char *)&self->super.super.super.super.isa + *v8);
  uint64_t v10 = &OBJC_IVAR___UIMovieScrubber__trimEndValue;
  if (!v7) {
    uint64_t v10 = &OBJC_IVAR___UIMovieScrubber__maximumValue;
  }
  uint64_t v11 = *v10;
  if (v9 > a3) {
    a3 = v9;
  }
  if (a3 > *(double *)((char *)&self->super.super.super.super.isa + v11)) {
    a3 = *(double *)((char *)&self->super.super.super.super.isa + v11);
  }
  if (a3 != self->_value)
  {
    self->_value = a3;
    -[UIMovieScrubberTrackView setValue:](self->_trackView, "setValue:");
    [(UIMovieScrubber *)self _updateThumbLocation];
    [(UIMovieScrubber *)self _updateTimes];
  }
  if (v4)
  {
    [(UIControl *)self _sendActionsForEvents:4096 withEvent:0];
  }
}

- (double)duration
{
  return self->_maximumValue;
}

- (void)setDuration:(double)a3
{
  if (self->_maximumValue != a3)
  {
    self->_double maximumValue = a3;
    if ((60 * ((int)a3 / 60) - 60 * ((int)a3 / 60 % 60) + 3599) < 0x1C1F) {
      int v3 = 2;
    }
    else {
      int v3 = 3;
    }
    self->_timeComponents = v3;
    *(unsigned char *)&self->_sliderFlags |= 0x10u;
    [(UIMovieScrubber *)self _setValue:0 andSendAction:self->_value];
  }
}

- (double)trimStartValue
{
  double result = self->_trimStartValue;
  double trimEndValue = self->_trimEndValue;
  double maxTrimmedLength = self->_maxTrimmedLength;
  if (trimEndValue - result > maxTrimmedLength)
  {
    double v5 = trimEndValue - maxTrimmedLength;
    if (self->_sliderFlags.editingHandle == 2) {
      return v5;
    }
  }
  return result;
}

- (void)setTrimStartValue:(double)a3
{
  double minimumValue = a3;
  p_sliderFlags = &self->_sliderFlags;
  if (!self->_sliderFlags.clampingTrimRange)
  {
    if (self->_minimumValue > a3) {
      double minimumValue = self->_minimumValue;
    }
    if (minimumValue > self->_maximumValue) {
      double minimumValue = self->_maximumValue;
    }
  }
  if (minimumValue + self->_minTrimmedLength <= self->_trimEndValue)
  {
    double trimStartValue = self->_trimStartValue;
    self->_double trimStartValue = minimumValue;
    if (minimumValue == trimStartValue)
    {
      [(UIMovieScrubberTrackView *)self->_trackView setStartValue:minimumValue];
    }
    else
    {
      char v7 = *((unsigned char *)&self->_sliderFlags + 8);
      if ((v7 & 0x40) != 0)
      {
        *((unsigned char *)&self->_sliderFlags + 8) = v7 & 0xBF;
        if ((v7 & 0x80) == 0) {
          [(UIMovieScrubber *)self setEditing:1 animated:0];
        }
      }
      editingView = self->_editingView;
      [(UIMovieScrubber *)self _editingRectForStartTime:self->_trimStartValue endTime:self->_trimEndValue];
      -[UIView setFrame:](editingView, "setFrame:");
      [(UIMovieScrubberTrackView *)self->_trackView setStartValue:self->_trimStartValue];
      if ((*((_WORD *)p_sliderFlags + 10) & 4) != 0 && p_sliderFlags->editingHandle == 1)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained movieScrubber:self editingStartValueDidChange:self->_trimStartValue];
      }
    }
    double maxTrimmedLength = self->_maxTrimmedLength;
    if (self->_minTrimmedLength >= maxTrimmedLength) {
      double maxTrimmedLength = self->_minTrimmedLength;
    }
    if (minimumValue != trimStartValue)
    {
      double trimEndValue = self->_trimEndValue;
      double v12 = trimEndValue - self->_trimStartValue - maxTrimmedLength;
      if (v12 > 0.01)
      {
        ++p_sliderFlags->clampingTrimRange;
        [(UIMovieScrubber *)self setTrimEndValue:trimEndValue - v12];
        --p_sliderFlags->clampingTrimRange;
      }
    }
  }
}

- (double)trimEndValue
{
  double result = self->_trimEndValue;
  double trimStartValue = self->_trimStartValue;
  double maxTrimmedLength = self->_maxTrimmedLength;
  if (result - trimStartValue > maxTrimmedLength)
  {
    double v5 = trimStartValue + maxTrimmedLength;
    if (self->_sliderFlags.editingHandle == 1) {
      return v5;
    }
  }
  return result;
}

- (void)setTrimEndValue:(double)a3
{
  double minimumValue = a3;
  p_sliderFlags = &self->_sliderFlags;
  if (!self->_sliderFlags.clampingTrimRange)
  {
    if (self->_minimumValue > a3) {
      double minimumValue = self->_minimumValue;
    }
    if (minimumValue > self->_maximumValue) {
      double minimumValue = self->_maximumValue;
    }
  }
  if (minimumValue >= self->_trimStartValue + self->_minTrimmedLength)
  {
    double trimEndValue = self->_trimEndValue;
    self->_double trimEndValue = minimumValue;
    if (trimEndValue == minimumValue)
    {
      [(UIMovieScrubberTrackView *)self->_trackView setEndValue:minimumValue];
    }
    else
    {
      char v7 = *((unsigned char *)&self->_sliderFlags + 8);
      if ((v7 & 0x40) != 0)
      {
        *((unsigned char *)&self->_sliderFlags + 8) = v7 & 0xBF;
        if ((v7 & 0x80) == 0) {
          [(UIMovieScrubber *)self setEditing:1 animated:0];
        }
      }
      editingView = self->_editingView;
      [(UIMovieScrubber *)self _editingRectForStartTime:self->_trimStartValue endTime:self->_trimEndValue];
      -[UIView setFrame:](editingView, "setFrame:");
      [(UIMovieScrubberTrackView *)self->_trackView setEndValue:self->_trimEndValue];
      if (p_sliderFlags->editingHandle == 2 && (*((_WORD *)p_sliderFlags + 10) & 8) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained movieScrubber:self editingEndValueDidChange:self->_trimEndValue];
      }
    }
    double maxTrimmedLength = self->_maxTrimmedLength;
    if (self->_minTrimmedLength >= maxTrimmedLength) {
      double maxTrimmedLength = self->_minTrimmedLength;
    }
    if (trimEndValue != minimumValue)
    {
      double trimStartValue = self->_trimStartValue;
      double v12 = self->_trimEndValue - trimStartValue - maxTrimmedLength;
      if (v12 > 0.01)
      {
        ++p_sliderFlags->clampingTrimRange;
        [(UIMovieScrubber *)self setTrimStartValue:trimStartValue + v12];
        --p_sliderFlags->clampingTrimRange;
      }
    }
  }
}

- (void)_sliderAnimationWillStart
{
  *(unsigned char *)&self->_sliderFlags |= 2u;
}

- (void)_sliderAnimationDidStop:(BOOL)a3
{
  if (a3) {
    *(unsigned char *)&self->_sliderFlags &= ~2u;
  }
}

- (double)_valueForLocatable:(id)a3
{
  double minimumValue = self->_minimumValue;
  double maximumValue = self->_maximumValue;
  [a3 locationInView:self->_trackView];
  double v7 = v6;
  [(UIView *)self->_trackView frame];
  double v9 = v8;
  [(UIView *)self bounds];
  double v10 = minimumValue + (maximumValue - minimumValue) * (v7 + self->_hitOffset) / v9;
  if (v10 >= minimumValue)
  {
    double minimumValue = minimumValue + (maximumValue - minimumValue) * (v7 + self->_hitOffset) / v9;
    if (v10 > maximumValue) {
      return maximumValue;
    }
  }
  return minimumValue;
}

- (void)setRotationDisabled:(BOOL)a3
{
  p_sliderFlags = &self->_sliderFlags;
  unsigned int rotationDisabled = self->_sliderFlags.rotationDisabled;
  if (a3)
  {
    if (!rotationDisabled)
    {
      double v5 = [(UIView *)self window];
      [v5 beginDisablingInterfaceAutorotation];

      unsigned int rotationDisabled = p_sliderFlags->rotationDisabled;
    }
    p_sliderFlags->unsigned int rotationDisabled = rotationDisabled + 1;
  }
  else if (rotationDisabled)
  {
    unsigned int v6 = rotationDisabled - 1;
    self->_sliderFlags.unsigned int rotationDisabled = v6;
    if (!v6)
    {
      id v7 = [(UIView *)self window];
      [v7 endDisablingInterfaceAutorotation];
    }
  }
}

- (void)_setZoomAnimating:(BOOL)a3
{
  p_sliderFlags = &self->_sliderFlags;
  char v4 = *((unsigned char *)&self->_sliderFlags + 8);
  if ((((v4 & 2) == 0) ^ a3)) {
    return;
  }
  BOOL v5 = a3;
  if (a3) {
    char v7 = 2;
  }
  else {
    char v7 = 0;
  }
  *((unsigned char *)&self->_sliderFlags + 8) = v4 & 0xFD | v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v5)
  {
    if ((*((_WORD *)p_sliderFlags + 10) & 0x800) != 0)
    {
      id v9 = WeakRetained;
      [WeakRetained movieScrubberDidBeginAnimatingZoom:self];
LABEL_10:
      id WeakRetained = v9;
    }
  }
  else if ((*((_WORD *)p_sliderFlags + 10) & 0x1000) != 0)
  {
    id v9 = WeakRetained;
    [WeakRetained movieScrubberDidEndAnimatingZoom:self];
    goto LABEL_10;
  }
}

- (BOOL)forceZoom
{
  return *((unsigned char *)&self->_sliderFlags + 8) & 1;
}

- (void)forceUnzoom
{
  p_sliderFlags = &self->_sliderFlags;
  if (*((unsigned char *)&self->_sliderFlags + 8))
  {
    _RemoveAllAnimationsForView(self);
    [(UIMovieScrubber *)self _setZoomAnimating:1];
    *((unsigned char *)p_sliderFlags + 8) &= ~1u;
    trackView = self->_trackView;
    [(UIMovieScrubberTrackView *)trackView unzoom];
  }
}

- (void)_trackPressWasHeld
{
  [(UIView *)self->_thumbView frame];
  *(float *)&double v4 = v4 + v3 * 0.5;
  *(float *)&double v6 = v6 + v5 * 0.5;
  -[UIView convertPoint:fromView:](self->_trackView, "convertPoint:fromView:", self, rintf(*(float *)&v4), rintf(*(float *)&v6));
  double v8 = v7;
  double v10 = v9;
  char v11 = *((unsigned char *)&self->_sliderFlags + 8);
  if ((v11 & 0x40) != 0)
  {
    *((unsigned char *)&self->_sliderFlags + 8) = v11 & 0xBF;
    if ((v11 & 0x80) == 0) {
      [(UIMovieScrubber *)self setEditing:1 animated:0];
    }
  }
  [(UIMovieScrubber *)self _setZoomAnimating:1];
  BOOL v12 = -[UIMovieScrubberTrackView zoomAtPoint:](self->_trackView, "zoomAtPoint:", v8, v10);
  *((unsigned char *)&self->_sliderFlags + 8) = *((unsigned char *)&self->_sliderFlags + 8) & 0xFE | v12;
  if (!v12)
  {
    [(UIMovieScrubber *)self _setZoomAnimating:0];
  }
}

- (void)_beginTrackPressWithLocatable:(id)a3 touchesBegan:(BOOL)a4
{
  p_sliderFlags = &self->_sliderFlags;
  if ((*((unsigned char *)&self->_sliderFlags + 8) & 5) == 0)
  {
    BOOL v5 = a4;
    p_touchLocationWhenTrackPressBegan = &self->_touchLocationWhenTrackPressBegan;
    [a3 locationInView:self->_trackView];
    p_touchLocationWhenTrackPressBegan->double x = v8;
    p_touchLocationWhenTrackPressBegan->double y = v9;
    *((unsigned char *)p_sliderFlags + 8) |= 4u;
    [(UIMovieScrubber *)self performSelector:sel__trackPressWasHeld withObject:0 afterDelay:self->_zoomDelay];
    if (v5)
    {
      [(UIMovieScrubber *)self setRotationDisabled:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained movieScrubberDidBeginScrubbing:self withHandle:p_sliderFlags->editingHandle];
      }
    }
  }
}

- (void)_cancelTrackPress:(BOOL)a3
{
  p_sliderFlags = &self->_sliderFlags;
  if ((*((unsigned char *)&self->_sliderFlags + 8) & 5) == 4)
  {
    BOOL v4 = a3;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__trackPressWasHeld object:0];
    char v6 = *((unsigned char *)p_sliderFlags + 8);
    *((unsigned char *)p_sliderFlags + 8) = v6 & 0xFB;
    if (v4)
    {
      if ((v6 & 3) == 0) {
        [(UIMovieScrubber *)self setRotationDisabled:0];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained movieScrubberDidEndScrubbing:self withHandle:p_sliderFlags->editingHandle];
      }
    }
  }
}

- (void)_cancelTrackPressIfNeccessaryWithLocatable:(id)a3
{
  double x = self->_touchLocationWhenTrackPressBegan.x;
  [a3 locationInView:self->_trackView];
  if (vabdd_f64(x, v5) > 2.0)
  {
    [(UIMovieScrubber *)self _cancelTrackPress:0];
  }
}

- (BOOL)pointInsideThumb:(CGPoint)a3 withEvent:(id)a4
{
  thumbView = self->_thumbView;
  if (thumbView)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    trackView = self->_trackView;
    [(UIView *)thumbView hitRect];
    -[UIView convertRect:fromView:](trackView, "convertRect:fromView:", self->_thumbView);
    CGRect v14 = CGRectInset(v13, -20.0, -20.0);
    CGFloat v9 = x;
    CGFloat v10 = y;
    LOBYTE(thumbView) = CGRectContainsPoint(v14, *(CGPoint *)&v9);
  }
  return (char)thumbView;
}

- (int)_editingHandleWithLocatable:(id)a3
{
  [a3 locationInView:self->_editingView];
  int result = -[UIMovieScrubberEditingView handleForPoint:hitOffset:](self->_editingView, "handleForPoint:hitOffset:", &self->_hitOffset);
  self->_sliderFlags.editingHandle = result;
  return result;
}

- (void)_handlePanGesture:(id)a3
{
  id v4 = a3;
  switch([v4 state])
  {
    case 1:
      [(UIMovieScrubber *)self beginTrackingWithLocatable:v4];
      break;
    case 2:
      [(UIMovieScrubber *)self continueTrackingWithLocatable:v4];
      break;
    case 3:
    case 4:
      [(UIMovieScrubber *)self endTrackingWithLocatable:v4];
      break;
    default:
      break;
  }
}

- (void)beginTrackingWithLocatable:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  id v20 = v4;
  if ((*((unsigned char *)&self->_sliderFlags + 8) & 0x10) != 0)
  {
    [v4 locationInView:self->_trackView];
    double v7 = v6;
    double v9 = v8;
    -[UIView convertPoint:fromView:](self->_thumbView, "convertPoint:fromView:", self->_trackView);
    double v11 = v10;
    if (-[UIMovieScrubber pointInsideThumb:withEvent:](self, "pointInsideThumb:withEvent:", 0, v7, v9))
    {
      [(UIView *)self->_thumbView frame];
      self->_hitOffset = round(v12 * 0.5 - v11);
      goto LABEL_22;
    }
    int v13 = [(UIMovieScrubber *)self _editingHandleWithLocatable:v20];
    double v5 = v20;
    if (!v13)
    {
      [(UIMovieScrubber *)self _valueForLocatable:v20];
      -[UIMovieScrubber setValue:animated:](self, "setValue:animated:", 0);
LABEL_22:
      self->_sliderFlags.unsigned int editingHandle = 0;
      [(UIMovieScrubber *)self _beginTrackPressWithLocatable:v20 touchesBegan:1];
      if ([(UIMovieScrubber *)self isContinuous]) {
        [(UIControl *)self _sendActionsForEvents:4096 withEvent:0];
      }
      goto LABEL_27;
    }
  }
  char editable = self->_editable;
  if (!editable) {
    goto LABEL_29;
  }
  if ([(UIMovieScrubber *)self _editingHandleWithLocatable:v5])
  {
    int v15 = *((char *)&self->_sliderFlags + 8);
    if (v15 < 0)
    {
      unsigned int editingHandle = self->_sliderFlags.editingHandle;
      if (editingHandle == 2)
      {
        [(UIMovieScrubber *)self setTrimEndValue:self->_trimEndValue];
      }
      else
      {
        if (editingHandle != 1)
        {
LABEL_26:
          [(UIMovieScrubber *)self _beginTrackPressWithLocatable:v20 touchesBegan:1];
          goto LABEL_27;
        }
        [(UIMovieScrubber *)self setTrimStartValue:self->_trimStartValue];
      }
    }
    else
    {
      if ((v15 & 0x40) != 0) {
        goto LABEL_27;
      }
      if (self->_sliderFlags.editingHandle - 1 <= 1)
      {
        *((unsigned char *)&self->_sliderFlags + 8) = v15 | 0x40;
        double maxTrimmedLength = self->_maxTrimmedLength;
        if (maxTrimmedLength == 0.0)
        {
          double maxTrimmedLength = self->_maximumValue;
          self->_double maxTrimmedLength = maxTrimmedLength;
        }
        if (self->_trimEndValue == 0.0) {
          self->_double trimEndValue = maxTrimmedLength;
        }
        [(UIMovieScrubberEditingView *)self->_editingView setEditing:1];
        if ((*((_WORD *)&self->_sliderFlags + 10) & 0x40) != 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained movieScrubberWillBeginEditing:self];
        }
        [(UIMovieScrubber *)self setThumbIsVisible:0];
      }
    }
    if (*((char *)&self->_sliderFlags + 8) < 0) {
      goto LABEL_26;
    }
LABEL_27:
    int v19 = +[_UIStatistics scrubberUsageTime];
    [v19 startTimingForObject:self];

    char editable = 32;
    goto LABEL_28;
  }
  char editable = 0;
LABEL_28:
  double v5 = v20;
LABEL_29:
  *((unsigned char *)&self->_sliderFlags + 8) = *((unsigned char *)&self->_sliderFlags + 8) & 0xDF | editable;
}

- (void)continueTrackingWithLocatable:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)&self->_sliderFlags + 8) & 0x20) != 0)
  {
    id v6 = v4;
    [(UIMovieScrubber *)self _cancelTrackPressIfNeccessaryWithLocatable:v4];
    [(UIMovieScrubber *)self _beginTrackPressWithLocatable:v6 touchesBegan:0];
    id v4 = v6;
    if ((*((unsigned char *)&self->_sliderFlags + 8) & 2) == 0)
    {
      [(UIMovieScrubber *)self _valueForLocatable:v6];
      unsigned int editingHandle = self->_sliderFlags.editingHandle;
      if (editingHandle == 2)
      {
        -[UIMovieScrubber setTrimEndValue:](self, "setTrimEndValue:");
      }
      else if (editingHandle == 1)
      {
        -[UIMovieScrubber setTrimStartValue:](self, "setTrimStartValue:");
      }
      else
      {
        id v4 = v6;
        if (editingHandle) {
          goto LABEL_12;
        }
        -[UIMovieScrubber setValue:animated:](self, "setValue:animated:", 0);
        if ([(UIMovieScrubber *)self isContinuous]) {
          [(UIControl *)self _sendActionsForEvents:4096 withEvent:0];
        }
        [(UIControl *)self setHighlighted:1];
      }
      id v4 = v6;
    }
  }
LABEL_12:
}

- (void)endTrackingWithLocatable:(id)a3
{
  id v8 = a3;
  if ((*((unsigned char *)&self->_sliderFlags + 8) & 0x20) != 0)
  {
    id v4 = +[_UIStatistics scrubberUsageCount];
    [v4 incrementValueBy:1];

    double v5 = +[_UIStatistics scrubberUsageTime];
    [v5 recordTimingForObject:self];
  }
  [(UIControl *)self setTracking:0];
  char v6 = *((unsigned char *)&self->_sliderFlags + 8);
  *((unsigned char *)&self->_sliderFlags + 8) = v6 & 0xDF;
  if (v6)
  {
    _RemoveAllAnimationsForView(self);
    [(UIMovieScrubber *)self _setZoomAnimating:1];
    *((unsigned char *)&self->_sliderFlags + 8) &= ~1u;
    [(UIMovieScrubberTrackView *)self->_trackView unzoom];
  }
  else
  {
    if ((v6 & 0x40) != 0)
    {
      *((unsigned char *)&self->_sliderFlags + 8) = v6 & 0x9F;
      [(UIMovieScrubberEditingView *)self->_editingView setEditing:0];
      [(UIMovieScrubber *)self setThumbIsVisible:1];
      if ((*((_WORD *)&self->_sliderFlags + 10) & 0x100) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained movieScrubberDidCancelEditing:self];
      }
    }
    if ((*((unsigned char *)&self->_sliderFlags + 8) & 0x83) == 0x80) {
      [(UIMovieScrubber *)self setRotationDisabled:0];
    }
    [(UIControl *)self setHighlighted:0];
  }
  [(UIMovieScrubber *)self _cancelTrackPress:1];
}

- (BOOL)cancelTouchTracking
{
  if ([(UIControl *)self isTracking]) {
    [(UIMovieScrubber *)self endTrackingWithLocatable:0];
  }
  if ([(UIControl *)self isHighlighted]) {
    [(UIControl *)self setHighlighted:0];
  }
  [(UIControl *)self _sendActionsForEvents:256 withEvent:0];
  return 1;
}

- (BOOL)isAnimatingValueChange
{
  return (*(unsigned char *)&self->_sliderFlags >> 1) & 1;
}

- (void)_sliderValueDidChange:(id)a3
{
  if ((*((_WORD *)&self->_sliderFlags + 10) & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained movieScrubber:self valueDidChange:self->_value];
  }
}

- (double)movieScrubberTrackViewDuration:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained movieScrubberDuration:self];
  double v6 = v5;

  [(UIMovieScrubber *)self setDuration:v6];
  return v6;
}

- (id)movieScrubberTrackView:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  p_dataSource = &self->_dataSource;
  id v10 = a6;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  int v13 = [WeakRetained movieScrubber:self evenlySpacedTimestamps:v7 startingAt:v11 endingAt:v10];

  return v13;
}

- (void)movieScrubberTrackView:(id)a3 requestThumbnailImageForTimestamp:(id)a4 isSummaryThumbnail:(BOOL)a5
{
  BOOL v5 = a5;
  p_dataSource = &self->_dataSource;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v10 = WeakRetained;
  if ((*((_WORD *)&self->_sliderFlags + 10) & 0x4000) != 0) {
    [WeakRetained movieScrubber:self requestThumbnailImageForTimestamp:v8 isSummaryThumbnail:v5];
  }
  else {
    [WeakRetained movieScrubber:self requestThumbnailImageForTimestamp:v8];
  }
}

- (void)setThumbnailImage:(CGImage *)a3 forTimestamp:(id)a4
{
}

- (double)movieScrubberTrackViewThumbnailAspectRatio:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained movieScrubberThumbnailAspectRatio:self];
  double v6 = v5;

  return v6;
}

- (double)movieScrubberTrackViewZoomAnimationDuration:(id)a3
{
  return self->_zoomAnimationDuration;
}

- (double)movieScrubberTrackViewZoomAnimationDelay:(id)a3
{
  return self->_zoomAnimationDelay;
}

- (void)movieScrubberTrackView:(id)a3 clampedSizeWidthDelta:(double)a4 actualSizeWidthDelta:(double)a5 originXDelta:(double)a6 minimumVisibleValue:(double)a7 maximumVisibleValue:(double)a8
{
  self->_double minimumValue = a7;
  self->_double maximumValue = a8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v13 = WeakRetained;
  if ((*((_WORD *)&self->_sliderFlags + 10) & 0x2000) != 0) {
    [WeakRetained movieScrubber:self willZoomToMinimumValue:self->_minimumValue maximumValue:self->_maximumValue];
  }
  [(UIMovieScrubberTrackView *)self->_trackView zoomAnimationDuration];
  double v15 = fmax(a4 / a5, 0.2) * v14;
  self->_double zoomAnimationDuration = v15;
  double v16 = v14 - v15;
  if (a4 >= 0.0) {
    double v17 = 0.0;
  }
  else {
    double v17 = v16;
  }
  self->_zoomAnimationDelaCGFloat y = v17;
  double zoomAnimationDuration = self->_zoomAnimationDuration;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __138__UIMovieScrubber_movieScrubberTrackView_clampedSizeWidthDelta_actualSizeWidthDelta_originXDelta_minimumVisibleValue_maximumVisibleValue___block_invoke;
  v20[3] = &unk_1E52E05A8;
  v20[4] = self;
  id v21 = v13;
  double v22 = a4;
  double v23 = a6;
  id v19 = v13;
  +[UIView animateWithDuration:4 delay:v20 options:0 animations:zoomAnimationDuration completion:v17];
}

uint64_t __138__UIMovieScrubber_movieScrubberTrackView_clampedSizeWidthDelta_actualSizeWidthDelta_originXDelta_minimumVisibleValue_maximumVisibleValue___block_invoke(uint64_t a1)
{
  if ((*(_WORD *)(*(void *)(a1 + 32) + 716) & 0x400) != 0)
  {
    double v3 = *(double *)(a1 + 48);
    double v4 = *(double *)(a1 + 56);
    *(float *)&double v3 = v3;
    *(float *)&double v4 = v4;
    objc_msgSend(*(id *)(a1 + 40), "movieScrubber:widthDelta:originXDelta:", v3, v4);
  }
  else
  {
    [*(id *)(a1 + 32) frame];
    [*(id *)(a1 + 32) setFrame:v2 + *(double *)(a1 + 56)];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(char *)(v5 + 704) < 0 && *(_DWORD *)(v5 + 708)
    || (double v6 = *(void **)(v5 + 456),
        [*(id *)(a1 + 32) value],
        objc_msgSend((id)v5, "thumbRectForValue:"),
        uint64_t result = objc_msgSend(v6, "setFrame:"),
        uint64_t v5 = *(void *)(a1 + 32),
        *(char *)(v5 + 704) < 0))
  {
    [(id)v5 _editingRectForStartTime:*(double *)(v5 + 648) endTime:*(double *)(v5 + 656)];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "setFrame:");
    id v8 = *(void **)(*(void *)(a1 + 32) + 472);
    return [v8 layoutSubviews];
  }
  return result;
}

- (void)movieScrubberTrackViewDidExpand:(id)a3
{
  if (*((unsigned char *)&self->_sliderFlags + 8))
  {
    *(unsigned char *)&self->_sliderFlags |= 0x20u;
    [(UIMovieScrubber *)self _setZoomAnimating:0];
  }
}

- (void)movieScrubberTrackViewDidCollapse:(id)a3
{
  *(unsigned char *)&self->_sliderFlags |= 0x20u;
  [(UIMovieScrubber *)self _setZoomAnimating:0];
  [(UIMovieScrubber *)self setRotationDisabled:0];
}

- (void)movieScrubberTrackViewWillBeginRequestingThumbnails:(id)a3
{
  if ((*((_WORD *)&self->_sliderFlags + 10) & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained movieScrubberWillBeginRequestingThumbnails:self];
  }
}

- (void)movieScrubberTrackViewDidFinishRequestingThumbnails:(id)a3
{
  if ((*((_WORD *)&self->_sliderFlags + 10) & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained movieScrubberDidFinishRequestingThumbnails:self];
  }
}

+ (id)timeStringForSeconds:(int)a3 forceFullWidthComponents:(BOOL)a4 isElapsed:(BOOL)a5
{
  return __CopyProgressStringForSeconds(a3, a4, a5);
}

- (double)zoomMinimumValue
{
  return self->_minimumValue;
}

- (double)zoomMaximumValue
{
  return self->_maximumValue;
}

- (BOOL)isZoomAnimating
{
  return (*((unsigned __int8 *)&self->_sliderFlags + 8) >> 1) & 1;
}

- (double)zoomDelay
{
  return self->_zoomDelay;
}

- (void)setZoomDelay:(double)a3
{
  self->_zoomDelaCGFloat y = a3;
}

- (BOOL)showTimeViews
{
  return self->_showTimeViews;
}

- (void)setShowTimeViews:(BOOL)a3
{
  self->_showTimeViews = a3;
}

- (double)maximumTrimLength
{
  return self->_maxTrimmedLength;
}

- (void)setMaximumTrimLength:(double)a3
{
  self->_double maxTrimmedLength = a3;
}

- (double)minimumTrimLength
{
  return self->_minTrimmedLength;
}

- (void)setMinimumTrimLength:(double)a3
{
  self->_double minTrimmedLength = a3;
}

- (double)edgeInset
{
  return self->_edgeInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_innerShadowImage, 0);
  objc_storeStrong((id *)&self->_fillImage, 0);
  objc_storeStrong((id *)&self->_remainingLabel, 0);
  objc_storeStrong((id *)&self->_elapsedLabel, 0);
  objc_storeStrong((id *)&self->_editingView, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
}

@end