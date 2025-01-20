@interface NLRouterSchemaNLRouterClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasNlRouterBridgeHandleContext;
- (BOOL)hasNlRouterHandleContext;
- (BOOL)hasNlRouterPromptGenerationSignalsCaptured;
- (BOOL)hasNlRouterSubComponentHandleContext;
- (BOOL)hasNlRouterSubComponentSetupContext;
- (BOOL)hasNlRouterSubComponentTriggeredHeuristicRuleTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLRouterSchemaNLRouterBridgeHandleContext)nlRouterBridgeHandleContext;
- (NLRouterSchemaNLRouterClientEvent)initWithDictionary:(id)a3;
- (NLRouterSchemaNLRouterClientEvent)initWithJSON:(id)a3;
- (NLRouterSchemaNLRouterClientEventMetadata)eventMetadata;
- (NLRouterSchemaNLRouterHandleContext)nlRouterHandleContext;
- (NLRouterSchemaNLRouterPromptGenerationSignalsCaptured)nlRouterPromptGenerationSignalsCaptured;
- (NLRouterSchemaNLRouterSubComponentHandleContext)nlRouterSubComponentHandleContext;
- (NLRouterSchemaNLRouterSubComponentSetupContext)nlRouterSubComponentSetupContext;
- (NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1)nlRouterSubComponentTriggeredHeuristicRuleTier1;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deleteNlRouterBridgeHandleContext;
- (void)deleteNlRouterHandleContext;
- (void)deleteNlRouterPromptGenerationSignalsCaptured;
- (void)deleteNlRouterSubComponentHandleContext;
- (void)deleteNlRouterSubComponentSetupContext;
- (void)deleteNlRouterSubComponentTriggeredHeuristicRuleTier1;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasNlRouterBridgeHandleContext:(BOOL)a3;
- (void)setHasNlRouterHandleContext:(BOOL)a3;
- (void)setHasNlRouterPromptGenerationSignalsCaptured:(BOOL)a3;
- (void)setHasNlRouterSubComponentHandleContext:(BOOL)a3;
- (void)setHasNlRouterSubComponentSetupContext:(BOOL)a3;
- (void)setHasNlRouterSubComponentTriggeredHeuristicRuleTier1:(BOOL)a3;
- (void)setNlRouterBridgeHandleContext:(id)a3;
- (void)setNlRouterHandleContext:(id)a3;
- (void)setNlRouterPromptGenerationSignalsCaptured:(id)a3;
- (void)setNlRouterSubComponentHandleContext:(id)a3;
- (void)setNlRouterSubComponentSetupContext:(id)a3;
- (void)setNlRouterSubComponentTriggeredHeuristicRuleTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLRouterSchemaNLRouterClientEvent

- (int)componentName
{
  v3 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
  v4 = [v3 nlRouterId];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [v4 value];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = [v4 value];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    int v9 = 42;
  }
  else
  {
LABEL_5:
    v10 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (v11)
    {
      uint64_t v12 = [v11 value];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v11 value];
        int v9 = [v14 length] != 0;
      }
      else
      {
        int v9 = 0;
      }
      v4 = v11;
    }
    else
    {
      int v9 = 0;
      v4 = 0;
    }
  }

  return v9;
}

- (id)getComponentId
{
  v3 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
  v4 = [v3 nlRouterId];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_8;
      }
    }
  }
  int v9 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    id v11 = [v10 value];
    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = [v10 value];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      v4 = v10;
LABEL_8:
      id v11 = v4;
      v10 = v11;
      goto LABEL_10;
    }
  }
  id v11 = 0;
