@interface INFERENCESchemaINFERENCEContact
- (BOOL)hasAnonymizedContactIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEContact)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEContact)initWithJSON:(id)a3;
- (NSArray)anonymizedHandleValues;
- (NSData)jsonData;
- (NSString)anonymizedContactIdentifier;
- (id)anonymizedHandleValuesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)anonymizedHandleValuesCount;
- (unint64_t)hash;
- (void)addAnonymizedHandleValues:(id)a3;
- (void)clearAnonymizedHandleValues;
- (void)deleteAnonymizedContactIdentifier;
- (void)setAnonymizedContactIdentifier:(id)a3;
- (void)setAnonymizedHandleValues:(id)a3;
- (void)setHasAnonymizedContactIdentifier:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEContact

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizedHandleValues, 0);
  objc_storeStrong((id *)&self->_anonymizedContactIdentifier, 0);
}

- (void)setHasAnonymizedContactIdentifier:(BOOL)a3
{
  self->_hasAnonymizedContactIdentifier = a3;
}

- (void)setAnonymizedHandleValues:(id)a3
{
}

- (NSArray)anonymizedHandleValues
{
  return self->_anonymizedHandleValues;
}

- (void)setAnonymizedContactIdentifier:(id)a3
{
}

- (NSString)anonymizedContactIdentifier
{
  return self->_anonymizedContactIdentifier;
}

- (INFERENCESchemaINFERENCEContact)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INFERENCESchemaINFERENCEContact;
  v5 = [(INFERENCESchemaINFERENCEContact *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"anonymizedContactIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(INFERENCESchemaINFERENCEContact *)v5 setAnonymizedContactIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"anonymizedHandleValues"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = objc_msgSend(v14, "copy", (void)v18);
              [(INFERENCESchemaINFERENCEContact *)v5 addAnonymizedHandleValues:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v11);
      }
    }
    v16 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEContact)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEContact *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEContact *)self dictionaryRepresentation];
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
  if (self->_anonymizedContactIdentifier)
  {
    id v4 = [(INFERENCESchemaINFERENCEContact *)self anonymizedContactIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"anonymizedContactIdentifier"];
  }
  if (self->_anonymizedHandleValues)
  {
    v6 = [(INFERENCESchemaINFERENCEContact *)self anonymizedHandleValues];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"anonymizedHandleValues"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_anonymizedContactIdentifier hash];
  return [(NSArray *)self->_anonymizedHandleValues hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(INFERENCESchemaINFERENCEContact *)self anonymizedContactIdentifier];
  v6 = [v4 anonymizedContactIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEContact *)self anonymizedContactIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(INFERENCESchemaINFERENCEContact *)self anonymizedContactIdentifier];
    uint64_t v10 = [v4 anonymizedContactIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(INFERENCESchemaINFERENCEContact *)self anonymizedHandleValues];
  v6 = [v4 anonymizedHandleValues];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(INFERENCESchemaINFERENCEContact *)self anonymizedHandleValues];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    v14 = [(INFERENCESchemaINFERENCEContact *)self anonymizedHandleValues];
    v15 = [v4 anonymizedHandleValues];
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
  v5 = [(INFERENCESchemaINFERENCEContact *)self anonymizedContactIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_anonymizedHandleValues;
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
        PBDataWriterWriteStringField();
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
  return INFERENCESchemaINFERENCEContactReadFrom(self, (uint64_t)a3);
}

- (id)anonymizedHandleValuesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_anonymizedHandleValues objectAtIndexedSubscript:a3];
}

- (unint64_t)anonymizedHandleValuesCount
{
  return [(NSArray *)self->_anonymizedHandleValues count];
}

- (void)addAnonymizedHandleValues:(id)a3
{
  id v4 = a3;
  anonymizedHandleValues = self->_anonymizedHandleValues;
  id v8 = v4;
  if (!anonymizedHandleValues)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_anonymizedHandleValues;
    self->_anonymizedHandleValues = v6;

    id v4 = v8;
    anonymizedHandleValues = self->_anonymizedHandleValues;
  }
  [(NSArray *)anonymizedHandleValues addObject:v4];
}

- (void)clearAnonymizedHandleValues
{
}

- (void)deleteAnonymizedContactIdentifier
{
}

- (BOOL)hasAnonymizedContactIdentifier
{
  return self->_anonymizedContactIdentifier != 0;
}

@end