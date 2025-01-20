@interface IFPlatformSchemaIFPlatformClientEventMetadata
- (BOOL)hasIfSessionId;
- (BOOL)hasPostingSpanId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFPlatformSchemaIFPlatformClientEventMetadata)initWithDictionary:(id)a3;
- (IFPlatformSchemaIFPlatformClientEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)ifSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)postingSpanId;
- (void)deleteIfSessionId;
- (void)deletePostingSpanId;
- (void)setHasIfSessionId:(BOOL)a3;
- (void)setHasPostingSpanId:(BOOL)a3;
- (void)setIfSessionId:(id)a3;
- (void)setPostingSpanId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFPlatformSchemaIFPlatformClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFPlatformSchemaIFPlatformClientEventMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFPlatformSchemaIFPlatformClientEventMetadata *)self ifSessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFPlatformSchemaIFPlatformClientEventMetadata *)self deleteIfSessionId];
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

- (void)setHasIfSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)postingSpanId
{
  return self->_postingSpanId;
}

- (void)setIfSessionId:(id)a3
{
}

- (SISchemaUUID)ifSessionId
{
  return self->_ifSessionId;
}

- (IFPlatformSchemaIFPlatformClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFPlatformSchemaIFPlatformClientEventMetadata;
  v5 = [(IFPlatformSchemaIFPlatformClientEventMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ifSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(IFPlatformSchemaIFPlatformClientEventMetadata *)v5 setIfSessionId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"postingSpanId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFPlatformSchemaIFPlatformClientEventMetadata setPostingSpanId:](v5, "setPostingSpanId:", [v8 unsignedLongLongValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (IFPlatformSchemaIFPlatformClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFPlatformSchemaIFPlatformClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFPlatformSchemaIFPlatformClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_ifSessionId)
  {
    id v4 = [(IFPlatformSchemaIFPlatformClientEventMetadata *)self ifSessionId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"ifSessionId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"ifSessionId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[IFPlatformSchemaIFPlatformClientEventMetadata postingSpanId](self, "postingSpanId"));
    [v3 setObject:v7 forKeyedSubscript:@"postingSpanId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_ifSessionId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_postingSpanId;
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
  v5 = [(IFPlatformSchemaIFPlatformClientEventMetadata *)self ifSessionId];
  v6 = [v4 ifSessionId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(IFPlatformSchemaIFPlatformClientEventMetadata *)self ifSessionId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(IFPlatformSchemaIFPlatformClientEventMetadata *)self ifSessionId];
    objc_super v11 = [v4 ifSessionId];
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
    unint64_t postingSpanId = self->_postingSpanId;
    if (postingSpanId != [v4 postingSpanId]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [(IFPlatformSchemaIFPlatformClientEventMetadata *)self ifSessionId];

  if (v4)
  {
    v5 = [(IFPlatformSchemaIFPlatformClientEventMetadata *)self ifSessionId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFPlatformSchemaIFPlatformClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deletePostingSpanId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPostingSpanId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPostingSpanId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPostingSpanId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t postingSpanId = a3;
}

- (void)deleteIfSessionId
{
}

- (BOOL)hasIfSessionId
{
  return self->_ifSessionId != 0;
}

@end