@interface UIStoryboardReplaceSegueTemplate
- (UIStoryboardReplaceSegueTemplate)initWithCoder:(id)a3;
- (id)newDefaultPerformHandlerForSegue:(id)a3;
- (int64_t)destinationContainmentContext;
- (int64_t)splitViewControllerIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationContainmentContext:(int64_t)a3;
- (void)setSplitViewControllerIndex:(int64_t)a3;
@end

@implementation UIStoryboardReplaceSegueTemplate

- (UIStoryboardReplaceSegueTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStoryboardReplaceSegueTemplate;
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
  v5.super_class = (Class)UIStoryboardReplaceSegueTemplate;
  id v4 = a3;
  [(UIStoryboardSegueTemplate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStoryboardReplaceSegueTemplate destinationContainmentContext](self, "destinationContainmentContext", v5.receiver, v5.super_class), @"UIDestinationContainmentContext");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStoryboardReplaceSegueTemplate splitViewControllerIndex](self, "splitViewControllerIndex"), @"UISplitViewControllerIndex");
}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  destinationContainmentContext = (void *)self->_destinationContainmentContext;
  splitViewControllerIndex = (void *)self->_splitViewControllerIndex;
  objc_initWeak(&location, a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__UIStoryboardReplaceSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
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

void __69__UIStoryboardReplaceSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v18 = WeakRetained;
  if (*(void *)(a1 + 48) != 1)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"UIStoryboardReplaceSegueTemplate.m", 41, @"Unknown push segue destination (%ld) encountered.", *(void *)(a1 + 48));

    id WeakRetained = v18;
  }
  v3 = [WeakRetained sourceViewController];
  id v4 = [v3 splitViewController];

  if (!v4)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = [v18 sourceViewController];
    v15 = [v18 identifier];
    v16 = [v18 destinationViewController];
    [v11 handleFailureInMethod:v12, v13, @"UIStoryboardReplaceSegueTemplate.m", 44, @"Could not find a split view controller ancestor for '%@', while performing a split view controller replace segue (identifier '%@') with destination '%@'", v14, v15, v16 object file lineNumber description];
  }
  objc_super v5 = [v4 viewControllers];
  v6 = (void *)[v5 mutableCopy];

  unint64_t v7 = *(void *)(a1 + 64);
  if (v7 >= [v6 count])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"UIStoryboardReplaceSegueTemplate.m", 47, @"Unexpected number of view controllers (%ld) for split view controller '%@'. Expected at least %ld view controllers to be present, to perform a replace segue for index %ld.", objc_msgSend(v6, "count"), v4, *(void *)(a1 + 64) + 1, *(void *)(a1 + 64) object file lineNumber description];
  }
  uint64_t v8 = *(void *)(a1 + 64);
  v9 = [v18 destinationViewController];
  [v6 replaceObjectAtIndex:v8 withObject:v9];

  [v4 setViewControllers:v6];
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