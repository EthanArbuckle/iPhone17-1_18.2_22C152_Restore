@interface _UIStepperButtonVisualProvider
- (BOOL)_shouldDefaultToTemplatesForImageViewBackground:(BOOL)a3;
- (CGRect)imageRectForContentRect:(CGRect)a3;
@end

@implementation _UIStepperButtonVisualProvider

- (BOOL)_shouldDefaultToTemplatesForImageViewBackground:(BOOL)a3
{
  return !a3;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(UIButtonLegacyVisualProvider *)self button];
  int v9 = [v8 isLeft];

  double v10 = 1.0;
  if (!v9) {
    double v10 = 0.5;
  }
  CGFloat v11 = x + v10;
  CGFloat v12 = y + 0.0;
  CGFloat v13 = width + -1.5;
  v14 = [(UIButtonLegacyVisualProvider *)self button];
  v15 = [(UIButtonLegacyVisualProvider *)self button];
  v16 = objc_msgSend(v14, "imageForState:", objc_msgSend(v15, "state"));

  [v16 size];
  double v18 = v17;
  double v20 = v19;
  v31.origin.double x = v11;
  v31.origin.double y = v12;
  v31.size.double width = v13;
  v31.size.CGFloat height = height;
  CGRectGetMidX(v31);
  v32.origin.double x = v11;
  v32.origin.double y = v12;
  v32.size.double width = v13;
  v32.size.CGFloat height = height;
  CGRectGetMidY(v32);
  v21 = [(UIButtonLegacyVisualProvider *)self button];
  UIRoundToViewScale(v21);
  double v23 = v22;

  v24 = [(UIButtonLegacyVisualProvider *)self button];
  UIRoundToViewScale(v24);
  double v26 = v25;

  double v27 = v23;
  double v28 = v26;
  double v29 = v18;
  double v30 = v20;
  result.size.CGFloat height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

@end