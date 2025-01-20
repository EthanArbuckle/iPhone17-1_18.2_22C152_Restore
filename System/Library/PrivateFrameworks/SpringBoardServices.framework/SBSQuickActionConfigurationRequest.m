@interface SBSQuickActionConfigurationRequest
+ (BOOL)supportsSecureCoding;
- (SBSQuickActionConfigurationRequest)initWithCoder:(id)a3;
- (SBSQuickActionControlRequest)leadingQuickActionControlRequest;
- (SBSQuickActionControlRequest)trailingQuickActionControlRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_requestQuickActionControlWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 quickActionCategory:(unint64_t)a6 type:(unint64_t)a7 location:(int64_t)a8;
- (void)encodeWithCoder:(id)a3;
- (void)requestQuickActionControlWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 type:(unint64_t)a6 location:(int64_t)a7;
- (void)requestQuickActionControlWithQuickActionCategory:(unint64_t)a3 location:(int64_t)a4;
@end

@implementation SBSQuickActionConfigurationRequest

- (void)requestQuickActionControlWithQuickActionCategory:(unint64_t)a3 location:(int64_t)a4
{
}

- (void)requestQuickActionControlWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 type:(unint64_t)a6 location:(int64_t)a7
{
}

- (void)_requestQuickActionControlWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 quickActionCategory:(unint64_t)a6 type:(unint64_t)a7 location:(int64_t)a8
{
  id v19 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a8 == 1)
  {
    v18 = [[SBSQuickActionControlRequest alloc] initWithExtensionBundleIdentifier:v19 containerBundleIdentifier:v14 kind:v15 quickActionCategory:a6 type:a7 location:1];
    trailingQuickActionControlRequest = self->_trailingQuickActionControlRequest;
    self->_trailingQuickActionControlRequest = v18;
  }
  else
  {
    if (a8) {
      goto LABEL_6;
    }
    v16 = [[SBSQuickActionControlRequest alloc] initWithExtensionBundleIdentifier:v19 containerBundleIdentifier:v14 kind:v15 quickActionCategory:a6 type:a7 location:0];
    trailingQuickActionControlRequest = self->_leadingQuickActionControlRequest;
    self->_leadingQuickActionControlRequest = v16;
  }

LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [objc_opt_class() allocWithZone:a3];
  objc_storeStrong(v4 + 1, self->_leadingQuickActionControlRequest);
  objc_storeStrong(v4 + 2, self->_trailingQuickActionControlRequest);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  leadingQuickActionControlRequest = self->_leadingQuickActionControlRequest;
  id v5 = a3;
  [v5 encodeObject:leadingQuickActionControlRequest forKey:@"kSBSQuickActionConfigurationLeadingControlRequest"];
  [v5 encodeObject:self->_trailingQuickActionControlRequest forKey:@"kSBSQuickActionConfigurationTrailingControlRequest"];
}

- (SBSQuickActionConfigurationRequest)initWithCoder:(id)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBSQuickActionConfigurationRequest;
  id v5 = [(SBSQuickActionConfigurationRequest *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSBSQuickActionConfigurationLeadingControlRequest"];
    leadingQuickActionControlRequest = v5->_leadingQuickActionControlRequest;
    v5->_leadingQuickActionControlRequest = (SBSQuickActionControlRequest *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"kSBSQuickActionConfigurationTrailingControlRequest"];
    trailingQuickActionControlRequest = v5->_trailingQuickActionControlRequest;
    v5->_trailingQuickActionControlRequest = (SBSQuickActionControlRequest *)v11;
  }
  return v5;
}

- (SBSQuickActionControlRequest)leadingQuickActionControlRequest
{
  return self->_leadingQuickActionControlRequest;
}

- (SBSQuickActionControlRequest)trailingQuickActionControlRequest
{
  return self->_trailingQuickActionControlRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingQuickActionControlRequest, 0);
  objc_storeStrong((id *)&self->_leadingQuickActionControlRequest, 0);
}

@end