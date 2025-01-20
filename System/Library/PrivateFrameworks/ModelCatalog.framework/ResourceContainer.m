@interface ResourceContainer
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC12ModelCatalog17ResourceContainer)init;
- (_TtC12ModelCatalog17ResourceContainer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ResourceContainer

+ (BOOL)supportsSecureCoding
{
  return static ResourceContainer.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ResourceContainer.encode(with:)((NSCoder)v4);
}

- (_TtC12ModelCatalog17ResourceContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  ResourceContainer.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_256A3C8EC(self, (uint64_t)a2, ResourceContainer.description.getter);
}

- (_TtC12ModelCatalog17ResourceContainer)init
{
}

- (void).cxx_destruct
{
}

@end