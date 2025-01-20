@interface InAppBlendedBackgroundView
- (_TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppBlendedBackgroundView

- (_TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView *)sub_1003445A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100344FC4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100344B40();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView_topLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView_bottomLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView_blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView_shadowView);
}

@end