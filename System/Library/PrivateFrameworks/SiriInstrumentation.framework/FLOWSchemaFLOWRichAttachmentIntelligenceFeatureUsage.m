@interface FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadingIntelligenceAttemptedAtIndex:(unint64_t)a3;
- (BOOL)isReadingIntelligenceUsedAtIndex:(unint64_t)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage)initWithJSON:(id)a3;
- (NSArray)isReadingIntelligenceAttempteds;
- (NSArray)isReadingIntelligenceUseds;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)isReadingIntelligenceAttemptedCount;
- (unint64_t)isReadingIntelligenceUsedCount;
- (void)addIsReadingIntelligenceAttempted:(BOOL)a3;
- (void)addIsReadingIntelligenceUsed:(BOOL)a3;
- (void)clearIsReadingIntelligenceAttempted;
- (void)clearIsReadingIntelligenceUsed;
- (void)setIsReadingIntelligenceAttempteds:(id)a3;
- (void)setIsReadingIntelligenceUseds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isReadingIntelligenceUseds, 0);
  objc_storeStrong((id *)&self->_isReadingIntelligenceAttempteds, 0);
}

- (void)setIsReadingIntelligenceUseds:(id)a3
{
}

- (NSArray)isReadingIntelligenceUseds
{
  return self->_isReadingIntelligenceUseds;
}

- (void)setIsReadingIntelligenceAttempteds:(id)a3
{
}

- (NSArray)isReadingIntelligenceAttempteds
{
  return self->_isReadingIntelligenceAttempteds;
}

- (FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage;
  v5 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isReadingIntelligenceAttempted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage addIsReadingIntelligenceAttempted:](v5, "addIsReadingIntelligenceAttempted:", [v12 BOOLValue]);
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v9);
      }
    }
    v13 = [v4 objectForKeyedSubscript:@"isReadingIntelligenceUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage addIsReadingIntelligenceUsed:](v5, "addIsReadingIntelligenceUsed:", objc_msgSend(v19, "BOOLValue", (void)v22));
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v16);
      }
    }
    v20 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_isReadingIntelligenceAttempteds count])
  {
    id v4 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self isReadingIntelligenceAttempteds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"isReadingIntelligenceAttempted"];
  }
  if ([(NSArray *)self->_isReadingIntelligenceUseds count])
  {
    v6 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self isReadingIntelligenceUseds];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"isReadingIntelligenceUsed"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_isReadingIntelligenceAttempteds hash];
  return [(NSArray *)self->_isReadingIntelligenceUseds hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self isReadingIntelligenceAttempteds];
  v6 = [v4 isReadingIntelligenceAttempteds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self isReadingIntelligenceAttempteds];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self isReadingIntelligenceAttempteds];
    uint64_t v10 = [v4 isReadingIntelligenceAttempteds];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self isReadingIntelligenceUseds];
  v6 = [v4 isReadingIntelligenceUseds];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self isReadingIntelligenceUseds];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    id v14 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self isReadingIntelligenceUseds];
    uint64_t v15 = [v4 isReadingIntelligenceUseds];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_isReadingIntelligenceAttempteds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v9) BOOLValue];
        PBDataWriterWriteBOOLField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_isReadingIntelligenceUseds;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14), "BOOLValue", (void)v15);
        PBDataWriterWriteBOOLField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsageReadFrom(self, (uint64_t)a3);
}

- (BOOL)isReadingIntelligenceUsedAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_isReadingIntelligenceUseds objectAtIndexedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)isReadingIntelligenceUsedCount
{
  return [(NSArray *)self->_isReadingIntelligenceUseds count];
}

- (void)addIsReadingIntelligenceUsed:(BOOL)a3
{
  BOOL v3 = a3;
  isReadingIntelligenceUseds = self->_isReadingIntelligenceUseds;
  if (!isReadingIntelligenceUseds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_isReadingIntelligenceUseds;
    self->_isReadingIntelligenceUseds = v6;

    isReadingIntelligenceUseds = self->_isReadingIntelligenceUseds;
  }
  id v8 = [NSNumber numberWithBool:v3];
  [(NSArray *)isReadingIntelligenceUseds addObject:v8];
}

- (void)clearIsReadingIntelligenceUsed
{
}

- (BOOL)isReadingIntelligenceAttemptedAtIndex:(unint64_t)a3
{
  BOOL v3 = [(NSArray *)self->_isReadingIntelligenceAttempteds objectAtIndexedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)isReadingIntelligenceAttemptedCount
{
  return [(NSArray *)self->_isReadingIntelligenceAttempteds count];
}

- (void)addIsReadingIntelligenceAttempted:(BOOL)a3
{
  BOOL v3 = a3;
  isReadingIntelligenceAttempteds = self->_isReadingIntelligenceAttempteds;
  if (!isReadingIntelligenceAttempteds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_isReadingIntelligenceAttempteds;
    self->_isReadingIntelligenceAttempteds = v6;

    isReadingIntelligenceAttempteds = self->_isReadingIntelligenceAttempteds;
  }
  id v8 = [NSNumber numberWithBool:v3];
  [(NSArray *)isReadingIntelligenceAttempteds addObject:v8];
}

- (void)clearIsReadingIntelligenceAttempted
{
}

@end