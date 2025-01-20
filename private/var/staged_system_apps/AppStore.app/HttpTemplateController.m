@interface HttpTemplateController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC8AppStore22HttpTemplateController)init;
- (void)dealloc;
- (void)textFieldDidChange:(id)a3;
@end

@implementation HttpTemplateController

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for HttpTemplateController();
  [(HttpTemplateController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore22HttpTemplateController_actionSender, (uint64_t *)&unk_100982B40);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore22HttpTemplateController_okAction);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  v10 = self;
  sub_10077AD28(v9, location, length);
  LOBYTE(length) = v11;

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textFieldDidChange:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8AppStore22HttpTemplateController_hasRequiredParameters) == 1)
  {
    v8 = self;
    sub_10077A9DC();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC8AppStore22HttpTemplateController)init
{
  result = (_TtC8AppStore22HttpTemplateController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end