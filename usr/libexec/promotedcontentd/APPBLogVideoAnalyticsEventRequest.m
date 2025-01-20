@interface APPBLogVideoAnalyticsEventRequest
+ (id)options;
- (APPBLogMetaData)metaData;
- (BOOL)hasBundleID;
- (BOOL)hasCurrentPlaybackTime;
- (BOOL)hasEventSequence;
- (BOOL)hasMetaData;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalDuration;
- (BOOL)hasVideoState;
- (BOOL)hasVisiblePercentage;
- (BOOL)hasVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (double)currentPlaybackTime;
- (double)timestamp;
- (double)totalDuration;
- (double)visiblePercentage;
- (float)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)videoStateAsString:(int)a3;
- (int)StringAsVideoState:(id)a3;
- (int)eventSequence;
- (int)videoState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCurrentPlaybackTime:(double)a3;
- (void)setEventSequence:(int)a3;
- (void)setHasCurrentPlaybackTime:(BOOL)a3;
- (void)setHasEventSequence:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalDuration:(BOOL)a3;
- (void)setHasVideoState:(BOOL)a3;
- (void)setHasVisiblePercentage:(BOOL)a3;
- (void)setHasVolume:(BOOL)a3;
- (void)setMetaData:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTotalDuration:(double)a3;
- (void)setVideoState:(int)a3;
- (void)setVisiblePercentage:(double)a3;
- (void)setVolume:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBLogVideoAnalyticsEventRequest

+ (id)options
{
  if (qword_1002898A0 != -1) {
    dispatch_once(&qword_1002898A0, &stru_100235338);
  }
  v2 = (void *)qword_100289898;

  return v2;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (int)videoState
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_videoState;
  }
  else {
    return 0;
  }
}

- (void)setVideoState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_videoState = a3;
}

- (void)setHasVideoState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasVideoState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)videoStateAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100235358 + a3);
  }

  return v3;
}

- (int)StringAsVideoState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Loaded"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Unloaded"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Started"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Completed"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Paused"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Resumed"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Skipped"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Muted"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Unmuted"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FullScreen"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ExitFullScreen"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Touched"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ProgressFirstQuartile"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ProgressMidpoint"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ProgressThirdQuartile"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"VisibilityChanged"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PlaybackFailed"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCurrentPlaybackTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_currentPlaybackTime = a3;
}

- (void)setHasCurrentPlaybackTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrentPlaybackTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTotalDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalDuration = a3;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setVisiblePercentage:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_visiblePercentage = a3;
}

- (void)setHasVisiblePercentage:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVisiblePercentage
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTimestamp:(double)a3
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

- (void)setEventSequence:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_eventSequence = a3;
}

- (void)setHasEventSequence:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEventSequence
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setVolume:(float)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_volume = a3;
}

- (void)setHasVolume:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVolume
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogVideoAnalyticsEventRequest;
  char v3 = [(APPBLogVideoAnalyticsEventRequest *)&v7 description];
  int v4 = [(APPBLogVideoAnalyticsEventRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  metaData = self->_metaData;
  if (metaData)
  {
    v6 = [(APPBLogMetaData *)metaData dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"metaData"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t videoState = self->_videoState;
    if (videoState >= 0x11)
    {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_videoState];
    }
    else
    {
      v10 = *(&off_100235358 + videoState);
    }
    [v3 setObject:v10 forKey:@"videoState"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = +[NSNumber numberWithDouble:self->_currentPlaybackTime];
    [v3 setObject:v13 forKey:@"currentPlaybackTime"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_12;
  }
  v14 = +[NSNumber numberWithDouble:self->_totalDuration];
  [v3 setObject:v14 forKey:@"totalDuration"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = +[NSNumber numberWithDouble:self->_visiblePercentage];
  [v3 setObject:v15 forKey:@"visiblePercentage"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
LABEL_23:
  v16 = +[NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v16 forKey:@"timestamp"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_24:
  v17 = +[NSNumber numberWithInt:self->_eventSequence];
  [v3 setObject:v17 forKey:@"eventSequence"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_16:
    *(float *)&double v4 = self->_volume;
    v11 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v11 forKey:@"volume"];
  }
LABEL_17:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogVideoAnalyticsEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_metaData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_13:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_metaData)
  {
    [v4 setMetaData:];
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    [v6 setBundleID:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_videoState;
    *((unsigned char *)v4 + 72) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 1) = *(void *)&self->_currentPlaybackTime;
  *((unsigned char *)v4 + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)v4 + 3) = *(void *)&self->_totalDuration;
  *((unsigned char *)v4 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)v4 + 4) = *(void *)&self->_visiblePercentage;
  *((unsigned char *)v4 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)v4 + 2) = *(void *)&self->_timestamp;
  *((unsigned char *)v4 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  *((_DWORD *)v4 + 12) = self->_eventSequence;
  *((unsigned char *)v4 + 72) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 17) = LODWORD(self->_volume);
    *((unsigned char *)v4 + 72) |= 0x40u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(APPBLogMetaData *)self->_metaData copyWithZone:a3];
  objc_super v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_videoState;
    *((unsigned char *)v5 + 72) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[1] = *(void *)&self->_currentPlaybackTime;
  *((unsigned char *)v5 + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v5[3] = *(void *)&self->_totalDuration;
  *((unsigned char *)v5 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  v5[4] = *(void *)&self->_visiblePercentage;
  *((unsigned char *)v5 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    *((_DWORD *)v5 + 12) = self->_eventSequence;
    *((unsigned char *)v5 + 72) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return v5;
    }
    goto LABEL_8;
  }
LABEL_14:
  v5[2] = *(void *)&self->_timestamp;
  *((unsigned char *)v5 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 17) = LODWORD(self->_volume);
    *((unsigned char *)v5 + 72) |= 0x40u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((void *)v4 + 7))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:")) {
      goto LABEL_40;
    }
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x20) == 0 || self->_videoState != *((_DWORD *)v4 + 16)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x20) != 0)
  {
LABEL_40:
    BOOL v7 = 0;
    goto LABEL_41;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_currentPlaybackTime != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_totalDuration != *((double *)v4 + 3)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_visiblePercentage != *((double *)v4 + 4)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x10) == 0 || self->_eventSequence != *((_DWORD *)v4 + 12)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  BOOL v7 = (*((unsigned char *)v4 + 72) & 0x40) == 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x40) == 0 || self->_volume != *((float *)v4 + 17)) {
      goto LABEL_40;
    }
    BOOL v7 = 1;
  }
