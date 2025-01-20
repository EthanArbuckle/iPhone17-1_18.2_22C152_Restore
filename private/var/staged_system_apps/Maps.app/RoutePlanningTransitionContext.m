@interface RoutePlanningTransitionContext
- (BOOL)initiatedFromFullLayout;
- (RoutePlanningTransitionContext)initWithFullTableHeight:(double)a3 initiatedFromFullLayout:(BOOL)a4 withInitialOffsetY:(double)a5 heightToFrame:(double)a6 originToFrameHandler:(id)a7;
- (double)currentFrameOrigin;
- (double)heightToFrame;
- (double)initialOffsetY;
- (double)tableViewHeightForFullLayout;
- (id)description;
- (id)originToFrameHandler;
- (void)setHeightToFrame:(double)a3;
- (void)setInitialOffsetY:(double)a3;
- (void)setInitiatedFromFullLayout:(BOOL)a3;
- (void)setOriginToFrameHandler:(id)a3;
- (void)setTableViewHeightForFullLayout:(double)a3;
@end

@implementation RoutePlanningTransitionContext

- (RoutePlanningTransitionContext)initWithFullTableHeight:(double)a3 initiatedFromFullLayout:(BOOL)a4 withInitialOffsetY:(double)a5 heightToFrame:(double)a6 originToFrameHandler:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)RoutePlanningTransitionContext;
  v13 = [(RoutePlanningTransitionContext *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(RoutePlanningTransitionContext *)v13 setTableViewHeightForFullLayout:a3];
    [(RoutePlanningTransitionContext *)v14 setHeightToFrame:a6];
    [(RoutePlanningTransitionContext *)v14 setInitialOffsetY:a5];
    [(RoutePlanningTransitionContext *)v14 setInitiatedFromFullLayout:v9];
    [(RoutePlanningTransitionContext *)v14 setOriginToFrameHandler:v12];
  }

  return v14;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningTransitionContext;
  v3 = [(RoutePlanningTransitionContext *)&v9 description];
  [(RoutePlanningTransitionContext *)self tableViewHeightForFullLayout];
  uint64_t v5 = v4;
  [(RoutePlanningTransitionContext *)self heightToFrame];
  v7 = +[NSString stringWithFormat:@"%@ (tableViewHeightForFullLayout: %#.5lf, heightToFrame: %#.5lf)", v3, v5, v6];

  return v7;
}

- (double)currentFrameOrigin
{
  v3 = [(RoutePlanningTransitionContext *)self originToFrameHandler];
  if (v3)
  {
    uint64_t v4 = [(RoutePlanningTransitionContext *)self originToFrameHandler];
    double v5 = v4[2]();
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)tableViewHeightForFullLayout
{
  return self->_tableViewHeightForFullLayout;
}

- (void)setTableViewHeightForFullLayout:(double)a3
{
  self->_tableViewHeightForFullLayout = a3;
}

- (double)heightToFrame
{
  return self->_heightToFrame;
}

- (void)setHeightToFrame:(double)a3
{
  self->_heightToFrame = a3;
}

- (double)initialOffsetY
{
  return self->_initialOffsetY;
}

- (void)setInitialOffsetY:(double)a3
{
  self->_initialOffsetY = a3;
}

- (BOOL)initiatedFromFullLayout
{
  return self->_initiatedFromFullLayout;
}

- (void)setInitiatedFromFullLayout:(BOOL)a3
{
  self->_initiatedFromFullLayout = a3;
}

- (id)originToFrameHandler
{
  return self->_originToFrameHandler;
}

- (void)setOriginToFrameHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end