@interface FollowingSettingsButtonView
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (_TtC7NewsUI227FollowingSettingsButtonView)initWithCoder:(id)a3;
- (_TtC7NewsUI227FollowingSettingsButtonView)initWithFrame:(CGRect)a3;
@end

@implementation FollowingSettingsButtonView

- (_TtC7NewsUI227FollowingSettingsButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI227FollowingSettingsButtonView *)sub_1DF5BADE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI227FollowingSettingsButtonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF5BB294();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI227FollowingSettingsButtonView_onTap));
  swift_release();
  swift_release();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  id v3 = [(FollowingSettingsButtonView *)v2 titleLabel];
  if (v3 && (v4 = v3, id v5 = objc_msgSend(v3, sel_text), v4, v5))
  {
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

@end