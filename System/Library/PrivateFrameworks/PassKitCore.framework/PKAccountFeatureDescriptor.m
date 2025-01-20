@interface PKAccountFeatureDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountFeatureDescriptor:(id)a3;
- (NSArray)supportedNetworks;
- (NSDecimalNumber)maximumAmount;
- (NSDecimalNumber)minimumAmount;
- (NSString)fundingSourceTermsIdentifier;
- (NSString)identifier;
- (NSString)merchantIdentifier;
- (PKAccountFeatureDescriptor)initWithCoder:(id)a3;
- (PKAccountFeatureDescriptor)initWithDictionary:(id)a3;
- (PKOSVersionRequirementRange)osVersionRange;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)merchantCapabilities;
- (void)encodeWithCoder:(id)a3;
- (void)setFundingSourceTermsIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaximumAmount:(id)a3;
- (void)setMerchantCapabilities:(unint64_t)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMinimumAmount:(id)a3;
- (void)setOsVersionRange:(id)a3;
- (void)setSupportedNetworks:(id)a3;
@end

@implementation PKAccountFeatureDescriptor

- (PKAccountFeatureDescriptor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountFeatureDescriptor;
  v5 = [(PKAccountFeatureDescriptor *)&v16 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"identifier"];
    [(PKAccountFeatureDescriptor *)v5 setIdentifier:v6];

    v7 = [v4 PKDecimalNumberFromStringForKey:@"minimumAmount"];
    [(PKAccountFeatureDescriptor *)v5 setMinimumAmount:v7];

    v8 = [v4 PKDecimalNumberFromStringForKey:@"maximumAmount"];
    [(PKAccountFeatureDescriptor *)v5 setMaximumAmount:v8];

    v9 = [v4 PKStringForKey:@"merchantIdentifier"];
    [(PKAccountFeatureDescriptor *)v5 setMerchantIdentifier:v9];

    v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"supportedNetworks"];
    [(PKAccountFeatureDescriptor *)v5 setSupportedNetworks:v10];

    v11 = [v4 PKArrayContaining:objc_opt_class() forKey:@"merchantCapabilities"];
    [(PKAccountFeatureDescriptor *)v5 setMerchantCapabilities:PKMerchantCapabilityFromStrings(v11)];

    v12 = [v4 PKDictionaryForKey:@"osVersionRange"];
    if (v12)
    {
      v13 = [[PKOSVersionRequirementRange alloc] initWithDictionary:v12];
      [(PKAccountFeatureDescriptor *)v5 setOsVersionRange:v13];
    }
    v14 = [v4 PKStringForKey:@"fundingSourceTermsIdentifier"];
    [(PKAccountFeatureDescriptor *)v5 setFundingSourceTermsIdentifier:v14];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFeatureDescriptor)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountFeatureDescriptor;
  v5 = [(PKAccountFeatureDescriptor *)&v18 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(PKAccountFeatureDescriptor *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumAmount"];
    [(PKAccountFeatureDescriptor *)v5 setMinimumAmount:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumAmount"];
    [(PKAccountFeatureDescriptor *)v5 setMaximumAmount:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    [(PKAccountFeatureDescriptor *)v5 setMerchantIdentifier:v9];

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v12 = [v10 setWithArray:v11];
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"supportedNetworks"];
    [(PKAccountFeatureDescriptor *)v5 setSupportedNetworks:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantCapabilities"];
    -[PKAccountFeatureDescriptor setMerchantCapabilities:](v5, "setMerchantCapabilities:", [v14 unsignedIntegerValue]);

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersionRange"];
    [(PKAccountFeatureDescriptor *)v5 setOsVersionRange:v15];

    objc_super v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fundingSourceTermsIdentifier"];
    [(PKAccountFeatureDescriptor *)v5 setFundingSourceTermsIdentifier:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKAccountFeatureDescriptor *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(PKAccountFeatureDescriptor *)self minimumAmount];
  [v4 encodeObject:v6 forKey:@"minimumAmount"];

  v7 = [(PKAccountFeatureDescriptor *)self maximumAmount];
  [v4 encodeObject:v7 forKey:@"maximumAmount"];

  v8 = [(PKAccountFeatureDescriptor *)self merchantIdentifier];
  [v4 encodeObject:v8 forKey:@"merchantIdentifier"];

  v9 = [(PKAccountFeatureDescriptor *)self supportedNetworks];
  [v4 encodeObject:v9 forKey:@"supportedNetworks"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKAccountFeatureDescriptor merchantCapabilities](self, "merchantCapabilities"));
  [v4 encodeObject:v10 forKey:@"merchantCapabilities"];

  v11 = [(PKAccountFeatureDescriptor *)self osVersionRange];
  [v4 encodeObject:v11 forKey:@"osVersionRange"];

  id v12 = [(PKAccountFeatureDescriptor *)self fundingSourceTermsIdentifier];
  [v4 encodeObject:v12 forKey:@"fundingSourceTermsIdentifier"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_identifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_minimumAmount) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_maximumAmount) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_merchantIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_supportedNetworks) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_osVersionRange) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_fundingSourceTermsIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_merchantCapabilities - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountFeatureDescriptor *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountFeatureDescriptor *)self isEqualToAccountFeatureDescriptor:v5];

  return v6;
}

