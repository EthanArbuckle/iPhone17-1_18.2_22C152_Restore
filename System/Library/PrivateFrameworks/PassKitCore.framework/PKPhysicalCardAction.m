@interface PKPhysicalCardAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPhysicalCardAction:(id)a3;
- (CNPostalAddress)shippingAddress;
- (NSString)activationCode;
- (NSString)artworkIdentifier;
- (NSString)nameOnCard;
- (PKPhysicalCardAction)initWithActionType:(unint64_t)a3;
- (PKPhysicalCardAction)initWithCoder:(id)a3;
- (PKPhysicalCardPriceOption)priceOption;
- (id)_shippingAddressJSONRepresentation;
- (id)jsonRepresentation;
- (unint64_t)actionType;
- (unint64_t)hash;
- (unint64_t)reason;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationCode:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
- (void)setNameOnCard:(id)a3;
- (void)setPriceOption:(id)a3;
- (void)setReason:(unint64_t)a3;
- (void)setShippingAddress:(id)a3;
@end

@implementation PKPhysicalCardAction

- (PKPhysicalCardAction)initWithActionType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicalCardAction;
  result = [(PKPhysicalCardAction *)&v5 init];
  if (result) {
    result->_actionType = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCardAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPhysicalCardAction;
  objc_super v5 = [(PKPhysicalCardAction *)&v17 init];
  if (v5)
  {
    v5->_actionType = [v4 decodeIntegerForKey:@"action"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activationCode"];
    activationCode = v5->_activationCode;
    v5->_activationCode = (NSString *)v6;

    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkIdentifier"];
    artworkIdentifier = v5->_artworkIdentifier;
    v5->_artworkIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingAddress"];
    shippingAddress = v5->_shippingAddress;
    v5->_shippingAddress = (CNPostalAddress *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    nameOnCard = v5->_nameOnCard;
    v5->_nameOnCard = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priceOption"];
    priceOption = v5->_priceOption;
    v5->_priceOption = (PKPhysicalCardPriceOption *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t actionType = self->_actionType;
  id v5 = a3;
  [v5 encodeInteger:actionType forKey:@"action"];
  [v5 encodeObject:self->_activationCode forKey:@"activationCode"];
  [v5 encodeInteger:self->_reason forKey:@"reason"];
  [v5 encodeObject:self->_artworkIdentifier forKey:@"artworkIdentifier"];
  [v5 encodeObject:self->_shippingAddress forKey:@"shippingAddress"];
  [v5 encodeObject:self->_nameOnCard forKey:@"name"];
  [v5 encodeObject:self->_priceOption forKey:@"priceOption"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPhysicalCardAction *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPhysicalCardAction *)self isEqualToPhysicalCardAction:v5];

  return v6;
}

- (BOOL)isEqualToPhysicalCardAction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)v4[2];
  BOOL v6 = self->_activationCode;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_14;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_15;
    }
  }
  v11 = (void *)v4[4];
  BOOL v6 = self->_artworkIdentifier;
  uint64_t v12 = v11;
  if (v6 != v12)
  {
    uint64_t v8 = v12;
    if (v6 && v12)
    {
      BOOL v13 = [(NSString *)v6 isEqualToString:v12];

      if (!v13) {
        goto LABEL_15;
      }
      goto LABEL_18;
    }
LABEL_14:

    goto LABEL_15;
  }

LABEL_18:
  shippingAddress = self->_shippingAddress;
  objc_super v17 = (CNPostalAddress *)v4[5];
  if (shippingAddress && v17)
  {
    if ((-[CNPostalAddress isEqual:](shippingAddress, "isEqual:") & 1) == 0) {
      goto LABEL_15;
    }
  }
  else if (shippingAddress != v17)
  {
    goto LABEL_15;
  }
  nameOnCard = self->_nameOnCard;
  v19 = (NSString *)v4[6];
  if (nameOnCard && v19)
  {
    if ((-[NSString isEqual:](nameOnCard, "isEqual:") & 1) == 0) {
      goto LABEL_15;
    }
  }
  else if (nameOnCard != v19)
  {
    goto LABEL_15;
  }
  priceOption = self->_priceOption;
  v21 = (PKPhysicalCardPriceOption *)v4[7];
  if (priceOption && v21)
  {
    if (!-[PKPhysicalCardPriceOption isEqual:](priceOption, "isEqual:")) {
      goto LABEL_15;
    }
  }
  else if (priceOption != v21)
  {
    goto LABEL_15;
  }
  if (self->_actionType == v4[1])
  {
    BOOL v14 = self->_reason == v4[3];
    goto LABEL_16;
  }
