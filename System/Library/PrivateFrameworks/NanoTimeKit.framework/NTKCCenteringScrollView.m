@interface NTKCCenteringScrollView
- (CGRect)cropRect;
- (CGSize)minimumDisplaySize;
- (NTKCCenteringScrollView)initWithFrame:(CGRect)a3;
- (NTKCCenteringScrollViewDelegate)ntk_delegate;
- (UIView)centeredView;
- (double)cropRectCushion;
- (double)maximumZoomRatio;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)_centerOnCrop;
- (void)_updateCrop;
- (void)_updateInsets;
- (void)_updateZoomScales;
- (void)safeAreaInsetsDidChange;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setCenteredView:(id)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMaximumZoomRatio:(double)a3;
- (void)setMinimumDisplaySize:(CGSize)a3;
- (void)setMinimumDisplaySize:(CGSize)a3 withCropRectCushion:(double)a4;
- (void)setNtk_delegate:(id)a3;
@end

@implementation NTKCCenteringScrollView

- (NTKCCenteringScrollView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKCCenteringScrollView;
  v3 = -[NTKCCenteringScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NTKCCenteringScrollView *)v3 setAlwaysBounceVertical:1];
    [(NTKCCenteringScrollView *)v4 setAlwaysBounceHorizontal:1];
    [(NTKCCenteringScrollView *)v4 setShowsVerticalScrollIndicator:0];
    [(NTKCCenteringScrollView *)v4 setShowsHorizontalScrollIndicator:0];
    [(NTKCCenteringScrollView *)v4 setBouncesZoom:1];
    [(NTKCCenteringScrollView *)v4 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    [(NTKCCenteringScrollView *)v4 setDelegate:v4];
    v5 = [MEMORY[0x1E4FB1618] blackColor];
    [(NTKCCenteringScrollView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)setCenteredView:(id)a3
{
  v5 = (UIView *)a3;
  p_centeredView = &self->_centeredView;
  centeredView = self->_centeredView;
  if (centeredView != v5)
  {
    [(UIView *)centeredView removeFromSuperview];
    objc_storeStrong((id *)&self->_centeredView, a3);
    v8 = *p_centeredView;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v12[0] = *MEMORY[0x1E4F1DAB8];
    v12[1] = v9;
    v12[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)v8 setTransform:v12];
    [(NTKCCenteringScrollView *)self addSubview:*p_centeredView];
    [(UIView *)*p_centeredView bounds];
    -[NTKCCenteringScrollView setContentSize:](self, "setContentSize:", v10, v11);
    [(NTKCCenteringScrollView *)self _updateZoomScales];
    [(NTKCCenteringScrollView *)self _updateInsets];
    [(NTKCCenteringScrollView *)self _centerOnCrop];
  }
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_cropRect = &self->_cropRect;
  if (!CGRectEqualToRect(a3, self->_cropRect))
  {
    p_cropRect->origin.CGFloat x = x;
    p_cropRect->origin.CGFloat y = y;
    p_cropRect->size.CGFloat width = width;
    p_cropRect->size.CGFloat height = height;
    CGSize size = p_cropRect->size;
    self->_originalCrop.origin = p_cropRect->origin;
    self->_originalCrop.CGSize size = size;
    [(NTKCCenteringScrollView *)self _centerOnCrop];
  }
}

- (void)setMinimumDisplaySize:(CGSize)a3
{
}

- (void)setMinimumDisplaySize:(CGSize)a3 withCropRectCushion:(double)a4
{
  self->_minimumDisplaySize = a3;
  if (a4 > 0.0 && self->_cropRectCushion != a4) {
    self->_cropRectCushion = a4;
  }
  [(NTKCCenteringScrollView *)self _updateZoomScales];
  [(NTKCCenteringScrollView *)self _updateInsets];
  [(NTKCCenteringScrollView *)self _centerOnCrop];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCCenteringScrollView;
  -[NTKCCenteringScrollView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(NTKCCenteringScrollView *)self _updateZoomScales];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCCenteringScrollView;
  -[NTKCCenteringScrollView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(NTKCCenteringScrollView *)self _updateZoomScales];
}

- (void)setMaximumZoomRatio:(double)a3
{
  if (self->_maximumZoomRatio != a3)
  {
    self->_maximumZoomRatio = fmax(a3, 1.0);
    [(NTKCCenteringScrollView *)self _updateZoomScales];
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_centeredView;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5 = [(NTKCCenteringScrollView *)self ntk_delegate];
  [v5 scrollViewWillBeginInteraction:self];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(NTKCCenteringScrollView *)self ntk_delegate];
  [v4 scrollViewWillBeginInteraction:self];
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  [(NTKCCenteringScrollView *)self _updateCrop];
  id v6 = [(NTKCCenteringScrollView *)self ntk_delegate];
  [v6 scrollViewDidSettleFromInteracting:self];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    long long v9 = v6;
    [(NTKCCenteringScrollView *)self _updateCrop];
    char v7 = [v9 isZoomBouncing];
    id v6 = v9;
    if ((v7 & 1) == 0)
    {
      v8 = [(NTKCCenteringScrollView *)self ntk_delegate];
      [v8 scrollViewDidSettleFromInteracting:self];

      id v6 = v9;
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  [(NTKCCenteringScrollView *)self _updateCrop];
  char v5 = [v4 isZoomBouncing];

  if ((v5 & 1) == 0)
  {
    id v6 = [(NTKCCenteringScrollView *)self ntk_delegate];
    [v6 scrollViewDidSettleFromInteracting:self];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = [(NTKCCenteringScrollView *)self ntk_delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    [(NTKCCenteringScrollView *)self _updateCrop];
    id v6 = [(NTKCCenteringScrollView *)self ntk_delegate];
    [v6 scrollViewDidScroll:self];
  }
}

- (void)_updateZoomScales
{
  double width = self->_minimumDisplaySize.width;
  double height = self->_minimumDisplaySize.height;
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (width == *MEMORY[0x1E4F1DB30] && height == v6)
  {
    [(NTKCCenteringScrollView *)self bounds];
    double v10 = v11;
    double v9 = v12;
  }
  else
  {
    double v8 = self->_cropRectCushion + 1.0;
    double v9 = height * v8;
    double v10 = width * v8;
  }
  [(UIView *)self->_centeredView bounds];
  if (v13 == v5 && v14 == v6)
  {
    [(NTKCCenteringScrollView *)self setMinimumZoomScale:1.0];
    double maximumZoomRatio = self->_maximumZoomRatio;
  }
  else
  {
    if (v10 / v13 >= v9 / v14) {
      double v16 = v10 / v13;
    }
    else {
      double v16 = v9 / v14;
    }
    [(NTKCCenteringScrollView *)self setMinimumZoomScale:v16];
    double maximumZoomRatio = v16 * self->_maximumZoomRatio;
  }
  [(NTKCCenteringScrollView *)self setMaximumZoomScale:maximumZoomRatio];
}

- (void)_updateInsets
{
  p_minimumDisplaySize = &self->_minimumDisplaySize;
  BOOL v3 = self->_minimumDisplaySize.width == *MEMORY[0x1E4F1DB30]
    && self->_minimumDisplaySize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (!v3 && self->_centeredView)
  {
    [(NTKCCenteringScrollView *)self zoomScale];
    double v37 = v5;
    [(NTKCCenteringScrollView *)self setZoomScale:1.0];
    CGFloat v6 = *MEMORY[0x1E4F1DAD8];
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(NTKCCenteringScrollView *)self bounds];
    CGFloat v33 = v9;
    CGFloat v34 = v8;
    UIRectCenteredIntegralRectScale();
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v30 = v14;
    CGFloat v17 = v16;
    [(NTKCCenteringScrollView *)self safeAreaInsets];
    double v19 = v18;
    [(NTKCCenteringScrollView *)self safeAreaInsets];
    double v21 = v19 - v20;
    double v32 = v19 - v20;
    v39.origin.CGFloat x = v11;
    v39.origin.CGFloat y = v13;
    v39.size.double width = v15;
    v39.size.double height = v17;
    double MinY = CGRectGetMinY(v39);
    [(NTKCCenteringScrollView *)self _systemContentInset];
    CGFloat v36 = v21 + MinY - v23;
    v40.origin.CGFloat x = v11;
    CGFloat v31 = v17;
    v40.origin.CGFloat y = v13;
    v40.size.double width = v15;
    v40.size.double height = v17;
    double MinX = CGRectGetMinX(v40);
    v41.origin.CGFloat x = v6;
    v41.origin.CGFloat y = v7;
    v41.size.double width = v34;
    v41.size.double height = v33;
    double Height = CGRectGetHeight(v41);
    v42.origin.CGFloat x = v11;
    v42.origin.CGFloat y = v13;
    v42.size.double width = v30;
    v42.size.double height = v17;
    double v25 = Height - CGRectGetMaxY(v42);
    [(NTKCCenteringScrollView *)self _systemContentInset];
    CGFloat v27 = v25 - v26 - v32;
    v43.origin.CGFloat x = v6;
    v43.origin.CGFloat y = v7;
    v43.size.double width = v34;
    v43.size.double height = v33;
    double Width = CGRectGetWidth(v43);
    v44.origin.CGFloat x = v11;
    v44.size.double height = v31;
    v44.origin.CGFloat y = v13;
    v44.size.double width = v30;
    CGFloat MaxX = CGRectGetMaxX(v44);
    self->_minimumDisplayInsets.top = v36;
    self->_minimumDisplayInsets.left = MinX;
    self->_minimumDisplayInsets.bottom = v27;
    self->_minimumDisplayInsets.right = Width - MaxX;
    -[NTKCCenteringScrollView setContentInset:](self, "setContentInset:", v36 - self->_cropRectCushion * p_minimumDisplaySize->height * 0.5, MinX - p_minimumDisplaySize->width * self->_cropRectCushion * 0.5, v27 - self->_cropRectCushion * p_minimumDisplaySize->height * 0.5, Width - MaxX - p_minimumDisplaySize->width * self->_cropRectCushion * 0.5);
    [(NTKCCenteringScrollView *)self setZoomScale:v37];
  }
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCCenteringScrollView;
  [(NTKCCenteringScrollView *)&v3 safeAreaInsetsDidChange];
  [(NTKCCenteringScrollView *)self _updateInsets];
  [(NTKCCenteringScrollView *)self _updateCrop];
  [(NTKCCenteringScrollView *)self _centerOnCrop];
}

- (void)_centerOnCrop
{
  p_originalCrop = &self->_originalCrop;
  if (CGRectIsEmpty(self->_originalCrop)
    || (self->_minimumDisplaySize.width == *MEMORY[0x1E4F1DB30]
      ? (BOOL v4 = self->_minimumDisplaySize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      : (BOOL v4 = 0),
        v4 || !self->_centeredView))
  {
    [(NTKCCenteringScrollView *)self setUserInteractionEnabled:0];
  }
  else
  {
    [(NTKCCenteringScrollView *)self setUserInteractionEnabled:1];
    double width = self->_minimumDisplaySize.width;
    CGFloat v6 = CGRectGetWidth(*p_originalCrop);
    double height = self->_minimumDisplaySize.height;
    double v8 = width / v6;
    double v9 = height / CGRectGetHeight(*p_originalCrop);
    if (v8 >= v9) {
      double v8 = v9;
    }
    [(NTKCCenteringScrollView *)self setZoomScale:v8];
    double v10 = -(self->_minimumDisplayInsets.left - CGRectGetMinX(*p_originalCrop) * v8);
    double v11 = -(self->_minimumDisplayInsets.top - CGRectGetMinY(*p_originalCrop) * v8);
    [(NTKCCenteringScrollView *)self _systemContentInset];
    -[NTKCCenteringScrollView setContentOffset:](self, "setContentOffset:", v10, v11 - v12);
  }
}

- (void)_updateCrop
{
  [(NTKCCenteringScrollView *)self zoomScale];
  uint64_t v12 = v3;
  double top = self->_minimumDisplayInsets.top;
  double left = self->_minimumDisplayInsets.left;
  [(NTKCCenteringScrollView *)self contentOffset];
  double v8 = top + v7;
  CGFloat v9 = (left + v6) / *(double *)&v12;
  [(NTKCCenteringScrollView *)self _systemContentInset];
  CGSize v11 = (CGSize)vdivq_f64((float64x2_t)self->_minimumDisplaySize, (float64x2_t)vdupq_lane_s64(v12, 0));
  self->_cropRect.origin.CGFloat x = v9;
  self->_cropRect.origin.CGFloat y = (v8 + v10) / *(double *)&v12;
  self->_cropRect.CGSize size = v11;
}

- (NTKCCenteringScrollViewDelegate)ntk_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ntk_delegate);
  return (NTKCCenteringScrollViewDelegate *)WeakRetained;
}

- (void)setNtk_delegate:(id)a3
{
}

- (UIView)centeredView
{
  return self->_centeredView;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)cropRectCushion
{
  return self->_cropRectCushion;
}

- (CGSize)minimumDisplaySize
{
  double width = self->_minimumDisplaySize.width;
  double height = self->_minimumDisplaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)maximumZoomRatio
{
  return self->_maximumZoomRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredView, 0);
  objc_destroyWeak((id *)&self->_ntk_delegate);
}

@end