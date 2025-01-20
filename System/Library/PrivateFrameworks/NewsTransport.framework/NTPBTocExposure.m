@interface NTPBTocExposure
- (BOOL)hasPrecedingLocation;
- (BOOL)hasTocExposureId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)tocExposureId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)precedingLocationAsString:(int)a3;
- (int)StringAsPrecedingLocation:(id)a3;
- (int)precedingLocation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasPrecedingLocation:(BOOL)a3;
- (void)setPrecedingLocation:(int)a3;
- (void)setTocExposureId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTocExposure

- (int)precedingLocation
{
  if (*(unsigned char *)&self->_has) {
    return self->_precedingLocation;
  }
  else {
    return 0;
  }
}

- (void)setPrecedingLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_precedingLocation = a3;
}

- (void)setHasPrecedingLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrecedingLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)precedingLocationAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264449D30[a3];
  }

  return v3;
}

- (int)StringAsPrecedingLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FROM_FOR_YOU_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FROM_FAVORITES_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_FAVORITES_AREA_PRESENTATION_REASON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FROM_EXPLORE_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_EDITORS_PICKS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_RECOMMENDED_AREA_PRESENTATION_REASON"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FROM_EXPLORE_BROWSE_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_CHANNELS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_TOPICS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_CHANNELS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_TOPICS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FROM_SEARCH_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_SEARCH_AREA_PRESENTATION_REASON"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FROM_SEARCH_RESULTS_LIST_AREA_PRESENTATION_REASON"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FROM_SAVED_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"FROM_SAVED_HISTORY_AREA_PRESENTATION_REASON"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FROM_DISCOVER_MORE_BUTTON_TAP_AREA_PRESENTATION_REASON"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FROM_DISCOVER_MORE_BACK_TAP_AREA_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"FROM_ARTICLE_AREA_PRESENTATION_REASON"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_AREA_PRESENTATION_REASON"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"FROM_TOC_AREA_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTocExposureId
{
  return self->_tocExposureId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTocExposure;
  int v4 = [(NTPBTocExposure *)&v8 description];
  v5 = [(NTPBTocExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t precedingLocation = self->_precedingLocation;
    if (precedingLocation >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_precedingLocation);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_264449D30[precedingLocation];
    }
    [v3 setObject:v5 forKey:@"preceding_location"];
  }
  tocExposureId = self->_tocExposureId;
  if (tocExposureId) {
    [v3 setObject:tocExposureId forKey:@"toc_exposure_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTocExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_tocExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_precedingLocation;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_tocExposureId copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_precedingLocation != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  tocExposureId = self->_tocExposureId;
  if ((unint64_t)tocExposureId | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](tocExposureId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_precedingLocation;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_tocExposureId hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_uint64_t precedingLocation = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[NTPBTocExposure setTocExposureId:](self, "setTocExposureId:");
    id v4 = v5;
  }
}

- (NSData)tocExposureId
{
  return self->_tocExposureId;
}

- (void)setTocExposureId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end