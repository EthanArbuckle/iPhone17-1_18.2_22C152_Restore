@interface ButtonWithTouchInsets
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ButtonWithTouchInsets

- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_debugInsetsView) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_touchInsets;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ButtonWithTouchInsets();
  return -[DynamicTypeButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_debugInsetsView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_touchInsets;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets *)sub_385890();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = (double *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_touchInsets);
  if (self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_touchInsets + 24])
  {
    v19.receiver = self;
    v19.super_class = (Class)type metadata accessor for ButtonWithTouchInsets();
    return -[ButtonWithTouchInsets pointInside:withEvent:](&v19, "pointInside:withEvent:", a4, x, y);
  }
  else
  {
    double v11 = *v8;
    double v10 = v8[1];
    id v12 = a4;
    v13 = self;
    [(ButtonWithTouchInsets *)v13 bounds];
    v21.origin.double x = UIEdgeInsetsInsetRect(v14, v15, v16, v17, v11, v10);
    v20.double x = x;
    v20.double y = y;
    BOOL v18 = CGRectContainsPoint(v21, v20);

    return v18;
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ButtonWithTouchInsets();
  v2 = (char *)v6.receiver;
  [(ButtonWithTouchInsets *)&v6 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_debugInsetsView];
  if (v3)
  {
    id v4 = v3;
    [v2 bringSubviewToFront:v4];
    id v5 = (char *)[v4 layer];
    [v5 removeAllAnimations];

    v2 = v5;
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ButtonWithTouchInsets_debugInsetsView));
}

@end