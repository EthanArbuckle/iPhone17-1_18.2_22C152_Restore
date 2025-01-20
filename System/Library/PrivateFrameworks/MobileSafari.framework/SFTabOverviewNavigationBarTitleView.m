@interface SFTabOverviewNavigationBarTitleView
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (SFTabOverviewNavigationBarTitleView)initWithCoder:(id)a3;
- (SFTabOverviewNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (void)cancelRetitling;
- (void)contentDidChange;
- (void)layoutSubviews;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation SFTabOverviewNavigationBarTitleView

- (SFTabOverviewNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  return (SFTabOverviewNavigationBarTitleView *)sub_18C60A814(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFTabOverviewNavigationBarTitleView)initWithCoder:(id)a3
{
  return (SFTabOverviewNavigationBarTitleView *)sub_18C60AAAC(a3);
}

- (void)contentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TabOverviewNavigationBarTitleView();
  id v2 = v3.receiver;
  [(_UINavigationBarTitleView *)&v3 contentDidChange];
  objc_msgSend(v2, sel_setNeedsLayout, v3.receiver, v3.super_class);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TabOverviewNavigationBarTitleView();
  id v2 = v3.receiver;
  [(SFTabOverviewNavigationBarTitleView *)&v3 layoutSubviews];
  sub_18C60CAD8();
  sub_18C60CF84();
}

- (void)cancelRetitling
{
  id v2 = self;
  sub_18C60D134();
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C60E4AC();
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C60D494(v4);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_configuration);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_super v3 = *(NSMutableArray **)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_configuration);
  id v4 = *(UITraitCollection **)((char *)&self->super.super._cachedTraitCollection
                             + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_configuration);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super._swiftAnimationInfo
                  + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_configuration);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super._traitChangeRegistry
                  + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_configuration);
  swift_bridgeObjectRelease();
  sub_18C37D6C8(v3, v4, v5, v6);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_cancelRetitlingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_contentView));
  objc_release(*(id *)((char *)&self->super.super._cachedTraitCollection
                     + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_metrics));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_textField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverviewNavigationBarTitleView____lazy_storage___textFieldLeadingConstraint));
  v7 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SFTabOverviewNavigationBarTitleView_titleButton);
}

@end