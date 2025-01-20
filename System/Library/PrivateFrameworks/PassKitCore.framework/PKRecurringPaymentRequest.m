@interface PKRecurringPaymentRequest
+ (BOOL)supportsSecureCoding;
+ (PKRecurringPaymentRequest)recurringPaymentRequestWithProtobuf:(id)a3;
+ (int64_t)version;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecurringPaymentRequest:(id)a3;
- (NSString)billingAgreement;
- (NSString)paymentDescription;
- (NSURL)managementURL;
- (NSURL)tokenNotificationURL;
- (PKRecurringPaymentRequest)initWithCoder:(id)a3;
- (PKRecurringPaymentRequest)initWithDictionary:(id)a3 error:(id *)a4;
- (PKRecurringPaymentRequest)initWithPaymentDescription:(NSString *)paymentDescription regularBilling:(PKRecurringPaymentSummaryItem *)regularBilling managementURL:(NSURL *)managementURL;
- (PKRecurringPaymentSummaryItem)regularBilling;
- (PKRecurringPaymentSummaryItem)trialBilling;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)protobuf;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)sanitize;
- (void)setBillingAgreement:(NSString *)billingAgreement;
- (void)setManagementURL:(NSURL *)managementURL;
- (void)setPaymentDescription:(NSString *)paymentDescription;
- (void)setRegularBilling:(PKRecurringPaymentSummaryItem *)regularBilling;
- (void)setTokenNotificationURL:(NSURL *)tokenNotificationURL;
- (void)setTrialBilling:(PKRecurringPaymentSummaryItem *)trialBilling;
@end

@implementation PKRecurringPaymentRequest

+ (PKRecurringPaymentRequest)recurringPaymentRequestWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = [v3 paymentDescription];
  v5 = [v3 regularBilling];
  v6 = +[PKPaymentSummaryItem itemWithProtobuf:v5];

  v7 = (void *)MEMORY[0x1E4F1CB10];
  v8 = [v3 managementURL];
  v9 = [v7 URLWithString:v8];

  v10 = [[PKRecurringPaymentRequest alloc] initWithPaymentDescription:v4 regularBilling:v6 managementURL:v9];
  if ([v3 hasTrialBilling])
  {
    v11 = [v3 trialBilling];
    v12 = +[PKPaymentSummaryItem itemWithProtobuf:v11];

    [(PKRecurringPaymentRequest *)v10 setTrialBilling:v12];
  }
  if ([v3 hasBillingAgreement])
  {
    v13 = [v3 billingAgreement];
    [(PKRecurringPaymentRequest *)v10 setBillingAgreement:v13];
  }
  if ([v3 hasTokenNotificationURL])
  {
    v14 = (void *)MEMORY[0x1E4F1CB10];
    v15 = [v3 tokenNotificationURL];
    v16 = [v14 URLWithString:v15];
    [(PKRecurringPaymentRequest *)v10 setTokenNotificationURL:v16];
  }
  return v10;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufRecurringPaymentRequest);
  v4 = [(PKRecurringPaymentRequest *)self paymentDescription];
  [(PKProtobufRecurringPaymentRequest *)v3 setPaymentDescription:v4];

  v5 = [(PKRecurringPaymentRequest *)self regularBilling];
  v6 = [v5 summaryItemProtobuf];
  [(PKProtobufRecurringPaymentRequest *)v3 setRegularBilling:v6];

  v7 = [(PKRecurringPaymentRequest *)self managementURL];
  v8 = [v7 absoluteString];
  [(PKProtobufRecurringPaymentRequest *)v3 setManagementURL:v8];

  v9 = [(PKRecurringPaymentRequest *)self trialBilling];

  if (v9)
  {
    v10 = [(PKRecurringPaymentRequest *)self trialBilling];
    v11 = [v10 summaryItemProtobuf];
    [(PKProtobufRecurringPaymentRequest *)v3 setTrialBilling:v11];
  }
  v12 = [(PKRecurringPaymentRequest *)self billingAgreement];

  if (v12)
  {
    v13 = [(PKRecurringPaymentRequest *)self billingAgreement];
    [(PKProtobufRecurringPaymentRequest *)v3 setBillingAgreement:v13];
  }
  v14 = [(PKRecurringPaymentRequest *)self tokenNotificationURL];

  if (v14)
  {
    v15 = [(PKRecurringPaymentRequest *)self tokenNotificationURL];
    v16 = [v15 absoluteString];
    [(PKProtobufRecurringPaymentRequest *)v3 setManagementURL:v16];
  }
  return v3;
}

