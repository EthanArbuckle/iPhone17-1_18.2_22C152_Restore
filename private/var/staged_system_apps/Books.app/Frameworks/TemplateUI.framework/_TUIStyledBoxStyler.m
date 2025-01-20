@interface _TUIStyledBoxStyler
- (BOOL)isEqualToStyle:(id)a3;
- (CAFilter)compositingFilter;
- (_TUIStyledBoxStyler)initWithLayout:(id)a3 contentsScale:(double)a4;
- (void)applyStylingToLayer:(id)a3;
- (void)applyStylingToView:(id)a3;
@end

@implementation _TUIStyledBoxStyler

- (_TUIStyledBoxStyler)initWithLayout:(id)a3 contentsScale:(double)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_TUIStyledBoxStyler;
  v7 = [(_TUIStyledBoxStyler *)&v31 init];
  if (v7)
  {
    v8 = [v6 box];
    [v6 computedBounds];
    v7->_bounds.origin.x = v9;
    v7->_bounds.origin.y = v10;
    v7->_bounds.size.width = v11;
    v7->_bounds.size.height = v12;
    uint64_t v13 = [v8 backgroundColor];
    backgroundColor = v7->_backgroundColor;
    v7->_backgroundColor = (UIColor *)v13;

    [v8 cornerRadius];
    v7->_cornerRadius = v15;
    if ([v8 continuousCorners]) {
      char v16 = 4;
    }
    else {
      char v16 = 0;
    }
    *((unsigned char *)v7 + 120) = *((unsigned char *)v7 + 120) & 0xFB | v16;
    uint64_t v17 = [v8 shadowColor];
    shadowColor = v7->_shadowColor;
    v7->_shadowColor = (UIColor *)v17;

    [v8 shadowOffset];
    v7->_shadowOffset.width = v19;
    v7->_shadowOffset.height = v20;
    [v8 shadowRadius];
    v7->_shadowRadius = v21;
    [v8 shadowOpacity];
    v7->_shadowOpacity = v22;
    *((unsigned char *)v7 + 120) = *((unsigned char *)v7 + 120) & 0xE7 | (8 * ((unint64_t)a4 & 3));
    uint64_t v23 = [v8 borderColor];
    borderColor = v7->_borderColor;
    v7->_borderColor = (UIColor *)v23;

    [v8 borderWidth];
    v7->_borderWidth = v25;
    *((unsigned char *)v7 + 120) = *((unsigned char *)v7 + 120) & 0xFE | [v8 clipsToBounds];
    if ([v8 allowsGroupBlending]) {
      char v26 = 2;
    }
    else {
      char v26 = 0;
    }
    *((unsigned char *)v7 + 120) = *((unsigned char *)v7 + 120) & 0xFD | v26;
    v27 = [v8 blendMode];
    v28 = (NSString *)[v27 copy];
    blendMode = v7->_blendMode;
    v7->_blendMode = v28;
  }
  return v7;
}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  v7 = v6;
  v8 = v7;
  if (v7 == self) {
    goto LABEL_28;
  }
  if (v7)
  {
    if (CGRectEqualToRect(self->_bounds, v7->_bounds))
    {
      backgroundColor = self->_backgroundColor;
      if ((backgroundColor == v8->_backgroundColor || -[UIColor isEqual:](backgroundColor, "isEqual:"))
        && self->_cornerRadius == v8->_cornerRadius
        && ((*((unsigned __int8 *)v8 + 120) ^ *((unsigned __int8 *)self + 120)) & 4) == 0)
      {
        shadowColor = self->_shadowColor;
        if ((shadowColor == v8->_shadowColor || -[UIColor isEqual:](shadowColor, "isEqual:"))
          && self->_shadowOffset.width == v8->_shadowOffset.width
          && self->_shadowOffset.height == v8->_shadowOffset.height
          && self->_shadowRadius == v8->_shadowRadius
          && self->_shadowOpacity == v8->_shadowOpacity
          && ((*((unsigned __int8 *)v8 + 120) ^ *((unsigned __int8 *)self + 120)) & 0x18) == 0)
        {
          borderColor = self->_borderColor;
          if ((borderColor == v8->_borderColor || -[UIColor isEqual:](borderColor, "isEqual:"))
            && self->_borderWidth == v8->_borderWidth
            && ((*((unsigned __int8 *)v8 + 120) ^ *((unsigned __int8 *)self + 120)) & 3) == 0)
          {
            blendMode = self->_blendMode;
            if (blendMode != v8->_blendMode)
            {
              unsigned __int8 v12 = -[NSString isEqualToString:](blendMode, "isEqualToString:");
              goto LABEL_29;
            }
LABEL_28:
            unsigned __int8 v12 = 1;
            goto LABEL_29;
          }
        }
      }
    }
  }
  unsigned __int8 v12 = 0;