LABEL_10:

  return v11;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NLRouterSchemaNLRouterClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterSubComponentTriggeredHeuristicRuleTier1];
  }
  if ([v4 isConditionSet:4]) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterSubComponentTriggeredHeuristicRuleTier1];
  }
  if ([v4 isConditionSet:5]) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterSubComponentTriggeredHeuristicRuleTier1];
  }
  if ([v4 isConditionSet:6]) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterSubComponentTriggeredHeuristicRuleTier1];
  }
  if ([v4 isConditionSet:7]) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterSubComponentTriggeredHeuristicRuleTier1];
  }
  v6 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteEventMetadata];
  }
  int v9 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterHandleContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterHandleContext];
  }
  uint64_t v12 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterBridgeHandleContext];
  uint64_t v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterBridgeHandleContext];
  }
  v15 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentHandleContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterSubComponentHandleContext];
  }
  v18 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentSetupContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterSubComponentSetupContext];
  }
  v21 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentTriggeredHeuristicRuleTier1];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterSubComponentTriggeredHeuristicRuleTier1];
  }
  v24 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterPromptGenerationSignalsCaptured];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(NLRouterSchemaNLRouterClientEvent *)self deleteNlRouterPromptGenerationSignalsCaptured];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(NLRouterSchemaNLRouterClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 5) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAB0A8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 5) {
    return 0;
  }
  else {
    return off_1E5EAB0D8[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlRouterPromptGenerationSignalsCaptured, 0);
  objc_storeStrong((id *)&self->_nlRouterSubComponentTriggeredHeuristicRuleTier1, 0);
  objc_storeStrong((id *)&self->_nlRouterSubComponentSetupContext, 0);
  objc_storeStrong((id *)&self->_nlRouterSubComponentHandleContext, 0);
  objc_storeStrong((id *)&self->_nlRouterBridgeHandleContext, 0);
  objc_storeStrong((id *)&self->_nlRouterHandleContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasNlRouterPromptGenerationSignalsCaptured:(BOOL)a3
{
  self->_hasNlRouterPromptGenerationSignalsCaptured = a3;
}

- (BOOL)hasNlRouterPromptGenerationSignalsCaptured
{
  return self->_hasNlRouterPromptGenerationSignalsCaptured;
}

- (void)setHasNlRouterSubComponentTriggeredHeuristicRuleTier1:(BOOL)a3
{
  self->_hasNlRouterSubComponentTriggeredHeuristicRuleTier1 = a3;
}

- (BOOL)hasNlRouterSubComponentTriggeredHeuristicRuleTier1
{
  return self->_hasNlRouterSubComponentTriggeredHeuristicRuleTier1;
}

- (void)setHasNlRouterSubComponentSetupContext:(BOOL)a3
{
  self->_hasNlRouterSubComponentSetupContext = a3;
}

- (BOOL)hasNlRouterSubComponentSetupContext
{
  return self->_hasNlRouterSubComponentSetupContext;
}

- (void)setHasNlRouterSubComponentHandleContext:(BOOL)a3
{
  self->_hasNlRouterSubComponentHandleContext = a3;
}

- (BOOL)hasNlRouterSubComponentHandleContext
{
  return self->_hasNlRouterSubComponentHandleContext;
}

- (void)setHasNlRouterBridgeHandleContext:(BOOL)a3
{
  self->_hasNlRouterBridgeHandleContext = a3;
}

- (BOOL)hasNlRouterBridgeHandleContext
{
  return self->_hasNlRouterBridgeHandleContext;
}

- (void)setHasNlRouterHandleContext:(BOOL)a3
{
  self->_hasNlRouterHandleContext = a3;
}

- (BOOL)hasNlRouterHandleContext
{
  return self->_hasNlRouterHandleContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (NLRouterSchemaNLRouterClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (NLRouterSchemaNLRouterClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NLRouterSchemaNLRouterClientEvent;
  uint64_t v5 = [(NLRouterSchemaNLRouterClientEvent *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[NLRouterSchemaNLRouterClientEventMetadata alloc] initWithDictionary:v6];
      [(NLRouterSchemaNLRouterClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"nlRouterHandleContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [[NLRouterSchemaNLRouterHandleContext alloc] initWithDictionary:v8];
      [(NLRouterSchemaNLRouterClientEvent *)v5 setNlRouterHandleContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"nlRouterBridgeHandleContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[NLRouterSchemaNLRouterBridgeHandleContext alloc] initWithDictionary:v10];
      [(NLRouterSchemaNLRouterClientEvent *)v5 setNlRouterBridgeHandleContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"nlRouterSubComponentHandleContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [[NLRouterSchemaNLRouterSubComponentHandleContext alloc] initWithDictionary:v12];
      [(NLRouterSchemaNLRouterClientEvent *)v5 setNlRouterSubComponentHandleContext:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"nlRouterSubComponentSetupContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[NLRouterSchemaNLRouterSubComponentSetupContext alloc] initWithDictionary:v14];
      [(NLRouterSchemaNLRouterClientEvent *)v5 setNlRouterSubComponentSetupContext:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"nlRouterSubComponentTriggeredHeuristicRuleTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 alloc] initWithDictionary:v16];
      [(NLRouterSchemaNLRouterClientEvent *)v5 setNlRouterSubComponentTriggeredHeuristicRuleTier1:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"nlRouterPromptGenerationSignalsCaptured"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[NLRouterSchemaNLRouterPromptGenerationSignalsCaptured alloc] initWithDictionary:v18];
      [(NLRouterSchemaNLRouterClientEvent *)v5 setNlRouterPromptGenerationSignalsCaptured:v19];
    }
    int v20 = v5;
  }
  return v5;
}

- (NLRouterSchemaNLRouterClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(NLRouterSchemaNLRouterClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLRouterSchemaNLRouterClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_eventMetadata)
  {
    id v4 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_nlRouterBridgeHandleContext)
  {
    uint64_t v7 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterBridgeHandleContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"nlRouterBridgeHandleContext"];
    }
    else
    {
      int v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"nlRouterBridgeHandleContext"];
    }
  }
  if (self->_nlRouterHandleContext)
  {
    v10 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterHandleContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"nlRouterHandleContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"nlRouterHandleContext"];
    }
  }
  if (self->_nlRouterPromptGenerationSignalsCaptured)
  {
    uint64_t v13 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterPromptGenerationSignalsCaptured];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"nlRouterPromptGenerationSignalsCaptured"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"nlRouterPromptGenerationSignalsCaptured"];
    }
  }
  if (self->_nlRouterSubComponentHandleContext)
  {
    v16 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentHandleContext];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"nlRouterSubComponentHandleContext"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"nlRouterSubComponentHandleContext"];
    }
  }
  if (self->_nlRouterSubComponentSetupContext)
  {
    v19 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentSetupContext];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"nlRouterSubComponentSetupContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"nlRouterSubComponentSetupContext"];
    }
  }
  if (self->_nlRouterSubComponentTriggeredHeuristicRuleTier1)
  {
    objc_super v22 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentTriggeredHeuristicRuleTier1];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"nlRouterSubComponentTriggeredHeuristicRuleTier1"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"nlRouterSubComponentTriggeredHeuristicRuleTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NLRouterSchemaNLRouterClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(NLRouterSchemaNLRouterHandleContext *)self->_nlRouterHandleContext hash] ^ v3;
  unint64_t v5 = [(NLRouterSchemaNLRouterBridgeHandleContext *)self->_nlRouterBridgeHandleContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(NLRouterSchemaNLRouterSubComponentHandleContext *)self->_nlRouterSubComponentHandleContext hash];
  unint64_t v7 = [(NLRouterSchemaNLRouterSubComponentSetupContext *)self->_nlRouterSubComponentSetupContext hash];
  unint64_t v8 = v7 ^ [(NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *)self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 hash];
  return v6 ^ v8 ^ [(NLRouterSchemaNLRouterPromptGenerationSignalsCaptured *)self->_nlRouterPromptGenerationSignalsCaptured hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_38;
  }
  unint64_t v6 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v8 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterHandleContext];
  unint64_t v7 = [v4 nlRouterHandleContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterHandleContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterHandleContext];
    v16 = [v4 nlRouterHandleContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterBridgeHandleContext];
  unint64_t v7 = [v4 nlRouterBridgeHandleContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterBridgeHandleContext];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterBridgeHandleContext];
    v21 = [v4 nlRouterBridgeHandleContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentHandleContext];
  unint64_t v7 = [v4 nlRouterSubComponentHandleContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentHandleContext];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentHandleContext];
    int v26 = [v4 nlRouterSubComponentHandleContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentSetupContext];
  unint64_t v7 = [v4 nlRouterSubComponentSetupContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentSetupContext];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentSetupContext];
    v31 = [v4 nlRouterSubComponentSetupContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentTriggeredHeuristicRuleTier1];
  unint64_t v7 = [v4 nlRouterSubComponentTriggeredHeuristicRuleTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentTriggeredHeuristicRuleTier1];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentTriggeredHeuristicRuleTier1];
    v36 = [v4 nlRouterSubComponentTriggeredHeuristicRuleTier1];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterPromptGenerationSignalsCaptured];
  unint64_t v7 = [v4 nlRouterPromptGenerationSignalsCaptured];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v38 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterPromptGenerationSignalsCaptured];
    if (!v38)
    {

LABEL_41:
      BOOL v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    v40 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterPromptGenerationSignalsCaptured];
    v41 = [v4 nlRouterPromptGenerationSignalsCaptured];
    char v42 = [v40 isEqual:v41];

    if (v42) {
      goto LABEL_41;
    }
  }
  else
  {
LABEL_37:
  }
