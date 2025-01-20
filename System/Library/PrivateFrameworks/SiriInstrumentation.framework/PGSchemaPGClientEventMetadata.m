@interface PGSchemaPGClientEventMetadata
- (BOOL)hasIfRequestId;
- (BOOL)hasPlanCycleId;
- (BOOL)hasPostingSpanId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PGSchemaPGClientEventMetadata)initWithDictionary:(id)a3;
- (PGSchemaPGClientEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)ifRequestId;
- (SISchemaUUID)planCycleId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)postingSpanId;
- (void)deleteIfRequestId;
- (void)deletePlanCycleId;
- (void)deletePostingSpanId;
- (void)setHasIfRequestId:(BOOL)a3;
- (void)setHasPlanCycleId:(BOOL)a3;
- (void)setHasPostingSpanId:(BOOL)a3;
- (void)setIfRequestId:(id)a3;
- (void)setPlanCycleId:(id)a3;
- (void)setPostingSpanId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PGSchemaPGClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGSchemaPGClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PGSchemaPGClientEventMetadata *)self ifRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PGSchemaPGClientEventMetadata *)self deleteIfRequestId];
  }
  v9 = [(PGSchemaPGClientEventMetadata *)self planCycleId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PGSchemaPGClientEventMetadata *)self deletePlanCycleId];
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
  objc_storeStrong((id *)&self->_planCycleId, 0);
  objc_storeStrong((id *)&self->_ifRequestId, 0);
}

- (void)setHasPlanCycleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasIfRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPlanCycleId:(id)a3
{
}

- (SISchemaUUID)planCycleId
{
  return self->_planCycleId;
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

- (PGSchemaPGClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGSchemaPGClientEventMetadata;
  v5 = [(PGSchemaPGClientEventMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ifRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PGSchemaPGClientEventMetadata *)v5 setIfRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"postingSpanId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PGSchemaPGClientEventMetadata setPostingSpanId:](v5, "setPostingSpanId:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"planCycleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaUUID alloc] initWithDictionary:v9];
      [(PGSchemaPGClientEventMetadata *)v5 setPlanCycleId:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (PGSchemaPGClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PGSchemaPGClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PGSchemaPGClientEventMetadata *)self dictionaryRepresentation];
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
    id v4 = [(PGSchemaPGClientEventMetadata *)self ifRequestId];
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
  if (self->_planCycleId)
  {
    uint64_t v7 = [(PGSchemaPGClientEventMetadata *)self planCycleId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"planCycleId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"planCycleId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PGSchemaPGClientEventMetadata postingSpanId](self, "postingSpanId"));
    [v3 setObject:v10 forKeyedSubscript:@"postingSpanId"];
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
  return v4 ^ v3 ^ [(SISchemaUUID *)self->_planCycleId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(PGSchemaPGClientEventMetadata *)self ifRequestId];
  v6 = [v4 ifRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(PGSchemaPGClientEventMetadata *)self ifRequestId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PGSchemaPGClientEventMetadata *)self ifRequestId];
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
  v5 = [(PGSchemaPGClientEventMetadata *)self planCycleId];
  v6 = [v4 planCycleId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(PGSchemaPGClientEventMetadata *)self planCycleId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(PGSchemaPGClientEventMetadata *)self planCycleId];
    v16 = [v4 planCycleId];
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
  unint64_t v4 = [(PGSchemaPGClientEventMetadata *)self ifRequestId];

  if (v4)
  {
    v5 = [(PGSchemaPGClientEventMetadata *)self ifRequestId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  v6 = [(PGSchemaPGClientEventMetadata *)self planCycleId];

  uint64_t v7 = v9;
  if (v6)
  {
    int v8 = [(PGSchemaPGClientEventMetadata *)self planCycleId];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PGSchemaPGClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deletePlanCycleId
{
}

- (BOOL)hasPlanCycleId
{
  return self->_planCycleId != 0;
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