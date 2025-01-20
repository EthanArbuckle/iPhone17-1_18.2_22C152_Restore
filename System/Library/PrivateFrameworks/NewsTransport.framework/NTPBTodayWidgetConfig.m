@interface NTPBTodayWidgetConfig
- (BOOL)contentPrefetchEnabled;
- (BOOL)hasAudioIndicatorColor;
- (BOOL)hasBackgroundColorDark;
- (BOOL)hasBackgroundColorLight;
- (BOOL)hasContentPrefetchEnabled;
- (BOOL)hasExternalAnalyticsConfigurationsData;
- (BOOL)hasMinimumArticleExposureDurationToBePreseen;
- (BOOL)hasMinimumNumberOfTimesPreseenToBeSeen;
- (BOOL)hasPrerollLoadingTimeout;
- (BOOL)hasWidgetBackgroundInteractionEnabled;
- (BOOL)hasWidgetSystemReloadInterval;
- (BOOL)hasWidgetSystemReloadJitterMax;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)widgetBackgroundInteractionEnabled;
- (NSData)externalAnalyticsConfigurationsData;
- (NSString)audioIndicatorColor;
- (NSString)backgroundColorDark;
- (NSString)backgroundColorLight;
- (double)prerollLoadingTimeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)minimumArticleExposureDurationToBePreseen;
- (int64_t)widgetSystemReloadInterval;
- (int64_t)widgetSystemReloadJitterMax;
- (unint64_t)hash;
- (unsigned)minimumNumberOfTimesPreseenToBeSeen;
- (void)mergeFrom:(id)a3;
- (void)setAudioIndicatorColor:(id)a3;
- (void)setBackgroundColorDark:(id)a3;
- (void)setBackgroundColorLight:(id)a3;
- (void)setContentPrefetchEnabled:(BOOL)a3;
- (void)setExternalAnalyticsConfigurationsData:(id)a3;
- (void)setHasContentPrefetchEnabled:(BOOL)a3;
- (void)setHasMinimumArticleExposureDurationToBePreseen:(BOOL)a3;
- (void)setHasMinimumNumberOfTimesPreseenToBeSeen:(BOOL)a3;
- (void)setHasPrerollLoadingTimeout:(BOOL)a3;
- (void)setHasWidgetBackgroundInteractionEnabled:(BOOL)a3;
- (void)setHasWidgetSystemReloadInterval:(BOOL)a3;
- (void)setHasWidgetSystemReloadJitterMax:(BOOL)a3;
- (void)setMinimumArticleExposureDurationToBePreseen:(int64_t)a3;
- (void)setMinimumNumberOfTimesPreseenToBeSeen:(unsigned int)a3;
- (void)setPrerollLoadingTimeout:(double)a3;
- (void)setWidgetBackgroundInteractionEnabled:(BOOL)a3;
- (void)setWidgetSystemReloadInterval:(int64_t)a3;
- (void)setWidgetSystemReloadJitterMax:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayWidgetConfig

- (void)setMinimumArticleExposureDurationToBePreseen:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimumArticleExposureDurationToBePreseen = a3;
}

- (void)setHasMinimumArticleExposureDurationToBePreseen:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumArticleExposureDurationToBePreseen
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMinimumNumberOfTimesPreseenToBeSeen:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_minimumNumberOfTimesPreseenToBeSeen = a3;
}

- (void)setHasMinimumNumberOfTimesPreseenToBeSeen:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumNumberOfTimesPreseenToBeSeen
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPrerollLoadingTimeout:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_prerollLoadingTimeout = a3;
}

- (void)setHasPrerollLoadingTimeout:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrerollLoadingTimeout
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasExternalAnalyticsConfigurationsData
{
  return self->_externalAnalyticsConfigurationsData != 0;
}

- (BOOL)hasBackgroundColorLight
{
  return self->_backgroundColorLight != 0;
}

- (BOOL)hasBackgroundColorDark
{
  return self->_backgroundColorDark != 0;
}

- (void)setContentPrefetchEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_contentPrefetchEnabled = a3;
}

- (void)setHasContentPrefetchEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasContentPrefetchEnabled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasAudioIndicatorColor
{
  return self->_audioIndicatorColor != 0;
}

- (void)setWidgetSystemReloadInterval:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_widgetSystemReloadInterval = a3;
}

- (void)setHasWidgetSystemReloadInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidgetSystemReloadInterval
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWidgetSystemReloadJitterMax:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_widgetSystemReloadJitterMax = a3;
}

- (void)setHasWidgetSystemReloadJitterMax:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWidgetSystemReloadJitterMax
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setWidgetBackgroundInteractionEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_widgetBackgroundInteractionEnabled = a3;
}

- (void)setHasWidgetBackgroundInteractionEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasWidgetBackgroundInteractionEnabled
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayWidgetConfig;
  v4 = [(NTPBTodayWidgetConfig *)&v8 description];
  v5 = [(NTPBTodayWidgetConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v14 = [NSNumber numberWithLongLong:self->_minimumArticleExposureDurationToBePreseen];
    [v3 setObject:v14 forKey:@"minimum_article_exposure_duration_to_be_preseen"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v15 = [NSNumber numberWithUnsignedInt:self->_minimumNumberOfTimesPreseenToBeSeen];
  [v3 setObject:v15 forKey:@"minimum_number_of_times_preseen_to_be_seen"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_prerollLoadingTimeout];
    [v3 setObject:v5 forKey:@"preroll_loading_timeout"];
  }
LABEL_5:
  externalAnalyticsConfigurationsData = self->_externalAnalyticsConfigurationsData;
  if (externalAnalyticsConfigurationsData) {
    [v3 setObject:externalAnalyticsConfigurationsData forKey:@"external_analytics_configurations_data"];
  }
  backgroundColorLight = self->_backgroundColorLight;
  if (backgroundColorLight) {
    [v3 setObject:backgroundColorLight forKey:@"background_color_light"];
  }
  backgroundColorDark = self->_backgroundColorDark;
  if (backgroundColorDark) {
    [v3 setObject:backgroundColorDark forKey:@"background_color_dark"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_contentPrefetchEnabled];
    [v3 setObject:v9 forKey:@"content_prefetch_enabled"];
  }
  audioIndicatorColor = self->_audioIndicatorColor;
  if (audioIndicatorColor) {
    [v3 setObject:audioIndicatorColor forKey:@"audio_indicator_color"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    v16 = [NSNumber numberWithLongLong:self->_widgetSystemReloadInterval];
    [v3 setObject:v16 forKey:@"widget_system_reload_interval"];

    char v11 = (char)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_17:
      if ((v11 & 0x40) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  v17 = [NSNumber numberWithLongLong:self->_widgetSystemReloadJitterMax];
  [v3 setObject:v17 forKey:@"widget_system_reload_jitter_max"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_18:
    v12 = [NSNumber numberWithBool:self->_widgetBackgroundInteractionEnabled];
    [v3 setObject:v12 forKey:@"widget_background_interaction_enabled"];
  }
LABEL_19:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayWidgetConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteDoubleField();
LABEL_5:
  if (self->_externalAnalyticsConfigurationsData) {
    PBDataWriterWriteDataField();
  }
  if (self->_backgroundColorLight) {
    PBDataWriterWriteStringField();
  }
  if (self->_backgroundColorDark) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_audioIndicatorColor) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char v5 = (char)self->_has;
    if ((v5 & 8) == 0)
    {
LABEL_17:
      if ((v5 & 0x40) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_18:
  }
    PBDataWriterWriteBOOLField();
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_minimumArticleExposureDurationToBePreseen;
    *(unsigned char *)(v5 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_minimumNumberOfTimesPreseenToBeSeen;
  *(unsigned char *)(v5 + 80) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_prerollLoadingTimeout;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
LABEL_5:
  uint64_t v8 = [(NSData *)self->_externalAnalyticsConfigurationsData copyWithZone:a3];
  v9 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v8;

  uint64_t v10 = [(NSString *)self->_backgroundColorLight copyWithZone:a3];
  char v11 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_backgroundColorDark copyWithZone:a3];
  v13 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v12;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 76) = self->_contentPrefetchEnabled;
    *(unsigned char *)(v6 + 80) |= 0x20u;
  }
  uint64_t v14 = [(NSString *)self->_audioIndicatorColor copyWithZone:a3];
  v15 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v14;

  char v16 = (char)self->_has;
  if ((v16 & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_16:
    *(void *)(v6 + 32) = self->_widgetSystemReloadJitterMax;
    *(unsigned char *)(v6 + 80) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return (id)v6;
    }
    goto LABEL_10;
  }
  *(void *)(v6 + 24) = self->_widgetSystemReloadInterval;
  *(unsigned char *)(v6 + 80) |= 4u;
  char v16 = (char)self->_has;
  if ((v16 & 8) != 0) {
    goto LABEL_16;
  }
LABEL_9:
  if ((v16 & 0x40) != 0)
  {
LABEL_10:
    *(unsigned char *)(v6 + 77) = self->_widgetBackgroundInteractionEnabled;
    *(unsigned char *)(v6 + 80) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_minimumArticleExposureDurationToBePreseen != *((void *)v4 + 1)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x10) == 0 || self->_minimumNumberOfTimesPreseenToBeSeen != *((_DWORD *)v4 + 18)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_prerollLoadingTimeout != *((double *)v4 + 2)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_46;
  }
  externalAnalyticsConfigurationsData = self->_externalAnalyticsConfigurationsData;
  if ((unint64_t)externalAnalyticsConfigurationsData | *((void *)v4 + 8)
    && !-[NSData isEqual:](externalAnalyticsConfigurationsData, "isEqual:"))
  {
    goto LABEL_46;
  }
  backgroundColorLight = self->_backgroundColorLight;
  if ((unint64_t)backgroundColorLight | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](backgroundColorLight, "isEqual:")) {
      goto LABEL_46;
    }
  }
  backgroundColorDark = self->_backgroundColorDark;
  if ((unint64_t)backgroundColorDark | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](backgroundColorDark, "isEqual:")) {
      goto LABEL_46;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x20) == 0) {
      goto LABEL_46;
    }
    if (self->_contentPrefetchEnabled)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  audioIndicatorColor = self->_audioIndicatorColor;
  if ((unint64_t)audioIndicatorColor | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](audioIndicatorColor, "isEqual:")) {
      goto LABEL_46;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_widgetSystemReloadInterval != *((void *)v4 + 3)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0 || self->_widgetSystemReloadJitterMax != *((void *)v4 + 4)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
    goto LABEL_46;
  }
  BOOL v10 = (*((unsigned char *)v4 + 80) & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x40) != 0)
    {
      if (self->_widgetBackgroundInteractionEnabled)
      {
        if (!*((unsigned char *)v4 + 77)) {
          goto LABEL_46;
        }
      }
      else if (*((unsigned char *)v4 + 77))
      {
        goto LABEL_46;
      }
      BOOL v10 = 1;
      goto LABEL_47;
    }
