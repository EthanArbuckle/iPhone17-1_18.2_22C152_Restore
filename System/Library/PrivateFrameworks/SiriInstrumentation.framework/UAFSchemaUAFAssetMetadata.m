@interface UAFSchemaUAFAssetMetadata
- (BOOL)hasAssetName;
- (BOOL)hasAssetSizeInBytes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)assetName;
- (UAFSchemaUAFAssetMetadata)initWithDictionary:(id)a3;
- (UAFSchemaUAFAssetMetadata)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)assetSizeInBytes;
- (unint64_t)hash;
- (void)deleteAssetName;
- (void)deleteAssetSizeInBytes;
- (void)setAssetName:(id)a3;
- (void)setAssetSizeInBytes:(unint64_t)a3;
- (void)setHasAssetName:(BOOL)a3;
- (void)setHasAssetSizeInBytes:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation UAFSchemaUAFAssetMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAssetName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)assetSizeInBytes
{
  return self->_assetSizeInBytes;
}

- (void)setAssetName:(id)a3
{
}

- (NSString)assetName
{
  return self->_assetName;
}

- (UAFSchemaUAFAssetMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UAFSchemaUAFAssetMetadata;
  v5 = [(UAFSchemaUAFAssetMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assetName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(UAFSchemaUAFAssetMetadata *)v5 setAssetName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"assetSizeInBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFAssetMetadata setAssetSizeInBytes:](v5, "setAssetSizeInBytes:", [v8 unsignedLongLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (UAFSchemaUAFAssetMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(UAFSchemaUAFAssetMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(UAFSchemaUAFAssetMetadata *)self dictionaryRepresentation];
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
  if (self->_assetName)
  {
    id v4 = [(UAFSchemaUAFAssetMetadata *)self assetName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[UAFSchemaUAFAssetMetadata assetSizeInBytes](self, "assetSizeInBytes"));
    [v3 setObject:v6 forKeyedSubscript:@"assetSizeInBytes"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetName hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_assetSizeInBytes;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(UAFSchemaUAFAssetMetadata *)self assetName];
  v6 = [v4 assetName];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(UAFSchemaUAFAssetMetadata *)self assetName];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(UAFSchemaUAFAssetMetadata *)self assetName];
    objc_super v11 = [v4 assetName];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[24] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t assetSizeInBytes = self->_assetSizeInBytes;
    if (assetSizeInBytes != [v4 assetSizeInBytes]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(UAFSchemaUAFAssetMetadata *)self assetName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteAssetSizeInBytes
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAssetSizeInBytes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetSizeInBytes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAssetSizeInBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t assetSizeInBytes = a3;
}

- (void)deleteAssetName
{
}

- (BOOL)hasAssetName
{
  return self->_assetName != 0;
}

@end