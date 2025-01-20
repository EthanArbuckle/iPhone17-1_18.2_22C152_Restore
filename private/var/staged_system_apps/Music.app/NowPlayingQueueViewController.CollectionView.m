@interface NowPlayingQueueViewController.CollectionView
- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3;
- (_TtCC5Music29NowPlayingQueueViewController14CollectionView)initWithCoder:(id)a3;
- (_TtCC5Music29NowPlayingQueueViewController14CollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)cancelInteractiveMovement;
- (void)dealloc;
- (void)endInteractiveMovement;
@end

@implementation NowPlayingQueueViewController.CollectionView

- (void)dealloc
{
  v2 = self;
  sub_1003AD7E0();
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock));

  swift_bridgeObjectRelease();
}

- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  unsigned __int8 v9 = sub_1003ADD4C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (void)endInteractiveMovement
{
  v2 = self;
  sub_1003ADEF0();
}

- (void)cancelInteractiveMovement
{
  v2 = self;
  sub_1003AE2B0();
}

- (_TtCC5Music29NowPlayingQueueViewController14CollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unsigned __int8 v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock);
  *unsigned __int8 v9 = 0;
  v9[1] = 0;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock);
  void *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_maxReorderingContentOffset) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementCompletionHandlers) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_hasInteractiveMovement) = 0;
  v12.receiver = self;
  v12.super_class = (Class)_s14CollectionViewCMa();
  return -[NowPlayingQueueViewController.CollectionView initWithFrame:collectionViewLayout:](&v12, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtCC5Music29NowPlayingQueueViewController14CollectionView)initWithCoder:(id)a3
{
  return (_TtCC5Music29NowPlayingQueueViewController14CollectionView *)sub_1003AE440(a3);
}

@end