@interface ODFUNNELSiriSchemaODFUNNELClientEventMetadata
- (BOOL)hasAggregationInterval;
- (BOOL)hasDeviceAggregationId;
- (BOOL)hasEventTimestampInMsSince1970;
- (BOOL)hasOdfunnelId;
- (BOOL)hasUserAggregationIdExpirationTimestampMs;
- (BOOL)hasUserAggregationIdRotationTimestampMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDTimeInterval)aggregationInterval;
- (ODFUNNELSiriSchemaODFUNNELClientEventMetadata)initWithDictionary:(id)a3;
- (ODFUNNELSiriSchemaODFUNNELClientEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)deviceAggregationId;
- (SISchemaUUID)odfunnelId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)eventTimestampInMsSince1970;
- (unint64_t)hash;
- (unint64_t)userAggregationIdExpirationTimestampMs;
- (unint64_t)userAggregationIdRotationTimestampMs;
- (void)deleteAggregationInterval;
- (void)deleteDeviceAggregationId;
- (void)deleteEventTimestampInMsSince1970;
- (void)deleteOdfunnelId;
- (void)deleteUserAggregationIdExpirationTimestampMs;
- (void)deleteUserAggregationIdRotationTimestampMs;
- (void)setAggregationInterval:(id)a3;
- (void)setDeviceAggregationId:(id)a3;
- (void)setEventTimestampInMsSince1970:(unint64_t)a3;
- (void)setHasAggregationInterval:(BOOL)a3;
- (void)setHasDeviceAggregationId:(BOOL)a3;
- (void)setHasEventTimestampInMsSince1970:(BOOL)a3;
- (void)setHasOdfunnelId:(BOOL)a3;
- (void)setHasUserAggregationIdExpirationTimestampMs:(BOOL)a3;
- (void)setHasUserAggregationIdRotationTimestampMs:(BOOL)a3;
- (void)setOdfunnelId:(id)a3;
- (void)setUserAggregationIdExpirationTimestampMs:(unint64_t)a3;
- (void)setUserAggregationIdRotationTimestampMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODFUNNELSiriSchemaODFUNNELClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODFUNNELSiriSchemaODFUNNELClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self odfunnelId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deleteOdfunnelId];
  }
  v9 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self aggregationInterval];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deleteAggregationInterval];
  }
  v12 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deviceAggregationId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deleteDeviceAggregationId];
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
  objc_storeStrong((id *)&self->_deviceAggregationId, 0);
  objc_storeStrong((id *)&self->_aggregationInterval, 0);
  objc_storeStrong((id *)&self->_odfunnelId, 0);
}

- (void)setHasDeviceAggregationId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAggregationInterval:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOdfunnelId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)userAggregationIdExpirationTimestampMs
{
  return self->_userAggregationIdExpirationTimestampMs;
}

- (unint64_t)userAggregationIdRotationTimestampMs
{
  return self->_userAggregationIdRotationTimestampMs;
}

- (void)setDeviceAggregationId:(id)a3
{
}

- (SISchemaUUID)deviceAggregationId
{
  return self->_deviceAggregationId;
}

- (void)setAggregationInterval:(id)a3
{
}

- (ODDSiriSchemaODDTimeInterval)aggregationInterval
{
  return self->_aggregationInterval;
}

- (unint64_t)eventTimestampInMsSince1970
{
  return self->_eventTimestampInMsSince1970;
}

- (void)setOdfunnelId:(id)a3
{
}

- (SISchemaUUID)odfunnelId
{
  return self->_odfunnelId;
}

