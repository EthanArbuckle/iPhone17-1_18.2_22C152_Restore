@interface INFERENCESchemaINFERENCEContactCandidatesInfoGenerated
- (BOOL)hasContactQueryMetadata;
- (BOOL)hasIsEntityCandidateRetrievalEnabled;
- (BOOL)hasOntologySource;
- (BOOL)hasOriginalResolutionContextId;
- (BOOL)hasQueryId;
- (BOOL)isEntityCandidateRetrievalEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCEContactQueryMetadata)contactQueryMetadata;
- (NSArray)candidates;
- (NSData)jsonData;
- (SISchemaUUID)originalResolutionContextId;
- (SISchemaUUID)queryId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)candidatesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)ontologySource;
- (unint64_t)candidatesCount;
- (unint64_t)hash;
- (void)addCandidates:(id)a3;
- (void)clearCandidates;
- (void)deleteContactQueryMetadata;
- (void)deleteIsEntityCandidateRetrievalEnabled;
- (void)deleteOntologySource;
- (void)deleteOriginalResolutionContextId;
- (void)deleteQueryId;
- (void)setCandidates:(id)a3;
- (void)setContactQueryMetadata:(id)a3;
- (void)setHasContactQueryMetadata:(BOOL)a3;
- (void)setHasIsEntityCandidateRetrievalEnabled:(BOOL)a3;
- (void)setHasOntologySource:(BOOL)a3;
- (void)setHasOriginalResolutionContextId:(BOOL)a3;
- (void)setHasQueryId:(BOOL)a3;
- (void)setIsEntityCandidateRetrievalEnabled:(BOOL)a3;
- (void)setOntologySource:(int)a3;
- (void)setOriginalResolutionContextId:(id)a3;
- (void)setQueryId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEContactCandidatesInfoGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INFERENCESchemaINFERENCEContactCandidatesInfoGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self originalResolutionContextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self deleteOriginalResolutionContextId];
  }
  v9 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self queryId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self deleteQueryId];
  }
  v12 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self contactQueryMetadata];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self deleteContactQueryMetadata];
  }
  v15 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self candidates];
  v16 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v15 underConditions:v4];
  [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self setCandidates:v16];

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
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_contactQueryMetadata, 0);
  objc_storeStrong((id *)&self->_queryId, 0);
  objc_storeStrong((id *)&self->_originalResolutionContextId, 0);
}

- (void)setHasContactQueryMetadata:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasQueryId:(BOOL)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 3) = a3;
}

- (void)setHasOriginalResolutionContextId:(BOOL)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 2) = a3;
}

- (BOOL)isEntityCandidateRetrievalEnabled
{
  return self->_isEntityCandidateRetrievalEnabled;
}

