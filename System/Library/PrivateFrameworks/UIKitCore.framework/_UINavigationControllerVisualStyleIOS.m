@interface _UINavigationControllerVisualStyleIOS
- (BOOL)isUsingParallaxTransition;
- (_UINavigationControllerVisualStyleIOS)initWithNavigationController:(id)a3;
- (id)interactionController;
- (id)transitionController;
- (void)layoutContainerViewSemanticContentAttributeChanged:(id)a3;
- (void)updateTransitionControllerWithOperation:(int64_t)a3;
@end

@implementation _UINavigationControllerVisualStyleIOS

- (_UINavigationControllerVisualStyleIOS)initWithNavigationController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationControllerVisualStyleIOS;
  v5 = [(_UINavigationControllerVisualStyle *)&v13 initWithNavigationController:v4];
  if (v5)
  {
    v6 = [[_UINavigationParallaxTransition alloc] initWithCurrentOperation:0];
    transitionController = v5->_transitionController;
    v5->_transitionController = v6;

    v8 = [[_UINavigationInteractiveTransition alloc] initWithViewController:v4 animator:0];
    interactionController = v5->_interactionController;
    v5->_interactionController = v8;

    v10 = [v4 view];
    -[_UINavigationInteractiveTransition _setShouldReverseLayoutDirection:](v5->_interactionController, "_setShouldReverseLayoutDirection:", [v10 _shouldReverseLayoutDirection]);

    v11 = [v4 view];
    -[_UINavigationParallaxTransition _setShouldReverseLayoutDirection:](v5->_transitionController, "_setShouldReverseLayoutDirection:", [v11 _shouldReverseLayoutDirection]);
  }
  return v5;
}

- (id)interactionController
{
  return self->_interactionController;
}

- (void)layoutContainerViewSemanticContentAttributeChanged:(id)a3
{
  id v4 = a3;
  -[_UINavigationInteractiveTransition _setShouldReverseLayoutDirection:](self->_interactionController, "_setShouldReverseLayoutDirection:", [v4 _shouldReverseLayoutDirection]);
  uint64_t v5 = [v4 _shouldReverseLayoutDirection];

  transitionController = self->_transitionController;
  [(_UINavigationParallaxTransition *)transitionController _setShouldReverseLayoutDirection:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionController, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
}

- (void)updateTransitionControllerWithOperation:(int64_t)a3
{
  id v10 = [(_UINavigationControllerVisualStyle *)self navigationController];
  [(_UINavigationParallaxTransition *)self->_transitionController setOperation:a3];
  -[_UINavigationParallaxTransition setClipUnderlapWhileTransitioning:](self->_transitionController, "setClipUnderlapWhileTransitioning:", [v10 _clipUnderlapWhileTransitioning]);
  -[_UINavigationParallaxTransition setTransitionStyle:](self->_transitionController, "setTransitionStyle:", [v10 _builtinTransitionStyle]);
  transitionController = self->_transitionController;
  [v10 _builtinTransitionGap];
  -[_UINavigationParallaxTransition setTransitionGap:](transitionController, "setTransitionGap:");
  v6 = self->_transitionController;
  v7 = [v10 view];
  -[_UINavigationParallaxTransition _setShouldReverseLayoutDirection:](v6, "_setShouldReverseLayoutDirection:", [v7 _shouldReverseLayoutDirection]);

  v8 = [v10 delegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = [v8 _navigationControllerDimmingColorForParallaxTransition:v10];
    [(_UINavigationParallaxTransition *)self->_transitionController setOverrideDimmingColor:v9];
  }
}

- (BOOL)isUsingParallaxTransition
{
  return 1;
}

- (id)transitionController
{
  return self->_transitionController;
}

@end