@interface TTMSchemaTTMClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasTtmNeuralCombinerRequestContext;
- (BOOL)hasTtmOverrideRequestContext;
- (BOOL)hasTtmRequestContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (TTMSchemaTTMClientEvent)initWithDictionary:(id)a3;
- (TTMSchemaTTMClientEvent)initWithJSON:(id)a3;
- (TTMSchemaTTMClientEventMetadata)eventMetadata;
- (TTMSchemaTTMNeuralCombinerRequestContext)ttmNeuralCombinerRequestContext;
- (TTMSchemaTTMOverrideRequestContext)ttmOverrideRequestContext;
- (TTMSchemaTTMRequestContext)ttmRequestContext;
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
- (void)deleteTtmNeuralCombinerRequestContext;
- (void)deleteTtmOverrideRequestContext;
- (void)deleteTtmRequestContext;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasTtmNeuralCombinerRequestContext:(BOOL)a3;
- (void)setHasTtmOverrideRequestContext:(BOOL)a3;
- (void)setHasTtmRequestContext:(BOOL)a3;
- (void)setTtmNeuralCombinerRequestContext:(id)a3;
- (void)setTtmOverrideRequestContext:(id)a3;
- (void)setTtmRequestContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTMSchemaTTMClientEvent

- (int)componentName
{
  v2 = [(TTMSchemaTTMClientEvent *)self eventMetadata];
  v3 = [v2 ttmId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 37;
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
  v2 = [(TTMSchemaTTMClientEvent *)self eventMetadata];
  v3 = [v2 ttmId];

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
  v19.receiver = self;
  v19.super_class = (Class)TTMSchemaTTMClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(TTMSchemaTTMClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(TTMSchemaTTMClientEvent *)self deleteEventMetadata];
  }
  v9 = [(TTMSchemaTTMClientEvent *)self ttmRequestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(TTMSchemaTTMClientEvent *)self deleteTtmRequestContext];
  }
  v12 = [(TTMSchemaTTMClientEvent *)self ttmNeuralCombinerRequestContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(TTMSchemaTTMClientEvent *)self deleteTtmNeuralCombinerRequestContext];
  }
  v15 = [(TTMSchemaTTMClientEvent *)self ttmOverrideRequestContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(TTMSchemaTTMClientEvent *)self deleteTtmOverrideRequestContext];
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
  unint64_t v3 = [(TTMSchemaTTMClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAC108[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2) {
    return 0;
  }
  else {
    return off_1E5EAC120[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttmOverrideRequestContext, 0);
  objc_storeStrong((id *)&self->_ttmNeuralCombinerRequestContext, 0);
  objc_storeStrong((id *)&self->_ttmRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasTtmOverrideRequestContext:(BOOL)a3
{
  self->_hasTtmOverrideRequestContext = a3;
}

- (BOOL)hasTtmOverrideRequestContext
{
  return self->_hasTtmOverrideRequestContext;
}

- (void)setHasTtmNeuralCombinerRequestContext:(BOOL)a3
{
  self->_hasTtmNeuralCombinerRequestContext = a3;
}

- (BOOL)hasTtmNeuralCombinerRequestContext
{
  return self->_hasTtmNeuralCombinerRequestContext;
}

- (void)setHasTtmRequestContext:(BOOL)a3
{
  self->_hasTtmRequestContext = a3;
}

- (BOOL)hasTtmRequestContext
{
  return self->_hasTtmRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (TTMSchemaTTMClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (TTMSchemaTTMClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TTMSchemaTTMClientEvent;
  v5 = [(TTMSchemaTTMClientEvent *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[TTMSchemaTTMClientEventMetadata alloc] initWithDictionary:v6];
      [(TTMSchemaTTMClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ttmRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[TTMSchemaTTMRequestContext alloc] initWithDictionary:v8];
      [(TTMSchemaTTMClientEvent *)v5 setTtmRequestContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ttmNeuralCombinerRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[TTMSchemaTTMNeuralCombinerRequestContext alloc] initWithDictionary:v10];
      [(TTMSchemaTTMClientEvent *)v5 setTtmNeuralCombinerRequestContext:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"ttmOverrideRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[TTMSchemaTTMOverrideRequestContext alloc] initWithDictionary:v12];
      [(TTMSchemaTTMClientEvent *)v5 setTtmOverrideRequestContext:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (TTMSchemaTTMClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTMSchemaTTMClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTMSchemaTTMClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(TTMSchemaTTMClientEvent *)self eventMetadata];
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
  if (self->_ttmNeuralCombinerRequestContext)
  {
    uint64_t v7 = [(TTMSchemaTTMClientEvent *)self ttmNeuralCombinerRequestContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ttmNeuralCombinerRequestContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"ttmNeuralCombinerRequestContext"];
    }
  }
  if (self->_ttmOverrideRequestContext)
  {
    v10 = [(TTMSchemaTTMClientEvent *)self ttmOverrideRequestContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"ttmOverrideRequestContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"ttmOverrideRequestContext"];
    }
  }
  if (self->_ttmRequestContext)
  {
    v13 = [(TTMSchemaTTMClientEvent *)self ttmRequestContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"ttmRequestContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"ttmRequestContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TTMSchemaTTMClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(TTMSchemaTTMRequestContext *)self->_ttmRequestContext hash] ^ v3;
  unint64_t v5 = [(TTMSchemaTTMNeuralCombinerRequestContext *)self->_ttmNeuralCombinerRequestContext hash];
  return v4 ^ v5 ^ [(TTMSchemaTTMOverrideRequestContext *)self->_ttmOverrideRequestContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_23;
  }
  uint64_t v6 = [(TTMSchemaTTMClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(TTMSchemaTTMClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(TTMSchemaTTMClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(TTMSchemaTTMClientEvent *)self ttmRequestContext];
  uint64_t v7 = [v4 ttmRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(TTMSchemaTTMClientEvent *)self ttmRequestContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(TTMSchemaTTMClientEvent *)self ttmRequestContext];
    objc_super v16 = [v4 ttmRequestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(TTMSchemaTTMClientEvent *)self ttmNeuralCombinerRequestContext];
  uint64_t v7 = [v4 ttmNeuralCombinerRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(TTMSchemaTTMClientEvent *)self ttmNeuralCombinerRequestContext];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(TTMSchemaTTMClientEvent *)self ttmNeuralCombinerRequestContext];
    v21 = [v4 ttmNeuralCombinerRequestContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(TTMSchemaTTMClientEvent *)self ttmOverrideRequestContext];
  uint64_t v7 = [v4 ttmOverrideRequestContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(TTMSchemaTTMClientEvent *)self ttmOverrideRequestContext];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(TTMSchemaTTMClientEvent *)self ttmOverrideRequestContext];
    v26 = [v4 ttmOverrideRequestContext];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(TTMSchemaTTMClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(TTMSchemaTTMClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(TTMSchemaTTMClientEvent *)self ttmRequestContext];

  if (v6)
  {
    uint64_t v7 = [(TTMSchemaTTMClientEvent *)self ttmRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(TTMSchemaTTMClientEvent *)self ttmNeuralCombinerRequestContext];

  if (v8)
  {
    v9 = [(TTMSchemaTTMClientEvent *)self ttmNeuralCombinerRequestContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(TTMSchemaTTMClientEvent *)self ttmOverrideRequestContext];

  if (v10)
  {
    int v11 = [(TTMSchemaTTMClientEvent *)self ttmOverrideRequestContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTMSchemaTTMClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteTtmOverrideRequestContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ttmOverrideRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (TTMSchemaTTMOverrideRequestContext)ttmOverrideRequestContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_ttmOverrideRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTtmOverrideRequestContext:(id)a3
{
  id v4 = (TTMSchemaTTMOverrideRequestContext *)a3;
  ttmRequestContext = self->_ttmRequestContext;
  self->_ttmRequestContext = 0;

  ttmNeuralCombinerRequestContext = self->_ttmNeuralCombinerRequestContext;
  self->_ttmNeuralCombinerRequestContext = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  ttmOverrideRequestContext = self->_ttmOverrideRequestContext;
  self->_ttmOverrideRequestContext = v4;
}

- (void)deleteTtmNeuralCombinerRequestContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ttmNeuralCombinerRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (TTMSchemaTTMNeuralCombinerRequestContext)ttmNeuralCombinerRequestContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_ttmNeuralCombinerRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTtmNeuralCombinerRequestContext:(id)a3
{
  id v4 = (TTMSchemaTTMNeuralCombinerRequestContext *)a3;
  ttmRequestContext = self->_ttmRequestContext;
  self->_ttmRequestContext = 0;

  ttmOverrideRequestContext = self->_ttmOverrideRequestContext;
  self->_ttmOverrideRequestContext = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  ttmNeuralCombinerRequestContext = self->_ttmNeuralCombinerRequestContext;
  self->_ttmNeuralCombinerRequestContext = v4;
}

- (void)deleteTtmRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ttmRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (TTMSchemaTTMRequestContext)ttmRequestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_ttmRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTtmRequestContext:(id)a3
{
  id v4 = (TTMSchemaTTMRequestContext *)a3;
  ttmNeuralCombinerRequestContext = self->_ttmNeuralCombinerRequestContext;
  self->_ttmNeuralCombinerRequestContext = 0;

  ttmOverrideRequestContext = self->_ttmOverrideRequestContext;
  self->_ttmOverrideRequestContext = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  ttmRequestContext = self->_ttmRequestContext;
  self->_ttmRequestContext = v4;
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
  unint64_t v2 = [(TTMSchemaTTMClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 2) {
    return @"com.apple.aiml.siri.ttm.TTMClientEvent";
  }
  else {
    return off_1E5EBB008[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 70;
}

@end