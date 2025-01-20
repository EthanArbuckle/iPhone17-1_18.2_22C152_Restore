@interface PKProtobufCustomPrecisionAmount
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)amount;
- (unint64_t)hash;
- (unsigned)decimalDigitsMultiplier;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmount:(int64_t)a3;
- (void)setDecimalDigitsMultiplier:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufCustomPrecisionAmount

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufCustomPrecisionAmount;
  v4 = [(PKProtobufCustomPrecisionAmount *)&v8 description];
  v5 = [(PKProtobufCustomPrecisionAmount *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithLongLong:self->_amount];
  [v3 setObject:v4 forKey:@"amount"];

  v5 = [NSNumber numberWithUnsignedInt:self->_decimalDigitsMultiplier];
  [v3 setObject:v5 forKey:@"decimal_digits_multiplier"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCustomPrecisionAmountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSint64Field();
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_amount;
  *((_DWORD *)a3 + 4) = self->_decimalDigitsMultiplier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_amount;
  *((_DWORD *)result + 4) = self->_decimalDigitsMultiplier;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_amount == *((void *)v4 + 1)
    && self->_decimalDigitsMultiplier == *((_DWORD *)v4 + 4);

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_decimalDigitsMultiplier) ^ (2654435761 * self->_amount);
}

- (void)mergeFrom:(id)a3
{
  self->_amount = *((void *)a3 + 1);
  self->_decimalDigitsMultiplier = *((_DWORD *)a3 + 4);
}

- (int64_t)amount
{
  return self->_amount;
}

- (void)setAmount:(int64_t)a3
{
  self->_amount = a3;
}

- (unsigned)decimalDigitsMultiplier
{
  return self->_decimalDigitsMultiplier;
}

- (void)setDecimalDigitsMultiplier:(unsigned int)a3
{
  self->_decimalDigitsMultiplier = a3;
}

@end