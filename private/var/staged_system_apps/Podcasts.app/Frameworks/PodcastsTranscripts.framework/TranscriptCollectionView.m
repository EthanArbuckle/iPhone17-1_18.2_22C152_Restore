@interface TranscriptCollectionView
- (_TtC19PodcastsTranscripts24TranscriptCollectionView)initWithCoder:(id)a3;
- (_TtC19PodcastsTranscripts24TranscriptCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)_customScrollAnimation;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation TranscriptCollectionView

- (_TtC19PodcastsTranscripts24TranscriptCollectionView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptCollectionView_mode) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptCollectionView_subscriptions) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptCollectionView____lazy_storage____verticalScrollIndicator) = (Class)(&def_1E2E4 + 1);
  id v4 = a3;

  result = (_TtC19PodcastsTranscripts24TranscriptCollectionView *)sub_77160();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_2F364((uint64_t)a4, x, y);

  return v10;
}

- (_TtC19PodcastsTranscripts24TranscriptCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  result = (_TtC19PodcastsTranscripts24TranscriptCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptCollectionView____lazy_storage____verticalScrollIndicator);

  sub_97D8(v3);
}

- (id)_customScrollAnimation
{
  id v2 = sub_2FC9C();

  return v2;
}

@end