@interface AppMatches
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (AppMatches)init;
- (AppMatches)initWithCoder:(id)a3;
- (NSArray)bundleIds;
- (NSString)description;
- (id)copyWithZone:(void *)a3;
- (int64_t)recommendation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AppMatches

- (NSString)description
{
  v2 = self;
  sub_1C65EC4D4();

  v3 = (void *)sub_1C68EC868();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)recommendation
{
  return AppMatches.recommendation.getter();
}

- (NSArray)bundleIds
{
  AppMatches.bundleIds.getter();
  v2 = (void *)sub_1C68ECBD8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1C66273B0(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1C68ED7D8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return static AppMatches.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C66275C0(v4);
}

- (AppMatches)initWithCoder:(id)a3
{
  return (AppMatches *)AppMatches.init(coder:)(a3);
}

- (AppMatches)init
{
}

@end