@interface UIViewController(PXExtendedTraitCollection)
+ (void)_px_prepareClassForExtendedTraitCollection;
+ (void)px_preloadExtendedTraitCollection;
- (PXExtendedTraitCollection)px_extendedTraitCollection;
- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewDidAppear:()PXExtendedTraitCollection;
- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewDidLoad;
- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewIsAppearing:()PXExtendedTraitCollection;
- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewLayoutMarginsDidChange;
- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewWillAppear:()PXExtendedTraitCollection;
- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewWillLayoutSubviews;
- (void)_pxswizzled_viewControllerTraitCollection_didMoveToParentViewController:()PXExtendedTraitCollection;
- (void)_pxswizzled_viewControllerTraitCollection_traitCollectionDidChange:()PXExtendedTraitCollection;
- (void)_pxswizzled_viewControllerTraitCollection_viewSafeAreaInsetsDidChange;
- (void)_pxswizzled_viewControllerTraitCollection_viewWillTransitionToSize:()PXExtendedTraitCollection withTransitionCoordinator:;
- (void)px_enableExtendedTraitCollection;
@end

@implementation UIViewController(PXExtendedTraitCollection)

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewWillAppear:()PXExtendedTraitCollection
{
  v5 = objc_msgSend(a1, "px_extendedTraitCollection");
  [v5 viewControllerViewWillAppear];

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewWillAppear:", a3);
}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewIsAppearing:()PXExtendedTraitCollection
{
  v5 = objc_msgSend(a1, "px_extendedTraitCollection");
  [v5 viewControllerViewIsAppearing];

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewIsAppearing:", a3);
}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewDidAppear:()PXExtendedTraitCollection
{
  v5 = objc_msgSend(a1, "px_extendedTraitCollection");
  [v5 viewControllerViewDidAppear];

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewDidAppear:", a3);
}

- (void)_pxswizzled_viewControllerTraitCollection_didMoveToParentViewController:()PXExtendedTraitCollection
{
  id v5 = a3;
  v4 = objc_msgSend(a1, "px_extendedTraitCollection");
  [v4 viewControllerDidMoveToParentViewController:v5];

  objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_didMoveToParentViewController:", v5);
}

- (void)_pxswizzled_viewControllerTraitCollection_viewSafeAreaInsetsDidChange
{
  objc_msgSend(a1, "px_extendedTraitCollection");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 viewControllerViewSafeAreaInsetsDidChange];
  [v2 peripheryInsetsNeedsUpdate];
  objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewSafeAreaInsetsDidChange");
}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewLayoutMarginsDidChange
{
  id v2 = objc_msgSend(a1, "px_extendedTraitCollection");
  [v2 viewControllerViewLayoutMarginsDidChange];

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewLayoutMarginsDidChange");
}

- (void)_pxswizzled_viewControllerTraitCollection_traitCollectionDidChange:()PXExtendedTraitCollection
{
  id v5 = a3;
  v4 = objc_msgSend(a1, "px_extendedTraitCollection");
  [v4 viewControllerTraitCollectionDidChange];

  objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_traitCollectionDidChange:", v5);
}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewWillLayoutSubviews
{
  id v2 = objc_msgSend(a1, "px_extendedTraitCollection");
  [v2 viewControllerViewWillLayoutSubviews];

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewWillLayoutSubviews");
}

- (PXExtendedTraitCollection)px_extendedTraitCollection
{
  objc_getAssociatedObject(a1, (const void *)PXExtendedTraitCollectionAssociationKey);
  id v2 = (PXExtendedTraitCollection *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v2 = [[PXExtendedTraitCollection alloc] initWithViewController:a1];
    objc_setAssociatedObject(a1, (const void *)PXExtendedTraitCollectionAssociationKey, v2, (void *)1);
  }
  return v2;
}

- (void)px_enableExtendedTraitCollection
{
  objc_msgSend((id)objc_opt_class(), "_px_prepareClassForExtendedTraitCollection");
  objc_msgSend(a1, "px_extendedTraitCollection");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setEnabled:1];
}

+ (void)_px_prepareClassForExtendedTraitCollection
{
  uint64_t v2 = objc_opt_class();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__UIViewController_PXExtendedTraitCollection___px_prepareClassForExtendedTraitCollection__block_invoke_3;
  v3[3] = &unk_1E5DBEB58;
  id v4 = &__block_literal_global_143315;
  objc_msgSend(a1, "px_swizzleOnceAsSubclassOfClass:context:usingBlock:", v2, PXExtendedTraitCollectionContext, v3);
}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewDidLoad
{
  uint64_t v2 = objc_msgSend(a1, "px_extendedTraitCollection");
  [v2 viewControllerViewDidLoad];

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewDidLoad");
}

- (void)_pxswizzled_viewControllerTraitCollection_viewWillTransitionToSize:()PXExtendedTraitCollection withTransitionCoordinator:
{
  id v8 = a5;
  v9 = objc_msgSend(a1, "px_extendedTraitCollection");
  objc_msgSend(v9, "viewControllerViewWillTransitionToSize:", a2, a3);
  objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewWillTransitionToSize:withTransitionCoordinator:", v8, a2, a3);
  objc_initWeak(&location, v9);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __140__UIViewController_PXExtendedTraitCollection___pxswizzled_viewControllerTraitCollection_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E5DBEB80;
  objc_copyWeak(&v11, &location);
  [v8 animateAlongsideTransition:0 completion:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

+ (void)px_preloadExtendedTraitCollection
{
  uint64_t v2 = +[PXPreloadScheduler sharedScheduler];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__UIViewController_PXExtendedTraitCollection__px_preloadExtendedTraitCollection__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  void v3[4] = a1;
  [v2 scheduleMainQueueTask:v3];
}

@end