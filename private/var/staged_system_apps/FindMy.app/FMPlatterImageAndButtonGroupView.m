@interface FMPlatterImageAndButtonGroupView
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (_TtC6FindMy32FMPlatterImageAndButtonGroupView)initWithCoder:(id)a3;
- (_TtC6FindMy32FMPlatterImageAndButtonGroupView)initWithFrame:(CGRect)a3;
- (void)setupSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMPlatterImageAndButtonGroupView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_titleLabel));
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_subtitleLabel));
}

- (_TtC6FindMy32FMPlatterImageAndButtonGroupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100459C08();
}

- (void)setupSubviews
{
  v2 = self;
  sub_10045716C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1004598E8((uint64_t)a3);
}

- (_TtC6FindMy32FMPlatterImageAndButtonGroupView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy32FMPlatterImageAndButtonGroupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_buttonSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPlatterImageAndButtonGroupView_iconView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end