LABEL_29:

  return v12;
}

- (void)applyStylingToLayer:(id)a3
{
  id v24 = a3;
  [v24 setBackgroundColor:[self->_backgroundColor CGColor]];
  [v24 setCornerRadius:self->_cornerRadius];
  id v4 = &kCACornerCurveCircular;
  if ((*((unsigned char *)self + 120) & 4) != 0) {
    id v4 = &kCACornerCurveContinuous;
  }
  [v24 setCornerCurve:*v4];
  [v24 setShadowColor:[self->_shadowColor CGColor]];
  [v24 setShadowOffset:self->_shadowOffset.width, self->_shadowOffset.height];
  [v24 setShadowRadius:self->_shadowRadius];
  double shadowOpacity = self->_shadowOpacity;
  *(float *)&double shadowOpacity = shadowOpacity;
  [v24 setShadowOpacity:shadowOpacity];
  if (self->_shadowColor && self->_backgroundColor)
  {
    double x = self->_bounds.origin.x;
    double y = self->_bounds.origin.y;
    CGFloat width = self->_bounds.size.width;
    CGFloat height = self->_bounds.size.height;
    double cornerRadius = self->_cornerRadius;
    Mutable = CGPathCreateMutable();
    unsigned __int8 v12 = Mutable;
    double v13 = x;
    double v14 = y;
    CGFloat v15 = width;
    CGFloat v16 = height;
    if (cornerRadius == 0.0)
    {
      CGPathAddRect(Mutable, 0, *(CGRect *)&v13);
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v13);
      v26.origin.double x = x;
      v26.origin.double y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v26);
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v27);
      v28.origin.double x = x;
      v28.origin.double y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      CGFloat v20 = CGRectGetMaxY(v28);
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      CGFloat v17 = CGRectGetMaxX(v29);
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v30);
      CGPathMoveToPoint(v12, 0, MinX + 0.0, MaxY - cornerRadius);
      CGPathAddArcToPoint(v12, 0, x, y, x + cornerRadius, y + 0.0, cornerRadius);
      CGPathAddArcToPoint(v12, 0, v17, MinY, v17, cornerRadius + MinY, cornerRadius);
      CGPathAddArcToPoint(v12, 0, MaxX, v20, MaxX - cornerRadius, v20, cornerRadius);
      CGPathAddArcToPoint(v12, 0, MinX, MaxY, MinX + 0.0, MaxY - cornerRadius, cornerRadius);
      CGPathCloseSubpath(v12);
    }
    [v24 setShadowPath:v12];
    CGPathRelease(v12);
  }
  [v24 setBorderColor:[self->_borderColor CGColor]];
  [v24 setBorderWidth:self->_borderWidth];
  [v24 setMasksToBounds:*((unsigned char *)self + 120) & 1];
  [v24 setAllowsGroupBlending:(*((unsigned __int8 *)self + 120) >> 1) & 1];
  CGFloat v19 = [(_TUIStyledBoxStyler *)self compositingFilter];
  [v24 setCompositingFilter:v19];

  [v24 setContentsScale:(double)((*((unsigned __int8 *)self + 120) >> 3) & 3)];
}

- (void)applyStylingToView:(id)a3
{
  id v4 = [a3 layer];
  -[_TUIStyledBoxStyler applyStylingToLayer:](self, "applyStylingToLayer:");
}

- (CAFilter)compositingFilter
{
  if (self->_blendMode)
  {
    v2 = +[CAFilter filterWithType:](CAFilter, "filterWithType:");
  }
  else
  {
    v2 = 0;
  }

  return (CAFilter *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendMode, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end