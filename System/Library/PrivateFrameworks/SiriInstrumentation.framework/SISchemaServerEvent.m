@interface SISchemaServerEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasServerConversationTrace;
- (BOOL)hasServerDeviceFixedContext;
- (BOOL)hasServerGeneratedDismissal;
- (BOOL)hasSpeechResultSelected;
- (BOOL)hasTurnInteraction;
- (BOOL)hasUserSpeechDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaConversationTrace)serverConversationTrace;
- (SISchemaDeviceFixedContext)serverDeviceFixedContext;
- (SISchemaInstrumentationMessage)innerEvent;
- (SISchemaServerEvent)initWithDictionary:(id)a3;
- (SISchemaServerEvent)initWithJSON:(id)a3;
- (SISchemaServerEventMetadata)eventMetadata;
- (SISchemaServerGeneratedDismissal)serverGeneratedDismissal;
- (SISchemaSpeechResultSelected)speechResultSelected;
- (SISchemaTurnInteraction)turnInteraction;
- (SISchemaUserSpeechDuration)userSpeechDuration;
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
- (void)deleteServerConversationTrace;
- (void)deleteServerDeviceFixedContext;
- (void)deleteServerGeneratedDismissal;
- (void)deleteSpeechResultSelected;
- (void)deleteTurnInteraction;
- (void)deleteUserSpeechDuration;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasServerConversationTrace:(BOOL)a3;
- (void)setHasServerDeviceFixedContext:(BOOL)a3;
- (void)setHasServerGeneratedDismissal:(BOOL)a3;
- (void)setHasSpeechResultSelected:(BOOL)a3;
- (void)setHasTurnInteraction:(BOOL)a3;
- (void)setHasUserSpeechDuration:(BOOL)a3;
- (void)setServerConversationTrace:(id)a3;
- (void)setServerDeviceFixedContext:(id)a3;
- (void)setServerGeneratedDismissal:(id)a3;
- (void)setSpeechResultSelected:(id)a3;
- (void)setTurnInteraction:(id)a3;
- (void)setUserSpeechDuration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaServerEvent

- (int)componentName
{
  v3 = [SISchemaUUID alloc];
  v4 = [(SISchemaServerEvent *)self eventMetadata];
  v5 = [v4 turnID];
  v6 = [(SISchemaUUID *)v3 initWithBytesAsData:v5];

  if (v6)
  {
    v7 = [(SISchemaUUID *)v6 value];
    if (v7)
    {
      v8 = [(SISchemaUUID *)v6 value];
      BOOL v9 = [v8 length] != 0;

      LODWORD(v7) = 2 * v9;
    }
  }
  else
  {
    LODWORD(v7) = 0;
  }

  return (int)v7;
}

