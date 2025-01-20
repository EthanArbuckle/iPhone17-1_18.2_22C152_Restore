@interface AWDMETRICSMCarrierComponentInfo
- (BOOL)hasBand;
- (BOOL)hasBandwidth;
- (BOOL)hasDuplex;
- (BOOL)hasEarfcn;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)duplexAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsDuplex:(id)a3;
- (int)StringAsType:(id)a3;
- (int)duplex;
- (int)type;
- (unint64_t)hash;
- (unsigned)band;
- (unsigned)bandwidth;
- (unsigned)earfcn;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBand:(unsigned int)a3;
- (void)setBandwidth:(unsigned int)a3;
- (void)setDuplex:(int)a3;
- (void)setEarfcn:(unsigned int)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasBandwidth:(BOOL)a3;
- (void)setHasDuplex:(BOOL)a3;
- (void)setHasEarfcn:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSMCarrierComponentInfo

- (void)setBand:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBand
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBandwidth:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bandwidth = a3;
}

- (void)setHasBandwidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBandwidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEarfcn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_earfcn = a3;
}

- (void)setHasEarfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEarfcn
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265443168[a3];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PCC"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SCC1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCC2"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SCC3"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SCC4"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SCC5"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SCC6"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SCC7"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)duplex
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_duplex;
  }
  else {
    return 1;
  }
}

- (void)setDuplex:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_duplex = a3;
}

- (void)setHasDuplex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDuplex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)duplexAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"FDD";
  }
  else if (a3 == 2)
  {
    int v4 = @"TDD";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsDuplex:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"FDD"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"TDD"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSMCarrierComponentInfo;
  int v4 = [(AWDMETRICSMCarrierComponentInfo *)&v8 description];
  v5 = [(AWDMETRICSMCarrierComponentInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_band];
    [v3 setObject:v5 forKey:@"band"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithUnsignedInt:self->_bandwidth];
  [v3 setObject:v6 forKey:@"bandwidth"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t type = self->_type;
    if (type >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_265443168[type];
    }
    [v3 setObject:v9 forKey:@"type"];

    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
LABEL_9:
  v7 = [NSNumber numberWithUnsignedInt:self->_earfcn];
  [v3 setObject:v7 forKey:@"earfcn"];

  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_14:
    int duplex = self->_duplex;
    if (duplex == 1)
    {
      v11 = @"FDD";
    }
    else if (duplex == 2)
    {
      v11 = @"TDD";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_duplex);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v11 forKey:@"duplex"];
  }
LABEL_20:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSMCarrierComponentInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_band;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_bandwidth;
  *((unsigned char *)v4 + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[5] = self->_earfcn;
  *((unsigned char *)v4 + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[6] = self->_type;
  *((unsigned char *)v4 + 28) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v4[4] = self->_duplex;
    *((unsigned char *)v4 + 28) |= 4u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_band;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_bandwidth;
  *((unsigned char *)result + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 5) = self->_earfcn;
  *((unsigned char *)result + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 6) = self->_type;
  *((unsigned char *)result + 28) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 4) = self->_duplex;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_band != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_bandwidth != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0 || self->_earfcn != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_duplex != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_band;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_bandwidth;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_earfcn;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_duplex;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_band = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bandwidth = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_earfcn = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_uint64_t type = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_6:
    self->_int duplex = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)bandwidth
{
  return self->_bandwidth;
}

- (unsigned)earfcn
{
  return self->_earfcn;
}

@end