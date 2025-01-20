@interface DOCSuggestionsTableView
- (CGSize)intrinsicContentSize;
- (_TtC5Files23DOCSuggestionsTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (id)invalidateIntrinsicContentSize;
- (void)reloadData;
@end

@implementation DOCSuggestionsTableView

- (_TtC5Files23DOCSuggestionsTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_getObjectType();
  v10 = (char *)self + OBJC_IVAR____TtC5Files23DOCSuggestionsTableView_cachedIntrinsicSize;
  *(void *)v10 = 0;
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for DOCSuggestionsTableView();
  v11 = -[DOCTableView initWithFrame:style:](&v15, "initWithFrame:style:", a4, x, y, width, height);
  sub_1000CBE70((uint64_t *)&unk_100708760);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1005A0030;
  *(void *)(v12 + 32) = type metadata accessor for UITraitPreferredContentSizeCategory();
  *(void *)(v12 + 40) = &protocol witness table for UITraitPreferredContentSizeCategory;
  v13 = v11;
  UIView.registerForTraitChanges<A>(_:handler:)();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v13;
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCSuggestionsTableView();
  id v2 = v3.receiver;
  [(DOCSuggestionsTableView *)&v3 reloadData];
  [v2 invalidateIntrinsicContentSize];
  [v2 layoutIfNeeded];
}

- (id)invalidateIntrinsicContentSize
{
  v1 = &a1[OBJC_IVAR____TtC5Files23DOCSuggestionsTableView_cachedIntrinsicSize];
  *(void *)v1 = 0;
  *((void *)v1 + 1) = 0;
  v1[16] = 1;
  v3.receiver = a1;
  v3.super_class = (Class)type metadata accessor for DOCSuggestionsTableView();
  return [super invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = (double *)((char *)self + OBJC_IVAR____TtC5Files23DOCSuggestionsTableView_cachedIntrinsicSize);
  if (self->cachedIntrinsicSize[OBJC_IVAR____TtC5Files23DOCSuggestionsTableView_cachedIntrinsicSize + 8])
  {
    CGFloat v4 = UIViewNoIntrinsicMetric;
    v5 = self;
    sub_1004BDD58();
    double v7 = v6;
  }
  else
  {
    CGFloat v4 = *v3;
    double v7 = v3[1];
    v8 = self;
  }
  *objc_super v3 = v4;
  v3[1] = v7;
  *((unsigned char *)v3 + 16) = 0;

  double v9 = v4;
  double v10 = v7;
  result.double height = v10;
  result.double width = v9;
  return result;
}

@end