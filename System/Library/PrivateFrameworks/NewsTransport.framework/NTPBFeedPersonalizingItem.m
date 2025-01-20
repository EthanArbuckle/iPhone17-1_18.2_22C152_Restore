@interface NTPBFeedPersonalizingItem
+ (Class)topicIDsType;
+ (Class)topicsType;
- (BOOL)hasAudioTrack;
- (BOOL)hasBodyTextLength;
- (BOOL)hasFloat16FullBodyEncoding;
- (BOOL)hasFloat16TitleEncoding;
- (BOOL)hasGlobalCohorts;
- (BOOL)hasGlobalConversionStats;
- (BOOL)hasHasAudioTrack;
- (BOOL)hasHasVideo;
- (BOOL)hasIdentifier;
- (BOOL)hasIsAIGenerated;
- (BOOL)hasIsANF;
- (BOOL)hasIsBundlePaid;
- (BOOL)hasIsFeatured;
- (BOOL)hasIsPaid;
- (BOOL)hasPublishDateMilliseconds;
- (BOOL)hasPublisherCohorts;
- (BOOL)hasPublisherConversionStats;
- (BOOL)hasPublisherID;
- (BOOL)hasPublisherTagMetadata;
- (BOOL)hasVideo;
- (BOOL)isAIGenerated;
- (BOOL)isANF;
- (BOOL)isBundlePaid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFeatured;
- (BOOL)isPaid;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata;
- (NSData)float16FullBodyEncoding;
- (NSData)float16TitleEncoding;
- (NSMutableArray)topicIDs;
- (NSMutableArray)topics;
- (NSString)identifier;
- (NSString)publisherID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicIDsAtIndex:(unint64_t)a3;
- (id)topicsAtIndex:(unint64_t)a3;
- (int64_t)bodyTextLength;
- (unint64_t)hash;
- (unint64_t)publishDateMilliseconds;
- (unint64_t)topicIDsCount;
- (unint64_t)topicsCount;
- (void)addTopicIDs:(id)a3;
- (void)addTopics:(id)a3;
- (void)clearTopicIDs;
- (void)clearTopics;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBodyTextLength:(int64_t)a3;
- (void)setFloat16FullBodyEncoding:(id)a3;
- (void)setFloat16TitleEncoding:(id)a3;
- (void)setGlobalCohorts:(id)a3;
- (void)setGlobalConversionStats:(id)a3;
- (void)setHasAudioTrack:(BOOL)a3;
- (void)setHasBodyTextLength:(BOOL)a3;
- (void)setHasHasAudioTrack:(BOOL)a3;
- (void)setHasHasVideo:(BOOL)a3;
- (void)setHasIsAIGenerated:(BOOL)a3;
- (void)setHasIsANF:(BOOL)a3;
- (void)setHasIsBundlePaid:(BOOL)a3;
- (void)setHasIsFeatured:(BOOL)a3;
- (void)setHasIsPaid:(BOOL)a3;
- (void)setHasPublishDateMilliseconds:(BOOL)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsAIGenerated:(BOOL)a3;
- (void)setIsANF:(BOOL)a3;
- (void)setIsBundlePaid:(BOOL)a3;
- (void)setIsFeatured:(BOOL)a3;
- (void)setIsPaid:(BOOL)a3;
- (void)setPublishDateMilliseconds:(unint64_t)a3;
- (void)setPublisherCohorts:(id)a3;
- (void)setPublisherConversionStats:(id)a3;
- (void)setPublisherID:(id)a3;
- (void)setPublisherTagMetadata:(id)a3;
- (void)setTopicIDs:(id)a3;
- (void)setTopics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedPersonalizingItem

