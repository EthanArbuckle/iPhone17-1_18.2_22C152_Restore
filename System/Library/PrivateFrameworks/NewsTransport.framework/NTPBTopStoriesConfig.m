@interface NTPBTopStoriesConfig
+ (Class)styleConfigsType;
- (BOOL)hasBadgesTimeout;
- (BOOL)hasChannelId;
- (BOOL)hasCutoffTime;
- (BOOL)hasMaximumArticleCount;
- (BOOL)hasPinningEnabled;
- (BOOL)hasPromotingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)pinningEnabled;
- (BOOL)promotingEnabled;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)styleConfigs;
- (NSString)channelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)styleConfigsAtIndex:(unint64_t)a3;
- (int64_t)badgesTimeout;
- (int64_t)cutoffTime;
- (int64_t)maximumArticleCount;
- (unint64_t)hash;
- (unint64_t)styleConfigsCount;
- (void)addStyleConfigs:(id)a3;
- (void)clearStyleConfigs;
- (void)mergeFrom:(id)a3;
- (void)setBadgesTimeout:(int64_t)a3;
- (void)setChannelId:(id)a3;
- (void)setCutoffTime:(int64_t)a3;
- (void)setHasBadgesTimeout:(BOOL)a3;
- (void)setHasCutoffTime:(BOOL)a3;
- (void)setHasMaximumArticleCount:(BOOL)a3;
- (void)setHasPinningEnabled:(BOOL)a3;
- (void)setHasPromotingEnabled:(BOOL)a3;
- (void)setMaximumArticleCount:(int64_t)a3;
- (void)setPinningEnabled:(BOOL)a3;
- (void)setPromotingEnabled:(BOOL)a3;
- (void)setStyleConfigs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTopStoriesConfig

- (void)setPinningEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_pinningEnabled = a3;
}

- (void)setHasPinningEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPinningEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPromotingEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_promotingEnabled = a3;
}

- (void)setHasPromotingEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPromotingEnabled
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (void)setMaximumArticleCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_maximumArticleCount = a3;
}

- (void)setHasMaximumArticleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaximumArticleCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCutoffTime:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cutoffTime = a3;
}

- (void)setHasCutoffTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCutoffTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearStyleConfigs
{
}

- (void)addStyleConfigs:(id)a3
{
  id v4 = a3;
  styleConfigs = self->_styleConfigs;
  id v8 = v4;
  if (!styleConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_styleConfigs;
    self->_styleConfigs = v6;

    id v4 = v8;
    styleConfigs = self->_styleConfigs;
  }
  [(NSMutableArray *)styleConfigs addObject:v4];
}

- (unint64_t)styleConfigsCount
{
  return [(NSMutableArray *)self->_styleConfigs count];
}

- (id)styleConfigsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_styleConfigs objectAtIndex:a3];
}

+ (Class)styleConfigsType
{
  return (Class)objc_opt_class();
}

- (void)setBadgesTimeout:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_badgesTimeout = a3;
}

- (void)setHasBadgesTimeout:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBadgesTimeout
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTopStoriesConfig;
  id v4 = [(NTPBTopStoriesConfig *)&v8 description];
  v5 = [(NTPBTopStoriesConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_pinningEnabled];
    [v3 setObject:v5 forKey:@"pinning_enabled"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_promotingEnabled];
    [v3 setObject:v6 forKey:@"promoting_enabled"];
  }
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  char v8 = (char)self->_has;
  if ((v8 & 4) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_maximumArticleCount];
    [v3 setObject:v9 forKey:@"maximum_article_count"];

    char v8 = (char)self->_has;
  }
  if ((v8 & 2) != 0)
  {
    v10 = [NSNumber numberWithLongLong:self->_cutoffTime];
    [v3 setObject:v10 forKey:@"cutoff_time"];
  }
  if ([(NSMutableArray *)self->_styleConfigs count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_styleConfigs, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v12 = self->_styleConfigs;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"style_configs"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v18 = [NSNumber numberWithLongLong:self->_badgesTimeout];
    [v3 setObject:v18 forKey:@"badges_timeout"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTopStoriesConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_channelId) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_styleConfigs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[48] = self->_pinningEnabled;
    v5[52] |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v5[49] = self->_promotingEnabled;
    v5[52] |= 0x10u;
  }
  uint64_t v8 = [(NSString *)self->_channelId copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v6 + 4);
  *((void *)v6 + 4) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *((void *)v6 + 3) = self->_maximumArticleCount;
    v6[52] |= 4u;
    char v10 = (char)self->_has;
  }
  if ((v10 & 2) != 0)
  {
    *((void *)v6 + 2) = self->_cutoffTime;
    v6[52] |= 2u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_styleConfigs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [v6 addStyleConfigs:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  if (*(unsigned char *)&self->_has)
  {
    *((void *)v6 + 1) = self->_badgesTimeout;
    v6[52] |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0) {
      goto LABEL_38;
    }
    if (self->_pinningEnabled)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0) {
      goto LABEL_38;
    }
    if (self->_promotingEnabled)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](channelId, "isEqual:")) {
      goto LABEL_38;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_maximumArticleCount != *((void *)v4 + 3)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_cutoffTime != *((void *)v4 + 2)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_38;
  }
  styleConfigs = self->_styleConfigs;
  if ((unint64_t)styleConfigs | *((void *)v4 + 5))
  {
    if (-[NSMutableArray isEqual:](styleConfigs, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_34;
    }
LABEL_38:
    BOOL v8 = 0;
    goto LABEL_39;
  }
LABEL_34:
  BOOL v8 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_badgesTimeout != *((void *)v4 + 1)) {
      goto LABEL_38;
    }
    BOOL v8 = 1;
  }
LABEL_39:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_pinningEnabled;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_promotingEnabled;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_channelId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_maximumArticleCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_cutoffTime;
      goto LABEL_11;
    }
  }
  uint64_t v7 = 0;
LABEL_11:
  uint64_t v8 = [(NSMutableArray *)self->_styleConfigs hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_badgesTimeout;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  char v6 = v4[52];
  if ((v6 & 8) != 0)
  {
    self->_pinningEnabled = v4[48];
    *(unsigned char *)&self->_has |= 8u;
    char v6 = v4[52];
  }
  if ((v6 & 0x10) != 0)
  {
    self->_promotingEnabled = v4[49];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 4)) {
    -[NTPBTopStoriesConfig setChannelId:](self, "setChannelId:");
  }
  char v7 = *((unsigned char *)v5 + 52);
  if ((v7 & 4) != 0)
  {
    self->_maximumArticleCount = *((void *)v5 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v5 + 52);
  }
  if ((v7 & 2) != 0)
  {
    self->_cutoffTime = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 5);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[NTPBTopStoriesConfig addStyleConfigs:](self, "addStyleConfigs:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if (*((unsigned char *)v5 + 52))
  {
    self->_badgesTimeout = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)pinningEnabled
{
  return self->_pinningEnabled;
}

- (BOOL)promotingEnabled
{
  return self->_promotingEnabled;
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (int64_t)maximumArticleCount
{
  return self->_maximumArticleCount;
}

- (int64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (NSMutableArray)styleConfigs
{
  return self->_styleConfigs;
}

- (void)setStyleConfigs:(id)a3
{
}

- (int64_t)badgesTimeout
{
  return self->_badgesTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleConfigs, 0);

  objc_storeStrong((id *)&self->_channelId, 0);
}

@end