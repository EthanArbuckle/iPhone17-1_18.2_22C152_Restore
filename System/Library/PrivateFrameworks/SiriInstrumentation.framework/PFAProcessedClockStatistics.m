@interface PFAProcessedClockStatistics
- (BOOL)hasClockIdentifier;
- (BOOL)hasMessageCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)publishedEventStatistics;
- (NSArray)redactedEventStatistics;
- (NSData)jsonData;
- (PFAProcessedClockStatistics)initWithDictionary:(id)a3;
- (PFAProcessedClockStatistics)initWithJSON:(id)a3;
- (SISchemaUUID)clockIdentifier;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)publishedEventStatisticsAtIndex:(unint64_t)a3;
- (id)redactedEventStatisticsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)publishedEventStatisticsCount;
- (unint64_t)redactedEventStatisticsCount;
- (unsigned)messageCount;
- (void)addPublishedEventStatistics:(id)a3;
- (void)addRedactedEventStatistics:(id)a3;
- (void)clearPublishedEventStatistics;
- (void)clearRedactedEventStatistics;
- (void)deleteClockIdentifier;
- (void)deleteMessageCount;
- (void)setClockIdentifier:(id)a3;
- (void)setHasClockIdentifier:(BOOL)a3;
- (void)setHasMessageCount:(BOOL)a3;
- (void)setMessageCount:(unsigned int)a3;
- (void)setPublishedEventStatistics:(id)a3;
- (void)setRedactedEventStatistics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAProcessedClockStatistics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFAProcessedClockStatistics;
  v5 = [(SISchemaInstrumentationMessage *)&v14 applySensitiveConditionsPolicy:v4];
  v6 = [(PFAProcessedClockStatistics *)self clockIdentifier];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PFAProcessedClockStatistics *)self deleteClockIdentifier];
  }
  v9 = [(PFAProcessedClockStatistics *)self publishedEventStatistics];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(PFAProcessedClockStatistics *)self setPublishedEventStatistics:v10];

  v11 = [(PFAProcessedClockStatistics *)self redactedEventStatistics];
  v12 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v11 underConditions:v4];
  [(PFAProcessedClockStatistics *)self setRedactedEventStatistics:v12];

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedEventStatistics, 0);
  objc_storeStrong((id *)&self->_publishedEventStatistics, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

- (void)setHasClockIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setRedactedEventStatistics:(id)a3
{
}

- (NSArray)redactedEventStatistics
{
  return self->_redactedEventStatistics;
}

- (void)setPublishedEventStatistics:(id)a3
{
}

- (NSArray)publishedEventStatistics
{
  return self->_publishedEventStatistics;
}

- (unsigned)messageCount
{
  return self->_messageCount;
}

- (void)setClockIdentifier:(id)a3
{
}

- (SISchemaUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (PFAProcessedClockStatistics)initWithDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PFAProcessedClockStatistics;
  v5 = [(PFAProcessedClockStatistics *)&v38 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clockIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PFAProcessedClockStatistics *)v5 setClockIdentifier:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"messageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAProcessedClockStatistics setMessageCount:](v5, "setMessageCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"publishedEventStatistics"];
    objc_opt_class();
    v28 = v9;
    v29 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v35;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v35 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[PFAAnyEventTypeStatistics alloc] initWithDictionary:v15];
              [(PFAProcessedClockStatistics *)v5 addPublishedEventStatistics:v16];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v12);
      }

      v9 = v28;
      int v8 = v29;
    }
    v17 = [v4 objectForKeyedSubscript:@"redactedEventStatistics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v6;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v31;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * v22);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = [[PFAAnyEventTypeStatistics alloc] initWithDictionary:v23];
              [(PFAProcessedClockStatistics *)v5 addRedactedEventStatistics:v24];
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v20);
      }

      v6 = v27;
      v9 = v28;
      int v8 = v29;
    }
    v25 = v5;
  }
  return v5;
}

