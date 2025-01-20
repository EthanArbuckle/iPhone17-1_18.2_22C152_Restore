@interface POMMESSchemaPOMMESOnDeviceMetadata
- (BOOL)hasOnScreenAppBundleIdDomain;
- (BOOL)hasOnScreenUriDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)onScreenAppBundleIdDomain;
- (NSString)onScreenUriDomain;
- (POMMESSchemaPOMMESOnDeviceMetadata)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESOnDeviceMetadata)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteOnScreenAppBundleIdDomain;
- (void)deleteOnScreenUriDomain;
- (void)setHasOnScreenAppBundleIdDomain:(BOOL)a3;
- (void)setHasOnScreenUriDomain:(BOOL)a3;
- (void)setOnScreenAppBundleIdDomain:(id)a3;
- (void)setOnScreenUriDomain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESOnDeviceMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onScreenUriDomain, 0);
  objc_storeStrong((id *)&self->_onScreenAppBundleIdDomain, 0);
}

- (void)setHasOnScreenUriDomain:(BOOL)a3
{
  self->_hasOnScreenUriDomain = a3;
}

- (void)setHasOnScreenAppBundleIdDomain:(BOOL)a3
{
  self->_hasOnScreenAppBundleIdDomain = a3;
}

- (void)setOnScreenUriDomain:(id)a3
{
}

- (NSString)onScreenUriDomain
{
  return self->_onScreenUriDomain;
}

- (void)setOnScreenAppBundleIdDomain:(id)a3
{
}

- (NSString)onScreenAppBundleIdDomain
{
  return self->_onScreenAppBundleIdDomain;
}

- (POMMESSchemaPOMMESOnDeviceMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESOnDeviceMetadata;
  v5 = [(POMMESSchemaPOMMESOnDeviceMetadata *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"onScreenAppBundleIdDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(POMMESSchemaPOMMESOnDeviceMetadata *)v5 setOnScreenAppBundleIdDomain:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"onScreenUriDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(POMMESSchemaPOMMESOnDeviceMetadata *)v5 setOnScreenUriDomain:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESOnDeviceMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESOnDeviceMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self dictionaryRepresentation];
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
  if (self->_onScreenAppBundleIdDomain)
  {
    id v4 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenAppBundleIdDomain];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"onScreenAppBundleIdDomain"];
  }
  if (self->_onScreenUriDomain)
  {
    v6 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenUriDomain];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"onScreenUriDomain"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_onScreenAppBundleIdDomain hash];
  return [(NSString *)self->_onScreenUriDomain hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenAppBundleIdDomain];
  v6 = [v4 onScreenAppBundleIdDomain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenAppBundleIdDomain];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenAppBundleIdDomain];
    v10 = [v4 onScreenAppBundleIdDomain];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenUriDomain];
  v6 = [v4 onScreenUriDomain];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenUriDomain];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenUriDomain];
    v15 = [v4 onScreenUriDomain];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenAppBundleIdDomain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(POMMESSchemaPOMMESOnDeviceMetadata *)self onScreenUriDomain];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESOnDeviceMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteOnScreenUriDomain
{
}

- (BOOL)hasOnScreenUriDomain
{
  return self->_onScreenUriDomain != 0;
}

- (void)deleteOnScreenAppBundleIdDomain
{
}

- (BOOL)hasOnScreenAppBundleIdDomain
{
  return self->_onScreenAppBundleIdDomain != 0;
}

@end