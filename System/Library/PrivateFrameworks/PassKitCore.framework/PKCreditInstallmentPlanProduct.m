@interface PKCreditInstallmentPlanProduct
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstallmentPlanProduct:(id)a3;
- (BOOL)isUpgradeEligible;
- (NSDictionary)iconURLs;
- (NSDictionary)splashImageURLs;
- (NSSet)features;
- (NSString)capacity;
- (NSString)color;
- (NSString)identifier;
- (NSString)model;
- (NSString)serialNumber;
- (PKCreditInstallmentPlanProduct)initWithCoder:(id)a3;
- (PKCreditInstallmentPlanProduct)initWithDictionary:(id)a3;
- (id)_imageURLFromImageURLs:(id)a3 forScale:(double)a4 suffix:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)iconURLForScale:(double)a3 suffix:(id)a4;
- (id)splashImageURLForScale:(double)a3 suffix:(id)a4;
- (unint64_t)hash;
- (unint64_t)warrantyYears;
- (void)encodeWithCoder:(id)a3;
- (void)setCapacity:(id)a3;
- (void)setColor:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setIconURLs:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setModel:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSplashImageURLs:(id)a3;
- (void)setUpgradeEligible:(BOOL)a3;
- (void)setWarrantyYears:(unint64_t)a3;
@end

@implementation PKCreditInstallmentPlanProduct

- (PKCreditInstallmentPlanProduct)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKCreditInstallmentPlanProduct;
  v5 = [(PKCreditInstallmentPlanProduct *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"capacity"];
    capacity = v5->_capacity;
    v5->_capacity = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"color"];
    color = v5->_color;
    v5->_color = (NSString *)v12;

    v5->_upgradeEligible = [v4 PKBoolForKey:@"upgradeEligible"];
    v5->_warrantyYears = [v4 PKIntegerForKey:@"warranty"];
    v14 = [v4 PKArrayContaining:objc_opt_class() forKey:@"features"];
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
      features = v5->_features;
      v5->_features = (NSSet *)v15;
    }
    uint64_t v17 = [v4 PKStringForKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v17;

    uint64_t v19 = [v4 PKDictionaryForKey:@"icon"];
    iconURLs = v5->_iconURLs;
    v5->_iconURLs = (NSDictionary *)v19;

    uint64_t v21 = [v4 PKDictionaryForKey:@"splashImage"];
    splashImageURLs = v5->_splashImageURLs;
    v5->_splashImageURLs = (NSDictionary *)v21;
  }
  return v5;
}

- (id)iconURLForScale:(double)a3 suffix:(id)a4
{
  return [(PKCreditInstallmentPlanProduct *)self _imageURLFromImageURLs:self->_iconURLs forScale:a4 suffix:a3];
}

- (id)splashImageURLForScale:(double)a3 suffix:(id)a4
{
  return [(PKCreditInstallmentPlanProduct *)self _imageURLFromImageURLs:self->_splashImageURLs forScale:a4 suffix:a3];
}

- (id)_imageURLFromImageURLs:(id)a3 forScale:(double)a4 suffix:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4 <= 2.0) {
    v9 = @"2x";
  }
  else {
    v9 = @"3x";
  }
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v8 stringByAppendingString:v10];

    uint64_t v10 = (__CFString *)v11;
  }
  uint64_t v12 = [v7 PKURLForKey:v10];
  if (v12)
  {
    v13 = (void *)v12;
  }
  else
  {
    if (a4 >= 3.0) {
      v14 = @"2x";
    }
    else {
      v14 = @"3x";
    }
    uint64_t v15 = v14;

    if (v8)
    {
      uint64_t v16 = [v8 stringByAppendingString:v15];

      uint64_t v15 = (__CFString *)v16;
    }
    v13 = [v7 PKURLForKey:v15];
    uint64_t v10 = v15;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCreditInstallmentPlanProduct *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCreditInstallmentPlanProduct *)self isEqualToInstallmentPlanProduct:v5];

  return v6;
}

