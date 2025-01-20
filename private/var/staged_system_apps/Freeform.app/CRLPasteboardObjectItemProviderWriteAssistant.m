@interface CRLPasteboardObjectItemProviderWriteAssistant
- (_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant)init;
- (_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant)initWithStore:(id)a3 context:(id)a4;
- (void)writePasteboardObject:(_TtC8Freeform19CRLPasteboardObject *)a3 to:(NSItemProvider *)a4 completionHandler:(id)a5;
@end

@implementation CRLPasteboardObjectItemProviderWriteAssistant

- (_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant)initWithStore:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant *)sub_1005D9118(v5, v6);

  return v7;
}

- (void)writePasteboardObject:(_TtC8Freeform19CRLPasteboardObject *)a3 to:(NSItemProvider *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v9 - 8, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_101674EF0;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10169FAB0;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_100E6DE90((uint64_t)v12, (uint64_t)&unk_10169A060, (uint64_t)v17);
  swift_release();
}

- (_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant)init
{
  result = (_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end