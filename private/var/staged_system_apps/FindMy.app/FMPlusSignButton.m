@interface FMPlusSignButton
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (_TtC6FindMy16FMPlusSignButton)init;
- (_TtC6FindMy16FMPlusSignButton)initWithCoder:(id)a3;
- (_TtC6FindMy16FMPlusSignButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FMPlusSignButton

- (_TtC6FindMy16FMPlusSignButton)init
{
  return (_TtC6FindMy16FMPlusSignButton *)sub_1000E5A80();
}

- (_TtC6FindMy16FMPlusSignButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6FindMy16FMPlusSignButton_isRTLLanguage) = 0;
  id v4 = a3;

  result = (_TtC6FindMy16FMPlusSignButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000E5DBC();
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for FMPlusSignButton();
  v25.receiver = self;
  v25.super_class = v8;
  v9 = self;
  -[FMPlusSignButton titleRectForContentRect:](&v25, "titleRectForContentRect:", x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  if (*((unsigned char *)&v9->super.super.super.super.super.isa + OBJC_IVAR____TtC6FindMy16FMPlusSignButton_isRTLLanguage) == 1)
  {
    v24.receiver = v9;
    v24.super_class = v8;
    -[FMPlusSignButton imageRectForContentRect:](&v24, "imageRectForContentRect:", x, y, width, height);
    double v17 = v16;

    double v18 = width - v17 + -5.0;
    double v19 = 0.0;
  }
  else
  {
    double v20 = v10;
    double v18 = v11;

    double v19 = v20 + 5.0;
  }
  double v21 = v13;
  double v22 = v18;
  double v23 = v15;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v19;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)type metadata accessor for FMPlusSignButton();
  id v7 = v21.receiver;
  -[FMPlusSignButton imageRectForContentRect:](&v21, "imageRectForContentRect:", x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (*((unsigned char *)v7 + OBJC_IVAR____TtC6FindMy16FMPlusSignButton_isRTLLanguage) == 1)
  {
    v22.origin.double x = x;
    v22.origin.double y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    double MaxX = CGRectGetMaxX(v22);

    double v16 = MaxX - v12;
  }
  else
  {
    double v16 = v8;
  }
  double v17 = v10 + 1.0;
  double v18 = v16;
  double v19 = v12;
  double v20 = v14;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v17;
  result.origin.double x = v18;
  return result;
}

- (_TtC6FindMy16FMPlusSignButton)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC6FindMy16FMPlusSignButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end