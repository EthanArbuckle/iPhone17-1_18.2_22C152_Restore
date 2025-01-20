@interface PFAAnyEventTypeStatistics
- (BOOL)hasAnyEventType;
- (BOOL)hasMessageCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)eventStatistics;
- (NSData)jsonData;
- (PFAAnyEventTypeStatistics)initWithDictionary:(id)a3;
- (PFAAnyEventTypeStatistics)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)eventStatisticsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)anyEventType;
- (unint64_t)eventStatisticsCount;
- (unint64_t)hash;
- (unsigned)messageCount;
- (void)addEventStatistics:(id)a3;
- (void)clearEventStatistics;
- (void)deleteAnyEventType;
- (void)deleteMessageCount;
- (void)setAnyEventType:(int)a3;
- (void)setEventStatistics:(id)a3;
- (void)setHasAnyEventType:(BOOL)a3;
- (void)setHasMessageCount:(BOOL)a3;
- (void)setMessageCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAAnyEventTypeStatistics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PFAAnyEventTypeStatistics;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PFAAnyEventTypeStatistics *)self eventStatistics];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(PFAAnyEventTypeStatistics *)self setEventStatistics:v7];
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
}

- (void)setEventStatistics:(id)a3
{
}

- (NSArray)eventStatistics
{
  return self->_eventStatistics;
}

- (unsigned)messageCount
{
  return self->_messageCount;
}

- (int)anyEventType
{
  return self->_anyEventType;
}

- (PFAAnyEventTypeStatistics)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PFAAnyEventTypeStatistics;
  v5 = [(PFAAnyEventTypeStatistics *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"anyEventType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAAnyEventTypeStatistics setAnyEventType:](v5, "setAnyEventType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"messageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAAnyEventTypeStatistics setMessageCount:](v5, "setMessageCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"eventStatistics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v7;
      v19 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[PFAEventStatistics alloc] initWithDictionary:v14];
              [(PFAAnyEventTypeStatistics *)v5 addEventStatistics:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      v7 = v18;
      v6 = v19;
    }
    v16 = v5;
  }
  return v5;
}

- (PFAAnyEventTypeStatistics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAAnyEventTypeStatistics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAAnyEventTypeStatistics *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(PFAAnyEventTypeStatistics *)self anyEventType] - 1;
    if (v4 > 0x6C) {
      v5 = @"UNKNOWN_EVENT";
    }
    else {
      v5 = off_1E5EBEB78[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"anyEventType"];
  }
  if ([(NSArray *)self->_eventStatistics count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = self->_eventStatistics;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"eventStatistics"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAAnyEventTypeStatistics messageCount](self, "messageCount"));
    [v3 setObject:v14 forKeyedSubscript:@"messageCount"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_anyEventType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSArray *)self->_eventStatistics hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_messageCount;
  return v3 ^ v2 ^ [(NSArray *)self->_eventStatistics hash];
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $7CF405F5AF16EB8EECC767CCDE1A4F7F has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int anyEventType = self->_anyEventType;
    if (anyEventType != [v4 anyEventType]) {
      goto LABEL_14;
    }
    $7CF405F5AF16EB8EECC767CCDE1A4F7F has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (unsigned int messageCount = self->_messageCount, messageCount == [v4 messageCount]))
    {
      uint64_t v10 = [(PFAAnyEventTypeStatistics *)self eventStatistics];
      uint64_t v11 = [v4 eventStatistics];
      uint64_t v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(PFAAnyEventTypeStatistics *)self eventStatistics];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        uint64_t v14 = (void *)v13;
        v15 = [(PFAAnyEventTypeStatistics *)self eventStatistics];
        long long v16 = [v4 eventStatistics];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_eventStatistics;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAAnyEventTypeStatisticsReadFrom(self, (uint64_t)a3);
}

- (id)eventStatisticsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_eventStatistics objectAtIndexedSubscript:a3];
}

- (unint64_t)eventStatisticsCount
{
  return [(NSArray *)self->_eventStatistics count];
}

- (void)addEventStatistics:(id)a3
{
  id v4 = a3;
  eventStatistics = self->_eventStatistics;
  id v8 = v4;
  if (!eventStatistics)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_eventStatistics;
    self->_eventStatistics = v6;

    id v4 = v8;
    eventStatistics = self->_eventStatistics;
  }
  [(NSArray *)eventStatistics addObject:v4];
}

- (void)clearEventStatistics
{
}

- (void)deleteMessageCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMessageCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMessageCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int messageCount = a3;
}

- (void)deleteAnyEventType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAnyEventType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnyEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAnyEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int anyEventType = a3;
}

@end