@interface PKPaymentOfferDynamicContentIcon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPaymentOfferDynamicContentIcon)initWithCoder:(id)a3;
- (PKPaymentOfferDynamicContentIcon)initWithDictionary:(id)a3;
- (PKPaymentOfferDynamicContentIconVariant)darkVariant;
- (PKPaymentOfferDynamicContentIconVariant)defaultVariant;
- (PKPaymentOfferDynamicContentIconVariant)lightVariant;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)urlForScreenScale:(double)a3 appearance:(int64_t)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDarkVariant:(id)a3;
- (void)setDefaultVariant:(id)a3;
- (void)setLightVariant:(id)a3;
@end

@implementation PKPaymentOfferDynamicContentIcon

- (PKPaymentOfferDynamicContentIcon)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [[PKPaymentOfferDynamicContentIconVariant alloc] initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKDictionaryForKey:@"darkVariant"];
    v7 = [v4 PKDictionaryForKey:@"lightVariant"];
    v16.receiver = self;
    v16.super_class = (Class)PKPaymentOfferDynamicContentIcon;
    v8 = [(PKPaymentOfferDynamicContentIcon *)&v16 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_defaultVariant, v5);
      if (v6)
      {
        v10 = [[PKPaymentOfferDynamicContentIconVariant alloc] initWithDictionary:v6];
        darkVariant = v9->_darkVariant;
        v9->_darkVariant = v10;
      }
      if (v7)
      {
        v12 = [[PKPaymentOfferDynamicContentIconVariant alloc] initWithDictionary:v7];
        lightVariant = v9->_lightVariant;
        v9->_lightVariant = v12;
      }
    }
    self = v9;

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKPaymentOfferDynamicContentIconVariant *)self->_defaultVariant dictionaryRepresentation];
  [v3 addEntriesFromDictionary:v4];

  darkVariant = self->_darkVariant;
  if (darkVariant)
  {
    v6 = [(PKPaymentOfferDynamicContentIconVariant *)darkVariant dictionaryRepresentation];
    [v3 setObject:v6 forKeyedSubscript:@"darkVariant"];
  }
  lightVariant = self->_lightVariant;
  if (lightVariant)
  {
    v8 = [(PKPaymentOfferDynamicContentIconVariant *)lightVariant dictionaryRepresentation];
    [v3 setObject:v8 forKeyedSubscript:@"lightVariant"];
  }
  v9 = (void *)[v3 copy];

  return v9;
}

- (id)urlForScreenScale:(double)a3 appearance:(int64_t)a4
{
  v7 = -[PKPaymentOfferDynamicContentIconVariant urlForScreenScale:](self->_defaultVariant, "urlForScreenScale:");
  v8 = v7;
  if (a4 == 2)
  {
    darkVariant = self->_darkVariant;
LABEL_6:
    uint64_t v11 = [(PKPaymentOfferDynamicContentIconVariant *)darkVariant urlForScreenScale:a3];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = v8;
    }
    id v9 = v13;

    goto LABEL_10;
  }
  if (a4 == 1)
  {
    darkVariant = self->_lightVariant;
    goto LABEL_6;
  }
  id v9 = v7;
LABEL_10:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferDynamicContentIcon *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        defaultVariant = self->_defaultVariant;
        v8 = v6->_defaultVariant;
        if (defaultVariant && v8)
        {
          if (!-[PKPaymentOfferDynamicContentIconVariant isEqual:](defaultVariant, "isEqual:")) {
            goto LABEL_18;
          }
        }
        else if (defaultVariant != v8)
        {
          goto LABEL_18;
        }
        lightVariant = self->_lightVariant;
        uint64_t v11 = v6->_lightVariant;
        if (lightVariant && v11)
        {
          if (-[PKPaymentOfferDynamicContentIconVariant isEqual:](lightVariant, "isEqual:"))
          {
LABEL_14:
            darkVariant = self->_darkVariant;
            v13 = v6->_darkVariant;
            if (darkVariant && v13) {
              char v9 = -[PKPaymentOfferDynamicContentIconVariant isEqual:](darkVariant, "isEqual:");
            }
            else {
              char v9 = darkVariant == v13;
            }
            goto LABEL_19;
          }
        }
        else if (lightVariant == v11)
        {
          goto LABEL_14;
        }
LABEL_18:
        char v9 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    char v9 = 0;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_defaultVariant];
  [v3 safelyAddObject:self->_lightVariant];
  [v3 safelyAddObject:self->_darkVariant];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"defaultVariant: '%@'; ", self->_defaultVariant];
  [v3 appendFormat:@"lightVariant: '%@'; ", self->_lightVariant];
  [v3 appendFormat:@"darkVariant: '%@'; ", self->_darkVariant];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferDynamicContentIcon;
  v5 = [(PKPaymentOfferDynamicContentIcon *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultVariant"];
    defaultVariant = v5->_defaultVariant;
    v5->_defaultVariant = (PKPaymentOfferDynamicContentIconVariant *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lightVariant"];
    lightVariant = v5->_lightVariant;
    v5->_lightVariant = (PKPaymentOfferDynamicContentIconVariant *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"darkVariant"];
    darkVariant = v5->_darkVariant;
    v5->_darkVariant = (PKPaymentOfferDynamicContentIconVariant *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  defaultVariant = self->_defaultVariant;
  id v5 = a3;
  [v5 encodeObject:defaultVariant forKey:@"defaultVariant"];
  [v5 encodeObject:self->_lightVariant forKey:@"lightVariant"];
  [v5 encodeObject:self->_darkVariant forKey:@"darkVariant"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferDynamicContentIcon allocWithZone:](PKPaymentOfferDynamicContentIcon, "allocWithZone:") init];
  uint64_t v6 = [(PKPaymentOfferDynamicContentIconVariant *)self->_defaultVariant copyWithZone:a3];
  defaultVariant = v5->_defaultVariant;
  v5->_defaultVariant = v6;

  uint64_t v8 = [(PKPaymentOfferDynamicContentIconVariant *)self->_lightVariant copyWithZone:a3];
  lightVariant = v5->_lightVariant;
  v5->_lightVariant = v8;

  uint64_t v10 = [(PKPaymentOfferDynamicContentIconVariant *)self->_darkVariant copyWithZone:a3];
  darkVariant = v5->_darkVariant;
  v5->_darkVariant = v10;

  return v5;
}

- (PKPaymentOfferDynamicContentIconVariant)defaultVariant
{
  return self->_defaultVariant;
}

- (void)setDefaultVariant:(id)a3
{
}

- (PKPaymentOfferDynamicContentIconVariant)darkVariant
{
  return self->_darkVariant;
}

- (void)setDarkVariant:(id)a3
{
}

- (PKPaymentOfferDynamicContentIconVariant)lightVariant
{
  return self->_lightVariant;
}

- (void)setLightVariant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightVariant, 0);
  objc_storeStrong((id *)&self->_darkVariant, 0);
  objc_storeStrong((id *)&self->_defaultVariant, 0);
}

@end