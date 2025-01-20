@interface PKPayLaterPayment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterPayment:(id)a3;
- (NSArray)fundingSources;
- (NSDate)postedDate;
- (NSString)associatedTransactionPaymentHash;
- (NSString)paymentIdentifier;
- (PKCurrencyAmount)amount;
- (PKCurrencyAmount)interestPaid;
- (PKCurrencyAmount)principalPaid;
- (PKPayLaterPayment)initWithCoder:(id)a3;
- (PKPayLaterPayment)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)subtype;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setAssociatedTransactionPaymentHash:(id)a3;
- (void)setFundingSources:(id)a3;
- (void)setInterestPaid:(id)a3;
- (void)setPaymentIdentifier:(id)a3;
- (void)setPostedDate:(id)a3;
- (void)setPrincipalPaid:(id)a3;
- (void)setSubtype:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPayLaterPayment

- (PKPayLaterPayment)initWithDictionary:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)PKPayLaterPayment;
  v5 = [(PKPayLaterPayment *)&v73 init];
  if (!v5) {
    goto LABEL_60;
  }
  uint64_t v6 = [v4 PKStringForKey:@"paymentIdentifier"];
  paymentIdentifier = v5->_paymentIdentifier;
  v5->_paymentIdentifier = (NSString *)v6;

  v8 = [v4 PKStringForKey:@"type"];
  v9 = v8;
  if (v8 == @"payment") {
    goto LABEL_5;
  }
  if (!v8) {
    goto LABEL_24;
  }
  char v10 = [(__CFString *)v8 isEqualToString:@"payment"];

  if (v10)
  {
LABEL_5:
    uint64_t v11 = 1;
    goto LABEL_25;
  }
  v12 = v9;
  if (v12 == @"temporaryCredit"
    || (v13 = v12,
        char v14 = [(__CFString *)v12 isEqualToString:@"temporaryCredit"],
        v13,
        (v14 & 1) != 0))
  {
    uint64_t v11 = 2;
    goto LABEL_25;
  }
  v15 = v13;
  if (v15 == @"refund"
    || (v16 = v15,
        char v17 = [(__CFString *)v15 isEqualToString:@"refund"],
        v16,
        (v17 & 1) != 0))
  {
    uint64_t v11 = 3;
    goto LABEL_25;
  }
  v18 = v16;
  if (v18 == @"creditRevoked"
    || (v19 = v18,
        char v20 = [(__CFString *)v18 isEqualToString:@"creditRevoked"],
        v19,
        (v20 & 1) != 0))
  {
    uint64_t v11 = 4;
    goto LABEL_25;
  }
  v21 = v19;
  if (v21 == @"declined"
    || (v22 = v21,
        char v23 = [(__CFString *)v21 isEqualToString:@"declined"],
        v22,
        (v23 & 1) != 0))
  {
    uint64_t v11 = 5;
    goto LABEL_25;
  }
  v24 = v22;
  if (v24 == @"refundRevoked"
    || (v25 = v24,
        char v26 = [(__CFString *)v24 isEqualToString:@"refundRevoked"],
        v25,
        (v26 & 1) != 0))
  {
    uint64_t v11 = 6;
    goto LABEL_25;
  }
  v27 = v25;
  if (v27 == @"adjustment"
    || (v28 = v27,
        int v29 = [(__CFString *)v27 isEqualToString:@"adjustment"],
        v28,
        v29))
  {
    uint64_t v11 = 7;
  }
  else
  {
LABEL_24:
    uint64_t v11 = 0;
  }
LABEL_25:

  v5->_type = v11;
  v30 = [v4 PKStringForKey:@"subtype"];
  v31 = v30;
  if (v30 != @"goodwillCredit")
  {
    if (v30)
    {
      char v32 = [(__CFString *)v30 isEqualToString:@"goodwillCredit"];

      if (v32) {
        goto LABEL_28;
      }
      v34 = v31;
      if (v34 == @"settlement"
        || (v35 = v34,
            char v36 = [(__CFString *)v34 isEqualToString:@"settlement"],
            v35,
            (v36 & 1) != 0))
      {
        uint64_t v33 = 2;
        goto LABEL_39;
      }
      v37 = v35;
      if (v37 == @"systemReduction"
        || (v38 = v37,
            char v39 = [(__CFString *)v37 isEqualToString:@"systemReduction"],
            v38,
            (v39 & 1) != 0))
      {
        uint64_t v33 = 3;
        goto LABEL_39;
      }
      v40 = v38;
      if (v40 == @"systemIncrease"
        || (v41 = v40,
            int v42 = [(__CFString *)v40 isEqualToString:@"systemIncrease"],
            v41,
            v42))
      {
        uint64_t v33 = 4;
        goto LABEL_39;
      }
    }
    uint64_t v33 = 0;
    goto LABEL_39;
  }
