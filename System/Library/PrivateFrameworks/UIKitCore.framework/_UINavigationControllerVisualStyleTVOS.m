@interface _UINavigationControllerVisualStyleTVOS
- (BOOL)isUsingParallaxTransition;
- (_UINavigationControllerVisualStyleTVOS)initWithNavigationController:(id)a3;
- (id)transitionController;
@end

@implementation _UINavigationControllerVisualStyleTVOS

- (_UINavigationControllerVisualStyleTVOS)initWithNavigationController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationControllerVisualStyleTVOS;
  v3 = [(_UINavigationControllerVisualStyle *)&v7 initWithNavigationController:a3];
  if (v3)
  {
    v4 = objc_alloc_init(_UINavigationCrossfadeAnimator);
    transitionController = v3->_transitionController;
    v3->_transitionController = v4;
  }
  return v3;
}

- (id)transitionController
{
  return self->_transitionController;
}

- (BOOL)isUsingParallaxTransition
{
  return 0;
}

- (void).cxx_destruct
{
}

@end