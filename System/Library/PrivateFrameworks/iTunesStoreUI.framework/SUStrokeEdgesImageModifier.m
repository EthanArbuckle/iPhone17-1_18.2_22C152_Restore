@interface SUStrokeEdgesImageModifier
- (BOOL)fitToImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)strokeCurrentPath;
- (UIColor)strokeColor;
- (UIEdgeInsets)edgeInsets;
- (void)dealloc;
- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setFitToImage:(BOOL)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeCurrentPath:(BOOL)a3;
@end

@implementation SUStrokeEdgesImageModifier

- (void)dealloc
{
  self->_strokeColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUStrokeEdgesImageModifier;
  [(SUStrokeEdgesImageModifier *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  [(SUStrokeEdgesImageModifier *)self edgeInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [a3 edgeInsets];
  BOOL v17 = v8 == v16 && v6 == v13;
  BOOL v18 = v17 && v12 == v15;
  BOOL v19 = v18 && v10 == v14;
  if (v19
    && (int v20 = [(SUStrokeEdgesImageModifier *)self fitToImage],
        v20 == [a3 fitToImage]))
  {
    int v21 = -[UIColor isEqual:](-[SUStrokeEdgesImageModifier strokeColor](self, "strokeColor"), "isEqual:", [a3 strokeColor]);
    if (v21)
    {
      BOOL v22 = [(SUStrokeEdgesImageModifier *)self strokeCurrentPath];
      LOBYTE(v21) = v22 ^ [a3 strokeCurrentPath] ^ 1;
    }
  }
  else
  {
LABEL_14:
    LOBYTE(v21) = 0;
  }
  return v21;
}

- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double rect = a4.size.height;
  double rect_8 = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGContextSetCompositeOperation();
  [(SUStrokeEdgesImageModifier *)self edgeInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if ([(SUStrokeEdgesImageModifier *)self strokeCurrentPath])
  {
    if (v12 >= v16) {
      double v19 = v12;
    }
    else {
      double v19 = v16;
    }
    if (v14 >= v18) {
      double v20 = v14;
    }
    else {
      double v20 = v18;
    }
    if (v19 < v20) {
      double v19 = v20;
    }
    CGContextSetLineWidth(a3, v19);
    CGContextSetStrokeColorWithColor(a3, [(UIColor *)[(SUStrokeEdgesImageModifier *)self strokeColor] CGColor]);
    CGContextStrokePath(a3);
  }
  else
  {
    double v36 = v16;
    CGContextSetFillColorWithColor(a3, [(UIColor *)[(SUStrokeEdgesImageModifier *)self strokeColor] CGColor]);
    double v35 = *MEMORY[0x263F001A8];
    CGFloat v21 = x;
    double v22 = *(double *)(MEMORY[0x263F001A8] + 8);
    BOOL v23 = [(SUStrokeEdgesImageModifier *)self fitToImage];
    if (height >= width) {
      double v24 = height;
    }
    else {
      double v24 = width;
    }
    if (height >= width) {
      double v25 = width;
    }
    else {
      double v25 = height;
    }
    if (rect_8 > rect) {
      double v26 = v25;
    }
    else {
      double v26 = v24;
    }
    if (rect_8 <= rect) {
      double v24 = v25;
    }
    if (v23) {
      CGFloat v27 = rect;
    }
    else {
      CGFloat v27 = v26;
    }
    if (v23) {
      double v28 = rect_8;
    }
    else {
      double v28 = v24;
    }
    if (v23) {
      double v29 = y;
    }
    else {
      double v29 = v22;
    }
    CGFloat rect_8a = v29;
    if (v23) {
      double v30 = v21;
    }
    else {
      double v30 = v35;
    }
    if (v12 > 0.00000011920929)
    {
      v41.size.double width = v28 - v14 - v18;
      v41.origin.CGFloat x = v14 + v30;
      v41.origin.double y = rect_8a;
      v41.size.double height = v12;
      CGContextFillRect(a3, v41);
    }
    if (v18 > 0.00000011920929)
    {
      v42.origin.CGFloat x = v30;
      v42.origin.double y = rect_8a;
      v42.size.double width = v28;
      v42.size.double height = v27;
      v43.origin.CGFloat x = CGRectGetMaxX(v42) - v18;
      v43.origin.double y = rect_8a;
      v43.size.double width = v18;
      v43.size.double height = v27;
      CGContextFillRect(a3, v43);
    }
    if (v36 > 0.00000011920929)
    {
      v44.origin.CGFloat x = v30;
      v44.origin.double y = rect_8a;
      v44.size.double width = v28;
      v44.size.double height = v27;
      v45.origin.double y = CGRectGetMaxY(v44) - v36;
      v45.size.double width = v28 - v14 - v18;
      v45.origin.CGFloat x = v14 + v30;
      v45.size.double height = v36;
      CGContextFillRect(a3, v45);
    }
    if (v14 > 0.00000011920929)
    {
      double v31 = v30;
      CGFloat v32 = rect_8a;
      double v33 = v14;
      CGFloat v34 = v27;
      CGContextFillRect(a3, *(CGRect *)&v31);
    }
  }
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

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (BOOL)fitToImage
{
  return self->_fitToImage;
}

- (void)setFitToImage:(BOOL)a3
{
  self->_fitToImage = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
}

- (BOOL)strokeCurrentPath
{
  return self->_strokeCurrentPath;
}

- (void)setStrokeCurrentPath:(BOOL)a3
{
  self->_strokeCurrentPath = a3;
}

@end