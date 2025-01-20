@interface RadialGradientView
+ (Class)layerClass;
- (_TtC5TeaUI18RadialGradientView)initWithCoder:(id)a3;
- (_TtC5TeaUI18RadialGradientView)initWithFrame:(CGRect)a3;
@end

@implementation RadialGradientView

+ (Class)layerClass
{
  static RadialGradientView.layerClass.getter(a1, a2);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5TeaUI18RadialGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI18RadialGradientView *)RadialGradientView.init(frame:)();
}

- (_TtC5TeaUI18RadialGradientView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI18RadialGradientView *)RadialGradientView.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end