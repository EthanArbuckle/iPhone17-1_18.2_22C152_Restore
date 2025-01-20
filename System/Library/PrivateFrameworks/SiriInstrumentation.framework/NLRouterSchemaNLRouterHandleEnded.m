@interface NLRouterSchemaNLRouterHandleEnded
- (BOOL)hasGenAIMetadata;
- (BOOL)hasRewrittenUtteranceCount;
- (BOOL)hasRoutingDecisionSource;
- (BOOL)hasRoutingDecisionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLRouterSchemaNLRouterDecisionGenAIMetadata)genAIMetadata;
- (NLRouterSchemaNLRouterHandleEnded)initWithDictionary:(id)a3;
- (NLRouterSchemaNLRouterHandleEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)routingDecisionSource;
- (int)routingDecisionType;
- (unint64_t)hash;
- (unsigned)rewrittenUtteranceCount;
- (void)deleteGenAIMetadata;
- (void)deleteRewrittenUtteranceCount;
- (void)deleteRoutingDecisionSource;
- (void)deleteRoutingDecisionType;
- (void)setGenAIMetadata:(id)a3;
- (void)setHasGenAIMetadata:(BOOL)a3;
- (void)setHasRewrittenUtteranceCount:(BOOL)a3;
- (void)setHasRoutingDecisionSource:(BOOL)a3;
- (void)setHasRoutingDecisionType:(BOOL)a3;
- (void)setRewrittenUtteranceCount:(unsigned int)a3;
- (void)setRoutingDecisionSource:(int)a3;
- (void)setRoutingDecisionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLRouterSchemaNLRouterHandleEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLRouterSchemaNLRouterHandleEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLRouterSchemaNLRouterHandleEnded *)self genAIMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLRouterSchemaNLRouterHandleEnded *)self deleteGenAIMetadata];
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
}

- (void)setHasGenAIMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setGenAIMetadata:(id)a3
{
}

- (NLRouterSchemaNLRouterDecisionGenAIMetadata)genAIMetadata
{
  return self->_genAIMetadata;
}

- (unsigned)rewrittenUtteranceCount
{
  return self->_rewrittenUtteranceCount;
}

- (int)routingDecisionSource
{
  return self->_routingDecisionSource;
}

- (int)routingDecisionType
{
  return self->_routingDecisionType;
}

- (NLRouterSchemaNLRouterHandleEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLRouterSchemaNLRouterHandleEnded;
  v5 = [(NLRouterSchemaNLRouterHandleEnded *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"routingDecisionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterHandleEnded setRoutingDecisionType:](v5, "setRoutingDecisionType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"routingDecisionSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterHandleEnded setRoutingDecisionSource:](v5, "setRoutingDecisionSource:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"rewrittenUtteranceCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterHandleEnded setRewrittenUtteranceCount:](v5, "setRewrittenUtteranceCount:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"genAIMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[NLRouterSchemaNLRouterDecisionGenAIMetadata alloc] initWithDictionary:v9];
      [(NLRouterSchemaNLRouterHandleEnded *)v5 setGenAIMetadata:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (NLRouterSchemaNLRouterHandleEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLRouterSchemaNLRouterHandleEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLRouterSchemaNLRouterHandleEnded *)self dictionaryRepresentation];
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
  if (self->_genAIMetadata)
  {
    id v4 = [(NLRouterSchemaNLRouterHandleEnded *)self genAIMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"genAIMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"genAIMetadata"];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_8;
    }
LABEL_11:
    unsigned int v9 = [(NLRouterSchemaNLRouterHandleEnded *)self routingDecisionSource] - 1;
    if (v9 > 2) {
      v10 = @"NLROUTERDECISIONSOURCE_UNKNOWN";
    }
    else {
      v10 = off_1E5EBDC18[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"routingDecisionSource"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLRouterSchemaNLRouterHandleEnded rewrittenUtteranceCount](self, "rewrittenUtteranceCount"));
  [v3 setObject:v8 forKeyedSubscript:@"rewrittenUtteranceCount"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_8:
  if (has)
  {
LABEL_15:
    unsigned int v11 = [(NLRouterSchemaNLRouterHandleEnded *)self routingDecisionType] - 1;
    if (v11 > 7) {
      v12 = @"NLROUTERDECISIONTYPE_UNKNOWN";
    }
    else {
      v12 = off_1E5EBDC30[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"routingDecisionType"];
  }
LABEL_19:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NLRouterSchemaNLRouterDecisionGenAIMetadata *)self->_genAIMetadata hash];
  }
  uint64_t v2 = 2654435761 * self->_routingDecisionType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_routingDecisionSource;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_rewrittenUtteranceCount;
  return v3 ^ v2 ^ v4 ^ [(NLRouterSchemaNLRouterDecisionGenAIMetadata *)self->_genAIMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $ACBAFA7921AB266075BCC01DAE056949 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int routingDecisionType = self->_routingDecisionType;
    if (routingDecisionType != [v4 routingDecisionType]) {
      goto LABEL_18;
    }
    $ACBAFA7921AB266075BCC01DAE056949 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int routingDecisionSource = self->_routingDecisionSource;
      if (routingDecisionSource != [v4 routingDecisionSource]) {
        goto LABEL_18;
      }
      $ACBAFA7921AB266075BCC01DAE056949 has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10
        || (unsigned int rewrittenUtteranceCount = self->_rewrittenUtteranceCount,
            rewrittenUtteranceCount == [v4 rewrittenUtteranceCount]))
      {
        v12 = [(NLRouterSchemaNLRouterHandleEnded *)self genAIMetadata];
        objc_super v13 = [v4 genAIMetadata];
        v14 = v13;
        if ((v12 == 0) != (v13 != 0))
        {
          uint64_t v15 = [(NLRouterSchemaNLRouterHandleEnded *)self genAIMetadata];
          if (!v15)
          {

LABEL_21:
            BOOL v20 = 1;
            goto LABEL_19;
          }
          v16 = (void *)v15;
          v17 = [(NLRouterSchemaNLRouterHandleEnded *)self genAIMetadata];
          v18 = [v4 genAIMetadata];
          char v19 = [v17 isEqual:v18];

          if (v19) {
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
    }
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  v5 = [(NLRouterSchemaNLRouterHandleEnded *)self genAIMetadata];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(NLRouterSchemaNLRouterHandleEnded *)self genAIMetadata];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterHandleEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteGenAIMetadata
{
}

- (BOOL)hasGenAIMetadata
{
  return self->_genAIMetadata != 0;
}

- (void)deleteRewrittenUtteranceCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasRewrittenUtteranceCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRewrittenUtteranceCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRewrittenUtteranceCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int rewrittenUtteranceCount = a3;
}

- (void)deleteRoutingDecisionSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRoutingDecisionSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRoutingDecisionSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRoutingDecisionSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int routingDecisionSource = a3;
}

- (void)deleteRoutingDecisionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRoutingDecisionType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRoutingDecisionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRoutingDecisionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int routingDecisionType = a3;
}

@end