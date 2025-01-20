@interface PKPaymentOffersControllerRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSOrderedSet)completions;
- (NSSet)dynamicPageTypes;
- (NSString)criteriaIdentifier;
- (PKPaymentOffersControllerRequest)initWithType:(unint64_t)a3 completion:(id)a4;
- (PKPaymentPass)paymentPass;
- (id)description;
- (id)initDynamicContentRequestWithCriteriaIdentifier:(id)a3 pageTypes:(id)a4 completion:(id)a5;
- (id)initPaymentOfferCatalogRequestWithCompletion:(id)a3;
- (id)initPaymentOfferRequestWithCriteriaIdentifierIdentifier:(id)a3 paymentPass:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (unint64_t)type;
- (unint64_t)updateReason;
- (void)addCompletions:(id)a3;
@end

@implementation PKPaymentOffersControllerRequest

- (PKPaymentOffersControllerRequest)initWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOffersControllerRequest;
  v7 = [(PKPaymentOffersControllerRequest *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    completions = v8->_completions;
    v8->_completions = v9;

    v11 = v8->_completions;
    v12 = _Block_copy(v6);
    [(NSMutableOrderedSet *)v11 pk_safelyAddObject:v12];
  }
  return v8;
}

- (id)initPaymentOfferCatalogRequestWithCompletion:(id)a3
{
  return [(PKPaymentOffersControllerRequest *)self initWithType:0 completion:a3];
}

- (id)initPaymentOfferRequestWithCriteriaIdentifierIdentifier:(id)a3 paymentPass:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = [(PKPaymentOffersControllerRequest *)self initWithType:1 completion:a6];
  objc_super v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_criteriaIdentifier, a3);
    objc_storeStrong((id *)&v14->_paymentPass, a4);
    v14->_updateReason = a5;
  }

  return v14;
}

- (id)initDynamicContentRequestWithCriteriaIdentifier:(id)a3 pageTypes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(PKPaymentOffersControllerRequest *)self initWithType:2 completion:a5];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    criteriaIdentifier = v10->_criteriaIdentifier;
    v10->_criteriaIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    dynamicPageTypes = v10->_dynamicPageTypes;
    v10->_dynamicPageTypes = (NSSet *)v13;
  }
  return v10;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  if ([v4 type] != self->_type) {
    goto LABEL_22;
  }
  v5 = [v4 criteriaIdentifier];
  criteriaIdentifier = self->_criteriaIdentifier;
  v7 = v5;
  id v8 = criteriaIdentifier;
  if (v7 == v8)
  {

    goto LABEL_8;
  }
  id v9 = v8;
  if (v7 && v8)
  {
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_22;
    }
LABEL_8:
    uint64_t v11 = [v4 paymentPass];
    id v12 = [v11 uniqueID];
    uint64_t v13 = [(PKObject *)self->_paymentPass uniqueID];
    objc_super v14 = v13;
    if (v12 && v13)
    {
      char v15 = [v12 isEqual:v13];

      if ((v15 & 1) == 0) {
        goto LABEL_22;
      }
    }
    else
    {

      if (v12 != v14) {
        goto LABEL_22;
      }
    }
    v17 = [v4 dynamicPageTypes];
    v18 = v17;
    dynamicPageTypes = self->_dynamicPageTypes;
    if (v17 && dynamicPageTypes)
    {
      char v20 = [(NSSet *)v17 isEqual:self->_dynamicPageTypes];

      if ((v20 & 1) == 0) {
        goto LABEL_22;
      }
    }
    else
    {

      if (v18 != dynamicPageTypes) {
        goto LABEL_22;
      }
    }
    if ([v4 updateReason] == self->_updateReason)
    {
      v7 = [v4 completions];
      [(PKPaymentOffersControllerRequest *)self addCompletions:v7];
      BOOL v16 = 1;
      goto LABEL_13;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }

  BOOL v16 = 0;
LABEL_13:

LABEL_23:
  return v16;
}

- (void)addCompletions:(id)a3
{
  completions = self->_completions;
  id v4 = [a3 array];
  [(NSMutableOrderedSet *)completions addObjectsFromArray:v4];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t type = self->_type;
  if (type > 2) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E56E2E50[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  switch(self->_updateReason)
  {
    case 0uLL:
      goto LABEL_13;
    case 1uLL:
      id v6 = @"fundingModeChanged";
      goto LABEL_12;
    case 2uLL:
      id v6 = @"serverResponse";
      goto LABEL_12;
    case 3uLL:
      id v6 = @"userSelection";
      goto LABEL_12;
    case 4uLL:
      id v6 = @"handoff";
      goto LABEL_12;
    case 5uLL:
      id v6 = @"amountChanged";
      goto LABEL_12;
    case 6uLL:
      id v6 = @"passAdded";
      goto LABEL_12;
    default:
      id v6 = @"unknown";
LABEL_12:
      [v3 appendFormat:@"updateReason: '%@'; ", v6];
LABEL_13:
      if (self->_criteriaIdentifier) {
        [v3 appendFormat:@"criteriaIdentifier: '%@'; ", self->_criteriaIdentifier];
      }
      paymentPass = self->_paymentPass;
      if (paymentPass)
      {
        id v8 = [(PKObject *)paymentPass uniqueID];
        [v3 appendFormat:@"passUniqueID: '%@'; ", v8];
      }
      if ([(NSSet *)self->_dynamicPageTypes count]) {
        [v3 appendFormat:@"dynamicPageTypes: '%@'; ", self->_dynamicPageTypes];
      }
      objc_msgSend(v3, "appendFormat:", @"completionCount: '%ld'; ",
        [(NSMutableOrderedSet *)self->_completions count]);
      [v3 appendFormat:@">"];
      return v3;
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (unint64_t)updateReason
{
  return self->_updateReason;
}

- (NSSet)dynamicPageTypes
{
  return self->_dynamicPageTypes;
}

- (NSOrderedSet)completions
{
  return &self->_completions->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicPageTypes, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end