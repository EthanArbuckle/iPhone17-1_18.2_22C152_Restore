@interface TVShowEpisodeDetailView
- (CGRect)bounds;
- (CGRect)frame;
- (UIControl)accessibilityContextualActionsButton;
- (_TtC16MusicApplication23TVShowEpisodeDetailView)initWithCoder:(id)a3;
- (_TtC16MusicApplication23TVShowEpisodeDetailView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVShowEpisodeDetailView

- (_TtC16MusicApplication23TVShowEpisodeDetailView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication23TVShowEpisodeDetailView *)sub_253B24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication23TVShowEpisodeDetailView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25824C();
}

- (CGRect)frame
{
  sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_25550C((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_25550C((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_25563C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(TVShowEpisodeDetailView *)&v7 traitCollectionDidChange:v4];
  id v6 = [v5 traitCollection];
  if ([v6 horizontalSizeClass]) {
    sub_254D30(v6);
  }
}

- (UIControl)accessibilityContextualActionsButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_contextualActionsButton));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_lockupImageArtworkCatalog));
  sub_34BEC(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_artworkPlaceholder), *(void **)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_artworkPlaceholder], *(void **)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_artworkPlaceholder + 8], *(void **)&self->title[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_artworkPlaceholder]);
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_playButtonHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_showNameButtonHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_buildMenu));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_layoutInvalidationHandler));
  swift_release();
  swift_release();
  sub_1A500((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_libraryAddKeepLocalStatusControllableDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_headerLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView____lazy_storage___showNameButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView____lazy_storage___episodeInformationBadgingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_libraryAddKeepLocalControl));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_contextualActionsButton);
}

@end