- (void)dealloc
{
  [(NTPBFeedPersonalizingItem *)self setIdentifier:0];
  [(NTPBFeedPersonalizingItem *)self setTopicIDs:0];
  [(NTPBFeedPersonalizingItem *)self setPublisherID:0];
  [(NTPBFeedPersonalizingItem *)self setGlobalCohorts:0];
  [(NTPBFeedPersonalizingItem *)self setPublisherCohorts:0];
  [(NTPBFeedPersonalizingItem *)self setGlobalConversionStats:0];
  [(NTPBFeedPersonalizingItem *)self setPublisherConversionStats:0];
  [(NTPBFeedPersonalizingItem *)self setTopics:0];
  [(NTPBFeedPersonalizingItem *)self setPublisherTagMetadata:0];
  [(NTPBFeedPersonalizingItem *)self setFloat16TitleEncoding:0];
  [(NTPBFeedPersonalizingItem *)self setFloat16FullBodyEncoding:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedPersonalizingItem;
  [(NTPBFeedPersonalizingItem *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)clearTopicIDs
{
}

- (void)addTopicIDs:(id)a3
{
  topicIDs = self->_topicIDs;
  if (!topicIDs)
  {
    topicIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_topicIDs = topicIDs;
  }

  [(NSMutableArray *)topicIDs addObject:a3];
}

- (unint64_t)topicIDsCount
{
  return [(NSMutableArray *)self->_topicIDs count];
}

- (id)topicIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicIDs objectAtIndex:a3];
}

+ (Class)topicIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPublisherID
{
  return self->_publisherID != 0;
}

- (void)setBodyTextLength:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bodyTextLength = a3;
}

- (void)setHasBodyTextLength:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBodyTextLength
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasAudioTrack:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hasAudioTrack = a3;
}

- (void)setHasHasAudioTrack:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHasAudioTrack
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsFeatured:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isFeatured = a3;
}

- (void)setHasIsFeatured:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsFeatured
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsANF:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isANF = a3;
}

- (void)setHasIsANF:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsANF
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsPaid:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isPaid = a3;
}

- (void)setHasIsPaid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsPaid
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsBundlePaid:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isBundlePaid = a3;
}

- (void)setHasIsBundlePaid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsBundlePaid
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasVideo:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hasVideo = a3;
}

- (void)setHasHasVideo:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHasVideo
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsAIGenerated:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isAIGenerated = a3;
}

- (void)setHasIsAIGenerated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsAIGenerated
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasGlobalCohorts
{
  return self->_globalCohorts != 0;
}

- (BOOL)hasPublisherCohorts
{
  return self->_publisherCohorts != 0;
}

- (BOOL)hasGlobalConversionStats
{
  return self->_globalConversionStats != 0;
}

- (BOOL)hasPublisherConversionStats
{
  return self->_publisherConversionStats != 0;
}

- (void)clearTopics
{
}

- (void)addTopics:(id)a3
{
  topics = self->_topics;
  if (!topics)
  {
    topics = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_topics = topics;
  }

  [(NSMutableArray *)topics addObject:a3];
}

- (unint64_t)topicsCount
{
  return [(NSMutableArray *)self->_topics count];
}

- (id)topicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topics objectAtIndex:a3];
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
}

- (void)setPublishDateMilliseconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_publishDateMilliseconds = a3;
}

- (void)setHasPublishDateMilliseconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPublishDateMilliseconds
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasPublisherTagMetadata
{
  return self->_publisherTagMetadata != 0;
}

- (BOOL)hasFloat16TitleEncoding
{
  return self->_float16TitleEncoding != 0;
}

