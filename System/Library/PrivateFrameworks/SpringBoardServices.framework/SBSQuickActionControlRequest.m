@interface SBSQuickActionControlRequest
+ (BOOL)supportsSecureCoding;
- (NSString)containerBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (SBSQuickActionControlRequest)initWithCoder:(id)a3;
- (SBSQuickActionControlRequest)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 quickActionCategory:(unint64_t)a6 type:(unint64_t)a7 location:(int64_t)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)location;
- (unint64_t)quickActionCategory;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSQuickActionControlRequest

- (SBSQuickActionControlRequest)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 quickActionCategory:(unint64_t)a6 type:(unint64_t)a7 location:(int64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SBSQuickActionControlRequest;
  v18 = [(SBSQuickActionControlRequest *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_extensionBundleIdentifier, a3);
    objc_storeStrong((id *)&v19->_containerBundleIdentifier, a4);
    objc_storeStrong((id *)&v19->_kind, a5);
    v19->_quickActionCategory = a6;
    v19->_type = a7;
    v19->_location = a8;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  containerBundleIdentifier = self->_containerBundleIdentifier;
  kind = self->_kind;
  unint64_t quickActionCategory = self->_quickActionCategory;
  unint64_t type = self->_type;
  int64_t location = self->_location;
  return (id)[v4 initWithExtensionBundleIdentifier:extensionBundleIdentifier containerBundleIdentifier:containerBundleIdentifier kind:kind quickActionCategory:quickActionCategory type:type location:location];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:extensionBundleIdentifier forKey:@"kSBSQuickActionControlRequestExtensionBundleIdentifier"];
  [v5 encodeObject:self->_containerBundleIdentifier forKey:@"kSBSQuickActionControlRequestContainerBundleIdentifier"];
  [v5 encodeObject:self->_kind forKey:@"kSBSQuickActionControlRequestKind"];
  [v5 encodeInteger:self->_quickActionCategory forKey:@"kSBSQuickActionControlRequestQuickActionCategory"];
  [v5 encodeInteger:self->_type forKey:@"kSBSQuickActionControlRequestType"];
  [v5 encodeInteger:self->_location forKey:@"SBSQuickActionControlRequestLocation"];
}

- (SBSQuickActionControlRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSQuickActionControlRequest;
  id v5 = [(SBSQuickActionControlRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSBSQuickActionControlRequestExtensionBundleIdentifier"];
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSBSQuickActionControlRequestContainerBundleIdentifier"];
    containerBundleIdentifier = v5->_containerBundleIdentifier;
    v5->_containerBundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSBSQuickActionControlRequestKind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v10;

    v5->_unint64_t quickActionCategory = [v4 decodeIntegerForKey:@"kSBSQuickActionControlRequestQuickActionCategory"];
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"kSBSQuickActionControlRequestType"];
    v5->_int64_t location = [v4 decodeIntegerForKey:@"SBSQuickActionControlRequestLocation"];
  }

  return v5;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (unint64_t)quickActionCategory
{
  return self->_quickActionCategory;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end