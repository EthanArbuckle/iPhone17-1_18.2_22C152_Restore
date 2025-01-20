@interface SISchemaUEIDictationAlternativeConfusionPairsSelected
- (BOOL)hasNumDeletions;
- (BOOL)hasNumInsertions;
- (BOOL)hasNumSubstitutions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)alternativeSelections;
- (NSData)jsonData;
- (SISchemaUEIDictationAlternativeConfusionPairsSelected)initWithDictionary:(id)a3;
- (SISchemaUEIDictationAlternativeConfusionPairsSelected)initWithJSON:(id)a3;
- (id)alternativeSelectionsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)numDeletions;
- (int)numInsertions;
- (int)numSubstitutions;
- (unint64_t)alternativeSelectionsCount;
- (unint64_t)hash;
- (void)addAlternativeSelections:(id)a3;
- (void)clearAlternativeSelections;
- (void)deleteNumDeletions;
- (void)deleteNumInsertions;
- (void)deleteNumSubstitutions;
- (void)setAlternativeSelections:(id)a3;
- (void)setHasNumDeletions:(BOOL)a3;
- (void)setHasNumInsertions:(BOOL)a3;
- (void)setHasNumSubstitutions:(BOOL)a3;
- (void)setNumDeletions:(int)a3;
- (void)setNumInsertions:(int)a3;
- (void)setNumSubstitutions:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIDictationAlternativeConfusionPairsSelected

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUEIDictationAlternativeConfusionPairsSelected;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self deleteAlternativeSelections];
  }
  if ([v4 isConditionSet:4]) {
    [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self deleteAlternativeSelections];
  }
  if ([v4 isConditionSet:5]) {
    [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self deleteAlternativeSelections];
  }
  if ([v4 isConditionSet:6]) {
    [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self deleteAlternativeSelections];
  }
  if ([v4 isConditionSet:7]) {
    [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self deleteAlternativeSelections];
  }
  v6 = [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self alternativeSelections];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self setAlternativeSelections:v7];

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

- (int)numSubstitutions
{
  return self->_numSubstitutions;
}

- (int)numInsertions
{
  return self->_numInsertions;
}

- (int)numDeletions
{
  return self->_numDeletions;
}

- (void)setAlternativeSelections:(id)a3
{
}

- (NSArray)alternativeSelections
{
  return self->_alternativeSelections;
}

- (SISchemaUEIDictationAlternativeConfusionPairsSelected)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SISchemaUEIDictationAlternativeConfusionPairsSelected;
  v5 = [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"alternativeSelections"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [ASRSchemaASRConfusionPairToken alloc];
              v14 = -[ASRSchemaASRConfusionPairToken initWithDictionary:](v13, "initWithDictionary:", v12, (void)v20);
              [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)v5 addAlternativeSelections:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"numDeletions", (void)v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationAlternativeConfusionPairsSelected setNumDeletions:](v5, "setNumDeletions:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"numInsertions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationAlternativeConfusionPairsSelected setNumInsertions:](v5, "setNumInsertions:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"numSubstitutions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationAlternativeConfusionPairsSelected setNumSubstitutions:](v5, "setNumSubstitutions:", [v17 intValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (SISchemaUEIDictationAlternativeConfusionPairsSelected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_alternativeSelections count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_alternativeSelections;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"alternativeSelections"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaUEIDictationAlternativeConfusionPairsSelected numDeletions](self, "numDeletions"));
    [v3 setObject:v15 forKeyedSubscript:@"numDeletions"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaUEIDictationAlternativeConfusionPairsSelected numInsertions](self, "numInsertions", (void)v17));
  [v3 setObject:v16 forKeyedSubscript:@"numInsertions"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_16:
    v13 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaUEIDictationAlternativeConfusionPairsSelected numSubstitutions](self, "numSubstitutions", (void)v17));
    [v3 setObject:v13 forKeyedSubscript:@"numSubstitutions"];
  }
LABEL_17:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v17);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_alternativeSelections hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_numDeletions;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_numInsertions;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_numSubstitutions;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self alternativeSelections];
  uint64_t v6 = [v4 alternativeSelections];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self alternativeSelections];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self alternativeSelections];
    uint64_t v11 = [v4 alternativeSelections];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $0733EC0DBCA0A975667092FC7B87D45A has = self->_has;
  unsigned int v14 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    int numDeletions = self->_numDeletions;
    if (numDeletions != [v4 numDeletions]) {
      goto LABEL_20;
    }
    $0733EC0DBCA0A975667092FC7B87D45A has = self->_has;
    unsigned int v14 = v4[28];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    int numInsertions = self->_numInsertions;
    if (numInsertions == [v4 numInsertions])
    {
      $0733EC0DBCA0A975667092FC7B87D45A has = self->_has;
      unsigned int v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    int numSubstitutions = self->_numSubstitutions;
    if (numSubstitutions != [v4 numSubstitutions]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_alternativeSelections;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((has & 4) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationAlternativeConfusionPairsSelectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumSubstitutions
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumSubstitutions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSubstitutions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumSubstitutions:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int numSubstitutions = a3;
}

- (void)deleteNumInsertions
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumInsertions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumInsertions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumInsertions:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int numInsertions = a3;
}

- (void)deleteNumDeletions
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumDeletions:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumDeletions
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumDeletions:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int numDeletions = a3;
}

- (id)alternativeSelectionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alternativeSelections objectAtIndexedSubscript:a3];
}

- (unint64_t)alternativeSelectionsCount
{
  return [(NSArray *)self->_alternativeSelections count];
}

- (void)addAlternativeSelections:(id)a3
{
  id v4 = a3;
  alternativeSelections = self->_alternativeSelections;
  id v8 = v4;
  if (!alternativeSelections)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_alternativeSelections;
    self->_alternativeSelections = v6;

    id v4 = v8;
    alternativeSelections = self->_alternativeSelections;
  }
  [(NSArray *)alternativeSelections addObject:v4];
}

- (void)clearAlternativeSelections
{
}

@end