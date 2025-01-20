@interface SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest
+ (Class)conversationHistoryType;
- (BOOL)hasCurrentUserQuery;
- (BOOL)hasProbingResult;
- (BOOL)hasQueryDecorationOutput;
- (BOOL)hasRequestId;
- (BOOL)hasTrpCandidateId;
- (BOOL)hasTurnContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)conversationHistorys;
- (NSString)currentUserQuery;
- (NSString)requestId;
- (NSString)trpCandidateId;
- (SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext)turnContext;
- (SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult)probingResult;
- (SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput)queryDecorationOutput;
- (id)conversationHistoryAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)conversationHistorysCount;
- (unint64_t)hash;
- (void)addConversationHistory:(id)a3;
- (void)clearConversationHistorys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConversationHistorys:(id)a3;
- (void)setCurrentUserQuery:(id)a3;
- (void)setProbingResult:(id)a3;
- (void)setQueryDecorationOutput:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTrpCandidateId:(id)a3;
- (void)setTurnContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_trpCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_queryDecorationOutput, 0);
  objc_storeStrong((id *)&self->_probingResult, 0);
  objc_storeStrong((id *)&self->_currentUserQuery, 0);
  objc_storeStrong((id *)&self->_conversationHistorys, 0);
}

- (void)setQueryDecorationOutput:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput)queryDecorationOutput
{
  return self->_queryDecorationOutput;
}

- (void)setProbingResult:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult)probingResult
{
  return self->_probingResult;
}

- (void)setTrpCandidateId:(id)a3
{
}

- (NSString)trpCandidateId
{
  return self->_trpCandidateId;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setConversationHistorys:(id)a3
{
}

- (NSMutableArray)conversationHistorys
{
  return self->_conversationHistorys;
}

- (void)setTurnContext:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)setCurrentUserQuery:(id)a3
{
}

