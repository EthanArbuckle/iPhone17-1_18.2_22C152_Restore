@interface PGSchemaPGClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasPgModelInferenceContext;
- (BOOL)hasPgOverridesRequestContext;
- (BOOL)hasPgPrescribedPlanRequestContext;
- (BOOL)hasPgPromptResponseTier1;
- (BOOL)hasPgPromptTier1;
- (BOOL)hasPgRequestContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PGSchemaPGClientEvent)initWithDictionary:(id)a3;
- (PGSchemaPGClientEvent)initWithJSON:(id)a3;
- (PGSchemaPGClientEventMetadata)eventMetadata;
- (PGSchemaPGModelInferenceContext)pgModelInferenceContext;
- (PGSchemaPGOverridesRequestContext)pgOverridesRequestContext;
- (PGSchemaPGPrescribedPlanRequestContext)pgPrescribedPlanRequestContext;
- (PGSchemaPGPromptResponseTier1)pgPromptResponseTier1;
- (PGSchemaPGPromptTier1)pgPromptTier1;
- (PGSchemaPGRequestContext)pgRequestContext;
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
- (void)deletePgModelInferenceContext;
- (void)deletePgOverridesRequestContext;
- (void)deletePgPrescribedPlanRequestContext;
- (void)deletePgPromptResponseTier1;
- (void)deletePgPromptTier1;
- (void)deletePgRequestContext;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasPgModelInferenceContext:(BOOL)a3;
- (void)setHasPgOverridesRequestContext:(BOOL)a3;
- (void)setHasPgPrescribedPlanRequestContext:(BOOL)a3;
- (void)setHasPgPromptResponseTier1:(BOOL)a3;
- (void)setHasPgPromptTier1:(BOOL)a3;
- (void)setHasPgRequestContext:(BOOL)a3;
- (void)setPgModelInferenceContext:(id)a3;
- (void)setPgOverridesRequestContext:(id)a3;
- (void)setPgPrescribedPlanRequestContext:(id)a3;
- (void)setPgPromptResponseTier1:(id)a3;
- (void)setPgPromptTier1:(id)a3;
- (void)setPgRequestContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PGSchemaPGClientEvent