- (PFAProcessedClockStatistics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAProcessedClockStatistics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAProcessedClockStatistics *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_clockIdentifier)
  {
    id v4 = [(PFAProcessedClockStatistics *)self clockIdentifier];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clockIdentifier"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clockIdentifier"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAProcessedClockStatistics messageCount](self, "messageCount"));
    [v3 setObject:v7 forKeyedSubscript:@"messageCount"];
  }
  if ([(NSArray *)self->_publishedEventStatistics count])
  {
    int v8 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v9 = self->_publishedEventStatistics;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"publishedEventStatistics"];
  }
  if ([(NSArray *)self->_redactedEventStatistics count])
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = self->_redactedEventStatistics;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (void)v25);
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"redactedEventStatistics"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v25);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_clockIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_messageCount;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSArray *)self->_publishedEventStatistics hash];
  return v5 ^ v6 ^ [(NSArray *)self->_redactedEventStatistics hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(PFAProcessedClockStatistics *)self clockIdentifier];
  uint64_t v6 = [v4 clockIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(PFAProcessedClockStatistics *)self clockIdentifier];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PFAProcessedClockStatistics *)self clockIdentifier];
    uint64_t v10 = [v4 clockIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int messageCount = self->_messageCount;
    if (messageCount != [v4 messageCount]) {
      goto LABEL_20;
    }
  }
  unint64_t v5 = [(PFAProcessedClockStatistics *)self publishedEventStatistics];
  uint64_t v6 = [v4 publishedEventStatistics];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(PFAProcessedClockStatistics *)self publishedEventStatistics];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(PFAProcessedClockStatistics *)self publishedEventStatistics];
    v16 = [v4 publishedEventStatistics];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PFAProcessedClockStatistics *)self redactedEventStatistics];
  uint64_t v6 = [v4 redactedEventStatistics];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(PFAProcessedClockStatistics *)self redactedEventStatistics];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(PFAProcessedClockStatistics *)self redactedEventStatistics];
    uint64_t v21 = [v4 redactedEventStatistics];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PFAProcessedClockStatistics *)self clockIdentifier];

  if (v5)
  {
    uint64_t v6 = [(PFAProcessedClockStatistics *)self clockIdentifier];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_publishedEventStatistics;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_redactedEventStatistics;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAProcessedClockStatisticsReadFrom(self, (uint64_t)a3);
}

- (id)redactedEventStatisticsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_redactedEventStatistics objectAtIndexedSubscript:a3];
}

- (unint64_t)redactedEventStatisticsCount
{
  return [(NSArray *)self->_redactedEventStatistics count];
}

- (void)addRedactedEventStatistics:(id)a3
{
  id v4 = a3;
  redactedEventStatistics = self->_redactedEventStatistics;
  id v8 = v4;
  if (!redactedEventStatistics)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_redactedEventStatistics;
    self->_redactedEventStatistics = v6;

    id v4 = v8;
    redactedEventStatistics = self->_redactedEventStatistics;
  }
  [(NSArray *)redactedEventStatistics addObject:v4];
}

- (void)clearRedactedEventStatistics
{
}

- (id)publishedEventStatisticsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_publishedEventStatistics objectAtIndexedSubscript:a3];
}

- (unint64_t)publishedEventStatisticsCount
{
  return [(NSArray *)self->_publishedEventStatistics count];
}

- (void)addPublishedEventStatistics:(id)a3
{
  id v4 = a3;
  publishedEventStatistics = self->_publishedEventStatistics;
  id v8 = v4;
  if (!publishedEventStatistics)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_publishedEventStatistics;
    self->_publishedEventStatistics = v6;

    id v4 = v8;
    publishedEventStatistics = self->_publishedEventStatistics;
  }
  [(NSArray *)publishedEventStatistics addObject:v4];
}

- (void)clearPublishedEventStatistics
{
}

- (void)deleteMessageCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMessageCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessageCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMessageCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int messageCount = a3;
}

- (void)deleteClockIdentifier
{
}

- (BOOL)hasClockIdentifier
{
  return self->_clockIdentifier != 0;
}

@end