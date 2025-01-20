@interface CRLPasteboardObjectItemProviderReadAssistant
- (_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant)init;
- (_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant)initWithStore:(id)a3 context:(id)a4;
- (id)readPasteboardObjectFrom:(id)a3 completion:(id)a4;
@end

@implementation CRLPasteboardObjectItemProviderReadAssistant

- (_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant)initWithStore:(id)a3 context:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  v7 = (char *)objc_allocWithZone(ObjectType);
  type metadata accessor for CRLItemProviderReadAssistant();
  v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = 7;
  *(void *)&v7[OBJC_IVAR____TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant_readAssistant] = v8;
  v13.receiver = v7;
  v13.super_class = ObjectType;
  id v9 = a3;
  id v10 = a4;
  v11 = [(CRLPasteboardObjectItemProviderReadAssistant *)&v13 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (id)readPasteboardObjectFrom:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  id v10 = sub_1009C3B34(v8, (uint64_t)sub_1009C3FB4, v7);

  swift_release();

  return v10;
}

- (_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant)init
{
  result = (_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end