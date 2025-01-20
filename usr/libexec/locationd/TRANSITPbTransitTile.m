@interface TRANSITPbTransitTile
- (BOOL)hasDEPRECATEDFingerprints;
- (BOOL)hasExpirationAgeSecs;
- (BOOL)hasFingerprints;
- (BOOL)hasGenerationTimeSecs;
- (BOOL)hasMarketId;
- (BOOL)hasSecurityKey;
- (BOOL)hasTileX;
- (BOOL)hasTileY;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TRANSITPbLocationFingerprints)fingerprints;
- (TRANSITPbLocationFingerprintsV1)dEPRECATEDFingerprints;
- (double)generationTimeSecs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)expirationAgeSecs;
- (int)tileX;
- (int)tileY;
- (int)version;
- (unint64_t)hash;
- (unint64_t)marketId;
- (unint64_t)securityKey;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDEPRECATEDFingerprints:(id)a3;
- (void)setExpirationAgeSecs:(int)a3;
- (void)setFingerprints:(id)a3;
- (void)setGenerationTimeSecs:(double)a3;
- (void)setHasExpirationAgeSecs:(BOOL)a3;
- (void)setHasGenerationTimeSecs:(BOOL)a3;
- (void)setHasMarketId:(BOOL)a3;
- (void)setHasSecurityKey:(BOOL)a3;
- (void)setHasTileX:(BOOL)a3;
- (void)setHasTileY:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMarketId:(unint64_t)a3;
- (void)setSecurityKey:(unint64_t)a3;
- (void)setTileX:(int)a3;
- (void)setTileY:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbTransitTile

- (void)dealloc
{
  [(TRANSITPbTransitTile *)self setDEPRECATEDFingerprints:0];
  [(TRANSITPbTransitTile *)self setFingerprints:0];
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbTransitTile;
  [(TRANSITPbTransitTile *)&v3 dealloc];
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTileX:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_tileX = a3;
}

- (void)setHasTileX:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTileX
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTileY:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_tileY = a3;
}

- (void)setHasTileY:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTileY
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (unint64_t)securityKey
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_securityKey;
  }
  else {
    return -1;
  }
}

- (void)setSecurityKey:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_securityKey = a3;
}

- (void)setHasSecurityKey:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecurityKey
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setGenerationTimeSecs:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_generationTimeSecs = a3;
}

- (void)setHasGenerationTimeSecs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGenerationTimeSecs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExpirationAgeSecs:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_expirationAgeSecs = a3;
}

- (void)setHasExpirationAgeSecs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasExpirationAgeSecs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasDEPRECATEDFingerprints
{
  return self->_dEPRECATEDFingerprints != 0;
}

- (BOOL)hasFingerprints
{
  return self->_fingerprints != 0;
}

- (unint64_t)marketId
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_marketId;
  }
  else {
    return 0;
  }
}

- (void)setMarketId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_marketId = a3;
}

- (void)setHasMarketId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMarketId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbTransitTile;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbTransitTile *)&v3 description], [(TRANSITPbTransitTile *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_version)] forKey:@"version"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tileX)] forKey:@"tileX"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithInt:self->_tileY] forKey:@"tileY"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_securityKey)] forKey:@"securityKey"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_generationTimeSecs)] forKey:@"generationTimeSecs"];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_expirationAgeSecs)] forKey:@"expirationAgeSecs"];
LABEL_8:
  dEPRECATEDFingerprints = self->_dEPRECATEDFingerprints;
  if (dEPRECATEDFingerprints) {
    [v3 setObject:-[TRANSITPbLocationFingerprintsV1 dictionaryRepresentation](dEPRECATEDFingerprints, "dictionaryRepresentation") forKey:@"DEPRECATED_fingerprints"];
  }
  fingerprints = self->_fingerprints;
  if (fingerprints) {
    [v3 setObject:[[fingerprints dictionaryRepresentation] dictionaryRepresentation] forKey:@"fingerprints"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_marketId)] forKey:@"marketId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004FCB3C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
  if (self->_dEPRECATEDFingerprints) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_fingerprints)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_version;
    *((unsigned char *)a3 + 68) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 14) = self->_tileX;
  *((unsigned char *)a3 + 68) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 15) = self->_tileY;
  *((unsigned char *)a3 + 68) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 3) = self->_securityKey;
  *((unsigned char *)a3 + 68) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  *((void *)a3 + 1) = *(void *)&self->_generationTimeSecs;
  *((unsigned char *)a3 + 68) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)a3 + 10) = self->_expirationAgeSecs;
    *((unsigned char *)a3 + 68) |= 8u;
  }
LABEL_8:
  if (self->_dEPRECATEDFingerprints) {
    [a3 setDEPRECATEDFingerprints:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_marketId;
    *((unsigned char *)a3 + 68) |= 2u;
  }
  if (self->_fingerprints)
  {
    [a3 setFingerprints:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_version;
    *((unsigned char *)v5 + 68) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 14) = self->_tileX;
  *((unsigned char *)v5 + 68) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v5 + 15) = self->_tileY;
  *((unsigned char *)v5 + 68) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[3] = self->_securityKey;
  *((unsigned char *)v5 + 68) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v5[1] = *(id *)&self->_generationTimeSecs;
  *((unsigned char *)v5 + 68) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 10) = self->_expirationAgeSecs;
    *((unsigned char *)v5 + 68) |= 8u;
  }
