@interface FMAccessoryNameTextField
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC6FindMy24FMAccessoryNameTextField)init;
- (_TtC6FindMy24FMAccessoryNameTextField)initWithCoder:(id)a3;
- (_TtC6FindMy24FMAccessoryNameTextField)initWithFrame:(CGRect)a3;
- (void)clearTextView;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation FMAccessoryNameTextField

- (_TtC6FindMy24FMAccessoryNameTextField)init
{
  return (_TtC6FindMy24FMAccessoryNameTextField *)sub_100176594();
}

- (_TtC6FindMy24FMAccessoryNameTextField)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001788F0();
}

- (void)clearTextView
{
  v2 = self;
  sub_100177238();
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100177468(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001789D4();
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = a3;
  v12 = self;
  LOBYTE(length) = sub_1001778A0(v11, v13, length, v8, v10);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (_TtC6FindMy24FMAccessoryNameTextField)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy24FMAccessoryNameTextField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMAccessoryNameTextField_displayTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMAccessoryNameTextField_placeholderTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMAccessoryNameTextField_deleteButton));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy24FMAccessoryNameTextField_textSizeHeightConstraint);
}

@end