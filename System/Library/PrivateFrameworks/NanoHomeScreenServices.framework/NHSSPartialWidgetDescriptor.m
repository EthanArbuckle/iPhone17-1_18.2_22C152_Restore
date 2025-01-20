@interface NHSSPartialWidgetDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NHSSPartialWidgetDescriptor)initWithCoder:(id)a3;
- (NSString)containerBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerBundleIdentifier:(id)a3;
- (void)setExtensionBundleIdentifier:(id)a3;
- (void)setKind:(id)a3;
@end

@implementation NHSSPartialWidgetDescriptor

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  containerBundleIdentifier = self->_containerBundleIdentifier;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __39__NHSSPartialWidgetDescriptor_isEqual___block_invoke;
  v20[3] = &unk_265427BD0;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendString:containerBundleIdentifier counterpart:v20];
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __39__NHSSPartialWidgetDescriptor_isEqual___block_invoke_2;
  v18[3] = &unk_265427BD0;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendString:extensionBundleIdentifier counterpart:v18];
  kind = self->_kind;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__NHSSPartialWidgetDescriptor_isEqual___block_invoke_3;
  v16[3] = &unk_265427BD0;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendString:kind counterpart:v16];
  LOBYTE(kind) = [v5 isEqual];

  return (char)kind;
}

id __39__NHSSPartialWidgetDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __39__NHSSPartialWidgetDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __39__NHSSPartialWidgetDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_containerBundleIdentifier];
  id v5 = (id)[v3 appendObject:self->_extensionBundleIdentifier];
  id v6 = (id)[v3 appendObject:self->_kind];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_opt_new();
  objc_storeStrong(v4 + 1, self->_containerBundleIdentifier);
  objc_storeStrong(v4 + 2, self->_extensionBundleIdentifier);
  objc_storeStrong(v4 + 3, self->_kind);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  containerBundleIdentifier = self->_containerBundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:containerBundleIdentifier forKey:@"containerBundleIdentifier"];
  [v5 encodeObject:self->_extensionBundleIdentifier forKey:@"extensionBundleIdentifier"];
  [v5 encodeObject:self->_kind forKey:@"kind"];
}

- (NHSSPartialWidgetDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NHSSPartialWidgetDescriptor;
  id v5 = [(NHSSPartialWidgetDescriptor *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
    containerBundleIdentifier = v5->_containerBundleIdentifier;
    v5->_containerBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v10;
  }
  return v5;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (void)setContainerBundleIdentifier:(id)a3
{
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
}

@end