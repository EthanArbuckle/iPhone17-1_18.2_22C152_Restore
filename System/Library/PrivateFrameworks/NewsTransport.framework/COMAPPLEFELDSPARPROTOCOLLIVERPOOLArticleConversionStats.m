@interface COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats
+ (Class)topicConversionStatsType;
- (BOOL)hasChannelConversionStats;
- (BOOL)hasGlobalConversionStats;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)channelConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats;
- (NSMutableArray)topicConversionStats;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicConversionStatsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)topicConversionStatsCount;
- (void)addTopicConversionStats:(id)a3;
- (void)clearTopicConversionStats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelConversionStats:(id)a3;
- (void)setGlobalConversionStats:(id)a3;
- (void)setTopicConversionStats:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats

- (void)clearTopicConversionStats
{
}

- (void)addTopicConversionStats:(id)a3
{
  id v4 = a3;
  topicConversionStats = self->_topicConversionStats;
  id v8 = v4;
  if (!topicConversionStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicConversionStats;
    self->_topicConversionStats = v6;

    id v4 = v8;
    topicConversionStats = self->_topicConversionStats;
  }
  [(NSMutableArray *)topicConversionStats addObject:v4];
}

- (unint64_t)topicConversionStatsCount
{
  return [(NSMutableArray *)self->_topicConversionStats count];
}

- (id)topicConversionStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicConversionStats objectAtIndex:a3];
}

+ (Class)topicConversionStatsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasChannelConversionStats
{
  return self->_channelConversionStats != 0;
}

- (BOOL)hasGlobalConversionStats
{
  return self->_globalConversionStats != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats;
  id v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_topicConversionStats count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicConversionStats, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_topicConversionStats;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"topic_conversion_stats"];
  }
  channelConversionStats = self->_channelConversionStats;
  if (channelConversionStats)
  {
    v12 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)channelConversionStats dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"channel_conversion_stats"];
  }
  globalConversionStats = self->_globalConversionStats;
  if (globalConversionStats)
  {
    v14 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)globalConversionStats dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"global_conversion_stats"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStatsReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_topicConversionStats;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_channelConversionStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_globalConversionStats) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *)self topicConversionStatsCount])
  {
    [v9 clearTopicConversionStats];
    unint64_t v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *)self topicConversionStatsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *)self topicConversionStatsAtIndex:i];
        [v9 addTopicConversionStats:v7];
      }
    }
  }
  if (self->_channelConversionStats) {
    objc_msgSend(v9, "setChannelConversionStats:");
  }
  uint64_t v8 = v9;
  if (self->_globalConversionStats)
  {
    objc_msgSend(v9, "setGlobalConversionStats:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_topicConversionStats;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (void)v17);
        [v5 addTopicConversionStats:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v12 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_channelConversionStats copyWithZone:a3];
  long long v13 = (void *)v5[1];
  v5[1] = v12;

  id v14 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_globalConversionStats copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((topicConversionStats = self->_topicConversionStats, !((unint64_t)topicConversionStats | v4[3]))
     || -[NSMutableArray isEqual:](topicConversionStats, "isEqual:"))
    && ((channelConversionStats = self->_channelConversionStats, !((unint64_t)channelConversionStats | v4[1]))
     || -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](channelConversionStats, "isEqual:")))
  {
    globalConversionStats = self->_globalConversionStats;
    if ((unint64_t)globalConversionStats | v4[2]) {
      char v8 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](globalConversionStats, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_topicConversionStats hash];
  unint64_t v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_channelConversionStats hash] ^ v3;
  return v4 ^ [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_globalConversionStats hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats addTopicConversionStats:](self, "addTopicConversionStats:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  channelConversionStats = self->_channelConversionStats;
  id v11 = v4[1];
  if (channelConversionStats)
  {
    if (v11) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](channelConversionStats, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats setChannelConversionStats:](self, "setChannelConversionStats:");
  }
  globalConversionStats = self->_globalConversionStats;
  id v13 = v4[2];
  if (globalConversionStats)
  {
    if (v13) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](globalConversionStats, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats setGlobalConversionStats:](self, "setGlobalConversionStats:");
  }
}

- (NSMutableArray)topicConversionStats
{
  return self->_topicConversionStats;
}

- (void)setTopicConversionStats:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)channelConversionStats
{
  return self->_channelConversionStats;
}

- (void)setChannelConversionStats:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return self->_globalConversionStats;
}

- (void)setGlobalConversionStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicConversionStats, 0);
  objc_storeStrong((id *)&self->_globalConversionStats, 0);

  objc_storeStrong((id *)&self->_channelConversionStats, 0);
}

@end