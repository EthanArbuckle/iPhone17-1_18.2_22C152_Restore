@interface RFInteractionPerformed
- (BOOL)requiresNewTurn;
- (_TtC9SnippetUI22RFInteractionPerformed)init;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
@end

@implementation RFInteractionPerformed

- (BOOL)requiresNewTurn
{
  return 1;
}

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4 = sub_22C648FF0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C648FD0();
  v8 = self;
  sub_22C35B430((uint64_t)v7);

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
  sub_22C35B7D4((uint64_t)v11, (uint64_t)v8);

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  v13(v11, v5);
}

- (_TtC9SnippetUI22RFInteractionPerformed)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SnippetUI22RFInteractionPerformed_command;
  uint64_t v4 = sub_22C64C4A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SnippetUI22RFInteractionPerformed_invocation));
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC9SnippetUI22RFInteractionPerformed_instrumentationClient;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

@end