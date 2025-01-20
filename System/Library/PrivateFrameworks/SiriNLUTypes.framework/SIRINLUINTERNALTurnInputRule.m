@interface SIRINLUINTERNALTurnInputRule
+ (Class)negativeContextRulesType;
+ (Class)positiveContextRulesType;
- (BOOL)hasUtteranceRule;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)negativeContextRules;
- (NSMutableArray)positiveContextRules;
- (SIRINLUINTERNALUtteranceRule)utteranceRule;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)negativeContextRulesAtIndex:(unint64_t)a3;
- (id)positiveContextRulesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)negativeContextRulesCount;
- (unint64_t)positiveContextRulesCount;
- (void)addNegativeContextRules:(id)a3;
- (void)addPositiveContextRules:(id)a3;
- (void)clearNegativeContextRules;
- (void)clearPositiveContextRules;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNegativeContextRules:(id)a3;
- (void)setPositiveContextRules:(id)a3;
- (void)setUtteranceRule:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALTurnInputRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceRule, 0);
  objc_storeStrong((id *)&self->_positiveContextRules, 0);
  objc_storeStrong((id *)&self->_negativeContextRules, 0);
}

- (void)setNegativeContextRules:(id)a3
{
}

- (NSMutableArray)negativeContextRules
{
  return self->_negativeContextRules;
}

- (void)setPositiveContextRules:(id)a3
{
}

- (NSMutableArray)positiveContextRules
{
  return self->_positiveContextRules;
}

- (void)setUtteranceRule:(id)a3
{
}

- (SIRINLUINTERNALUtteranceRule)utteranceRule
{
  return self->_utteranceRule;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  utteranceRule = self->_utteranceRule;
  uint64_t v6 = *((void *)v4 + 3);
  if (utteranceRule)
  {
    if (v6) {
      -[SIRINLUINTERNALUtteranceRule mergeFrom:](utteranceRule, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALTurnInputRule setUtteranceRule:](self, "setUtteranceRule:");
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
        [(SIRINLUINTERNALTurnInputRule *)self addPositiveContextRules:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 1);
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
        -[SIRINLUINTERNALTurnInputRule addNegativeContextRules:](self, "addNegativeContextRules:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALUtteranceRule *)self->_utteranceRule hash];
  uint64_t v4 = [(NSMutableArray *)self->_positiveContextRules hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_negativeContextRules hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((utteranceRule = self->_utteranceRule, !((unint64_t)utteranceRule | v4[3]))
     || -[SIRINLUINTERNALUtteranceRule isEqual:](utteranceRule, "isEqual:"))
    && ((positiveContextRules = self->_positiveContextRules, !((unint64_t)positiveContextRules | v4[2]))
     || -[NSMutableArray isEqual:](positiveContextRules, "isEqual:")))
  {
    negativeContextRules = self->_negativeContextRules;
    if ((unint64_t)negativeContextRules | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](negativeContextRules, "isEqual:");
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALUtteranceRule *)self->_utteranceRule copyWithZone:a3];
  id v7 = (void *)v5[3];
  v5[3] = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  char v8 = self->_positiveContextRules;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addPositiveContextRules:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_negativeContextRules;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addNegativeContextRules:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_utteranceRule) {
    objc_msgSend(v12, "setUtteranceRule:");
  }
  if ([(SIRINLUINTERNALTurnInputRule *)self positiveContextRulesCount])
  {
    [v12 clearPositiveContextRules];
    unint64_t v4 = [(SIRINLUINTERNALTurnInputRule *)self positiveContextRulesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(SIRINLUINTERNALTurnInputRule *)self positiveContextRulesAtIndex:i];
        [v12 addPositiveContextRules:v7];
      }
    }
  }
  if ([(SIRINLUINTERNALTurnInputRule *)self negativeContextRulesCount])
  {
    [v12 clearNegativeContextRules];
    unint64_t v8 = [(SIRINLUINTERNALTurnInputRule *)self negativeContextRulesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUINTERNALTurnInputRule *)self negativeContextRulesAtIndex:j];
        [v12 addNegativeContextRules:v11];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_utteranceRule) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_positiveContextRules;
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
  uint64_t v10 = self->_negativeContextRules;
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
  return SIRINLUINTERNALTurnInputRuleReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  utteranceRule = self->_utteranceRule;
  if (utteranceRule)
  {
    unint64_t v5 = [(SIRINLUINTERNALUtteranceRule *)utteranceRule dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"utterance_rule"];
  }
  if ([(NSMutableArray *)self->_positiveContextRules count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_positiveContextRules, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v7 = self->_positiveContextRules;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"positive_context_rules"];
  }
  if ([(NSMutableArray *)self->_negativeContextRules count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_negativeContextRules, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v14 = self->_negativeContextRules;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"negative_context_rules"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALTurnInputRule;
  id v4 = [(SIRINLUINTERNALTurnInputRule *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALTurnInputRule *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)negativeContextRulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_negativeContextRules objectAtIndex:a3];
}

- (unint64_t)negativeContextRulesCount
{
  return [(NSMutableArray *)self->_negativeContextRules count];
}

- (void)addNegativeContextRules:(id)a3
{
  id v4 = a3;
  negativeContextRules = self->_negativeContextRules;
  id v8 = v4;
  if (!negativeContextRules)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_negativeContextRules;
    self->_negativeContextRules = v6;

    id v4 = v8;
    negativeContextRules = self->_negativeContextRules;
  }
  [(NSMutableArray *)negativeContextRules addObject:v4];
}

- (void)clearNegativeContextRules
{
}

- (id)positiveContextRulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_positiveContextRules objectAtIndex:a3];
}

- (unint64_t)positiveContextRulesCount
{
  return [(NSMutableArray *)self->_positiveContextRules count];
}

- (void)addPositiveContextRules:(id)a3
{
  id v4 = a3;
  positiveContextRules = self->_positiveContextRules;
  id v8 = v4;
  if (!positiveContextRules)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_positiveContextRules;
    self->_positiveContextRules = v6;

    id v4 = v8;
    positiveContextRules = self->_positiveContextRules;
  }
  [(NSMutableArray *)positiveContextRules addObject:v4];
}

- (void)clearPositiveContextRules
{
}

- (BOOL)hasUtteranceRule
{
  return self->_utteranceRule != 0;
}

+ (Class)negativeContextRulesType
{
  return (Class)objc_opt_class();
}

+ (Class)positiveContextRulesType
{
  return (Class)objc_opt_class();
}

@end