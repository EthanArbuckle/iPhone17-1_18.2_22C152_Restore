@interface UIView
+ (BOOL)tsaxView:(id)a3 isDescendantOfView:(id)a4;
+ (void)performBlockWithActionsAndAnimationsDisabled:(id)a3;
- (BOOL)isAncestorScrollViewDragging;
- (BOOL)tsaxServesAsContainingParentForOrdering;
- (CGPoint)tsaxFramePointFromBoundsPoint:(CGPoint)a3;
- (CGRect)tsaxFrameFromBounds:(CGRect)a3;
- (CGSize)frameSize;
- (double)frameHeight;
- (double)frameWidth;
- (double)frameY;
- (double)scaleNeededToFill:(CGRect)a3;
- (double)scaleNeededToFit:(CGRect)a3;
- (double)tsaxScreenScale;
- (id)stateRestoreBlock;
- (id)tsaxParentFindReplaceController;
- (void)animateToFrame:(CGRect)a3 duration:(double)a4 hasInitialScale:(BOOL)a5 fit:(BOOL)a6 setFinalFrame:(BOOL)a7 completion:(id)a8;
- (void)centerHorizontallyInSuperview;
- (void)centerInSuperview;
- (void)hideAnimated:(BOOL)a3 completion:(id)a4;
- (void)offset:(CGPoint)a3;
- (void)scale:(double)a3 aroundAnchorPoint:(CGPoint)a4 afterOffset:(CGPoint)a5;
- (void)scale:(double)a3 aroundBoundsPoint:(CGPoint)a4 afterOffset:(CGPoint)a5;
- (void)scaleToFill:(CGRect)a3;
- (void)scaleToFit:(CGRect)a3;
- (void)setFrameAndScaleToFitCurrentSize:(CGRect)a3 layoutAfterSetFrame:(id)a4;
- (void)setFrameHeight:(double)a3;
- (void)setFrameOrigin:(CGPoint)a3;
- (void)setFrameSize:(CGSize)a3;
- (void)setFrameWidth:(double)a3;
- (void)setFrameX:(double)a3;
- (void)setFrameY:(double)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setOrigin:(CGPoint)a3;
- (void)setStateRestoreBlock:(id)a3;
- (void)showAnimated:(BOOL)a3 completion:(id)a4;
- (void)th_restoreState;
- (void)tsaxSetParentFindReplaceController:(id)a3;
- (void)tsaxSetServesAsContainingParentForOrdering:(BOOL)a3;
@end

@implementation UIView

- (void)setFrameOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:", x, y);
}

- (void)setFrameSize:(CGSize)a3
{
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:");
}

- (CGSize)frameSize
{
  [(UIView *)self frame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setFrameX:(double)a3
{
  [(UIView *)self frame];

  [(UIView *)self setFrame:a3];
}

- (void)setFrameY:(double)a3
{
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:");
}

- (double)frameY
{
  [(UIView *)self frame];
  return v2;
}

- (void)setFrameWidth:(double)a3
{
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:");
}

- (double)frameWidth
{
  [(UIView *)self frame];
  return v2;
}

- (void)setFrameHeight:(double)a3
{
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:");
}

- (double)frameHeight
{
  [(UIView *)self frame];
  return v2;
}

- (void)offset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self frame];
  CGRect v8 = CGRectOffset(v7, x, y);

  -[UIView setFrame:](self, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
}

- (void)setOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self frame];

  -[UIView setFrame:](self, "setFrame:", x, y);
}

- (void)centerHorizontallyInSuperview
{
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [[(UIView *)self superview] bounds];
  double v10 = floor((v9 - v6) * 0.5);

  -[UIView setFrame:](self, "setFrame:", v10, v4, v6, v8);
}

- (void)centerInSuperview
{
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [[(UIView *)self superview] bounds];
  double v8 = floor((v7 - v4) * 0.5);
  [[(UIView *)self superview] bounds];
  double v10 = floor((v9 - v6) * 0.5);

  -[UIView setFrame:](self, "setFrame:", v8, v10, v4, v6);
}

