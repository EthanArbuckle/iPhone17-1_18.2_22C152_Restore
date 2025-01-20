@interface CardRim
- (_TtC23ShelfKitCollectionViews7CardRim)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews7CardRim)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CardRim

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_304608((uint64_t)a3);
}

- (_TtC23ShelfKitCollectionViews7CardRim)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_innerRim;
  id v6 = objc_allocWithZone((Class)CALayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_rimWidth) = 0;

  result = (_TtC23ShelfKitCollectionViews7CardRim *)sub_385890();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(CardRim *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_innerRim];
  [v2 bounds];
  CGRect v6 = CGRectInset(v5, *(CGFloat *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_rimWidth], *(CGFloat *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews7CardRim_rimWidth]);
  [v3 setFrame:v6.origin.x, v6.origin.y, v6.size.width, v6.size.height];
}

- (_TtC23ShelfKitCollectionViews7CardRim)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews7CardRim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end