@interface SIRINLUINTERNALRewriteUtterance
+ (Class)asrUtteranceTokensType;
+ (Class)nluInternalTokensType;
- (BOOL)hasAsrId;
- (BOOL)hasConfidence;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)asrUtteranceTokens;
- (NSMutableArray)nluInternalTokens;
- (NSString)utterance;
- (SIRINLUEXTERNALUUID)asrId;
- (double)confidence;
- (id)asrUtteranceTokensAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nluInternalTokensAtIndex:(unint64_t)a3;
- (unint64_t)asrUtteranceTokensCount;
- (unint64_t)hash;
- (unint64_t)nluInternalTokensCount;
- (void)addAsrUtteranceTokens:(id)a3;
- (void)addNluInternalTokens:(id)a3;
- (void)clearAsrUtteranceTokens;
- (void)clearNluInternalTokens;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrId:(id)a3;
- (void)setAsrUtteranceTokens:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setNluInternalTokens:(id)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALRewriteUtterance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_nluInternalTokens, 0);
  objc_storeStrong((id *)&self->_asrUtteranceTokens, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)setNluInternalTokens:(id)a3
{
}

- (NSMutableArray)nluInternalTokens
{
  return self->_nluInternalTokens;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setAsrUtteranceTokens:(id)a3
{
}

- (NSMutableArray)asrUtteranceTokens
{
  return self->_asrUtteranceTokens;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setAsrId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  asrId = self->_asrId;
  uint64_t v6 = *((void *)v4 + 2);
  if (asrId)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALRewriteUtterance setAsrId:](self, "setAsrId:");
  }
  if (*((void *)v4 + 5)) {
    -[SIRINLUINTERNALRewriteUtterance setUtterance:](self, "setUtterance:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 3);
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
        [(SIRINLUINTERNALRewriteUtterance *)self addAsrUtteranceTokens:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 48))
  {
    self->_confidence = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
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
        -[SIRINLUINTERNALRewriteUtterance addNluInternalTokens:](self, "addNluInternalTokens:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_asrId hash];
  NSUInteger v4 = [(NSString *)self->_utterance hash];
  uint64_t v5 = [(NSMutableArray *)self->_asrUtteranceTokens hash];
  if (*(unsigned char *)&self->_has)
  {
    double confidence = self->_confidence;
    double v8 = -confidence;
    if (confidence >= 0.0) {
      double v8 = self->_confidence;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_nluInternalTokens hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  asrId = self->_asrId;
  if ((unint64_t)asrId | *((void *)v4 + 2))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:")) {
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
  asrUtteranceTokens = self->_asrUtteranceTokens;
  if ((unint64_t)asrUtteranceTokens | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](asrUtteranceTokens, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_confidence != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  nluInternalTokens = self->_nluInternalTokens;
  if ((unint64_t)nluInternalTokens | *((void *)v4 + 4)) {
    char v9 = -[NSMutableArray isEqual:](nluInternalTokens, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALUUID *)self->_asrId copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_utterance copyWithZone:a3];
  char v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v10 = self->_asrUtteranceTokens;
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
        [(id)v5 addAsrUtteranceTokens:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_nluInternalTokens;
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
        [(id)v5 addNluInternalTokens:v21];

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
  id v12 = a3;
  if (self->_asrId) {
    objc_msgSend(v12, "setAsrId:");
  }
  if (self->_utterance) {
    objc_msgSend(v12, "setUtterance:");
  }
  if ([(SIRINLUINTERNALRewriteUtterance *)self asrUtteranceTokensCount])
  {
    [v12 clearAsrUtteranceTokens];
    unint64_t v4 = [(SIRINLUINTERNALRewriteUtterance *)self asrUtteranceTokensCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(SIRINLUINTERNALRewriteUtterance *)self asrUtteranceTokensAtIndex:i];
        [v12 addAsrUtteranceTokens:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v12 + 1) = *(void *)&self->_confidence;
    *((unsigned char *)v12 + 48) |= 1u;
  }
  if ([(SIRINLUINTERNALRewriteUtterance *)self nluInternalTokensCount])
  {
    [v12 clearNluInternalTokens];
    unint64_t v8 = [(SIRINLUINTERNALRewriteUtterance *)self nluInternalTokensCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUINTERNALRewriteUtterance *)self nluInternalTokensAtIndex:j];
        [v12 addNluInternalTokens:v11];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_asrId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_utterance) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_asrUtteranceTokens;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v10 = self->_nluInternalTokens;
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
  return SIRINLUINTERNALRewriteUtteranceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  asrId = self->_asrId;
  if (asrId)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUUID *)asrId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"asr_id"];
  }
  utterance = self->_utterance;
  if (utterance) {
    [v3 setObject:utterance forKey:@"utterance"];
  }
  if ([(NSMutableArray *)self->_asrUtteranceTokens count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_asrUtteranceTokens, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v8 = self->_asrUtteranceTokens;
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
          uint64_t v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"asr_utterance_tokens"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v14 = [NSNumber numberWithDouble:self->_confidence];
    [v3 setObject:v14 forKey:@"confidence"];
  }
  if ([(NSMutableArray *)self->_nluInternalTokens count])
  {
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_nluInternalTokens, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v16 = self->_nluInternalTokens;
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

    [v3 setObject:v15 forKey:@"nlu_internal_tokens"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALRewriteUtterance;
  id v4 = [(SIRINLUINTERNALRewriteUtterance *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALRewriteUtterance *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)nluInternalTokensAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nluInternalTokens objectAtIndex:a3];
}

- (unint64_t)nluInternalTokensCount
{
  return [(NSMutableArray *)self->_nluInternalTokens count];
}

- (void)addNluInternalTokens:(id)a3
{
  id v4 = a3;
  nluInternalTokens = self->_nluInternalTokens;
  id v8 = v4;
  if (!nluInternalTokens)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_nluInternalTokens;
    self->_nluInternalTokens = v6;

    id v4 = v8;
    nluInternalTokens = self->_nluInternalTokens;
  }
  [(NSMutableArray *)nluInternalTokens addObject:v4];
}

- (void)clearNluInternalTokens
{
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double confidence = a3;
}

- (id)asrUtteranceTokensAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_asrUtteranceTokens objectAtIndex:a3];
}

- (unint64_t)asrUtteranceTokensCount
{
  return [(NSMutableArray *)self->_asrUtteranceTokens count];
}

- (void)addAsrUtteranceTokens:(id)a3
{
  id v4 = a3;
  asrUtteranceTokens = self->_asrUtteranceTokens;
  id v8 = v4;
  if (!asrUtteranceTokens)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_asrUtteranceTokens;
    self->_asrUtteranceTokens = v6;

    id v4 = v8;
    asrUtteranceTokens = self->_asrUtteranceTokens;
  }
  [(NSMutableArray *)asrUtteranceTokens addObject:v4];
}

- (void)clearAsrUtteranceTokens
{
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

+ (Class)nluInternalTokensType
{
  return (Class)objc_opt_class();
}

+ (Class)asrUtteranceTokensType
{
  return (Class)objc_opt_class();
}

@end