- (PKRecurringPaymentRequest)initWithPaymentDescription:(NSString *)paymentDescription regularBilling:(PKRecurringPaymentSummaryItem *)regularBilling managementURL:(NSURL *)managementURL
{
  v8 = paymentDescription;
  v9 = regularBilling;
  v10 = managementURL;
  v19.receiver = self;
  v19.super_class = (Class)PKRecurringPaymentRequest;
  v11 = [(PKRecurringPaymentRequest *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(NSString *)v8 copy];
    v13 = v11->_paymentDescription;
    v11->_paymentDescription = (NSString *)v12;

    uint64_t v14 = [(PKRecurringPaymentSummaryItem *)v9 copy];
    v15 = v11->_regularBilling;
    v11->_regularBilling = (PKRecurringPaymentSummaryItem *)v14;

    uint64_t v16 = [(NSURL *)v10 copy];
    v17 = v11->_managementURL;
    v11->_managementURL = (NSURL *)v16;
  }
  return v11;
}

+ (int64_t)version
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(NSString *)self->_paymentDescription copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PKRecurringPaymentSummaryItem *)self->_regularBilling copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(PKRecurringPaymentSummaryItem *)self->_trialBilling copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_billingAgreement copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSURL *)self->_managementURL copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSURL *)self->_tokenNotificationURL copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  return v5;
}

