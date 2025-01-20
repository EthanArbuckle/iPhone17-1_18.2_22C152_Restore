@interface ShowMetadataView
- (CGSize)intrinsicContentSize;
- (UIView)viewForLastBaselineLayout;
- (_TtC23ShelfKitCollectionViews16ShowMetadataView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews16ShowMetadataView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ShowMetadataView

- (_TtC23ShelfKitCollectionViews16ShowMetadataView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ShowMetadataView *)sub_24252C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_242BAC(a3);
}

- (_TtC23ShelfKitCollectionViews16ShowMetadataView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_243E0C();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ShowMetadataView();
  v2 = (char *)v4.receiver;
  [(ShowMetadataView *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_label];
  [v2 bounds];
  [v3 setFrame:];
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_24330C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_label));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_label));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_F0E8(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase), *(void *)&self->label[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase], *(void *)&self->explicitTreatment[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase], *(void *)&self->numberOfRatings[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 3], *(void *)&self->formattedRatingCount[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 3], *(void *)&self->formattedRatingCount[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 11], *(void **)&self->titles[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 3], *(void *)&self->updateFrequency[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 2], *(void *)&self->updateFrequency[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 10], *(void *)&self->newEpisodeCount[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 2], *(void *)&self->newEpisodeCount[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 10], self->fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 1], self->fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_fontUseCase + 2]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView_color));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShowMetadataView____lazy_storage___numberFormatter);
}

@end