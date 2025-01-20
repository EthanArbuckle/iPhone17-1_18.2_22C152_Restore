@interface SISchemaClientTransportEventMetadata
- (BOOL)hasArrivedServerPod;
- (BOOL)hasEventTransmittedRelativeToBootTimeTimestampNs;
- (BOOL)hasEventTransmittedTimestampRefId;
- (BOOL)hasServerArrivedTimestampNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)arrivedServerPod;
- (NSString)eventTransmittedTimestampRefId;
- (SISchemaClientTransportEventMetadata)initWithDictionary:(id)a3;
- (SISchemaClientTransportEventMetadata)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)eventTransmittedRelativeToBootTimeTimestampNs;
- (int64_t)serverArrivedTimestampNs;
- (unint64_t)hash;
- (void)deleteArrivedServerPod;
- (void)deleteEventTransmittedRelativeToBootTimeTimestampNs;
- (void)deleteEventTransmittedTimestampRefId;
- (void)deleteServerArrivedTimestampNs;
- (void)setArrivedServerPod:(id)a3;
- (void)setEventTransmittedRelativeToBootTimeTimestampNs:(int64_t)a3;
- (void)setEventTransmittedTimestampRefId:(id)a3;
- (void)setHasArrivedServerPod:(BOOL)a3;
- (void)setHasEventTransmittedRelativeToBootTimeTimestampNs:(BOOL)a3;
- (void)setHasEventTransmittedTimestampRefId:(BOOL)a3;
- (void)setHasServerArrivedTimestampNs:(BOOL)a3;
- (void)setServerArrivedTimestampNs:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaClientTransportEventMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivedServerPod, 0);
  objc_storeStrong((id *)&self->_eventTransmittedTimestampRefId, 0);
}

- (void)setHasArrivedServerPod:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasEventTransmittedTimestampRefId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setArrivedServerPod:(id)a3
{
}

- (NSString)arrivedServerPod
{
  return self->_arrivedServerPod;
}

- (int64_t)serverArrivedTimestampNs
{
  return self->_serverArrivedTimestampNs;
}

- (int64_t)eventTransmittedRelativeToBootTimeTimestampNs
{
  return self->_eventTransmittedRelativeToBootTimeTimestampNs;
}

- (void)setEventTransmittedTimestampRefId:(id)a3
{
}

- (NSString)eventTransmittedTimestampRefId
{
  return self->_eventTransmittedTimestampRefId;
}

- (SISchemaClientTransportEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaClientTransportEventMetadata;
  v5 = [(SISchemaClientTransportEventMetadata *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventTransmittedTimestampRefId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaClientTransportEventMetadata *)v5 setEventTransmittedTimestampRefId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"eventTransmittedRelativeToBootTimeTimestampNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaClientTransportEventMetadata setEventTransmittedRelativeToBootTimeTimestampNs:](v5, "setEventTransmittedRelativeToBootTimeTimestampNs:", [v8 longLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"serverArrivedTimestampNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaClientTransportEventMetadata setServerArrivedTimestampNs:](v5, "setServerArrivedTimestampNs:", [v9 longLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"arrivedServerPod"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(SISchemaClientTransportEventMetadata *)v5 setArrivedServerPod:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (SISchemaClientTransportEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaClientTransportEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaClientTransportEventMetadata *)self dictionaryRepresentation];
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
  if (self->_arrivedServerPod)
  {
    id v4 = [(SISchemaClientTransportEventMetadata *)self arrivedServerPod];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"arrivedServerPod"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaClientTransportEventMetadata eventTransmittedRelativeToBootTimeTimestampNs](self, "eventTransmittedRelativeToBootTimeTimestampNs"));
    [v3 setObject:v6 forKeyedSubscript:@"eventTransmittedRelativeToBootTimeTimestampNs"];
  }
  if (self->_eventTransmittedTimestampRefId)
  {
    uint64_t v7 = [(SISchemaClientTransportEventMetadata *)self eventTransmittedTimestampRefId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"eventTransmittedTimestampRefId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaClientTransportEventMetadata serverArrivedTimestampNs](self, "serverArrivedTimestampNs"));
    [v3 setObject:v9 forKeyedSubscript:@"serverArrivedTimestampNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_eventTransmittedTimestampRefId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_eventTransmittedRelativeToBootTimeTimestampNs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_arrivedServerPod hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_serverArrivedTimestampNs;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_arrivedServerPod hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  uint64_t v5 = [(SISchemaClientTransportEventMetadata *)self eventTransmittedTimestampRefId];
  v6 = [v4 eventTransmittedTimestampRefId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(SISchemaClientTransportEventMetadata *)self eventTransmittedTimestampRefId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaClientTransportEventMetadata *)self eventTransmittedTimestampRefId];
    v10 = [v4 eventTransmittedTimestampRefId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $40B14186B08E018462790434F5BB9021 has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int64_t eventTransmittedRelativeToBootTimeTimestampNs = self->_eventTransmittedRelativeToBootTimeTimestampNs;
    if (eventTransmittedRelativeToBootTimeTimestampNs != [v4 eventTransmittedRelativeToBootTimeTimestampNs])goto LABEL_19; {
    $40B14186B08E018462790434F5BB9021 has = self->_has;
    }
    unsigned int v13 = v4[40];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v15)
  {
    int64_t serverArrivedTimestampNs = self->_serverArrivedTimestampNs;
    if (serverArrivedTimestampNs != [v4 serverArrivedTimestampNs]) {
      goto LABEL_19;
    }
  }
  uint64_t v5 = [(SISchemaClientTransportEventMetadata *)self arrivedServerPod];
  v6 = [v4 arrivedServerPod];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v17 = [(SISchemaClientTransportEventMetadata *)self arrivedServerPod];
  if (!v17)
  {

LABEL_22:
    BOOL v22 = 1;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  v19 = [(SISchemaClientTransportEventMetadata *)self arrivedServerPod];
  v20 = [v4 arrivedServerPod];
  char v21 = [v19 isEqual:v20];

  if (v21) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SISchemaClientTransportEventMetadata *)self eventTransmittedTimestampRefId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  v6 = [(SISchemaClientTransportEventMetadata *)self arrivedServerPod];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientTransportEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteArrivedServerPod
{
}

- (BOOL)hasArrivedServerPod
{
  return self->_arrivedServerPod != 0;
}

- (void)deleteServerArrivedTimestampNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasServerArrivedTimestampNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerArrivedTimestampNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setServerArrivedTimestampNs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t serverArrivedTimestampNs = a3;
}

- (void)deleteEventTransmittedRelativeToBootTimeTimestampNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventTransmittedRelativeToBootTimeTimestampNs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventTransmittedRelativeToBootTimeTimestampNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventTransmittedRelativeToBootTimeTimestampNs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t eventTransmittedRelativeToBootTimeTimestampNs = a3;
}

- (void)deleteEventTransmittedTimestampRefId
{
}

- (BOOL)hasEventTransmittedTimestampRefId
{
  return self->_eventTransmittedTimestampRefId != 0;
}

@end