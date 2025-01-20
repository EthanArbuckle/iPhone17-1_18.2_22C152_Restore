@interface QDSchemaQDRetrievedTool
- (BOOL)hasSelectionCriteria;
- (BOOL)hasSessionScopedUniqueId;
- (BOOL)hasSimilarityScore;
- (BOOL)hasSubType;
- (BOOL)hasToolDefinition;
- (BOOL)hasToolId;
- (BOOL)hasToolSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)toolId;
- (QDSchemaQDRetrievedTool)initWithDictionary:(id)a3;
- (QDSchemaQDRetrievedTool)initWithJSON:(id)a3;
- (QDSchemaQDToolDefinition)toolDefinition;
- (QDSchemaQDToolSource)toolSource;
- (SISchemaUUID)sessionScopedUniqueId;
- (float)similarityScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)selectionCriteria;
- (int)subType;
- (unint64_t)hash;
- (void)deleteSelectionCriteria;
- (void)deleteSessionScopedUniqueId;
- (void)deleteSimilarityScore;
- (void)deleteSubType;
- (void)deleteToolDefinition;
- (void)deleteToolId;
- (void)deleteToolSource;
- (void)setHasSelectionCriteria:(BOOL)a3;
- (void)setHasSessionScopedUniqueId:(BOOL)a3;
- (void)setHasSimilarityScore:(BOOL)a3;
- (void)setHasSubType:(BOOL)a3;
- (void)setHasToolDefinition:(BOOL)a3;
- (void)setHasToolId:(BOOL)a3;
- (void)setHasToolSource:(BOOL)a3;
- (void)setSelectionCriteria:(int)a3;
- (void)setSessionScopedUniqueId:(id)a3;
- (void)setSimilarityScore:(float)a3;
- (void)setSubType:(int)a3;
- (void)setToolDefinition:(id)a3;
- (void)setToolId:(id)a3;
- (void)setToolSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDRetrievedTool

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)QDSchemaQDRetrievedTool;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(QDSchemaQDRetrievedTool *)self deleteToolId];
  }
  v6 = [(QDSchemaQDRetrievedTool *)self sessionScopedUniqueId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(QDSchemaQDRetrievedTool *)self deleteSessionScopedUniqueId];
  }
  v9 = [(QDSchemaQDRetrievedTool *)self toolSource];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(QDSchemaQDRetrievedTool *)self deleteToolSource];
  }
  v12 = [(QDSchemaQDRetrievedTool *)self toolDefinition];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(QDSchemaQDRetrievedTool *)self deleteToolDefinition];
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
  objc_storeStrong((id *)&self->_toolDefinition, 0);
  objc_storeStrong((id *)&self->_toolSource, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_sessionScopedUniqueId, 0);
}

- (void)setHasToolDefinition:(BOOL)a3
{
  self->_hasSessionScopedUniqueId = a3;
}

- (void)setHasToolSource:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSessionScopedUniqueId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setToolDefinition:(id)a3
{
}

- (QDSchemaQDToolDefinition)toolDefinition
{
  return self->_toolDefinition;
}

- (void)setToolSource:(id)a3
{
}

- (QDSchemaQDToolSource)toolSource
{
  return self->_toolSource;
}

- (int)selectionCriteria
{
  return self->_selectionCriteria;
}

- (float)similarityScore
{
  return self->_similarityScore;
}

- (int)subType
{
  return self->_subType;
}

- (void)setToolId:(id)a3
{
}

- (NSString)toolId
{
  return self->_toolId;
}

- (void)setSessionScopedUniqueId:(id)a3
{
}

- (SISchemaUUID)sessionScopedUniqueId
{
  return self->_sessionScopedUniqueId;
}

