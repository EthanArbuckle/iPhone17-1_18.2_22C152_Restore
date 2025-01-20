@interface _UISheetPresentationMetrics
+ (id)_defaultMetrics;
- (BOOL)alwaysStacksWithChild;
- (BOOL)exclusivelyUsesZPositionForTransform;
- (BOOL)fadeOutIfAnyDescendantWantsFullScreen;
- (BOOL)shouldScaleDownBehindDescendantsForContainer:(id)a3 withBounds:(CGRect)a4;
- (BOOL)supportsEdgeAttachedForTraitCollection:(id)a3;
- (BOOL)wantsDimming;
- (CGSize)defaultFormSheetSizeForScreenSize:(CGSize)a3;
- (CGSize)formSheetSizeForViewController:(id)a3 windowSize:(CGSize)a4 screenSize:(CGSize)a5;
- (double)cornerRadius;
- (double)maximumSheetDepthLevel;
- (double)minimumSidePadding;
- (double)preferredShadowOpacity;
- (double)shadowRadius;
- (double)topOffset;
- (double)topOffsetInCompactHeight;
- (double)transitionDuration;
- (id)_init;
- (id)transitionSpringParametersHighSpeed:(BOOL)a3;
- (int64_t)defaultMode;
@end

@implementation _UISheetPresentationMetrics

- (double)shadowRadius
{
  return 2.0;
}

- (double)preferredShadowOpacity
{
  return 0.5;
}

+ (id)_defaultMetrics
{
  if (qword_1EB25B430 != -1) {
    dispatch_once(&qword_1EB25B430, &__block_literal_global_445);
  }
  v2 = (void *)_MergedGlobals_13_3;
  return v2;
}

- (int64_t)defaultMode
{
  return dyld_program_sdk_at_least();
}

- (CGSize)defaultFormSheetSizeForScreenSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = +[UIScreen mainScreen];
  char v6 = [v5 _wantsWideContentMargins];

  if (v6)
  {
    double v7 = 394.0;
    double v8 = 414.0;
  }
  else
  {
    double v9 = fmax(width, height);
    if (v9 >= 1590.0)
    {
      double v7 = 680.0;
      double v8 = 620.0;
    }
    else if (v9 <= 1024.0)
    {
      double v7 = 600.0;
      double v8 = 540.0;
    }
    else
    {
      double v7 = 640.0;
      double v8 = 580.0;
    }
  }
  result.double height = v7;
  result.double width = v8;
  return result;
}

- (BOOL)exclusivelyUsesZPositionForTransform
{
  return 0;
}

- (BOOL)wantsDimming
{
  return 1;
}

- (double)cornerRadius
{
  return 10.0;
}

- (BOOL)alwaysStacksWithChild
{
  return 0;
}

- (BOOL)fadeOutIfAnyDescendantWantsFullScreen
{
  return 0;
}

- (BOOL)supportsEdgeAttachedForTraitCollection:(id)a3
{
  return [a3 userInterfaceIdiom] != 6;
}

- (BOOL)shouldScaleDownBehindDescendantsForContainer:(id)a3 withBounds:(CGRect)a4
{
  double height = a4.size.height;
  v5 = objc_msgSend(a3, "window", a4.origin.x, a4.origin.y, a4.size.width);
  char v6 = [v5 screen];
  [v6 bounds];
  BOOL v8 = height == v7;

  return v8;
}

- (double)maximumSheetDepthLevel
{
  return 2.0;
}

- (double)topOffset
{
  return 10.0;
}

- (double)minimumSidePadding
{
  return 25.0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISheetPresentationMetrics;
  return [(_UISheetPresentationMetrics *)&v3 init];
}

- (double)topOffsetInCompactHeight
{
  return 8.0;
}

- (double)transitionDuration
{
  +[UITransitionView defaultDurationForTransition:8];
  return result;
}

- (id)transitionSpringParametersHighSpeed:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB25B448 != -1) {
    dispatch_once(&qword_1EB25B448, &__block_literal_global_3_8);
  }
  uint64_t v4 = 2;
  if (v3) {
    uint64_t v4 = 3;
  }
  v5 = (void *)_MergedGlobals_13_3[v4];
  return v5;
}

- (CGSize)formSheetSizeForViewController:(id)a3 windowSize:(CGSize)a4 screenSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  id v10 = a3;
  [v10 preferredContentSize];
  double v12 = v11;
  double v14 = v13;
  -[_UISheetPresentationMetrics defaultFormSheetSizeForScreenSize:](self, "defaultFormSheetSizeForScreenSize:", width, height);
  double v17 = v15;
  double v18 = v16;
  if (v12 <= 0.0 || v14 <= 0.0)
  {
    if (v15 <= 0.0
      || v16 <= 0.0
      || (_UISheetPresentationControllerStylesSheetsAsCards(v10) & 1) == 0 && (v17 >= v8 || v18 >= v7))
    {
      double v17 = v8;
      double v18 = v7;
    }
  }
  else
  {
    double v17 = v12;
    double v18 = v14;
  }

  double v19 = v17;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

@end