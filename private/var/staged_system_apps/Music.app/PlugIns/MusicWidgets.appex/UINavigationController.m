@interface UINavigationController
- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3;
- (id)removeViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation UINavigationController

- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  UINavigationController.playActivityFeatureNames(sourceChildViewController:)(a3);

  v7.super.isa = sub_1005350C0().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (id)removeViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  NSArray v7 = self;
  v8 = (void *)UINavigationController.removeViewController(_:animated:)((UIViewController)v6, a4);

  return v8;
}

@end