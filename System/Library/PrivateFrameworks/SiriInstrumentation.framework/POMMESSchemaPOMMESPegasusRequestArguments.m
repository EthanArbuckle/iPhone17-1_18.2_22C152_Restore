@interface POMMESSchemaPOMMESPegasusRequestArguments
- (BOOL)hasClientConversationMetadata;
- (BOOL)hasConversationContextBytesLength;
- (BOOL)hasFeatureFlag;
- (BOOL)hasIsDataOnlyRequest;
- (BOOL)hasPersonalDomainFallback;
- (BOOL)hasQueryMetadata;
- (BOOL)hasSiriPegasusMetadata;
- (BOOL)isDataOnlyRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)queries;
- (NSData)jsonData;
- (NSString)featureFlag;
- (NSString)personalDomainFallback;
- (POMMESSchemaPOMMESClientConversationMetadata)clientConversationMetadata;
- (POMMESSchemaPOMMESPegasusQueryMetadata)queryMetadata;
- (POMMESSchemaPOMMESPegasusRequestArguments)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusRequestArguments)initWithJSON:(id)a3;
- (POMMESSchemaPOMMESSiriPegasusMetadata)siriPegasusMetadata;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)queriesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)queriesCount;
- (unsigned)conversationContextBytesLength;
- (void)addQueries:(id)a3;
- (void)clearQueries;
- (void)deleteClientConversationMetadata;
- (void)deleteConversationContextBytesLength;
- (void)deleteFeatureFlag;
- (void)deleteIsDataOnlyRequest;
- (void)deletePersonalDomainFallback;
- (void)deleteQueryMetadata;
- (void)deleteSiriPegasusMetadata;
- (void)setClientConversationMetadata:(id)a3;
- (void)setConversationContextBytesLength:(unsigned int)a3;
- (void)setFeatureFlag:(id)a3;
- (void)setHasClientConversationMetadata:(BOOL)a3;
- (void)setHasConversationContextBytesLength:(BOOL)a3;
- (void)setHasFeatureFlag:(BOOL)a3;
- (void)setHasIsDataOnlyRequest:(BOOL)a3;
- (void)setHasPersonalDomainFallback:(BOOL)a3;
- (void)setHasQueryMetadata:(BOOL)a3;
- (void)setHasSiriPegasusMetadata:(BOOL)a3;
- (void)setIsDataOnlyRequest:(BOOL)a3;
- (void)setPersonalDomainFallback:(id)a3;
- (void)setQueries:(id)a3;
- (void)setQueryMetadata:(id)a3;
- (void)setSiriPegasusMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusRequestArguments

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)POMMESSchemaPOMMESPegasusRequestArguments;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queries];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(POMMESSchemaPOMMESPegasusRequestArguments *)self setQueries:v7];

  v8 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queryMetadata];
  v9 = [v8 applySensitiveConditionsPolicy:v4];
  int v10 = [v9 suppressMessage];

  if (v10) {
    [(POMMESSchemaPOMMESPegasusRequestArguments *)self deleteQueryMetadata];
  }
  v11 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self siriPegasusMetadata];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(POMMESSchemaPOMMESPegasusRequestArguments *)self deleteSiriPegasusMetadata];
  }
  v14 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self clientConversationMetadata];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(POMMESSchemaPOMMESPegasusRequestArguments *)self deleteClientConversationMetadata];
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
  objc_storeStrong((id *)&self->_personalDomainFallback, 0);
  objc_storeStrong((id *)&self->_clientConversationMetadata, 0);
  objc_storeStrong((id *)&self->_siriPegasusMetadata, 0);
  objc_storeStrong((id *)&self->_featureFlag, 0);
  objc_storeStrong((id *)&self->_queryMetadata, 0);
  objc_storeStrong((id *)&self->_queries, 0);
}

- (void)setHasPersonalDomainFallback:(BOOL)a3
{
  self->_hasFeatureFlag = a3;
}

- (void)setHasClientConversationMetadata:(BOOL)a3
{
  self->_hasQueryMetadata = a3;
}

- (void)setHasSiriPegasusMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasFeatureFlag:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasQueryMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPersonalDomainFallback:(id)a3
{
}

- (NSString)personalDomainFallback
{
  return self->_personalDomainFallback;
}

- (unsigned)conversationContextBytesLength
{
  return self->_conversationContextBytesLength;
}

- (void)setClientConversationMetadata:(id)a3
{
}