LABEL_8:

  v6[4] = [(TRANSITPbLocationFingerprintsV1 *)self->_dEPRECATEDFingerprints copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6[2] = self->_marketId;
    *((unsigned char *)v6 + 68) |= 2u;
  }

  v6[6] = [(TRANSITPbLocationFingerprints *)self->_fingerprints copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 68) & 0x40) == 0 || self->_version != *((_DWORD *)a3 + 16)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 68) & 0x40) != 0)
    {
LABEL_42:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 68) & 0x10) == 0 || self->_tileX != *((_DWORD *)a3 + 14)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 68) & 0x10) != 0)
    {
      goto LABEL_42;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 68) & 0x20) == 0 || self->_tileY != *((_DWORD *)a3 + 15)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 68) & 0x20) != 0)
    {
      goto LABEL_42;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 68) & 4) == 0 || self->_securityKey != *((void *)a3 + 3)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 68) & 4) != 0)
    {
      goto LABEL_42;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 68) & 1) == 0 || self->_generationTimeSecs != *((double *)a3 + 1)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)a3 + 68))
    {
      goto LABEL_42;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 68) & 8) == 0 || self->_expirationAgeSecs != *((_DWORD *)a3 + 10)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 68) & 8) != 0)
    {
      goto LABEL_42;
    }
    dEPRECATEDFingerprints = self->_dEPRECATEDFingerprints;
    if ((unint64_t)dEPRECATEDFingerprints | *((void *)a3 + 4))
    {
      unsigned int v5 = -[TRANSITPbLocationFingerprintsV1 isEqual:](dEPRECATEDFingerprints, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 68) & 2) == 0 || self->_marketId != *((void *)a3 + 2)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 68) & 2) != 0)
    {
      goto LABEL_42;
    }
    fingerprints = self->_fingerprints;
    if ((unint64_t)fingerprints | *((void *)a3 + 6))
    {
      LOBYTE(v5) = -[TRANSITPbLocationFingerprints isEqual:](fingerprints, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v4 = 2654435761 * self->_version;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_tileX;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
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
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_tileY;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v12 = 0;
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v7 = 2654435761u * self->_securityKey;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  double generationTimeSecs = self->_generationTimeSecs;
  double v9 = -generationTimeSecs;
  if (generationTimeSecs >= 0.0) {
    double v9 = self->_generationTimeSecs;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_17:
  if ((has & 8) != 0) {
    uint64_t v13 = 2654435761 * self->_expirationAgeSecs;
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = [(TRANSITPbLocationFingerprintsV1 *)self->_dEPRECATEDFingerprints hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v15 = 2654435761u * self->_marketId;
  }
  else {
    unint64_t v15 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v12 ^ v13 ^ v15 ^ v14 ^ [(TRANSITPbLocationFingerprints *)self->_fingerprints hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 68);
  if ((v5 & 0x40) != 0)
  {
    self->_version = *((_DWORD *)a3 + 16);
    *(unsigned char *)&self->_has |= 0x40u;
    char v5 = *((unsigned char *)a3 + 68);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + 68) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_tileX = *((_DWORD *)a3 + 14);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 68);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_tileY = *((_DWORD *)a3 + 15);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 68);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_securityKey = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 68);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_double generationTimeSecs = *((double *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 68) & 8) != 0)
  {
LABEL_7:
    self->_expirationAgeSecs = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
  dEPRECATEDFingerprints = self->_dEPRECATEDFingerprints;
  uint64_t v7 = *((void *)a3 + 4);
  if (dEPRECATEDFingerprints)
  {
    if (v7) {
      -[TRANSITPbLocationFingerprintsV1 mergeFrom:](dEPRECATEDFingerprints, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[TRANSITPbTransitTile setDEPRECATEDFingerprints:](self, "setDEPRECATEDFingerprints:");
  }
  if ((*((unsigned char *)a3 + 68) & 2) != 0)
  {
    self->_marketId = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  fingerprints = self->_fingerprints;
  uint64_t v9 = *((void *)a3 + 6);
  if (fingerprints)
  {
    if (v9)
    {
      -[TRANSITPbLocationFingerprints mergeFrom:](fingerprints, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[TRANSITPbTransitTile setFingerprints:](self, "setFingerprints:");
  }
}

- (int)version
{
  return self->_version;
}

- (int)tileX
{
  return self->_tileX;
}

- (int)tileY
{
  return self->_tileY;
}

- (double)generationTimeSecs
{
  return self->_generationTimeSecs;
}

- (int)expirationAgeSecs
{
  return self->_expirationAgeSecs;
}

- (TRANSITPbLocationFingerprintsV1)dEPRECATEDFingerprints
{
  return self->_dEPRECATEDFingerprints;
}

- (void)setDEPRECATEDFingerprints:(id)a3
{
}

- (TRANSITPbLocationFingerprints)fingerprints
{
  return self->_fingerprints;
}

- (void)setFingerprints:(id)a3
{
}

@end