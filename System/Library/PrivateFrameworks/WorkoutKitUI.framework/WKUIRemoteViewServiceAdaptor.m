@interface WKUIRemoteViewServiceAdaptor
- (WKUIRemoteViewServiceAdaptor)init;
- (void)dismissRemoteViewControllerOnHostController:(id)a3;
- (void)presentRemoteViewControllerOnHostController:(id)a3 workoutPlanData:(id)a4 dismissHandler:(id)a5 completionHandler:(id)a6;
@end

@implementation WKUIRemoteViewServiceAdaptor

- (WKUIRemoteViewServiceAdaptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)WKUIRemoteViewServiceAdaptor;
  v2 = [(WKUIRemoteViewServiceAdaptor *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor);
    viewServiceAdaptor = v2->_viewServiceAdaptor;
    v2->_viewServiceAdaptor = v3;
  }
  return v2;
}

- (void)presentRemoteViewControllerOnHostController:(id)a3 workoutPlanData:(id)a4 dismissHandler:(id)a5 completionHandler:(id)a6
{
}

- (void)dismissRemoteViewControllerOnHostController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end