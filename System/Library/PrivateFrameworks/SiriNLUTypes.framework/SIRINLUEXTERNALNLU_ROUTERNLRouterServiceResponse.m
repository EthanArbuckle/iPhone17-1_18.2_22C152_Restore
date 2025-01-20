@interface SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse
+ (Class)queryRewritesType;
+ (Class)siriXRewriteUtterancesType;
- (BOOL)hasGenAiMetadata;
- (BOOL)hasRoutingDecision;
- (BOOL)hasRoutingDecisionSource;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)queryRewrites;
- (NSMutableArray)siriXRewriteUtterances;
- (SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata)genAiMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)queryRewritesAtIndex:(unint64_t)a3;
- (id)routingDecisionAsString:(int)a3;
- (id)routingDecisionSourceAsString:(int)a3;
- (id)siriXRewriteUtterancesAtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (int)StringAsRoutingDecision:(id)a3;
- (int)StringAsRoutingDecisionSource:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)routingDecision;
- (int)routingDecisionSource;
- (int)status;
- (unint64_t)hash;
- (unint64_t)queryRewritesCount;
- (unint64_t)siriXRewriteUtterancesCount;
- (void)addQueryRewrites:(id)a3;
- (void)addSiriXRewriteUtterances:(id)a3;
- (void)clearQueryRewrites;
- (void)clearSiriXRewriteUtterances;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGenAiMetadata:(id)a3;
- (void)setHasRoutingDecision:(BOOL)a3;
- (void)setHasRoutingDecisionSource:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setQueryRewrites:(id)a3;
- (void)setRoutingDecision:(int)a3;
- (void)setRoutingDecisionSource:(int)a3;
- (void)setSiriXRewriteUtterances:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriXRewriteUtterances, 0);
  objc_storeStrong((id *)&self->_queryRewrites, 0);
  objc_storeStrong((id *)&self->_genAiMetadata, 0);
}

- (void)setGenAiMetadata:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata)genAiMetadata
{
  return self->_genAiMetadata;
}

- (void)setQueryRewrites:(id)a3
{
}

- (NSMutableArray)queryRewrites
{
  return self->_queryRewrites;
}

- (void)setSiriXRewriteUtterances:(id)a3
{
}

- (NSMutableArray)siriXRewriteUtterances
{
  return self->_siriXRewriteUtterances;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 44);
  if (v6)
  {
    self->_routingDecision = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((v6 & 4) != 0)
  {
    self->_status = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse *)self addSiriXRewriteUtterances:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = *((id *)v5 + 2);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse addQueryRewrites:](self, "addQueryRewrites:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  if ((*((unsigned char *)v5 + 44) & 2) != 0)
  {
    self->_routingDecisionSource = *((_DWORD *)v5 + 7);
    *(unsigned char *)&self->_has |= 2u;
  }
  genAiMetadata = self->_genAiMetadata;
  uint64_t v18 = *((void *)v5 + 1);
  if (genAiMetadata)
  {
    if (v18) {
      -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata mergeFrom:](genAiMetadata, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse setGenAiMetadata:](self, "setGenAiMetadata:");
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_routingDecision;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_status;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_siriXRewriteUtterances hash];
  uint64_t v6 = [(NSMutableArray *)self->_queryRewrites hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_routingDecisionSource;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *)self->_genAiMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_routingDecision != *((_DWORD *)v4 + 6)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_23:
    char v8 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_status != *((_DWORD *)v4 + 10)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_23;
  }
  siriXRewriteUtterances = self->_siriXRewriteUtterances;
  if ((unint64_t)siriXRewriteUtterances | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](siriXRewriteUtterances, "isEqual:"))
  {
    goto LABEL_23;
  }
  queryRewrites = self->_queryRewrites;
  if ((unint64_t)queryRewrites | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](queryRewrites, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_routingDecisionSource != *((_DWORD *)v4 + 7)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_23;
  }
  genAiMetadata = self->_genAiMetadata;
  if ((unint64_t)genAiMetadata | *((void *)v4 + 1)) {
    char v8 = -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata isEqual:](genAiMetadata, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_24:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_routingDecision;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_status;
    *(unsigned char *)(v5 + 44) |= 4u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  char v8 = self->_siriXRewriteUtterances;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addSiriXRewriteUtterances:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = self->_queryRewrites;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        [(id)v6 addQueryRewrites:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_routingDecisionSource;
    *(unsigned char *)(v6 + 44) |= 2u;
  }
  id v20 = -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata copyWithZone:](self->_genAiMetadata, "copyWithZone:", a3, (void)v23);
  long long v21 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v20;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[6] = self->_routingDecision;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[10] = self->_status;
    *((unsigned char *)v4 + 44) |= 4u;
  }
  id v15 = v4;
  if ([(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse *)self siriXRewriteUtterancesCount])
  {
    [v15 clearSiriXRewriteUtterances];
    unint64_t v6 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse *)self siriXRewriteUtterancesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse *)self siriXRewriteUtterancesAtIndex:i];
        [v15 addSiriXRewriteUtterances:v9];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse *)self queryRewritesCount])
  {
    [v15 clearQueryRewrites];
    unint64_t v10 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse *)self queryRewritesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse *)self queryRewritesAtIndex:j];
        [v15 addQueryRewrites:v13];
      }
    }
  }
  uint64_t v14 = v15;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v15 + 7) = self->_routingDecisionSource;
    *((unsigned char *)v15 + 44) |= 2u;
  }
  if (self->_genAiMetadata)
  {
    objc_msgSend(v15, "setGenAiMetadata:");
    uint64_t v14 = v15;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v6 = self->_siriXRewriteUtterances;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v11 = self->_queryRewrites;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_genAiMetadata) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t routingDecision = self->_routingDecision;
    if (routingDecision >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_routingDecision);
      unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v6 = off_1E6578B30[routingDecision];
    }
    [v3 setObject:v6 forKey:@"routing_decision"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t status = self->_status;
    if (status >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E6578B68[status];
    }
    [v3 setObject:v8 forKey:@"status"];
  }
  if ([(NSMutableArray *)self->_siriXRewriteUtterances count])
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_siriXRewriteUtterances, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    unint64_t v10 = self->_siriXRewriteUtterances;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v32 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"siri_x_rewrite_utterances"];
  }
  if ([(NSMutableArray *)self->_queryRewrites count])
  {
    long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_queryRewrites, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v17 = self->_queryRewrites;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = [*(id *)(*((void *)&v28 + 1) + 8 * j) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKey:@"query_rewrites"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t routingDecisionSource = self->_routingDecisionSource;
    if (routingDecisionSource >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_routingDecisionSource);
      long long v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v24 = off_1E6578B98[routingDecisionSource];
    }
    [v3 setObject:v24 forKey:@"routingDecisionSource"];
  }
  genAiMetadata = self->_genAiMetadata;
  if (genAiMetadata)
  {
    uint64_t v26 = [(SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *)genAiMetadata dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"gen_ai_metadata"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse *)&v8 description];
  uint64_t v5 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasGenAiMetadata
{
  return self->_genAiMetadata != 0;
}

- (int)StringAsRoutingDecisionSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NL_ROUTING_DECISION_SOURCE_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NL_ROUTING_DECISION_SOURCE_OVERRIDE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NL_ROUTING_DECISION_SOURCE_MODEL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NL_ROUTING_DECISION_SOURCE_HEURISTIC_RULE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)routingDecisionSourceAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578B98[a3];
  }
  return v3;
}

- (BOOL)hasRoutingDecisionSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasRoutingDecisionSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setRoutingDecisionSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t routingDecisionSource = a3;
}

- (int)routingDecisionSource
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_routingDecisionSource;
  }
  else {
    return 0;
  }
}

- (id)queryRewritesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_queryRewrites objectAtIndex:a3];
}

- (unint64_t)queryRewritesCount
{
  return [(NSMutableArray *)self->_queryRewrites count];
}

- (void)addQueryRewrites:(id)a3
{
  id v4 = a3;
  queryRewrites = self->_queryRewrites;
  id v8 = v4;
  if (!queryRewrites)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_queryRewrites;
    self->_queryRewrites = v6;

    id v4 = v8;
    queryRewrites = self->_queryRewrites;
  }
  [(NSMutableArray *)queryRewrites addObject:v4];
}

- (void)clearQueryRewrites
{
}

- (id)siriXRewriteUtterancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_siriXRewriteUtterances objectAtIndex:a3];
}

- (unint64_t)siriXRewriteUtterancesCount
{
  return [(NSMutableArray *)self->_siriXRewriteUtterances count];
}

- (void)addSiriXRewriteUtterances:(id)a3
{
  id v4 = a3;
  siriXRewriteUtterances = self->_siriXRewriteUtterances;
  id v8 = v4;
  if (!siriXRewriteUtterances)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_siriXRewriteUtterances;
    self->_siriXRewriteUtterances = v6;

    id v4 = v8;
    siriXRewriteUtterances = self->_siriXRewriteUtterances;
  }
  [(NSMutableArray *)siriXRewriteUtterances addObject:v4];
}

- (void)clearSiriXRewriteUtterances
{
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NL_ROUTER_SERVICE_RESPONSE_STATUS_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NL_ROUTER_SERVICE_RESPONSE_STATUS_SUCCEEDED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NL_ROUTER_SERVICE_RESPONSE_STATUS_CLIENT_NOT_INITIALIZED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NL_ROUTER_SERVICE_RESPONSE_STATUS_INPUT_INVALID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NL_ROUTER_SERVICE_RESPONSE_STATUS_NO_CLIENT_RESPONSE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NL_ROUTER_SERVICE_RESPONSE_STATUS_OVERRIDES_MATCHED"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578B68[a3];
  }
  return v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t status = a3;
}

- (int)status
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (int)StringAsRoutingDecision:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NL_ROUTING_DECISION_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NL_ROUTING_DECISION_SIRI_X_NO_REWRITE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NL_ROUTING_DECISION_SIRI_X_REWRITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NL_ROUTING_DECISION_PLANNER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NL_ROUTING_DECISION_QUERY_REWRITE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NL_ROUTING_DECISION_GEN_AI"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NL_ROUTING_DECISION_SEARCH"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)routingDecisionAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578B30[a3];
  }
  return v3;
}

- (BOOL)hasRoutingDecision
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRoutingDecision:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRoutingDecision:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t routingDecision = a3;
}

- (int)routingDecision
{
  if (*(unsigned char *)&self->_has) {
    return self->_routingDecision;
  }
  else {
    return 0;
  }
}

+ (Class)queryRewritesType
{
  return (Class)objc_opt_class();
}

+ (Class)siriXRewriteUtterancesType
{
  return (Class)objc_opt_class();
}

@end