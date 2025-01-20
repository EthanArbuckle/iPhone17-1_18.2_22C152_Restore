@interface IFPlatformRequestSchemaIFPlatformRequestClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasIfPlanCycleGenerated;
- (BOOL)hasIfPlatformRequestContext;
- (BOOL)hasIfPlatformRequestInvoked;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFPlatformRequestSchemaIFPlanCycleGenerated)ifPlanCycleGenerated;
- (IFPlatformRequestSchemaIFPlatformRequestClientEvent)initWithDictionary:(id)a3;
- (IFPlatformRequestSchemaIFPlatformRequestClientEvent)initWithJSON:(id)a3;
- (IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata)eventMetadata;
- (IFPlatformRequestSchemaIFPlatformRequestContext)ifPlatformRequestContext;
- (IFPlatformRequestSchemaIFPlatformRequestInvoked)ifPlatformRequestInvoked;
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
- (void)deleteIfPlanCycleGenerated;
- (void)deleteIfPlatformRequestContext;
- (void)deleteIfPlatformRequestInvoked;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasIfPlanCycleGenerated:(BOOL)a3;
- (void)setHasIfPlatformRequestContext:(BOOL)a3;
- (void)setHasIfPlatformRequestInvoked:(BOOL)a3;
- (void)setIfPlanCycleGenerated:(id)a3;
- (void)setIfPlatformRequestContext:(id)a3;
- (void)setIfPlatformRequestInvoked:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFPlatformRequestSchemaIFPlatformRequestClientEvent

- (int)componentName
{
  v2 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self eventMetadata];
  v3 = [v2 ifRequestId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 45;
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
  v2 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self eventMetadata];
  v3 = [v2 ifRequestId];

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
  v19.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self deleteEventMetadata];
  }
  v9 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self deleteIfPlatformRequestContext];
  }
  v12 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestInvoked];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self deleteIfPlatformRequestInvoked];
  }
  v15 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlanCycleGenerated];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self deleteIfPlanCycleGenerated];
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
  unint64_t v3 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA7C8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2) {
    return 0;
  }
  else {
    return off_1E5EAA7E0[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ifPlanCycleGenerated, 0);
  objc_storeStrong((id *)&self->_ifPlatformRequestInvoked, 0);
  objc_storeStrong((id *)&self->_ifPlatformRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasIfPlanCycleGenerated:(BOOL)a3
{
  self->_hasIfPlanCycleGenerated = a3;
}

- (BOOL)hasIfPlanCycleGenerated
{
  return self->_hasIfPlanCycleGenerated;
}

- (void)setHasIfPlatformRequestInvoked:(BOOL)a3
{
  self->_hasIfPlatformRequestInvoked = a3;
}

- (BOOL)hasIfPlatformRequestInvoked
{
  return self->_hasIfPlatformRequestInvoked;
}

- (void)setHasIfPlatformRequestContext:(BOOL)a3
{
  self->_hasIfPlatformRequestContext = a3;
}

- (BOOL)hasIfPlatformRequestContext
{
  return self->_hasIfPlatformRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (IFPlatformRequestSchemaIFPlatformRequestClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestClientEvent;
  v5 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata alloc] initWithDictionary:v6];
      [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ifPlatformRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFPlatformRequestSchemaIFPlatformRequestContext alloc] initWithDictionary:v8];
      [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)v5 setIfPlatformRequestContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ifPlatformRequestInvoked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFPlatformRequestSchemaIFPlatformRequestInvoked alloc] initWithDictionary:v10];
      [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)v5 setIfPlatformRequestInvoked:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"ifPlanCycleGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFPlatformRequestSchemaIFPlanCycleGenerated alloc] initWithDictionary:v12];
      [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)v5 setIfPlanCycleGenerated:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (IFPlatformRequestSchemaIFPlatformRequestClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self eventMetadata];
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
  if (self->_ifPlanCycleGenerated)
  {
    uint64_t v7 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlanCycleGenerated];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ifPlanCycleGenerated"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"ifPlanCycleGenerated"];
    }
  }
  if (self->_ifPlatformRequestContext)
  {
    v10 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"ifPlatformRequestContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"ifPlatformRequestContext"];
    }
  }
  if (self->_ifPlatformRequestInvoked)
  {
    v13 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestInvoked];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"ifPlatformRequestInvoked"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"ifPlatformRequestInvoked"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(IFPlatformRequestSchemaIFPlatformRequestContext *)self->_ifPlatformRequestContext hash] ^ v3;
  unint64_t v5 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self->_ifPlatformRequestInvoked hash];
  return v4 ^ v5 ^ [(IFPlatformRequestSchemaIFPlanCycleGenerated *)self->_ifPlanCycleGenerated hash];
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
  uint64_t v6 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestContext];
  uint64_t v7 = [v4 ifPlatformRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestContext];
    objc_super v16 = [v4 ifPlatformRequestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestInvoked];
  uint64_t v7 = [v4 ifPlatformRequestInvoked];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestInvoked];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestInvoked];
    v21 = [v4 ifPlatformRequestInvoked];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlanCycleGenerated];
  uint64_t v7 = [v4 ifPlanCycleGenerated];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlanCycleGenerated];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlanCycleGenerated];
    v26 = [v4 ifPlanCycleGenerated];
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
  id v4 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestContext];

  if (v6)
  {
    uint64_t v7 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestInvoked];

  if (v8)
  {
    v9 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlatformRequestInvoked];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlanCycleGenerated];

  if (v10)
  {
    int v11 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self ifPlanCycleGenerated];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFPlatformRequestSchemaIFPlatformRequestClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteIfPlanCycleGenerated
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ifPlanCycleGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFPlatformRequestSchemaIFPlanCycleGenerated)ifPlanCycleGenerated
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_ifPlanCycleGenerated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIfPlanCycleGenerated:(id)a3
{
  id v4 = (IFPlatformRequestSchemaIFPlanCycleGenerated *)a3;
  ifPlatformRequestContext = self->_ifPlatformRequestContext;
  self->_ifPlatformRequestContext = 0;

  ifPlatformRequestInvoked = self->_ifPlatformRequestInvoked;
  self->_ifPlatformRequestInvoked = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  ifPlanCycleGenerated = self->_ifPlanCycleGenerated;
  self->_ifPlanCycleGenerated = v4;
}

