@interface SUCorePolicyExtension
+ (BOOL)supportsSecureCoding;
- (SUCorePolicyExtension)init;
- (SUCorePolicyExtension)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)summary;
@end

@implementation SUCorePolicyExtension

- (SUCorePolicyExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUCorePolicyExtension;
  return [(SUCorePolicyExtension *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyExtension)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUCorePolicyExtension;
  return [(SUCorePolicyExtension *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(SUCorePolicyExtension);
}

- (id)extensionName
{
  return @"SUCorePolicyExtension";
}

- (id)filterDocumentationAssetArray:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)summary
{
  return @"SUCorePolicyExtension";
}

- (id)description
{
  return @"SUCorePolicyExtension";
}

@end