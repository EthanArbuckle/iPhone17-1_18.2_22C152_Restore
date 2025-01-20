@interface NLXSchemaCDMRequestEnded
- (BOOL)hasLanguageVariantClassifierResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMLanguageVariantResult)languageVariantClassifierResult;
- (NLXSchemaCDMRequestEnded)initWithDictionary:(id)a3;
- (NLXSchemaCDMRequestEnded)initWithJSON:(id)a3;
- (NSArray)parses;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)parsesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)parsesCount;
- (void)addParses:(id)a3;
- (void)clearParses;
- (void)deleteLanguageVariantClassifierResult;
- (void)setHasLanguageVariantClassifierResult:(BOOL)a3;
- (void)setLanguageVariantClassifierResult:(id)a3;
- (void)setParses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMRequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaCDMRequestEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMRequestEnded *)self parses];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(NLXSchemaCDMRequestEnded *)self setParses:v7];

  v8 = [(NLXSchemaCDMRequestEnded *)self languageVariantClassifierResult];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(NLXSchemaCDMRequestEnded *)self deleteLanguageVariantClassifierResult];
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
  objc_storeStrong((id *)&self->_languageVariantClassifierResult, 0);
  objc_storeStrong((id *)&self->_parses, 0);
}

- (void)setHasLanguageVariantClassifierResult:(BOOL)a3
{
  self->_hasLanguageVariantClassifierResult = a3;
}

- (void)setLanguageVariantClassifierResult:(id)a3
{
}

- (NLXSchemaCDMLanguageVariantResult)languageVariantClassifierResult
{
  return self->_languageVariantClassifierResult;
}

- (void)setParses:(id)a3
{
}

- (NSArray)parses
{
  return self->_parses;
}

- (NLXSchemaCDMRequestEnded)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NLXSchemaCDMRequestEnded;
  v5 = [(NLXSchemaCDMRequestEnded *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"parses"];
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
              v13 = [NLXSchemaCDMUserParse alloc];
              v14 = -[NLXSchemaCDMUserParse initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(NLXSchemaCDMRequestEnded *)v5 addParses:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"languageVariantClassifierResult", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[NLXSchemaCDMLanguageVariantResult alloc] initWithDictionary:v15];
      [(NLXSchemaCDMRequestEnded *)v5 setLanguageVariantClassifierResult:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (NLXSchemaCDMRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMRequestEnded *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_languageVariantClassifierResult)
  {
    id v4 = [(NLXSchemaCDMRequestEnded *)self languageVariantClassifierResult];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"languageVariantClassifierResult"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"languageVariantClassifierResult"];
    }
  }
  if ([(NSArray *)self->_parses count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_parses;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"parses"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_parses hash];
  return [(NLXSchemaCDMLanguageVariantResult *)self->_languageVariantClassifierResult hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(NLXSchemaCDMRequestEnded *)self parses];
  v6 = [v4 parses];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaCDMRequestEnded *)self parses];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NLXSchemaCDMRequestEnded *)self parses];
    uint64_t v10 = [v4 parses];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaCDMRequestEnded *)self languageVariantClassifierResult];
  v6 = [v4 languageVariantClassifierResult];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(NLXSchemaCDMRequestEnded *)self languageVariantClassifierResult];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(NLXSchemaCDMRequestEnded *)self languageVariantClassifierResult];
    v15 = [v4 languageVariantClassifierResult];
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
  v5 = self->_parses;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(NLXSchemaCDMRequestEnded *)self languageVariantClassifierResult];

  if (v10)
  {
    int v11 = [(NLXSchemaCDMRequestEnded *)self languageVariantClassifierResult];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLanguageVariantClassifierResult
{
}

- (BOOL)hasLanguageVariantClassifierResult
{
  return self->_languageVariantClassifierResult != 0;
}

- (id)parsesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_parses objectAtIndexedSubscript:a3];
}

- (unint64_t)parsesCount
{
  return [(NSArray *)self->_parses count];
}

- (void)addParses:(id)a3
{
  id v4 = a3;
  parses = self->_parses;
  id v8 = v4;
  if (!parses)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_parses;
    self->_parses = v6;

    id v4 = v8;
    parses = self->_parses;
  }
  [(NSArray *)parses addObject:v4];
}

- (void)clearParses
{
}

@end