@interface SIRINLUEXTERNALDelegatedUserDialogAct
+ (Class)matchingSpansType;
- (BOOL)hasAsrHypothesisIndex;
- (BOOL)hasExternalParserId;
- (BOOL)hasReferenceContext;
- (BOOL)hasRewrite;
- (BOOL)hasRewrittenUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)matchingSpans;
- (NSString)externalParserId;
- (SIRICOMMONStringValue)rewrittenUtterance;
- (SIRINLUEXTERNALReferenceContext)referenceContext;
- (SIRINLUEXTERNALRewriteMessage)rewrite;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)matchingSpansAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matchingSpansCount;
- (unsigned)asrHypothesisIndex;
- (void)addMatchingSpans:(id)a3;
- (void)clearMatchingSpans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrHypothesisIndex:(unsigned int)a3;
- (void)setExternalParserId:(id)a3;
- (void)setHasAsrHypothesisIndex:(BOOL)a3;
- (void)setMatchingSpans:(id)a3;
- (void)setReferenceContext:(id)a3;
- (void)setRewrite:(id)a3;
- (void)setRewrittenUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALDelegatedUserDialogAct

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, 0);
  objc_storeStrong((id *)&self->_rewrite, 0);
  objc_storeStrong((id *)&self->_referenceContext, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_externalParserId, 0);
}

- (void)setReferenceContext:(id)a3
{
}

- (SIRINLUEXTERNALReferenceContext)referenceContext
{
  return self->_referenceContext;
}

- (void)setRewrite:(id)a3
{
}

- (SIRINLUEXTERNALRewriteMessage)rewrite
{
  return self->_rewrite;
}

- (void)setMatchingSpans:(id)a3
{
}

- (NSMutableArray)matchingSpans
{
  return self->_matchingSpans;
}

- (void)setExternalParserId:(id)a3
{
}

- (NSString)externalParserId
{
  return self->_externalParserId;
}

- (void)setRewrittenUtterance:(id)a3
{
}

