@interface AWDAppBBPower
- (BOOL)hasBundleName;
- (BOOL)hasPowerMicroWatt;
- (BOOL)hasRAT;
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
- (unsigned)powerMicroWatt;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleName:(id)a3;
- (void)setHasPowerMicroWatt:(BOOL)a3;
- (void)setHasRAT:(BOOL)a3;
- (void)setPowerMicroWatt:(unsigned int)a3;
- (void)setRAT:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDAppBBPower

- (void)dealloc
{
  [(AWDAppBBPower *)self setBundleName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDAppBBPower;
  [(AWDAppBBPower *)&v3 dealloc];
}

- (int)rAT
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_rAT;
  }
  else {
    return 0;
  }
}

- (void)setRAT:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rAT = a3;
}

- (void)setHasRAT:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRAT
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)rATAsString:(int)a3
{
  if (a3 >= 8) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9BA0[a3];
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

- (void)setPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_powerMicroWatt = a3;
}

- (void)setHasPowerMicroWatt:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPowerMicroWatt
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDAppBBPower;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDAppBBPower description](&v3, sel_description), -[AWDAppBBPower dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t rAT = self->_rAT;
    if (rAT >= 8) {
      v5 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_rAT];
    }
    else {
      v5 = off_2641B9BA0[rAT];
    }
    [v3 setObject:v5 forKey:@"RAT"];
  }
  bundleName = self->_bundleName;
  if (bundleName) {
    [v3 setObject:bundleName forKey:@"bundleName"];
  }
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_powerMicroWatt] forKey:@"powerMicroWatt"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDAppBBPowerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bundleName) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_rAT;
    *((unsigned char *)a3 + 24) |= 2u;
  }
  if (self->_bundleName) {
    [a3 setBundleName:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_powerMicroWatt;
    *((unsigned char *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_rAT;
    *(unsigned char *)(v5 + 24) |= 2u;
  }

  *(void *)(v6 + 8) = [(NSString *)self->_bundleName copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_powerMicroWatt;
    *(unsigned char *)(v6 + 24) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_rAT != *((_DWORD *)a3 + 5)) {
        goto LABEL_14;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    bundleName = self->_bundleName;
    if ((unint64_t)bundleName | *((void *)a3 + 1))
    {
      int v5 = -[NSString isEqual:](bundleName, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
    if (has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_powerMicroWatt != *((_DWORD *)a3 + 4)) {
        goto LABEL_14;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_rAT;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_bundleName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_powerMicroWatt;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 24) & 2) != 0)
  {
    self->_uint64_t rAT = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 1)) {
    -[AWDAppBBPower setBundleName:](self, "setBundleName:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_powerMicroWatt = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (unsigned)powerMicroWatt
{
  return self->_powerMicroWatt;
}

@end