@interface PhotosTestingRPTHelper
+ (BOOL)_contentStartFromEndFromOptions:(id)a3;
+ (BOOL)isRPTAvailable;
+ (BOOL)isRPTStyleTestName:(id)a3;
+ (BOOL)shouldUseRPTScrollingForRPTOptions:(id)a3;
+ (double)_pagesFromOptions:(id)a3;
+ (id)_oscillationScrollTestParamsWithScrollBounds:(CGRect)a3 contentFromEnd:(BOOL)a4 axis:(unint64_t)a5 speed:(int64_t)a6 pages:(double)a7 iterations:(int64_t)a8 completionHandler:(id)a9;
+ (id)_paramsArrayByParams:(id)a3 iterations:(int64_t)a4;
+ (id)_shareSheetScrollTestParamsWithScrollBounds:(CGRect)a3 pages:(double)a4 iterations:(int64_t)a5 completionHandler:(id)a6;
+ (id)_swipeTestParamsWithScrollBounds:(CGRect)a3 contentFromEnd:(BOOL)a4 axis:(unint64_t)a5 speed:(int64_t)a6 swipeCount:(int64_t)a7 iterations:(int64_t)a8 completionHandler:(id)a9;
+ (id)gesturePerformerForTestWithName:(id)a3 options:(id)a4;
+ (int64_t)_RPTOppositeOfDirection:(int64_t)a3;
+ (int64_t)_RPTScrollDirectionForContentFromEnd:(BOOL)a3 scrollVertical:(BOOL)a4;
+ (int64_t)_iterationsFromOptions:(id)a3;
+ (int64_t)_speedFromTestName:(id)a3;
+ (int64_t)_swipeCountFromOptions:(id)a3;
+ (unint64_t)_axisFromOptions:(id)a3;
+ (void)_configSwipeParams:(id)a3 forSpeed:(int64_t)a4 returnTrip:(BOOL)a5;
+ (void)runTestWithName:(id)a3 RPTOptions:(id)a4 scrollBounds:(CGRect)a5 completionHandler:(id)a6;
+ (void)runTestWithName:(id)a3 RPTOptions:(id)a4 scrollView:(id)a5 completionHandler:(id)a6;
@end

@implementation PhotosTestingRPTHelper

+ (id)gesturePerformerForTestWithName:(id)a3 options:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (([a1 isRPTAvailable] & 1) == 0)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PhotosTestingRPTHelper.m", 397, @"Invalid parameter not satisfying: %@", @"self.isRPTAvailable" object file lineNumber description];
  }
  v9 = [[_PhotosTestingRPTGesturePerformer alloc] initWithTestName:v8 testOptions:v7];

  return v9;
}

+ (int64_t)_RPTScrollDirectionForContentFromEnd:(BOOL)a3 scrollVertical:(BOOL)a4
{
  if (a4) {
    return !a3;
  }
  if (a3) {
    int64_t v4 = 3;
  }
  else {
    int64_t v4 = 2;
  }
  v6 = +[UIScreen mainScreen];
  id v7 = [v6 traitCollection];
  id v8 = [v7 layoutDirection];

  if (v8 != (id)1) {
    return v4;
  }

  return (int64_t)[a1 _RPTOppositeOfDirection:v4];
}

+ (int64_t)_RPTOppositeOfDirection:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return qword_10004C780[a3];
  }
}

+ (int64_t)_iterationsFromOptions:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"iterations"];
  int64_t v4 = (int64_t)[v3 integerValue];

  if (v4 <= 1) {
    return 1;
  }
  else {
    return v4;
  }
}

+ (double)_pagesFromOptions:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"pages"];
  [v3 floatValue];
  float v5 = v4;
  double v6 = v4;

  double result = 1.0;
  if (v5 > 0.0) {
    return v6;
  }
  return result;
}

+ (int64_t)_swipeCountFromOptions:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"RPT_SwipeCount"];
  uint64_t v4 = (uint64_t)[v3 integerValue];

  return v4 & ~(v4 >> 63);
}

+ (BOOL)_contentStartFromEndFromOptions:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"RPT_ContentStartPos"];
  char v4 = [v3 isEqualToString:@"begin"] ^ 1;

  return v4;
}

+ (unint64_t)_axisFromOptions:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"RPT_Axis"];
  if ([v3 isEqualToString:@"horizontal"]) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

