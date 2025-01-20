@interface RCSiriTipContainerView
- (_TtC10VoiceMemos22RCSiriTipContainerView)initWithCoder:(id)a3;
- (_TtC10VoiceMemos22RCSiriTipContainerView)initWithFrame:(CGRect)a3;
- (_TtP10VoiceMemos21RCSiriTipViewDelegate_)delegate;
- (double)preferredHeight;
- (void)setDelegate:(id)a3;
@end

@implementation RCSiriTipContainerView

- (_TtP10VoiceMemos21RCSiriTipViewDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP10VoiceMemos21RCSiriTipViewDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC10VoiceMemos22RCSiriTipContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC10VoiceMemos22RCSiriTipContainerView *)sub_1000CF378(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10VoiceMemos22RCSiriTipContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000D1274();
}

- (double)preferredHeight
{
  v2 = self;
  double v3 = sub_1000CFA9C();

  return v3;
}

- (void).cxx_destruct
{
  sub_10000C4A4((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos22RCSiriTipContainerView_delegate);
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10VoiceMemos22RCSiriTipContainerView_siriTipView);
}

@end