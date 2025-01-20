@interface NRPBWatchPairingExtendedMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBWatchPairingExtendedMetadata

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBWatchPairingExtendedMetadata;
  v3 = [(NRPBWatchPairingExtendedMetadata *)&v7 description];
  v4 = [(NRPBWatchPairingExtendedMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  productType = self->_productType;
  if (productType) {
    [v3 setObject:productType forKey:@"productType"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = +[NSNumber numberWithInt:self->_chipID];
    [v4 setObject:v9 forKey:@"chipID"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  v10 = +[NSNumber numberWithBool:self->_postFailsafeObliteration];
  [v4 setObject:v10 forKey:@"postFailsafeObliteration"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  v11 = +[NSNumber numberWithLongLong:self->_pairingVersion];
  [v4 setObject:v11 forKey:@"pairingVersion"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  v12 = +[NSNumber numberWithBool:self->_supportsTokyoBayAquaLine];
  [v4 setObject:v12 forKey:@"supportsTokyoBayAquaLine"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  v13 = +[NSNumber numberWithBool:self->_isCellularEnabled];
  [v4 setObject:v13 forKey:@"isCellularEnabled"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_encodedSystemVersion];
    [v4 setObject:v7 forKey:@"encodedSystemVersion"];
  }
LABEL_10:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008750C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(NSString *)self->_productType copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_chipID;
    *((unsigned char *)v5 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 33) = self->_postFailsafeObliteration;
  *((unsigned char *)v5 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  v5[1] = self->_pairingVersion;
  *((unsigned char *)v5 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *((unsigned char *)v5 + 32) = self->_isCellularEnabled;
    *((unsigned char *)v5 + 36) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v5;
    }
    goto LABEL_7;
  }
LABEL_12:
  *((unsigned char *)v5 + 34) = self->_supportsTokyoBayAquaLine;
  *((unsigned char *)v5 + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 5) = self->_encodedSystemVersion;
    *((unsigned char *)v5 + 36) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_42;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_chipID != *((_DWORD *)v4 + 4)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0) {
      goto LABEL_42;
    }
    if (self->_postFailsafeObliteration)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_pairingVersion != *((void *)v4 + 1)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0) {
      goto LABEL_42;
    }
    if (self->_supportsTokyoBayAquaLine)
    {
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)v4 + 34))
    {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) != 0)
    {
      if (self->_isCellularEnabled)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_42;
        }
        goto LABEL_38;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_38;
      }
    }
LABEL_42:
    BOOL v6 = 0;
    goto LABEL_43;
  }
  if ((*((unsigned char *)v4 + 36) & 8) != 0) {
    goto LABEL_42;
  }
LABEL_38:
  BOOL v6 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_encodedSystemVersion != *((_DWORD *)v4 + 5)) {
      goto LABEL_42;
    }
    BOOL v6 = 1;
  }
LABEL_43:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_productType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_chipID;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_postFailsafeObliteration;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_pairingVersion;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_supportsTokyoBayAquaLine;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_isCellularEnabled;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_encodedSystemVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void).cxx_destruct
{
}

@end