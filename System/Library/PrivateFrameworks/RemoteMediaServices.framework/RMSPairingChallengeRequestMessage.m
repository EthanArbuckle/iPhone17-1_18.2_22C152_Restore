@interface RMSPairingChallengeRequestMessage
- (BOOL)hasPairingCredentials;
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (RMSPairingCredentialsMessage)pairingCredentials;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSessionIdentifier:(BOOL)a3;
- (void)setPairingCredentials:(id)a3;
- (void)setSessionIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSPairingChallengeRequestMessage

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

- (BOOL)hasPairingCredentials
{
  return self->_pairingCredentials != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSPairingChallengeRequestMessage;
  v4 = [(RMSPairingChallengeRequestMessage *)&v8 description];
  v5 = [(RMSPairingChallengeRequestMessage *)self dictionaryRepresentation];
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
  pairingCredentials = self->_pairingCredentials;
  if (pairingCredentials)
  {
    v6 = [(RMSPairingCredentialsMessage *)pairingCredentials dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"pairingCredentials"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RMSPairingChallengeRequestMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_pairingCredentials)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_sessionIdentifier;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_pairingCredentials)
  {
    id v5 = v4;
    objc_msgSend(v4, "setPairingCredentials:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_sessionIdentifier;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(RMSPairingCredentialsMessage *)self->_pairingCredentials copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  pairingCredentials = self->_pairingCredentials;
  if ((unint64_t)pairingCredentials | *((void *)v4 + 1)) {
    char v6 = -[RMSPairingCredentialsMessage isEqual:](pairingCredentials, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_sessionIdentifier;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(RMSPairingCredentialsMessage *)self->_pairingCredentials hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[5])
  {
    self->_sessionIdentifier = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  pairingCredentials = self->_pairingCredentials;
  uint64_t v7 = *((void *)v5 + 1);
  if (pairingCredentials)
  {
    if (v7) {
      -[RMSPairingCredentialsMessage mergeFrom:](pairingCredentials, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[RMSPairingChallengeRequestMessage setPairingCredentials:](self, "setPairingCredentials:");
  }
  MEMORY[0x270F9A758]();
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (RMSPairingCredentialsMessage)pairingCredentials
{
  return self->_pairingCredentials;
}

- (void)setPairingCredentials:(id)a3
{
}

- (void).cxx_destruct
{
}

@end