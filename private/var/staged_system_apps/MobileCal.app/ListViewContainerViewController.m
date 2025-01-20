@interface ListViewContainerViewController
- (BOOL)representsDayInViewHierarchy;
- (BOOL)shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported;
- (Class)childViewControllerClassForTraits:(id)a3;
- (CompactListViewController)compactController;
- (MultiColumnMonthViewController)regularController;
- (id)childViewControllerForCompactWidthRegularHeight;
- (id)childViewControllerForRegularWidthRegularHeight;
- (id)currentChildViewController;
- (void)setCompactController:(id)a3;
- (void)setRegularController:(id)a3;
@end

@implementation ListViewContainerViewController

- (id)currentChildViewController
{
  v4.receiver = self;
  v4.super_class = (Class)ListViewContainerViewController;
  v2 = [(MainViewControllerContainer *)&v4 currentChildViewController];

  return v2;
}

- (BOOL)shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported
{
  return 1;
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  v3 = *(void **)(&self->super._animatingViewTransition + 1);
  if (!v3)
  {
    objc_super v4 = [CompactListViewController alloc];
    v5 = [(MainViewController *)self model];
    v6 = [(MainViewController *)self window];
    v7 = [(ListViewController *)v4 initWithModel:v5 window:v6];
    v8 = *(void **)(&self->super._animatingViewTransition + 1);
    *(void *)(&self->super._animatingViewTransition + 1) = v7;

    [*(id *)(&self->super._animatingViewTransition + 1) setAllowExtendedHeightCells:1];
    v3 = *(void **)(&self->super._animatingViewTransition + 1);
  }

  return v3;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  return 0;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  [a3 horizontalSizeClass];
  v3 = objc_opt_class();

  return (Class)v3;
}

- (BOOL)representsDayInViewHierarchy
{
  return 1;
}

- (CompactListViewController)compactController
{
  return *(CompactListViewController **)(&self->super._animatingViewTransition + 1);
}

- (void)setCompactController:(id)a3
{
}

- (MultiColumnMonthViewController)regularController
{
  return *(MultiColumnMonthViewController **)((char *)&self->_compactController + 1);
}

- (void)setRegularController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_compactController + 1), 0);

  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), 0);
}

@end