@interface NTPBTocCellExposure
- (BOOL)hasDisplayRank;
- (BOOL)hasFeedCellExposure;
- (BOOL)hasIsBadged;
- (BOOL)hasRankInSection;
- (BOOL)hasTocCellExposureArticleElement;
- (BOOL)hasTocCellExposureId;
- (BOOL)hasTocCellSection;
- (BOOL)hasType;
- (BOOL)isBadged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)tocCellExposureId;
- (NTPBFeedCellExposure)feedCellExposure;
- (NTPBTocCellExposureArticleElement)tocCellExposureArticleElement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tocCellSectionAsString:(int)a3;
- (int)StringAsTocCellSection:(id)a3;
- (int)displayRank;
- (int)rankInSection;
- (int)tocCellSection;
- (int)type;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDisplayRank:(int)a3;
- (void)setFeedCellExposure:(id)a3;
- (void)setHasDisplayRank:(BOOL)a3;
- (void)setHasIsBadged:(BOOL)a3;
- (void)setHasRankInSection:(BOOL)a3;
- (void)setHasTocCellSection:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsBadged:(BOOL)a3;
- (void)setRankInSection:(int)a3;
- (void)setTocCellExposureArticleElement:(id)a3;
- (void)setTocCellExposureId:(id)a3;
- (void)setTocCellSection:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTocCellExposure

- (int)type
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasTocCellExposureId
{
  return self->_tocCellExposureId != 0;
}

- (void)setIsBadged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isBadged = a3;
}

- (void)setHasIsBadged:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsBadged
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDisplayRank:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_displayRank = a3;
}

- (void)setHasDisplayRank:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayRank
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRankInSection:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rankInSection = a3;
}

- (void)setHasRankInSection:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRankInSection
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)tocCellSection
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_tocCellSection;
  }
  else {
    return 0;
  }
}

- (void)setTocCellSection:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tocCellSection = a3;
}

- (void)setHasTocCellSection:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTocCellSection
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)tocCellSectionAsString:(int)a3
{
  if (a3 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264449E10[a3];
  }

  return v3;
}

- (int)StringAsTocCellSection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TOC_CELL_SECTION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_CHANNELS_TOC_CELL_SECTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_TOPICS_TOC_CELL_SECTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEATURED_CHANNELS_TOC_CELL_SECTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEATURED_TOPICS_TOC_CELL_SECTION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUGGESTIONS_TOC_CELL_SECTION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CHANNELS_TOC_CELL_SECTION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TOPICS_TOC_CELL_SECTION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"NOTIFICATIONS_MORE_CHANNELS_TOC_CELL_SECTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PAID_SUBSCRIPTIONS_TOC_CELL_SECTION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FOLLOWING_TOC_CELL_SECTION"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BROWSE_TOC_CELL_SECTION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"DISLIKED_CHANNELS_TOC_CELL_SECTION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTED_TOC_CELL_SECTION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SAVED_AND_HISTORY_TOC_CELL_SECTION"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MANAGE_SUBSCRIPTIONS_TOC_CELL_SECTION"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasFeedCellExposure
{
  return self->_feedCellExposure != 0;
}

- (BOOL)hasTocCellExposureArticleElement
{
  return self->_tocCellExposureArticleElement != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTocCellExposure;
  int v4 = [(NTPBTocCellExposure *)&v8 description];
  v5 = [(NTPBTocCellExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  tocCellExposureId = self->_tocCellExposureId;
  if (tocCellExposureId) {
    [v3 setObject:tocCellExposureId forKey:@"toc_cell_exposure_id"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_isBadged];
    [v3 setObject:v7 forKey:@"is_badged"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  objc_super v8 = [NSNumber numberWithInt:self->_displayRank];
  [v3 setObject:v8 forKey:@"display_rank"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithInt:self->_rankInSection];
  [v3 setObject:v9 forKey:@"rank_in_section"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t tocCellSection = self->_tocCellSection;
  if (tocCellSection >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_tocCellSection);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_264449E10[tocCellSection];
  }
  [v3 setObject:v11 forKey:@"toc_cell_section"];

LABEL_17:
  feedCellExposure = self->_feedCellExposure;
  if (feedCellExposure)
  {
    v13 = [(NTPBFeedCellExposure *)feedCellExposure dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"feed_cell_exposure"];
  }
  tocCellExposureArticleElement = self->_tocCellExposureArticleElement;
  if (tocCellExposureArticleElement)
  {
    v15 = [(NTPBTocCellExposureArticleElement *)tocCellExposureArticleElement dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"toc_cell_exposure_article_element"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTocCellExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_tocCellExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_10:
  if (self->_feedCellExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_tocCellExposureArticleElement)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_type;
    *(unsigned char *)(v5 + 60) |= 8u;
  }
  uint64_t v7 = [(NSData *)self->_tocCellExposureId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 56) = self->_isBadged;
    *(unsigned char *)(v6 + 60) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(_DWORD *)(v6 + 24) = self->_rankInSection;
      *(unsigned char *)(v6 + 60) |= 2u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 8) = self->_displayRank;
  *(unsigned char *)(v6 + 60) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 48) = self->_tocCellSection;
    *(unsigned char *)(v6 + 60) |= 4u;
  }
LABEL_8:
  id v10 = [(NTPBFeedCellExposure *)self->_feedCellExposure copyWithZone:a3];
  v11 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v10;

  id v12 = [(NTPBTocCellExposureArticleElement *)self->_tocCellExposureArticleElement copyWithZone:a3];
  v13 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_type != *((_DWORD *)v4 + 13)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_37;
  }
  tocCellExposureId = self->_tocCellExposureId;
  if ((unint64_t)tocCellExposureId | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](tocCellExposureId, "isEqual:")) {
      goto LABEL_37;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
    {
      if (self->_isBadged)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_37;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_18;
      }
    }
LABEL_37:
    char v9 = 0;
    goto LABEL_38;
  }
  if ((*((unsigned char *)v4 + 60) & 0x10) != 0) {
    goto LABEL_37;
  }
