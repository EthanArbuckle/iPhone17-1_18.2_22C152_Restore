@interface PKPayLaterPreliminaryAssessment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReapplication;
- (NSArray)installmentPlans;
- (NSString)identifier;
- (PKPayLaterPreliminaryAssessment)initWithCoder:(id)a3;
- (PKPayLaterPreliminaryAssessment)initWithDictionary:(id)a3 productType:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)productType;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstallmentPlans:(id)a3;
- (void)setProductType:(unint64_t)a3;
- (void)setReapplication:(BOOL)a3;
@end

@implementation PKPayLaterPreliminaryAssessment

- (PKPayLaterPreliminaryAssessment)initWithDictionary:(id)a3 productType:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPayLaterPreliminaryAssessment;
  v7 = [(PKPayLaterPreliminaryAssessment *)&v27 init];
  v8 = v7;
  if (v7)
  {
    v7->_productType = a4;
    uint64_t v9 = [v6 PKStringForKey:@"identifier"];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_reapplication = [v6 PKBoolForKey:@"reapplication"];
    v11 = [v6 PKArrayContaining:objc_opt_class() forKey:@"installmentPlans"];
    if ([v11 count])
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v22 = v11;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = [[PKPayLaterPreliminaryAssessmentInstallmentPlan alloc] initWithDictionary:*(void *)(*((void *)&v23 + 1) + 8 * v17) productType:a4];
            [v12 safelyAddObject:v18];

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v15);
      }

      if ([v12 count])
      {
        uint64_t v19 = [v12 copy];
        installmentPlans = v8->_installmentPlans;
        v8->_installmentPlans = (NSArray *)v19;
      }
      else
      {
        installmentPlans = v8->_installmentPlans;
        v8->_installmentPlans = 0;
      }

      v11 = v22;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_installmentPlans];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_productType - v4 + 32 * v4;
  unint64_t v6 = self->_reapplication - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPayLaterPreliminaryAssessment *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v6 = v5;
        installmentPlans = self->_installmentPlans;
        v8 = v6->_installmentPlans;
        if (installmentPlans && v8)
        {
          if ((-[NSArray isEqual:](installmentPlans, "isEqual:") & 1) == 0) {
            goto LABEL_20;
          }
        }
        else if (installmentPlans != v8)
        {
          goto LABEL_20;
        }
        identifier = v6->_identifier;
        v11 = self->_identifier;
        id v12 = identifier;
        if (v11 == v12)
        {
        }
        else
        {
          id v13 = v12;
          if (!v11 || !v12)
          {

            goto LABEL_20;
          }
          BOOL v14 = [(NSString *)v11 isEqualToString:v12];

          if (!v14) {
            goto LABEL_20;
          }
        }
        if (self->_productType == v6->_productType)
        {
          BOOL v9 = self->_reapplication == v6->_reapplication;
LABEL_21:

          goto LABEL_22;
        }
LABEL_20:
        BOOL v9 = 0;
        goto LABEL_21;
      }
    }
    BOOL v9 = 0;
  }
LABEL_22:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPreliminaryAssessment)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterPreliminaryAssessment;
  unint64_t v5 = [(PKPayLaterPreliminaryAssessment *)&v14 init];
  if (v5)
  {
    v5->_productType = [v4 decodeIntegerForKey:@"productType"];
    v5->_reapplication = [v4 decodeBoolForKey:@"reapplication"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"installmentPlans"];
    installmentPlans = v5->_installmentPlans;
    v5->_installmentPlans = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  installmentPlans = self->_installmentPlans;
  id v5 = a3;
  [v5 encodeObject:installmentPlans forKey:@"installmentPlans"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_productType forKey:@"productType"];
  [v5 encodeBool:self->_reapplication forKey:@"reapplication"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSArray *)self->_installmentPlans copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  *(void *)(v5 + 24) = self->_productType;
  *(unsigned char *)(v5 + 8) = self->_reapplication;
  return (id)v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  if (self->_reapplication) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"reapplication: %@; ", v4];
  uint64_t v5 = PKPayLaterAccountProductTypeToString(self->_productType);
  [v3 appendFormat:@"productType: '%@'; ", v5];

  [v3 appendFormat:@"installmentPlans: %@; ", self->_installmentPlans];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (BOOL)isReapplication
{
  return self->_reapplication;
}

- (void)setReapplication:(BOOL)a3
{
  self->_reapplication = a3;
}

- (NSArray)installmentPlans
{
  return self->_installmentPlans;
}

- (void)setInstallmentPlans:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentPlans, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end