- (double)scaleNeededToFit:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(UIView *)self bounds];

  return THScaleNeededToFitSizeInSize(v5, v6, width, height);
}

- (void)scaleToFit:(CGRect)a3
{
  -[UIView scaleNeededToFit:](self, "scaleNeededToFit:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGAffineTransformMakeScale(&v6, v4, v4);
  CGAffineTransform v5 = v6;
  [(UIView *)self setTransform:&v5];
}

- (double)scaleNeededToFill:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(UIView *)self bounds];

  return THScaleNeededToFillSizeInSize(v5, v6, width, height);
}

- (void)scaleToFill:(CGRect)a3
{
  -[UIView scaleNeededToFill:](self, "scaleNeededToFill:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGAffineTransformMakeScale(&v6, v4, v4);
  CGAffineTransform v5 = v6;
  [(UIView *)self setTransform:&v5];
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a3;
  if (a4)
  {
    [(UIView *)self setHidden:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_3B368;
    v16[3] = &unk_457818;
    BOOL v17 = v6;
    v16[4] = self;
    v16[5] = a5;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_3B3C8;
    v14[3] = &unk_457278;
    v14[4] = self;
    BOOL v15 = v6;
    unsigned __int8 v8 = [(CALayer *)[(UIView *)self layer] shouldRasterize];
    [(CALayer *)[(UIView *)self layer] setShouldRasterize:1];
    TSUScreenScale();
    [(CALayer *)[(UIView *)self layer] setRasterizationScale:v9];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_3B3E4;
    v12[3] = &unk_457840;
    v12[4] = self;
    v12[5] = v16;
    unsigned __int8 v13 = v8;
    +[UIView animateWithDuration:4 delay:v14 options:v12 animations:0.25 completion:0.0];
  }
  else
  {
    [(UIView *)self setHidden:a3];
    double v10 = 1.0;
    if (v6) {
      double v10 = 0.0;
    }
    [(UIView *)self setAlpha:v10];
    if (a5)
    {
      v11 = (void (*)(id, uint64_t))*((void *)a5 + 2);
      v11(a5, 1);
    }
  }
}

+ (void)performBlockWithActionsAndAnimationsDisabled:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_3B4A8;
  v3[3] = &unk_457868;
  v3[4] = a3;
  +[UIView performWithoutAnimation:v3];
}

- (void)setFrameAndScaleToFitCurrentSize:(CGRect)a3 layoutAfterSetFrame:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  -[UIView setFrame:](self, "setFrame:", x, y, width, height);
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
  v20.origin.double x = v11;
  v20.origin.double y = v13;
  v20.size.double width = v15;
  v20.size.double height = v17;
  double MidX = CGRectGetMidX(v20);
  v21.origin.double x = v11;
  v21.origin.double y = v13;
  v21.size.double width = v15;
  v21.size.double height = v17;
  -[UIView setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v21));

  -[UIView scaleToFit:](self, "scaleToFit:", v11, v13, v15, v17);
}

