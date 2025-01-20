@interface DynamicTypeButton
- (_TtC23ShelfKitCollectionViews17DynamicTypeButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17DynamicTypeButton)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeButton

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_3718CC((uint64_t)a3);
}

- (_TtC23ShelfKitCollectionViews17DynamicTypeButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17DynamicTypeButton_fontUseCase;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((void *)v7 + 10) = 0;
  *((_WORD *)v7 + 44) = -256;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DynamicTypeButton();
  return -[DynamicTypeButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews17DynamicTypeButton)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17DynamicTypeButton_fontUseCase;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((void *)v4 + 10) = 0;
  *((_WORD *)v4 + 44) = -256;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DynamicTypeButton();
  return [(DynamicTypeButton *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17DynamicTypeButton_fontUseCase;
  sub_F0B4(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews17DynamicTypeButton_fontUseCase), *((void *)v2 + 1), *((void *)v2 + 2), *((void *)v2 + 3), *((void *)v2 + 4), *((void *)v2 + 5), *((void **)v2 + 6), *((void *)v2 + 7), *((void *)v2 + 8), *((void *)v2 + 9), *((void *)v2 + 10), *((_WORD *)v2 + 44));
}

@end