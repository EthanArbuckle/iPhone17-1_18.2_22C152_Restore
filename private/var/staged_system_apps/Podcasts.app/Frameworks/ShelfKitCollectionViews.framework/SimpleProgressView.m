@interface SimpleProgressView
- (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation SimpleProgressView

- (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView *)sub_C68DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_C7EF4();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(SimpleProgressView *)&v3 tintColorDidChange];
  [v2 setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_C6D48(x, y, width, height);
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self
     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView__progress;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_474350);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView__progressTintColor;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_474348);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v6 - 8), v5, v6);
  v7 = (char *)self
     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D8618SimpleProgressView__trackTintColor;

  v8(v7, v6);
}

@end