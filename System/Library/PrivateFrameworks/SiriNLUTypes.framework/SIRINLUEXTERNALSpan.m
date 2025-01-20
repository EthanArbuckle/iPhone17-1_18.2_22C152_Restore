@interface SIRINLUEXTERNALSpan
- (BOOL)hasEndTokenIndex;
- (BOOL)hasInput;
- (BOOL)hasLabel;
- (BOOL)hasScore;
- (BOOL)hasStartTokenIndex;
- (BOOL)hasUsoGraph;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)input;
- (NSString)label;
- (SIRINLUEXTERNALUsoGraph)usoGraph;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)matcherNamesAsString:(int)a3;
- (int)StringAsMatcherNames:(id)a3;
- (int)matcherNames;
- (int)matcherNamesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matcherNamesCount;
- (unsigned)endTokenIndex;
- (unsigned)startTokenIndex;
- (void)addMatcherNames:(int)a3;
- (void)clearMatcherNames;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEndTokenIndex:(unsigned int)a3;
- (void)setHasEndTokenIndex:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasStartTokenIndex:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMatcherNames:(int *)a3 count:(unint64_t)a4;
- (void)setScore:(double)a3;
- (void)setStartTokenIndex:(unsigned int)a3;
- (void)setUsoGraph:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSpan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (double)score
{
  return self->_score;
}

- (void)setUsoGraph:(id)a3
{
}

- (SIRINLUEXTERNALUsoGraph)usoGraph
{
  return self->_usoGraph;
}

- (unsigned)endTokenIndex
{
  return self->_endTokenIndex;
}

- (unsigned)startTokenIndex
{
  return self->_startTokenIndex;
}

- (void)setInput:(id)a3
{
}

