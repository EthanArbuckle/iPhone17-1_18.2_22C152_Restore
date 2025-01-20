@interface UISnapshotView
- (BOOL)isEdgeAntialiasingEnabled;
- (BOOL)isVerticalStretchEnabled;
- (CGPoint)_contentOffset;
- (CGRect)_contentsCenterForEdgePadding:(UIEdgeInsets)a3 withContentSize:(CGSize)a4;
- (CGRect)_snapshotRect;
- (CGSize)_contentSize;
- (UIColor)edgePaddingColor;
- (UIEdgeInsets)_edgePadding;
- (UIEdgeInsets)edgeInsets;
- (UIEdgeInsets)edgePadding;
- (UISnapshotView)initWithFrame:(CGRect)a3;
- (UIView)_snapshotView;
- (UIView)shadowView;
- (void)_addEdgePaddingViewInRect:(CGRect)a3;
- (void)_drawEdges:(UIEdgeInsets)a3 withContentSize:(CGSize)a4;
- (void)_positionImageView;
- (void)_setContentOffset:(CGPoint)a3;
- (void)_setSnapshotRect:(CGRect)a3;
- (void)_updateContentsRect;
- (void)captureSnapshotOfView:(id)a3 withSnapshotType:(int)a4;
- (void)captureSnapshotRect:(CGRect)a3 fromView:(id)a4 withSnapshotType:(int)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setContentStretch:(CGRect)a3;
- (void)setEdgeAntialiasingEnabled:(BOOL)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setEdgePadding:(UIEdgeInsets)a3;
- (void)setEdgePaddingColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setShadowView:(id)a3;
- (void)setVerticalStretchEnabled:(BOOL)a3;
@end

@implementation UISnapshotView

- (UISnapshotView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISnapshotView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    [(UIView *)v3 bounds];
    v3->_imageView = -[UIView initWithFrame:](v4, "initWithFrame:");
    [(UISnapshotView *)v3 setEdgeAntialiasingEnabled:1];
    [(UIView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)dealloc
{
  [(UIView *)self->_imageView removeFromSuperview];

  self->_imageView = 0;
  [(UIView *)self->_shadowView removeFromSuperview];

  self->_shadowView = 0;
  self->_edgePaddingColor = 0;

  self->_edgePaddingViews = 0;
  v3.receiver = self;
  v3.super_class = (Class)UISnapshotView;
  [(UIView *)&v3 dealloc];
}

- (void)setEdgePadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_edgePadding.left
    || a3.top != self->_edgePadding.top
    || a3.right != self->_edgePadding.right
    || a3.bottom != self->_edgePadding.bottom)
  {
    self->_edgePadding = a3;
    [(UISnapshotView *)self _positionImageView];
  }
}

- (BOOL)isEdgeAntialiasingEnabled
{
  return (*((unsigned char *)self + 600) & 1) == 0;
}

- (void)setEdgeAntialiasingEnabled:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)self + 600);
  if (((v3 ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 600) = v3 & 0xFE | !a3;
    [(UISnapshotView *)self _positionImageView];
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_edgeInsets.left
    || a3.top != self->_edgeInsets.top
    || a3.right != self->_edgeInsets.right
    || a3.bottom != self->_edgeInsets.bottom)
  {
    self->_edgeInsets = a3;
    [(UISnapshotView *)self _positionImageView];
  }
}

- (void)_setContentOffset:(CGPoint)a3
{
  if (a3.x != self->_contentOffset.x || a3.y != self->_contentOffset.y)
  {
    self->_contentOffset = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (BOOL)isVerticalStretchEnabled
{
  return (*((unsigned char *)self + 600) & 2) == 0;
}

- (void)setVerticalStretchEnabled:(BOOL)a3
{
  if (a3) {
    char v4 = 0;
  }
  else {
    char v4 = 2;
  }
  *((unsigned char *)self + 600) = *((unsigned char *)self + 600) & 0xFD | v4;
  [(UIView *)self setNeedsLayout];
  [(UIView *)self layoutIfNeeded];
}

- (CGRect)_snapshotRect
{
  double x = self->_snapshotRect.origin.x;
  double y = self->_snapshotRect.origin.y;
  double width = self->_snapshotRect.size.width;
  double height = self->_snapshotRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setSnapshotRect:(CGRect)a3
{
  self->_snapshotRect = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)setShadowView:(id)a3
{
  shadowView = self->_shadowView;
  if (shadowView != a3)
  {
    [(UIView *)shadowView removeFromSuperview];

    objc_super v6 = (UIImageView *)a3;
    self->_shadowView = v6;
    if (v6)
    {
      [(UIView *)self addSubview:v6];
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UISnapshotView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(UIView *)self setNeedsLayout];
    [(UIView *)self layoutBelowIfNeeded];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UISnapshotView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(UIView *)self setNeedsLayout];
    [(UIView *)self layoutBelowIfNeeded];
  }
}

- (void)setContentStretch:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)UISnapshotView;
  -[UIView setContentStretch:](&v8, sel_setContentStretch_);
  -[CALayer setContentsCenter:]([(UIView *)self->_imageView layer], "setContentsCenter:", x, y, width, height);
}