LABEL_18:
  if (has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_displayRank != *((_DWORD *)v4 + 2)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_37;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_rankInSection != *((_DWORD *)v4 + 6)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_tocCellSection != *((_DWORD *)v4 + 12)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_37;
  }
  feedCellExposure = self->_feedCellExposure;
  if ((unint64_t)feedCellExposure | *((void *)v4 + 2)
    && !-[NTPBFeedCellExposure isEqual:](feedCellExposure, "isEqual:"))
  {
    goto LABEL_37;
  }
  tocCellExposureArticleElement = self->_tocCellExposureArticleElement;
  if ((unint64_t)tocCellExposureArticleElement | *((void *)v4 + 4)) {
    char v9 = -[NTPBTocCellExposureArticleElement isEqual:](tocCellExposureArticleElement, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_38:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_tocCellExposureId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v5 = 2654435761 * self->_isBadged;
    if (*(unsigned char *)&self->_has)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_displayRank;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_rankInSection;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_tocCellSection;
LABEL_13:
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NTPBFeedCellExposure *)self->_feedCellExposure hash];
  return v9 ^ [(NTPBTocCellExposureArticleElement *)self->_tocCellExposureArticleElement hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  if ((v4[15] & 8) != 0)
  {
    self->_type = v4[13];
    *(unsigned char *)&self->_has |= 8u;
  }
  v11 = v4;
  if (*((void *)v4 + 5))
  {
    -[NTPBTocCellExposure setTocCellExposureId:](self, "setTocCellExposureId:");
    uint64_t v5 = v11;
  }
  char v6 = *((unsigned char *)v5 + 60);
  if ((v6 & 0x10) != 0)
  {
    self->_isBadged = *((unsigned char *)v5 + 56);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v5 + 60);
    if ((v6 & 1) == 0)
    {
LABEL_7:
      if ((v6 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((v5[15] & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_displayRank = v5[2];
  *(unsigned char *)&self->_has |= 1u;
  char v6 = *((unsigned char *)v5 + 60);
  if ((v6 & 2) == 0)
  {
LABEL_8:
    if ((v6 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  self->_rankInSection = v5[6];
  *(unsigned char *)&self->_has |= 2u;
  if ((v5[15] & 4) != 0)
  {
LABEL_9:
    self->_uint64_t tocCellSection = v5[12];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_10:
  feedCellExposure = self->_feedCellExposure;
  uint64_t v8 = *((void *)v5 + 2);
  if (feedCellExposure)
  {
    if (!v8) {
      goto LABEL_20;
    }
    -[NTPBFeedCellExposure mergeFrom:](feedCellExposure, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_20;
    }
    -[NTPBTocCellExposure setFeedCellExposure:](self, "setFeedCellExposure:");
  }
  uint64_t v5 = v11;
LABEL_20:
  tocCellExposureArticleElement = self->_tocCellExposureArticleElement;
  uint64_t v10 = *((void *)v5 + 4);
  if (tocCellExposureArticleElement)
  {
    if (v10) {
      -[NTPBTocCellExposureArticleElement mergeFrom:](tocCellExposureArticleElement, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[NTPBTocCellExposure setTocCellExposureArticleElement:](self, "setTocCellExposureArticleElement:");
  }

  MEMORY[0x270F9A758]();
}

- (NSData)tocCellExposureId
{
  return self->_tocCellExposureId;
}

- (void)setTocCellExposureId:(id)a3
{
}

- (BOOL)isBadged
{
  return self->_isBadged;
}

- (int)displayRank
{
  return self->_displayRank;
}

- (int)rankInSection
{
  return self->_rankInSection;
}

- (NTPBFeedCellExposure)feedCellExposure
{
  return self->_feedCellExposure;
}

- (void)setFeedCellExposure:(id)a3
{
}

- (NTPBTocCellExposureArticleElement)tocCellExposureArticleElement
{
  return self->_tocCellExposureArticleElement;
}

- (void)setTocCellExposureArticleElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tocCellExposureId, 0);
  objc_storeStrong((id *)&self->_tocCellExposureArticleElement, 0);

  objc_storeStrong((id *)&self->_feedCellExposure, 0);
}

@end