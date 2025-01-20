@interface SiriResourceAvailabilityInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC12ModelCatalog28SiriResourceAvailabilityInfo)init;
- (_TtC12ModelCatalog28SiriResourceAvailabilityInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriResourceAvailabilityInfo

+ (BOOL)supportsSecureCoding
{
  return static SiriResourceAvailabilityInfo.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SiriResourceAvailabilityInfo.encode(with:)((NSCoder)v4);
}

- (_TtC12ModelCatalog28SiriResourceAvailabilityInfo)initWithCoder:(id)a3
{
  return (_TtC12ModelCatalog28SiriResourceAvailabilityInfo *)SiriResourceAvailabilityInfo.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_256A3C8EC(self, (uint64_t)a2, (void (*)(void))SiriResourceAvailabilityInfo.description.getter);
}

- (_TtC12ModelCatalog28SiriResourceAvailabilityInfo)init
{
}

@end