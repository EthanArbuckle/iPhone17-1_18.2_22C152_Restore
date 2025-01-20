@interface LoadingCell
- (_TtC23ShelfKitCollectionViews11LoadingCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews11LoadingCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation LoadingCell

- (_TtC23ShelfKitCollectionViews11LoadingCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews11LoadingCell *)sub_18B0A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews11LoadingCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18BBD0();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(LoadingCell *)&v4 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews11LoadingCell_spinner];
  if ((objc_msgSend(v3, "isAnimating", v4.receiver, v4.super_class) & 1) == 0) {
    [v3 startAnimating];
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11LoadingCell_spinner));

  swift_release();
}

@end