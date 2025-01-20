@interface NowPlayingQueueCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC5Music19NowPlayingQueueCell)initWithCoder:(id)a3;
- (_TtC5Music19NowPlayingQueueCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NowPlayingQueueCell

- (_TtC5Music19NowPlayingQueueCell)initWithFrame:(CGRect)a3
{
  sub_1004C1754(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Music19NowPlayingQueueCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004C4E3C();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingQueueCell();
  id v2 = v3.receiver;
  [(NowPlayingQueueCell *)&v3 layoutSubviews];
  sub_1004C3058();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_badgeArtworkCatalog));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_artworkContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titlesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_explicitBadgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_lastSeenTitleText));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_artworkContainerViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_artworkContainerViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titlesStackViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titlesStackViewCenterYConstraint));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titlesStackViewTrailingConstraint);
}

@end