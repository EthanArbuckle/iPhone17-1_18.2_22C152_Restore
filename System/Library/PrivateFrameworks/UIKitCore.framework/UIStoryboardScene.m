@interface UIStoryboardScene
- (id)sceneViewController;
- (void)dealloc;
- (void)setSceneViewController:(id)a3;
@end

@implementation UIStoryboardScene

- (id)sceneViewController
{
  return self->sceneViewController;
}

- (void)setSceneViewController:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIStoryboardScene;
  [(UIStoryboardScene *)&v3 dealloc];
}

@end