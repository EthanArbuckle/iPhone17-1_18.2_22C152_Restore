@interface SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest
+ (Class)contextualSpansType;
+ (Class)detectedMentionsType;
+ (Class)entityCandidatesType;
+ (Class)matchingSpansType;
- (BOOL)hasCdmRequestId;
- (BOOL)hasEmbeddingTensor;
- (BOOL)hasMaxCandidates;
- (BOOL)hasNluRequestId;
- (BOOL)hasRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)hasTokenChain;
- (BOOL)hasTurnIndex;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contextualSpans;
- (NSMutableArray)detectedMentions;
- (NSMutableArray)entityCandidates;
- (NSMutableArray)matchingSpans;
- (NSString)resultCandidateId;
- (NSString)utterance;
- (SIRINLUEXTERNALRequestID)cdmRequestId;
- (SIRINLUEXTERNALUUID)nluRequestId;
- (SIRINLUEXTERNALUUID)requestId;
- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor;
- (SIRINLUINTERNALTokenChain)tokenChain;
- (id)contextualSpansAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)detectedMentionsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)entityCandidatesAtIndex:(unint64_t)a3;
- (id)matchingSpansAtIndex:(unint64_t)a3;
- (unint64_t)contextualSpansCount;
- (unint64_t)detectedMentionsCount;
- (unint64_t)entityCandidatesCount;
- (unint64_t)hash;
- (unint64_t)matchingSpansCount;
- (unint64_t)maxCandidates;
- (unint64_t)turnIndex;
- (void)addContextualSpans:(id)a3;
- (void)addDetectedMentions:(id)a3;
- (void)addEntityCandidates:(id)a3;
- (void)addMatchingSpans:(id)a3;
- (void)clearContextualSpans;
- (void)clearDetectedMentions;
- (void)clearEntityCandidates;
- (void)clearMatchingSpans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdmRequestId:(id)a3;
- (void)setContextualSpans:(id)a3;
- (void)setDetectedMentions:(id)a3;
- (void)setEmbeddingTensor:(id)a3;
- (void)setEntityCandidates:(id)a3;
- (void)setHasMaxCandidates:(BOOL)a3;
- (void)setHasTurnIndex:(BOOL)a3;
- (void)setMatchingSpans:(id)a3;
- (void)setMaxCandidates:(unint64_t)a3;
- (void)setNluRequestId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)setTurnIndex:(unint64_t)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_entityCandidates, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
  objc_storeStrong((id *)&self->_detectedMentions, 0);
  objc_storeStrong((id *)&self->_contextualSpans, 0);
  objc_storeStrong((id *)&self->_cdmRequestId, 0);
}

- (void)setContextualSpans:(id)a3
{
}

- (NSMutableArray)contextualSpans
{
  return self->_contextualSpans;
}

- (void)setCdmRequestId:(id)a3
{
}

- (SIRINLUEXTERNALRequestID)cdmRequestId
{
  return self->_cdmRequestId;
}

- (unint64_t)turnIndex
{
  return self->_turnIndex;
}

- (void)setMatchingSpans:(id)a3
{
}

- (NSMutableArray)matchingSpans
{
  return self->_matchingSpans;
}

- (unint64_t)maxCandidates
{
  return self->_maxCandidates;
}

- (void)setDetectedMentions:(id)a3
{
}

- (NSMutableArray)detectedMentions
{
  return self->_detectedMentions;
}

- (void)setEntityCandidates:(id)a3
{
}

- (NSMutableArray)entityCandidates
{
  return self->_entityCandidates;
}