- (POMMESSchemaPOMMESClientConversationMetadata)clientConversationMetadata
{
  return self->_clientConversationMetadata;
}

- (BOOL)isDataOnlyRequest
{
  return self->_isDataOnlyRequest;
}

- (void)setSiriPegasusMetadata:(id)a3
{
}

- (POMMESSchemaPOMMESSiriPegasusMetadata)siriPegasusMetadata
{
  return self->_siriPegasusMetadata;
}

- (void)setFeatureFlag:(id)a3
{
}

- (NSString)featureFlag
{
  return self->_featureFlag;
}

- (void)setQueryMetadata:(id)a3
{
}

- (POMMESSchemaPOMMESPegasusQueryMetadata)queryMetadata
{
  return self->_queryMetadata;
}

- (void)setQueries:(id)a3
{
}

- (NSArray)queries
{
  return self->_queries;
}

- (POMMESSchemaPOMMESPegasusRequestArguments)initWithDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)POMMESSchemaPOMMESPegasusRequestArguments;
  v5 = [(POMMESSchemaPOMMESPegasusRequestArguments *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"queries"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v13 = [[POMMESSchemaPOMMESPegasusSearchQuery alloc] initWithDictionary:v12];
              [(POMMESSchemaPOMMESPegasusRequestArguments *)v5 addQueries:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"queryMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[POMMESSchemaPOMMESPegasusQueryMetadata alloc] initWithDictionary:v14];
      [(POMMESSchemaPOMMESPegasusRequestArguments *)v5 setQueryMetadata:v15];
    }
    int v16 = [v4 objectForKeyedSubscript:@"featureFlag"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(POMMESSchemaPOMMESPegasusRequestArguments *)v5 setFeatureFlag:v17];
    }
    v28 = v6;
    objc_super v18 = [v4 objectForKeyedSubscript:@"siriPegasusMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[POMMESSchemaPOMMESSiriPegasusMetadata alloc] initWithDictionary:v18];
      [(POMMESSchemaPOMMESPegasusRequestArguments *)v5 setSiriPegasusMetadata:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"isDataOnlyRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusRequestArguments setIsDataOnlyRequest:](v5, "setIsDataOnlyRequest:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"clientConversationMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[POMMESSchemaPOMMESClientConversationMetadata alloc] initWithDictionary:v21];
      [(POMMESSchemaPOMMESPegasusRequestArguments *)v5 setClientConversationMetadata:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"conversationContextBytesLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusRequestArguments setConversationContextBytesLength:](v5, "setConversationContextBytesLength:", [v23 unsignedIntValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"personalDomainFallback"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(POMMESSchemaPOMMESPegasusRequestArguments *)v5 setPersonalDomainFallback:v25];
    }
    v26 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusRequestArguments)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusRequestArguments *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self dictionaryRepresentation];
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
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_clientConversationMetadata)
  {
    id v4 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self clientConversationMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clientConversationMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clientConversationMetadata"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusRequestArguments conversationContextBytesLength](self, "conversationContextBytesLength"));
    [v3 setObject:v7 forKeyedSubscript:@"conversationContextBytesLength"];
  }
  if (self->_featureFlag)
  {
    uint64_t v8 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self featureFlag];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"featureFlag"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusRequestArguments isDataOnlyRequest](self, "isDataOnlyRequest"));
    [v3 setObject:v10 forKeyedSubscript:@"isDataOnlyRequest"];
  }
  if (self->_personalDomainFallback)
  {
    uint64_t v11 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self personalDomainFallback];
    uint64_t v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"personalDomainFallback"];
  }
  if ([(NSArray *)self->_queries count])
  {
    int v13 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v14 = self->_queries;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (void)v28);
          if (v19)
          {
            [v13 addObject:v19];
          }
          else
          {
            v20 = [MEMORY[0x1E4F1CA98] null];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"queries"];
  }
  if (self->_queryMetadata)
  {
    v21 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queryMetadata];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"queryMetadata"];
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"queryMetadata"];
    }
  }
  if (self->_siriPegasusMetadata)
  {
    v24 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self siriPegasusMetadata];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"siriPegasusMetadata"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"siriPegasusMetadata"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v28);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_queries hash];
  unint64_t v4 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self->_queryMetadata hash];
  NSUInteger v5 = [(NSString *)self->_featureFlag hash];
  unint64_t v6 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self->_siriPegasusMetadata hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_isDataOnlyRequest;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(POMMESSchemaPOMMESClientConversationMetadata *)self->_clientConversationMetadata hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_conversationContextBytesLength;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_personalDomainFallback hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  NSUInteger v5 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queries];
  unint64_t v6 = [v4 queries];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v7 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queries];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queries];
    uint64_t v10 = [v4 queries];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queryMetadata];
  unint64_t v6 = [v4 queryMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v12 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queryMetadata];
  if (v12)
  {
    int v13 = (void *)v12;
    v14 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queryMetadata];
    uint64_t v15 = [v4 queryMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self featureFlag];
  unint64_t v6 = [v4 featureFlag];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v17 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self featureFlag];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self featureFlag];
    v20 = [v4 featureFlag];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self siriPegasusMetadata];
  unint64_t v6 = [v4 siriPegasusMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v22 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self siriPegasusMetadata];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self siriPegasusMetadata];
    v25 = [v4 siriPegasusMetadata];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[72] & 1)) {
    goto LABEL_38;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isDataOnlyRequest = self->_isDataOnlyRequest;
    if (isDataOnlyRequest != [v4 isDataOnlyRequest]) {
      goto LABEL_38;
    }
  }
  NSUInteger v5 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self clientConversationMetadata];
  unint64_t v6 = [v4 clientConversationMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self clientConversationMetadata];
  if (v28)
  {
    long long v29 = (void *)v28;
    long long v30 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self clientConversationMetadata];
    long long v31 = [v4 clientConversationMetadata];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  int v33 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v33 != ((v4[72] >> 1) & 1)) {
    goto LABEL_38;
  }
  if (v33)
  {
    unsigned int conversationContextBytesLength = self->_conversationContextBytesLength;
    if (conversationContextBytesLength != [v4 conversationContextBytesLength]) {
      goto LABEL_38;
    }
  }
  NSUInteger v5 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self personalDomainFallback];
  unint64_t v6 = [v4 personalDomainFallback];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v35 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self personalDomainFallback];
    if (!v35)
    {

LABEL_41:
      BOOL v40 = 1;
      goto LABEL_39;
    }
    v36 = (void *)v35;
    v37 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self personalDomainFallback];
    v38 = [v4 personalDomainFallback];
    char v39 = [v37 isEqual:v38];

    if (v39) {
      goto LABEL_41;
    }
  }
  else
  {
LABEL_37:
  }
