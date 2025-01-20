@interface TVImageOutlineDecorator
+ (id)decoratorWithOutlineColor:(id)a3 outlineWidths:(UIEdgeInsets)a4;
- (BOOL)isEqual:(id)a3;
- (TVImageOutlineDecorator)initWithOutlineColor:(id)a3 outlineWidths:(UIEdgeInsets)a4;
- (UIColor)outlineColor;
- (UIEdgeInsets)outlineWidths;
- (id)decoratorIdentifier;
- (unint64_t)hash;
- (void)drawInContext:(id)a3 imageRect:(CGRect)a4;
@end

@implementation TVImageOutlineDecorator

+ (id)decoratorWithOutlineColor:(id)a3 outlineWidths:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v8 = a3;
  v9 = -[TVImageOutlineDecorator initWithOutlineColor:outlineWidths:]([TVImageOutlineDecorator alloc], "initWithOutlineColor:outlineWidths:", v8, top, left, bottom, right);

  return v9;
}

- (TVImageOutlineDecorator)initWithOutlineColor:(id)a3 outlineWidths:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TVImageOutlineDecorator;
  v11 = [(TVImageScaleDecorator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_outlineColor, a3);
    v12->_outlineWidths.CGFloat top = top;
    v12->_outlineWidths.CGFloat left = left;
    v12->_outlineWidths.CGFloat bottom = bottom;
    v12->_outlineWidths.CGFloat right = right;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TVImageOutlineDecorator;
  if ([(TVImageScaleDecorator *)&v22 isEqual:v4])
  {
    v5 = [(TVImageOutlineDecorator *)self outlineColor];
    v6 = [v4 outlineColor];
    if ([v5 isEqual:v6])
    {
      [(TVImageOutlineDecorator *)self outlineWidths];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [v4 outlineWidths];
      BOOL v18 = v10 == v17;
      if (v8 != v19) {
        BOOL v18 = 0;
      }
      if (v14 != v16) {
        BOOL v18 = 0;
      }
      BOOL v20 = v12 == v15 && v18;
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)TVImageOutlineDecorator;
  return [(TVImageScaleDecorator *)&v3 hash];
}

- (id)decoratorIdentifier
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v15.receiver = self;
  v15.super_class = (Class)TVImageOutlineDecorator;
  uint64_t v4 = [(TVImageScaleDecorator *)&v15 decoratorIdentifier];
  v5 = (void *)v4;
  if (v4) {
    [v3 appendFormat:@"%@_", v4];
  }
  float top = self->_outlineWidths.top;
  float left = self->_outlineWidths.left;
  float bottom = self->_outlineWidths.bottom;
  float right = self->_outlineWidths.right;
  objc_msgSend(v3, "appendFormat:", @"_bw(%.f,%.f,%.f,%.f)", top, left, bottom, right);
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  [(UIColor *)self->_outlineColor getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
  objc_msgSend(v3, "appendFormat:", @"_bc(%.1f,%.1f,%.1f,%.1f)", v14, v13, v12, v11);

  return v3;
}

- (void)drawInContext:(id)a3 imageRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  double y = a4.origin.y;
  [(TVImageOutlineDecorator *)self outlineWidths];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(TVImageScaleDecorator *)self _focusedSizeIncreaseFactor];
  double v14 = v13;
  BOOL v15 = v13 <= 0.0;
  double v16 = v6 * v13;
  double v17 = v10 * v14;
  if (v15) {
    double v18 = v12;
  }
  else {
    double v18 = v12 * v14;
  }
  if (v15) {
    double v17 = v10;
  }
  double v40 = v17;
  if (v15) {
    double v19 = v8;
  }
  else {
    double v19 = v8 * v14;
  }
  if (v15) {
    double v20 = v6;
  }
  else {
    double v20 = v16;
  }
  [(UIColor *)self->_outlineColor set];
  [(TVImageScaleDecorator *)self cornerRadii];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  if (+[TVCornerUtilities radiiIsZero:](TVCornerUtilities, "radiiIsZero:"))
  {
    if (v20 > 0.00000011920929)
    {
      v47.origin.double x = x;
      v47.origin.double y = y;
      v47.size.double width = width;
      v47.size.double height = v20;
      UIRectFillUsingBlendMode(v47, kCGBlendModeNormal);
    }
    double v29 = v18;
    double v30 = height - v20;
    if (v18 > 0.00000011920929)
    {
      double v31 = x + width - v18;
      double v32 = v30 - v40;
      double v33 = y + v20;
      UIRectFillUsingBlendMode(*(CGRect *)(&v29 - 2), kCGBlendModeNormal);
    }
    if (v40 > 0.00000011920929)
    {
      v48.origin.double y = y + height - v40;
      v48.origin.double x = x;
      v48.size.double width = width;
      v48.size.double height = v40;
      UIRectFillUsingBlendMode(v48, kCGBlendModeNormal);
    }
    double v34 = v19;
    if (v19 > 0.00000011920929)
    {
      double v36 = x;
      double v37 = y + v20;
      double v35 = v30 - v40;
      UIRectFillUsingBlendMode(*(CGRect *)(&v34 - 2), kCGBlendModeNormal);
    }
  }
  else
  {
    double v38 = fmax(fmax(v20, v18), fmax(v40, v19));
    v49.origin.double x = x;
    v49.origin.double y = y;
    v49.size.double height = height;
    v49.size.double width = width;
    CGRect v50 = CGRectInset(v49, v38 * 0.5, v38 * 0.5);
    v39 = +[TVCornerUtilities createPathForRadii:inRect:isContinuous:](TVCornerUtilities, "createPathForRadii:inRect:isContinuous:", [(TVImageScaleDecorator *)self cornerContinuous], -(v38 * 0.5 - v22 * v14), -(v38 * 0.5 - v24 * v14), -(v38 * 0.5 - v26 * v14), -(v38 * 0.5 - v28 * v14), v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    id v45 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v39];
    [v45 setLineWidth:v38];
    [v45 stroke];
    CGPathRelease(v39);
  }
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (UIEdgeInsets)outlineWidths
{
  double top = self->_outlineWidths.top;
  double left = self->_outlineWidths.left;
  double bottom = self->_outlineWidths.bottom;
  double right = self->_outlineWidths.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end