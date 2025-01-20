@interface MapsRPTParameters
- (CGPoint)center;
- (MapsRPTParameters)initWithTestName:(id)a3 view:(id)a4 completionHandler:(id)a5 testActions:(id)a6 actionDuration:(double)a7;
- (NSArray)testActions;
- (NSString)testName;
- (UIWindow)window;
- (VKMapView)view;
- (double)actionDuration;
- (double)dragDist;
- (double)duration;
- (id)completionHandler;
- (id)composerBlock;
- (void)prepareWithComposer:(id)a3;
- (void)setActionDuration:(double)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setDragDist:(double)a3;
- (void)setTestName:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation MapsRPTParameters

- (MapsRPTParameters)initWithTestName:(id)a3 view:(id)a4 completionHandler:(id)a5 testActions:(id)a6 actionDuration:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MapsRPTParameters;
  v17 = [(MapsRPTParameters *)&v26 init];
  if (v17)
  {
    id v18 = [v15 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v18;

    objc_storeStrong((id *)&v17->_testName, a3);
    objc_storeStrong((id *)&v17->_testActions, a6);
    objc_storeStrong((id *)&v17->_view, a4);
    [v14 bounds];
    double v21 = v20 * 0.5;
    v17->_dragDist = v21;
    v17->_center.x = v24 + v21;
    v17->_center.y = v23 + v22 * 0.5;
    v17->_actionDuration = a7;
  }

  return v17;
}

- (id)composerBlock
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006676D4;
  v4[3] = &unk_1012F3760;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
}

- (void)prepareWithComposer:(id)a3
{
  v3 = [(MapsRPTParameters *)self window];
  uint64_t v4 = objc_opt_class();
  sub_100668118(v3, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (double)dragDist
{
  return self->_dragDist;
}

- (void)setDragDist:(double)a3
{
  self->_dragDist = a3;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (double)duration
{
  return self->_duration;
}

- (VKMapView)view
{
  return self->_view;
}

- (NSArray)testActions
{
  return self->_testActions;
}

- (double)actionDuration
{
  return self->_actionDuration;
}

- (void)setActionDuration:(double)a3
{
  self->_actionDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testActions, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_testName, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end