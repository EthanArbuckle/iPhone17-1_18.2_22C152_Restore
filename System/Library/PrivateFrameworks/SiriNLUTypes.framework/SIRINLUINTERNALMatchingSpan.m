@interface SIRINLUINTERNALMatchingSpan
- (BOOL)hasEndTokenIndex;
- (BOOL)hasInput;
- (BOOL)hasInternalSpanData;
- (BOOL)hasLabel;
- (BOOL)hasSemanticValue;
- (BOOL)hasStartTokenIndex;
- (BOOL)hasUsoGraph;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)input;
- (NSString)label;
- (NSString)semanticValue;
- (SIRINLUEXTERNALUsoGraph)usoGraph;
- (SIRINLUINTERNALInternalSpanData)internalSpanData;
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
- (void)setHasStartTokenIndex:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setInternalSpanData:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMatcherNames:(int *)a3 count:(unint64_t)a4;
- (void)setSemanticValue:(id)a3;
- (void)setStartTokenIndex:(unsigned int)a3;
- (void)setUsoGraph:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALMatchingSpan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_internalSpanData, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setSemanticValue:(id)a3
{
}

- (NSString)semanticValue
{
  return self->_semanticValue;
}

- (void)setInternalSpanData:(id)a3
{
}

- (SIRINLUINTERNALInternalSpanData)internalSpanData
{
  return self->_internalSpanData;
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
  v14 = v4;
  if (*((void *)v4 + 7))
  {
    -[SIRINLUINTERNALMatchingSpan setLabel:](self, "setLabel:");
    id v4 = v14;
  }
  if (*((void *)v4 + 5))
  {
    -[SIRINLUINTERNALMatchingSpan setInput:](self, "setInput:");
    id v4 = v14;
  }
  char v5 = *((unsigned char *)v4 + 88);
  if ((v5 & 2) != 0)
  {
    self->_startTokenIndex = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 88);
  }
  if (v5)
  {
    self->_endTokenIndex = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  usoGraph = self->_usoGraph;
  uint64_t v7 = *((void *)v4 + 10);
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
    -[SIRINLUINTERNALMatchingSpan setUsoGraph:](self, "setUsoGraph:");
  }
  id v4 = v14;
LABEL_15:
  uint64_t v8 = [v4 matcherNamesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      -[SIRINLUINTERNALMatchingSpan addMatcherNames:](self, "addMatcherNames:", [v14 matcherNamesAtIndex:i]);
  }
  internalSpanData = self->_internalSpanData;
  v12 = v14;
  uint64_t v13 = v14[6];
  if (internalSpanData)
  {
    if (!v13) {
      goto LABEL_24;
    }
    -[SIRINLUINTERNALInternalSpanData mergeFrom:](internalSpanData, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_24;
    }
    -[SIRINLUINTERNALMatchingSpan setInternalSpanData:](self, "setInternalSpanData:");
  }
  v12 = v14;
