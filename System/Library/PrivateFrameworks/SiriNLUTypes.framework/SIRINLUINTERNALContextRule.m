@interface SIRINLUINTERNALContextRule
+ (Class)matchingSpansType;
- (BOOL)applyToPromptScenarios;
- (BOOL)hasApplyToPromptScenarios;
- (BOOL)hasSdaComparisonMode;
- (BOOL)hasTurnContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)matchingSpans;
- (SIRINLUEXTERNALTurnContext)turnContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)matchingSpansAtIndex:(unint64_t)a3;
- (id)sdaComparisonModeAsString:(int)a3;
- (int)StringAsSdaComparisonMode:(id)a3;
- (int)sdaComparisonMode;
- (unint64_t)hash;
- (unint64_t)matchingSpansCount;
- (void)addMatchingSpans:(id)a3;
- (void)clearMatchingSpans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplyToPromptScenarios:(BOOL)a3;
- (void)setHasApplyToPromptScenarios:(BOOL)a3;
- (void)setHasSdaComparisonMode:(BOOL)a3;
- (void)setMatchingSpans:(id)a3;
- (void)setSdaComparisonMode:(int)a3;
- (void)setTurnContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALContextRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
}

- (void)setMatchingSpans:(id)a3
{
}

- (NSMutableArray)matchingSpans
{
  return self->_matchingSpans;
}

- (void)setTurnContext:(id)a3
{
}

- (SIRINLUEXTERNALTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  turnContext = self->_turnContext;
  uint64_t v6 = *((void *)v4 + 3);
  if (turnContext)
  {
    if (v6) {
      -[SIRINLUEXTERNALTurnContext mergeFrom:](turnContext, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALContextRule setTurnContext:](self, "setTurnContext:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SIRINLUINTERNALContextRule addMatchingSpans:](self, "addMatchingSpans:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v4 + 36);
  if ((v12 & 2) != 0)
  {
    self->_applyToPromptScenarios = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
    char v12 = *((unsigned char *)v4 + 36);
  }
  if (v12)
  {
    self->_sdaComparisonMode = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALTurnContext *)self->_turnContext hash];
  uint64_t v4 = [(NSMutableArray *)self->_matchingSpans hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_applyToPromptScenarios;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_sdaComparisonMode;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  turnContext = self->_turnContext;
  if ((unint64_t)turnContext | *((void *)v4 + 3))
  {
    if (!-[SIRINLUEXTERNALTurnContext isEqual:](turnContext, "isEqual:")) {
      goto LABEL_18;
    }
  }
  matchingSpans = self->_matchingSpans;
  if ((unint64_t)matchingSpans | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](matchingSpans, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_applyToPromptScenarios)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_14;
      }
    }
LABEL_18:
    BOOL v7 = 0;
    goto LABEL_19;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_18;
  }
LABEL_14:
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_sdaComparisonMode != *((_DWORD *)v4 + 4)) {
      goto LABEL_18;
    }
    BOOL v7 = 1;
  }
LABEL_19:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALTurnContext *)self->_turnContext copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_matchingSpans;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addMatchingSpans:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_applyToPromptScenarios;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_sdaComparisonMode;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_turnContext) {
    objc_msgSend(v9, "setTurnContext:");
  }
  if ([(SIRINLUINTERNALContextRule *)self matchingSpansCount])
  {
    [v9 clearMatchingSpans];
    unint64_t v4 = [(SIRINLUINTERNALContextRule *)self matchingSpansCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        BOOL v7 = [(SIRINLUINTERNALContextRule *)self matchingSpansAtIndex:i];
        [v9 addMatchingSpans:v7];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v9 + 32) = self->_applyToPromptScenarios;
    *((unsigned char *)v9 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v9 + 4) = self->_sdaComparisonMode;
    *((unsigned char *)v9 + 36) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_turnContext) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v5 = self->_matchingSpans;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALContextRuleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  turnContext = self->_turnContext;
  if (turnContext)
  {
    unint64_t v5 = [(SIRINLUEXTERNALTurnContext *)turnContext dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"turn_context"];
  }
  if ([(NSMutableArray *)self->_matchingSpans count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = self->_matchingSpans;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"matching_spans"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    long long v14 = [NSNumber numberWithBool:self->_applyToPromptScenarios];
    [v3 setObject:v14 forKey:@"apply_to_prompt_scenarios"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int sdaComparisonMode = self->_sdaComparisonMode;
    if (sdaComparisonMode)
    {
      if (sdaComparisonMode == 1)
      {
        uint64_t v16 = @"COMPARISON_MODE_DEEP";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sdaComparisonMode);
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v16 = @"COMPARISON_MODE_SHALLOW";
    }
    [v3 setObject:v16 forKey:@"sda_comparison_mode"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALContextRule;
  id v4 = [(SIRINLUINTERNALContextRule *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALContextRule *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsSdaComparisonMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"COMPARISON_MODE_SHALLOW"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"COMPARISON_MODE_DEEP"];
  }

  return v4;
}

- (id)sdaComparisonModeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"COMPARISON_MODE_DEEP";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"COMPARISON_MODE_SHALLOW";
  }
  return v4;
}

- (BOOL)hasSdaComparisonMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSdaComparisonMode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSdaComparisonMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int sdaComparisonMode = a3;
}

- (int)sdaComparisonMode
{
  if (*(unsigned char *)&self->_has) {
    return self->_sdaComparisonMode;
  }
  else {
    return 0;
  }
}

- (BOOL)hasApplyToPromptScenarios
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasApplyToPromptScenarios:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setApplyToPromptScenarios:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_applyToPromptScenarios = a3;
}

- (BOOL)applyToPromptScenarios
{
  return (*(unsigned char *)&self->_has & 2) != 0 && self->_applyToPromptScenarios;
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

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end