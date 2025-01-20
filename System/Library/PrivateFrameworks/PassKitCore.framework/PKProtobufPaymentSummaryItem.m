@interface PKProtobufPaymentSummaryItem
- (BOOL)hasAmount;
- (BOOL)hasAutomaticReloadPaymentSummaryItem;
- (BOOL)hasCustomPrecisionAmount;
- (BOOL)hasDecimalAmount;
- (BOOL)hasDeferredPaymentSummaryItem;
- (BOOL)hasDisbursementSummaryItem;
- (BOOL)hasInstantFundsOutFeeSummaryItem;
- (BOOL)hasLabel;
- (BOOL)hasRecurringPaymentSummaryItem;
- (BOOL)hasShippingMethodSummaryItem;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)label;
- (PKProtobufAutomaticReloadPaymentSummaryItem)automaticReloadPaymentSummaryItem;
- (PKProtobufCustomPrecisionAmount)customPrecisionAmount;
- (PKProtobufDeferredPaymentSummaryItem)deferredPaymentSummaryItem;
- (PKProtobufDisbursementSummaryItem)disbursementSummaryItem;
- (PKProtobufInstantFundsOutFeeSummaryItem)instantFundsOutFeeSummaryItem;
- (PKProtobufNSDecimalNumber)decimalAmount;
- (PKProtobufRecurringPaymentSummaryItem)recurringPaymentSummaryItem;
- (PKProtobufShippingMethod)shippingMethodSummaryItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)amount;
- (unint64_t)hash;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmount:(int64_t)a3;
- (void)setAutomaticReloadPaymentSummaryItem:(id)a3;
- (void)setCustomPrecisionAmount:(id)a3;
- (void)setDecimalAmount:(id)a3;
- (void)setDeferredPaymentSummaryItem:(id)a3;
- (void)setDisbursementSummaryItem:(id)a3;
- (void)setHasAmount:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setInstantFundsOutFeeSummaryItem:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRecurringPaymentSummaryItem:(id)a3;
- (void)setShippingMethodSummaryItem:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentSummaryItem

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

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasRecurringPaymentSummaryItem
{
  return self->_recurringPaymentSummaryItem != 0;
}

- (BOOL)hasDeferredPaymentSummaryItem
{
  return self->_deferredPaymentSummaryItem != 0;
}

- (BOOL)hasCustomPrecisionAmount
{
  return self->_customPrecisionAmount != 0;
}

- (BOOL)hasDecimalAmount
{
  return self->_decimalAmount != 0;
}

- (BOOL)hasShippingMethodSummaryItem
{
  return self->_shippingMethodSummaryItem != 0;
}

- (BOOL)hasAutomaticReloadPaymentSummaryItem
{
  return self->_automaticReloadPaymentSummaryItem != 0;
}

- (BOOL)hasDisbursementSummaryItem
{
  return self->_disbursementSummaryItem != 0;
}

