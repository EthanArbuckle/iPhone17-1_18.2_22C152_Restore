@interface RTSSchemaRTSClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasRtsFalseRejectDetected;
- (BOOL)hasRtsFirstPassPolicyTriggered;
- (BOOL)hasRtsMotionData;
- (BOOL)hasRtsSecondPassPolicyDecisionMade;
- (BOOL)hasRtsTriggered;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RTSSchemaRTSClientEvent)initWithDictionary:(id)a3;
- (RTSSchemaRTSClientEvent)initWithJSON:(id)a3;
- (RTSSchemaRTSClientEventMetadata)eventMetadata;
- (RTSSchemaRTSFalseRejectDetected)rtsFalseRejectDetected;
- (RTSSchemaRTSFirstPassPolicyTriggered)rtsFirstPassPolicyTriggered;
- (RTSSchemaRTSMotionData)rtsMotionData;
- (RTSSchemaRTSSecondPassPolicyDecisionMade)rtsSecondPassPolicyDecisionMade;
- (RTSSchemaRTSTriggered)rtsTriggered;
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
- (void)deleteRtsFalseRejectDetected;
- (void)deleteRtsFirstPassPolicyTriggered;
- (void)deleteRtsMotionData;
- (void)deleteRtsSecondPassPolicyDecisionMade;
- (void)deleteRtsTriggered;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasRtsFalseRejectDetected:(BOOL)a3;
- (void)setHasRtsFirstPassPolicyTriggered:(BOOL)a3;
- (void)setHasRtsMotionData:(BOOL)a3;
- (void)setHasRtsSecondPassPolicyDecisionMade:(BOOL)a3;
- (void)setHasRtsTriggered:(BOOL)a3;
- (void)setRtsFalseRejectDetected:(id)a3;
- (void)setRtsFirstPassPolicyTriggered:(id)a3;
- (void)setRtsMotionData:(id)a3;
- (void)setRtsSecondPassPolicyDecisionMade:(id)a3;
- (void)setRtsTriggered:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RTSSchemaRTSClientEvent

