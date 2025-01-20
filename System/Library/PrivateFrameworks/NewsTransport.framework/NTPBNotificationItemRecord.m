@interface NTPBNotificationItemRecord
+ (Class)suppressIfFollowingTagIDsType;
- (BOOL)hasArticleID;
- (BOOL)hasBase;
- (BOOL)hasBody;
- (BOOL)hasClusterID;
- (BOOL)hasNotabilityScores;
- (BOOL)hasNotificationID;
- (BOOL)hasTargetDeviceTypes;
- (BOOL)hasTargetMinNewsVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores)notabilityScores;
- (NSMutableArray)suppressIfFollowingTagIDs;
- (NSString)articleID;
- (NSString)body;
- (NSString)clusterID;
- (NSString)notificationID;
- (NTPBRecordBase)base;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suppressIfFollowingTagIDsAtIndex:(unint64_t)a3;
- (int64_t)targetMinNewsVersion;
- (unint64_t)hash;
- (unint64_t)suppressIfFollowingTagIDsCount;
- (unsigned)targetDeviceTypes;
- (void)addSuppressIfFollowingTagIDs:(id)a3;
- (void)clearSuppressIfFollowingTagIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setBase:(id)a3;
- (void)setBody:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setHasTargetDeviceTypes:(BOOL)a3;
- (void)setHasTargetMinNewsVersion:(BOOL)a3;
- (void)setNotabilityScores:(id)a3;
- (void)setNotificationID:(id)a3;
- (void)setSuppressIfFollowingTagIDs:(id)a3;
- (void)setTargetDeviceTypes:(unsigned int)a3;
- (void)setTargetMinNewsVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNotificationItemRecord

- (void)dealloc
{
  [(NTPBNotificationItemRecord *)self setBase:0];
  [(NTPBNotificationItemRecord *)self setNotificationID:0];
  [(NTPBNotificationItemRecord *)self setArticleID:0];
  [(NTPBNotificationItemRecord *)self setBody:0];
  [(NTPBNotificationItemRecord *)self setClusterID:0];
  [(NTPBNotificationItemRecord *)self setNotabilityScores:0];
  [(NTPBNotificationItemRecord *)self setSuppressIfFollowingTagIDs:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBNotificationItemRecord;
  [(NTPBNotificationItemRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasNotificationID
{
  return self->_notificationID != 0;
}

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (BOOL)hasNotabilityScores
{
  return self->_notabilityScores != 0;
}

- (void)setTargetDeviceTypes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_targetDeviceTypes = a3;
}

- (void)setHasTargetDeviceTypes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTargetDeviceTypes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTargetMinNewsVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_targetMinNewsVersion = a3;
}

- (void)setHasTargetMinNewsVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTargetMinNewsVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearSuppressIfFollowingTagIDs
{
}

- (void)addSuppressIfFollowingTagIDs:(id)a3
{
  suppressIfFollowingTagIDs = self->_suppressIfFollowingTagIDs;
  if (!suppressIfFollowingTagIDs)
  {
    suppressIfFollowingTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_suppressIfFollowingTagIDs = suppressIfFollowingTagIDs;
  }

  [(NSMutableArray *)suppressIfFollowingTagIDs addObject:a3];
}

- (unint64_t)suppressIfFollowingTagIDsCount
{
  return [(NSMutableArray *)self->_suppressIfFollowingTagIDs count];
}

- (id)suppressIfFollowingTagIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suppressIfFollowingTagIDs objectAtIndex:a3];
}

