@interface AWDAppRRCConnectionStats
- (BOOL)hasBundleBGDuration;
- (BOOL)hasBundleFGDuration;
- (BOOL)hasBundleName;
- (BOOL)hasNumMOConnectionTriggered;
- (BOOL)hasNumMTConnectionTriggered;
- (BOOL)hasRAT;
- (BOOL)hasTotalBytesTransferred;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rATAsString:(int)a3;
- (int)StringAsRAT:(id)a3;
- (int)rAT;
- (unint64_t)hash;
- (unsigned)bundleBGDuration;
- (unsigned)bundleFGDuration;
- (unsigned)numMOConnectionTriggered;
- (unsigned)numMTConnectionTriggered;
- (unsigned)totalBytesTransferred;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleBGDuration:(unsigned int)a3;
- (void)setBundleFGDuration:(unsigned int)a3;
- (void)setBundleName:(id)a3;
- (void)setHasBundleBGDuration:(BOOL)a3;
- (void)setHasBundleFGDuration:(BOOL)a3;
- (void)setHasNumMOConnectionTriggered:(BOOL)a3;
- (void)setHasNumMTConnectionTriggered:(BOOL)a3;
- (void)setHasRAT:(BOOL)a3;
- (void)setHasTotalBytesTransferred:(BOOL)a3;
- (void)setNumMOConnectionTriggered:(unsigned int)a3;
- (void)setNumMTConnectionTriggered:(unsigned int)a3;
- (void)setRAT:(int)a3;
- (void)setTotalBytesTransferred:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDAppRRCConnectionStats

- (void)dealloc
{
  [(AWDAppRRCConnectionStats *)self setBundleName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDAppRRCConnectionStats;
  [(AWDAppRRCConnectionStats *)&v3 dealloc];
}

- (int)rAT
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_rAT;
  }
  else {
    return 0;
  }
}

- (void)setRAT:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_rAT = a3;
}

- (void)setHasRAT:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRAT
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)rATAsString:(int)a3
{
  if (a3 >= 8) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9BE0[a3];
  }
}

- (int)StringAsRAT:(id)a3
{
  if ([a3 isEqualToString:@"RAT_TYPE_UNKNOWN"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"RAT_TYPE_UMTS"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"RAT_TYPE_GSM"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"RAT_TYPE_WCDMA"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"RAT_TYPE_1xEVDO"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"RAT_TYPE_LTE"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"RAT_TYPE_TDSCDMA"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"RAT_TYPE_TDLTE"]) {
    return 7;
  }
  return 0;
}

- (BOOL)hasBundleName
{
  return self->_bundleName != 0;
}

- (void)setBundleFGDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bundleFGDuration = a3;
}

- (void)setHasBundleFGDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBundleFGDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBundleBGDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bundleBGDuration = a3;
}

- (void)setHasBundleBGDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBundleBGDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumMOConnectionTriggered:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numMOConnectionTriggered = a3;
}

- (void)setHasNumMOConnectionTriggered:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumMOConnectionTriggered
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumMTConnectionTriggered:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numMTConnectionTriggered = a3;
}

- (void)setHasNumMTConnectionTriggered:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumMTConnectionTriggered
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTotalBytesTransferred:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_totalBytesTransferred = a3;
}

- (void)setHasTotalBytesTransferred:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTotalBytesTransferred
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDAppRRCConnectionStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDAppRRCConnectionStats description](&v3, sel_description), -[AWDAppRRCConnectionStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t rAT = self->_rAT;
    if (rAT >= 8) {
      v5 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_rAT];
    }
    else {
      v5 = off_2641B9BE0[rAT];
    }
    [v3 setObject:v5 forKey:@"RAT"];
  }
  bundleName = self->_bundleName;
  if (bundleName) {
    [v3 setObject:bundleName forKey:@"bundleName"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bundleFGDuration] forKey:@"bundleFGDuration"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bundleBGDuration] forKey:@"bundleBGDuration"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
LABEL_18:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numMTConnectionTriggered] forKey:@"numMTConnectionTriggered"];
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numMOConnectionTriggered] forKey:@"numMOConnectionTriggered"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_18;
  }
LABEL_12:
  if ((has & 0x20) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalBytesTransferred] forKey:@"totalBytesTransferred"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDAppRRCConnectionStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bundleName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_14:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_14;
  }
LABEL_9:
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_rAT;
    *((unsigned char *)a3 + 40) |= 0x10u;
  }
  if (self->_bundleName) {
    [a3 setBundleName:];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_bundleFGDuration;
    *((unsigned char *)a3 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 2) = self->_bundleBGDuration;
  *((unsigned char *)a3 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 6) = self->_numMOConnectionTriggered;
  *((unsigned char *)a3 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_15:
  *((_DWORD *)a3 + 7) = self->_numMTConnectionTriggered;
  *((unsigned char *)a3 + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 9) = self->_totalBytesTransferred;
  *((unsigned char *)a3 + 40) |= 0x20u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_rAT;
    *(unsigned char *)(v5 + 40) |= 0x10u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_bundleName copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_bundleFGDuration;
    *(unsigned char *)(v6 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 8) = self->_bundleBGDuration;
  *(unsigned char *)(v6 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(_DWORD *)(v6 + 28) = self->_numMTConnectionTriggered;
    *(unsigned char *)(v6 + 40) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 24) = self->_numMOConnectionTriggered;
  *(unsigned char *)(v6 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 36) = self->_totalBytesTransferred;
    *(unsigned char *)(v6 + 40) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x10) == 0 || self->_rAT != *((_DWORD *)a3 + 8)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
    {
LABEL_34:
      LOBYTE(v5) = 0;
      return v5;
    }
    bundleName = self->_bundleName;
    if ((unint64_t)bundleName | *((void *)a3 + 2))
    {
      int v5 = -[NSString isEqual:](bundleName, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_bundleFGDuration != *((_DWORD *)a3 + 3)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
      goto LABEL_34;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_bundleBGDuration != *((_DWORD *)a3 + 2)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_34;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_numMOConnectionTriggered != *((_DWORD *)a3 + 6)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_numMTConnectionTriggered != *((_DWORD *)a3 + 7)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 8) != 0)
    {
      goto LABEL_34;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x20) == 0 || self->_totalBytesTransferred != *((_DWORD *)a3 + 9)) {
        goto LABEL_34;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v3 = 2654435761 * self->_rAT;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_bundleName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_bundleFGDuration;
    if (*(unsigned char *)&self->_has)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_bundleBGDuration;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_numMOConnectionTriggered;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_numMTConnectionTriggered;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_totalBytesTransferred;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
  {
    self->_uint64_t rAT = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDAppRRCConnectionStats setBundleName:](self, "setBundleName:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_bundleFGDuration = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_bundleBGDuration = *((_DWORD *)a3 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_numMOConnectionTriggered = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_15:
  self->_numMTConnectionTriggered = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 40) & 0x20) == 0) {
    return;
  }
LABEL_10:
  self->_totalBytesTransferred = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x20u;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (unsigned)bundleFGDuration
{
  return self->_bundleFGDuration;
}

- (unsigned)bundleBGDuration
{
  return self->_bundleBGDuration;
}

- (unsigned)numMOConnectionTriggered
{
  return self->_numMOConnectionTriggered;
}

- (unsigned)numMTConnectionTriggered
{
  return self->_numMTConnectionTriggered;
}

- (unsigned)totalBytesTransferred
{
  return self->_totalBytesTransferred;
}

@end