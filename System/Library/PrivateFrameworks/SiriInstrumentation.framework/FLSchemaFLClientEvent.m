@interface FLSchemaFLClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasDonationContext;
- (BOOL)hasEvaluationContext;
- (BOOL)hasEventMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLSchemaFLActionEvaluationContext)evaluationContext;
- (FLSchemaFLClientEvent)initWithDictionary:(id)a3;
- (FLSchemaFLClientEvent)initWithJSON:(id)a3;
- (FLSchemaFLClientEventMetadata)eventMetadata;
- (FLSchemaFLInteractionDonationContext)donationContext;
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
- (void)deleteDonationContext;
- (void)deleteEvaluationContext;
- (void)deleteEventMetadata;
- (void)setDonationContext:(id)a3;
- (void)setEvaluationContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasDonationContext:(BOOL)a3;
- (void)setHasEvaluationContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLSchemaFLClientEvent

- (int)componentName
{
  v2 = [(FLSchemaFLClientEvent *)self eventMetadata];
  v3 = [v2 flId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 54;
      }
      else {
        LODWORD(v4) = 0;
      }
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

- (id)getComponentId
{
  v2 = [(FLSchemaFLClientEvent *)self eventMetadata];
  v3 = [v2 flId];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = [v3 value];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [v3 value];
  uint64_t v6 = [v5 length];

  if (v6) {
    id v4 = v3;
  }
  else {
LABEL_5:
  }
    id v4 = 0;
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 1;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FLSchemaFLClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(FLSchemaFLClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLSchemaFLClientEvent *)self deleteEventMetadata];
  }
  v9 = [(FLSchemaFLClientEvent *)self evaluationContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLSchemaFLClientEvent *)self deleteEvaluationContext];
  }
  v12 = [(FLSchemaFLClientEvent *)self donationContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(FLSchemaFLClientEvent *)self deleteDonationContext];
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
  unint64_t v3 = [(FLSchemaFLClientEvent *)self whichEvent_Type];
  if (v3 == 101)
  {
    id v4 = &OBJC_IVAR___FLSchemaFLClientEvent__evaluationContext;
    goto LABEL_5;
  }
  if (v3 == 102)
  {
    id v4 = &OBJC_IVAR___FLSchemaFLClientEvent__donationContext;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  unint64_t v3 = @"donationContext";
  if (a3 != 102) {
    unint64_t v3 = 0;
  }
  if (a3 == 101) {
    return @"evaluationContext";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationContext, 0);
  objc_storeStrong((id *)&self->_evaluationContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasDonationContext:(BOOL)a3
{
  self->_hasDonationContext = a3;
}

- (BOOL)hasDonationContext
{
  return self->_hasDonationContext;
}

- (void)setHasEvaluationContext:(BOOL)a3
{
  self->_hasEvaluationContext = a3;
}

- (BOOL)hasEvaluationContext
{
  return self->_hasEvaluationContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (FLSchemaFLClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (FLSchemaFLClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FLSchemaFLClientEvent;
  id v5 = [(FLSchemaFLClientEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLSchemaFLClientEventMetadata alloc] initWithDictionary:v6];
      [(FLSchemaFLClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"evaluationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[FLSchemaFLActionEvaluationContext alloc] initWithDictionary:v8];
      [(FLSchemaFLClientEvent *)v5 setEvaluationContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"donationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[FLSchemaFLInteractionDonationContext alloc] initWithDictionary:v10];
      [(FLSchemaFLClientEvent *)v5 setDonationContext:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (FLSchemaFLClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(FLSchemaFLClientEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLSchemaFLClientEvent *)self dictionaryRepresentation];
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
  if (self->_donationContext)
  {
    id v4 = [(FLSchemaFLClientEvent *)self donationContext];
    id v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"donationContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"donationContext"];
    }
  }
  if (self->_evaluationContext)
  {
    uint64_t v7 = [(FLSchemaFLClientEvent *)self evaluationContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"evaluationContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"evaluationContext"];
    }
  }
  if (self->_eventMetadata)
  {
    v10 = [(FLSchemaFLClientEvent *)self eventMetadata];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"eventMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLSchemaFLClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(FLSchemaFLActionEvaluationContext *)self->_evaluationContext hash] ^ v3;
  return v4 ^ [(FLSchemaFLInteractionDonationContext *)self->_donationContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_18;
  }
  uint64_t v6 = [(FLSchemaFLClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(FLSchemaFLClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(FLSchemaFLClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(FLSchemaFLClientEvent *)self evaluationContext];
  uint64_t v7 = [v4 evaluationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(FLSchemaFLClientEvent *)self evaluationContext];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(FLSchemaFLClientEvent *)self evaluationContext];
    objc_super v16 = [v4 evaluationContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(FLSchemaFLClientEvent *)self donationContext];
  uint64_t v7 = [v4 donationContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(FLSchemaFLClientEvent *)self donationContext];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(FLSchemaFLClientEvent *)self donationContext];
    v21 = [v4 donationContext];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(FLSchemaFLClientEvent *)self eventMetadata];

  if (v4)
  {
    id v5 = [(FLSchemaFLClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(FLSchemaFLClientEvent *)self evaluationContext];

  if (v6)
  {
    uint64_t v7 = [(FLSchemaFLClientEvent *)self evaluationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(FLSchemaFLClientEvent *)self donationContext];

  if (v8)
  {
    v9 = [(FLSchemaFLClientEvent *)self donationContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteDonationContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_donationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLSchemaFLInteractionDonationContext)donationContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_donationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDonationContext:(id)a3
{
  id v4 = (FLSchemaFLInteractionDonationContext *)a3;
  evaluationContext = self->_evaluationContext;
  self->_evaluationContext = 0;

  unint64_t v6 = 102;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  donationContext = self->_donationContext;
  self->_donationContext = v4;
}

- (void)deleteEvaluationContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_evaluationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLSchemaFLActionEvaluationContext)evaluationContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_evaluationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEvaluationContext:(id)a3
{
  id v4 = (FLSchemaFLActionEvaluationContext *)a3;
  donationContext = self->_donationContext;
  self->_donationContext = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  evaluationContext = self->_evaluationContext;
  self->_evaluationContext = v4;
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
  unint64_t v2 = [(FLSchemaFLClientEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.siri.fl.FLClientEvent";
  if (v2 == 102) {
    unint64_t v3 = @"com.apple.aiml.siri.fl.FLClientEvent.FLInteractionDonationContext";
  }
  if (v2 == 101) {
    return @"com.apple.aiml.siri.fl.FLClientEvent.FLActionEvaluationContext";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 101;
}

@end