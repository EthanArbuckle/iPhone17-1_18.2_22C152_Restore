@interface PFAPreprocessorSessionStartStatsReported
- (BOOL)hasClockIdentifier;
- (BOOL)hasMessageCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)anyEventTypeStatistics;
- (NSData)jsonData;
- (PFAPreprocessorSessionStartStatsReported)initWithDictionary:(id)a3;
- (PFAPreprocessorSessionStartStatsReported)initWithJSON:(id)a3;
- (SISchemaUUID)clockIdentifier;
- (id)anyEventTypeStatisticsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)anyEventTypeStatisticsCount;
- (unint64_t)hash;
- (unsigned)messageCount;
- (void)addAnyEventTypeStatistics:(id)a3;
- (void)clearAnyEventTypeStatistics;
- (void)deleteClockIdentifier;
- (void)deleteMessageCount;
- (void)setAnyEventTypeStatistics:(id)a3;
- (void)setClockIdentifier:(id)a3;
- (void)setHasClockIdentifier:(BOOL)a3;
- (void)setHasMessageCount:(BOOL)a3;
- (void)setMessageCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAPreprocessorSessionStartStatsReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFAPreprocessorSessionStartStatsReported;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(PFAPreprocessorSessionStartStatsReported *)self clockIdentifier];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PFAPreprocessorSessionStartStatsReported *)self deleteClockIdentifier];
  }
  v9 = [(PFAPreprocessorSessionStartStatsReported *)self anyEventTypeStatistics];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(PFAPreprocessorSessionStartStatsReported *)self setAnyEventTypeStatistics:v10];

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
  objc_storeStrong((id *)&self->_anyEventTypeStatistics, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

- (void)setHasClockIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAnyEventTypeStatistics:(id)a3
{
}

- (NSArray)anyEventTypeStatistics
{
  return self->_anyEventTypeStatistics;
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

- (PFAPreprocessorSessionStartStatsReported)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PFAPreprocessorSessionStartStatsReported;
  v5 = [(PFAPreprocessorSessionStartStatsReported *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clockIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PFAPreprocessorSessionStartStatsReported *)v5 setClockIdentifier:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"messageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAPreprocessorSessionStartStatsReported setMessageCount:](v5, "setMessageCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"anyEventTypeStatistics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v8;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[PFAAnyEventTypeStatistics alloc] initWithDictionary:v15];
              [(PFAPreprocessorSessionStartStatsReported *)v5 addAnyEventTypeStatistics:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
      }

      int v8 = v19;
    }
    v17 = v5;
  }
  return v5;
}

- (PFAPreprocessorSessionStartStatsReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAPreprocessorSessionStartStatsReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAPreprocessorSessionStartStatsReported *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_anyEventTypeStatistics count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_anyEventTypeStatistics;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"anyEventTypeStatistics"];
  }
  if (self->_clockIdentifier)
  {
    uint64_t v12 = [(PFAPreprocessorSessionStartStatsReported *)self clockIdentifier];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"clockIdentifier"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"clockIdentifier"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAPreprocessorSessionStartStatsReported messageCount](self, "messageCount"));
    [v3 setObject:v15 forKeyedSubscript:@"messageCount"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v17);
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
  return v4 ^ v3 ^ [(NSArray *)self->_anyEventTypeStatistics hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(PFAPreprocessorSessionStartStatsReported *)self clockIdentifier];
  uint64_t v6 = [v4 clockIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(PFAPreprocessorSessionStartStatsReported *)self clockIdentifier];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(PFAPreprocessorSessionStartStatsReported *)self clockIdentifier];
    id v10 = [v4 clockIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int messageCount = self->_messageCount;
    if (messageCount != [v4 messageCount]) {
      goto LABEL_15;
    }
  }
  v5 = [(PFAPreprocessorSessionStartStatsReported *)self anyEventTypeStatistics];
  uint64_t v6 = [v4 anyEventTypeStatistics];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(PFAPreprocessorSessionStartStatsReported *)self anyEventTypeStatistics];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    uint64_t v15 = [(PFAPreprocessorSessionStartStatsReported *)self anyEventTypeStatistics];
    v16 = [v4 anyEventTypeStatistics];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PFAPreprocessorSessionStartStatsReported *)self clockIdentifier];

  if (v5)
  {
    uint64_t v6 = [(PFAPreprocessorSessionStartStatsReported *)self clockIdentifier];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_anyEventTypeStatistics;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAPreprocessorSessionStartStatsReportedReadFrom(self, (uint64_t)a3);
}

- (id)anyEventTypeStatisticsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_anyEventTypeStatistics objectAtIndexedSubscript:a3];
}

- (unint64_t)anyEventTypeStatisticsCount
{
  return [(NSArray *)self->_anyEventTypeStatistics count];
}

- (void)addAnyEventTypeStatistics:(id)a3
{
  id v4 = a3;
  anyEventTypeStatistics = self->_anyEventTypeStatistics;
  id v8 = v4;
  if (!anyEventTypeStatistics)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_anyEventTypeStatistics;
    self->_anyEventTypeStatistics = v6;

    id v4 = v8;
    anyEventTypeStatistics = self->_anyEventTypeStatistics;
  }
  [(NSArray *)anyEventTypeStatistics addObject:v4];
}

- (void)clearAnyEventTypeStatistics
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