- (void)_positionImageView
{
  [(UIView *)self setNeedsLayout];
  [(UIView *)self layoutBelowIfNeeded];
}

- (void)_updateContentsRect
{
  p_snapshotRect = &self->_snapshotRect;
  if (CGRectIsEmpty(self->_snapshotRect))
  {
    double width = self->_contentSize.width;
    double v36 = 1.0;
    double v38 = 0.0;
    double v5 = 0.0;
    double v6 = 1.0;
  }
  else
  {
    double width = self->_contentSize.width;
    double v6 = 1.0;
    double v5 = 0.0;
    double v36 = p_snapshotRect->size.width / width;
    double v38 = p_snapshotRect->origin.x / width;
  }
  double height = self->_contentSize.height;
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  [(UIView *)self->_imageView bounds];
  float64x2_t v13 = *(float64x2_t *)&self->_edgeInsets.top;
  double v15 = self->_contentSize.width;
  double v14 = self->_contentSize.height;
  if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(v13), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_edgeInsets.bottom))))))
  {
    double v16 = 1.0 / v15;
    double v17 = vmuld_lane_f64(v16, v13, 1);
    double v18 = 1.0 / v14;
    double v5 = 1.0 / v14 * v13.f64[0];
    double v19 = (width - left - right) * v16;
    double v6 = (height - top - bottom) * (1.0 / v14);
  }
  else
  {
    double v18 = 1.0 / v14;
    double v16 = 1.0 / v15;
    double v19 = v37;
    double v17 = v39;
  }
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  double v22 = y * v18;
  BOOL v23 = v12 < v14;
  if (y <= 0.0) {
    double v24 = y * v18;
  }
  else {
    double v24 = -(y * v18);
  }
  double v25 = v6 + v24;
  double v26 = v12 * v18;
  if (y <= 0.0) {
    double v27 = v22;
  }
  else {
    double v27 = 0.0;
  }
  if ((*(_DWORD *)&v23 & (*((unsigned __int8 *)self + 600) >> 1)) != 0) {
    double v28 = v26;
  }
  else {
    double v28 = v25;
  }
  double v29 = v5 - v27;
  double v30 = x * v16;
  if (x <= 0.0) {
    double v31 = x * v16;
  }
  else {
    double v31 = 0.0;
  }
  double v32 = v17 - v31;
  double v33 = -(x * v16);
  if (x > 0.0) {
    double v30 = v33;
  }
  double v34 = v19 + v30;
  v35 = [(UIView *)self->_imageView layer];
  -[CALayer setContentsRect:](v35, "setContentsRect:", v32, v29, v34, v28);
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)UISnapshotView;
  [(UIView *)&v30 layoutSubviews];
  double height = self->_contentSize.height;
  double top = self->_edgeInsets.top;
  double bottom = self->_edgeInsets.bottom;
  p_contentOffset = &self->_contentOffset;
  double y = self->_contentOffset.y;
  [(UISnapshotView *)self _edgePadding];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UIView *)self bounds];
  double left = self->_edgeInsets.left;
  double v18 = self->_contentBeyondBounds.left;
  double x = self->_contentOffset.x;
  double v21 = self->_contentOffset.y;
  double v22 = self->_contentBeyondBounds.bottom
      + self->_contentBeyondBounds.top
      + v13
      + v9
      + v19
      - self->_edgeInsets.top
      - self->_edgeInsets.bottom
      - v21;
  double v23 = -v21;
  if (v21 <= 0.0) {
    double v23 = self->_contentOffset.y;
  }
  double v24 = v23 + v22;
  if ((*((unsigned char *)self + 600) & 2) != 0 && v24 > self->_contentSize.height) {
    double v24 = height - top - bottom - fabs(y);
  }
  if (v21 <= 0.0) {
    double v21 = -0.0;
  }
  double v25 = self->_contentBeyondBounds.right + v18 + v15 + v11 + v16 - left - self->_edgeInsets.right;
  double v26 = -x;
  if (x <= 0.0) {
    double v26 = p_contentOffset->x;
  }
  double v27 = v25 + v26;
  double v28 = left - v11 - v18;
  if (x <= 0.0) {
    double v29 = -0.0;
  }
  else {
    double v29 = p_contentOffset->x;
  }
  -[UIView setFrame:](self->_imageView, "setFrame:", v28 + v29, self->_edgeInsets.top - v9 - self->_contentBeyondBounds.top + v21, v27, v24);
  [(UISnapshotView *)self _updateContentsRect];
}

