@interface AWDPowerBBCallMetrics
+ (Class)metricsType;
- (BOOL)hasBBAndDataPowerMicroWatt;
- (BOOL)hasBBPowerMicroWatt;
- (BOOL)hasBBTotalAndDataDuration;
- (BOOL)hasBBTotalCallDuration;
- (BOOL)hasConnectedSleepDuration;
- (BOOL)hasConnectedSleepDurationData;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)metrics;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)metricsCount;
- (unint64_t)timestamp;
- (unsigned)bBAndDataPowerMicroWatt;
- (unsigned)bBPowerMicroWatt;
- (unsigned)bBTotalAndDataDuration;
- (unsigned)bBTotalCallDuration;
- (unsigned)connectedSleepDuration;
- (unsigned)connectedSleepDurationData;
- (void)addMetrics:(id)a3;
- (void)clearMetrics;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBBAndDataPowerMicroWatt:(unsigned int)a3;
- (void)setBBPowerMicroWatt:(unsigned int)a3;
- (void)setBBTotalAndDataDuration:(unsigned int)a3;
- (void)setBBTotalCallDuration:(unsigned int)a3;
- (void)setConnectedSleepDuration:(unsigned int)a3;
- (void)setConnectedSleepDurationData:(unsigned int)a3;
- (void)setHasBBAndDataPowerMicroWatt:(BOOL)a3;
- (void)setHasBBPowerMicroWatt:(BOOL)a3;
- (void)setHasBBTotalAndDataDuration:(BOOL)a3;
- (void)setHasBBTotalCallDuration:(BOOL)a3;
- (void)setHasConnectedSleepDuration:(BOOL)a3;
- (void)setHasConnectedSleepDurationData:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerBBCallMetrics

- (void)dealloc
{
  [(AWDPowerBBCallMetrics *)self setMetrics:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBCallMetrics;
  [(AWDPowerBBCallMetrics *)&v3 dealloc];
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

- (void)clearMetrics
{
}

- (void)addMetrics:(id)a3
{
  metrics = self->_metrics;
  if (!metrics)
  {
    metrics = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_metrics = metrics;
  }

  [(NSMutableArray *)metrics addObject:a3];
}

- (unint64_t)metricsCount
{
  return [(NSMutableArray *)self->_metrics count];
}

- (id)metricsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_metrics objectAtIndex:a3];
}

+ (Class)metricsType
{
  return (Class)objc_opt_class();
}

- (void)setBBTotalCallDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_bBTotalCallDuration = a3;
}

- (void)setHasBBTotalCallDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBBTotalCallDuration
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBBPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_bBPowerMicroWatt = a3;
}

- (void)setHasBBPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBBPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBBTotalAndDataDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_bBTotalAndDataDuration = a3;
}

- (void)setHasBBTotalAndDataDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBBTotalAndDataDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBBAndDataPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bBAndDataPowerMicroWatt = a3;
}

- (void)setHasBBAndDataPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBBAndDataPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConnectedSleepDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_connectedSleepDuration = a3;
}

- (void)setHasConnectedSleepDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasConnectedSleepDuration
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setConnectedSleepDurationData:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_connectedSleepDurationData = a3;
}

- (void)setHasConnectedSleepDurationData:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasConnectedSleepDurationData
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBCallMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerBBCallMetrics description](&v3, sel_description), -[AWDPowerBBCallMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_metrics count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_metrics, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    metrics = self->_metrics;
    uint64_t v6 = [(NSMutableArray *)metrics countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(metrics);
          }
          [v4 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)metrics countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"metrics"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bBTotalCallDuration] forKey:@"BBTotalCallDuration"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_14:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bBPowerMicroWatt] forKey:@"BBPowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bBTotalAndDataDuration] forKey:@"BBTotalAndDataDuration"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
LABEL_24:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_connectedSleepDuration] forKey:@"connectedSleepDuration"];
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_18;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bBAndDataPowerMicroWatt] forKey:@"BBAndDataPowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_24;
  }