- (BOOL)hasFloat16FullBodyEncoding
{
  return self->_float16FullBodyEncoding != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedPersonalizingItem;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBFeedPersonalizingItem description](&v3, sel_description), -[NTPBFeedPersonalizingItem dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  topicIDs = self->_topicIDs;
  if (topicIDs) {
    [v4 setObject:topicIDs forKey:@"topicIDs"];
  }
  publisherID = self->_publisherID;
  if (publisherID) {
    [v4 setObject:publisherID forKey:@"publisherID"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_bodyTextLength), @"bodyTextLength");
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_44;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_hasAudioTrack), @"hasAudioTrack");
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isFeatured), @"isFeatured");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isANF), @"isANF");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPaid), @"isPaid");
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isBundlePaid), @"isBundlePaid");
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_48:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_hasVideo), @"hasVideo");
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_15:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isAIGenerated), @"isAIGenerated");
LABEL_16:
  globalCohorts = self->_globalCohorts;
  if (globalCohorts) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](globalCohorts, "dictionaryRepresentation"), @"globalCohorts");
  }
  publisherCohorts = self->_publisherCohorts;
  if (publisherCohorts) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](publisherCohorts, "dictionaryRepresentation"), @"publisherCohorts");
  }
  globalConversionStats = self->_globalConversionStats;
  if (globalConversionStats) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](globalConversionStats, "dictionaryRepresentation"), @"globalConversionStats");
  }
  publisherConversionStats = self->_publisherConversionStats;
  if (publisherConversionStats) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](publisherConversionStats, "dictionaryRepresentation"), @"publisherConversionStats");
  }
  if ([(NSMutableArray *)self->_topics count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    topics = self->_topics;
    uint64_t v15 = [(NSMutableArray *)topics countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(topics);
          }
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v16 = [(NSMutableArray *)topics countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }
    [v4 setObject:v13 forKey:@"topics"];
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_publishDateMilliseconds), @"publishDateMilliseconds");
  }
  publisherTagMetadata = self->_publisherTagMetadata;
  if (publisherTagMetadata) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata dictionaryRepresentation](publisherTagMetadata, "dictionaryRepresentation"), @"publisherTagMetadata");
  }
  float16TitleEncoding = self->_float16TitleEncoding;
  if (float16TitleEncoding) {
    [v4 setObject:float16TitleEncoding forKey:@"float16TitleEncoding"];
  }
  float16FullBodyEncoding = self->_float16FullBodyEncoding;
  if (float16FullBodyEncoding) {
    [v4 setObject:float16FullBodyEncoding forKey:@"float16FullBodyEncoding"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedPersonalizingItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  topicIDs = self->_topicIDs;
  uint64_t v5 = [(NSMutableArray *)topicIDs countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(topicIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)topicIDs countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
  if (self->_publisherID) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_14:
      if ((has & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_47;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_51:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_20:
  }
    PBDataWriterWriteBOOLField();
LABEL_21:
  if (self->_globalCohorts) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_publisherCohorts) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_globalConversionStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_publisherConversionStats) {
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  topics = self->_topics;
  uint64_t v11 = [(NSMutableArray *)topics countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(topics);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)topics countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_publisherTagMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_float16TitleEncoding) {
    PBDataWriterWriteDataField();
  }
  if (self->_float16FullBodyEncoding) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 56) = [(NSString *)self->_identifier copyWithZone:a3];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  topicIDs = self->_topicIDs;
  uint64_t v7 = [(NSMutableArray *)topicIDs countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(topicIDs);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTopicIDs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)topicIDs countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  *(void *)(v5 + 80) = [(NSString *)self->_publisherID copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_bodyTextLength;
    *(_WORD *)(v5 + 120) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 0x80) == 0) {
        goto LABEL_11;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 112) = self->_hasAudioTrack;
  *(_WORD *)(v5 + 120) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(unsigned char *)(v5 + 117) = self->_isFeatured;
  *(_WORD *)(v5 + 120) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(unsigned char *)(v5 + 115) = self->_isANF;
  *(_WORD *)(v5 + 120) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(unsigned char *)(v5 + 118) = self->_isPaid;
  *(_WORD *)(v5 + 120) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(unsigned char *)(v5 + 116) = self->_isBundlePaid;
  *(_WORD *)(v5 + 120) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  *(unsigned char *)(v5 + 113) = self->_hasVideo;
  *(_WORD *)(v5 + 120) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    *(unsigned char *)(v5 + 114) = self->_isAIGenerated;
    *(_WORD *)(v5 + 120) |= 0x10u;
  }
