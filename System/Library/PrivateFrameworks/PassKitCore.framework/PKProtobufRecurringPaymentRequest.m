@interface PKProtobufRecurringPaymentRequest
- (BOOL)hasBillingAgreement;
- (BOOL)hasManagementURL;
- (BOOL)hasPaymentDescription;
- (BOOL)hasRegularBilling;
- (BOOL)hasTokenNotificationURL;
- (BOOL)hasTrialBilling;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)billingAgreement;
- (NSString)managementURL;
- (NSString)paymentDescription;
- (NSString)tokenNotificationURL;
- (PKProtobufPaymentSummaryItem)regularBilling;
- (PKProtobufPaymentSummaryItem)trialBilling;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBillingAgreement:(id)a3;
- (void)setManagementURL:(id)a3;
- (void)setPaymentDescription:(id)a3;
- (void)setRegularBilling:(id)a3;
- (void)setTokenNotificationURL:(id)a3;
- (void)setTrialBilling:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufRecurringPaymentRequest

- (BOOL)hasPaymentDescription
{
  return self->_paymentDescription != 0;
}

- (BOOL)hasRegularBilling
{
  return self->_regularBilling != 0;
}

- (BOOL)hasTrialBilling
{
  return self->_trialBilling != 0;
}

- (BOOL)hasBillingAgreement
{
  return self->_billingAgreement != 0;
}

- (BOOL)hasManagementURL
{
  return self->_managementURL != 0;
}

