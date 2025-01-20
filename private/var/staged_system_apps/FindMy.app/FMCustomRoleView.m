@interface FMCustomRoleView
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC6FindMy16FMCustomRoleView)init;
- (_TtC6FindMy16FMCustomRoleView)initWithCoder:(id)a3;
- (_TtC6FindMy16FMCustomRoleView)initWithFrame:(CGRect)a3;
- (void)clearTextView;
- (void)customizeEmoji;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation FMCustomRoleView

- (_TtC6FindMy16FMCustomRoleView)init
{
  return (_TtC6FindMy16FMCustomRoleView *)sub_1002FAD54();
}

- (_TtC6FindMy16FMCustomRoleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002FD8B0();
}

- (void)customizeEmoji
{
  v2 = self;
  sub_1002FC694();
}

- (void)clearTextView
{
  v2 = self;
  sub_1002FC7DC();
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002FC930(v4);
}

- (void)textViewDidBeginEditing:(id)a3
{
  sub_100006060(0, (unint64_t *)&qword_1006B3E40);
  v5 = (_TtC6FindMy16FMCustomRoleView *)a3;
  v7 = self;
  if (static NSObject.== infix(_:_:)())
  {
    v6 = (_TtC6FindMy16FMCustomRoleView *)[*(id *)((char *)&v7->super.super.super.isa+ OBJC_IVAR____TtC6FindMy16FMCustomRoleView_emojiBackground) layer];
    [(FMCustomRoleView *)v6 setBorderWidth:3.0];

    v5 = v7;
    v7 = v6;
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002FCE98(v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  id v11 = a3;
  v12 = self;
  LOBYTE(length) = sub_1002FD16C(v11, v13, length, v8, v10);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (_TtC6FindMy16FMCustomRoleView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy16FMCustomRoleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy16FMCustomRoleView_delegate);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end