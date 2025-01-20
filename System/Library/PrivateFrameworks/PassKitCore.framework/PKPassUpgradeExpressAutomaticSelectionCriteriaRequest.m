@interface PKPassUpgradeExpressAutomaticSelectionCriteriaRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)technologyTypes;
- (PKPassUpgradeExpressAutomaticSelectionCriteriaRequest)initWithCoder:(id)a3;
- (PKPassUpgradeExpressAutomaticSelectionCriteriaRequest)initWithDictionary:(id)a3;
- (id)asDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassUpgradeExpressAutomaticSelectionCriteriaRequest

- (PKPassUpgradeExpressAutomaticSelectionCriteriaRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
  v5 = [(PKPassUpgradeRequest *)&v17 initWithDictionary:v4];
  p_isa = (id *)&v5->super.super.isa;
  if (!v5) {
    goto LABEL_5;
  }
  v7 = [(PKPassUpgradeRequest *)v5 secureElementIdentifier];

  if (!v7)
  {
    v13 = PKLogFacilityTypeGetObject(0x26uLL);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)v16 = 0;
    v14 = "Missing seid key for upgrade request";
LABEL_12:
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, v14, v16, 2u);
    goto LABEL_13;
  }
  v8 = [p_isa paymentApplicationIdentifiers];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v13 = PKLogFacilityTypeGetObject(0x26uLL);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)v16 = 0;
    v14 = "Missing applet id key for upgrade request";
    goto LABEL_12;
  }
  uint64_t v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"criteriaType"];
  id v11 = p_isa[6];
  p_isa[6] = (id)v10;

  if (![p_isa[6] count])
  {
    v13 = PKLogFacilityTypeGetObject(0x26uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      v14 = "Missing criterion type key for upgrade request";
      goto LABEL_12;
    }
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
LABEL_5:
  v12 = p_isa;
LABEL_14:

  return v12;
}

- (id)asDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
  v3 = [(PKPassUpgradeRequest *)&v7 asDictionary];
  id v4 = (void *)[v3 mutableCopy];

  if ([(NSArray *)self->_technologyTypes count]) {
    [v4 setObject:self->_technologyTypes forKeyedSubscript:@"criteriaType"];
  }
  v5 = (void *)[v4 copy];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassUpgradeExpressAutomaticSelectionCriteriaRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
  v5 = [(PKPassUpgradeRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"criteriaType"];
    technologyTypes = v5->_technologyTypes;
    v5->_technologyTypes = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
  id v4 = a3;
  [(PKPassUpgradeRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_technologyTypes, @"criteriaType", v5.receiver, v5.super_class);
}

- (NSArray)technologyTypes
{
  return self->_technologyTypes;
}

- (void).cxx_destruct
{
}

@end