@interface CompositeCollectionViewAwareTableCell
- (UIColor)backgroundColor;
- (_TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell)initWithFrame:(CGRect)a3;
- (id)_collectionView;
- (void)_setCollectionView:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation CompositeCollectionViewAwareTableCell

- (id)_collectionView
{
  v2 = self;
  id v3 = sub_D632C();

  return v3;
}

- (void)_setCollectionView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell();
  [(CompositeCollectionViewAwareTableCell *)&v4 _setCollectionView:a3];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_D6874(v4);
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell();
  v2 = [(CompositeCollectionViewAwareTableCell *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell();
  id v4 = v9.receiver;
  id v5 = a3;
  [(CompositeCollectionViewAwareTableCell *)&v9 setBackgroundColor:v5];
  id v6 = [v4 tableViewCell];
  if (v6)
  {
    v7 = v6;
    id v8 = [v4 backgroundColor];
    [v7 setBackgroundColor:v8];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell_lastAppliedIndexPath;
  uint64_t v9 = sub_126C50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell();
  return -[CompositeCollectionViewAwareTableCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell)initWithCoder:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell_lastAppliedIndexPath;
  uint64_t v6 = sub_126C50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell();
  return [(CompositeCollectionViewAwareTableCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end