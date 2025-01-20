@interface NTPBTodayConfig
+ (Class)todayQueueConfigsType;
- (BOOL)hasAudioIndicatorColor;
- (BOOL)hasBackgroundColorDark;
- (BOOL)hasBackgroundColorLight;
- (BOOL)hasWidgetBannerConfig;
- (BOOL)hasWidgetIdentifier;
- (BOOL)hasWidgetSystemReloadInterval;
- (BOOL)hasWidgetSystemReloadJitterMax;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)todayQueueConfigs;
- (NSString)audioIndicatorColor;
- (NSString)backgroundColorDark;
- (NSString)backgroundColorLight;
- (NSString)widgetIdentifier;
- (NTPBTodayBannerConfig)widgetBannerConfig;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)todayQueueConfigsAtIndex:(unint64_t)a3;
- (int64_t)widgetSystemReloadInterval;
- (int64_t)widgetSystemReloadJitterMax;
- (unint64_t)hash;
- (unint64_t)todayQueueConfigsCount;
- (void)addTodayQueueConfigs:(id)a3;
- (void)clearTodayQueueConfigs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAudioIndicatorColor:(id)a3;
- (void)setBackgroundColorDark:(id)a3;
- (void)setBackgroundColorLight:(id)a3;
- (void)setHasWidgetSystemReloadInterval:(BOOL)a3;
- (void)setHasWidgetSystemReloadJitterMax:(BOOL)a3;
- (void)setTodayQueueConfigs:(id)a3;
- (void)setWidgetBannerConfig:(id)a3;
- (void)setWidgetIdentifier:(id)a3;
- (void)setWidgetSystemReloadInterval:(int64_t)a3;
- (void)setWidgetSystemReloadJitterMax:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayConfig

- (void)dealloc
{
  [(NTPBTodayConfig *)self setTodayQueueConfigs:0];
  [(NTPBTodayConfig *)self setBackgroundColorLight:0];
  [(NTPBTodayConfig *)self setBackgroundColorDark:0];
  [(NTPBTodayConfig *)self setWidgetIdentifier:0];
  [(NTPBTodayConfig *)self setAudioIndicatorColor:0];
  [(NTPBTodayConfig *)self setWidgetBannerConfig:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayConfig;
  [(NTPBTodayConfig *)&v3 dealloc];
}

- (void)clearTodayQueueConfigs
{
}

- (void)addTodayQueueConfigs:(id)a3
{
  todayQueueConfigs = self->_todayQueueConfigs;
  if (!todayQueueConfigs)
  {
    todayQueueConfigs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_todayQueueConfigs = todayQueueConfigs;
  }

  [(NSMutableArray *)todayQueueConfigs addObject:a3];
}

- (unint64_t)todayQueueConfigsCount
{
  return [(NSMutableArray *)self->_todayQueueConfigs count];
}

- (id)todayQueueConfigsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_todayQueueConfigs objectAtIndex:a3];
}

+ (Class)todayQueueConfigsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBackgroundColorLight
{
  return self->_backgroundColorLight != 0;
}

- (BOOL)hasBackgroundColorDark
{
  return self->_backgroundColorDark != 0;
}

- (BOOL)hasWidgetIdentifier
{
  return self->_widgetIdentifier != 0;
}

- (BOOL)hasAudioIndicatorColor
{
  return self->_audioIndicatorColor != 0;
}

- (void)setWidgetSystemReloadInterval:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_widgetSystemReloadInterval = a3;
}

- (void)setHasWidgetSystemReloadInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWidgetSystemReloadInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWidgetSystemReloadJitterMax:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_widgetSystemReloadJitterMax = a3;
}