+ (int64_t)_speedFromTestName:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 lowercaseString];
  unsigned __int8 v5 = [v4 containsString:@"slow"];

  if (v5)
  {
    int64_t v6 = 0;
  }
  else
  {
    id v7 = [v3 lowercaseString];
    unsigned int v8 = [v7 containsString:@"fast"];

    if (v8) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 1;
    }
  }

  return v6;
}

+ (void)_configSwipeParams:(id)a3 forSpeed:(int64_t)a4 returnTrip:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  switch(a4)
  {
    case 2:
      BOOL v8 = !v5;
      uint64_t v9 = 16;
      uint64_t v10 = 12;
      goto LABEL_7;
    case 1:
      BOOL v8 = !v5;
      uint64_t v9 = 10;
      uint64_t v10 = 8;
      goto LABEL_7;
    case 0:
      BOOL v8 = !v5;
      uint64_t v9 = 8;
      uint64_t v10 = 6;
LABEL_7:
      if (v8) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = v10;
      }
      id v13 = v7;
      [v7 setSwipeCount:v11];
      v12 = +[PXGesturePerformer swipeSpeedFactor:a4];
      [v13 setSwipeSpeedFactor:v12];

      id v7 = v13;
      break;
  }
}

+ (id)_paramsArrayByParams:(id)a3 iterations:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if (a4 >= 1)
  {
    do
    {
      [v6 addObjectsFromArray:v5];
      --a4;
    }
    while (a4);
  }

  return v6;
}

+ (id)_shareSheetScrollTestParamsWithScrollBounds:(CGRect)a3 pages:(double)a4 iterations:(int64_t)a5 completionHandler:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a6;
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  id v13 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:0 scrollBounds:0 scrollContentLength:0 direction:x completionHandler:y width:width height:height CGRectGetHeight:v23];
  [v13 setPreventSheetDismissal:1];
  [v13 setShouldFlick:0];
  id v21 = v13;
  v14 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = [a1 _paramsArrayByParams:v14 iterations:a5];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003EE7C;
  v19[3] = &unk_100064570;
  id v20 = v12;
  id v16 = v12;
  id v17 = +[RPTGroupScrollTestParameters newWithTestName:0 parameters:v15 completionHandler:v19];

  return v17;
}

+ (id)_oscillationScrollTestParamsWithScrollBounds:(CGRect)a3 contentFromEnd:(BOOL)a4 axis:(unint64_t)a5 speed:(int64_t)a6 pages:(double)a7 iterations:(int64_t)a8 completionHandler:(id)a9
{
  BOOL v11 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a9;
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  if (a5 == 2) {
    double v22 = CGRectGetHeight(*(CGRect *)&v18);
  }
  else {
    double v22 = CGRectGetWidth(*(CGRect *)&v18);
  }
  id v23 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", 0, objc_msgSend(a1, "_RPTScrollDirectionForContentFromEnd:scrollVertical:", v11, a5 == 2), 0, x, y, width, height, v22);
  [v23 setIterationDurationFactor:0.7];
  id v31 = v23;
  v24 = +[NSArray arrayWithObjects:&v31 count:1];
  v25 = [a1 _paramsArrayByParams:v24 iterations:a8];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003F090;
  v29[3] = &unk_100064570;
  id v30 = v17;
  id v26 = v17;
  id v27 = +[RPTGroupScrollTestParameters newWithTestName:0 parameters:v25 completionHandler:v29];

  return v27;
}

+ (id)_swipeTestParamsWithScrollBounds:(CGRect)a3 contentFromEnd:(BOOL)a4 axis:(unint64_t)a5 speed:(int64_t)a6 swipeCount:(int64_t)a7 iterations:(int64_t)a8 completionHandler:(id)a9
{
  BOOL v13 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a9;
  id v20 = [a1 _RPTScrollDirectionForContentFromEnd:v13 scrollVertical:a5 == 2];
  id v21 = [objc_alloc((Class)RPTDirectionalSwipeTestParameters) initWithTestName:@"scrollOut" scrollingBounds:1 _UIScrollDirectionFromRPTScrollDirection() swipeCount:0 completionHandler:x y width height];
  [a1 _configSwipeParams:v21 forSpeed:a6 returnTrip:0];
  [v21 setShouldFlick:1];
  [a1 _RPTOppositeOfDirection:v20];
  id v22 = [objc_alloc((Class)RPTDirectionalSwipeTestParameters) initWithTestName:@"scrollBack" scrollingBounds:1 _UIScrollDirectionFromRPTScrollDirection() swipeCount:0 completionHandler:x y width height];
  [a1 _configSwipeParams:v22 forSpeed:a6 returnTrip:1];
  [v22 setShouldFlick:1];
  if (a7 >= 1)
  {
    [v21 setSwipeCount:a7];
    [v22 setSwipeCount:a7];
  }
  v30[0] = v21;
  v30[1] = v22;
  id v23 = +[NSArray arrayWithObjects:v30 count:2];
  v24 = [a1 _paramsArrayByParams:v23 iterations:a8];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10003F344;
  v28[3] = &unk_100064570;
  id v29 = v19;
  id v25 = v19;
  id v26 = +[RPTGroupScrollTestParameters newWithTestName:0 parameters:v24 completionHandler:v28];

  return v26;
}