- (void)animateToFrame:(CGRect)a3 duration:(double)a4 hasInitialScale:(BOOL)a5 fit:(BOOL)a6 setFinalFrame:(BOOL)a7 completion:(id)a8
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3052000000;
  v22[3] = sub_3B7F8;
  v22[4] = sub_3B808;
  v22[5] = self;
  memset(&v21, 0, sizeof(v21));
  if (a5)
  {
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v21.c = v15;
    *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    if (a6) {
      -[UIView scaleNeededToFit:](self, "scaleNeededToFit:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    }
    else {
      -[UIView scaleNeededToFill:](self, "scaleNeededToFill:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    }
    CGAffineTransformMakeScale(&v21, v16, v16);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  CGAffineTransform v20 = v21;
  v19[2] = sub_3B814;
  v19[3] = &unk_457890;
  v19[4] = v22;
  *(CGFloat *)&v19[5] = x;
  *(CGFloat *)&v19[6] = y;
  *(CGFloat *)&v19[7] = width;
  *(CGFloat *)&v19[8] = height;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_3B8A0;
  v17[3] = &unk_4578B8;
  BOOL v18 = a7;
  *(CGFloat *)&v17[6] = x;
  *(CGFloat *)&v17[7] = y;
  *(CGFloat *)&v17[8] = width;
  *(CGFloat *)&v17[9] = height;
  v17[4] = a8;
  v17[5] = v22;
  +[UIView animateWithDuration:v19 animations:v17 completion:a4];
  _Block_object_dispose(v22, 8);
}

- (void)scale:(double)a3 aroundBoundsPoint:(CGPoint)a4 afterOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  memset(&v15, 0, sizeof(v15));
  double v11 = [(UIView *)self layer];
  if (v11) {
    -[CALayer transformToScale:aroundBoundsPoint:afterOffset:](v11, "transformToScale:aroundBoundsPoint:afterOffset:", a3, v8, v7, x, y);
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CATransform3D v13 = v15;
  CATransform3DGetAffineTransform(&v14, &v13);
  CGAffineTransform v12 = v14;
  [(UIView *)self setTransform:&v12];
}

- (void)scale:(double)a3 aroundAnchorPoint:(CGPoint)a4 afterOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  memset(&v15, 0, sizeof(v15));
  double v11 = [(UIView *)self layer];
  if (v11) {
    -[CALayer transformToScale:aroundAnchorPoint:afterOffset:](v11, "transformToScale:aroundAnchorPoint:afterOffset:", a3, v8, v7, x, y);
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CATransform3D v13 = v15;
  CATransform3DGetAffineTransform(&v14, &v13);
  CGAffineTransform v12 = v14;
  [(UIView *)self setTransform:&v12];
}

- (BOOL)isAncestorScrollViewDragging
{
  double v2 = [(UIView *)self superview];

  return [(UIView *)v2 isAncestorScrollViewDragging];
}

- (id)stateRestoreBlock
{
  return objc_getAssociatedObject(self, &off_459A20);
}

- (void)setStateRestoreBlock:(id)a3
{
}

- (void)th_restoreState
{
  if (![(UIView *)self stateRestoreBlock]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIView(THStateStateRestoreBlock) th_restoreState]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m") lineNumber:257 description:@"invalid nil value for '%s'", "self.stateRestoreBlock"];
  }
  if ([(UIView *)self stateRestoreBlock])
  {
    (*((void (**)(void))[(UIView *)self stateRestoreBlock] + 2))();
    [(UIView *)self setStateRestoreBlock:0];
  }
}

- (BOOL)tsaxServesAsContainingParentForOrdering
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738D3);
}

- (void)tsaxSetServesAsContainingParentForOrdering:(BOOL)a3
{
}

- (id)tsaxParentFindReplaceController
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_5738D4);
}

- (void)tsaxSetParentFindReplaceController:(id)a3
{
}

- (CGRect)tsaxFrameFromBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UIView *)self window];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);

  -[UIWindow convertRect:toWindow:](v8, "convertRect:toWindow:", 0);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGPoint)tsaxFramePointFromBoundsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(UIView *)self window];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);

  -[UIWindow convertPoint:toWindow:](v6, "convertPoint:toWindow:", v6);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (double)tsaxScreenScale
{
  double v2 = [(UIWindow *)[(UIView *)self window] screen];

  [(UIScreen *)v2 scale];
  return result;
}

+ (BOOL)tsaxView:(id)a3 isDescendantOfView:(id)a4
{
  BOOL v8 = a3 != 0;
  if (a3 != a4)
  {
    id v9 = a3;
    if (a3)
    {
      uint64_t v12 = v5;
      uint64_t v13 = v4;
      uint64_t v14 = v6;
      uint64_t v15 = v7;
      do
      {
        [v9 superview:v12, v13, v14, v15];
        BOOL v8 = v9 != 0;
      }
      while (v9 != a4 && v9);
    }
  }
  return v8;
}

@end