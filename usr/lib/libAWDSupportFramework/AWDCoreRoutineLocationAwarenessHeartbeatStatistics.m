@interface AWDCoreRoutineLocationAwarenessHeartbeatStatistics
- (AWDCoreRoutineLocationAwarenessBasicHistogram)heartbeatActiveRequestCount;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)heartbeatTimerFiringCount;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)heartbeatValidLocationCount;
- (BOOL)hasDuration;
- (BOOL)hasHeartbeatActiveRequestCount;
- (BOOL)hasHeartbeatTimerFiringCount;
- (BOOL)hasHeartbeatValidLocationCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeartbeatActiveRequestCount:(id)a3;
- (void)setHeartbeatTimerFiringCount:(id)a3;
- (void)setHeartbeatValidLocationCount:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLocationAwarenessHeartbeatStatistics

- (void)dealloc
{
  [(AWDCoreRoutineLocationAwarenessHeartbeatStatistics *)self setHeartbeatTimerFiringCount:0];
  [(AWDCoreRoutineLocationAwarenessHeartbeatStatistics *)self setHeartbeatActiveRequestCount:0];
  [(AWDCoreRoutineLocationAwarenessHeartbeatStatistics *)self setHeartbeatValidLocationCount:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessHeartbeatStatistics;
  [(AWDCoreRoutineLocationAwarenessHeartbeatStatistics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasHeartbeatTimerFiringCount
{
  return self->_heartbeatTimerFiringCount != 0;
}

- (BOOL)hasHeartbeatActiveRequestCount
{
  return self->_heartbeatActiveRequestCount != 0;
}

- (BOOL)hasHeartbeatValidLocationCount
{
  return self->_heartbeatValidLocationCount != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessHeartbeatStatistics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
  }
  heartbeatTimerFiringCount = self->_heartbeatTimerFiringCount;
  if (heartbeatTimerFiringCount) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](heartbeatTimerFiringCount, "dictionaryRepresentation")] dictionaryRepresentation] forKey:@"heartbeatTimerFiringCount"];
  }
  heartbeatActiveRequestCount = self->_heartbeatActiveRequestCount;
  if (heartbeatActiveRequestCount) {
    [v3 setObject:-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](heartbeatActiveRequestCount, "dictionaryRepresentation") forKey:@"heartbeatActiveRequestCount"];
  }
  heartbeatValidLocationCount = self->_heartbeatValidLocationCount;
  if (heartbeatValidLocationCount) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](heartbeatValidLocationCount) dictionaryRepresentation] forKey:@"heartbeatValidLocationCount"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessHeartbeatStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_heartbeatTimerFiringCount) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_heartbeatActiveRequestCount) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_heartbeatValidLocationCount)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_duration;
    *((unsigned char *)a3 + 48) |= 1u;
  }
  if (self->_heartbeatTimerFiringCount) {
    [a3 setHeartbeatTimerFiringCount:];
  }
  if (self->_heartbeatActiveRequestCount) {
    [a3 setHeartbeatActiveRequestCount:];
  }
  if (self->_heartbeatValidLocationCount)
  {
    [a3 setHeartbeatValidLocationCount:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 48) |= 1u;
  }

  *(void *)(v6 + 32) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_heartbeatTimerFiringCount copyWithZone:a3];
  *(void *)(v6 + 24) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_heartbeatActiveRequestCount copyWithZone:a3];

  *(void *)(v6 + 40) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_heartbeatValidLocationCount copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_18;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
LABEL_18:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
      goto LABEL_18;
    }
    heartbeatTimerFiringCount = self->_heartbeatTimerFiringCount;
    if (!((unint64_t)heartbeatTimerFiringCount | *((void *)a3 + 4))
      || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](heartbeatTimerFiringCount, "isEqual:")) != 0)
    {
      heartbeatActiveRequestCount = self->_heartbeatActiveRequestCount;
      if (!((unint64_t)heartbeatActiveRequestCount | *((void *)a3 + 3))
        || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](heartbeatActiveRequestCount, "isEqual:")) != 0)
      {
        heartbeatValidLocationCount = self->_heartbeatValidLocationCount;
        if ((unint64_t)heartbeatValidLocationCount | *((void *)a3 + 5))
        {
          LOBYTE(v5) = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](heartbeatValidLocationCount, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v4 = 0;
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_duration;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_heartbeatTimerFiringCount hash];
  unint64_t v6 = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_heartbeatActiveRequestCount hash];
  return v5 ^ v6 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_heartbeatValidLocationCount hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 48);
  }
  if (v5)
  {
    self->_duration = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  heartbeatTimerFiringCount = self->_heartbeatTimerFiringCount;
  uint64_t v7 = *((void *)a3 + 4);
  if (heartbeatTimerFiringCount)
  {
    if (v7) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](heartbeatTimerFiringCount, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics setHeartbeatTimerFiringCount:](self, "setHeartbeatTimerFiringCount:");
  }
  heartbeatActiveRequestCount = self->_heartbeatActiveRequestCount;
  uint64_t v9 = *((void *)a3 + 3);
  if (heartbeatActiveRequestCount)
  {
    if (v9) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](heartbeatActiveRequestCount, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics setHeartbeatActiveRequestCount:](self, "setHeartbeatActiveRequestCount:");
  }
  heartbeatValidLocationCount = self->_heartbeatValidLocationCount;
  uint64_t v11 = *((void *)a3 + 5);
  if (heartbeatValidLocationCount)
  {
    if (v11)
    {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](heartbeatValidLocationCount, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics setHeartbeatValidLocationCount:](self, "setHeartbeatValidLocationCount:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)heartbeatTimerFiringCount
{
  return self->_heartbeatTimerFiringCount;
}

- (void)setHeartbeatTimerFiringCount:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)heartbeatActiveRequestCount
{
  return self->_heartbeatActiveRequestCount;
}

- (void)setHeartbeatActiveRequestCount:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)heartbeatValidLocationCount
{
  return self->_heartbeatValidLocationCount;
}

- (void)setHeartbeatValidLocationCount:(id)a3
{
}

@end