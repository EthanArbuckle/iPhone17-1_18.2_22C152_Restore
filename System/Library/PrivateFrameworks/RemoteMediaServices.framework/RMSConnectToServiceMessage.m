@interface RMSConnectToServiceMessage
- (BOOL)allowPairing;
- (BOOL)hasAllowPairing;
- (BOOL)hasPairingGUID;
- (BOOL)hasService;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pairingGUID;
- (RMSServiceMessage)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowPairing:(BOOL)a3;
- (void)setHasAllowPairing:(BOOL)a3;
- (void)setPairingGUID:(id)a3;
- (void)setService:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSConnectToServiceMessage

- (BOOL)hasService
{
  return self->_service != 0;
}

- (BOOL)hasPairingGUID
{
  return self->_pairingGUID != 0;
}

- (void)setAllowPairing:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_allowPairing = a3;
}

- (void)setHasAllowPairing:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowPairing
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSConnectToServiceMessage;
  v4 = [(RMSConnectToServiceMessage *)&v8 description];
  v5 = [(RMSConnectToServiceMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  service = self->_service;
  if (service)
  {
    v5 = [(RMSServiceMessage *)service dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"service"];
  }
  pairingGUID = self->_pairingGUID;
  if (pairingGUID) {
    [v3 setObject:pairingGUID forKey:@"pairingGUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_allowPairing];
    [v3 setObject:v7 forKey:@"allowPairing"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RMSConnectToServiceMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_service)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_pairingGUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_service)
  {
    objc_msgSend(v4, "setService:");
    id v4 = v5;
  }
  if (self->_pairingGUID)
  {
    objc_msgSend(v5, "setPairingGUID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_allowPairing;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(RMSServiceMessage *)self->_service copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_pairingGUID copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_allowPairing;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  service = self->_service;
  if ((unint64_t)service | *((void *)v4 + 2))
  {
    if (!-[RMSServiceMessage isEqual:](service, "isEqual:")) {
      goto LABEL_8;
    }
  }
  pairingGUID = self->_pairingGUID;
  if ((unint64_t)pairingGUID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](pairingGUID, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_allowPairing)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RMSServiceMessage *)self->_service hash];
  NSUInteger v4 = [(NSString *)self->_pairingGUID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_allowPairing;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  service = self->_service;
  uint64_t v6 = *((void *)v4 + 2);
  id v7 = v4;
  if (service)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[RMSServiceMessage mergeFrom:](service, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[RMSConnectToServiceMessage setService:](self, "setService:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 1))
  {
    -[RMSConnectToServiceMessage setPairingGUID:](self, "setPairingGUID:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_allowPairing = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758]();
}

- (RMSServiceMessage)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)pairingGUID
{
  return self->_pairingGUID;
}

- (void)setPairingGUID:(id)a3
{
}

- (BOOL)allowPairing
{
  return self->_allowPairing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pairingGUID, 0);
}

@end