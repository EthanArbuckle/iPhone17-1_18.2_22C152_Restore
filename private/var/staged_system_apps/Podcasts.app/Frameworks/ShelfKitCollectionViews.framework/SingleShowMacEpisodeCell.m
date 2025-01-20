@interface SingleShowMacEpisodeCell
- (BOOL)isSelected;
- (UICellConfigurationState)_bridgedConfigurationState;
- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView;
- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView;
- (_TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
- (void)setSelected:(BOOL)a3;
@end

@implementation SingleShowMacEpisodeCell

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SingleShowMacEpisodeCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(SingleShowMacEpisodeCell *)&v5 setSelected:v3];
  sub_2B394();
}

- (_TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell *)sub_2B4A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2E3A8();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_2CBA0((uint64_t)v4);
  v7 = v6;

  return v7;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_2CE64();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell_artworkScrim));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell____lazy_storage___artworkContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell_episodeInfoView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell_playControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell____lazy_storage___smallPlayButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell_artworkOverlay));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell_infoLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell_infoWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell____lazy_storage___doubleClickToPlayGesture));

  swift_release();
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView
{
  return (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)sub_2D1A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell_episodeInfoView);
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView
{
  return (_TtC23ShelfKitCollectionViews21PlayControlsStackView *)sub_2D1A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews24SingleShowMacEpisodeCell_playControlsView);
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3 = sub_37D3B0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_2DD80();

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
  sub_2DE60((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end