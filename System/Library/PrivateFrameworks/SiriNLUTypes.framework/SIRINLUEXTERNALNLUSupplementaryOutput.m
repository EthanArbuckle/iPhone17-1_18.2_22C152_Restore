@interface SIRINLUEXTERNALNLUSupplementaryOutput
+ (Class)matchingSpansType;
- (BOOL)hasCorrectionOutcome;
- (BOOL)hasRewrite;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)matchingSpans;
- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome;
- (SIRINLUEXTERNALRewriteMessage)rewrite;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)matchingSpansAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matchingSpansCount;
- (void)addMatchingSpans:(id)a3;
- (void)clearMatchingSpans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCorrectionOutcome:(id)a3;
- (void)setMatchingSpans:(id)a3;
- (void)setRewrite:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLUSupplementaryOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrite, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
}

- (void)setCorrectionOutcome:(id)a3
{
}

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
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

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SIRINLUEXTERNALNLUSupplementaryOutput addMatchingSpans:](self, "addMatchingSpans:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  rewrite = self->_rewrite;
  id v11 = v4[3];
  if (rewrite)
  {
    if (v11) {
      -[SIRINLUEXTERNALRewriteMessage mergeFrom:](rewrite, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[SIRINLUEXTERNALNLUSupplementaryOutput setRewrite:](self, "setRewrite:");
  }
  correctionOutcome = self->_correctionOutcome;
  id v13 = v4[1];
  if (correctionOutcome)
  {
    if (v13) {
      -[SIRINLUEXTERNALCorrectionOutcome mergeFrom:](correctionOutcome, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[SIRINLUEXTERNALNLUSupplementaryOutput setCorrectionOutcome:](self, "setCorrectionOutcome:");
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_matchingSpans hash];
  unint64_t v4 = [(SIRINLUEXTERNALRewriteMessage *)self->_rewrite hash] ^ v3;
  return v4 ^ [(SIRINLUEXTERNALCorrectionOutcome *)self->_correctionOutcome hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((matchingSpans = self->_matchingSpans, !((unint64_t)matchingSpans | v4[2]))
     || -[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
    && ((rewrite = self->_rewrite, !((unint64_t)rewrite | v4[3]))
     || -[SIRINLUEXTERNALRewriteMessage isEqual:](rewrite, "isEqual:")))
  {
    correctionOutcome = self->_correctionOutcome;
    if ((unint64_t)correctionOutcome | v4[1]) {
      char v8 = -[SIRINLUEXTERNALCorrectionOutcome isEqual:](correctionOutcome, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_matchingSpans;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (void)v17);
        [v5 addMatchingSpans:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v12 = [(SIRINLUEXTERNALRewriteMessage *)self->_rewrite copyWithZone:a3];
  id v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(SIRINLUEXTERNALCorrectionOutcome *)self->_correctionOutcome copyWithZone:a3];
  long long v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(SIRINLUEXTERNALNLUSupplementaryOutput *)self matchingSpansCount])
  {
    [v9 clearMatchingSpans];
    unint64_t v4 = [(SIRINLUEXTERNALNLUSupplementaryOutput *)self matchingSpansCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUEXTERNALNLUSupplementaryOutput *)self matchingSpansAtIndex:i];
        [v9 addMatchingSpans:v7];
      }
    }
  }
  if (self->_rewrite) {
    objc_msgSend(v9, "setRewrite:");
  }
  uint64_t v8 = v9;
  if (self->_correctionOutcome)
  {
    objc_msgSend(v9, "setCorrectionOutcome:");
    uint64_t v8 = v9;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
  if (self->_correctionOutcome) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLUSupplementaryOutputReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_matchingSpans count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v5 = self->_matchingSpans;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"matching_spans"];
  }
  rewrite = self->_rewrite;
  if (rewrite)
  {
    long long v12 = [(SIRINLUEXTERNALRewriteMessage *)rewrite dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"rewrite"];
  }
  correctionOutcome = self->_correctionOutcome;
  if (correctionOutcome)
  {
    id v14 = [(SIRINLUEXTERNALCorrectionOutcome *)correctionOutcome dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"correction_outcome"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLUSupplementaryOutput;
  id v4 = [(SIRINLUEXTERNALNLUSupplementaryOutput *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALNLUSupplementaryOutput *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCorrectionOutcome
{
  return self->_correctionOutcome != 0;
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

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end