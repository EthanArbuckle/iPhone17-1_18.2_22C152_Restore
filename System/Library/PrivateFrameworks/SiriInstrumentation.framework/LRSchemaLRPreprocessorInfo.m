@interface LRSchemaLRPreprocessorInfo
- (BOOL)bootSessionUUIDChanged;
- (BOOL)hasBootSessionUUIDChanged;
- (BOOL)hasPreProcessorTriggerReason;
- (BOOL)hasPreProcessorTriggerTimeNanosecondsSinceBoot;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LRSchemaLRPreprocessorInfo)initWithDictionary:(id)a3;
- (LRSchemaLRPreprocessorInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)preProcessorTriggerReason;
- (unint64_t)hash;
- (unint64_t)preProcessorTriggerTimeNanosecondsSinceBoot;
- (void)deleteBootSessionUUIDChanged;
- (void)deletePreProcessorTriggerReason;
- (void)deletePreProcessorTriggerTimeNanosecondsSinceBoot;
- (void)setBootSessionUUIDChanged:(BOOL)a3;
- (void)setHasBootSessionUUIDChanged:(BOOL)a3;
- (void)setHasPreProcessorTriggerReason:(BOOL)a3;
- (void)setHasPreProcessorTriggerTimeNanosecondsSinceBoot:(BOOL)a3;
- (void)setPreProcessorTriggerReason:(int)a3;
- (void)setPreProcessorTriggerTimeNanosecondsSinceBoot:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation LRSchemaLRPreprocessorInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)preProcessorTriggerReason
{
  return self->_preProcessorTriggerReason;
}

- (BOOL)bootSessionUUIDChanged
{
  return self->_bootSessionUUIDChanged;
}

- (unint64_t)preProcessorTriggerTimeNanosecondsSinceBoot
{
  return self->_preProcessorTriggerTimeNanosecondsSinceBoot;
}

- (LRSchemaLRPreprocessorInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LRSchemaLRPreprocessorInfo;
  v5 = [(LRSchemaLRPreprocessorInfo *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"preProcessorTriggerTimeNanosecondsSinceBoot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRPreprocessorInfo setPreProcessorTriggerTimeNanosecondsSinceBoot:](v5, "setPreProcessorTriggerTimeNanosecondsSinceBoot:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"bootSessionUUIDChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRPreprocessorInfo setBootSessionUUIDChanged:](v5, "setBootSessionUUIDChanged:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"preProcessorTriggerReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRPreprocessorInfo setPreProcessorTriggerReason:](v5, "setPreProcessorTriggerReason:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (LRSchemaLRPreprocessorInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LRSchemaLRPreprocessorInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LRSchemaLRPreprocessorInfo *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[LRSchemaLRPreprocessorInfo bootSessionUUIDChanged](self, "bootSessionUUIDChanged"));
    [v3 setObject:v7 forKeyedSubscript:@"bootSessionUUIDChanged"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v8 = [(LRSchemaLRPreprocessorInfo *)self preProcessorTriggerReason] - 1;
  if (v8 > 2) {
    v9 = @"LRPREPROCESSORTRIGGERREASON_UNKNOWN";
  }
  else {
    v9 = off_1E5EBCD90[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"preProcessorTriggerReason"];
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[LRSchemaLRPreprocessorInfo preProcessorTriggerTimeNanosecondsSinceBoot](self, "preProcessorTriggerTimeNanosecondsSinceBoot"));
  [v3 setObject:v5 forKeyedSubscript:@"preProcessorTriggerTimeNanosecondsSinceBoot"];

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
  unint64_t v2 = 2654435761u * self->_preProcessorTriggerTimeNanosecondsSinceBoot;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_bootSessionUUIDChanged;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_preProcessorTriggerReason;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $CF844E95485F655B844BD29E1E8848D3 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t preProcessorTriggerTimeNanosecondsSinceBoot = self->_preProcessorTriggerTimeNanosecondsSinceBoot;
    if (preProcessorTriggerTimeNanosecondsSinceBoot != [v4 preProcessorTriggerTimeNanosecondsSinceBoot]) {
      goto LABEL_14;
    }
    $CF844E95485F655B844BD29E1E8848D3 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int bootSessionUUIDChanged = self->_bootSessionUUIDChanged;
    if (bootSessionUUIDChanged == [v4 bootSessionUUIDChanged])
    {
      $CF844E95485F655B844BD29E1E8848D3 has = self->_has;
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
    int preProcessorTriggerReason = self->_preProcessorTriggerReason;
    if (preProcessorTriggerReason != [v4 preProcessorTriggerReason]) {
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
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRPreprocessorInfoReadFrom(self, (uint64_t)a3);
}

- (void)deletePreProcessorTriggerReason
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPreProcessorTriggerReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPreProcessorTriggerReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPreProcessorTriggerReason:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int preProcessorTriggerReason = a3;
}

- (void)deleteBootSessionUUIDChanged
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasBootSessionUUIDChanged:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBootSessionUUIDChanged
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBootSessionUUIDChanged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int bootSessionUUIDChanged = a3;
}

- (void)deletePreProcessorTriggerTimeNanosecondsSinceBoot
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPreProcessorTriggerTimeNanosecondsSinceBoot:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPreProcessorTriggerTimeNanosecondsSinceBoot
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPreProcessorTriggerTimeNanosecondsSinceBoot:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t preProcessorTriggerTimeNanosecondsSinceBoot = a3;
}

@end