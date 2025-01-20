@interface PKPaymentOfferInstallmentAssessmentOffer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)dueDate;
- (NSDictionary)serviceProviderData;
- (NSString)identifier;
- (NSString)preferredLanguage;
- (NSURL)serviceProviderURL;
- (PKCurrencyAmount)installmentAmount;
- (PKCurrencyAmount)totalCost;
- (PKCurrencyAmount)totalInterestAndFeesAmount;
- (PKPaymentOfferDynamicContent)dynamicContent;
- (PKPaymentOfferInstallmentAssessmentOffer)initWithCoder:(id)a3;
- (PKPaymentOfferInstallmentAssessmentOffer)initWithDictionary:(id)a3;
- (PKPaymentOfferInstallmentDownpaymentDetails)downpaymentDetails;
- (PKPaymentOfferInstallmentFeeDetails)feeDetails;
- (PKPaymentOfferInstallmentInterestDetails)interestDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)installmentCount;
- (int64_t)installmentInterval;
- (unint64_t)hash;
- (unint64_t)installmentPeriod;
- (void)encodeWithCoder:(id)a3;
- (void)setPreferredLanguage:(id)a3;
@end

@implementation PKPaymentOfferInstallmentAssessmentOffer

- (PKPaymentOfferInstallmentAssessmentOffer)initWithDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPaymentOfferInstallmentAssessmentOffer;
  v5 = [(PKPaymentOfferInstallmentAssessmentOffer *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKURLForKey:@"serviceProviderURL"];
    serviceProviderURL = v5->_serviceProviderURL;
    v5->_serviceProviderURL = (NSURL *)v8;

    uint64_t v10 = [v4 PKDateForKey:@"dueDate"];
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v10;

    uint64_t v12 = [v4 PKCurrencyAmountForKey:@"totalCost"];
    totalCost = v5->_totalCost;
    v5->_totalCost = (PKCurrencyAmount *)v12;

    v5->_installmentCount = [v4 PKIntegerForKey:@"installmentCount"];
    v14 = [v4 PKStringForKey:@"installmentPeriod"];
    v5->_installmentPeriod = PKPaymentOfferPeriodFromString(v14);

    v5->_installmentInterval = [v4 PKIntegerForKey:@"installmentInterval"];
    uint64_t v15 = [v4 PKCurrencyAmountForKey:@"installmentAmount"];
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKCurrencyAmount *)v15;

    uint64_t v17 = [v4 PKCurrencyAmountForKey:@"totalInterestAndFeesAmount"];
    totalInterestAndFeesAmount = v5->_totalInterestAndFeesAmount;
    v5->_totalInterestAndFeesAmount = (PKCurrencyAmount *)v17;

    v19 = [v4 PKDictionaryForKey:@"feeDetails"];
    if ([v19 count])
    {
      v20 = [[PKPaymentOfferInstallmentFeeDetails alloc] initWithDictionary:v19];
      feeDetails = v5->_feeDetails;
      v5->_feeDetails = v20;
    }
    v22 = [v4 PKDictionaryForKey:@"interestDetails"];
    if ([v22 count])
    {
      v23 = [[PKPaymentOfferInstallmentInterestDetails alloc] initWithDictionary:v22];
      interestDetails = v5->_interestDetails;
      v5->_interestDetails = v23;
    }
    v25 = [v4 PKDictionaryForKey:@"downpaymentDetails"];
    if ([v25 count])
    {
      v26 = [[PKPaymentOfferInstallmentDownpaymentDetails alloc] initWithDictionary:v25];
      downpaymentDetails = v5->_downpaymentDetails;
      v5->_downpaymentDetails = v26;
    }
    uint64_t v28 = [v4 PKDictionaryForKey:@"serviceProviderData"];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v28;

    v30 = [v4 PKDictionaryForKey:@"dynamicContent"];
    if ([v30 count])
    {
      v31 = [[PKPaymentOfferDynamicContent alloc] initWithDictionary:v30];
      dynamicContent = v5->_dynamicContent;
      v5->_dynamicContent = v31;
    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v4 = [(NSURL *)self->_serviceProviderURL absoluteString];
  [v3 setObject:v4 forKeyedSubscript:@"serviceProviderURL"];

  v5 = PKISO8601DateStringFromDate(self->_dueDate);
  [v3 setObject:v5 forKeyedSubscript:@"dueDate"];

  uint64_t v6 = [(PKCurrencyAmount *)self->_totalCost dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"totalCost"];

  v7 = [NSNumber numberWithInteger:self->_installmentCount];
  [v3 setObject:v7 forKeyedSubscript:@"installmentCount"];

  uint64_t v8 = PKPaymentOfferPeriodToString(self->_installmentPeriod);
  [v3 setObject:v8 forKeyedSubscript:@"installmentPeriod"];

  v9 = [NSNumber numberWithInteger:self->_installmentInterval];
  [v3 setObject:v9 forKeyedSubscript:@"installmentInterval"];

  uint64_t v10 = [(PKCurrencyAmount *)self->_installmentAmount dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:@"installmentAmount"];

  v11 = [(PKCurrencyAmount *)self->_totalInterestAndFeesAmount dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"totalInterestAndFeesAmount"];

  uint64_t v12 = [(PKPaymentOfferInstallmentFeeDetails *)self->_feeDetails dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"feeDetails"];

  v13 = [(PKPaymentOfferInstallmentInterestDetails *)self->_interestDetails dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"interestDetails"];

  v14 = [(PKPaymentOfferInstallmentDownpaymentDetails *)self->_downpaymentDetails dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"downpaymentDetails"];

  [v3 setObject:self->_serviceProviderData forKeyedSubscript:@"serviceProviderData"];
  uint64_t v15 = [(PKPaymentOfferDynamicContent *)self->_dynamicContent dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"dynamicContent"];

  [v3 setObject:self->_preferredLanguage forKeyedSubscript:@"preferredLanguage"];
  v16 = (void *)[v3 copy];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferInstallmentAssessmentOffer *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        identifier = v6->_identifier;
        uint64_t v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {
        }
        else
        {
          uint64_t v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
          {
LABEL_70:

            goto LABEL_71;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_71;
          }
        }
        serviceProviderURL = self->_serviceProviderURL;
        v13 = v6->_serviceProviderURL;
        if (serviceProviderURL && v13)
        {
          if ((-[NSURL isEqual:](serviceProviderURL, "isEqual:") & 1) == 0) {
            goto LABEL_68;
          }
        }
        else if (serviceProviderURL != v13)
        {
          goto LABEL_68;
        }
        dueDate = self->_dueDate;
        uint64_t v15 = v6->_dueDate;
        if (dueDate && v15)
        {
          if ((-[NSDate isEqual:](dueDate, "isEqual:") & 1) == 0) {
            goto LABEL_68;
          }
        }
        else if (dueDate != v15)
        {
          goto LABEL_68;
        }
        totalCost = self->_totalCost;
        uint64_t v17 = v6->_totalCost;
        if (totalCost && v17)
        {
          if (!-[PKCurrencyAmount isEqual:](totalCost, "isEqual:")) {
            goto LABEL_68;
          }
        }
        else if (totalCost != v17)
        {
          goto LABEL_68;
        }
        if (self->_installmentCount != v6->_installmentCount
          || self->_installmentPeriod != v6->_installmentPeriod
          || self->_installmentInterval != v6->_installmentInterval)
        {
          goto LABEL_68;
        }
        installmentAmount = self->_installmentAmount;
        v19 = v6->_installmentAmount;
        if (installmentAmount && v19)
        {
          if (!-[PKCurrencyAmount isEqual:](installmentAmount, "isEqual:")) {
            goto LABEL_68;
          }
        }
        else if (installmentAmount != v19)
        {
          goto LABEL_68;
        }
        totalInterestAndFeesAmount = self->_totalInterestAndFeesAmount;
        v21 = v6->_totalInterestAndFeesAmount;
        if (totalInterestAndFeesAmount && v21)
        {
          if (!-[PKCurrencyAmount isEqual:](totalInterestAndFeesAmount, "isEqual:")) {
            goto LABEL_68;
          }
        }
        else if (totalInterestAndFeesAmount != v21)
        {
          goto LABEL_68;
        }
        feeDetails = self->_feeDetails;
        v23 = v6->_feeDetails;
        if (feeDetails && v23)
        {
          if (!-[PKPaymentOfferInstallmentFeeDetails isEqual:](feeDetails, "isEqual:")) {
            goto LABEL_68;
          }
        }
        else if (feeDetails != v23)
        {
          goto LABEL_68;
        }
        interestDetails = self->_interestDetails;
        v25 = v6->_interestDetails;
        if (interestDetails && v25)
        {
          if (!-[PKPaymentOfferInstallmentInterestDetails isEqual:](interestDetails, "isEqual:")) {
            goto LABEL_68;
          }
        }
        else if (interestDetails != v25)
        {
          goto LABEL_68;
        }
        downpaymentDetails = self->_downpaymentDetails;
        v27 = v6->_downpaymentDetails;
        if (downpaymentDetails && v27)
        {
          if (!-[PKPaymentOfferInstallmentDownpaymentDetails isEqual:](downpaymentDetails, "isEqual:")) {
            goto LABEL_68;
          }
        }
        else if (downpaymentDetails != v27)
        {
          goto LABEL_68;
        }
        serviceProviderData = self->_serviceProviderData;
        v29 = v6->_serviceProviderData;
        if (serviceProviderData && v29)
        {
          if ((-[NSDictionary isEqual:](serviceProviderData, "isEqual:") & 1) == 0) {
            goto LABEL_68;
          }
        }
        else if (serviceProviderData != v29)
        {
          goto LABEL_68;
        }
        dynamicContent = self->_dynamicContent;
        v31 = v6->_dynamicContent;
        if (dynamicContent && v31)
        {
          if (-[PKPaymentOfferDynamicContent isEqual:](dynamicContent, "isEqual:")) {
            goto LABEL_63;
          }
        }
        else if (dynamicContent == v31)
        {
LABEL_63:
          preferredLanguage = self->_preferredLanguage;
          v33 = v6->_preferredLanguage;
          uint64_t v8 = preferredLanguage;
          objc_super v34 = v33;
          if (v8 == v34)
          {
            LOBYTE(v11) = 1;
            uint64_t v10 = v8;
          }
          else
          {
            uint64_t v10 = v34;
            LOBYTE(v11) = 0;
            if (v8 && v34) {
              LOBYTE(v11) = [(NSString *)v8 isEqualToString:v34];
            }
          }
          goto LABEL_70;
        }
LABEL_68:
        LOBYTE(v11) = 0;
LABEL_71:

        goto LABEL_72;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_72:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_serviceProviderURL];
  [v3 safelyAddObject:self->_dueDate];
  [v3 safelyAddObject:self->_totalCost];
  [v3 safelyAddObject:self->_installmentAmount];
  [v3 safelyAddObject:self->_totalInterestAndFeesAmount];
  [v3 safelyAddObject:self->_feeDetails];
  [v3 safelyAddObject:self->_interestDetails];
  [v3 safelyAddObject:self->_downpaymentDetails];
  [v3 safelyAddObject:self->_serviceProviderData];
  [v3 safelyAddObject:self->_dynamicContent];
  [v3 safelyAddObject:self->_preferredLanguage];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_installmentCount - v4 + 32 * v4;
  unint64_t v6 = self->_installmentPeriod - v5 + 32 * v5;
  unint64_t v7 = self->_installmentInterval - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"serviceProviderURL: '%@'; ", self->_serviceProviderURL];
  [v3 appendFormat:@"dueDate: '%@'; ", self->_dueDate];
  [v3 appendFormat:@"totalCost: '%@'; ", self->_totalCost];
  [v3 appendFormat:@"totalInterestAndFeesAmount: '%@'; ", self->_totalInterestAndFeesAmount];
  [v3 appendFormat:@"installmentAmount: '%@'; ", self->_installmentAmount];
  objc_msgSend(v3, "appendFormat:", @"installmentCount: %ld; ", self->_installmentCount);
  uint64_t v4 = PKPaymentOfferPeriodToString(self->_installmentPeriod);
  [v3 appendFormat:@"installmentPeriod: '%@'; ", v4];

  objc_msgSend(v3, "appendFormat:", @"installmentInterval: %ld; ", self->_installmentInterval);
  [v3 appendFormat:@"feeDetails: '%@'; ", self->_feeDetails];
  [v3 appendFormat:@"interestDetails: '%@'; ", self->_interestDetails];
  [v3 appendFormat:@"downpaymentDetails: '%@'; ", self->_downpaymentDetails];
  [v3 appendFormat:@"serviceProviderData: '%@'; ", self->_serviceProviderData];
  [v3 appendFormat:@"dynamicContent: '%@'; ", self->_dynamicContent];
  [v3 appendFormat:@"preferredLanguage: '%@'; ", self->_preferredLanguage];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentAssessmentOffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentOfferInstallmentAssessmentOffer;
  int64_t v5 = [(PKPaymentOfferInstallmentAssessmentOffer *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProviderURL"];
    serviceProviderURL = v5->_serviceProviderURL;
    v5->_serviceProviderURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDate"];
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalCost"];
    totalCost = v5->_totalCost;
    v5->_totalCost = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentAmount"];
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKCurrencyAmount *)v14;

    v5->_installmentCount = [v4 decodeIntegerForKey:@"installmentCount"];
    v5->_installmentPeriod = [v4 decodeIntegerForKey:@"installmentPeriod"];
    v5->_installmentInterval = [v4 decodeIntegerForKey:@"installmentInterval"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feeDetails"];
    feeDetails = v5->_feeDetails;
    v5->_feeDetails = (PKPaymentOfferInstallmentFeeDetails *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downpaymentDetails"];
    downpaymentDetails = v5->_downpaymentDetails;
    v5->_downpaymentDetails = (PKPaymentOfferInstallmentDownpaymentDetails *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalInterestAndFeesAmount"];
    totalInterestAndFeesAmount = v5->_totalInterestAndFeesAmount;
    v5->_totalInterestAndFeesAmount = (PKCurrencyAmount *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestDetails"];
    interestDetails = v5->_interestDetails;
    v5->_interestDetails = (PKPaymentOfferInstallmentInterestDetails *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_msgSend(v24, "setWithObjects:", v25, v26, v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"serviceProviderData"];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dynamicContent"];
    dynamicContent = v5->_dynamicContent;
    v5->_dynamicContent = (PKPaymentOfferDynamicContent *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredLanguage"];
    preferredLanguage = v5->_preferredLanguage;
    v5->_preferredLanguage = (NSString *)v33;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_serviceProviderURL forKey:@"serviceProviderURL"];
  [v5 encodeObject:self->_dueDate forKey:@"dueDate"];
  [v5 encodeObject:self->_totalCost forKey:@"totalCost"];
  [v5 encodeObject:self->_installmentAmount forKey:@"installmentAmount"];
  [v5 encodeInteger:self->_installmentCount forKey:@"installmentCount"];
  [v5 encodeInteger:self->_installmentPeriod forKey:@"installmentPeriod"];
  [v5 encodeInteger:self->_installmentInterval forKey:@"installmentInterval"];
  [v5 encodeObject:self->_feeDetails forKey:@"feeDetails"];
  [v5 encodeObject:self->_downpaymentDetails forKey:@"downpaymentDetails"];
  [v5 encodeObject:self->_totalInterestAndFeesAmount forKey:@"totalInterestAndFeesAmount"];
  [v5 encodeObject:self->_interestDetails forKey:@"interestDetails"];
  [v5 encodeObject:self->_serviceProviderData forKey:@"serviceProviderData"];
  [v5 encodeObject:self->_dynamicContent forKey:@"dynamicContent"];
  [v5 encodeObject:self->_preferredLanguage forKey:@"preferredLanguage"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferInstallmentAssessmentOffer allocWithZone:](PKPaymentOfferInstallmentAssessmentOffer, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSURL *)self->_serviceProviderURL copyWithZone:a3];
  serviceProviderURL = v5->_serviceProviderURL;
  v5->_serviceProviderURL = (NSURL *)v8;

  uint64_t v10 = [(NSDate *)self->_dueDate copyWithZone:a3];
  dueDate = v5->_dueDate;
  v5->_dueDate = (NSDate *)v10;

  uint64_t v12 = [(PKCurrencyAmount *)self->_totalCost copyWithZone:a3];
  totalCost = v5->_totalCost;
  v5->_totalCost = v12;

  uint64_t v14 = [(PKCurrencyAmount *)self->_installmentAmount copyWithZone:a3];
  installmentAmount = v5->_installmentAmount;
  v5->_installmentAmount = v14;

  v5->_installmentCount = self->_installmentCount;
  v5->_installmentPeriod = self->_installmentPeriod;
  v5->_installmentInterval = self->_installmentInterval;
  uint64_t v16 = [(PKPaymentOfferInstallmentFeeDetails *)self->_feeDetails copyWithZone:a3];
  feeDetails = v5->_feeDetails;
  v5->_feeDetails = v16;

  uint64_t v18 = [(PKPaymentOfferInstallmentDownpaymentDetails *)self->_downpaymentDetails copyWithZone:a3];
  downpaymentDetails = v5->_downpaymentDetails;
  v5->_downpaymentDetails = v18;

  uint64_t v20 = [(PKCurrencyAmount *)self->_totalInterestAndFeesAmount copyWithZone:a3];
  totalInterestAndFeesAmount = v5->_totalInterestAndFeesAmount;
  v5->_totalInterestAndFeesAmount = v20;

  uint64_t v22 = [(PKPaymentOfferInstallmentInterestDetails *)self->_interestDetails copyWithZone:a3];
  interestDetails = v5->_interestDetails;
  v5->_interestDetails = v22;

  uint64_t v24 = [(NSDictionary *)self->_serviceProviderData copyWithZone:a3];
  serviceProviderData = v5->_serviceProviderData;
  v5->_serviceProviderData = (NSDictionary *)v24;

  uint64_t v26 = [(PKPaymentOfferDynamicContent *)self->_dynamicContent copyWithZone:a3];
  dynamicContent = v5->_dynamicContent;
  v5->_dynamicContent = v26;

  uint64_t v28 = [(NSString *)self->_preferredLanguage copyWithZone:a3];
  preferredLanguage = v5->_preferredLanguage;
  v5->_preferredLanguage = (NSString *)v28;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)serviceProviderURL
{
  return self->_serviceProviderURL;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (PKCurrencyAmount)totalCost
{
  return self->_totalCost;
}

- (int64_t)installmentCount
{
  return self->_installmentCount;
}

- (unint64_t)installmentPeriod
{
  return self->_installmentPeriod;
}

- (int64_t)installmentInterval
{
  return self->_installmentInterval;
}

- (PKCurrencyAmount)installmentAmount
{
  return self->_installmentAmount;
}

- (PKPaymentOfferInstallmentFeeDetails)feeDetails
{
  return self->_feeDetails;
}

- (PKPaymentOfferInstallmentInterestDetails)interestDetails
{
  return self->_interestDetails;
}

- (PKPaymentOfferInstallmentDownpaymentDetails)downpaymentDetails
{
  return self->_downpaymentDetails;
}

- (PKCurrencyAmount)totalInterestAndFeesAmount
{
  return self->_totalInterestAndFeesAmount;
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (PKPaymentOfferDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (void)setPreferredLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_totalInterestAndFeesAmount, 0);
  objc_storeStrong((id *)&self->_downpaymentDetails, 0);
  objc_storeStrong((id *)&self->_interestDetails, 0);
  objc_storeStrong((id *)&self->_feeDetails, 0);
  objc_storeStrong((id *)&self->_installmentAmount, 0);
  objc_storeStrong((id *)&self->_totalCost, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_serviceProviderURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end