@interface NPKProtoSecureElementSetNewAuthRandomResponse
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
- (void)setChallengeResponse:(id)a3;
- (void)setCryptogram:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSecureElementSetNewAuthRandomResponse

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasCryptogram
{
  return self->_cryptogram != 0;
}

- (BOOL)hasChallengeResponse
{
  return self->_challengeResponse != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSecureElementSetNewAuthRandomResponse;
  v4 = [(NPKProtoSecureElementSetNewAuthRandomResponse *)&v8 description];
  v5 = [(NPKProtoSecureElementSetNewAuthRandomResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v5 forKey:@"pending"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSecureElementSetNewAuthRandomResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_cryptogram)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_challengeResponse)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[24] = self->_pending;
    v4[28] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[25] = self->_success;
    v4[28] |= 2u;
  }
  id v6 = v4;
  if (self->_cryptogram)
  {
    objc_msgSend(v4, "setCryptogram:");
    id v4 = v6;
  }
  if (self->_challengeResponse)
  {
    objc_msgSend(v6, "setChallengeResponse:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[24] = self->_pending;
    v5[28] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[25] = self->_success;
    v5[28] |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_cryptogram copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  uint64_t v10 = [(NSData *)self->_challengeResponse copyWithZone:a3];
  v11 = (void *)v6[1];
  v6[1] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_22;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) != 0)
    {
      if (self->_success)
      {
        if (!*((unsigned char *)v4 + 25)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_18;
      }
    }
LABEL_22:
    char v7 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 28) & 2) != 0) {
    goto LABEL_22;
  }
LABEL_18:
  cryptogram = self->_cryptogram;
  if ((unint64_t)cryptogram | *((void *)v4 + 2) && !-[NSData isEqual:](cryptogram, "isEqual:")) {
    goto LABEL_22;
  }
  challengeResponse = self->_challengeResponse;
  if ((unint64_t)challengeResponse | *((void *)v4 + 1)) {
    char v7 = -[NSData isEqual:](challengeResponse, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_23:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_pending;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_success;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSData *)self->_cryptogram hash];
  return v5 ^ [(NSData *)self->_challengeResponse hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  char v5 = v4[28];
  if (v5)
  {
    self->_pending = v4[24];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = v4[28];
  }
  if ((v5 & 2) != 0)
  {
    self->_success = v4[25];
    *(unsigned char *)&self->_has |= 2u;
  }
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoSecureElementSetNewAuthRandomResponse setCryptogram:](self, "setCryptogram:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoSecureElementSetNewAuthRandomResponse setChallengeResponse:](self, "setChallengeResponse:");
    uint64_t v4 = v6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cryptogram, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
}

@end