LABEL_24:
  if (v12[8]) {
    -[SIRINLUINTERNALMatchingSpan setSemanticValue:](self, "setSemanticValue:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  NSUInteger v4 = [(NSString *)self->_input hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_startTokenIndex;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_endTokenIndex;
LABEL_6:
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(SIRINLUEXTERNALUsoGraph *)self->_usoGraph hash];
  uint64_t v8 = PBRepeatedInt32Hash();
  unint64_t v9 = v8 ^ [(SIRINLUINTERNALInternalSpanData *)self->_internalSpanData hash];
  return v7 ^ v9 ^ [(NSString *)self->_semanticValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](label, "isEqual:")) {
      goto LABEL_23;
    }
  }
  input = self->_input;
  if ((unint64_t)input | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](input, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_startTokenIndex != *((_DWORD *)v4 + 18)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
LABEL_23:
    char v10 = 0;
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_endTokenIndex != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_23;
  }
  usoGraph = self->_usoGraph;
  if ((unint64_t)usoGraph | *((void *)v4 + 10) && !-[SIRINLUEXTERNALUsoGraph isEqual:](usoGraph, "isEqual:")) {
    goto LABEL_23;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_23;
  }
  internalSpanData = self->_internalSpanData;
  if ((unint64_t)internalSpanData | *((void *)v4 + 6))
  {
    if (!-[SIRINLUINTERNALInternalSpanData isEqual:](internalSpanData, "isEqual:")) {
      goto LABEL_23;
    }
  }
  semanticValue = self->_semanticValue;
  if ((unint64_t)semanticValue | *((void *)v4 + 8)) {
    char v10 = -[NSString isEqual:](semanticValue, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_24:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_label copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_input copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_startTokenIndex;
    *(unsigned char *)(v5 + 88) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 32) = self->_endTokenIndex;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  id v11 = [(SIRINLUEXTERNALUsoGraph *)self->_usoGraph copyWithZone:a3];
  v12 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v11;

  PBRepeatedInt32Copy();
  id v13 = [(SIRINLUINTERNALInternalSpanData *)self->_internalSpanData copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  uint64_t v15 = [(NSString *)self->_semanticValue copyWithZone:a3];
  v16 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v15;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    id v4 = v10;
  }
  if (self->_input)
  {
    objc_msgSend(v10, "setInput:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_startTokenIndex;
    *((unsigned char *)v4 + 88) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 8) = self->_endTokenIndex;
    *((unsigned char *)v4 + 88) |= 1u;
  }
  if (self->_usoGraph) {
    objc_msgSend(v10, "setUsoGraph:");
  }
  if ([(SIRINLUINTERNALMatchingSpan *)self matcherNamesCount])
  {
    [v10 clearMatcherNames];
    unint64_t v6 = [(SIRINLUINTERNALMatchingSpan *)self matcherNamesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v10, "addMatcherNames:", -[SIRINLUINTERNALMatchingSpan matcherNamesAtIndex:](self, "matcherNamesAtIndex:", i));
    }
  }
  if (self->_internalSpanData) {
    objc_msgSend(v10, "setInternalSpanData:");
  }
  unint64_t v9 = v10;
  if (self->_semanticValue)
  {
    objc_msgSend(v10, "setSemanticValue:");
    unint64_t v9 = v10;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_input)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
  if (self->_usoGraph)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_matcherNames.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < self->_matcherNames.count);
  }
  if (self->_internalSpanData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_semanticValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALMatchingSpanReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_startTokenIndex];
    [v4 setObject:v8 forKey:@"start_token_index"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unint64_t v9 = [NSNumber numberWithUnsignedInt:self->_endTokenIndex];
    [v4 setObject:v9 forKey:@"end_token_index"];
  }
  usoGraph = self->_usoGraph;
  if (usoGraph)
  {
    id v11 = [(SIRINLUEXTERNALUsoGraph *)usoGraph dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"uso_graph"];
  }
  p_matcherNames = &self->_matcherNames;
  if (self->_matcherNames.count)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_matcherNames.count)
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = p_matcherNames->list[v14];
        if (v15 >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_matcherNames->list[v14]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E6578E50[v15];
        }
        [v13 addObject:v16];

        ++v14;
      }
      while (v14 < self->_matcherNames.count);
    }
    [v4 setObject:v13 forKey:@"matcher_names"];
  }
  internalSpanData = self->_internalSpanData;
  if (internalSpanData)
  {
    v18 = [(SIRINLUINTERNALInternalSpanData *)internalSpanData dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"internal_span_data"];
  }
  semanticValue = self->_semanticValue;
  if (semanticValue) {
    [v4 setObject:semanticValue forKey:@"semantic_value"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALMatchingSpan;
  id v4 = [(SIRINLUINTERNALMatchingSpan *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALMatchingSpan *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSemanticValue
{
  return self->_semanticValue != 0;
}

- (BOOL)hasInternalSpanData
{
  return self->_internalSpanData != 0;
}

- (int)StringAsMatcherNames:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DATADETECTOR_MATCHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLUM_MATCHER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SIRI_VOCABULARY_MATCHER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VOC_TRIE_MATCHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONTEXT_MATCHER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OVERTON_KG_MATCHER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MRR_DETECTOR"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MRR_MATCHER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"REGEX_MATCHER"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)matcherNamesAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578E50[a3];
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
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
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

- (BOOL)hasUsoGraph
{
  return self->_usoGraph != 0;
}

- (BOOL)hasEndTokenIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEndTokenIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEndTokenIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endTokenIndex = a3;
}

- (BOOL)hasStartTokenIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasStartTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setStartTokenIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
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
  v3.super_class = (Class)SIRINLUINTERNALMatchingSpan;
  [(SIRINLUINTERNALMatchingSpan *)&v3 dealloc];
}

@end