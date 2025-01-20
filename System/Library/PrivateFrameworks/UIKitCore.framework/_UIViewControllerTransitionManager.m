@interface _UIViewControllerTransitionManager
- (_UIViewControllerTransitionManager)init;
- (void)applyViewControllers:(id)a3;
- (void)configureWithInitialViewControllers:(id)a3;
- (void)performAnimatedTransitionWithRequest:(id)a3;
@end

@implementation _UIViewControllerTransitionManager

- (_UIViewControllerTransitionManager)init
{
  _s17TransitionManagerCMa();
  v3 = (objc_class *)swift_allocObject();
  *((void *)v3 + 2) = MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionManager_transitionManager) = v3;
  v5.receiver = self;
  v5.super_class = (Class)_UIViewControllerTransitionManager;
  return [(_UIViewControllerTransitionManager *)&v5 init];
}

- (void).cxx_destruct
{
}

- (void)configureWithInitialViewControllers:(id)a3
{
}

- (void)applyViewControllers:(id)a3
{
}

- (void)performAnimatedTransitionWithRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1859F8080(v4);
}

@end