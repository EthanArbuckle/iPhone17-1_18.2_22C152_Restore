@interface MediaPickerNavigationController
- (NSArray)viewControllers;
- (NSString)playActivityFeatureName;
- (_TtC16MusicApplication31MediaPickerNavigationController)init;
- (_TtC16MusicApplication31MediaPickerNavigationController)initWithCoder:(id)a3;
- (_TtC16MusicApplication31MediaPickerNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (void)cancelTapped;
- (void)doneTapped;
- (void)pushViewController:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5;
- (void)setPlayActivityFeatureName:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MediaPickerNavigationController

- (_TtC16MusicApplication31MediaPickerNavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_471E1C();
}

- (_TtC16MusicApplication31MediaPickerNavigationController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = sub_471BC8();
  id v4 = objc_allocWithZone(ObjectType);
  v5 = (_TtC16MusicApplication31MediaPickerNavigationController *)sub_471CB8(v3);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)pushViewController:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_46C0A4(v8, a4, a5);
}

- (NSArray)viewControllers
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  id v3 = [(NavigationController *)&v6 viewControllers];
  sub_173E4(0, (unint64_t *)&qword_DBE680);
  sub_AB69B0();

  v4.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setViewControllers:(id)a3
{
  sub_173E4(0, (unint64_t *)&qword_DBE680);
  sub_AB69B0();
  id v5 = a3;
  objc_super v6 = self;
  sub_471F2C();

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(NavigationController *)&v6 viewDidLoad];
  [v2 view];
  if (v3)
  {
    NSArray v4 = v3;
    id v5 = [self systemBackgroundColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(MediaPickerNavigationController *)&v5 viewWillAppear:v3];
  sub_46C9A8();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_46D23C();
}

- (NSString)playActivityFeatureName
{
  id v2 = self;
  sub_46D460();

  NSString v3 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)setPlayActivityFeatureName:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_AB6510();
  id v6 = a3;
  v7 = self;
  NSString v8 = sub_AB64D0();
  v9.receiver = v7;
  v9.super_class = ObjectType;
  [(MediaPickerNavigationController *)&v9 setPlayActivityFeatureName:v8];

  swift_bridgeObjectRelease();
}

- (void)cancelTapped
{
  id v2 = self;
  sub_46D758();
}

- (void)doneTapped
{
  id v2 = self;
  sub_46D8EC();
}

- (_TtC16MusicApplication31MediaPickerNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC16MusicApplication31MediaPickerNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_mediaPickerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_mediaPickerConfiguration));
  sub_3D8E3C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_prompt), *(void *)&self->super.onWillShowViewController[OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_prompt]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController____lazy_storage___doneBarButtonItem));
  swift_bridgeObjectRelease();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController_selectedPlaybackIntentDescriptor, (uint64_t *)&unk_DC96A0);
  NSString v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication31MediaPickerNavigationController____lazy_storage___spinnerBarButtonItem);
}

@end