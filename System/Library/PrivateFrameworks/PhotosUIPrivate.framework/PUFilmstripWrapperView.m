@interface PUFilmstripWrapperView
- (BOOL)isAnimating;
- (BOOL)isExpanded;
- (CGRect)visibleRect;
- (CGSize)expandedSize;
- (NSNumber)anchoredLeft;
- (PUFilmstripView)filmstripView;
- (PUFilmstripWrapperView)initWithFrame:(CGRect)a3;
- (UIView)backgroundView;
- (UIView)clippingView;
- (void)layoutSubviews;
- (void)setAnchoredLeft:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedSize:(CGSize)a3;
- (void)setFilmstripView:(id)a3;
- (void)setFilmstripView:(id)a3 leavingPreviousViewInPlace:(BOOL)a4;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PUFilmstripWrapperView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_anchoredLeft, 0);
  objc_storeStrong((id *)&self->_filmstripView, 0);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setAnchoredLeft:(id)a3
{
}

- (NSNumber)anchoredLeft
{
  return self->_anchoredLeft;
}

- (CGSize)expandedSize
{
  double width = self->_expandedSize.width;
  double height = self->_expandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (PUFilmstripView)filmstripView
{
  return self->_filmstripView;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setBackgroundView:(id)a3
{
  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  v8 = v5;
  if (backgroundView != v5)
  {
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v7 = [(PUFilmstripWrapperView *)self clippingView];
    [v7 addSubview:v8];
  }
}

- (void)setFilmstripView:(id)a3 leavingPreviousViewInPlace:(BOOL)a4
{
  v7 = (PUFilmstripView *)a3;
  filmstripView = self->_filmstripView;
  if (filmstripView != v7)
  {
    v23 = v7;
    if (!a4) {
      [(PUFilmstripView *)filmstripView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_filmstripView, a3);
    v9 = [(PUFilmstripWrapperView *)self clippingView];
    [v9 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(PUFilmstripView *)v23 desiredClippingOutset];
    CGFloat v19 = v18 + v18;
    [(PUFilmstripView *)v23 desiredClippingOutset];
    CGFloat v21 = v20 + v20;
    v25.origin.double x = v11;
    v25.origin.double y = v13;
    v25.size.double width = v15;
    v25.size.double height = v17;
    CGRect v26 = CGRectInset(v25, v19, v21);
    -[PUFilmstripView setFrame:](v23, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);

    v22 = [(PUFilmstripWrapperView *)self clippingView];
    [v22 addSubview:v23];

    [(PUFilmstripWrapperView *)self setNeedsLayout];
    [(PUFilmstripWrapperView *)self layoutIfNeeded];
    v7 = v23;
  }
}

- (void)setFilmstripView:(id)a3
{
}

- (void)layoutSubviews
{
  *(void *)&recta.origin.double y = self;
  *(void *)&recta.size.double width = PUFilmstripWrapperView;
  [(CGFloat *)(objc_super *)&recta.origin.y layoutSubviews];
  [(PUFilmstripWrapperView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v11 = [(PUFilmstripWrapperView *)self filmstripView];
  double v12 = [(PUFilmstripWrapperView *)self clippingView];
  [v11 desiredClippingOutset];
  double v14 = v13;
  BOOL v15 = [(PUFilmstripWrapperView *)self isExpanded];
  anchoredLeft = self->_anchoredLeft;
  if (v15)
  {
    self->_anchoredLeft = 0;

    [(PUFilmstripWrapperView *)self expandedSize];
    if (v17 >= v8) {
      double v18 = v17;
    }
    else {
      double v18 = v8;
    }
    v59.origin.double x = v4;
    v59.origin.double y = v6;
    v59.size.double width = v8;
    v59.size.double height = v10;
    CGRect v60 = CGRectInset(v59, v14 * -2.0, v14 * -2.0);
    objc_msgSend(v12, "setFrame:", v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
    double v19 = 0.0;
    double v20 = v10;
    double v21 = 0.0;
  }
  else
  {
    if (!anchoredLeft)
    {
      [v11 visibleRect];
      v57.double x = 0.0;
      v57.double y = 0.0;
      BOOL v22 = CGRectContainsPoint(v61, v57);
      [v11 visibleRect];
      recta.origin.double x = v23;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      [v11 bounds];
      v58.double x = CGRectGetMaxX(v62) + -1.0;
      v58.double y = 0.0;
      v63.origin.double x = recta.origin.x;
      v63.origin.double y = v25;
      v63.size.double width = v27;
      v63.size.double height = v29;
      BOOL v30 = CGRectContainsPoint(v63, v58);
      v31 = self->_anchoredLeft;
      if (!v30 || v22) {
        v32 = (NSNumber *)MEMORY[0x1E4F1CC38];
      }
      else {
        v32 = (NSNumber *)MEMORY[0x1E4F1CC28];
      }
      self->_anchoredLeft = v32;
    }
    v64.origin.double x = v4;
    v64.origin.double y = v6;
    v64.size.double width = v8;
    v64.size.double height = v10;
    CGRect v65 = CGRectInset(v64, 0.0, v14 * -2.0);
    objc_msgSend(v12, "setFrame:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    BOOL v33 = [(NSNumber *)self->_anchoredLeft BOOLValue];
    [v11 frame];
    -[PUFilmstripWrapperView convertRect:fromView:](self, "convertRect:fromView:", v12);
    double v18 = v34;
    double v21 = v8 - v34;
    if (v33) {
      double v21 = 0.0;
    }
  }
  objc_msgSend(v12, "convertRect:fromView:", self, v21, v19, v18, v20);
  objc_msgSend(v11, "setFrame:");
  objc_msgSend(v12, "convertRect:fromView:", self, v4, v6, v8, v10);
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  v43 = [(PUFilmstripWrapperView *)self backgroundView];
  objc_msgSend(v43, "setFrame:", v36, v38, v40, v42);

  [(PUFilmstripWrapperView *)self visibleRect];
  objc_msgSend(v11, "convertRect:fromView:", self);
  double x = v44;
  double y = v46;
  double width = v48;
  double height = v50;
  if ([(PUFilmstripWrapperView *)self isAnimating])
  {
    [v11 visibleRect];
    v68.origin.double x = v52;
    v68.origin.double y = v53;
    v68.size.double width = v54;
    v68.size.double height = v55;
    v66.origin.double x = x;
    v66.origin.double y = y;
    v66.size.double width = width;
    v66.size.double height = height;
    CGRect v67 = CGRectUnion(v66, v68);
    double x = v67.origin.x;
    double y = v67.origin.y;
    double width = v67.size.width;
    double height = v67.size.height;
  }
  objc_msgSend(v11, "setVisibleRect:", x, y, width, height);
}

- (void)setExpandedSize:(CGSize)a3
{
  if (self->_expandedSize.width != a3.width || self->_expandedSize.height != a3.height)
  {
    self->_expandedSize = a3;
    [(PUFilmstripWrapperView *)self setNeedsLayout];
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_isExpanded != a3)
  {
    self->_isExpanded = a3;
    [(PUFilmstripWrapperView *)self setNeedsLayout];
  }
}

- (void)setVisibleRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_visibleRect = &self->_visibleRect;
  if (!CGRectEqualToRect(self->_visibleRect, a3))
  {
    p_visibleRect->origin.CGFloat x = x;
    p_visibleRect->origin.CGFloat y = y;
    p_visibleRect->size.CGFloat width = width;
    p_visibleRect->size.CGFloat height = height;
    [(PUFilmstripWrapperView *)self setNeedsLayout];
  }
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    [(PUFilmstripWrapperView *)self setNeedsLayout];
  }
}

- (PUFilmstripWrapperView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUFilmstripWrapperView;
  double v3 = -[PUFilmstripWrapperView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PUFilmstripWrapperView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    clippingView = v3->_clippingView;
    v3->_clippingView = (UIView *)v5;

    double v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v3->_clippingView setBackgroundColor:v7];

    [(UIView *)v3->_clippingView setClipsToBounds:1];
    [(UIView *)v3->_clippingView setAutoresizingMask:18];
    [(PUFilmstripWrapperView *)v3 addSubview:v3->_clippingView];
  }
  return v3;
}

@end