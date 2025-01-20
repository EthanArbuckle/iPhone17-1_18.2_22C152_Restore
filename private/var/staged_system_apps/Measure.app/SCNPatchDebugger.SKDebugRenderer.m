@interface SCNPatchDebugger.SKDebugRenderer
- (_TtCC7Measure16SCNPatchDebugger15SKDebugRenderer)init;
- (_TtCC7Measure16SCNPatchDebugger15SKDebugRenderer)initWithCoder:(id)a3;
- (void)dealloc;
@end

@implementation SCNPatchDebugger.SKDebugRenderer

- (_TtCC7Measure16SCNPatchDebugger15SKDebugRenderer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001C7D0();
}

- (void)dealloc
{
  v2 = self;
  SCNPatchDebugger.SKDebugRenderer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7Measure16SCNPatchDebugger15SKDebugRenderer_drawingTexture));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC7Measure16SCNPatchDebugger15SKDebugRenderer_drawingNode);
}

- (_TtCC7Measure16SCNPatchDebugger15SKDebugRenderer)init
{
  result = (_TtCC7Measure16SCNPatchDebugger15SKDebugRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end