@interface AWDPowerAudioMetrics
- (BOOL)hasAudioHeadsetDuration;
- (BOOL)hasAudioHeadsetPowerMicroWatt;
- (BOOL)hasAudioSpeakerDuration;
- (BOOL)hasAudioSpeakerPowerMicroWatt;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)audioVolumeLevelDurationSpeakersCount;
- (unint64_t)audioVolumeLevelDurationsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)audioHeadsetDuration;
- (unsigned)audioHeadsetPowerMicroWatt;
- (unsigned)audioSpeakerDuration;
- (unsigned)audioSpeakerPowerMicroWatt;
- (unsigned)audioVolumeLevelDurationAtIndex:(unint64_t)a3;
- (unsigned)audioVolumeLevelDurationSpeakerAtIndex:(unint64_t)a3;
- (unsigned)audioVolumeLevelDurationSpeakers;
- (unsigned)audioVolumeLevelDurations;
- (void)addAudioVolumeLevelDuration:(unsigned int)a3;
- (void)addAudioVolumeLevelDurationSpeaker:(unsigned int)a3;
- (void)clearAudioVolumeLevelDurationSpeakers;
- (void)clearAudioVolumeLevelDurations;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAudioHeadsetDuration:(unsigned int)a3;
- (void)setAudioHeadsetPowerMicroWatt:(unsigned int)a3;
- (void)setAudioSpeakerDuration:(unsigned int)a3;
- (void)setAudioSpeakerPowerMicroWatt:(unsigned int)a3;
- (void)setAudioVolumeLevelDurationSpeakers:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setAudioVolumeLevelDurations:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasAudioHeadsetDuration:(BOOL)a3;
- (void)setHasAudioHeadsetPowerMicroWatt:(BOOL)a3;
- (void)setHasAudioSpeakerDuration:(BOOL)a3;
- (void)setHasAudioSpeakerPowerMicroWatt:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerAudioMetrics

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerAudioMetrics;
  [(AWDPowerAudioMetrics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioSpeakerPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_audioSpeakerPowerMicroWatt = a3;
}

- (void)setHasAudioSpeakerPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAudioSpeakerPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAudioHeadsetPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_audioHeadsetPowerMicroWatt = a3;
}

- (void)setHasAudioHeadsetPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAudioHeadsetPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAudioSpeakerDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_audioSpeakerDuration = a3;
}

- (void)setHasAudioSpeakerDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAudioSpeakerDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAudioHeadsetDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_audioHeadsetDuration = a3;
}

- (void)setHasAudioHeadsetDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioHeadsetDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)audioVolumeLevelDurationsCount
{
  return self->_audioVolumeLevelDurations.count;
}

- (unsigned)audioVolumeLevelDurations
{
  return self->_audioVolumeLevelDurations.list;
}

- (void)clearAudioVolumeLevelDurations
{
}

- (void)addAudioVolumeLevelDuration:(unsigned int)a3
{
}

- (unsigned)audioVolumeLevelDurationAtIndex:(unint64_t)a3
{
  p_audioVolumeLevelDurations = &self->_audioVolumeLevelDurations;
  unint64_t count = self->_audioVolumeLevelDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_audioVolumeLevelDurations->list[a3];
}

- (void)setAudioVolumeLevelDurations:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)audioVolumeLevelDurationSpeakersCount
{
  return self->_audioVolumeLevelDurationSpeakers.count;
}

- (unsigned)audioVolumeLevelDurationSpeakers
{
  return self->_audioVolumeLevelDurationSpeakers.list;
}

- (void)clearAudioVolumeLevelDurationSpeakers
{
}

- (void)addAudioVolumeLevelDurationSpeaker:(unsigned int)a3
{
}

- (unsigned)audioVolumeLevelDurationSpeakerAtIndex:(unint64_t)a3
{
  p_audioVolumeLevelDurationSpeakers = &self->_audioVolumeLevelDurationSpeakers;
  unint64_t count = self->_audioVolumeLevelDurationSpeakers.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_audioVolumeLevelDurationSpeakers->list[a3];
}

