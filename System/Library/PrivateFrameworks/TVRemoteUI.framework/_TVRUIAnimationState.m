@interface _TVRUIAnimationState
+ (_TVRUIAnimationState)animationStateWithIndex:(unint64_t)a3 previousIndex:(unint64_t)a4 toViewController:(id)a5 fromViewController:(id)a6 isInteractive:(BOOL)a7;
- (BOOL)isInteractive;
- (BOOL)isParticpantViewController:(id)a3;
- (UIViewController)fromViewController;
- (UIViewController)toViewController;
- (_TVRUIAnimationState)initWithIndex:(unint64_t)a3 previousIndex:(unint64_t)a4 toViewController:(id)a5 fromViewController:(id)a6 isInteractive:(BOOL)a7;
- (id)viewControllersNoLongerAnimatingForDestinationAnimationState:(id)a3;
- (unint64_t)index;
- (unint64_t)previousIndex;
@end

@implementation _TVRUIAnimationState

- (_TVRUIAnimationState)initWithIndex:(unint64_t)a3 previousIndex:(unint64_t)a4 toViewController:(id)a5 fromViewController:(id)a6 isInteractive:(BOOL)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_TVRUIAnimationState;
  v15 = [(_TVRUIAnimationState *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_index = a3;
    v15->_previousIndex = a4;
    objc_storeStrong((id *)&v15->_toViewController, a5);
    objc_storeStrong((id *)&v16->_fromViewController, a6);
    v16->_isInteractive = a7;
  }

  return v16;
}

+ (_TVRUIAnimationState)animationStateWithIndex:(unint64_t)a3 previousIndex:(unint64_t)a4 toViewController:(id)a5 fromViewController:(id)a6 isInteractive:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = (void *)[objc_alloc((Class)a1) initWithIndex:a3 previousIndex:a4 toViewController:v13 fromViewController:v12 isInteractive:v7];

  return (_TVRUIAnimationState *)v14;
}

- (BOOL)isParticpantViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(_TVRUIAnimationState *)self toViewController];
  if (v5 == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v6 = [(_TVRUIAnimationState *)self fromViewController];
    BOOL v7 = v6 == v4;
  }
  return v7;
}

- (id)viewControllersNoLongerAnimatingForDestinationAnimationState:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  objc_super v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __85___TVRUIAnimationState_viewControllersNoLongerAnimatingForDestinationAnimationState___block_invoke;
  id v14 = &unk_264800D18;
  id v5 = v4;
  id v15 = v5;
  v16 = &v17;
  id v6 = (void (**)(void *, void *))_Block_copy(&v11);
  BOOL v7 = [(_TVRUIAnimationState *)self fromViewController];
  v6[2](v6, v7);

  v8 = [(_TVRUIAnimationState *)self toViewController];
  v6[2](v6, v8);

  id v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)previousIndex
{
  return self->_previousIndex;
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
}

@end