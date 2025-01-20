@interface NLXSchemaCDMClientWarmupStarted
- (BOOL)hasServiceGraphName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMClientWarmupStarted)initWithDictionary:(id)a3;
- (NLXSchemaCDMClientWarmupStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)serviceGraphName;
- (unint64_t)hash;
- (void)deleteServiceGraphName;
- (void)setHasServiceGraphName:(BOOL)a3;
- (void)setServiceGraphName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMClientWarmupStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)serviceGraphName
{
  return self->_serviceGraphName;
}

- (NLXSchemaCDMClientWarmupStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMClientWarmupStarted;
  v5 = [(NLXSchemaCDMClientWarmupStarted *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"serviceGraphName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMClientWarmupStarted setServiceGraphName:](v5, "setServiceGraphName:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (NLXSchemaCDMClientWarmupStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMClientWarmupStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMClientWarmupStarted *)self dictionaryRepresentation];
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
    unsigned int v4 = [(NLXSchemaCDMClientWarmupStarted *)self serviceGraphName] - 1;
    if (v4 > 6) {
      v5 = @"CDMSERVICEGRAPHNAME_UNKNOWN";
    }
    else {
      v5 = off_1E5EBB568[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"serviceGraphName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_serviceGraphName;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int serviceGraphName = self->_serviceGraphName,
            serviceGraphName == [v4 serviceGraphName]))
      {
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
  return NLXSchemaCDMClientWarmupStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteServiceGraphName
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasServiceGraphName:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServiceGraphName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setServiceGraphName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int serviceGraphName = a3;
}

@end