- (SIRICOMMONStringValue)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if (v4[14])
  {
    self->_asrHypothesisIndex = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  rewrittenUtterance = self->_rewrittenUtterance;
  uint64_t v7 = *((void *)v5 + 6);
  if (rewrittenUtterance)
  {
    if (v7) {
      -[SIRICOMMONStringValue mergeFrom:](rewrittenUtterance, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SIRINLUEXTERNALDelegatedUserDialogAct setRewrittenUtterance:](self, "setRewrittenUtterance:");
  }
  if (*((void *)v5 + 2)) {
    -[SIRINLUEXTERNALDelegatedUserDialogAct setExternalParserId:](self, "setExternalParserId:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = *((id *)v5 + 3);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        -[SIRINLUEXTERNALDelegatedUserDialogAct addMatchingSpans:](self, "addMatchingSpans:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  rewrite = self->_rewrite;
  uint64_t v14 = *((void *)v5 + 5);
  if (rewrite)
  {
    if (v14) {
      -[SIRINLUEXTERNALRewriteMessage mergeFrom:](rewrite, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SIRINLUEXTERNALDelegatedUserDialogAct setRewrite:](self, "setRewrite:");
  }
  referenceContext = self->_referenceContext;
  uint64_t v16 = *((void *)v5 + 4);
  if (referenceContext)
  {
    if (v16) {
      -[SIRINLUEXTERNALReferenceContext mergeFrom:](referenceContext, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[SIRINLUEXTERNALDelegatedUserDialogAct setReferenceContext:](self, "setReferenceContext:");
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_asrHypothesisIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SIRICOMMONStringValue *)self->_rewrittenUtterance hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_externalParserId hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_matchingSpans hash];
  unint64_t v7 = [(SIRINLUEXTERNALRewriteMessage *)self->_rewrite hash];
  return v6 ^ v7 ^ [(SIRINLUEXTERNALReferenceContext *)self->_referenceContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_asrHypothesisIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  rewrittenUtterance = self->_rewrittenUtterance;
  if ((unint64_t)rewrittenUtterance | *((void *)v4 + 6)
    && !-[SIRICOMMONStringValue isEqual:](rewrittenUtterance, "isEqual:"))
  {
    goto LABEL_17;
  }
  externalParserId = self->_externalParserId;
  if ((unint64_t)externalParserId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](externalParserId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  matchingSpans = self->_matchingSpans;
  if ((unint64_t)matchingSpans | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](matchingSpans, "isEqual:")) {
      goto LABEL_17;
    }
  }
  rewrite = self->_rewrite;
  if ((unint64_t)rewrite | *((void *)v4 + 5))
  {
    if (!-[SIRINLUEXTERNALRewriteMessage isEqual:](rewrite, "isEqual:")) {
      goto LABEL_17;
    }
  }
  referenceContext = self->_referenceContext;
  if ((unint64_t)referenceContext | *((void *)v4 + 4)) {
    char v10 = -[SIRINLUEXTERNALReferenceContext isEqual:](referenceContext, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_asrHypothesisIndex;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v7 = [(SIRICOMMONStringValue *)self->_rewrittenUtterance copyWithZone:a3];
  id v8 = (void *)v6[6];
  v6[6] = v7;

  uint64_t v9 = [(NSString *)self->_externalParserId copyWithZone:a3];
  char v10 = (void *)v6[2];
  v6[2] = v9;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = self->_matchingSpans;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v15), "copyWithZone:", a3, (void)v22);
        [v6 addMatchingSpans:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  id v17 = [(SIRINLUEXTERNALRewriteMessage *)self->_rewrite copyWithZone:a3];
  long long v18 = (void *)v6[5];
  v6[5] = v17;

  id v19 = [(SIRINLUEXTERNALReferenceContext *)self->_referenceContext copyWithZone:a3];
  long long v20 = (void *)v6[4];
  v6[4] = v19;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_asrHypothesisIndex;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  id v10 = v4;
  if (self->_rewrittenUtterance) {
    objc_msgSend(v4, "setRewrittenUtterance:");
  }
  if (self->_externalParserId) {
    objc_msgSend(v10, "setExternalParserId:");
  }
  if ([(SIRINLUEXTERNALDelegatedUserDialogAct *)self matchingSpansCount])
  {
    [v10 clearMatchingSpans];
    unint64_t v5 = [(SIRINLUEXTERNALDelegatedUserDialogAct *)self matchingSpansCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = [(SIRINLUEXTERNALDelegatedUserDialogAct *)self matchingSpansAtIndex:i];
        [v10 addMatchingSpans:v8];
      }
    }
  }
  if (self->_rewrite) {
    objc_msgSend(v10, "setRewrite:");
  }
  uint64_t v9 = v10;
  if (self->_referenceContext)
  {
    objc_msgSend(v10, "setReferenceContext:");
    uint64_t v9 = v10;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_rewrittenUtterance) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_externalParserId) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_matchingSpans;
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

  if (self->_rewrite) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_referenceContext) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALDelegatedUserDialogActReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_asrHypothesisIndex];
    [v3 setObject:v4 forKey:@"asr_hypothesis_index"];
  }
  rewrittenUtterance = self->_rewrittenUtterance;
  if (rewrittenUtterance)
  {
    uint64_t v6 = [(SIRICOMMONStringValue *)rewrittenUtterance dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"rewritten_utterance"];
  }
  externalParserId = self->_externalParserId;
  if (externalParserId) {
    [v3 setObject:externalParserId forKey:@"external_parser_id"];
  }
  if ([(NSMutableArray *)self->_matchingSpans count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = self->_matchingSpans;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"matching_spans"];
  }
  rewrite = self->_rewrite;
  if (rewrite)
  {
    uint64_t v16 = [(SIRINLUEXTERNALRewriteMessage *)rewrite dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"rewrite"];
  }
  referenceContext = self->_referenceContext;
  if (referenceContext)
  {
    long long v18 = [(SIRINLUEXTERNALReferenceContext *)referenceContext dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"reference_context"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALDelegatedUserDialogAct;
  id v4 = [(SIRINLUEXTERNALDelegatedUserDialogAct *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALDelegatedUserDialogAct *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasReferenceContext
{
  return self->_referenceContext != 0;
}

- (BOOL)hasRewrite
{
  return self->_rewrite != 0;
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

- (BOOL)hasExternalParserId
{
  return self->_externalParserId != 0;
}

- (BOOL)hasRewrittenUtterance
{
  return self->_rewrittenUtterance != 0;
}

- (BOOL)hasAsrHypothesisIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAsrHypothesisIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_asrHypothesisIndex = a3;
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end