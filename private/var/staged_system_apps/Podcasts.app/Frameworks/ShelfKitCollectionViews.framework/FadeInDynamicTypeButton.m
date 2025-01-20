@interface FadeInDynamicTypeButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIColor)backgroundColor;
- (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FadeInDynamicTypeButton

- (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_maximumFadeWidth) = (Class)0x4059000000000000;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_fadeInPosition) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_touchInsets;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton *)sub_385890();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_5F170();
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FadeInDynamicTypeButton();
  v2 = [(FadeInDynamicTypeButton *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FadeInDynamicTypeButton();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FadeInDynamicTypeButton *)&v6 setBackgroundColor:v4];
  sub_5F170();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5F460();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = (double *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_touchInsets);
  if (self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_touchInsets + 24])
  {
    v19.receiver = self;
    v19.super_class = (Class)type metadata accessor for FadeInDynamicTypeButton();
    return -[FadeInDynamicTypeButton pointInside:withEvent:](&v19, "pointInside:withEvent:", a4, x, y);
  }
  else
  {
    double v11 = *v8;
    double v10 = v8[1];
    id v12 = a4;
    v13 = self;
    [(FadeInDynamicTypeButton *)v13 bounds];
    v21.origin.double x = UIEdgeInsetsInsetRect(v14, v15, v16, v17, v11, v10);
    v20.double x = x;
    v20.double y = y;
    BOOL v18 = CGRectContainsPoint(v21, v20);

    return v18;
  }
}

- (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23FadeInDynamicTypeButton_fadeLayer));
}

@end