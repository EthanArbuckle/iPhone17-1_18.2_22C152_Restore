@interface CRLInsertEditURLAlert
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC8Freeform21CRLInsertEditURLAlert)init;
- (void)dealloc;
@end

@implementation CRLInsertEditURLAlert

- (void)dealloc
{
  v2 = self;
  sub_1008AA2CC();
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform21CRLInsertEditURLAlert_delegate);
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform21CRLInsertEditURLAlert_initialURL, &qword_101672E90);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLInsertEditURLAlert_replaceAction);
}

- (_TtC8Freeform21CRLInsertEditURLAlert)init
{
  result = (_TtC8Freeform21CRLInsertEditURLAlert *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  sub_1008ABE44(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1008AC0F0(v4);

  return self & 1;
}

@end