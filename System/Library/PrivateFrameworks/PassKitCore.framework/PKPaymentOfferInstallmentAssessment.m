@interface PKPaymentOfferInstallmentAssessment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEligible;
- (BOOL)isEqual:(id)a3;
- (NSArray)offers;
- (NSString)identifier;
- (NSString)selectedOfferIdentifier;
- (NSString)sessionIdentifier;
- (PKPaymentOfferAction)action;
- (PKPaymentOfferDynamicContent)dynamicContent;
- (PKPaymentOfferInstallmentAssessment)initWithCoder:(id)a3;
- (PKPaymentOfferInstallmentAssessment)initWithDictionary:(id)a3 sessionIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)installmentOfferWithIdentifier:(id)a3;
- (unint64_t)hash;
- (unint64_t)offerEligibility;
- (void)encodeWithCoder:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation PKPaymentOfferInstallmentAssessment

- (PKPaymentOfferInstallmentAssessment)initWithDictionary:(id)a3 sessionIdentifier:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v65.receiver = self;
  v65.super_class = (Class)PKPaymentOfferInstallmentAssessment;
  v8 = [(PKPaymentOfferInstallmentAssessment *)&v65 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_49;
  }
  objc_storeStrong((id *)&v8->_sessionIdentifier, a4);
  uint64_t v10 = [v6 PKStringForKey:@"identifier"];
  identifier = v9->_identifier;
  v9->_identifier = (NSString *)v10;

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13 = [v6 PKArrayContaining:objc_opt_class() forKey:@"offers"];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v62;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v62 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [[PKPaymentOfferInstallmentAssessmentOffer alloc] initWithDictionary:*(void *)(*((void *)&v61 + 1) + 8 * v17)];
        [v12 safelyAddObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v15);
  }
  v19 = [v6 PKStringForKey:@"offerEligibility"];
  v20 = v19;
  if (v19 == @"eligible") {
    goto LABEL_12;
  }
  if (!v19)
  {
LABEL_40:
    uint64_t v22 = 0;
    goto LABEL_41;
  }
  char v21 = [(__CFString *)v19 isEqualToString:@"eligible"];

  if ((v21 & 1) == 0)
  {
    v23 = v20;
    if (v23 == @"notEligible"
      || (v24 = v23,
          char v25 = [(__CFString *)v23 isEqualToString:@"notEligible"],
          v24,
          (v25 & 1) != 0))
    {
      uint64_t v22 = 2;
      goto LABEL_41;
    }
    v26 = v24;
    if (v26 == @"insufficientCredit"
      || (v27 = v26,
          char v28 = [(__CFString *)v26 isEqualToString:@"insufficientCredit"],
          v27,
          (v28 & 1) != 0))
    {
      uint64_t v22 = 3;
      goto LABEL_41;
    }
    v29 = v27;
    if (v29 == @"merchantNotSupported"
      || (v30 = v29,
          char v31 = [(__CFString *)v29 isEqualToString:@"merchantNotSupported"],
          v30,
          (v31 & 1) != 0))
    {
      uint64_t v22 = 4;
      goto LABEL_41;
    }
    v32 = v30;
    if (v32 == @"purchaseAmountIneligible"
      || (v33 = v32,
          char v34 = [(__CFString *)v32 isEqualToString:@"purchaseAmountIneligible"],
          v33,
          (v34 & 1) != 0))
    {
      uint64_t v22 = 5;
      goto LABEL_41;
    }
    v35 = v33;
    if (v35 == @"accountRestricted"
      || (v36 = v35,
          char v37 = [(__CFString *)v35 isEqualToString:@"accountRestricted"],
          v36,
          (v37 & 1) != 0))
    {
      uint64_t v22 = 6;
      goto LABEL_41;
    }
    v38 = v36;
    if (v38 == @"userIneligible"
      || (v39 = v38,
          char v40 = [(__CFString *)v38 isEqualToString:@"userIneligible"],
          v39,
          (v40 & 1) != 0))
    {
      uint64_t v22 = 7;
      goto LABEL_41;
    }
    v41 = v39;
    if (v41 == @"fraudSuspected"
      || (v42 = v41,
          char v43 = [(__CFString *)v41 isEqualToString:@"fraudSuspected"],
          v42,
          (v43 & 1) != 0))
    {
      uint64_t v22 = 8;
      goto LABEL_41;
    }
    v44 = v42;
    if (v44 == @"notSupportedForCard"
      || (v45 = v44,
          char v46 = [(__CFString *)v44 isEqualToString:@"notSupportedForCard"],
          v45,
          (v46 & 1) != 0))
    {
      uint64_t v22 = 9;
      goto LABEL_41;
    }
    v47 = v45;
    if (v47 == @"systemError"
      || (v48 = v47,
          int v49 = [(__CFString *)v47 isEqualToString:@"systemError"],
          v48,
          v49))
    {
      uint64_t v22 = 10;
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_12:
  uint64_t v22 = 1;
LABEL_41:

  v9->_offerEligibility = v22;
  if ([v12 count])
  {
    uint64_t v50 = [v12 copy];
    offers = v9->_offers;
    v9->_offers = (NSArray *)v50;
  }
  else
  {
    offers = v9->_offers;
    v9->_offers = 0;
  }

  uint64_t v52 = [v6 PKStringForKey:@"selectedOfferIdentifier"];
  selectedOfferIdentifier = v9->_selectedOfferIdentifier;
  v9->_selectedOfferIdentifier = (NSString *)v52;

  v54 = [v6 PKDictionaryForKey:@"dynamicContent"];
  if ([v54 count])
  {
    v55 = [[PKPaymentOfferDynamicContent alloc] initWithDictionary:v54];
    dynamicContent = v9->_dynamicContent;
    v9->_dynamicContent = v55;
  }
  v57 = [v6 PKDictionaryForKey:@"action"];
  if ([v57 count])
  {
    v58 = [[PKPaymentOfferAction alloc] initWithDictionary:v57];
    action = v9->_action;
    v9->_action = v58;
  }
LABEL_49:

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  [v3 setObject:self->_sessionIdentifier forKeyedSubscript:@"sessionIdentifier"];
  unint64_t v4 = self->_offerEligibility - 1;
  if (v4 > 9) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E56F12C0[v4];
  }
  [v3 setObject:v5 forKeyedSubscript:@"offerEligibility"];
  id v6 = [(NSArray *)self->_offers pk_arrayBySafelyApplyingBlock:&__block_literal_global_183];
  [v3 setObject:v6 forKeyedSubscript:@"offers"];

  id v7 = [(PKPaymentOfferAction *)self->_action dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"action"];

  [v3 setObject:self->_selectedOfferIdentifier forKeyedSubscript:@"selectedOfferIdentifier"];
  v8 = [(PKPaymentOfferDynamicContent *)self->_dynamicContent dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"dynamicContent"];

  v9 = (void *)[v3 copy];
  return v9;
}

