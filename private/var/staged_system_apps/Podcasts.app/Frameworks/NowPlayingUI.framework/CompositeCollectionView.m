@interface CompositeCollectionView
- (BOOL)_allowsMultipleSelectionDuringEditing;
- (BOOL)_allowsSelectionDuringEditing;
- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating;
- (BOOL)allowsMultipleSelection;
- (BOOL)allowsSelection;
- (UICollectionViewDataSource)dataSource;
- (UICollectionViewDelegate)delegate;
- (UICollectionViewLayout)collectionViewLayout;
- (_TtC12NowPlayingUI23CompositeCollectionView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI23CompositeCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)_applyLayoutAttributes:(id)a3 toView:(id)a4;
- (void)_setAllowsMultipleSelectionDuringEditing:(BOOL)a3;
- (void)_setAllowsSelectionDuringEditing:(BOOL)a3;
- (void)layoutSubviews;
- (void)performBatchUpdates:(id)a3 completion:(id)a4;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setAllowsSelection:(BOOL)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CompositeCollectionView

- (void)layoutSubviews
{
  v2 = self;
  sub_C1710();
}

- (void)_applyLayoutAttributes:(id)a3 toView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_C1C54(a3, a4);
}

- (BOOL)allowsMultipleSelection
{
  v2 = self;
  char v3 = sub_C2284((SEL *)&selRef_allowsMultipleSelection);

  return v3 & 1;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
}

- (BOOL)_allowsMultipleSelectionDuringEditing
{
  v2 = self;
  char v3 = sub_C2284((SEL *)&selRef__allowsMultipleSelectionDuringEditing);

  return v3 & 1;
}

- (void)_setAllowsMultipleSelectionDuringEditing:(BOOL)a3
{
}

- (BOOL)allowsSelection
{
  v2 = self;
  char v3 = sub_C2284((SEL *)&selRef_allowsSelection);

  return v3 & 1;
}

- (void)setAllowsSelection:(BOOL)a3
{
}

- (BOOL)_allowsSelectionDuringEditing
{
  v2 = self;
  char v3 = sub_C2284((SEL *)&selRef__allowsSelectionDuringEditing);

  return v3 & 1;
}

- (void)_setAllowsSelectionDuringEditing:(BOOL)a3
{
}

- (UICollectionViewLayout)collectionViewLayout
{
  return (UICollectionViewLayout *)sub_C2750(self, (uint64_t)a2, (SEL *)&selRef_collectionViewLayout);
}

- (void)setCollectionViewLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(CompositeCollectionView *)&v6 setCollectionViewLayout:v4];
  sub_C24C8();
}

- (UICollectionViewDataSource)dataSource
{
  return (UICollectionViewDataSource *)sub_C2750(self, (uint64_t)a2, (SEL *)&selRef_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionViewDelegate)delegate
{
  return (UICollectionViewDelegate *)sub_C2750(self, (uint64_t)a2, (SEL *)&selRef_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a3);
  id v7 = _Block_copy(a4);
  id v8 = v7;
  if (v6)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v6;
    objc_super v6 = sub_2744C;
    if (v8)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v8;
      v11 = (uint64_t (*)())sub_C2C8C;
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
  sub_C14DC((uint64_t)v6, v9, v11, v10);
  sub_FB70((uint64_t)v11);
  sub_FB70((uint64_t)v6);
}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

- (_TtC12NowPlayingUI23CompositeCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_layoutSubviewsIgnoreCount) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_didIgnoreLayoutSubviews) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_isPerformingBatchUpdates) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[CompositeCollectionView initWithFrame:collectionViewLayout:](&v12, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC12NowPlayingUI23CompositeCollectionView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_layoutSubviewsIgnoreCount) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_didIgnoreLayoutSubviews) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_isPerformingBatchUpdates) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CompositeCollectionView *)&v7 initWithCoder:a3];
}

@end