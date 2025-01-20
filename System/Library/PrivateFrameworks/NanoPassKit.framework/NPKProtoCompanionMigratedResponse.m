@interface NPKProtoCompanionMigratedResponse
- (BOOL)hasErrorData;
- (BOOL)hasPaymentWebServiceContextData;
- (BOOL)hasPeerPaymentAccountData;
- (BOOL)hasPeerPaymentWebServiceContextData;
- (BOOL)hasPending;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)errorData;
- (NSData)paymentWebServiceContextData;
- (NSData)peerPaymentAccountData;
- (NSData)peerPaymentWebServiceContextData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setPaymentWebServiceContextData:(id)a3;
- (void)setPeerPaymentAccountData:(id)a3;
- (void)setPeerPaymentWebServiceContextData:(id)a3;
- (void)setPending:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCompanionMigratedResponse

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasPaymentWebServiceContextData
{
  return self->_paymentWebServiceContextData != 0;
}

- (BOOL)hasPeerPaymentWebServiceContextData
{
  return self->_peerPaymentWebServiceContextData != 0;
}

- (BOOL)hasPeerPaymentAccountData
{
  return self->_peerPaymentAccountData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCompanionMigratedResponse;
  v4 = [(NPKProtoCompanionMigratedResponse *)&v8 description];
  v5 = [(NPKProtoCompanionMigratedResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v5 forKey:@"pending"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_success];
    [v3 setObject:v6 forKey:@"success"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  paymentWebServiceContextData = self->_paymentWebServiceContextData;
  if (paymentWebServiceContextData) {
    [v3 setObject:paymentWebServiceContextData forKey:@"paymentWebServiceContextData"];
  }
  peerPaymentWebServiceContextData = self->_peerPaymentWebServiceContextData;
  if (peerPaymentWebServiceContextData) {
    [v3 setObject:peerPaymentWebServiceContextData forKey:@"peerPaymentWebServiceContextData"];
  }
  peerPaymentAccountData = self->_peerPaymentAccountData;
  if (peerPaymentAccountData) {
    [v3 setObject:peerPaymentAccountData forKey:@"peerPaymentAccountData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCompanionMigratedResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_paymentWebServiceContextData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_peerPaymentWebServiceContextData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_peerPaymentAccountData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[40] = self->_pending;
    v4[44] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[41] = self->_success;
    v4[44] |= 2u;
  }
  id v6 = v4;
  if (self->_errorData)
  {
    objc_msgSend(v4, "setErrorData:");
    id v4 = v6;
  }
  if (self->_paymentWebServiceContextData)
  {
    objc_msgSend(v6, "setPaymentWebServiceContextData:");
    id v4 = v6;
  }
  if (self->_peerPaymentWebServiceContextData)
  {
    objc_msgSend(v6, "setPeerPaymentWebServiceContextData:");
    id v4 = v6;
  }
  if (self->_peerPaymentAccountData)
  {
    objc_msgSend(v6, "setPeerPaymentAccountData:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[40] = self->_pending;
    v5[44] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[41] = self->_success;
    v5[44] |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  uint64_t v10 = [(NSData *)self->_paymentWebServiceContextData copyWithZone:a3];
  v11 = (void *)v6[2];
  v6[2] = v10;

  uint64_t v12 = [(NSData *)self->_peerPaymentWebServiceContextData copyWithZone:a3];
  v13 = (void *)v6[4];
  v6[4] = v12;

  uint64_t v14 = [(NSData *)self->_peerPaymentAccountData copyWithZone:a3];
  v15 = (void *)v6[3];
  v6[3] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0) {
      goto LABEL_26;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_success)
      {
        if (!*((unsigned char *)v4 + 41)) {
          goto LABEL_26;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_18;
      }
    }
LABEL_26:
    char v9 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_26;
  }
LABEL_18:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1) && !-[NSData isEqual:](errorData, "isEqual:")) {
    goto LABEL_26;
  }
  paymentWebServiceContextData = self->_paymentWebServiceContextData;
  if ((unint64_t)paymentWebServiceContextData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](paymentWebServiceContextData, "isEqual:")) {
      goto LABEL_26;
    }
  }
  peerPaymentWebServiceContextData = self->_peerPaymentWebServiceContextData;
  if ((unint64_t)peerPaymentWebServiceContextData | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](peerPaymentWebServiceContextData, "isEqual:")) {
      goto LABEL_26;
    }
  }
  peerPaymentAccountData = self->_peerPaymentAccountData;
  if ((unint64_t)peerPaymentAccountData | *((void *)v4 + 3)) {
    char v9 = -[NSData isEqual:](peerPaymentAccountData, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_pending;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_success;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSData *)self->_errorData hash];
  uint64_t v6 = [(NSData *)self->_paymentWebServiceContextData hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSData *)self->_peerPaymentWebServiceContextData hash];
  return v7 ^ [(NSData *)self->_peerPaymentAccountData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  char v5 = v4[44];
  if (v5)
  {
    self->_pending = v4[40];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = v4[44];
  }
  if ((v5 & 2) != 0)
  {
    self->_success = v4[41];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[NPKProtoCompanionMigratedResponse setErrorData:](self, "setErrorData:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoCompanionMigratedResponse setPaymentWebServiceContextData:](self, "setPaymentWebServiceContextData:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NPKProtoCompanionMigratedResponse setPeerPaymentWebServiceContextData:](self, "setPeerPaymentWebServiceContextData:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoCompanionMigratedResponse setPeerPaymentAccountData:](self, "setPeerPaymentAccountData:");
    uint64_t v4 = v6;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (BOOL)success
{
  return self->_success;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (NSData)paymentWebServiceContextData
{
  return self->_paymentWebServiceContextData;
}

- (void)setPaymentWebServiceContextData:(id)a3
{
}

- (NSData)peerPaymentWebServiceContextData
{
  return self->_peerPaymentWebServiceContextData;
}

- (void)setPeerPaymentWebServiceContextData:(id)a3
{
}

- (NSData)peerPaymentAccountData
{
  return self->_peerPaymentAccountData;
}

- (void)setPeerPaymentAccountData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentWebServiceContextData, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountData, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceContextData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end