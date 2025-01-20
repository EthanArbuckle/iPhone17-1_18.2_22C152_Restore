@interface NRPBDeviceWillUnpairRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBDeviceWillUnpairRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBDeviceWillUnpairRequest;
  v3 = [(NRPBDeviceWillUnpairRequest *)&v7 description];
  v4 = [(NRPBDeviceWillUnpairRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  advertisedName = self->_advertisedName;
  if (advertisedName) {
    [v3 setObject:advertisedName forKey:@"advertisedName"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_shouldObliterate];
    [v4 setObject:v7 forKey:@"shouldObliterate"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = +[NSNumber numberWithInt:self->_pairingFailureCode];
    [v4 setObject:v8 forKey:@"pairingFailureCode"];
  }
  abortReason = self->_abortReason;
  if (abortReason) {
    [v4 setObject:abortReason forKey:@"abortReason"];
  }
  char v10 = (char)self->_has;
  if ((v10 & 2) != 0)
  {
    v11 = +[NSNumber numberWithBool:self->_shouldBrick];
    [v4 setObject:v11 forKey:@"shouldBrick"];

    char v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    v12 = +[NSNumber numberWithBool:self->_shouldPreserveESim];
    [v4 setObject:v12 forKey:@"shouldPreserveESim"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009D0F4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteStringField();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_abortReason) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
  }
  if ((v5 & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_advertisedName copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v5 + 29) = self->_shouldObliterate;
    *((unsigned char *)v5 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 6) = self->_pairingFailureCode;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v9 = [(NSString *)self->_abortReason copyWithZone:a3];
  char v10 = (void *)v5[1];
  v5[1] = v9;

  char v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    *((unsigned char *)v5 + 28) = self->_shouldBrick;
    *((unsigned char *)v5 + 32) |= 2u;
    char v11 = (char)self->_has;
  }
  if ((v11 & 8) != 0)
  {
    *((unsigned char *)v5 + 30) = self->_shouldPreserveESim;
    *((unsigned char *)v5 + 32) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  advertisedName = self->_advertisedName;
  if ((unint64_t)advertisedName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](advertisedName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0) {
      goto LABEL_30;
    }
    if (self->_shouldObliterate)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_pairingFailureCode != *((_DWORD *)v4 + 6)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_30;
  }
  abortReason = self->_abortReason;
  if ((unint64_t)abortReason | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](abortReason, "isEqual:")) {
      goto LABEL_30;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0) {
      goto LABEL_30;
    }
    if (self->_shouldBrick)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_30;
  }
  BOOL v8 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) != 0)
    {
      if (self->_shouldPreserveESim)
      {
        if (!*((unsigned char *)v4 + 30)) {
          goto LABEL_30;
        }
      }
      else if (*((unsigned char *)v4 + 30))
      {
        goto LABEL_30;
      }
      BOOL v8 = 1;
      goto LABEL_31;
    }
LABEL_30:
    BOOL v8 = 0;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_advertisedName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_shouldObliterate;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_pairingFailureCode;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_abortReason hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_shouldBrick;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_shouldPreserveESim;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisedName, 0);

  objc_storeStrong((id *)&self->_abortReason, 0);
}

@end