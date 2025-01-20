@interface ARSCNView
- (id)sceneRenderingQueue;
@end

@implementation ARSCNView

- (id)sceneRenderingQueue
{
  return [(ARSCNView *)self _renderingQueue];
}

@end