@interface TVRMSConnectToServiceMessage
- (BOOL)hasPairingGUID;
- (BOOL)hasService;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pairingGUID;
- (TVRMSServiceMessage)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPairingGUID:(id)a3;
- (void)setService:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSConnectToServiceMessage

- (BOOL)hasService
{
  return self->_service != 0;
}

- (BOOL)hasPairingGUID
{
  return self->_pairingGUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSConnectToServiceMessage;
  v4 = [(TVRMSConnectToServiceMessage *)&v8 description];
  v5 = [(TVRMSConnectToServiceMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  service = self->_service;
  if (service)
  {
    v5 = [(TVRMSServiceMessage *)service dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"service"];
  }
  pairingGUID = self->_pairingGUID;
  if (pairingGUID) {
    [v3 setObject:pairingGUID forKey:@"pairingGUID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSConnectToServiceMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(TVRMSServiceMessage *)self->_service copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_pairingGUID copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((service = self->_service, !((unint64_t)service | v4[2]))
     || -[TVRMSServiceMessage isEqual:](service, "isEqual:")))
  {
    pairingGUID = self->_pairingGUID;
    if ((unint64_t)pairingGUID | v4[1]) {
      char v7 = -[NSString isEqual:](pairingGUID, "isEqual:");
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
  unint64_t v3 = [(TVRMSServiceMessage *)self->_service hash];
  return [(NSString *)self->_pairingGUID hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  service = self->_service;
  uint64_t v6 = v4[2];
  char v7 = v4;
  if (service)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[TVRMSServiceMessage mergeFrom:](service, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[TVRMSConnectToServiceMessage setService:](self, "setService:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[1]) {
    -[TVRMSConnectToServiceMessage setPairingGUID:](self, "setPairingGUID:");
  }

  MEMORY[0x270F9A758]();
}

- (TVRMSServiceMessage)service
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_pairingGUID, 0);
}

@end