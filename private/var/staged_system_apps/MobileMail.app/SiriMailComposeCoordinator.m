@interface SiriMailComposeCoordinator
- (NSString)bodyWithoutSignature;
- (_TtC10MobileMail26SiriMailComposeCoordinator)init;
- (void)onHostAction:(id)a3;
- (void)setBccRecipients:(id)a3;
- (void)setBody:(id)a3;
- (void)setBodyWithoutSignature:(id)a3;
- (void)setCcRecipients:(id)a3;
- (void)setFocusedField:(id)a3;
- (void)setSignature:(id)a3;
- (void)setState:(id)a3;
- (void)setSubject:(id)a3;
- (void)setToRecipients:(id)a3;
@end

@implementation SiriMailComposeCoordinator

- (NSString)bodyWithoutSignature
{
  v2 = self;
  sub_100421C98();
  uint64_t v8 = v3;

  if (v8)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setBodyWithoutSignature:(id)a3
{
  id v3 = a3;
  v4 = self;
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v5;

    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  sub_100421DC8(v8, v9);
}

- (void)setSubject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1004227B4(v6, v7);
  swift_bridgeObjectRelease();
}

- (void)setBody:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1004232F4(v6, v7);
  swift_bridgeObjectRelease();
}

- (void)setSignature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100423DEC(v6, v7);
  swift_bridgeObjectRelease();
}

- (void)setToRecipients:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004299AC();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1004247D8(v6);
  swift_bridgeObjectRelease();
}

- (void)setCcRecipients:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004299AC();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10042538C(v6);
  swift_bridgeObjectRelease();
}

- (void)setBccRecipients:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004299AC();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100425E2C(v6);
  swift_bridgeObjectRelease();
}

- (void)setFocusedField:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004268CC(a3);
}

- (void)setState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004273AC(a3);
}

- (void)onHostAction:(id)a3
{
  v13 = self;
  id v12 = a3;
  uint64_t v11 = type metadata accessor for Notification();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (uint64_t)&v6 - v7;
  id v4 = (id)__chkstk_darwin(v12);
  uint64_t v5 = self;
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100428200(v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v11);
}

- (_TtC10MobileMail26SiriMailComposeCoordinator)init
{
  return (_TtC10MobileMail26SiriMailComposeCoordinator *)sub_1004288C8();
}

- (void).cxx_destruct
{
}

@end