@interface CRLPasteboardObjectReadAssistant
+ (id)contentDescriptionFrom:(id)a3;
- (_TtC8Freeform19CRLPasteboardObject)pasteboardObject;
- (_TtC8Freeform32CRLPasteboardObjectReadAssistant)init;
- (_TtC8Freeform32CRLPasteboardObjectReadAssistant)initWithPasteboard:(id)a3 store:(id)a4 context:(id)a5;
- (_TtC8Freeform32CRLPasteboardObjectReadAssistant)initWithPasteboardNativeDataProvider:(id)a3 store:(id)a4 context:(id)a5;
- (void)readPasteboardObjectWithCompletionHandler:(id)a3;
- (void)setPasteboardObject:(id)a3;
@end

@implementation CRLPasteboardObjectReadAssistant

- (_TtC8Freeform19CRLPasteboardObject)pasteboardObject
{
  return (_TtC8Freeform19CRLPasteboardObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_pasteboardObject));
}

- (void)setPasteboardObject:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_pasteboardObject);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_pasteboardObject) = (Class)a3;
  id v3 = a3;
}

+ (id)contentDescriptionFrom:(id)a3
{
  id v4 = self;
  id v5 = a3;
  id v6 = [v4 contentDescriptionFromPasteboard:v5];
  if (v6)
  {
    v7 = v6;
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    v8.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {

    v8.super.isa = 0;
  }

  return v8.super.isa;
}

- (_TtC8Freeform32CRLPasteboardObjectReadAssistant)initWithPasteboard:(id)a3 store:(id)a4 context:(id)a5
{
  id v5 = (_TtC8Freeform32CRLPasteboardObjectReadAssistant *)sub_1007D5BE4((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 7);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (_TtC8Freeform32CRLPasteboardObjectReadAssistant)initWithPasteboardNativeDataProvider:(id)a3 store:(id)a4 context:(id)a5
{
  return (_TtC8Freeform32CRLPasteboardObjectReadAssistant *)sub_1007D4C6C(a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)readPasteboardObjectWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  NSDictionary v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1016814B8;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10169FAB0;
  v13[5] = v12;
  v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_10169A060, (uint64_t)v13);
  swift_release();
}

- (_TtC8Freeform32CRLPasteboardObjectReadAssistant)init
{
  result = (_TtC8Freeform32CRLPasteboardObjectReadAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_channelProvider);

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_pasteboardObject);
}

@end