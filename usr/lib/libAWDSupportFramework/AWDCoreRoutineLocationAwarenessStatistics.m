@interface AWDCoreRoutineLocationAwarenessStatistics
- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestCount;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestInterrupted;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithCoarseLocation;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithLocationServiceDisabled;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithOtherReasons;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)skippedRequestDueToRecentFix;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)skippedRequestDueToStationary;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringCount;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringDelayedCount;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringDelayedMaxSeconds;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringDelayedTotalSeconds;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)validLocationCount;
- (BOOL)hasActiveRequestCount;
- (BOOL)hasActiveRequestInterrupted;
- (BOOL)hasActiveRequestTimeoutWithCoarseLocation;
- (BOOL)hasActiveRequestTimeoutWithLocationServiceDisabled;
- (BOOL)hasActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
- (BOOL)hasActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
- (BOOL)hasActiveRequestTimeoutWithOtherReasons;
- (BOOL)hasDuration;
- (BOOL)hasSkippedRequestDueToRecentFix;
- (BOOL)hasSkippedRequestDueToStationary;
- (BOOL)hasTimerFiringCount;
- (BOOL)hasTimerFiringDelayedCount;
- (BOOL)hasTimerFiringDelayedMaxSeconds;
- (BOOL)hasTimerFiringDelayedTotalSeconds;
- (BOOL)hasTimestamp;
- (BOOL)hasValidLocationCount;
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
- (void)setActiveRequestCount:(id)a3;
- (void)setActiveRequestInterrupted:(id)a3;
- (void)setActiveRequestTimeoutWithCoarseLocation:(id)a3;
- (void)setActiveRequestTimeoutWithLocationServiceDisabled:(id)a3;
- (void)setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:(id)a3;
- (void)setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:(id)a3;
- (void)setActiveRequestTimeoutWithOtherReasons:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSkippedRequestDueToRecentFix:(id)a3;
- (void)setSkippedRequestDueToStationary:(id)a3;
- (void)setTimerFiringCount:(id)a3;
- (void)setTimerFiringDelayedCount:(id)a3;
- (void)setTimerFiringDelayedMaxSeconds:(id)a3;
- (void)setTimerFiringDelayedTotalSeconds:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setValidLocationCount:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLocationAwarenessStatistics

