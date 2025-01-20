@interface RenderGraphDiagnostics
- (_TtC3VFX22RenderGraphDiagnostics)init;
- (void)addGenericRenderGraphErrorWithMessage:(id)a3;
@end

@implementation RenderGraphDiagnostics

- (void)addGenericRenderGraphErrorWithMessage:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  v7 = self;
  sub_1B6C7F204(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC3VFX22RenderGraphDiagnostics)init
{
  result = (_TtC3VFX22RenderGraphDiagnostics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end