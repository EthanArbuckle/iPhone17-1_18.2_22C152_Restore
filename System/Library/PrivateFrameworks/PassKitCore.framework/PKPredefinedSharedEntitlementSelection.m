@interface PKPredefinedSharedEntitlementSelection
- (NSArray)sharedEntitlements;
- (NSString)iconName;
- (NSString)identifier;
- (NSString)localizedPostshareDescription;
- (NSString)localizedPreshareDescription;
- (NSString)localizedTitle;
- (PKPredefinedSharedEntitlementSelection)init;
- (PKPredefinedSharedEntitlementSelection)initWithTitle:(id)a3 preshareDescription:(id)a4 postshareDescription:(id)a5 sharedEntitlements:(id)a6;
@end

@implementation PKPredefinedSharedEntitlementSelection

- (PKPredefinedSharedEntitlementSelection)init
{
  return 0;
}

- (PKPredefinedSharedEntitlementSelection)initWithTitle:(id)a3 preshareDescription:(id)a4 postshareDescription:(id)a5 sharedEntitlements:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKPredefinedSharedEntitlementSelection;
  v14 = [(PKPredefinedSharedEntitlementSelection *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    localizedTitle = v14->_localizedTitle;
    v14->_localizedTitle = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    localizedPreshareDescription = v14->_localizedPreshareDescription;
    v14->_localizedPreshareDescription = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    localizedPostshareDescription = v14->_localizedPostshareDescription;
    v14->_localizedPostshareDescription = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    sharedEntitlements = v14->_sharedEntitlements;
    v14->_sharedEntitlements = (NSArray *)v21;

    uint64_t v23 = [[NSString alloc] initWithFormat:@"%@-%@-%@-%lu", v10, v14->_localizedPreshareDescription, v14->_localizedPostshareDescription, -[NSArray count](v14->_sharedEntitlements, "count")];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v23;
  }
  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedPreshareDescription
{
  return self->_localizedPreshareDescription;
}

- (NSString)localizedPostshareDescription
{
  return self->_localizedPostshareDescription;
}

- (NSString)iconName
{
  return self->_iconName;
}

- (NSArray)sharedEntitlements
{
  return self->_sharedEntitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEntitlements, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_localizedPostshareDescription, 0);
  objc_storeStrong((id *)&self->_localizedPreshareDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end