@interface NPKProtoSecureElementGetPairingInfoResponse
- (BOOL)authRandomSet;
- (BOOL)hasAuthRandomSet;
- (BOOL)hasChallengeResponse;
- (BOOL)hasCryptogram;
- (BOOL)hasPending;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)challengeResponse;
- (NSData)cryptogram;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthRandomSet:(BOOL)a3;
- (void)setChallengeResponse:(id)a3;
- (void)setCryptogram:(id)a3;
- (void)setHasAuthRandomSet:(BOOL)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSecureElementGetPairingInfoResponse

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPending
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasCryptogram
{
  return self->_cryptogram != 0;
}

- (BOOL)hasChallengeResponse
{
  return self->_challengeResponse != 0;
}

- (void)setAuthRandomSet:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_authRandomSet = a3;
}

- (void)setHasAuthRandomSet:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthRandomSet
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSecureElementGetPairingInfoResponse;
  v4 = [(NPKProtoSecureElementGetPairingInfoResponse *)&v8 description];
  v5 = [(NPKProtoSecureElementGetPairingInfoResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v5 forKey:@"pending"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_success];
    [v3 setObject:v6 forKey:@"success"];
  }
  cryptogram = self->_cryptogram;
  if (cryptogram) {
    [v3 setObject:cryptogram forKey:@"cryptogram"];
  }
  challengeResponse = self->_challengeResponse;
  if (challengeResponse) {
    [v3 setObject:challengeResponse forKey:@"challengeResponse"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithBool:self->_authRandomSet];
    [v3 setObject:v9 forKey:@"authRandomSet"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSecureElementGetPairingInfoResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_cryptogram) {
    PBDataWriterWriteDataField();
  }
  if (self->_challengeResponse) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[25] = self->_pending;
    v4[28] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[26] = self->_success;
    v4[28] |= 4u;
  }
  v6 = v4;
  if (self->_cryptogram)
  {
    objc_msgSend(v4, "setCryptogram:");
    v4 = v6;
  }
  if (self->_challengeResponse)
  {
    objc_msgSend(v6, "setChallengeResponse:");
    v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_authRandomSet;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[25] = self->_pending;
    v5[28] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v5[26] = self->_success;
    v5[28] |= 4u;
  }
  uint64_t v8 = [(NSData *)self->_cryptogram copyWithZone:a3];
  v9 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v8;

  uint64_t v10 = [(NSData *)self->_challengeResponse copyWithZone:a3];
  v11 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v10;

  if (*(unsigned char *)&self->_has)
  {
    v6[24] = self->_authRandomSet;
    v6[28] |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_24;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0) {
      goto LABEL_24;
    }
    if (self->_success)
    {
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 26))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_24;
  }
  cryptogram = self->_cryptogram;
  if ((unint64_t)cryptogram | *((void *)v4 + 2) && !-[NSData isEqual:](cryptogram, "isEqual:")) {
    goto LABEL_24;
  }
  challengeResponse = self->_challengeResponse;
  if ((unint64_t)challengeResponse | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](challengeResponse, "isEqual:")) {
      goto LABEL_24;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_authRandomSet)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_24;
        }
      }
      else if (*((unsigned char *)v4 + 24))
      {
        goto LABEL_24;
      }
      BOOL v7 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v7 = 0;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_pending;
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
      uint64_t v4 = 2654435761 * self->_success;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSData *)self->_cryptogram hash];
  uint64_t v6 = [(NSData *)self->_challengeResponse hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_authRandomSet;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  char v5 = v4[28];
  if ((v5 & 2) != 0)
  {
    self->_pending = v4[25];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = v4[28];
  }
  if ((v5 & 4) != 0)
  {
    self->_success = v4[26];
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoSecureElementGetPairingInfoResponse setCryptogram:](self, "setCryptogram:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoSecureElementGetPairingInfoResponse setChallengeResponse:](self, "setChallengeResponse:");
    uint64_t v4 = v6;
  }
  if (v4[28])
  {
    self->_authRandomSet = v4[24];
    *(unsigned char *)&self->_has |= 1u;
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

- (NSData)cryptogram
{
  return self->_cryptogram;
}

- (void)setCryptogram:(id)a3
{
}

- (NSData)challengeResponse
{
  return self->_challengeResponse;
}

- (void)setChallengeResponse:(id)a3
{
}

- (BOOL)authRandomSet
{
  return self->_authRandomSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cryptogram, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
}

@end