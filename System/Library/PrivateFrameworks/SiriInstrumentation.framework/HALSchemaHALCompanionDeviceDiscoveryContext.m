@interface HALSchemaHALCompanionDeviceDiscoveryContext
- (BOOL)hasEnded;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HALSchemaHALCompanionDeviceDiscoveryContext)initWithDictionary:(id)a3;
- (HALSchemaHALCompanionDeviceDiscoveryContext)initWithJSON:(id)a3;
- (HALSchemaHALCompanionDeviceDiscoveryEnded)ended;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteEnded;
- (void)setEnded:(id)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HALSchemaHALCompanionDeviceDiscoveryContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HALSchemaHALCompanionDeviceDiscoveryContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(HALSchemaHALCompanionDeviceDiscoveryContext *)self ended];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(HALSchemaHALCompanionDeviceDiscoveryContext *)self deleteEnded];
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

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (HALSchemaHALCompanionDeviceDiscoveryContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HALSchemaHALCompanionDeviceDiscoveryContext;
  v5 = [(HALSchemaHALCompanionDeviceDiscoveryContext *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[HALSchemaHALCompanionDeviceDiscoveryEnded alloc] initWithDictionary:v6];
      [(HALSchemaHALCompanionDeviceDiscoveryContext *)v5 setEnded:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (HALSchemaHALCompanionDeviceDiscoveryContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HALSchemaHALCompanionDeviceDiscoveryContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HALSchemaHALCompanionDeviceDiscoveryContext *)self dictionaryRepresentation];
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
  if (self->_ended)
  {
    id v4 = [(HALSchemaHALCompanionDeviceDiscoveryContext *)self ended];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"ended"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"ended"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(HALSchemaHALCompanionDeviceDiscoveryEnded *)self->_ended hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichContextevent = self->_whichContextevent;
    if (whichContextevent == [v4 whichContextevent])
    {
      v6 = [(HALSchemaHALCompanionDeviceDiscoveryContext *)self ended];
      uint64_t v7 = [v4 ended];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(HALSchemaHALCompanionDeviceDiscoveryContext *)self ended];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(HALSchemaHALCompanionDeviceDiscoveryContext *)self ended];
        v12 = [v4 ended];
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
  id v4 = [(HALSchemaHALCompanionDeviceDiscoveryContext *)self ended];

  if (v4)
  {
    v5 = [(HALSchemaHALCompanionDeviceDiscoveryContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALCompanionDeviceDiscoveryContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 2)
  {
    self->_unint64_t whichContextevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HALSchemaHALCompanionDeviceDiscoveryEnded)ended
{
  if (self->_whichContextevent == 2) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  self->_unint64_t whichContextevent = 2 * (a3 != 0);
  objc_storeStrong((id *)&self->_ended, a3);
}

@end