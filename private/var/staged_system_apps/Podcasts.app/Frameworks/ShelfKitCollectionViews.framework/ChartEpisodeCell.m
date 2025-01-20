@interface ChartEpisodeCell
- (UILabel)accessibilityOrdinalLabel;
- (_TtC23ShelfKitCollectionViews16ChartEpisodeCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews16ChartEpisodeCell)initWithFrame:(CGRect)a3;
- (_TtC23ShelfKitCollectionViews18CachingArtworkView)accessibilityInternalArtworkView;
- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)accessibilityMoreButton;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)didMoveToWindow;
- (void)prepareForReuse;
@end

@implementation ChartEpisodeCell

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  [(ChartEpisodeCell *)&v8 didMoveToWindow];
  id v3 = [v2 window];
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 screen];
    [v5 scale];
    uint64_t v7 = v6;

    *(void *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_displayScale] = v7;
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_161BEC((uint64_t)v4);

  return v6;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_161F34();
}

- (_TtC23ShelfKitCollectionViews18CachingArtworkView)accessibilityInternalArtworkView
{
  return (_TtC23ShelfKitCollectionViews18CachingArtworkView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_internalArtworkView);
}

- (UILabel)accessibilityOrdinalLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_ordinalLabel));
}

- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)accessibilityMoreButton
{
  return (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_moreButton);
}

- (_TtC23ShelfKitCollectionViews16ChartEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ChartEpisodeCell *)sub_16210C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews16ChartEpisodeCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews16ChartEpisodeCell *)sub_162268(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_internalArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_ordinalLabelMinWidth));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_episodeInfoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_moreButton));
  sub_163C48((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_episodeController);
  swift_release();

  swift_release();
}

@end