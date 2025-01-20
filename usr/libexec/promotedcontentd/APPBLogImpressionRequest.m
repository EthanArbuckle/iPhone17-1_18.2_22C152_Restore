@interface APPBLogImpressionRequest
+ (Class)metricType;
+ (id)options;
- (APPBLogMetaData)metaData;
- (BOOL)hasContextString;
- (BOOL)hasInsufficientPlaybackTime;
- (BOOL)hasMediaContentHash;
- (BOOL)hasMetaData;
- (BOOL)hasPlaybackTime;
- (BOOL)hasScreenSaverActive;
- (BOOL)hasType;
- (BOOL)hasVisuallyEngaged;
- (BOOL)insufficientPlaybackTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)screenSaverActive;
- (BOOL)visuallyEngaged;
- (NSData)mediaContentHash;
- (NSMutableArray)metrics;
- (NSString)contextString;
- (float)playbackTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)metricsCount;
- (void)addMetric:(id)a3;
- (void)clearMetrics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContextString:(id)a3;
- (void)setHasInsufficientPlaybackTime:(BOOL)a3;
- (void)setHasPlaybackTime:(BOOL)a3;
- (void)setHasScreenSaverActive:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVisuallyEngaged:(BOOL)a3;
- (void)setInsufficientPlaybackTime:(BOOL)a3;
- (void)setMediaContentHash:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setPlaybackTime:(float)a3;
- (void)setScreenSaverActive:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setVisuallyEngaged:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBLogImpressionRequest

+ (id)options
{
  if (qword_100289A80 != -1) {
    dispatch_once(&qword_100289A80, &stru_100235E90);
  }
  v2 = (void *)qword_100289A78;

  return v2;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (void)clearMetrics
{
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  metrics = self->_metrics;
  id v8 = v4;
  if (!metrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_metrics;
    self->_metrics = v6;

    id v4 = v8;
    metrics = self->_metrics;
  }
  [(NSMutableArray *)metrics addObject:v4];
}

- (unint64_t)metricsCount
{
  return (unint64_t)[(NSMutableArray *)self->_metrics count];
}

- (id)metricAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_metrics objectAtIndex:a3];
}

+ (Class)metricType
{
  return (Class)objc_opt_class();
}

- (void)setScreenSaverActive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_screenSaverActive = a3;
}

- (void)setHasScreenSaverActive:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasScreenSaverActive
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasMediaContentHash
{
  return self->_mediaContentHash != 0;
}

- (void)setPlaybackTime:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_playbackTime = a3;
}

- (void)setHasPlaybackTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaybackTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInsufficientPlaybackTime:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_insufficientPlaybackTime = a3;
}

- (void)setHasInsufficientPlaybackTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInsufficientPlaybackTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setVisuallyEngaged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_visuallyEngaged = a3;
}

