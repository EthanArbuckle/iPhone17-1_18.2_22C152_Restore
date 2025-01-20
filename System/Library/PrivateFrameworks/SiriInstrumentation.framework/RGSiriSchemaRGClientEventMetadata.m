@interface RGSiriSchemaRGClientEventMetadata
- (BOOL)hasIfRequestId;
- (BOOL)hasPostingSpanId;
- (BOOL)hasRgId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RGSiriSchemaRGClientEventMetadata)initWithDictionary:(id)a3;
- (RGSiriSchemaRGClientEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)ifRequestId;
- (SISchemaUUID)rgId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)postingSpanId;
- (void)deleteIfRequestId;
- (void)deletePostingSpanId;
- (void)deleteRgId;
- (void)setHasIfRequestId:(BOOL)a3;
- (void)setHasPostingSpanId:(BOOL)a3;
- (void)setHasRgId:(BOOL)a3;
- (void)setIfRequestId:(id)a3;
- (void)setPostingSpanId:(unint64_t)a3;
- (void)setRgId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RGSiriSchemaRGClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RGSiriSchemaRGClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(RGSiriSchemaRGClientEventMetadata *)self ifRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RGSiriSchemaRGClientEventMetadata *)self deleteIfRequestId];
  }
  v9 = [(RGSiriSchemaRGClientEventMetadata *)self rgId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(RGSiriSchemaRGClientEventMetadata *)self deleteRgId];
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
  objc_storeStrong((id *)&self->_rgId, 0);
  objc_storeStrong((id *)&self->_ifRequestId, 0);
}

- (void)setHasRgId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasIfRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setRgId:(id)a3
{
}

- (SISchemaUUID)rgId
{
  return self->_rgId;
}

- (unint64_t)postingSpanId
{
  return self->_postingSpanId;
}

- (void)setIfRequestId:(id)a3
{
}

- (SISchemaUUID)ifRequestId
{
  return self->_ifRequestId;
}

- (RGSiriSchemaRGClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RGSiriSchemaRGClientEventMetadata;
  v5 = [(RGSiriSchemaRGClientEventMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ifRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(RGSiriSchemaRGClientEventMetadata *)v5 setIfRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"postingSpanId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RGSiriSchemaRGClientEventMetadata setPostingSpanId:](v5, "setPostingSpanId:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"rgId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaUUID alloc] initWithDictionary:v9];
      [(RGSiriSchemaRGClientEventMetadata *)v5 setRgId:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (RGSiriSchemaRGClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RGSiriSchemaRGClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RGSiriSchemaRGClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_ifRequestId)
  {
    id v4 = [(RGSiriSchemaRGClientEventMetadata *)self ifRequestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"ifRequestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"ifRequestId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RGSiriSchemaRGClientEventMetadata postingSpanId](self, "postingSpanId"));
    [v3 setObject:v7 forKeyedSubscript:@"postingSpanId"];
  }
  if (self->_rgId)
  {
    int v8 = [(RGSiriSchemaRGClientEventMetadata *)self rgId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"rgId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"rgId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_ifRequestId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_postingSpanId;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(SISchemaUUID *)self->_rgId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(RGSiriSchemaRGClientEventMetadata *)self ifRequestId];
  v6 = [v4 ifRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(RGSiriSchemaRGClientEventMetadata *)self ifRequestId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(RGSiriSchemaRGClientEventMetadata *)self ifRequestId];
    v10 = [v4 ifRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t postingSpanId = self->_postingSpanId;
    if (postingSpanId != [v4 postingSpanId]) {
      goto LABEL_15;
    }
  }
  v5 = [(RGSiriSchemaRGClientEventMetadata *)self rgId];
  v6 = [v4 rgId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(RGSiriSchemaRGClientEventMetadata *)self rgId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(RGSiriSchemaRGClientEventMetadata *)self rgId];
    v16 = [v4 rgId];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  unint64_t v4 = [(RGSiriSchemaRGClientEventMetadata *)self ifRequestId];

  if (v4)
  {
    v5 = [(RGSiriSchemaRGClientEventMetadata *)self ifRequestId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  v6 = [(RGSiriSchemaRGClientEventMetadata *)self rgId];

  uint64_t v7 = v9;
  if (v6)
  {
    int v8 = [(RGSiriSchemaRGClientEventMetadata *)self rgId];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteRgId
{
}

- (BOOL)hasRgId
{
  return self->_rgId != 0;
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

- (void)deleteIfRequestId
{
}

- (BOOL)hasIfRequestId
{
  return self->_ifRequestId != 0;
}

@end