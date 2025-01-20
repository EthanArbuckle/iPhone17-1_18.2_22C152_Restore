@interface PRSiriSchemaPRClientEventMetadata
- (BOOL)hasIfRequestId;
- (BOOL)hasPgId;
- (BOOL)hasPostingSpanId;
- (BOOL)hasPrId;
- (BOOL)hasSpanId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PRSiriSchemaPRClientEventMetadata)initWithDictionary:(id)a3;
- (PRSiriSchemaPRClientEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)ifRequestId;
- (SISchemaUUID)pgId;
- (SISchemaUUID)prId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)spanId;
- (unsigned)postingSpanId;
- (void)deleteIfRequestId;
- (void)deletePgId;
- (void)deletePostingSpanId;
- (void)deletePrId;
- (void)deleteSpanId;
- (void)setHasIfRequestId:(BOOL)a3;
- (void)setHasPgId:(BOOL)a3;
- (void)setHasPostingSpanId:(BOOL)a3;
- (void)setHasPrId:(BOOL)a3;
- (void)setHasSpanId:(BOOL)a3;
- (void)setIfRequestId:(id)a3;
- (void)setPgId:(id)a3;
- (void)setPostingSpanId:(unsigned int)a3;
- (void)setPrId:(id)a3;
- (void)setSpanId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PRSiriSchemaPRClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PRSiriSchemaPRClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(PRSiriSchemaPRClientEventMetadata *)self ifRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PRSiriSchemaPRClientEventMetadata *)self deleteIfRequestId];
  }
  v9 = [(PRSiriSchemaPRClientEventMetadata *)self pgId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PRSiriSchemaPRClientEventMetadata *)self deletePgId];
  }
  v12 = [(PRSiriSchemaPRClientEventMetadata *)self prId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PRSiriSchemaPRClientEventMetadata *)self deletePrId];
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
  objc_storeStrong((id *)&self->_prId, 0);
  objc_storeStrong((id *)&self->_pgId, 0);
  objc_storeStrong((id *)&self->_ifRequestId, 0);
}

- (void)setHasPrId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasPgId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasIfRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPrId:(id)a3
{
}

- (SISchemaUUID)prId
{
  return self->_prId;
}

- (unint64_t)spanId
{
  return self->_spanId;
}

- (void)setPgId:(id)a3
{
}

- (SISchemaUUID)pgId
{
  return self->_pgId;
}

- (unsigned)postingSpanId
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

- (PRSiriSchemaPRClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PRSiriSchemaPRClientEventMetadata;
  v5 = [(PRSiriSchemaPRClientEventMetadata *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ifRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PRSiriSchemaPRClientEventMetadata *)v5 setIfRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"postingSpanId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PRSiriSchemaPRClientEventMetadata setPostingSpanId:](v5, "setPostingSpanId:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"pgId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaUUID alloc] initWithDictionary:v9];
      [(PRSiriSchemaPRClientEventMetadata *)v5 setPgId:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"spanId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PRSiriSchemaPRClientEventMetadata setSpanId:](v5, "setSpanId:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"prId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(PRSiriSchemaPRClientEventMetadata *)v5 setPrId:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (PRSiriSchemaPRClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PRSiriSchemaPRClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PRSiriSchemaPRClientEventMetadata *)self dictionaryRepresentation];
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
    id v4 = [(PRSiriSchemaPRClientEventMetadata *)self ifRequestId];
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
  if (self->_pgId)
  {
    uint64_t v7 = [(PRSiriSchemaPRClientEventMetadata *)self pgId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"pgId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"pgId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PRSiriSchemaPRClientEventMetadata postingSpanId](self, "postingSpanId"));
    [v3 setObject:v10 forKeyedSubscript:@"postingSpanId"];
  }
  if (self->_prId)
  {
    int v11 = [(PRSiriSchemaPRClientEventMetadata *)self prId];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"prId"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"prId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PRSiriSchemaPRClientEventMetadata spanId](self, "spanId"));
    [v3 setObject:v14 forKeyedSubscript:@"spanId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_ifRequestId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_postingSpanId;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(SISchemaUUID *)self->_pgId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v6 = 2654435761u * self->_spanId;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_prId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t v5 = [(PRSiriSchemaPRClientEventMetadata *)self ifRequestId];
  unint64_t v6 = [v4 ifRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v7 = [(PRSiriSchemaPRClientEventMetadata *)self ifRequestId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PRSiriSchemaPRClientEventMetadata *)self ifRequestId];
    v10 = [v4 ifRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int postingSpanId = self->_postingSpanId;
    if (postingSpanId != [v4 postingSpanId]) {
      goto LABEL_23;
    }
  }
  unint64_t v5 = [(PRSiriSchemaPRClientEventMetadata *)self pgId];
  unint64_t v6 = [v4 pgId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(PRSiriSchemaPRClientEventMetadata *)self pgId];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(PRSiriSchemaPRClientEventMetadata *)self pgId];
    objc_super v16 = [v4 pgId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  int v18 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v18 != ((v4[48] >> 1) & 1)) {
    goto LABEL_23;
  }
  if (v18)
  {
    unint64_t spanId = self->_spanId;
    if (spanId != [v4 spanId]) {
      goto LABEL_23;
    }
  }
  unint64_t v5 = [(PRSiriSchemaPRClientEventMetadata *)self prId];
  unint64_t v6 = [v4 prId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v20 = [(PRSiriSchemaPRClientEventMetadata *)self prId];
    if (!v20)
    {

LABEL_26:
      BOOL v25 = 1;
      goto LABEL_24;
    }
    v21 = (void *)v20;
    v22 = [(PRSiriSchemaPRClientEventMetadata *)self prId];
    v23 = [v4 prId];
    char v24 = [v22 isEqual:v23];

    if (v24) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v25 = 0;
LABEL_24:

  return v25;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(PRSiriSchemaPRClientEventMetadata *)self ifRequestId];

  if (v4)
  {
    unint64_t v5 = [(PRSiriSchemaPRClientEventMetadata *)self ifRequestId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  unint64_t v6 = [(PRSiriSchemaPRClientEventMetadata *)self pgId];

  if (v6)
  {
    uint64_t v7 = [(PRSiriSchemaPRClientEventMetadata *)self pgId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  int v8 = [(PRSiriSchemaPRClientEventMetadata *)self prId];

  v9 = v11;
  if (v8)
  {
    v10 = [(PRSiriSchemaPRClientEventMetadata *)self prId];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deletePrId
{
}

- (BOOL)hasPrId
{
  return self->_prId != 0;
}

- (void)deleteSpanId
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSpanId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSpanId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSpanId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t spanId = a3;
}

- (void)deletePgId
{
}

- (BOOL)hasPgId
{
  return self->_pgId != 0;
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

- (void)setPostingSpanId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int postingSpanId = a3;
}

- (void)deleteIfRequestId
{
}

- (BOOL)hasIfRequestId
{
  return self->_ifRequestId != 0;
}

@end