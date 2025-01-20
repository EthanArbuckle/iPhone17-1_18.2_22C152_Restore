@interface NTPBRecordBase
- (BOOL)deletedFromCloud;
- (BOOL)hasAssetURLsDate;
- (BOOL)hasCacheLifetimeHint;
- (BOOL)hasChangeTag;
- (BOOL)hasDeletedFromCloud;
- (BOOL)hasFetchDate;
- (BOOL)hasIdentifier;
- (BOOL)hasModificationDate;
- (BOOL)hasRecordType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)changeTag;
- (NSString)identifier;
- (NTPBDate)assetURLsDate;
- (NTPBDate)fetchDate;
- (NTPBDate)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)cacheLifetimeHint;
- (int)recordType;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssetURLsDate:(id)a3;
- (void)setCacheLifetimeHint:(int)a3;
- (void)setChangeTag:(id)a3;
- (void)setDeletedFromCloud:(BOOL)a3;
- (void)setFetchDate:(id)a3;
- (void)setHasCacheLifetimeHint:(BOOL)a3;
- (void)setHasDeletedFromCloud:(BOOL)a3;
- (void)setHasRecordType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setRecordType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBRecordBase

- (void)dealloc
{
  [(NTPBRecordBase *)self setIdentifier:0];
  [(NTPBRecordBase *)self setChangeTag:0];
  [(NTPBRecordBase *)self setModificationDate:0];
  [(NTPBRecordBase *)self setFetchDate:0];
  [(NTPBRecordBase *)self setAssetURLsDate:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBRecordBase;
  [(NTPBRecordBase *)&v3 dealloc];
}

- (void)setFetchDate:(id)a3
{
}

- (void)setModificationDate:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setChangeTag:(id)a3
{
}

- (void)setAssetURLsDate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NTPBDate)assetURLsDate
{
  return self->_assetURLsDate;
}

- (NTPBDate)fetchDate
{
  return self->_fetchDate;
}

- (int)cacheLifetimeHint
{
  if (*(unsigned char *)&self->_has) {
    return self->_cacheLifetimeHint;
  }
  else {
    return 0;
  }
}

- (int)recordType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_recordType;
  }
  else {
    return 0;
  }
}

- (NTPBDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)changeTag
{
  return self->_changeTag;
}

- (BOOL)deletedFromCloud
{
  return self->_deletedFromCloud;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 40) = [(NSString *)self->_identifier copyWithZone:a3];
  *(void *)(v5 + 24) = [(NSString *)self->_changeTag copyWithZone:a3];

  *(void *)(v5 + 48) = [(NTPBDate *)self->_modificationDate copyWithZone:a3];
  *(void *)(v5 + 32) = [(NTPBDate *)self->_fetchDate copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_cacheLifetimeHint;
    *(unsigned char *)(v5 + 64) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v5 + 60) = self->_deletedFromCloud;
  *(unsigned char *)(v5 + 64) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 56) = self->_recordType;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
LABEL_5:

  *(void *)(v5 + 8) = [(NTPBDate *)self->_assetURLsDate copyWithZone:a3];
  return (id)v5;
}

- (void)setRecordType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recordType = a3;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasChangeTag
{
  return self->_changeTag != 0;
}

- (BOOL)hasModificationDate
{
  return self->_modificationDate != 0;
}

- (BOOL)hasFetchDate
{
  return self->_fetchDate != 0;
}

- (void)setDeletedFromCloud:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deletedFromCloud = a3;
}

- (void)setHasDeletedFromCloud:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeletedFromCloud
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCacheLifetimeHint:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cacheLifetimeHint = a3;
}