- (BOOL)hasTokenNotificationURL
{
  return self->_tokenNotificationURL != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufRecurringPaymentRequest;
  v4 = [(PKProtobufRecurringPaymentRequest *)&v8 description];
  v5 = [(PKProtobufRecurringPaymentRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  paymentDescription = self->_paymentDescription;
  if (paymentDescription) {
    [v3 setObject:paymentDescription forKey:@"paymentDescription"];
  }
  regularBilling = self->_regularBilling;
  if (regularBilling)
  {
    v7 = [(PKProtobufPaymentSummaryItem *)regularBilling dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"regularBilling"];
  }
  trialBilling = self->_trialBilling;
  if (trialBilling)
  {
    v9 = [(PKProtobufPaymentSummaryItem *)trialBilling dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"trialBilling"];
  }
  billingAgreement = self->_billingAgreement;
  if (billingAgreement) {
    [v4 setObject:billingAgreement forKey:@"billingAgreement"];
  }
  managementURL = self->_managementURL;
  if (managementURL) {
    [v4 setObject:managementURL forKey:@"managementURL"];
  }
  tokenNotificationURL = self->_tokenNotificationURL;
  if (tokenNotificationURL) {
    [v4 setObject:tokenNotificationURL forKey:@"tokenNotificationURL"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRecurringPaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_paymentDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_regularBilling)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_trialBilling)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_billingAgreement)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_managementURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_tokenNotificationURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_paymentDescription)
  {
    objc_msgSend(v4, "setPaymentDescription:");
    id v4 = v5;
  }
  if (self->_regularBilling)
  {
    objc_msgSend(v5, "setRegularBilling:");
    id v4 = v5;
  }
  if (self->_trialBilling)
  {
    objc_msgSend(v5, "setTrialBilling:");
    id v4 = v5;
  }
  if (self->_billingAgreement)
  {
    objc_msgSend(v5, "setBillingAgreement:");
    id v4 = v5;
  }
  if (self->_managementURL)
  {
    objc_msgSend(v5, "setManagementURL:");
    id v4 = v5;
  }
  if (self->_tokenNotificationURL)
  {
    objc_msgSend(v5, "setTokenNotificationURL:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_paymentDescription copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(PKProtobufPaymentSummaryItem *)self->_regularBilling copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(PKProtobufPaymentSummaryItem *)self->_trialBilling copyWithZone:a3];
  v11 = (void *)v5[6];
  v5[6] = v10;

  uint64_t v12 = [(NSString *)self->_billingAgreement copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  uint64_t v14 = [(NSString *)self->_managementURL copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  uint64_t v16 = [(NSString *)self->_tokenNotificationURL copyWithZone:a3];
  v17 = (void *)v5[5];
  v5[5] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((paymentDescription = self->_paymentDescription, !((unint64_t)paymentDescription | v4[3]))
     || -[NSString isEqual:](paymentDescription, "isEqual:"))
    && ((regularBilling = self->_regularBilling, !((unint64_t)regularBilling | v4[4]))
     || -[PKProtobufPaymentSummaryItem isEqual:](regularBilling, "isEqual:"))
    && ((trialBilling = self->_trialBilling, !((unint64_t)trialBilling | v4[6]))
     || -[PKProtobufPaymentSummaryItem isEqual:](trialBilling, "isEqual:"))
    && ((billingAgreement = self->_billingAgreement, !((unint64_t)billingAgreement | v4[1]))
     || -[NSString isEqual:](billingAgreement, "isEqual:"))
    && ((managementURL = self->_managementURL, !((unint64_t)managementURL | v4[2]))
     || -[NSString isEqual:](managementURL, "isEqual:")))
  {
    tokenNotificationURL = self->_tokenNotificationURL;
    if ((unint64_t)tokenNotificationURL | v4[5]) {
      char v11 = -[NSString isEqual:](tokenNotificationURL, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_paymentDescription hash];
  unint64_t v4 = [(PKProtobufPaymentSummaryItem *)self->_regularBilling hash] ^ v3;
  unint64_t v5 = [(PKProtobufPaymentSummaryItem *)self->_trialBilling hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_billingAgreement hash];
  NSUInteger v7 = [(NSString *)self->_managementURL hash];
  return v6 ^ v7 ^ [(NSString *)self->_tokenNotificationURL hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  if (v8[3]) {
    -[PKProtobufRecurringPaymentRequest setPaymentDescription:](self, "setPaymentDescription:");
  }
  regularBilling = self->_regularBilling;
  uint64_t v5 = v8[4];
  if (regularBilling)
  {
    if (v5) {
      -[PKProtobufPaymentSummaryItem mergeFrom:](regularBilling, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[PKProtobufRecurringPaymentRequest setRegularBilling:](self, "setRegularBilling:");
  }
  trialBilling = self->_trialBilling;
  uint64_t v7 = v8[6];
  if (trialBilling)
  {
    if (v7) {
      -[PKProtobufPaymentSummaryItem mergeFrom:](trialBilling, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PKProtobufRecurringPaymentRequest setTrialBilling:](self, "setTrialBilling:");
  }
  if (v8[1]) {
    -[PKProtobufRecurringPaymentRequest setBillingAgreement:](self, "setBillingAgreement:");
  }
  if (v8[2]) {
    -[PKProtobufRecurringPaymentRequest setManagementURL:](self, "setManagementURL:");
  }
  if (v8[5]) {
    -[PKProtobufRecurringPaymentRequest setTokenNotificationURL:](self, "setTokenNotificationURL:");
  }
}

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(id)a3
{
}

- (PKProtobufPaymentSummaryItem)regularBilling
{
  return self->_regularBilling;
}

- (void)setRegularBilling:(id)a3
{
}

- (PKProtobufPaymentSummaryItem)trialBilling
{
  return self->_trialBilling;
}

- (void)setTrialBilling:(id)a3
{
}

- (NSString)billingAgreement
{
  return self->_billingAgreement;
}

- (void)setBillingAgreement:(id)a3
{
}

- (NSString)managementURL
{
  return self->_managementURL;
}

- (void)setManagementURL:(id)a3
{
}

- (NSString)tokenNotificationURL
{
  return self->_tokenNotificationURL;
}

- (void)setTokenNotificationURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialBilling, 0);
  objc_storeStrong((id *)&self->_tokenNotificationURL, 0);
  objc_storeStrong((id *)&self->_regularBilling, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
}

@end