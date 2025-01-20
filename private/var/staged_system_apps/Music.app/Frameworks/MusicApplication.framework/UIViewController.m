@interface UIViewController
- (BOOL)canPresentViewControllers;
- (NSArray)completePlayActivityFeatureNames;
- (NSData)playActivityRecommendationData;
- (NSString)combinedPlayActivityFeatureName;
- (NSString)playActivityFeatureName;
- (UIColor)viewBackgroundColor;
- (UIViewController)playActivityFeatureNameSourceViewController;
- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3;
- (void)_music_setParentTraitEnvironmentOverride:(id)a3;
- (void)indexKeyCommandHandler:(id)a3;
- (void)setPlayActivityFeatureName:(void *)a1;
- (void)setPlayActivityFeatureNameSourceViewController:(id)a3;
- (void)setViewBackgroundColor:(id)a3;
@end

@implementation UIViewController

- (void)_music_setParentTraitEnvironmentOverride:(id)a3
{
  id v4 = a3;
  if (_music_setParentTraitEnvironmentOverride__onceToken != -1) {
    dispatch_once(&_music_setParentTraitEnvironmentOverride__onceToken, &__block_literal_global_1);
  }
  objc_initWeak(&location, v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke_3;
  v6[3] = &unk_CCB4E0;
  objc_copyWeak(&v7, &location);
  v5 = objc_retainBlock(v6);
  objc_setAssociatedObject(self, "_music_parentTraitEnvironmentOverride", v5, (char *)&def_3B9D84 + 3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke(id a1)
{
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, "_parentTraitEnvironment");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke_2;
  v7[3] = &__block_descriptor_48_e26__16__0__UIViewController_8l;
  v7[4] = method_getImplementation(InstanceMethod);
  v7[5] = "_parentTraitEnvironment";
  v3 = objc_retainBlock(v7);
  id v4 = imp_implementationWithBlock(v3);

  v5 = (objc_class *)objc_opt_class();
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  class_replaceMethod(v5, "_parentTraitEnvironment", v4, TypeEncoding);
}

id __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_getAssociatedObject(v3, "_music_parentTraitEnvironmentOverride");
  v5 = (void *)v4;
  if (!v4
    || ((*(void (**)(uint64_t))(v4 + 16))(v4), (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = (*(void (**)(id, void))(a1 + 32))(v3, *(void *)(a1 + 40));
  }

  return v6;
}

id __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  return WeakRetained;
}

- (UIColor)viewBackgroundColor
{
  v2 = self;
  id v3 = sub_C6FCC();

  return (UIColor *)v3;
}

- (void)setViewBackgroundColor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_C7348(v4);
}

- (void)indexKeyCommandHandler:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_3B1664(v4);
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
  return (NSString *)sub_66CDC4(self, (uint64_t)a2, (void (*)(void))&UITab.playActivityFeatureName.getter);
}

- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DEB770);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_AEB050;
  id v6 = a3;
  id v7 = self;
  v8 = [(UIViewController *)v7 playActivityFeatureName];
  uint64_t v9 = sub_AB6510();
  uint64_t v11 = v10;

  *(void *)(v5 + 32) = v9;
  *(void *)(v5 + 40) = v11;

  v12.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (NSArray)completePlayActivityFeatureNames
{
  v2 = self;
  UIViewController.completePlayActivityFeatureNames.getter();

  v3.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSString)combinedPlayActivityFeatureName
{
  v2 = self;
  NSArray v3 = [(UIViewController *)v2 completePlayActivityFeatureNames];
  sub_AB69B0();

  __swift_instantiateConcreteTypeFromMangledName(&qword_DECEA0);
  sub_3C6D8((unint64_t *)&unk_DEB780, &qword_DECEA0);
  sub_54FE40();
  sub_AB6910();

  swift_bridgeObjectRelease();
  NSString v4 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (void)setPlayActivityFeatureName:(void *)a1
{
  sub_AB6510();
  uint64_t v2 = qword_DE63A8;
  id v3 = a1;
  if (v2 != -1) {
    swift_once();
  }
  NSString v4 = (const void *)qword_DEB740;
  id value = sub_AB64D0();
  swift_bridgeObjectRelease();
  objc_setAssociatedObject(v3, v4, value, (char *)&def_3B9D84 + 3);
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