- (BOOL)hasInstantFundsOutFeeSummaryItem
{
  return self->_instantFundsOutFeeSummaryItem != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentSummaryItem;
  v4 = [(PKProtobufPaymentSummaryItem *)&v8 description];
  v5 = [(PKProtobufPaymentSummaryItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_amount];
    [v3 setObject:v4 forKey:@"amount"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_type];
    [v3 setObject:v6 forKey:@"type"];
  }
  recurringPaymentSummaryItem = self->_recurringPaymentSummaryItem;
  if (recurringPaymentSummaryItem)
  {
    objc_super v8 = [(PKProtobufRecurringPaymentSummaryItem *)recurringPaymentSummaryItem dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"recurringPaymentSummaryItem"];
  }
  deferredPaymentSummaryItem = self->_deferredPaymentSummaryItem;
  if (deferredPaymentSummaryItem)
  {
    v10 = [(PKProtobufDeferredPaymentSummaryItem *)deferredPaymentSummaryItem dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"deferredPaymentSummaryItem"];
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if (customPrecisionAmount)
  {
    v12 = [(PKProtobufCustomPrecisionAmount *)customPrecisionAmount dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"custom_precision_amount"];
  }
  decimalAmount = self->_decimalAmount;
  if (decimalAmount)
  {
    v14 = [(PKProtobufNSDecimalNumber *)decimalAmount dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"decimal_amount"];
  }
  shippingMethodSummaryItem = self->_shippingMethodSummaryItem;
  if (shippingMethodSummaryItem)
  {
    v16 = [(PKProtobufShippingMethod *)shippingMethodSummaryItem dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"shippingMethodSummaryItem"];
  }
  automaticReloadPaymentSummaryItem = self->_automaticReloadPaymentSummaryItem;
  if (automaticReloadPaymentSummaryItem)
  {
    v18 = [(PKProtobufAutomaticReloadPaymentSummaryItem *)automaticReloadPaymentSummaryItem dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"automaticReloadPaymentSummaryItem"];
  }
  disbursementSummaryItem = self->_disbursementSummaryItem;
  if (disbursementSummaryItem)
  {
    v20 = [(PKProtobufDisbursementSummaryItem *)disbursementSummaryItem dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"disbursementSummaryItem"];
  }
  instantFundsOutFeeSummaryItem = self->_instantFundsOutFeeSummaryItem;
  if (instantFundsOutFeeSummaryItem)
  {
    v22 = [(PKProtobufInstantFundsOutFeeSummaryItem *)instantFundsOutFeeSummaryItem dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"instantFundsOutFeeSummaryItem"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentSummaryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteSint64Field();
    id v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_recurringPaymentSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deferredPaymentSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_customPrecisionAmount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shippingMethodSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_automaticReloadPaymentSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_decimalAmount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_disbursementSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_instantFundsOutFeeSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_amount;
    *((unsigned char *)v4 + 92) |= 1u;
  }
  id v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_type;
    *((unsigned char *)v4 + 92) |= 2u;
  }
  if (self->_recurringPaymentSummaryItem)
  {
    objc_msgSend(v5, "setRecurringPaymentSummaryItem:");
    id v4 = v5;
  }
  if (self->_deferredPaymentSummaryItem)
  {
    objc_msgSend(v5, "setDeferredPaymentSummaryItem:");
    id v4 = v5;
  }
  if (self->_customPrecisionAmount)
  {
    objc_msgSend(v5, "setCustomPrecisionAmount:");
    id v4 = v5;
  }
  if (self->_shippingMethodSummaryItem)
  {
    objc_msgSend(v5, "setShippingMethodSummaryItem:");
    id v4 = v5;
  }
  if (self->_automaticReloadPaymentSummaryItem)
  {
    objc_msgSend(v5, "setAutomaticReloadPaymentSummaryItem:");
    id v4 = v5;
  }
  if (self->_decimalAmount)
  {
    objc_msgSend(v5, "setDecimalAmount:");
    id v4 = v5;
  }
  if (self->_disbursementSummaryItem)
  {
    objc_msgSend(v5, "setDisbursementSummaryItem:");
    id v4 = v5;
  }
  if (self->_instantFundsOutFeeSummaryItem)
  {
    objc_msgSend(v5, "setInstantFundsOutFeeSummaryItem:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_amount;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_label copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_type;
    *(unsigned char *)(v6 + 92) |= 2u;
  }
  id v9 = [(PKProtobufRecurringPaymentSummaryItem *)self->_recurringPaymentSummaryItem copyWithZone:a3];
  v10 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v9;

  id v11 = [(PKProtobufDeferredPaymentSummaryItem *)self->_deferredPaymentSummaryItem copyWithZone:a3];
  v12 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v11;

  id v13 = [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionAmount copyWithZone:a3];
  v14 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v13;

  id v15 = [(PKProtobufShippingMethod *)self->_shippingMethodSummaryItem copyWithZone:a3];
  v16 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v15;

  id v17 = [(PKProtobufAutomaticReloadPaymentSummaryItem *)self->_automaticReloadPaymentSummaryItem copyWithZone:a3];
  v18 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v17;

  id v19 = [(PKProtobufNSDecimalNumber *)self->_decimalAmount copyWithZone:a3];
  v20 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v19;

  id v21 = [(PKProtobufDisbursementSummaryItem *)self->_disbursementSummaryItem copyWithZone:a3];
  v22 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v21;

  id v23 = [(PKProtobufInstantFundsOutFeeSummaryItem *)self->_instantFundsOutFeeSummaryItem copyWithZone:a3];
  v24 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v23;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 92);
  if (has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_amount != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_31;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
    {
LABEL_31:
      char v16 = 0;
      goto LABEL_32;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 92);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_type != *((_DWORD *)v4 + 22)) {
      goto LABEL_31;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_31;
  }
  recurringPaymentSummaryItem = self->_recurringPaymentSummaryItem;
  if ((unint64_t)recurringPaymentSummaryItem | *((void *)v4 + 9)
    && !-[PKProtobufRecurringPaymentSummaryItem isEqual:](recurringPaymentSummaryItem, "isEqual:"))
  {
    goto LABEL_31;
  }
  deferredPaymentSummaryItem = self->_deferredPaymentSummaryItem;
  if ((unint64_t)deferredPaymentSummaryItem | *((void *)v4 + 5))
  {
    if (!-[PKProtobufDeferredPaymentSummaryItem isEqual:](deferredPaymentSummaryItem, "isEqual:")) {
      goto LABEL_31;
    }
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if ((unint64_t)customPrecisionAmount | *((void *)v4 + 3))
  {
    if (!-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionAmount, "isEqual:")) {
      goto LABEL_31;
    }
  }
  shippingMethodSummaryItem = self->_shippingMethodSummaryItem;
  if ((unint64_t)shippingMethodSummaryItem | *((void *)v4 + 10))
  {
    if (!-[PKProtobufShippingMethod isEqual:](shippingMethodSummaryItem, "isEqual:")) {
      goto LABEL_31;
    }
  }
  automaticReloadPaymentSummaryItem = self->_automaticReloadPaymentSummaryItem;
  if ((unint64_t)automaticReloadPaymentSummaryItem | *((void *)v4 + 2))
  {
    if (!-[PKProtobufAutomaticReloadPaymentSummaryItem isEqual:](automaticReloadPaymentSummaryItem, "isEqual:")) {
      goto LABEL_31;
    }
  }
  decimalAmount = self->_decimalAmount;
  if ((unint64_t)decimalAmount | *((void *)v4 + 4))
  {
    if (!-[PKProtobufNSDecimalNumber isEqual:](decimalAmount, "isEqual:")) {
      goto LABEL_31;
    }
  }
  disbursementSummaryItem = self->_disbursementSummaryItem;
  if ((unint64_t)disbursementSummaryItem | *((void *)v4 + 6))
  {
    if (!-[PKProtobufDisbursementSummaryItem isEqual:](disbursementSummaryItem, "isEqual:")) {
      goto LABEL_31;
    }
  }
  instantFundsOutFeeSummaryItem = self->_instantFundsOutFeeSummaryItem;
  if ((unint64_t)instantFundsOutFeeSummaryItem | *((void *)v4 + 7)) {
    char v16 = -[PKProtobufInstantFundsOutFeeSummaryItem isEqual:](instantFundsOutFeeSummaryItem, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_32:

  return v16;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_amount;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_label hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5;
  unint64_t v7 = [(PKProtobufRecurringPaymentSummaryItem *)self->_recurringPaymentSummaryItem hash];
  unint64_t v8 = v6 ^ v7 ^ [(PKProtobufDeferredPaymentSummaryItem *)self->_deferredPaymentSummaryItem hash];
  unint64_t v9 = [(PKProtobufCustomPrecisionAmount *)self->_customPrecisionAmount hash];
  unint64_t v10 = v9 ^ [(PKProtobufShippingMethod *)self->_shippingMethodSummaryItem hash];
  unint64_t v11 = v8 ^ v10 ^ [(PKProtobufAutomaticReloadPaymentSummaryItem *)self->_automaticReloadPaymentSummaryItem hash];
  unint64_t v12 = [(PKProtobufNSDecimalNumber *)self->_decimalAmount hash];
  unint64_t v13 = v12 ^ [(PKProtobufDisbursementSummaryItem *)self->_disbursementSummaryItem hash];
  return v11 ^ v13 ^ [(PKProtobufInstantFundsOutFeeSummaryItem *)self->_instantFundsOutFeeSummaryItem hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 92))
  {
    self->_amount = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  v22 = v4;
  if (v4[8])
  {
    -[PKProtobufPaymentSummaryItem setLabel:](self, "setLabel:");
    uint64_t v5 = v22;
  }
  if ((v5[23] & 2) != 0)
  {
    self->_type = v5[22];
    *(unsigned char *)&self->_has |= 2u;
  }
  recurringPaymentSummaryItem = self->_recurringPaymentSummaryItem;
  uint64_t v7 = *((void *)v5 + 9);
  if (recurringPaymentSummaryItem)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[PKProtobufRecurringPaymentSummaryItem mergeFrom:](recurringPaymentSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[PKProtobufPaymentSummaryItem setRecurringPaymentSummaryItem:](self, "setRecurringPaymentSummaryItem:");
  }
  uint64_t v5 = v22;
LABEL_13:
  deferredPaymentSummaryItem = self->_deferredPaymentSummaryItem;
  uint64_t v9 = *((void *)v5 + 5);
  if (deferredPaymentSummaryItem)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[PKProtobufDeferredPaymentSummaryItem mergeFrom:](deferredPaymentSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[PKProtobufPaymentSummaryItem setDeferredPaymentSummaryItem:](self, "setDeferredPaymentSummaryItem:");
  }
  uint64_t v5 = v22;
LABEL_19:
  customPrecisionAmount = self->_customPrecisionAmount;
  uint64_t v11 = *((void *)v5 + 3);
  if (customPrecisionAmount)
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionAmount, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[PKProtobufPaymentSummaryItem setCustomPrecisionAmount:](self, "setCustomPrecisionAmount:");
  }
  uint64_t v5 = v22;
LABEL_25:
  shippingMethodSummaryItem = self->_shippingMethodSummaryItem;
  uint64_t v13 = *((void *)v5 + 10);
  if (shippingMethodSummaryItem)
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[PKProtobufShippingMethod mergeFrom:](shippingMethodSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[PKProtobufPaymentSummaryItem setShippingMethodSummaryItem:](self, "setShippingMethodSummaryItem:");
  }
  uint64_t v5 = v22;
LABEL_31:
  automaticReloadPaymentSummaryItem = self->_automaticReloadPaymentSummaryItem;
  uint64_t v15 = *((void *)v5 + 2);
  if (automaticReloadPaymentSummaryItem)
  {
    if (!v15) {
      goto LABEL_37;
    }
    -[PKProtobufAutomaticReloadPaymentSummaryItem mergeFrom:](automaticReloadPaymentSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_37;
    }
    -[PKProtobufPaymentSummaryItem setAutomaticReloadPaymentSummaryItem:](self, "setAutomaticReloadPaymentSummaryItem:");
  }
  uint64_t v5 = v22;
LABEL_37:
  decimalAmount = self->_decimalAmount;
  uint64_t v17 = *((void *)v5 + 4);
  if (decimalAmount)
  {
    if (!v17) {
      goto LABEL_43;
    }
    -[PKProtobufNSDecimalNumber mergeFrom:](decimalAmount, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_43;
    }
    -[PKProtobufPaymentSummaryItem setDecimalAmount:](self, "setDecimalAmount:");
  }
  uint64_t v5 = v22;
LABEL_43:
  disbursementSummaryItem = self->_disbursementSummaryItem;
  uint64_t v19 = *((void *)v5 + 6);
  if (disbursementSummaryItem)
  {
    if (!v19) {
      goto LABEL_49;
    }
    -[PKProtobufDisbursementSummaryItem mergeFrom:](disbursementSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_49;
    }
    -[PKProtobufPaymentSummaryItem setDisbursementSummaryItem:](self, "setDisbursementSummaryItem:");
  }
  uint64_t v5 = v22;
LABEL_49:
  instantFundsOutFeeSummaryItem = self->_instantFundsOutFeeSummaryItem;
  uint64_t v21 = *((void *)v5 + 7);
  if (instantFundsOutFeeSummaryItem)
  {
    if (!v21) {
      goto LABEL_55;
    }
    -[PKProtobufInstantFundsOutFeeSummaryItem mergeFrom:](instantFundsOutFeeSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_55;
    }
    -[PKProtobufPaymentSummaryItem setInstantFundsOutFeeSummaryItem:](self, "setInstantFundsOutFeeSummaryItem:");
  }
  uint64_t v5 = v22;
LABEL_55:
}

- (int64_t)amount
{
  return self->_amount;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (PKProtobufRecurringPaymentSummaryItem)recurringPaymentSummaryItem
{
  return self->_recurringPaymentSummaryItem;
}

- (void)setRecurringPaymentSummaryItem:(id)a3
{
}

- (PKProtobufDeferredPaymentSummaryItem)deferredPaymentSummaryItem
{
  return self->_deferredPaymentSummaryItem;
}

- (void)setDeferredPaymentSummaryItem:(id)a3
{
}

- (PKProtobufCustomPrecisionAmount)customPrecisionAmount
{
  return self->_customPrecisionAmount;
}

- (void)setCustomPrecisionAmount:(id)a3
{
}

- (PKProtobufNSDecimalNumber)decimalAmount
{
  return self->_decimalAmount;
}

- (void)setDecimalAmount:(id)a3
{
}

- (PKProtobufShippingMethod)shippingMethodSummaryItem
{
  return self->_shippingMethodSummaryItem;
}

- (void)setShippingMethodSummaryItem:(id)a3
{
}

- (PKProtobufAutomaticReloadPaymentSummaryItem)automaticReloadPaymentSummaryItem
{
  return self->_automaticReloadPaymentSummaryItem;
}

- (void)setAutomaticReloadPaymentSummaryItem:(id)a3
{
}

- (PKProtobufDisbursementSummaryItem)disbursementSummaryItem
{
  return self->_disbursementSummaryItem;
}

- (void)setDisbursementSummaryItem:(id)a3
{
}

- (PKProtobufInstantFundsOutFeeSummaryItem)instantFundsOutFeeSummaryItem
{
  return self->_instantFundsOutFeeSummaryItem;
}

- (void)setInstantFundsOutFeeSummaryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingMethodSummaryItem, 0);
  objc_storeStrong((id *)&self->_recurringPaymentSummaryItem, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_instantFundsOutFeeSummaryItem, 0);
  objc_storeStrong((id *)&self->_disbursementSummaryItem, 0);
  objc_storeStrong((id *)&self->_deferredPaymentSummaryItem, 0);
  objc_storeStrong((id *)&self->_decimalAmount, 0);
  objc_storeStrong((id *)&self->_customPrecisionAmount, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentSummaryItem, 0);
}

@end