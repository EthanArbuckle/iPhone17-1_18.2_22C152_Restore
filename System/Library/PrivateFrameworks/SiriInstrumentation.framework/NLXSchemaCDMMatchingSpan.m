@interface NLXSchemaCDMMatchingSpan
- (BOOL)hasEndTokenIndex;
- (BOOL)hasInternalSpanData;
- (BOOL)hasLabel;
- (BOOL)hasLinkId;
- (BOOL)hasStartTokenIndex;
- (BOOL)hasUsoGraph;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMInternalSpanData)internalSpanData;
- (NLXSchemaCDMMatchingSpan)initWithDictionary:(id)a3;
- (NLXSchemaCDMMatchingSpan)initWithJSON:(id)a3;
- (NSArray)matcherNames;
- (NSData)jsonData;
- (NSString)label;
- (SISchemaUUID)linkId;
- (USOSchemaUSOGraph)usoGraph;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)matcherNamesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matcherNamesCount;
- (unsigned)endTokenIndex;
- (unsigned)startTokenIndex;
- (void)addMatcherNames:(int)a3;
- (void)clearMatcherNames;
- (void)deleteEndTokenIndex;
- (void)deleteInternalSpanData;
- (void)deleteLabel;
- (void)deleteLinkId;
- (void)deleteStartTokenIndex;
- (void)deleteUsoGraph;
- (void)setEndTokenIndex:(unsigned int)a3;
- (void)setHasEndTokenIndex:(BOOL)a3;
- (void)setHasInternalSpanData:(BOOL)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasStartTokenIndex:(BOOL)a3;
- (void)setHasUsoGraph:(BOOL)a3;
- (void)setInternalSpanData:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLinkId:(id)a3;
- (void)setMatcherNames:(id)a3;
- (void)setStartTokenIndex:(unsigned int)a3;
- (void)setUsoGraph:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMMatchingSpan

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLXSchemaCDMMatchingSpan;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMMatchingSpan *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMMatchingSpan *)self deleteLinkId];
  }
  v9 = [(NLXSchemaCDMMatchingSpan *)self usoGraph];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaCDMMatchingSpan *)self deleteUsoGraph];
  }
  v12 = [(NLXSchemaCDMMatchingSpan *)self internalSpanData];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLXSchemaCDMMatchingSpan *)self deleteInternalSpanData];
  }

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
  objc_storeStrong((id *)&self->_internalSpanData, 0);
  objc_storeStrong((id *)&self->_matcherNames, 0);
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setHasInternalSpanData:(BOOL)a3
{
  self->_hasLabel = a3;
}

- (void)setHasUsoGraph:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLabel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setInternalSpanData:(id)a3
{
}

- (NLXSchemaCDMInternalSpanData)internalSpanData
{
  return self->_internalSpanData;
}

- (void)setMatcherNames:(id)a3
{
}

- (NSArray)matcherNames
{
  return self->_matcherNames;
}

- (void)setUsoGraph:(id)a3
{
}

- (USOSchemaUSOGraph)usoGraph
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

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (NLXSchemaCDMMatchingSpan)initWithDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NLXSchemaCDMMatchingSpan;
  v5 = [(NLXSchemaCDMMatchingSpan *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(NLXSchemaCDMMatchingSpan *)v5 setLabel:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(NLXSchemaCDMMatchingSpan *)v5 setLinkId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"startTokenIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMMatchingSpan setStartTokenIndex:](v5, "setStartTokenIndex:", [v10 unsignedIntValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"endTokenIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMMatchingSpan setEndTokenIndex:](v5, "setEndTokenIndex:", [v11 unsignedIntValue]);
    }
    v28 = v11;
    v12 = [v4 objectForKeyedSubscript:@"usoGraph"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[USOSchemaUSOGraph alloc] initWithDictionary:v12];
      [(NLXSchemaCDMMatchingSpan *)v5 setUsoGraph:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"matcherNames"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = v10;
      v26 = v8;
      v27 = v6;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
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
            v20 = *(void **)(*((void *)&v29 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[NLXSchemaCDMMatchingSpan addMatcherNames:](v5, "addMatcherNames:", [v20 intValue]);
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v17);
      }

      int v8 = v26;
      v6 = v27;
      v10 = v25;
    }
    v21 = objc_msgSend(v4, "objectForKeyedSubscript:", @"internalSpanData", v25, v26, v27);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[NLXSchemaCDMInternalSpanData alloc] initWithDictionary:v21];
      [(NLXSchemaCDMMatchingSpan *)v5 setInternalSpanData:v22];
    }
    v23 = v5;
  }
  return v5;
}