- (NSString)input
{
  return self->_input;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (*((void *)v4 + 7))
  {
    -[SIRINLUEXTERNALSpan setLabel:](self, "setLabel:");
    id v4 = v11;
  }
  if (*((void *)v4 + 6))
  {
    -[SIRINLUEXTERNALSpan setInput:](self, "setInput:");
    id v4 = v11;
  }
  char v5 = *((unsigned char *)v4 + 80);
  if ((v5 & 4) != 0)
  {
    self->_startTokenIndex = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 80);
  }
  if ((v5 & 2) != 0)
  {
    self->_endTokenIndex = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  usoGraph = self->_usoGraph;
  uint64_t v7 = *((void *)v4 + 9);
  if (usoGraph)
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[SIRINLUEXTERNALUsoGraph mergeFrom:](usoGraph, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[SIRINLUEXTERNALSpan setUsoGraph:](self, "setUsoGraph:");
  }
  id v4 = v11;
LABEL_15:
  if (*((unsigned char *)v4 + 80))
  {
    self->_score = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v8 = [v4 matcherNamesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      -[SIRINLUEXTERNALSpan addMatcherNames:](self, "addMatcherNames:", [v11 matcherNamesAtIndex:i]);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  NSUInteger v4 = [(NSString *)self->_input hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_startTokenIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_endTokenIndex;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  unint64_t v7 = [(SIRINLUEXTERNALUsoGraph *)self->_usoGraph hash];
  if (*(unsigned char *)&self->_has)
  {
    double score = self->_score;
    double v10 = -score;
    if (score >= 0.0) {
      double v10 = self->_score;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ PBRepeatedInt32Hash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](label, "isEqual:")) {
      goto LABEL_25;
    }
  }
  input = self->_input;
  if ((unint64_t)input | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](input, "isEqual:")) {
      goto LABEL_25;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 80);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_startTokenIndex != *((_DWORD *)v4 + 16)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_endTokenIndex != *((_DWORD *)v4 + 10)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_25;
  }
  usoGraph = self->_usoGraph;
  if ((unint64_t)usoGraph | *((void *)v4 + 9))
  {
    if (!-[SIRINLUEXTERNALUsoGraph isEqual:](usoGraph, "isEqual:"))
    {
LABEL_25:
      char IsEqual = 0;
      goto LABEL_26;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 80);
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_score != *((double *)v4 + 4)) {
      goto LABEL_25;
    }
  }
  else if (v8)
  {
    goto LABEL_25;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_26:

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_label copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_input copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_startTokenIndex;
    *(unsigned char *)(v5 + 80) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_endTokenIndex;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  id v11 = [(SIRINLUEXTERNALUsoGraph *)self->_usoGraph copyWithZone:a3];
  double v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 32) = self->_score;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  PBRepeatedInt32Copy();
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    id v4 = v9;
  }
  if (self->_input)
  {
    objc_msgSend(v9, "setInput:");
    id v4 = v9;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_startTokenIndex;
    *((unsigned char *)v4 + 80) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_endTokenIndex;
    *((unsigned char *)v4 + 80) |= 2u;
  }
  if (self->_usoGraph)
  {
    objc_msgSend(v9, "setUsoGraph:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 4) = *(void *)&self->_score;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  if ([(SIRINLUEXTERNALSpan *)self matcherNamesCount])
  {
    [v9 clearMatcherNames];
    unint64_t v6 = [(SIRINLUEXTERNALSpan *)self matcherNamesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v9, "addMatcherNames:", -[SIRINLUEXTERNALSpan matcherNamesAtIndex:](self, "matcherNamesAtIndex:", i));
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_input)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
  if (self->_usoGraph)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v8;
  }
  p_matcherNames = &self->_matcherNames;
  if (p_matcherNames->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < p_matcherNames->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSpanReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  input = self->_input;
  if (input) {
    [v4 setObject:input forKey:@"input"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    id v8 = [NSNumber numberWithUnsignedInt:self->_startTokenIndex];
    [v4 setObject:v8 forKey:@"start_token_index"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    id v9 = [NSNumber numberWithUnsignedInt:self->_endTokenIndex];
    [v4 setObject:v9 forKey:@"end_token_index"];
  }
  usoGraph = self->_usoGraph;
  if (usoGraph)
  {
    id v11 = [(SIRINLUEXTERNALUsoGraph *)usoGraph dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"uso_graph"];
  }
  if (*(unsigned char *)&self->_has)
  {
    double v12 = [NSNumber numberWithDouble:self->_score];
    [v4 setObject:v12 forKey:@"score"];
  }
  p_matcherNames = &self->_matcherNames;
  if (self->_matcherNames.count)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (p_matcherNames->count)
    {
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = p_matcherNames->list[v15];
        if (v16 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_matcherNames->list[v15]);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = off_1E6578DA0[v16];
        }
        [v14 addObject:v17];

        ++v15;
      }
      while (v15 < p_matcherNames->count);
    }
    [v4 setObject:v14 forKey:@"matcher_names"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSpan;
  id v4 = [(SIRINLUEXTERNALSpan *)&v8 description];
  uint64_t v5 = [(SIRINLUEXTERNALSpan *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsMatcherNames:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SIRI_VOCABULARY_MATCHER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MRR_DETECTOR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MRR_MATCHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONTEXT_MATCHER"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)matcherNamesAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578DA0[a3];
  }
  return v3;
}

- (void)setMatcherNames:(int *)a3 count:(unint64_t)a4
{
}

- (int)matcherNamesAtIndex:(unint64_t)a3
{
  p_matcherNames = &self->_matcherNames;
  unint64_t count = self->_matcherNames.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_matcherNames->list[a3];
}

- (void)addMatcherNames:(int)a3
{
}

- (void)clearMatcherNames
{
}

- (int)matcherNames
{
  return self->_matcherNames.list;
}

- (unint64_t)matcherNamesCount
{
  return self->_matcherNames.count;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double score = a3;
}

- (BOOL)hasUsoGraph
{
  return self->_usoGraph != 0;
}

- (BOOL)hasEndTokenIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEndTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEndTokenIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endTokenIndex = a3;
}

- (BOOL)hasStartTokenIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasStartTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setStartTokenIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_startTokenIndex = a3;
}

- (BOOL)hasInput
{
  return self->_input != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUEXTERNALSpan;
  [(SIRINLUEXTERNALSpan *)&v3 dealloc];
}

@end