- (PKRecurringPaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKRecurringPaymentRequest;
  v5 = [(PKRecurringPaymentRequest *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentDescription"];
    paymentDescription = v5->_paymentDescription;
    v5->_paymentDescription = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regularBilling"];
    regularBilling = v5->_regularBilling;
    v5->_regularBilling = (PKRecurringPaymentSummaryItem *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trialBilling"];
    trialBilling = v5->_trialBilling;
    v5->_trialBilling = (PKRecurringPaymentSummaryItem *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingAgreement"];
    billingAgreement = v5->_billingAgreement;
    v5->_billingAgreement = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managementURL"];
    managementURL = v5->_managementURL;
    v5->_managementURL = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenNotificationURL"];
    tokenNotificationURL = v5->_tokenNotificationURL;
    v5->_tokenNotificationURL = (NSURL *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  paymentDescription = self->_paymentDescription;
  id v5 = a3;
  [v5 encodeObject:paymentDescription forKey:@"paymentDescription"];
  [v5 encodeObject:self->_regularBilling forKey:@"regularBilling"];
  [v5 encodeObject:self->_trialBilling forKey:@"trialBilling"];
  [v5 encodeObject:self->_billingAgreement forKey:@"billingAgreement"];
  [v5 encodeObject:self->_managementURL forKey:@"managementURL"];
  [v5 encodeObject:self->_tokenNotificationURL forKey:@"tokenNotificationURL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"paymentDescription: %@, ", self->_paymentDescription];
  [v3 appendFormat:@"regularBilling: %@, ", self->_regularBilling];
  if (self->_trialBilling) {
    [v3 appendFormat:@"trialBilling: %@, ", self->_trialBilling];
  }
  if (self->_billingAgreement) {
    [v3 appendFormat:@"billingAgreement: %@, ", self->_billingAgreement];
  }
  [v3 appendFormat:@"managementURL: %@, ", self->_managementURL];
  if (self->_tokenNotificationURL) {
    [v3 appendFormat:@"tokenNotificationURL: %@, ", self->_tokenNotificationURL];
  }
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_paymentDescription];
  [v3 safelyAddObject:self->_regularBilling];
  [v3 safelyAddObject:self->_trialBilling];
  [v3 safelyAddObject:self->_billingAgreement];
  [v3 safelyAddObject:self->_managementURL];
  [v3 safelyAddObject:self->_tokenNotificationURL];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKRecurringPaymentRequest *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKRecurringPaymentRequest *)self isEqualToRecurringPaymentRequest:v5];

  return v6;
}

- (BOOL)isEqualToRecurringPaymentRequest:(id)a3
{
  unint64_t v4 = a3;
  id v5 = (void *)v4[1];
  BOOL v6 = self->_paymentDescription;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_7;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_20;
    }
  }
  regularBilling = self->_regularBilling;
  uint64_t v12 = (PKRecurringPaymentSummaryItem *)v4[2];
  if (regularBilling && v12)
  {
    if (!-[PKRecurringPaymentSummaryItem isEqual:](regularBilling, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (regularBilling != v12)
  {
    goto LABEL_20;
  }
  trialBilling = self->_trialBilling;
  uint64_t v14 = (PKRecurringPaymentSummaryItem *)v4[3];
  if (trialBilling && v14)
  {
    if (!-[PKRecurringPaymentSummaryItem isEqual:](trialBilling, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (trialBilling != v14)
  {
    goto LABEL_20;
  }
  v17 = (void *)v4[4];
  BOOL v6 = self->_billingAgreement;
  v18 = v17;
  if (v6 == v18)
  {

    goto LABEL_28;
  }
  uint64_t v8 = v18;
  if (!v6 || !v18)
  {
LABEL_7:

    goto LABEL_20;
  }
  BOOL v19 = [(NSString *)v6 isEqualToString:v18];

  if (!v19) {
    goto LABEL_20;
  }
LABEL_28:
  managementURL = self->_managementURL;
  v21 = (NSURL *)v4[5];
  if (managementURL && v21)
  {
    if (-[NSURL isEqual:](managementURL, "isEqual:")) {
      goto LABEL_33;
    }
LABEL_20:
    char v15 = 0;
    goto LABEL_21;
  }
  if (managementURL != v21) {
    goto LABEL_20;
  }
LABEL_33:
  tokenNotificationURL = self->_tokenNotificationURL;
  v23 = (NSURL *)v4[6];
  if (tokenNotificationURL && v23) {
    char v15 = -[NSURL isEqual:](tokenNotificationURL, "isEqual:");
  }
  else {
    char v15 = tokenNotificationURL == v23;
  }
LABEL_21:

  return v15;
}

- (void)sanitize
{
  id v3 = [(NSString *)self->_billingAgreement pk_merchantTokensSanitizedBillingAgreement];
  billingAgreement = self->_billingAgreement;
  self->_billingAgreement = v3;
}

- (PKRecurringPaymentRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = [(PKRecurringPaymentRequest *)self init];
  if (v6)
  {
    uint64_t v7 = [v5 PKStringForKey:@"paymentDescription"];
    paymentDescription = v6->_paymentDescription;
    v6->_paymentDescription = (NSString *)v7;

    BOOL v9 = [v5 PKDictionaryForKey:@"regularBilling"];
    if (v9)
    {
      BOOL v10 = [[PKRecurringPaymentSummaryItem alloc] initWithDictionary:v9 error:0];
      regularBilling = v6->_regularBilling;
      v6->_regularBilling = v10;
    }
    uint64_t v12 = [v5 PKDictionaryForKey:@"trialBilling"];
    if (v12)
    {
      v13 = [[PKRecurringPaymentSummaryItem alloc] initWithDictionary:v12 error:0];
      trialBilling = v6->_trialBilling;
      v6->_trialBilling = v13;
    }
    uint64_t v15 = [v5 PKStringForKey:@"billingAgreement"];
    billingAgreement = v6->_billingAgreement;
    v6->_billingAgreement = (NSString *)v15;

    uint64_t v17 = [v5 PKURLForKey:@"managementURL"];
    managementURL = v6->_managementURL;
    v6->_managementURL = (NSURL *)v17;

    uint64_t v19 = [v5 PKURLForKey:@"tokenNotificationURL"];
    tokenNotificationURL = v6->_tokenNotificationURL;
    v6->_tokenNotificationURL = (NSURL *)v19;
  }
  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v4 = v3;
  paymentDescription = self->_paymentDescription;
  if (paymentDescription) {
    [v3 setObject:paymentDescription forKeyedSubscript:@"paymentDescription"];
  }
  regularBilling = self->_regularBilling;
  if (regularBilling)
  {
    uint64_t v7 = [(PKRecurringPaymentSummaryItem *)regularBilling dictionaryRepresentation];
    [v4 setObject:v7 forKeyedSubscript:@"regularBilling"];
  }
  trialBilling = self->_trialBilling;
  if (trialBilling)
  {
    BOOL v9 = [(PKRecurringPaymentSummaryItem *)trialBilling dictionaryRepresentation];
    [v4 setObject:v9 forKeyedSubscript:@"trialBilling"];
  }
  billingAgreement = self->_billingAgreement;
  if (billingAgreement) {
    [v4 setObject:billingAgreement forKeyedSubscript:@"billingAgreement"];
  }
  managementURL = self->_managementURL;
  if (managementURL)
  {
    uint64_t v12 = [(NSURL *)managementURL absoluteString];
    [v4 setObject:v12 forKeyedSubscript:@"managementURL"];
  }
  tokenNotificationURL = self->_tokenNotificationURL;
  if (tokenNotificationURL)
  {
    uint64_t v14 = [(NSURL *)tokenNotificationURL absoluteString];
    [v4 setObject:v14 forKeyedSubscript:@"tokenNotificationURL"];
  }
  uint64_t v15 = (void *)[v4 copy];

  return v15;
}

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(NSString *)paymentDescription
{
}

- (PKRecurringPaymentSummaryItem)regularBilling
{
  return self->_regularBilling;
}

- (void)setRegularBilling:(PKRecurringPaymentSummaryItem *)regularBilling
{
}

- (PKRecurringPaymentSummaryItem)trialBilling
{
  return self->_trialBilling;
}

- (void)setTrialBilling:(PKRecurringPaymentSummaryItem *)trialBilling
{
}

- (NSString)billingAgreement
{
  return self->_billingAgreement;
}

- (void)setBillingAgreement:(NSString *)billingAgreement
{
}

- (NSURL)managementURL
{
  return self->_managementURL;
}

- (void)setManagementURL:(NSURL *)managementURL
{
}

- (NSURL)tokenNotificationURL
{
  return self->_tokenNotificationURL;
}

- (void)setTokenNotificationURL:(NSURL *)tokenNotificationURL
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenNotificationURL, 0);
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
  objc_storeStrong((id *)&self->_trialBilling, 0);
  objc_storeStrong((id *)&self->_regularBilling, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
}

@end