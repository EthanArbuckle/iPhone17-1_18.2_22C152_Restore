@interface AmbientNoMatchUIView
- (CGSize)intrinsicContentSize;
- (_TtC11ShazamKitUI20AmbientNoMatchUIView)initWithCoder:(id)a3;
- (_TtC11ShazamKitUI20AmbientNoMatchUIView)initWithFrame:(CGRect)a3;
@end

@implementation AmbientNoMatchUIView

- (_TtC11ShazamKitUI20AmbientNoMatchUIView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC11ShazamKitUI20AmbientNoMatchUIView_titleLabel;
  id v10 = objc_allocWithZone(MEMORY[0x263F828E0]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[AmbientNoMatchUIView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_236CE7FE8();

  return v12;
}

- (_TtC11ShazamKitUI20AmbientNoMatchUIView)initWithCoder:(id)a3
{
  return (_TtC11ShazamKitUI20AmbientNoMatchUIView *)sub_236CE83D4(a3);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(AmbientNoMatchUIView *)v2 superview];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
  }
  else
  {

    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI20AmbientNoMatchUIView_titleLabel));
}

@end