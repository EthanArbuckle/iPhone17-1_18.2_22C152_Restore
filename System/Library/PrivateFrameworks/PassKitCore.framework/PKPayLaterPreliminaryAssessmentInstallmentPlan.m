@interface PKPayLaterPreliminaryAssessmentInstallmentPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAPR;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPreliminaryAssessmentInstallmentPlan:(id)a3;
- (NSDecimalNumber)maximumAPR;
- (NSDecimalNumber)minimumAPR;
- (PKPayLaterFinancingAmount)installmentAmount;
- (PKPayLaterPreliminaryAssessmentInstallmentPlan)initWithCoder:(id)a3;
- (PKPayLaterPreliminaryAssessmentInstallmentPlan)initWithDictionary:(id)a3 productType:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)installmentCount;
- (unint64_t)hash;
- (unint64_t)productType;
- (void)encodeWithCoder:(id)a3;
- (void)setHasAPR:(BOOL)a3;
- (void)setInstallmentAmount:(id)a3;
- (void)setInstallmentCount:(int64_t)a3;
- (void)setMaximumAPR:(id)a3;
- (void)setMinimumAPR:(id)a3;
- (void)setProductType:(unint64_t)a3;
@end

@implementation PKPayLaterPreliminaryAssessmentInstallmentPlan

- (PKPayLaterPreliminaryAssessmentInstallmentPlan)initWithDictionary:(id)a3 productType:(unint64_t)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPayLaterPreliminaryAssessmentInstallmentPlan;
  v7 = [(PKPayLaterPreliminaryAssessmentInstallmentPlan *)&v18 init];
  v8 = v7;
  if (v7)
  {
    v7->_productType = a4;
    v9 = [PKPayLaterFinancingAmount alloc];
    v10 = [v6 PKDictionaryForKey:@"installmentAmount"];
    uint64_t v11 = [(PKPayLaterFinancingAmount *)v9 initWithDictionary:v10];
    installmentAmount = v8->_installmentAmount;
    v8->_installmentAmount = (PKPayLaterFinancingAmount *)v11;

    v8->_installmentCount = [v6 PKIntegerForKey:@"installmentCount"];
    v8->_hasAPR = [v6 PKBoolForKey:@"hasAPR"];
    uint64_t v13 = [v6 PKDecimalNumberFromStringForKey:@"minimumAPR"];
    minimumAPR = v8->_minimumAPR;
    v8->_minimumAPR = (NSDecimalNumber *)v13;

    uint64_t v15 = [v6 PKDecimalNumberFromStringForKey:@"maximumAPR"];
    maximumAPR = v8->_maximumAPR;
    v8->_maximumAPR = (NSDecimalNumber *)v15;
  }
  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_installmentAmount];
  [v3 safelyAddObject:self->_minimumAPR];
  [v3 safelyAddObject:self->_maximumAPR];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_installmentCount - v4 + 32 * v4;
  unint64_t v6 = self->_hasAPR - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPayLaterPreliminaryAssessmentInstallmentPlan *)a3;
  int64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterPreliminaryAssessmentInstallmentPlan *)self isEqualToPreliminaryAssessmentInstallmentPlan:v5];

  return v6;
}

- (BOOL)isEqualToPreliminaryAssessmentInstallmentPlan:(id)a3
{
  uint64_t v4 = a3;
  int64_t v5 = v4;
  if (!v4 || self->_installmentCount != v4[4] || self->_hasAPR != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_16;
  }
  installmentAmount = self->_installmentAmount;
  v7 = (PKPayLaterFinancingAmount *)v5[3];
  if (installmentAmount && v7)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentAmount, "isEqual:")) {
      goto LABEL_16;
    }
  }
  else if (installmentAmount != v7)
  {
    goto LABEL_16;
  }
  minimumAPR = self->_minimumAPR;
  v9 = (NSDecimalNumber *)v5[5];
  if (!minimumAPR || !v9)
  {
    if (minimumAPR == v9) {
      goto LABEL_12;
    }
LABEL_16:
    char v12 = 0;
    goto LABEL_17;
  }
  if ((-[NSDecimalNumber isEqual:](minimumAPR, "isEqual:") & 1) == 0) {
    goto LABEL_16;
  }
LABEL_12:
  maximumAPR = self->_maximumAPR;
  uint64_t v11 = (NSDecimalNumber *)v5[6];
  if (maximumAPR && v11) {
    char v12 = -[NSDecimalNumber isEqual:](maximumAPR, "isEqual:");
  }
  else {
    char v12 = maximumAPR == v11;
  }
LABEL_17:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPreliminaryAssessmentInstallmentPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterPreliminaryAssessmentInstallmentPlan;
  int64_t v5 = [(PKPayLaterPreliminaryAssessmentInstallmentPlan *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentAmount"];
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKPayLaterFinancingAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumAPR"];
    minimumAPR = v5->_minimumAPR;
    v5->_minimumAPR = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumAPR"];
    maximumAPR = v5->_maximumAPR;
    v5->_maximumAPR = (NSDecimalNumber *)v10;

    v5->_installmentCount = [v4 decodeIntegerForKey:@"installmentCount"];
    v5->_hasAPR = [v4 decodeBoolForKey:@"hasAPR"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  installmentAmount = self->_installmentAmount;
  id v5 = a3;
  [v5 encodeObject:installmentAmount forKey:@"installmentAmount"];
  [v5 encodeObject:self->_minimumAPR forKey:@"minimumAPR"];
  [v5 encodeObject:self->_maximumAPR forKey:@"maximumAPR"];
  [v5 encodeInteger:self->_installmentCount forKey:@"installmentCount"];
  [v5 encodeBool:self->_hasAPR forKey:@"hasAPR"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(PKPayLaterFinancingAmount *)self->_installmentAmount copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_minimumAPR copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_maximumAPR copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  *(void *)(v5 + 32) = self->_installmentCount;
  *(unsigned char *)(v5 + 8) = self->_hasAPR;
  return (id)v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"installmentAmount: '%@'; ", self->_installmentAmount];
  if (self->_hasAPR) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"hasAPR: %@; ", v4];
  [v3 appendFormat:@"minimumAPR: %@; ", self->_minimumAPR];
  [v3 appendFormat:@"maximumAPR: %@; ", self->_maximumAPR];
  objc_msgSend(v3, "appendFormat:", @"installmentCount: %ld; ", self->_installmentCount);
  [v3 appendFormat:@">"];
  uint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (PKPayLaterFinancingAmount)installmentAmount
{
  return self->_installmentAmount;
}

- (void)setInstallmentAmount:(id)a3
{
}

- (int64_t)installmentCount
{
  return self->_installmentCount;
}

- (void)setInstallmentCount:(int64_t)a3
{
  self->_installmentCount = a3;
}

- (BOOL)hasAPR
{
  return self->_hasAPR;
}

- (void)setHasAPR:(BOOL)a3
{
  self->_hasAPR = a3;
}

- (NSDecimalNumber)minimumAPR
{
  return self->_minimumAPR;
}

- (void)setMinimumAPR:(id)a3
{
}

- (NSDecimalNumber)maximumAPR
{
  return self->_maximumAPR;
}

- (void)setMaximumAPR:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAPR, 0);
  objc_storeStrong((id *)&self->_minimumAPR, 0);
  objc_storeStrong((id *)&self->_installmentAmount, 0);
}

@end