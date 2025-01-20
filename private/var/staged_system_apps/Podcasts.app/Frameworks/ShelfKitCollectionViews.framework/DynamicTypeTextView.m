@interface DynamicTypeTextView
- (UIFont)font;
- (_TtC23ShelfKitCollectionViews19DynamicTypeTextView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews19DynamicTypeTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)_viewToAddFocusLayer;
- (void)setFont:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeTextView

- (UIFont)font
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  v2 = [(DynamicTypeTextView *)&v4 font];

  return v2;
}

- (void)setFont:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  id v4 = a3;
  id v5 = v9.receiver;
  [(DynamicTypeTextView *)&v9 setFont:v4];
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  __int16 v8 = -256;
  sub_E990((uint64_t)v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_EC84((uint64_t)a3);
}

- (id)_viewToAddFocusLayer
{
  return 0;
}

- (_TtC23ShelfKitCollectionViews19DynamicTypeTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v9 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19DynamicTypeTextView_fontUseCase;
  *(_OWORD *)objc_super v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *((_OWORD *)v9 + 4) = 0u;
  *((void *)v9 + 10) = 0;
  *((_WORD *)v9 + 44) = -256;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  return -[DynamicTypeTextView initWithFrame:textContainer:](&v11, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews19DynamicTypeTextView)initWithCoder:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19DynamicTypeTextView_fontUseCase;
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((void *)v4 + 10) = 0;
  *((_WORD *)v4 + 44) = -256;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  return [(DynamicTypeTextView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19DynamicTypeTextView_fontUseCase;
  sub_F0B4(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews19DynamicTypeTextView_fontUseCase), *((void *)v2 + 1), *((void *)v2 + 2), *((void *)v2 + 3), *((void *)v2 + 4), *((void *)v2 + 5), *((void **)v2 + 6), *((void *)v2 + 7), *((void *)v2 + 8), *((void *)v2 + 9), *((void *)v2 + 10), *((_WORD *)v2 + 44));
}

@end