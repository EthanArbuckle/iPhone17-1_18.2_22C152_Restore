@interface _MRCryptoPairingMessageProtobuf
- (BOOL)hasIsRetrying;
- (BOOL)hasIsUsingSystemPairing;
- (BOOL)hasPairingData;
- (BOOL)hasState;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRetrying;
- (BOOL)isUsingSystemPairing;
- (BOOL)readFrom:(id)a3;
- (NSData)pairingData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)state;
- (int)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsRetrying:(BOOL)a3;
- (void)setHasIsUsingSystemPairing:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setIsRetrying:(BOOL)a3;
- (void)setIsUsingSystemPairing:(BOOL)a3;
- (void)setPairingData:(id)a3;
- (void)setState:(int)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRCryptoPairingMessageProtobuf

- (BOOL)hasPairingData
{
  return self->_pairingData != 0;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsRetrying:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isRetrying = a3;
}

- (void)setHasIsRetrying:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsRetrying
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsUsingSystemPairing:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isUsingSystemPairing = a3;
}

- (void)setHasIsUsingSystemPairing:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsUsingSystemPairing
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRCryptoPairingMessageProtobuf;
  v4 = [(_MRCryptoPairingMessageProtobuf *)&v8 description];
  v5 = [(_MRCryptoPairingMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  pairingData = self->_pairingData;
  if (pairingData) {
    [v3 setObject:pairingData forKey:@"pairingData"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_status];
    [v4 setObject:v9 forKey:@"status"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithBool:self->_isRetrying];
  [v4 setObject:v10 forKey:@"isRetrying"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  v11 = [NSNumber numberWithBool:self->_isUsingSystemPairing];
  [v4 setObject:v11 forKey:@"isUsingSystemPairing"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v7 = [NSNumber numberWithInt:self->_state];
    [v4 setObject:v7 forKey:@"state"];
  }
LABEL_8:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRCryptoPairingMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_pairingData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_pairingData)
  {
    id v6 = v4;
    objc_msgSend(v4, "setPairingData:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_status;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 24) = self->_isRetrying;
  *((unsigned char *)v4 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)v4 + 25) = self->_isUsingSystemPairing;
  *((unsigned char *)v4 + 28) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    *((_DWORD *)v4 + 4) = self->_state;
    *((unsigned char *)v4 + 28) |= 1u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_pairingData copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_status;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(unsigned char *)(v5 + 25) = self->_isUsingSystemPairing;
      *(unsigned char *)(v5 + 28) |= 8u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 24) = self->_isRetrying;
  *(unsigned char *)(v5 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    *(_DWORD *)(v5 + 16) = self->_state;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  pairingData = self->_pairingData;
  if ((unint64_t)pairingData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](pairingData, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_status != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0) {
      goto LABEL_29;
    }
    if (self->_isRetrying)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) != 0)
    {
      if (self->_isUsingSystemPairing)
      {
        if (!*((unsigned char *)v4 + 25)) {
          goto LABEL_29;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_25;
      }
    }
LABEL_29:
    BOOL v6 = 0;
    goto LABEL_30;
  }
  if ((*((unsigned char *)v4 + 28) & 8) != 0) {
    goto LABEL_29;
  }
LABEL_25:
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_state != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
    BOOL v6 = 1;
  }
LABEL_30:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_pairingData hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_status;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isRetrying;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isUsingSystemPairing;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_state;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[_MRCryptoPairingMessageProtobuf setPairingData:](self, "setPairingData:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_isRetrying = *((unsigned char *)v4 + 24);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  self->_isUsingSystemPairing = *((unsigned char *)v4 + 25);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 28))
  {
LABEL_7:
    self->_state = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
}

- (NSData)pairingData
{
  return self->_pairingData;
}

- (void)setPairingData:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (BOOL)isRetrying
{
  return self->_isRetrying;
}

- (BOOL)isUsingSystemPairing
{
  return self->_isUsingSystemPairing;
}

- (int)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end