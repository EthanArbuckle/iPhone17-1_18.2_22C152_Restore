@interface InsetCollectionViewControllerContentView
- (_TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView)initWithFrame:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (unint64_t)edgesInsettingLayoutMarginsFromSafeArea;
- (void)setEdgesInsettingLayoutMarginsFromSafeArea:(unint64_t)a3;
@end

@implementation InsetCollectionViewControllerContentView

- (_TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset) = 1;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[InsetCollectionViewControllerContentView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  if (*((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset))
    return 15;
  else {
    return 14;
  }
}

- (unint64_t)edgesInsettingLayoutMarginsFromSafeArea
{
  if (*((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset) != 1)
    return 14;
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(InsetCollectionViewControllerContentView *)&v3 edgesInsettingLayoutMarginsFromSafeArea];
}

- (void)setEdgesInsettingLayoutMarginsFromSafeArea:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(InsetCollectionViewControllerContentView *)&v4 setEdgesInsettingLayoutMarginsFromSafeArea:a3];
}

- (_TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset) = 1;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(InsetCollectionViewControllerContentView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end