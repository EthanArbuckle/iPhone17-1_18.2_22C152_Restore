@interface ParentAppClipCodeView
- (_TtC12PhotosUICoreP33_4205AE50DB34A253AEBD659A3667797221ParentAppClipCodeView)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_4205AE50DB34A253AEBD659A3667797221ParentAppClipCodeView)initWithFrame:(CGRect)a3;
@end

@implementation ParentAppClipCodeView

- (_TtC12PhotosUICoreP33_4205AE50DB34A253AEBD659A3667797221ParentAppClipCodeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_4205AE50DB34A253AEBD659A3667797221ParentAppClipCodeView_imageView) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[ParentAppClipCodeView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12PhotosUICoreP33_4205AE50DB34A253AEBD659A3667797221ParentAppClipCodeView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_4205AE50DB34A253AEBD659A3667797221ParentAppClipCodeView_imageView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(ParentAppClipCodeView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_4205AE50DB34A253AEBD659A3667797221ParentAppClipCodeView_imageView));
}

@end