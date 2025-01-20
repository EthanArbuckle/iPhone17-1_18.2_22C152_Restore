@interface QDSchemaQDEntityType
- (BOOL)hasBundleId;
- (BOOL)hasNameOfTypedValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)bundleId;
- (NSString)nameOfTypedValue;
- (QDSchemaQDEntityType)initWithDictionary:(id)a3;
- (QDSchemaQDEntityType)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteBundleId;
- (void)deleteNameOfTypedValue;
- (void)setBundleId:(id)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasNameOfTypedValue:(BOOL)a3;
- (void)setNameOfTypedValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDEntityType

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)QDSchemaQDEntityType;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(QDSchemaQDEntityType *)self deleteBundleId];
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
  objc_storeStrong((id *)&self->_nameOfTypedValue, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)setHasNameOfTypedValue:(BOOL)a3
{
  self->_hasNameOfTypedValue = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  self->_hasBundleId = a3;
}

- (void)setNameOfTypedValue:(id)a3
{
}

- (NSString)nameOfTypedValue
{
  return self->_nameOfTypedValue;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (QDSchemaQDEntityType)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QDSchemaQDEntityType;
  v5 = [(QDSchemaQDEntityType *)&v12 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(QDSchemaQDEntityType *)v5 setBundleId:v7];
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"nameOfTypedValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(QDSchemaQDEntityType *)v5 setNameOfTypedValue:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (QDSchemaQDEntityType)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDEntityType *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDEntityType *)self dictionaryRepresentation];
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
  if (self->_bundleId)
  {
    id v4 = [(QDSchemaQDEntityType *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (self->_nameOfTypedValue)
  {
    int v6 = [(QDSchemaQDEntityType *)self nameOfTypedValue];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"nameOfTypedValue"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  return [(NSString *)self->_nameOfTypedValue hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(QDSchemaQDEntityType *)self bundleId];
  int v6 = [v4 bundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(QDSchemaQDEntityType *)self bundleId];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [(QDSchemaQDEntityType *)self bundleId];
    v10 = [v4 bundleId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(QDSchemaQDEntityType *)self nameOfTypedValue];
  int v6 = [v4 nameOfTypedValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(QDSchemaQDEntityType *)self nameOfTypedValue];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(QDSchemaQDEntityType *)self nameOfTypedValue];
    v15 = [v4 nameOfTypedValue];
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
  id v6 = a3;
  id v4 = [(QDSchemaQDEntityType *)self bundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(QDSchemaQDEntityType *)self nameOfTypedValue];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDEntityTypeReadFrom(self, (uint64_t)a3);
}

- (void)deleteNameOfTypedValue
{
}

- (BOOL)hasNameOfTypedValue
{
  return self->_nameOfTypedValue != 0;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

@end