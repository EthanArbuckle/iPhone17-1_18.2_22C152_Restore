@interface CNVSchemaCNVActionCandidatesGeneratedTier1
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVActionCandidatesGeneratedTier1)initWithDictionary:(id)a3;
- (CNVSchemaCNVActionCandidatesGeneratedTier1)initWithJSON:(id)a3;
- (NSArray)metadataTier1s;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)metadataTier1AtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)metadataTier1Count;
- (void)addMetadataTier1:(id)a3;
- (void)clearMetadataTier1;
- (void)setMetadataTier1s:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVActionCandidatesGeneratedTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNVSchemaCNVActionCandidatesGeneratedTier1;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CNVSchemaCNVActionCandidatesGeneratedTier1 *)self metadataTier1s];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(CNVSchemaCNVActionCandidatesGeneratedTier1 *)self setMetadataTier1s:v7];
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

- (void)setMetadataTier1s:(id)a3
{
}

- (NSArray)metadataTier1s
{
  return self->_metadataTier1s;
}

- (CNVSchemaCNVActionCandidatesGeneratedTier1)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNVSchemaCNVActionCandidatesGeneratedTier1;
  v5 = [(CNVSchemaCNVActionCandidatesGeneratedTier1 *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"metadataTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [CNVSchemaCNVLinkMetadataTier1 alloc];
              v14 = -[CNVSchemaCNVLinkMetadataTier1 initWithDictionary:](v13, "initWithDictionary:", v12, (void)v17);
              [(CNVSchemaCNVActionCandidatesGeneratedTier1 *)v5 addMetadataTier1:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v9);
      }
    }
    v15 = v5;
  }
  return v5;
}

- (CNVSchemaCNVActionCandidatesGeneratedTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVActionCandidatesGeneratedTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVActionCandidatesGeneratedTier1 *)self dictionaryRepresentation];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_metadataTier1s count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_metadataTier1s;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"metadataTier1"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v13);
  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_metadataTier1s hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(CNVSchemaCNVActionCandidatesGeneratedTier1 *)self metadataTier1s];
    uint64_t v6 = [v4 metadataTier1s];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(CNVSchemaCNVActionCandidatesGeneratedTier1 *)self metadataTier1s];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(CNVSchemaCNVActionCandidatesGeneratedTier1 *)self metadataTier1s];
      uint64_t v11 = [v4 metadataTier1s];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_metadataTier1s;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVActionCandidatesGeneratedTier1ReadFrom(self, (uint64_t)a3);
}

- (id)metadataTier1AtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_metadataTier1s objectAtIndexedSubscript:a3];
}

- (unint64_t)metadataTier1Count
{
  return [(NSArray *)self->_metadataTier1s count];
}

- (void)addMetadataTier1:(id)a3
{
  id v4 = a3;
  metadataTier1s = self->_metadataTier1s;
  id v8 = v4;
  if (!metadataTier1s)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_metadataTier1s;
    self->_metadataTier1s = v6;

    id v4 = v8;
    metadataTier1s = self->_metadataTier1s;
  }
  [(NSArray *)metadataTier1s addObject:v4];
}

- (void)clearMetadataTier1
{
}

@end