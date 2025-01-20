@interface RMSConnectToServiceResponseMessage
- (BOOL)hasControlInterface;
- (BOOL)hasResponseCode;
- (BOOL)hasResponseData;
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (RMSControlInterfaceMessage)controlInterface;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)responseCode;
- (int)responseData;
- (int)sessionIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setControlInterface:(id)a3;
- (void)setHasResponseCode:(BOOL)a3;
- (void)setHasResponseData:(BOOL)a3;
- (void)setHasSessionIdentifier:(BOOL)a3;
- (void)setResponseCode:(int)a3;
- (void)setResponseData:(int)a3;
- (void)setSessionIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSConnectToServiceResponseMessage

- (void)setResponseCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_responseCode = a3;
}

- (void)setHasResponseCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSessionIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionIdentifier
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasControlInterface
{
  return self->_controlInterface != 0;
}

- (void)setResponseData:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_responseData = a3;
}

- (void)setHasResponseData:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResponseData
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSConnectToServiceResponseMessage;
  v4 = [(RMSConnectToServiceResponseMessage *)&v8 description];
  v5 = [(RMSConnectToServiceResponseMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithInt:self->_responseCode];
    [v3 setObject:v5 forKey:@"responseCode"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_sessionIdentifier];
    [v3 setObject:v6 forKey:@"sessionIdentifier"];
  }
  controlInterface = self->_controlInterface;
  if (controlInterface)
  {
    objc_super v8 = [(RMSControlInterfaceMessage *)controlInterface dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"controlInterface"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_responseData];
    [v3 setObject:v9 forKey:@"responseData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RMSConnectToServiceResponseMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_controlInterface) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_responseCode;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[6] = self->_sessionIdentifier;
    *((unsigned char *)v4 + 28) |= 4u;
  }
  if (self->_controlInterface)
  {
    v6 = v4;
    objc_msgSend(v4, "setControlInterface:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = self->_responseData;
    *((unsigned char *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_responseCode;
    *(unsigned char *)(v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_sessionIdentifier;
    *(unsigned char *)(v5 + 28) |= 4u;
  }
  id v8 = [(RMSControlInterfaceMessage *)self->_controlInterface copyWithZone:a3];
  v9 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_responseData;
    *(unsigned char *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_responseCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  controlInterface = self->_controlInterface;
  if ((unint64_t)controlInterface | *((void *)v4 + 1))
  {
    if (!-[RMSControlInterfaceMessage isEqual:](controlInterface, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_responseData != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_responseCode;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_sessionIdentifier;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(RMSControlInterfaceMessage *)self->_controlInterface hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_responseData;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  unint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 28);
  if (v6)
  {
    self->_responseCode = v4[4];
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 28);
  }
  if ((v6 & 4) != 0)
  {
    self->_sessionIdentifier = v4[6];
    *(unsigned char *)&self->_has |= 4u;
  }
  controlInterface = self->_controlInterface;
  uint64_t v8 = *((void *)v5 + 1);
  if (controlInterface)
  {
    if (!v8) {
      goto LABEL_11;
    }
    v9 = v5;
    -[RMSControlInterfaceMessage mergeFrom:](controlInterface, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    v9 = v5;
    -[RMSConnectToServiceResponseMessage setControlInterface:](self, "setControlInterface:");
  }
  unint64_t v5 = v9;
LABEL_11:
  if ((v5[7] & 2) != 0)
  {
    self->_responseData = v5[5];
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x270F9A758]();
}

- (int)responseCode
{
  return self->_responseCode;
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (RMSControlInterfaceMessage)controlInterface
{
  return self->_controlInterface;
}

- (void)setControlInterface:(id)a3
{
}

- (int)responseData
{
  return self->_responseData;
}

- (void).cxx_destruct
{
}

@end