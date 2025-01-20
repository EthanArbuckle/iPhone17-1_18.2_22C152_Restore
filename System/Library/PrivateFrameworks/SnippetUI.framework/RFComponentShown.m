@interface RFComponentShown
- (_TtC9SnippetUI16RFComponentShown)init;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
@end

@implementation RFComponentShown

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4 = sub_22C648FF0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C648FD0();
  v8 = self;
  sub_22C3DA444((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  uint64_t v5 = sub_22C648FF0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v11 = (char *)&v14 - v10;
  sub_22C648FD0();
  sub_22C648FD0();
  v12 = self;
  sub_22C3DA620((uint64_t)v11, (uint64_t)v8);

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  v13(v11, v5);
}

- (_TtC9SnippetUI16RFComponentShown)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SnippetUI16RFComponentShown_instrumentationClient;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end