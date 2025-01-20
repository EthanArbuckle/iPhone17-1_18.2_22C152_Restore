@interface TVRMSConnectToServiceResponseMessage
- (BOOL)hasControlInterface;
- (BOOL)hasResponseCode;
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TVRMSControlInterfaceMessage)controlInterface;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)responseCode;
- (int)sessionIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setControlInterface:(id)a3;
- (void)setHasResponseCode:(BOOL)a3;
- (void)setHasSessionIdentifier:(BOOL)a3;
- (void)setResponseCode:(int)a3;
- (void)setSessionIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSConnectToServiceResponseMessage

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
  *(unsigned char *)&self->_has |= 2u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionIdentifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasControlInterface
{
  return self->_controlInterface != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSConnectToServiceResponseMessage;
  v4 = [(TVRMSConnectToServiceResponseMessage *)&v8 description];
  v5 = [(TVRMSConnectToServiceResponseMessage *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_sessionIdentifier];
    [v3 setObject:v6 forKey:@"sessionIdentifier"];
  }
  controlInterface = self->_controlInterface;
  if (controlInterface)
  {
    objc_super v8 = [(TVRMSControlInterfaceMessage *)controlInterface dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"controlInterface"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSConnectToServiceResponseMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_controlInterface)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_responseCode;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[5] = self->_sessionIdentifier;
    *((unsigned char *)v4 + 24) |= 2u;
  }
  if (self->_controlInterface)
  {
    id v6 = v4;
    objc_msgSend(v4, "setControlInterface:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_responseCode;
    *(unsigned char *)(v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_sessionIdentifier;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  id v8 = [(TVRMSControlInterfaceMessage *)self->_controlInterface copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_responseCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  controlInterface = self->_controlInterface;
  if ((unint64_t)controlInterface | *((void *)v4 + 1)) {
    char v6 = -[TVRMSControlInterfaceMessage isEqual:](controlInterface, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_responseCode;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(TVRMSControlInterfaceMessage *)self->_controlInterface hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_sessionIdentifier;
  return v3 ^ v2 ^ [(TVRMSControlInterfaceMessage *)self->_controlInterface hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 24);
  if (v6)
  {
    self->_responseCode = v4[4];
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 24);
  }
  if ((v6 & 2) != 0)
  {
    self->_sessionIdentifier = v4[5];
    *(unsigned char *)&self->_has |= 2u;
  }
  controlInterface = self->_controlInterface;
  uint64_t v8 = *((void *)v5 + 1);
  if (controlInterface)
  {
    if (v8) {
      -[TVRMSControlInterfaceMessage mergeFrom:](controlInterface, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[TVRMSConnectToServiceResponseMessage setControlInterface:](self, "setControlInterface:");
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

- (TVRMSControlInterfaceMessage)controlInterface
{
  return self->_controlInterface;
}

- (void)setControlInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end