@interface MTAAddSheetNavigationController
- (BOOL)_canShowWhileLocked;
- (unint64_t)supportedInterfaceOrientations;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation MTAAddSheetNavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (MTUIIsPadIdiom()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MTAAddSheetNavigationController;
  id v6 = a3;
  [(MTAAddSheetNavigationController *)&v8 pushViewController:v6 animated:v4];
  v7 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2, v8.receiver, v8.super_class);
  [(MTAAddSheetNavigationController *)self setOverrideTraitCollection:v7 forChildViewController:v6];
}

@end