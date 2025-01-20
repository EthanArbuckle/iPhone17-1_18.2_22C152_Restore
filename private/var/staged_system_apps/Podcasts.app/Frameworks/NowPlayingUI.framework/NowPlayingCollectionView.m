@interface NowPlayingCollectionView
- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3;
- (UIEdgeInsets)_safeAreaInsetsForFrame:(CGRect)a3 inSuperview:(id)a4;
- (_TtC12NowPlayingUI24NowPlayingCollectionView)init;
- (_TtC12NowPlayingUI24NowPlayingCollectionView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI24NowPlayingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)cancelInteractiveMovement;
- (void)endInteractiveMovement;
@end

@implementation NowPlayingCollectionView

- (_TtC12NowPlayingUI24NowPlayingCollectionView)init
{
  return (_TtC12NowPlayingUI24NowPlayingCollectionView *)sub_8C42C();
}

- (_TtC12NowPlayingUI24NowPlayingCollectionView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingCollectionView_interactiveMovementCompletionHandlers) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingCollectionView_hasInteractiveMovement) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingCollectionView_scrollAndSwipeInteractionsEnabled) = 1;
  id v4 = a3;

  result = (_TtC12NowPlayingUI24NowPlayingCollectionView *)sub_12A480();
  __break(1u);
  return result;
}

- (UIEdgeInsets)_safeAreaInsetsForFrame:(CGRect)a3 inSuperview:(id)a4
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_126C50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  v8 = self;
  Class isa = sub_126BC0().super.isa;
  v10 = (objc_class *)type metadata accessor for NowPlayingCollectionView();
  v13.receiver = v8;
  v13.super_class = v10;
  BOOL v11 = [(NowPlayingCollectionView *)&v13 beginInteractiveMovementForItemAtIndexPath:isa];

  *((unsigned char *)&v8->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingCollectionView_hasInteractiveMovement) = 1;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (void)endInteractiveMovement
{
  v2 = self;
  sub_8C8D4((SEL *)&selRef_endInteractiveMovement);
}

- (void)cancelInteractiveMovement
{
  v2 = self;
  sub_8C8D4((SEL *)&selRef_cancelInteractiveMovement);
}

- (_TtC12NowPlayingUI24NowPlayingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  UIEdgeInsets result = (_TtC12NowPlayingUI24NowPlayingCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end