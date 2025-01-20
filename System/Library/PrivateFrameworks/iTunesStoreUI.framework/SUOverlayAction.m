@interface SUOverlayAction
- (SUOverlayTransition)transition;
- (UIViewController)otherViewController;
- (UIViewController)viewController;
- (int)actionType;
- (int64_t)animationCount;
- (void)dealloc;
- (void)setActionType:(int)a3;
- (void)setAnimationCount:(int64_t)a3;
- (void)setOtherViewController:(id)a3;
- (void)setTransition:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation SUOverlayAction

- (void)dealloc
{
  self->_otherViewController = 0;
  self->_transition = 0;

  self->_viewController = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUOverlayAction;
  [(SUOverlayAction *)&v3 dealloc];
}

- (int)actionType
{
  return self->_type;
}

- (void)setActionType:(int)a3
{
  self->_type = a3;
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int64_t)a3
{
  self->_animationCount = a3;
}

- (UIViewController)otherViewController
{
  return self->_otherViewController;
}

- (void)setOtherViewController:(id)a3
{
}

- (SUOverlayTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

@end