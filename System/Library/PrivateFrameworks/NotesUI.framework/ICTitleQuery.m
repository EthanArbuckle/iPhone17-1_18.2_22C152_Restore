@interface ICTitleQuery
- (_TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery)init;
- (_TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery)initWithDrawing:(id)a3;
- (void)start;
- (void)titleQuery:(id)a3 didUpdateWithItem:(id)a4;
@end

@implementation ICTitleQuery

- (void)titleQuery:(id)a3 didUpdateWithItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = [(PKTitleQuery *)v8 transcribedTitle];
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = sub_1B0B8240C();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  sub_1B0A5A990(v11, v13);

  swift_bridgeObjectRelease();
}

- (void)start
{
  v2 = self;
  sub_1B0A5A764();
}

- (_TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery)initWithDrawing:(id)a3
{
  uint64_t v4 = sub_1B0B822EC();
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = a3;
  sub_1B0B822DC();

  return (_TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery *)sub_1B0A5AE9C((uint64_t)v6);
}

- (_TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_drawingUUID) = 0;
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_continuation;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB4E98);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_resumed) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_timer) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(ICTitleQuery *)&v7 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1B0A2E21C((uint64_t)self + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_continuation, (uint64_t *)&unk_1EBBB4EA0);
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7NotesUIP33_F897AB263D3561CA5D296CCFF5C5FDF512ICTitleQuery_timer);
}

@end