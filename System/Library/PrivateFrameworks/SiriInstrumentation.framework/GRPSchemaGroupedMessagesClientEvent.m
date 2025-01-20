@interface GRPSchemaGroupedMessagesClientEvent
- (BOOL)hasGroupedBy;
- (BOOL)hasProducerMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRPSchemaGroupedMessagesClientEvent)initWithDictionary:(id)a3;
- (GRPSchemaGroupedMessagesClientEvent)initWithJSON:(id)a3;
- (GRPSchemaGroupedMessagesGrouping)groupedBy;
- (GRPSchemaProducerMetadata)producerMetadata;
- (NSArray)orderedMessages;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)orderedMessagesAtIndex:(unint64_t)a3;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)orderedMessagesCount;
- (void)addOrderedMessages:(id)a3;
- (void)clearOrderedMessages;
- (void)deleteGroupedBy;
- (void)deleteProducerMetadata;
- (void)setGroupedBy:(id)a3;
- (void)setHasGroupedBy:(BOOL)a3;
- (void)setHasProducerMetadata:(BOOL)a3;
- (void)setOrderedMessages:(id)a3;
- (void)setProducerMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRPSchemaGroupedMessagesClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GRPSchemaGroupedMessagesClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(GRPSchemaGroupedMessagesClientEvent *)self groupedBy];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GRPSchemaGroupedMessagesClientEvent *)self deleteGroupedBy];
  }
  v9 = [(GRPSchemaGroupedMessagesClientEvent *)self producerMetadata];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(GRPSchemaGroupedMessagesClientEvent *)self deleteProducerMetadata];
  }
  v12 = [(GRPSchemaGroupedMessagesClientEvent *)self orderedMessages];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(GRPSchemaGroupedMessagesClientEvent *)self setOrderedMessages:v13];

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
  objc_storeStrong((id *)&self->_orderedMessages, 0);
  objc_storeStrong((id *)&self->_producerMetadata, 0);
  objc_storeStrong((id *)&self->_groupedBy, 0);
}

- (void)setHasProducerMetadata:(BOOL)a3
{
  self->_hasProducerMetadata = a3;
}

- (void)setHasGroupedBy:(BOOL)a3
{
  self->_hasGroupedBy = a3;
}

- (void)setOrderedMessages:(id)a3
{
}

- (NSArray)orderedMessages
{
  return self->_orderedMessages;
}

- (void)setProducerMetadata:(id)a3
{
}

- (GRPSchemaProducerMetadata)producerMetadata
{
  return self->_producerMetadata;
}

- (void)setGroupedBy:(id)a3
{
}

- (GRPSchemaGroupedMessagesGrouping)groupedBy
{
  return self->_groupedBy;
}

- (GRPSchemaGroupedMessagesClientEvent)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GRPSchemaGroupedMessagesClientEvent;
  v5 = [(GRPSchemaGroupedMessagesClientEvent *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"groupedBy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[GRPSchemaGroupedMessagesGrouping alloc] initWithDictionary:v6];
      [(GRPSchemaGroupedMessagesClientEvent *)v5 setGroupedBy:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"producerMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[GRPSchemaProducerMetadata alloc] initWithDictionary:v8];
      [(GRPSchemaGroupedMessagesClientEvent *)v5 setProducerMetadata:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"orderedMessages"];
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
              v17 = [[GRPSchemaOrderedMessage alloc] initWithDictionary:v16];
              [(GRPSchemaGroupedMessagesClientEvent *)v5 addOrderedMessages:v17];
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

- (GRPSchemaGroupedMessagesClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRPSchemaGroupedMessagesClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRPSchemaGroupedMessagesClientEvent *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_groupedBy)
  {
    id v4 = [(GRPSchemaGroupedMessagesClientEvent *)self groupedBy];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"groupedBy"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"groupedBy"];
    }
  }
  if ([(NSArray *)self->_orderedMessages count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v8 = self->_orderedMessages;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"orderedMessages"];
  }
  if (self->_producerMetadata)
  {
    objc_super v15 = [(GRPSchemaGroupedMessagesClientEvent *)self producerMetadata];
    uint64_t v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"producerMetadata"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"producerMetadata"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GRPSchemaGroupedMessagesGrouping *)self->_groupedBy hash];
  unint64_t v4 = [(GRPSchemaProducerMetadata *)self->_producerMetadata hash] ^ v3;
  return v4 ^ [(NSArray *)self->_orderedMessages hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(GRPSchemaGroupedMessagesClientEvent *)self groupedBy];
  v6 = [v4 groupedBy];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(GRPSchemaGroupedMessagesClientEvent *)self groupedBy];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(GRPSchemaGroupedMessagesClientEvent *)self groupedBy];
    uint64_t v10 = [v4 groupedBy];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(GRPSchemaGroupedMessagesClientEvent *)self producerMetadata];
  v6 = [v4 producerMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(GRPSchemaGroupedMessagesClientEvent *)self producerMetadata];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(GRPSchemaGroupedMessagesClientEvent *)self producerMetadata];
    objc_super v15 = [v4 producerMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(GRPSchemaGroupedMessagesClientEvent *)self orderedMessages];
  v6 = [v4 orderedMessages];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(GRPSchemaGroupedMessagesClientEvent *)self orderedMessages];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(GRPSchemaGroupedMessagesClientEvent *)self orderedMessages];
    long long v20 = [v4 orderedMessages];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(GRPSchemaGroupedMessagesClientEvent *)self groupedBy];

  if (v5)
  {
    v6 = [(GRPSchemaGroupedMessagesClientEvent *)self groupedBy];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(GRPSchemaGroupedMessagesClientEvent *)self producerMetadata];

  if (v7)
  {
    int v8 = [(GRPSchemaGroupedMessagesClientEvent *)self producerMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = self->_orderedMessages;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRPSchemaGroupedMessagesClientEventReadFrom(self, (uint64_t)a3);
}

- (id)orderedMessagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_orderedMessages objectAtIndexedSubscript:a3];
}

- (unint64_t)orderedMessagesCount
{
  return [(NSArray *)self->_orderedMessages count];
}

- (void)addOrderedMessages:(id)a3
{
  id v4 = a3;
  orderedMessages = self->_orderedMessages;
  id v8 = v4;
  if (!orderedMessages)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_orderedMessages;
    self->_orderedMessages = v6;

    id v4 = v8;
    orderedMessages = self->_orderedMessages;
  }
  [(NSArray *)orderedMessages addObject:v4];
}

- (void)clearOrderedMessages
{
}

- (void)deleteProducerMetadata
{
}

- (BOOL)hasProducerMetadata
{
  return self->_producerMetadata != 0;
}

- (void)deleteGroupedBy
{
}

- (BOOL)hasGroupedBy
{
  return self->_groupedBy != 0;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.platform.GroupedMessagesClientEvent";
}

- (int)getAnyEventType
{
  return 66;
}

@end