@interface PFAPreprocessorExecutionMetrics
- (BOOL)hasExecutionTimeInNs;
- (BOOL)hasProcessedMessageCount;
- (BOOL)hasStagedMessageCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PFAPreprocessorExecutionMetrics)initWithDictionary:(id)a3;
- (PFAPreprocessorExecutionMetrics)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)executionTimeInNs;
- (unint64_t)hash;
- (unsigned)processedMessageCount;
- (unsigned)stagedMessageCount;
- (void)deleteExecutionTimeInNs;
- (void)deleteProcessedMessageCount;
- (void)deleteStagedMessageCount;
- (void)setExecutionTimeInNs:(unint64_t)a3;
- (void)setHasExecutionTimeInNs:(BOOL)a3;
- (void)setHasProcessedMessageCount:(BOOL)a3;
- (void)setHasStagedMessageCount:(BOOL)a3;
- (void)setProcessedMessageCount:(unsigned int)a3;
- (void)setStagedMessageCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAPreprocessorExecutionMetrics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)processedMessageCount
{
  return self->_processedMessageCount;
}

- (unsigned)stagedMessageCount
{
  return self->_stagedMessageCount;
}

- (unint64_t)executionTimeInNs
{
  return self->_executionTimeInNs;
}

- (PFAPreprocessorExecutionMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFAPreprocessorExecutionMetrics;
  v5 = [(PFAPreprocessorExecutionMetrics *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"executionTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAPreprocessorExecutionMetrics setExecutionTimeInNs:](v5, "setExecutionTimeInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"stagedMessageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAPreprocessorExecutionMetrics setStagedMessageCount:](v5, "setStagedMessageCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"processedMessageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAPreprocessorExecutionMetrics setProcessedMessageCount:](v5, "setProcessedMessageCount:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (PFAPreprocessorExecutionMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAPreprocessorExecutionMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAPreprocessorExecutionMetrics *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PFAPreprocessorExecutionMetrics executionTimeInNs](self, "executionTimeInNs"));
    [v3 setObject:v7 forKeyedSubscript:@"executionTimeInNs"];

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
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAPreprocessorExecutionMetrics processedMessageCount](self, "processedMessageCount"));
  [v3 setObject:v8 forKeyedSubscript:@"processedMessageCount"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAPreprocessorExecutionMetrics stagedMessageCount](self, "stagedMessageCount"));
    [v3 setObject:v5 forKeyedSubscript:@"stagedMessageCount"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_executionTimeInNs;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_stagedMessageCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_processedMessageCount;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $82E73C503E51D24CD32F198C27686DFA has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t executionTimeInNs = self->_executionTimeInNs;
    if (executionTimeInNs != [v4 executionTimeInNs]) {
      goto LABEL_14;
    }
    $82E73C503E51D24CD32F198C27686DFA has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    unsigned int stagedMessageCount = self->_stagedMessageCount;
    if (stagedMessageCount == [v4 stagedMessageCount])
    {
      $82E73C503E51D24CD32F198C27686DFA has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    unsigned int processedMessageCount = self->_processedMessageCount;
    if (processedMessageCount != [v4 processedMessageCount]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return PFAPreprocessorExecutionMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteProcessedMessageCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasProcessedMessageCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProcessedMessageCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProcessedMessageCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int processedMessageCount = a3;
}

- (void)deleteStagedMessageCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasStagedMessageCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStagedMessageCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStagedMessageCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int stagedMessageCount = a3;
}

- (void)deleteExecutionTimeInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExecutionTimeInNs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExecutionTimeInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExecutionTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t executionTimeInNs = a3;
}

@end