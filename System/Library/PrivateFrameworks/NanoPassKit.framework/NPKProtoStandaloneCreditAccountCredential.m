@interface NPKProtoStandaloneCreditAccountCredential
- (BOOL)hasCreditLimit;
- (BOOL)hasCurrencyCode;
- (BOOL)hasCurrentBalance;
- (BOOL)hasPaymentPass;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentCredential)paymentCredential;
- (NPKProtoStandalonePaymentPass)paymentPass;
- (NSString)currencyCode;
- (double)creditLimit;
- (double)currentBalance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreditLimit:(double)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setCurrentBalance:(double)a3;
- (void)setHasCreditLimit:(BOOL)a3;
- (void)setHasCurrentBalance:(BOOL)a3;
- (void)setPaymentCredential:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandaloneCreditAccountCredential

- (BOOL)hasPaymentPass
{
  return self->_paymentPass != 0;
}

- (BOOL)hasCurrencyCode
{
  return self->_currencyCode != 0;
}

- (void)setCurrentBalance:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_currentBalance = a3;
}

- (void)setHasCurrentBalance:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrentBalance
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCreditLimit:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creditLimit = a3;
}

- (void)setHasCreditLimit:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreditLimit
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneCreditAccountCredential;
  v4 = [(NPKProtoStandaloneCreditAccountCredential *)&v8 description];
  v5 = [(NPKProtoStandaloneCreditAccountCredential *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  paymentCredential = self->_paymentCredential;
  if (paymentCredential)
  {
    v5 = [(NPKProtoStandalonePaymentCredential *)paymentCredential dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"paymentCredential"];
  }
  paymentPass = self->_paymentPass;
  if (paymentPass)
  {
    v7 = [(NPKProtoStandalonePaymentPass *)paymentPass dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"paymentPass"];
  }
  currencyCode = self->_currencyCode;
  if (currencyCode) {
    [v3 setObject:currencyCode forKey:@"currencyCode"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithDouble:self->_currentBalance];
    [v3 setObject:v10 forKey:@"currentBalance"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v11 = [NSNumber numberWithDouble:self->_creditLimit];
    [v3 setObject:v11 forKey:@"creditLimit"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneCreditAccountCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_paymentCredential) {
    -[NPKProtoStandaloneCreditAccountCredential writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_paymentPass) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_currencyCode) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setPaymentCredential:self->_paymentCredential];
  if (self->_paymentPass) {
    objc_msgSend(v5, "setPaymentPass:");
  }
  if (self->_currencyCode) {
    objc_msgSend(v5, "setCurrencyCode:");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v5 + 2) = *(void *)&self->_currentBalance;
    *((unsigned char *)v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v5 + 1) = *(void *)&self->_creditLimit;
    *((unsigned char *)v5 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandalonePaymentCredential *)self->_paymentCredential copyWithZone:a3];
  id v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(NPKProtoStandalonePaymentPass *)self->_paymentPass copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_currencyCode copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_currentBalance;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_creditLimit;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  paymentCredential = self->_paymentCredential;
  if ((unint64_t)paymentCredential | *((void *)v4 + 4))
  {
    if (!-[NPKProtoStandalonePaymentCredential isEqual:](paymentCredential, "isEqual:")) {
      goto LABEL_17;
    }
  }
  paymentPass = self->_paymentPass;
  if ((unint64_t)paymentPass | *((void *)v4 + 5))
  {
    if (!-[NPKProtoStandalonePaymentPass isEqual:](paymentPass, "isEqual:")) {
      goto LABEL_17;
    }
  }
  currencyCode = self->_currencyCode;
  if ((unint64_t)currencyCode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](currencyCode, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_currentBalance != *((double *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_creditLimit != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoStandalonePaymentCredential *)self->_paymentCredential hash];
  unint64_t v4 = [(NPKProtoStandalonePaymentPass *)self->_paymentPass hash];
  NSUInteger v5 = [(NSString *)self->_currencyCode hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double currentBalance = self->_currentBalance;
    double v9 = -currentBalance;
    if (currentBalance >= 0.0) {
      double v9 = self->_currentBalance;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if (has)
  {
    double creditLimit = self->_creditLimit;
    double v14 = -creditLimit;
    if (creditLimit >= 0.0) {
      double v14 = self->_creditLimit;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  paymentCredential = self->_paymentCredential;
  uint64_t v6 = *((void *)v4 + 4);
  id v10 = v4;
  if (paymentCredential)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentCredential mergeFrom:](paymentCredential, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandaloneCreditAccountCredential setPaymentCredential:](self, "setPaymentCredential:");
  }
  id v4 = v10;
LABEL_7:
  paymentPass = self->_paymentPass;
  uint64_t v8 = *((void *)v4 + 5);
  if (paymentPass)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoStandalonePaymentPass mergeFrom:](paymentPass, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoStandaloneCreditAccountCredential setPaymentPass:](self, "setPaymentPass:");
  }
  id v4 = v10;
LABEL_13:
  if (*((void *)v4 + 3))
  {
    -[NPKProtoStandaloneCreditAccountCredential setCurrencyCode:](self, "setCurrencyCode:");
    id v4 = v10;
  }
  char v9 = *((unsigned char *)v4 + 48);
  if ((v9 & 2) != 0)
  {
    self->_double currentBalance = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)v4 + 48);
  }
  if (v9)
  {
    self->_double creditLimit = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NPKProtoStandalonePaymentCredential)paymentCredential
{
  return self->_paymentCredential;
}

- (void)setPaymentCredential:(id)a3
{
}

- (NPKProtoStandalonePaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (double)currentBalance
{
  return self->_currentBalance;
}

- (double)creditLimit
{
  return self->_creditLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandaloneCreditAccountCredential writeTo:]", "NPKProtoStandaloneCreditAccountCredential.m", 177, "self->_paymentCredential != nil");
}

@end