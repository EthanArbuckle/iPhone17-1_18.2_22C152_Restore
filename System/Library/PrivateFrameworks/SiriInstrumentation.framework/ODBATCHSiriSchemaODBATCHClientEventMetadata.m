@interface ODBATCHSiriSchemaODBATCHClientEventMetadata
- (BOOL)hasAggregationInterval;
- (BOOL)hasEventTimestampInMsSince1970;
- (BOOL)hasOdbatchId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODBATCHSiriSchemaODBATCHClientEventMetadata)initWithDictionary:(id)a3;
- (ODBATCHSiriSchemaODBATCHClientEventMetadata)initWithJSON:(id)a3;
- (ODDSiriSchemaODDTimeInterval)aggregationInterval;
- (SISchemaUUID)odbatchId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)eventTimestampInMsSince1970;
- (unint64_t)hash;
- (void)deleteAggregationInterval;
- (void)deleteEventTimestampInMsSince1970;
- (void)deleteOdbatchId;
- (void)setAggregationInterval:(id)a3;
- (void)setEventTimestampInMsSince1970:(unint64_t)a3;
- (void)setHasAggregationInterval:(BOOL)a3;
- (void)setHasEventTimestampInMsSince1970:(BOOL)a3;
- (void)setHasOdbatchId:(BOOL)a3;
- (void)setOdbatchId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODBATCHSiriSchemaODBATCHClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODBATCHSiriSchemaODBATCHClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self odbatchId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self deleteOdbatchId];
  }
  v9 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self aggregationInterval];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self deleteAggregationInterval];
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
  objc_storeStrong((id *)&self->_aggregationInterval, 0);
  objc_storeStrong((id *)&self->_odbatchId, 0);
}

- (void)setHasAggregationInterval:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOdbatchId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)eventTimestampInMsSince1970
{
  return self->_eventTimestampInMsSince1970;
}

- (void)setAggregationInterval:(id)a3
{
}

- (ODDSiriSchemaODDTimeInterval)aggregationInterval
{
  return self->_aggregationInterval;
}

- (void)setOdbatchId:(id)a3
{
}

- (SISchemaUUID)odbatchId
{
  return self->_odbatchId;
}

- (ODBATCHSiriSchemaODBATCHClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODBATCHSiriSchemaODBATCHClientEventMetadata;
  v5 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"odbatchId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)v5 setOdbatchId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"aggregationInterval"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDTimeInterval alloc] initWithDictionary:v8];
      [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)v5 setAggregationInterval:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"eventTimestampInMsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODBATCHSiriSchemaODBATCHClientEventMetadata setEventTimestampInMsSince1970:](v5, "setEventTimestampInMsSince1970:", [v10 unsignedLongLongValue]);
    }
    int v11 = v5;
  }
  return v5;
}

- (ODBATCHSiriSchemaODBATCHClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_aggregationInterval)
  {
    id v4 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self aggregationInterval];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"aggregationInterval"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"aggregationInterval"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODBATCHSiriSchemaODBATCHClientEventMetadata eventTimestampInMsSince1970](self, "eventTimestampInMsSince1970"));
    [v3 setObject:v7 forKeyedSubscript:@"eventTimestampInMsSince1970"];
  }
  if (self->_odbatchId)
  {
    int v8 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self odbatchId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"odbatchId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"odbatchId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_odbatchId hash];
  unint64_t v4 = [(ODDSiriSchemaODDTimeInterval *)self->_aggregationInterval hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_eventTimestampInMsSince1970;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  unint64_t v5 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self odbatchId];
  v6 = [v4 odbatchId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self odbatchId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self odbatchId];
    v10 = [v4 odbatchId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self aggregationInterval];
  v6 = [v4 aggregationInterval];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self aggregationInterval];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self aggregationInterval];
    v15 = [v4 aggregationInterval];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (unint64_t eventTimestampInMsSince1970 = self->_eventTimestampInMsSince1970,
          eventTimestampInMsSince1970 == [v4 eventTimestampInMsSince1970]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self odbatchId];

  if (v4)
  {
    unint64_t v5 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self odbatchId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self aggregationInterval];

  if (v6)
  {
    uint64_t v7 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self aggregationInterval];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODBATCHSiriSchemaODBATCHClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteEventTimestampInMsSince1970
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventTimestampInMsSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventTimestampInMsSince1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventTimestampInMsSince1970:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t eventTimestampInMsSince1970 = a3;
}

- (void)deleteAggregationInterval
{
}

- (BOOL)hasAggregationInterval
{
  return self->_aggregationInterval != 0;
}

- (void)deleteOdbatchId
{
}

- (BOOL)hasOdbatchId
{
  return self->_odbatchId != 0;
}

@end