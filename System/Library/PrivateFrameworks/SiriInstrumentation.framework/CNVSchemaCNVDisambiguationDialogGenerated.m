@interface CNVSchemaCNVDisambiguationDialogGenerated
- (BOOL)hasDialogType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVDisambiguationDialogGenerated)initWithDictionary:(id)a3;
- (CNVSchemaCNVDisambiguationDialogGenerated)initWithJSON:(id)a3;
- (NSArray)actionCandidateIds;
- (NSData)jsonData;
- (NSString)dialogType;
- (id)actionCandidateIdsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)actionCandidateIdsCount;
- (unint64_t)hash;
- (void)addActionCandidateIds:(id)a3;
- (void)clearActionCandidateIds;
- (void)deleteDialogType;
- (void)setActionCandidateIds:(id)a3;
- (void)setDialogType:(id)a3;
- (void)setHasDialogType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVDisambiguationDialogGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNVSchemaCNVDisambiguationDialogGenerated;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self actionCandidateIds];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(CNVSchemaCNVDisambiguationDialogGenerated *)self setActionCandidateIds:v7];
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
  objc_storeStrong((id *)&self->_dialogType, 0);
  objc_storeStrong((id *)&self->_actionCandidateIds, 0);
}

- (void)setHasDialogType:(BOOL)a3
{
  self->_hasDialogType = a3;
}

- (void)setDialogType:(id)a3
{
}

- (NSString)dialogType
{
  return self->_dialogType;
}

- (void)setActionCandidateIds:(id)a3
{
}

- (NSArray)actionCandidateIds
{
  return self->_actionCandidateIds;
}

- (CNVSchemaCNVDisambiguationDialogGenerated)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNVSchemaCNVDisambiguationDialogGenerated;
  v5 = [(CNVSchemaCNVDisambiguationDialogGenerated *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"actionCandidateIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [SISchemaUUID alloc];
              v14 = -[SISchemaUUID initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(CNVSchemaCNVDisambiguationDialogGenerated *)v5 addActionCandidateIds:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"dialogType", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(CNVSchemaCNVDisambiguationDialogGenerated *)v5 setDialogType:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (CNVSchemaCNVDisambiguationDialogGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVDisambiguationDialogGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self dictionaryRepresentation];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_actionCandidateIds count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = self->_actionCandidateIds;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"actionCandidateIds"];
  }
  if (self->_dialogType)
  {
    uint64_t v12 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self dialogType];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"dialogType"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v15);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_actionCandidateIds hash];
  return [(NSString *)self->_dialogType hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self actionCandidateIds];
  uint64_t v6 = [v4 actionCandidateIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self actionCandidateIds];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self actionCandidateIds];
    uint64_t v10 = [v4 actionCandidateIds];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self dialogType];
  uint64_t v6 = [v4 dialogType];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self dialogType];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self dialogType];
    long long v15 = [v4 dialogType];
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_actionCandidateIds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(CNVSchemaCNVDisambiguationDialogGenerated *)self dialogType];

  if (v10) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVDisambiguationDialogGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDialogType
{
}

- (BOOL)hasDialogType
{
  return self->_dialogType != 0;
}

- (id)actionCandidateIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_actionCandidateIds objectAtIndexedSubscript:a3];
}

- (unint64_t)actionCandidateIdsCount
{
  return [(NSArray *)self->_actionCandidateIds count];
}

- (void)addActionCandidateIds:(id)a3
{
  id v4 = a3;
  actionCandidateIds = self->_actionCandidateIds;
  id v8 = v4;
  if (!actionCandidateIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_actionCandidateIds;
    self->_actionCandidateIds = v6;

    id v4 = v8;
    actionCandidateIds = self->_actionCandidateIds;
  }
  [(NSArray *)actionCandidateIds addObject:v4];
}

- (void)clearActionCandidateIds
{
}

@end