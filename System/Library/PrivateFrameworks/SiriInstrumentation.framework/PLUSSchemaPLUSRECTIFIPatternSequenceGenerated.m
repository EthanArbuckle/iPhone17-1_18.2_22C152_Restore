@interface PLUSSchemaPLUSRECTIFIPatternSequenceGenerated
- (BOOL)hasNumberOfRequestsReviewed;
- (BOOL)hasNumberOfUniqueRequestsReviewed;
- (BOOL)hasOriginalRequestId;
- (BOOL)hasPatternId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)constraints;
- (NSArray)sequences;
- (NSData)jsonData;
- (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated)initWithJSON:(id)a3;
- (SISchemaUUID)originalRequestId;
- (SISchemaUUID)patternId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)constraintsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)sequenceAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)constraintsCount;
- (unint64_t)hash;
- (unint64_t)sequenceCount;
- (unsigned)numberOfRequestsReviewed;
- (unsigned)numberOfUniqueRequestsReviewed;
- (void)addConstraints:(id)a3;
- (void)addSequence:(id)a3;
- (void)clearConstraints;
- (void)clearSequence;
- (void)deleteNumberOfRequestsReviewed;
- (void)deleteNumberOfUniqueRequestsReviewed;
- (void)deleteOriginalRequestId;
- (void)deletePatternId;
- (void)setConstraints:(id)a3;
- (void)setHasNumberOfRequestsReviewed:(BOOL)a3;
- (void)setHasNumberOfUniqueRequestsReviewed:(BOOL)a3;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setHasPatternId:(BOOL)a3;
- (void)setNumberOfRequestsReviewed:(unsigned int)a3;
- (void)setNumberOfUniqueRequestsReviewed:(unsigned int)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)setPatternId:(id)a3;
- (void)setSequences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSRECTIFIPatternSequenceGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLUSSchemaPLUSRECTIFIPatternSequenceGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v17 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self patternId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self deletePatternId];
  }
  v9 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self sequences];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self setSequences:v10];

  v11 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self constraints];
  v12 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v11 underConditions:v4];
  [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self setConstraints:v12];

  v13 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self originalRequestId];
  v14 = [v13 applySensitiveConditionsPolicy:v4];
  int v15 = [v14 suppressMessage];

  if (v15) {
    [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self deleteOriginalRequestId];
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
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_sequences, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasPatternId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)numberOfUniqueRequestsReviewed
{
  return self->_numberOfUniqueRequestsReviewed;
}

- (unsigned)numberOfRequestsReviewed
{
  return self->_numberOfRequestsReviewed;
}

