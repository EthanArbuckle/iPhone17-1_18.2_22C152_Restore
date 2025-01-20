@interface BackdropView
+ (Class)layerClass;
- (_TtC5Music12BackdropView)initWithCoder:(id)a3;
- (_TtC5Music12BackdropView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BackdropView

- (_TtC5Music12BackdropView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music12BackdropView_gradientMaskType) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music12BackdropView_gradientLayer) = 0;
  uint64_t v5 = OBJC_IVAR____TtC5Music12BackdropView_overlayView;
  type metadata accessor for PassthroughView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC5Music12BackdropView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_100057778(0, &qword_1010A7DC0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003D594C();
}

- (_TtC5Music12BackdropView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Music12BackdropView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music12BackdropView_overlayView);
}

@end