- (BOOL)isEqualToInstallmentPlanProduct:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_39;
  }
  BOOL v6 = (void *)*((void *)v4 + 2);
  id v7 = self->_identifier;
  id v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_38;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_39;
    }
  }
  uint64_t v11 = (void *)*((void *)v5 + 3);
  id v7 = self->_model;
  uint64_t v12 = v11;
  if (v7 == v12)
  {
  }
  else
  {
    v9 = v12;
    if (!v7 || !v12) {
      goto LABEL_38;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_39;
    }
  }
  v14 = (void *)*((void *)v5 + 4);
  id v7 = self->_capacity;
  uint64_t v15 = v14;
  if (v7 == v15)
  {
  }
  else
  {
    v9 = v15;
    if (!v7 || !v15) {
      goto LABEL_38;
    }
    BOOL v16 = [(NSString *)v7 isEqualToString:v15];

    if (!v16) {
      goto LABEL_39;
    }
  }
  uint64_t v17 = (void *)*((void *)v5 + 5);
  id v7 = self->_color;
  v18 = v17;
  if (v7 == v18)
  {
  }
  else
  {
    v9 = v18;
    if (!v7 || !v18) {
      goto LABEL_38;
    }
    BOOL v19 = [(NSString *)v7 isEqualToString:v18];

    if (!v19) {
      goto LABEL_39;
    }
  }
  if (self->_upgradeEligible != v5[8] || self->_warrantyYears != *((void *)v5 + 6)) {
    goto LABEL_39;
  }
  features = self->_features;
  uint64_t v21 = (NSSet *)*((void *)v5 + 7);
  if (features && v21)
  {
    if ((-[NSSet isEqual:](features, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (features != v21)
  {
    goto LABEL_39;
  }
  v22 = (void *)*((void *)v5 + 8);
  id v7 = self->_serialNumber;
  v23 = v22;
  if (v7 == v23)
  {

    goto LABEL_42;
  }
  v9 = v23;
  if (!v7 || !v23)
  {
LABEL_38:

    goto LABEL_39;
  }
  BOOL v24 = [(NSString *)v7 isEqualToString:v23];

  if (!v24) {
    goto LABEL_39;
  }
LABEL_42:
  iconURLs = self->_iconURLs;
  v28 = (NSDictionary *)*((void *)v5 + 9);
  if (iconURLs && v28)
  {
    if (-[NSDictionary isEqual:](iconURLs, "isEqual:")) {
      goto LABEL_47;
    }
LABEL_39:
    char v25 = 0;
    goto LABEL_40;
  }
  if (iconURLs != v28) {
    goto LABEL_39;
  }
LABEL_47:
  splashImageURLs = self->_splashImageURLs;
  v30 = (NSDictionary *)*((void *)v5 + 10);
  if (splashImageURLs && v30) {
    char v25 = -[NSDictionary isEqual:](splashImageURLs, "isEqual:");
  }
  else {
    char v25 = splashImageURLs == v30;
  }
LABEL_40:

  return v25;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_model];
  [v3 safelyAddObject:self->_capacity];
  [v3 safelyAddObject:self->_color];
  [v3 safelyAddObject:self->_features];
  [v3 safelyAddObject:self->_serialNumber];
  [v3 safelyAddObject:self->_iconURLs];
  [v3 safelyAddObject:self->_splashImageURLs];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_upgradeEligible - v4 + 32 * v4;
  unint64_t v6 = self->_warrantyYears - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditInstallmentPlanProduct)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKCreditInstallmentPlanProduct;
  uint64_t v5 = [(PKCreditInstallmentPlanProduct *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capacity"];
    capacity = v5->_capacity;
    v5->_capacity = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    color = v5->_color;
    v5->_color = (NSString *)v12;

    v5->_upgradeEligible = [v4 decodeBoolForKey:@"upgradeEligible"];
    v5->_warrantyYears = [v4 decodeIntegerForKey:@"warranty"];
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    BOOL v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"features"];
    features = v5->_features;
    v5->_features = (NSSet *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v19;

    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"iconURLs"];
    iconURLs = v5->_iconURLs;
    v5->_iconURLs = (NSDictionary *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"splashImageURLs"];
    splashImageURLs = v5->_splashImageURLs;
    v5->_splashImageURLs = (NSDictionary *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_model forKey:@"model"];
  [v5 encodeObject:self->_capacity forKey:@"capacity"];
  [v5 encodeObject:self->_color forKey:@"color"];
  [v5 encodeBool:self->_upgradeEligible forKey:@"upgradeEligible"];
  [v5 encodeInteger:self->_warrantyYears forKey:@"warranty"];
  [v5 encodeObject:self->_features forKey:@"features"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_iconURLs forKey:@"iconURLs"];
  [v5 encodeObject:self->_splashImageURLs forKey:@"splashImageURLs"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_model copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_capacity copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_color copyWithZone:a3];
  BOOL v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  *(unsigned char *)(v5 + 8) = self->_upgradeEligible;
  *(void *)(v5 + 48) = self->_warrantyYears;
  uint64_t v14 = [(NSSet *)self->_features copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  uint64_t v16 = [(NSString *)self->_serialNumber copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  uint64_t v18 = [(NSDictionary *)self->_iconURLs copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  uint64_t v20 = [(NSDictionary *)self->_splashImageURLs copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v20;

  return (id)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(id)a3
{
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (BOOL)isUpgradeEligible
{
  return self->_upgradeEligible;
}

- (void)setUpgradeEligible:(BOOL)a3
{
  self->_upgradeEligible = a3;
}

- (unint64_t)warrantyYears
{
  return self->_warrantyYears;
}

- (void)setWarrantyYears:(unint64_t)a3
{
  self->_warrantyYears = a3;
}

- (NSSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSDictionary)iconURLs
{
  return self->_iconURLs;
}

- (void)setIconURLs:(id)a3
{
}

- (NSDictionary)splashImageURLs
{
  return self->_splashImageURLs;
}

- (void)setSplashImageURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splashImageURLs, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end