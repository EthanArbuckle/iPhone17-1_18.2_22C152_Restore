@interface UIScrollView
- (void)ic_performRecapScrollTestNamed:(id)a3 iterations:(unint64_t)a4;
- (void)scrollToTop;
@end

@implementation UIScrollView

- (void)scrollToTop
{
}

- (void)ic_performRecapScrollTestNamed:(id)a3 iterations:(unint64_t)a4
{
  id v5 = a3;
  if (byte_1006AA210)
  {
    v6 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:v5 scrollView:self completionHandler:0];
    +[RPTTestRunner runTestWithParameters:v6];
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1004DAE40(v6);
    }
  }
}

@end