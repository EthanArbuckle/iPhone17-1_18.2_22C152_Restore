@interface PKProtobufAutomaticReloadPaymentSummaryItem
- (BOOL)hasThresholdAmount;
- (BOOL)hasThresholdDecimalAmount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PKProtobufCustomPrecisionAmount)thresholdAmount;
- (PKProtobufNSDecimalNumber)thresholdDecimalAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setThresholdAmount:(id)a3;
- (void)setThresholdDecimalAmount:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufAutomaticReloadPaymentSummaryItem

- (BOOL)hasThresholdAmount
{
  return self->_thresholdAmount != 0;
}

- (BOOL)hasThresholdDecimalAmount
{
  return self->_thresholdDecimalAmount != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufAutomaticReloadPaymentSummaryItem;
  v4 = [(PKProtobufAutomaticReloadPaymentSummaryItem *)&v8 description];
  v5 = [(PKProtobufAutomaticReloadPaymentSummaryItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  thresholdAmount = self->_thresholdAmount;
  if (thresholdAmount)
  {
    v5 = [(PKProtobufCustomPrecisionAmount *)thresholdAmount dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"thresholdAmount"];
  }
  thresholdDecimalAmount = self->_thresholdDecimalAmount;
  if (thresholdDecimalAmount)
  {
    v7 = [(PKProtobufNSDecimalNumber *)thresholdDecimalAmount dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"threshold_decimal_amount"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufAutomaticReloadPaymentSummaryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_thresholdAmount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_thresholdDecimalAmount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_thresholdAmount)
  {
    objc_msgSend(v4, "setThresholdAmount:");
    id v4 = v5;
  }
  if (self->_thresholdDecimalAmount)
  {
    objc_msgSend(v5, "setThresholdDecimalAmount:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKProtobufCustomPrecisionAmount *)self->_thresholdAmount copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PKProtobufNSDecimalNumber *)self->_thresholdDecimalAmount copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((thresholdAmount = self->_thresholdAmount, !((unint64_t)thresholdAmount | v4[1]))
     || -[PKProtobufCustomPrecisionAmount isEqual:](thresholdAmount, "isEqual:")))
  {
    thresholdDecimalAmount = self->_thresholdDecimalAmount;
    if ((unint64_t)thresholdDecimalAmount | v4[2]) {
      char v7 = -[PKProtobufNSDecimalNumber isEqual:](thresholdDecimalAmount, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PKProtobufCustomPrecisionAmount *)self->_thresholdAmount hash];
  return [(PKProtobufNSDecimalNumber *)self->_thresholdDecimalAmount hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  thresholdAmount = self->_thresholdAmount;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (thresholdAmount)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufCustomPrecisionAmount mergeFrom:](thresholdAmount, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufAutomaticReloadPaymentSummaryItem setThresholdAmount:](self, "setThresholdAmount:");
  }
  id v4 = v9;
LABEL_7:
  thresholdDecimalAmount = self->_thresholdDecimalAmount;
  uint64_t v8 = v4[2];
  if (thresholdDecimalAmount)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PKProtobufNSDecimalNumber mergeFrom:](thresholdDecimalAmount, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PKProtobufAutomaticReloadPaymentSummaryItem setThresholdDecimalAmount:](self, "setThresholdDecimalAmount:");
  }
  id v4 = v9;
LABEL_13:
}

- (PKProtobufCustomPrecisionAmount)thresholdAmount
{
  return self->_thresholdAmount;
}

- (void)setThresholdAmount:(id)a3
{
}

- (PKProtobufNSDecimalNumber)thresholdDecimalAmount
{
  return self->_thresholdDecimalAmount;
}

- (void)setThresholdDecimalAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdDecimalAmount, 0);
  objc_storeStrong((id *)&self->_thresholdAmount, 0);
}

@end