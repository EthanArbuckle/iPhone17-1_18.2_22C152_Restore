@interface ODDSiriSchemaODDAssetAvailabilityFromBootDigest
- (BOOL)hasDimensions;
- (BOOL)hasTuples;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAssetAvailabilityFromBootDigest)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssetAvailabilityFromBootDigest)initWithJSON:(id)a3;
- (ODDSiriSchemaODDAssetAvailabilityFromBootDimensions)dimensions;
- (ODDSiriSchemaODDAssetAvailabilityFromBootTuples)tuples;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDimensions;
- (void)deleteTuples;
- (void)setDimensions:(id)a3;
- (void)setHasDimensions:(BOOL)a3;
- (void)setHasTuples:(BOOL)a3;
- (void)setTuples:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssetAvailabilityFromBootDigest

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODDSiriSchemaODDAssetAvailabilityFromBootDigest;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self dimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self deleteDimensions];
  }
  v9 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self tuples];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self deleteTuples];
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
  objc_storeStrong((id *)&self->_tuples, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

- (void)setHasTuples:(BOOL)a3
{
  self->_hasTuples = a3;
}

- (void)setHasDimensions:(BOOL)a3
{
  self->_hasDimensions = a3;
}

- (void)setTuples:(id)a3
{
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootTuples)tuples
{
  return self->_tuples;
}

- (void)setDimensions:(id)a3
{
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDimensions)dimensions
{
  return self->_dimensions;
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDigest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDAssetAvailabilityFromBootDigest;
  v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)v5 setDimensions:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"tuples"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDAssetAvailabilityFromBootTuples alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)v5 setTuples:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDigest)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self dictionaryRepresentation];
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
  if (self->_dimensions)
  {
    id v4 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self dimensions];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"dimensions"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"dimensions"];
    }
  }
  if (self->_tuples)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self tuples];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"tuples"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"tuples"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self->_dimensions hash];
  return [(ODDSiriSchemaODDAssetAvailabilityFromBootTuples *)self->_tuples hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self dimensions];
  v6 = [v4 dimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self dimensions];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self dimensions];
    v10 = [v4 dimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self tuples];
  v6 = [v4 tuples];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self tuples];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self tuples];
    v15 = [v4 tuples];
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
  id v8 = a3;
  id v4 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self dimensions];

  if (v4)
  {
    v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self dimensions];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self tuples];

  if (v6)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDigest *)self tuples];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssetAvailabilityFromBootDigestReadFrom(self, (uint64_t)a3);
}

- (void)deleteTuples
{
}

- (BOOL)hasTuples
{
  return self->_tuples != 0;
}

- (void)deleteDimensions
{
}

- (BOOL)hasDimensions
{
  return self->_dimensions != 0;
}

@end