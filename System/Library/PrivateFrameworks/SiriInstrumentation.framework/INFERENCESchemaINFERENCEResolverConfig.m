@interface INFERENCESchemaINFERENCEResolverConfig
- (BOOL)hasContactConfig;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEContactResolverConfig)contactConfig;
- (INFERENCESchemaINFERENCEResolverConfig)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEResolverConfig)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichConfigurationtype;
- (void)deleteContactConfig;
- (void)setContactConfig:(id)a3;
- (void)setHasContactConfig:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEResolverConfig

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCEResolverConfig;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEResolverConfig *)self contactConfig];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(INFERENCESchemaINFERENCEResolverConfig *)self deleteContactConfig];
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

- (void)setHasContactConfig:(BOOL)a3
{
  self->_hasContactConfig = a3;
}

- (BOOL)hasContactConfig
{
  return self->_hasContactConfig;
}

- (unint64_t)whichConfigurationtype
{
  return self->_whichConfigurationtype;
}

- (INFERENCESchemaINFERENCEResolverConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INFERENCESchemaINFERENCEResolverConfig;
  v5 = [(INFERENCESchemaINFERENCEResolverConfig *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contactConfig"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCEContactResolverConfig alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEResolverConfig *)v5 setContactConfig:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEResolverConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEResolverConfig *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEResolverConfig *)self dictionaryRepresentation];
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
  if (self->_contactConfig)
  {
    id v4 = [(INFERENCESchemaINFERENCEResolverConfig *)self contactConfig];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contactConfig"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"contactConfig"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(INFERENCESchemaINFERENCEContactResolverConfig *)self->_contactConfig hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichConfigurationtype = self->_whichConfigurationtype;
    if (whichConfigurationtype == [v4 whichConfigurationtype])
    {
      v6 = [(INFERENCESchemaINFERENCEResolverConfig *)self contactConfig];
      uint64_t v7 = [v4 contactConfig];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(INFERENCESchemaINFERENCEResolverConfig *)self contactConfig];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(INFERENCESchemaINFERENCEResolverConfig *)self contactConfig];
        v12 = [v4 contactConfig];
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
  id v4 = [(INFERENCESchemaINFERENCEResolverConfig *)self contactConfig];

  if (v4)
  {
    v5 = [(INFERENCESchemaINFERENCEResolverConfig *)self contactConfig];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEResolverConfigReadFrom(self, (uint64_t)a3);
}

- (void)deleteContactConfig
{
  if (self->_whichConfigurationtype == 2)
  {
    self->_unint64_t whichConfigurationtype = 0;
    self->_contactConfig = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEContactResolverConfig)contactConfig
{
  if (self->_whichConfigurationtype == 2) {
    v2 = self->_contactConfig;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContactConfig:(id)a3
{
  self->_unint64_t whichConfigurationtype = 2 * (a3 != 0);
  objc_storeStrong((id *)&self->_contactConfig, a3);
}

@end