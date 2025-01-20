@interface MultiShowMacEpisodeCell
- (BOOL)isSelected;
- (UICellConfigurationState)_bridgedConfigurationState;
- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView;
- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView;
- (_TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
- (void)setSelected:(BOOL)a3;
@end

@implementation MultiShowMacEpisodeCell

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MultiShowMacEpisodeCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_158170(a3);
}

- (_TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell *)sub_15849C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_15ABC8();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_159B44((uint64_t)v4);
  v7 = v6;

  return v7;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_159DC0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_episodeInfoView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_playControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_artworkPlusInfoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_artworkViewWithPlayback));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_internalArtworkContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell____lazy_storage___doubleClickToPlayGesture));
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView
{
  return (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)sub_2D1A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_episodeInfoView);
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView
{
  return (_TtC23ShelfKitCollectionViews21PlayControlsStackView *)sub_2D1A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_playControlsView);
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3 = sub_37D3B0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_15A52C();

  v8.super.super.isa = sub_37D370().super.super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (UICellConfigurationState *)v8.super.super.isa;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_37D3B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37D380();
  UICellConfigurationState v8 = self;
  sub_15A60C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end