@interface PKAccountServicingEventStatusDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)evidenceDocumentTypes;
- (NSArray)statusReasons;
- (NSDate)customerResponseByDate;
- (NSDate)merchantResponseByDate;
- (NSDate)resolutionDate;
- (NSString)resolutionReason;
- (PKAccountServicingEventStatusDetails)initWithCoder:(id)a3;
- (PKAccountServicingEventStatusDetails)initWithDictionary:(id)a3 currencyCode:(id)a4;
- (PKAccountServicingEventStatusDetails)initWithRecord:(id)a3 currencyCode:(id)a4;
- (PKCurrencyAmount)partiallyApprovedAmount;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setCustomerResponseByDate:(id)a3;
- (void)setEvidenceDocumentTypes:(id)a3;
- (void)setMerchantResponseByDate:(id)a3;
- (void)setPartiallyApprovedAmount:(id)a3;
- (void)setResolutionDate:(id)a3;
- (void)setResolutionReason:(id)a3;
- (void)setStatusReasons:(id)a3;
@end

@implementation PKAccountServicingEventStatusDetails

- (PKAccountServicingEventStatusDetails)initWithDictionary:(id)a3 currencyCode:(id)a4
{
  id v6 = a3;
  v7 = (NSString *)a4;
  v25.receiver = self;
  v25.super_class = (Class)PKAccountServicingEventStatusDetails;
  v8 = [(PKAccountServicingEventStatusDetails *)&v25 init];
  if (v8)
  {
    uint64_t v9 = [v6 PKArrayContaining:objc_opt_class() forKey:@"statusReasonCodes"];
    statusReasons = v8->_statusReasons;
    v8->_statusReasons = (NSArray *)v9;

    uint64_t v11 = [v6 PKDateForKey:@"customerResponseByDate"];
    customerResponseByDate = v8->_customerResponseByDate;
    v8->_customerResponseByDate = (NSDate *)v11;

    uint64_t v13 = [v6 PKDateForKey:@"merchantResponseByDate"];
    merchantResponseByDate = v8->_merchantResponseByDate;
    v8->_merchantResponseByDate = (NSDate *)v13;

    uint64_t v15 = [v6 PKArrayContaining:objc_opt_class() forKey:@"evidenceDocumentTypes"];
    evidenceDocumentTypes = v8->_evidenceDocumentTypes;
    v8->_evidenceDocumentTypes = (NSArray *)v15;

    uint64_t v17 = [v6 PKStringForKey:@"resolutionReasonCode"];
    resolutionReason = v8->_resolutionReason;
    v8->_resolutionReason = (NSString *)v17;

    v19 = [v6 PKDecimalNumberFromStringForKey:@"partiallyApprovedAmount"];
    uint64_t v20 = PKCurrencyAmountCreate(v19, v7, 0);
    partiallyApprovedAmount = v8->_partiallyApprovedAmount;
    v8->_partiallyApprovedAmount = (PKCurrencyAmount *)v20;

    uint64_t v22 = [v6 PKDateForKey:@"resolutionDate"];
    resolutionDate = v8->_resolutionDate;
    v8->_resolutionDate = (NSDate *)v22;
  }
  return v8;
}

- (PKAccountServicingEventStatusDetails)initWithRecord:(id)a3 currencyCode:(id)a4
{
  id v6 = a3;
  v7 = (NSString *)a4;
  v28.receiver = self;
  v28.super_class = (Class)PKAccountServicingEventStatusDetails;
  v8 = [(PKAccountServicingEventStatusDetails *)&v28 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v10 = objc_msgSend(v6, "pk_encryptedArrayOfClasses:forKey:", v9, @"statusReasonCodes");
    statusReasons = v8->_statusReasons;
    v8->_statusReasons = (NSArray *)v10;

    uint64_t v12 = objc_msgSend(v6, "pk_encryptedDateForKey:", @"customerResponseByDate");
    customerResponseByDate = v8->_customerResponseByDate;
    v8->_customerResponseByDate = (NSDate *)v12;

    uint64_t v14 = objc_msgSend(v6, "pk_encryptedDateForKey:", @"merchantResponseByDate");
    merchantResponseByDate = v8->_merchantResponseByDate;
    v8->_merchantResponseByDate = (NSDate *)v14;

    v16 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v17 = objc_msgSend(v6, "pk_encryptedArrayOfClasses:forKey:", v16, @"evidenceDocumentTypes");
    evidenceDocumentTypes = v8->_evidenceDocumentTypes;
    v8->_evidenceDocumentTypes = (NSArray *)v17;

    uint64_t v19 = objc_msgSend(v6, "pk_encryptedStringForKey:", @"resolutionReasonCode");
    resolutionReason = v8->_resolutionReason;
    v8->_resolutionReason = (NSString *)v19;

    objc_msgSend(v6, "pk_encryptedDecimalNumberForKey:", @"partiallyApprovedAmount");
    v21 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v21;
    if (v21)
    {
      uint64_t v23 = PKCurrencyAmountCreate(v21, v7, 0);
      partiallyApprovedAmount = v8->_partiallyApprovedAmount;
      v8->_partiallyApprovedAmount = (PKCurrencyAmount *)v23;
    }
    uint64_t v25 = objc_msgSend(v6, "pk_encryptedDateForKey:", @"resolutionDate");
    resolutionDate = v8->_resolutionDate;
    v8->_resolutionDate = (NSDate *)v25;
  }
  return v8;
}

