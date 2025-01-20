@interface ShapeContainer
+ (Class)layerClass;
- (_TtC14MentalHealthUI14ShapeContainer)initWithCoder:(id)a3;
- (_TtC14MentalHealthUI14ShapeContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ShapeContainer

+ (Class)layerClass
{
  sub_256171D38();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ShapeContainer *)&v3 layoutSubviews];
  sub_2561707D0();
}

- (_TtC14MentalHealthUI14ShapeContainer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14MentalHealthUI14ShapeContainer_renderer) = 0;
  v9 = (_OWORD *)((char *)self + OBJC_IVAR____TtC14MentalHealthUI14ShapeContainer_lastBounds);
  _OWORD *v9 = 0u;
  v9[1] = 0u;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[ShapeContainer initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC14MentalHealthUI14ShapeContainer)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14MentalHealthUI14ShapeContainer_renderer) = 0;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC14MentalHealthUI14ShapeContainer_lastBounds);
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(ShapeContainer *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end