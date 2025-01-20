@interface SessionSchemaSession
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)events;
- (NSData)jsonData;
- (SessionSchemaSession)initWithDictionary:(id)a3;
- (SessionSchemaSession)initWithJSON:(id)a3;
- (SessionSchemaSessionId)sessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)eventAtIndex:(unint64_t)a3;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)eventCount;
- (unint64_t)hash;
- (void)addEvent:(id)a3;
- (void)clearEvent;
- (void)deleteSessionId;
- (void)setEvents:(id)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SessionSchemaSession

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SessionSchemaSession;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(SessionSchemaSession *)self sessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SessionSchemaSession *)self deleteSessionId];
  }
  v9 = [(SessionSchemaSession *)self events];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(SessionSchemaSession *)self setEvents:v10];

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
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

- (void)setHasSessionId:(BOOL)a3
{
  self->_hasSessionId = a3;
}

- (void)setEvents:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (void)setSessionId:(id)a3
{
}

- (SessionSchemaSessionId)sessionId
{
  return self->_sessionId;
}

- (SessionSchemaSession)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SessionSchemaSession;
  v5 = [(SessionSchemaSession *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SessionSchemaSessionId alloc] initWithDictionary:v6];
      [(SessionSchemaSession *)v5 setSessionId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"event"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[SessionSchemaOrderedSessionEvent alloc] initWithDictionary:v14];
              [(SessionSchemaSession *)v5 addEvent:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (SessionSchemaSession)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SessionSchemaSession *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SessionSchemaSession *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_events count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_events;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"event"];
  }
  if (self->_sessionId)
  {
    uint64_t v12 = [(SessionSchemaSession *)self sessionId];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"sessionId"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"sessionId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SessionSchemaSessionId *)self->_sessionId hash];
  return [(NSArray *)self->_events hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SessionSchemaSession *)self sessionId];
  uint64_t v6 = [v4 sessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SessionSchemaSession *)self sessionId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(SessionSchemaSession *)self sessionId];
    uint64_t v10 = [v4 sessionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SessionSchemaSession *)self events];
  uint64_t v6 = [v4 events];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SessionSchemaSession *)self events];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(SessionSchemaSession *)self events];
    v15 = [v4 events];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SessionSchemaSession *)self sessionId];

  if (v5)
  {
    uint64_t v6 = [(SessionSchemaSession *)self sessionId];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_events;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SessionSchemaSessionReadFrom(self, (uint64_t)a3);
}

- (id)eventAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_events objectAtIndexedSubscript:a3];
}

- (unint64_t)eventCount
{
  return [(NSArray *)self->_events count];
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSArray *)events addObject:v4];
}

- (void)clearEvent
{
}

- (void)deleteSessionId
{
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.platform.Session";
}

- (int)getAnyEventType
{
  return 82;
}

@end