@interface SKUIButtonBorderStyle
- (BOOL)_usesBackgroundWithAlpha:(id)a3;
- (IKColor)borderColor;
- (IKColor)fillColor;
- (IKCornerRadii)cornerRadii;
- (NSString)namedCornerStyle;
- (SKUIButtonBorderStyle)initWithElementStyle:(id)a3;
- (UIEdgeInsets)contentInset;
- (double)borderWidth;
- (id)bezierPathWithBounds:(CGRect)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setCornerRadii:(IKCornerRadii)a3;
- (void)setFillColor:(id)a3;
- (void)setNamedCornerStyle:(id)a3;
@end

@implementation SKUIButtonBorderStyle

- (SKUIButtonBorderStyle)initWithElementStyle:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIButtonBorderStyle initWithElementStyle:]();
  }
  v5 = [v4 ikBorderColor];
  if (!v5)
  {
    v6 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v37.receiver = self;
  v37.super_class = (Class)SKUIButtonBorderStyle;
  v6 = [(SKUIButtonBorderStyle *)&v37 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    v9 = [v4 ikBackgroundColor];
    v10 = [v9 color];
    int v11 = [v6 _usesBackgroundWithAlpha:v10];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F6F060]);
      v13 = [MEMORY[0x1E4FB1618] clearColor];
      uint64_t v14 = [v12 initWithColor:v13];
    }
    else
    {
      v13 = [v4 ikBackgroundColor];
      uint64_t v14 = [v13 copy];
    }
    v15 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v14;

    v16 = [v4 valueForStyle:*MEMORY[0x1E4F6EFC0]];
    self = v16;
    if (v16)
    {
      memset(v36, 0, sizeof(v36));
      [(SKUIButtonBorderStyle *)v16 getValue:v36];
      *((void *)v6 + 2) = v36[0].receiver;
    }
    else
    {
      v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v17 scale];
      *((double *)v6 + 2) = 1.0 / v18;
    }
    v19 = [v4 valueForStyle:*MEMORY[0x1E4F6EFD8]];
    v20 = v19;
    if (v19)
    {
      [v19 getValue:v6 + 24];
    }
    else
    {
      *(_OWORD *)(v6 + 24) = xmmword_1C1CCB4B0;
      *(_OWORD *)(v6 + 40) = xmmword_1C1CCB4B0;
    }
    v21 = [v4 borderRadius];
    v22 = v21;
    if (v21)
    {
      v23 = [v21 namedStyle];
      v24 = v23;
      if (v23)
      {
        if ([v23 isEqualToString:@"square"])
        {
          *(_OWORD *)(v6 + 56) = 0u;
          *(_OWORD *)(v6 + 72) = 0u;
        }
        else
        {
          __asm { FMOV            V0.2D, #7.0 }
          *(_OWORD *)(v6 + 72) = _Q0;
          *(_OWORD *)(v6 + 56) = _Q0;
          objc_storeStrong((id *)v6 + 12, v24);
        }
      }
      else
      {
        [v22 cornerRadiiValue];
        *((void *)v6 + 7) = v30;
        *((void *)v6 + 8) = v31;
        *((void *)v6 + 9) = v32;
        *((void *)v6 + 10) = v33;
      }
    }
    else
    {
      __asm { FMOV            V0.2D, #7.0 }
      *(_OWORD *)(v6 + 72) = _Q0;
      *(_OWORD *)(v6 + 56) = _Q0;
    }

    goto LABEL_26;
  }
LABEL_27:

  return (SKUIButtonBorderStyle *)v6;
}

