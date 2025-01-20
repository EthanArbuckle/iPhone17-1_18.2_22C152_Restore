@interface COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores
+ (Class)topicCohortScoresType;
+ (Class)topicCohortsType;
- (BOOL)hasGlobalCohorts;
- (BOOL)hasSourceChannelCohorts;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)sourceChannelCohorts;
- (NSMutableArray)topicCohortScores;
- (NSMutableArray)topicCohorts;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicCohortScoresAtIndex:(unint64_t)a3;
- (id)topicCohortsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)topicCohortScoresCount;
- (unint64_t)topicCohortsCount;
- (void)addTopicCohortScores:(id)a3;
- (void)addTopicCohorts:(id)a3;
- (void)clearTopicCohortScores;
- (void)clearTopicCohorts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGlobalCohorts:(id)a3;
- (void)setSourceChannelCohorts:(id)a3;
- (void)setTopicCohortScores:(id)a3;
- (void)setTopicCohorts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores

- (void)addTopicCohorts:(id)a3
{
  id v4 = a3;
  topicCohorts = self->_topicCohorts;
  id v8 = v4;
  if (!topicCohorts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicCohorts;
    self->_topicCohorts = v6;

    id v4 = v8;
    topicCohorts = self->_topicCohorts;
  }
  [(NSMutableArray *)topicCohorts addObject:v4];
}

- (void)clearTopicCohorts
{
}

- (unint64_t)topicCohortsCount
{
  return [(NSMutableArray *)self->_topicCohorts count];
}

- (id)topicCohortsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicCohorts objectAtIndex:a3];
}

+ (Class)topicCohortsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGlobalCohorts
{
  return self->_globalCohorts != 0;
}

- (BOOL)hasSourceChannelCohorts
{
  return self->_sourceChannelCohorts != 0;
}

- (void)clearTopicCohortScores
{
}

- (void)addTopicCohortScores:(id)a3
{
  id v4 = a3;
  topicCohortScores = self->_topicCohortScores;
  id v8 = v4;
  if (!topicCohortScores)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicCohortScores;
    self->_topicCohortScores = v6;

    id v4 = v8;
    topicCohortScores = self->_topicCohortScores;
  }
  [(NSMutableArray *)topicCohortScores addObject:v4];
}

- (unint64_t)topicCohortScoresCount
{
  return [(NSMutableArray *)self->_topicCohortScores count];
}

- (id)topicCohortScoresAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicCohortScores objectAtIndex:a3];
}

+ (Class)topicCohortScoresType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores;
  id v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_topicCohorts count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicCohorts, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v5 = self->_topicCohorts;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"topic_cohorts"];
  }
  globalCohorts = self->_globalCohorts;
  if (globalCohorts)
  {
    v12 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)globalCohorts dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"global_cohorts"];
  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  if (sourceChannelCohorts)
  {
    v14 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)sourceChannelCohorts dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"source_channel_cohorts"];
  }
  if ([(NSMutableArray *)self->_topicCohortScores count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicCohortScores, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v16 = self->_topicCohortScores;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (void)v23);
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"topic_cohort_scores"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScoresReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_topicCohorts;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_globalCohorts) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sourceChannelCohorts) {
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_topicCohortScores;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self topicCohortsCount])
  {
    [v12 clearTopicCohorts];
    unint64_t v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self topicCohortsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self topicCohortsAtIndex:i];
        [v12 addTopicCohorts:v7];
      }
    }
  }
  if (self->_globalCohorts) {
    objc_msgSend(v12, "setGlobalCohorts:");
  }
  if (self->_sourceChannelCohorts) {
    objc_msgSend(v12, "setSourceChannelCohorts:");
  }
  if ([(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self topicCohortScoresCount])
  {
    [v12 clearTopicCohortScores];
    unint64_t v8 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self topicCohortScoresCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self topicCohortScoresAtIndex:j];
        [v12 addTopicCohortScores:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = self->_topicCohorts;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addTopicCohorts:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  id v12 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_globalCohorts copyWithZone:a3];
  uint64_t v13 = (void *)v5[1];
  v5[1] = v12;

  id v14 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_sourceChannelCohorts copyWithZone:a3];
  long long v15 = (void *)v5[2];
  v5[2] = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_topicCohortScores;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (void)v23);
        [v5 addTopicCohortScores:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((topicCohorts = self->_topicCohorts, !((unint64_t)topicCohorts | v4[4]))
     || -[NSMutableArray isEqual:](topicCohorts, "isEqual:"))
    && ((globalCohorts = self->_globalCohorts, !((unint64_t)globalCohorts | v4[1]))
     || -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](globalCohorts, "isEqual:"))
    && ((sourceChannelCohorts = self->_sourceChannelCohorts, !((unint64_t)sourceChannelCohorts | v4[2]))
     || -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](sourceChannelCohorts, "isEqual:")))
  {
    topicCohortScores = self->_topicCohortScores;
    if ((unint64_t)topicCohortScores | v4[3]) {
      char v9 = -[NSMutableArray isEqual:](topicCohortScores, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_topicCohorts hash];
  unint64_t v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_globalCohorts hash] ^ v3;
  unint64_t v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_sourceChannelCohorts hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_topicCohortScores hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self addTopicCohorts:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  globalCohorts = self->_globalCohorts;
  id v11 = v4[1];
  if (globalCohorts)
  {
    if (v11) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](globalCohorts, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores setGlobalCohorts:](self, "setGlobalCohorts:");
  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  id v13 = v4[2];
  if (sourceChannelCohorts)
  {
    if (v13) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](sourceChannelCohorts, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores setSourceChannelCohorts:](self, "setSourceChannelCohorts:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v4[3];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores addTopicCohortScores:](self, "addTopicCohortScores:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (NSMutableArray)topicCohorts
{
  return self->_topicCohorts;
}

- (void)setTopicCohorts:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return self->_globalCohorts;
}

- (void)setGlobalCohorts:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)sourceChannelCohorts
{
  return self->_sourceChannelCohorts;
}

- (void)setSourceChannelCohorts:(id)a3
{
}

- (NSMutableArray)topicCohortScores
{
  return self->_topicCohortScores;
}

- (void)setTopicCohortScores:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicCohorts, 0);
  objc_storeStrong((id *)&self->_topicCohortScores, 0);
  objc_storeStrong((id *)&self->_sourceChannelCohorts, 0);

  objc_storeStrong((id *)&self->_globalCohorts, 0);
}

@end