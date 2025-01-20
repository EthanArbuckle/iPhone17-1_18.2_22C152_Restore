@interface SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance
- (BOOL)hasCorrectionOutcome;
- (BOOL)hasRewriteUtterance;
- (BOOL)hasRoutingDecision;
- (BOOL)hasUtteranceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)rewriteUtterance;
- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome;
- (SIRINLUEXTERNALUUID)utteranceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)routingDecisionAsString:(int)a3;
- (int)StringAsRoutingDecision:(id)a3;
- (int)routingDecision;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCorrectionOutcome:(id)a3;
- (void)setHasRoutingDecision:(BOOL)a3;
- (void)setRewriteUtterance:(id)a3;
- (void)setRoutingDecision:(int)a3;
- (void)setUtteranceId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceId, 0);
  objc_storeStrong((id *)&self->_rewriteUtterance, 0);
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
}

- (void)setCorrectionOutcome:(id)a3
{
}

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
}

- (void)setRewriteUtterance:(id)a3
{
}

- (NSString)rewriteUtterance
{
  return self->_rewriteUtterance;
}

- (void)setUtteranceId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)utteranceId
{
  return self->_utteranceId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  utteranceId = self->_utteranceId;
  uint64_t v6 = *((void *)v4 + 4);
  id v9 = v4;
  if (utteranceId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALUUID mergeFrom:](utteranceId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance setUtteranceId:](self, "setUtteranceId:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 2))
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance setRewriteUtterance:](self, "setRewriteUtterance:");
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_routingDecision = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  correctionOutcome = self->_correctionOutcome;
  uint64_t v8 = *((void *)v4 + 1);
  if (correctionOutcome)
  {
    if (v8) {
      -[SIRINLUEXTERNALCorrectionOutcome mergeFrom:](correctionOutcome, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance setCorrectionOutcome:](self, "setCorrectionOutcome:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_utteranceId hash];
  NSUInteger v4 = [(NSString *)self->_rewriteUtterance hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_routingDecision;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(SIRINLUEXTERNALCorrectionOutcome *)self->_correctionOutcome hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  utteranceId = self->_utteranceId;
  if ((unint64_t)utteranceId | *((void *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](utteranceId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  rewriteUtterance = self->_rewriteUtterance;
  if ((unint64_t)rewriteUtterance | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](rewriteUtterance, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_routingDecision != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  correctionOutcome = self->_correctionOutcome;
  if ((unint64_t)correctionOutcome | *((void *)v4 + 1)) {
    char v8 = -[SIRINLUEXTERNALCorrectionOutcome isEqual:](correctionOutcome, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_utteranceId copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_rewriteUtterance copyWithZone:a3];
  id v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_routingDecision;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v10 = [(SIRINLUEXTERNALCorrectionOutcome *)self->_correctionOutcome copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_utteranceId)
  {
    objc_msgSend(v4, "setUtteranceId:");
    id v4 = v5;
  }
  if (self->_rewriteUtterance)
  {
    objc_msgSend(v5, "setRewriteUtterance:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_routingDecision;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_correctionOutcome)
  {
    objc_msgSend(v5, "setCorrectionOutcome:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_utteranceId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rewriteUtterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_correctionOutcome)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtteranceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  utteranceId = self->_utteranceId;
  if (utteranceId)
  {
    id v5 = [(SIRINLUEXTERNALUUID *)utteranceId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"utterance_id"];
  }
  rewriteUtterance = self->_rewriteUtterance;
  if (rewriteUtterance) {
    [v3 setObject:rewriteUtterance forKey:@"rewrite_utterance"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t routingDecision = self->_routingDecision;
    if (routingDecision >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_routingDecision);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E6578EB8[routingDecision];
    }
    [v3 setObject:v8 forKey:@"routing_decision"];
  }
  correctionOutcome = self->_correctionOutcome;
  if (correctionOutcome)
  {
    id v10 = [(SIRINLUEXTERNALCorrectionOutcome *)correctionOutcome dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"correction_outcome"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance *)&v8 description];
  id v5 = [(SIRINLUEXTERNALNLU_ROUTERNLRouterRewriteUtterance *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCorrectionOutcome
{
  return self->_correctionOutcome != 0;
}

- (int)StringAsRoutingDecision:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NL_ROUTER_ROUTING_DECISION_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NL_ROUTER_ROUTING_DECISION_SIRI_X"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NL_ROUTER_ROUTING_DECISION_PLANNER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NL_ROUTER_ROUTING_DECISION_GEN_AI"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NL_ROUTER_ROUTING_DECISION_SEARCH"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)routingDecisionAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578EB8[a3];
  }
  return v3;
}

- (BOOL)hasRoutingDecision
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRoutingDecision:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
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

- (BOOL)hasRewriteUtterance
{
  return self->_rewriteUtterance != 0;
}

- (BOOL)hasUtteranceId
{
  return self->_utteranceId != 0;
}

@end