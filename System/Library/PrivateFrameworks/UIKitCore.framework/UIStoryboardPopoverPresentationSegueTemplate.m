@interface UIStoryboardPopoverPresentationSegueTemplate
- (NSArray)passthroughViews;
- (UIBarButtonItem)anchorBarButtonItem;
- (UIStoryboardPopoverPresentationSegueTemplate)initWithCoder:(id)a3;
- (UIView)anchorView;
- (id)newDefaultPerformHandlerForSegue:(id)a3;
- (id)newDefaultPrepareHandlerForSegue:(id)a3;
- (unint64_t)permittedArrowDirections;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorBarButtonItem:(id)a3;
- (void)setAnchorView:(id)a3;
- (void)setPassthroughViews:(id)a3;
- (void)setPermittedArrowDirections:(unint64_t)a3;
@end

@implementation UIStoryboardPopoverPresentationSegueTemplate

- (UIStoryboardPopoverPresentationSegueTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIStoryboardPopoverPresentationSegueTemplate;
  v5 = [(UIStoryboardSegueTemplate *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_permittedArrowDirections = [v4 decodeIntegerForKey:@"UIPermittedArrowDirections"];
    v6 = [v4 decodeObjectForKey:@"UIPassthroughViews"];
    uint64_t v7 = [v6 copy];
    passthroughViews = v5->_passthroughViews;
    v5->_passthroughViews = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"UIAnchorBarButtonItem"];
    anchorBarButtonItem = v5->_anchorBarButtonItem;
    v5->_anchorBarButtonItem = (UIBarButtonItem *)v9;

    uint64_t v11 = [v4 decodeObjectForKey:@"UIAnchorView"];
    anchorView = v5->_anchorView;
    v5->_anchorView = (UIView *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIStoryboardPopoverPresentationSegueTemplate;
  id v4 = a3;
  [(UIStoryboardSegueTemplate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_permittedArrowDirections, @"UIPermittedArrowDirections", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_passthroughViews forKey:@"UIPassthroughViews"];
  [v4 encodeObject:self->_anchorBarButtonItem forKey:@"UIAnchorBarButtonItem"];
  [v4 encodeObject:self->_anchorView forKey:@"UIAnchorView"];
}

- (id)newDefaultPrepareHandlerForSegue:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIStoryboardPopoverPresentationSegueTemplate *)self anchorView];
  v6 = [(UIStoryboardPopoverPresentationSegueTemplate *)self anchorBarButtonItem];
  uint64_t v7 = [(UIStoryboardPopoverPresentationSegueTemplate *)self permittedArrowDirections];
  objc_initWeak(&location, v4);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__UIStoryboardPopoverPresentationSegueTemplate_newDefaultPrepareHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E53080E8;
  objc_copyWeak(v15, &location);
  id v13 = v5;
  id v14 = v6;
  v15[1] = v7;
  id v8 = v6;
  id v9 = v5;
  v10 = _Block_copy(aBlock);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  return v10;
}

void __81__UIStoryboardPopoverPresentationSegueTemplate_newDefaultPrepareHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained destinationViewController];
  [v2 setModalPresentationStyle:7];

  v3 = [WeakRetained destinationViewController];
  id v4 = [v3 popoverPresentationController];

  [v4 setSourceView:*(void *)(a1 + 32)];
  [v4 setSourceItem:*(void *)(a1 + 40)];
  [v4 setPermittedArrowDirections:*(void *)(a1 + 56)];
}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  id v5 = a3;
  v6 = [(UIStoryboardPopoverPresentationSegueTemplate *)self anchorBarButtonItem];
  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(UIStoryboardPopoverPresentationSegueTemplate *)self anchorView];
    BOOL v7 = v8 != 0;
  }
  objc_initWeak(&location, v5);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__UIStoryboardPopoverPresentationSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E5308110;
  objc_copyWeak(v12, &location);
  BOOL v13 = v7;
  v12[1] = (id)a2;
  void aBlock[4] = self;
  id v9 = _Block_copy(aBlock);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v9;
}

void __81__UIStoryboardPopoverPresentationSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained sourceViewController];
  v3 = [WeakRetained destinationViewController];
  [v3 _setSegueResponsibleForModalPresentation:WeakRetained];
  [v3 _setSourceViewControllerIfPresentedViaPopoverSegue:v2];
  if (*(unsigned char *)(a1 + 56))
  {
    objc_msgSend(v2, "presentViewController:animated:completion:", v3, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"UIStoryboardPopoverPresentationSegueTemplate.m" lineNumber:70 description:@"A popover segue must have either an anchorBarButtonItem or an anchorView."];
  }
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
}

- (UIView)anchorView
{
  return self->_anchorView;
}

- (void)setAnchorView:(id)a3
{
}

- (UIBarButtonItem)anchorBarButtonItem
{
  return self->_anchorBarButtonItem;
}

- (void)setAnchorBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
}

@end