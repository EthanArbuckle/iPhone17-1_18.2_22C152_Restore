@interface FMMessageTextView
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC6FindMy17FMMessageTextView)init;
- (_TtC6FindMy17FMMessageTextView)initWithCoder:(id)a3;
- (_TtC6FindMy17FMMessageTextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMMessageTextView

- (_TtC6FindMy17FMMessageTextView)init
{
  return (_TtC6FindMy17FMMessageTextView *)sub_10014D2F4();
}

- (_TtC6FindMy17FMMessageTextView)initWithCoder:(id)a3
{
  return (_TtC6FindMy17FMMessageTextView *)sub_10014D53C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10014D78C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMMessageTextView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FMMessageTextView *)&v6 traitCollectionDidChange:v4];
  sub_10014E7FC();
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10014E22C(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v6 = Strong;
    if ([Strong respondsToSelector:"textViewDidChange:"])
    {
      id v7 = a3;
      v8 = self;
      [v6 textViewDidChange:v7];
    }
    swift_unknownObjectRelease();
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v10 = Strong;
    if ([Strong respondsToSelector:"textView:shouldChangeTextInRange:replacementText:"])
    {
      id v11 = a3;
      v12 = self;
      NSString v13 = String._bridgeToObjectiveC()();
      unsigned __int8 v14 = [v10 textView:v11 shouldChangeTextInRange:location length:length replacementText:v13];

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();

      return v14;
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy17FMMessageTextView_textView) becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy17FMMessageTextView_textView) resignFirstResponder];
}

- (_TtC6FindMy17FMMessageTextView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy17FMMessageTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy17FMMessageTextView_style);
  id v4 = *(void **)&self->style[OBJC_IVAR____TtC6FindMy17FMMessageTextView_style];
  id v5 = *(void **)&self->style[OBJC_IVAR____TtC6FindMy17FMMessageTextView_style + 8];
  objc_super v6 = *(void **)&self->style[OBJC_IVAR____TtC6FindMy17FMMessageTextView_style + 16];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMMessageTextView_remainingCharsLabel));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy17FMMessageTextView_textViewDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end