@interface NTPBIssueReadingHistoryItem
- (BOOL)hasIdentifier;
- (BOOL)hasIssueID;
- (BOOL)hasLastBadgedPBDate;
- (BOOL)hasLastEngagedPBDate;
- (BOOL)hasLastRemovedFromMyMagazinesPBDate;
- (BOOL)hasLastSeenPBDate;
- (BOOL)hasLastVisitedArticleID;
- (BOOL)hasLastVisitedPBDate;
- (BOOL)hasLastVisitedPageID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (NSString)issueID;
- (NSString)lastVisitedArticleID;
- (NSString)lastVisitedPageID;
- (NTPBDate)lastBadgedPBDate;
- (NTPBDate)lastEngagedPBDate;
- (NTPBDate)lastRemovedFromMyMagazinesPBDate;
- (NTPBDate)lastSeenPBDate;
- (NTPBDate)lastVisitedPBDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIssueID:(id)a3;
- (void)setLastBadgedPBDate:(id)a3;
- (void)setLastEngagedPBDate:(id)a3;
- (void)setLastRemovedFromMyMagazinesPBDate:(id)a3;
- (void)setLastSeenPBDate:(id)a3;
- (void)setLastVisitedArticleID:(id)a3;
- (void)setLastVisitedPBDate:(id)a3;
- (void)setLastVisitedPageID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBIssueReadingHistoryItem

