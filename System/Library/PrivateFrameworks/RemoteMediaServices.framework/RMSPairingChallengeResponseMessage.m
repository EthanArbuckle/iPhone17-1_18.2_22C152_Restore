@interface RMSPairingChallengeResponseMessage
- (BOOL)hasCode;
- (BOOL)hasSessionIdentifier;
- (BOOL)hasUserCancelled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userCancelled;
- (NSString)code;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(id)a3;
- (void)setHasSessionIdentifier:(BOOL)a3;
- (void)setHasUserCancelled:(BOOL)a3;
- (void)setSessionIdentifier:(int)a3;
- (void)setUserCancelled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSPairingChallengeResponseMessage

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

- (BOOL)hasCode
{
  return self->_code != 0;
}

- (void)setUserCancelled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_userCancelled = a3;
}

- (void)setHasUserCancelled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserCancelled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSPairingChallengeResponseMessage;
  v4 = [(RMSPairingChallengeResponseMessage *)&v8 description];
  v5 = [(RMSPairingChallengeResponseMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_sessionIdentifier];
    [v3 setObject:v4 forKey:@"sessionIdentifier"];
  }
  code = self->_code;
  if (code) {
    [v3 setObject:code forKey:@"code"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_userCancelled];
    [v3 setObject:v6 forKey:@"userCancelled"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RMSPairingChallengeResponseMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_code)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_sessionIdentifier;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_code)
  {
    id v5 = v4;
    objc_msgSend(v4, "setCode:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 20) = self->_userCancelled;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_sessionIdentifier;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_code copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 20) = self->_userCancelled;
    *(unsigned char *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 4)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_12;
  }
  code = self->_code;
  if ((unint64_t)code | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](code, "isEqual:")) {
      goto LABEL_12;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) != 0)
    {
      if (self->_userCancelled)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_12;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_12;
      }
      BOOL v7 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v7 = 0;
  }
LABEL_13:

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
  NSUInteger v4 = [(NSString *)self->_code hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_userCancelled;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 24))
  {
    self->_sessionIdentifier = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[RMSPairingChallengeResponseMessage setCode:](self, "setCode:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_userCancelled = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (BOOL)userCancelled
{
  return self->_userCancelled;
}

- (void).cxx_destruct
{
}

@end