- (void)setCandidates:(id)a3
{
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (int)ontologySource
{
  return self->_ontologySource;
}

- (void)setContactQueryMetadata:(id)a3
{
}

- (INFERENCESchemaINFERENCEContactQueryMetadata)contactQueryMetadata
{
  return self->_contactQueryMetadata;
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

- (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated)initWithDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)INFERENCESchemaINFERENCEContactCandidatesInfoGenerated;
  v5 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)&v32 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalResolutionContextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)v5 setOriginalResolutionContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"queryId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)v5 setQueryId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"contactQueryMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[INFERENCESchemaINFERENCEContactQueryMetadata alloc] initWithDictionary:v10];
      [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)v5 setContactQueryMetadata:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"ontologySource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setOntologySource:](v5, "setOntologySource:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"candidates"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v12;
      v25 = v10;
      v26 = v8;
      v27 = v6;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [[INFERENCESchemaINFERENCECandidateInfo alloc] initWithDictionary:v19];
              [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)v5 addCandidates:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v16);
      }

      int v8 = v26;
      v6 = v27;
      v12 = v24;
    }
    v21 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isEntityCandidateRetrievalEnabled", v24, v25, v26, v27, (void)v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setIsEntityCandidateRetrievalEnabled:](v5, "setIsEntityCandidateRetrievalEnabled:", [v21 BOOLValue]);
    }
    v22 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self dictionaryRepresentation];
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_candidates count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v5 = self->_candidates;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            int v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"candidates"];
  }
  if (self->_contactQueryMetadata)
  {
    v12 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self contactQueryMetadata];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"contactQueryMetadata"];
    }
    else
    {
      id v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"contactQueryMetadata"];
    }
  }
  char v15 = *(&self->_isEntityCandidateRetrievalEnabled + 1);
  if ((v15 & 2) != 0)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated isEntityCandidateRetrievalEnabled](self, "isEntityCandidateRetrievalEnabled"));
    [v3 setObject:v16 forKeyedSubscript:@"isEntityCandidateRetrievalEnabled"];

    char v15 = *(&self->_isEntityCandidateRetrievalEnabled + 1);
  }
  if (v15)
  {
    unsigned int v17 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self ontologySource] - 1;
    if (v17 > 3) {
      objc_super v18 = @"INFERENCEONTOLOGYSOURCE_UNKNOWN";
    }
    else {
      objc_super v18 = off_1E5EB0DC8[v17];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, @"ontologySource", (void)v26);
  }
  if (self->_originalResolutionContextId)
  {
    uint64_t v19 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self originalResolutionContextId];
    v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"originalResolutionContextId"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"originalResolutionContextId"];
    }
  }
  if (self->_queryId)
  {
    v22 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self queryId];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"queryId"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"queryId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v26);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalResolutionContextId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_queryId hash];
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactQueryMetadata *)self->_contactQueryMetadata hash];
  if (*(&self->_isEntityCandidateRetrievalEnabled + 1)) {
    uint64_t v6 = 2654435761 * self->_ontologySource;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSArray *)self->_candidates hash];
  if ((*(&self->_isEntityCandidateRetrievalEnabled + 1) & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_isEntityCandidateRetrievalEnabled;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self originalResolutionContextId];
  uint64_t v6 = [v4 originalResolutionContextId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self originalResolutionContextId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self originalResolutionContextId];
    v10 = [v4 originalResolutionContextId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self queryId];
  uint64_t v6 = [v4 queryId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v12 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self queryId];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self queryId];
    char v15 = [v4 queryId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self contactQueryMetadata];
  uint64_t v6 = [v4 contactQueryMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v17 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self contactQueryMetadata];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    uint64_t v19 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self contactQueryMetadata];
    v20 = [v4 contactQueryMetadata];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  if (*(&self->_isEntityCandidateRetrievalEnabled + 1) != (v4[49] & 1)) {
    goto LABEL_25;
  }
  if (*(&self->_isEntityCandidateRetrievalEnabled + 1))
  {
    int ontologySource = self->_ontologySource;
    if (ontologySource != [v4 ontologySource]) {
      goto LABEL_25;
    }
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self candidates];
  uint64_t v6 = [v4 candidates];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v23 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self candidates];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self candidates];
    long long v26 = [v4 candidates];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  int v30 = (*((unsigned __int8 *)&self->_isEntityCandidateRetrievalEnabled + 1) >> 1) & 1;
  if (v30 == ((v4[49] >> 1) & 1))
  {
    if (!v30
      || (int isEntityCandidateRetrievalEnabled = self->_isEntityCandidateRetrievalEnabled,
          isEntityCandidateRetrievalEnabled == [v4 isEntityCandidateRetrievalEnabled]))
    {
      BOOL v28 = 1;
      goto LABEL_26;
    }
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self originalResolutionContextId];

  if (v5)
  {
    uint64_t v6 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self originalResolutionContextId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self queryId];

  if (v7)
  {
    uint64_t v8 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self queryId];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self contactQueryMetadata];

  if (v9)
  {
    v10 = [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self contactQueryMetadata];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_isEntityCandidateRetrievalEnabled + 1)) {
    PBDataWriterWriteInt32Field();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v11 = self->_candidates;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  if ((*(&self->_isEntityCandidateRetrievalEnabled + 1) & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactCandidatesInfoGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsEntityCandidateRetrievalEnabled
{
  *(&self->_isEntityCandidateRetrievalEnabled + 1) &= ~2u;
}

- (void)setHasIsEntityCandidateRetrievalEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEntityCandidateRetrievalEnabled + 1) = *(&self->_isEntityCandidateRetrievalEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasIsEntityCandidateRetrievalEnabled
{
  return (*((unsigned __int8 *)&self->_isEntityCandidateRetrievalEnabled + 1) >> 1) & 1;
}

- (void)setIsEntityCandidateRetrievalEnabled:(BOOL)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 1) |= 2u;
  self->_int isEntityCandidateRetrievalEnabled = a3;
}

- (id)candidatesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_candidates objectAtIndexedSubscript:a3];
}

- (unint64_t)candidatesCount
{
  return [(NSArray *)self->_candidates count];
}

- (void)addCandidates:(id)a3
{
  id v4 = a3;
  candidates = self->_candidates;
  id v8 = v4;
  if (!candidates)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_candidates;
    self->_candidates = v6;

    id v4 = v8;
    candidates = self->_candidates;
  }
  [(NSArray *)candidates addObject:v4];
}

- (void)clearCandidates
{
}

- (void)deleteOntologySource
{
  *(&self->_isEntityCandidateRetrievalEnabled + 1) &= ~1u;
}

- (void)setHasOntologySource:(BOOL)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 1) = *(&self->_isEntityCandidateRetrievalEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasOntologySource
{
  return *(&self->_isEntityCandidateRetrievalEnabled + 1);
}

- (void)setOntologySource:(int)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 1) |= 1u;
  self->_int ontologySource = a3;
}

- (void)deleteContactQueryMetadata
{
}

- (BOOL)hasContactQueryMetadata
{
  return self->_contactQueryMetadata != 0;
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