- (id)getComponentId
{
  v3 = [SISchemaUUID alloc];
  v4 = [(SISchemaServerEvent *)self eventMetadata];
  v5 = [v4 turnID];
  v6 = [(SISchemaUUID *)v3 initWithBytesAsData:v5];

  if (!v6) {
    goto LABEL_5;
  }
  v7 = [(SISchemaUUID *)v6 value];
  if (!v7) {
    goto LABEL_6;
  }
  v8 = [(SISchemaUUID *)v6 value];
  uint64_t v9 = [v8 length];

  if (v9) {
    v7 = v6;
  }
  else {
LABEL_5:
  }
    v7 = 0;
LABEL_6:

  return v7;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SISchemaServerEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaServerEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaServerEvent *)self deleteEventMetadata];
  }
  uint64_t v9 = [(SISchemaServerEvent *)self userSpeechDuration];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaServerEvent *)self deleteUserSpeechDuration];
  }
  v12 = [(SISchemaServerEvent *)self serverConversationTrace];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaServerEvent *)self deleteServerConversationTrace];
  }
  v15 = [(SISchemaServerEvent *)self turnInteraction];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SISchemaServerEvent *)self deleteTurnInteraction];
  }
  v18 = [(SISchemaServerEvent *)self speechResultSelected];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(SISchemaServerEvent *)self deleteSpeechResultSelected];
  }
  v21 = [(SISchemaServerEvent *)self serverDeviceFixedContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(SISchemaServerEvent *)self deleteServerDeviceFixedContext];
  }
  v24 = [(SISchemaServerEvent *)self serverGeneratedDismissal];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(SISchemaServerEvent *)self deleteServerGeneratedDismissal];
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
  unint64_t v3 = [(SISchemaServerEvent *)self whichEvent_Type];
  if (v3 - 101 > 5) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAC0A8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 5) {
    return 0;
  }
  else {
    return off_1E5EAC0D8[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverGeneratedDismissal, 0);
  objc_storeStrong((id *)&self->_serverDeviceFixedContext, 0);
  objc_storeStrong((id *)&self->_speechResultSelected, 0);
  objc_storeStrong((id *)&self->_turnInteraction, 0);
  objc_storeStrong((id *)&self->_serverConversationTrace, 0);
  objc_storeStrong((id *)&self->_userSpeechDuration, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasServerGeneratedDismissal:(BOOL)a3
{
  self->_hasServerGeneratedDismissal = a3;
}

- (BOOL)hasServerGeneratedDismissal
{
  return self->_hasServerGeneratedDismissal;
}

- (void)setHasServerDeviceFixedContext:(BOOL)a3
{
  self->_hasServerDeviceFixedContext = a3;
}

- (BOOL)hasServerDeviceFixedContext
{
  return self->_hasServerDeviceFixedContext;
}

- (void)setHasSpeechResultSelected:(BOOL)a3
{
  self->_hasSpeechResultSelected = a3;
}

- (BOOL)hasSpeechResultSelected
{
  return self->_hasSpeechResultSelected;
}

- (void)setHasTurnInteraction:(BOOL)a3
{
  self->_hasTurnInteraction = a3;
}

- (BOOL)hasTurnInteraction
{
  return self->_hasTurnInteraction;
}

- (void)setHasServerConversationTrace:(BOOL)a3
{
  self->_hasServerConversationTrace = a3;
}

- (BOOL)hasServerConversationTrace
{
  return self->_hasServerConversationTrace;
}

- (void)setHasUserSpeechDuration:(BOOL)a3
{
  self->_hasUserSpeechDuration = a3;
}

- (BOOL)hasUserSpeechDuration
{
  return self->_hasUserSpeechDuration;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (SISchemaServerEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SISchemaServerEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SISchemaServerEvent;
  v5 = [(SISchemaServerEvent *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaServerEventMetadata alloc] initWithDictionary:v6];
      [(SISchemaServerEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"userSpeechDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [[SISchemaUserSpeechDuration alloc] initWithDictionary:v8];
      [(SISchemaServerEvent *)v5 setUserSpeechDuration:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"serverConversationTrace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaConversationTrace alloc] initWithDictionary:v10];
      [(SISchemaServerEvent *)v5 setServerConversationTrace:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"turnInteraction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaTurnInteraction alloc] initWithDictionary:v12];
      [(SISchemaServerEvent *)v5 setTurnInteraction:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"speechResultSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaSpeechResultSelected alloc] initWithDictionary:v14];
      [(SISchemaServerEvent *)v5 setSpeechResultSelected:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"serverDeviceFixedContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[SISchemaDeviceFixedContext alloc] initWithDictionary:v16];
      [(SISchemaServerEvent *)v5 setServerDeviceFixedContext:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"serverGeneratedDismissal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[SISchemaServerGeneratedDismissal alloc] initWithDictionary:v18];
      [(SISchemaServerEvent *)v5 setServerGeneratedDismissal:v19];
    }
    int v20 = v5;
  }
  return v5;
}

- (SISchemaServerEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaServerEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaServerEvent *)self dictionaryRepresentation];
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
    id v4 = [(SISchemaServerEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
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
  if (self->_serverConversationTrace)
  {
    uint64_t v7 = [(SISchemaServerEvent *)self serverConversationTrace];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"serverConversationTrace"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"serverConversationTrace"];
    }
  }
  if (self->_serverDeviceFixedContext)
  {
    v10 = [(SISchemaServerEvent *)self serverDeviceFixedContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"serverDeviceFixedContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"serverDeviceFixedContext"];
    }
  }
  if (self->_serverGeneratedDismissal)
  {
    v13 = [(SISchemaServerEvent *)self serverGeneratedDismissal];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"serverGeneratedDismissal"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"serverGeneratedDismissal"];
    }
  }
  if (self->_speechResultSelected)
  {
    v16 = [(SISchemaServerEvent *)self speechResultSelected];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"speechResultSelected"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"speechResultSelected"];
    }
  }
  if (self->_turnInteraction)
  {
    v19 = [(SISchemaServerEvent *)self turnInteraction];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"turnInteraction"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"turnInteraction"];
    }
  }
  if (self->_userSpeechDuration)
  {
    objc_super v22 = [(SISchemaServerEvent *)self userSpeechDuration];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"userSpeechDuration"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"userSpeechDuration"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaServerEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(SISchemaUserSpeechDuration *)self->_userSpeechDuration hash] ^ v3;
  unint64_t v5 = [(SISchemaConversationTrace *)self->_serverConversationTrace hash];
  unint64_t v6 = v4 ^ v5 ^ [(SISchemaTurnInteraction *)self->_turnInteraction hash];
  unint64_t v7 = [(SISchemaSpeechResultSelected *)self->_speechResultSelected hash];
  unint64_t v8 = v7 ^ [(SISchemaDeviceFixedContext *)self->_serverDeviceFixedContext hash];
  return v6 ^ v8 ^ [(SISchemaServerGeneratedDismissal *)self->_serverGeneratedDismissal hash];
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
  unint64_t v6 = [(SISchemaServerEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v8 = [(SISchemaServerEvent *)self eventMetadata];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(SISchemaServerEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaServerEvent *)self userSpeechDuration];
  unint64_t v7 = [v4 userSpeechDuration];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(SISchemaServerEvent *)self userSpeechDuration];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(SISchemaServerEvent *)self userSpeechDuration];
    v16 = [v4 userSpeechDuration];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaServerEvent *)self serverConversationTrace];
  unint64_t v7 = [v4 serverConversationTrace];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(SISchemaServerEvent *)self serverConversationTrace];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(SISchemaServerEvent *)self serverConversationTrace];
    v21 = [v4 serverConversationTrace];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaServerEvent *)self turnInteraction];
  unint64_t v7 = [v4 turnInteraction];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(SISchemaServerEvent *)self turnInteraction];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(SISchemaServerEvent *)self turnInteraction];
    int v26 = [v4 turnInteraction];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaServerEvent *)self speechResultSelected];
  unint64_t v7 = [v4 speechResultSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(SISchemaServerEvent *)self speechResultSelected];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(SISchemaServerEvent *)self speechResultSelected];
    v31 = [v4 speechResultSelected];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaServerEvent *)self serverDeviceFixedContext];
  unint64_t v7 = [v4 serverDeviceFixedContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(SISchemaServerEvent *)self serverDeviceFixedContext];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(SISchemaServerEvent *)self serverDeviceFixedContext];
    v36 = [v4 serverDeviceFixedContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaServerEvent *)self serverGeneratedDismissal];
  unint64_t v7 = [v4 serverGeneratedDismissal];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v38 = [(SISchemaServerEvent *)self serverGeneratedDismissal];
    if (!v38)
    {

LABEL_41:
      BOOL v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    v40 = [(SISchemaServerEvent *)self serverGeneratedDismissal];
    v41 = [v4 serverGeneratedDismissal];
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
  id v4 = [(SISchemaServerEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(SISchemaServerEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(SISchemaServerEvent *)self userSpeechDuration];

  if (v6)
  {
    unint64_t v7 = [(SISchemaServerEvent *)self userSpeechDuration];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SISchemaServerEvent *)self serverConversationTrace];

  if (v8)
  {
    uint64_t v9 = [(SISchemaServerEvent *)self serverConversationTrace];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(SISchemaServerEvent *)self turnInteraction];

  if (v10)
  {
    int v11 = [(SISchemaServerEvent *)self turnInteraction];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(SISchemaServerEvent *)self speechResultSelected];

  if (v12)
  {
    uint64_t v13 = [(SISchemaServerEvent *)self speechResultSelected];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(SISchemaServerEvent *)self serverDeviceFixedContext];

  if (v14)
  {
    v15 = [(SISchemaServerEvent *)self serverDeviceFixedContext];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(SISchemaServerEvent *)self serverGeneratedDismissal];

  if (v16)
  {
    int v17 = [(SISchemaServerEvent *)self serverGeneratedDismissal];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaServerEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteServerGeneratedDismissal
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_serverGeneratedDismissal = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaServerGeneratedDismissal)serverGeneratedDismissal
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_serverGeneratedDismissal;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setServerGeneratedDismissal:(id)a3
{
  id v4 = (SISchemaServerGeneratedDismissal *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  unint64_t v10 = 106;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = v4;
}

- (void)deleteServerDeviceFixedContext
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_serverDeviceFixedContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDeviceFixedContext)serverDeviceFixedContext
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_serverDeviceFixedContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setServerDeviceFixedContext:(id)a3
{
  id v4 = (SISchemaDeviceFixedContext *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  unint64_t v10 = 105;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = v4;
}

- (void)deleteSpeechResultSelected
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speechResultSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaSpeechResultSelected)speechResultSelected
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_speechResultSelected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeechResultSelected:(id)a3
{
  id v4 = (SISchemaSpeechResultSelected *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  unint64_t v10 = 104;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = v4;
}

- (void)deleteTurnInteraction
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_turnInteraction = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaTurnInteraction)turnInteraction
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_turnInteraction;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTurnInteraction:(id)a3
{
  id v4 = (SISchemaTurnInteraction *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  unint64_t v10 = 103;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = v4;
}

- (void)deleteServerConversationTrace
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_serverConversationTrace = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaConversationTrace)serverConversationTrace
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_serverConversationTrace;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setServerConversationTrace:(id)a3
{
  id v4 = (SISchemaConversationTrace *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  unint64_t v10 = 102;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = v4;
}

- (void)deleteUserSpeechDuration
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userSpeechDuration = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUserSpeechDuration)userSpeechDuration
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_userSpeechDuration;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserSpeechDuration:(id)a3
{
  id v4 = (SISchemaUserSpeechDuration *)a3;
  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  unint64_t v10 = 101;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = v4;
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
  unint64_t v2 = [(SISchemaServerEvent *)self whichEvent_Type];
  if (v2 - 101 > 5) {
    return @"com.apple.aiml.siri.uei.ServerEvent";
  }
  else {
    return off_1E5EB84A8[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 2;
}

@end