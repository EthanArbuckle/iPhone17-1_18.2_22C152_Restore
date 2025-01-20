@interface SIRINLUEXTERNALUtteranceAlignment
+ (Class)spansType;
- (BOOL)hasAsrHypothesisIndex;
- (BOOL)hasNodeIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)spans;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)spansAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)spansCount;
- (unsigned)asrHypothesisIndex;
- (unsigned)nodeIndex;
- (void)addSpans:(id)a3;
- (void)clearSpans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrHypothesisIndex:(unsigned int)a3;
- (void)setHasAsrHypothesisIndex:(BOOL)a3;
- (void)setHasNodeIndex:(BOOL)a3;
- (void)setNodeIndex:(unsigned int)a3;
- (void)setSpans:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUtteranceAlignment

- (void).cxx_destruct
{
}

- (unsigned)nodeIndex
{
  return self->_nodeIndex;
}

- (void)setSpans:(id)a3
{
}

- (NSMutableArray)spans
{
  return self->_spans;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 24))
  {
    self->_asrHypothesisIndex = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        -[SIRINLUEXTERNALUtteranceAlignment addSpans:](self, "addSpans:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((v5[6] & 2) != 0)
  {
    self->_nodeIndex = v5[3];
    *(unsigned char *)&self->_has |= 2u;
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
  uint64_t v4 = [(NSMutableArray *)self->_spans hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_nodeIndex;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 24);
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_asrHypothesisIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  spans = self->_spans;
  if ((unint64_t)spans | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](spans, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 24);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_nodeIndex != *((_DWORD *)v4 + 3)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_asrHypothesisIndex;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_spans;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [(id)v6 addSpans:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_nodeIndex;
    *(unsigned char *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_asrHypothesisIndex;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  id v9 = v4;
  if ([(SIRINLUEXTERNALUtteranceAlignment *)self spansCount])
  {
    [v9 clearSpans];
    unint64_t v5 = [(SIRINLUEXTERNALUtteranceAlignment *)self spansCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(SIRINLUEXTERNALUtteranceAlignment *)self spansAtIndex:i];
        [v9 addSpans:v8];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v9 + 3) = self->_nodeIndex;
    *((unsigned char *)v9 + 24) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_spans;
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

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUtteranceAlignmentReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_asrHypothesisIndex];
    [v3 setObject:v4 forKey:@"asr_hypothesis_index"];
  }
  if ([(NSMutableArray *)self->_spans count])
  {
    unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_spans, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = self->_spans;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"spans"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    long long v12 = [NSNumber numberWithUnsignedInt:self->_nodeIndex];
    [v3 setObject:v12 forKey:@"node_index"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUtteranceAlignment;
  id v4 = [(SIRINLUEXTERNALUtteranceAlignment *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALUtteranceAlignment *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNodeIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_nodeIndex = a3;
}

- (id)spansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_spans objectAtIndex:a3];
}

- (unint64_t)spansCount
{
  return [(NSMutableArray *)self->_spans count];
}

- (void)addSpans:(id)a3
{
  id v4 = a3;
  spans = self->_spans;
  id v8 = v4;
  if (!spans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_spans;
    self->_spans = v6;

    id v4 = v8;
    spans = self->_spans;
  }
  [(NSMutableArray *)spans addObject:v4];
}

- (void)clearSpans
{
}

- (BOOL)hasAsrHypothesisIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAsrHypothesisIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_asrHypothesisIndex = a3;
}

+ (Class)spansType
{
  return (Class)objc_opt_class();
}

@end