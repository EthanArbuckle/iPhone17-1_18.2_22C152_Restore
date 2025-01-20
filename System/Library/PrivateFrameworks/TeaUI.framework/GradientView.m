@interface GradientView
+ (Class)layerClass;
- (_TtC5TeaUI12GradientView)initWithCoder:(id)a3;
- (_TtC5TeaUI12GradientView)initWithFrame:(CGRect)a3;
@end

@implementation GradientView

+ (Class)layerClass
{
  static GradientView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5TeaUI12GradientView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI12GradientView *)GradientView.init(frame:)();
}

- (_TtC5TeaUI12GradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  GradientView.init(coder:)();
}

- (void).cxx_destruct
{
  sub_1B5F58758(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI12GradientView_gradientDescriptor));
  sub_1B5F590C0((uint64_t)self + OBJC_IVAR____TtC5TeaUI12GradientView_dynamicGradientDescriptor, (uint64_t)v3);
  sub_1B5F593B8((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1B5F5942C);
}

@end