LABEL_38:
  BOOL v40 = 0;
LABEL_39:

  return v40;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  NSUInteger v5 = self->_queries;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queryMetadata];

  if (v10)
  {
    int v11 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self queryMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self featureFlag];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  int v13 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self siriPegasusMetadata];

  if (v13)
  {
    v14 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self siriPegasusMetadata];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v15 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self clientConversationMetadata];

  if (v15)
  {
    int v16 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self clientConversationMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v17 = [(POMMESSchemaPOMMESPegasusRequestArguments *)self personalDomainFallback];

  if (v17) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusRequestArgumentsReadFrom(self, (uint64_t)a3);
}

- (void)deletePersonalDomainFallback
{
}

- (BOOL)hasPersonalDomainFallback
{
  return self->_personalDomainFallback != 0;
}

- (void)deleteConversationContextBytesLength
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasConversationContextBytesLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConversationContextBytesLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConversationContextBytesLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int conversationContextBytesLength = a3;
}

- (void)deleteClientConversationMetadata
{
}

- (BOOL)hasClientConversationMetadata
{
  return self->_clientConversationMetadata != 0;
}

- (void)deleteIsDataOnlyRequest
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsDataOnlyRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDataOnlyRequest
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsDataOnlyRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isDataOnlyRequest = a3;
}

- (void)deleteSiriPegasusMetadata
{
}

- (BOOL)hasSiriPegasusMetadata
{
  return self->_siriPegasusMetadata != 0;
}

- (void)deleteFeatureFlag
{
}

- (BOOL)hasFeatureFlag
{
  return self->_featureFlag != 0;
}

- (void)deleteQueryMetadata
{
}

- (BOOL)hasQueryMetadata
{
  return self->_queryMetadata != 0;
}

- (id)queriesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_queries objectAtIndexedSubscript:a3];
}

- (unint64_t)queriesCount
{
  return [(NSArray *)self->_queries count];
}

- (void)addQueries:(id)a3
{
  id v4 = a3;
  queries = self->_queries;
  id v8 = v4;
  if (!queries)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_queries;
    self->_queries = v6;

    id v4 = v8;
    queries = self->_queries;
  }
  [(NSArray *)queries addObject:v4];
}

- (void)clearQueries
{
}

@end