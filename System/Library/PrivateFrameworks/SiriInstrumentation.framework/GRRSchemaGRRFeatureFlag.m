@interface GRRSchemaGRRFeatureFlag
- (BOOL)hasFeatureFlagKey;
- (BOOL)hasIsEnabled;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRRSchemaGRRFeatureFlag)initWithDictionary:(id)a3;
- (GRRSchemaGRRFeatureFlag)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)featureFlagKey;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteFeatureFlagKey;
- (void)deleteIsEnabled;
- (void)setFeatureFlagKey:(id)a3;
- (void)setHasFeatureFlagKey:(BOOL)a3;
- (void)setHasIsEnabled:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRRSchemaGRRFeatureFlag

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasFeatureFlagKey:(BOOL)a3
{
  *(&self->_isEnabled + 2) = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setFeatureFlagKey:(id)a3
{
}

- (NSString)featureFlagKey
{
  return self->_featureFlagKey;
}

- (GRRSchemaGRRFeatureFlag)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GRRSchemaGRRFeatureFlag;
  v5 = [(GRRSchemaGRRFeatureFlag *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"featureFlagKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(GRRSchemaGRRFeatureFlag *)v5 setFeatureFlagKey:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeatureFlag setIsEnabled:](v5, "setIsEnabled:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (GRRSchemaGRRFeatureFlag)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRRSchemaGRRFeatureFlag *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRRSchemaGRRFeatureFlag *)self dictionaryRepresentation];
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
  if (self->_featureFlagKey)
  {
    id v4 = [(GRRSchemaGRRFeatureFlag *)self featureFlagKey];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"featureFlagKey"];
  }
  if (*(&self->_isEnabled + 1))
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeatureFlag isEnabled](self, "isEnabled"));
    [v3 setObject:v6 forKeyedSubscript:@"isEnabled"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureFlagKey hash];
  if (*(&self->_isEnabled + 1)) {
    uint64_t v4 = 2654435761 * self->_isEnabled;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(GRRSchemaGRRFeatureFlag *)self featureFlagKey];
  v6 = [v4 featureFlagKey];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(GRRSchemaGRRFeatureFlag *)self featureFlagKey];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(GRRSchemaGRRFeatureFlag *)self featureFlagKey];
    objc_super v11 = [v4 featureFlagKey];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (*(&self->_isEnabled + 1) != (v4[17] & 1)) {
    goto LABEL_12;
  }
  if (*(&self->_isEnabled + 1))
  {
    int isEnabled = self->_isEnabled;
    if (isEnabled != [v4 isEnabled]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(GRRSchemaGRRFeatureFlag *)self featureFlagKey];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(&self->_isEnabled + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRFeatureFlagReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsEnabled
{
  *(&self->_isEnabled + 1) &= ~1u;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  *(&self->_isEnabled + 1) = *(&self->_isEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasIsEnabled
{
  return *(&self->_isEnabled + 1);
}

- (void)setIsEnabled:(BOOL)a3
{
  *(&self->_isEnabled + 1) |= 1u;
  self->_int isEnabled = a3;
}

- (void)deleteFeatureFlagKey
{
}

- (BOOL)hasFeatureFlagKey
{
  return self->_featureFlagKey != 0;
}

@end