- (int)componentName
{
  v2 = [(RTSSchemaRTSClientEvent *)self eventMetadata];
  v3 = [v2 rtsSessionId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 41;
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
  v2 = [(RTSSchemaRTSClientEvent *)self eventMetadata];
  v3 = [v2 rtsSessionId];

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
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RTSSchemaRTSClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v25 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(RTSSchemaRTSClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RTSSchemaRTSClientEvent *)self deleteEventMetadata];
  }
  v9 = [(RTSSchemaRTSClientEvent *)self rtsFalseRejectDetected];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(RTSSchemaRTSClientEvent *)self deleteRtsFalseRejectDetected];
  }
  v12 = [(RTSSchemaRTSClientEvent *)self rtsTriggered];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(RTSSchemaRTSClientEvent *)self deleteRtsTriggered];
  }
  v15 = [(RTSSchemaRTSClientEvent *)self rtsFirstPassPolicyTriggered];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(RTSSchemaRTSClientEvent *)self deleteRtsFirstPassPolicyTriggered];
  }
  v18 = [(RTSSchemaRTSClientEvent *)self rtsSecondPassPolicyDecisionMade];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(RTSSchemaRTSClientEvent *)self deleteRtsSecondPassPolicyDecisionMade];
  }
  v21 = [(RTSSchemaRTSClientEvent *)self rtsMotionData];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(RTSSchemaRTSClientEvent *)self deleteRtsMotionData];
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
  unint64_t v3 = [(RTSSchemaRTSClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 4) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABE18[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4) {
    return 0;
  }
  else {
    return off_1E5EABE40[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtsMotionData, 0);
  objc_storeStrong((id *)&self->_rtsSecondPassPolicyDecisionMade, 0);
  objc_storeStrong((id *)&self->_rtsFirstPassPolicyTriggered, 0);
  objc_storeStrong((id *)&self->_rtsTriggered, 0);
  objc_storeStrong((id *)&self->_rtsFalseRejectDetected, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasRtsMotionData:(BOOL)a3
{
  self->_hasRtsMotionData = a3;
}

- (BOOL)hasRtsMotionData
{
  return self->_hasRtsMotionData;
}

- (void)setHasRtsSecondPassPolicyDecisionMade:(BOOL)a3
{
  self->_hasRtsSecondPassPolicyDecisionMade = a3;
}

- (BOOL)hasRtsSecondPassPolicyDecisionMade
{
  return self->_hasRtsSecondPassPolicyDecisionMade;
}

- (void)setHasRtsFirstPassPolicyTriggered:(BOOL)a3
{
  self->_hasRtsFirstPassPolicyTriggered = a3;
}

- (BOOL)hasRtsFirstPassPolicyTriggered
{
  return self->_hasRtsFirstPassPolicyTriggered;
}

- (void)setHasRtsTriggered:(BOOL)a3
{
  self->_hasRtsTriggered = a3;
}

- (BOOL)hasRtsTriggered
{
  return self->_hasRtsTriggered;
}

- (void)setHasRtsFalseRejectDetected:(BOOL)a3
{
  self->_hasRtsFalseRejectDetected = a3;
}

- (BOOL)hasRtsFalseRejectDetected
{
  return self->_hasRtsFalseRejectDetected;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (RTSSchemaRTSClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RTSSchemaRTSClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RTSSchemaRTSClientEvent;
  v5 = [(RTSSchemaRTSClientEvent *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[RTSSchemaRTSClientEventMetadata alloc] initWithDictionary:v6];
      [(RTSSchemaRTSClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"rtsFalseRejectDetected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[RTSSchemaRTSFalseRejectDetected alloc] initWithDictionary:v8];
      [(RTSSchemaRTSClientEvent *)v5 setRtsFalseRejectDetected:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"rtsTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[RTSSchemaRTSTriggered alloc] initWithDictionary:v10];
      [(RTSSchemaRTSClientEvent *)v5 setRtsTriggered:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"rtsFirstPassPolicyTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[RTSSchemaRTSFirstPassPolicyTriggered alloc] initWithDictionary:v12];
      [(RTSSchemaRTSClientEvent *)v5 setRtsFirstPassPolicyTriggered:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"rtsSecondPassPolicyDecisionMade"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[RTSSchemaRTSSecondPassPolicyDecisionMade alloc] initWithDictionary:v14];
      [(RTSSchemaRTSClientEvent *)v5 setRtsSecondPassPolicyDecisionMade:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"rtsMotionData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[RTSSchemaRTSMotionData alloc] initWithDictionary:v16];
      [(RTSSchemaRTSClientEvent *)v5 setRtsMotionData:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (RTSSchemaRTSClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RTSSchemaRTSClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RTSSchemaRTSClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(RTSSchemaRTSClientEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_rtsFalseRejectDetected)
  {
    uint64_t v7 = [(RTSSchemaRTSClientEvent *)self rtsFalseRejectDetected];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"rtsFalseRejectDetected"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"rtsFalseRejectDetected"];
    }
  }
  if (self->_rtsFirstPassPolicyTriggered)
  {
    v10 = [(RTSSchemaRTSClientEvent *)self rtsFirstPassPolicyTriggered];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"rtsFirstPassPolicyTriggered"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"rtsFirstPassPolicyTriggered"];
    }
  }
  if (self->_rtsMotionData)
  {
    v13 = [(RTSSchemaRTSClientEvent *)self rtsMotionData];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"rtsMotionData"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"rtsMotionData"];
    }
  }
  if (self->_rtsSecondPassPolicyDecisionMade)
  {
    v16 = [(RTSSchemaRTSClientEvent *)self rtsSecondPassPolicyDecisionMade];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"rtsSecondPassPolicyDecisionMade"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"rtsSecondPassPolicyDecisionMade"];
    }
  }
  if (self->_rtsTriggered)
  {
    v19 = [(RTSSchemaRTSClientEvent *)self rtsTriggered];
    objc_super v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"rtsTriggered"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"rtsTriggered"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RTSSchemaRTSClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(RTSSchemaRTSFalseRejectDetected *)self->_rtsFalseRejectDetected hash] ^ v3;
  unint64_t v5 = [(RTSSchemaRTSTriggered *)self->_rtsTriggered hash];
  unint64_t v6 = v4 ^ v5 ^ [(RTSSchemaRTSFirstPassPolicyTriggered *)self->_rtsFirstPassPolicyTriggered hash];
  unint64_t v7 = [(RTSSchemaRTSSecondPassPolicyDecisionMade *)self->_rtsSecondPassPolicyDecisionMade hash];
  return v6 ^ v7 ^ [(RTSSchemaRTSMotionData *)self->_rtsMotionData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_33;
  }
  unint64_t v6 = [(RTSSchemaRTSClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v8 = [(RTSSchemaRTSClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RTSSchemaRTSClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RTSSchemaRTSClientEvent *)self rtsFalseRejectDetected];
  unint64_t v7 = [v4 rtsFalseRejectDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v13 = [(RTSSchemaRTSClientEvent *)self rtsFalseRejectDetected];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(RTSSchemaRTSClientEvent *)self rtsFalseRejectDetected];
    v16 = [v4 rtsFalseRejectDetected];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RTSSchemaRTSClientEvent *)self rtsTriggered];
  unint64_t v7 = [v4 rtsTriggered];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v18 = [(RTSSchemaRTSClientEvent *)self rtsTriggered];
  if (v18)
  {
    v19 = (void *)v18;
    objc_super v20 = [(RTSSchemaRTSClientEvent *)self rtsTriggered];
    v21 = [v4 rtsTriggered];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RTSSchemaRTSClientEvent *)self rtsFirstPassPolicyTriggered];
  unint64_t v7 = [v4 rtsFirstPassPolicyTriggered];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v23 = [(RTSSchemaRTSClientEvent *)self rtsFirstPassPolicyTriggered];
  if (v23)
  {
    v24 = (void *)v23;
    objc_super v25 = [(RTSSchemaRTSClientEvent *)self rtsFirstPassPolicyTriggered];
    v26 = [v4 rtsFirstPassPolicyTriggered];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RTSSchemaRTSClientEvent *)self rtsSecondPassPolicyDecisionMade];
  unint64_t v7 = [v4 rtsSecondPassPolicyDecisionMade];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v28 = [(RTSSchemaRTSClientEvent *)self rtsSecondPassPolicyDecisionMade];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(RTSSchemaRTSClientEvent *)self rtsSecondPassPolicyDecisionMade];
    v31 = [v4 rtsSecondPassPolicyDecisionMade];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RTSSchemaRTSClientEvent *)self rtsMotionData];
  unint64_t v7 = [v4 rtsMotionData];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v33 = [(RTSSchemaRTSClientEvent *)self rtsMotionData];
    if (!v33)
    {

LABEL_36:
      BOOL v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    v35 = [(RTSSchemaRTSClientEvent *)self rtsMotionData];
    v36 = [v4 rtsMotionData];
    char v37 = [v35 isEqual:v36];

    if (v37) {
      goto LABEL_36;
    }
  }
  else
  {
LABEL_32:
  }
