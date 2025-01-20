@interface SIRINLUEXTERNALAsrHypothesis
+ (Class)asrTokensType;
+ (Class)rewrittenUtterancesType;
- (BOOL)hasIdA;
- (BOOL)hasProbability;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)asrTokens;
- (NSMutableArray)rewrittenUtterances;
- (NSString)utterance;
- (SIRINLUEXTERNALUUID)idA;
- (double)probability;
- (id)asrTokensAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rewrittenUtterancesAtIndex:(unint64_t)a3;
- (unint64_t)asrTokensCount;
- (unint64_t)hash;
- (unint64_t)rewrittenUtterancesCount;
- (void)addAsrTokens:(id)a3;
- (void)addRewrittenUtterances:(id)a3;
- (void)clearAsrTokens;
- (void)clearRewrittenUtterances;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrTokens:(id)a3;
- (void)setHasProbability:(BOOL)a3;
- (void)setIdA:(id)a3;
- (void)setProbability:(double)a3;
- (void)setRewrittenUtterances:(id)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALAsrHypothesis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_rewrittenUtterances, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_asrTokens, 0);
}

- (void)setRewrittenUtterances:(id)a3
{
}

- (NSMutableArray)rewrittenUtterances
{
  return self->_rewrittenUtterances;
}

- (void)setAsrTokens:(id)a3
{
}

- (NSMutableArray)asrTokens
{
  return self->_asrTokens;
}

- (double)probability
{
  return self->_probability;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setIdA:(id)a3
{
}

- (SIRINLUEXTERNALUUID)idA
{
  return self->_idA;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  idA = self->_idA;
  uint64_t v6 = *((void *)v4 + 3);
  if (idA)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](idA, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALAsrHypothesis setIdA:](self, "setIdA:");
  }
  if (*((void *)v4 + 5)) {
    -[SIRINLUEXTERNALAsrHypothesis setUtterance:](self, "setUtterance:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_probability = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUEXTERNALAsrHypothesis *)self addAsrTokens:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SIRINLUEXTERNALAsrHypothesis addRewrittenUtterances:](self, "addRewrittenUtterances:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_idA hash];
  NSUInteger v4 = [(NSString *)self->_utterance hash];
  if (*(unsigned char *)&self->_has)
  {
    double probability = self->_probability;
    double v7 = -probability;
    if (probability >= 0.0) {
      double v7 = self->_probability;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  uint64_t v10 = v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_asrTokens hash];
  return v10 ^ [(NSMutableArray *)self->_rewrittenUtterances hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  idA = self->_idA;
  if ((unint64_t)idA | *((void *)v4 + 3))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](idA, "isEqual:")) {
      goto LABEL_15;
    }
  }
  utterance = self->_utterance;
  if ((unint64_t)utterance | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](utterance, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_probability != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  asrTokens = self->_asrTokens;
  if ((unint64_t)asrTokens | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](asrTokens, "isEqual:"))
  {
    goto LABEL_15;
  }
  rewrittenUtterances = self->_rewrittenUtterances;
  if ((unint64_t)rewrittenUtterances | *((void *)v4 + 4)) {
    char v9 = -[NSMutableArray isEqual:](rewrittenUtterances, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_idA copyWithZone:a3];
  double v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_utterance copyWithZone:a3];
  char v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_probability;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = self->_asrTokens;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v14) copyWithZone:a3];
        [(id)v5 addAsrTokens:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_rewrittenUtterances;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (void)v23);
        [(id)v5 addRewrittenUtterances:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_idA)
  {
    objc_msgSend(v4, "setIdA:");
    id v4 = v13;
  }
  if (self->_utterance)
  {
    objc_msgSend(v13, "setUtterance:");
    id v4 = v13;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_probability;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if ([(SIRINLUEXTERNALAsrHypothesis *)self asrTokensCount])
  {
    [v13 clearAsrTokens];
    unint64_t v5 = [(SIRINLUEXTERNALAsrHypothesis *)self asrTokensCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(SIRINLUEXTERNALAsrHypothesis *)self asrTokensAtIndex:i];
        [v13 addAsrTokens:v8];
      }
    }
  }
  if ([(SIRINLUEXTERNALAsrHypothesis *)self rewrittenUtterancesCount])
  {
    [v13 clearRewrittenUtterances];
    unint64_t v9 = [(SIRINLUEXTERNALAsrHypothesis *)self rewrittenUtterancesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(SIRINLUEXTERNALAsrHypothesis *)self rewrittenUtterancesAtIndex:j];
        [v13 addRewrittenUtterances:v12];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_idA) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_utterance) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_asrTokens;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v10 = self->_rewrittenUtterances;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALAsrHypothesisReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  idA = self->_idA;
  if (idA)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUUID *)idA dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"id_a"];
  }
  utterance = self->_utterance;
  if (utterance) {
    [v3 setObject:utterance forKey:@"utterance"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = [NSNumber numberWithDouble:self->_probability];
    [v3 setObject:v7 forKey:@"probability"];
  }
  if ([(NSMutableArray *)self->_asrTokens count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_asrTokens, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v9 = self->_asrTokens;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"asr_tokens"];
  }
  if ([(NSMutableArray *)self->_rewrittenUtterances count])
  {
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_rewrittenUtterances, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v16 = self->_rewrittenUtterances;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (void)v23);
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"rewritten_utterances"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALAsrHypothesis;
  id v4 = [(SIRINLUEXTERNALAsrHypothesis *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALAsrHypothesis *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)rewrittenUtterancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rewrittenUtterances objectAtIndex:a3];
}

- (unint64_t)rewrittenUtterancesCount
{
  return [(NSMutableArray *)self->_rewrittenUtterances count];
}

- (void)addRewrittenUtterances:(id)a3
{
  id v4 = a3;
  rewrittenUtterances = self->_rewrittenUtterances;
  id v8 = v4;
  if (!rewrittenUtterances)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_rewrittenUtterances;
    self->_rewrittenUtterances = v6;

    id v4 = v8;
    rewrittenUtterances = self->_rewrittenUtterances;
  }
  [(NSMutableArray *)rewrittenUtterances addObject:v4];
}

- (void)clearRewrittenUtterances
{
}

- (id)asrTokensAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_asrTokens objectAtIndex:a3];
}

- (unint64_t)asrTokensCount
{
  return [(NSMutableArray *)self->_asrTokens count];
}

- (void)addAsrTokens:(id)a3
{
  id v4 = a3;
  asrTokens = self->_asrTokens;
  id v8 = v4;
  if (!asrTokens)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_asrTokens;
    self->_asrTokens = v6;

    id v4 = v8;
    asrTokens = self->_asrTokens;
  }
  [(NSMutableArray *)asrTokens addObject:v4];
}

- (void)clearAsrTokens
{
}

- (BOOL)hasProbability
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasProbability:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setProbability:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double probability = a3;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

+ (Class)rewrittenUtterancesType
{
  return (Class)objc_opt_class();
}

+ (Class)asrTokensType
{
  return (Class)objc_opt_class();
}

@end