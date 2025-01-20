@interface UINavigationController
- (BOOL)navigateTo:(id)a3 from:(id)a4 animated:(BOOL)a5;
- (id)drop:(id)a3 animated:(BOOL)a4;
- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3;
- (id)removeViewController:(id)a3 animated:(BOOL)a4;
- (void)presentViewControllerIfNeeded:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5;
- (void)pushViewController:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5;
@end

@implementation UINavigationController

- (BOOL)navigateTo:(id)a3 from:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (UINavigationController *)a4;
  v10 = self;
  v11 = [(UINavigationController *)v10 viewControllers];
  sub_787A0();
  unint64_t v12 = sub_AB69B0();
  char v13 = sub_2A8D60((uint64_t)v8, v12);

  swift_bridgeObjectRelease();
  if (v13)
  {
    v14 = [(UINavigationController *)v10 popToViewController:v8 animated:v5];

    v9 = v10;
    v10 = (UINavigationController *)v14;
  }
  else
  {
    [(UINavigationController *)v10 showViewController:v8 sender:v9];
  }

  return 1;
}

- (id)drop:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  v7 = sub_78840(v5);

  return v7;
}

- (void)pushViewController:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
}

- (void)presentViewControllerIfNeeded:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
}

- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  UINavigationController.playActivityFeatureNames(sourceChildViewController:)(a3);

  v7.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (id)removeViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  NSArray v7 = self;
  id v8 = (void *)UINavigationController.removeViewController(_:animated:)((UIViewController)v6, a4);

  return v8;
}

@end