LABEL_28:
  uint64_t v33 = 1;
LABEL_39:

  v5->_subtype = v33;
  uint64_t v43 = [v4 PKDateForKey:@"postedDate"];
  postedDate = v5->_postedDate;
  v5->_postedDate = (NSDate *)v43;

  uint64_t v45 = [v4 PKCurrencyAmountForKey:@"amount"];
  amount = v5->_amount;
  v5->_amount = (PKCurrencyAmount *)v45;

  uint64_t v47 = [v4 PKCurrencyAmountForKey:@"interestPaid"];
  interestPaid = v5->_interestPaid;
  v5->_interestPaid = (PKCurrencyAmount *)v47;

  uint64_t v49 = [v4 PKCurrencyAmountForKey:@"principalPaid"];
  principalPaid = v5->_principalPaid;
  v5->_principalPaid = (PKCurrencyAmount *)v49;

  v51 = [v4 PKStringForKey:@"associatedTransactionPaymentHash"];
  [(PKPayLaterPayment *)v5 setAssociatedTransactionPaymentHash:v51];

  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v53 = [v4 PKArrayContaining:objc_opt_class() forKey:@"fundingSources"];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v54 = [v53 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v70;
    do
    {
      uint64_t v57 = 0;
      do
      {
        if (*(void *)v70 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = [[PKPayLaterPaymentFundingSource alloc] initWithDictionary:*(void *)(*((void *)&v69 + 1) + 8 * v57)];
        [v52 safelyAddObject:v58];

        ++v57;
      }
      while (v55 != v57);
      uint64_t v55 = [v53 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v55);
  }
  v59 = [v4 PKDictionaryForKey:@"fundingSource"];
  if ([v59 count]) {
    v60 = v59;
  }
  else {
    v60 = v4;
  }
  id v61 = v60;

  v62 = [[PKPayLaterPaymentFundingSource alloc] initWithDictionary:v61];
  v63 = [v4 PKCurrencyAmountForKey:@"fundingSourceRefundAmount"];

  if (v63) {
    [(PKPayLaterPaymentFundingSource *)v62 setRefundAmount:v63];
  }
  if (v62 && ([v52 containsObject:v62] & 1) == 0)
  {
    v64 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = v5->_paymentIdentifier;
      *(_DWORD *)buf = 138412546;
      v75 = v62;
      __int16 v76 = 2112;
      v77 = v65;
      _os_log_impl(&dword_190E10000, v64, OS_LOG_TYPE_DEFAULT, "Adding legacyFundingSource to fundingSources array: %@ for paymentIdentifier: %@", buf, 0x16u);
    }

    [v52 safelyAddObject:v62];
  }
  if ([v52 count])
  {
    uint64_t v66 = [v52 copy];
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = (NSArray *)v66;
  }
  else
  {
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = 0;
  }

LABEL_60:
  return v5;
}

