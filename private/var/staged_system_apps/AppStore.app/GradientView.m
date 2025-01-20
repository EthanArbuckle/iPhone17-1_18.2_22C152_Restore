@interface GradientView
+ (Class)layerClass;
- (_TtC8AppStore12GradientView)init;
- (_TtC8AppStore12GradientView)initWithCoder:(id)a3;
- (_TtC8AppStore12GradientView)initWithFrame:(CGRect)a3;
@end

@implementation GradientView

+ (Class)layerClass
{
  sub_100084CF0(0, &qword_10098A898);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8AppStore12GradientView)init
{
  return (_TtC8AppStore12GradientView *)sub_100058C6C();
}

- (_TtC8AppStore12GradientView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore12GradientView_colors) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore12GradientView_kind) = 0;
  id v4 = a3;

  result = (_TtC8AppStore12GradientView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8AppStore12GradientView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore12GradientView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end