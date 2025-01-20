@interface CRLBoardFileWriteAssistant
- (_TtC8Freeform26CRLBoardFileWriteAssistant)init;
- (void)writeBoard:(_TtC8Freeform8CRLBoard *)a3 completionHandler:(id)a4;
@end

@implementation CRLBoardFileWriteAssistant

- (void)writeBoard:(_TtC8Freeform8CRLBoard *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_101689AE0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10169FAB0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_100E6DE90((uint64_t)v10, (uint64_t)&unk_10169A060, (uint64_t)v15);
  swift_release();
}

- (_TtC8Freeform26CRLBoardFileWriteAssistant)init
{
  result = (_TtC8Freeform26CRLBoardFileWriteAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform26CRLBoardFileWriteAssistant_url;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform26CRLBoardFileWriteAssistant_context);
}

@end