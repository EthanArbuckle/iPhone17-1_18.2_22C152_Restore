@interface UIInputViewAnimationControllerViewController
+ (id)controllerWithContext:(id)a3;
- (UIInputViewAnimationControllerViewController)initWithContext:(id)a3;
- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5;
- (void)completeAnimationWithHost:(id)a3 context:(id)a4;
- (void)performAnimationWithHost:(id)a3 context:(id)a4;
@end

@implementation UIInputViewAnimationControllerViewController

- (UIInputViewAnimationControllerViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIInputViewAnimationControllerViewController;
  v6 = [(UIInputViewAnimationControllerViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = [v5 _animator];
    animator = v7->_animator;
    v7->_animator = (UIViewControllerAnimatedTransitioning_Keyboard *)v8;
  }
  return v7;
}

+ (id)controllerWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithContext:v4];

  return v5;
}

- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  uint64_t v8 = (UIInputViewSetPlacement *)a5;
  v9 = +[UIInputViewAnimationControllerViewControllerContext contextWithHost:a3 startPlacement:a4 endPlacement:v8 transitionContext:self->_context];
  endPlacement = self->_endPlacement;
  self->_endPlacement = v8;
  objc_super v11 = v8;

  [(UIViewControllerAnimatedTransitioning_Keyboard *)self->_animator prepareToAnimateKeyboard:v9];
  return v9;
}

- (void)performAnimationWithHost:(id)a3 context:(id)a4
{
  animator = self->_animator;
  id v7 = a3;
  [(UIViewControllerAnimatedTransitioning_Keyboard *)animator animateKeyboard:a4];
  [v7 updateToPlacement:self->_endPlacement withNormalAnimationsAndNotifications:1];
}

- (void)completeAnimationWithHost:(id)a3 context:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPlacement, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end