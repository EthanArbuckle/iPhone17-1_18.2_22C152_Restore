@interface AWDPowerBBCallMetricInfo
- (BOOL)hasCallDuration;
- (BOOL)hasPowerMicroWatt;
- (BOOL)hasThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rxTxDurationsCount;
- (unint64_t)sleepStateDurationsCount;
- (unsigned)callDuration;
- (unsigned)powerMicroWatt;
- (unsigned)rxTxDurations;
- (unsigned)rxTxDurationsAtIndex:(unint64_t)a3;
- (unsigned)sleepStateDurations;
- (unsigned)sleepStateDurationsAtIndex:(unint64_t)a3;
- (unsigned)threshold;
- (void)addRxTxDurations:(unsigned int)a3;
- (void)addSleepStateDurations:(unsigned int)a3;
- (void)clearRxTxDurations;
- (void)clearSleepStateDurations;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCallDuration:(unsigned int)a3;
- (void)setHasCallDuration:(BOOL)a3;
- (void)setHasPowerMicroWatt:(BOOL)a3;
- (void)setHasThreshold:(BOOL)a3;
- (void)setPowerMicroWatt:(unsigned int)a3;
- (void)setRxTxDurations:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSleepStateDurations:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setThreshold:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerBBCallMetricInfo

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBCallMetricInfo;
  [(AWDPowerBBCallMetricInfo *)&v3 dealloc];
}

- (void)setThreshold:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_threshold = a3;
}

- (void)setHasThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasThreshold
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCallDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_callDuration = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCallDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)sleepStateDurationsCount
{
  return self->_sleepStateDurations.count;
}

- (unsigned)sleepStateDurations
{
  return self->_sleepStateDurations.list;
}

- (void)clearSleepStateDurations
{
}

- (void)addSleepStateDurations:(unsigned int)a3
{
}

- (unsigned)sleepStateDurationsAtIndex:(unint64_t)a3
{
  p_sleepStateDurations = &self->_sleepStateDurations;
  unint64_t count = self->_sleepStateDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_sleepStateDurations->list[a3];
}

- (void)setSleepStateDurations:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rxTxDurationsCount
{
  return self->_rxTxDurations.count;
}

- (unsigned)rxTxDurations
{
  return self->_rxTxDurations.list;
}

- (void)clearRxTxDurations
{
}

- (void)addRxTxDurations:(unsigned int)a3
{
}

- (unsigned)rxTxDurationsAtIndex:(unint64_t)a3
{
  p_rxTxDurations = &self->_rxTxDurations;
  unint64_t count = self->_rxTxDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_rxTxDurations->list[a3];
}

- (void)setRxTxDurations:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_powerMicroWatt = a3;
}

- (void)setHasPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBCallMetricInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerBBCallMetricInfo description](&v3, sel_description), -[AWDPowerBBCallMetricInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_threshold] forKey:@"Threshold"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_callDuration] forKey:@"CallDuration"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"SleepStateDurations"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"RxTxDurations"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_powerMicroWatt] forKey:@"PowerMicroWatt"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBBCallMetricInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_sleepStateDurations.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_sleepStateDurations.count);
  }
  if (self->_rxTxDurations.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_rxTxDurations.count);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_threshold;
    *((unsigned char *)a3 + 68) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)a3 + 14) = self->_callDuration;
    *((unsigned char *)a3 + 68) |= 1u;
  }
  if ([(AWDPowerBBCallMetricInfo *)self sleepStateDurationsCount])
  {
    [a3 clearSleepStateDurations];
    unint64_t v6 = [(AWDPowerBBCallMetricInfo *)self sleepStateDurationsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addSleepStateDurations:-[AWDPowerBBCallMetricInfo sleepStateDurationsAtIndex:](self, "sleepStateDurationsAtIndex:", i)];
    }
  }
  if ([(AWDPowerBBCallMetricInfo *)self rxTxDurationsCount])
  {
    [a3 clearRxTxDurations];
    unint64_t v9 = [(AWDPowerBBCallMetricInfo *)self rxTxDurationsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addRxTxDurations:-[AWDPowerBBCallMetricInfo rxTxDurationsAtIndex:](self, "rxTxDurationsAtIndex:", j)];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 15) = self->_powerMicroWatt;
    *((unsigned char *)a3 + 68) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v5 = v4;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v4 + 64) = self->_threshold;
    *(unsigned char *)(v4 + 68) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v4 + 56) = self->_callDuration;
    *(unsigned char *)(v4 + 68) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_powerMicroWatt;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 68) & 4) == 0 || self->_threshold != *((_DWORD *)a3 + 16)) {
        goto LABEL_18;
      }
    }
    else if ((*((unsigned char *)a3 + 68) & 4) != 0)
    {
LABEL_18:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 68) & 1) == 0 || self->_callDuration != *((_DWORD *)a3 + 14)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)a3 + 68))
    {
      goto LABEL_18;
    }
    int IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      int IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        LOBYTE(IsEqual) = (*((unsigned char *)a3 + 68) & 2) == 0;
        if ((*(unsigned char *)&self->_has & 2) != 0)
        {
          if ((*((unsigned char *)a3 + 68) & 2) == 0 || self->_powerMicroWatt != *((_DWORD *)a3 + 15)) {
            goto LABEL_18;
          }
          LOBYTE(IsEqual) = 1;
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_threshold;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_callDuration;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_powerMicroWatt;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 68);
  if ((v5 & 4) != 0)
  {
    self->_threshold = *((_DWORD *)a3 + 16);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 68);
  }
  if (v5)
  {
    self->_callDuration = *((_DWORD *)a3 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v6 = [a3 sleepStateDurationsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDPowerBBCallMetricInfo addSleepStateDurations:](self, "addSleepStateDurations:", [a3 sleepStateDurationsAtIndex:i]);
  }
  uint64_t v9 = [a3 rxTxDurationsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[AWDPowerBBCallMetricInfo addRxTxDurations:](self, "addRxTxDurations:", [a3 rxTxDurationsAtIndex:j]);
  }
  if ((*((unsigned char *)a3 + 68) & 2) != 0)
  {
    self->_powerMicroWatt = *((_DWORD *)a3 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)threshold
{
  return self->_threshold;
}

- (unsigned)callDuration
{
  return self->_callDuration;
}

- (unsigned)powerMicroWatt
{
  return self->_powerMicroWatt;
}

@end