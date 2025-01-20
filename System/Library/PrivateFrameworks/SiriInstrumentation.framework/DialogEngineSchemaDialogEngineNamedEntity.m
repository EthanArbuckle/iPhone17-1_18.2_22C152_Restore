@interface DialogEngineSchemaDialogEngineNamedEntity
- (BOOL)hasCatParameter;
- (BOOL)hasCatParameterValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DialogEngineSchemaDialogEngineNamedEntity)initWithDictionary:(id)a3;
- (DialogEngineSchemaDialogEngineNamedEntity)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)catParameterValue;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)catParameter;
- (unint64_t)hash;
- (void)deleteCatParameter;
- (void)deleteCatParameterValue;
- (void)setCatParameter:(int)a3;
- (void)setCatParameterValue:(id)a3;
- (void)setHasCatParameter:(BOOL)a3;
- (void)setHasCatParameterValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation DialogEngineSchemaDialogEngineNamedEntity

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasCatParameterValue:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCatParameterValue:(id)a3
{
}

- (NSString)catParameterValue
{
  return self->_catParameterValue;
}

- (int)catParameter
{
  return self->_catParameter;
}

- (DialogEngineSchemaDialogEngineNamedEntity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DialogEngineSchemaDialogEngineNamedEntity;
  v5 = [(DialogEngineSchemaDialogEngineNamedEntity *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"catParameter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DialogEngineSchemaDialogEngineNamedEntity setCatParameter:](v5, "setCatParameter:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"catParameterValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(DialogEngineSchemaDialogEngineNamedEntity *)v5 setCatParameterValue:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (DialogEngineSchemaDialogEngineNamedEntity)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DialogEngineSchemaDialogEngineNamedEntity *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DialogEngineSchemaDialogEngineNamedEntity *)self dictionaryRepresentation];
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
    unsigned int v4 = [(DialogEngineSchemaDialogEngineNamedEntity *)self catParameter] - 1;
    if (v4 > 0x44) {
      v5 = @"DIALOGENGINENAMEDENTITYPARAMETER__UNKNOWN";
    }
    else {
      v5 = off_1E5EBFA58[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"catParameter"];
  }
  if (self->_catParameterValue)
  {
    v6 = [(DialogEngineSchemaDialogEngineNamedEntity *)self catParameterValue];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"catParameterValue"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_catParameter;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_catParameterValue hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int catParameter = self->_catParameter, catParameter == [v4 catParameter]))
      {
        v6 = [(DialogEngineSchemaDialogEngineNamedEntity *)self catParameterValue];
        uint64_t v7 = [v4 catParameterValue];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(DialogEngineSchemaDialogEngineNamedEntity *)self catParameterValue];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(DialogEngineSchemaDialogEngineNamedEntity *)self catParameterValue];
          v12 = [v4 catParameterValue];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v4 = [(DialogEngineSchemaDialogEngineNamedEntity *)self catParameterValue];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return DialogEngineSchemaDialogEngineNamedEntityReadFrom(self, (uint64_t)a3);
}

- (void)deleteCatParameterValue
{
}

- (BOOL)hasCatParameterValue
{
  return self->_catParameterValue != 0;
}

- (void)deleteCatParameter
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCatParameter:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCatParameter
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCatParameter:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int catParameter = a3;
}

@end