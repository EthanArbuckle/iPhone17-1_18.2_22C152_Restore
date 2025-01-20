@interface CRLPasteboardObjectWriteAssistant
- (_TtC8Freeform33CRLPasteboardObjectWriteAssistant)init;
- (_TtC8Freeform33CRLPasteboardObjectWriteAssistant)initWithPasteboard:(id)a3 store:(id)a4 context:(id)a5;
- (void)writePasteboardObject:(_TtC8Freeform19CRLPasteboardObject *)a3 completionHandler:(id)a4;
@end

@implementation CRLPasteboardObjectWriteAssistant

- (_TtC8Freeform33CRLPasteboardObjectWriteAssistant)initWithPasteboard:(id)a3 store:(id)a4 context:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (_TtC8Freeform33CRLPasteboardObjectWriteAssistant *)sub_100B96578((uint64_t)v9, (uint64_t)[v9 pasteboardItemMaxSize], v10, v11, (char *)objc_allocWithZone(ObjectType));

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (void)writePasteboardObject:(_TtC8Freeform19CRLPasteboardObject *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v7 - 8, v8);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_101695028;
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

- (_TtC8Freeform33CRLPasteboardObjectWriteAssistant)init
{
  result = (_TtC8Freeform33CRLPasteboardObjectWriteAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC8Freeform33CRLPasteboardObjectWriteAssistant_pasteboardDataManaging);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLPasteboardObjectWriteAssistant_metadataWriteChannel));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform33CRLPasteboardObjectWriteAssistant_objectsWriteChannel);
}

@end