- (void)dealloc
{
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setTimerFiringCount:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestCount:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setValidLocationCount:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setTimerFiringDelayedCount:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setTimerFiringDelayedTotalSeconds:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setTimerFiringDelayedMaxSeconds:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setSkippedRequestDueToRecentFix:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setSkippedRequestDueToStationary:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithCoarseLocation:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithLocationServiceDisabled:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithOtherReasons:0];
  [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestInterrupted:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessStatistics;
  [(AWDCoreRoutineLocationAwarenessStatistics *)&v3 dealloc];
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

- (BOOL)hasTimerFiringCount
{
  return self->_timerFiringCount != 0;
}

- (BOOL)hasActiveRequestCount
{
  return self->_activeRequestCount != 0;
}

- (BOOL)hasValidLocationCount
{
  return self->_validLocationCount != 0;
}

- (BOOL)hasTimerFiringDelayedCount
{
  return self->_timerFiringDelayedCount != 0;
}

- (BOOL)hasTimerFiringDelayedTotalSeconds
{
  return self->_timerFiringDelayedTotalSeconds != 0;
}

- (BOOL)hasTimerFiringDelayedMaxSeconds
{
  return self->_timerFiringDelayedMaxSeconds != 0;
}

- (BOOL)hasSkippedRequestDueToRecentFix
{
  return self->_skippedRequestDueToRecentFix != 0;
}

- (BOOL)hasSkippedRequestDueToStationary
{
  return self->_skippedRequestDueToStationary != 0;
}

- (BOOL)hasActiveRequestTimeoutWithCoarseLocation
{
  return self->_activeRequestTimeoutWithCoarseLocation != 0;
}

- (BOOL)hasActiveRequestTimeoutWithLocationServiceDisabled
{
  return self->_activeRequestTimeoutWithLocationServiceDisabled != 0;
}

- (BOOL)hasActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled
{
  return self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled != 0;
}

- (BOOL)hasActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff
{
  return self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff != 0;
}

- (BOOL)hasActiveRequestTimeoutWithOtherReasons
{
  return self->_activeRequestTimeoutWithOtherReasons != 0;
}

- (BOOL)hasActiveRequestInterrupted
{
  return self->_activeRequestInterrupted != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessStatistics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLocationAwarenessStatistics description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessStatistics dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  timerFiringCount = self->_timerFiringCount;
  if (timerFiringCount) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](timerFiringCount, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"timerFiringCount"];
  }
  activeRequestCount = self->_activeRequestCount;
  if (activeRequestCount) {
    [v3 setObject: -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestCount, "dictionaryRepresentation") forKey:@"activeRequestCount"];
  }
  validLocationCount = self->_validLocationCount;
  if (validLocationCount) {
    [v3 setObject: -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](validLocationCount, "dictionaryRepresentation") forKey:@"validLocationCount"];
  }
  timerFiringDelayedCount = self->_timerFiringDelayedCount;
  if (timerFiringDelayedCount) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](timerFiringDelayedCount, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"timerFiringDelayedCount"];
  }
  timerFiringDelayedTotalSeconds = self->_timerFiringDelayedTotalSeconds;
  if (timerFiringDelayedTotalSeconds) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](timerFiringDelayedTotalSeconds, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"timerFiringDelayedTotalSeconds"];
  }
  timerFiringDelayedMaxSeconds = self->_timerFiringDelayedMaxSeconds;
  if (timerFiringDelayedMaxSeconds) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](timerFiringDelayedMaxSeconds, "dictionaryRepresentation")] dictionaryRepresentation] forKey:@"timerFiringDelayedMaxSeconds"];
  }
  skippedRequestDueToRecentFix = self->_skippedRequestDueToRecentFix;
  if (skippedRequestDueToRecentFix) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](skippedRequestDueToRecentFix, "dictionaryRepresentation")] forKey:@"skippedRequestDueToRecentFix"];
  }
  skippedRequestDueToStationary = self->_skippedRequestDueToStationary;
  if (skippedRequestDueToStationary) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](skippedRequestDueToStationary, "dictionaryRepresentation")] dictionaryRepresentation] forKey:@"skippedRequestDueToStationary"];
  }
  activeRequestTimeoutWithCoarseLocation = self->_activeRequestTimeoutWithCoarseLocation;
  if (activeRequestTimeoutWithCoarseLocation) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithCoarseLocation, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"activeRequestTimeoutWithCoarseLocation"];
  }
  activeRequestTimeoutWithLocationServiceDisabled = self->_activeRequestTimeoutWithLocationServiceDisabled;
  if (activeRequestTimeoutWithLocationServiceDisabled) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithLocationServiceDisabled, "dictionaryRepresentation")] forKey:@"activeRequestTimeoutWithLocationServiceDisabled"];
  }
  activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
  if (activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled) {
    [v3 setObject:-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled, "dictionaryRepresentation") forKey:@"activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled"];
  }
  activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
  if (activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff, "dictionaryRepresentation")] forKey:@"activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff"];
  }
  activeRequestTimeoutWithOtherReasons = self->_activeRequestTimeoutWithOtherReasons;
  if (activeRequestTimeoutWithOtherReasons) {
    [v3 setObject:-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithOtherReasons, "dictionaryRepresentation") forKey:@"activeRequestTimeoutWithOtherReasons"];
  }
  activeRequestInterrupted = self->_activeRequestInterrupted;
  if (activeRequestInterrupted) {
    [v3 setObject:-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestInterrupted, "dictionaryRepresentation") forKey:@"activeRequestInterrupted"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_timerFiringCount) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activeRequestCount) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_validLocationCount) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_timerFiringDelayedCount) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_timerFiringDelayedTotalSeconds) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_timerFiringDelayedMaxSeconds) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_skippedRequestDueToRecentFix) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_skippedRequestDueToStationary) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activeRequestTimeoutWithCoarseLocation) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activeRequestTimeoutWithLocationServiceDisabled) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activeRequestTimeoutWithOtherReasons) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activeRequestInterrupted)
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
    *((unsigned char *)a3 + 136) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_duration;
    *((unsigned char *)a3 + 136) |= 1u;
  }
  if (self->_timerFiringCount) {
    [a3 setTimerFiringCount:];
  }
  if (self->_activeRequestCount) {
    [a3 setActiveRequestCount:];
  }
  if (self->_validLocationCount) {
    [a3 setValidLocationCount:];
  }
  if (self->_timerFiringDelayedCount) {
    [a3 setTimerFiringDelayedCount:];
  }
  if (self->_timerFiringDelayedTotalSeconds) {
    [a3 setTimerFiringDelayedTotalSeconds:];
  }
  if (self->_timerFiringDelayedMaxSeconds) {
    [a3 setTimerFiringDelayedMaxSeconds:];
  }
  if (self->_skippedRequestDueToRecentFix) {
    [a3 setSkippedRequestDueToRecentFix:];
  }
  if (self->_skippedRequestDueToStationary) {
    [a3 setSkippedRequestDueToStationary:];
  }
  if (self->_activeRequestTimeoutWithCoarseLocation) {
    [a3 setActiveRequestTimeoutWithCoarseLocation:];
  }
  if (self->_activeRequestTimeoutWithLocationServiceDisabled) {
    [a3 setActiveRequestTimeoutWithLocationServiceDisabled:];
  }
  if (self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled) {
    [a3 setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled];
  }
  if (self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff) {
    [a3 setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:];
  }
  if (self->_activeRequestTimeoutWithOtherReasons) {
    [a3 setActiveRequestTimeoutWithOtherReasons:];
  }
  if (self->_activeRequestInterrupted)
  {
    [a3 setActiveRequestInterrupted:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 136) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 136) |= 1u;
  }

  *(void *)(v6 + 96) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_timerFiringCount copyWithZone:a3];
  *(void *)(v6 + 24) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestCount copyWithZone:a3];

  *(void *)(v6 + 128) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_validLocationCount copyWithZone:a3];
  *(void *)(v6 + 104) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_timerFiringDelayedCount copyWithZone:a3];

  *(void *)(v6 + 120) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_timerFiringDelayedTotalSeconds copyWithZone:a3];
  *(void *)(v6 + 112) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_timerFiringDelayedMaxSeconds copyWithZone:a3];

  *(void *)(v6 + 80) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_skippedRequestDueToRecentFix copyWithZone:a3];
  *(void *)(v6 + 88) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_skippedRequestDueToStationary copyWithZone:a3];

  *(void *)(v6 + 40) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithCoarseLocation copyWithZone:a3];
  *(void *)(v6 + 48) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithLocationServiceDisabled copyWithZone:a3];

  *(void *)(v6 + 56) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled copyWithZone:a3];
  *(void *)(v6 + 64) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff copyWithZone:a3];

  *(void *)(v6 + 72) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithOtherReasons copyWithZone:a3];
  *(void *)(v6 + 32) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestInterrupted copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 136) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_40;
      }
    }
    else if ((*((unsigned char *)a3 + 136) & 2) != 0)
    {
LABEL_40:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 136) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)a3 + 136))
    {
      goto LABEL_40;
    }
    timerFiringCount = self->_timerFiringCount;
    if (!((unint64_t)timerFiringCount | *((void *)a3 + 12))
      || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](timerFiringCount, "isEqual:")) != 0)
    {
      activeRequestCount = self->_activeRequestCount;
      if (!((unint64_t)activeRequestCount | *((void *)a3 + 3))
        || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestCount, "isEqual:")) != 0)
      {
        validLocationCount = self->_validLocationCount;
        if (!((unint64_t)validLocationCount | *((void *)a3 + 16))
          || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](validLocationCount, "isEqual:")) != 0)
        {
          timerFiringDelayedCount = self->_timerFiringDelayedCount;
          if (!((unint64_t)timerFiringDelayedCount | *((void *)a3 + 13))
            || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](timerFiringDelayedCount, "isEqual:")) != 0)
          {
            timerFiringDelayedTotalSeconds = self->_timerFiringDelayedTotalSeconds;
            if (!((unint64_t)timerFiringDelayedTotalSeconds | *((void *)a3 + 15))
              || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](timerFiringDelayedTotalSeconds, "isEqual:")) != 0)
            {
              timerFiringDelayedMaxSeconds = self->_timerFiringDelayedMaxSeconds;
              if (!((unint64_t)timerFiringDelayedMaxSeconds | *((void *)a3 + 14))
                || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](timerFiringDelayedMaxSeconds, "isEqual:")) != 0)
              {
                skippedRequestDueToRecentFix = self->_skippedRequestDueToRecentFix;
                if (!((unint64_t)skippedRequestDueToRecentFix | *((void *)a3 + 10))
                  || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](skippedRequestDueToRecentFix, "isEqual:")) != 0)
                {
                  skippedRequestDueToStationary = self->_skippedRequestDueToStationary;
                  if (!((unint64_t)skippedRequestDueToStationary | *((void *)a3 + 11))
                    || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](skippedRequestDueToStationary, "isEqual:")) != 0)
                  {
                    activeRequestTimeoutWithCoarseLocation = self->_activeRequestTimeoutWithCoarseLocation;
                    if (!((unint64_t)activeRequestTimeoutWithCoarseLocation | *((void *)a3 + 5))
                      || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithCoarseLocation, "isEqual:")) != 0)
                    {
                      activeRequestTimeoutWithLocationServiceDisabled = self->_activeRequestTimeoutWithLocationServiceDisabled;
                      if (!((unint64_t)activeRequestTimeoutWithLocationServiceDisabled | *((void *)a3 + 6))
                        || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithLocationServiceDisabled, "isEqual:")) != 0)
                      {
                        activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
                        if (!((unint64_t)activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled | *((void *)a3 + 7))
                          || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled, "isEqual:")) != 0)
                        {
                          activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
                          if (!((unint64_t)activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff | *((void *)a3 + 8))
                            || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff, "isEqual:")) != 0)
                          {
                            activeRequestTimeoutWithOtherReasons = self->_activeRequestTimeoutWithOtherReasons;
                            if (!((unint64_t)activeRequestTimeoutWithOtherReasons | *((void *)a3 + 9))
                              || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithOtherReasons, "isEqual:")) != 0)
                            {
                              activeRequestInterrupted = self->_activeRequestInterrupted;
                              if ((unint64_t)activeRequestInterrupted | *((void *)a3 + 4))
                              {
                                LOBYTE(v5) = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestInterrupted, "isEqual:");
                              }
                              else
                              {
                                LOBYTE(v5) = 1;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
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
  unint64_t v5 = v4 ^ v3 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_timerFiringCount hash];
  unint64_t v6 = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestCount hash];
  unint64_t v7 = v5 ^ v6 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_validLocationCount hash];
  unint64_t v8 = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_timerFiringDelayedCount hash];
  unint64_t v9 = v8 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_timerFiringDelayedTotalSeconds hash];
  unint64_t v10 = v7 ^ v9 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_timerFiringDelayedMaxSeconds hash];
  unint64_t v11 = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_skippedRequestDueToRecentFix hash];
  unint64_t v12 = v11 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_skippedRequestDueToStationary hash];
  unint64_t v13 = v12 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithCoarseLocation hash];
  unint64_t v14 = v10 ^ v13 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithLocationServiceDisabled hash];
  unint64_t v15 = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled hash];
  unint64_t v16 = v15 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff hash];
  unint64_t v17 = v16 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestTimeoutWithOtherReasons hash];
  return v14 ^ v17 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_activeRequestInterrupted hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 136);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 136);
  }
  if (v5)
  {
    self->_duration = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  timerFiringCount = self->_timerFiringCount;
  uint64_t v7 = *((void *)a3 + 12);
  if (timerFiringCount)
  {
    if (v7) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](timerFiringCount, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringCount:](self, "setTimerFiringCount:");
  }
  activeRequestCount = self->_activeRequestCount;
  uint64_t v9 = *((void *)a3 + 3);
  if (activeRequestCount)
  {
    if (v9) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestCount, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestCount:](self, "setActiveRequestCount:");
  }
  validLocationCount = self->_validLocationCount;
  uint64_t v11 = *((void *)a3 + 16);
  if (validLocationCount)
  {
    if (v11) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](validLocationCount, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setValidLocationCount:](self, "setValidLocationCount:");
  }
  timerFiringDelayedCount = self->_timerFiringDelayedCount;
  uint64_t v13 = *((void *)a3 + 13);
  if (timerFiringDelayedCount)
  {
    if (v13) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](timerFiringDelayedCount, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringDelayedCount:](self, "setTimerFiringDelayedCount:");
  }
  timerFiringDelayedTotalSeconds = self->_timerFiringDelayedTotalSeconds;
  uint64_t v15 = *((void *)a3 + 15);
  if (timerFiringDelayedTotalSeconds)
  {
    if (v15) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](timerFiringDelayedTotalSeconds, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringDelayedTotalSeconds:](self, "setTimerFiringDelayedTotalSeconds:");
  }
  timerFiringDelayedMaxSeconds = self->_timerFiringDelayedMaxSeconds;
  uint64_t v17 = *((void *)a3 + 14);
  if (timerFiringDelayedMaxSeconds)
  {
    if (v17) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](timerFiringDelayedMaxSeconds, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringDelayedMaxSeconds:](self, "setTimerFiringDelayedMaxSeconds:");
  }
  skippedRequestDueToRecentFix = self->_skippedRequestDueToRecentFix;
  uint64_t v19 = *((void *)a3 + 10);
  if (skippedRequestDueToRecentFix)
  {
    if (v19) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](skippedRequestDueToRecentFix, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setSkippedRequestDueToRecentFix:](self, "setSkippedRequestDueToRecentFix:");
  }
  skippedRequestDueToStationary = self->_skippedRequestDueToStationary;
  uint64_t v21 = *((void *)a3 + 11);
  if (skippedRequestDueToStationary)
  {
    if (v21) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](skippedRequestDueToStationary, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setSkippedRequestDueToStationary:](self, "setSkippedRequestDueToStationary:");
  }
  activeRequestTimeoutWithCoarseLocation = self->_activeRequestTimeoutWithCoarseLocation;
  uint64_t v23 = *((void *)a3 + 5);
  if (activeRequestTimeoutWithCoarseLocation)
  {
    if (v23) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithCoarseLocation, "mergeFrom:");
    }
  }
  else if (v23)
  {
    [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithCoarseLocation:"setActiveRequestTimeoutWithCoarseLocation:"];
  }
  activeRequestTimeoutWithLocationServiceDisabled = self->_activeRequestTimeoutWithLocationServiceDisabled;
  uint64_t v25 = *((void *)a3 + 6);
  if (activeRequestTimeoutWithLocationServiceDisabled)
  {
    if (v25) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithLocationServiceDisabled, "mergeFrom:");
    }
  }
  else if (v25)
  {
    [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithLocationServiceDisabled:"setActiveRequestTimeoutWithLocationServiceDisabled:"];
  }
  activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
  uint64_t v27 = *((void *)a3 + 7);
  if (activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled)
  {
    if (v27) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled, "mergeFrom:");
    }
  }
  else if (v27)
  {
    [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:"setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:"];
  }
  activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
  uint64_t v29 = *((void *)a3 + 8);
  if (activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff)
  {
    if (v29) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff, "mergeFrom:");
    }
  }
  else if (v29)
  {
    [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:"setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:"];
  }
  activeRequestTimeoutWithOtherReasons = self->_activeRequestTimeoutWithOtherReasons;
  uint64_t v31 = *((void *)a3 + 9);
  if (activeRequestTimeoutWithOtherReasons)
  {
    if (v31) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithOtherReasons, "mergeFrom:");
    }
  }
  else if (v31)
  {
    [(AWDCoreRoutineLocationAwarenessStatistics *)self setActiveRequestTimeoutWithOtherReasons:"setActiveRequestTimeoutWithOtherReasons:"];
  }
  activeRequestInterrupted = self->_activeRequestInterrupted;
  uint64_t v33 = *((void *)a3 + 4);
  if (activeRequestInterrupted)
  {
    if (v33)
    {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestInterrupted, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestInterrupted:](self, "setActiveRequestInterrupted:");
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

- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringCount
{
  return self->_timerFiringCount;
}

- (void)setTimerFiringCount:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestCount
{
  return self->_activeRequestCount;
}

- (void)setActiveRequestCount:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)validLocationCount
{
  return self->_validLocationCount;
}

