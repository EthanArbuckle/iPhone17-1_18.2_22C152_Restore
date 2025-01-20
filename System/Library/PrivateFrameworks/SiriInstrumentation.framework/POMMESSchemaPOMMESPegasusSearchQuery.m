@interface POMMESSchemaPOMMESPegasusSearchQuery
- (BOOL)hasAmpUserState;
- (BOOL)hasAudioQueueStateInfo;
- (BOOL)hasHasAudioQueueStateInfo;
- (BOOL)hasHasRewrittenUtterances;
- (BOOL)hasRewrittenUtterances;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)userSpans;
- (NSData)jsonData;
- (POMMESSchemaPOMMESPegasusSearchQuery)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusSearchQuery)initWithJSON:(id)a3;
- (POMMESSchemaPOMMESPegasusSearchQueryAmpUserState)ampUserState;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)userSpanAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)userSpanCount;
- (void)addUserSpan:(id)a3;
- (void)clearUserSpan;
- (void)deleteAmpUserState;
- (void)deleteHasAudioQueueStateInfo;
- (void)deleteHasRewrittenUtterances;
- (void)setAmpUserState:(id)a3;
- (void)setHasAmpUserState:(BOOL)a3;
- (void)setHasAudioQueueStateInfo:(BOOL)a3;
- (void)setHasHasAudioQueueStateInfo:(BOOL)a3;
- (void)setHasHasRewrittenUtterances:(BOOL)a3;
- (void)setHasRewrittenUtterances:(BOOL)a3;
- (void)setUserSpans:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusSearchQuery

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)POMMESSchemaPOMMESPegasusSearchQuery;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self userSpans];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(POMMESSchemaPOMMESPegasusSearchQuery *)self setUserSpans:v7];

  v8 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self ampUserState];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(POMMESSchemaPOMMESPegasusSearchQuery *)self deleteAmpUserState];
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
  objc_storeStrong((id *)&self->_ampUserState, 0);
  objc_storeStrong((id *)&self->_userSpans, 0);
}

- (void)setHasAmpUserState:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAmpUserState:(id)a3
{
}

- (POMMESSchemaPOMMESPegasusSearchQueryAmpUserState)ampUserState
{
  return self->_ampUserState;
}

- (BOOL)hasAudioQueueStateInfo
{
  return self->_hasAudioQueueStateInfo;
}

- (void)setUserSpans:(id)a3
{
}

- (NSArray)userSpans
{
  return self->_userSpans;
}

- (BOOL)hasRewrittenUtterances
{
  return self->_hasRewrittenUtterances;
}

- (POMMESSchemaPOMMESPegasusSearchQuery)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)POMMESSchemaPOMMESPegasusSearchQuery;
  v5 = [(POMMESSchemaPOMMESPegasusSearchQuery *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasRewrittenUtterances"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusSearchQuery setHasRewrittenUtterances:](v5, "setHasRewrittenUtterances:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"userSpan"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[POMMESSchemaPOMMESPegasusSearchQueryUserSpan alloc] initWithDictionary:v13];
              [(POMMESSchemaPOMMESPegasusSearchQuery *)v5 addUserSpan:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v10);
      }

      v6 = v20;
    }
    v15 = [v4 objectForKeyedSubscript:@"hasAudioQueueStateInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusSearchQuery setHasAudioQueueStateInfo:](v5, "setHasAudioQueueStateInfo:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"ampUserState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState alloc] initWithDictionary:v16];
      [(POMMESSchemaPOMMESPegasusSearchQuery *)v5 setAmpUserState:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusSearchQuery)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusSearchQuery *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_ampUserState)
  {
    id v4 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self ampUserState];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"ampUserState"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"ampUserState"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusSearchQuery hasAudioQueueStateInfo](self, "hasAudioQueueStateInfo"));
    [v3 setObject:v8 forKeyedSubscript:@"hasAudioQueueStateInfo"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusSearchQuery hasRewrittenUtterances](self, "hasRewrittenUtterances"));
    [v3 setObject:v9 forKeyedSubscript:@"hasRewrittenUtterances"];
  }
  if ([(NSArray *)self->_userSpans count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = self->_userSpans;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"userSpan"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_hasRewrittenUtterances;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_userSpans hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_hasAudioQueueStateInfo;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(POMMESSchemaPOMMESPegasusSearchQueryAmpUserState *)self->_ampUserState hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    int hasRewrittenUtterances = self->_hasRewrittenUtterances;
    if (hasRewrittenUtterances != [v4 hasRewrittenUtterances]) {
      goto LABEL_18;
    }
  }
  v6 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self userSpans];
  uint64_t v7 = [v4 userSpans];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self userSpans];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self userSpans];
    uint64_t v11 = [v4 userSpans];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v13 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v13 != ((v4[40] >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v13)
  {
    int hasAudioQueueStateInfo = self->_hasAudioQueueStateInfo;
    if (hasAudioQueueStateInfo != [v4 hasAudioQueueStateInfo]) {
      goto LABEL_18;
    }
  }
  v6 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self ampUserState];
  uint64_t v7 = [v4 ampUserState];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v15 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self ampUserState];
    if (!v15)
    {

LABEL_21:
      BOOL v20 = 1;
      goto LABEL_19;
    }
    v16 = (void *)v15;
    v17 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self ampUserState];
    v18 = [v4 ampUserState];
    char v19 = [v17 isEqual:v18];

    if (v19) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_userSpans;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v10 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self ampUserState];

  if (v10)
  {
    uint64_t v11 = [(POMMESSchemaPOMMESPegasusSearchQuery *)self ampUserState];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusSearchQueryReadFrom(self, (uint64_t)a3);
}

- (void)deleteAmpUserState
{
}

- (BOOL)hasAmpUserState
{
  return self->_ampUserState != 0;
}

- (void)deleteHasAudioQueueStateInfo
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHasAudioQueueStateInfo:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasAudioQueueStateInfo
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAudioQueueStateInfo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int hasAudioQueueStateInfo = a3;
}

- (id)userSpanAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_userSpans objectAtIndexedSubscript:a3];
}

- (unint64_t)userSpanCount
{
  return [(NSArray *)self->_userSpans count];
}

- (void)addUserSpan:(id)a3
{
  id v4 = a3;
  userSpans = self->_userSpans;
  id v8 = v4;
  if (!userSpans)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_userSpans;
    self->_userSpans = v6;

    id v4 = v8;
    userSpans = self->_userSpans;
  }
  [(NSArray *)userSpans addObject:v4];
}

- (void)clearUserSpan
{
}

- (void)deleteHasRewrittenUtterances
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHasRewrittenUtterances:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasRewrittenUtterances
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRewrittenUtterances:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int hasRewrittenUtterances = a3;
}

@end