LABEL_33:
  BOOL v38 = 0;
LABEL_34:

  return v38;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  id v4 = [(RTSSchemaRTSClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(RTSSchemaRTSClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(RTSSchemaRTSClientEvent *)self rtsFalseRejectDetected];

  if (v6)
  {
    unint64_t v7 = [(RTSSchemaRTSClientEvent *)self rtsFalseRejectDetected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(RTSSchemaRTSClientEvent *)self rtsTriggered];

  if (v8)
  {
    v9 = [(RTSSchemaRTSClientEvent *)self rtsTriggered];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(RTSSchemaRTSClientEvent *)self rtsFirstPassPolicyTriggered];

  if (v10)
  {
    int v11 = [(RTSSchemaRTSClientEvent *)self rtsFirstPassPolicyTriggered];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(RTSSchemaRTSClientEvent *)self rtsSecondPassPolicyDecisionMade];

  if (v12)
  {
    uint64_t v13 = [(RTSSchemaRTSClientEvent *)self rtsSecondPassPolicyDecisionMade];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(RTSSchemaRTSClientEvent *)self rtsMotionData];

  if (v14)
  {
    v15 = [(RTSSchemaRTSClientEvent *)self rtsMotionData];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteRtsMotionData
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rtsMotionData = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RTSSchemaRTSMotionData)rtsMotionData
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_rtsMotionData;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRtsMotionData:(id)a3
{
  id v4 = (RTSSchemaRTSMotionData *)a3;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  unint64_t v9 = 105;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = v4;
}

- (void)deleteRtsSecondPassPolicyDecisionMade
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rtsSecondPassPolicyDecisionMade = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RTSSchemaRTSSecondPassPolicyDecisionMade)rtsSecondPassPolicyDecisionMade
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_rtsSecondPassPolicyDecisionMade;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRtsSecondPassPolicyDecisionMade:(id)a3
{
  id v4 = (RTSSchemaRTSSecondPassPolicyDecisionMade *)a3;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = 0;

  unint64_t v9 = 104;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = v4;
}

- (void)deleteRtsFirstPassPolicyTriggered
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rtsFirstPassPolicyTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RTSSchemaRTSFirstPassPolicyTriggered)rtsFirstPassPolicyTriggered
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_rtsFirstPassPolicyTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRtsFirstPassPolicyTriggered:(id)a3
{
  id v4 = (RTSSchemaRTSFirstPassPolicyTriggered *)a3;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = 0;

  unint64_t v9 = 103;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = v4;
}

- (void)deleteRtsTriggered
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rtsTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RTSSchemaRTSTriggered)rtsTriggered
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_rtsTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRtsTriggered:(id)a3
{
  id v4 = (RTSSchemaRTSTriggered *)a3;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = 0;

  unint64_t v9 = 102;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = v4;
}

- (void)deleteRtsFalseRejectDetected
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rtsFalseRejectDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RTSSchemaRTSFalseRejectDetected)rtsFalseRejectDetected
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_rtsFalseRejectDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRtsFalseRejectDetected:(id)a3
{
  id v4 = (RTSSchemaRTSFalseRejectDetected *)a3;
  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = 0;

  unint64_t v9 = 101;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = v4;
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
  unint64_t v2 = [(RTSSchemaRTSClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 4) {
    return @"com.apple.aiml.siri.rts.RTSClientEvent";
  }
  else {
    return off_1E5EBCDD8[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 80;
}

@end