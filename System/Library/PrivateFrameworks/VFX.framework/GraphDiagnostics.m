@interface GraphDiagnostics
- (_TtC3VFX16GraphDiagnostics)init;
@end

@implementation GraphDiagnostics

- (_TtC3VFX16GraphDiagnostics)init
{
  uint64_t v3 = OBJC_IVAR____TtC3VFX16GraphDiagnostics_rawNodesByID;
  v4 = self;
  v5 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1B67DF6EC(MEMORY[0x1E4FBC860]);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC3VFX16GraphDiagnostics_diagnostics) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for GraphDiagnostics();
  return [(GraphDiagnostics *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end