@interface SBInCallPresentationSceneUpdateContext
- (CGRect)referenceFrame;
- (NSString)analyticsSource;
- (SBInCallPresentationSceneUpdateContext)initWithReferenceFrame:(CGRect)a3 analyticsSource:(id)a4 transitionRequestBuilderBlock:(id)a5;
- (id)completionHandler;
- (id)postSceneUpdateHandler;
- (id)transitionRequestBuilderBlock;
- (id)validatorHandler;
- (int64_t)executionTarget;
- (void)setAnalyticsSource:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setExecutionTarget:(int64_t)a3;
- (void)setPostSceneUpdateHandler:(id)a3;
- (void)setReferenceFrame:(CGRect)a3;
- (void)setTransitionRequestBuilderBlock:(id)a3;
- (void)setValidatorHandler:(id)a3;
@end

@implementation SBInCallPresentationSceneUpdateContext

- (SBInCallPresentationSceneUpdateContext)initWithReferenceFrame:(CGRect)a3 analyticsSource:(id)a4 transitionRequestBuilderBlock:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBInCallPresentationSceneUpdateContext;
  v13 = [(SBInCallPresentationSceneUpdateContext *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_referenceFrame.origin.CGFloat x = x;
    v13->_referenceFrame.origin.CGFloat y = y;
    v13->_referenceFrame.size.CGFloat width = width;
    v13->_referenceFrame.size.CGFloat height = height;
    uint64_t v15 = [v11 copy];
    analyticsSource = v14->_analyticsSource;
    v14->_analyticsSource = (NSString *)v15;

    uint64_t v17 = [v12 copy];
    id transitionRequestBuilderBlock = v14->_transitionRequestBuilderBlock;
    v14->_id transitionRequestBuilderBlock = (id)v17;

    v14->_executionTarget = 0;
  }

  return v14;
}

- (NSString)analyticsSource
{
  return self->_analyticsSource;
}

- (void)setAnalyticsSource:(id)a3
{
}

- (CGRect)referenceFrame
{
  double x = self->_referenceFrame.origin.x;
  double y = self->_referenceFrame.origin.y;
  double width = self->_referenceFrame.size.width;
  double height = self->_referenceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setReferenceFrame:(CGRect)a3
{
  self->_referenceFrame = a3;
}

- (int64_t)executionTarget
{
  return self->_executionTarget;
}

- (void)setExecutionTarget:(int64_t)a3
{
  self->_executionTarget = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)postSceneUpdateHandler
{
  return self->_postSceneUpdateHandler;
}

- (void)setPostSceneUpdateHandler:(id)a3
{
}

- (id)transitionRequestBuilderBlock
{
  return self->_transitionRequestBuilderBlock;
}

- (void)setTransitionRequestBuilderBlock:(id)a3
{
}

- (id)validatorHandler
{
  return self->_validatorHandler;
}

- (void)setValidatorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validatorHandler, 0);
  objc_storeStrong(&self->_transitionRequestBuilderBlock, 0);
  objc_storeStrong(&self->_postSceneUpdateHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_analyticsSource, 0);
}

@end