@interface DYNAMICRATSELECTIONDynamicRatSelectionMetrics
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation DYNAMICRATSELECTIONDynamicRatSelectionMetrics

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)DYNAMICRATSELECTIONDynamicRatSelectionMetrics;
  return +[NSString stringWithFormat:@"%@ %@", [(DYNAMICRATSELECTIONDynamicRatSelectionMetrics *)&v3 description], [(DYNAMICRATSELECTIONDynamicRatSelectionMetrics *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t ratType = self->_ratType;
    if (ratType >= 4) {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_ratType];
    }
    else {
      v6 = off_10020D918[ratType];
    }
    [v3 setObject:v6 forKey:@"ratType"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t bbChipset = self->_bbChipset;
    if (bbChipset >= 3) {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_bbChipset];
    }
    else {
      v8 = off_10020D938[bbChipset];
    }
    [v3 setObject:v8 forKey:@"bbChipset"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc)] forKey:@"mcc"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_13;
  }
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc)] forKey:@"mnc"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bandwidthInMhz)] forKey:@"bandwidthInMhz"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_downlinkThroughputInMbps)] forKey:@"downlinkThroughputInMbps"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      goto LABEL_17;
    }
LABEL_25:
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_throughputCount)] forKey:@"throughputCount"];
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_18;
  }
LABEL_24:
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_mmWavePresent)] forKey:@"mmWavePresent"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_25;
  }
LABEL_17:
  if ((has & 4) != 0) {
LABEL_18:
  }
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_count)] forKey:@"count"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100037100((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((has & 4) == 0) {
    return;
  }
LABEL_19:

  PBDataWriterWriteUint32Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)result + 8) = self->_ratType;
    *((_WORD *)result + 22) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_bbChipset;
  *((_WORD *)result + 22) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 6) = self->_mcc;
  *((_WORD *)result + 22) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_mnc;
  *((_WORD *)result + 22) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 2) = self->_bandwidthInMhz;
  *((_WORD *)result + 22) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_downlinkThroughputInMbps;
  *((_WORD *)result + 22) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)result + 40) = self->_mmWavePresent;
  *((_WORD *)result + 22) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_throughputCount;
  *((_WORD *)result + 22) |= 0x80u;
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_count;
  *((_WORD *)result + 22) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 22);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_ratType != *((_DWORD *)a3 + 8)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_bbChipset != *((_DWORD *)a3 + 3)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_mcc != *((_DWORD *)a3 + 6)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mnc != *((_DWORD *)a3 + 7)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_bandwidthInMhz != *((_DWORD *)a3 + 2)) {
      goto LABEL_49;
    }
  }
  else if (v7)
  {
    goto LABEL_49;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_downlinkThroughputInMbps != *((_DWORD *)a3 + 5)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    if ((*((_WORD *)a3 + 22) & 0x100) != 0) {
      goto LABEL_49;
    }
    goto LABEL_40;
  }
  if ((*((_WORD *)a3 + 22) & 0x100) == 0) {
    goto LABEL_49;
  }
  if (self->_mmWavePresent)
  {
    if (!*((unsigned char *)a3 + 40)) {
      goto LABEL_49;
    }
    goto LABEL_40;
  }
  if (*((unsigned char *)a3 + 40))
  {
LABEL_49:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_40:
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_throughputCount != *((_DWORD *)a3 + 9)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  LOBYTE(v5) = (v7 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_count != *((_DWORD *)a3 + 4)) {
      goto LABEL_49;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v3 = 2654435761 * self->_ratType;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_bbChipset;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_mcc;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_mnc;
    if (has) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if (has)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_bandwidthInMhz;
    if ((has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_downlinkThroughputInMbps;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_mmWavePresent;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_throughputCount;
  if ((has & 4) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_count;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

@end