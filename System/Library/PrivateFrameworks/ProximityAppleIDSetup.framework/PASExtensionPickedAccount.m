@interface PASExtensionPickedAccount
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount)init;
- (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PASExtensionPickedAccount

- (NSString)description
{
  v2 = self;
  PASExtensionPickedAccount.description.getter();

  v3 = (void *)sub_22CC9EB98();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22CC9F038();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = PASExtensionPickedAccount.isEqual(_:)((uint64_t)v8);

  sub_22CB9811C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = PASExtensionPickedAccount.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return static PASExtensionPickedAccount.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PASExtensionPickedAccount.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PASExtensionPickedAccount.encode(with:)((NSCoder)v4);
}

- (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *)sub_22CB989DC(v3);

  return v4;
}

- (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount)init
{
  result = (_TtC21ProximityAppleIDSetup25PASExtensionPickedAccount *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC21ProximityAppleIDSetup25PASExtensionPickedAccount_imageData);
  unint64_t v4 = *(void *)&self->dsid[OBJC_IVAR____TtC21ProximityAppleIDSetup25PASExtensionPickedAccount_imageData];

  sub_22CB9817C(v3, v4);
}

@end