- (void)setHasCacheLifetimeHint:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCacheLifetimeHint
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRecordType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAssetURLsDate
{
  return self->_assetURLsDate != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBRecordBase;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBRecordBase description](&v3, sel_description), -[NTPBRecordBase dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  changeTag = self->_changeTag;
  if (changeTag) {
    [v4 setObject:changeTag forKey:@"change_tag"];
  }
  modificationDate = self->_modificationDate;
  if (modificationDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](modificationDate, "dictionaryRepresentation"), @"modification_date");
  }
  fetchDate = self->_fetchDate;
  if (fetchDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](fetchDate, "dictionaryRepresentation"), @"fetch_date");
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_deletedFromCloud), @"deleted_from_cloud");
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_cacheLifetimeHint), @"cache_lifetime_hint");
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_12:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_recordType), @"record_type");
LABEL_13:
  assetURLsDate = self->_assetURLsDate;
  if (assetURLsDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](assetURLsDate, "dictionaryRepresentation"), @"asset_URLs_date");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBRecordBaseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_changeTag) {
    PBDataWriterWriteStringField();
  }
  if (self->_modificationDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_fetchDate) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_assetURLsDate)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)a3 + 5))
  {
    int v5 = -[NSString isEqual:](identifier, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  changeTag = self->_changeTag;
  if ((unint64_t)changeTag | *((void *)a3 + 3))
  {
    int v5 = -[NSString isEqual:](changeTag, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  modificationDate = self->_modificationDate;
  if ((unint64_t)modificationDate | *((void *)a3 + 6))
  {
    int v5 = -[NTPBDate isEqual:](modificationDate, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  fetchDate = self->_fetchDate;
  if ((unint64_t)fetchDate | *((void *)a3 + 4))
  {
    int v5 = -[NTPBDate isEqual:](fetchDate, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)a3 + 64) & 4) != 0) {
      goto LABEL_30;
    }
    goto LABEL_18;
  }
  if ((*((unsigned char *)a3 + 64) & 4) == 0) {
    goto LABEL_30;
  }
  if (self->_deletedFromCloud)
  {
    if (!*((unsigned char *)a3 + 60)) {
      goto LABEL_30;
    }
    goto LABEL_18;
  }
  if (*((unsigned char *)a3 + 60))
  {
LABEL_30:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_cacheLifetimeHint != *((_DWORD *)a3 + 4)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)a3 + 64))
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_recordType != *((_DWORD *)a3 + 14)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 2) != 0)
  {
    goto LABEL_30;
  }
  assetURLsDate = self->_assetURLsDate;
  if ((unint64_t)assetURLsDate | *((void *)a3 + 1))
  {
    LOBYTE(v5) = -[NTPBDate isEqual:](assetURLsDate, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_changeTag hash];
  unint64_t v5 = [(NTPBDate *)self->_modificationDate hash];
  unint64_t v6 = [(NTPBDate *)self->_fetchDate hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NTPBDate *)self->_assetURLsDate hash];
  }
  uint64_t v7 = 2654435761 * self->_deletedFromCloud;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_cacheLifetimeHint;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v9 = 2654435761 * self->_recordType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NTPBDate *)self->_assetURLsDate hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 5)) {
    -[NTPBRecordBase setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBRecordBase setChangeTag:](self, "setChangeTag:");
  }
  modificationDate = self->_modificationDate;
  uint64_t v6 = *((void *)a3 + 6);
  if (modificationDate)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](modificationDate, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBRecordBase setModificationDate:](self, "setModificationDate:");
  }
  fetchDate = self->_fetchDate;
  uint64_t v8 = *((void *)a3 + 4);
  if (fetchDate)
  {
    if (v8) {
      -[NTPBDate mergeFrom:](fetchDate, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBRecordBase setFetchDate:](self, "setFetchDate:");
  }
  char v9 = *((unsigned char *)a3 + 64);
  if ((v9 & 4) != 0)
  {
    self->_deletedFromCloud = *((unsigned char *)a3 + 60);
    *(unsigned char *)&self->_has |= 4u;
    char v9 = *((unsigned char *)a3 + 64);
    if ((v9 & 1) == 0)
    {
LABEL_17:
      if ((v9 & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 1) == 0)
  {
    goto LABEL_17;
  }
  self->_cacheLifetimeHint = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 64) & 2) != 0)
  {
LABEL_18:
    self->_recordType = *((_DWORD *)a3 + 14);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_19:
  assetURLsDate = self->_assetURLsDate;
  uint64_t v11 = *((void *)a3 + 1);
  if (assetURLsDate)
  {
    if (v11)
    {
      -[NTPBDate mergeFrom:](assetURLsDate, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[NTPBRecordBase setAssetURLsDate:](self, "setAssetURLsDate:");
  }
}

@end