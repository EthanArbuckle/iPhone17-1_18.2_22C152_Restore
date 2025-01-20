@interface _PhotosTestingRPTGesturePerformer
- (NSDictionary)testOptions;
- (NSString)testName;
- (_PhotosTestingRPTGesturePerformer)initWithTestName:(id)a3 testOptions:(id)a4;
- (void)swipeTowardsEdge:(unint64_t)a3 touchArea:(CGRect)a4 inCoordinateSpace:(id)a5 completionHandler:(id)a6;
- (void)testRunner:(id)a3 didFailRunningParameters:(id)a4 withError:(id)a5;
@end

@implementation _PhotosTestingRPTGesturePerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOptions, 0);

  objc_storeStrong((id *)&self->_testName, 0);
}

- (NSDictionary)testOptions
{
  return self->_testOptions;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)testRunner:(id)a3 didFailRunningParameters:(id)a4 withError:(id)a5
{
  id v5 = a5;
  v6 = PLPPTGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "RPTTest failed: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)swipeTowardsEdge:(unint64_t)a3 touchArea:(CGRect)a4 inCoordinateSpace:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = +[UIScreen mainScreen];
  v13 = [v12 coordinateSpace];

  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  unint64_t v18 = a3 - 1;
  if (a3 - 1 >= 8 || ((0x8Bu >> v18) & 1) == 0)
  {
    v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"PhotosTestingRPTHelper.m" lineNumber:444 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  double v19 = v14;
  double v20 = v15;
  double v21 = v16;
  double v22 = v17;
  uint64_t v23 = qword_10004C7A0[v18];
  id v24 = objc_alloc((Class)RPTDirectionalSwipeTestParameters);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003E710;
  v29[3] = &unk_100064570;
  id v30 = v11;
  id v25 = v11;
  id v26 = [v24 initWithTestName:0 scrollingBounds:1 swipeCount:v23 direction:v29 completionHandler:v19, v20, v21, v22];
  v27 = +[PXGesturePerformer swipeSpeedFactor:1];
  [v26 setSwipeSpeedFactor:v27];

  [v26 setShouldFlick:1];
  [v26 setSwipeCount:1];
  +[RPTTestRunner runTestWithParameters:v26 delegate:self];
}

- (_PhotosTestingRPTGesturePerformer)initWithTestName:(id)a3 testOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PhotosTestingRPTGesturePerformer;
  id v8 = [(_PhotosTestingRPTGesturePerformer *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    testName = v8->_testName;
    v8->_testName = v9;

    id v11 = (NSDictionary *)[v7 copy];
    testOptions = v8->_testOptions;
    v8->_testOptions = v11;
  }
  return v8;
}

@end