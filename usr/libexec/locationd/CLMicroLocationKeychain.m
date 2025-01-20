@interface CLMicroLocationKeychain
+ (BOOL)removeKey:(id)a3;
+ (id)getSymmetricKeyOrCreateNew:(id)a3;
+ (id)retrieveSymmetricKey:(id)a3;
- (_TtC19microlocation_logic23CLMicroLocationKeychain)init;
@end

@implementation CLMicroLocationKeychain

+ (id)getSymmetricKeyOrCreateNew:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  sub_100346DC0(v3, v5, &v14);
  swift_bridgeObjectRelease();
  uint64_t v6 = v15;
  if (v15)
  {
    v7 = sub_100346A40(&v14, v15);
    uint64_t v8 = *(void *)(v6 - 8);
    double v9 = __chkstk_darwin(v7);
    v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v8 + 16))(v11, v9);
    v12 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
    sub_100346A84((uint64_t)&v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)retrieveSymmetricKey:(id)a3
{
  return sub_1003487D4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, uint64_t))sub_100347E60);
}

+ (BOOL)removeKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v5 = sub_10034A5E4(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC19microlocation_logic23CLMicroLocationKeychain)init
{
  return (_TtC19microlocation_logic23CLMicroLocationKeychain *)sub_100348988(self, (uint64_t)a2, type metadata accessor for CLMicroLocationKeychain);
}

@end