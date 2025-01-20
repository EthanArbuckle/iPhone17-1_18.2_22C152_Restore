@interface MultiShowEpisodeCell
- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView;
- (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell)initWithFrame:(CGRect)a3;
- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)didMoveToWindow;
- (void)prepareForReuse;
@end

@implementation MultiShowEpisodeCell

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MultiShowEpisodeCell();
  v2 = (char *)v8.receiver;
  [(MultiShowEpisodeCell *)&v8 didMoveToWindow];
  id v3 = [v2 window];
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 screen];
    [v5 scale];
    uint64_t v7 = v6;

    *(void *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_displayScale] = v7;
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_109474((uint64_t)v4);
  uint64_t v7 = v6;

  return v7;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_109D70();
}

- (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell *)sub_109F18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell *)sub_10A074(a3);
}

- (void).cxx_destruct
{
  swift_release();
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_presentation, (uint64_t *)&unk_472680);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_layoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_episodeInfoView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_playControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_internalArtworkView));
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_imageProvider, &qword_471D78);

  swift_release();
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView
{
  return (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)sub_2D1A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_episodeInfoView);
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView
{
  return (_TtC23ShelfKitCollectionViews21PlayControlsStackView *)sub_2D1A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_playControlsView);
}

@end