- (void)setHasVisuallyEngaged:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVisuallyEngaged
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100235EB0 + a3 - 1);
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"contentRequest"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"viewable"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"viewable50Percent"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasContextString
{
  return self->_contextString != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogImpressionRequest;
  id v3 = [(APPBLogImpressionRequest *)&v7 description];
  int v4 = [(APPBLogImpressionRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  metaData = self->_metaData;
  if (metaData)
  {
    v5 = [(APPBLogMetaData *)metaData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"metaData"];
  }
  if ([(NSMutableArray *)self->_metrics count])
  {
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_metrics, "count")];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = self->_metrics;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"metric"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v14 = +[NSNumber numberWithBool:self->_screenSaverActive];
    [v3 setObject:v14 forKey:@"screenSaverActive"];
  }
  mediaContentHash = self->_mediaContentHash;
  if (mediaContentHash) {
    [v3 setObject:mediaContentHash forKey:@"mediaContentHash"];
  }
  char has = (char)self->_has;
  if (has)
  {
    *(float *)&double v6 = self->_playbackTime;
    v17 = +[NSNumber numberWithFloat:v6];
    [v3 setObject:v17 forKey:@"playbackTime"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_18:
      if ((has & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_18;
  }
  v18 = +[NSNumber numberWithBool:self->_insufficientPlaybackTime];
  [v3 setObject:v18 forKey:@"insufficientPlaybackTime"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_19:
    if ((has & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
LABEL_23:
  v19 = +[NSNumber numberWithBool:self->_visuallyEngaged];
  [v3 setObject:v19 forKey:@"visuallyEngaged"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_28;
  }
LABEL_24:
  int v20 = self->_type - 1;
  if (v20 >= 3)
  {
    v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
  }
  else
  {
    v21 = *(&off_100235EB0 + v20);
  }
  [v3 setObject:v21 forKey:@"type"];

LABEL_28:
  contextString = self->_contextString;
  if (contextString) {
    [v3 setObject:contextString forKey:@"contextString"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogImpressionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_metaData) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_metrics;
  double v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_mediaContentHash) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_16:
      if ((has & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_17:
    if ((has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_18:
  }
    PBDataWriterWriteInt32Field();
LABEL_19:
  if (self->_contextString) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if (self->_metaData) {
    [v10 setMetaData:];
  }
  if ([(APPBLogImpressionRequest *)self metricsCount])
  {
    [v10 clearMetrics];
    unint64_t v4 = [(APPBLogImpressionRequest *)self metricsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(APPBLogImpressionRequest *)self metricAtIndex:i];
        [v10 addMetric:v7];
      }
    }
  }
  uint64_t v8 = v10;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v10[49] = self->_screenSaverActive;
    v10[52] |= 8u;
  }
  if (self->_mediaContentHash)
  {
    [v10 setMediaContentHash:];
    uint64_t v8 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v8 + 10) = LODWORD(self->_playbackTime);
    v8[52] |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  v8[48] = self->_insufficientPlaybackTime;
  v8[52] |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_23:
  v8[50] = self->_visuallyEngaged;
  v8[52] |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_15:
    *((_DWORD *)v8 + 11) = self->_type;
    v8[52] |= 2u;
  }
LABEL_16:
  if (self->_contextString)
  {
    [v10 setContextString:];
    uint64_t v8 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBLogMetaData *)self->_metaData copyWithZone:a3];
  id v7 = (void *)v5[3];
  v5[3] = v6;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_metrics;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) copyWithZone:a3];
        [v5 addMetric:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v5 + 49) = self->_screenSaverActive;
    *((unsigned char *)v5 + 52) |= 8u;
  }
  id v14 = -[NSData copyWithZone:](self->_mediaContentHash, "copyWithZone:", a3, (void)v20);
  v15 = (void *)v5[2];
  v5[2] = v14;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 10) = LODWORD(self->_playbackTime);
    *((unsigned char *)v5 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0) {
        goto LABEL_13;
      }
LABEL_18:
      *((unsigned char *)v5 + 50) = self->_visuallyEngaged;
      *((unsigned char *)v5 + 52) |= 0x10u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  *((unsigned char *)v5 + 48) = self->_insufficientPlaybackTime;
  *((unsigned char *)v5 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_18;
  }
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    *((_DWORD *)v5 + 11) = self->_type;
    *((unsigned char *)v5 + 52) |= 2u;
  }
LABEL_15:
  id v17 = [(NSString *)self->_contextString copyWithZone:a3];
  v18 = (void *)v5[1];
  v5[1] = v17;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((void *)v4 + 3))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:")) {
      goto LABEL_45;
    }
  }
  metrics = self->_metrics;
  if ((unint64_t)metrics | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](metrics, "isEqual:")) {
      goto LABEL_45;
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0) {
      goto LABEL_45;
    }
    if (self->_screenSaverActive)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_45;
  }
  mediaContentHash = self->_mediaContentHash;
  if ((unint64_t)mediaContentHash | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](mediaContentHash, "isEqual:")) {
      goto LABEL_45;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_playbackTime != *((float *)v4 + 10)) {
      goto LABEL_45;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_45;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0) {
      goto LABEL_45;
    }
    if (self->_insufficientPlaybackTime)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
    {
      if (self->_visuallyEngaged)
      {
        if (!*((unsigned char *)v4 + 50)) {
          goto LABEL_45;
        }
        goto LABEL_38;
      }
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_38;
      }
    }
