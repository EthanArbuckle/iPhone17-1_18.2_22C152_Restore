@interface UIStoryboardUnwindSegueTemplate
- (NSString)action;
- (UIStoryboardUnwindSegueTemplate)initWithCoder:(id)a3;
- (id)_legacyUnwindExecutorForTarget:(id)a3;
- (id)_perform:(id)a3;
- (id)_performWithDestinationViewController:(id)a3 sender:(id)a4;
- (id)instantiateOrFindDestinationViewControllerWithSender:(id)a3;
- (id)newDefaultPerformHandlerForSegue:(id)a3;
- (id)segueWithDestinationViewController:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
@end

@implementation UIStoryboardUnwindSegueTemplate

- (UIStoryboardUnwindSegueTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIStoryboardUnwindSegueTemplate;
  v5 = [(UIStoryboardSegueTemplate *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"UIAction"];
    uint64_t v7 = [v6 copy];
    action = v5->_action;
    v5->_action = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIStoryboardUnwindSegueTemplate;
  id v4 = a3;
  [(UIStoryboardSegueTemplate *)&v6 encodeWithCoder:v4];
  v5 = [(UIStoryboardUnwindSegueTemplate *)self action];
  [v4 encodeObject:v5 forKey:@"UIAction"];
}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sourceViewController];
  v5 = [v3 destinationViewController];
  if (v4 == v5)
  {
    v8 = &__block_literal_global_117_4;
  }
  else
  {
    id v6 = [[_UIStoryboardUnwindChain alloc] initFromSourceViewController:v4 toDestinationViewController:v5];
    objc_initWeak(&location, v3);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UIStoryboardUnwindSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke_2;
    aBlock[3] = &unk_1E52D9960;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    id v7 = v6;
    v8 = _Block_copy(aBlock);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __68__UIStoryboardUnwindSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) modalAncestorContainingSourceViewController];
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__UIStoryboardUnwindSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke_3;
  v7[3] = &unk_1E5308230;
  id v8 = v3;
  id v9 = WeakRetained;
  id v5 = WeakRetained;
  id v6 = v3;
  [v4 enumerateViewControllersFromModalAncestorUpToButNotIncludingDestination:v7];
}

void __68__UIStoryboardUnwindSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v8 childModalViewController];
  if (v6 != v5)
  {
    id v7 = v8;
    if (v6 && *(id *)(a1 + 32) != v8)
    {
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
      id v7 = v8;
    }
    [v7 unwindForSegue:*(void *)(a1 + 40) towardsViewController:v5];
  }
}

- (id)_legacyUnwindExecutorForTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(UIStoryboardSegueTemplate *)self viewController];
  id v6 = _UIFirstPopoverSeguePresentedControllerInUnwindingResponderChain(v5, v4);

  id v7 = [v4 childModalViewController];
  if (v7)
  {

LABEL_3:
    id v8 = v4;
    goto LABEL_6;
  }
  id v9 = [v6 _sourceViewControllerIfPresentedViaPopoverSegue];

  if (v9 == v4) {
    goto LABEL_3;
  }
  id v8 = [v4 parentViewController];
LABEL_6:
  objc_super v10 = v8;

  return v10;
}

- (id)instantiateOrFindDestinationViewControllerWithSender:(id)a3
{
  id v4 = a3;
  id v5 = [UIStoryboardUnwindSegueSource alloc];
  id v6 = [(UIStoryboardSegueTemplate *)self viewController];
  id v7 = [(UIStoryboardUnwindSegueTemplate *)self action];
  id v8 = [(UIStoryboardUnwindSegueSource *)v5 _initWithSourceViewController:v6 action:NSSelectorFromString(v7) sender:v4];

  id v9 = [v8 _findDestination];

  return v9;
}

- (id)segueWithDestinationViewController:(id)a3
{
  id v5 = a3;
  id v6 = [(UIStoryboardUnwindSegueTemplate *)self action];

  if (!v6)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"UIStoryboardUnwindSegueTemplate.m" lineNumber:435 description:@"Cannot perform an unwind without an unwind action"];
  }
  id v7 = [(UIStoryboardUnwindSegueTemplate *)self _legacyUnwindExecutorForTarget:v5];
  if (!v7 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UIStoryboardUnwindSegueTemplate.m", 442, @"Could not find a view controller to execute unwinding for %@", v5 object file lineNumber description];
    goto LABEL_14;
  }
  uint64_t v8 = qword_1EB263498;
  id v9 = v7;
  if (v8 != -1) {
    dispatch_once(&qword_1EB263498, &__block_literal_global_150_2);
  }
  objc_super v10 = objc_opt_class();

  int v11 = [v10 isSubclassOfClass:qword_1EB263490];
  id v12 = &qword_1EB263488;
  if (v11) {
    id v12 = &qword_1EB263490;
  }
  if ([v10 doesOverrideViewControllerMethod:_MergedGlobals_1237 inBaseClass:*v12])
  {
    v13 = [(UIStoryboardSegueTemplate *)self viewController];
    v14 = [(UIStoryboardSegueTemplate *)self identifier];
    v15 = [v9 segueForUnwindingToViewController:v5 fromViewController:v13 identifier:v14];

    goto LABEL_15;
  }
  v20.receiver = self;
  v20.super_class = (Class)UIStoryboardUnwindSegueTemplate;
  v15 = [(UIStoryboardSegueTemplate *)&v20 segueWithDestinationViewController:v5];
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [(UIStoryboardSegueTemplate *)self viewController];
    [v16 handleFailureInMethod:a2, self, @"UIStoryboardUnwindSegueTemplate.m", 453, @"Failed to create a segue for unwinding from %@ to %@", v17, v5 object file lineNumber description];

LABEL_14:
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (id)_perform:(id)a3
{
  id v4 = a3;
  id v5 = [(UIStoryboardUnwindSegueTemplate *)self instantiateOrFindDestinationViewControllerWithSender:v4];
  if (v5)
  {
    id v6 = [(UIStoryboardUnwindSegueTemplate *)self _performWithDestinationViewController:v5 sender:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_performWithDestinationViewController:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIStoryboardUnwindSegueTemplate *)self action];
  id v9 = NSSelectorFromString(v8);

  objc_super v10 = [(UIStoryboardUnwindSegueTemplate *)self segueWithDestinationViewController:v6];
  if (v10)
  {
    int v11 = [(UIStoryboardSegueTemplate *)self viewController];
    [v11 prepareForSegue:v10 sender:v7];

    if (dyld_program_sdk_at_least()) {
      objc_msgSend(v6, v9, v10);
    }
    else {
      objc_msgSend(v6, sel_performSelector_withObject_, v9, v10);
    }
    BOOL v12 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:[(UIStoryboardSegueTemplate *)self animates]];
    [v10 perform];
    +[UIView setAnimationsEnabled:v12];
  }

  return v10;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end