+ (Class)suppressIfFollowingTagIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBNotificationItemRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBNotificationItemRecord description](&v3, sel_description), -[NTPBNotificationItemRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  notificationID = self->_notificationID;
  if (notificationID) {
    [v3 setObject:notificationID forKey:@"notification_ID"];
  }
  articleID = self->_articleID;
  if (articleID) {
    [v3 setObject:articleID forKey:@"article_ID"];
  }
  body = self->_body;
  if (body) {
    [v3 setObject:body forKey:@"body"];
  }
  clusterID = self->_clusterID;
  if (clusterID) {
    [v3 setObject:clusterID forKey:@"cluster_ID"];
  }
  notabilityScores = self->_notabilityScores;
  if (notabilityScores) {
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores dictionaryRepresentation](notabilityScores, "dictionaryRepresentation"), @"notability_scores");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_targetDeviceTypes), @"target_device_types");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_targetMinNewsVersion), @"target_min_news_version");
  }
  suppressIfFollowingTagIDs = self->_suppressIfFollowingTagIDs;
  if (suppressIfFollowingTagIDs) {
    [v3 setObject:suppressIfFollowingTagIDs forKey:@"suppress_if_following_tag_IDs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationItemRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_notificationID) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_body) {
    PBDataWriterWriteStringField();
  }
  if (self->_clusterID) {
    PBDataWriterWriteStringField();
  }
  if (self->_notabilityScores) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  suppressIfFollowingTagIDs = self->_suppressIfFollowingTagIDs;
  uint64_t v6 = [(NSMutableArray *)suppressIfFollowingTagIDs countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(suppressIfFollowingTagIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)suppressIfFollowingTagIDs countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 24) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  *(void *)(v5 + 56) = [(NSString *)self->_notificationID copyWithZone:a3];

  *(void *)(v5 + 16) = [(NSString *)self->_articleID copyWithZone:a3];
  *(void *)(v5 + 32) = [(NSString *)self->_body copyWithZone:a3];

  *(void *)(v5 + 40) = [(NSString *)self->_clusterID copyWithZone:a3];
  *(void *)(v5 + 48) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores *)self->_notabilityScores copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_targetDeviceTypes;
    *(unsigned char *)(v5 + 76) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_targetMinNewsVersion;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  suppressIfFollowingTagIDs = self->_suppressIfFollowingTagIDs;
  uint64_t v8 = [(NSMutableArray *)suppressIfFollowingTagIDs countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(suppressIfFollowingTagIDs);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addSuppressIfFollowingTagIDs:v12];
      }
      uint64_t v9 = [(NSMutableArray *)suppressIfFollowingTagIDs countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 3)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      notificationID = self->_notificationID;
      if (!((unint64_t)notificationID | *((void *)a3 + 7))
        || (int v5 = -[NSString isEqual:](notificationID, "isEqual:")) != 0)
      {
        articleID = self->_articleID;
        if (!((unint64_t)articleID | *((void *)a3 + 2))
          || (int v5 = -[NSString isEqual:](articleID, "isEqual:")) != 0)
        {
          body = self->_body;
          if (!((unint64_t)body | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](body, "isEqual:")) != 0)
          {
            clusterID = self->_clusterID;
            if (!((unint64_t)clusterID | *((void *)a3 + 5))
              || (int v5 = -[NSString isEqual:](clusterID, "isEqual:")) != 0)
            {
              notabilityScores = self->_notabilityScores;
              if (!((unint64_t)notabilityScores | *((void *)a3 + 6))
                || (int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores isEqual:](notabilityScores, "isEqual:")) != 0)
              {
                if ((*(unsigned char *)&self->_has & 2) != 0)
                {
                  if ((*((unsigned char *)a3 + 76) & 2) == 0 || self->_targetDeviceTypes != *((_DWORD *)a3 + 18)) {
                    goto LABEL_26;
                  }
                }
                else if ((*((unsigned char *)a3 + 76) & 2) != 0)
                {
LABEL_26:
                  LOBYTE(v5) = 0;
                  return v5;
                }
                if (*(unsigned char *)&self->_has)
                {
                  if ((*((unsigned char *)a3 + 76) & 1) == 0 || self->_targetMinNewsVersion != *((void *)a3 + 1)) {
                    goto LABEL_26;
                  }
                }
                else if (*((unsigned char *)a3 + 76))
                {
                  goto LABEL_26;
                }
                suppressIfFollowingTagIDs = self->_suppressIfFollowingTagIDs;
                if ((unint64_t)suppressIfFollowingTagIDs | *((void *)a3 + 8))
                {
                  LOBYTE(v5) = -[NSMutableArray isEqual:](suppressIfFollowingTagIDs, "isEqual:");
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
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  NSUInteger v4 = [(NSString *)self->_notificationID hash];
  NSUInteger v5 = [(NSString *)self->_articleID hash];
  NSUInteger v6 = [(NSString *)self->_body hash];
  NSUInteger v7 = [(NSString *)self->_clusterID hash];
  unint64_t v8 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores *)self->_notabilityScores hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_targetDeviceTypes;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSMutableArray *)self->_suppressIfFollowingTagIDs hash];
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = 2654435761 * self->_targetMinNewsVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSMutableArray *)self->_suppressIfFollowingTagIDs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 3);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBNotificationItemRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 7)) {
    -[NTPBNotificationItemRecord setNotificationID:](self, "setNotificationID:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBNotificationItemRecord setArticleID:](self, "setArticleID:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBNotificationItemRecord setBody:](self, "setBody:");
  }
  if (*((void *)a3 + 5)) {
    -[NTPBNotificationItemRecord setClusterID:](self, "setClusterID:");
  }
  notabilityScores = self->_notabilityScores;
  uint64_t v8 = *((void *)a3 + 6);
  if (notabilityScores)
  {
    if (v8) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores mergeFrom:](notabilityScores, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBNotificationItemRecord setNotabilityScores:](self, "setNotabilityScores:");
  }
  char v9 = *((unsigned char *)a3 + 76);
  if ((v9 & 2) != 0)
  {
    self->_targetDeviceTypes = *((_DWORD *)a3 + 18);
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)a3 + 76);
  }
  if (v9)
  {
    self->_targetMinNewsVersion = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 8);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBNotificationItemRecord *)self addSuppressIfFollowingTagIDs:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores)notabilityScores
{
  return self->_notabilityScores;
}

- (void)setNotabilityScores:(id)a3
{
}

- (unsigned)targetDeviceTypes
{
  return self->_targetDeviceTypes;
}

- (int64_t)targetMinNewsVersion
{
  return self->_targetMinNewsVersion;
}

- (NSMutableArray)suppressIfFollowingTagIDs
{
  return self->_suppressIfFollowingTagIDs;
}

- (void)setSuppressIfFollowingTagIDs:(id)a3
{
}

@end