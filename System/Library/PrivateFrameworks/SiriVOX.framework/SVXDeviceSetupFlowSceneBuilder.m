@interface SVXDeviceSetupFlowSceneBuilder
- (id)build;
- (int64_t)sceneID;
- (void)setSceneID:(int64_t)a3;
@end

@implementation SVXDeviceSetupFlowSceneBuilder

- (void)setSceneID:(int64_t)a3
{
  self->_sceneID = a3;
}

- (int64_t)sceneID
{
  return self->_sceneID;
}

- (id)build
{
  v2 = [[SVXDeviceSetupFlowScene alloc] initWithSceneID:self->_sceneID displayKeyFrames:0];

  return v2;
}

@end