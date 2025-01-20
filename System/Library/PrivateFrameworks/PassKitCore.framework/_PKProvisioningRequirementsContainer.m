@interface _PKProvisioningRequirementsContainer
+ (BOOL)supportsSecureCoding;
- (BOOL)containsNotManagedAccount;
- (NSString)provisioningSID;
- (_PKProvisioningRequirementsContainer)init;
- (_PKProvisioningRequirementsContainer)initWithCoder:(id)a3;
- (id)containerMinus:(id)a3;
- (id)displayableError;
- (void)encodeWithCoder:(id)a3;
- (void)setProvisioningSID:(id)a3;
@end

@implementation _PKProvisioningRequirementsContainer

- (NSString)provisioningSID
{
  v2 = (char *)self + OBJC_IVAR____PKProvisioningRequirementsContainer_provisioningSID;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1915EF000();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setProvisioningSID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1915EF030();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____PKProvisioningRequirementsContainer_provisioningSID);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)containerMinus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_190FCBD20((uint64_t)v4);

  return v6;
}

- (BOOL)containsNotManagedAccount
{
  v2 = self;
  char v3 = sub_190FCBEE8();

  return v3 & 1;
}

- (id)displayableError
{
  v2 = self;
  id v3 = sub_190FCC090();

  return v3;
}

- (_PKProvisioningRequirementsContainer)initWithCoder:(id)a3
{
  return (_PKProvisioningRequirementsContainer *)ProvisioningRequirementsContainer.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_190FCCCAC(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PKProvisioningRequirementsContainer)init
{
  result = (_PKProvisioningRequirementsContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end