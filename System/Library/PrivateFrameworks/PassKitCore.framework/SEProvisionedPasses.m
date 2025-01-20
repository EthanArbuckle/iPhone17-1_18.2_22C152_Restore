@interface SEProvisionedPasses
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC11PassKitCore19SEProvisionedPasses)init;
- (_TtC11PassKitCore19SEProvisionedPasses)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)passLibraryDidChangeWithNotification:(id)a3;
@end

@implementation SEProvisionedPasses

- (void)dealloc
{
  v2 = self;
  SEProvisionedPasses.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_190E84F6C(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore19SEProvisionedPasses_externalProvisioningMode), self->externalProvisioningMode[OBJC_IVAR____TtC11PassKitCore19SEProvisionedPasses_externalProvisioningMode]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore19SEProvisionedPasses_notificationSuppressionAssertion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)passLibraryDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_190FC021C(v4);
}

- (NSString)description
{
  v2 = self;
  sub_190FC0B10();

  v3 = (void *)sub_1915EF000();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return byte_1E92BE5F0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92BE5F0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_190FC13B4(v4);
}

- (_TtC11PassKitCore19SEProvisionedPasses)initWithCoder:(id)a3
{
  return (_TtC11PassKitCore19SEProvisionedPasses *)SEProvisionedPasses.init(coder:)(a3);
}

- (_TtC11PassKitCore19SEProvisionedPasses)init
{
  result = (_TtC11PassKitCore19SEProvisionedPasses *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end