- (void)setAudioVolumeLevelDurationSpeakers:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerAudioMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerAudioMetrics description](&v3, sel_description), -[AWDPowerAudioMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_audioSpeakerPowerMicroWatt] forKey:@"audioSpeakerPowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_audioSpeakerDuration] forKey:@"audioSpeakerDuration"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_audioHeadsetPowerMicroWatt] forKey:@"audioHeadsetPowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_audioHeadsetDuration] forKey:@"audioHeadsetDuration"];
LABEL_7:
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"audioVolumeLevelDuration"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"audioVolumeLevelDurationSpeaker"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerAudioMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_audioVolumeLevelDurations.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_audioVolumeLevelDurations.count);
  }
  p_audioVolumeLevelDurationSpeakers = &self->_audioVolumeLevelDurationSpeakers;
  if (p_audioVolumeLevelDurationSpeakers->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < p_audioVolumeLevelDurationSpeakers->count);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 7) = self->_timestamp;
    *((unsigned char *)a3 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 19) = self->_audioSpeakerPowerMicroWatt;
  *((unsigned char *)a3 + 80) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_19:
    *((_DWORD *)a3 + 18) = self->_audioSpeakerDuration;
    *((unsigned char *)a3 + 80) |= 8u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  *((_DWORD *)a3 + 17) = self->_audioHeadsetPowerMicroWatt;
  *((unsigned char *)a3 + 80) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_19;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 16) = self->_audioHeadsetDuration;
    *((unsigned char *)a3 + 80) |= 2u;
  }
LABEL_7:
  if ([(AWDPowerAudioMetrics *)self audioVolumeLevelDurationsCount])
  {
    [a3 clearAudioVolumeLevelDurations];
    unint64_t v6 = [(AWDPowerAudioMetrics *)self audioVolumeLevelDurationsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addAudioVolumeLevelDuration:-[AWDPowerAudioMetrics audioVolumeLevelDurationAtIndex:](self, "audioVolumeLevelDurationAtIndex:", i)];
    }
  }
  if ([(AWDPowerAudioMetrics *)self audioVolumeLevelDurationSpeakersCount])
  {
    [a3 clearAudioVolumeLevelDurationSpeakers];
    unint64_t v9 = [(AWDPowerAudioMetrics *)self audioVolumeLevelDurationSpeakersCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addAudioVolumeLevelDurationSpeaker:-[AWDPowerAudioMetrics audioVolumeLevelDurationSpeakerAtIndex:](self, "audioVolumeLevelDurationSpeakerAtIndex:", j)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v5 = (void *)v4;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v4 + 56) = self->_timestamp;
    *(unsigned char *)(v4 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 76) = self->_audioSpeakerPowerMicroWatt;
  *(unsigned char *)(v4 + 80) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v4 + 72) = self->_audioSpeakerDuration;
    *(unsigned char *)(v4 + 80) |= 8u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v4 + 68) = self->_audioHeadsetPowerMicroWatt;
  *(unsigned char *)(v4 + 80) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v4 + 64) = self->_audioHeadsetDuration;
    *(unsigned char *)(v4 + 80) |= 2u;
  }
LABEL_7:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 80) & 1) == 0 || self->_timestamp != *((void *)a3 + 7)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 80))
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 80) & 0x10) == 0 || self->_audioSpeakerPowerMicroWatt != *((_DWORD *)a3 + 19)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 0x10) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 80) & 4) == 0 || self->_audioHeadsetPowerMicroWatt != *((_DWORD *)a3 + 17)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 80) & 8) == 0 || self->_audioSpeakerDuration != *((_DWORD *)a3 + 18)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 8) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 80) & 2) == 0 || self->_audioHeadsetDuration != *((_DWORD *)a3 + 16)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 2) != 0)
  {
    return 0;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    return 0;
  }

  return PBRepeatedUInt32IsEqual();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_audioSpeakerPowerMicroWatt;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_audioHeadsetPowerMicroWatt;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_audioSpeakerDuration;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_audioHeadsetDuration;
LABEL_12:
  uint64_t v7 = v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ PBRepeatedUInt32Hash();
  return v7 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 80);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 7);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 80);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_audioSpeakerPowerMicroWatt = *((_DWORD *)a3 + 19);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 80);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_audioHeadsetPowerMicroWatt = *((_DWORD *)a3 + 17);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 80);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  self->_audioSpeakerDuration = *((_DWORD *)a3 + 18);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 80) & 2) != 0)
  {
LABEL_6:
    self->_audioHeadsetDuration = *((_DWORD *)a3 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
  uint64_t v6 = [a3 audioVolumeLevelDurationsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDPowerAudioMetrics addAudioVolumeLevelDuration:](self, "addAudioVolumeLevelDuration:", [a3 audioVolumeLevelDurationAtIndex:i]);
  }
  uint64_t v9 = [a3 audioVolumeLevelDurationSpeakersCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[AWDPowerAudioMetrics addAudioVolumeLevelDurationSpeaker:](self, "addAudioVolumeLevelDurationSpeaker:", [a3 audioVolumeLevelDurationSpeakerAtIndex:j]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)audioSpeakerPowerMicroWatt
{
  return self->_audioSpeakerPowerMicroWatt;
}

- (unsigned)audioHeadsetPowerMicroWatt
{
  return self->_audioHeadsetPowerMicroWatt;
}

- (unsigned)audioSpeakerDuration
{
  return self->_audioSpeakerDuration;
}

- (unsigned)audioHeadsetDuration
{
  return self->_audioHeadsetDuration;
}

@end