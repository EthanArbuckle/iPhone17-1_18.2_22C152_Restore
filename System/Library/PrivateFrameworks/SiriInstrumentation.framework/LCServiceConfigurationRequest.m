@interface LCServiceConfigurationRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LCServiceConfigurationRequest)initWithDictionary:(id)a3;
- (LCServiceConfigurationRequest)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
@end

@implementation LCServiceConfigurationRequest

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (LCServiceConfigurationRequest)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LCServiceConfigurationRequest;
  v3 = [(LCServiceConfigurationRequest *)&v7 init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (LCServiceConfigurationRequest)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LCServiceConfigurationRequest *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LCServiceConfigurationRequest *)self dictionaryRepresentation];
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
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceConfigurationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

@end