- (ODFUNNELSiriSchemaODFUNNELClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODFUNNELSiriSchemaODFUNNELClientEventMetadata;
  v5 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"odfunnelId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)v5 setOdfunnelId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"eventTimestampInMsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODFUNNELSiriSchemaODFUNNELClientEventMetadata setEventTimestampInMsSince1970:](v5, "setEventTimestampInMsSince1970:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"aggregationInterval"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[ODDSiriSchemaODDTimeInterval alloc] initWithDictionary:v9];
      [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)v5 setAggregationInterval:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"deviceAggregationId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)v5 setDeviceAggregationId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"userAggregationIdRotationTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODFUNNELSiriSchemaODFUNNELClientEventMetadata setUserAggregationIdRotationTimestampMs:](v5, "setUserAggregationIdRotationTimestampMs:", [v13 unsignedLongLongValue]);
    }
    int v14 = [v4 objectForKeyedSubscript:@"userAggregationIdExpirationTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODFUNNELSiriSchemaODFUNNELClientEventMetadata setUserAggregationIdExpirationTimestampMs:](v5, "setUserAggregationIdExpirationTimestampMs:", [v14 unsignedLongLongValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (ODFUNNELSiriSchemaODFUNNELClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self dictionaryRepresentation];
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
    id v4 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self aggregationInterval];
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
  if (self->_deviceAggregationId)
  {
    uint64_t v7 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deviceAggregationId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"deviceAggregationId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"deviceAggregationId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODFUNNELSiriSchemaODFUNNELClientEventMetadata eventTimestampInMsSince1970](self, "eventTimestampInMsSince1970"));
    [v3 setObject:v10 forKeyedSubscript:@"eventTimestampInMsSince1970"];
  }
  if (self->_odfunnelId)
  {
    int v11 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self odfunnelId];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"odfunnelId"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"odfunnelId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODFUNNELSiriSchemaODFUNNELClientEventMetadata userAggregationIdExpirationTimestampMs](self, "userAggregationIdExpirationTimestampMs"));
    [v3 setObject:v15 forKeyedSubscript:@"userAggregationIdExpirationTimestampMs"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODFUNNELSiriSchemaODFUNNELClientEventMetadata userAggregationIdRotationTimestampMs](self, "userAggregationIdRotationTimestampMs"));
    [v3 setObject:v16 forKeyedSubscript:@"userAggregationIdRotationTimestampMs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_odfunnelId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_eventTimestampInMsSince1970;
  }
  else {
    unint64_t v4 = 0;
  }
  unint64_t v5 = [(ODDSiriSchemaODDTimeInterval *)self->_aggregationInterval hash];
  unint64_t v6 = [(SISchemaUUID *)self->_deviceAggregationId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v7 = 2654435761u * self->_userAggregationIdRotationTimestampMs;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v8 = 2654435761u * self->_userAggregationIdExpirationTimestampMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self odfunnelId];
  unint64_t v6 = [v4 odfunnelId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self odfunnelId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self odfunnelId];
    v10 = [v4 odfunnelId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t eventTimestampInMsSince1970 = self->_eventTimestampInMsSince1970;
    if (eventTimestampInMsSince1970 != [v4 eventTimestampInMsSince1970]) {
      goto LABEL_20;
    }
  }
  unint64_t v5 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self aggregationInterval];
  unint64_t v6 = [v4 aggregationInterval];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self aggregationInterval];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self aggregationInterval];
    objc_super v16 = [v4 aggregationInterval];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deviceAggregationId];
  unint64_t v6 = [v4 deviceAggregationId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v18 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deviceAggregationId];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deviceAggregationId];
    v21 = [v4 deviceAggregationId];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $36CD028B83635B9499CC517BEB088AD4 has = self->_has;
  int v26 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v27 = v4[56];
  if (v26 == ((v27 >> 1) & 1))
  {
    if (v26)
    {
      unint64_t userAggregationIdRotationTimestampMs = self->_userAggregationIdRotationTimestampMs;
      if (userAggregationIdRotationTimestampMs != [v4 userAggregationIdRotationTimestampMs]) {
        goto LABEL_20;
      }
      $36CD028B83635B9499CC517BEB088AD4 has = self->_has;
      unsigned int v27 = v4[56];
    }
    int v29 = (*(unsigned int *)&has >> 2) & 1;
    if (v29 == ((v27 >> 2) & 1))
    {
      if (!v29
        || (unint64_t userAggregationIdExpirationTimestampMs = self->_userAggregationIdExpirationTimestampMs,
            userAggregationIdExpirationTimestampMs == [v4 userAggregationIdExpirationTimestampMs]))
      {
        BOOL v23 = 1;
        goto LABEL_21;
      }
    }
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self odfunnelId];

  if (v4)
  {
    unint64_t v5 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self odfunnelId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  unint64_t v6 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self aggregationInterval];

  if (v6)
  {
    uint64_t v7 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self aggregationInterval];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deviceAggregationId];

  if (v8)
  {
    v9 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self deviceAggregationId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  int v11 = v12;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    int v11 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODFUNNELSiriSchemaODFUNNELClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserAggregationIdExpirationTimestampMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasUserAggregationIdExpirationTimestampMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserAggregationIdExpirationTimestampMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUserAggregationIdExpirationTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t userAggregationIdExpirationTimestampMs = a3;
}

- (void)deleteUserAggregationIdRotationTimestampMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUserAggregationIdRotationTimestampMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserAggregationIdRotationTimestampMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUserAggregationIdRotationTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t userAggregationIdRotationTimestampMs = a3;
}

- (void)deleteDeviceAggregationId
{
}

- (BOOL)hasDeviceAggregationId
{
  return self->_deviceAggregationId != 0;
}

- (void)deleteAggregationInterval
{
}

- (BOOL)hasAggregationInterval
{
  return self->_aggregationInterval != 0;
}

- (void)deleteEventTimestampInMsSince1970
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventTimestampInMsSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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

- (void)deleteOdfunnelId
{
}

- (BOOL)hasOdfunnelId
{
  return self->_odfunnelId != 0;
}

@end