- (void)setHasWidgetSystemReloadJitterMax:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetSystemReloadJitterMax
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasWidgetBannerConfig
{
  return self->_widgetBannerConfig != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTodayConfig description](&v3, sel_description), -[NTPBTodayConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_todayQueueConfigs count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_todayQueueConfigs, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    todayQueueConfigs = self->_todayQueueConfigs;
    uint64_t v6 = [(NSMutableArray *)todayQueueConfigs countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(todayQueueConfigs);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)todayQueueConfigs countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"today_queue_configs"];
  }
  backgroundColorLight = self->_backgroundColorLight;
  if (backgroundColorLight) {
    [v3 setObject:backgroundColorLight forKey:@"background_color_light"];
  }
  backgroundColorDark = self->_backgroundColorDark;
  if (backgroundColorDark) {
    [v3 setObject:backgroundColorDark forKey:@"background_color_dark"];
  }
  widgetIdentifier = self->_widgetIdentifier;
  if (widgetIdentifier) {
    [v3 setObject:widgetIdentifier forKey:@"widget_identifier"];
  }
  audioIndicatorColor = self->_audioIndicatorColor;
  if (audioIndicatorColor) {
    [v3 setObject:audioIndicatorColor forKey:@"audio_indicator_color"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_widgetSystemReloadInterval), @"widget_system_reload_interval");
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_widgetSystemReloadJitterMax), @"widget_system_reload_jitter_max");
  }
  widgetBannerConfig = self->_widgetBannerConfig;
  if (widgetBannerConfig) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBTodayBannerConfig dictionaryRepresentation](widgetBannerConfig, "dictionaryRepresentation"), @"widget_banner_config");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayConfigReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  todayQueueConfigs = self->_todayQueueConfigs;
  uint64_t v5 = [(NSMutableArray *)todayQueueConfigs countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(todayQueueConfigs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)todayQueueConfigs countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  if (self->_backgroundColorLight) {
    PBDataWriterWriteStringField();
  }
  if (self->_backgroundColorDark) {
    PBDataWriterWriteStringField();
  }
  if (self->_widgetIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_audioIndicatorColor) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_widgetBannerConfig) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  todayQueueConfigs = self->_todayQueueConfigs;
  uint64_t v7 = [(NSMutableArray *)todayQueueConfigs countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(todayQueueConfigs);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTodayQueueConfigs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)todayQueueConfigs countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  *(void *)(v5 + 40) = [(NSString *)self->_backgroundColorLight copyWithZone:a3];
  *(void *)(v5 + 32) = [(NSString *)self->_backgroundColorDark copyWithZone:a3];

  *(void *)(v5 + 64) = [(NSString *)self->_widgetIdentifier copyWithZone:a3];
  *(void *)(v5 + 24) = [(NSString *)self->_audioIndicatorColor copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_widgetSystemReloadInterval;
    *(unsigned char *)(v5 + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_widgetSystemReloadJitterMax;
    *(unsigned char *)(v5 + 72) |= 2u;
  }

  *(void *)(v5 + 56) = [(NTPBTodayBannerConfig *)self->_widgetBannerConfig copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    todayQueueConfigs = self->_todayQueueConfigs;
    if (!((unint64_t)todayQueueConfigs | *((void *)a3 + 6))
      || (int v5 = -[NSMutableArray isEqual:](todayQueueConfigs, "isEqual:")) != 0)
    {
      backgroundColorLight = self->_backgroundColorLight;
      if (!((unint64_t)backgroundColorLight | *((void *)a3 + 5))
        || (int v5 = -[NSString isEqual:](backgroundColorLight, "isEqual:")) != 0)
      {
        backgroundColorDark = self->_backgroundColorDark;
        if (!((unint64_t)backgroundColorDark | *((void *)a3 + 4))
          || (int v5 = -[NSString isEqual:](backgroundColorDark, "isEqual:")) != 0)
        {
          widgetIdentifier = self->_widgetIdentifier;
          if (!((unint64_t)widgetIdentifier | *((void *)a3 + 8))
            || (int v5 = -[NSString isEqual:](widgetIdentifier, "isEqual:")) != 0)
          {
            audioIndicatorColor = self->_audioIndicatorColor;
            if (!((unint64_t)audioIndicatorColor | *((void *)a3 + 3))
              || (int v5 = -[NSString isEqual:](audioIndicatorColor, "isEqual:")) != 0)
            {
              if (*(unsigned char *)&self->_has)
              {
                if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_widgetSystemReloadInterval != *((void *)a3 + 1)) {
                  goto LABEL_24;
                }
              }
              else if (*((unsigned char *)a3 + 72))
              {
LABEL_24:
                LOBYTE(v5) = 0;
                return v5;
              }
              if ((*(unsigned char *)&self->_has & 2) != 0)
              {
                if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_widgetSystemReloadJitterMax != *((void *)a3 + 2)) {
                  goto LABEL_24;
                }
              }
              else if ((*((unsigned char *)a3 + 72) & 2) != 0)
              {
                goto LABEL_24;
              }
              widgetBannerConfig = self->_widgetBannerConfig;
              if ((unint64_t)widgetBannerConfig | *((void *)a3 + 7))
              {
                LOBYTE(v5) = -[NTPBTodayBannerConfig isEqual:](widgetBannerConfig, "isEqual:");
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
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_todayQueueConfigs hash];
  NSUInteger v4 = [(NSString *)self->_backgroundColorLight hash];
  NSUInteger v5 = [(NSString *)self->_backgroundColorDark hash];
  NSUInteger v6 = [(NSString *)self->_widgetIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_audioIndicatorColor hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_widgetSystemReloadInterval;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NTPBTodayBannerConfig *)self->_widgetBannerConfig hash];
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_widgetSystemReloadJitterMax;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NTPBTodayBannerConfig *)self->_widgetBannerConfig hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  NSUInteger v5 = (void *)*((void *)a3 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBTodayConfig *)self addTodayQueueConfigs:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  if (*((void *)a3 + 5)) {
    -[NTPBTodayConfig setBackgroundColorLight:](self, "setBackgroundColorLight:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBTodayConfig setBackgroundColorDark:](self, "setBackgroundColorDark:");
  }
  if (*((void *)a3 + 8)) {
    -[NTPBTodayConfig setWidgetIdentifier:](self, "setWidgetIdentifier:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBTodayConfig setAudioIndicatorColor:](self, "setAudioIndicatorColor:");
  }
  char v10 = *((unsigned char *)a3 + 72);
  if (v10)
  {
    self->_widgetSystemReloadInterval = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v10 = *((unsigned char *)a3 + 72);
  }
  if ((v10 & 2) != 0)
  {
    self->_widgetSystemReloadJitterMax = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  widgetBannerConfig = self->_widgetBannerConfig;
  uint64_t v12 = *((void *)a3 + 7);
  if (widgetBannerConfig)
  {
    if (v12) {
      -[NTPBTodayBannerConfig mergeFrom:](widgetBannerConfig, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[NTPBTodayConfig setWidgetBannerConfig:](self, "setWidgetBannerConfig:");
  }
}

- (NSMutableArray)todayQueueConfigs
{
  return self->_todayQueueConfigs;
}

- (void)setTodayQueueConfigs:(id)a3
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

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
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

- (NTPBTodayBannerConfig)widgetBannerConfig
{
  return self->_widgetBannerConfig;
}

- (void)setWidgetBannerConfig:(id)a3
{
}

@end