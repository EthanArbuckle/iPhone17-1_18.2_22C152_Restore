@interface HighlightsBackgroundView
- (_TtC22UserNotificationsUIKit24HighlightsBackgroundView)initWithCoder:(id)a3;
- (_TtC22UserNotificationsUIKit24HighlightsBackgroundView)initWithFrame:(CGRect)a3;
- (void)backlightChanged;
@end

@implementation HighlightsBackgroundView

- (void)backlightChanged
{
  v4 = self;
  id v2 = [(HighlightsBackgroundView *)v4 traitCollection];
  id v3 = objc_msgSend(v2, sel__backlightLuminance);

  *((unsigned char *)&v4->super.super.super.isa
  + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_lightEffectDisabledForAOD) = v3 != (id)2;
  sub_1D7D46CCC();
}

- (_TtC22UserNotificationsUIKit24HighlightsBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D7D48324();
}

- (_TtC22UserNotificationsUIKit24HighlightsBackgroundView)initWithFrame:(CGRect)a3
{
  result = (_TtC22UserNotificationsUIKit24HighlightsBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_portalContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_dropletContextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_backgroundContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_contentEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_blurEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_edgeEffectView));

  swift_unknownObjectRelease();
}

@end