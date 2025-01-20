@interface UIDebuggingInformationOverlayInvokeGestureHandler
+ (id)mainHandler;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (void)_handleActivationGesture:(id)a3;
@end

@implementation UIDebuggingInformationOverlayInvokeGestureHandler

+ (id)mainHandler
{
  if (qword_1EB25D470 != -1) {
    dispatch_once(&qword_1EB25D470, &__block_literal_global_590);
  }
  v2 = (void *)qword_1EB25D468;
  return v2;
}

void __64__UIDebuggingInformationOverlayInvokeGestureHandler_mainHandler__block_invoke()
{
  v0 = objc_alloc_init(UIDebuggingInformationOverlayInvokeGestureHandler);
  v1 = (void *)qword_1EB25D468;
  qword_1EB25D468 = (uint64_t)v0;
}

- (void)_handleActivationGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    if (!self->_didCreateTools)
    {
      v4 = (objc_class *)objc_opt_class();
      id v5 = UIDebuggingViewControllerAtTopLevel(@"Prototyping", v4);
      v6 = (objc_class *)objc_opt_class();
      id v7 = UIDebuggingViewControllerAtTopLevel(@"View Hierarchy", v6);
      v8 = (objc_class *)objc_opt_class();
      id v9 = UIDebuggingViewControllerAtTopLevel(@"VC Hierarchy", v8);
      v10 = (objc_class *)objc_opt_class();
      id v11 = UIDebuggingViewControllerAtTopLevel(@"Ivar Explorer", v10);
      v12 = (objc_class *)objc_opt_class();
      id v13 = UIDebuggingViewControllerAtTopLevel(@"Measure", v12);
      v14 = (objc_class *)objc_opt_class();
      id v15 = UIDebuggingViewControllerAtTopLevel(@"Spec Compare", v14);
      self->_didCreateTools = 1;
    }
    id v16 = +[UIDebuggingInformationOverlay overlay];
    [v16 toggleVisibility];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

@end