@interface EpisodeInfoView
- (BOOL)accessibilityIsNowPlayingIndicatorVisible;
- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)initWithFrame:(CGRect)a3;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityEyebrowLabel;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityFooterLabel;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel;
- (void)didMoveToWindow;
- (void)setAccessibilityIsNowPlayingIndicatorVisible:(BOOL)a3;
- (void)titleTapped;
- (void)willMoveToWindow:(id)a3;
@end

@implementation EpisodeInfoView

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_226508();
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  id v5 = a3;
  [(EpisodeInfoView *)&v6 willMoveToWindow:v5];
  if (v5)
  {
    EpisodeInfoView.beginUpdates()();
  }
}

- (void)didMoveToWindow
{
  v2 = self;
  EpisodeInfoView.didMoveToWindow()();
}

- (BOOL)accessibilityIsNowPlayingIndicatorVisible
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_accessibilityIsNowPlayingIndicatorVisible);
}

- (void)setAccessibilityIsNowPlayingIndicatorVisible:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_accessibilityIsNowPlayingIndicatorVisible) = a3;
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_nowPlayingIndicatorHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_eyebrowPlayedCheckmark));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_eyebrowLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_footerLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView____lazy_storage___headerStack));
  sub_154940((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_delegate);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityEyebrowLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_eyebrowLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_titleLabel);
  swift_beginAccess();
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*v2;
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_descriptionLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityFooterLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_footerLabel);
}

- (void)titleTapped
{
  v2 = self;
  sub_223A70();
}

@end