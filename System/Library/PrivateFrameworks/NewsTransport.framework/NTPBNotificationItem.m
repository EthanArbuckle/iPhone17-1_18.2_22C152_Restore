@interface NTPBNotificationItem
+ (Class)suppressIfFollowingTagIDsType;
- (BOOL)hasAlgoID;
- (BOOL)hasCanonicalID;
- (BOOL)hasClusterID;
- (BOOL)hasFeedItem;
- (BOOL)hasIdentifier;
- (BOOL)hasNotabilityScores;
- (BOOL)hasSource;
- (BOOL)hasTargetDeviceTypes;
- (BOOL)hasTargetMinNewsVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores)notabilityScores;
- (NSMutableArray)suppressIfFollowingTagIDs;
- (NSString)algoID;
- (NSString)canonicalID;
- (NSString)clusterID;
- (NSString)identifier;
- (NTPBFeedItem)feedItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suppressIfFollowingTagIDsAtIndex:(unint64_t)a3;
- (int)source;
- (int64_t)targetMinNewsVersion;
- (unint64_t)hash;
- (unint64_t)suppressIfFollowingTagIDsCount;
- (unsigned)targetDeviceTypes;
- (void)addSuppressIfFollowingTagIDs:(id)a3;
- (void)clearSuppressIfFollowingTagIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAlgoID:(id)a3;
- (void)setCanonicalID:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setFeedItem:(id)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasTargetDeviceTypes:(BOOL)a3;
- (void)setHasTargetMinNewsVersion:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setNotabilityScores:(id)a3;
- (void)setSource:(int)a3;
- (void)setSuppressIfFollowingTagIDs:(id)a3;
- (void)setTargetDeviceTypes:(unsigned int)a3;
- (void)setTargetMinNewsVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNotificationItem

