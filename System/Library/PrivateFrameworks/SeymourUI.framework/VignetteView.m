@interface VignetteView
+ (Class)layerClass;
- (_TtC9SeymourUI12VignetteView)initWithCoder:(id)a3;
- (_TtC9SeymourUI12VignetteView)initWithFrame:(CGRect)a3;
@end

@implementation VignetteView

+ (Class)layerClass
{
  sub_239C24FF0(0, &qword_268A0F120);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9SeymourUI12VignetteView)initWithCoder:(id)a3
{
  v4 = self;
  id v5 = a3;
  id v6 = objc_msgSend(v4, sel_blackColor);
  id v7 = objc_allocWithZone((Class)type metadata accessor for VignetteView());
  v8 = (_TtC9SeymourUI12VignetteView *)sub_239CD0E50(3, v6);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (_TtC9SeymourUI12VignetteView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI12VignetteView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end