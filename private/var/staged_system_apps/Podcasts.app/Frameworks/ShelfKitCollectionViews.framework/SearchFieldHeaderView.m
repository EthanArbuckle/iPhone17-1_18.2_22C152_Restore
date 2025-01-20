@interface SearchFieldHeaderView
- (_TtC23ShelfKitCollectionViews21SearchFieldHeaderView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21SearchFieldHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchFieldHeaderView

- (_TtC23ShelfKitCollectionViews21SearchFieldHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_margins);
  _OWORD *v7 = xmmword_39E1E0;
  v7[1] = xmmword_39E1F0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_contentView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SearchFieldHeaderView();
  return -[SearchFieldHeaderView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews21SearchFieldHeaderView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_margins);
  _OWORD *v4 = xmmword_39E1E0;
  v4[1] = xmmword_39E1F0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_contentView) = 0;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews21SearchFieldHeaderView *)sub_385890();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_246020();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchFieldHeaderView_contentView));
}

@end