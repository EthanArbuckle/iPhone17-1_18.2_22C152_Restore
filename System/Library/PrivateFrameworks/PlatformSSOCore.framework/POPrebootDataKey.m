@interface POPrebootDataKey
+ (NSNumber)prebootEncryptionAlgorithm;
+ (id)createKeyAndReturnError:(id *)a3;
+ (id)decryptWithData:(id)a3 key:(__SecKey *)a4 error:(id *)a5;
+ (id)encryptWithData:(id)a3 key:(__SecKey *)a4 error:(id *)a5;
+ (id)verifiedKeyWithPrebootData:(id)a3 error:(id *)a4;
- (NSData)keyData;
- (NSString)encryptedKeyData;
- (_TtC15PlatformSSOCore16POPrebootDataKey)init;
- (void)setEncryptedKeyData:(id)a3;
- (void)setKeyData:(id)a3;
@end

@implementation POPrebootDataKey

+ (NSNumber)prebootEncryptionAlgorithm
{
  if (qword_26A3F7F00 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26A3F8670;
  return (NSNumber *)v2;
}

- (NSString)encryptedKeyData
{
  v2 = (char *)self + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_259E9A058();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setEncryptedKeyData:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_259E9A068();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSData)keyData
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData);
  swift_beginAccess();
  v3 = 0;
  unint64_t v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *v2;
    sub_259E5D7F8(v5, v4);
    v3 = (void *)sub_259E99BC8();
    sub_259E5D8A8(v5, v4);
  }
  return (NSData *)v3;
}

- (void)setKeyData:(id)a3
{
  v3 = a3;
  if (a3)
  {
    uint64_t v5 = self;
    id v6 = v3;
    v3 = (void *)sub_259E99BE8();
    unint64_t v8 = v7;
  }
  else
  {
    v9 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData);
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  uint64_t *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_259E5D8A8(v11, v12);
}

- (_TtC15PlatformSSOCore16POPrebootDataKey)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  void *v2 = 0;
  v2[1] = 0;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData) = xmmword_259EA1080;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for POPrebootDataKey();
  return [(POPrebootDataKey *)&v4 init];
}

+ (id)verifiedKeyWithPrebootData:(id)a3 error:(id *)a4
{
  sub_259E9A068();
  swift_getObjCClassMetadata();
  uint64_t v4 = static POPrebootDataKey.verifiedKey(prebootData:)();
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  unint64_t v7 = (void *)sub_259E99BC8();
  sub_259E5D850(v4, v6);
  return v7;
}

+ (id)createKeyAndReturnError:(id *)a3
{
  swift_getObjCClassMetadata();
  v3 = static POPrebootDataKey.createKey()();
  return v3;
}

+ (id)encryptWithData:(id)a3 key:(__SecKey *)a4 error:(id *)a5
{
  return sub_259E5FD54((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, id))sub_259E60E38);
}

+ (id)decryptWithData:(id)a3 key:(__SecKey *)a4 error:(id *)a5
{
  return sub_259E5FD54((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, id))sub_259E613FC);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData);
  unint64_t v4 = *(void *)&self->encryptedKeyData[OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData];
  sub_259E5D8A8(v3, v4);
}

@end