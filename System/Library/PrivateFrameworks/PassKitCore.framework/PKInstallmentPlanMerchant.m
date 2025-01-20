@interface PKInstallmentPlanMerchant
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstallmentPlanMerchant:(id)a3;
- (NSString)city;
- (NSString)country;
- (NSString)identifier;
- (NSString)name;
- (NSString)postalCode;
- (NSString)state;
- (PKInstallmentPlanMerchant)initWithCoder:(id)a3;
- (PKInstallmentPlanMerchant)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)categoryCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryCode:(unint64_t)a3;
- (void)setCity:(id)a3;
- (void)setCountry:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setState:(id)a3;
@end

@implementation PKInstallmentPlanMerchant

- (PKInstallmentPlanMerchant)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKInstallmentPlanMerchant;
  v5 = [(PKInstallmentPlanMerchant *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_categoryCode = [v4 PKIntegerForKey:@"categoryCode"];
    uint64_t v10 = [v4 PKStringForKey:@"city"];
    city = v5->_city;
    v5->_city = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"state"];
    state = v5->_state;
    v5->_state = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"postalCode"];
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v14;

    uint64_t v16 = [v4 PKStringForKey:@"country"];
    country = v5->_country;
    v5->_country = (NSString *)v16;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKInstallmentPlanMerchant *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKInstallmentPlanMerchant *)self isEqualToInstallmentPlanMerchant:v5];

  return v6;
}

- (BOOL)isEqualToInstallmentPlanMerchant:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    BOOL v6 = (void *)v4[1];
    v7 = self->_identifier;
    uint64_t v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8) {
        goto LABEL_39;
      }
      BOOL v10 = [(NSString *)v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_40;
      }
    }
    v11 = (void *)v5[2];
    v7 = self->_name;
    uint64_t v12 = v11;
    if (v7 == v12)
    {
    }
    else
    {
      v9 = v12;
      LOBYTE(v10) = 0;
      if (!v7 || !v12) {
        goto LABEL_39;
      }
      BOOL v10 = [(NSString *)v7 isEqualToString:v12];

      if (!v10) {
        goto LABEL_40;
      }
    }
    if (self->_categoryCode == v5[3])
    {
      v13 = (void *)v5[4];
      v7 = self->_city;
      uint64_t v14 = v13;
      if (v7 == v14)
      {
      }
      else
      {
        v9 = v14;
        LOBYTE(v10) = 0;
        if (!v7 || !v14) {
          goto LABEL_39;
        }
        BOOL v10 = [(NSString *)v7 isEqualToString:v14];

        if (!v10) {
          goto LABEL_40;
        }
      }
      v15 = (void *)v5[5];
      v7 = self->_state;
      uint64_t v16 = v15;
      if (v7 == v16)
      {
      }
      else
      {
        v9 = v16;
        LOBYTE(v10) = 0;
        if (!v7 || !v16) {
          goto LABEL_39;
        }
        BOOL v10 = [(NSString *)v7 isEqualToString:v16];

        if (!v10) {
          goto LABEL_40;
        }
      }
      v17 = (void *)v5[6];
      v7 = self->_postalCode;
      v18 = v17;
      if (v7 == v18)
      {

LABEL_34:
        country = self->_country;
        v20 = (void *)v5[7];
        v7 = country;
        v21 = v20;
        if (v7 == v21)
        {
          LOBYTE(v10) = 1;
          v9 = v7;
        }
        else
        {
          v9 = v21;
          LOBYTE(v10) = 0;
          if (v7 && v21) {
            LOBYTE(v10) = [(NSString *)v7 isEqualToString:v21];
          }
        }
        goto LABEL_39;
      }
      v9 = v18;
      LOBYTE(v10) = 0;
      if (v7 && v18)
      {
        BOOL v10 = [(NSString *)v7 isEqualToString:v18];

        if (!v10) {
          goto LABEL_40;
        }
        goto LABEL_34;
      }
LABEL_39:

      goto LABEL_40;
    }
  }
  LOBYTE(v10) = 0;
LABEL_40:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_city];
  [v3 safelyAddObject:self->_state];
  [v3 safelyAddObject:self->_postalCode];
  [v3 safelyAddObject:self->_country];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_categoryCode - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKInstallmentPlanMerchant)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKInstallmentPlanMerchant;
  unint64_t v5 = [(PKInstallmentPlanMerchant *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"city"];
    city = v5->_city;
    v5->_city = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postalCode"];
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"country"];
    country = v5->_country;
    v5->_country = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_city forKey:@"city"];
  [v5 encodeObject:self->_state forKey:@"state"];
  [v5 encodeObject:self->_postalCode forKey:@"postalCode"];
  [v5 encodeObject:self->_country forKey:@"country"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_city copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSString *)self->_state copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  uint64_t v14 = [(NSString *)self->_postalCode copyWithZone:a3];
  v15 = (void *)v5[6];
  v5[6] = v14;

  uint64_t v16 = [(NSString *)self->_country copyWithZone:a3];
  v17 = (void *)v5[7];
  v5[7] = v16;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)categoryCode
{
  return self->_categoryCode;
}

- (void)setCategoryCode:(unint64_t)a3
{
  self->_categoryCode = a3;
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end