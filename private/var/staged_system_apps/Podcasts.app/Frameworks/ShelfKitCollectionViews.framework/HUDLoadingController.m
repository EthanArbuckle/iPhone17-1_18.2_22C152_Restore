@interface HUDLoadingController
- (_TtC23ShelfKitCollectionViews20HUDLoadingController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews20HUDLoadingController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUDLoadingController

- (_TtC23ShelfKitCollectionViews20HUDLoadingController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1305C4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_12E224();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HUDLoadingController(0);
  id v4 = v10.receiver;
  [(HUDLoadingController *)&v10 viewDidAppear:v3];
  v5 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  v9[4] = sub_1305BC;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_2F248;
  v9[3] = &block_descriptor_49;
  v7 = _Block_copy(v9);
  id v8 = v4;
  swift_release();
  [v5 animateWithDuration:131074 delay:v7 options:0 animations:0.2 completion:0.0];
  _Block_release(v7);
}

- (_TtC23ShelfKitCollectionViews20HUDLoadingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews20HUDLoadingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController_loadingView));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController_config;
  uint64_t v4 = sub_3807C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController_presentationWindow));
  sub_1306C0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController____lazy_storage___viewToken);
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController____lazy_storage___HUDView);
}

@end