LABEL_38:
  BOOL v43 = 0;
LABEL_39:

  return v43;
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  id v4 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(NLRouterSchemaNLRouterClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterHandleContext];

  if (v6)
  {
    unint64_t v7 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterHandleContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterBridgeHandleContext];

  if (v8)
  {
    int v9 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterBridgeHandleContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentHandleContext];

  if (v10)
  {
    int v11 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentHandleContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentSetupContext];

  if (v12)
  {
    uint64_t v13 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentSetupContext];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentTriggeredHeuristicRuleTier1];

  if (v14)
  {
    v15 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterSubComponentTriggeredHeuristicRuleTier1];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterPromptGenerationSignalsCaptured];

  if (v16)
  {
    int v17 = [(NLRouterSchemaNLRouterClientEvent *)self nlRouterPromptGenerationSignalsCaptured];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteNlRouterPromptGenerationSignalsCaptured
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nlRouterPromptGenerationSignalsCaptured = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLRouterSchemaNLRouterPromptGenerationSignalsCaptured)nlRouterPromptGenerationSignalsCaptured
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_nlRouterPromptGenerationSignalsCaptured;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlRouterPromptGenerationSignalsCaptured:(id)a3
{
  id v4 = (NLRouterSchemaNLRouterPromptGenerationSignalsCaptured *)a3;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = 0;

  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = 0;

  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = 0;

  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = 0;

  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  unint64_t v10 = 106;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  nlRouterPromptGenerationSignalsCaptured = self->_nlRouterPromptGenerationSignalsCaptured;
  self->_nlRouterPromptGenerationSignalsCaptured = v4;
}

