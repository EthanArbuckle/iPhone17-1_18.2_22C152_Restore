@interface NTPBHeadlineAnalyticsElement
- (BOOL)hasArticleID;
- (BOOL)hasArticleVersion;
- (BOOL)hasChannelID;
- (BOOL)hasNeedsSeenStateTracking;
- (BOOL)hasPreseenCountTrackingIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsSeenStateTracking;
- (BOOL)readFrom:(id)a3;
- (NSString)articleID;
- (NSString)channelID;
- (NSString)preseenCountTrackingIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)articleVersion;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setArticleVersion:(int64_t)a3;
- (void)setChannelID:(id)a3;
- (void)setHasArticleVersion:(BOOL)a3;
- (void)setHasNeedsSeenStateTracking:(BOOL)a3;
- (void)setNeedsSeenStateTracking:(BOOL)a3;
- (void)setPreseenCountTrackingIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBHeadlineAnalyticsElement

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (void)setArticleVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_articleVersion = a3;
}

- (void)setHasArticleVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNeedsSeenStateTracking:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_needsSeenStateTracking = a3;
}

- (void)setHasNeedsSeenStateTracking:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNeedsSeenStateTracking
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasChannelID
{
  return self->_channelID != 0;
}

- (BOOL)hasPreseenCountTrackingIdentifier
{
  return self->_preseenCountTrackingIdentifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBHeadlineAnalyticsElement;
  v4 = [(NTPBHeadlineAnalyticsElement *)&v8 description];
  v5 = [(NTPBHeadlineAnalyticsElement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  articleID = self->_articleID;
  if (articleID) {
    [v3 setObject:articleID forKey:@"article_ID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_articleVersion];
    [v4 setObject:v7 forKey:@"article_version"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_needsSeenStateTracking];
    [v4 setObject:v8 forKey:@"needs_seen_state_tracking"];
  }
  channelID = self->_channelID;
  if (channelID) {
    [v4 setObject:channelID forKey:@"channel_ID"];
  }
  preseenCountTrackingIdentifier = self->_preseenCountTrackingIdentifier;
  if (preseenCountTrackingIdentifier) {
    [v4 setObject:preseenCountTrackingIdentifier forKey:@"preseen_count_tracking_identifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBHeadlineAnalyticsElementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_articleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_channelID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_preseenCountTrackingIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleID copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_articleVersion;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_needsSeenStateTracking;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_channelID copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_preseenCountTrackingIdentifier copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  articleID = self->_articleID;
  if ((unint64_t)articleID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_articleVersion != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_needsSeenStateTracking)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_21;
        }
        goto LABEL_17;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_17;
      }
    }
LABEL_21:
    char v8 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_21;
  }
LABEL_17:
  channelID = self->_channelID;
  if ((unint64_t)channelID | *((void *)v4 + 3) && !-[NSString isEqual:](channelID, "isEqual:")) {
    goto LABEL_21;
  }
  preseenCountTrackingIdentifier = self->_preseenCountTrackingIdentifier;
  if ((unint64_t)preseenCountTrackingIdentifier | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](preseenCountTrackingIdentifier, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_articleID hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_articleVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_needsSeenStateTracking;
LABEL_6:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_channelID hash];
  return v6 ^ [(NSString *)self->_preseenCountTrackingIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[NTPBHeadlineAnalyticsElement setArticleID:](self, "setArticleID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_articleVersion = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_needsSeenStateTracking = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBHeadlineAnalyticsElement setChannelID:](self, "setChannelID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBHeadlineAnalyticsElement setPreseenCountTrackingIdentifier:](self, "setPreseenCountTrackingIdentifier:");
    id v4 = v6;
  }
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (int64_t)articleVersion
{
  return self->_articleVersion;
}

- (BOOL)needsSeenStateTracking
{
  return self->_needsSeenStateTracking;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
}

- (NSString)preseenCountTrackingIdentifier
{
  return self->_preseenCountTrackingIdentifier;
}

- (void)setPreseenCountTrackingIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preseenCountTrackingIdentifier, 0);
  objc_storeStrong((id *)&self->_channelID, 0);

  objc_storeStrong((id *)&self->_articleID, 0);
}

@end