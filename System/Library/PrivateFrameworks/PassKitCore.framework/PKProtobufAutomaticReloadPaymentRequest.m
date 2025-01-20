@interface PKProtobufAutomaticReloadPaymentRequest
- (BOOL)hasAutomaticPaymentBilling;
- (BOOL)hasBillingAgreement;
- (BOOL)hasManagementURL;
- (BOOL)hasPaymentDescription;
- (BOOL)hasTokenNotificationURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)billingAgreement;
- (NSString)managementURL;
- (NSString)paymentDescription;
- (NSString)tokenNotificationURL;
- (PKProtobufPaymentSummaryItem)automaticPaymentBilling;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutomaticPaymentBilling:(id)a3;
- (void)setBillingAgreement:(id)a3;
- (void)setManagementURL:(id)a3;
- (void)setPaymentDescription:(id)a3;
- (void)setTokenNotificationURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufAutomaticReloadPaymentRequest

- (BOOL)hasPaymentDescription
{
  return self->_paymentDescription != 0;
}

- (BOOL)hasAutomaticPaymentBilling
{
  return self->_automaticPaymentBilling != 0;
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
  v8.super_class = (Class)PKProtobufAutomaticReloadPaymentRequest;
  v4 = [(PKProtobufAutomaticReloadPaymentRequest *)&v8 description];
  v5 = [(PKProtobufAutomaticReloadPaymentRequest *)self dictionaryRepresentation];
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
  automaticPaymentBilling = self->_automaticPaymentBilling;
  if (automaticPaymentBilling)
  {
    v7 = [(PKProtobufPaymentSummaryItem *)automaticPaymentBilling dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"automaticPaymentBilling"];
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
  return PKProtobufAutomaticReloadPaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_automaticPaymentBilling)
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
  if (self->_automaticPaymentBilling)
  {
    objc_msgSend(v5, "setAutomaticPaymentBilling:");
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
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(PKProtobufPaymentSummaryItem *)self->_automaticPaymentBilling copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_billingAgreement copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_managementURL copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSString *)self->_tokenNotificationURL copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((paymentDescription = self->_paymentDescription, !((unint64_t)paymentDescription | v4[4]))
     || -[NSString isEqual:](paymentDescription, "isEqual:"))
    && ((automaticPaymentBilling = self->_automaticPaymentBilling, !((unint64_t)automaticPaymentBilling | v4[1]))
     || -[PKProtobufPaymentSummaryItem isEqual:](automaticPaymentBilling, "isEqual:"))
    && ((billingAgreement = self->_billingAgreement, !((unint64_t)billingAgreement | v4[2]))
     || -[NSString isEqual:](billingAgreement, "isEqual:"))
    && ((managementURL = self->_managementURL, !((unint64_t)managementURL | v4[3]))
     || -[NSString isEqual:](managementURL, "isEqual:")))
  {
    tokenNotificationURL = self->_tokenNotificationURL;
    if ((unint64_t)tokenNotificationURL | v4[5]) {
      char v10 = -[NSString isEqual:](tokenNotificationURL, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_paymentDescription hash];
  unint64_t v4 = [(PKProtobufPaymentSummaryItem *)self->_automaticPaymentBilling hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_billingAgreement hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_managementURL hash];
  return v6 ^ [(NSString *)self->_tokenNotificationURL hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v6 = a3;
  if (v6[4]) {
    -[PKProtobufAutomaticReloadPaymentRequest setPaymentDescription:](self, "setPaymentDescription:");
  }
  automaticPaymentBilling = self->_automaticPaymentBilling;
  uint64_t v5 = v6[1];
  if (automaticPaymentBilling)
  {
    if (v5) {
      -[PKProtobufPaymentSummaryItem mergeFrom:](automaticPaymentBilling, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[PKProtobufAutomaticReloadPaymentRequest setAutomaticPaymentBilling:](self, "setAutomaticPaymentBilling:");
  }
  if (v6[2]) {
    -[PKProtobufAutomaticReloadPaymentRequest setBillingAgreement:](self, "setBillingAgreement:");
  }
  if (v6[3]) {
    -[PKProtobufAutomaticReloadPaymentRequest setManagementURL:](self, "setManagementURL:");
  }
  if (v6[5]) {
    -[PKProtobufAutomaticReloadPaymentRequest setTokenNotificationURL:](self, "setTokenNotificationURL:");
  }
}

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(id)a3
{
}

- (PKProtobufPaymentSummaryItem)automaticPaymentBilling
{
  return self->_automaticPaymentBilling;
}

- (void)setAutomaticPaymentBilling:(id)a3
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
  objc_storeStrong((id *)&self->_tokenNotificationURL, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
  objc_storeStrong((id *)&self->_automaticPaymentBilling, 0);
}

@end