- (void)deleteNlRouterSubComponentTriggeredHeuristicRuleTier1
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1)nlRouterSubComponentTriggeredHeuristicRuleTier1
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlRouterSubComponentTriggeredHeuristicRuleTier1:(id)a3
{
  id v4 = (NLRouterSchemaNLRouterSubComponentTriggeredHeuristicRuleTier1 *)a3;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = 0;

  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = 0;

  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = 0;

  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = 0;

  nlRouterPromptGenerationSignalsCaptured = self->_nlRouterPromptGenerationSignalsCaptured;
  self->_nlRouterPromptGenerationSignalsCaptured = 0;

  unint64_t v10 = 105;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = v4;
}

- (void)deleteNlRouterSubComponentSetupContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nlRouterSubComponentSetupContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLRouterSchemaNLRouterSubComponentSetupContext)nlRouterSubComponentSetupContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_nlRouterSubComponentSetupContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlRouterSubComponentSetupContext:(id)a3
{
  id v4 = (NLRouterSchemaNLRouterSubComponentSetupContext *)a3;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = 0;

  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = 0;

  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = 0;

  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  nlRouterPromptGenerationSignalsCaptured = self->_nlRouterPromptGenerationSignalsCaptured;
  self->_nlRouterPromptGenerationSignalsCaptured = 0;

  unint64_t v10 = 104;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = v4;
}

- (void)deleteNlRouterSubComponentHandleContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nlRouterSubComponentHandleContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLRouterSchemaNLRouterSubComponentHandleContext)nlRouterSubComponentHandleContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_nlRouterSubComponentHandleContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlRouterSubComponentHandleContext:(id)a3
{
  id v4 = (NLRouterSchemaNLRouterSubComponentHandleContext *)a3;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = 0;

  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = 0;

  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = 0;

  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  nlRouterPromptGenerationSignalsCaptured = self->_nlRouterPromptGenerationSignalsCaptured;
  self->_nlRouterPromptGenerationSignalsCaptured = 0;

  unint64_t v10 = 103;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = v4;
}

- (void)deleteNlRouterBridgeHandleContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nlRouterBridgeHandleContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLRouterSchemaNLRouterBridgeHandleContext)nlRouterBridgeHandleContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_nlRouterBridgeHandleContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlRouterBridgeHandleContext:(id)a3
{
  id v4 = (NLRouterSchemaNLRouterBridgeHandleContext *)a3;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = 0;

  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = 0;

  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = 0;

  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  nlRouterPromptGenerationSignalsCaptured = self->_nlRouterPromptGenerationSignalsCaptured;
  self->_nlRouterPromptGenerationSignalsCaptured = 0;

  unint64_t v10 = 102;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = v4;
}

- (void)deleteNlRouterHandleContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nlRouterHandleContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLRouterSchemaNLRouterHandleContext)nlRouterHandleContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_nlRouterHandleContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlRouterHandleContext:(id)a3
{
  id v4 = (NLRouterSchemaNLRouterHandleContext *)a3;
  nlRouterBridgeHandleContext = self->_nlRouterBridgeHandleContext;
  self->_nlRouterBridgeHandleContext = 0;

  nlRouterSubComponentHandleContext = self->_nlRouterSubComponentHandleContext;
  self->_nlRouterSubComponentHandleContext = 0;

  nlRouterSubComponentSetupContext = self->_nlRouterSubComponentSetupContext;
  self->_nlRouterSubComponentSetupContext = 0;

  nlRouterSubComponentTriggeredHeuristicRuleTier1 = self->_nlRouterSubComponentTriggeredHeuristicRuleTier1;
  self->_nlRouterSubComponentTriggeredHeuristicRuleTier1 = 0;

  nlRouterPromptGenerationSignalsCaptured = self->_nlRouterPromptGenerationSignalsCaptured;
  self->_nlRouterPromptGenerationSignalsCaptured = 0;

  unint64_t v10 = 101;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  nlRouterHandleContext = self->_nlRouterHandleContext;
  self->_nlRouterHandleContext = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(NLRouterSchemaNLRouterClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 5) {
    return @"com.apple.aiml.siri.nlrouter.NLRouterClientEvent";
  }
  else {
    return off_1E5EBDBE8[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 85;
}

@end