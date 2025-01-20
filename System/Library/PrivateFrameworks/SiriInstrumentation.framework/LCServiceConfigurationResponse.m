@interface LCServiceConfigurationResponse
- (BOOL)hasConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LCServiceConfigurationResponse)initWithDictionary:(id)a3;
- (LCServiceConfigurationResponse)initWithJSON:(id)a3;
- (LCServiceLoggingConfiguration)configuration;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichResponse;
- (void)deleteConfiguration;
- (void)setConfiguration:(id)a3;
- (void)setHasConfiguration:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation LCServiceConfigurationResponse

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LCServiceConfigurationResponse;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(LCServiceConfigurationResponse *)self configuration];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(LCServiceConfigurationResponse *)self deleteConfiguration];
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

- (void)setHasConfiguration:(BOOL)a3
{
  self->_hasConfiguration = a3;
}

- (BOOL)hasConfiguration
{
  return self->_hasConfiguration;
}

- (unint64_t)whichResponse
{
  return self->_whichResponse;
}

- (LCServiceConfigurationResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LCServiceConfigurationResponse;
  v5 = [(LCServiceConfigurationResponse *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"configuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[LCServiceLoggingConfiguration alloc] initWithDictionary:v6];
      [(LCServiceConfigurationResponse *)v5 setConfiguration:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (LCServiceConfigurationResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LCServiceConfigurationResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LCServiceConfigurationResponse *)self dictionaryRepresentation];
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
  if (self->_configuration)
  {
    id v4 = [(LCServiceConfigurationResponse *)self configuration];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"configuration"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"configuration"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(LCServiceLoggingConfiguration *)self->_configuration hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichResponse = self->_whichResponse;
    if (whichResponse == [v4 whichResponse])
    {
      v6 = [(LCServiceConfigurationResponse *)self configuration];
      uint64_t v7 = [v4 configuration];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(LCServiceConfigurationResponse *)self configuration];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(LCServiceConfigurationResponse *)self configuration];
        v12 = [v4 configuration];
        char v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(LCServiceConfigurationResponse *)self configuration];

  if (v4)
  {
    v5 = [(LCServiceConfigurationResponse *)self configuration];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceConfigurationResponseReadFrom(self, (uint64_t)a3);
}

- (void)deleteConfiguration
{
  if (self->_whichResponse == 1)
  {
    self->_unint64_t whichResponse = 0;
    self->_configuration = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LCServiceLoggingConfiguration)configuration
{
  if (self->_whichResponse == 1) {
    v2 = self->_configuration;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setConfiguration:(id)a3
{
  self->_unint64_t whichResponse = a3 != 0;
  objc_storeStrong((id *)&self->_configuration, a3);
}

@end