- (NSString)currentUserQuery
{
  return self->_currentUserQuery;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setCurrentUserQuery:](self, "setCurrentUserQuery:");
  }
  turnContext = self->_turnContext;
  uint64_t v6 = *((void *)v4 + 7);
  if (turnContext)
  {
    if (v6) {
      -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext mergeFrom:](turnContext, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setTurnContext:](self, "setTurnContext:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest addConversationHistory:](self, "addConversationHistory:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 5)) {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setRequestId:](self, "setRequestId:");
  }
  if (*((void *)v4 + 6)) {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setTrpCandidateId:](self, "setTrpCandidateId:");
  }
  probingResult = self->_probingResult;
  uint64_t v13 = *((void *)v4 + 3);
  if (probingResult)
  {
    if (v13) {
      -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult mergeFrom:](probingResult, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setProbingResult:](self, "setProbingResult:");
  }
  queryDecorationOutput = self->_queryDecorationOutput;
  uint64_t v15 = *((void *)v4 + 4);
  if (queryDecorationOutput)
  {
    if (v15) {
      -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput mergeFrom:](queryDecorationOutput, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setQueryDecorationOutput:](self, "setQueryDecorationOutput:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_currentUserQuery hash];
  unint64_t v4 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self->_turnContext hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_conversationHistorys hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_requestId hash];
  NSUInteger v7 = [(NSString *)self->_trpCandidateId hash];
  unint64_t v8 = v7 ^ [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult *)self->_probingResult hash];
  return v6 ^ v8 ^ [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self->_queryDecorationOutput hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((currentUserQuery = self->_currentUserQuery, !((unint64_t)currentUserQuery | v4[2]))
     || -[NSString isEqual:](currentUserQuery, "isEqual:"))
    && ((turnContext = self->_turnContext, !((unint64_t)turnContext | v4[7]))
     || -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext isEqual:](turnContext, "isEqual:"))
    && ((conversationHistorys = self->_conversationHistorys, !((unint64_t)conversationHistorys | v4[1]))
     || -[NSMutableArray isEqual:](conversationHistorys, "isEqual:"))
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[5]))
     || -[NSString isEqual:](requestId, "isEqual:"))
    && ((trpCandidateId = self->_trpCandidateId, !((unint64_t)trpCandidateId | v4[6]))
     || -[NSString isEqual:](trpCandidateId, "isEqual:"))
    && ((probingResult = self->_probingResult, !((unint64_t)probingResult | v4[3]))
     || -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult isEqual:](probingResult, "isEqual:")))
  {
    queryDecorationOutput = self->_queryDecorationOutput;
    if ((unint64_t)queryDecorationOutput | v4[4]) {
      char v12 = -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput isEqual:](queryDecorationOutput, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_currentUserQuery copyWithZone:a3];
  NSUInteger v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)self->_turnContext copyWithZone:a3];
  uint64_t v9 = (void *)v5[7];
  v5[7] = v8;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = self->_conversationHistorys;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v14), "copyWithZone:", a3, (void)v25);
        [v5 addConversationHistory:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_requestId copyWithZone:a3];
  long long v17 = (void *)v5[5];
  v5[5] = v16;

  uint64_t v18 = [(NSString *)self->_trpCandidateId copyWithZone:a3];
  long long v19 = (void *)v5[6];
  v5[6] = v18;

  id v20 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult *)self->_probingResult copyWithZone:a3];
  uint64_t v21 = (void *)v5[3];
  v5[3] = v20;

  id v22 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self->_queryDecorationOutput copyWithZone:a3];
  v23 = (void *)v5[4];
  v5[4] = v22;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_currentUserQuery) {
    objc_msgSend(v9, "setCurrentUserQuery:");
  }
  if (self->_turnContext) {
    objc_msgSend(v9, "setTurnContext:");
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest *)self conversationHistorysCount])
  {
    [v9 clearConversationHistorys];
    unint64_t v4 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest *)self conversationHistorysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        NSUInteger v7 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest *)self conversationHistoryAtIndex:i];
        [v9 addConversationHistory:v7];
      }
    }
  }
  if (self->_requestId) {
    objc_msgSend(v9, "setRequestId:");
  }
  id v8 = v9;
  if (self->_trpCandidateId)
  {
    objc_msgSend(v9, "setTrpCandidateId:");
    id v8 = v9;
  }
  if (self->_probingResult)
  {
    objc_msgSend(v9, "setProbingResult:");
    id v8 = v9;
  }
  if (self->_queryDecorationOutput)
  {
    objc_msgSend(v9, "setQueryDecorationOutput:");
    id v8 = v9;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_currentUserQuery) {
    PBDataWriterWriteStringField();
  }
  if (self->_turnContext) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_conversationHistorys;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_requestId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trpCandidateId) {
    PBDataWriterWriteStringField();
  }
  if (self->_probingResult) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queryDecorationOutput) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  currentUserQuery = self->_currentUserQuery;
  if (currentUserQuery) {
    [v3 setObject:currentUserQuery forKey:@"current_user_query"];
  }
  turnContext = self->_turnContext;
  if (turnContext)
  {
    uint64_t v7 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *)turnContext dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"turn_context"];
  }
  if ([(NSMutableArray *)self->_conversationHistorys count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_conversationHistorys, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = self->_conversationHistorys;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"conversation_history"];
  }
  requestId = self->_requestId;
  if (requestId) {
    [v4 setObject:requestId forKey:@"request_id"];
  }
  trpCandidateId = self->_trpCandidateId;
  if (trpCandidateId) {
    [v4 setObject:trpCandidateId forKey:@"trp_candidate_id"];
  }
  probingResult = self->_probingResult;
  if (probingResult)
  {
    uint64_t v18 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult *)probingResult dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"probing_result"];
  }
  queryDecorationOutput = self->_queryDecorationOutput;
  if (queryDecorationOutput)
  {
    id v20 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)queryDecorationOutput dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"query_decoration_output"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasQueryDecorationOutput
{
  return self->_queryDecorationOutput != 0;
}

- (BOOL)hasProbingResult
{
  return self->_probingResult != 0;
}

- (BOOL)hasTrpCandidateId
{
  return self->_trpCandidateId != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (id)conversationHistoryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_conversationHistorys objectAtIndex:a3];
}

- (unint64_t)conversationHistorysCount
{
  return [(NSMutableArray *)self->_conversationHistorys count];
}

- (void)addConversationHistory:(id)a3
{
  id v4 = a3;
  conversationHistorys = self->_conversationHistorys;
  id v8 = v4;
  if (!conversationHistorys)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_conversationHistorys;
    self->_conversationHistorys = v6;

    id v4 = v8;
    conversationHistorys = self->_conversationHistorys;
  }
  [(NSMutableArray *)conversationHistorys addObject:v4];
}

- (void)clearConversationHistorys
{
}

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

- (BOOL)hasCurrentUserQuery
{
  return self->_currentUserQuery != 0;
}

+ (Class)conversationHistoryType
{
  return (Class)objc_opt_class();
}

@end