- (void)setAssociatedTransactionPaymentHash:(id)a3
{
  id v4 = [a3 uppercaseString];
  associatedTransactionPaymentHash = self->_associatedTransactionPaymentHash;
  self->_associatedTransactionPaymentHash = v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterPayment *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterPayment *)self isEqualToPayLaterPayment:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterPayment:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_38;
  }
  BOOL v6 = (void *)v4[1];
  v7 = self->_paymentIdentifier;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    LOBYTE(v10) = 0;
    if (!v7 || !v8)
    {
LABEL_40:

      goto LABEL_41;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_41;
    }
  }
  if (self->_type != v5[2] || self->_subtype != v5[3]) {
    goto LABEL_38;
  }
  postedDate = self->_postedDate;
  v12 = (NSDate *)v5[4];
  if (postedDate && v12)
  {
    if ((-[NSDate isEqual:](postedDate, "isEqual:") & 1) == 0) {
      goto LABEL_38;
    }
  }
  else if (postedDate != v12)
  {
    goto LABEL_38;
  }
  amount = self->_amount;
  char v14 = (PKCurrencyAmount *)v5[5];
  if (amount && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](amount, "isEqual:")) {
      goto LABEL_38;
    }
  }
  else if (amount != v14)
  {
    goto LABEL_38;
  }
  interestPaid = self->_interestPaid;
  v16 = (PKCurrencyAmount *)v5[6];
  if (interestPaid && v16)
  {
    if (!-[PKCurrencyAmount isEqual:](interestPaid, "isEqual:")) {
      goto LABEL_38;
    }
  }
  else if (interestPaid != v16)
  {
    goto LABEL_38;
  }
  principalPaid = self->_principalPaid;
  v18 = (PKCurrencyAmount *)v5[7];
  if (principalPaid && v18)
  {
    if (!-[PKCurrencyAmount isEqual:](principalPaid, "isEqual:")) {
      goto LABEL_38;
    }
  }
  else if (principalPaid != v18)
  {
    goto LABEL_38;
  }
  fundingSources = self->_fundingSources;
  char v20 = (NSArray *)v5[8];
  if (fundingSources && v20)
  {
    if (-[NSArray isEqual:](fundingSources, "isEqual:")) {
      goto LABEL_33;
    }
  }
  else if (fundingSources == v20)
  {
LABEL_33:
    associatedTransactionPaymentHash = self->_associatedTransactionPaymentHash;
    v22 = (void *)v5[9];
    v7 = associatedTransactionPaymentHash;
    char v23 = v22;
    if (v7 == v23)
    {
      LOBYTE(v10) = 1;
      v9 = v7;
    }
    else
    {
      v9 = v23;
      LOBYTE(v10) = 0;
      if (v7 && v23) {
        LOBYTE(v10) = [(NSString *)v7 isEqualToString:v23];
      }
    }
    goto LABEL_40;
  }
LABEL_38:
  LOBYTE(v10) = 0;
LABEL_41:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_paymentIdentifier];
  [v3 safelyAddObject:self->_postedDate];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_interestPaid];
  [v3 safelyAddObject:self->_principalPaid];
  [v3 safelyAddObject:self->_fundingSources];
  [v3 safelyAddObject:self->_associatedTransactionPaymentHash];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_subtype - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"paymentIdentifier: '%@'; ", self->_paymentIdentifier];
  unint64_t v4 = self->_type - 1;
  if (v4 > 6) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56EEF38[v4];
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  unint64_t v6 = self->_subtype - 1;
  if (v6 > 3) {
    v7 = @"unknown";
  }
  else {
    v7 = off_1E56EEF70[v6];
  }
  [v3 appendFormat:@"subtype: '%@'; ", v7];
  v8 = [(NSDate *)self->_postedDate description];
  [v3 appendFormat:@"postedDate: '%@'; ", v8];

  v9 = [(PKCurrencyAmount *)self->_amount amount];
  BOOL v10 = [v9 stringValue];
  [v3 appendFormat:@"amount: '%@'; ", v10];

  uint64_t v11 = [(PKCurrencyAmount *)self->_interestPaid amount];
  v12 = [v11 stringValue];
  [v3 appendFormat:@"interestPaid: '%@'; ", v12];

  v13 = [(PKCurrencyAmount *)self->_principalPaid amount];
  char v14 = [v13 stringValue];
  [v3 appendFormat:@"principalPaid: '%@'; ", v14];

  [v3 appendFormat:@"fundingSources: '%@'; ", self->_fundingSources];
  objc_msgSend(v3, "appendFormat:", @"associatedTransactionPaymentHash: '%@'; ",
    self->_associatedTransactionPaymentHash);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_paymentIdentifier forKeyedSubscript:@"paymentIdentifier"];
  unint64_t v4 = self->_type - 1;
  if (v4 > 6) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56EEF38[v4];
  }
  [v3 setObject:v5 forKeyedSubscript:@"type"];
  unint64_t v6 = self->_subtype - 1;
  if (v6 > 3) {
    v7 = @"unknown";
  }
  else {
    v7 = off_1E56EEF70[v6];
  }
  [v3 setObject:v7 forKeyedSubscript:@"subtype"];
  postedDate = self->_postedDate;
  if (postedDate)
  {
    v9 = PKISO8601DateStringFromDate(postedDate);
    [v3 setObject:v9 forKeyedSubscript:@"postedDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"postedDate"];
  }
  BOOL v10 = [(PKCurrencyAmount *)self->_amount dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:@"amount"];

  uint64_t v11 = [(PKCurrencyAmount *)self->_interestPaid dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"interestPaid"];

  v12 = [(PKCurrencyAmount *)self->_principalPaid dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"principalPaid"];

  [v3 setObject:self->_associatedTransactionPaymentHash forKeyedSubscript:@"associatedTransactionPaymentHash"];
  v13 = [(NSArray *)self->_fundingSources pk_arrayBySafelyApplyingBlock:&__block_literal_global_161];
  [v3 setObject:v13 forKeyedSubscript:@"fundingSources"];

  char v14 = (void *)[v3 copy];
  return v14;
}

