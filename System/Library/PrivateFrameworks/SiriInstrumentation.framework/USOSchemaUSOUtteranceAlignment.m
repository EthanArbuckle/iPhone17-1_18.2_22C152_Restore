@interface USOSchemaUSOUtteranceAlignment
- (BOOL)hasAsrHypothesisIndex;
- (BOOL)hasNodeIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)spans;
- (NSData)jsonData;
- (USOSchemaUSOUtteranceAlignment)initWithDictionary:(id)a3;
- (USOSchemaUSOUtteranceAlignment)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)spansAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)spansCount;
- (unsigned)asrHypothesisIndex;
- (unsigned)nodeIndex;
- (void)addSpans:(id)a3;
- (void)clearSpans;
- (void)deleteAsrHypothesisIndex;
- (void)deleteNodeIndex;
- (void)setAsrHypothesisIndex:(unsigned int)a3;
- (void)setHasAsrHypothesisIndex:(BOOL)a3;
- (void)setHasNodeIndex:(BOOL)a3;
- (void)setNodeIndex:(unsigned int)a3;
- (void)setSpans:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOUtteranceAlignment

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)USOSchemaUSOUtteranceAlignment;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(USOSchemaUSOUtteranceAlignment *)self spans];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(USOSchemaUSOUtteranceAlignment *)self setSpans:v7];
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

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

- (NSArray)spans
{
  return self->_spans;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (USOSchemaUSOUtteranceAlignment)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)USOSchemaUSOUtteranceAlignment;
  v5 = [(USOSchemaUSOUtteranceAlignment *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"asrHypothesisIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOUtteranceAlignment setAsrHypothesisIndex:](v5, "setAsrHypothesisIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"spans"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[USOSchemaUSOUtteranceSpan alloc] initWithDictionary:v13];
              [(USOSchemaUSOUtteranceAlignment *)v5 addSpans:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v10);
      }

      v6 = v18;
    }
    v15 = [v4 objectForKeyedSubscript:@"nodeIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOUtteranceAlignment setNodeIndex:](v5, "setNodeIndex:", [v15 unsignedIntValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (USOSchemaUSOUtteranceAlignment)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOUtteranceAlignment *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOUtteranceAlignment *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceAlignment asrHypothesisIndex](self, "asrHypothesisIndex"));
    [v3 setObject:v5 forKeyedSubscript:@"asrHypothesisIndex"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceAlignment nodeIndex](self, "nodeIndex"));
    [v3 setObject:v6 forKeyedSubscript:@"nodeIndex"];
  }
  if ([(NSArray *)self->_spans count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = self->_spans;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"spans"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_asrHypothesisIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_spans hash];
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
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[28] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int asrHypothesisIndex = self->_asrHypothesisIndex;
    if (asrHypothesisIndex != [v4 asrHypothesisIndex]) {
      goto LABEL_15;
    }
  }
  v6 = [(USOSchemaUSOUtteranceAlignment *)self spans];
  uint64_t v7 = [v4 spans];
  id v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(USOSchemaUSOUtteranceAlignment *)self spans];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(USOSchemaUSOUtteranceAlignment *)self spans];
    uint64_t v12 = [v4 spans];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v14 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1)) {
    goto LABEL_15;
  }
  if (v14)
  {
    unsigned int nodeIndex = self->_nodeIndex;
    if (nodeIndex != [v4 nodeIndex]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
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
  uint64_t v5 = self->_spans;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOUtteranceAlignmentReadFrom(self, (uint64_t)a3);
}

- (void)deleteNodeIndex
{
  *(unsigned char *)&self->_has &= ~2u;
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

- (BOOL)hasNodeIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int nodeIndex = a3;
}

- (id)spansAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_spans objectAtIndexedSubscript:a3];
}

- (unint64_t)spansCount
{
  return [(NSArray *)self->_spans count];
}

- (void)addSpans:(id)a3
{
  id v4 = a3;
  spans = self->_spans;
  id v8 = v4;
  if (!spans)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_spans;
    self->_spans = v6;

    id v4 = v8;
    spans = self->_spans;
  }
  [(NSArray *)spans addObject:v4];
}

- (void)clearSpans
{
}

- (void)deleteAsrHypothesisIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAsrHypothesisIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAsrHypothesisIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int asrHypothesisIndex = a3;
}

@end