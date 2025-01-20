@interface MCResourceInformation
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (MCResourceInformation)init;
- (MCResourceInformation)initWithCoder:(id)a3;
- (NSString)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MCResourceInformation

+ (BOOL)supportsSecureCoding
{
  return static ResourceInformation.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_256A9241C(v4);
}

- (MCResourceInformation)initWithCoder:(id)a3
{
  id v3 = a3;
  ResourceInformation.init(coder:)();
  return result;
}

- (NSString)debugDescription
{
  v2 = self;
  sub_256A92E04();

  id v3 = (void *)sub_256B3F690();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (MCResourceInformation)init
{
}

- (void).cxx_destruct
{
  sub_256A98BD4((uint64_t)self + OBJC_IVAR___MCResourceInformation_location, &qword_26B2B6340);

  swift_bridgeObjectRelease();
}

@end