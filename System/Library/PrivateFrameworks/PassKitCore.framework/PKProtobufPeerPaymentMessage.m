@interface PKProtobufPeerPaymentMessage
- (BOOL)hasAmount;
- (BOOL)hasCurrency;
- (BOOL)hasDecimalAmount;
- (BOOL)hasIdentifier;
- (BOOL)hasLocalData;
- (BOOL)hasMemo;
- (BOOL)hasPaymentIdentifier;
- (BOOL)hasRecipientAddress;
- (BOOL)hasRecurringPaymentColor;
- (BOOL)hasRecurringPaymentEmoji;
- (BOOL)hasRecurringPaymentFrequency;
- (BOOL)hasRecurringPaymentIdentifier;
- (BOOL)hasRecurringPaymentStartDate;
- (BOOL)hasRequestDeviceScoreIdentifier;
- (BOOL)hasRequestToken;
- (BOOL)hasSenderAddress;
- (BOOL)hasTransactionIdentifier;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)localData;
- (NSString)currency;
- (NSString)identifier;
- (NSString)memo;
- (NSString)paymentIdentifier;
- (NSString)recipientAddress;
- (NSString)recurringPaymentColor;
- (NSString)recurringPaymentEmoji;
- (NSString)recurringPaymentFrequency;
- (NSString)recurringPaymentIdentifier;
- (NSString)requestDeviceScoreIdentifier;
- (NSString)requestToken;
- (NSString)senderAddress;
- (NSString)transactionIdentifier;
- (PKProtobufNSDecimalNumber)decimalAmount;
- (double)recurringPaymentStartDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)amount;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmount:(int64_t)a3;
- (void)setCurrency:(id)a3;
- (void)setDecimalAmount:(id)a3;
- (void)setHasAmount:(BOOL)a3;
- (void)setHasRecurringPaymentStartDate:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalData:(id)a3;
- (void)setMemo:(id)a3;
- (void)setPaymentIdentifier:(id)a3;
- (void)setRecipientAddress:(id)a3;
- (void)setRecurringPaymentColor:(id)a3;
- (void)setRecurringPaymentEmoji:(id)a3;
- (void)setRecurringPaymentFrequency:(id)a3;
- (void)setRecurringPaymentIdentifier:(id)a3;
- (void)setRecurringPaymentStartDate:(double)a3;
- (void)setRequestDeviceScoreIdentifier:(id)a3;
- (void)setRequestToken:(id)a3;
- (void)setSenderAddress:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setType:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPeerPaymentMessage

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E56E0338[a3];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PAYMENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REQUEST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RECURRING_PAYMENT"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCurrency
{
  return self->_currency != 0;
}

- (void)setAmount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_amount = a3;
}

- (void)setHasAmount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAmount
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDecimalAmount
{
  return self->_decimalAmount != 0;
}

- (BOOL)hasSenderAddress
{
  return self->_senderAddress != 0;
}

- (BOOL)hasRecipientAddress
{
  return self->_recipientAddress != 0;
}

- (BOOL)hasRequestToken
{
  return self->_requestToken != 0;
}

- (BOOL)hasPaymentIdentifier
{
  return self->_paymentIdentifier != 0;
}

- (BOOL)hasTransactionIdentifier
{
  return self->_transactionIdentifier != 0;
}

- (BOOL)hasMemo
{
  return self->_memo != 0;
}

- (BOOL)hasRequestDeviceScoreIdentifier
{
  return self->_requestDeviceScoreIdentifier != 0;
}

- (BOOL)hasRecurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier != 0;
}

- (BOOL)hasRecurringPaymentEmoji
{
  return self->_recurringPaymentEmoji != 0;
}

- (BOOL)hasRecurringPaymentColor
{
  return self->_recurringPaymentColor != 0;
}

- (void)setRecurringPaymentStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recurringPaymentStartDate = a3;
}

- (void)setHasRecurringPaymentStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecurringPaymentStartDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasRecurringPaymentFrequency
{
  return self->_recurringPaymentFrequency != 0;
}

