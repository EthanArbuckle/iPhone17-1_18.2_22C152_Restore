@interface InlineMenuButtonTextAttachment
- (_TtC11MobileNotes30InlineMenuButtonTextAttachment)init;
- (_TtC11MobileNotes30InlineMenuButtonTextAttachment)initWithCoder:(id)a3;
- (_TtC11MobileNotes30InlineMenuButtonTextAttachment)initWithData:(id)a3 ofType:(id)a4;
@end

@implementation InlineMenuButtonTextAttachment

- (_TtC11MobileNotes30InlineMenuButtonTextAttachment)init
{
  return (_TtC11MobileNotes30InlineMenuButtonTextAttachment *)sub_1001BEB20();
}

- (_TtC11MobileNotes30InlineMenuButtonTextAttachment)initWithCoder:(id)a3
{
}

- (_TtC11MobileNotes30InlineMenuButtonTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
  result = (_TtC11MobileNotes30InlineMenuButtonTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30InlineMenuButtonTextAttachment_menu));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30InlineMenuButtonTextAttachment_traitCollection));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30InlineMenuButtonTextAttachment_font));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11MobileNotes30InlineMenuButtonTextAttachment_foregroundColor);
}

@end