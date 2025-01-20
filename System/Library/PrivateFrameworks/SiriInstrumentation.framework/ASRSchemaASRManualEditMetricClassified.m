@interface ASRSchemaASRManualEditMetricClassified
- (ASRSchemaASRManualEditMetricClassified)initWithDictionary:(id)a3;
- (ASRSchemaASRManualEditMetricClassified)initWithJSON:(id)a3;
- (BOOL)hasNumDeletions;
- (BOOL)hasNumInsertions;
- (BOOL)hasNumSubstitutions;
- (BOOL)hasOriginalAsrId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)originalAsrId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)numDeletions;
- (int)numInsertions;
- (int)numSubstitutions;
- (unint64_t)hash;
- (void)deleteNumDeletions;
- (void)deleteNumInsertions;
- (void)deleteNumSubstitutions;
- (void)deleteOriginalAsrId;
- (void)setHasNumDeletions:(BOOL)a3;
- (void)setHasNumInsertions:(BOOL)a3;
- (void)setHasNumSubstitutions:(BOOL)a3;
- (void)setHasOriginalAsrId:(BOOL)a3;
- (void)setNumDeletions:(int)a3;
- (void)setNumInsertions:(int)a3;
- (void)setNumSubstitutions:(int)a3;
- (void)setOriginalAsrId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRManualEditMetricClassified

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASRSchemaASRManualEditMetricClassified;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRManualEditMetricClassified *)self originalAsrId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ASRSchemaASRManualEditMetricClassified *)self deleteOriginalAsrId];
  }
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

- (void)setHasOriginalAsrId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)numSubstitutions
{
  return self->_numSubstitutions;
}

- (int)numInsertions
{
  return self->_numInsertions;
}

- (int)numDeletions
{
  return self->_numDeletions;
}

- (void)setOriginalAsrId:(id)a3
{
}

- (SISchemaUUID)originalAsrId
{
  return self->_originalAsrId;
}

- (ASRSchemaASRManualEditMetricClassified)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASRSchemaASRManualEditMetricClassified;
  v5 = [(ASRSchemaASRManualEditMetricClassified *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalAsrId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRManualEditMetricClassified *)v5 setOriginalAsrId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"numDeletions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRManualEditMetricClassified setNumDeletions:](v5, "setNumDeletions:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"numInsertions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRManualEditMetricClassified setNumInsertions:](v5, "setNumInsertions:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numSubstitutions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRManualEditMetricClassified setNumSubstitutions:](v5, "setNumSubstitutions:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (ASRSchemaASRManualEditMetricClassified)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRManualEditMetricClassified *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRManualEditMetricClassified *)self dictionaryRepresentation];
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
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[ASRSchemaASRManualEditMetricClassified numDeletions](self, "numDeletions"));
    [v3 setObject:v8 forKeyedSubscript:@"numDeletions"];

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
  objc_super v9 = objc_msgSend(NSNumber, "numberWithInt:", -[ASRSchemaASRManualEditMetricClassified numInsertions](self, "numInsertions"));
  [v3 setObject:v9 forKeyedSubscript:@"numInsertions"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[ASRSchemaASRManualEditMetricClassified numSubstitutions](self, "numSubstitutions"));
    [v3 setObject:v5 forKeyedSubscript:@"numSubstitutions"];
  }
LABEL_5:
  if (self->_originalAsrId)
  {
    v6 = [(ASRSchemaASRManualEditMetricClassified *)self originalAsrId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"originalAsrId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"originalAsrId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalAsrId hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_numDeletions;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_numInsertions;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_numSubstitutions;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(ASRSchemaASRManualEditMetricClassified *)self originalAsrId];
  uint64_t v6 = [v4 originalAsrId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(ASRSchemaASRManualEditMetricClassified *)self originalAsrId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(ASRSchemaASRManualEditMetricClassified *)self originalAsrId];
    v11 = [v4 originalAsrId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $0733EC0DBCA0A975667092FC7B87D45A has = self->_has;
  unsigned int v14 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    int numDeletions = self->_numDeletions;
    if (numDeletions != [v4 numDeletions]) {
      goto LABEL_20;
    }
    $0733EC0DBCA0A975667092FC7B87D45A has = self->_has;
    unsigned int v14 = v4[28];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    int numInsertions = self->_numInsertions;
    if (numInsertions == [v4 numInsertions])
    {
      $0733EC0DBCA0A975667092FC7B87D45A has = self->_has;
      unsigned int v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    int numSubstitutions = self->_numSubstitutions;
    if (numSubstitutions != [v4 numSubstitutions]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ASRSchemaASRManualEditMetricClassified *)self originalAsrId];

  if (v4)
  {
    uint64_t v5 = [(ASRSchemaASRManualEditMetricClassified *)self originalAsrId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRManualEditMetricClassifiedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumSubstitutions
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumSubstitutions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSubstitutions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumSubstitutions:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int numSubstitutions = a3;
}

- (void)deleteNumInsertions
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumInsertions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumInsertions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumInsertions:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int numInsertions = a3;
}

- (void)deleteNumDeletions
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumDeletions:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumDeletions
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumDeletions:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int numDeletions = a3;
}

- (void)deleteOriginalAsrId
{
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

@end