@interface PKProtobufDeferredPaymentRequest
- (BOOL)hasBillingAgreement;
- (BOOL)hasDeferredBilling;
- (BOOL)hasFreeCancellationDate;
- (BOOL)hasFreeCancellationDateTimeZone;
- (BOOL)hasManagementURL;
- (BOOL)hasPaymentDescription;
- (BOOL)hasTokenNotificationURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)billingAgreement;
- (NSString)freeCancellationDateTimeZone;
- (NSString)managementURL;
- (NSString)paymentDescription;
- (NSString)tokenNotificationURL;
- (PKProtobufPaymentSummaryItem)deferredBilling;
- (double)freeCancellationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBillingAgreement:(id)a3;
- (void)setDeferredBilling:(id)a3;
- (void)setFreeCancellationDate:(double)a3;
- (void)setFreeCancellationDateTimeZone:(id)a3;
- (void)setHasFreeCancellationDate:(BOOL)a3;
- (void)setManagementURL:(id)a3;
- (void)setPaymentDescription:(id)a3;
- (void)setTokenNotificationURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufDeferredPaymentRequest

- (BOOL)hasPaymentDescription
{
  return self->_paymentDescription != 0;
}

- (BOOL)hasDeferredBilling
{
  return self->_deferredBilling != 0;
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

- (void)setFreeCancellationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_freeCancellationDate = a3;
}

- (void)setHasFreeCancellationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFreeCancellationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasFreeCancellationDateTimeZone
{
  return self->_freeCancellationDateTimeZone != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufDeferredPaymentRequest;
  v4 = [(PKProtobufDeferredPaymentRequest *)&v8 description];
  v5 = [(PKProtobufDeferredPaymentRequest *)self dictionaryRepresentation];
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
  deferredBilling = self->_deferredBilling;
  if (deferredBilling)
  {
    v7 = [(PKProtobufPaymentSummaryItem *)deferredBilling dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"deferredBilling"];
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
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithDouble:self->_freeCancellationDate];
    [v4 setObject:v11 forKey:@"freeCancellationDate"];
  }
  freeCancellationDateTimeZone = self->_freeCancellationDateTimeZone;
  if (freeCancellationDateTimeZone) {
    [v4 setObject:freeCancellationDateTimeZone forKey:@"freeCancellationDateTimeZone"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufDeferredPaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_deferredBilling)
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_freeCancellationDateTimeZone)
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
  if (self->_deferredBilling)
  {
    objc_msgSend(v5, "setDeferredBilling:");
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
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_freeCancellationDate;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_freeCancellationDateTimeZone)
  {
    objc_msgSend(v5, "setFreeCancellationDateTimeZone:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_paymentDescription copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  id v8 = [(PKProtobufPaymentSummaryItem *)self->_deferredBilling copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_billingAgreement copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_managementURL copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_tokenNotificationURL copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_freeCancellationDate;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v16 = [(NSString *)self->_freeCancellationDateTimeZone copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  paymentDescription = self->_paymentDescription;
  if ((unint64_t)paymentDescription | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](paymentDescription, "isEqual:")) {
      goto LABEL_19;
    }
  }
  deferredBilling = self->_deferredBilling;
  if ((unint64_t)deferredBilling | *((void *)v4 + 3))
  {
    if (!-[PKProtobufPaymentSummaryItem isEqual:](deferredBilling, "isEqual:")) {
      goto LABEL_19;
    }
  }
  billingAgreement = self->_billingAgreement;
  if ((unint64_t)billingAgreement | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](billingAgreement, "isEqual:")) {
      goto LABEL_19;
    }
  }
  managementURL = self->_managementURL;
  if ((unint64_t)managementURL | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](managementURL, "isEqual:")) {
      goto LABEL_19;
    }
  }
  tokenNotificationURL = self->_tokenNotificationURL;
  if ((unint64_t)tokenNotificationURL | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](tokenNotificationURL, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_freeCancellationDate != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  freeCancellationDateTimeZone = self->_freeCancellationDateTimeZone;
  if ((unint64_t)freeCancellationDateTimeZone | *((void *)v4 + 4)) {
    char v11 = -[NSString isEqual:](freeCancellationDateTimeZone, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_paymentDescription hash];
  unint64_t v4 = [(PKProtobufPaymentSummaryItem *)self->_deferredBilling hash];
  NSUInteger v5 = [(NSString *)self->_billingAgreement hash];
  NSUInteger v6 = [(NSString *)self->_managementURL hash];
  NSUInteger v7 = [(NSString *)self->_tokenNotificationURL hash];
  if (*(unsigned char *)&self->_has)
  {
    double freeCancellationDate = self->_freeCancellationDate;
    double v10 = -freeCancellationDate;
    if (freeCancellationDate >= 0.0) {
      double v10 = self->_freeCancellationDate;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_freeCancellationDateTimeZone hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  NSUInteger v7 = v4;
  if (*((void *)v4 + 6))
  {
    -[PKProtobufDeferredPaymentRequest setPaymentDescription:](self, "setPaymentDescription:");
    unint64_t v4 = v7;
  }
  deferredBilling = self->_deferredBilling;
  uint64_t v6 = *((void *)v4 + 3);
  if (deferredBilling)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PKProtobufPaymentSummaryItem mergeFrom:](deferredBilling, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PKProtobufDeferredPaymentRequest setDeferredBilling:](self, "setDeferredBilling:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (*((void *)v4 + 2))
  {
    -[PKProtobufDeferredPaymentRequest setBillingAgreement:](self, "setBillingAgreement:");
    unint64_t v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[PKProtobufDeferredPaymentRequest setManagementURL:](self, "setManagementURL:");
    unint64_t v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[PKProtobufDeferredPaymentRequest setTokenNotificationURL:](self, "setTokenNotificationURL:");
    unint64_t v4 = v7;
  }
  if ((_BYTE)v4[8])
  {
    self->_double freeCancellationDate = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[PKProtobufDeferredPaymentRequest setFreeCancellationDateTimeZone:](self, "setFreeCancellationDateTimeZone:");
    unint64_t v4 = v7;
  }
}

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(id)a3
{
}

- (PKProtobufPaymentSummaryItem)deferredBilling
{
  return self->_deferredBilling;
}

- (void)setDeferredBilling:(id)a3
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

- (double)freeCancellationDate
{
  return self->_freeCancellationDate;
}

- (NSString)freeCancellationDateTimeZone
{
  return self->_freeCancellationDateTimeZone;
}

- (void)setFreeCancellationDateTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenNotificationURL, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_freeCancellationDateTimeZone, 0);
  objc_storeStrong((id *)&self->_deferredBilling, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
}

@end