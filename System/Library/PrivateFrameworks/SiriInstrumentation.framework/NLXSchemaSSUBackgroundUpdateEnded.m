@interface NLXSchemaSSUBackgroundUpdateEnded
- (BOOL)hasModelEncoderLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaSSUBackgroundUpdateEnded)initWithDictionary:(id)a3;
- (NLXSchemaSSUBackgroundUpdateEnded)initWithJSON:(id)a3;
- (NSArray)appInfos;
- (NSData)jsonData;
- (NSString)modelEncoderLocale;
- (id)appInfoAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)appInfoCount;
- (unint64_t)hash;
- (void)addAppInfo:(id)a3;
- (void)clearAppInfo;
- (void)deleteModelEncoderLocale;
- (void)setAppInfos:(id)a3;
- (void)setHasModelEncoderLocale:(BOOL)a3;
- (void)setModelEncoderLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaSSUBackgroundUpdateEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaSSUBackgroundUpdateEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaSSUBackgroundUpdateEnded *)self appInfos];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(NLXSchemaSSUBackgroundUpdateEnded *)self setAppInfos:v7];
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
  objc_storeStrong((id *)&self->_appInfos, 0);
  objc_storeStrong((id *)&self->_modelEncoderLocale, 0);
}

- (void)setHasModelEncoderLocale:(BOOL)a3
{
  self->_hasModelEncoderLocale = a3;
}

- (void)setAppInfos:(id)a3
{
}

- (NSArray)appInfos
{
  return self->_appInfos;
}

- (void)setModelEncoderLocale:(id)a3
{
}

- (NSString)modelEncoderLocale
{
  return self->_modelEncoderLocale;
}

- (NLXSchemaSSUBackgroundUpdateEnded)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NLXSchemaSSUBackgroundUpdateEnded;
  v5 = [(NLXSchemaSSUBackgroundUpdateEnded *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelEncoderLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(NLXSchemaSSUBackgroundUpdateEnded *)v5 setModelEncoderLocale:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"appInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[NLXSchemaSSUBackgroundUpdateAppInfo alloc] initWithDictionary:v14];
              [(NLXSchemaSSUBackgroundUpdateEnded *)v5 addAppInfo:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (NLXSchemaSSUBackgroundUpdateEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaSSUBackgroundUpdateEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaSSUBackgroundUpdateEnded *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_appInfos count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = self->_appInfos;
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

    [v3 setObject:v4 forKeyedSubscript:@"appInfo"];
  }
  if (self->_modelEncoderLocale)
  {
    uint64_t v12 = [(NLXSchemaSSUBackgroundUpdateEnded *)self modelEncoderLocale];
    uint64_t v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"modelEncoderLocale"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v15);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelEncoderLocale hash];
  return [(NSArray *)self->_appInfos hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(NLXSchemaSSUBackgroundUpdateEnded *)self modelEncoderLocale];
  uint64_t v6 = [v4 modelEncoderLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaSSUBackgroundUpdateEnded *)self modelEncoderLocale];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(NLXSchemaSSUBackgroundUpdateEnded *)self modelEncoderLocale];
    uint64_t v10 = [v4 modelEncoderLocale];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaSSUBackgroundUpdateEnded *)self appInfos];
  uint64_t v6 = [v4 appInfos];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(NLXSchemaSSUBackgroundUpdateEnded *)self appInfos];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(NLXSchemaSSUBackgroundUpdateEnded *)self appInfos];
    long long v15 = [v4 appInfos];
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
  v5 = [(NLXSchemaSSUBackgroundUpdateEnded *)self modelEncoderLocale];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_appInfos;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaSSUBackgroundUpdateEndedReadFrom(self, (uint64_t)a3);
}

- (id)appInfoAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_appInfos objectAtIndexedSubscript:a3];
}

- (unint64_t)appInfoCount
{
  return [(NSArray *)self->_appInfos count];
}

- (void)addAppInfo:(id)a3
{
  id v4 = a3;
  appInfos = self->_appInfos;
  id v8 = v4;
  if (!appInfos)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_appInfos;
    self->_appInfos = v6;

    id v4 = v8;
    appInfos = self->_appInfos;
  }
  [(NSArray *)appInfos addObject:v4];
}

- (void)clearAppInfo
{
}

- (void)deleteModelEncoderLocale
{
}

- (BOOL)hasModelEncoderLocale
{
  return self->_modelEncoderLocale != 0;
}

@end