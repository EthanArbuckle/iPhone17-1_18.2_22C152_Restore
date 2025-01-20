@interface PASExtensionManifest
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC21ProximityAppleIDSetup20PASExtensionManifest)init;
- (_TtC21ProximityAppleIDSetup20PASExtensionManifest)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PASExtensionManifest

- (_TtC21ProximityAppleIDSetup20PASExtensionManifest)init
{
  result = (_TtC21ProximityAppleIDSetup20PASExtensionManifest *)sub_22CC9F268();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  PASExtensionManifest.description.getter();

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
  char v6 = PASExtensionManifest.isEqual(_:)((uint64_t)v8);

  sub_22CB9811C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  uint64_t v3 = sub_22CC9ED68();
  uint64_t v4 = sub_22CC9ED68();

  return v4 ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return static PASExtensionManifest.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PASExtensionManifest.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *((unsigned __int8 *)&self->super.isa
       + OBJC_IVAR____TtC21ProximityAppleIDSetup20PASExtensionManifest_isAccountPickerAvailable);
  id v5 = a3;
  char v6 = self;
  v7 = (void *)sub_22CC9EB98();
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);

  uint64_t v8 = *((unsigned __int8 *)&v6->super.isa
       + OBJC_IVAR____TtC21ProximityAppleIDSetup20PASExtensionManifest_wantsFullScreenPresentation);
  id v9 = (id)sub_22CC9EB98();
  objc_msgSend(v5, sel_encodeBool_forKey_, v8, v9);
}

- (_TtC21ProximityAppleIDSetup20PASExtensionManifest)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (_TtC21ProximityAppleIDSetup20PASExtensionManifest *)sub_22CC325F4(v3);

  return v4;
}

@end