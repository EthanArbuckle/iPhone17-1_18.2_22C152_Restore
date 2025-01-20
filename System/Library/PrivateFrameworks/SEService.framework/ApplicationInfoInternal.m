@interface ApplicationInfoInternal
+ (BOOL)supportsSecureCoding;
- (NSString)applicationId;
- (NSString)bundleId;
- (_TtC9SEService23ApplicationInfoInternal)init;
- (_TtC9SEService23ApplicationInfoInternal)initWithCoder:(id)a3;
- (int64_t)gdprShownVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ApplicationInfoInternal

- (NSString)applicationId
{
  return (NSString *)sub_214747C44();
}

- (NSString)bundleId
{
  return (NSString *)sub_214747C44();
}

- (int64_t)gdprShownVersion
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SEService23ApplicationInfoInternal_gdprShownVersion);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ApplicationInfoInternal.encode(with:)((NSCoder)v4);
}

- (_TtC9SEService23ApplicationInfoInternal)initWithCoder:(id)a3
{
  return (_TtC9SEService23ApplicationInfoInternal *)ApplicationInfoInternal.init(coder:)(a3);
}

- (_TtC9SEService23ApplicationInfoInternal)init
{
  result = (_TtC9SEService23ApplicationInfoInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end