@interface HighlightsShowMoreLabel
- (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel)initWithCoder:(id)a3;
- (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel)initWithFrame:(CGRect)a3;
- (void)_updateTextAttributes;
- (void)handleTap;
@end

@implementation HighlightsShowMoreLabel

- (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel)initWithFrame:(CGRect)a3
{
  return (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel *)sub_1D7D77930(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_traitChangeRegistration) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_action);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel *)sub_1D7D7FBD0();
  __break(1u);
  return result;
}

- (void)handleTap
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_action);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_1D7D4443C((uint64_t)v2);
    v2(v3);
    sub_1D7D26378((uint64_t)v2);
  }
}

- (void)_updateTextAttributes
{
  v2 = self;
  sub_1D7D77F08();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_button));
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_action);

  sub_1D7D26378(v3);
}

@end