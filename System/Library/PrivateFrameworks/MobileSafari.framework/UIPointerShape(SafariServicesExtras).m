@interface UIPointerShape(SafariServicesExtras)
+ (id)sf_shapeForToolbarButton:()SafariServicesExtras;
@end

@implementation UIPointerShape(SafariServicesExtras)

+ (id)sf_shapeForToolbarButton:()SafariServicesExtras
{
  id v4 = a3;
  v5 = [v4 configuration];
  v6 = [v5 title];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    [v4 frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
  }
  else
  {
    v16 = [v4 superview];
    [v4 _selectedIndicatorBounds];
    objc_msgSend(v16, "convertRect:fromView:", v4);
    CGFloat v9 = v17;
    CGFloat v11 = v18;
    CGFloat v13 = v19;
    CGFloat v15 = v20;
  }
  v30.origin.CGFloat x = v9;
  v30.origin.CGFloat y = v11;
  v30.size.CGFloat width = v13;
  v30.size.CGFloat height = v15;
  CGRect v31 = CGRectInset(v30, -12.0, 0.0);
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  CGFloat v25 = fmin((CGRectGetWidth(v31) + -51.0) * 0.5, 0.0);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGFloat v26 = fmin((CGRectGetHeight(v32) + -37.0) * 0.5, 0.0);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRect v34 = CGRectInset(v33, v25, v26);
  v27 = objc_msgSend(a1, "shapeWithRoundedRect:cornerRadius:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height, 8.0);

  return v27;
}

@end