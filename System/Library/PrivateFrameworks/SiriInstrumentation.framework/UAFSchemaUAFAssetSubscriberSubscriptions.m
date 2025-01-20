@interface UAFSchemaUAFAssetSubscriberSubscriptions
- (BOOL)hasSubscriberName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)subscriptions;
- (NSData)jsonData;
- (NSString)subscriberName;
- (UAFSchemaUAFAssetSubscriberSubscriptions)initWithDictionary:(id)a3;
- (UAFSchemaUAFAssetSubscriberSubscriptions)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)subscriptionsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)subscriptionsCount;
- (void)addSubscriptions:(id)a3;
- (void)clearSubscriptions;
- (void)deleteSubscriberName;
- (void)setHasSubscriberName:(BOOL)a3;
- (void)setSubscriberName:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UAFSchemaUAFAssetSubscriberSubscriptions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UAFSchemaUAFAssetSubscriberSubscriptions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self subscriptions];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(UAFSchemaUAFAssetSubscriberSubscriptions *)self setSubscriptions:v7];
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
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_subscriberName, 0);
}

- (void)setHasSubscriberName:(BOOL)a3
{
  self->_hasSubscriberName = a3;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriberName:(id)a3
{
}

- (NSString)subscriberName
{
  return self->_subscriberName;
}

- (UAFSchemaUAFAssetSubscriberSubscriptions)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)UAFSchemaUAFAssetSubscriberSubscriptions;
  v5 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"subscriberName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(UAFSchemaUAFAssetSubscriberSubscriptions *)v5 setSubscriberName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"subscriptions"];
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
              v15 = [[UAFSchemaUAFAssetSetSubscription alloc] initWithDictionary:v14];
              [(UAFSchemaUAFAssetSubscriberSubscriptions *)v5 addSubscriptions:v15];
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

- (UAFSchemaUAFAssetSubscriberSubscriptions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self dictionaryRepresentation];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_subscriberName)
  {
    id v4 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self subscriberName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"subscriberName"];
  }
  if ([(NSArray *)self->_subscriptions count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_subscriptions;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"subscriptions"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v15);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_subscriberName hash];
  return [(NSArray *)self->_subscriptions hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self subscriberName];
  v6 = [v4 subscriberName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self subscriberName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self subscriberName];
    uint64_t v10 = [v4 subscriberName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self subscriptions];
  v6 = [v4 subscriptions];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self subscriptions];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self subscriptions];
    long long v15 = [v4 subscriptions];
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UAFSchemaUAFAssetSubscriberSubscriptions *)self subscriberName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_subscriptions;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetSubscriberSubscriptionsReadFrom(self, (uint64_t)a3);
}

- (id)subscriptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_subscriptions objectAtIndexedSubscript:a3];
}

- (unint64_t)subscriptionsCount
{
  return [(NSArray *)self->_subscriptions count];
}

- (void)addSubscriptions:(id)a3
{
  id v4 = a3;
  subscriptions = self->_subscriptions;
  id v8 = v4;
  if (!subscriptions)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_subscriptions;
    self->_subscriptions = v6;

    id v4 = v8;
    subscriptions = self->_subscriptions;
  }
  [(NSArray *)subscriptions addObject:v4];
}

- (void)clearSubscriptions
{
}

- (void)deleteSubscriberName
{
}

- (BOOL)hasSubscriberName
{
  return self->_subscriberName != 0;
}

@end