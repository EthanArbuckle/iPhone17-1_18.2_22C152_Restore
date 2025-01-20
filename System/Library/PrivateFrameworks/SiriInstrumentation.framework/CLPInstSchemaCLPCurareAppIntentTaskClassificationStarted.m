@interface CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted
- (BOOL)hasClassifierModelAsset;
- (BOOL)hasClassifierModelType;
- (BOOL)hasNlv4AssetVersion;
- (BOOL)hasNlv4AssetVersionOverride;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaAsset)classifierModelAsset;
- (SISchemaAsset)nlv4AssetVersion;
- (SISchemaAsset)nlv4AssetVersionOverride;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)classifierModelType;
- (unint64_t)hash;
- (void)deleteClassifierModelAsset;
- (void)deleteClassifierModelType;
- (void)deleteNlv4AssetVersion;
- (void)deleteNlv4AssetVersionOverride;
- (void)setClassifierModelAsset:(id)a3;
- (void)setClassifierModelType:(int)a3;
- (void)setHasClassifierModelAsset:(BOOL)a3;
- (void)setHasClassifierModelType:(BOOL)a3;
- (void)setHasNlv4AssetVersion:(BOOL)a3;
- (void)setHasNlv4AssetVersionOverride:(BOOL)a3;
- (void)setNlv4AssetVersion:(id)a3;
- (void)setNlv4AssetVersionOverride:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self classifierModelAsset];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self deleteClassifierModelAsset];
  }
  v9 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersion];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self deleteNlv4AssetVersion];
  }
  v12 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersionOverride];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self deleteNlv4AssetVersionOverride];
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
  objc_storeStrong((id *)&self->_nlv4AssetVersionOverride, 0);
  objc_storeStrong((id *)&self->_nlv4AssetVersion, 0);
  objc_storeStrong((id *)&self->_classifierModelAsset, 0);
}

- (void)setHasNlv4AssetVersionOverride:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasNlv4AssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasClassifierModelAsset:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setNlv4AssetVersionOverride:(id)a3
{
}

- (SISchemaAsset)nlv4AssetVersionOverride
{
  return self->_nlv4AssetVersionOverride;
}

- (void)setNlv4AssetVersion:(id)a3
{
}

- (SISchemaAsset)nlv4AssetVersion
{
  return self->_nlv4AssetVersion;
}

- (void)setClassifierModelAsset:(id)a3
{
}

- (SISchemaAsset)classifierModelAsset
{
  return self->_classifierModelAsset;
}

- (int)classifierModelType
{
  return self->_classifierModelType;
}

- (CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted;
  v5 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"classifierModelType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted setClassifierModelType:](v5, "setClassifierModelType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"classifierModelAsset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[SISchemaAsset alloc] initWithDictionary:v7];
      [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)v5 setClassifierModelAsset:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"nlv4AssetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaAsset alloc] initWithDictionary:v9];
      [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)v5 setNlv4AssetVersion:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"nlv4AssetVersionOverride"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaAsset alloc] initWithDictionary:v11];
      [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)v5 setNlv4AssetVersionOverride:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self dictionaryRepresentation];
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
  if (self->_classifierModelAsset)
  {
    id v4 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self classifierModelAsset];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"classifierModelAsset"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"classifierModelAsset"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    int v7 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self classifierModelType];
    int v8 = @"CLPAPPINTENTCLASSIFIERMODELTYPE_UNKNOWN";
    if (v7 == 1) {
      int v8 = @"CLPAPPINTENTCLASSIFIERMODELTYPE_SIMPLE_HEURISTIC_HARDCODED";
    }
    if (v7 == 2) {
      v9 = @"CLPAPPINTENTCLASSIFIERMODELTYPE_COREML";
    }
    else {
      v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"classifierModelType"];
  }
  if (self->_nlv4AssetVersion)
  {
    v10 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersion];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"nlv4AssetVersion"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"nlv4AssetVersion"];
    }
  }
  if (self->_nlv4AssetVersionOverride)
  {
    v13 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersionOverride];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"nlv4AssetVersionOverride"];
    }
    else
    {
      objc_super v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"nlv4AssetVersionOverride"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_classifierModelType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SISchemaAsset *)self->_classifierModelAsset hash] ^ v3;
  unint64_t v5 = [(SISchemaAsset *)self->_nlv4AssetVersion hash];
  return v4 ^ v5 ^ [(SISchemaAsset *)self->_nlv4AssetVersionOverride hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int classifierModelType = self->_classifierModelType;
    if (classifierModelType != [v4 classifierModelType]) {
      goto LABEL_20;
    }
  }
  v6 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self classifierModelAsset];
  int v7 = [v4 classifierModelAsset];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v8 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self classifierModelAsset];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self classifierModelAsset];
    int v11 = [v4 classifierModelAsset];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersion];
  int v7 = [v4 nlv4AssetVersion];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersion];
  if (v13)
  {
    int v14 = (void *)v13;
    objc_super v15 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersion];
    objc_super v16 = [v4 nlv4AssetVersion];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersionOverride];
  int v7 = [v4 nlv4AssetVersionOverride];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersionOverride];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersionOverride];
    v21 = [v4 nlv4AssetVersionOverride];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self classifierModelAsset];

  if (v4)
  {
    unint64_t v5 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self classifierModelAsset];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersion];

  if (v6)
  {
    int v7 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersion];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersionOverride];

  v9 = v11;
  if (v8)
  {
    v10 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationStarted *)self nlv4AssetVersionOverride];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCurareAppIntentTaskClassificationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNlv4AssetVersionOverride
{
}

- (BOOL)hasNlv4AssetVersionOverride
{
  return self->_nlv4AssetVersionOverride != 0;
}

- (void)deleteNlv4AssetVersion
{
}

- (BOOL)hasNlv4AssetVersion
{
  return self->_nlv4AssetVersion != 0;
}

- (void)deleteClassifierModelAsset
{
}

- (BOOL)hasClassifierModelAsset
{
  return self->_classifierModelAsset != 0;
}

- (void)deleteClassifierModelType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasClassifierModelType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClassifierModelType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setClassifierModelType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int classifierModelType = a3;
}

@end