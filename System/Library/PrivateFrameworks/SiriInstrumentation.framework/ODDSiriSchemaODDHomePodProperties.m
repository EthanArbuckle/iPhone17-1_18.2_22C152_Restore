@interface ODDSiriSchemaODDHomePodProperties
- (BOOL)hasAdaptiveVolume;
- (BOOL)hasIsPersonalDomainsEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonalDomainsEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAdaptiveVolumeProperties)adaptiveVolume;
- (ODDSiriSchemaODDHomePodProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDHomePodProperties)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAdaptiveVolume;
- (void)deleteIsPersonalDomainsEnabled;
- (void)setAdaptiveVolume:(id)a3;
- (void)setHasAdaptiveVolume:(BOOL)a3;
- (void)setHasIsPersonalDomainsEnabled:(BOOL)a3;
- (void)setIsPersonalDomainsEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDHomePodProperties

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDHomePodProperties;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDHomePodProperties *)self adaptiveVolume];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDHomePodProperties *)self deleteAdaptiveVolume];
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
}

- (void)setHasAdaptiveVolume:(BOOL)a3
{
  *(&self->_isPersonalDomainsEnabled + 2) = a3;
}

- (BOOL)isPersonalDomainsEnabled
{
  return self->_isPersonalDomainsEnabled;
}

- (void)setAdaptiveVolume:(id)a3
{
}

- (ODDSiriSchemaODDAdaptiveVolumeProperties)adaptiveVolume
{
  return self->_adaptiveVolume;
}

- (ODDSiriSchemaODDHomePodProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ODDSiriSchemaODDHomePodProperties;
  v5 = [(ODDSiriSchemaODDHomePodProperties *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"adaptiveVolume"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDAdaptiveVolumeProperties alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDHomePodProperties *)v5 setAdaptiveVolume:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isPersonalDomainsEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDHomePodProperties setIsPersonalDomainsEnabled:](v5, "setIsPersonalDomainsEnabled:", [v8 BOOLValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDHomePodProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDHomePodProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDHomePodProperties *)self dictionaryRepresentation];
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
  if (self->_adaptiveVolume)
  {
    id v4 = [(ODDSiriSchemaODDHomePodProperties *)self adaptiveVolume];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"adaptiveVolume"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"adaptiveVolume"];
    }
  }
  if (*(&self->_isPersonalDomainsEnabled + 1))
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDHomePodProperties isPersonalDomainsEnabled](self, "isPersonalDomainsEnabled"));
    [v3 setObject:v7 forKeyedSubscript:@"isPersonalDomainsEnabled"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDAdaptiveVolumeProperties *)self->_adaptiveVolume hash];
  if (*(&self->_isPersonalDomainsEnabled + 1)) {
    uint64_t v4 = 2654435761 * self->_isPersonalDomainsEnabled;
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
  v5 = [(ODDSiriSchemaODDHomePodProperties *)self adaptiveVolume];
  v6 = [v4 adaptiveVolume];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(ODDSiriSchemaODDHomePodProperties *)self adaptiveVolume];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(ODDSiriSchemaODDHomePodProperties *)self adaptiveVolume];
    objc_super v11 = [v4 adaptiveVolume];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (*(&self->_isPersonalDomainsEnabled + 1) != (v4[17] & 1)) {
    goto LABEL_12;
  }
  if (*(&self->_isPersonalDomainsEnabled + 1))
  {
    int isPersonalDomainsEnabled = self->_isPersonalDomainsEnabled;
    if (isPersonalDomainsEnabled != [v4 isPersonalDomainsEnabled]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(ODDSiriSchemaODDHomePodProperties *)self adaptiveVolume];

  if (v4)
  {
    v5 = [(ODDSiriSchemaODDHomePodProperties *)self adaptiveVolume];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_isPersonalDomainsEnabled + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDHomePodPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsPersonalDomainsEnabled
{
  *(&self->_isPersonalDomainsEnabled + 1) &= ~1u;
}

- (void)setHasIsPersonalDomainsEnabled:(BOOL)a3
{
  *(&self->_isPersonalDomainsEnabled + 1) = *(&self->_isPersonalDomainsEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasIsPersonalDomainsEnabled
{
  return *(&self->_isPersonalDomainsEnabled + 1);
}

- (void)setIsPersonalDomainsEnabled:(BOOL)a3
{
  *(&self->_isPersonalDomainsEnabled + 1) |= 1u;
  self->_int isPersonalDomainsEnabled = a3;
}

- (void)deleteAdaptiveVolume
{
}

- (BOOL)hasAdaptiveVolume
{
  return self->_adaptiveVolume != 0;
}

@end