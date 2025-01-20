@interface IFTSchemaIFTCustom
- (BOOL)hasBundleId;
- (BOOL)hasCustomTypeName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTCustom)initWithDictionary:(id)a3;
- (IFTSchemaIFTCustom)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)bundleId;
- (NSString)customTypeName;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteBundleId;
- (void)deleteCustomTypeName;
- (void)setBundleId:(id)a3;
- (void)setCustomTypeName:(id)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasCustomTypeName:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTCustom

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IFTSchemaIFTCustom;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(IFTSchemaIFTCustom *)self deleteBundleId];
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
  objc_storeStrong((id *)&self->_customTypeName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)setHasCustomTypeName:(BOOL)a3
{
  self->_hasCustomTypeName = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  self->_hasBundleId = a3;
}

- (void)setCustomTypeName:(id)a3
{
}

- (NSString)customTypeName
{
  return self->_customTypeName;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (IFTSchemaIFTCustom)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTCustom;
  v5 = [(IFTSchemaIFTCustom *)&v12 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IFTSchemaIFTCustom *)v5 setBundleId:v7];
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"customTypeName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(IFTSchemaIFTCustom *)v5 setCustomTypeName:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (IFTSchemaIFTCustom)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTCustom *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTCustom *)self dictionaryRepresentation];
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
    id v4 = [(IFTSchemaIFTCustom *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (self->_customTypeName)
  {
    int v6 = [(IFTSchemaIFTCustom *)self customTypeName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"customTypeName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  return [(NSString *)self->_customTypeName hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(IFTSchemaIFTCustom *)self bundleId];
  int v6 = [v4 bundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(IFTSchemaIFTCustom *)self bundleId];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [(IFTSchemaIFTCustom *)self bundleId];
    v10 = [v4 bundleId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(IFTSchemaIFTCustom *)self customTypeName];
  int v6 = [v4 customTypeName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(IFTSchemaIFTCustom *)self customTypeName];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(IFTSchemaIFTCustom *)self customTypeName];
    v15 = [v4 customTypeName];
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
  id v4 = [(IFTSchemaIFTCustom *)self bundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(IFTSchemaIFTCustom *)self customTypeName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTCustomReadFrom(self, (uint64_t)a3);
}

- (void)deleteCustomTypeName
{
}

- (BOOL)hasCustomTypeName
{
  return self->_customTypeName != 0;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

@end