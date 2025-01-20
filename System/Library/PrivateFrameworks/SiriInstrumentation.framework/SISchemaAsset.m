@interface SISchemaAsset
- (BOOL)hasAssetLocale;
- (BOOL)hasAssetName;
- (BOOL)hasAssetVersion;
- (BOOL)hasTrialNamespace;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)assetName;
- (NSString)trialNamespace;
- (SISchemaAsset)initWithDictionary:(id)a3;
- (SISchemaAsset)initWithJSON:(id)a3;
- (SISchemaVersion)assetVersion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)assetLocale;
- (unint64_t)hash;
- (void)deleteAssetLocale;
- (void)deleteAssetName;
- (void)deleteAssetVersion;
- (void)deleteTrialNamespace;
- (void)setAssetLocale:(int)a3;
- (void)setAssetName:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setHasAssetLocale:(BOOL)a3;
- (void)setHasAssetName:(BOOL)a3;
- (void)setHasAssetVersion:(BOOL)a3;
- (void)setHasTrialNamespace:(BOOL)a3;
- (void)setTrialNamespace:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaAsset

- (void)setTrialNamespace:(id)a3
{
}

- (void)setAssetVersion:(id)a3
{
}

- (void)setAssetName:(id)a3
{
}

- (void)setAssetLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_assetLocale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong((id *)&self->_trialNamespace, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  v4 = [(SISchemaAsset *)self trialNamespace];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SISchemaAsset *)self assetName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(SISchemaAsset *)self assetVersion];

  if (v6)
  {
    v7 = [(SISchemaAsset *)self assetVersion];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (SISchemaVersion)assetVersion
{
  return self->_assetVersion;
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaAsset;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaAsset *)self assetVersion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaAsset *)self deleteAssetVersion];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)setHasAssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAssetName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTrialNamespace:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)assetLocale
{
  return self->_assetLocale;
}

- (SISchemaAsset)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SISchemaAsset;
  v5 = [(SISchemaAsset *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"trialNamespace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaAsset *)v5 setTrialNamespace:v7];
    }
    id v8 = [v4 objectForKeyedSubscript:@"assetName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(SISchemaAsset *)v5 setAssetName:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"assetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[SISchemaVersion alloc] initWithDictionary:v10];
      [(SISchemaAsset *)v5 setAssetVersion:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"assetLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAsset setAssetLocale:](v5, "setAssetLocale:", [v12 intValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (SISchemaAsset)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaAsset *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaAsset *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(SISchemaAsset *)self assetLocale] - 1;
    if (v4 > 0x3D) {
      v5 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v5 = off_1E5EB54E8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"assetLocale"];
  }
  if (self->_assetName)
  {
    v6 = [(SISchemaAsset *)self assetName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"assetName"];
  }
  if (self->_assetVersion)
  {
    id v8 = [(SISchemaAsset *)self assetVersion];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"assetVersion"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"assetVersion"];
    }
  }
  if (self->_trialNamespace)
  {
    v11 = [(SISchemaAsset *)self trialNamespace];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"trialNamespace"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_trialNamespace hash];
  NSUInteger v4 = [(NSString *)self->_assetName hash];
  unint64_t v5 = [(SISchemaVersion *)self->_assetVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_assetLocale;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t v5 = [(SISchemaAsset *)self trialNamespace];
  uint64_t v6 = [v4 trialNamespace];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SISchemaAsset *)self trialNamespace];
  if (v7)
  {
    id v8 = (void *)v7;
    objc_super v9 = [(SISchemaAsset *)self trialNamespace];
    v10 = [v4 trialNamespace];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaAsset *)self assetName];
  uint64_t v6 = [v4 assetName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(SISchemaAsset *)self assetName];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(SISchemaAsset *)self assetName];
    objc_super v15 = [v4 assetName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaAsset *)self assetVersion];
  uint64_t v6 = [v4 assetVersion];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(SISchemaAsset *)self assetVersion];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(SISchemaAsset *)self assetVersion];
    v20 = [v4 assetVersion];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int assetLocale = self->_assetLocale, assetLocale == [v4 assetLocale]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAssetReadFrom(self, (uint64_t)a3);
}

- (void)deleteAssetLocale
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAssetLocale:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetLocale
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)deleteAssetVersion
{
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)deleteAssetName
{
}

- (BOOL)hasAssetName
{
  return self->_assetName != 0;
}

- (void)deleteTrialNamespace
{
}

- (BOOL)hasTrialNamespace
{
  return self->_trialNamespace != 0;
}

@end