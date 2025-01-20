@interface ULKeychain
+ (BOOL)removeKey:(id)a3;
+ (id)getSymmetricKeyOrCreateNew:(id)a3;
+ (id)retrieveSymmetricKey:(id)a3;
- (_TtC19MicroLocationDaemon10ULKeychain)init;
@end

@implementation ULKeychain

+ (id)getSymmetricKeyOrCreateNew:(id)a3
{
  return sub_2564D54C8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, uint64_t, uint64_t))static ULKeychain.getSymmetricKeyOrCreateNew(_:));
}

+ (id)retrieveSymmetricKey:(id)a3
{
  return sub_2564D54C8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, uint64_t, uint64_t))static ULKeychain.retrieveSymmetricKey(_:));
}

+ (BOOL)removeKey:(id)a3
{
  uint64_t v3 = sub_2564E1440();
  BOOL v5 = _s19MicroLocationDaemon10ULKeychainC9removeKeyySbSSFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC19MicroLocationDaemon10ULKeychain)init
{
  return (_TtC19MicroLocationDaemon10ULKeychain *)sub_2564D5F24(self, (uint64_t)a2, type metadata accessor for ULKeychain);
}

@end