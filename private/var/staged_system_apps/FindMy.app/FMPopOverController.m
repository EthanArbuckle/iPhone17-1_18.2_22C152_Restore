@interface FMPopOverController
- (_TtC6FindMy19FMPopOverController)initWithCoder:(id)a3;
- (_TtC6FindMy19FMPopOverController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMPopOverController

- (_TtC6FindMy19FMPopOverController)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC6FindMy19FMPopOverController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy19FMPopOverController_selectionSubscription) = 0;
  uint64_t v5 = OBJC_IVAR____TtC6FindMy19FMPopOverController_sideBarView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMSideBarView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy19FMPopOverController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10027EC18(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_10027EDD0(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMPopOverController();
  v4 = (char *)v8.receiver;
  [(FMPopOverController *)&v8 viewDidDisappear:v3];
  uint64_t v5 = &v4[OBJC_IVAR____TtC6FindMy19FMPopOverController_delegate];
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMPopOverController();
  v2 = (char *)v5.receiver;
  [(FMPopOverController *)&v5 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 addSubview:*(void *)&v2[OBJC_IVAR____TtC6FindMy19FMPopOverController_sideBarView]];

    sub_10027F090();
  }
  else
  {
    __break(1u);
  }
}

- (_TtC6FindMy19FMPopOverController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy19FMPopOverController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMPopOverController_delegate);
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy19FMPopOverController_sideBarView);
}

@end