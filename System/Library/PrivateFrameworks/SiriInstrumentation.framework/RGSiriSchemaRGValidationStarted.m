@interface RGSiriSchemaRGValidationStarted
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasValidationsMobileAssetVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)validationsMobileAssetVersion;
- (RGSiriSchemaRGValidationStarted)initWithDictionary:(id)a3;
- (RGSiriSchemaRGValidationStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteValidationsMobileAssetVersion;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasValidationsMobileAssetVersion:(BOOL)a3;
- (void)setValidationsMobileAssetVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RGSiriSchemaRGValidationStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasValidationsMobileAssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setValidationsMobileAssetVersion:(id)a3
{
}

- (NSString)validationsMobileAssetVersion
{
  return self->_validationsMobileAssetVersion;
}

- (BOOL)exists
{
  return self->_exists;
}

- (RGSiriSchemaRGValidationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RGSiriSchemaRGValidationStarted;
  v5 = [(RGSiriSchemaRGValidationStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RGSiriSchemaRGValidationStarted setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"validationsMobileAssetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(RGSiriSchemaRGValidationStarted *)v5 setValidationsMobileAssetVersion:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (RGSiriSchemaRGValidationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RGSiriSchemaRGValidationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RGSiriSchemaRGValidationStarted *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[RGSiriSchemaRGValidationStarted exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_validationsMobileAssetVersion)
  {
    v5 = [(RGSiriSchemaRGValidationStarted *)self validationsMobileAssetVersion];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"validationsMobileAssetVersion"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_validationsMobileAssetVersion hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int exists = self->_exists, exists == [v4 exists]))
      {
        v6 = [(RGSiriSchemaRGValidationStarted *)self validationsMobileAssetVersion];
        uint64_t v7 = [v4 validationsMobileAssetVersion];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(RGSiriSchemaRGValidationStarted *)self validationsMobileAssetVersion];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(RGSiriSchemaRGValidationStarted *)self validationsMobileAssetVersion];
          v12 = [v4 validationsMobileAssetVersion];
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
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(RGSiriSchemaRGValidationStarted *)self validationsMobileAssetVersion];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGValidationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteValidationsMobileAssetVersion
{
}

- (BOOL)hasValidationsMobileAssetVersion
{
  return self->_validationsMobileAssetVersion != 0;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end