@interface NTPBReadingHistoryItem
- (BOOL)hasArticleID;
- (BOOL)hasDeviceID;
- (BOOL)hasFirstSeenDate;
- (BOOL)hasFirstSeenDateOfMaxVersionSeen;
- (BOOL)hasFlags;
- (BOOL)hasLastListened;
- (BOOL)hasLastVisitedDate;
- (BOOL)hasListenedCount;
- (BOOL)hasListeningProgress;
- (BOOL)hasListeningProgressSavedDate;
- (BOOL)hasMaxVersionRead;
- (BOOL)hasMaxVersionSeen;
- (BOOL)hasReadCount;
- (BOOL)hasReadingPosition;
- (BOOL)hasReadingPositionSavedDate;
- (BOOL)hasSourceChannelTagID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleID;
- (NSString)deviceID;
- (NSString)readingPosition;
- (NSString)sourceChannelTagID;
- (NTPBDate)firstSeenDate;
- (NTPBDate)firstSeenDateOfMaxVersionSeen;
- (NTPBDate)lastListened;
- (NTPBDate)lastVisitedDate;
- (NTPBDate)listeningProgressSavedDate;
- (NTPBDate)readingPositionSavedDate;
- (double)listeningProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)listenedCount;
- (int64_t)maxVersionRead;
- (int64_t)maxVersionSeen;
- (int64_t)readCount;
- (unint64_t)hash;
- (unsigned)flags;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setFirstSeenDate:(id)a3;
- (void)setFirstSeenDateOfMaxVersionSeen:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasListenedCount:(BOOL)a3;
- (void)setHasListeningProgress:(BOOL)a3;
- (void)setHasMaxVersionRead:(BOOL)a3;
- (void)setHasMaxVersionSeen:(BOOL)a3;
- (void)setHasReadCount:(BOOL)a3;
- (void)setLastListened:(id)a3;
- (void)setLastVisitedDate:(id)a3;
- (void)setListenedCount:(int64_t)a3;
- (void)setListeningProgress:(double)a3;
- (void)setListeningProgressSavedDate:(id)a3;
- (void)setMaxVersionRead:(int64_t)a3;
- (void)setMaxVersionSeen:(int64_t)a3;
- (void)setReadCount:(int64_t)a3;
- (void)setReadingPosition:(id)a3;
- (void)setReadingPositionSavedDate:(id)a3;
- (void)setSourceChannelTagID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBReadingHistoryItem

- (void)dealloc
{
  [(NTPBReadingHistoryItem *)self setArticleID:0];
  [(NTPBReadingHistoryItem *)self setLastVisitedDate:0];
  [(NTPBReadingHistoryItem *)self setFirstSeenDate:0];
  [(NTPBReadingHistoryItem *)self setFirstSeenDateOfMaxVersionSeen:0];
  [(NTPBReadingHistoryItem *)self setSourceChannelTagID:0];
  [(NTPBReadingHistoryItem *)self setDeviceID:0];
  [(NTPBReadingHistoryItem *)self setLastListened:0];
  [(NTPBReadingHistoryItem *)self setReadingPosition:0];
  [(NTPBReadingHistoryItem *)self setListeningProgressSavedDate:0];
  [(NTPBReadingHistoryItem *)self setReadingPositionSavedDate:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBReadingHistoryItem;
  [(NTPBReadingHistoryItem *)&v3 dealloc];
}

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (BOOL)hasLastVisitedDate
{
  return self->_lastVisitedDate != 0;
}

- (void)setFlags:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFlags
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMaxVersionRead:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_maxVersionRead = a3;
}

- (void)setHasMaxVersionRead:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxVersionRead
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasFirstSeenDate
{
  return self->_firstSeenDate != 0;
}

- (BOOL)hasFirstSeenDateOfMaxVersionSeen
{
  return self->_firstSeenDateOfMaxVersionSeen != 0;
}

- (void)setMaxVersionSeen:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_maxVersionSeen = a3;
}

