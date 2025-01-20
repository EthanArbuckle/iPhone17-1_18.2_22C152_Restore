@interface PKProtobufRemoteRegistrationRequest
- (BOOL)hasRegisterBroker;
- (BOOL)hasRegisterPeerPayment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)registerBroker;
- (BOOL)registerPeerPayment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRegisterBroker:(BOOL)a3;
- (void)setHasRegisterPeerPayment:(BOOL)a3;
- (void)setRegisterBroker:(BOOL)a3;
- (void)setRegisterPeerPayment:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufRemoteRegistrationRequest

- (void)setRegisterBroker:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_registerBroker = a3;
}

- (void)setHasRegisterBroker:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRegisterBroker
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRegisterPeerPayment:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_registerPeerPayment = a3;
}

- (void)setHasRegisterPeerPayment:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRegisterPeerPayment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufRemoteRegistrationRequest;
  v4 = [(PKProtobufRemoteRegistrationRequest *)&v8 description];
  v5 = [(PKProtobufRemoteRegistrationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  char has = (char)self->_has;
  if (has)
  {
    v6 = [NSNumber numberWithBool:self->_registerBroker];
    [v3 setObject:v6 forKey:@"registerBroker"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_registerPeerPayment];
    [v3 setObject:v7 forKey:@"registerPeerPayment"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRemoteRegistrationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[2] = self->_version;
  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)v4 + 12) = self->_registerBroker;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 13) = self->_registerPeerPayment;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_version;
  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)result + 12) = self->_registerBroker;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 13) = self->_registerPeerPayment;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_version != *((_DWORD *)v4 + 2)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0) {
      goto LABEL_13;
    }
    if (self->_registerBroker)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_13;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) != 0)
    {
      if (self->_registerPeerPayment)
      {
        if (!*((unsigned char *)v4 + 13)) {
          goto LABEL_13;
        }
      }
      else if (*((unsigned char *)v4 + 13))
      {
        goto LABEL_13;
      }
      BOOL v5 = 1;
      goto LABEL_14;
    }
LABEL_13:
    BOOL v5 = 0;
  }
LABEL_14:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_registerBroker;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v2 ^ v3 ^ (2654435761 * self->_version);
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_registerPeerPayment;
  return v2 ^ v3 ^ (2654435761 * self->_version);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_version = *((_DWORD *)v4 + 2);
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_registerBroker = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_registerPeerPayment = *((unsigned char *)v4 + 13);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)registerBroker
{
  return self->_registerBroker;
}

- (BOOL)registerPeerPayment
{
  return self->_registerPeerPayment;
}

@end