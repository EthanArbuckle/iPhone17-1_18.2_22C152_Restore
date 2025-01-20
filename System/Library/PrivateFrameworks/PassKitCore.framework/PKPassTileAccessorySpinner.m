@interface PKPassTileAccessorySpinner
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqual:(id)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isSpinnerEnabled;
- (PKPassTileAccessorySpinner)initWithCoder:(id)a3;
- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSpinnerEnabled:(BOOL)a3;
@end

@implementation PKPassTileAccessorySpinner

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileAccessorySpinner;
  BOOL v5 = [(PKPassTileAccessory *)&v7 _setUpWithDictionary:v4];
  if (v5) {
    self->_spinnerEnabled = [v4 PKBoolForKey:@"spinnerEnabled"];
  }

  return v5;
}

- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassTileAccessorySpinner;
  id result = [(PKPassTileAccessory *)&v6 createResolvedAccessoryWithBundle:a3 privateBundle:a4];
  *((unsigned char *)result + 24) = self->_spinnerEnabled;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileAccessorySpinner)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileAccessorySpinner;
  BOOL v5 = [(PKPassTileAccessory *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_spinnerEnabled = [v4 decodeBoolForKey:@"spinnerEnabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileAccessorySpinner;
  id v4 = a3;
  [(PKPassTileAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_spinnerEnabled, @"spinnerEnabled", v5.receiver, v5.super_class);
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassTileAccessorySpinner;
  id v3 = [(PKPassTileAccessory *)&v6 hash];
  BOOL spinnerEnabled = self->_spinnerEnabled;
  id v7 = v3;
  BOOL v8 = spinnerEnabled;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileAccessorySpinner;
  if ([(PKPassTileAccessory *)&v7 _isEqual:v4]) {
    BOOL v5 = v4[24] == self->_spinnerEnabled;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isSpinnerEnabled
{
  return self->_spinnerEnabled;
}

- (void)setSpinnerEnabled:(BOOL)a3
{
  self->_BOOL spinnerEnabled = a3;
}

@end