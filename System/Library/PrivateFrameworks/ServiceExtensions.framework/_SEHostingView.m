@interface _SEHostingView
+ (Class)layerClass;
- (_SEHostingHandle)handle;
- (_SEHostingView)initWithCoder:(id)a3;
- (_SEHostingView)initWithFrame:(CGRect)a3;
- (void)setHandle:(id)a3;
@end

@implementation _SEHostingView

- (_SEHostingHandle)handle
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  return (_SEHostingHandle *)*v2;
}

- (void)setHandle:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_25C21DDAC();
}

+ (Class)layerClass
{
  sub_25C20D014(0, &qword_26A5970E0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_SEHostingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView__visibility) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView_handle) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _SEHostingView();
  return -[_SEHostingView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_SEHostingView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView__visibility) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView_handle) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _SEHostingView();
  return [(_SEHostingView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView_handle);
}

@end