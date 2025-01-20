@interface FMGradientMaskingView
+ (Class)layerClass;
- (_TtC6FindMy21FMGradientMaskingView)init;
- (_TtC6FindMy21FMGradientMaskingView)initWithCoder:(id)a3;
- (_TtC6FindMy21FMGradientMaskingView)initWithFrame:(CGRect)a3;
@end

@implementation FMGradientMaskingView

+ (Class)layerClass
{
  sub_100006060(0, &qword_1006B89A8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC6FindMy21FMGradientMaskingView)init
{
  return (_TtC6FindMy21FMGradientMaskingView *)sub_100296304();
}

- (_TtC6FindMy21FMGradientMaskingView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy21FMGradientMaskingView_gradientLayer;
  id v6 = objc_allocWithZone((Class)CAGradientLayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy21FMGradientMaskingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy21FMGradientMaskingView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy21FMGradientMaskingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMGradientMaskingView_gradientLayer));
}

@end