- (void)setEmbeddingTensor:(id)a3
{
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (void)setTokenChain:(id)a3
{
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setNluRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)requestId
{
  return self->_requestId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestId = self->_requestId;
  uint64_t v6 = *((void *)v4 + 10);
  if (requestId)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setRequestId:](self, "setRequestId:");
  }
  nluRequestId = self->_nluRequestId;
  uint64_t v8 = *((void *)v4 + 9);
  if (nluRequestId)
  {
    if (v8) {
      -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setNluRequestId:](self, "setNluRequestId:");
  }
  if (*((void *)v4 + 11)) {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setResultCandidateId:](self, "setResultCandidateId:");
  }
  if (*((void *)v4 + 13)) {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setUtterance:](self, "setUtterance:");
  }
  tokenChain = self->_tokenChain;
  uint64_t v10 = *((void *)v4 + 12);
  if (tokenChain)
  {
    if (v10) {
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setTokenChain:](self, "setTokenChain:");
  }
  embeddingTensor = self->_embeddingTensor;
  uint64_t v12 = *((void *)v4 + 6);
  if (embeddingTensor)
  {
    if (v12) {
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddingTensor, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setEmbeddingTensor:](self, "setEmbeddingTensor:");
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v13 = *((id *)v4 + 7);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v13);
        }
        [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self addEntityCandidates:*(void *)(*((void *)&v47 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v15);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v18 = *((id *)v4 + 5);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self addDetectedMentions:*(void *)(*((void *)&v43 + 1) + 8 * j)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v20);
  }

  if (*((unsigned char *)v4 + 112))
  {
    self->_maxCandidates = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v23 = *((id *)v4 + 8);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self addMatchingSpans:*(void *)(*((void *)&v39 + 1) + 8 * k)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v25);
  }

  if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
    self->_turnIndex = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  cdmRequestId = self->_cdmRequestId;
  uint64_t v29 = *((void *)v4 + 3);
  if (cdmRequestId)
  {
    if (v29) {
      -[SIRINLUEXTERNALRequestID mergeFrom:](cdmRequestId, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setCdmRequestId:](self, "setCdmRequestId:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v30 = *((id *)v4 + 4);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest addContextualSpans:](self, "addContextualSpans:", *(void *)(*((void *)&v35 + 1) + 8 * m), (void)v35);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v32);
  }
}

- (unint64_t)hash
{
  unint64_t v16 = [(SIRINLUEXTERNALUUID *)self->_requestId hash];
  unint64_t v15 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId hash];
  NSUInteger v3 = [(NSString *)self->_resultCandidateId hash];
  NSUInteger v4 = [(NSString *)self->_utterance hash];
  unint64_t v5 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash];
  unint64_t v6 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddingTensor hash];
  uint64_t v7 = [(NSMutableArray *)self->_entityCandidates hash];
  uint64_t v8 = [(NSMutableArray *)self->_detectedMentions hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v9 = 2654435761u * self->_maxCandidates;
  }
  else {
    unint64_t v9 = 0;
  }
  uint64_t v10 = [(NSMutableArray *)self->_matchingSpans hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v11 = 2654435761u * self->_turnIndex;
  }
  else {
    unint64_t v11 = 0;
  }
  unint64_t v12 = v15 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  unint64_t v13 = [(SIRINLUEXTERNALRequestID *)self->_cdmRequestId hash];
  return v12 ^ v13 ^ [(NSMutableArray *)self->_contextualSpans hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 10))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  nluRequestId = self->_nluRequestId;
  if ((unint64_t)nluRequestId | *((void *)v4 + 9))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  resultCandidateId = self->_resultCandidateId;
  if ((unint64_t)resultCandidateId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](resultCandidateId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  utterance = self->_utterance;
  if ((unint64_t)utterance | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](utterance, "isEqual:")) {
      goto LABEL_35;
    }
  }
  tokenChain = self->_tokenChain;
  if ((unint64_t)tokenChain | *((void *)v4 + 12))
  {
    if (!-[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:")) {
      goto LABEL_35;
    }
  }
  embeddingTensor = self->_embeddingTensor;
  if ((unint64_t)embeddingTensor | *((void *)v4 + 6))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddingTensor, "isEqual:")) {
      goto LABEL_35;
    }
  }
  entityCandidates = self->_entityCandidates;
  if ((unint64_t)entityCandidates | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](entityCandidates, "isEqual:")) {
      goto LABEL_35;
    }
  }
  detectedMentions = self->_detectedMentions;
  if ((unint64_t)detectedMentions | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](detectedMentions, "isEqual:")) {
      goto LABEL_35;
    }
  }
  char has = (char)self->_has;
  char v14 = *((unsigned char *)v4 + 112);
  if (has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_maxCandidates != *((void *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
    goto LABEL_35;
  }
  matchingSpans = self->_matchingSpans;
  if ((unint64_t)matchingSpans | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
    {
LABEL_35:
      char v18 = 0;
      goto LABEL_36;
    }
    char has = (char)self->_has;
    char v14 = *((unsigned char *)v4 + 112);
  }
  if ((has & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_turnIndex != *((void *)v4 + 2)) {
      goto LABEL_35;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_35;
  }
  cdmRequestId = self->_cdmRequestId;
  if ((unint64_t)cdmRequestId | *((void *)v4 + 3)
    && !-[SIRINLUEXTERNALRequestID isEqual:](cdmRequestId, "isEqual:"))
  {
    goto LABEL_35;
  }
  contextualSpans = self->_contextualSpans;
  if ((unint64_t)contextualSpans | *((void *)v4 + 4)) {
    char v18 = -[NSMutableArray isEqual:](contextualSpans, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_36:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_requestId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  id v8 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v8;

  uint64_t v10 = [(NSString *)self->_resultCandidateId copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v10;

  uint64_t v12 = [(NSString *)self->_utterance copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v12;

  id v14 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  unint64_t v15 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v14;

  id v16 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddingTensor copyWithZone:a3];
  v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  char v18 = self->_entityCandidates;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v58;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * v22) copyWithZone:a3];
        [(id)v5 addEntityCandidates:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v20);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v24 = self->_detectedMentions;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v54;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v54 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * v28) copyWithZone:a3];
        [(id)v5 addDetectedMentions:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v26);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_maxCandidates;
    *(unsigned char *)(v5 + 112) |= 1u;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v30 = self->_matchingSpans;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v50;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v50 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v35 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * v34) copyWithZone:a3];
        [(id)v5 addMatchingSpans:v35];

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v32);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_turnIndex;
    *(unsigned char *)(v5 + 112) |= 2u;
  }
  id v36 = [(SIRINLUEXTERNALRequestID *)self->_cdmRequestId copyWithZone:a3];
  long long v37 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v36;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v38 = self->_contextualSpans;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v46;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v46 != v41) {
          objc_enumerationMutation(v38);
        }
        long long v43 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * v42), "copyWithZone:", a3, (void)v45);
        [(id)v5 addContextualSpans:v43];

        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v45 objects:v61 count:16];
    }
    while (v40);
  }

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if (self->_requestId) {
    objc_msgSend(v20, "setRequestId:");
  }
  if (self->_nluRequestId) {
    objc_msgSend(v20, "setNluRequestId:");
  }
  if (self->_resultCandidateId) {
    objc_msgSend(v20, "setResultCandidateId:");
  }
  if (self->_utterance) {
    objc_msgSend(v20, "setUtterance:");
  }
  if (self->_tokenChain) {
    objc_msgSend(v20, "setTokenChain:");
  }
  if (self->_embeddingTensor) {
    objc_msgSend(v20, "setEmbeddingTensor:");
  }
  if ([(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self entityCandidatesCount])
  {
    [v20 clearEntityCandidates];
    unint64_t v4 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self entityCandidatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self entityCandidatesAtIndex:i];
        [v20 addEntityCandidates:v7];
      }
    }
  }
  if ([(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self detectedMentionsCount])
  {
    [v20 clearDetectedMentions];
    unint64_t v8 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self detectedMentionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        unint64_t v11 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self detectedMentionsAtIndex:j];
        [v20 addDetectedMentions:v11];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v20 + 1) = self->_maxCandidates;
    *((unsigned char *)v20 + 112) |= 1u;
  }
  if ([(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self matchingSpansCount])
  {
    [v20 clearMatchingSpans];
    unint64_t v12 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self matchingSpansCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        unint64_t v15 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self matchingSpansAtIndex:k];
        [v20 addMatchingSpans:v15];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v20 + 2) = self->_turnIndex;
    *((unsigned char *)v20 + 112) |= 2u;
  }
  if (self->_cdmRequestId) {
    objc_msgSend(v20, "setCdmRequestId:");
  }
  if ([(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self contextualSpansCount])
  {
    [v20 clearContextualSpans];
    unint64_t v16 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self contextualSpansCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self contextualSpansAtIndex:m];
        [v20 addContextualSpans:v19];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_requestId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nluRequestId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_resultCandidateId) {
    PBDataWriterWriteStringField();
  }
  if (self->_utterance) {
    PBDataWriterWriteStringField();
  }
  if (self->_tokenChain) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_embeddingTensor) {
    PBDataWriterWriteSubmessage();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v5 = self->_entityCandidates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_detectedMentions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v15 = self->_matchingSpans;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_cdmRequestId) {
    PBDataWriterWriteSubmessage();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = self->_contextualSpans;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUUID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_id"];
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    uint64_t v7 = [(SIRINLUEXTERNALUUID *)nluRequestId dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"nlu_request_id"];
  }
  resultCandidateId = self->_resultCandidateId;
  if (resultCandidateId) {
    [v3 setObject:resultCandidateId forKey:@"result_candidate_id"];
  }
  utterance = self->_utterance;
  if (utterance) {
    [v3 setObject:utterance forKey:@"utterance"];
  }
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    uint64_t v11 = [(SIRINLUINTERNALTokenChain *)tokenChain dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"token_chain"];
  }
  embeddingTensor = self->_embeddingTensor;
  if (embeddingTensor)
  {
    uint64_t v13 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)embeddingTensor dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"embedding_tensor"];
  }
  if ([(NSMutableArray *)self->_entityCandidates count])
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_entityCandidates, "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    unint64_t v15 = self->_entityCandidates;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v60 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [*(id *)(*((void *)&v59 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v59 objects:v66 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"entity_candidates"];
  }
  if ([(NSMutableArray *)self->_detectedMentions count])
  {
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_detectedMentions, "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v22 = self->_detectedMentions;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v56 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = [*(id *)(*((void *)&v55 + 1) + 8 * j) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKey:@"detected_mentions"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v28 = [NSNumber numberWithUnsignedLongLong:self->_maxCandidates];
    [v3 setObject:v28 forKey:@"max_candidates"];
  }
  if ([(NSMutableArray *)self->_matchingSpans count])
  {
    long long v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v30 = self->_matchingSpans;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v52;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v52 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = [*(id *)(*((void *)&v51 + 1) + 8 * k) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v51 objects:v64 count:16];
      }
      while (v32);
    }

    [v3 setObject:v29 forKey:@"matching_spans"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    long long v36 = [NSNumber numberWithUnsignedLongLong:self->_turnIndex];
    [v3 setObject:v36 forKey:@"turn_index"];
  }
  cdmRequestId = self->_cdmRequestId;
  if (cdmRequestId)
  {
    long long v38 = [(SIRINLUEXTERNALRequestID *)cdmRequestId dictionaryRepresentation];
    [v3 setObject:v38 forKey:@"cdm_request_id"];
  }
  if ([(NSMutableArray *)self->_contextualSpans count])
  {
    long long v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_contextualSpans, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v40 = self->_contextualSpans;
    uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v48;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v48 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * m), "dictionaryRepresentation", (void)v47);
          [v39 addObject:v45];
        }
        uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v47 objects:v63 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKey:@"contextual_spans"];
  }
  return v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest;
  id v4 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)contextualSpansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contextualSpans objectAtIndex:a3];
}

