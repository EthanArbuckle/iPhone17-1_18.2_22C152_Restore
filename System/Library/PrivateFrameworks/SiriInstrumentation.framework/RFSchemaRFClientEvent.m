@interface RFSchemaRFClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasComponentShown;
- (BOOL)hasEventMetadata;
- (BOOL)hasInteractionPerformed;
- (BOOL)hasPatternExecuted;
- (BOOL)hasRfGradingDialogReportedTier1;
- (BOOL)hasSnippetRenderingContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RFSchemaRFClientEvent)initWithDictionary:(id)a3;
- (RFSchemaRFClientEvent)initWithJSON:(id)a3;
- (RFSchemaRFClientEventMetadata)eventMetadata;
- (RFSchemaRFComponentShown)componentShown;
- (RFSchemaRFGradingDialogReportedTier1)rfGradingDialogReportedTier1;
- (RFSchemaRFInteractionPerformed)interactionPerformed;
- (RFSchemaRFPatternExecuted)patternExecuted;
- (RFSchemaRFSnippetRenderingContext)snippetRenderingContext;
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
- (void)deleteComponentShown;
- (void)deleteEventMetadata;
- (void)deleteInteractionPerformed;
- (void)deletePatternExecuted;
- (void)deleteRfGradingDialogReportedTier1;
- (void)deleteSnippetRenderingContext;
- (void)setComponentShown:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasComponentShown:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasInteractionPerformed:(BOOL)a3;
- (void)setHasPatternExecuted:(BOOL)a3;
- (void)setHasRfGradingDialogReportedTier1:(BOOL)a3;
- (void)setHasSnippetRenderingContext:(BOOL)a3;
- (void)setInteractionPerformed:(id)a3;
- (void)setPatternExecuted:(id)a3;
- (void)setRfGradingDialogReportedTier1:(id)a3;
- (void)setSnippetRenderingContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RFSchemaRFClientEvent

