@interface WFComposeViewSizing
+ (CGSize)drawerSizeFromParentSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 traitCollection:(id)a5;
+ (CGSize)sizeForRequestType:(unint64_t)a3 parentSize:(CGSize)a4 safeAreaInsets:(UIEdgeInsets)a5 traitCollection:(id)a6;
+ (CGSize)workflowViewSizeFromParentSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 traitCollection:(id)a5;
+ (UIEdgeInsets)moduleHorizontalInsetWithTraitCollection:(id)a3 safeAreaInsets:(UIEdgeInsets)a4;
+ (double)constrainMaximumContentWidth:(double)a3 toSize:(CGSize)a4 traitCollection:(id)a5;
+ (double)moduleWidthForViewSize:(CGSize)a3 maximumContentWidth:(double)a4 maximumModuleWidth:(double)a5 traitCollection:(id)a6 safeAreaInsets:(UIEdgeInsets)a7;
@end

@implementation WFComposeViewSizing

+ (CGSize)sizeForRequestType:(unint64_t)a3 parentSize:(CGSize)a4 safeAreaInsets:(UIEdgeInsets)a5 traitCollection:(id)a6
{
  double right = a5.right;
  double left = a5.left;
  double height = a4.height;
  double width = a4.width;
  double v11 = a4.width - a5.left - a5.right;
  id v12 = a6;
  double v13 = dbl_234B795E0[[v12 userInterfaceIdiom] == 1];
  double v14 = 320.0;
  if (v11 < 700.0) {
    double v15 = 0.0;
  }
  else {
    double v15 = 320.0;
  }
  if (v11 >= 1000.0) {
    double v14 = 360.0;
  }
  if (v11 >= 1300.0) {
    double v14 = 389.0;
  }
  double v16 = ceil(v11 * v13);
  if (v16 >= v14) {
    double v16 = v14;
  }
  if (v16 >= v15) {
    double v17 = v16;
  }
  else {
    double v17 = v15;
  }
  uint64_t v18 = [v12 horizontalSizeClass];

  if (v18 == 1) {
    double v19 = width;
  }
  else {
    double v19 = v17;
  }
  if (a3)
  {
    double v20 = v11 - v17;
    if (v18 == 1) {
      double v20 = width;
    }
    if (a3 == 1) {
      double v19 = v20;
    }
    else {
      double v19 = 0.0;
    }
  }
  if (v19 < width)
  {
    v21 = [MEMORY[0x263F33718] sharedContext];
    int v22 = [v21 shouldReverseLayoutDirection];

    if (v22) {
      double v23 = left;
    }
    else {
      double v23 = right;
    }
    double v19 = v19 + v23;
  }
  if (v19 <= 0.0) {
    double v24 = 0.0;
  }
  else {
    double v24 = height;
  }
  double v25 = v19;
  result.double height = v24;
  result.double width = v25;
  return result;
}

+ (CGSize)workflowViewSizeFromParentSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 traitCollection:(id)a5
{
  objc_msgSend(a1, "sizeForRequestType:parentSize:safeAreaInsets:traitCollection:", 1, a5, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  result.double height = v6;
  result.double width = v5;
  return result;
}

+ (CGSize)drawerSizeFromParentSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 traitCollection:(id)a5
{
  objc_msgSend(a1, "sizeForRequestType:parentSize:safeAreaInsets:traitCollection:", 0, a5, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  result.double height = v6;
  result.double width = v5;
  return result;
}

+ (double)constrainMaximumContentWidth:(double)a3 toSize:(CGSize)a4 traitCollection:(id)a5
{
  double width = a4.width;
  id v7 = a5;
  uint64_t v8 = [v7 userInterfaceIdiom];
  if (width >= 1300.0)
  {
    uint64_t v9 = v8;
    if ([v7 horizontalSizeClass] == 2) {
      a3 = width * dbl_234B795F0[v9 == 1];
    }
  }

  return a3;
}

+ (UIEdgeInsets)moduleHorizontalInsetWithTraitCollection:(id)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4 = a4.left + 20.0;
  double v5 = a4.right + 20.0;
  double v6 = 0.0;
  double v7 = 0.0;
  result.double right = v5;
  result.bottom = v7;
  result.double left = v4;
  result.top = v6;
  return result;
}

+ (double)moduleWidthForViewSize:(CGSize)a3 maximumContentWidth:(double)a4 maximumModuleWidth:(double)a5 traitCollection:(id)a6 safeAreaInsets:(UIEdgeInsets)a7
{
  if (a4 <= 0.0 || a3.width <= a4) {
    double width = a3.width;
  }
  else {
    double width = a4;
  }
  objc_msgSend(a1, "moduleHorizontalInsetWithTraitCollection:safeAreaInsets:", a6, a7.top, a7.left, a7.bottom, a7.right);
  double v12 = width - v10 - v11;
  if (v12 > a5 && a5 > 0.0) {
    double v12 = a5;
  }
  return fmax(v12, 0.0);
}

@end