@interface FLSchemaFLTaskEvaluationNode
- (BOOL)hasEvaluator;
- (BOOL)hasResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLSchemaFLTaskEvaluationNode)initWithDictionary:(id)a3;
- (FLSchemaFLTaskEvaluationNode)initWithJSON:(id)a3;
- (NSArray)sources;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)evaluator;
- (int)result;
- (int)sourcesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sourcesCount;
- (void)addSources:(int)a3;
- (void)clearSources;
- (void)deleteEvaluator;
- (void)deleteResult;
- (void)setEvaluator:(int)a3;
- (void)setHasEvaluator:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setResult:(int)a3;
- (void)setSources:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLSchemaFLTaskEvaluationNode

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setSources:(id)a3
{
}

- (NSArray)sources
{
  return self->_sources;
}

- (int)result
{
  return self->_result;
}

- (int)evaluator
{
  return self->_evaluator;
}

- (FLSchemaFLTaskEvaluationNode)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FLSchemaFLTaskEvaluationNode;
  v5 = [(FLSchemaFLTaskEvaluationNode *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"evaluator"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLTaskEvaluationNode setEvaluator:](v5, "setEvaluator:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"result"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLTaskEvaluationNode setResult:](v5, "setResult:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"sources"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v6;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLSchemaFLTaskEvaluationNode addSources:](v5, "addSources:", [v14 intValue]);
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v11);
      }

      v6 = v17;
    }
    v15 = v5;
  }
  return v5;
}

- (FLSchemaFLTaskEvaluationNode)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLSchemaFLTaskEvaluationNode *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLSchemaFLTaskEvaluationNode *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = [(FLSchemaFLTaskEvaluationNode *)self evaluator] - 1;
    if (v5 > 4) {
      v6 = @"FLEVALUATOR_UNKNOWN";
    }
    else {
      v6 = off_1E5EC04F0[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"evaluator"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = [(FLSchemaFLTaskEvaluationNode *)self result] - 1;
    if (v7 > 2) {
      v8 = @"FLEVALUATIONVOTE_UNKNOWN";
    }
    else {
      v8 = off_1E5EC0518[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"result"];
  }
  if ([(NSArray *)self->_sources count])
  {
    id v9 = [(FLSchemaFLTaskEvaluationNode *)self sources];
    uint64_t v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"sources"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_evaluator;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSArray *)self->_sources hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_result;
  return v3 ^ v2 ^ [(NSArray *)self->_sources hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $B888374F8F070C789160E1F388FAAB2F has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int evaluator = self->_evaluator;
    if (evaluator != [v4 evaluator]) {
      goto LABEL_14;
    }
    $B888374F8F070C789160E1F388FAAB2F has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (int v9 = self->_result, v9 == [v4 result]))
    {
      uint64_t v10 = [(FLSchemaFLTaskEvaluationNode *)self sources];
      uint64_t v11 = [v4 sources];
      uint64_t v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(FLSchemaFLTaskEvaluationNode *)self sources];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(FLSchemaFLTaskEvaluationNode *)self sources];
        v16 = [v4 sources];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_sources;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "intValue", (void)v11);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLTaskEvaluationNodeReadFrom(self, (uint64_t)a3);
}

- (int)sourcesAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_sources objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)sourcesCount
{
  return [(NSArray *)self->_sources count];
}

- (void)addSources:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  sources = self->_sources;
  if (!sources)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sources;
    self->_sources = v6;

    sources = self->_sources;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)sources addObject:v8];
}

- (void)clearSources
{
}

- (void)deleteResult
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResult
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResult:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_result = a3;
}

- (void)deleteEvaluator
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEvaluator:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEvaluator
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEvaluator:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int evaluator = a3;
}

@end