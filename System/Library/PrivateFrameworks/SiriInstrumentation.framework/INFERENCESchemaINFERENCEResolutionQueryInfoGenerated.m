@interface INFERENCESchemaINFERENCEResolutionQueryInfoGenerated
- (BOOL)hasForcePromptType;
- (BOOL)hasOriginalResolutionContextId;
- (BOOL)hasQueryId;
- (BOOL)hasRecommenderModelVersion;
- (BOOL)hasResolutionState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated)initWithJSON:(id)a3;
- (NSArray)anonymizedRecommendedEntityIdentifiers;
- (NSData)jsonData;
- (NSString)recommenderModelVersion;
- (SISchemaUUID)originalResolutionContextId;
- (SISchemaUUID)queryId;
- (id)anonymizedRecommendedEntityIdentifierAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)forcePromptType;
- (int)resolutionState;
- (unint64_t)anonymizedRecommendedEntityIdentifierCount;
- (unint64_t)hash;
- (void)addAnonymizedRecommendedEntityIdentifier:(id)a3;
- (void)clearAnonymizedRecommendedEntityIdentifier;
- (void)deleteForcePromptType;
- (void)deleteOriginalResolutionContextId;
- (void)deleteQueryId;
- (void)deleteRecommenderModelVersion;
- (void)deleteResolutionState;
- (void)setAnonymizedRecommendedEntityIdentifiers:(id)a3;
- (void)setForcePromptType:(int)a3;
- (void)setHasForcePromptType:(BOOL)a3;
- (void)setHasOriginalResolutionContextId:(BOOL)a3;
- (void)setHasQueryId:(BOOL)a3;
- (void)setHasRecommenderModelVersion:(BOOL)a3;
- (void)setHasResolutionState:(BOOL)a3;
- (void)setOriginalResolutionContextId:(id)a3;
- (void)setQueryId:(id)a3;
- (void)setRecommenderModelVersion:(id)a3;
- (void)setResolutionState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEResolutionQueryInfoGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCEResolutionQueryInfoGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self originalResolutionContextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self deleteOriginalResolutionContextId];
  }
  v9 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self queryId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self deleteQueryId];
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
  objc_storeStrong((id *)&self->_anonymizedRecommendedEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_recommenderModelVersion, 0);
  objc_storeStrong((id *)&self->_queryId, 0);
  objc_storeStrong((id *)&self->_originalResolutionContextId, 0);
}

- (void)setHasRecommenderModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasQueryId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOriginalResolutionContextId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAnonymizedRecommendedEntityIdentifiers:(id)a3
{
}

- (NSArray)anonymizedRecommendedEntityIdentifiers
{
  return self->_anonymizedRecommendedEntityIdentifiers;
}

- (void)setRecommenderModelVersion:(id)a3
{
}

- (NSString)recommenderModelVersion
{
  return self->_recommenderModelVersion;
}

- (int)forcePromptType
{
  return self->_forcePromptType;
}

- (int)resolutionState
{
  return self->_resolutionState;
}

- (void)setQueryId:(id)a3
{
}

- (SISchemaUUID)queryId
{
  return self->_queryId;
}

- (void)setOriginalResolutionContextId:(id)a3
{
}

- (SISchemaUUID)originalResolutionContextId
{
  return self->_originalResolutionContextId;
}

