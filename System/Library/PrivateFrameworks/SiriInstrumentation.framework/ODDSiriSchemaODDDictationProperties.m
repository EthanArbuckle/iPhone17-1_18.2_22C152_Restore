@interface ODDSiriSchemaODDDictationProperties
- (BOOL)hasIsAutoPunctuationEnabled;
- (BOOL)hasIsDictationEnabled;
- (BOOL)isAutoPunctuationEnabled;
- (BOOL)isDictationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)enabledDictationLocales;
- (NSData)jsonData;
- (ODDSiriSchemaODDDictationProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDictationProperties)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)enabledDictationLocalesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)enabledDictationLocalesCount;
- (unint64_t)hash;
- (void)addEnabledDictationLocales:(id)a3;
- (void)clearEnabledDictationLocales;
- (void)deleteIsAutoPunctuationEnabled;
- (void)deleteIsDictationEnabled;
- (void)setEnabledDictationLocales:(id)a3;
- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3;
- (void)setHasIsDictationEnabled:(BOOL)a3;
- (void)setIsAutoPunctuationEnabled:(BOOL)a3;
- (void)setIsDictationEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDictationProperties

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDDictationProperties;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDDictationProperties *)self enabledDictationLocales];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(ODDSiriSchemaODDDictationProperties *)self setEnabledDictationLocales:v7];
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

- (BOOL)isAutoPunctuationEnabled
{
  return self->_isAutoPunctuationEnabled;
}

- (void)setEnabledDictationLocales:(id)a3
{
}

- (NSArray)enabledDictationLocales
{
  return self->_enabledDictationLocales;
}

- (BOOL)isDictationEnabled
{
  return self->_isDictationEnabled;
}

- (ODDSiriSchemaODDDictationProperties)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ODDSiriSchemaODDDictationProperties;
  v5 = [(ODDSiriSchemaODDDictationProperties *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isDictationEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDictationProperties setIsDictationEnabled:](v5, "setIsDictationEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"enabledDictationLocales"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v13];
              [(ODDSiriSchemaODDDictationProperties *)v5 addEnabledDictationLocales:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v10);
      }

      v6 = v18;
    }
    v15 = [v4 objectForKeyedSubscript:@"isAutoPunctuationEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDictationProperties setIsAutoPunctuationEnabled:](v5, "setIsAutoPunctuationEnabled:", [v15 BOOLValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDictationProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDictationProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDictationProperties *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_enabledDictationLocales count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_enabledDictationLocales;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"enabledDictationLocales"];
  }
  char v12 = *(&self->_isAutoPunctuationEnabled + 1);
  if ((v12 & 2) != 0)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDDictationProperties isAutoPunctuationEnabled](self, "isAutoPunctuationEnabled"));
    [v3 setObject:v13 forKeyedSubscript:@"isAutoPunctuationEnabled"];

    char v12 = *(&self->_isAutoPunctuationEnabled + 1);
  }
  if (v12)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDDictationProperties isDictationEnabled](self, "isDictationEnabled"));
    [v3 setObject:v14 forKeyedSubscript:@"isDictationEnabled"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isAutoPunctuationEnabled + 1)) {
    uint64_t v3 = 2654435761 * self->_isDictationEnabled;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_enabledDictationLocales hash];
  if ((*(&self->_isAutoPunctuationEnabled + 1) & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_isAutoPunctuationEnabled;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(&self->_isAutoPunctuationEnabled + 1) != (v4[25] & 1)) {
    goto LABEL_15;
  }
  if (*(&self->_isAutoPunctuationEnabled + 1))
  {
    int isDictationEnabled = self->_isDictationEnabled;
    if (isDictationEnabled != [v4 isDictationEnabled]) {
      goto LABEL_15;
    }
  }
  uint64_t v6 = [(ODDSiriSchemaODDDictationProperties *)self enabledDictationLocales];
  uint64_t v7 = [v4 enabledDictationLocales];
  uint64_t v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(ODDSiriSchemaODDDictationProperties *)self enabledDictationLocales];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(ODDSiriSchemaODDDictationProperties *)self enabledDictationLocales];
    char v12 = [v4 enabledDictationLocales];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v14 = (*((unsigned __int8 *)&self->_isAutoPunctuationEnabled + 1) >> 1) & 1;
  if (v14 != ((v4[25] >> 1) & 1)) {
    goto LABEL_15;
  }
  if (v14)
  {
    int isAutoPunctuationEnabled = self->_isAutoPunctuationEnabled;
    if (isAutoPunctuationEnabled != [v4 isAutoPunctuationEnabled]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(&self->_isAutoPunctuationEnabled + 1)) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_enabledDictationLocales;
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

  if ((*(&self->_isAutoPunctuationEnabled + 1) & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDictationPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsAutoPunctuationEnabled
{
  *(&self->_isAutoPunctuationEnabled + 1) &= ~2u;
}

- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAutoPunctuationEnabled + 1) = *(&self->_isAutoPunctuationEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasIsAutoPunctuationEnabled
{
  return (*((unsigned __int8 *)&self->_isAutoPunctuationEnabled + 1) >> 1) & 1;
}

- (void)setIsAutoPunctuationEnabled:(BOOL)a3
{
  *(&self->_isAutoPunctuationEnabled + 1) |= 2u;
  self->_int isAutoPunctuationEnabled = a3;
}

- (id)enabledDictationLocalesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_enabledDictationLocales objectAtIndexedSubscript:a3];
}

- (unint64_t)enabledDictationLocalesCount
{
  return [(NSArray *)self->_enabledDictationLocales count];
}

- (void)addEnabledDictationLocales:(id)a3
{
  id v4 = a3;
  enabledDictationLocales = self->_enabledDictationLocales;
  id v8 = v4;
  if (!enabledDictationLocales)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_enabledDictationLocales;
    self->_enabledDictationLocales = v6;

    id v4 = v8;
    enabledDictationLocales = self->_enabledDictationLocales;
  }
  [(NSArray *)enabledDictationLocales addObject:v4];
}

- (void)clearEnabledDictationLocales
{
}

- (void)deleteIsDictationEnabled
{
  *(&self->_isAutoPunctuationEnabled + 1) &= ~1u;
}

- (void)setHasIsDictationEnabled:(BOOL)a3
{
  *(&self->_isAutoPunctuationEnabled + 1) = *(&self->_isAutoPunctuationEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasIsDictationEnabled
{
  return *(&self->_isAutoPunctuationEnabled + 1);
}

- (void)setIsDictationEnabled:(BOOL)a3
{
  *(&self->_isAutoPunctuationEnabled + 1) |= 1u;
  self->_int isDictationEnabled = a3;
}

@end