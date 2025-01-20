@interface SXComponentBehaviorHandler
- (BOOL)isSetup;
- (BOOL)requiresContinuousUpdates;
- (SXComponentBehavior)behavior;
- (SXComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4;
- (SXComponentView)componentView;
- (UIView)behaviorView;
- (void)destroyWithBehaviorController:(id)a3;
- (void)setupWithBehaviorController:(id)a3;
@end

@implementation SXComponentBehaviorHandler

- (SXComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXComponentBehaviorHandler;
  v9 = [(SXComponentBehaviorHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_componentView, a3);
    objc_storeStrong((id *)&v10->_behavior, a4);
  }

  return v10;
}

- (void)setupWithBehaviorController:(id)a3
{
  self->_isSetup = 1;
  componentView = self->_componentView;
  id v4 = [(SXComponentBehaviorHandler *)self behavior];
  [(SXComponentView *)componentView didApplyBehavior:v4];
}

- (void)destroyWithBehaviorController:(id)a3
{
  id v4 = [(SXComponentBehaviorHandler *)self componentView];
  [v4 didApplyBehavior:0];

  self->_isSetup = 0;
}

- (UIView)behaviorView
{
  v3 = [(SXComponentBehaviorHandler *)self componentView];
  id v4 = [(SXComponentBehaviorHandler *)self behavior];
  v5 = [v3 contentViewForBehavior:v4];

  return (UIView *)v5;
}

- (BOOL)requiresContinuousUpdates
{
  return 0;
}

- (SXComponentView)componentView
{
  return self->_componentView;
}

- (SXComponentBehavior)behavior
{
  return self->_behavior;
}

- (BOOL)isSetup
{
  return self->_isSetup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_componentView, 0);
}

@end