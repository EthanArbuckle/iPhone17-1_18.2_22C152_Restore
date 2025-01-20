@interface FollowUpViewController
- (_TtC20SWTFollowUpExtension22FollowUpViewController)init;
- (_TtC20SWTFollowUpExtension22FollowUpViewController)initWithCoder:(id)a3;
- (_TtC20SWTFollowUpExtension22FollowUpViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)viewDidLoad;
@end

@implementation FollowUpViewController

- (_TtC20SWTFollowUpExtension22FollowUpViewController)init
{
  uint64_t v3 = sub_1000072C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1000072B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))((uint64_t)v7 + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log, v6, v3);

  v8 = (objc_class *)type metadata accessor for FollowUpViewController();
  v10.receiver = v7;
  v10.super_class = v8;
  return [(FollowUpViewController *)&v10 initWithNibName:0 bundle:0];
}

- (_TtC20SWTFollowUpExtension22FollowUpViewController)initWithCoder:(id)a3
{
  result = (_TtC20SWTFollowUpExtension22FollowUpViewController *)sub_1000073E0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for FollowUpViewController();
  [(FollowUpViewController *)&v2 viewDidLoad];
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  v8 = (void (*)(uint64_t))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = (void (*)(uint64_t))sub_100006F64;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  FollowUpViewController.processFollowUpItem(_:selectedAction:completion:)(a3, a4, v8, v9);
  sub_100006F1C((uint64_t)v8);
}

- (_TtC20SWTFollowUpExtension22FollowUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20SWTFollowUpExtension22FollowUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v2 = (char *)self + OBJC_IVAR____TtC20SWTFollowUpExtension22FollowUpViewController_log;
  uint64_t v3 = sub_1000072C0();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end