- (unint64_t)contextualSpansCount
{
  return [(NSMutableArray *)self->_contextualSpans count];
}

- (void)addContextualSpans:(id)a3
{
  id v4 = a3;
  contextualSpans = self->_contextualSpans;
  id v8 = v4;
  if (!contextualSpans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_contextualSpans;
    self->_contextualSpans = v6;

    id v4 = v8;
    contextualSpans = self->_contextualSpans;
  }
  [(NSMutableArray *)contextualSpans addObject:v4];
}

- (void)clearContextualSpans
{
}

- (BOOL)hasCdmRequestId
{
  return self->_cdmRequestId != 0;
}

- (BOOL)hasTurnIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTurnIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTurnIndex:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_turnIndex = a3;
}

- (id)matchingSpansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_matchingSpans objectAtIndex:a3];
}

- (unint64_t)matchingSpansCount
{
  return [(NSMutableArray *)self->_matchingSpans count];
}

- (void)addMatchingSpans:(id)a3
{
  id v4 = a3;
  matchingSpans = self->_matchingSpans;
  id v8 = v4;
  if (!matchingSpans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_matchingSpans;
    self->_matchingSpans = v6;

    id v4 = v8;
    matchingSpans = self->_matchingSpans;
  }
  [(NSMutableArray *)matchingSpans addObject:v4];
}