- (int)componentName
{
  v3 = [(RFSchemaRFClientEvent *)self eventMetadata];
  v4 = [v3 turnId];

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
    LODWORD(v9) = 2;
  }
  else
  {
LABEL_5:
    v10 = [(RFSchemaRFClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (!v11) {
      goto LABEL_9;
    }
    uint64_t v12 = [v11 value];
    if (!v12) {
      goto LABEL_9;
    }
    v13 = (void *)v12;
    v14 = [v11 value];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      v16 = [(RFSchemaRFClientEvent *)self eventMetadata];
      v4 = [v16 subRequestId];

      if (v4)
      {
        v9 = [v4 value];
        if (v9)
        {
          v17 = [v4 value];
          uint64_t v18 = [v17 length];

          if (v18) {
            LODWORD(v9) = 43;
          }
          else {
            LODWORD(v9) = 0;
          }
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
}

- (id)getComponentId
{
  v3 = [(RFSchemaRFClientEvent *)self eventMetadata];
  v4 = [v3 turnId];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_11;
      }
    }
  }
  v9 = [(RFSchemaRFClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    uint64_t v11 = [v10 value];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      v13 = [v10 value];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        v4 = v10;
LABEL_11:
        id v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  uint64_t v15 = [(RFSchemaRFClientEvent *)self eventMetadata];
  v4 = [v15 subRequestId];

  if (v4)
  {
    id v16 = [v4 value];
    if (!v16) {
      goto LABEL_13;
    }
    v17 = [v4 value];
    uint64_t v18 = [v17 length];

    if (v18) {
      goto LABEL_11;
    }
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RFSchemaRFClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v25 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(RFSchemaRFClientEvent *)self deleteRfGradingDialogReportedTier1];
  }
  if ([v4 isConditionSet:4]) {
    [(RFSchemaRFClientEvent *)self deleteRfGradingDialogReportedTier1];
  }
  if ([v4 isConditionSet:5]) {
    [(RFSchemaRFClientEvent *)self deleteRfGradingDialogReportedTier1];
  }
  if ([v4 isConditionSet:6]) {
    [(RFSchemaRFClientEvent *)self deleteRfGradingDialogReportedTier1];
  }
  if ([v4 isConditionSet:7]) {
    [(RFSchemaRFClientEvent *)self deleteRfGradingDialogReportedTier1];
  }
  v6 = [(RFSchemaRFClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RFSchemaRFClientEvent *)self deleteEventMetadata];
  }
  v9 = [(RFSchemaRFClientEvent *)self patternExecuted];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(RFSchemaRFClientEvent *)self deletePatternExecuted];
  }
  uint64_t v12 = [(RFSchemaRFClientEvent *)self interactionPerformed];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(RFSchemaRFClientEvent *)self deleteInteractionPerformed];
  }
  uint64_t v15 = [(RFSchemaRFClientEvent *)self componentShown];
  id v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(RFSchemaRFClientEvent *)self deleteComponentShown];
  }
  uint64_t v18 = [(RFSchemaRFClientEvent *)self snippetRenderingContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(RFSchemaRFClientEvent *)self deleteSnippetRenderingContext];
  }
  v21 = [(RFSchemaRFClientEvent *)self rfGradingDialogReportedTier1];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(RFSchemaRFClientEvent *)self deleteRfGradingDialogReportedTier1];
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
  unint64_t v3 = [(RFSchemaRFClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 4) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABC78[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4) {
    return 0;
  }
  else {
    return off_1E5EABCA0[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rfGradingDialogReportedTier1, 0);
  objc_storeStrong((id *)&self->_snippetRenderingContext, 0);
  objc_storeStrong((id *)&self->_componentShown, 0);
  objc_storeStrong((id *)&self->_interactionPerformed, 0);
  objc_storeStrong((id *)&self->_patternExecuted, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasRfGradingDialogReportedTier1:(BOOL)a3
{
  self->_hasRfGradingDialogReportedTier1 = a3;
}

- (BOOL)hasRfGradingDialogReportedTier1
{
  return self->_hasRfGradingDialogReportedTier1;
}

- (void)setHasSnippetRenderingContext:(BOOL)a3
{
  self->_hasSnippetRenderingContext = a3;
}

- (BOOL)hasSnippetRenderingContext
{
  return self->_hasSnippetRenderingContext;
}

- (void)setHasComponentShown:(BOOL)a3
{
  self->_hasComponentShown = a3;
}

- (BOOL)hasComponentShown
{
  return self->_hasComponentShown;
}

- (void)setHasInteractionPerformed:(BOOL)a3
{
  self->_hasInteractionPerformed = a3;
}

- (BOOL)hasInteractionPerformed
{
  return self->_hasInteractionPerformed;
}

- (void)setHasPatternExecuted:(BOOL)a3
{
  self->_hasPatternExecuted = a3;
}

- (BOOL)hasPatternExecuted
{
  return self->_hasPatternExecuted;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (RFSchemaRFClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RFSchemaRFClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFSchemaRFClientEvent;
  uint64_t v5 = [(RFSchemaRFClientEvent *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[RFSchemaRFClientEventMetadata alloc] initWithDictionary:v6];
      [(RFSchemaRFClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"patternExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[RFSchemaRFPatternExecuted alloc] initWithDictionary:v8];
      [(RFSchemaRFClientEvent *)v5 setPatternExecuted:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"interactionPerformed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[RFSchemaRFInteractionPerformed alloc] initWithDictionary:v10];
      [(RFSchemaRFClientEvent *)v5 setInteractionPerformed:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"componentShown"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[RFSchemaRFComponentShown alloc] initWithDictionary:v12];
      [(RFSchemaRFClientEvent *)v5 setComponentShown:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"snippetRenderingContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [[RFSchemaRFSnippetRenderingContext alloc] initWithDictionary:v14];
      [(RFSchemaRFClientEvent *)v5 setSnippetRenderingContext:v15];
    }
    id v16 = [v4 objectForKeyedSubscript:@"rfGradingDialogReportedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[RFSchemaRFGradingDialogReportedTier1 alloc] initWithDictionary:v16];
      [(RFSchemaRFClientEvent *)v5 setRfGradingDialogReportedTier1:v17];
    }
    uint64_t v18 = v5;
  }
  return v5;
}

- (RFSchemaRFClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(RFSchemaRFClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RFSchemaRFClientEvent *)self dictionaryRepresentation];
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
  if (self->_componentShown)
  {
    id v4 = [(RFSchemaRFClientEvent *)self componentShown];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"componentShown"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"componentShown"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v7 = [(RFSchemaRFClientEvent *)self eventMetadata];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_interactionPerformed)
  {
    v10 = [(RFSchemaRFClientEvent *)self interactionPerformed];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"interactionPerformed"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"interactionPerformed"];
    }
  }
  if (self->_patternExecuted)
  {
    v13 = [(RFSchemaRFClientEvent *)self patternExecuted];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"patternExecuted"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"patternExecuted"];
    }
  }
  if (self->_rfGradingDialogReportedTier1)
  {
    id v16 = [(RFSchemaRFClientEvent *)self rfGradingDialogReportedTier1];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"rfGradingDialogReportedTier1"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"rfGradingDialogReportedTier1"];
    }
  }
  if (self->_snippetRenderingContext)
  {
    v19 = [(RFSchemaRFClientEvent *)self snippetRenderingContext];
    objc_super v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"snippetRenderingContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"snippetRenderingContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RFSchemaRFClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(RFSchemaRFPatternExecuted *)self->_patternExecuted hash] ^ v3;
  unint64_t v5 = [(RFSchemaRFInteractionPerformed *)self->_interactionPerformed hash];
  unint64_t v6 = v4 ^ v5 ^ [(RFSchemaRFComponentShown *)self->_componentShown hash];
  unint64_t v7 = [(RFSchemaRFSnippetRenderingContext *)self->_snippetRenderingContext hash];
  return v6 ^ v7 ^ [(RFSchemaRFGradingDialogReportedTier1 *)self->_rfGradingDialogReportedTier1 hash];
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
  unint64_t v6 = [(RFSchemaRFClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v8 = [(RFSchemaRFClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RFSchemaRFClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RFSchemaRFClientEvent *)self patternExecuted];
  unint64_t v7 = [v4 patternExecuted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v13 = [(RFSchemaRFClientEvent *)self patternExecuted];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(RFSchemaRFClientEvent *)self patternExecuted];
    id v16 = [v4 patternExecuted];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RFSchemaRFClientEvent *)self interactionPerformed];
  unint64_t v7 = [v4 interactionPerformed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v18 = [(RFSchemaRFClientEvent *)self interactionPerformed];
  if (v18)
  {
    v19 = (void *)v18;
    objc_super v20 = [(RFSchemaRFClientEvent *)self interactionPerformed];
    v21 = [v4 interactionPerformed];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RFSchemaRFClientEvent *)self componentShown];
  unint64_t v7 = [v4 componentShown];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v23 = [(RFSchemaRFClientEvent *)self componentShown];
  if (v23)
  {
    v24 = (void *)v23;
    objc_super v25 = [(RFSchemaRFClientEvent *)self componentShown];
    v26 = [v4 componentShown];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RFSchemaRFClientEvent *)self snippetRenderingContext];
  unint64_t v7 = [v4 snippetRenderingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v28 = [(RFSchemaRFClientEvent *)self snippetRenderingContext];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(RFSchemaRFClientEvent *)self snippetRenderingContext];
    v31 = [v4 snippetRenderingContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RFSchemaRFClientEvent *)self rfGradingDialogReportedTier1];
  unint64_t v7 = [v4 rfGradingDialogReportedTier1];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v33 = [(RFSchemaRFClientEvent *)self rfGradingDialogReportedTier1];
    if (!v33)
    {

LABEL_36:
      BOOL v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    v35 = [(RFSchemaRFClientEvent *)self rfGradingDialogReportedTier1];
    v36 = [v4 rfGradingDialogReportedTier1];
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
  id v4 = [(RFSchemaRFClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(RFSchemaRFClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(RFSchemaRFClientEvent *)self patternExecuted];

  if (v6)
  {
    unint64_t v7 = [(RFSchemaRFClientEvent *)self patternExecuted];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(RFSchemaRFClientEvent *)self interactionPerformed];

  if (v8)
  {
    v9 = [(RFSchemaRFClientEvent *)self interactionPerformed];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(RFSchemaRFClientEvent *)self componentShown];

  if (v10)
  {
    int v11 = [(RFSchemaRFClientEvent *)self componentShown];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(RFSchemaRFClientEvent *)self snippetRenderingContext];

  if (v12)
  {
    uint64_t v13 = [(RFSchemaRFClientEvent *)self snippetRenderingContext];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(RFSchemaRFClientEvent *)self rfGradingDialogReportedTier1];

  if (v14)
  {
    uint64_t v15 = [(RFSchemaRFClientEvent *)self rfGradingDialogReportedTier1];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteRfGradingDialogReportedTier1
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rfGradingDialogReportedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RFSchemaRFGradingDialogReportedTier1)rfGradingDialogReportedTier1
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_rfGradingDialogReportedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRfGradingDialogReportedTier1:(id)a3
{
  id v4 = (RFSchemaRFGradingDialogReportedTier1 *)a3;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = 0;

  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = 0;

  componentShown = self->_componentShown;
  self->_componentShown = 0;

  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = 0;

  unint64_t v9 = 105;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = v4;
}

- (void)deleteSnippetRenderingContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_snippetRenderingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RFSchemaRFSnippetRenderingContext)snippetRenderingContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_snippetRenderingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSnippetRenderingContext:(id)a3
{
  id v4 = (RFSchemaRFSnippetRenderingContext *)a3;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = 0;

  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = 0;

  componentShown = self->_componentShown;
  self->_componentShown = 0;

  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = 0;

  unint64_t v9 = 104;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = v4;
}

- (void)deleteComponentShown
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_componentShown = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RFSchemaRFComponentShown)componentShown
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_componentShown;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setComponentShown:(id)a3
{
  id v4 = (RFSchemaRFComponentShown *)a3;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = 0;

  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = 0;

  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = 0;

  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = 0;

  unint64_t v9 = 103;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  componentShown = self->_componentShown;
  self->_componentShown = v4;
}

- (void)deleteInteractionPerformed
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_interactionPerformed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RFSchemaRFInteractionPerformed)interactionPerformed
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_interactionPerformed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInteractionPerformed:(id)a3
{
  id v4 = (RFSchemaRFInteractionPerformed *)a3;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = 0;

  componentShown = self->_componentShown;
  self->_componentShown = 0;

  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = 0;

  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = 0;

  unint64_t v9 = 102;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = v4;
}

- (void)deletePatternExecuted
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_patternExecuted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RFSchemaRFPatternExecuted)patternExecuted
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_patternExecuted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPatternExecuted:(id)a3
{
  id v4 = (RFSchemaRFPatternExecuted *)a3;
  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = 0;

  componentShown = self->_componentShown;
  self->_componentShown = 0;

  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = 0;

  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = 0;

  unint64_t v9 = 101;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = v4;
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
  unint64_t v2 = [(RFSchemaRFClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 4) {
    return @"com.apple.aiml.siri.rf.RFClientEvent";
  }
  else {
    return off_1E5EB43F0[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 54;
}

@end