- (void)dealloc
{
  [(NTPBIssueReadingHistoryItem *)self setIdentifier:0];
  [(NTPBIssueReadingHistoryItem *)self setIssueID:0];
  [(NTPBIssueReadingHistoryItem *)self setLastVisitedPBDate:0];
  [(NTPBIssueReadingHistoryItem *)self setLastVisitedArticleID:0];
  [(NTPBIssueReadingHistoryItem *)self setLastVisitedPageID:0];
  [(NTPBIssueReadingHistoryItem *)self setLastBadgedPBDate:0];
  [(NTPBIssueReadingHistoryItem *)self setLastEngagedPBDate:0];
  [(NTPBIssueReadingHistoryItem *)self setLastRemovedFromMyMagazinesPBDate:0];
  [(NTPBIssueReadingHistoryItem *)self setLastSeenPBDate:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueReadingHistoryItem;
  [(NTPBIssueReadingHistoryItem *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasIssueID
{
  return self->_issueID != 0;
}

- (BOOL)hasLastVisitedPBDate
{
  return self->_lastVisitedPBDate != 0;
}

- (BOOL)hasLastVisitedArticleID
{
  return self->_lastVisitedArticleID != 0;
}

- (BOOL)hasLastVisitedPageID
{
  return self->_lastVisitedPageID != 0;
}

- (BOOL)hasLastBadgedPBDate
{
  return self->_lastBadgedPBDate != 0;
}

- (BOOL)hasLastEngagedPBDate
{
  return self->_lastEngagedPBDate != 0;
}

- (BOOL)hasLastRemovedFromMyMagazinesPBDate
{
  return self->_lastRemovedFromMyMagazinesPBDate != 0;
}

- (BOOL)hasLastSeenPBDate
{
  return self->_lastSeenPBDate != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueReadingHistoryItem;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBIssueReadingHistoryItem description](&v3, sel_description), -[NTPBIssueReadingHistoryItem dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  issueID = self->_issueID;
  if (issueID) {
    [v4 setObject:issueID forKey:@"issue_ID"];
  }
  lastVisitedPBDate = self->_lastVisitedPBDate;
  if (lastVisitedPBDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastVisitedPBDate, "dictionaryRepresentation"), @"last_visited_PB_date");
  }
  lastVisitedArticleID = self->_lastVisitedArticleID;
  if (lastVisitedArticleID) {
    [v4 setObject:lastVisitedArticleID forKey:@"last_visited_article_ID"];
  }
  lastVisitedPageID = self->_lastVisitedPageID;
  if (lastVisitedPageID) {
    [v4 setObject:lastVisitedPageID forKey:@"last_visited_page_ID"];
  }
  lastBadgedPBDate = self->_lastBadgedPBDate;
  if (lastBadgedPBDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastBadgedPBDate, "dictionaryRepresentation"), @"last_badged_PB_date");
  }
  lastEngagedPBDate = self->_lastEngagedPBDate;
  if (lastEngagedPBDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastEngagedPBDate, "dictionaryRepresentation"), @"last_engaged_PB_date");
  }
  lastRemovedFromMyMagazinesPBDate = self->_lastRemovedFromMyMagazinesPBDate;
  if (lastRemovedFromMyMagazinesPBDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastRemovedFromMyMagazinesPBDate, "dictionaryRepresentation"), @"last_removed_from_my_magazines_PB_date");
  }
  lastSeenPBDate = self->_lastSeenPBDate;
  if (lastSeenPBDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastSeenPBDate, "dictionaryRepresentation"), @"last_seen_PB_date");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueReadingHistoryItemReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_issueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastVisitedPBDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lastVisitedArticleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastVisitedPageID) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastBadgedPBDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lastEngagedPBDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lastRemovedFromMyMagazinesPBDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lastSeenPBDate)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)[(NSString *)self->_identifier copyWithZone:a3];
  v5[2] = (id)[(NSString *)self->_issueID copyWithZone:a3];

  v5[8] = [(NTPBDate *)self->_lastVisitedPBDate copyWithZone:a3];
  v5[7] = (id)[(NSString *)self->_lastVisitedArticleID copyWithZone:a3];

  v5[9] = (id)[(NSString *)self->_lastVisitedPageID copyWithZone:a3];
  v5[3] = [(NTPBDate *)self->_lastBadgedPBDate copyWithZone:a3];

  v5[4] = [(NTPBDate *)self->_lastEngagedPBDate copyWithZone:a3];
  v5[5] = [(NTPBDate *)self->_lastRemovedFromMyMagazinesPBDate copyWithZone:a3];

  v5[6] = [(NTPBDate *)self->_lastSeenPBDate copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((void *)a3 + 1))
      || (int v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      issueID = self->_issueID;
      if (!((unint64_t)issueID | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](issueID, "isEqual:")) != 0)
      {
        lastVisitedPBDate = self->_lastVisitedPBDate;
        if (!((unint64_t)lastVisitedPBDate | *((void *)a3 + 8))
          || (int v5 = -[NTPBDate isEqual:](lastVisitedPBDate, "isEqual:")) != 0)
        {
          lastVisitedArticleID = self->_lastVisitedArticleID;
          if (!((unint64_t)lastVisitedArticleID | *((void *)a3 + 7))
            || (int v5 = -[NSString isEqual:](lastVisitedArticleID, "isEqual:")) != 0)
          {
            lastVisitedPageID = self->_lastVisitedPageID;
            if (!((unint64_t)lastVisitedPageID | *((void *)a3 + 9))
              || (int v5 = -[NSString isEqual:](lastVisitedPageID, "isEqual:")) != 0)
            {
              lastBadgedPBDate = self->_lastBadgedPBDate;
              if (!((unint64_t)lastBadgedPBDate | *((void *)a3 + 3))
                || (int v5 = -[NTPBDate isEqual:](lastBadgedPBDate, "isEqual:")) != 0)
              {
                lastEngagedPBDate = self->_lastEngagedPBDate;
                if (!((unint64_t)lastEngagedPBDate | *((void *)a3 + 4))
                  || (int v5 = -[NTPBDate isEqual:](lastEngagedPBDate, "isEqual:")) != 0)
                {
                  lastRemovedFromMyMagazinesPBDate = self->_lastRemovedFromMyMagazinesPBDate;
                  if (!((unint64_t)lastRemovedFromMyMagazinesPBDate | *((void *)a3 + 5))
                    || (int v5 = -[NTPBDate isEqual:](lastRemovedFromMyMagazinesPBDate, "isEqual:")) != 0)
                  {
                    lastSeenPBDate = self->_lastSeenPBDate;
                    if ((unint64_t)lastSeenPBDate | *((void *)a3 + 6))
                    {
                      LOBYTE(v5) = -[NTPBDate isEqual:](lastSeenPBDate, "isEqual:");
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
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_issueID hash] ^ v3;
  unint64_t v5 = [(NTPBDate *)self->_lastVisitedPBDate hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_lastVisitedArticleID hash];
  NSUInteger v7 = [(NSString *)self->_lastVisitedPageID hash];
  unint64_t v8 = v7 ^ [(NTPBDate *)self->_lastBadgedPBDate hash];
  unint64_t v9 = v6 ^ v8 ^ [(NTPBDate *)self->_lastEngagedPBDate hash];
  unint64_t v10 = [(NTPBDate *)self->_lastRemovedFromMyMagazinesPBDate hash];
  return v9 ^ v10 ^ [(NTPBDate *)self->_lastSeenPBDate hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBIssueReadingHistoryItem setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBIssueReadingHistoryItem setIssueID:](self, "setIssueID:");
  }
  lastVisitedPBDate = self->_lastVisitedPBDate;
  uint64_t v6 = *((void *)a3 + 8);
  if (lastVisitedPBDate)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](lastVisitedPBDate, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBIssueReadingHistoryItem setLastVisitedPBDate:](self, "setLastVisitedPBDate:");
  }
  if (*((void *)a3 + 7)) {
    -[NTPBIssueReadingHistoryItem setLastVisitedArticleID:](self, "setLastVisitedArticleID:");
  }
  if (*((void *)a3 + 9)) {
    -[NTPBIssueReadingHistoryItem setLastVisitedPageID:](self, "setLastVisitedPageID:");
  }
  lastBadgedPBDate = self->_lastBadgedPBDate;
  uint64_t v8 = *((void *)a3 + 3);
  if (lastBadgedPBDate)
  {
    if (v8) {
      -[NTPBDate mergeFrom:](lastBadgedPBDate, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBIssueReadingHistoryItem setLastBadgedPBDate:](self, "setLastBadgedPBDate:");
  }
  lastEngagedPBDate = self->_lastEngagedPBDate;
  uint64_t v10 = *((void *)a3 + 4);
  if (lastEngagedPBDate)
  {
    if (v10) {
      -[NTPBDate mergeFrom:](lastEngagedPBDate, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[NTPBIssueReadingHistoryItem setLastEngagedPBDate:](self, "setLastEngagedPBDate:");
  }
  lastRemovedFromMyMagazinesPBDate = self->_lastRemovedFromMyMagazinesPBDate;
  uint64_t v12 = *((void *)a3 + 5);
  if (lastRemovedFromMyMagazinesPBDate)
  {
    if (v12) {
      -[NTPBDate mergeFrom:](lastRemovedFromMyMagazinesPBDate, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[NTPBIssueReadingHistoryItem setLastRemovedFromMyMagazinesPBDate:](self, "setLastRemovedFromMyMagazinesPBDate:");
  }
  lastSeenPBDate = self->_lastSeenPBDate;
  uint64_t v14 = *((void *)a3 + 6);
  if (lastSeenPBDate)
  {
    if (v14)
    {
      -[NTPBDate mergeFrom:](lastSeenPBDate, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[NTPBIssueReadingHistoryItem setLastSeenPBDate:](self, "setLastSeenPBDate:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)issueID
{
  return self->_issueID;
}

- (void)setIssueID:(id)a3
{
}

- (NTPBDate)lastVisitedPBDate
{
  return self->_lastVisitedPBDate;
}

- (void)setLastVisitedPBDate:(id)a3
{
}

- (NSString)lastVisitedArticleID
{
  return self->_lastVisitedArticleID;
}

- (void)setLastVisitedArticleID:(id)a3
{
}

- (NSString)lastVisitedPageID
{
  return self->_lastVisitedPageID;
}

- (void)setLastVisitedPageID:(id)a3
{
}

- (NTPBDate)lastBadgedPBDate
{
  return self->_lastBadgedPBDate;
}

- (void)setLastBadgedPBDate:(id)a3
{
}

- (NTPBDate)lastEngagedPBDate
{
  return self->_lastEngagedPBDate;
}

- (void)setLastEngagedPBDate:(id)a3
{
}

- (NTPBDate)lastRemovedFromMyMagazinesPBDate
{
  return self->_lastRemovedFromMyMagazinesPBDate;
}

- (void)setLastRemovedFromMyMagazinesPBDate:(id)a3
{
}

- (NTPBDate)lastSeenPBDate
{
  return self->_lastSeenPBDate;
}

- (void)setLastSeenPBDate:(id)a3
{
}

@end