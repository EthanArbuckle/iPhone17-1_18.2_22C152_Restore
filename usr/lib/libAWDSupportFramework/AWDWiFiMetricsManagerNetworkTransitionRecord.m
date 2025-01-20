@interface AWDWiFiMetricsManagerNetworkTransitionRecord
- (BOOL)hasBeganTimestamp;
- (BOOL)hasEndedTimestamp;
- (BOOL)hasErrors;
- (BOOL)hasGotIPTimestamp;
- (BOOL)hasState;
- (BOOL)hasTimestamp;
- (BOOL)hasTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)beganTimestamp;
- (unint64_t)channelScanCountsCount;
- (unint64_t)endedTimestamp;
- (unint64_t)gotIPTimestamp;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)channelScanCountAtIndex:(unint64_t)a3;
- (unsigned)channelScanCounts;
- (unsigned)errors;
- (unsigned)state;
- (unsigned)trigger;
- (void)addChannelScanCount:(unsigned int)a3;
- (void)clearChannelScanCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBeganTimestamp:(unint64_t)a3;
- (void)setChannelScanCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setEndedTimestamp:(unint64_t)a3;
- (void)setErrors:(unsigned int)a3;
- (void)setGotIPTimestamp:(unint64_t)a3;
- (void)setHasBeganTimestamp:(BOOL)a3;
- (void)setHasEndedTimestamp:(BOOL)a3;
- (void)setHasErrors:(BOOL)a3;
- (void)setHasGotIPTimestamp:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrigger:(BOOL)a3;
- (void)setState:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrigger:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerNetworkTransitionRecord

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerNetworkTransitionRecord;
  [(AWDWiFiMetricsManagerNetworkTransitionRecord *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBeganTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_beganTimestamp = a3;
}

- (void)setHasBeganTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBeganTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEndedTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endedTimestamp = a3;
}

- (void)setHasEndedTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndedTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setGotIPTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_gotIPTimestamp = a3;
}

- (void)setHasGotIPTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGotIPTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setErrors:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_errors = a3;
}

- (void)setHasErrors:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasErrors
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTrigger:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTrigger
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (unint64_t)channelScanCountsCount
{
  return self->_channelScanCounts.count;
}

- (unsigned)channelScanCounts
{
  return self->_channelScanCounts.list;
}

- (void)clearChannelScanCounts
{
}

- (void)addChannelScanCount:(unsigned int)a3
{
}

- (unsigned)channelScanCountAtIndex:(unint64_t)a3
{
  p_channelScanCounts = &self->_channelScanCounts;
  unint64_t count = self->_channelScanCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_channelScanCounts->list[a3];
}

- (void)setChannelScanCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerNetworkTransitionRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerNetworkTransitionRecord description](&v3, sel_description), -[AWDWiFiMetricsManagerNetworkTransitionRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_beganTimestamp] forKey:@"beganTimestamp"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endedTimestamp] forKey:@"endedTimestamp"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_gotIPTimestamp] forKey:@"gotIPTimestamp"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_errors] forKey:@"errors"];
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_state] forKey:@"state"];
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 0x40) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_trigger] forKey:@"trigger"];
LABEL_9:
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"channelScanCount"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerNetworkTransitionRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
  p_channelScanCounts = &self->_channelScanCounts;
  if (p_channelScanCounts->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < p_channelScanCounts->count);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 7) = self->_timestamp;
    *((unsigned char *)a3 + 76) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_beganTimestamp;
  *((unsigned char *)a3 + 76) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)a3 + 5) = self->_endedTimestamp;
  *((unsigned char *)a3 + 76) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 6) = self->_gotIPTimestamp;
  *((unsigned char *)a3 + 76) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_19:
    *((_DWORD *)a3 + 16) = self->_errors;
    *((unsigned char *)a3 + 76) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_18:
  *((_DWORD *)a3 + 17) = self->_state;
  *((unsigned char *)a3 + 76) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_19;
  }
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)a3 + 18) = self->_trigger;
    *((unsigned char *)a3 + 76) |= 0x40u;
  }
LABEL_9:
  if ([(AWDWiFiMetricsManagerNetworkTransitionRecord *)self channelScanCountsCount])
  {
    [a3 clearChannelScanCounts];
    unint64_t v6 = [(AWDWiFiMetricsManagerNetworkTransitionRecord *)self channelScanCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addChannelScanCount:-[AWDWiFiMetricsManagerNetworkTransitionRecord channelScanCountAtIndex:](self, "channelScanCountAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  v5 = (void *)v4;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v4 + 56) = self->_timestamp;
    *(unsigned char *)(v4 + 76) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v4 + 32) = self->_beganTimestamp;
  *(unsigned char *)(v4 + 76) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(void *)(v4 + 40) = self->_endedTimestamp;
  *(unsigned char *)(v4 + 76) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(void *)(v4 + 48) = self->_gotIPTimestamp;
  *(unsigned char *)(v4 + 76) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    *(_DWORD *)(v4 + 64) = self->_errors;
    *(unsigned char *)(v4 + 76) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_14:
  *(_DWORD *)(v4 + 68) = self->_state;
  *(unsigned char *)(v4 + 76) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *(_DWORD *)(v4 + 72) = self->_trigger;
    *(unsigned char *)(v4 + 76) |= 0x40u;
  }
LABEL_9:
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 76) & 8) == 0 || self->_timestamp != *((void *)a3 + 7)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 8) != 0)
  {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 76) & 1) == 0 || self->_beganTimestamp != *((void *)a3 + 4)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 76))
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 76) & 2) == 0 || self->_endedTimestamp != *((void *)a3 + 5)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 76) & 4) == 0 || self->_gotIPTimestamp != *((void *)a3 + 6)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 76) & 0x20) == 0 || self->_state != *((_DWORD *)a3 + 17)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 0x20) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 76) & 0x10) == 0 || self->_errors != *((_DWORD *)a3 + 16)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 0x10) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)a3 + 76) & 0x40) == 0 || self->_trigger != *((_DWORD *)a3 + 18)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 0x40) != 0)
  {
    return 0;
  }

  return PBRepeatedUInt32IsEqual();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_beganTimestamp;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_endedTimestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_gotIPTimestamp;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_state;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ PBRepeatedUInt32Hash();
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_errors;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_trigger;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 76);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 7);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 76);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_beganTimestamp = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)a3 + 76);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_endedTimestamp = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 76);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_gotIPTimestamp = *((void *)a3 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 76);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_state = *((_DWORD *)a3 + 17);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 76);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_18:
  self->_errors = *((_DWORD *)a3 + 16);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 76) & 0x40) != 0)
  {
LABEL_8:
    self->_trigger = *((_DWORD *)a3 + 18);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_9:
  uint64_t v6 = [a3 channelScanCountsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDWiFiMetricsManagerNetworkTransitionRecord addChannelScanCount:](self, "addChannelScanCount:", [a3 channelScanCountAtIndex:i]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)beganTimestamp
{
  return self->_beganTimestamp;
}

- (unint64_t)endedTimestamp
{
  return self->_endedTimestamp;
}

- (unint64_t)gotIPTimestamp
{
  return self->_gotIPTimestamp;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)errors
{
  return self->_errors;
}

- (unsigned)trigger
{
  return self->_trigger;
}

@end