- (BOOL)hasLocalData
{
  return self->_localData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPeerPaymentMessage;
  int v4 = [(PKProtobufPeerPaymentMessage *)&v8 description];
  v5 = [(PKProtobufPeerPaymentMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E56E0338[type];
    }
    [v3 setObject:v7 forKey:@"type"];
  }
  currency = self->_currency;
  if (currency) {
    [v3 setObject:currency forKey:@"currency"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithLongLong:self->_amount];
    [v3 setObject:v9 forKey:@"amount"];
  }
  decimalAmount = self->_decimalAmount;
  if (decimalAmount)
  {
    v11 = [(PKProtobufNSDecimalNumber *)decimalAmount dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"decimal_amount"];
  }
  senderAddress = self->_senderAddress;
  if (senderAddress) {
    [v3 setObject:senderAddress forKey:@"senderAddress"];
  }
  recipientAddress = self->_recipientAddress;
  if (recipientAddress) {
    [v3 setObject:recipientAddress forKey:@"recipientAddress"];
  }
  requestToken = self->_requestToken;
  if (requestToken) {
    [v3 setObject:requestToken forKey:@"requestToken"];
  }
  paymentIdentifier = self->_paymentIdentifier;
  if (paymentIdentifier) {
    [v3 setObject:paymentIdentifier forKey:@"paymentIdentifier"];
  }
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier) {
    [v3 setObject:transactionIdentifier forKey:@"transactionIdentifier"];
  }
  memo = self->_memo;
  if (memo) {
    [v3 setObject:memo forKey:@"memo"];
  }
  requestDeviceScoreIdentifier = self->_requestDeviceScoreIdentifier;
  if (requestDeviceScoreIdentifier) {
    [v3 setObject:requestDeviceScoreIdentifier forKey:@"requestDeviceScoreIdentifier"];
  }
  recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
  if (recurringPaymentIdentifier) {
    [v3 setObject:recurringPaymentIdentifier forKey:@"recurringPaymentIdentifier"];
  }
  recurringPaymentEmoji = self->_recurringPaymentEmoji;
  if (recurringPaymentEmoji) {
    [v3 setObject:recurringPaymentEmoji forKey:@"recurringPaymentEmoji"];
  }
  recurringPaymentColor = self->_recurringPaymentColor;
  if (recurringPaymentColor) {
    [v3 setObject:recurringPaymentColor forKey:@"recurringPaymentColor"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v22 = [NSNumber numberWithDouble:self->_recurringPaymentStartDate];
    [v3 setObject:v22 forKey:@"recurringPaymentStartDate"];
  }
  recurringPaymentFrequency = self->_recurringPaymentFrequency;
  if (recurringPaymentFrequency) {
    [v3 setObject:recurringPaymentFrequency forKey:@"recurringPaymentFrequency"];
  }
  localData = self->_localData;
  if (localData) {
    [v3 setObject:localData forKey:@"localData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPeerPaymentMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v4 = v5;
  if (self->_currency)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteSint64Field();
    int v4 = v5;
  }
  if (self->_senderAddress)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_recipientAddress)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_requestToken)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_paymentIdentifier)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_transactionIdentifier)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_memo)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_requestDeviceScoreIdentifier)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_recurringPaymentIdentifier)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_recurringPaymentEmoji)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_recurringPaymentColor)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    int v4 = v5;
  }
  if (self->_recurringPaymentFrequency)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_decimalAmount)
  {
    PBDataWriterWriteSubmessage();
    int v4 = v5;
  }
  if (self->_localData)
  {
    PBDataWriterWriteDataField();
    int v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  v4[37] = self->_version;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    int v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[36] = self->_type;
    *((unsigned char *)v4 + 152) |= 4u;
  }
  if (self->_currency)
  {
    objc_msgSend(v5, "setCurrency:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_amount;
    *((unsigned char *)v4 + 152) |= 1u;
  }
  if (self->_senderAddress)
  {
    objc_msgSend(v5, "setSenderAddress:");
    int v4 = v5;
  }
  if (self->_recipientAddress)
  {
    objc_msgSend(v5, "setRecipientAddress:");
    int v4 = v5;
  }
  if (self->_requestToken)
  {
    objc_msgSend(v5, "setRequestToken:");
    int v4 = v5;
  }
  if (self->_paymentIdentifier)
  {
    objc_msgSend(v5, "setPaymentIdentifier:");
    int v4 = v5;
  }
  if (self->_transactionIdentifier)
  {
    objc_msgSend(v5, "setTransactionIdentifier:");
    int v4 = v5;
  }
  if (self->_memo)
  {
    objc_msgSend(v5, "setMemo:");
    int v4 = v5;
  }
  if (self->_requestDeviceScoreIdentifier)
  {
    objc_msgSend(v5, "setRequestDeviceScoreIdentifier:");
    int v4 = v5;
  }
  if (self->_recurringPaymentIdentifier)
  {
    objc_msgSend(v5, "setRecurringPaymentIdentifier:");
    int v4 = v5;
  }
  if (self->_recurringPaymentEmoji)
  {
    objc_msgSend(v5, "setRecurringPaymentEmoji:");
    int v4 = v5;
  }
  if (self->_recurringPaymentColor)
  {
    objc_msgSend(v5, "setRecurringPaymentColor:");
    int v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_recurringPaymentStartDate;
    *((unsigned char *)v4 + 152) |= 2u;
  }
  if (self->_recurringPaymentFrequency)
  {
    objc_msgSend(v5, "setRecurringPaymentFrequency:");
    int v4 = v5;
  }
  if (self->_decimalAmount)
  {
    objc_msgSend(v5, "setDecimalAmount:");
    int v4 = v5;
  }
  if (self->_localData)
  {
    objc_msgSend(v5, "setLocalData:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 148) = self->_version;
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_type;
    *(unsigned char *)(v5 + 152) |= 4u;
  }
  uint64_t v8 = [(NSString *)self->_currency copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_amount;
    *(unsigned char *)(v5 + 152) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_senderAddress copyWithZone:a3];
  v11 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v10;

  uint64_t v12 = [(NSString *)self->_recipientAddress copyWithZone:a3];
  v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_requestToken copyWithZone:a3];
  v15 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v14;

  uint64_t v16 = [(NSString *)self->_paymentIdentifier copyWithZone:a3];
  v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  uint64_t v18 = [(NSString *)self->_transactionIdentifier copyWithZone:a3];
  v19 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v18;

  uint64_t v20 = [(NSString *)self->_memo copyWithZone:a3];
  v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  uint64_t v22 = [(NSString *)self->_requestDeviceScoreIdentifier copyWithZone:a3];
  v23 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v22;

  uint64_t v24 = [(NSString *)self->_recurringPaymentIdentifier copyWithZone:a3];
  v25 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v24;

  uint64_t v26 = [(NSString *)self->_recurringPaymentEmoji copyWithZone:a3];
  v27 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v26;

  uint64_t v28 = [(NSString *)self->_recurringPaymentColor copyWithZone:a3];
  v29 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v28;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_recurringPaymentStartDate;
    *(unsigned char *)(v5 + 152) |= 2u;
  }
  uint64_t v30 = [(NSString *)self->_recurringPaymentFrequency copyWithZone:a3];
  v31 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v30;

  id v32 = [(PKProtobufNSDecimalNumber *)self->_decimalAmount copyWithZone:a3];
  v33 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v32;

  uint64_t v34 = [(NSData *)self->_localData copyWithZone:a3];
  v35 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v34;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  if (self->_version != *((_DWORD *)v4 + 37)) {
    goto LABEL_49;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_49;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 152);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 4) == 0 || self->_type != *((_DWORD *)v4 + 36)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 4) != 0)
  {
    goto LABEL_49;
  }
  currency = self->_currency;
  if ((unint64_t)currency | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](currency, "isEqual:"))
    {
LABEL_49:
      char v22 = 0;
      goto LABEL_50;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 152);
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_amount != *((void *)v4 + 1)) {
      goto LABEL_49;
    }
  }
  else if (v7)
  {
    goto LABEL_49;
  }
  senderAddress = self->_senderAddress;
  if ((unint64_t)senderAddress | *((void *)v4 + 16)
    && !-[NSString isEqual:](senderAddress, "isEqual:"))
  {
    goto LABEL_49;
  }
  recipientAddress = self->_recipientAddress;
  if ((unint64_t)recipientAddress | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](recipientAddress, "isEqual:")) {
      goto LABEL_49;
    }
  }
  requestToken = self->_requestToken;
  if ((unint64_t)requestToken | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](requestToken, "isEqual:")) {
      goto LABEL_49;
    }
  }
  paymentIdentifier = self->_paymentIdentifier;
  if ((unint64_t)paymentIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](paymentIdentifier, "isEqual:")) {
      goto LABEL_49;
    }
  }
  transactionIdentifier = self->_transactionIdentifier;
  if ((unint64_t)transactionIdentifier | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](transactionIdentifier, "isEqual:")) {
      goto LABEL_49;
    }
  }
  memo = self->_memo;
  if ((unint64_t)memo | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](memo, "isEqual:")) {
      goto LABEL_49;
    }
  }
  requestDeviceScoreIdentifier = self->_requestDeviceScoreIdentifier;
  if ((unint64_t)requestDeviceScoreIdentifier | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](requestDeviceScoreIdentifier, "isEqual:")) {
      goto LABEL_49;
    }
  }
  recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
  if ((unint64_t)recurringPaymentIdentifier | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](recurringPaymentIdentifier, "isEqual:")) {
      goto LABEL_49;
    }
  }
  recurringPaymentEmoji = self->_recurringPaymentEmoji;
  if ((unint64_t)recurringPaymentEmoji | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](recurringPaymentEmoji, "isEqual:")) {
      goto LABEL_49;
    }
  }
  recurringPaymentColor = self->_recurringPaymentColor;
  if ((unint64_t)recurringPaymentColor | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](recurringPaymentColor, "isEqual:")) {
      goto LABEL_49;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 2) == 0 || self->_recurringPaymentStartDate != *((double *)v4 + 2)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 2) != 0)
  {
    goto LABEL_49;
  }
  recurringPaymentFrequency = self->_recurringPaymentFrequency;
  if ((unint64_t)recurringPaymentFrequency | *((void *)v4 + 12)
    && !-[NSString isEqual:](recurringPaymentFrequency, "isEqual:"))
  {
    goto LABEL_49;
  }
  decimalAmount = self->_decimalAmount;
  if ((unint64_t)decimalAmount | *((void *)v4 + 4))
  {
    if (!-[PKProtobufNSDecimalNumber isEqual:](decimalAmount, "isEqual:")) {
      goto LABEL_49;
    }
  }
  localData = self->_localData;
  if ((unint64_t)localData | *((void *)v4 + 6)) {
    char v22 = -[NSData isEqual:](localData, "isEqual:");
  }
  else {
    char v22 = 1;
  }
