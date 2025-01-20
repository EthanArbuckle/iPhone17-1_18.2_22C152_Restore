@interface ODDSiriSchemaODDRequestsWithoutAssetsDigest
- (BOOL)hasCounts;
- (BOOL)hasDimensions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDRequestsWithoutAssetsCounts)counts;
- (ODDSiriSchemaODDRequestsWithoutAssetsDigest)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDRequestsWithoutAssetsDigest)initWithJSON:(id)a3;
- (ODDSiriSchemaODDRequestsWithoutAssetsDimensions)dimensions;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCounts;
- (void)deleteDimensions;
- (void)setCounts:(id)a3;
- (void)setDimensions:(id)a3;
- (void)setHasCounts:(BOOL)a3;
- (void)setHasDimensions:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDRequestsWithoutAssetsDigest

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODDSiriSchemaODDRequestsWithoutAssetsDigest;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self dimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self deleteDimensions];
  }
  v9 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self counts];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self deleteCounts];
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
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

- (void)setHasCounts:(BOOL)a3
{
  self->_hasCounts = a3;
}

- (void)setHasDimensions:(BOOL)a3
{
  self->_hasDimensions = a3;
}

- (void)setCounts:(id)a3
{
}

- (ODDSiriSchemaODDRequestsWithoutAssetsCounts)counts
{
  return self->_counts;
}

- (void)setDimensions:(id)a3
{
}

- (ODDSiriSchemaODDRequestsWithoutAssetsDimensions)dimensions
{
  return self->_dimensions;
}

- (ODDSiriSchemaODDRequestsWithoutAssetsDigest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDRequestsWithoutAssetsDigest;
  v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDRequestsWithoutAssetsDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)v5 setDimensions:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"counts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDRequestsWithoutAssetsCounts alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)v5 setCounts:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDRequestsWithoutAssetsDigest)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self dictionaryRepresentation];
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
  if (self->_counts)
  {
    id v4 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self counts];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"counts"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"counts"];
    }
  }
  if (self->_dimensions)
  {
    uint64_t v7 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self dimensions];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"dimensions"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"dimensions"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self->_dimensions hash];
  return [(ODDSiriSchemaODDRequestsWithoutAssetsCounts *)self->_counts hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self dimensions];
  v6 = [v4 dimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self dimensions];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self dimensions];
    v10 = [v4 dimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self counts];
  v6 = [v4 counts];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self counts];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self counts];
    v15 = [v4 counts];
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
  id v4 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self dimensions];

  if (v4)
  {
    v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self dimensions];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self counts];

  if (v6)
  {
    uint64_t v7 = [(ODDSiriSchemaODDRequestsWithoutAssetsDigest *)self counts];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDRequestsWithoutAssetsDigestReadFrom(self, (uint64_t)a3);
}

- (void)deleteCounts
{
}

- (BOOL)hasCounts
{
  return self->_counts != 0;
}

- (void)deleteDimensions
{
}

- (BOOL)hasDimensions
{
  return self->_dimensions != 0;
}

@end