- (NLXSchemaCDMMatchingSpan)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMMatchingSpan *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMMatchingSpan *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMMatchingSpan endTokenIndex](self, "endTokenIndex"));
    [v3 setObject:v4 forKeyedSubscript:@"endTokenIndex"];
  }
  if (self->_internalSpanData)
  {
    v5 = [(NLXSchemaCDMMatchingSpan *)self internalSpanData];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"internalSpanData"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"internalSpanData"];
    }
  }
  if (self->_label)
  {
    int v8 = [(NLXSchemaCDMMatchingSpan *)self label];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"label"];
  }
  if (self->_linkId)
  {
    v10 = [(NLXSchemaCDMMatchingSpan *)self linkId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"linkId"];
    }
  }
  if ([(NSArray *)self->_matcherNames count])
  {
    v13 = [(NLXSchemaCDMMatchingSpan *)self matcherNames];
    int v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"matcherNames"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMMatchingSpan startTokenIndex](self, "startTokenIndex"));
    [v3 setObject:v15 forKeyedSubscript:@"startTokenIndex"];
  }
  if (self->_usoGraph)
  {
    uint64_t v16 = [(NLXSchemaCDMMatchingSpan *)self usoGraph];
    uint64_t v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"usoGraph"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"usoGraph"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  unint64_t v4 = [(SISchemaUUID *)self->_linkId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_startTokenIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_endTokenIndex;
LABEL_6:
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(USOSchemaUSOGraph *)self->_usoGraph hash];
  uint64_t v8 = [(NSArray *)self->_matcherNames hash];
  return v7 ^ v8 ^ [(NLXSchemaCDMInternalSpanData *)self->_internalSpanData hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  uint64_t v5 = [(NLXSchemaCDMMatchingSpan *)self label];
  uint64_t v6 = [v4 label];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v7 = [(NLXSchemaCDMMatchingSpan *)self label];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(NLXSchemaCDMMatchingSpan *)self label];
    v10 = [v4 label];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaCDMMatchingSpan *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v12 = [(NLXSchemaCDMMatchingSpan *)self linkId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(NLXSchemaCDMMatchingSpan *)self linkId];
    id v15 = [v4 linkId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  $EBF85422EC8ADA4CFDA9F01C7E4AEBDA has = self->_has;
  unsigned int v18 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int startTokenIndex = self->_startTokenIndex;
    if (startTokenIndex != [v4 startTokenIndex]) {
      goto LABEL_34;
    }
    $EBF85422EC8ADA4CFDA9F01C7E4AEBDA has = self->_has;
    unsigned int v18 = v4[56];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v20)
  {
    unsigned int endTokenIndex = self->_endTokenIndex;
    if (endTokenIndex != [v4 endTokenIndex]) {
      goto LABEL_34;
    }
  }
  uint64_t v5 = [(NLXSchemaCDMMatchingSpan *)self usoGraph];
  uint64_t v6 = [v4 usoGraph];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v22 = [(NLXSchemaCDMMatchingSpan *)self usoGraph];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(NLXSchemaCDMMatchingSpan *)self usoGraph];
    v25 = [v4 usoGraph];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaCDMMatchingSpan *)self matcherNames];
  uint64_t v6 = [v4 matcherNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v27 = [(NLXSchemaCDMMatchingSpan *)self matcherNames];
  if (v27)
  {
    v28 = (void *)v27;
    long long v29 = [(NLXSchemaCDMMatchingSpan *)self matcherNames];
    long long v30 = [v4 matcherNames];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaCDMMatchingSpan *)self internalSpanData];
  uint64_t v6 = [v4 internalSpanData];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v32 = [(NLXSchemaCDMMatchingSpan *)self internalSpanData];
  if (!v32)
  {

LABEL_37:
    BOOL v37 = 1;
    goto LABEL_35;
  }
  objc_super v33 = (void *)v32;
  v34 = [(NLXSchemaCDMMatchingSpan *)self internalSpanData];
  uint64_t v35 = [v4 internalSpanData];
  char v36 = [v34 isEqual:v35];

  if (v36) {
    goto LABEL_37;
  }
LABEL_34:
  BOOL v37 = 0;
LABEL_35:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NLXSchemaCDMMatchingSpan *)self label];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = [(NLXSchemaCDMMatchingSpan *)self linkId];

  if (v6)
  {
    uint64_t v7 = [(NLXSchemaCDMMatchingSpan *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  v9 = [(NLXSchemaCDMMatchingSpan *)self usoGraph];

  if (v9)
  {
    v10 = [(NLXSchemaCDMMatchingSpan *)self usoGraph];
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v11 = self->_matcherNames;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "intValue", (void)v18);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  int v16 = [(NLXSchemaCDMMatchingSpan *)self internalSpanData];

  if (v16)
  {
    uint64_t v17 = [(NLXSchemaCDMMatchingSpan *)self internalSpanData];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMMatchingSpanReadFrom(self, (uint64_t)a3);
}

- (void)deleteInternalSpanData
{
}

- (BOOL)hasInternalSpanData
{
  return self->_internalSpanData != 0;
}

- (int)matcherNamesAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(NSArray *)self->_matcherNames objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)matcherNamesCount
{
  return [(NSArray *)self->_matcherNames count];
}

- (void)addMatcherNames:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  matcherNames = self->_matcherNames;
  if (!matcherNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matcherNames;
    self->_matcherNames = v6;

    matcherNames = self->_matcherNames;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)matcherNames addObject:v8];
}

- (void)clearMatcherNames
{
}

- (void)deleteUsoGraph
{
}

- (BOOL)hasUsoGraph
{
  return self->_usoGraph != 0;
}

- (void)deleteEndTokenIndex
{
  *(unsigned char *)&self->_has &= ~2u;
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

- (BOOL)hasEndTokenIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndTokenIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int endTokenIndex = a3;
}

- (void)deleteStartTokenIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStartTokenIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTokenIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartTokenIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int startTokenIndex = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLabel
{
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

@end