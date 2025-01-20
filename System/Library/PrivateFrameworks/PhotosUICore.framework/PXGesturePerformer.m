@interface PXGesturePerformer
+ (BOOL)isAvailable;
+ (CGRect)_frameInScreenSpaceForRect:(CGRect)a3 inView:(id)a4;
+ (CGRect)_rectInWindowCoordinateSpaceFromRect:(CGRect)a3 inView:(id)a4;
+ (CGRect)_viewFrameInScreenSpace:(id)a3;
+ (double)_amplitudeFactorBySpeed:(unint64_t)a3;
+ (id)_rptPlatformScrollViewFromPXScrollView:(id)a3;
+ (id)_rptPlatformViewFromPXView:(id)a3;
+ (id)_swipeParametersForScrollView:(id)a3 rect:(CGRect)a4 count:(int64_t)a5 speed:(unint64_t)a6 direction:(int64_t)a7;
+ (id)swipeSpeedFactor:(unint64_t)a3;
+ (int64_t)_UIAccessibilityDirection:(int64_t)a3;
+ (int64_t)_oppositeDirection:(int64_t)a3;
+ (int64_t)_rptDirection:(int64_t)a3;
+ (void)_handleResult:(id)a3 success:(BOOL)a4 error:(id)a5;
+ (void)performOscillatingInScrollView:(id)a3 rect:(CGRect)a4 speed:(unint64_t)a5 direction:(int64_t)a6 completionHandler:(id)a7;
+ (void)performSwipingInScrollView:(id)a3 rect:(CGRect)a4 count:(int64_t)a5 speed:(unint64_t)a6 direction:(int64_t)a7 roundTrip:(BOOL)a8 completionHandler:(id)a9;
@end

@implementation PXGesturePerformer

+ (id)_swipeParametersForScrollView:(id)a3 rect:(CGRect)a4 count:(int64_t)a5 speed:(unint64_t)a6 direction:(int64_t)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v15 = [a1 _rptPlatformScrollViewFromPXScrollView:a3];
  id v16 = objc_alloc(MEMORY[0x1E4F94828]);
  if (v15)
  {
    v17 = (void *)[v16 initWithTestName:@"swipe" scrollView:v15 completionHandler:0];
    [v17 setSwipeCount:a5];
    objc_msgSend(v17, "setDirection:", objc_msgSend(a1, "_UIAccessibilityDirection:", a7));
    objc_msgSend(a1, "_rectInWindowCoordinateSpaceFromRect:inView:", v15, x, y, width, height);
    objc_msgSend(v17, "setScrollingBounds:");
  }
  else
  {
    v17 = objc_msgSend(v16, "initWithTestName:scrollingBounds:swipeCount:direction:completionHandler:", @"swipe", a5, objc_msgSend(a1, "_UIAccessibilityDirection:", a7), 0, x, y, width, height);
  }
  v18 = [a1 swipeSpeedFactor:a6];
  [v17 setSwipeSpeedFactor:v18];

  [v17 setShouldFlick:1];
  return v17;
}

+ (CGRect)_rectInWindowCoordinateSpaceFromRect:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v9 = [v8 superview];
  if (v9)
  {
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    if (CGRectIsNull(v18))
    {
      [v8 frame];
      PXEdgeInsetsMake();
    }
    objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);
    objc_msgSend(v9, "convertRect:toView:", 0);
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

+ (id)_rptPlatformViewFromPXView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_rptPlatformScrollViewFromPXScrollView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (CGRect)_viewFrameInScreenSpace:(id)a3
{
  id v3 = [a1 _rptPlatformViewFromPXView:a3];
  RPTViewFrameInScreenSpace();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

+ (CGRect)_frameInScreenSpaceForRect:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [a1 _rptPlatformViewFromPXView:a4];
  double v9 = [v8 window];

  double v10 = (void *)MEMORY[0x1E4F94820];
  double v11 = [v9 screen];
  double v12 = [v10 converterFromWindow:v9 toScreen:v11];

  objc_msgSend(v12, "convertRect:", x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

+ (double)_amplitudeFactorBySpeed:(unint64_t)a3
{
  double result = 1.0;
  if (a3 == 1) {
    double result = 3.0;
  }
  if (a3 == 2) {
    return 5.0;
  }
  return result;
}

+ (id)swipeSpeedFactor:(unint64_t)a3
{
  id v3 = &unk_1F02DA800;
  if (a3 == 1) {
    id v3 = &unk_1F02DA810;
  }
  if (a3 == 2) {
    return &unk_1F02DA820;
  }
  else {
    return v3;
  }
}

+ (int64_t)_oppositeDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 1;
  }
  else {
    return qword_1AB35CB68[a3 - 1];
  }
}

