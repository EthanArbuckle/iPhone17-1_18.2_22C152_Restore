@interface PLUSSchemaPLUSMediaGroundTruth
- (BOOL)hasGroundTruthId;
- (BOOL)hasGroundTruthSource;
- (BOOL)hasInferredMediaEntityAdamId;
- (BOOL)hasInferredMediaEntitylocality;
- (BOOL)hasSelectedMediaEntityAdamId;
- (BOOL)hasSelectedMediaEntitylocality;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)inferredMediaEntityAdamId;
- (NSString)selectedMediaEntityAdamId;
- (PLUSSchemaPLUSMediaGroundTruth)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSMediaGroundTruth)initWithJSON:(id)a3;
- (SISchemaUUID)groundTruthId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)groundTruthSource;
- (int)inferredMediaEntitylocality;
- (int)selectedMediaEntitylocality;
- (unint64_t)hash;
- (void)deleteGroundTruthId;
- (void)deleteGroundTruthSource;
- (void)deleteInferredMediaEntityAdamId;
- (void)deleteInferredMediaEntitylocality;
- (void)deleteSelectedMediaEntityAdamId;
- (void)deleteSelectedMediaEntitylocality;
- (void)setGroundTruthId:(id)a3;
- (void)setGroundTruthSource:(int)a3;
- (void)setHasGroundTruthId:(BOOL)a3;
- (void)setHasGroundTruthSource:(BOOL)a3;
- (void)setHasInferredMediaEntityAdamId:(BOOL)a3;
- (void)setHasInferredMediaEntitylocality:(BOOL)a3;
- (void)setHasSelectedMediaEntityAdamId:(BOOL)a3;
- (void)setHasSelectedMediaEntitylocality:(BOOL)a3;
- (void)setInferredMediaEntityAdamId:(id)a3;
- (void)setInferredMediaEntitylocality:(int)a3;
- (void)setSelectedMediaEntityAdamId:(id)a3;
- (void)setSelectedMediaEntitylocality:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSMediaGroundTruth

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSMediaGroundTruth;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteInferredMediaEntityAdamId];
  }
  if ([v4 isConditionSet:4])
  {
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteInferredMediaEntityAdamId];
  }
  if ([v4 isConditionSet:5])
  {
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteInferredMediaEntityAdamId];
  }
  if ([v4 isConditionSet:6])
  {
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteInferredMediaEntityAdamId];
  }
  if ([v4 isConditionSet:7])
  {
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteInferredMediaEntityAdamId];
  }
  v6 = [(PLUSSchemaPLUSMediaGroundTruth *)self groundTruthId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSMediaGroundTruth *)self deleteGroundTruthId];
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
  objc_storeStrong((id *)&self->_inferredMediaEntityAdamId, 0);
  objc_storeStrong((id *)&self->_selectedMediaEntityAdamId, 0);
  objc_storeStrong((id *)&self->_groundTruthId, 0);
}

- (void)setHasInferredMediaEntityAdamId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSelectedMediaEntityAdamId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasGroundTruthId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)inferredMediaEntitylocality
{
  return self->_inferredMediaEntitylocality;
}

- (int)selectedMediaEntitylocality
{
  return self->_selectedMediaEntitylocality;
}

- (void)setInferredMediaEntityAdamId:(id)a3
{
}

- (NSString)inferredMediaEntityAdamId
{
  return self->_inferredMediaEntityAdamId;
}

- (void)setSelectedMediaEntityAdamId:(id)a3
{
}

- (NSString)selectedMediaEntityAdamId
{
  return self->_selectedMediaEntityAdamId;
}

- (int)groundTruthSource
{
  return self->_groundTruthSource;
}

- (void)setGroundTruthId:(id)a3
{
}

- (SISchemaUUID)groundTruthId
{
  return self->_groundTruthId;
}

