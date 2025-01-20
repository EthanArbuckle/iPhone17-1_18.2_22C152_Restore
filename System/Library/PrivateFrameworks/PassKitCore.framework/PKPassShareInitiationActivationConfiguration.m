@interface PKPassShareInitiationActivationConfiguration
- (BOOL)allowUserEdit;
- (BOOL)isBlocked;
- (PKPassShareActivationOptions)availableOptions;
- (PKPassShareActivationOptions)defaultOptions;
- (id)description;
- (void)setAllowUserEdit:(BOOL)a3;
- (void)setAvailableOptions:(id)a3;
- (void)setDefaultOptions:(id)a3;
- (void)setIsBlocked:(BOOL)a3;
@end

@implementation PKPassShareInitiationActivationConfiguration

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"defaultOptions: '%@'; ", self->_defaultOptions];
  [v6 appendFormat:@"availableOptions: '%@'; ", self->_availableOptions];
  if (self->_allowUserEdit) {
    v7 = @"Yes";
  }
  else {
    v7 = @"No";
  }
  [v6 appendFormat:@"allowUserEdit: '%@'; ", v7];
  if (self->_isBlocked) {
    v8 = @"Yes";
  }
  else {
    v8 = @"No";
  }
  [v6 appendFormat:@"isBlocked: '%@'; ", v8];
  [v6 appendFormat:@">"];
  v9 = [NSString stringWithString:v6];

  return v9;
}

- (PKPassShareActivationOptions)defaultOptions
{
  return self->_defaultOptions;
}

- (void)setDefaultOptions:(id)a3
{
}

- (PKPassShareActivationOptions)availableOptions
{
  return self->_availableOptions;
}

- (void)setAvailableOptions:(id)a3
{
}

- (BOOL)allowUserEdit
{
  return self->_allowUserEdit;
}

- (void)setAllowUserEdit:(BOOL)a3
{
  self->_allowUserEdit = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableOptions, 0);
  objc_storeStrong((id *)&self->_defaultOptions, 0);
}

@end