- (void)dealloc
{
  [(NTPBNotificationItem *)self setIdentifier:0];
  [(NTPBNotificationItem *)self setFeedItem:0];
  [(NTPBNotificationItem *)self setCanonicalID:0];
  [(NTPBNotificationItem *)self setClusterID:0];
  [(NTPBNotificationItem *)self setNotabilityScores:0];
  [(NTPBNotificationItem *)self setSuppressIfFollowingTagIDs:0];
  [(NTPBNotificationItem *)self setAlgoID:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBNotificationItem;
  [(NTPBNotificationItem *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasFeedItem
{
  return self->_feedItem != 0;
}

- (BOOL)hasCanonicalID
{
  return self->_canonicalID != 0;
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
  *(unsigned char *)&self->_has |= 4u;
  self->_targetDeviceTypes = a3;
}

- (void)setHasTargetDeviceTypes:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTargetDeviceTypes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (int)source
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAlgoID
{
  return self->_algoID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBNotificationItem;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBNotificationItem description](&v3, sel_description), -[NTPBNotificationItem dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  feedItem = self->_feedItem;
  if (feedItem) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBFeedItem dictionaryRepresentation](feedItem, "dictionaryRepresentation"), @"feed_item");
  }
  canonicalID = self->_canonicalID;
  if (canonicalID) {
    [v4 setObject:canonicalID forKey:@"canonical_ID"];
  }
  clusterID = self->_clusterID;
  if (clusterID) {
    [v4 setObject:clusterID forKey:@"cluster_ID"];
  }
  notabilityScores = self->_notabilityScores;
  if (notabilityScores) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores dictionaryRepresentation](notabilityScores, "dictionaryRepresentation"), @"notability_scores");
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_targetDeviceTypes), @"target_device_types");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_targetMinNewsVersion), @"target_min_news_version");
  }
  suppressIfFollowingTagIDs = self->_suppressIfFollowingTagIDs;
  if (suppressIfFollowingTagIDs) {
    [v4 setObject:suppressIfFollowingTagIDs forKey:@"suppress_if_following_tag_IDs"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_source), @"source");
  }
  algoID = self->_algoID;
  if (algoID) {
    [v4 setObject:algoID forKey:@"algo_ID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationItemReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_feedItem) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_canonicalID) {
    PBDataWriterWriteStringField();
  }
  if (self->_clusterID) {
    PBDataWriterWriteStringField();
  }
  if (self->_notabilityScores) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
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
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_algoID) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 48) = [(NSString *)self->_identifier copyWithZone:a3];
  *(void *)(v5 + 40) = [(NTPBFeedItem *)self->_feedItem copyWithZone:a3];

  *(void *)(v5 + 24) = [(NSString *)self->_canonicalID copyWithZone:a3];
  *(void *)(v5 + 32) = [(NSString *)self->_clusterID copyWithZone:a3];

  *(void *)(v5 + 56) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores *)self->_notabilityScores copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_targetDeviceTypes;
    *(unsigned char *)(v5 + 84) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_targetMinNewsVersion;
    *(unsigned char *)(v5 + 84) |= 1u;
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_source;
    *(unsigned char *)(v5 + 84) |= 2u;
  }

  *(void *)(v5 + 16) = [(NSString *)self->_algoID copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((void *)a3 + 6))
      || (int v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      feedItem = self->_feedItem;
      if (!((unint64_t)feedItem | *((void *)a3 + 5))
        || (int v5 = -[NTPBFeedItem isEqual:](feedItem, "isEqual:")) != 0)
      {
        canonicalID = self->_canonicalID;
        if (!((unint64_t)canonicalID | *((void *)a3 + 3))
          || (int v5 = -[NSString isEqual:](canonicalID, "isEqual:")) != 0)
        {
          clusterID = self->_clusterID;
          if (!((unint64_t)clusterID | *((void *)a3 + 4))
            || (int v5 = -[NSString isEqual:](clusterID, "isEqual:")) != 0)
          {
            notabilityScores = self->_notabilityScores;
            if (!((unint64_t)notabilityScores | *((void *)a3 + 7))
              || (int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores isEqual:](notabilityScores, "isEqual:")) != 0)
            {
              char has = (char)self->_has;
              if ((has & 4) != 0)
              {
                if ((*((unsigned char *)a3 + 84) & 4) == 0 || self->_targetDeviceTypes != *((_DWORD *)a3 + 20)) {
                  goto LABEL_32;
                }
              }
              else if ((*((unsigned char *)a3 + 84) & 4) != 0)
              {
LABEL_32:
                LOBYTE(v5) = 0;
                return v5;
              }
              if (*(unsigned char *)&self->_has)
              {
                if ((*((unsigned char *)a3 + 84) & 1) == 0 || self->_targetMinNewsVersion != *((void *)a3 + 1)) {
                  goto LABEL_32;
                }
              }
              else if (*((unsigned char *)a3 + 84))
              {
                goto LABEL_32;
              }
              suppressIfFollowingTagIDs = self->_suppressIfFollowingTagIDs;
              if ((unint64_t)suppressIfFollowingTagIDs | *((void *)a3 + 9))
              {
                int v5 = -[NSMutableArray isEqual:](suppressIfFollowingTagIDs, "isEqual:");
                if (!v5) {
                  return v5;
                }
                char has = (char)self->_has;
              }
              if ((has & 2) != 0)
              {
                if ((*((unsigned char *)a3 + 84) & 2) == 0 || self->_source != *((_DWORD *)a3 + 16)) {
                  goto LABEL_32;
                }
              }
              else if ((*((unsigned char *)a3 + 84) & 2) != 0)
              {
                goto LABEL_32;
              }
              algoID = self->_algoID;
              if ((unint64_t)algoID | *((void *)a3 + 2))
              {
                LOBYTE(v5) = -[NSString isEqual:](algoID, "isEqual:");
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
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(NTPBFeedItem *)self->_feedItem hash];
  NSUInteger v5 = [(NSString *)self->_canonicalID hash];
  NSUInteger v6 = [(NSString *)self->_clusterID hash];
  unint64_t v7 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores *)self->_notabilityScores hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v8 = 2654435761 * self->_targetDeviceTypes;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v9 = 2654435761 * self->_targetMinNewsVersion;
      goto LABEL_6;
    }
  }
  uint64_t v9 = 0;
LABEL_6:
  uint64_t v10 = [(NSMutableArray *)self->_suppressIfFollowingTagIDs hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_source;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_algoID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 6)) {
    -[NTPBNotificationItem setIdentifier:](self, "setIdentifier:");
  }
  feedItem = self->_feedItem;
  uint64_t v6 = *((void *)a3 + 5);
  if (feedItem)
  {
    if (v6) {
      -[NTPBFeedItem mergeFrom:](feedItem, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBNotificationItem setFeedItem:](self, "setFeedItem:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBNotificationItem setCanonicalID:](self, "setCanonicalID:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBNotificationItem setClusterID:](self, "setClusterID:");
  }
  notabilityScores = self->_notabilityScores;
  uint64_t v8 = *((void *)a3 + 7);
  if (notabilityScores)
  {
    if (v8) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLNotabilityScores mergeFrom:](notabilityScores, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBNotificationItem setNotabilityScores:](self, "setNotabilityScores:");
  }
  char v9 = *((unsigned char *)a3 + 84);
  if ((v9 & 4) != 0)
  {
    self->_targetDeviceTypes = *((_DWORD *)a3 + 20);
    *(unsigned char *)&self->_has |= 4u;
    char v9 = *((unsigned char *)a3 + 84);
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
  uint64_t v10 = (void *)*((void *)a3 + 9);
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
        [(NTPBNotificationItem *)self addSuppressIfFollowingTagIDs:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
  if ((*((unsigned char *)a3 + 84) & 2) != 0)
  {
    self->_source = *((_DWORD *)a3 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 2)) {
    -[NTPBNotificationItem setAlgoID:](self, "setAlgoID:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NTPBFeedItem)feedItem
{
  return self->_feedItem;
}

- (void)setFeedItem:(id)a3
{
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
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

- (NSString)algoID
{
  return self->_algoID;
}

- (void)setAlgoID:(id)a3
{
}

@end