@interface CollectionView
- (BOOL)_scrollToTopIfPossible:(BOOL)a3;
- (_TtC9SeymourUI14CollectionView)initWithCoder:(id)a3;
- (_TtC9SeymourUI14CollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)layoutSubviews;
@end

@implementation CollectionView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CollectionView();
  v2 = (char *)v4.receiver;
  [(CollectionView *)&v4 layoutSubviews];
  v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC9SeymourUI14CollectionView_onLayoutUpdate];
  if (v3)
  {
    swift_retain();
    v3(v2);
    sub_239C25118((uint64_t)v3);
  }
}

- (BOOL)_scrollToTopIfPossible:(BOOL)a3
{
  objc_super v4 = self;
  char v5 = sub_23A392764(a3);

  return v5 & 1;
}

- (_TtC9SeymourUI14CollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI14CollectionView_contentInsetBehaviorProvider);
  void *v9 = 0;
  v9[1] = 0;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI14CollectionView_onLayoutUpdate);
  void *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI14CollectionView____lazy_storage___smoothDecelerationAnimation) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CollectionView();
  return -[CollectionView initWithFrame:collectionViewLayout:](&v12, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC9SeymourUI14CollectionView)initWithCoder:(id)a3
{
  objc_super v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI14CollectionView_contentInsetBehaviorProvider);
  *objc_super v4 = 0;
  v4[1] = 0;
  char v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI14CollectionView_onLayoutUpdate);
  *char v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI14CollectionView____lazy_storage___smoothDecelerationAnimation) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CollectionView();
  return [(CollectionView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI14CollectionView_contentInsetBehaviorProvider));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI14CollectionView_onLayoutUpdate));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI14CollectionView____lazy_storage___smoothDecelerationAnimation);
}

@end