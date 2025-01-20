@interface ORCHSchemaNLRouterRewrittenUtteranceTier1
- (BOOL)hasSubRequestId;
- (BOOL)hasUtteranceIndex;
- (BOOL)hasUtteranceText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)utteranceText;
- (ORCHSchemaNLRouterRewrittenUtteranceTier1)initWithDictionary:(id)a3;
- (ORCHSchemaNLRouterRewrittenUtteranceTier1)initWithJSON:(id)a3;
- (SISchemaUUID)subRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)utteranceIndex;
- (unint64_t)hash;
- (void)deleteSubRequestId;
- (void)deleteUtteranceIndex;
- (void)deleteUtteranceText;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setHasUtteranceIndex:(BOOL)a3;
- (void)setHasUtteranceText:(BOOL)a3;
- (void)setSubRequestId:(id)a3;
- (void)setUtteranceIndex:(int)a3;
- (void)setUtteranceText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaNLRouterRewrittenUtteranceTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ORCHSchemaNLRouterRewrittenUtteranceTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self deleteUtteranceText];
  }
  if ([v4 isConditionSet:4]) {
    [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self deleteUtteranceText];
  }
  if ([v4 isConditionSet:5]) {
    [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self deleteUtteranceText];
  }
  if ([v4 isConditionSet:6]) {
    [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self deleteUtteranceText];
  }
  if ([v4 isConditionSet:7]) {
    [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self deleteUtteranceText];
  }
  v6 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self subRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self deleteSubRequestId];
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
  objc_storeStrong((id *)&self->_utteranceText, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
}

- (void)setHasUtteranceText:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)utteranceIndex
{
  return self->_utteranceIndex;
}

- (void)setUtteranceText:(id)a3
{
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (ORCHSchemaNLRouterRewrittenUtteranceTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORCHSchemaNLRouterRewrittenUtteranceTier1;
  v5 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)v5 setSubRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"utteranceText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)v5 setUtteranceText:v9];
    }
    objc_super v10 = [v4 objectForKeyedSubscript:@"utteranceIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaNLRouterRewrittenUtteranceTier1 setUtteranceIndex:](v5, "setUtteranceIndex:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (ORCHSchemaNLRouterRewrittenUtteranceTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self dictionaryRepresentation];
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
  if (self->_subRequestId)
  {
    id v4 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self subRequestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"subRequestId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[ORCHSchemaNLRouterRewrittenUtteranceTier1 utteranceIndex](self, "utteranceIndex"));
    [v3 setObject:v7 forKeyedSubscript:@"utteranceIndex"];
  }
  if (self->_utteranceText)
  {
    int v8 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self utteranceText];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"utteranceText"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_subRequestId hash];
  NSUInteger v4 = [(NSString *)self->_utteranceText hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_utteranceIndex;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self subRequestId];
  v6 = [v4 subRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self subRequestId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self subRequestId];
    objc_super v10 = [v4 subRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self utteranceText];
  v6 = [v4 utteranceText];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self utteranceText];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self utteranceText];
    v15 = [v4 utteranceText];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int utteranceIndex = self->_utteranceIndex, utteranceIndex == [v4 utteranceIndex]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self subRequestId];

  if (v4)
  {
    uint64_t v5 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self utteranceText];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = v8;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaNLRouterRewrittenUtteranceTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteUtteranceIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUtteranceIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUtteranceIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUtteranceIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int utteranceIndex = a3;
}

- (void)deleteUtteranceText
{
}

- (BOOL)hasUtteranceText
{
  return self->_utteranceText != 0;
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

@end