- (int)componentName
{
  v3 = [(PGSchemaPGClientEvent *)self eventMetadata];
  v4 = [v3 ifRequestId];

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
    int v9 = 45;
  }
  else
  {
LABEL_5:
    v10 = [(PGSchemaPGClientEvent *)self eventMetadata];
    v11 = [v10 planCycleId];

    if (v11)
    {
      uint64_t v12 = [v11 value];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v11 value];
        uint64_t v15 = [v14 length];

        if (v15) {
          int v9 = 61;
        }
        else {
          int v9 = 0;
        }
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
  v3 = [(PGSchemaPGClientEvent *)self eventMetadata];
  v4 = [v3 ifRequestId];

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
  int v9 = [(PGSchemaPGClientEvent *)self eventMetadata];
  v10 = [v9 planCycleId];

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
  v28.super_class = (Class)PGSchemaPGClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PGSchemaPGClientEvent *)self deletePgPromptTier1];
    [(PGSchemaPGClientEvent *)self deletePgPromptResponseTier1];
  }
  if ([v4 isConditionSet:4])
  {
    [(PGSchemaPGClientEvent *)self deletePgPromptTier1];
    [(PGSchemaPGClientEvent *)self deletePgPromptResponseTier1];
  }
  if ([v4 isConditionSet:5])
  {
    [(PGSchemaPGClientEvent *)self deletePgPromptTier1];
    [(PGSchemaPGClientEvent *)self deletePgPromptResponseTier1];
  }
  if ([v4 isConditionSet:6])
  {
    [(PGSchemaPGClientEvent *)self deletePgPromptTier1];
    [(PGSchemaPGClientEvent *)self deletePgPromptResponseTier1];
  }
  if ([v4 isConditionSet:7])
  {
    [(PGSchemaPGClientEvent *)self deletePgPromptTier1];
    [(PGSchemaPGClientEvent *)self deletePgPromptResponseTier1];
  }
  v6 = [(PGSchemaPGClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PGSchemaPGClientEvent *)self deleteEventMetadata];
  }
  int v9 = [(PGSchemaPGClientEvent *)self pgRequestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PGSchemaPGClientEvent *)self deletePgRequestContext];
  }
  uint64_t v12 = [(PGSchemaPGClientEvent *)self pgPromptTier1];
  uint64_t v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PGSchemaPGClientEvent *)self deletePgPromptTier1];
  }
  uint64_t v15 = [(PGSchemaPGClientEvent *)self pgPromptResponseTier1];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PGSchemaPGClientEvent *)self deletePgPromptResponseTier1];
  }
  v18 = [(PGSchemaPGClientEvent *)self pgModelInferenceContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PGSchemaPGClientEvent *)self deletePgModelInferenceContext];
  }
  v21 = [(PGSchemaPGClientEvent *)self pgOverridesRequestContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PGSchemaPGClientEvent *)self deletePgOverridesRequestContext];
  }
  v24 = [(PGSchemaPGClientEvent *)self pgPrescribedPlanRequestContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PGSchemaPGClientEvent *)self deletePgPrescribedPlanRequestContext];
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
  unint64_t v3 = [(PGSchemaPGClientEvent *)self whichEvent_Type];
  id v4 = &OBJC_IVAR___PGSchemaPGClientEvent__pgRequestContext;
  switch(v3)
  {
    case 'e':
      goto LABEL_9;
    case 'f':
      id v4 = &OBJC_IVAR___PGSchemaPGClientEvent__pgPromptTier1;
      goto LABEL_9;
    case 'g':
      id v4 = &OBJC_IVAR___PGSchemaPGClientEvent__pgPromptResponseTier1;
      goto LABEL_9;
    case 'h':
      id v4 = &OBJC_IVAR___PGSchemaPGClientEvent__pgModelInferenceContext;
      goto LABEL_9;
    default:
      if (v3 == 201)
      {
        id v4 = &OBJC_IVAR___PGSchemaPGClientEvent__pgOverridesRequestContext;
        goto LABEL_9;
      }
      if (v3 == 301)
      {
        id v4 = &OBJC_IVAR___PGSchemaPGClientEvent__pgPrescribedPlanRequestContext;
LABEL_9:
        id v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
        goto LABEL_10;
      }
      id v5 = 0;
LABEL_10:
      return (SISchemaInstrumentationMessage *)v5;
  }
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  switch(a3)
  {
    case 'e':
      id result = @"pgRequestContext";
      break;
    case 'f':
      id result = @"pgPromptTier1";
      break;
    case 'g':
      id result = @"pgPromptResponseTier1";
      break;
    case 'h':
      id result = @"pgModelInferenceContext";
      break;
    default:
      id v4 = @"pgPrescribedPlanRequestContext";
      if (a3 != 301) {
        id v4 = 0;
      }
      if (a3 == 201) {
        id result = @"pgOverridesRequestContext";
      }
      else {
        id result = v4;
      }
      break;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pgPrescribedPlanRequestContext, 0);
  objc_storeStrong((id *)&self->_pgOverridesRequestContext, 0);
  objc_storeStrong((id *)&self->_pgModelInferenceContext, 0);
  objc_storeStrong((id *)&self->_pgPromptResponseTier1, 0);
  objc_storeStrong((id *)&self->_pgPromptTier1, 0);
  objc_storeStrong((id *)&self->_pgRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasPgPrescribedPlanRequestContext:(BOOL)a3
{
  self->_hasPgPrescribedPlanRequestContext = a3;
}

- (BOOL)hasPgPrescribedPlanRequestContext
{
  return self->_hasPgPrescribedPlanRequestContext;
}

- (void)setHasPgOverridesRequestContext:(BOOL)a3
{
  self->_hasPgOverridesRequestContext = a3;
}

- (BOOL)hasPgOverridesRequestContext
{
  return self->_hasPgOverridesRequestContext;
}

- (void)setHasPgModelInferenceContext:(BOOL)a3
{
  self->_hasPgModelInferenceContext = a3;
}

- (BOOL)hasPgModelInferenceContext
{
  return self->_hasPgModelInferenceContext;
}

- (void)setHasPgPromptResponseTier1:(BOOL)a3
{
  self->_hasPgPromptResponseTier1 = a3;
}

- (BOOL)hasPgPromptResponseTier1
{
  return self->_hasPgPromptResponseTier1;
}

- (void)setHasPgPromptTier1:(BOOL)a3
{
  self->_hasPgPromptTier1 = a3;
}

- (BOOL)hasPgPromptTier1
{
  return self->_hasPgPromptTier1;
}

- (void)setHasPgRequestContext:(BOOL)a3
{
  self->_hasPgRequestContext = a3;
}

- (BOOL)hasPgRequestContext
{
  return self->_hasPgRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (PGSchemaPGClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PGSchemaPGClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PGSchemaPGClientEvent;
  id v5 = [(PGSchemaPGClientEvent *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PGSchemaPGClientEventMetadata alloc] initWithDictionary:v6];
      [(PGSchemaPGClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"pgRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [[PGSchemaPGRequestContext alloc] initWithDictionary:v8];
      [(PGSchemaPGClientEvent *)v5 setPgRequestContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"pgPromptTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PGSchemaPGPromptTier1 alloc] initWithDictionary:v10];
      [(PGSchemaPGClientEvent *)v5 setPgPromptTier1:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"pgPromptResponseTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [[PGSchemaPGPromptResponseTier1 alloc] initWithDictionary:v12];
      [(PGSchemaPGClientEvent *)v5 setPgPromptResponseTier1:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"pgModelInferenceContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [[PGSchemaPGModelInferenceContext alloc] initWithDictionary:v14];
      [(PGSchemaPGClientEvent *)v5 setPgModelInferenceContext:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"pgOverridesRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[PGSchemaPGOverridesRequestContext alloc] initWithDictionary:v16];
      [(PGSchemaPGClientEvent *)v5 setPgOverridesRequestContext:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"pgPrescribedPlanRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PGSchemaPGPrescribedPlanRequestContext alloc] initWithDictionary:v18];
      [(PGSchemaPGClientEvent *)v5 setPgPrescribedPlanRequestContext:v19];
    }
    int v20 = v5;
  }
  return v5;
}

- (PGSchemaPGClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(PGSchemaPGClientEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PGSchemaPGClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(PGSchemaPGClientEvent *)self eventMetadata];
    id v5 = [v4 dictionaryRepresentation];
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
  if (self->_pgModelInferenceContext)
  {
    uint64_t v7 = [(PGSchemaPGClientEvent *)self pgModelInferenceContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"pgModelInferenceContext"];
    }
    else
    {
      int v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"pgModelInferenceContext"];
    }
  }
  if (self->_pgOverridesRequestContext)
  {
    v10 = [(PGSchemaPGClientEvent *)self pgOverridesRequestContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"pgOverridesRequestContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"pgOverridesRequestContext"];
    }
  }
  if (self->_pgPrescribedPlanRequestContext)
  {
    uint64_t v13 = [(PGSchemaPGClientEvent *)self pgPrescribedPlanRequestContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"pgPrescribedPlanRequestContext"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"pgPrescribedPlanRequestContext"];
    }
  }
  if (self->_pgPromptResponseTier1)
  {
    v16 = [(PGSchemaPGClientEvent *)self pgPromptResponseTier1];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"pgPromptResponseTier1"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"pgPromptResponseTier1"];
    }
  }
  if (self->_pgPromptTier1)
  {
    v19 = [(PGSchemaPGClientEvent *)self pgPromptTier1];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"pgPromptTier1"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"pgPromptTier1"];
    }
  }
  if (self->_pgRequestContext)
  {
    objc_super v22 = [(PGSchemaPGClientEvent *)self pgRequestContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"pgRequestContext"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"pgRequestContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PGSchemaPGClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(PGSchemaPGRequestContext *)self->_pgRequestContext hash] ^ v3;
  unint64_t v5 = [(PGSchemaPGPromptTier1 *)self->_pgPromptTier1 hash];
  unint64_t v6 = v4 ^ v5 ^ [(PGSchemaPGPromptResponseTier1 *)self->_pgPromptResponseTier1 hash];
  unint64_t v7 = [(PGSchemaPGModelInferenceContext *)self->_pgModelInferenceContext hash];
  unint64_t v8 = v7 ^ [(PGSchemaPGOverridesRequestContext *)self->_pgOverridesRequestContext hash];
  return v6 ^ v8 ^ [(PGSchemaPGPrescribedPlanRequestContext *)self->_pgPrescribedPlanRequestContext hash];
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
  unint64_t v6 = [(PGSchemaPGClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v8 = [(PGSchemaPGClientEvent *)self eventMetadata];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = [(PGSchemaPGClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PGSchemaPGClientEvent *)self pgRequestContext];
  unint64_t v7 = [v4 pgRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(PGSchemaPGClientEvent *)self pgRequestContext];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(PGSchemaPGClientEvent *)self pgRequestContext];
    v16 = [v4 pgRequestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PGSchemaPGClientEvent *)self pgPromptTier1];
  unint64_t v7 = [v4 pgPromptTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(PGSchemaPGClientEvent *)self pgPromptTier1];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(PGSchemaPGClientEvent *)self pgPromptTier1];
    v21 = [v4 pgPromptTier1];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PGSchemaPGClientEvent *)self pgPromptResponseTier1];
  unint64_t v7 = [v4 pgPromptResponseTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(PGSchemaPGClientEvent *)self pgPromptResponseTier1];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(PGSchemaPGClientEvent *)self pgPromptResponseTier1];
    int v26 = [v4 pgPromptResponseTier1];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PGSchemaPGClientEvent *)self pgModelInferenceContext];
  unint64_t v7 = [v4 pgModelInferenceContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(PGSchemaPGClientEvent *)self pgModelInferenceContext];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(PGSchemaPGClientEvent *)self pgModelInferenceContext];
    v31 = [v4 pgModelInferenceContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PGSchemaPGClientEvent *)self pgOverridesRequestContext];
  unint64_t v7 = [v4 pgOverridesRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(PGSchemaPGClientEvent *)self pgOverridesRequestContext];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(PGSchemaPGClientEvent *)self pgOverridesRequestContext];
    v36 = [v4 pgOverridesRequestContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PGSchemaPGClientEvent *)self pgPrescribedPlanRequestContext];
  unint64_t v7 = [v4 pgPrescribedPlanRequestContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v38 = [(PGSchemaPGClientEvent *)self pgPrescribedPlanRequestContext];
    if (!v38)
    {

LABEL_41:
      BOOL v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    v40 = [(PGSchemaPGClientEvent *)self pgPrescribedPlanRequestContext];
    v41 = [v4 pgPrescribedPlanRequestContext];
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
  id v4 = [(PGSchemaPGClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(PGSchemaPGClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PGSchemaPGClientEvent *)self pgRequestContext];

  if (v6)
  {
    unint64_t v7 = [(PGSchemaPGClientEvent *)self pgRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PGSchemaPGClientEvent *)self pgPromptTier1];

  if (v8)
  {
    int v9 = [(PGSchemaPGClientEvent *)self pgPromptTier1];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(PGSchemaPGClientEvent *)self pgPromptResponseTier1];

  if (v10)
  {
    int v11 = [(PGSchemaPGClientEvent *)self pgPromptResponseTier1];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(PGSchemaPGClientEvent *)self pgModelInferenceContext];

  if (v12)
  {
    uint64_t v13 = [(PGSchemaPGClientEvent *)self pgModelInferenceContext];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(PGSchemaPGClientEvent *)self pgOverridesRequestContext];

  if (v14)
  {
    uint64_t v15 = [(PGSchemaPGClientEvent *)self pgOverridesRequestContext];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(PGSchemaPGClientEvent *)self pgPrescribedPlanRequestContext];

  if (v16)
  {
    int v17 = [(PGSchemaPGClientEvent *)self pgPrescribedPlanRequestContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PGSchemaPGClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deletePgPrescribedPlanRequestContext
{
  if (self->_whichEvent_Type == 301)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pgPrescribedPlanRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PGSchemaPGPrescribedPlanRequestContext)pgPrescribedPlanRequestContext
{
  if (self->_whichEvent_Type == 301) {
    v2 = self->_pgPrescribedPlanRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPgPrescribedPlanRequestContext:(id)a3
{
  id v4 = (PGSchemaPGPrescribedPlanRequestContext *)a3;
  pgRequestContext = self->_pgRequestContext;
  self->_pgRequestContext = 0;

  pgPromptTier1 = self->_pgPromptTier1;
  self->_pgPromptTier1 = 0;

  pgPromptResponseTier1 = self->_pgPromptResponseTier1;
  self->_pgPromptResponseTier1 = 0;

  pgModelInferenceContext = self->_pgModelInferenceContext;
  self->_pgModelInferenceContext = 0;

  pgOverridesRequestContext = self->_pgOverridesRequestContext;
  self->_pgOverridesRequestContext = 0;

  unint64_t v10 = 301;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  pgPrescribedPlanRequestContext = self->_pgPrescribedPlanRequestContext;
  self->_pgPrescribedPlanRequestContext = v4;
}

- (void)deletePgOverridesRequestContext
{
  if (self->_whichEvent_Type == 201)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pgOverridesRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PGSchemaPGOverridesRequestContext)pgOverridesRequestContext
{
  if (self->_whichEvent_Type == 201) {
    v2 = self->_pgOverridesRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPgOverridesRequestContext:(id)a3
{
  id v4 = (PGSchemaPGOverridesRequestContext *)a3;
  pgRequestContext = self->_pgRequestContext;
  self->_pgRequestContext = 0;

  pgPromptTier1 = self->_pgPromptTier1;
  self->_pgPromptTier1 = 0;

  pgPromptResponseTier1 = self->_pgPromptResponseTier1;
  self->_pgPromptResponseTier1 = 0;

  pgModelInferenceContext = self->_pgModelInferenceContext;
  self->_pgModelInferenceContext = 0;

  pgPrescribedPlanRequestContext = self->_pgPrescribedPlanRequestContext;
  self->_pgPrescribedPlanRequestContext = 0;

  unint64_t v10 = 201;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  pgOverridesRequestContext = self->_pgOverridesRequestContext;
  self->_pgOverridesRequestContext = v4;
}

- (void)deletePgModelInferenceContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pgModelInferenceContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PGSchemaPGModelInferenceContext)pgModelInferenceContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_pgModelInferenceContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPgModelInferenceContext:(id)a3
{
  id v4 = (PGSchemaPGModelInferenceContext *)a3;
  pgRequestContext = self->_pgRequestContext;
  self->_pgRequestContext = 0;

  pgPromptTier1 = self->_pgPromptTier1;
  self->_pgPromptTier1 = 0;

  pgPromptResponseTier1 = self->_pgPromptResponseTier1;
  self->_pgPromptResponseTier1 = 0;

  pgOverridesRequestContext = self->_pgOverridesRequestContext;
  self->_pgOverridesRequestContext = 0;

  pgPrescribedPlanRequestContext = self->_pgPrescribedPlanRequestContext;
  self->_pgPrescribedPlanRequestContext = 0;

  unint64_t v10 = 104;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  pgModelInferenceContext = self->_pgModelInferenceContext;
  self->_pgModelInferenceContext = v4;
}

- (void)deletePgPromptResponseTier1
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pgPromptResponseTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PGSchemaPGPromptResponseTier1)pgPromptResponseTier1
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_pgPromptResponseTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPgPromptResponseTier1:(id)a3
{
  id v4 = (PGSchemaPGPromptResponseTier1 *)a3;
  pgRequestContext = self->_pgRequestContext;
  self->_pgRequestContext = 0;

  pgPromptTier1 = self->_pgPromptTier1;
  self->_pgPromptTier1 = 0;

  pgModelInferenceContext = self->_pgModelInferenceContext;
  self->_pgModelInferenceContext = 0;

  pgOverridesRequestContext = self->_pgOverridesRequestContext;
  self->_pgOverridesRequestContext = 0;

  pgPrescribedPlanRequestContext = self->_pgPrescribedPlanRequestContext;
  self->_pgPrescribedPlanRequestContext = 0;

  unint64_t v10 = 103;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  pgPromptResponseTier1 = self->_pgPromptResponseTier1;
  self->_pgPromptResponseTier1 = v4;
}

- (void)deletePgPromptTier1
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pgPromptTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PGSchemaPGPromptTier1)pgPromptTier1
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_pgPromptTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPgPromptTier1:(id)a3
{
  id v4 = (PGSchemaPGPromptTier1 *)a3;
  pgRequestContext = self->_pgRequestContext;
  self->_pgRequestContext = 0;

  pgPromptResponseTier1 = self->_pgPromptResponseTier1;
  self->_pgPromptResponseTier1 = 0;

  pgModelInferenceContext = self->_pgModelInferenceContext;
  self->_pgModelInferenceContext = 0;

  pgOverridesRequestContext = self->_pgOverridesRequestContext;
  self->_pgOverridesRequestContext = 0;

  pgPrescribedPlanRequestContext = self->_pgPrescribedPlanRequestContext;
  self->_pgPrescribedPlanRequestContext = 0;

  unint64_t v10 = 102;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  pgPromptTier1 = self->_pgPromptTier1;
  self->_pgPromptTier1 = v4;
}

- (void)deletePgRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pgRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PGSchemaPGRequestContext)pgRequestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_pgRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPgRequestContext:(id)a3
{
  id v4 = (PGSchemaPGRequestContext *)a3;
  pgPromptTier1 = self->_pgPromptTier1;
  self->_pgPromptTier1 = 0;

  pgPromptResponseTier1 = self->_pgPromptResponseTier1;
  self->_pgPromptResponseTier1 = 0;

  pgModelInferenceContext = self->_pgModelInferenceContext;
  self->_pgModelInferenceContext = 0;

  pgOverridesRequestContext = self->_pgOverridesRequestContext;
  self->_pgOverridesRequestContext = 0;

  pgPrescribedPlanRequestContext = self->_pgPrescribedPlanRequestContext;
  self->_pgPrescribedPlanRequestContext = 0;

  unint64_t v10 = 101;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  pgRequestContext = self->_pgRequestContext;
  self->_pgRequestContext = v4;
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
  unint64_t v2 = [(PGSchemaPGClientEvent *)self whichEvent_Type] - 101;
  id result = @"com.apple.aiml.siri.pg.PGClientEvent.PGRequestContext";
  switch(v2)
  {
    case 0uLL:
      return result;
    case 1uLL:
      id result = @"com.apple.aiml.siri.pg.PGClientEvent.PGPromptTier1";
      break;
    case 2uLL:
      id result = @"com.apple.aiml.siri.pg.PGClientEvent.PGPromptResponseTier1";
      break;
    case 3uLL:
      id result = @"com.apple.aiml.siri.pg.PGClientEvent.PGModelInferenceContext";
      break;
    default:
      id v4 = @"com.apple.aiml.siri.pg.PGClientEvent.PGPrescribedPlanRequestContext";
      if (@"com.apple.aiml.siri.pg.PGClientEvent.PGRequestContext" != (__CFString *)301) {
        id v4 = @"com.apple.aiml.siri.pg.PGClientEvent";
      }
      if (@"com.apple.aiml.siri.pg.PGClientEvent.PGRequestContext" == (__CFString *)201) {
        id result = @"com.apple.aiml.siri.pg.PGClientEvent.PGOverridesRequestContext";
      }
      else {
        id result = v4;
      }
      break;
  }
  return result;
}

- (int)getAnyEventType
{
  return 96;
}

@end