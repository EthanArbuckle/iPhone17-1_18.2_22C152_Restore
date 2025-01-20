@interface CompositeComponentCollectionView
- (BOOL)_isEditing;
- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3;
- (BOOL)isEditing;
- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4;
- (CGRect)frame;
- (NSArray)indexPathsForVisibleItems;
- (NSArray)visibleCells;
- (UIEdgeInsets)contentInset;
- (_TtC12NowPlayingUI32CompositeComponentCollectionView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI32CompositeComponentCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4;
- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)indexPathForCell:(id)a3;
- (id)indexPathForItemAtPoint:(CGPoint)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)_invalidateLayoutWithContext:(id)a3;
- (void)addGestureRecognizer:(id)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)deleteItemsAtIndexPaths:(id)a3;
- (void)deleteSections:(id)a3;
- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)endInteractiveMovement;
- (void)insertItemsAtIndexPaths:(id)a3;
- (void)insertSections:(id)a3;
- (void)layoutSubviews;
- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4;
- (void)performBatchUpdates:(id)a3 completion:(id)a4;
- (void)registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4;
- (void)registerClass:(Class)a3 forSupplementaryViewOfKind:(id)a4 withReuseIdentifier:(id)a5;
- (void)reloadData;
- (void)reloadItemsAtIndexPaths:(id)a3;
- (void)reloadSections:(id)a3;
- (void)removeGestureRecognizer:(id)a3;
- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)sendSubviewToBack:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)updateInteractiveMovementTargetPosition:(CGPoint)a3;
@end

@implementation CompositeComponentCollectionView

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CompositeComponentCollectionView();
  [(CompositeComponentCollectionView *)&v6 frame];
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
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  v9 = self;

  if (Strong)
  {
  }
  else
  {
    v10.receiver = v9;
    v10.super_class = (Class)type metadata accessor for CompositeComponentCollectionView();
    -[CompositeComponentCollectionView setFrame:](&v10, "setFrame:", x, y, width, height);
  }
}

- (void)addGestureRecognizer:(id)a3
{
}

- (void)bringSubviewToFront:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_11A0A4(v4, (SEL *)&selRef_bringSubviewToFront_);
}

- (void)layoutSubviews
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v4 = self;

  if (Strong)
  {
  }
  else
  {
    v5.receiver = v4;
    v5.super_class = (Class)type metadata accessor for CompositeComponentCollectionView();
    [(CompositeComponentCollectionView *)&v5 layoutSubviews];
  }
}

- (void)removeGestureRecognizer:(id)a3
{
}

- (void)sendSubviewToBack:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_11A0A4(v4, (SEL *)&selRef_sendSubviewToBack_);
}

- (void)registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4
{
  if (a3) {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  }
  else {
    uint64_t ObjCClassMetadata = 0;
  }
  uint64_t v6 = sub_1299F0();
  v8 = v7;
  v9 = self;
  sub_11A1EC(ObjCClassMetadata, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)registerClass:(Class)a3 forSupplementaryViewOfKind:(id)a4 withReuseIdentifier:(id)a5
{
  if (a3) {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  }
  else {
    uint64_t ObjCClassMetadata = 0;
  }
  uint64_t v7 = sub_1299F0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1299F0();
  v12 = v11;
  v13 = self;
  sub_11A474(ObjCClassMetadata, v7, v9, v10, v12);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  uint64_t v5 = sub_126C50();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1299F0();
  v11 = v10;
  sub_126BD0();
  v12 = self;
  id v13 = sub_11A78C(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5
{
  uint64_t v6 = sub_126C50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1299F0();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1299F0();
  uint64_t v15 = v14;
  sub_126BD0();
  v16 = self;
  id v17 = sub_11ABC0(v10, v12, v13, v15, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v17;
}

- (NSArray)indexPathsForVisibleItems
{
  double v2 = self;
  sub_11B0C4();

  sub_126C50();
  v3.super.isa = sub_129AA0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSArray)visibleCells
{
  double v2 = self;
  sub_11BBB0();

  sub_E67C(0, &qword_1A43D0);
  v3.super.isa = sub_129AA0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return sub_11ECA4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_layoutAttributesForItemAtIndexPath_);
}

- (void)insertItemsAtIndexPaths:(id)a3
{
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  uint64_t v5 = sub_126C50();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v14 - v10;
  sub_126BD0();
  sub_126BD0();
  uint64_t v12 = self;
  sub_11C6C0((uint64_t)v11, (uint64_t)v8);

  uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  v13(v11, v5);
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  uint64_t v6 = sub_126C50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  uint64_t v10 = self;
  sub_11D1C4((uint64_t)v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_19FCB0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_126BD0();
    uint64_t v12 = sub_126C50();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_126C50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  uint64_t v14 = self;
  sub_11D4FC((uint64_t)v11, v6, a5);

  sub_1A41C((uint64_t)v11, &qword_19FCB0);
}

- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v8 = sub_126C50();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  uint64_t v12 = self;
  sub_11DAEC((uint64_t)v11, a4, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_19FCB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = self;
  sub_11DE3C((uint64_t)v8, x, y);

  uint64_t v10 = sub_126C50();
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    Class isa = sub_126BC0().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }

  return isa;
}

- (id)indexPathForCell:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_19FCB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  uint64_t v9 = self;
  sub_11E44C((uint64_t)v8, (uint64_t)v7);

  uint64_t v10 = sub_126C50();
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    Class isa = sub_126BC0().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }

  return isa;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  return sub_11ECA4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_cellForItemAtIndexPath_);
}

