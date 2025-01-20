@interface ScrollViewTest
- (ScrollViewTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5;
- (UIScrollView)scrollView;
- (id)checkTestPreconditions;
- (void)navigateToScrollView;
- (void)runTest;
@end

@implementation ScrollViewTest

- (ScrollViewTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ScrollViewTest;
  v10 = [(ApplicationTest *)&v16 initWithApplication:v8 model:a4 options:v9];
  if (v10)
  {
    v11 = [TestScroller alloc];
    v12 = [(id)objc_opt_class() testName];
    v13 = [(TestScroller *)v11 initWithOptions:v9 testName:v12 application:v8];
    scroller = v10->_scroller;
    v10->_scroller = v13;
  }
  return v10;
}

- (id)checkTestPreconditions
{
  return 0;
}

- (void)runTest
{
  v3 = [(ApplicationTest *)self application];
  v4 = [(id)objc_opt_class() testName];
  v5 = [(ScrollViewTest *)self checkTestPreconditions];
  if ([(TestScroller *)self->_scroller inputInvalid])
  {
    [v3 startedTest:v4];
    CFStringRef v6 = @"input invalid was marked as true when trying to run test";
    v7 = v3;
    id v8 = v4;
  }
  else
  {
    if (!v5)
    {
      [(ScrollViewTest *)self navigateToScrollView];
      dispatch_time_t v9 = dispatch_time(0, 5000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000D9A5C;
      block[3] = &unk_1001D2740;
      block[4] = self;
      dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
      goto LABEL_7;
    }
    [v3 startedTest:v4];
    v7 = v3;
    id v8 = v4;
    CFStringRef v6 = v5;
  }
  [v7 failedTest:v8 withFailure:v6];
LABEL_7:
}

- (void).cxx_destruct
{
}

- (void)navigateToScrollView
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (UIScrollView)scrollView
{
  return 0;
}

@end