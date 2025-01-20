@interface UIViewController
- (BOOL)canPresentViewControllers;
- (NSArray)completePlayActivityFeatureNames;
- (NSData)playActivityRecommendationData;
- (NSString)combinedPlayActivityFeatureName;
- (NSString)playActivityFeatureName;
- (UIViewController)playActivityFeatureNameSourceViewController;
- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3;
- (void)setPlayActivityFeatureName:(void *)a1;
- (void)setPlayActivityFeatureNameSourceViewController:(id)a3;
@end

@implementation UIViewController

- (UIViewController)playActivityFeatureNameSourceViewController
{
  v2 = self;
  id v3 = UIViewController.playActivityFeatureNameSourceViewController.getter();

  return (UIViewController *)v3;
}

- (void)setPlayActivityFeatureNameSourceViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  UIViewController.playActivityFeatureNameSourceViewController.setter(a3);
}

- (NSData)playActivityRecommendationData
{
  return (NSData *)0;
}

- (NSString)playActivityFeatureName
{
  return (NSString *)sub_100154730(self, (uint64_t)a2, (void (*)(void))&UITab.playActivityFeatureName.getter);
}

- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3
{
  sub_100007568((uint64_t *)&unk_1005A61B0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1004AC360;
  id v6 = a3;
  v7 = self;
  v8 = [(UIViewController *)v7 playActivityFeatureName];
  uint64_t v9 = sub_100483E10();
  uint64_t v11 = v10;

  *(void *)(v5 + 32) = v9;
  *(void *)(v5 + 40) = v11;

  v12.super.isa = sub_1004841E0().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (NSArray)completePlayActivityFeatureNames
{
  v2 = self;
  UIViewController.completePlayActivityFeatureNames.getter();

  v3.super.isa = sub_1004841E0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSString)combinedPlayActivityFeatureName
{
  v2 = self;
  NSArray v3 = [(UIViewController *)v2 completePlayActivityFeatureNames];
  sub_100484200();

  sub_100007568(&qword_1005A78E0);
  sub_10006389C((unint64_t *)&unk_1005A61C0, &qword_1005A78E0);
  sub_100033A08();
  sub_100484190();

  swift_bridgeObjectRelease();
  NSString v4 = sub_100483DD0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (void)setPlayActivityFeatureName:(void *)a1
{
  sub_100483E10();
  uint64_t v2 = qword_1005A0DE8;
  id v3 = a1;
  if (v2 != -1) {
    swift_once();
  }
  NSString v4 = (const void *)qword_1005A6180;
  id value = sub_100483DD0();
  swift_bridgeObjectRelease();
  objc_setAssociatedObject(v3, v4, value, (void *)3);
}

- (BOOL)canPresentViewControllers
{
  uint64_t v2 = self;
  id v3 = [(UIViewController *)v2 popoverPresentationController];

  if (v3) {
  return v3 == 0;
  }
}

@end