- (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated)initWithDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)INFERENCESchemaINFERENCEResolutionQueryInfoGenerated;
  v5 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)&v32 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalResolutionContextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)v5 setOriginalResolutionContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"queryId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)v5 setQueryId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"resolutionState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setResolutionState:](v5, "setResolutionState:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"forcePromptType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setForcePromptType:](v5, "setForcePromptType:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"recommenderModelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)v5 setRecommenderModelVersion:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"anonymizedRecommendedEntityIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v11;
      v25 = v10;
      v26 = v8;
      v27 = v6;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v28 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = (void *)[v20 copy];
              [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)v5 addAnonymizedRecommendedEntityIdentifier:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v17);
      }

      int v8 = v26;
      v6 = v27;
      int v11 = v24;
      v10 = v25;
    }
    v22 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self dictionaryRepresentation];
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
  if (self->_anonymizedRecommendedEntityIdentifiers)
  {
    id v4 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self anonymizedRecommendedEntityIdentifiers];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"anonymizedRecommendedEntityIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v6 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self forcePromptType] - 1;
    if (v6 > 7) {
      uint64_t v7 = @"INFERENCEFORCEPROMPTTYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB0F18[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"forcePromptType"];
  }
  if (self->_originalResolutionContextId)
  {
    int v8 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self originalResolutionContextId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"originalResolutionContextId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"originalResolutionContextId"];
    }
  }
  if (self->_queryId)
  {
    int v11 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self queryId];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"queryId"];
    }
    else
    {
      objc_super v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"queryId"];
    }
  }
  if (self->_recommenderModelVersion)
  {
    v14 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self recommenderModelVersion];
    id v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"recommenderModelVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v16 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self resolutionState] - 1;
    if (v16 > 3) {
      uint64_t v17 = @"INFERENCERESOLUTIONSTATE_UNKNOWN";
    }
    else {
      uint64_t v17 = off_1E5EB0F58[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"resolutionState"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalResolutionContextId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_queryId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_resolutionState;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_forcePromptType;
LABEL_6:
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_recommenderModelVersion hash];
  return v7 ^ [(NSArray *)self->_anonymizedRecommendedEntityIdentifiers hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self originalResolutionContextId];
  uint64_t v6 = [v4 originalResolutionContextId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self originalResolutionContextId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self originalResolutionContextId];
    v10 = [v4 originalResolutionContextId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self queryId];
  uint64_t v6 = [v4 queryId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v12 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self queryId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self queryId];
    id v15 = [v4 queryId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  $B59FB5E837908BB473A427058DAC41A6 has = self->_has;
  unsigned int v18 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&has)
  {
    int resolutionState = self->_resolutionState;
    if (resolutionState != [v4 resolutionState]) {
      goto LABEL_29;
    }
    $B59FB5E837908BB473A427058DAC41A6 has = self->_has;
    unsigned int v18 = v4[48];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_29;
  }
  if (v20)
  {
    int forcePromptType = self->_forcePromptType;
    if (forcePromptType != [v4 forcePromptType]) {
      goto LABEL_29;
    }
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self recommenderModelVersion];
  uint64_t v6 = [v4 recommenderModelVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v22 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self recommenderModelVersion];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self recommenderModelVersion];
    v25 = [v4 recommenderModelVersion];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self anonymizedRecommendedEntityIdentifiers];
  uint64_t v6 = [v4 anonymizedRecommendedEntityIdentifiers];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v27 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self anonymizedRecommendedEntityIdentifiers];
  if (!v27)
  {

LABEL_32:
    BOOL v32 = 1;
    goto LABEL_30;
  }
  long long v28 = (void *)v27;
  long long v29 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self anonymizedRecommendedEntityIdentifiers];
  long long v30 = [v4 anonymizedRecommendedEntityIdentifiers];
  char v31 = [v29 isEqual:v30];

  if (v31) {
    goto LABEL_32;
  }
LABEL_29:
  BOOL v32 = 0;
LABEL_30:

  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self originalResolutionContextId];

  if (v5)
  {
    uint64_t v6 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self originalResolutionContextId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self queryId];

  if (v7)
  {
    int v8 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self queryId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v10 = [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self recommenderModelVersion];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v11 = self->_anonymizedRecommendedEntityIdentifiers;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEResolutionQueryInfoGeneratedReadFrom(self, (uint64_t)a3);
}

- (id)anonymizedRecommendedEntityIdentifierAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_anonymizedRecommendedEntityIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)anonymizedRecommendedEntityIdentifierCount
{
  return [(NSArray *)self->_anonymizedRecommendedEntityIdentifiers count];
}

- (void)addAnonymizedRecommendedEntityIdentifier:(id)a3
{
  id v4 = a3;
  anonymizedRecommendedEntityIdentifiers = self->_anonymizedRecommendedEntityIdentifiers;
  id v8 = v4;
  if (!anonymizedRecommendedEntityIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_anonymizedRecommendedEntityIdentifiers;
    self->_anonymizedRecommendedEntityIdentifiers = v6;

    id v4 = v8;
    anonymizedRecommendedEntityIdentifiers = self->_anonymizedRecommendedEntityIdentifiers;
  }
  [(NSArray *)anonymizedRecommendedEntityIdentifiers addObject:v4];
}

- (void)clearAnonymizedRecommendedEntityIdentifier
{
}

- (void)deleteRecommenderModelVersion
{
}

- (BOOL)hasRecommenderModelVersion
{
  return self->_recommenderModelVersion != 0;
}

- (void)deleteForcePromptType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasForcePromptType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasForcePromptType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setForcePromptType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int forcePromptType = a3;
}

- (void)deleteResolutionState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResolutionState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResolutionState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResolutionState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int resolutionState = a3;
}

- (void)deleteQueryId
{
}

- (BOOL)hasQueryId
{
  return self->_queryId != 0;
}

- (void)deleteOriginalResolutionContextId
{
}

- (BOOL)hasOriginalResolutionContextId
{
  return self->_originalResolutionContextId != 0;
}

@end