@interface PKPaymentProvisioningMethod
+ (BOOL)supportsSecureCoding;
- (PKPaymentProvisioningMethod)init;
- (PKPaymentProvisioningMethod)initWithCoder:(id)a3;
- (PKPaymentProvisioningMethod)initWithDictionary:(id)a3;
- (PKPaymentProvisioningMethod)initWithType:(unint64_t)a3;
- (id)_displayNameForCardType:(id)a3;
- (id)_inAppProvisioningURLWthScheme:(id)a3 path:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)_copyInto:(id)a3;
- (void)_decorateDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentProvisioningMethod

- (PKPaymentProvisioningMethod)init
{
  return [(PKPaymentProvisioningMethod *)self initWithType:0];
}

- (PKPaymentProvisioningMethod)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethod;
  result = [(PKPaymentProvisioningMethod *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (PKPaymentProvisioningMethod)initWithDictionary:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentProvisioningMethod;
  objc_super v5 = [(PKPaymentProvisioningMethod *)&v9 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"provisioningMethodType"];
    v10[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v5->_type = PKPaymentSetupProductSupportedProvisioningMethodsFromArray(v7);
  }
  return v5;
}

- (id)_inAppProvisioningURLWthScheme:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@://", v5];
    if ([v6 length])
    {
      v8 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
      uint64_t v9 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v8];

      [v7 appendString:v9];
      id v6 = (id)v9;
    }
    v10 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_displayNameForCardType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"credit"])
  {
    id v4 = @"CARD_TYPE_CREDIT_CARD";
  }
  else if ([v3 isEqualToString:@"debit"])
  {
    id v4 = @"CARD_TYPE_DEBIT_CARD";
  }
  else if ([v3 isEqualToString:@"prepaid"])
  {
    id v4 = @"CARD_TYPE_PREPAID_CARD";
  }
  else
  {
    id v5 = v3;
    if (![v3 isEqualToString:@"bankcard"]) {
      goto LABEL_10;
    }
    id v4 = @"CARD_TYPE_BANK_CARD";
  }
  id v5 = PKLocalizedPaymentString(&v4->isa, 0);

LABEL_10:
  return v5;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [(PKPaymentProvisioningMethod *)self _decorateDescription:v6];
  [v6 appendString:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (void)_decorateDescription:(id)a3
{
  unint64_t type = self->_type;
  id v4 = a3;
  PKPaymentSupportedProvisioningMethodToString(type);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 appendFormat:@"type: '%@'; ", v5];
}

- (PKPaymentProvisioningMethod)initWithCoder:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentProvisioningMethod;
  id v5 = [(PKPaymentProvisioningMethod *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningMethodType"];
    v10[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v5->_unint64_t type = PKPaymentSetupProductSupportedProvisioningMethodsFromArray(v7);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v4 = a3;
  PKPaymentSupportedProvisioningMethodToString(type);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"provisioningMethodType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PKPaymentProvisioningMethod);
  [(PKPaymentProvisioningMethod *)self _copyInto:v4];
  return v4;
}

- (void)_copyInto:(id)a3
{
  *((void *)a3 + 1) = self->_type;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

@end