@interface UIViewController
- (BOOL)canPresentViewControllers;
- (NSArray)completePlayActivityFeatureNames;
- (NSData)playActivityRecommendationData;
- (NSString)combinedPlayActivityFeatureName;
- (NSString)musicTabIdentifier;
- (NSString)playActivityFeatureName;
- (UIColor)viewBackgroundColor;
- (UIViewController)playActivityFeatureNameSourceViewController;
- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3;
- (void)setMusicTabIdentifier:(id)a3;
- (void)setPlayActivityFeatureName:(void *)a1;
- (void)setPlayActivityFeatureNameSourceViewController:(id)a3;
- (void)setViewBackgroundColor:(id)a3;
@end

@implementation UIViewController

- (NSString)musicTabIdentifier
{
  v2 = objc_getAssociatedObject(self, "_MusicTabIdentifier");
  if (_NSIsNSString() && [v2 length]) {
    id v3 = [v2 copy];
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setMusicTabIdentifier:(id)a3
{
}

- (UIColor)viewBackgroundColor
{
  v2 = self;
  id v3 = sub_1007C0C28();

  return (UIColor *)v3;
}

- (void)setViewBackgroundColor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007C0D9C(v4);
}

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
  return (NSString *)sub_100950094(self, (uint64_t)a2, (void (*)(void))&UITab.playActivityFeatureName.getter);
}

- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3
{
  sub_100063814((uint64_t *)&unk_1010C11C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100E251D0;
  id v6 = a3;
  v7 = self;
  v8 = [(UIViewController *)v7 playActivityFeatureName];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  *(void *)(v5 + 32) = v9;
  *(void *)(v5 + 40) = v11;

  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (NSArray)completePlayActivityFeatureNames
{
  v2 = self;
  UIViewController.completePlayActivityFeatureNames.getter();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSString)combinedPlayActivityFeatureName
{
  v2 = self;
  NSArray v3 = [(UIViewController *)v2 completePlayActivityFeatureNames];
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100063814(&qword_1010C28F0);
  sub_100063858((unint64_t *)&unk_1010C11D0, &qword_1010C28F0);
  sub_10005D1D4();
  Sequence<>.joined(separator:)();

  swift_bridgeObjectRelease();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (void)setPlayActivityFeatureName:(void *)a1
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = qword_1010BBDF8;
  id v3 = a1;
  if (v2 != -1) {
    swift_once();
  }
  NSString v4 = (const void *)qword_1010C1190;
  id value = String._bridgeToObjectiveC()();
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