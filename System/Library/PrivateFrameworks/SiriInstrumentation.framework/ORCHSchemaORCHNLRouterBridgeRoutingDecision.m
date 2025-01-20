@interface ORCHSchemaORCHNLRouterBridgeRoutingDecision
- (BOOL)hasRouterDecisionType;
- (BOOL)hasRoutingDecisionSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHNLRouterBridgeRoutingDecision)initWithDictionary:(id)a3;
- (ORCHSchemaORCHNLRouterBridgeRoutingDecision)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)routerDecisionType;
- (int)routingDecisionSource;
- (unint64_t)hash;
- (void)deleteRouterDecisionType;
- (void)deleteRoutingDecisionSource;
- (void)setHasRouterDecisionType:(BOOL)a3;
- (void)setHasRoutingDecisionSource:(BOOL)a3;
- (void)setRouterDecisionType:(int)a3;
- (void)setRoutingDecisionSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHNLRouterBridgeRoutingDecision

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)routerDecisionType
{
  return self->_routerDecisionType;
}

- (int)routingDecisionSource
{
  return self->_routingDecisionSource;
}

- (ORCHSchemaORCHNLRouterBridgeRoutingDecision)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ORCHSchemaORCHNLRouterBridgeRoutingDecision;
  v5 = [(ORCHSchemaORCHNLRouterBridgeRoutingDecision *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"routingDecisionSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHNLRouterBridgeRoutingDecision setRoutingDecisionSource:](v5, "setRoutingDecisionSource:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"routerDecisionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHNLRouterBridgeRoutingDecision setRouterDecisionType:](v5, "setRouterDecisionType:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHNLRouterBridgeRoutingDecision)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHNLRouterBridgeRoutingDecision *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHNLRouterBridgeRoutingDecision *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    unsigned int v5 = [(ORCHSchemaORCHNLRouterBridgeRoutingDecision *)self routerDecisionType] - 1;
    if (v5 > 7) {
      v6 = @"NLROUTERDECISIONTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBE830[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"routerDecisionType"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(ORCHSchemaORCHNLRouterBridgeRoutingDecision *)self routingDecisionSource] - 1;
    if (v7 > 5) {
      v8 = @"ORCHNLROUTERBRIDGEROUTINGDECISIONSOURCE_UNKNOWN";
    }
    else {
      v8 = off_1E5EBE870[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"routingDecisionSource"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_routingDecisionSource;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_routerDecisionType;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $26AB80A932CDC0146F6D3BDDBE1CE204 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int routingDecisionSource = self->_routingDecisionSource;
    if (routingDecisionSource != [v4 routingDecisionSource])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $26AB80A932CDC0146F6D3BDDBE1CE204 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int routerDecisionType = self->_routerDecisionType;
    if (routerDecisionType != [v4 routerDecisionType]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHNLRouterBridgeRoutingDecisionReadFrom(self, (uint64_t)a3);
}

- (void)deleteRouterDecisionType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRouterDecisionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRouterDecisionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRouterDecisionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int routerDecisionType = a3;
}

- (void)deleteRoutingDecisionSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRoutingDecisionSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRoutingDecisionSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRoutingDecisionSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int routingDecisionSource = a3;
}

@end