LABEL_46:
    BOOL v10 = 0;
  }
LABEL_47:

  return v10;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v9 = 0;
    goto LABEL_13;
  }
  uint64_t v3 = 2654435761 * self->_minimumArticleExposureDurationToBePreseen;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_minimumNumberOfTimesPreseenToBeSeen;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double prerollLoadingTimeout = self->_prerollLoadingTimeout;
  double v6 = -prerollLoadingTimeout;
  if (prerollLoadingTimeout >= 0.0) {
    double v6 = self->_prerollLoadingTimeout;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_13:
  uint64_t v10 = [(NSData *)self->_externalAnalyticsConfigurationsData hash];
  NSUInteger v11 = [(NSString *)self->_backgroundColorLight hash];
  NSUInteger v12 = [(NSString *)self->_backgroundColorDark hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v13 = 2654435761 * self->_contentPrefetchEnabled;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_audioIndicatorColor hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_18;
    }
LABEL_21:
    uint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v17 = 0;
    return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
  uint64_t v15 = 2654435761 * self->_widgetSystemReloadInterval;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v16 = 2654435761 * self->_widgetSystemReloadJitterMax;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v17 = 2654435761 * self->_widgetBackgroundInteractionEnabled;
  return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 80);
  if (v5)
  {
    self->_minimumArticleExposureDurationToBePreseen = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 80);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_minimumNumberOfTimesPreseenToBeSeen = *((_DWORD *)v4 + 18);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
LABEL_4:
    self->_double prerollLoadingTimeout = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  id v7 = v4;
  if (*((void *)v4 + 8))
  {
    -[NTPBTodayWidgetConfig setExternalAnalyticsConfigurationsData:](self, "setExternalAnalyticsConfigurationsData:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBTodayWidgetConfig setBackgroundColorLight:](self, "setBackgroundColorLight:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[NTPBTodayWidgetConfig setBackgroundColorDark:](self, "setBackgroundColorDark:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 80) & 0x20) != 0)
  {
    self->_contentPrefetchEnabled = *((unsigned char *)v4 + 76);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 5))
  {
    -[NTPBTodayWidgetConfig setAudioIndicatorColor:](self, "setAudioIndicatorColor:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 80);
  if ((v6 & 4) != 0)
  {
    self->_widgetSystemReloadInterval = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 80);
    if ((v6 & 8) == 0)
    {
LABEL_17:
      if ((v6 & 0x40) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) == 0)
  {
    goto LABEL_17;
  }
  self->_widgetSystemReloadJitterMax = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 80) & 0x40) != 0)
  {
LABEL_18:
    self->_widgetBackgroundInteractionEnabled = *((unsigned char *)v4 + 77);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_19:
}

- (int64_t)minimumArticleExposureDurationToBePreseen
{
  return self->_minimumArticleExposureDurationToBePreseen;
}

- (unsigned)minimumNumberOfTimesPreseenToBeSeen
{
  return self->_minimumNumberOfTimesPreseenToBeSeen;
}

- (double)prerollLoadingTimeout
{
  return self->_prerollLoadingTimeout;
}

- (NSData)externalAnalyticsConfigurationsData
{
  return self->_externalAnalyticsConfigurationsData;
}

- (void)setExternalAnalyticsConfigurationsData:(id)a3
{
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (void)setBackgroundColorLight:(id)a3
{
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (void)setBackgroundColorDark:(id)a3
{
}

- (BOOL)contentPrefetchEnabled
{
  return self->_contentPrefetchEnabled;
}

- (NSString)audioIndicatorColor
{
  return self->_audioIndicatorColor;
}

- (void)setAudioIndicatorColor:(id)a3
{
}

- (int64_t)widgetSystemReloadInterval
{
  return self->_widgetSystemReloadInterval;
}

- (int64_t)widgetSystemReloadJitterMax
{
  return self->_widgetSystemReloadJitterMax;
}

- (BOOL)widgetBackgroundInteractionEnabled
{
  return self->_widgetBackgroundInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAnalyticsConfigurationsData, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);

  objc_storeStrong((id *)&self->_audioIndicatorColor, 0);
}

@end