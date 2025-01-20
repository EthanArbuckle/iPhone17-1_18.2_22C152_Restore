@interface FollowingNotificationsDisabledView
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSArray)accessibilityElements;
- (NSString)accessibilityLabel;
- (_TtC7NewsUI234FollowingNotificationsDisabledView)initWithCoder:(id)a3;
- (_TtC7NewsUI234FollowingNotificationsDisabledView)initWithFrame:(CGRect)a3;
@end

@implementation FollowingNotificationsDisabledView

- (_TtC7NewsUI234FollowingNotificationsDisabledView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI234FollowingNotificationsDisabledView *)sub_1DF7F3208(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI234FollowingNotificationsDisabledView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF7F366C();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 320.0;
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_button));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_onButtonTap);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_subtitleLabel);
  double v3 = self;
  id v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1DFDFDD20();

    v6 = (void *)sub_1DFDFDCE0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (CGPoint)accessibilityActivationPoint
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_button), sel_accessibilityActivationPoint);
  result.y = v3;
  result.x = v2;
  return result;
}

@end