- (BOOL)isEqualToAccountFeatureDescriptor:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[1];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_39;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_39;
  }
  minimumAmount = self->_minimumAmount;
  v9 = (NSDecimalNumber *)v4[2];
  if (minimumAmount && v9)
  {
    if ((-[NSDecimalNumber isEqual:](minimumAmount, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (minimumAmount != v9)
  {
    goto LABEL_39;
  }
  maximumAmount = self->_maximumAmount;
  v11 = (NSDecimalNumber *)v4[3];
  if (maximumAmount && v11)
  {
    if ((-[NSDecimalNumber isEqual:](maximumAmount, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (maximumAmount != v11)
  {
    goto LABEL_39;
  }
  merchantIdentifier = self->_merchantIdentifier;
  v13 = (NSString *)v4[4];
  if (merchantIdentifier && v13)
  {
    if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (merchantIdentifier != v13)
  {
    goto LABEL_39;
  }
  supportedNetworks = self->_supportedNetworks;
  v15 = (NSArray *)v4[5];
  if (supportedNetworks && v15)
  {
    if ((-[NSArray isEqual:](supportedNetworks, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (supportedNetworks != v15)
  {
    goto LABEL_39;
  }
  osVersionRange = self->_osVersionRange;
  v17 = (PKOSVersionRequirementRange *)v4[7];
  if (osVersionRange && v17)
  {
    if (!-[PKOSVersionRequirementRange isEqual:](osVersionRange, "isEqual:")) {
      goto LABEL_39;
    }
  }
  else if (osVersionRange != v17)
  {
    goto LABEL_39;
  }
  fundingSourceTermsIdentifier = self->_fundingSourceTermsIdentifier;
  v19 = (NSString *)v4[8];
  if (!fundingSourceTermsIdentifier || !v19)
  {
    if (fundingSourceTermsIdentifier == v19) {
      goto LABEL_37;
    }
LABEL_39:
    BOOL v20 = 0;
    goto LABEL_40;
  }
  if ((-[NSString isEqual:](fundingSourceTermsIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_39;
  }
LABEL_37:
  BOOL v20 = self->_merchantCapabilities == v4[6];
LABEL_40:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  BOOL v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_minimumAmount copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_maximumAmount copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_merchantIdentifier copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSArray *)self->_supportedNetworks copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(PKOSVersionRequirementRange *)self->_osVersionRange copyWithZone:a3];
  v17 = (void *)v5[7];
  v5[7] = v16;

  uint64_t v18 = [(NSString *)self->_fundingSourceTermsIdentifier copyWithZone:a3];
  v19 = (void *)v5[8];
  v5[8] = v18;

  v5[6] = self->_merchantCapabilities;
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDecimalNumber)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
}

- (NSDecimalNumber)maximumAmount
{
  return self->_maximumAmount;
}

- (void)setMaximumAmount:(id)a3
{
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(unint64_t)a3
{
  self->_merchantCapabilities = a3;
}

- (PKOSVersionRequirementRange)osVersionRange
{
  return self->_osVersionRange;
}

- (void)setOsVersionRange:(id)a3
{
}

- (NSString)fundingSourceTermsIdentifier
{
  return self->_fundingSourceTermsIdentifier;
}

- (void)setFundingSourceTermsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSourceTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end