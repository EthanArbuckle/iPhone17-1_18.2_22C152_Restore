@interface ULKeychainMock
+ (id)retrieveSymmetricKey:(id)a3;
- (_TtC19MicroLocationDaemon14ULKeychainMock)init;
@end

@implementation ULKeychainMock

+ (id)retrieveSymmetricKey:(id)a3
{
  uint64_t v3 = sub_2564E1440();
  static ULKeychainMock.retrieveSymmetricKey(_:)(v3, v4, (uint64_t)v13);
  swift_bridgeObjectRelease();
  uint64_t v5 = v14;
  if (v14)
  {
    v6 = __swift_project_boxed_opaque_existential_1(v13, v14);
    uint64_t v7 = *(void *)(v5 - 8);
    double v8 = MEMORY[0x270FA5388](v6);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v7 + 16))(v10, v8);
    v11 = (void *)sub_2564E1580();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (_TtC19MicroLocationDaemon14ULKeychainMock)init
{
  return (_TtC19MicroLocationDaemon14ULKeychainMock *)sub_2564D5F24(self, (uint64_t)a2, type metadata accessor for ULKeychainMock);
}

@end