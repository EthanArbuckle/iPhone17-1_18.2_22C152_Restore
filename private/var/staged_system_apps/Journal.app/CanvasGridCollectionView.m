@interface CanvasGridCollectionView
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (_TtC7Journal24CanvasGridCollectionView)initWithCoder:(id)a3;
- (_TtC7Journal24CanvasGridCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation CanvasGridCollectionView

- (_TtC7Journal24CanvasGridCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (_TtC7Journal24CanvasGridCollectionView *)CanvasGridCollectionView.init(frame:collectionViewLayout:)(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal24CanvasGridCollectionView)initWithCoder:(id)a3
{
  return (_TtC7Journal24CanvasGridCollectionView *)CanvasGridCollectionView.init(coder:)(a3);
}

- (CGSize)intrinsicContentSize
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static UIView.Invalidating.subscript.getter();
  swift_release();
  swift_release();
  if (v10 == 1) {
    [(CanvasGridCollectionView *)v3 contentSize];
  }
  else {
    double v4 = sub_1003BA38C();
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)contentSize
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CanvasGridCollectionView();
  [(CanvasGridCollectionView *)&v4 contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = (objc_class *)type metadata accessor for CanvasGridCollectionView();
  v16.receiver = self;
  v16.super_class = v6;
  double v7 = self;
  [(CanvasGridCollectionView *)&v16 contentSize];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = v7;
  v15.super_class = v6;
  -[CanvasGridCollectionView setContentSize:](&v15, "setContentSize:", width, height);
  [(CanvasGridCollectionView *)v7 contentSize];
  if (v13 != v9 || v12 != v11) {
    [(CanvasGridCollectionView *)v7 invalidateIntrinsicContentSize];
  }
}

- (void).cxx_destruct
{
  double v2 = (char *)self + OBJC_IVAR____TtC7Journal24CanvasGridCollectionView__isExpanded;
  uint64_t v3 = sub_100010218(&qword_10080B698);
  objc_super v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end