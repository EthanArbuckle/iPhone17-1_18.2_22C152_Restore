@interface SwipeActionCollectionView
- (BOOL)allowsSelection;
- (BOOL)coordinatingSwipeActionShouldCancel;
- (CGPoint)contentOffset;
- (UIPanGestureRecognizer)coordinatingSwipeActionPanGestureRecognizer;
- (_TtC5TeaUI25SwipeActionCollectionView)initWithCoder:(id)a3;
- (_TtC5TeaUI25SwipeActionCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)coordinatingResetSwipeAction;
- (void)dealloc;
- (void)deleteItemsAtIndexPaths:(id)a3;
- (void)deleteSections:(id)a3;
- (void)didMoveToWindow;
- (void)handleFromCoordinatingGestureWithGestureRecognizer:(id)a3;
- (void)handlePanGestureWithGestureRecognizer:(id)a3;
- (void)insertItemsAtIndexPaths:(id)a3;
- (void)insertSections:(id)a3;
- (void)layoutSubviews;
- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4;
- (void)performBatchUpdates:(id)a3 completion:(id)a4;
- (void)reloadData;
- (void)reloadItemsAtIndexPaths:(id)a3;
- (void)reloadSections:(id)a3;
- (void)setAllowsSelection:(BOOL)a3;
- (void)setContentOffset:(CGPoint)a3;
@end

@implementation SwipeActionCollectionView

- (BOOL)allowsSelection
{
  v2 = self;
  unsigned __int8 v3 = SwipeActionCollectionView.allowsSelection.getter();

  return v3 & 1;
}

- (void)setAllowsSelection:(BOOL)a3
{
  v4 = self;
  SwipeActionCollectionView.allowsSelection.setter(a3);
}

- (CGPoint)contentOffset
{
  v2 = self;
  SwipeActionCollectionView.contentOffset.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  SwipeActionCollectionView.contentOffset.setter(x, y);
}

- (void)dealloc
{
  v2 = self;
  SwipeActionCollectionView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI25SwipeActionCollectionView_swipeActionManager));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI25SwipeActionCollectionView_updateGroup));
  sub_1B6061C70((uint64_t)self + OBJC_IVAR____TtC5TeaUI25SwipeActionCollectionView_swipeActionRestoreState, qword_1EB649498, (uint64_t (*)(uint64_t))type metadata accessor for SwipeActionRestoreState);
}

- (_TtC5TeaUI25SwipeActionCollectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B605D1C4();
}

- (void)didMoveToWindow
{
  v2 = self;
  SwipeActionCollectionView.didMoveToWindow()();
}

- (void)layoutSubviews
{
  v2 = self;
  SwipeActionCollectionView.layoutSubviews()();
}

- (void)handlePanGestureWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1B605E10C(v4);
}

- (void)handleFromCoordinatingGestureWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1B605E1BC(v4);
}

- (_TtC5TeaUI25SwipeActionCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  SwipeActionCollectionView.init(frame:collectionViewLayout:)();
}

- (UIPanGestureRecognizer)coordinatingSwipeActionPanGestureRecognizer
{
  id v2 = SwipeActionCollectionView.coordinatingSwipeActionPanGestureRecognizer.getter();
  return (UIPanGestureRecognizer *)v2;
}

- (BOOL)coordinatingSwipeActionShouldCancel
{
  id v2 = self;
  BOOL v3 = SwipeActionCollectionView.coordinatingSwipeActionShouldCancel.getter();

  return v3;
}

- (void)coordinatingResetSwipeAction
{
  id v2 = self;
  SwipeActionCollectionView.coordinatingResetSwipeAction()();
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  double v6 = _Block_copy(a3);
  double v7 = _Block_copy(a4);
  double v8 = v7;
  if (v6)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v6;
    double v6 = sub_1B5EA9C18;
    if (v8)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v8;
      v11 = sub_1B6061A7C;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  v11 = 0;
  uint64_t v10 = 0;
LABEL_6:
  v12 = self;
  SwipeActionCollectionView.performBatchUpdates(_:completion:)((uint64_t)v6, v9, (uint64_t)v11, v10);
  sub_1B5E3799C((uint64_t)v11);
  sub_1B5E3799C((uint64_t)v6);
}

- (void)reloadData
{
  id v2 = self;
  SwipeActionCollectionView.reloadData()();
}

- (void)reloadSections:(id)a3
{
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
}

- (void)insertSections:(id)a3
{
}

- (void)insertItemsAtIndexPaths:(id)a3
{
}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  double v6 = self;
  SwipeActionCollectionView.moveSection(_:toSection:)(a3, a4);
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  uint64_t v5 = sub_1B61AFCB0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  v11 = (char *)&v14 - v10;
  sub_1B61AFC40();
  sub_1B61AFC40();
  v12 = self;
  SwipeActionCollectionView.moveItem(at:to:)();

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
}

- (void)deleteSections:(id)a3
{
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
}

@end