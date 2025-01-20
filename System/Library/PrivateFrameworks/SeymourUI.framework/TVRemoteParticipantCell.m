@interface TVRemoteParticipantCell
- (UILabel)accessibilityTitleLabel;
- (_TtC9SeymourUI15DeviceBadgeView)accessibilityDeviceBadgeView;
- (_TtC9SeymourUI23TVRemoteParticipantCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI23TVRemoteParticipantCell)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TVRemoteParticipantCell

- (_TtC9SeymourUI23TVRemoteParticipantCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23TVRemoteParticipantCell *)sub_239EF10E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23TVRemoteParticipantCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EF3590();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239EF1B54();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_239EF1C44();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_239EF27F8(v6, v7);
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_titleLabel));
}

- (_TtC9SeymourUI15DeviceBadgeView)accessibilityDeviceBadgeView
{
  return (_TtC9SeymourUI15DeviceBadgeView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_deviceBadgeView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super._traitChangeRegistry
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_monogramButtonContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_monogramButton));
  swift_bridgeObjectRelease();
  sub_239EF33D8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_type);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_deviceBadgeView);
}

@end