+ (int64_t)_rptDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 1;
  }
  else {
    return qword_1AB35CB68[a3 - 1];
  }
}

+ (int64_t)_UIAccessibilityDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 4;
  }
  else {
    return 4 - a3;
  }
}

+ (void)_handleResult:(id)a3 success:(BOOL)a4 error:(id)a5
{
  if (a3) {
    (*((void (**)(id, BOOL, id))a3 + 2))(a3, a4, a5);
  }
}

+ (void)performSwipingInScrollView:(id)a3 rect:(CGRect)a4 count:(int64_t)a5 speed:(unint64_t)a6 direction:(int64_t)a7 roundTrip:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v10 = a8;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v19 = a3;
  id v20 = a9;
  double v21 = [MEMORY[0x1E4F1CA48] array];
  double v22 = objc_msgSend(a1, "_swipeParametersForScrollView:rect:count:speed:direction:", v19, a5, a6, a7, x, y, width, height);
  [v21 addObject:v22];
  if (v10)
  {
    uint64_t v23 = objc_msgSend(a1, "_swipeParametersForScrollView:rect:count:speed:direction:", v19, a5, a6, objc_msgSend(a1, "_oppositeDirection:", a7), x, y, width, height);

    [v21 addObject:v23];
    double v22 = (void *)v23;
  }
  double v24 = (void *)MEMORY[0x1E4F94830];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __104__PXGesturePerformer_performSwipingInScrollView_rect_count_speed_direction_roundTrip_completionHandler___block_invoke;
  v30 = &unk_1E5DCE5C8;
  id v31 = v20;
  id v32 = a1;
  id v25 = v20;
  v26 = (void *)[v24 newWithTestName:@"swipe" parameters:v21 completionHandler:&v27];
  objc_msgSend(MEMORY[0x1E4F94850], "runTestWithParameters:", v26, v27, v28, v29, v30);
}

uint64_t __104__PXGesturePerformer_performSwipingInScrollView_rect_count_speed_direction_roundTrip_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _handleResult:*(void *)(a1 + 32) success:1 error:0];
}

+ (void)performOscillatingInScrollView:(id)a3 rect:(CGRect)a4 speed:(unint64_t)a5 direction:(int64_t)a6 completionHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a7;
  double v16 = [a1 _rptPlatformScrollViewFromPXScrollView:a3];
  unint64_t v17 = [a1 _rptDirection:a6];
  objc_msgSend(a1, "_rectInWindowCoordinateSpaceFromRect:inView:", v16, x, y, width, height);
  if (v17 > 1) {
    double v22 = CGRectGetWidth(*(CGRect *)&v18);
  }
  else {
    double v22 = CGRectGetHeight(*(CGRect *)&v18);
  }
  double v23 = v22;
  id v24 = objc_alloc(MEMORY[0x1E4F94840]);
  if (v16)
  {
    id v25 = (void *)[v24 initWithTestName:@"oscillating" scrollView:v16 completionHandler:0];
    objc_msgSend(v25, "setDirection:", objc_msgSend(a1, "_UIAccessibilityDirection:", a6));
    [v25 setShouldFlick:1];
    [v25 setScrollingContentLength:v23];
  }
  else
  {
    id v25 = objc_msgSend(v24, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", @"oscillating", v17, 0, x, y, width, height, v23);
  }
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __92__PXGesturePerformer_performOscillatingInScrollView_rect_speed_direction_completionHandler___block_invoke;
  v30 = &unk_1E5DCE5C8;
  id v31 = v15;
  id v32 = a1;
  id v26 = v15;
  [v25 setCompletionHandler:&v27];
  objc_msgSend(a1, "_amplitudeFactorBySpeed:", a5, v27, v28, v29, v30);
  objc_msgSend(v25, "setAmplitudeFactor:");
  [MEMORY[0x1E4F94850] runTestWithParameters:v25];
}

uint64_t __92__PXGesturePerformer_performOscillatingInScrollView_rect_speed_direction_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _handleResult:*(void *)(a1 + 32) success:1 error:0];
}

+ (BOOL)isAvailable
{
  if (isAvailable_onceToken != -1) {
    dispatch_once(&isAvailable_onceToken, &__block_literal_global_268994);
  }
  return isAvailable_supportsRPT;
}

uint64_t __33__PXGesturePerformer_isAvailable__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F94850] isRecapAvailable];
  isAvailable_supportsRPT = result;
  return result;
}

@end