uint64_t __45__PKPayLaterPayment_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPayment)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterPayment;
  unint64_t v5 = [(PKPayLaterPayment *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentIdentifier"];
    paymentIdentifier = v5->_paymentIdentifier;
    v5->_paymentIdentifier = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_subtype = [v4 decodeIntegerForKey:@"subtype"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postedDate"];
    postedDate = v5->_postedDate;
    v5->_postedDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestPaid"];
    interestPaid = v5->_interestPaid;
    v5->_interestPaid = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"principalPaid"];
    principalPaid = v5->_principalPaid;
    v5->_principalPaid = (PKCurrencyAmount *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"fundingSources"];
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedTransactionPaymentHash"];
    associatedTransactionPaymentHash = v5->_associatedTransactionPaymentHash;
    v5->_associatedTransactionPaymentHash = (NSString *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  paymentIdentifier = self->_paymentIdentifier;
  id v5 = a3;
  [v5 encodeObject:paymentIdentifier forKey:@"paymentIdentifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_subtype forKey:@"subtype"];
  [v5 encodeObject:self->_postedDate forKey:@"postedDate"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeObject:self->_interestPaid forKey:@"interestPaid"];
  [v5 encodeObject:self->_principalPaid forKey:@"principalPaid"];
  [v5 encodeObject:self->_fundingSources forKey:@"fundingSources"];
  [v5 encodeObject:self->_associatedTransactionPaymentHash forKey:@"associatedTransactionPaymentHash"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterPayment allocWithZone:](PKPayLaterPayment, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_paymentIdentifier copyWithZone:a3];
  paymentIdentifier = v5->_paymentIdentifier;
  v5->_paymentIdentifier = (NSString *)v6;

  v5->_type = self->_type;
  v5->_subtype = self->_subtype;
  uint64_t v8 = [(NSDate *)self->_postedDate copyWithZone:a3];
  postedDate = v5->_postedDate;
  v5->_postedDate = (NSDate *)v8;

  uint64_t v10 = [(PKCurrencyAmount *)self->_amount copyWithZone:a3];
  amount = v5->_amount;
  v5->_amount = v10;

  uint64_t v12 = [(PKCurrencyAmount *)self->_principalPaid copyWithZone:a3];
  principalPaid = v5->_principalPaid;
  v5->_principalPaid = v12;

  uint64_t v14 = [(PKCurrencyAmount *)self->_interestPaid copyWithZone:a3];
  interestPaid = v5->_interestPaid;
  v5->_interestPaid = v14;

  uint64_t v16 = [(NSArray *)self->_fundingSources copyWithZone:a3];
  fundingSources = v5->_fundingSources;
  v5->_fundingSources = (NSArray *)v16;

  uint64_t v18 = [(NSString *)self->_associatedTransactionPaymentHash copyWithZone:a3];
  associatedTransactionPaymentHash = v5->_associatedTransactionPaymentHash;
  v5->_associatedTransactionPaymentHash = (NSString *)v18;

  return v5;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

- (NSDate)postedDate
{
  return self->_postedDate;
}

- (void)setPostedDate:(id)a3
{
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (PKCurrencyAmount)interestPaid
{
  return self->_interestPaid;
}

- (void)setInterestPaid:(id)a3
{
}

- (PKCurrencyAmount)principalPaid
{
  return self->_principalPaid;
}

- (void)setPrincipalPaid:(id)a3
{
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(id)a3
{
}

- (NSString)associatedTransactionPaymentHash
{
  return self->_associatedTransactionPaymentHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedTransactionPaymentHash, 0);
  objc_storeStrong((id *)&self->_fundingSources, 0);
  objc_storeStrong((id *)&self->_principalPaid, 0);
  objc_storeStrong((id *)&self->_interestPaid, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_postedDate, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
}

@end