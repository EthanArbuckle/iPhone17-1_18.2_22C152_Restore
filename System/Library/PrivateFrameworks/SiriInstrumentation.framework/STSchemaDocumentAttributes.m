@interface STSchemaDocumentAttributes
- (BOOL)hasBundleId;
- (BOOL)hasDocumentChunkCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)bundleId;
- (STSchemaDocumentAttributes)initWithDictionary:(id)a3;
- (STSchemaDocumentAttributes)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)documentChunkCount;
- (void)deleteBundleId;
- (void)deleteDocumentChunkCount;
- (void)setBundleId:(id)a3;
- (void)setDocumentChunkCount:(unsigned int)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasDocumentChunkCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaDocumentAttributes

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STSchemaDocumentAttributes;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(STSchemaDocumentAttributes *)self deleteBundleId];
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

- (void)setHasBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)documentChunkCount
{
  return self->_documentChunkCount;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (STSchemaDocumentAttributes)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSchemaDocumentAttributes;
  v5 = [(STSchemaDocumentAttributes *)&v11 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(STSchemaDocumentAttributes *)v5 setBundleId:v7];
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"documentChunkCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaDocumentAttributes setDocumentChunkCount:](v5, "setDocumentChunkCount:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (STSchemaDocumentAttributes)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaDocumentAttributes *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaDocumentAttributes *)self dictionaryRepresentation];
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
  if (self->_bundleId)
  {
    id v4 = [(STSchemaDocumentAttributes *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaDocumentAttributes documentChunkCount](self, "documentChunkCount"));
    [v3 setObject:v6 forKeyedSubscript:@"documentChunkCount"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_documentChunkCount;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(STSchemaDocumentAttributes *)self bundleId];
  int v6 = [v4 bundleId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(STSchemaDocumentAttributes *)self bundleId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(STSchemaDocumentAttributes *)self bundleId];
    objc_super v11 = [v4 bundleId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int documentChunkCount = self->_documentChunkCount;
    if (documentChunkCount != [v4 documentChunkCount]) {
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
  uint64_t v4 = [(STSchemaDocumentAttributes *)self bundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaDocumentAttributesReadFrom(self, (uint64_t)a3);
}

- (void)deleteDocumentChunkCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDocumentChunkCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDocumentChunkCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDocumentChunkCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int documentChunkCount = a3;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

@end