- (void)encodeWithRecord:(id)a3
{
  id v12 = [a3 encryptedValues];
  if (self->_statusReasons)
  {
    id v4 = [NSString alloc];
    v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:self->_statusReasons options:0 error:0];
    id v6 = (void *)[v4 initWithData:v5 encoding:4];

    [v12 setObject:v6 forKey:@"statusReasonCodes"];
  }
  [v12 setObject:self->_customerResponseByDate forKey:@"customerResponseByDate"];
  [v12 setObject:self->_merchantResponseByDate forKey:@"merchantResponseByDate"];
  if (self->_evidenceDocumentTypes)
  {
    id v7 = [NSString alloc];
    v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:self->_evidenceDocumentTypes options:0 error:0];
    uint64_t v9 = (void *)[v7 initWithData:v8 encoding:4];

    [v12 setObject:v9 forKey:@"evidenceDocumentTypes"];
  }
  [v12 setObject:self->_resolutionReason forKey:@"resolutionReasonCode"];
  uint64_t v10 = [(PKCurrencyAmount *)self->_partiallyApprovedAmount amount];
  uint64_t v11 = [v10 stringValue];
  [v12 setObject:v11 forKey:@"partiallyApprovedAmount"];

  [v12 setObject:self->_resolutionDate forKey:@"resolutionDate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicingEventStatusDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountServicingEventStatusDetails;
  v5 = [(PKAccountServicingEventStatusDetails *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"statusReasonCodes"];
    statusReasons = v5->_statusReasons;
    v5->_statusReasons = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customerResponseByDate"];
    customerResponseByDate = v5->_customerResponseByDate;
    v5->_customerResponseByDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantResponseByDate"];
    merchantResponseByDate = v5->_merchantResponseByDate;
    v5->_merchantResponseByDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"evidenceDocumentTypes"];
    evidenceDocumentTypes = v5->_evidenceDocumentTypes;
    v5->_evidenceDocumentTypes = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionReasonCode"];
    resolutionReason = v5->_resolutionReason;
    v5->_resolutionReason = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partiallyApprovedAmount"];
    partiallyApprovedAmount = v5->_partiallyApprovedAmount;
    v5->_partiallyApprovedAmount = (PKCurrencyAmount *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionDate"];
    resolutionDate = v5->_resolutionDate;
    v5->_resolutionDate = (NSDate *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  statusReasons = self->_statusReasons;
  id v5 = a3;
  [v5 encodeObject:statusReasons forKey:@"statusReasonCodes"];
  [v5 encodeObject:self->_customerResponseByDate forKey:@"customerResponseByDate"];
  [v5 encodeObject:self->_merchantResponseByDate forKey:@"merchantResponseByDate"];
  [v5 encodeObject:self->_evidenceDocumentTypes forKey:@"evidenceDocumentTypes"];
  [v5 encodeObject:self->_resolutionReason forKey:@"resolutionReasonCode"];
  [v5 encodeObject:self->_partiallyApprovedAmount forKey:@"partiallyApprovedAmount"];
  [v5 encodeObject:self->_resolutionDate forKey:@"resolutionDate"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_34;
  }
  statusReasons = self->_statusReasons;
  uint64_t v6 = (NSArray *)v4[1];
  if (statusReasons && v6)
  {
    if ((-[NSArray isEqual:](statusReasons, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (statusReasons != v6)
  {
    goto LABEL_34;
  }
  customerResponseByDate = self->_customerResponseByDate;
  uint64_t v8 = (NSDate *)v4[2];
  if (customerResponseByDate && v8)
  {
    if ((-[NSDate isEqual:](customerResponseByDate, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (customerResponseByDate != v8)
  {
    goto LABEL_34;
  }
  merchantResponseByDate = self->_merchantResponseByDate;
  uint64_t v10 = (NSDate *)v4[3];
  if (merchantResponseByDate && v10)
  {
    if ((-[NSDate isEqual:](merchantResponseByDate, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (merchantResponseByDate != v10)
  {
    goto LABEL_34;
  }
  evidenceDocumentTypes = self->_evidenceDocumentTypes;
  uint64_t v12 = (NSArray *)v4[4];
  if (evidenceDocumentTypes && v12)
  {
    if ((-[NSArray isEqual:](evidenceDocumentTypes, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (evidenceDocumentTypes != v12)
  {
    goto LABEL_34;
  }
  resolutionReason = self->_resolutionReason;
  uint64_t v14 = (NSString *)v4[5];
  if (resolutionReason && v14)
  {
    if ((-[NSString isEqual:](resolutionReason, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (resolutionReason != v14)
  {
    goto LABEL_34;
  }
  partiallyApprovedAmount = self->_partiallyApprovedAmount;
  uint64_t v16 = (PKCurrencyAmount *)v4[6];
  if (!partiallyApprovedAmount || !v16)
  {
    if (partiallyApprovedAmount == v16) {
      goto LABEL_30;
    }
LABEL_34:
    char v19 = 0;
    goto LABEL_35;
  }
  if (!-[PKCurrencyAmount isEqual:](partiallyApprovedAmount, "isEqual:")) {
    goto LABEL_34;
  }
LABEL_30:
  resolutionDate = self->_resolutionDate;
  uint64_t v18 = (NSDate *)v4[7];
  if (resolutionDate && v18) {
    char v19 = -[NSDate isEqual:](resolutionDate, "isEqual:");
  }
  else {
    char v19 = resolutionDate == v18;
  }
LABEL_35:

  return v19;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_statusReasons];
  [v3 safelyAddObject:self->_customerResponseByDate];
  [v3 safelyAddObject:self->_merchantResponseByDate];
  [v3 safelyAddObject:self->_evidenceDocumentTypes];
  [v3 safelyAddObject:self->_partiallyApprovedAmount];
  [v3 safelyAddObject:self->_resolutionDate];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = [(PKAccountServicingEventStatusDetails *)self statusReasons];
  [v3 appendFormat:@"statusReasons: '%@'; ", v4];

  id v5 = [(PKAccountServicingEventStatusDetails *)self customerResponseByDate];
  [v3 appendFormat:@"customerResponseByDate: '%@'; ", v5];

  uint64_t v6 = [(PKAccountServicingEventStatusDetails *)self merchantResponseByDate];
  [v3 appendFormat:@"merchantResponseByDate: '%@'; ", v6];

  id v7 = [(PKAccountServicingEventStatusDetails *)self evidenceDocumentTypes];
  [v3 appendFormat:@"evidenceDocumentTypes: '%@'; ", v7];

  uint64_t v8 = [(PKAccountServicingEventStatusDetails *)self resolutionReason];
  [v3 appendFormat:@"resolutionReasonCode: '%@'; ", v8];

  uint64_t v9 = [(PKAccountServicingEventStatusDetails *)self partiallyApprovedAmount];
  [v3 appendFormat:@"partiallyApprovedAmount: '%@'; ", v9];

  uint64_t v10 = [(PKAccountServicingEventStatusDetails *)self resolutionDate];
  [v3 appendFormat:@"resolutionDate: '%@'; ", v10];

  [v3 appendFormat:@">"];
  return v3;
}

- (NSArray)statusReasons
{
  return self->_statusReasons;
}

- (void)setStatusReasons:(id)a3
{
}

- (NSDate)customerResponseByDate
{
  return self->_customerResponseByDate;
}

- (void)setCustomerResponseByDate:(id)a3
{
}

- (NSDate)merchantResponseByDate
{
  return self->_merchantResponseByDate;
}

- (void)setMerchantResponseByDate:(id)a3
{
}

- (NSArray)evidenceDocumentTypes
{
  return self->_evidenceDocumentTypes;
}

- (void)setEvidenceDocumentTypes:(id)a3
{
}

- (NSString)resolutionReason
{
  return self->_resolutionReason;
}

- (void)setResolutionReason:(id)a3
{
}

- (PKCurrencyAmount)partiallyApprovedAmount
{
  return self->_partiallyApprovedAmount;
}

- (void)setPartiallyApprovedAmount:(id)a3
{
}

- (NSDate)resolutionDate
{
  return self->_resolutionDate;
}

- (void)setResolutionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionDate, 0);
  objc_storeStrong((id *)&self->_partiallyApprovedAmount, 0);
  objc_storeStrong((id *)&self->_resolutionReason, 0);
  objc_storeStrong((id *)&self->_evidenceDocumentTypes, 0);
  objc_storeStrong((id *)&self->_merchantResponseByDate, 0);
  objc_storeStrong((id *)&self->_customerResponseByDate, 0);
  objc_storeStrong((id *)&self->_statusReasons, 0);
}

@end