LABEL_17:
  if ((has & 0x40) != 0) {
LABEL_18:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_connectedSleepDurationData] forKey:@"connectedSleepDurationData"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBBCallMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
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
      goto LABEL_19;
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
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  metrics = self->_metrics;
  uint64_t v6 = [(NSMutableArray *)metrics countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(metrics);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)metrics countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 1u;
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
  *((_DWORD *)a3 + 7) = self->_bBTotalCallDuration;
  *((unsigned char *)a3 + 48) |= 0x10u;
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
  *((_DWORD *)a3 + 5) = self->_bBPowerMicroWatt;
  *((unsigned char *)a3 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 6) = self->_bBTotalAndDataDuration;
  *((unsigned char *)a3 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_19:
    *((_DWORD *)a3 + 8) = self->_connectedSleepDuration;
    *((unsigned char *)a3 + 48) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_18:
  *((_DWORD *)a3 + 4) = self->_bBAndDataPowerMicroWatt;
  *((unsigned char *)a3 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_19;
  }
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)a3 + 9) = self->_connectedSleepDurationData;
    *((unsigned char *)a3 + 48) |= 0x40u;
  }
LABEL_9:
  if ([(AWDPowerBBCallMetrics *)self metricsCount])
  {
    [a3 clearMetrics];
    unint64_t v6 = [(AWDPowerBBCallMetrics *)self metricsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addMetrics:-[AWDPowerBBCallMetrics metricsAtIndex:](self, "metricsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_bBTotalCallDuration;
  *(unsigned char *)(v5 + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 20) = self->_bBPowerMicroWatt;
  *(unsigned char *)(v5 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 24) = self->_bBTotalAndDataDuration;
  *(unsigned char *)(v5 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 16) = self->_bBAndDataPowerMicroWatt;
  *(unsigned char *)(v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_22:
  *(_DWORD *)(v5 + 32) = self->_connectedSleepDuration;
  *(unsigned char *)(v5 + 48) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 36) = self->_connectedSleepDurationData;
    *(unsigned char *)(v5 + 48) |= 0x40u;
  }
LABEL_9:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  metrics = self->_metrics;
  uint64_t v9 = [(NSMutableArray *)metrics countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(metrics);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addMetrics:v13];
      }
      uint64_t v10 = [(NSMutableArray *)metrics countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
LABEL_39:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x10) == 0 || self->_bBTotalCallDuration != *((_DWORD *)a3 + 7)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 0x10) != 0)
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_bBPowerMicroWatt != *((_DWORD *)a3 + 5)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_bBTotalAndDataDuration != *((_DWORD *)a3 + 6)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_bBAndDataPowerMicroWatt != *((_DWORD *)a3 + 4)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x20) == 0 || self->_connectedSleepDuration != *((_DWORD *)a3 + 8)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 0x20) != 0)
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x40) == 0 || self->_connectedSleepDurationData != *((_DWORD *)a3 + 9)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 0x40) != 0)
    {
      goto LABEL_39;
    }
    metrics = self->_metrics;
    if ((unint64_t)metrics | *((void *)a3 + 5))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](metrics, "isEqual:");
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
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_bBTotalCallDuration;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
    uint64_t v4 = 2654435761 * self->_bBPowerMicroWatt;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_bBTotalAndDataDuration;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_bBAndDataPowerMicroWatt;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSMutableArray *)self->_metrics hash];
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_connectedSleepDuration;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_connectedSleepDurationData;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSMutableArray *)self->_metrics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v4 = *((unsigned char *)a3 + 48);
  if (v4)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v4 = *((unsigned char *)a3 + 48);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_bBTotalCallDuration = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v4 = *((unsigned char *)a3 + 48);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_bBPowerMicroWatt = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v4 = *((unsigned char *)a3 + 48);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_bBTotalAndDataDuration = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v4 = *((unsigned char *)a3 + 48);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_bBAndDataPowerMicroWatt = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v4 = *((unsigned char *)a3 + 48);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_22:
  self->_connectedSleepDuration = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 48) & 0x40) != 0)
  {
LABEL_8:
    self->_connectedSleepDurationData = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_9:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDPowerBBCallMetrics *)self addMetrics:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (unsigned)bBTotalCallDuration
{
  return self->_bBTotalCallDuration;
}

- (unsigned)bBPowerMicroWatt
{
  return self->_bBPowerMicroWatt;
}

- (unsigned)bBTotalAndDataDuration
{
  return self->_bBTotalAndDataDuration;
}

- (unsigned)bBAndDataPowerMicroWatt
{
  return self->_bBAndDataPowerMicroWatt;
}

- (unsigned)connectedSleepDuration
{
  return self->_connectedSleepDuration;
}

- (unsigned)connectedSleepDurationData
{
  return self->_connectedSleepDurationData;
}

@end