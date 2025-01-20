@interface BKLibraryBookshelfNavigationController
- (BOOL)shouldHideNavigationItemBackgroundDuringTransition:(id)a3;
- (id)bc_ancestorOverrideCardPresentingViewController;
@end

@implementation BKLibraryBookshelfNavigationController

- (BOOL)shouldHideNavigationItemBackgroundDuringTransition:(id)a3
{
  return 1;
}

- (id)bc_ancestorOverrideCardPresentingViewController
{
  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfNavigationController;
  v3 = [(BKLibraryBookshelfNavigationController *)&v7 bc_ancestorOverrideCardPresentingViewController];
  v4 = v3;
  if (!v3) {
    v3 = self;
  }
  id v5 = v3;

  return v5;
}

@end