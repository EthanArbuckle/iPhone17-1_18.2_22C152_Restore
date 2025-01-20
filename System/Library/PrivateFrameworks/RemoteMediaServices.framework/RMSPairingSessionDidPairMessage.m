@interface RMSPairingSessionDidPairMessage
- (BOOL)hasPairingGUID;
- (BOOL)hasServiceNetworkName;
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pairingGUID;
- (NSString)serviceNetworkName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSessionIdentifier:(BOOL)a3;
- (void)setPairingGUID:(id)a3;
- (void)setServiceNetworkName:(id)a3;
- (void)setSessionIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSPairingSessionDidPairMessage

- (void)setSessionIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasServiceNetworkName
{
  return self->_serviceNetworkName != 0;
}

- (BOOL)hasPairingGUID
{
  return self->_pairingGUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSPairingSessionDidPairMessage;
  v4 = [(RMSPairingSessionDidPairMessage *)&v8 description];
  v5 = [(RMSPairingSessionDidPairMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_sessionIdentifier];
    [v3 setObject:v4 forKey:@"sessionIdentifier"];
  }
  serviceNetworkName = self->_serviceNetworkName;
  if (serviceNetworkName) {
    [v3 setObject:serviceNetworkName forKey:@"serviceNetworkName"];
  }
  pairingGUID = self->_pairingGUID;
  if (pairingGUID) {
    [v3 setObject:pairingGUID forKey:@"pairingGUID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RMSPairingSessionDidPairMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_serviceNetworkName)
  {
    PBDataWriterWriteStringField();
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
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_sessionIdentifier;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
  if (self->_serviceNetworkName)
  {
    objc_msgSend(v4, "setServiceNetworkName:");
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
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_sessionIdentifier;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_serviceNetworkName copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_pairingGUID copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  serviceNetworkName = self->_serviceNetworkName;
  if ((unint64_t)serviceNetworkName | *((void *)v4 + 2)
    && !-[NSString isEqual:](serviceNetworkName, "isEqual:"))
  {
    goto LABEL_11;
  }
  pairingGUID = self->_pairingGUID;
  if ((unint64_t)pairingGUID | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](pairingGUID, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_sessionIdentifier;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_serviceNetworkName hash] ^ v3;
  return v4 ^ [(NSString *)self->_pairingGUID hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[7])
  {
    self->_sessionIdentifier = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[RMSPairingSessionDidPairMessage setServiceNetworkName:](self, "setServiceNetworkName:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[RMSPairingSessionDidPairMessage setPairingGUID:](self, "setPairingGUID:");
    NSUInteger v4 = v5;
  }
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)serviceNetworkName
{
  return self->_serviceNetworkName;
}

- (void)setServiceNetworkName:(id)a3
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
  objc_storeStrong((id *)&self->_serviceNetworkName, 0);
  objc_storeStrong((id *)&self->_pairingGUID, 0);
}

@end