- (id)bezierPathWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = [MEMORY[0x1E4FB14C0] bezierPath];
  double bottomRight = self->_cornerRadii.bottomRight;
  double bottomLeft = self->_cornerRadii.bottomLeft;
  double topLeft = self->_cornerRadii.topLeft;
  double topRight = self->_cornerRadii.topRight;
  if ([(NSString *)self->_namedCornerStyle isEqualToString:@"circle-caps"])
  {
    float v12 = height * 0.5;
    double topRight = floorf(v12);
    double topLeft = topRight;
    double bottomRight = topRight;
    double bottomLeft = topRight;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.double height = height;
  double v13 = topLeft + CGRectGetMinX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.double height = height;
  objc_msgSend(v8, "moveToPoint:", v13, CGRectGetMinY(v26));
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.double height = height;
  CGFloat v14 = CGRectGetMaxX(v27) - topRight;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.double height = height;
  objc_msgSend(v8, "addLineToPoint:", v14, CGRectGetMinY(v28));
  if (topRight > 0.00000011920929)
  {
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.double height = height;
    CGFloat v15 = CGRectGetMaxX(v29) - topRight;
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.double height = height;
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v15, topRight + CGRectGetMinY(v30), topRight, 4.71238898, 6.28318531);
  }
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.double height = height;
  double MaxX = CGRectGetMaxX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.double height = height;
  objc_msgSend(v8, "addLineToPoint:", MaxX, CGRectGetMaxY(v32) - bottomRight);
  if (bottomRight > 0.00000011920929)
  {
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.double height = height;
    CGFloat v17 = CGRectGetMaxX(v33) - bottomRight;
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.double height = height;
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v17, CGRectGetMaxY(v34) - bottomRight, bottomRight, 0.0, 1.57079633);
  }
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.double height = height;
  double v18 = bottomLeft + CGRectGetMinX(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.double height = height;
  objc_msgSend(v8, "addLineToPoint:", v18, CGRectGetMaxY(v36));
  if (bottomLeft > 0.00000011920929)
  {
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.double height = height;
    double v19 = bottomLeft + CGRectGetMinX(v37);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.double height = height;
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v19, CGRectGetMaxY(v38) - bottomLeft, bottomLeft, 1.57079633, 3.14159265);
  }
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.double height = height;
  double MinX = CGRectGetMinX(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.double height = height;
  objc_msgSend(v8, "addLineToPoint:", MinX, topLeft + CGRectGetMinY(v40));
  if (topLeft != 0.0)
  {
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.double height = height;
    double v21 = topLeft + CGRectGetMinX(v41);
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.double height = height;
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v21, topLeft + CGRectGetMinY(v42), topLeft, 3.14159265, 4.71238898);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(IKColor *)self->_borderColor copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(double *)(v5 + 16) = self->_borderWidth;
  long long v8 = *(_OWORD *)&self->_contentInset.top;
  *(_OWORD *)(v5 + 40) = *(_OWORD *)&self->_contentInset.bottom;
  *(_OWORD *)(v5 + 24) = v8;
  long long v9 = *(_OWORD *)&self->_cornerRadii.bottomLeft;
  *(_OWORD *)(v5 + 72) = *(_OWORD *)&self->_cornerRadii.topLeft;
  *(_OWORD *)(v5 + 56) = v9;
  uint64_t v10 = [(IKColor *)self->_fillColor copyWithZone:a3];
  int v11 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v10;

  uint64_t v12 = [(NSString *)self->_namedCornerStyle copyWithZone:a3];
  double v13 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v12;

  return (id)v5;
}

- (BOOL)_usesBackgroundWithAlpha:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  double v4 = 0.0;
  return [a3 getHue:&v7 saturation:&v6 brightness:&v5 alpha:&v4]
      && v4 < 1.0
      && v4 != 0.0;
}

- (IKColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (IKCornerRadii)cornerRadii
{
  double bottomLeft = self->_cornerRadii.bottomLeft;
  double bottomRight = self->_cornerRadii.bottomRight;
  double topLeft = self->_cornerRadii.topLeft;
  double topRight = self->_cornerRadii.topRight;
  result.double topRight = topRight;
  result.double topLeft = topLeft;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  return result;
}

- (void)setCornerRadii:(IKCornerRadii)a3
{
  self->_cornerRadii = a3;
}

- (IKColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (NSString)namedCornerStyle
{
  return self->_namedCornerStyle;
}

- (void)setNamedCornerStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedCornerStyle, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);

  objc_storeStrong((id *)&self->_borderColor, 0);
}

- (void)initWithElementStyle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIButtonBorderStyle initWithElementStyle:]";
}

@end