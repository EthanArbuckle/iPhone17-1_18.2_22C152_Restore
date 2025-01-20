@interface AWDRATConnectedPower
- (BOOL)hasPowerConnSetupMicroWatt;
- (BOOL)hasPowerConnectedMicroWatt;
- (BOOL)hasRAT;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rATAsString:(int)a3;
- (int)StringAsRAT:(id)a3;
- (int)rAT;
- (unint64_t)hash;
- (unsigned)powerConnSetupMicroWatt;
- (unsigned)powerConnectedMicroWatt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPowerConnSetupMicroWatt:(BOOL)a3;
- (void)setHasPowerConnectedMicroWatt:(BOOL)a3;
- (void)setHasRAT:(BOOL)a3;
- (void)setPowerConnSetupMicroWatt:(unsigned int)a3;
- (void)setPowerConnectedMicroWatt:(unsigned int)a3;
- (void)setRAT:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDRATConnectedPower

- (int)rAT
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_rAT;
  }
  else {
    return 0;
  }
}

- (void)setRAT:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rAT = a3;
}

- (void)setHasRAT:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRAT
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)rATAsString:(int)a3
{
  if (a3 >= 8) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9C40[a3];
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

- (void)setPowerConnectedMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_powerConnectedMicroWatt = a3;
}

- (void)setHasPowerConnectedMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPowerConnectedMicroWatt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPowerConnSetupMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_powerConnSetupMicroWatt = a3;
}

- (void)setHasPowerConnSetupMicroWatt:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPowerConnSetupMicroWatt
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDRATConnectedPower;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDRATConnectedPower description](&v3, sel_description), -[AWDRATConnectedPower dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t rAT = self->_rAT;
    if (rAT >= 8) {
      v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_rAT];
    }
    else {
      v6 = off_2641B9C40[rAT];
    }
    [v3 setObject:v6 forKey:@"RAT"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_powerConnectedMicroWatt] forKey:@"powerConnectedMicroWatt"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_powerConnSetupMicroWatt] forKey:@"powerConnSetupMicroWatt"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDRATConnectedPowerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 1) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_rAT;
    *((unsigned char *)a3 + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 2) = self->_powerConnSetupMicroWatt;
      *((unsigned char *)a3 + 20) |= 1u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_powerConnectedMicroWatt;
  *((unsigned char *)a3 + 20) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_rAT;
    *((unsigned char *)result + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_powerConnectedMicroWatt;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_powerConnSetupMicroWatt;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 20) & 4) == 0 || self->_rAT != *((_DWORD *)a3 + 4)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 20) & 4) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 20) & 2) == 0 || self->_powerConnectedMicroWatt != *((_DWORD *)a3 + 3)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 20) & 2) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_powerConnSetupMicroWatt != *((_DWORD *)a3 + 2)) {
        goto LABEL_16;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_rAT;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_powerConnectedMicroWatt;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_powerConnSetupMicroWatt;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 20);
  if ((v3 & 4) != 0)
  {
    self->_uint64_t rAT = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 20);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        return;
      }
LABEL_7:
      self->_powerConnSetupMicroWatt = *((_DWORD *)a3 + 2);
      *(unsigned char *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_powerConnectedMicroWatt = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 20)) {
    goto LABEL_7;
  }
}

- (unsigned)powerConnectedMicroWatt
{
  return self->_powerConnectedMicroWatt;
}

- (unsigned)powerConnSetupMicroWatt
{
  return self->_powerConnSetupMicroWatt;
}

@end