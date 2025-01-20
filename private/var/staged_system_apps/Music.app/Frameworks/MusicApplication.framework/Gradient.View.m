@interface Gradient.View
+ (Class)layerClass;
- (_TtCV11MusicCoreUI8Gradient4View)initWithCoder:(id)a3;
- (_TtCV11MusicCoreUI8Gradient4View)initWithFrame:(CGRect)a3;
@end

@implementation Gradient.View

- (_TtCV11MusicCoreUI8Gradient4View)initWithCoder:(id)a3
{
  result = (_TtCV11MusicCoreUI8Gradient4View *)sub_AB8280();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_173E4(0, (unint64_t *)&qword_DF5350);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCV11MusicCoreUI8Gradient4View)initWithFrame:(CGRect)a3
{
  result = (_TtCV11MusicCoreUI8Gradient4View *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV11MusicCoreUI8Gradient4View_typedConfiguration));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end