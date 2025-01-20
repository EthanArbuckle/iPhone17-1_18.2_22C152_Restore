@interface SUClipCornersImageModifier
- (BOOL)isEqual:(id)a3;
- (CGPath)_copyClippingPathForRect:(CGRect)a3;
- (double)cornerRadius;
- (int)corners;
- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (void)drawBeforeImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (void)setCornerRadius:(double)a3;
- (void)setCorners:(int)a3;
@end

@implementation SUClipCornersImageModifier

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v5 = [(SUClipCornersImageModifier *)self corners];
  if ([a3 corners] != v5) {
    return 0;
  }
  [(SUClipCornersImageModifier *)self cornerRadius];
  double v7 = v6;
  [a3 cornerRadius];
  return v7 == v8;
}

- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
}

- (void)drawBeforeImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGContextSaveGState(a3);
  v11 = -[SUClipCornersImageModifier _copyClippingPathForRect:](self, "_copyClippingPathForRect:", x, y, width, height);
  if (v11)
  {
    v12 = v11;
    CGContextAddPath(a3, v11);
    CGContextClip(a3);
    CGPathRelease(v12);
  }
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  CGRect v17 = CGRectInset(v16, 0.5, 0.5);
  v13 = -[SUClipCornersImageModifier _copyClippingPathForRect:](self, "_copyClippingPathForRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  if (v13)
  {
    v14 = v13;
    CGContextAddPath(a3, v13);
    CGPathRelease(v14);
  }
}

- (CGPath)_copyClippingPathForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  [(SUClipCornersImageModifier *)self cornerRadius];
  double v10 = v9;
  char v11 = [(SUClipCornersImageModifier *)self corners];
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v24);
  CGPathMoveToPoint(Mutable, 0, MidX, MinY);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v15 = CGRectGetMinY(v26);
  if ((v11 & 8) != 0) {
    CGPathAddArc(Mutable, 0, MaxX - v10, v10 + v15, v10, 4.71238898, 6.28318531, 0);
  }
  else {
    CGPathAddLineToPoint(Mutable, 0, MaxX, v15);
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double v16 = CGRectGetMaxX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v28);
  if ((v11 & 2) != 0) {
    CGPathAddArc(Mutable, 0, v16 - v10, MaxY - v10, v10, 0.0, 1.57079633, 0);
  }
  else {
    CGPathAddLineToPoint(Mutable, 0, v16, MaxY);
  }
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double v19 = CGRectGetMaxY(v30);
  if (v11) {
    CGPathAddArc(Mutable, 0, v10 + MinX, v19 - v10, v10, 1.57079633, 3.14159265, 0);
  }
  else {
    CGPathAddLineToPoint(Mutable, 0, MinX, v19);
  }
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v20 = CGRectGetMinX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v21 = CGRectGetMinY(v32);
  if ((v11 & 4) != 0) {
    CGPathAddArc(Mutable, 0, v10 + v20, v10 + v21, v10, 3.14159265, 4.71238898, 0);
  }
  else {
    CGPathAddLineToPoint(Mutable, 0, v20, v21);
  }
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (int)corners
{
  return self->_corners;
}

- (void)setCorners:(int)a3
{
  self->_corners = a3;
}

@end