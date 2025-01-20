@interface TTRITemplateSharingOffineViewController
- (_TtC9Reminders39TTRITemplateSharingOffineViewController)initWithCoder:(id)a3;
- (_TtC9Reminders39TTRITemplateSharingOffineViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapClose:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTRITemplateSharingOffineViewController

- (_TtC9Reminders39TTRITemplateSharingOffineViewController)initWithCoder:(id)a3
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = qword_100785488;
  id v9 = a3;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100018BF8(v4, (uint64_t)qword_10079AD40);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
  sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
  sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
  sub_1003AA010((uint64_t)"init(coder:) has not been implemented", 37, 2);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100300438();
}

- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100300AC0();
}

- (void)didTapClose:(id)a3
{
  uint64_t v5 = sub_10003B754(&qword_10079AF90);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    id v9 = self;
  }
  uint64_t v10 = *(void *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders39TTRITemplateSharingOffineViewController_presenter];
  if (qword_1007851D8 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100018BF8(v11, (uint64_t)qword_100788648);
  sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
  sub_10001A078();
  swift_bridgeObjectRelease();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v13 = static MainActor.shared.getter();
  v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v10;
  sub_1000286A4((uint64_t)v7, (uint64_t)&unk_10079AD90, (uint64_t)v14);

  swift_release();
  sub_10003D3BC((uint64_t)v15);
}

- (_TtC9Reminders39TTRITemplateSharingOffineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders39TTRITemplateSharingOffineViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v4 = qword_1007851D8;
  id v5 = a3;
  v7 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100018BF8(v6, (uint64_t)qword_100788648);
  sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
  sub_10001A078();
  swift_bridgeObjectRelease();
  sub_1000747D8(1);
}

@end