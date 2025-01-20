@interface PermissionViewController
- (_TtC7Journal24PermissionViewController)initWithCoder:(id)a3;
- (_TtC7Journal24PermissionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)shouldDismissOnboarding;
- (void)viewDidLoad;
@end

@implementation PermissionViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PermissionViewController();
  id v2 = v6.receiver;
  [(PermissionViewController *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self systemBackgroundColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC7Journal24PermissionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7Journal24PermissionViewController *)sub_10047D75C(v5, v7, a4);
}

- (_TtC7Journal24PermissionViewController)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC7Journal24PermissionViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal24PermissionViewController_permissionViewType) = 8;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal24PermissionViewController_permissionViewMargin) = (Class)0x4034000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PermissionViewController();
  return [(PermissionViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (void)shouldDismissOnboarding
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  id v8 = self;
  swift_retain();
  uint64_t v9 = static MainActor.shared.getter();
  v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v7;
  swift_release();
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_10080DE48, (uint64_t)v10);

  swift_release();
}

@end