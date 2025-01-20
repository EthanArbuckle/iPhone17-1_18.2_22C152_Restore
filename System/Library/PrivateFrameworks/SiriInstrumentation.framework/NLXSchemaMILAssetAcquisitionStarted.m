@interface NLXSchemaMILAssetAcquisitionStarted
- (BOOL)hasModel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMILAssetAcquisitionStarted)initWithDictionary:(id)a3;
- (NLXSchemaMILAssetAcquisitionStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)model;
- (unint64_t)hash;
- (void)deleteModel;
- (void)setHasModel:(BOOL)a3;
- (void)setModel:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMILAssetAcquisitionStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)model
{
  return self->_model;
}

- (NLXSchemaMILAssetAcquisitionStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaMILAssetAcquisitionStarted;
  v5 = [(NLXSchemaMILAssetAcquisitionStarted *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"model"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaMILAssetAcquisitionStarted setModel:](v5, "setModel:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (NLXSchemaMILAssetAcquisitionStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMILAssetAcquisitionStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMILAssetAcquisitionStarted *)self dictionaryRepresentation];
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
    if ([(NLXSchemaMILAssetAcquisitionStarted *)self model] == 1) {
      id v4 = @"MILASSETACQUISITIONMODEL_NLV4";
    }
    else {
      id v4 = @"MILASSETACQUISITIONMODEL_UNKNOWN";
    }
    [v3 setObject:v4 forKeyedSubscript:@"model"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_model;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0 || (int model = self->_model, model == [v4 model])) {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMILAssetAcquisitionStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteModel
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasModel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setModel:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int model = a3;
}

@end