- (void)clearMatchingSpans
{
}

- (BOOL)hasMaxCandidates
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMaxCandidates:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMaxCandidates:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxCandidates = a3;
}

- (id)detectedMentionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_detectedMentions objectAtIndex:a3];
}

- (unint64_t)detectedMentionsCount
{
  return [(NSMutableArray *)self->_detectedMentions count];
}

- (void)addDetectedMentions:(id)a3
{
  id v4 = a3;
  detectedMentions = self->_detectedMentions;
  id v8 = v4;
  if (!detectedMentions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_detectedMentions;
    self->_detectedMentions = v6;

    id v4 = v8;
    detectedMentions = self->_detectedMentions;
  }
  [(NSMutableArray *)detectedMentions addObject:v4];
}

- (void)clearDetectedMentions
{
}

- (id)entityCandidatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_entityCandidates objectAtIndex:a3];
}

- (unint64_t)entityCandidatesCount
{
  return [(NSMutableArray *)self->_entityCandidates count];
}

- (void)addEntityCandidates:(id)a3
{
  id v4 = a3;
  entityCandidates = self->_entityCandidates;
  id v8 = v4;
  if (!entityCandidates)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_entityCandidates;
    self->_entityCandidates = v6;

    id v4 = v8;
    entityCandidates = self->_entityCandidates;
  }
  [(NSMutableArray *)entityCandidates addObject:v4];
}

- (void)clearEntityCandidates
{
}

- (BOOL)hasEmbeddingTensor
{
  return self->_embeddingTensor != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

+ (Class)contextualSpansType
{
  return (Class)objc_opt_class();
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

+ (Class)detectedMentionsType
{
  return (Class)objc_opt_class();
}

+ (Class)entityCandidatesType
{
  return (Class)objc_opt_class();
}

@end