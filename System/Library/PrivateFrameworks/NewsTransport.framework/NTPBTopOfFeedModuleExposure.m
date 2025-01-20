@interface NTPBTopOfFeedModuleExposure
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasModuleEventType;
- (BOOL)hasModuleExposureId;
- (BOOL)hasModuleItemCount;
- (BOOL)hasModuleLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)feedViewExposureId;
- (NSData)moduleExposureId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)moduleEventTypeAsString:(int)a3;
- (id)moduleLocationAsString:(int)a3;
- (int)StringAsModuleEventType:(id)a3;
- (int)StringAsModuleLocation:(id)a3;
- (int)moduleEventType;
- (int)moduleItemCount;
- (int)moduleLocation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setHasModuleEventType:(BOOL)a3;
- (void)setHasModuleItemCount:(BOOL)a3;
- (void)setHasModuleLocation:(BOOL)a3;
- (void)setModuleEventType:(int)a3;
- (void)setModuleExposureId:(id)a3;
- (void)setModuleItemCount:(int)a3;
- (void)setModuleLocation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTopOfFeedModuleExposure

- (int)moduleEventType
{
  if (*(unsigned char *)&self->_has) {
    return self->_moduleEventType;
  }
  else {
    return 0;
  }
}

- (void)setModuleEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_moduleEventType = a3;
}

- (void)setHasModuleEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModuleEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)moduleEventTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264448768[a3];
  }

  return v3;
}

- (int)StringAsModuleEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MODULE_EVENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BREAKING_NEWS_MODULE_EVENT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPECIAL_EVENTS_MODULE_EVENT_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)moduleLocation
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_moduleLocation;
  }
  else {
    return 0;
  }
}

- (void)setModuleLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_moduleLocation = a3;
}

- (void)setHasModuleLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModuleLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)moduleLocationAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264448780[a3];
  }

  return v3;
}

- (int)StringAsModuleLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MODULE_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FOR_YOU_MODULE_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_MODULE_EVENT_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setModuleItemCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_moduleItemCount = a3;
}

- (void)setHasModuleItemCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModuleItemCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasModuleExposureId
{
  return self->_moduleExposureId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTopOfFeedModuleExposure;
  int v4 = [(NTPBTopOfFeedModuleExposure *)&v8 description];
  v5 = [(NTPBTopOfFeedModuleExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t moduleEventType = self->_moduleEventType;
    if (moduleEventType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_moduleEventType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_264448768[moduleEventType];
    }
    [v3 setObject:v10 forKey:@"module_event_type"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t moduleLocation = self->_moduleLocation;
  if (moduleLocation >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_moduleLocation);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_264448780[moduleLocation];
  }
  [v3 setObject:v12 forKey:@"module_location"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithInt:self->_moduleItemCount];
    [v3 setObject:v5 forKey:@"module_item_count"];
  }
LABEL_5:
  moduleExposureId = self->_moduleExposureId;
  if (moduleExposureId) {
    [v3 setObject:moduleExposureId forKey:@"module_exposure_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTopOfFeedModuleExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_moduleExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_feedViewExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 36) = self->_moduleLocation;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_moduleEventType;
  *(unsigned char *)(v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_moduleItemCount;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
LABEL_5:
  uint64_t v8 = [(NSData *)self->_moduleExposureId copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  uint64_t v10 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v11 = (void *)v6[1];
  v6[1] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_moduleEventType != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_moduleLocation != *((_DWORD *)v4 + 9)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_moduleItemCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  moduleExposureId = self->_moduleExposureId;
  if ((unint64_t)moduleExposureId | *((void *)v4 + 3)
    && !-[NSData isEqual:](moduleExposureId, "isEqual:"))
  {
    goto LABEL_21;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 1)) {
    char v7 = -[NSData isEqual:](feedViewExposureId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_moduleEventType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_moduleLocation;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_moduleItemCount;
LABEL_8:
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSData *)self->_moduleExposureId hash];
  return v6 ^ [(NSData *)self->_feedViewExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_uint64_t moduleEventType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t moduleLocation = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_4:
    self->_moduleItemCount = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBTopOfFeedModuleExposure setModuleExposureId:](self, "setModuleExposureId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBTopOfFeedModuleExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    id v4 = v6;
  }
}

- (int)moduleItemCount
{
  return self->_moduleItemCount;
}

- (NSData)moduleExposureId
{
  return self->_moduleExposureId;
}

- (void)setModuleExposureId:(id)a3
{
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleExposureId, 0);

  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
}

@end