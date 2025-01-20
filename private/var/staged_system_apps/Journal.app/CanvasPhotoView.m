@interface CanvasPhotoView
- (_TtC7Journal15CanvasPhotoView)initWithCoder:(id)a3;
- (_TtC7Journal15CanvasPhotoView)initWithFrame:(CGRect)a3;
- (_TtC7Journal15CanvasPhotoView)initWithImage:(id)a3;
- (_TtC7Journal15CanvasPhotoView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation CanvasPhotoView

- (_TtC7Journal15CanvasPhotoView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal15CanvasPhotoView *)sub_100069E18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal15CanvasPhotoView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasPhotoView_sizeType) = 4;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasPhotoView_fallbackView) = 0;
  id v4 = a3;

  result = (_TtC7Journal15CanvasPhotoView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Journal15CanvasPhotoView)initWithImage:(id)a3
{
  id v4 = a3;
  return (_TtC7Journal15CanvasPhotoView *)sub_100069FB0(a3);
}

- (_TtC7Journal15CanvasPhotoView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC7Journal15CanvasPhotoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15CanvasPhotoView_fallbackView));
}

@end