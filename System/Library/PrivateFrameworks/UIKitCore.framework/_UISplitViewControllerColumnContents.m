@interface _UISplitViewControllerColumnContents
- (UINavigationController)navigationController;
- (UIViewController)navigationControllerWrapper;
- (UIViewController)viewController;
- (_UISplitViewControllerColumnContents)initWithViewController:(id)a3 navigationController:(id)a4 navigationControllerWrapper:(id)a5;
- (id)description;
@end

@implementation _UISplitViewControllerColumnContents

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (UIViewController)navigationControllerWrapper
{
  return self->_navigationControllerWrapper;
}

- (UIViewController)viewController
{
  viewController = self->_viewController;
  if (viewController)
  {
    p_super = viewController;
    v4 = p_super;
  }
  else
  {
    p_super = [(UINavigationController *)self->_navigationController topViewController];
    v4 = p_super;
    if (!p_super) {
      p_super = &self->_navigationController->super;
    }
  }
  v6 = p_super;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationControllerWrapper, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (_UISplitViewControllerColumnContents)initWithViewController:(id)a3 navigationController:(id)a4 navigationControllerWrapper:(id)a5
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  if (v9 | v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UISplitViewControllerColumnContents;
    v12 = [(_UISplitViewControllerColumnContents *)&v16 init];
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_viewController, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[_UISplitViewControllerColumnContents initWithViewController:navigationController:] requires at least one of viewController or navigationController to be non-nil"];
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UISplitViewControllerColumnContents;
  v3 = [(_UISplitViewControllerColumnContents *)&v7 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(_UISplitViewControllerColumnContents *)self viewController];
  objc_msgSend(v4, "appendFormat:", @" viewController=%p", v5);

  if (self->_navigationController) {
    objc_msgSend(v4, "appendFormat:", @" navController=%p", self->_navigationController);
  }
  if (self->_navigationControllerWrapper) {
    objc_msgSend(v4, "appendFormat:", @" navWrapper=%p", self->_navigationControllerWrapper);
  }
  return v4;
}

@end