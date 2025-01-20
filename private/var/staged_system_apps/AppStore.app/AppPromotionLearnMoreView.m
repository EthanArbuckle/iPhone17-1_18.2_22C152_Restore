@interface AppPromotionLearnMoreView
- (_TtC8AppStore25AppPromotionLearnMoreView)initWithCoder:(id)a3;
- (_TtC8AppStore25AppPromotionLearnMoreView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppPromotionLearnMoreView

- (_TtC8AppStore25AppPromotionLearnMoreView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002CA370();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002C9B9C();
}

- (_TtC8AppStore25AppPromotionLearnMoreView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore25AppPromotionLearnMoreView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_learnMoreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_backButtonAction));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_mediaOverlayStyle;
  uint64_t v4 = type metadata accessor for MediaOverlayStyle();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end