LABEL_17:

  *(void *)(v5 + 40) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_globalCohorts copyWithZone:a3];
  *(void *)(v5 + 64) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_publisherCohorts copyWithZone:a3];

  *(void *)(v5 + 48) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_globalConversionStats copyWithZone:a3];
  *(void *)(v5 + 72) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_publisherConversionStats copyWithZone:a3];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  topics = self->_topics;
  uint64_t v14 = [(NSMutableArray *)topics countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(topics);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v20 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addTopics:v18];
      }
      uint64_t v15 = [(NSMutableArray *)topics countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_publishDateMilliseconds;
    *(_WORD *)(v5 + 120) |= 2u;
  }

  *(void *)(v5 + 88) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)self->_publisherTagMetadata copyWithZone:a3];
  *(void *)(v5 + 32) = [(NSData *)self->_float16TitleEncoding copyWithZone:a3];

  *(void *)(v5 + 24) = [(NSData *)self->_float16FullBodyEncoding copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)a3 + 7))
  {
    int v5 = -[NSString isEqual:](identifier, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  topicIDs = self->_topicIDs;
  if ((unint64_t)topicIDs | *((void *)a3 + 12))
  {
    int v5 = -[NSMutableArray isEqual:](topicIDs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  publisherID = self->_publisherID;
  if ((unint64_t)publisherID | *((void *)a3 + 10))
  {
    int v5 = -[NSString isEqual:](publisherID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v10 = *((_WORD *)a3 + 60);
  if (has)
  {
    if ((v10 & 1) == 0 || self->_bodyTextLength != *((void *)a3 + 1)) {
      goto LABEL_65;
    }
  }
  else if (v10)
  {
    goto LABEL_65;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0) {
      goto LABEL_65;
    }
    if (self->_hasAudioTrack)
    {
      if (!*((unsigned char *)a3 + 112)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)a3 + 112))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0) {
      goto LABEL_65;
    }
    if (self->_isFeatured)
    {
      if (!*((unsigned char *)a3 + 117)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)a3 + 117))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0) {
      goto LABEL_65;
    }
    if (self->_isANF)
    {
      if (!*((unsigned char *)a3 + 115)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)a3 + 115))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 60) & 0x100) == 0) {
      goto LABEL_65;
    }
    if (self->_isPaid)
    {
      if (!*((unsigned char *)a3 + 118)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)a3 + 118))
    {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)a3 + 60) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0) {
      goto LABEL_65;
    }
    if (self->_isBundlePaid)
    {
      if (!*((unsigned char *)a3 + 116)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)a3 + 116))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0) {
      goto LABEL_65;
    }
    if (self->_hasVideo)
    {
      if (!*((unsigned char *)a3 + 113)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)a3 + 113))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0) {
      goto LABEL_65;
    }
    if (self->_isAIGenerated)
    {
      if (!*((unsigned char *)a3 + 114)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)a3 + 114))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  globalCohorts = self->_globalCohorts;
  if ((unint64_t)globalCohorts | *((void *)a3 + 5))
  {
    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](globalCohorts, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  publisherCohorts = self->_publisherCohorts;
  if ((unint64_t)publisherCohorts | *((void *)a3 + 8))
  {
    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](publisherCohorts, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  globalConversionStats = self->_globalConversionStats;
  if ((unint64_t)globalConversionStats | *((void *)a3 + 6))
  {
    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](globalConversionStats, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  publisherConversionStats = self->_publisherConversionStats;
  if ((unint64_t)publisherConversionStats | *((void *)a3 + 9))
  {
    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](publisherConversionStats, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  topics = self->_topics;
  if ((unint64_t)topics | *((void *)a3 + 13))
  {
    int v5 = -[NSMutableArray isEqual:](topics, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  __int16 v16 = *((_WORD *)a3 + 60);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_publishDateMilliseconds != *((void *)a3 + 2)) {
      goto LABEL_65;
    }
    goto LABEL_86;
  }
  if ((v16 & 2) != 0)
  {
LABEL_65:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_86:
  publisherTagMetadata = self->_publisherTagMetadata;
  if (!((unint64_t)publisherTagMetadata | *((void *)a3 + 11))
    || (int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata isEqual:](publisherTagMetadata, "isEqual:")) != 0)
  {
    float16TitleEncoding = self->_float16TitleEncoding;
    if (!((unint64_t)float16TitleEncoding | *((void *)a3 + 4))
      || (int v5 = -[NSData isEqual:](float16TitleEncoding, "isEqual:")) != 0)
    {
      float16FullBodyEncoding = self->_float16FullBodyEncoding;
      if ((unint64_t)float16FullBodyEncoding | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSData isEqual:](float16FullBodyEncoding, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v25 = [(NSString *)self->_identifier hash];
  uint64_t v24 = [(NSMutableArray *)self->_topicIDs hash];
  NSUInteger v23 = [(NSString *)self->_publisherID hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v22 = 2654435761 * self->_bodyTextLength;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v21 = 2654435761 * self->_hasAudioTrack;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v20 = 2654435761 * self->_isFeatured;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v20 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v19 = 2654435761 * self->_isANF;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    uint64_t v17 = 2654435761 * self->_isPaid;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v17 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_isBundlePaid;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v5 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v4 = 0;
  if ((has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v5 = 2654435761 * self->_hasVideo;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    uint64_t v6 = 2654435761 * self->_isAIGenerated;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
LABEL_18:
  unint64_t v7 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_globalCohorts hash];
  unint64_t v8 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_publisherCohorts hash];
  unint64_t v9 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_globalConversionStats hash];
  unint64_t v10 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_publisherConversionStats hash];
  uint64_t v11 = [(NSMutableArray *)self->_topics hash];
  if ((*(_WORD *)&self->_has & 2) != 0) {
    unint64_t v12 = 2654435761u * self->_publishDateMilliseconds;
  }
  else {
    unint64_t v12 = 0;
  }
  NSUInteger v13 = v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  unint64_t v14 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)self->_publisherTagMetadata hash];
  uint64_t v15 = v14 ^ [(NSData *)self->_float16TitleEncoding hash];
  return v13 ^ v15 ^ [(NSData *)self->_float16FullBodyEncoding hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 7)) {
    -[NTPBFeedPersonalizingItem setIdentifier:](self, "setIdentifier:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 12);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBFeedPersonalizingItem *)self addTopicIDs:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }
  if (*((void *)a3 + 10)) {
    -[NTPBFeedPersonalizingItem setPublisherID:](self, "setPublisherID:");
  }
  __int16 v10 = *((_WORD *)a3 + 60);
  if (v10)
  {
    self->_bodyTextLength = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v10 = *((_WORD *)a3 + 60);
    if ((v10 & 4) == 0)
    {
LABEL_14:
      if ((v10 & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_26;
    }
  }
  else if ((v10 & 4) == 0)
  {
    goto LABEL_14;
  }
  self->_hasAudioTrack = *((unsigned char *)a3 + 112);
  *(_WORD *)&self->_has |= 4u;
  __int16 v10 = *((_WORD *)a3 + 60);
  if ((v10 & 0x80) == 0)
  {
LABEL_15:
    if ((v10 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_isFeatured = *((unsigned char *)a3 + 117);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v10 = *((_WORD *)a3 + 60);
  if ((v10 & 0x20) == 0)
  {
LABEL_16:
    if ((v10 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_isANF = *((unsigned char *)a3 + 115);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v10 = *((_WORD *)a3 + 60);
  if ((v10 & 0x100) == 0)
  {
LABEL_17:
    if ((v10 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_isPaid = *((unsigned char *)a3 + 118);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v10 = *((_WORD *)a3 + 60);
  if ((v10 & 0x40) == 0)
  {
LABEL_18:
    if ((v10 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_isBundlePaid = *((unsigned char *)a3 + 116);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v10 = *((_WORD *)a3 + 60);
  if ((v10 & 8) == 0)
  {
LABEL_19:
    if ((v10 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_30:
  self->_hasVideo = *((unsigned char *)a3 + 113);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 60) & 0x10) != 0)
  {
LABEL_20:
    self->_isAIGenerated = *((unsigned char *)a3 + 114);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_21:
  globalCohorts = self->_globalCohorts;
  uint64_t v12 = *((void *)a3 + 5);
  if (globalCohorts)
  {
    if (v12) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](globalCohorts, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[NTPBFeedPersonalizingItem setGlobalCohorts:](self, "setGlobalCohorts:");
  }
  publisherCohorts = self->_publisherCohorts;
  uint64_t v14 = *((void *)a3 + 8);
  if (publisherCohorts)
  {
    if (v14) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](publisherCohorts, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[NTPBFeedPersonalizingItem setPublisherCohorts:](self, "setPublisherCohorts:");
  }
  globalConversionStats = self->_globalConversionStats;
  uint64_t v16 = *((void *)a3 + 6);
  if (globalConversionStats)
  {
    if (v16) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](globalConversionStats, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[NTPBFeedPersonalizingItem setGlobalConversionStats:](self, "setGlobalConversionStats:");
  }
  publisherConversionStats = self->_publisherConversionStats;
  uint64_t v18 = *((void *)a3 + 9);
  if (publisherConversionStats)
  {
    if (v18) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](publisherConversionStats, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[NTPBFeedPersonalizingItem setPublisherConversionStats:](self, "setPublisherConversionStats:");
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = (void *)*((void *)a3 + 13);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        [(NTPBFeedPersonalizingItem *)self addTopics:*(void *)(*((void *)&v26 + 1) + 8 * j)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v21);
  }
  if ((*((_WORD *)a3 + 60) & 2) != 0)
  {
    self->_publishDateMilliseconds = *((void *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  publisherTagMetadata = self->_publisherTagMetadata;
  uint64_t v25 = *((void *)a3 + 11);
  if (publisherTagMetadata)
  {
    if (v25) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata mergeFrom:](publisherTagMetadata, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[NTPBFeedPersonalizingItem setPublisherTagMetadata:](self, "setPublisherTagMetadata:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBFeedPersonalizingItem setFloat16TitleEncoding:](self, "setFloat16TitleEncoding:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBFeedPersonalizingItem setFloat16FullBodyEncoding:](self, "setFloat16FullBodyEncoding:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableArray)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
}

- (NSString)publisherID
{
  return self->_publisherID;
}

- (void)setPublisherID:(id)a3
{
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (BOOL)hasAudioTrack
{
  return self->_hasAudioTrack;
}

- (BOOL)isFeatured
{
  return self->_isFeatured;
}

- (BOOL)isANF
{
  return self->_isANF;
}

- (BOOL)isPaid
{
  return self->_isPaid;
}

- (BOOL)isBundlePaid
{
  return self->_isBundlePaid;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (BOOL)isAIGenerated
{
  return self->_isAIGenerated;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return self->_globalCohorts;
}

- (void)setGlobalCohorts:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  return self->_publisherCohorts;
}

- (void)setPublisherCohorts:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return self->_globalConversionStats;
}

- (void)setGlobalConversionStats:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  return self->_publisherConversionStats;
}

- (void)setPublisherConversionStats:(id)a3
{
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (unint64_t)publishDateMilliseconds
{
  return self->_publishDateMilliseconds;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  return self->_publisherTagMetadata;
}

- (void)setPublisherTagMetadata:(id)a3
{
}

- (NSData)float16TitleEncoding
{
  return self->_float16TitleEncoding;
}

- (void)setFloat16TitleEncoding:(id)a3
{
}

- (NSData)float16FullBodyEncoding
{
  return self->_float16FullBodyEncoding;
}

- (void)setFloat16FullBodyEncoding:(id)a3
{
}

@end