@interface SBApplicationSceneView
- (SBApplication)application;
- (SBApplicationSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 hostRequester:(id)a7;
- (id)deviceApplicationSceneView;
@end

@implementation SBApplicationSceneView

- (SBApplicationSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 hostRequester:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBApplicationSceneView;
  v14 = -[SBSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](&v17, sel_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester_, v13, a5, a6, a7, width, height);
  if (v14)
  {
    v15 = (void *)[v13 newScenePlaceholderContentContextWithActivationSettings:0];
    [(SBSceneView *)v14 setPlaceholderContentContext:v15];
  }
  return v14;
}

- (id)deviceApplicationSceneView
{
  return 0;
}

- (SBApplication)application
{
  v2 = [(SBSceneView *)self sceneHandle];
  v3 = [v2 application];

  return (SBApplication *)v3;
}

@end