- (void)setValidLocationCount:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringDelayedCount
{
  return self->_timerFiringDelayedCount;
}

- (void)setTimerFiringDelayedCount:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringDelayedTotalSeconds
{
  return self->_timerFiringDelayedTotalSeconds;
}

- (void)setTimerFiringDelayedTotalSeconds:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringDelayedMaxSeconds
{
  return self->_timerFiringDelayedMaxSeconds;
}

- (void)setTimerFiringDelayedMaxSeconds:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)skippedRequestDueToRecentFix
{
  return self->_skippedRequestDueToRecentFix;
}

- (void)setSkippedRequestDueToRecentFix:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)skippedRequestDueToStationary
{
  return self->_skippedRequestDueToStationary;
}

- (void)setSkippedRequestDueToStationary:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithCoarseLocation
{
  return self->_activeRequestTimeoutWithCoarseLocation;
}

- (void)setActiveRequestTimeoutWithCoarseLocation:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithLocationServiceDisabled
{
  return self->_activeRequestTimeoutWithLocationServiceDisabled;
}

- (void)setActiveRequestTimeoutWithLocationServiceDisabled:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled
{
  return self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
}

- (void)setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff
{
  return self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
}

- (void)setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithOtherReasons
{
  return self->_activeRequestTimeoutWithOtherReasons;
}

- (void)setActiveRequestTimeoutWithOtherReasons:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestInterrupted
{
  return self->_activeRequestInterrupted;
}

- (void)setActiveRequestInterrupted:(id)a3
{
}

@end