LABEL_50:

  return v22;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  NSUInteger v25 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v24 = 2654435761 * self->_type;
  }
  else {
    uint64_t v24 = 0;
  }
  NSUInteger v23 = [(NSString *)self->_currency hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v22 = 2654435761 * self->_amount;
  }
  else {
    uint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_senderAddress hash];
  NSUInteger v20 = [(NSString *)self->_recipientAddress hash];
  NSUInteger v19 = [(NSString *)self->_requestToken hash];
  NSUInteger v3 = [(NSString *)self->_paymentIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_transactionIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_memo hash];
  NSUInteger v6 = [(NSString *)self->_requestDeviceScoreIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_recurringPaymentIdentifier hash];
  NSUInteger v8 = [(NSString *)self->_recurringPaymentEmoji hash];
  NSUInteger v9 = [(NSString *)self->_recurringPaymentColor hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double recurringPaymentStartDate = self->_recurringPaymentStartDate;
    double v12 = -recurringPaymentStartDate;
    if (recurringPaymentStartDate >= 0.0) {
      double v12 = self->_recurringPaymentStartDate;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  uint64_t v15 = v25 ^ v24 ^ v23 ^ v22 ^ (2654435761 * version) ^ v21 ^ v20 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  NSUInteger v16 = [(NSString *)self->_recurringPaymentFrequency hash];
  unint64_t v17 = v16 ^ [(PKProtobufNSDecimalNumber *)self->_decimalAmount hash];
  return v15 ^ v17 ^ [(NSData *)self->_localData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int version = *((_DWORD *)v4 + 37);
  id v7 = v4;
  if (*((void *)v4 + 5))
  {
    -[PKProtobufPeerPaymentMessage setIdentifier:](self, "setIdentifier:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 152) & 4) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 36);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 3))
  {
    -[PKProtobufPeerPaymentMessage setCurrency:](self, "setCurrency:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 152))
  {
    self->_amount = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 16))
  {
    -[PKProtobufPeerPaymentMessage setSenderAddress:](self, "setSenderAddress:");
    id v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[PKProtobufPeerPaymentMessage setRecipientAddress:](self, "setRecipientAddress:");
    id v4 = v7;
  }
  if (*((void *)v4 + 15))
  {
    -[PKProtobufPeerPaymentMessage setRequestToken:](self, "setRequestToken:");
    id v4 = v7;
  }
  if (*((void *)v4 + 8))
  {
    -[PKProtobufPeerPaymentMessage setPaymentIdentifier:](self, "setPaymentIdentifier:");
    id v4 = v7;
  }
  if (*((void *)v4 + 17))
  {
    -[PKProtobufPeerPaymentMessage setTransactionIdentifier:](self, "setTransactionIdentifier:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[PKProtobufPeerPaymentMessage setMemo:](self, "setMemo:");
    id v4 = v7;
  }
  if (*((void *)v4 + 14))
  {
    -[PKProtobufPeerPaymentMessage setRequestDeviceScoreIdentifier:](self, "setRequestDeviceScoreIdentifier:");
    id v4 = v7;
  }
  if (*((void *)v4 + 13))
  {
    -[PKProtobufPeerPaymentMessage setRecurringPaymentIdentifier:](self, "setRecurringPaymentIdentifier:");
    id v4 = v7;
  }
  if (*((void *)v4 + 11))
  {
    -[PKProtobufPeerPaymentMessage setRecurringPaymentEmoji:](self, "setRecurringPaymentEmoji:");
    id v4 = v7;
  }
  if (*((void *)v4 + 10))
  {
    -[PKProtobufPeerPaymentMessage setRecurringPaymentColor:](self, "setRecurringPaymentColor:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 152) & 2) != 0)
  {
    self->_double recurringPaymentStartDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 12))
  {
    -[PKProtobufPeerPaymentMessage setRecurringPaymentFrequency:](self, "setRecurringPaymentFrequency:");
    id v4 = v7;
  }
  decimalAmount = self->_decimalAmount;
  uint64_t v6 = *((void *)v4 + 4);
  if (decimalAmount)
  {
    if (!v6) {
      goto LABEL_39;
    }
    -[PKProtobufNSDecimalNumber mergeFrom:](decimalAmount, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_39;
    }
    -[PKProtobufPeerPaymentMessage setDecimalAmount:](self, "setDecimalAmount:");
  }
  id v4 = v7;
LABEL_39:
  if (*((void *)v4 + 6))
  {
    -[PKProtobufPeerPaymentMessage setLocalData:](self, "setLocalData:");
    id v4 = v7;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (int64_t)amount
{
  return self->_amount;
}

- (PKProtobufNSDecimalNumber)decimalAmount
{
  return self->_decimalAmount;
}

- (void)setDecimalAmount:(id)a3
{
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (NSString)recipientAddress
{
  return self->_recipientAddress;
}

- (void)setRecipientAddress:(id)a3
{
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (NSString)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
}

- (NSString)requestDeviceScoreIdentifier
{
  return self->_requestDeviceScoreIdentifier;
}

- (void)setRequestDeviceScoreIdentifier:(id)a3
{
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
}

- (NSString)recurringPaymentEmoji
{
  return self->_recurringPaymentEmoji;
}

- (void)setRecurringPaymentEmoji:(id)a3
{
}

- (NSString)recurringPaymentColor
{
  return self->_recurringPaymentColor;
}

- (void)setRecurringPaymentColor:(id)a3
{
}

- (double)recurringPaymentStartDate
{
  return self->_recurringPaymentStartDate;
}

- (NSString)recurringPaymentFrequency
{
  return self->_recurringPaymentFrequency;
}

- (void)setRecurringPaymentFrequency:(id)a3
{
}

- (NSData)localData
{
  return self->_localData;
}

- (void)setLocalData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_requestDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_recurringPaymentFrequency, 0);
  objc_storeStrong((id *)&self->_recurringPaymentEmoji, 0);
  objc_storeStrong((id *)&self->_recurringPaymentColor, 0);
  objc_storeStrong((id *)&self->_recipientAddress, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_localData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_decimalAmount, 0);
  objc_storeStrong((id *)&self->_currency, 0);
}

@end