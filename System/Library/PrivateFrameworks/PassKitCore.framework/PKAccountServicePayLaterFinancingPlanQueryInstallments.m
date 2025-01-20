@interface PKAccountServicePayLaterFinancingPlanQueryInstallments
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToPayLaterFinancingPlanQueryInstallments:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)installments;
- (NSDictionary)installmentIdentifierToFinancingPlan;
- (PKAccountServicePayLaterFinancingPlanQueryInstallments)initWithCoder:(id)a3;
- (PKAccountServicePayLaterFinancingPlanQueryInstallments)initWithInstallment:(id)a3 installmentIdentifierToFinancingPlan:(id)a4;
- (id)_installmentIdentifierToFinancingPlanDictionaryRepresentation;
- (id)_installmentIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountServicePayLaterFinancingPlanQueryInstallments

- (PKAccountServicePayLaterFinancingPlanQueryInstallments)initWithInstallment:(id)a3 installmentIdentifierToFinancingPlan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountServicePayLaterFinancingPlanQueryInstallments;
  v9 = [(PKAccountServicePayLaterFinancingPlanQueryInstallments *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_installments, a3);
    objc_storeStrong((id *)&v10->_installmentIdentifierToFinancingPlan, a4);
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PKAccountServicePayLaterFinancingPlanQueryInstallments *)self _installmentIdentifiers];
  [v3 setObject:v4 forKeyedSubscript:@"installments"];

  v5 = [(PKAccountServicePayLaterFinancingPlanQueryInstallments *)self _installmentIdentifierToFinancingPlanDictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"installmentIdentifierToFinancingPlan"];

  v6 = (void *)[v3 copy];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicePayLaterFinancingPlanQueryInstallments)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountServicePayLaterFinancingPlanQueryInstallments;
  v5 = [(PKAccountServicePayLaterFinancingPlanQueryInstallments *)&v18 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"installments"];
    installments = v5->_installments;
    v5->_installments = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"installmentIdentifierToFinancingPlan"];
    installmentIdentifierToFinancingPlan = v5->_installmentIdentifierToFinancingPlan;
    v5->_installmentIdentifierToFinancingPlan = (NSDictionary *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  installments = self->_installments;
  id v5 = a3;
  [v5 encodeObject:installments forKey:@"installments"];
  [v5 encodeObject:self->_installmentIdentifierToFinancingPlan forKey:@"installmentIdentifierToFinancingPlan"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKAccountServicePayLaterFinancingPlanQueryInstallments allocWithZone:](PKAccountServicePayLaterFinancingPlanQueryInstallments, "allocWithZone:") init];
  uint64_t v6 = [(NSArray *)self->_installments copyWithZone:a3];
  installments = v5->_installments;
  v5->_installments = (NSArray *)v6;

  uint64_t v8 = [(NSDictionary *)self->_installmentIdentifierToFinancingPlan copyWithZone:a3];
  installmentIdentifierToFinancingPlan = v5->_installmentIdentifierToFinancingPlan;
  v5->_installmentIdentifierToFinancingPlan = (NSDictionary *)v8;

  return v5;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  uint64_t v7 = [(PKAccountServicePayLaterFinancingPlanQueryInstallments *)self _installmentIdentifiers];
  [v6 appendFormat:@"installment IDs: '%@'; ", v7];

  uint64_t v8 = [(PKAccountServicePayLaterFinancingPlanQueryInstallments *)self _installmentIdentifierToFinancingPlanDictionaryRepresentation];
  [v6 appendFormat:@"installmentID to financingPlanID: '%@'; ", v8];

  [v6 appendFormat:@">"];
  uint64_t v9 = [NSString stringWithString:v6];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_installments];
  [v3 safelyAddObject:self->_installmentIdentifierToFinancingPlan];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKAccountServicePayLaterFinancingPlanQueryInstallments *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountServicePayLaterFinancingPlanQueryInstallments *)self _isEqualToPayLaterFinancingPlanQueryInstallments:v5];

  return v6;
}

- (BOOL)_isEqualToPayLaterFinancingPlanQueryInstallments:(id)a3
{
  unint64_t v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  installments = self->_installments;
  BOOL v6 = (NSArray *)v4[1];
  if (installments) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSArray isEqual:](installments, "isEqual:")) {
      goto LABEL_11;
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  if (installments != v6) {
    goto LABEL_8;
  }
LABEL_11:
  installmentIdentifierToFinancingPlan = self->_installmentIdentifierToFinancingPlan;
  v11 = (NSDictionary *)v4[2];
  if (installmentIdentifierToFinancingPlan && v11) {
    char v8 = -[NSDictionary isEqual:](installmentIdentifierToFinancingPlan, "isEqual:");
  }
  else {
    char v8 = installmentIdentifierToFinancingPlan == v11;
  }
LABEL_9:

  return v8;
}

- (id)_installmentIdentifiers
{
  return [(NSArray *)self->_installments pk_arrayByApplyingBlock:&__block_literal_global_304];
}

uint64_t __81__PKAccountServicePayLaterFinancingPlanQueryInstallments__installmentIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 installmentIdentifier];
}

- (id)_installmentIdentifierToFinancingPlanDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  installmentIdentifierToFinancingPlan = self->_installmentIdentifierToFinancingPlan;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __119__PKAccountServicePayLaterFinancingPlanQueryInstallments__installmentIdentifierToFinancingPlanDictionaryRepresentation__block_invoke;
  v8[3] = &unk_1E56F4DE8;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)installmentIdentifierToFinancingPlan enumerateKeysAndObjectsUsingBlock:v8];
  BOOL v6 = (void *)[v5 copy];

  return v6;
}

void __119__PKAccountServicePayLaterFinancingPlanQueryInstallments__installmentIdentifierToFinancingPlanDictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 planIdentifier];
  [v4 setObject:v6 forKey:v5];
}

- (NSArray)installments
{
  return self->_installments;
}

- (NSDictionary)installmentIdentifierToFinancingPlan
{
  return self->_installmentIdentifierToFinancingPlan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentIdentifierToFinancingPlan, 0);
  objc_storeStrong((id *)&self->_installments, 0);
}

@end