uint64_t __63__PKPaymentOfferInstallmentAssessment_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)installmentOfferWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    offers = self->_offers;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PKPaymentOfferInstallmentAssessment_installmentOfferWithIdentifier___block_invoke;
    v9[3] = &unk_1E56F12A0;
    id v10 = v4;
    id v7 = [(NSArray *)offers pk_firstObjectPassingTest:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __70__PKPaymentOfferInstallmentAssessment_installmentOfferWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (BOOL)isEligible
{
  return self->_offerEligibility == 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferInstallmentAssessment *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        identifier = v6->_identifier;
        uint64_t v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {
        }
        else
        {
          id v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_34;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_35;
          }
        }
        sessionIdentifier = v6->_sessionIdentifier;
        uint64_t v8 = self->_sessionIdentifier;
        uint64_t v14 = sessionIdentifier;
        if (v8 == v14)
        {
        }
        else
        {
          id v10 = v14;
          if (!v8 || !v14) {
            goto LABEL_34;
          }
          BOOL v15 = [(NSString *)v8 isEqualToString:v14];

          if (!v15) {
            goto LABEL_35;
          }
        }
        if (self->_offerEligibility != v6->_offerEligibility) {
          goto LABEL_35;
        }
        offers = self->_offers;
        uint64_t v17 = v6->_offers;
        if (offers && v17)
        {
          if ((-[NSArray isEqual:](offers, "isEqual:") & 1) == 0) {
            goto LABEL_35;
          }
        }
        else if (offers != v17)
        {
          goto LABEL_35;
        }
        action = self->_action;
        v19 = v6->_action;
        if (action && v19)
        {
          if (!-[PKPaymentOfferAction isEqual:](action, "isEqual:")) {
            goto LABEL_35;
          }
        }
        else if (action != v19)
        {
          goto LABEL_35;
        }
        selectedOfferIdentifier = v6->_selectedOfferIdentifier;
        uint64_t v8 = self->_selectedOfferIdentifier;
        char v21 = selectedOfferIdentifier;
        if (v8 == v21)
        {

LABEL_39:
          dynamicContent = self->_dynamicContent;
          char v25 = v6->_dynamicContent;
          if (dynamicContent && v25) {
            char v12 = -[PKPaymentOfferDynamicContent isEqual:](dynamicContent, "isEqual:");
          }
          else {
            char v12 = dynamicContent == v25;
          }
          goto LABEL_36;
        }
        id v10 = v21;
        if (v8 && v21)
        {
          BOOL v22 = [(NSString *)v8 isEqualToString:v21];

          if (v22) {
            goto LABEL_39;
          }
LABEL_35:
          char v12 = 0;
LABEL_36:

          goto LABEL_37;
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    char v12 = 0;
  }
LABEL_37:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_sessionIdentifier];
  [v3 safelyAddObject:self->_offers];
  [v3 safelyAddObject:self->_action];
  [v3 safelyAddObject:self->_selectedOfferIdentifier];
  [v3 safelyAddObject:self->_dynamicContent];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_offerEligibility - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"sessionIdentifier: '%@'; ", self->_sessionIdentifier];
  unint64_t v4 = self->_offerEligibility - 1;
  if (v4 > 9) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56F12C0[v4];
  }
  [v3 appendFormat:@"offerEligibility: '%@'; ", v5];
  [v3 appendFormat:@"offers: '%@'; ", self->_offers];
  [v3 appendFormat:@"action: '%@'; ", self->_action];
  [v3 appendFormat:@"selectedOfferIdentifier: '%@'; ", self->_selectedOfferIdentifier];
  [v3 appendFormat:@"dynamicContent: '%@'; ", self->_dynamicContent];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentAssessment)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentOfferInstallmentAssessment;
  unint64_t v5 = [(PKPaymentOfferInstallmentAssessment *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v8;

    v5->_offerEligibility = [v4 decodeIntegerForKey:@"offerEligibility"];
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    char v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"offers"];
    offers = v5->_offers;
    v5->_offers = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (PKPaymentOfferAction *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedOfferIdentifier"];
    selectedOfferIdentifier = v5->_selectedOfferIdentifier;
    v5->_selectedOfferIdentifier = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dynamicContent"];
    dynamicContent = v5->_dynamicContent;
    v5->_dynamicContent = (PKPaymentOfferDynamicContent *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeInteger:self->_offerEligibility forKey:@"action"];
  [v5 encodeObject:self->_offers forKey:@"offers"];
  [v5 encodeObject:self->_action forKey:@"action"];
  [v5 encodeObject:self->_selectedOfferIdentifier forKey:@"selectedOfferIdentifier"];
  [v5 encodeObject:self->_dynamicContent forKey:@"dynamicContent"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferInstallmentAssessment allocWithZone:](PKPaymentOfferInstallmentAssessment, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  sessionIdentifier = v5->_sessionIdentifier;
  v5->_sessionIdentifier = (NSString *)v8;

  v5->_offerEligibility = self->_offerEligibility;
  uint64_t v10 = [(NSArray *)self->_offers copyWithZone:a3];
  offers = v5->_offers;
  v5->_offers = (NSArray *)v10;

  char v12 = [(PKPaymentOfferAction *)self->_action copyWithZone:a3];
  action = v5->_action;
  v5->_action = v12;

  uint64_t v14 = [(NSString *)self->_selectedOfferIdentifier copyWithZone:a3];
  selectedOfferIdentifier = v5->_selectedOfferIdentifier;
  v5->_selectedOfferIdentifier = (NSString *)v14;

  uint64_t v16 = [(PKPaymentOfferDynamicContent *)self->_dynamicContent copyWithZone:a3];
  dynamicContent = v5->_dynamicContent;
  v5->_dynamicContent = v16;

  return v5;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)offerEligibility
{
  return self->_offerEligibility;
}

- (NSArray)offers
{
  return self->_offers;
}

- (PKPaymentOfferAction)action
{
  return self->_action;
}

- (NSString)selectedOfferIdentifier
{
  return self->_selectedOfferIdentifier;
}

- (PKPaymentOfferDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_selectedOfferIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end