LABEL_41:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v33 = [(APPBLogMetaData *)self->_metaData hash];
  NSUInteger v3 = [(NSString *)self->_bundleID hash];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v5 = 2654435761 * self->_videoState;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double currentPlaybackTime = self->_currentPlaybackTime;
  double v7 = -currentPlaybackTime;
  if (currentPlaybackTime >= 0.0) {
    double v7 = self->_currentPlaybackTime;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    double totalDuration = self->_totalDuration;
    double v13 = -totalDuration;
    if (totalDuration >= 0.0) {
      double v13 = self->_totalDuration;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 8) != 0)
  {
    double visiblePercentage = self->_visiblePercentage;
    double v18 = -visiblePercentage;
    if (visiblePercentage >= 0.0) {
      double v18 = self->_visiblePercentage;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v23 = -timestamp;
    if (timestamp >= 0.0) {
      double v23 = self->_timestamp;
    }
    long double v24 = floor(v23 + 0.5);
    double v25 = (v23 - v24) * 1.84467441e19;
    unint64_t v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0) {
        v21 += (unint64_t)v25;
      }
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    unint64_t v21 = 0;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t v26 = 2654435761 * self->_eventSequence;
    if ((has & 0x40) != 0) {
      goto LABEL_37;
    }
LABEL_42:
    unint64_t v31 = 0;
    return v3 ^ v33 ^ v5 ^ v10 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31;
  }
  uint64_t v26 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_42;
  }
LABEL_37:
  float volume = self->_volume;
  float v28 = -volume;
  if (volume >= 0.0) {
    float v28 = self->_volume;
  }
  float v29 = floorf(v28 + 0.5);
  float v30 = (float)(v28 - v29) * 1.8447e19;
  unint64_t v31 = 2654435761u * (unint64_t)fmodf(v29, 1.8447e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0) {
      v31 += (unint64_t)v30;
    }
  }
  else
  {
    v31 -= (unint64_t)fabsf(v30);
  }
  return v3 ^ v33 ^ v5 ^ v10 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  metaData = self->_metaData;
  uint64_t v6 = *((void *)v4 + 7);
  id v8 = v4;
  if (metaData)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[APPBLogVideoAnalyticsEventRequest setMetaData:](self, "setMetaData:");
  }
  id v4 = v8;
LABEL_7:
  if (*((void *)v4 + 5))
  {
    -[APPBLogVideoAnalyticsEventRequest setBundleID:](self, "setBundleID:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 0x20) != 0)
  {
    self->_uint64_t videoState = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 0x20u;
    char v7 = *((unsigned char *)v4 + 72);
    if ((v7 & 1) == 0)
    {
LABEL_11:
      if ((v7 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_double currentPlaybackTime = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 4) == 0)
  {
LABEL_12:
    if ((v7 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_double totalDuration = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 8) == 0)
  {
LABEL_13:
    if ((v7 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_double visiblePercentage = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 2) == 0)
  {
LABEL_14:
    if ((v7 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_double timestamp = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 0x10) == 0)
  {
LABEL_15:
    if ((v7 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_25:
  self->_eventSequence = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 72) & 0x40) != 0)
  {
LABEL_16:
    self->_float volume = *((float *)v4 + 17);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_17:

  _objc_release_x1();
}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (double)currentPlaybackTime
{
  return self->_currentPlaybackTime;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (double)visiblePercentage
{
  return self->_visiblePercentage;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)eventSequence
{
  return self->_eventSequence;
}

- (float)volume
{
  return self->_volume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end