@interface NTPBTagTodaySectionSpecificConfig
- (BOOL)hasCutoffTime;
- (BOOL)hasFetchingBin;
- (BOOL)hasHeadlinesPerFeedFetchCount;
- (BOOL)hasMinimumUpdateInterval;
- (BOOL)hasTagID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tagID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)fetchingBin;
- (unint64_t)cutoffTime;
- (unint64_t)hash;
- (unint64_t)headlinesPerFeedFetchCount;
- (unint64_t)minimumUpdateInterval;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCutoffTime:(unint64_t)a3;
- (void)setFetchingBin:(int)a3;
- (void)setHasCutoffTime:(BOOL)a3;
- (void)setHasFetchingBin:(BOOL)a3;
- (void)setHasHeadlinesPerFeedFetchCount:(BOOL)a3;
- (void)setHasMinimumUpdateInterval:(BOOL)a3;
- (void)setHeadlinesPerFeedFetchCount:(unint64_t)a3;
- (void)setMinimumUpdateInterval:(unint64_t)a3;
- (void)setTagID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTagTodaySectionSpecificConfig

- (void)dealloc
{
  [(NTPBTagTodaySectionSpecificConfig *)self setTagID:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTagTodaySectionSpecificConfig;
  [(NTPBTagTodaySectionSpecificConfig *)&v3 dealloc];
}

- (void)setCutoffTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cutoffTime = a3;
}

- (void)setHasCutoffTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCutoffTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHeadlinesPerFeedFetchCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_headlinesPerFeedFetchCount = a3;
}

- (void)setHasHeadlinesPerFeedFetchCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHeadlinesPerFeedFetchCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)fetchingBin
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_fetchingBin;
  }
  else {
    return 0;
  }
}

- (void)setFetchingBin:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_fetchingBin = a3;
}

- (void)setHasFetchingBin:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFetchingBin
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasTagID
{
  return self->_tagID != 0;
}

- (void)setMinimumUpdateInterval:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minimumUpdateInterval = a3;
}

- (void)setHasMinimumUpdateInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinimumUpdateInterval
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTagTodaySectionSpecificConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTagTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBTagTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_cutoffTime), @"cutoff_time");
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_headlinesPerFeedFetchCount), @"headlines_per_feed_fetch_count");
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_4:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_fetchingBin), @"fetching_bin");
LABEL_5:
  tagID = self->_tagID;
  if (tagID) {
    [v3 setObject:tagID forKey:@"tag_ID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_minimumUpdateInterval), @"minimum_update_interval");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTagTodaySectionSpecificConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_tagID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_cutoffTime;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_headlinesPerFeedFetchCount;
  *(unsigned char *)(v5 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_fetchingBin;
    *(unsigned char *)(v5 + 48) |= 8u;
  }
LABEL_5:

  *(void *)(v6 + 40) = [(NSString *)self->_tagID copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_minimumUpdateInterval;
    *(unsigned char *)(v6 + 48) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_cutoffTime != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_headlinesPerFeedFetchCount != *((void *)a3 + 2)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
      goto LABEL_24;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_fetchingBin != *((_DWORD *)a3 + 8)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_24;
    }
    tagID = self->_tagID;
    if ((unint64_t)tagID | *((void *)a3 + 5))
    {
      int v5 = -[NSString isEqual:](tagID, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_minimumUpdateInterval != *((void *)a3 + 3)) {
        goto LABEL_24;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v3 = 2654435761u * self->_cutoffTime;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_headlinesPerFeedFetchCount;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_fetchingBin;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_tagID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v7 = 2654435761u * self->_minimumUpdateInterval;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 48);
  if (v5)
  {
    self->_cutoffTime = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_headlinesPerFeedFetchCount = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 48) & 8) != 0)
  {
LABEL_4:
    self->_fetchingBin = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_5:
  if (*((void *)a3 + 5)) {
    -[NTPBTagTodaySectionSpecificConfig setTagID:](self, "setTagID:");
  }
  if ((*((unsigned char *)a3 + 48) & 4) != 0)
  {
    self->_minimumUpdateInterval = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (unint64_t)headlinesPerFeedFetchCount
{
  return self->_headlinesPerFeedFetchCount;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
}

- (unint64_t)minimumUpdateInterval
{
  return self->_minimumUpdateInterval;
}

@end