@interface RGSiriSchemaRGCatalogStarted
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasResponseCatalogMobileAssetVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)responseCatalogMobileAssetVersion;
- (RGSiriSchemaRGCatalogStarted)initWithDictionary:(id)a3;
- (RGSiriSchemaRGCatalogStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteResponseCatalogMobileAssetVersion;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasResponseCatalogMobileAssetVersion:(BOOL)a3;
- (void)setResponseCatalogMobileAssetVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RGSiriSchemaRGCatalogStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasResponseCatalogMobileAssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setResponseCatalogMobileAssetVersion:(id)a3
{
}

- (NSString)responseCatalogMobileAssetVersion
{
  return self->_responseCatalogMobileAssetVersion;
}

- (BOOL)exists
{
  return self->_exists;
}

- (RGSiriSchemaRGCatalogStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RGSiriSchemaRGCatalogStarted;
  v5 = [(RGSiriSchemaRGCatalogStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RGSiriSchemaRGCatalogStarted setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"responseCatalogMobileAssetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(RGSiriSchemaRGCatalogStarted *)v5 setResponseCatalogMobileAssetVersion:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (RGSiriSchemaRGCatalogStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RGSiriSchemaRGCatalogStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RGSiriSchemaRGCatalogStarted *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[RGSiriSchemaRGCatalogStarted exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_responseCatalogMobileAssetVersion)
  {
    v5 = [(RGSiriSchemaRGCatalogStarted *)self responseCatalogMobileAssetVersion];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"responseCatalogMobileAssetVersion"];
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
  return [(NSString *)self->_responseCatalogMobileAssetVersion hash] ^ v2;
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
        v6 = [(RGSiriSchemaRGCatalogStarted *)self responseCatalogMobileAssetVersion];
        uint64_t v7 = [v4 responseCatalogMobileAssetVersion];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(RGSiriSchemaRGCatalogStarted *)self responseCatalogMobileAssetVersion];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(RGSiriSchemaRGCatalogStarted *)self responseCatalogMobileAssetVersion];
          v12 = [v4 responseCatalogMobileAssetVersion];
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
  id v4 = [(RGSiriSchemaRGCatalogStarted *)self responseCatalogMobileAssetVersion];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGCatalogStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteResponseCatalogMobileAssetVersion
{
}

- (BOOL)hasResponseCatalogMobileAssetVersion
{
  return self->_responseCatalogMobileAssetVersion != 0;
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