- (QDSchemaQDRetrievedTool)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)QDSchemaQDRetrievedTool;
  v5 = [(QDSchemaQDRetrievedTool *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sessionScopedUniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(QDSchemaQDRetrievedTool *)v5 setSessionScopedUniqueId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(QDSchemaQDRetrievedTool *)v5 setToolId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"subType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDRetrievedTool setSubType:](v5, "setSubType:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"similarityScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[QDSchemaQDRetrievedTool setSimilarityScore:](v5, "setSimilarityScore:");
    }
    v12 = [v4 objectForKeyedSubscript:@"selectionCriteria"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[QDSchemaQDRetrievedTool setSelectionCriteria:](v5, "setSelectionCriteria:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"toolSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[QDSchemaQDToolSource alloc] initWithDictionary:v13];
      [(QDSchemaQDRetrievedTool *)v5 setToolSource:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"toolDefinition"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v16 = [[QDSchemaQDToolDefinition alloc] initWithDictionary:v15];
      [(QDSchemaQDRetrievedTool *)v5 setToolDefinition:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (QDSchemaQDRetrievedTool)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDRetrievedTool *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDRetrievedTool *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v4 = [(QDSchemaQDRetrievedTool *)self selectionCriteria] - 1;
    if (v4 > 4) {
      v5 = @"QDTOOLSELECTIONCRITERIA_UNKNOWN";
    }
    else {
      v5 = off_1E5EBF800[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"selectionCriteria"];
  }
  if (self->_sessionScopedUniqueId)
  {
    v6 = [(QDSchemaQDRetrievedTool *)self sessionScopedUniqueId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"sessionScopedUniqueId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"sessionScopedUniqueId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = NSNumber;
    [(QDSchemaQDRetrievedTool *)self similarityScore];
    int v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"similarityScore"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v12 = [(QDSchemaQDRetrievedTool *)self subType] - 1;
    if (v12 > 4) {
      v13 = @"QDTOOLSUBTYPE_UNKNOWN";
    }
    else {
      v13 = off_1E5EBF828[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"subType"];
  }
  if (self->_toolDefinition)
  {
    int v14 = [(QDSchemaQDRetrievedTool *)self toolDefinition];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"toolDefinition"];
    }
    else
    {
      objc_super v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"toolDefinition"];
    }
  }
  if (self->_toolId)
  {
    v17 = [(QDSchemaQDRetrievedTool *)self toolId];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"toolId"];
  }
  if (self->_toolSource)
  {
    objc_super v19 = [(QDSchemaQDRetrievedTool *)self toolSource];
    v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"toolSource"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"toolSource"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_sessionScopedUniqueId hash];
  NSUInteger v4 = [(NSString *)self->_toolId hash];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v6 = 2654435761 * self->_subType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float similarityScore = self->_similarityScore;
  double v8 = similarityScore;
  if (similarityScore < 0.0) {
    double v8 = -similarityScore;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_11:
  if ((has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_selectionCriteria;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ [(QDSchemaQDToolSource *)self->_toolSource hash];
  return v13 ^ [(QDSchemaQDToolDefinition *)self->_toolDefinition hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  v5 = [(QDSchemaQDRetrievedTool *)self sessionScopedUniqueId];
  uint64_t v6 = [v4 sessionScopedUniqueId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v7 = [(QDSchemaQDRetrievedTool *)self sessionScopedUniqueId];
  if (v7)
  {
    double v8 = (void *)v7;
    long double v9 = [(QDSchemaQDRetrievedTool *)self sessionScopedUniqueId];
    double v10 = [v4 sessionScopedUniqueId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  v5 = [(QDSchemaQDRetrievedTool *)self toolId];
  uint64_t v6 = [v4 toolId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v12 = [(QDSchemaQDRetrievedTool *)self toolId];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    int v14 = [(QDSchemaQDRetrievedTool *)self toolId];
    v15 = [v4 toolId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  $9C86F590E7F408A2919FD610F48BCB0E has = self->_has;
  unsigned int v18 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_33;
  }
  if (*(unsigned char *)&has)
  {
    int subType = self->_subType;
    if (subType != [v4 subType]) {
      goto LABEL_33;
    }
    $9C86F590E7F408A2919FD610F48BCB0E has = self->_has;
    unsigned int v18 = v4[56];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_33;
  }
  if (v20)
  {
    float similarityScore = self->_similarityScore;
    [v4 similarityScore];
    if (similarityScore != v22) {
      goto LABEL_33;
    }
    $9C86F590E7F408A2919FD610F48BCB0E has = self->_has;
    unsigned int v18 = v4[56];
  }
  int v23 = (*(unsigned int *)&has >> 2) & 1;
  if (v23 != ((v18 >> 2) & 1)) {
    goto LABEL_33;
  }
  if (v23)
  {
    int selectionCriteria = self->_selectionCriteria;
    if (selectionCriteria != [v4 selectionCriteria]) {
      goto LABEL_33;
    }
  }
  v5 = [(QDSchemaQDRetrievedTool *)self toolSource];
  uint64_t v6 = [v4 toolSource];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v25 = [(QDSchemaQDRetrievedTool *)self toolSource];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(QDSchemaQDRetrievedTool *)self toolSource];
    v28 = [v4 toolSource];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  v5 = [(QDSchemaQDRetrievedTool *)self toolDefinition];
  uint64_t v6 = [v4 toolDefinition];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v30 = [(QDSchemaQDRetrievedTool *)self toolDefinition];
  if (!v30)
  {

LABEL_36:
    BOOL v35 = 1;
    goto LABEL_34;
  }
  v31 = (void *)v30;
  v32 = [(QDSchemaQDRetrievedTool *)self toolDefinition];
  v33 = [v4 toolDefinition];
  char v34 = [v32 isEqual:v33];

  if (v34) {
    goto LABEL_36;
  }
LABEL_33:
  BOOL v35 = 0;
LABEL_34:

  return v35;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  NSUInteger v4 = [(QDSchemaQDRetrievedTool *)self sessionScopedUniqueId];

  if (v4)
  {
    v5 = [(QDSchemaQDRetrievedTool *)self sessionScopedUniqueId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(QDSchemaQDRetrievedTool *)self toolId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
  double v8 = [(QDSchemaQDRetrievedTool *)self toolSource];

  if (v8)
  {
    long double v9 = [(QDSchemaQDRetrievedTool *)self toolSource];
    PBDataWriterWriteSubmessage();
  }
  double v10 = [(QDSchemaQDRetrievedTool *)self toolDefinition];

  int v11 = v13;
  if (v10)
  {
    uint64_t v12 = [(QDSchemaQDRetrievedTool *)self toolDefinition];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDRetrievedToolReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteToolDefinition
{
}

- (BOOL)hasToolDefinition
{
  return self->_toolDefinition != 0;
}

- (void)deleteToolSource
{
}

- (BOOL)hasToolSource
{
  return self->_toolSource != 0;
}

- (void)deleteSelectionCriteria
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSelectionCriteria:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSelectionCriteria
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSelectionCriteria:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int selectionCriteria = a3;
}

- (void)deleteSimilarityScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSimilarityScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSimilarityScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSimilarityScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float similarityScore = a3;
}

- (void)deleteSubType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSubType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSubType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int subType = a3;
}

- (void)deleteToolId
{
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteSessionScopedUniqueId
{
}

- (BOOL)hasSessionScopedUniqueId
{
  return self->_sessionScopedUniqueId != 0;
}

@end