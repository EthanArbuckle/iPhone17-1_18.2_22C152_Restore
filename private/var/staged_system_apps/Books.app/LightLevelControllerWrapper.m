@interface LightLevelControllerWrapper
- (_TtC5Books27LightLevelControllerWrapper)init;
- (void)dealloc;
@end

@implementation LightLevelControllerWrapper

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books27LightLevelControllerWrapper_lightLevelController);
  v3 = self;
  [v2 removeObserver:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LightLevelControllerWrapper();
  [(LightLevelControllerWrapper *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books27LightLevelControllerWrapper_lightLevelController);
}

- (_TtC5Books27LightLevelControllerWrapper)init
{
  result = (_TtC5Books27LightLevelControllerWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end