@interface SIServiceInstrumentationBatch
- (BOOL)hasApp_id;
- (BOOL)hasBatch_info;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)events;
- (NSData)jsonData;
- (NSString)app_id;
- (SIServiceBatchInfo)batch_info;
- (SIServiceInstrumentationBatch)initWithDictionary:(id)a3;
- (SIServiceInstrumentationBatch)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)eventAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)eventCount;
- (unint64_t)hash;
- (void)addEvent:(id)a3;
- (void)clearEvent;
- (void)deleteApp_id;
- (void)deleteBatch_info;
- (void)setApp_id:(id)a3;
- (void)setBatch_info:(id)a3;
- (void)setEvents:(id)a3;
- (void)setHasApp_id:(BOOL)a3;
- (void)setHasBatch_info:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIServiceInstrumentationBatch

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SIServiceInstrumentationBatch;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(SIServiceInstrumentationBatch *)self batch_info];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SIServiceInstrumentationBatch *)self deleteBatch_info];
  }
  v9 = [(SIServiceInstrumentationBatch *)self events];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(SIServiceInstrumentationBatch *)self setEvents:v10];

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
  objc_storeStrong((id *)&self->_batch_info, 0);
  objc_storeStrong((id *)&self->_app_id, 0);
}

- (void)setHasBatch_info:(BOOL)a3
{
  self->_hasBatch_info = a3;
}

- (void)setHasApp_id:(BOOL)a3
{
  self->_hasApp_id = a3;
}

- (void)setEvents:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (void)setBatch_info:(id)a3
{
}

- (SIServiceBatchInfo)batch_info
{
  return self->_batch_info;
}

- (void)setApp_id:(id)a3
{
}

- (NSString)app_id
{
  return self->_app_id;
}

- (SIServiceInstrumentationBatch)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SIServiceInstrumentationBatch;
  v5 = [(SIServiceInstrumentationBatch *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SIServiceInstrumentationBatch *)v5 setApp_id:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"batchInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SIServiceBatchInfo alloc] initWithDictionary:v8];
      [(SIServiceInstrumentationBatch *)v5 setBatch_info:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"event"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v8;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[SISchemaAnyEvent alloc] initWithDictionary:v16];
              [(SIServiceInstrumentationBatch *)v5 addEvent:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v13);
      }

      int v8 = v20;
    }
    v18 = v5;
  }
  return v5;
}

- (SIServiceInstrumentationBatch)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIServiceInstrumentationBatch *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIServiceInstrumentationBatch *)self dictionaryRepresentation];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_app_id)
  {
    id v4 = [(SIServiceInstrumentationBatch *)self app_id];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appId"];
  }
  if (self->_batch_info)
  {
    v6 = [(SIServiceInstrumentationBatch *)self batch_info];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"batchInfo"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"batchInfo"];
    }
  }
  if ([(NSArray *)self->_events count])
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = self->_events;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"event"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_app_id hash];
  unint64_t v4 = [(SIServiceBatchInfo *)self->_batch_info hash] ^ v3;
  return v4 ^ [(NSArray *)self->_events hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(SIServiceInstrumentationBatch *)self app_id];
  v6 = objc_msgSend(v4, "app_id");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SIServiceInstrumentationBatch *)self app_id];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(SIServiceInstrumentationBatch *)self app_id];
    v10 = objc_msgSend(v4, "app_id");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SIServiceInstrumentationBatch *)self batch_info];
  v6 = objc_msgSend(v4, "batch_info");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(SIServiceInstrumentationBatch *)self batch_info];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(SIServiceInstrumentationBatch *)self batch_info];
    v15 = objc_msgSend(v4, "batch_info");
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SIServiceInstrumentationBatch *)self events];
  v6 = [v4 events];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(SIServiceInstrumentationBatch *)self events];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    long long v18 = (void *)v17;
    long long v19 = [(SIServiceInstrumentationBatch *)self events];
    long long v20 = [v4 events];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SIServiceInstrumentationBatch *)self app_id];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(SIServiceInstrumentationBatch *)self batch_info];

  if (v6)
  {
    uint64_t v7 = [(SIServiceInstrumentationBatch *)self batch_info];
    PBDataWriterWriteSubmessage();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = self->_events;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIServiceInstrumentationBatchReadFrom(self, (uint64_t)a3);
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
    v6 = [MEMORY[0x1E4F1CA48] array];
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

- (void)deleteBatch_info
{
}

- (BOOL)hasBatch_info
{
  return self->_batch_info != 0;
}

- (void)deleteApp_id
{
}

- (BOOL)hasApp_id
{
  return self->_app_id != 0;
}

@end