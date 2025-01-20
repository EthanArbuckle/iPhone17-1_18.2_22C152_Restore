@interface SingleShowEpisodeCell
- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView;
- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView;
- (_TtC23ShelfKitCollectionViews21SingleShowEpisodeCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21SingleShowEpisodeCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)didMoveToWindow;
- (void)prepareForReuse;
@end

@implementation SingleShowEpisodeCell

- (_TtC23ShelfKitCollectionViews21SingleShowEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews21SingleShowEpisodeCell *)sub_36A734(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews21SingleShowEpisodeCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_36CF24();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_36BE7C((uint64_t)v4);

  return v6;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_36C2C8();
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  [(SingleShowEpisodeCell *)&v8 didMoveToWindow];
  id v3 = [v2 window];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 screen];
    [v5 scale];
    uint64_t v7 = v6;

    *(void *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_displayScale] = v7;
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_episodeInfoView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_playControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_artworkView));
  swift_release();

  swift_release();
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView
{
  return (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)sub_2D1A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_episodeInfoView);
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView
{
  return (_TtC23ShelfKitCollectionViews21PlayControlsStackView *)sub_2D1A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_playControlsView);
}

@end