- (UIEdgeInsets)_edgePadding
{
  double top = self->_edgePadding.top;
  if (*((unsigned char *)self + 600))
  {
    double left = self->_edgePadding.left;
    double bottom = self->_edgePadding.bottom;
    double right = self->_edgePadding.right;
  }
  else
  {
    double top = top + 1.0;
    double left = self->_edgePadding.left + 1.0;
    double bottom = self->_edgePadding.bottom + 1.0;
    double right = self->_edgePadding.right + 1.0;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_drawEdges:(UIEdgeInsets)a3 withContentSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (*((unsigned char *)self + 600)) {
    double v11 = 0.0;
  }
  else {
    double v11 = 1.0;
  }
  [(UIColor *)self->_edgePaddingColor set];
  if (top - v11 > 0.0) {
    UIRectFillUsingOperation(1, v11, v11, right + left + width - (v11 + v11), top - v11);
  }
  if (left - v11 > 0.0) {
    UIRectFillUsingOperation(1, v11, v11, left - v11, bottom + top + height - (v11 + v11));
  }
  if (bottom - v11 > 0.0) {
    UIRectFillUsingOperation(1, v11, top + height, right + left + width - (v11 + v11), bottom - v11);
  }
  if (right - v11 > 0.0) {
    UIRectFillUsingOperation(1, left + width, v11, right - v11, bottom + top + height - (v11 + v11));
  }
  if ((*((unsigned char *)self + 600) & 1) == 0)
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      double v13 = 0;
    }
    else {
      double v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    double v14 = right + left + width;
    v21.origin.double x = 0.0;
    v21.origin.double y = 0.0;
    v21.size.double height = 1.0;
    v21.size.double width = v14;
    CGContextClearRect(v13, v21);
    CGFloat v15 = bottom + top + height;
    v22.origin.double x = 0.0;
    v22.origin.double y = 0.0;
    v22.size.double width = 1.0;
    v22.size.double height = v15;
    CGContextClearRect(v13, v22);
    v23.origin.double y = v15 + -1.0;
    v23.origin.double x = 0.0;
    v23.size.double height = 1.0;
    v23.size.double width = v14;
    CGContextClearRect(v13, v23);
    uint64_t v17 = 0;
    double v18 = 1.0;
    CGFloat v19 = v15;
    double v16 = v14 + -1.0;
    CGContextClearRect(v13, *(CGRect *)(&v17 - 1));
  }
}

- (CGRect)_contentsCenterForEdgePadding:(UIEdgeInsets)a3 withContentSize:(CGSize)a4
{
  CGFloat v4 = a3.left / a4.width;
  CGFloat v5 = a3.top / a4.height;
  CGFloat v6 = (a4.width - a3.left - a3.right) / a4.width;
  double v7 = (a4.height - a3.top - a3.bottom) / a4.height;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.double height = v7;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (void)_addEdgePaddingViewInRect:(CGRect)a3
{
  CGFloat v4 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)v4 setBackgroundColor:self->_edgePaddingColor];
  [(NSMutableArray *)self->_edgePaddingViews addObject:v4];
  [(UIView *)self->_imageView addSubview:v4];
}

