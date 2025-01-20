@interface KeyboardManager
- (void)keyboardDidHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
@end

@implementation KeyboardManager

- (void)keyboardWillShow:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100441020();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)keyboardDidHide:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = qword_1007F6F78;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  qword_10083D4C8 = 0;
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end