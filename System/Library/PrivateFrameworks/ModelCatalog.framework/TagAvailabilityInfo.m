@interface TagAvailabilityInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC12ModelCatalog19TagAvailabilityInfo)init;
- (_TtC12ModelCatalog19TagAvailabilityInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TagAvailabilityInfo

+ (BOOL)supportsSecureCoding
{
  return static TagAvailabilityInfo.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  TagAvailabilityInfo.encode(with:)((NSCoder)v4);
}

- (_TtC12ModelCatalog19TagAvailabilityInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  TagAvailabilityInfo.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_256A3C8EC(self, (uint64_t)a2, (void (*)(void))TagAvailabilityInfo.description.getter);
}

- (_TtC12ModelCatalog19TagAvailabilityInfo)init
{
}

@end