+ (void)runTestWithName:(id)a3 RPTOptions:(id)a4 scrollBounds:(CGRect)a5 completionHandler:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a3;
  id v14 = a4;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  void v30[2] = sub_10003F6E8;
  v30[3] = &unk_100064570;
  id v15 = a6;
  id v31 = v15;
  id v16 = objc_retainBlock(v30);
  if ([a1 isRPTAvailable])
  {
    id v29 = v13;
    id v17 = [a1 _speedFromTestName:v13];
    id v18 = [a1 _axisFromOptions:v14];
    [a1 _pagesFromOptions:v14];
    double v20 = v19;
    id v21 = [a1 _iterationsFromOptions:v14];
    id v22 = [a1 _contentStartFromEndFromOptions:v14];
    id v23 = [a1 _swipeCountFromOptions:v14];
    v24 = [v14 objectForKeyedSubscript:@"RPT_Style"];
    if ([v24 isEqualToString:@"swipe"])
    {
      uint64_t v25 = [a1 _swipeTestParamsWithScrollBounds:v22 contentFromEnd:v18 axis:v17 speed:v23 swipeCount:v21 iterations:v15 completionHandler:x, y, width, height];
    }
    else
    {
      if (![v24 isEqualToString:@"oscillation"])
      {
        id v13 = v29;
        if ([v24 isEqualToString:@"shareSheet"])
        {
          id v27 = [a1 _shareSheetScrollTestParamsWithScrollBounds:v21 pages:v15 iterations:x, y, width, height completionHandler:v20];
          if (v27) {
            goto LABEL_10;
          }
        }
        goto LABEL_13;
      }
      uint64_t v25 = [a1 _oscillationScrollTestParamsWithScrollBounds:v22 contentFromEnd:v18 axis:v17 speed:v21 pages:v15 iterations:x y:y width:width height:height completionHandler:v20];
    }
    id v27 = (void *)v25;
    id v13 = v29;
    if (v25)
    {
LABEL_10:
      [v27 setTestName:v13];
      +[RPTTestRunner runTestWithParameters:v27];

LABEL_16:
      goto LABEL_17;
    }
LABEL_13:
    v28 = PLPPTGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v13;
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed to generate RPT scroll test (%@) for test params, options is: %@", buf, 0x16u);
    }

    ((void (*)(void *))v16[2])(v16);
    goto LABEL_16;
  }
  id v26 = PLPPTGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed: RecapPerformanceTesting framework is not available.", buf, 2u);
  }

  ((void (*)(void *))v16[2])(v16);
LABEL_17:
}

+ (void)runTestWithName:(id)a3 RPTOptions:(id)a4 scrollView:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  RPTGetBoundsForView();
  [a1 runTestWithName:v11 RPTOptions:v10 scrollBounds:v9];
}

+ (BOOL)shouldUseRPTScrollingForRPTOptions:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"RPT_Style"];
  BOOL v4 = ([v3 isEqualToString:@"swipe"] & 1) != 0
    || ([v3 isEqualToString:@"oscillation"] & 1) != 0
    || [v3 isEqualToString:@"shareSheet"];

  return v4;
}

+ (BOOL)isRPTStyleTestName:(id)a3
{
  return _[a3 hasSuffix:@"Natural"];
}

+ (BOOL)isRPTAvailable
{
  if (qword_1000733A0 != -1) {
    dispatch_once(&qword_1000733A0, &stru_100064548);
  }
  return byte_100073398;
}

@end