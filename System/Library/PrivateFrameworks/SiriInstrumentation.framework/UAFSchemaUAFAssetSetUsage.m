@interface UAFSchemaUAFAssetSetUsage
- (BOOL)hasUsageName;
- (BOOL)hasUsageValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)usageName;
- (NSString)usageValue;
- (UAFSchemaUAFAssetSetUsage)initWithDictionary:(id)a3;
- (UAFSchemaUAFAssetSetUsage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteUsageName;
- (void)deleteUsageValue;
- (void)setHasUsageName:(BOOL)a3;
- (void)setHasUsageValue:(BOOL)a3;
- (void)setUsageName:(id)a3;
- (void)setUsageValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UAFSchemaUAFAssetSetUsage

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageValue, 0);
  objc_storeStrong((id *)&self->_usageName, 0);
}

- (void)setHasUsageValue:(BOOL)a3
{
  self->_hasUsageValue = a3;
}

- (void)setHasUsageName:(BOOL)a3
{
  self->_hasUsageName = a3;
}

- (void)setUsageValue:(id)a3
{
}

- (NSString)usageValue
{
  return self->_usageValue;
}

- (void)setUsageName:(id)a3
{
}

- (NSString)usageName
{
  return self->_usageName;
}

- (UAFSchemaUAFAssetSetUsage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UAFSchemaUAFAssetSetUsage;
  v5 = [(UAFSchemaUAFAssetSetUsage *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"usageName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(UAFSchemaUAFAssetSetUsage *)v5 setUsageName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"usageValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(UAFSchemaUAFAssetSetUsage *)v5 setUsageValue:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (UAFSchemaUAFAssetSetUsage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(UAFSchemaUAFAssetSetUsage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(UAFSchemaUAFAssetSetUsage *)self dictionaryRepresentation];
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
  if (self->_usageName)
  {
    id v4 = [(UAFSchemaUAFAssetSetUsage *)self usageName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"usageName"];
  }
  if (self->_usageValue)
  {
    v6 = [(UAFSchemaUAFAssetSetUsage *)self usageValue];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"usageValue"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_usageName hash];
  return [(NSString *)self->_usageValue hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(UAFSchemaUAFAssetSetUsage *)self usageName];
  v6 = [v4 usageName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(UAFSchemaUAFAssetSetUsage *)self usageName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(UAFSchemaUAFAssetSetUsage *)self usageName];
    v10 = [v4 usageName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(UAFSchemaUAFAssetSetUsage *)self usageValue];
  v6 = [v4 usageValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(UAFSchemaUAFAssetSetUsage *)self usageValue];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(UAFSchemaUAFAssetSetUsage *)self usageValue];
    v15 = [v4 usageValue];
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
  id v4 = [(UAFSchemaUAFAssetSetUsage *)self usageName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(UAFSchemaUAFAssetSetUsage *)self usageValue];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetSetUsageReadFrom(self, (uint64_t)a3);
}

- (void)deleteUsageValue
{
}

- (BOOL)hasUsageValue
{
  return self->_usageValue != 0;
}

- (void)deleteUsageName
{
}

- (BOOL)hasUsageName
{
  return self->_usageName != 0;
}

@end