@interface FLOWSchemaFLOWWebAnswerExecution
- (BOOL)hasAllowListType;
- (BOOL)hasAnswerClass;
- (BOOL)hasAnswerType;
- (BOOL)hasFuzzyMatchType;
- (BOOL)hasQuality;
- (BOOL)hasSubDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWWebAnswerExecution)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWWebAnswerExecution)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)allowListType;
- (unsigned)answerClass;
- (unsigned)answerType;
- (unsigned)fuzzyMatchType;
- (unsigned)quality;
- (unsigned)subDomain;
- (void)deleteAllowListType;
- (void)deleteAnswerClass;
- (void)deleteAnswerType;
- (void)deleteFuzzyMatchType;
- (void)deleteQuality;
- (void)deleteSubDomain;
- (void)setAllowListType:(unsigned int)a3;
- (void)setAnswerClass:(unsigned int)a3;
- (void)setAnswerType:(unsigned int)a3;
- (void)setFuzzyMatchType:(unsigned int)a3;
- (void)setHasAllowListType:(BOOL)a3;
- (void)setHasAnswerClass:(BOOL)a3;
- (void)setHasAnswerType:(BOOL)a3;
- (void)setHasFuzzyMatchType:(BOOL)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasSubDomain:(BOOL)a3;
- (void)setQuality:(unsigned int)a3;
- (void)setSubDomain:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWWebAnswerExecution

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)answerClass
{
  return self->_answerClass;
}

- (unsigned)quality
{
  return self->_quality;
}

- (unsigned)subDomain
{
  return self->_subDomain;
}

- (unsigned)fuzzyMatchType
{
  return self->_fuzzyMatchType;
}

- (unsigned)allowListType
{
  return self->_allowListType;
}

- (unsigned)answerType
{
  return self->_answerType;
}

- (FLOWSchemaFLOWWebAnswerExecution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FLOWSchemaFLOWWebAnswerExecution;
  v5 = [(FLOWSchemaFLOWWebAnswerExecution *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"answerType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWWebAnswerExecution setAnswerType:](v5, "setAnswerType:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"allowListType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWWebAnswerExecution setAllowListType:](v5, "setAllowListType:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"fuzzyMatchType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWWebAnswerExecution setFuzzyMatchType:](v5, "setFuzzyMatchType:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"subDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWWebAnswerExecution setSubDomain:](v5, "setSubDomain:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"quality"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWWebAnswerExecution setQuality:](v5, "setQuality:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"answerClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWWebAnswerExecution setAnswerClass:](v5, "setAnswerClass:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWWebAnswerExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWWebAnswerExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWWebAnswerExecution *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWWebAnswerExecution allowListType](self, "allowListType"));
    [v3 setObject:v7 forKeyedSubscript:@"allowListType"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWWebAnswerExecution answerClass](self, "answerClass"));
  [v3 setObject:v8 forKeyedSubscript:@"answerClass"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWWebAnswerExecution answerType](self, "answerType"));
  [v3 setObject:v9 forKeyedSubscript:@"answerType"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWWebAnswerExecution fuzzyMatchType](self, "fuzzyMatchType"));
  [v3 setObject:v10 forKeyedSubscript:@"fuzzyMatchType"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWWebAnswerExecution quality](self, "quality"));
  [v3 setObject:v11 forKeyedSubscript:@"quality"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWWebAnswerExecution subDomain](self, "subDomain"));
    [v3 setObject:v5 forKeyedSubscript:@"subDomain"];
  }
LABEL_8:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_answerType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_allowListType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_fuzzyMatchType;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_subDomain;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_quality;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_answerClass;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $97B47641F222FDC7C3951FF0B8ED4CDB has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int answerType = self->_answerType;
    if (answerType != [v4 answerType]) {
      goto LABEL_26;
    }
    $97B47641F222FDC7C3951FF0B8ED4CDB has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v8)
  {
    unsigned int allowListType = self->_allowListType;
    if (allowListType != [v4 allowListType]) {
      goto LABEL_26;
    }
    $97B47641F222FDC7C3951FF0B8ED4CDB has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v10)
  {
    unsigned int fuzzyMatchType = self->_fuzzyMatchType;
    if (fuzzyMatchType != [v4 fuzzyMatchType]) {
      goto LABEL_26;
    }
    $97B47641F222FDC7C3951FF0B8ED4CDB has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    unsigned int subDomain = self->_subDomain;
    if (subDomain != [v4 subDomain]) {
      goto LABEL_26;
    }
    $97B47641F222FDC7C3951FF0B8ED4CDB has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v14)
  {
    unsigned int quality = self->_quality;
    if (quality == [v4 quality])
    {
      $97B47641F222FDC7C3951FF0B8ED4CDB has = self->_has;
      unsigned int v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    BOOL v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_26;
  }
  if (v16)
  {
    unsigned int answerClass = self->_answerClass;
    if (answerClass != [v4 answerClass]) {
      goto LABEL_26;
    }
  }
  BOOL v18 = 1;
LABEL_27:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWWebAnswerExecutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteAnswerClass
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasAnswerClass:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAnswerClass
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAnswerClass:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int answerClass = a3;
}

- (void)deleteQuality
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasQuality
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setQuality:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int quality = a3;
}

- (void)deleteSubDomain
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasSubDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSubDomain
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSubDomain:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int subDomain = a3;
}

- (void)deleteFuzzyMatchType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasFuzzyMatchType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFuzzyMatchType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFuzzyMatchType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int fuzzyMatchType = a3;
}

- (void)deleteAllowListType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAllowListType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAllowListType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAllowListType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int allowListType = a3;
}

- (void)deleteAnswerType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAnswerType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnswerType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAnswerType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int answerType = a3;
}

@end