- (void)deleteIfPlatformRequestInvoked
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ifPlatformRequestInvoked = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFPlatformRequestSchemaIFPlatformRequestInvoked)ifPlatformRequestInvoked
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_ifPlatformRequestInvoked;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIfPlatformRequestInvoked:(id)a3
{
  id v4 = (IFPlatformRequestSchemaIFPlatformRequestInvoked *)a3;
  ifPlatformRequestContext = self->_ifPlatformRequestContext;
  self->_ifPlatformRequestContext = 0;

  ifPlanCycleGenerated = self->_ifPlanCycleGenerated;
  self->_ifPlanCycleGenerated = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  ifPlatformRequestInvoked = self->_ifPlatformRequestInvoked;
  self->_ifPlatformRequestInvoked = v4;
}

- (void)deleteIfPlatformRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ifPlatformRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFPlatformRequestSchemaIFPlatformRequestContext)ifPlatformRequestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_ifPlatformRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIfPlatformRequestContext:(id)a3
{
  id v4 = (IFPlatformRequestSchemaIFPlatformRequestContext *)a3;
  ifPlatformRequestInvoked = self->_ifPlatformRequestInvoked;
  self->_ifPlatformRequestInvoked = 0;

  ifPlanCycleGenerated = self->_ifPlanCycleGenerated;
  self->_ifPlanCycleGenerated = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  ifPlatformRequestContext = self->_ifPlatformRequestContext;
  self->_ifPlatformRequestContext = v4;
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
  unint64_t v2 = [(IFPlatformRequestSchemaIFPlatformRequestClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 2) {
    return @"com.apple.aiml.siri.ifPlatformRequest.IFPlatformRequestClientEvent";
  }
  else {
    return off_1E5EBFEC8[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 100;
}

@end