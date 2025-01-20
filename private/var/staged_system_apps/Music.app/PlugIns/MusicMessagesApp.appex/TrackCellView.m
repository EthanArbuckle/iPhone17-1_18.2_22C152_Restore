@interface TrackCellView
- (BOOL)isExplicit;
- (BOOL)isNowPlaying;
- (NSString)artist;
- (NSString)title;
- (_TtC16MusicMessagesApp13TrackCellView)initWithCoder:(id)a3;
- (_TtC16MusicMessagesApp13TrackCellView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setArtist:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setIsNowPlaying:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TrackCellView

- (NSString)title
{
  return (NSString *)sub_100022474((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__titleLabel);
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isExplicit
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__explicitLabel) isHidden] ^ 1;
}

- (void)setIsExplicit:(BOOL)a3
{
  int v3 = a3;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__explicitLabel);
  v5 = self;
  if ([v4 isHidden] == v3)
  {
    [v4 setHidden:v3 ^ 1u];
    [(TrackCellView *)v5 setNeedsLayout];
  }
}

- (NSString)artist
{
  return (NSString *)sub_100022474((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__artistLabel);
}

- (void)setArtist:(id)a3
{
}

- (BOOL)isNowPlaying
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingLabel) isHidden] ^ 1;
}

- (void)setIsNowPlaying:(BOOL)a3
{
  int v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingLabel);
  BOOL v4 = !a3;
  v5 = self;
  [v3 setHidden:v4];
  [*(id *)((char *)&v5->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingIndicatorDimmingView) setHidden:v4];
  [*(id *)((char *)&v5->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingIndicatorView) setHidden:v4];
  [(TrackCellView *)v5 setNeedsLayout];
}

- (_TtC16MusicMessagesApp13TrackCellView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicMessagesApp13TrackCellView *)sub_1000227F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicMessagesApp13TrackCellView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000246F8();
}

- (void)dealloc
{
  id v3 = self;
  BOOL v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for TrackCellView();
  [(TrackCellView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__explicitLabel));
  sub_1000109BC(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView_layoutInvalidationHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingIndicatorDimmingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__artistLabel);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100023998();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100023B74();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1000243A4(a3);
}

@end