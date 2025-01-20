@interface RFVisualResponseShown
- (_TtC9SnippetUI21RFVisualResponseShown)init;
- (_TtC9SnippetUI21RFVisualResponseShown)initWithCardData:(id)a3 responseViewId:(id)a4;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
@end

@implementation RFVisualResponseShown

- (_TtC9SnippetUI21RFVisualResponseShown)initWithCardData:(id)a3 responseViewId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = sub_22C648F30();
  unint64_t v9 = v8;

  uint64_t v10 = sub_22C64F480();
  uint64_t v12 = v11;

  return (_TtC9SnippetUI21RFVisualResponseShown *)RFVisualResponseShown.init(cardData:responseViewId:)(v7, v9, v10, v12);
}

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4 = sub_22C648FF0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C648FD0();
  unint64_t v8 = self;
  sub_22C5DC90C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  uint64_t v5 = sub_22C648FF0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v14 - v10;
  sub_22C648FD0();
  sub_22C648FD0();
  uint64_t v12 = self;
  sub_22C458788();

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  v13(v11, v5);
}

- (_TtC9SnippetUI21RFVisualResponseShown)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SnippetUI21RFVisualResponseShown_instrumentationClient);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SnippetUI21RFVisualResponseShown_preferences));

  swift_release();
}

@end