- (PLUSSchemaPLUSMediaGroundTruth)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLUSSchemaPLUSMediaGroundTruth;
  v5 = [(PLUSSchemaPLUSMediaGroundTruth *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"groundTruthId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSMediaGroundTruth *)v5 setGroundTruthId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"groundTruthSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaGroundTruth setGroundTruthSource:](v5, "setGroundTruthSource:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"selectedMediaEntityAdamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v10 = (void *)[v9 copy];
      [(PLUSSchemaPLUSMediaGroundTruth *)v5 setSelectedMediaEntityAdamId:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"inferredMediaEntityAdamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(PLUSSchemaPLUSMediaGroundTruth *)v5 setInferredMediaEntityAdamId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"selectedMediaEntitylocality"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaGroundTruth setSelectedMediaEntitylocality:](v5, "setSelectedMediaEntitylocality:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"inferredMediaEntitylocality"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaGroundTruth setInferredMediaEntitylocality:](v5, "setInferredMediaEntitylocality:", [v14 intValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSMediaGroundTruth)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSMediaGroundTruth *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSMediaGroundTruth *)self dictionaryRepresentation];
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
  if (self->_groundTruthId)
  {
    id v4 = [(PLUSSchemaPLUSMediaGroundTruth *)self groundTruthId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"groundTruthId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"groundTruthId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(PLUSSchemaPLUSMediaGroundTruth *)self groundTruthSource] - 1;
    if (v7 > 8) {
      int v8 = @"PLUSMEDIAGROUNDTRUTHSOURCE_UNKNOWN";
    }
    else {
      int v8 = off_1E5EBA760[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"groundTruthSource"];
  }
  if (self->_inferredMediaEntityAdamId)
  {
    v9 = [(PLUSSchemaPLUSMediaGroundTruth *)self inferredMediaEntityAdamId];
    objc_super v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"inferredMediaEntityAdamId"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v11 = [(PLUSSchemaPLUSMediaGroundTruth *)self inferredMediaEntitylocality] - 1;
    if (v11 > 2) {
      v12 = @"PLUSMEDIASUGGESTIONLOCALITY_UNKNOWN";
    }
    else {
      v12 = off_1E5EBA7A8[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"inferredMediaEntitylocality"];
  }
  if (self->_selectedMediaEntityAdamId)
  {
    v13 = [(PLUSSchemaPLUSMediaGroundTruth *)self selectedMediaEntityAdamId];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"selectedMediaEntityAdamId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v15 = [(PLUSSchemaPLUSMediaGroundTruth *)self selectedMediaEntitylocality] - 1;
    if (v15 > 2) {
      v16 = @"PLUSMEDIASUGGESTIONLOCALITY_UNKNOWN";
    }
    else {
      v16 = off_1E5EBA7A8[v15];
    }
    [v3 setObject:v16 forKeyedSubscript:@"selectedMediaEntitylocality"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_groundTruthId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_groundTruthSource;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_selectedMediaEntityAdamId hash];
  NSUInteger v6 = [(NSString *)self->_inferredMediaEntityAdamId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_selectedMediaEntitylocality;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_inferredMediaEntitylocality;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  NSUInteger v5 = [(PLUSSchemaPLUSMediaGroundTruth *)self groundTruthId];
  NSUInteger v6 = [v4 groundTruthId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(PLUSSchemaPLUSMediaGroundTruth *)self groundTruthId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSMediaGroundTruth *)self groundTruthId];
    objc_super v10 = [v4 groundTruthId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int groundTruthSource = self->_groundTruthSource;
    if (groundTruthSource != [v4 groundTruthSource]) {
      goto LABEL_20;
    }
  }
  NSUInteger v5 = [(PLUSSchemaPLUSMediaGroundTruth *)self selectedMediaEntityAdamId];
  NSUInteger v6 = [v4 selectedMediaEntityAdamId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(PLUSSchemaPLUSMediaGroundTruth *)self selectedMediaEntityAdamId];
  if (v13)
  {
    v14 = (void *)v13;
    unsigned int v15 = [(PLUSSchemaPLUSMediaGroundTruth *)self selectedMediaEntityAdamId];
    v16 = [v4 selectedMediaEntityAdamId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PLUSSchemaPLUSMediaGroundTruth *)self inferredMediaEntityAdamId];
  NSUInteger v6 = [v4 inferredMediaEntityAdamId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v18 = [(PLUSSchemaPLUSMediaGroundTruth *)self inferredMediaEntityAdamId];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(PLUSSchemaPLUSMediaGroundTruth *)self inferredMediaEntityAdamId];
    v21 = [v4 inferredMediaEntityAdamId];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $A3E602CA8F7F563F5D81FFC19ABBE993 has = self->_has;
  int v26 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v27 = v4[48];
  if (v26 == ((v27 >> 1) & 1))
  {
    if (v26)
    {
      int selectedMediaEntitylocality = self->_selectedMediaEntitylocality;
      if (selectedMediaEntitylocality != [v4 selectedMediaEntitylocality]) {
        goto LABEL_20;
      }
      $A3E602CA8F7F563F5D81FFC19ABBE993 has = self->_has;
      unsigned int v27 = v4[48];
    }
    int v29 = (*(unsigned int *)&has >> 2) & 1;
    if (v29 == ((v27 >> 2) & 1))
    {
      if (!v29
        || (int inferredMediaEntitylocality = self->_inferredMediaEntitylocality,
            inferredMediaEntitylocality == [v4 inferredMediaEntitylocality]))
      {
        BOOL v23 = 1;
        goto LABEL_21;
      }
    }
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PLUSSchemaPLUSMediaGroundTruth *)self groundTruthId];

  if (v4)
  {
    NSUInteger v5 = [(PLUSSchemaPLUSMediaGroundTruth *)self groundTruthId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(PLUSSchemaPLUSMediaGroundTruth *)self selectedMediaEntityAdamId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(PLUSSchemaPLUSMediaGroundTruth *)self inferredMediaEntityAdamId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = v10;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaGroundTruthReadFrom(self, (uint64_t)a3);
}

- (void)deleteInferredMediaEntitylocality
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasInferredMediaEntitylocality:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInferredMediaEntitylocality
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setInferredMediaEntitylocality:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int inferredMediaEntitylocality = a3;
}

- (void)deleteSelectedMediaEntitylocality
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSelectedMediaEntitylocality:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSelectedMediaEntitylocality
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSelectedMediaEntitylocality:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int selectedMediaEntitylocality = a3;
}

- (void)deleteInferredMediaEntityAdamId
{
}

- (BOOL)hasInferredMediaEntityAdamId
{
  return self->_inferredMediaEntityAdamId != 0;
}

- (void)deleteSelectedMediaEntityAdamId
{
}

- (BOOL)hasSelectedMediaEntityAdamId
{
  return self->_selectedMediaEntityAdamId != 0;
}

- (void)deleteGroundTruthSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasGroundTruthSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGroundTruthSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGroundTruthSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int groundTruthSource = a3;
}

- (void)deleteGroundTruthId
{
}

- (BOOL)hasGroundTruthId
{
  return self->_groundTruthId != 0;
}

@end