- (void)setOriginalRequestId:(id)a3
{
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setSequences:(id)a3
{
}

- (NSArray)sequences
{
  return self->_sequences;
}

- (void)setPatternId:(id)a3
{
}

- (SISchemaUUID)patternId
{
  return self->_patternId;
}

- (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated)initWithDictionary:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PLUSSchemaPLUSRECTIFIPatternSequenceGenerated;
  v5 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)&v40 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"patternId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)v5 setPatternId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"sequence"];
    objc_opt_class();
    v30 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v37 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v15 = [[PLUSSchemaPLUSRECTIFIPatternItem alloc] initWithDictionary:v14];
              [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)v5 addSequence:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v11);
      }

      int v8 = v30;
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"constraints", v30);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [[PLUSSchemaPLUSRECTIFIPatternConstraint alloc] initWithDictionary:v22];
              [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)v5 addConstraints:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v19);
      }

      int v8 = v31;
    }
    v24 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[SISchemaUUID alloc] initWithDictionary:v24];
      [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)v5 setOriginalRequestId:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"numberOfRequestsReviewed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setNumberOfRequestsReviewed:](v5, "setNumberOfRequestsReviewed:", [v26 unsignedIntValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"numberOfUniqueRequestsReviewed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setNumberOfUniqueRequestsReviewed:](v5, "setNumberOfUniqueRequestsReviewed:", [v27 unsignedIntValue]);
    }
    v28 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self dictionaryRepresentation];
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
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_constraints count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v5 = self->_constraints;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"constraints"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated numberOfRequestsReviewed](self, "numberOfRequestsReviewed"));
    [v3 setObject:v13 forKeyedSubscript:@"numberOfRequestsReviewed"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated numberOfUniqueRequestsReviewed](self, "numberOfUniqueRequestsReviewed"));
    [v3 setObject:v14 forKeyedSubscript:@"numberOfUniqueRequestsReviewed"];
  }
  if (self->_originalRequestId)
  {
    int v15 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self originalRequestId];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"originalRequestId"];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"originalRequestId"];
    }
  }
  if (self->_patternId)
  {
    uint64_t v18 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self patternId];
    uint64_t v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"patternId"];
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"patternId"];
    }
  }
  if ([(NSArray *)self->_sequences count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v22 = self->_sequences;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * j), "dictionaryRepresentation", (void)v30);
          if (v27)
          {
            [v21 addObject:v27];
          }
          else
          {
            v28 = [MEMORY[0x1E4F1CA98] null];
            [v21 addObject:v28];
          }
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"sequence"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v30);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_patternId hash];
  uint64_t v4 = [(NSArray *)self->_sequences hash];
  uint64_t v5 = [(NSArray *)self->_constraints hash];
  unint64_t v6 = [(SISchemaUUID *)self->_originalRequestId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_numberOfRequestsReviewed;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_numberOfUniqueRequestsReviewed;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self patternId];
  unint64_t v6 = [v4 patternId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self patternId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self patternId];
    uint64_t v10 = [v4 patternId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self sequences];
  unint64_t v6 = [v4 sequences];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self sequences];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self sequences];
    int v15 = [v4 sequences];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self constraints];
  unint64_t v6 = [v4 constraints];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self constraints];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self constraints];
    uint64_t v20 = [v4 constraints];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self originalRequestId];
  unint64_t v6 = [v4 originalRequestId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self originalRequestId];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self originalRequestId];
    uint64_t v25 = [v4 originalRequestId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  $A2B8C9D4A50C0138AC10A791CD9DA46A has = self->_has;
  unsigned int v30 = v4[48];
  if ((*(unsigned char *)&has & 1) == (v30 & 1))
  {
    if (*(unsigned char *)&has)
    {
      unsigned int numberOfRequestsReviewed = self->_numberOfRequestsReviewed;
      if (numberOfRequestsReviewed != [v4 numberOfRequestsReviewed]) {
        goto LABEL_22;
      }
      $A2B8C9D4A50C0138AC10A791CD9DA46A has = self->_has;
      unsigned int v30 = v4[48];
    }
    int v32 = (*(unsigned int *)&has >> 1) & 1;
    if (v32 == ((v30 >> 1) & 1))
    {
      if (!v32
        || (unsigned int numberOfUniqueRequestsReviewed = self->_numberOfUniqueRequestsReviewed,
            numberOfUniqueRequestsReviewed == [v4 numberOfUniqueRequestsReviewed]))
      {
        BOOL v27 = 1;
        goto LABEL_23;
      }
    }
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self patternId];

  if (v5)
  {
    unint64_t v6 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self patternId];
    PBDataWriterWriteSubmessage();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_sequences;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = self->_constraints;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self originalRequestId];

  if (v17)
  {
    uint64_t v18 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self originalRequestId];
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
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSRECTIFIPatternSequenceGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumberOfUniqueRequestsReviewed
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumberOfUniqueRequestsReviewed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfUniqueRequestsReviewed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumberOfUniqueRequestsReviewed:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numberOfUniqueRequestsReviewed = a3;
}

- (void)deleteNumberOfRequestsReviewed
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumberOfRequestsReviewed:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfRequestsReviewed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberOfRequestsReviewed:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numberOfRequestsReviewed = a3;
}

- (void)deleteOriginalRequestId
{
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (id)constraintsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_constraints objectAtIndexedSubscript:a3];
}

- (unint64_t)constraintsCount
{
  return [(NSArray *)self->_constraints count];
}

- (void)addConstraints:(id)a3
{
  id v4 = a3;
  constraints = self->_constraints;
  id v8 = v4;
  if (!constraints)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_constraints;
    self->_constraints = v6;

    id v4 = v8;
    constraints = self->_constraints;
  }
  [(NSArray *)constraints addObject:v4];
}

- (void)clearConstraints
{
}

- (id)sequenceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_sequences objectAtIndexedSubscript:a3];
}

- (unint64_t)sequenceCount
{
  return [(NSArray *)self->_sequences count];
}

- (void)addSequence:(id)a3
{
  id v4 = a3;
  sequences = self->_sequences;
  id v8 = v4;
  if (!sequences)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sequences;
    self->_sequences = v6;

    id v4 = v8;
    sequences = self->_sequences;
  }
  [(NSArray *)sequences addObject:v4];
}

- (void)clearSequence
{
}

- (void)deletePatternId
{
}

- (BOOL)hasPatternId
{
  return self->_patternId != 0;
}

@end