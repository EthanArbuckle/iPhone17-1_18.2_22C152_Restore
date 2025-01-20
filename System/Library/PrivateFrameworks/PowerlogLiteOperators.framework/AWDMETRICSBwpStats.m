@interface AWDMETRICSBwpStats
- (BOOL)hasBandwidth;
- (BOOL)hasDuration;
- (BOOL)hasScsSpacing;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)bandwidthAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsBandwidth:(id)a3;
- (int)bandwidth;
- (unint64_t)hash;
- (unsigned)duration;
- (unsigned)scsSpacing;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBandwidth:(int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasBandwidth:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasScsSpacing:(BOOL)a3;
- (void)setScsSpacing:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSBwpStats

- (void)setScsSpacing:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_scsSpacing = a3;
}

- (void)setHasScsSpacing:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScsSpacing
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)bandwidth
{
  if (*(unsigned char *)&self->_has) {
    return self->_bandwidth;
  }
  else {
    return 0;
  }
}

- (void)setBandwidth:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bandwidth = a3;
}

- (void)setHasBandwidth:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBandwidth
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)bandwidthAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6929CE8[a3];
  }
  return v3;
}

- (int)StringAsBandwidth:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NR5G_BW_5MHz"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_10MHz"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_15MHz"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_20MHz"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_25MHz"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_30MHz"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_35MHz"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_40MHz"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_45MHz"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_50MHz"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_60MHz"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_70MHz"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_80MHz"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_90MHz"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_100MHz"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_200MHz"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_400MHz"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"NR5G_BW_INVALID"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSBwpStats;
  int v4 = [(AWDMETRICSBwpStats *)&v8 description];
  v5 = [(AWDMETRICSBwpStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    v6 = [NSNumber numberWithUnsignedInt:self->_duration];
    [v3 setObject:v6 forKey:@"duration"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
LABEL_7:
    uint64_t bandwidth = self->_bandwidth;
    if (bandwidth >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_bandwidth);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E6929CE8[bandwidth];
    }
    [v3 setObject:v8 forKey:@"bandwidth"];

    goto LABEL_11;
  }
  v5 = [NSNumber numberWithUnsignedInt:self->_scsSpacing];
  [v3 setObject:v5 forKey:@"scs_spacing"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (has) {
    goto LABEL_7;
  }
LABEL_11:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSBwpStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_scsSpacing;
    *((unsigned char *)v4 + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_duration;
  *((unsigned char *)v4 + 20) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[2] = self->_bandwidth;
    *((unsigned char *)v4 + 20) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_scsSpacing;
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
  *((_DWORD *)result + 3) = self->_duration;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_bandwidth;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_scsSpacing != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_bandwidth != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

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
  uint64_t v2 = 2654435761 * self->_scsSpacing;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_duration;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_bandwidth;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) != 0)
  {
    self->_scsSpacing = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 20))
  {
LABEL_4:
    self->_uint64_t bandwidth = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (unsigned)scsSpacing
{
  return self->_scsSpacing;
}

- (unsigned)duration
{
  return self->_duration;
}

@end