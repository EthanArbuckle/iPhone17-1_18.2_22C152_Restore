@interface UIStoryboardPushSegueTemplate
- (UIStoryboardPushSegueTemplate)initWithCoder:(id)a3;
- (id)newDefaultPerformHandlerForSegue:(id)a3;
- (int64_t)destinationContainmentContext;
- (int64_t)splitViewControllerIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationContainmentContext:(int64_t)a3;
- (void)setSplitViewControllerIndex:(int64_t)a3;
@end

@implementation UIStoryboardPushSegueTemplate

- (UIStoryboardPushSegueTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStoryboardPushSegueTemplate;
  v5 = [(UIStoryboardSegueTemplate *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_destinationContainmentContext = [v4 decodeIntegerForKey:@"UIDestinationContainmentContext"];
    v5->_splitViewControllerIndex = [v4 decodeIntegerForKey:@"UISplitViewControllerIndex"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIStoryboardPushSegueTemplate;
  id v4 = a3;
  [(UIStoryboardSegueTemplate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStoryboardPushSegueTemplate destinationContainmentContext](self, "destinationContainmentContext", v5.receiver, v5.super_class), @"UIDestinationContainmentContext");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStoryboardPushSegueTemplate splitViewControllerIndex](self, "splitViewControllerIndex"), @"UISplitViewControllerIndex");
}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  destinationContainmentContext = (void *)self->_destinationContainmentContext;
  splitViewControllerIndex = (void *)self->_splitViewControllerIndex;
  objc_initWeak(&location, a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__UIStoryboardPushSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  v9[3] = &unk_1E5308160;
  objc_copyWeak(v10, &location);
  v10[1] = destinationContainmentContext;
  v10[2] = (id)a2;
  v9[4] = self;
  v10[3] = splitViewControllerIndex;
  objc_super v7 = _Block_copy(v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v7;
}

void __66__UIStoryboardPushSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    if (v4 != 1)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"UIStoryboardPushSegueTemplate.m", 53, @"Unknown push segue destination (%ld) encountered.", *(void *)(a1 + 48));

LABEL_16:
      v23 = [v3 identifier];
      v24 = @"Push segues can only be used when the source controller is managed by an instance of UINavigationController.";
      if (v23)
      {
        v25 = NSString;
        v26 = [v3 identifier];
        v24 = [v25 stringWithFormat:@"Could not find a navigation controller for segue '%@'. %@", v26, @"Push segues can only be used when the source controller is managed by an instance of UINavigationController."];
      }
      id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v24 userInfo:0];
      objc_exception_throw(v27);
    }
    objc_super v5 = [WeakRetained sourceViewController];
    v6 = [v5 splitViewController];

    if (!v6)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 32);
      v13 = [v3 sourceViewController];
      v14 = [v3 identifier];
      v15 = [v3 destinationViewController];
      [v10 handleFailureInMethod:v11, v12, @"UIStoryboardPushSegueTemplate.m", 42, @"Could not find a split view controller ancestor for '%@', while performing a split view controller replace segue (identifier '%@') with destination '%@'", v13, v14, v15 object file lineNumber description];
    }
    objc_super v7 = [v6 viewControllers];
    unint64_t v8 = *(void *)(a1 + 64);
    if (v8 >= [v7 count])
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"UIStoryboardPushSegueTemplate.m", 45, @"Unexpected number of view controllers (%ld) for split view controller '%@'. Expected at least %ld view controllers to be present, to perform a push segue for index %ld.", objc_msgSend(v7, "count"), v6, *(void *)(a1 + 64) + 1, *(void *)(a1 + 64) object file lineNumber description];
    }
    id v28 = [v7 objectAtIndex:*(void *)(a1 + 64)];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v18 = *(void *)(a1 + 56);
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = objc_opt_class();
      v21 = [v3 identifier];
      [v17 handleFailureInMethod:v18, v19, @"UIStoryboardPushSegueTemplate.m", 48, @"Expected a navigation controller, but got an instance of '%@' instead, while performing a split view controller push segue (identifier '%@') for index #%ld", v20, v21, *(void *)(a1 + 64) object file lineNumber description];
    }
  }
  else
  {
    v6 = [WeakRetained sourceViewController];
    id v28 = [v6 navigationController];
  }

  if (!v28) {
    goto LABEL_16;
  }
  v9 = [v3 destinationViewController];
  objc_msgSend(v28, "pushViewController:animated:", v9, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (int64_t)destinationContainmentContext
{
  return self->_destinationContainmentContext;
}

- (void)setDestinationContainmentContext:(int64_t)a3
{
  self->_destinationContainmentContext = a3;
}

- (int64_t)splitViewControllerIndex
{
  return self->_splitViewControllerIndex;
}

- (void)setSplitViewControllerIndex:(int64_t)a3
{
  self->_splitViewControllerIndex = a3;
}

@end