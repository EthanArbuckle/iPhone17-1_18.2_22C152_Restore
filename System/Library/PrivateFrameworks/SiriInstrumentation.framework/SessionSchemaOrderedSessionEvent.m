@interface SessionSchemaOrderedSessionEvent
- (BOOL)hasEvent;
- (BOOL)hasLogicalEventTimestampInNs;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaAnyEvent)event;
- (SISchemaCommonEventMetadata)metadata;
- (SessionSchemaOrderedSessionEvent)initWithDictionary:(id)a3;
- (SessionSchemaOrderedSessionEvent)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)logicalEventTimestampInNs;
- (unint64_t)hash;
- (void)deleteEvent;
- (void)deleteLogicalEventTimestampInNs;
- (void)deleteMetadata;
- (void)setEvent:(id)a3;
- (void)setHasEvent:(BOOL)a3;
- (void)setHasLogicalEventTimestampInNs:(BOOL)a3;
- (void)setHasMetadata:(BOOL)a3;
- (void)setLogicalEventTimestampInNs:(int64_t)a3;
- (void)setMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SessionSchemaOrderedSessionEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SessionSchemaOrderedSessionEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SessionSchemaOrderedSessionEvent *)self event];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SessionSchemaOrderedSessionEvent *)self deleteEvent];
  }
  v9 = [(SessionSchemaOrderedSessionEvent *)self metadata];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SessionSchemaOrderedSessionEvent *)self deleteMetadata];
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
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)setHasMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasEvent:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setMetadata:(id)a3
{
}

- (SISchemaCommonEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setEvent:(id)a3
{
}

- (SISchemaAnyEvent)event
{
  return self->_event;
}

- (int64_t)logicalEventTimestampInNs
{
  return self->_logicalEventTimestampInNs;
}

- (SessionSchemaOrderedSessionEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SessionSchemaOrderedSessionEvent;
  v5 = [(SessionSchemaOrderedSessionEvent *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"logicalEventTimestampInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SessionSchemaOrderedSessionEvent setLogicalEventTimestampInNs:](v5, "setLogicalEventTimestampInNs:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"event"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[SISchemaAnyEvent alloc] initWithDictionary:v7];
      [(SessionSchemaOrderedSessionEvent *)v5 setEvent:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaCommonEventMetadata alloc] initWithDictionary:v9];
      [(SessionSchemaOrderedSessionEvent *)v5 setMetadata:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (SessionSchemaOrderedSessionEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SessionSchemaOrderedSessionEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SessionSchemaOrderedSessionEvent *)self dictionaryRepresentation];
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
  if (self->_event)
  {
    id v4 = [(SessionSchemaOrderedSessionEvent *)self event];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"event"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"event"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SessionSchemaOrderedSessionEvent logicalEventTimestampInNs](self, "logicalEventTimestampInNs"));
    [v3 setObject:v7 forKeyedSubscript:@"logicalEventTimestampInNs"];
  }
  if (self->_metadata)
  {
    int v8 = [(SessionSchemaOrderedSessionEvent *)self metadata];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"metadata"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"metadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_logicalEventTimestampInNs;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SISchemaAnyEvent *)self->_event hash] ^ v3;
  return v4 ^ [(SISchemaCommonEventMetadata *)self->_metadata hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int64_t logicalEventTimestampInNs = self->_logicalEventTimestampInNs;
    if (logicalEventTimestampInNs != [v4 logicalEventTimestampInNs]) {
      goto LABEL_15;
    }
  }
  v6 = [(SessionSchemaOrderedSessionEvent *)self event];
  uint64_t v7 = [v4 event];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(SessionSchemaOrderedSessionEvent *)self event];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SessionSchemaOrderedSessionEvent *)self event];
    int v11 = [v4 event];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(SessionSchemaOrderedSessionEvent *)self metadata];
  uint64_t v7 = [v4 metadata];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(SessionSchemaOrderedSessionEvent *)self metadata];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SessionSchemaOrderedSessionEvent *)self metadata];
    v16 = [v4 metadata];
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
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  unint64_t v4 = [(SessionSchemaOrderedSessionEvent *)self event];

  if (v4)
  {
    v5 = [(SessionSchemaOrderedSessionEvent *)self event];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SessionSchemaOrderedSessionEvent *)self metadata];

  uint64_t v7 = v9;
  if (v6)
  {
    uint64_t v8 = [(SessionSchemaOrderedSessionEvent *)self metadata];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SessionSchemaOrderedSessionEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteMetadata
{
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)deleteEvent
{
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

- (void)deleteLogicalEventTimestampInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLogicalEventTimestampInNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLogicalEventTimestampInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLogicalEventTimestampInNs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t logicalEventTimestampInNs = a3;
}

@end