LABEL_15:
  BOOL v14 = 0;
LABEL_16:

  return v14;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_activationCode];
  [v3 safelyAddObject:self->_artworkIdentifier];
  [v3 safelyAddObject:self->_shippingAddress];
  [v3 safelyAddObject:self->_nameOnCard];
  [v3 safelyAddObject:self->_priceOption];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_actionType - v4 + 32 * v4;
  unint64_t v6 = self->_reason - v5 + 32 * v5;

  return v6;
}

- (id)jsonRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = v3;
  unint64_t v5 = self->_actionType - 1;
  if (v5 > 4) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56D8E38[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"action"];
  unint64_t actionType = self->_actionType;
  if (actionType == 5)
  {
    uint64_t v8 = PKStringFromPhysicalCardOrderReason(self->_reason);
    [v4 setObject:v8 forKeyedSubscript:@"reason"];

    [v4 setObject:self->_artworkIdentifier forKeyedSubscript:@"artworkIdentifier"];
    BOOL v9 = [(PKPhysicalCardAction *)self _shippingAddressJSONRepresentation];
    [v4 setObject:v9 forKeyedSubscript:@"shippingAddress"];

    [v4 setObject:self->_nameOnCard forKeyedSubscript:@"name"];
    BOOL v10 = [(PKPhysicalCardPriceOption *)self->_priceOption jsonDictionaryRepresentation];
    [v4 setObject:v10 forKeyedSubscript:@"priceOption"];
  }
  else if (actionType == 4)
  {
    [v4 setObject:self->_activationCode forKeyedSubscript:@"activationCode"];
  }
  v11 = (void *)[v4 copy];

  return v11;
}

- (id)_shippingAddressJSONRepresentation
{
  if (self->_shippingAddress)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = [(CNPostalAddress *)self->_shippingAddress street];
    unint64_t v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    unint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

    v7 = [v6 firstObject];
    [v3 setObject:v7 forKeyedSubscript:@"addressLine1"];

    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v8 = [v6 objectAtIndexedSubscript:1];
      [v3 setObject:v8 forKeyedSubscript:@"addressLine2"];
    }
    BOOL v9 = [(CNPostalAddress *)self->_shippingAddress city];
    [v3 setObject:v9 forKeyedSubscript:@"city"];

    BOOL v10 = [(CNPostalAddress *)self->_shippingAddress state];
    [v3 setObject:v10 forKeyedSubscript:@"state"];

    v11 = [(CNPostalAddress *)self->_shippingAddress postalCode];
    [v3 setObject:v11 forKeyedSubscript:@"postalCode"];

    uint64_t v12 = [(CNPostalAddress *)self->_shippingAddress ISOCountryCode];
    [v3 setObject:v12 forKeyedSubscript:@"countryCode"];

    BOOL v13 = (void *)[v3 copy];
  }
  else
  {
    BOOL v13 = 0;
  }
  return v13;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (NSString)activationCode
{
  return self->_activationCode;
}

- (void)setActivationCode:(id)a3
{
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (CNPostalAddress)shippingAddress
{
  return self->_shippingAddress;
}

- (void)setShippingAddress:(id)a3
{
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void)setNameOnCard:(id)a3
{
}

- (PKPhysicalCardPriceOption)priceOption
{
  return self->_priceOption;
}

- (void)setPriceOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceOption, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_shippingAddress, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_activationCode, 0);
}

@end