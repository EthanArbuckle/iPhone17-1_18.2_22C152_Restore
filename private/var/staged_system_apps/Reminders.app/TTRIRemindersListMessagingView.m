@interface TTRIRemindersListMessagingView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (NSString)accessibilityLabel;
- (_TtC9Reminders30TTRIRemindersListMessagingView)initWithArrangedSubviews:(id)a3;
- (_TtC9Reminders30TTRIRemindersListMessagingView)initWithCoder:(id)a3;
- (_TtC9Reminders30TTRIRemindersListMessagingView)initWithFrame:(CGRect)a3;
@end

@implementation TTRIRemindersListMessagingView

- (_TtC9Reminders30TTRIRemindersListMessagingView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders30TTRIRemindersListMessagingView *)sub_1002592F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders30TTRIRemindersListMessagingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100259CB8();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  v3._object = (void *)0x80000001006B03A0;
  v4._countAndFlagsBits = 0x7265646E696D6552;
  v4._object = (void *)0xEE007473694C2073;
  v3._countAndFlagsBits = 0xD000000000000042;
  TTRLocalizedString(_:comment:)(v4, v3);

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (_TtC9Reminders30TTRIRemindersListMessagingView)initWithArrangedSubviews:(id)a3
{
  result = (_TtC9Reminders30TTRIRemindersListMessagingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)&self->NUIContainerStackView_opaque[OBJC_IVAR____TtC9Reminders30TTRIRemindersListMessagingView_messagingViewDelegate]);

  Swift::String v3 = *(void **)&self->NUIContainerStackView_opaque[OBJC_IVAR____TtC9Reminders30TTRIRemindersListMessagingView_subtitleTextView];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_100259D64();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

@end