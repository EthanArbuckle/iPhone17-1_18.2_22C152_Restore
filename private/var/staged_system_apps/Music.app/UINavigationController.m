@interface UINavigationController
- (BOOL)navigateTo:(id)a3 from:(id)a4 animated:(BOOL)a5;
- (id)drop:(id)a3 animated:(BOOL)a4;
- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3;
- (id)removeViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation UINavigationController

- (BOOL)navigateTo:(id)a3 from:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (UINavigationController *)a4;
  v10 = self;
  v11 = [(UINavigationController *)v10 viewControllers];
  sub_10012738C();
  unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(v11) = sub_1003C86A4((uint64_t)v8, v12);
  swift_bridgeObjectRelease();
  if (v11)
  {
    v13 = [(UINavigationController *)v10 popToViewController:v8 animated:v5];

    v9 = v10;
    v10 = (UINavigationController *)v13;
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
  v7 = sub_1001273CC(v5);

  return v7;
}

- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  UINavigationController.playActivityFeatureNames(sourceChildViewController:)(a3);

  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
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