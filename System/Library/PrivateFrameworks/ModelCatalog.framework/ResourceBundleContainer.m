@interface ResourceBundleContainer
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC12ModelCatalog23ResourceBundleContainer)init;
- (_TtC12ModelCatalog23ResourceBundleContainer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ResourceBundleContainer

+ (BOOL)supportsSecureCoding
{
  return static ResourceBundleContainer.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ResourceBundleContainer.encode(with:)((NSCoder)v4);
}

- (_TtC12ModelCatalog23ResourceBundleContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  ResourceBundleContainer.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_256A3C8EC(self, (uint64_t)a2, ResourceBundleContainer.description.getter);
}

- (_TtC12ModelCatalog23ResourceBundleContainer)init
{
}

- (void).cxx_destruct
{
}

@end