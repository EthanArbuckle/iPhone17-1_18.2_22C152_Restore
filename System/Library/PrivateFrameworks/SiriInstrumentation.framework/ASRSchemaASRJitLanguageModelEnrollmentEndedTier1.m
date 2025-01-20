@interface ASRSchemaASRJitLanguageModelEnrollmentEndedTier1
- (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1)initWithDictionary:(id)a3;
- (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1)initWithJSON:(id)a3;
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)dialogContexts;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dialogContextAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)dialogContextCount;
- (unint64_t)hash;
- (void)addDialogContext:(id)a3;
- (void)clearDialogContext;
- (void)deleteLinkId;
- (void)setDialogContexts:(id)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRJitLanguageModelEnrollmentEndedTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASRJitLanguageModelEnrollmentEndedTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self deleteDialogContext];
  }
  if ([v4 isConditionSet:4]) {
    [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self deleteDialogContext];
  }
  if ([v4 isConditionSet:5]) {
    [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self deleteDialogContext];
  }
  if ([v4 isConditionSet:6]) {
    [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self deleteDialogContext];
  }
  if ([v4 isConditionSet:7]) {
    [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self deleteDialogContext];
  }
  v6 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_dialogContexts, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setDialogContexts:(id)a3
{
}

- (NSArray)dialogContexts
{
  return self->_dialogContexts;
}

- (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ASRSchemaASRJitLanguageModelEnrollmentEndedTier1;
  v5 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dialogContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v18);
              [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)v5 addDialogContext:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"linkId", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)v5 setLinkId:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self dictionaryRepresentation];
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
  if (self->_dialogContexts)
  {
    id v4 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self dialogContexts];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"dialogContext"];
  }
  if (self->_linkId)
  {
    v6 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self linkId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"linkId"];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"linkId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_dialogContexts hash];
  return [(SISchemaUUID *)self->_linkId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self dialogContexts];
  v6 = [v4 dialogContexts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self dialogContexts];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self dialogContexts];
    uint64_t v10 = [v4 dialogContexts];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self linkId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self linkId];
    v15 = [v4 linkId];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_dialogContexts;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self linkId];

  if (v10)
  {
    int v11 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRJitLanguageModelEnrollmentEndedTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (id)dialogContextAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_dialogContexts objectAtIndexedSubscript:a3];
}

- (unint64_t)dialogContextCount
{
  return [(NSArray *)self->_dialogContexts count];
}

- (void)addDialogContext:(id)a3
{
  id v4 = a3;
  dialogContexts = self->_dialogContexts;
  id v8 = v4;
  if (!dialogContexts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_dialogContexts;
    self->_dialogContexts = v6;

    id v4 = v8;
    dialogContexts = self->_dialogContexts;
  }
  [(NSArray *)dialogContexts addObject:v4];
}

- (void)clearDialogContext
{
}

@end