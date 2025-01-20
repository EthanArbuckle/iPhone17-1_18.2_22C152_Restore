@interface HorizontalPaidChannelHeaderView
- (_TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView)initWithFrame:(CGRect)a3;
- (void)buttonCaptionLabelTapped;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HorizontalPaidChannelHeaderView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_5A8C0(a3);
}

- (_TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView *)sub_5AA64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5E9C8();
}

- (void)buttonCaptionLabelTapped
{
  v2 = self;
  sub_5D2C8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_logoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___leftVerticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___rightVerticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_rightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_lastColumnWidth));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___subscribeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___descriptionLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___buttonCaptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_benefitsTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_blurView));
  swift_release();

  swift_release();
}

@end