- (void)captureSnapshotRect:(CGRect)a3 fromView:(id)a4 withSnapshotType:(int)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v12 = +[UIView areAnimationsEnabled];
  [a4 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  self->_contentBeyondBounds.double top = fmax(v15 - y, 0.0);
  self->_contentBeyondBounds.double left = fmax(v13 - x, 0.0);
  self->_contentBeyondBounds.double bottom = fmax(y + height - (v15 + v19), 0.0);
  self->_contentBeyondBounds.double right = fmax(x + width - (v13 + v17), 0.0);
  [(UISnapshotView *)self _edgePadding];
  double v79 = v22;
  double rect = v21;
  double v77 = v23;
  double v78 = v24;
  uint64_t v25 = objc_msgSend((id)objc_msgSend(a4, "window"), "screen");
  id v26 = a4;
  if (v25) {
    id v26 = (id)[a4 window];
  }
  [v26 _currentScreenScale];
  CGFloat v76 = v27;
  +[UIView setAnimationsEnabled:0];
  [(NSMutableArray *)self->_edgePaddingViews makeObjectsPerformSelector:sel_removeFromSuperview];
  [(NSMutableArray *)self->_edgePaddingViews removeAllObjects];
  if (a5 == 2)
  {
    if (*((unsigned char *)self + 600)) {
      double v28 = 0.0;
    }
    else {
      double v28 = 1.0;
    }
    [(UISnapshotView *)self _edgePadding];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    [(UIView *)self->_imageView addSubview:a4];
    objc_msgSend(a4, "setFrame:", v32, v30, width, height);
    double v37 = width + v32;
    double v38 = v28 + v28;
    if (self->_edgePadding.top != 0.0) {
      -[UISnapshotView _addEdgePaddingViewInRect:](self, "_addEdgePaddingViewInRect:", v28, v28, v36 + v37 - v38, v30 - v28);
    }
    double v39 = height + v30;
    if (self->_edgePadding.left != 0.0) {
      -[UISnapshotView _addEdgePaddingViewInRect:](self, "_addEdgePaddingViewInRect:", v28, v28, v32 - v28, v34 + v39 - v38);
    }
    if (self->_edgePadding.bottom != 0.0) {
      -[UISnapshotView _addEdgePaddingViewInRect:](self, "_addEdgePaddingViewInRect:", v28, v39, v36 + v37 - v38, v34 - v28);
    }
    if (self->_edgePadding.right != 0.0) {
      -[UISnapshotView _addEdgePaddingViewInRect:](self, "_addEdgePaddingViewInRect:", v37, v28, v36 - v28, v34 + v39 - v38);
    }
    double v40 = 1.0;
    _UIGraphicsBeginImageContextWithOptions(0, 0, 1.0, 1.0, 1.0);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v42 = 0;
    }
    else {
      v42 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    double v52 = 0.0;
    v82.origin.double x = 0.0;
    v82.origin.double y = 0.0;
    v82.size.double width = 1.0;
    v82.size.double height = 1.0;
    CGContextClearRect(v42, v82);
    v43 = (__IOSurface *)(id)[_UIGraphicsGetImageFromCurrentImageContext(0) CGImage];
    UIGraphicsEndImageContext();
    self->_contentSize = (CGSize)*MEMORY[0x1E4F1DB30];
    double v53 = 0.0;
    double v54 = 1.0;
    double v55 = 1.0;
  }
  else if (a5 == 1)
  {
    v43 = -[UIView _createRenderingBufferFromRect:padding:gamut:]((__IOSurface *)a4, -1, x, y, width, height, rect, v77, v78, v79);
    unint64_t v44 = IOSurfaceGetWidth(v43);
    unint64_t v45 = IOSurfaceGetHeight(v43);
    if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_edgePadding.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_edgePadding.bottom))))))goto LABEL_19; {
    if ((*((unsigned char *)self + 600) & 1) == 0)
    }
    {
      v83.origin.double x = v14;
      v83.origin.double y = v16;
      v83.size.double width = v18;
      v83.size.double height = v20;
      v85.origin.double x = x;
      v85.origin.double y = y;
      v85.size.double width = width;
      v85.size.double height = height;
      if (!CGRectEqualToRect(v83, v85))
      {
LABEL_19:
        IOSurfaceLock(v43, 0, 0);
        BaseAddress = IOSurfaceGetBaseAddress(v43);
        size_t BytesPerRow = IOSurfaceGetBytesPerRow(v43);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        if ([+[UIDevice currentDevice] _supportsDeepColor])
        {
          uint64_t v49 = CGIOSurfaceContextCreate();
        }
        else
        {
          uint64_t v49 = (uint64_t)CGBitmapContextCreate(BaseAddress, v44, v45, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
        }
        v56 = (CGContext *)v49;
        CGColorSpaceRelease(DeviceRGB);
        if (v56)
        {
          CGContextTranslateCTM(v56, 0.0, (double)v45);
          CGContextScaleCTM(v56, v76, -v76);
          CGAffineTransformMakeScale(&v81, v76, -v76);
          CGContextSetBaseCTM();
          UIGraphicsPushContext(v56);
          -[UISnapshotView _drawEdges:withContentSize:](self, "_drawEdges:withContentSize:", rect, v77, v78, v79, width, height);
          v57 = (int *)GetContextStack(0);
          PopContextFromStack(v57);
          CGContextRelease(v56);
        }
        IOSurfaceUnlock(v43, 0, 0);
      }
    }
    double v55 = v76;
    self->_contentSize.double width = (double)v44 / v76;
    self->_contentSize.double height = (double)v45 / v76;
    -[UISnapshotView _contentsCenterForEdgePadding:withContentSize:](self, "_contentsCenterForEdgePadding:withContentSize:", rect, v77, v78, v79);
    double v52 = v58;
    double v53 = v59;
    double v54 = v60;
    double v40 = v61;
  }
  else
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, v79 + width + v77, v78 + height + rect, v76);
    -[UISnapshotView _drawEdges:withContentSize:](self, "_drawEdges:withContentSize:", rect, v77, v78, v79, width, height);
    v50 = GetContextStack(0);
    if (*(int *)v50 < 1) {
      v51 = 0;
    }
    else {
      v51 = (CGContext *)v50[3 * (*(_DWORD *)v50 - 1) + 1];
    }
    double v55 = v76;
    v84.origin.double x = v77;
    v84.origin.double y = rect;
    v84.size.double width = width;
    v84.size.double height = height;
    CGContextClipToRect(v51, v84);
    v62 = GetContextStack(0);
    if (*(int *)v62 < 1) {
      v63 = 0;
    }
    else {
      v63 = (CGContext *)v62[3 * (*(_DWORD *)v62 - 1) + 1];
    }
    CGContextTranslateCTM(v63, -x, -y);
    v64 = GetContextStack(0);
    if (*(int *)v64 < 1) {
      v65 = 0;
    }
    else {
      v65 = (CGContext *)v64[3 * (*(_DWORD *)v64 - 1) + 1];
    }
    CGContextTranslateCTM(v65, v77, rect);
    v66 = (void *)[a4 layer];
    v67 = GetContextStack(0);
    if (*(int *)v67 < 1) {
      uint64_t v68 = 0;
    }
    else {
      uint64_t v68 = v67[3 * (*(_DWORD *)v67 - 1) + 1];
    }
    [v66 renderInContext:v68];
    v43 = (__IOSurface *)(id)[_UIGraphicsGetImageFromCurrentImageContext(0) CGImage];
    CGFloat v69 = (double)CGImageGetWidth(v43) / v76;
    size_t v70 = CGImageGetHeight(v43);
    self->_contentSize.double width = v69;
    self->_contentSize.double height = (double)v70 / v76;
    -[UISnapshotView _contentsCenterForEdgePadding:withContentSize:](self, "_contentsCenterForEdgePadding:withContentSize:", rect, v77, v78, v79, v69);
    double v52 = v71;
    double v53 = v72;
    double v54 = v73;
    double v40 = v74;
    UIGraphicsEndImageContext();
  }
  BOOL v75 = a5 == 2;
  [(CALayer *)[(UIView *)self->_imageView layer] setContents:v43];
  -[CALayer setContentsCenter:]([(UIView *)self->_imageView layer], "setContentsCenter:", v52, v53, v54, v40);
  [(UIView *)self->_imageView setContentScaleFactor:v55];
  [(UIView *)self layoutBelowIfNeeded];
  [(UISnapshotView *)self _updateContentsRect];
  [(CALayer *)[(UIView *)self->_imageView layer] setShouldRasterize:v75];
  [(CALayer *)[(UIView *)self->_imageView layer] setFrozen:v75];

  +[UIView setAnimationsEnabled:v12];
}

- (void)captureSnapshotOfView:(id)a3 withSnapshotType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [a3 bounds];
  -[UISnapshotView captureSnapshotRect:fromView:withSnapshotType:](self, "captureSnapshotRect:fromView:withSnapshotType:", a3, v4);
}

- (UIEdgeInsets)edgePadding
{
  double top = self->_edgePadding.top;
  double left = self->_edgePadding.left;
  double bottom = self->_edgePadding.bottom;
  double right = self->_edgePadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)_snapshotView
{
  return self->_imageView;
}

- (CGSize)_contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)_contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIColor)edgePaddingColor
{
  return self->_edgePaddingColor;
}

- (void)setEdgePaddingColor:(id)a3
{
}

- (UIView)shadowView
{
  return &self->_shadowView->super;
}

@end