- (void)deleteSections:(id)a3
{
}

- (void)insertSections:(id)a3
{
}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  uint64_t v6 = self;
  sub_11F378(a3, a4);
}

- (void)reloadSections:(id)a3
{
}

- (void)_invalidateLayoutWithContext:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_11F6D0(a3);
}

- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_126C50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  id v8 = self;
  unsigned __int8 v9 = sub_11FA5C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (void)updateInteractiveMovementTargetPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = self;
  sub_11FD04(x, y);
}

- (void)endInteractiveMovement
{
  double v2 = self;
  sub_1201E0();
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a3);
  uint64_t v7 = _Block_copy(a4);
  id v8 = v7;
  if (v6)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v6;
    uint64_t v6 = sub_123F38;
    if (v8)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v8;
      uint64_t v11 = sub_123F20;
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
  uint64_t v11 = 0;
  uint64_t v10 = 0;
LABEL_6:
  uint64_t v12 = self;
  sub_120354((uint64_t)v6, v9, v11, v10);
  sub_FB70((uint64_t)v11);
  sub_FB70((uint64_t)v6);
}

- (UIEdgeInsets)contentInset
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CompositeComponentCollectionView();
  [(CompositeComponentCollectionView *)&v6 contentInset];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v7 = self;
  sub_12085C(top, left, bottom, right);
}

- (BOOL)isEditing
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CompositeComponentCollectionView();
  return [(CompositeComponentCollectionView *)&v3 isEditing];
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  objc_super v6 = self;

  if (Strong)
  {
  }
  else
  {
    v7.receiver = v6;
    v7.super_class = (Class)type metadata accessor for CompositeComponentCollectionView();
    [(CompositeComponentCollectionView *)&v7 setEditing:v3];
  }
}

- (BOOL)_isEditing
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v4 = (void *)Strong;
    double v5 = self;
    unsigned __int8 v6 = [v4 mt_isEditing];

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)type metadata accessor for CompositeComponentCollectionView();
    return [(CompositeComponentCollectionView *)&v8 _isEditing];
  }
}

- (void)reloadData
{
  double v2 = self;
  sub_120B70();
}

- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  sub_120D1C(self, a3.x, a3.y, (uint64_t)a2, a4, (SEL *)&selRef_convertPoint_toView_);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  sub_120D1C(self, a3.x, a3.y, (uint64_t)a2, a4, (SEL *)&selRef_convertPoint_fromView_);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = (void *)Strong;
    id v10 = a4;
    uint64_t v11 = self;
    id v12 = [v9 hitTest:v10 withEvent:x, y];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)type metadata accessor for CompositeComponentCollectionView();
    id v12 = -[CompositeComponentCollectionView hitTest:withEvent:](&v14, "hitTest:withEvent:", a4, x, y);
  }

  return v12;
}

- (_TtC12NowPlayingUI32CompositeComponentCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  uint64_t v9 = (_TtC12NowPlayingUI32CompositeComponentCollectionView *)sub_123DAC((uint64_t)v8, x, y, width, height);

  return v9;
}

- (_TtC12NowPlayingUI32CompositeComponentCollectionView)initWithCoder:(id)a3
{
  return (_TtC12NowPlayingUI32CompositeComponentCollectionView *)sub_1210D0(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  sub_1A41C((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_reorderingItemGlobalIndexPath, &qword_19FCB0);

  swift_bridgeObjectRelease();
}

@end