- (void)setHasMaxVersionSeen:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMaxVersionSeen
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasSourceChannelTagID
{
  return self->_sourceChannelTagID != 0;
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
}

- (void)setListeningProgress:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_listeningProgress = a3;
}

- (void)setHasListeningProgress:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasListeningProgress
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasLastListened
{
  return self->_lastListened != 0;
}

- (BOOL)hasReadingPosition
{
  return self->_readingPosition != 0;
}

- (void)setReadCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_readCount = a3;
}

- (void)setHasReadCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReadCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasListeningProgressSavedDate
{
  return self->_listeningProgressSavedDate != 0;
}

- (BOOL)hasReadingPositionSavedDate
{
  return self->_readingPositionSavedDate != 0;
}

- (void)setListenedCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_listenedCount = a3;
}

- (void)setHasListenedCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasListenedCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBReadingHistoryItem;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBReadingHistoryItem description](&v3, sel_description), -[NTPBReadingHistoryItem dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  articleID = self->_articleID;
  if (articleID) {
    [v3 setObject:articleID forKey:@"article_ID"];
  }
  lastVisitedDate = self->_lastVisitedDate;
  if (lastVisitedDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastVisitedDate, "dictionaryRepresentation"), @"last_visited_date");
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_flags), @"flags");
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_maxVersionRead), @"max_version_read");
  }
  firstSeenDate = self->_firstSeenDate;
  if (firstSeenDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](firstSeenDate, "dictionaryRepresentation"), @"first_seen_date");
  }
  firstSeenDateOfMaxVersionSeen = self->_firstSeenDateOfMaxVersionSeen;
  if (firstSeenDateOfMaxVersionSeen) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](firstSeenDateOfMaxVersionSeen, "dictionaryRepresentation"), @"first_seen_date_of_max_version_seen");
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_maxVersionSeen), @"max_version_seen");
  }
  sourceChannelTagID = self->_sourceChannelTagID;
  if (sourceChannelTagID) {
    [v4 setObject:sourceChannelTagID forKey:@"source_channel_tag_ID"];
  }
  deviceID = self->_deviceID;
  if (deviceID) {
    [v4 setObject:deviceID forKey:@"device_ID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_listeningProgress), @"listening_progress");
  }
  lastListened = self->_lastListened;
  if (lastListened) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastListened, "dictionaryRepresentation"), @"last_listened");
  }
  readingPosition = self->_readingPosition;
  if (readingPosition) {
    [v4 setObject:readingPosition forKey:@"reading_position"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_readCount), @"read_count");
  }
  listeningProgressSavedDate = self->_listeningProgressSavedDate;
  if (listeningProgressSavedDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](listeningProgressSavedDate, "dictionaryRepresentation"), @"listening_progress_saved_date");
  }
  readingPositionSavedDate = self->_readingPositionSavedDate;
  if (readingPositionSavedDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](readingPositionSavedDate, "dictionaryRepresentation"), @"reading_position_saved_date");
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_listenedCount), @"listened_count");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBReadingHistoryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_articleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastVisitedDate) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteFixed32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_firstSeenDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_firstSeenDateOfMaxVersionSeen) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_sourceChannelTagID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_lastListened) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_readingPosition) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_listeningProgressSavedDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_readingPositionSavedDate) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 48) = [(NSString *)self->_articleID copyWithZone:a3];
  *(void *)(v5 + 96) = [(NTPBDate *)self->_lastVisitedDate copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_flags;
    *(unsigned char *)(v5 + 136) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_maxVersionRead;
    *(unsigned char *)(v5 + 136) |= 4u;
  }

  *(void *)(v5 + 64) = [(NTPBDate *)self->_firstSeenDate copyWithZone:a3];
  *(void *)(v5 + 72) = [(NTPBDate *)self->_firstSeenDateOfMaxVersionSeen copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_maxVersionSeen;
    *(unsigned char *)(v5 + 136) |= 8u;
  }

  *(void *)(v5 + 128) = [(NSString *)self->_sourceChannelTagID copyWithZone:a3];
  *(void *)(v5 + 56) = [(NSString *)self->_deviceID copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_listeningProgress;
    *(unsigned char *)(v5 + 136) |= 2u;
  }

  *(void *)(v5 + 88) = [(NTPBDate *)self->_lastListened copyWithZone:a3];
  *(void *)(v5 + 112) = [(NSString *)self->_readingPosition copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_readCount;
    *(unsigned char *)(v5 + 136) |= 0x10u;
  }

  *(void *)(v5 + 104) = [(NTPBDate *)self->_listeningProgressSavedDate copyWithZone:a3];
  *(void *)(v5 + 120) = [(NTPBDate *)self->_readingPositionSavedDate copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_listenedCount;
    *(unsigned char *)(v5 + 136) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    articleID = self->_articleID;
    if (!((unint64_t)articleID | *((void *)a3 + 6)) || (int v5 = -[NSString isEqual:](articleID, "isEqual:")) != 0)
    {
      lastVisitedDate = self->_lastVisitedDate;
      if (!((unint64_t)lastVisitedDate | *((void *)a3 + 12))
        || (int v5 = -[NTPBDate isEqual:](lastVisitedDate, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 0x20) != 0)
        {
          if ((*((unsigned char *)a3 + 136) & 0x20) == 0 || self->_flags != *((_DWORD *)a3 + 20)) {
            goto LABEL_51;
          }
        }
        else if ((*((unsigned char *)a3 + 136) & 0x20) != 0)
        {
LABEL_51:
          LOBYTE(v5) = 0;
          return v5;
        }
        if ((*(unsigned char *)&self->_has & 4) != 0)
        {
          if ((*((unsigned char *)a3 + 136) & 4) == 0 || self->_maxVersionRead != *((void *)a3 + 3)) {
            goto LABEL_51;
          }
        }
        else if ((*((unsigned char *)a3 + 136) & 4) != 0)
        {
          goto LABEL_51;
        }
        firstSeenDate = self->_firstSeenDate;
        if (!((unint64_t)firstSeenDate | *((void *)a3 + 8))
          || (int v5 = -[NTPBDate isEqual:](firstSeenDate, "isEqual:")) != 0)
        {
          firstSeenDateOfMaxVersionSeen = self->_firstSeenDateOfMaxVersionSeen;
          if (!((unint64_t)firstSeenDateOfMaxVersionSeen | *((void *)a3 + 9))
            || (int v5 = -[NTPBDate isEqual:](firstSeenDateOfMaxVersionSeen, "isEqual:")) != 0)
          {
            if ((*(unsigned char *)&self->_has & 8) != 0)
            {
              if ((*((unsigned char *)a3 + 136) & 8) == 0 || self->_maxVersionSeen != *((void *)a3 + 4)) {
                goto LABEL_51;
              }
            }
            else if ((*((unsigned char *)a3 + 136) & 8) != 0)
            {
              goto LABEL_51;
            }
            sourceChannelTagID = self->_sourceChannelTagID;
            if (!((unint64_t)sourceChannelTagID | *((void *)a3 + 16))
              || (int v5 = -[NSString isEqual:](sourceChannelTagID, "isEqual:")) != 0)
            {
              deviceID = self->_deviceID;
              if (!((unint64_t)deviceID | *((void *)a3 + 7))
                || (int v5 = -[NSString isEqual:](deviceID, "isEqual:")) != 0)
              {
                if ((*(unsigned char *)&self->_has & 2) != 0)
                {
                  if ((*((unsigned char *)a3 + 136) & 2) == 0 || self->_listeningProgress != *((double *)a3 + 2)) {
                    goto LABEL_51;
                  }
                }
                else if ((*((unsigned char *)a3 + 136) & 2) != 0)
                {
                  goto LABEL_51;
                }
                lastListened = self->_lastListened;
                if (!((unint64_t)lastListened | *((void *)a3 + 11))
                  || (int v5 = -[NTPBDate isEqual:](lastListened, "isEqual:")) != 0)
                {
                  readingPosition = self->_readingPosition;
                  if (!((unint64_t)readingPosition | *((void *)a3 + 14))
                    || (int v5 = -[NSString isEqual:](readingPosition, "isEqual:")) != 0)
                  {
                    if ((*(unsigned char *)&self->_has & 0x10) != 0)
                    {
                      if ((*((unsigned char *)a3 + 136) & 0x10) == 0 || self->_readCount != *((void *)a3 + 5)) {
                        goto LABEL_51;
                      }
                    }
                    else if ((*((unsigned char *)a3 + 136) & 0x10) != 0)
                    {
                      goto LABEL_51;
                    }
                    listeningProgressSavedDate = self->_listeningProgressSavedDate;
                    if (!((unint64_t)listeningProgressSavedDate | *((void *)a3 + 13))
                      || (int v5 = -[NTPBDate isEqual:](listeningProgressSavedDate, "isEqual:")) != 0)
                    {
                      readingPositionSavedDate = self->_readingPositionSavedDate;
                      if (!((unint64_t)readingPositionSavedDate | *((void *)a3 + 15))
                        || (int v5 = -[NTPBDate isEqual:](readingPositionSavedDate, "isEqual:")) != 0)
                      {
                        LOBYTE(v5) = (*((unsigned char *)a3 + 136) & 1) == 0;
                        if (*(unsigned char *)&self->_has)
                        {
                          if ((*((unsigned char *)a3 + 136) & 1) == 0 || self->_listenedCount != *((void *)a3 + 1)) {
                            goto LABEL_51;
                          }
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
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v23 = [(NSString *)self->_articleID hash];
  unint64_t v22 = [(NTPBDate *)self->_lastVisitedDate hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v21 = 2654435761 * self->_flags;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_maxVersionRead;
      goto LABEL_6;
    }
  }
  uint64_t v20 = 0;
LABEL_6:
  unint64_t v19 = [(NTPBDate *)self->_firstSeenDate hash];
  unint64_t v18 = [(NTPBDate *)self->_firstSeenDateOfMaxVersionSeen hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v17 = 2654435761 * self->_maxVersionSeen;
  }
  else {
    uint64_t v17 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_sourceChannelTagID hash];
  NSUInteger v4 = [(NSString *)self->_deviceID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double listeningProgress = self->_listeningProgress;
    double v7 = -listeningProgress;
    if (listeningProgress >= 0.0) {
      double v7 = self->_listeningProgress;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  unint64_t v10 = [(NTPBDate *)self->_lastListened hash];
  NSUInteger v11 = [(NSString *)self->_readingPosition hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v12 = 2654435761 * self->_readCount;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = [(NTPBDate *)self->_listeningProgressSavedDate hash];
  unint64_t v14 = [(NTPBDate *)self->_readingPositionSavedDate hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v15 = 2654435761 * self->_listenedCount;
  }
  else {
    uint64_t v15 = 0;
  }
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 6)) {
    -[NTPBReadingHistoryItem setArticleID:](self, "setArticleID:");
  }
  lastVisitedDate = self->_lastVisitedDate;
  uint64_t v6 = *((void *)a3 + 12);
  if (lastVisitedDate)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](lastVisitedDate, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBReadingHistoryItem setLastVisitedDate:](self, "setLastVisitedDate:");
  }
  char v7 = *((unsigned char *)a3 + 136);
  if ((v7 & 0x20) != 0)
  {
    self->_flags = *((_DWORD *)a3 + 20);
    *(unsigned char *)&self->_has |= 0x20u;
    char v7 = *((unsigned char *)a3 + 136);
  }
  if ((v7 & 4) != 0)
  {
    self->_maxVersionRead = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  firstSeenDate = self->_firstSeenDate;
  uint64_t v9 = *((void *)a3 + 8);
  if (firstSeenDate)
  {
    if (v9) {
      -[NTPBDate mergeFrom:](firstSeenDate, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[NTPBReadingHistoryItem setFirstSeenDate:](self, "setFirstSeenDate:");
  }
  firstSeenDateOfMaxVersionSeen = self->_firstSeenDateOfMaxVersionSeen;
  uint64_t v11 = *((void *)a3 + 9);
  if (firstSeenDateOfMaxVersionSeen)
  {
    if (v11) {
      -[NTPBDate mergeFrom:](firstSeenDateOfMaxVersionSeen, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[NTPBReadingHistoryItem setFirstSeenDateOfMaxVersionSeen:](self, "setFirstSeenDateOfMaxVersionSeen:");
  }
  if ((*((unsigned char *)a3 + 136) & 8) != 0)
  {
    self->_maxVersionSeen = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 16)) {
    -[NTPBReadingHistoryItem setSourceChannelTagID:](self, "setSourceChannelTagID:");
  }
  if (*((void *)a3 + 7)) {
    -[NTPBReadingHistoryItem setDeviceID:](self, "setDeviceID:");
  }
  if ((*((unsigned char *)a3 + 136) & 2) != 0)
  {
    self->_double listeningProgress = *((double *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  lastListened = self->_lastListened;
  uint64_t v13 = *((void *)a3 + 11);
  if (lastListened)
  {
    if (v13) {
      -[NTPBDate mergeFrom:](lastListened, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[NTPBReadingHistoryItem setLastListened:](self, "setLastListened:");
  }
  if (*((void *)a3 + 14)) {
    -[NTPBReadingHistoryItem setReadingPosition:](self, "setReadingPosition:");
  }
  if ((*((unsigned char *)a3 + 136) & 0x10) != 0)
  {
    self->_readCount = *((void *)a3 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  listeningProgressSavedDate = self->_listeningProgressSavedDate;
  uint64_t v15 = *((void *)a3 + 13);
  if (listeningProgressSavedDate)
  {
    if (v15) {
      -[NTPBDate mergeFrom:](listeningProgressSavedDate, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[NTPBReadingHistoryItem setListeningProgressSavedDate:](self, "setListeningProgressSavedDate:");
  }
  readingPositionSavedDate = self->_readingPositionSavedDate;
  uint64_t v17 = *((void *)a3 + 15);
  if (readingPositionSavedDate)
  {
    if (v17) {
      -[NTPBDate mergeFrom:](readingPositionSavedDate, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[NTPBReadingHistoryItem setReadingPositionSavedDate:](self, "setReadingPositionSavedDate:");
  }
  if (*((unsigned char *)a3 + 136))
  {
    self->_listenedCount = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (NTPBDate)lastVisitedDate
{
  return self->_lastVisitedDate;
}

- (void)setLastVisitedDate:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (int64_t)maxVersionRead
{
  return self->_maxVersionRead;
}

- (NTPBDate)firstSeenDate
{
  return self->_firstSeenDate;
}

- (void)setFirstSeenDate:(id)a3
{
}

- (NTPBDate)firstSeenDateOfMaxVersionSeen
{
  return self->_firstSeenDateOfMaxVersionSeen;
}

- (void)setFirstSeenDateOfMaxVersionSeen:(id)a3
{
}

- (int64_t)maxVersionSeen
{
  return self->_maxVersionSeen;
}

- (NSString)sourceChannelTagID
{
  return self->_sourceChannelTagID;
}

- (void)setSourceChannelTagID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (double)listeningProgress
{
  return self->_listeningProgress;
}

- (NTPBDate)lastListened
{
  return self->_lastListened;
}

- (void)setLastListened:(id)a3
{
}

- (NSString)readingPosition
{
  return self->_readingPosition;
}

- (void)setReadingPosition:(id)a3
{
}

- (int64_t)readCount
{
  return self->_readCount;
}

- (NTPBDate)listeningProgressSavedDate
{
  return self->_listeningProgressSavedDate;
}

- (void)setListeningProgressSavedDate:(id)a3
{
}

- (NTPBDate)readingPositionSavedDate
{
  return self->_readingPositionSavedDate;
}

- (void)setReadingPositionSavedDate:(id)a3
{
}

- (int64_t)listenedCount
{
  return self->_listenedCount;
}

@end