LABEL_45:
    unsigned __int8 v10 = 0;
    goto LABEL_46;
  }
  if ((*((unsigned char *)v4 + 52) & 0x10) != 0) {
    goto LABEL_45;
  }
LABEL_38:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_type != *((_DWORD *)v4 + 11)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_45;
  }
  contextString = self->_contextString;
  if ((unint64_t)contextString | *((void *)v4 + 1)) {
    unsigned __int8 v10 = -[NSString isEqual:](contextString, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_46:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(APPBLogMetaData *)self->_metaData hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_metrics hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v5 = 2654435761 * self->_screenSaverActive;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = (unint64_t)[(NSData *)self->_mediaContentHash hash];
  char has = (char)self->_has;
  if (has)
  {
    float playbackTime = self->_playbackTime;
    float v10 = -playbackTime;
    if (playbackTime >= 0.0) {
      float v10 = self->_playbackTime;
    }
    float v11 = floorf(v10 + 0.5);
    float v12 = (float)(v10 - v11) * 1.8447e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmodf(v11, 1.8447e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabsf(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ((has & 4) == 0)
  {
    uint64_t v13 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v14 = 0;
    if ((has & 2) != 0) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_contextString hash];
  }
  uint64_t v13 = 2654435761 * self->_insufficientPlaybackTime;
  if ((has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v14 = 2654435761 * self->_visuallyEngaged;
  if ((has & 2) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v15 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_contextString hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  metaData = self->_metaData;
  uint64_t v6 = *((void *)v4 + 3);
  if (metaData)
  {
    if (v6) {
      -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[APPBLogImpressionRequest setMetaData:](self, "setMetaData:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 4);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[APPBLogImpressionRequest addMetric:](self, "addMetric:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    self->_screenSaverActive = *((unsigned char *)v4 + 49);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 2)) {
    -[APPBLogImpressionRequest setMediaContentHash:](self, "setMediaContentHash:");
  }
  char v12 = *((unsigned char *)v4 + 52);
  if (v12)
  {
    self->_float playbackTime = *((float *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v12 = *((unsigned char *)v4 + 52);
    if ((v12 & 4) == 0)
    {
LABEL_19:
      if ((v12 & 0x10) == 0) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) == 0)
  {
    goto LABEL_19;
  }
  self->_insufficientPlaybackTime = *((unsigned char *)v4 + 48);
  *(unsigned char *)&self->_has |= 4u;
  char v12 = *((unsigned char *)v4 + 52);
  if ((v12 & 0x10) == 0)
  {
LABEL_20:
    if ((v12 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_27:
  self->_visuallyEngaged = *((unsigned char *)v4 + 50);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
LABEL_21:
    self->_type = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_22:
  if (*((void *)v4 + 1)) {
    -[APPBLogImpressionRequest setContextString:](self, "setContextString:");
  }
}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (BOOL)screenSaverActive
{
  return self->_screenSaverActive;
}

- (NSData)mediaContentHash
{
  return self->_mediaContentHash;
}

- (void)setMediaContentHash:(id)a3
{
}

- (float)playbackTime
{
  return self->_playbackTime;
}

- (BOOL)insufficientPlaybackTime
{
  return self->_insufficientPlaybackTime;
}

- (BOOL)visuallyEngaged
{
  return self->_visuallyEngaged;
}

- (NSString)contextString
{
  return self->_contextString;
}

- (void)setContextString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_mediaContentHash, 0);

  objc_storeStrong((id *)&self->_contextString, 0);
}

@end