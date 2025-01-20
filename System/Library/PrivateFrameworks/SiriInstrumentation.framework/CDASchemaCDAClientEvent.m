@interface CDASchemaCDAClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasCdaAdvertisingEndChanged;
- (BOOL)hasCdaAdvertisingStartChanged;
- (BOOL)hasDebugElectionDecisionMade;
- (BOOL)hasDeviceElectionStateContext;
- (BOOL)hasElectionDecisionMade;
- (BOOL)hasElectionTimerEnded;
- (BOOL)hasEventMetadata;
- (BOOL)hasUserFeedbackCompleted;
- (BOOL)hasUserFeedbackParticipantCollectionReported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CDASchemaCDAClientEvent)initWithDictionary:(id)a3;
- (CDASchemaCDAClientEvent)initWithJSON:(id)a3;
- (CDASchemaCDAClientEventMetadata)eventMetadata;
- (CDASchemaCDADebugElectionDecisionMade)debugElectionDecisionMade;
- (CDASchemaCDADeviceAdvertisingEndContext)cdaAdvertisingEndChanged;
- (CDASchemaCDADeviceAdvertisingStartContext)cdaAdvertisingStartChanged;
- (CDASchemaCDADeviceStateContext)deviceElectionStateContext;
- (CDASchemaCDAElectionDecisionMade)electionDecisionMade;
- (CDASchemaCDAElectionTimerEnded)electionTimerEnded;
- (CDASchemaCDAUserFeedbackCompleted)userFeedbackCompleted;
- (CDASchemaCDAUserFeedbackParticipantCollectionReported)userFeedbackParticipantCollectionReported;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteCdaAdvertisingEndChanged;
- (void)deleteCdaAdvertisingStartChanged;
- (void)deleteDebugElectionDecisionMade;
- (void)deleteDeviceElectionStateContext;
- (void)deleteElectionDecisionMade;
- (void)deleteElectionTimerEnded;
- (void)deleteEventMetadata;
- (void)deleteUserFeedbackCompleted;
- (void)deleteUserFeedbackParticipantCollectionReported;
- (void)setCdaAdvertisingEndChanged:(id)a3;
- (void)setCdaAdvertisingStartChanged:(id)a3;
- (void)setDebugElectionDecisionMade:(id)a3;
- (void)setDeviceElectionStateContext:(id)a3;
- (void)setElectionDecisionMade:(id)a3;
- (void)setElectionTimerEnded:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasCdaAdvertisingEndChanged:(BOOL)a3;
- (void)setHasCdaAdvertisingStartChanged:(BOOL)a3;
- (void)setHasDebugElectionDecisionMade:(BOOL)a3;
- (void)setHasDeviceElectionStateContext:(BOOL)a3;
- (void)setHasElectionDecisionMade:(BOOL)a3;
- (void)setHasElectionTimerEnded:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasUserFeedbackCompleted:(BOOL)a3;
- (void)setHasUserFeedbackParticipantCollectionReported:(BOOL)a3;
- (void)setUserFeedbackCompleted:(id)a3;
- (void)setUserFeedbackParticipantCollectionReported:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CDASchemaCDAClientEvent

- (int)componentName
{
  v2 = [(CDASchemaCDAClientEvent *)self eventMetadata];
  v3 = [v2 cdaId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 23;
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
  v2 = [(CDASchemaCDAClientEvent *)self eventMetadata];
  v3 = [v2 cdaId];

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
  v34.receiver = self;
  v34.super_class = (Class)CDASchemaCDAClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v34 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(CDASchemaCDAClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CDASchemaCDAClientEvent *)self deleteEventMetadata];
  }
  v9 = [(CDASchemaCDAClientEvent *)self electionDecisionMade];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CDASchemaCDAClientEvent *)self deleteElectionDecisionMade];
  }
  v12 = [(CDASchemaCDAClientEvent *)self debugElectionDecisionMade];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CDASchemaCDAClientEvent *)self deleteDebugElectionDecisionMade];
  }
  v15 = [(CDASchemaCDAClientEvent *)self deviceElectionStateContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CDASchemaCDAClientEvent *)self deleteDeviceElectionStateContext];
  }
  v18 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingStartChanged];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(CDASchemaCDAClientEvent *)self deleteCdaAdvertisingStartChanged];
  }
  v21 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingEndChanged];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(CDASchemaCDAClientEvent *)self deleteCdaAdvertisingEndChanged];
  }
  v24 = [(CDASchemaCDAClientEvent *)self electionTimerEnded];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(CDASchemaCDAClientEvent *)self deleteElectionTimerEnded];
  }
  v27 = [(CDASchemaCDAClientEvent *)self userFeedbackCompleted];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(CDASchemaCDAClientEvent *)self deleteUserFeedbackCompleted];
  }
  v30 = [(CDASchemaCDAClientEvent *)self userFeedbackParticipantCollectionReported];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(CDASchemaCDAClientEvent *)self deleteUserFeedbackParticipantCollectionReported];
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
  unint64_t v3 = [(CDASchemaCDAClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 7) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EA9F90[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 7) {
    return 0;
  }
  else {
    return off_1E5EA9FD0[a3 - 101];
  }
}

- (int)clockIsolationLevel
{
  if ([(CDASchemaCDAClientEvent *)self whichEvent_Type] == 107) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedbackParticipantCollectionReported, 0);
  objc_storeStrong((id *)&self->_userFeedbackCompleted, 0);
  objc_storeStrong((id *)&self->_electionTimerEnded, 0);
  objc_storeStrong((id *)&self->_cdaAdvertisingEndChanged, 0);
  objc_storeStrong((id *)&self->_cdaAdvertisingStartChanged, 0);
  objc_storeStrong((id *)&self->_deviceElectionStateContext, 0);
  objc_storeStrong((id *)&self->_debugElectionDecisionMade, 0);
  objc_storeStrong((id *)&self->_electionDecisionMade, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasUserFeedbackParticipantCollectionReported:(BOOL)a3
{
  self->_hasUserFeedbackParticipantCollectionReported = a3;
}

- (BOOL)hasUserFeedbackParticipantCollectionReported
{
  return self->_hasUserFeedbackParticipantCollectionReported;
}

- (void)setHasUserFeedbackCompleted:(BOOL)a3
{
  self->_hasUserFeedbackCompleted = a3;
}

- (BOOL)hasUserFeedbackCompleted
{
  return self->_hasUserFeedbackCompleted;
}

- (void)setHasElectionTimerEnded:(BOOL)a3
{
  self->_hasElectionTimerEnded = a3;
}

- (BOOL)hasElectionTimerEnded
{
  return self->_hasElectionTimerEnded;
}

- (void)setHasCdaAdvertisingEndChanged:(BOOL)a3
{
  self->_hasCdaAdvertisingEndChanged = a3;
}

- (BOOL)hasCdaAdvertisingEndChanged
{
  return self->_hasCdaAdvertisingEndChanged;
}

- (void)setHasCdaAdvertisingStartChanged:(BOOL)a3
{
  self->_hasCdaAdvertisingStartChanged = a3;
}

- (BOOL)hasCdaAdvertisingStartChanged
{
  return self->_hasCdaAdvertisingStartChanged;
}

- (void)setHasDeviceElectionStateContext:(BOOL)a3
{
  self->_hasDeviceElectionStateContext = a3;
}

- (BOOL)hasDeviceElectionStateContext
{
  return self->_hasDeviceElectionStateContext;
}

- (void)setHasDebugElectionDecisionMade:(BOOL)a3
{
  self->_hasDebugElectionDecisionMade = a3;
}

- (BOOL)hasDebugElectionDecisionMade
{
  return self->_hasDebugElectionDecisionMade;
}

- (void)setHasElectionDecisionMade:(BOOL)a3
{
  self->_hasElectionDecisionMade = a3;
}

- (BOOL)hasElectionDecisionMade
{
  return self->_hasElectionDecisionMade;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (CDASchemaCDAClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CDASchemaCDAClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CDASchemaCDAClientEvent;
  v5 = [(CDASchemaCDAClientEvent *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[CDASchemaCDAClientEventMetadata alloc] initWithDictionary:v6];
      [(CDASchemaCDAClientEvent *)v5 setEventMetadata:v7];
    }
    v27 = (void *)v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"electionDecisionMade"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[CDASchemaCDAElectionDecisionMade alloc] initWithDictionary:v8];
      [(CDASchemaCDAClientEvent *)v5 setElectionDecisionMade:v9];
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"debugElectionDecisionMade", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[CDASchemaCDADebugElectionDecisionMade alloc] initWithDictionary:v10];
      [(CDASchemaCDAClientEvent *)v5 setDebugElectionDecisionMade:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"deviceElectionStateContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[CDASchemaCDADeviceStateContext alloc] initWithDictionary:v12];
      [(CDASchemaCDAClientEvent *)v5 setDeviceElectionStateContext:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"cdaAdvertisingStartChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[CDASchemaCDADeviceAdvertisingStartContext alloc] initWithDictionary:v14];
      [(CDASchemaCDAClientEvent *)v5 setCdaAdvertisingStartChanged:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"cdaAdvertisingEndChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[CDASchemaCDADeviceAdvertisingEndContext alloc] initWithDictionary:v16];
      [(CDASchemaCDAClientEvent *)v5 setCdaAdvertisingEndChanged:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"electionTimerEnded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[CDASchemaCDAElectionTimerEnded alloc] initWithDictionary:v18];
      [(CDASchemaCDAClientEvent *)v5 setElectionTimerEnded:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"userFeedbackCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[CDASchemaCDAUserFeedbackCompleted alloc] initWithDictionary:v20];
      [(CDASchemaCDAClientEvent *)v5 setUserFeedbackCompleted:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"userFeedbackParticipantCollectionReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[CDASchemaCDAUserFeedbackParticipantCollectionReported alloc] initWithDictionary:v22];
      [(CDASchemaCDAClientEvent *)v5 setUserFeedbackParticipantCollectionReported:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (CDASchemaCDAClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CDASchemaCDAClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CDASchemaCDAClientEvent *)self dictionaryRepresentation];
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
  if (self->_cdaAdvertisingEndChanged)
  {
    id v4 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingEndChanged];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"cdaAdvertisingEndChanged"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"cdaAdvertisingEndChanged"];
    }
  }
  if (self->_cdaAdvertisingStartChanged)
  {
    uint64_t v7 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingStartChanged];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"cdaAdvertisingStartChanged"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"cdaAdvertisingStartChanged"];
    }
  }
  if (self->_debugElectionDecisionMade)
  {
    v10 = [(CDASchemaCDAClientEvent *)self debugElectionDecisionMade];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"debugElectionDecisionMade"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"debugElectionDecisionMade"];
    }
  }
  if (self->_deviceElectionStateContext)
  {
    v13 = [(CDASchemaCDAClientEvent *)self deviceElectionStateContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"deviceElectionStateContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"deviceElectionStateContext"];
    }
  }
  if (self->_electionDecisionMade)
  {
    v16 = [(CDASchemaCDAClientEvent *)self electionDecisionMade];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"electionDecisionMade"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"electionDecisionMade"];
    }
  }
  if (self->_electionTimerEnded)
  {
    v19 = [(CDASchemaCDAClientEvent *)self electionTimerEnded];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"electionTimerEnded"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"electionTimerEnded"];
    }
  }
  if (self->_eventMetadata)
  {
    v22 = [(CDASchemaCDAClientEvent *)self eventMetadata];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_userFeedbackCompleted)
  {
    v25 = [(CDASchemaCDAClientEvent *)self userFeedbackCompleted];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"userFeedbackCompleted"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"userFeedbackCompleted"];
    }
  }
  if (self->_userFeedbackParticipantCollectionReported)
  {
    objc_super v28 = [(CDASchemaCDAClientEvent *)self userFeedbackParticipantCollectionReported];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"userFeedbackParticipantCollectionReported"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"userFeedbackParticipantCollectionReported"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CDASchemaCDAClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(CDASchemaCDAElectionDecisionMade *)self->_electionDecisionMade hash] ^ v3;
  unint64_t v5 = [(CDASchemaCDADebugElectionDecisionMade *)self->_debugElectionDecisionMade hash];
  unint64_t v6 = v4 ^ v5 ^ [(CDASchemaCDADeviceStateContext *)self->_deviceElectionStateContext hash];
  unint64_t v7 = [(CDASchemaCDADeviceAdvertisingStartContext *)self->_cdaAdvertisingStartChanged hash];
  unint64_t v8 = v7 ^ [(CDASchemaCDADeviceAdvertisingEndContext *)self->_cdaAdvertisingEndChanged hash];
  unint64_t v9 = v6 ^ v8 ^ [(CDASchemaCDAElectionTimerEnded *)self->_electionTimerEnded hash];
  unint64_t v10 = [(CDASchemaCDAUserFeedbackCompleted *)self->_userFeedbackCompleted hash];
  return v9 ^ v10 ^ [(CDASchemaCDAUserFeedbackParticipantCollectionReported *)self->_userFeedbackParticipantCollectionReported hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_48;
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v8 = [(CDASchemaCDAClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(CDASchemaCDAClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self electionDecisionMade];
  unint64_t v7 = [v4 electionDecisionMade];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v13 = [(CDASchemaCDAClientEvent *)self electionDecisionMade];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(CDASchemaCDAClientEvent *)self electionDecisionMade];
    v16 = [v4 electionDecisionMade];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self debugElectionDecisionMade];
  unint64_t v7 = [v4 debugElectionDecisionMade];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v18 = [(CDASchemaCDAClientEvent *)self debugElectionDecisionMade];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(CDASchemaCDAClientEvent *)self debugElectionDecisionMade];
    v21 = [v4 debugElectionDecisionMade];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self deviceElectionStateContext];
  unint64_t v7 = [v4 deviceElectionStateContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v23 = [(CDASchemaCDAClientEvent *)self deviceElectionStateContext];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(CDASchemaCDAClientEvent *)self deviceElectionStateContext];
    int v26 = [v4 deviceElectionStateContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingStartChanged];
  unint64_t v7 = [v4 cdaAdvertisingStartChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v28 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingStartChanged];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingStartChanged];
    v31 = [v4 cdaAdvertisingStartChanged];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingEndChanged];
  unint64_t v7 = [v4 cdaAdvertisingEndChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v33 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingEndChanged];
  if (v33)
  {
    objc_super v34 = (void *)v33;
    v35 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingEndChanged];
    v36 = [v4 cdaAdvertisingEndChanged];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self electionTimerEnded];
  unint64_t v7 = [v4 electionTimerEnded];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v38 = [(CDASchemaCDAClientEvent *)self electionTimerEnded];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(CDASchemaCDAClientEvent *)self electionTimerEnded];
    v41 = [v4 electionTimerEnded];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self userFeedbackCompleted];
  unint64_t v7 = [v4 userFeedbackCompleted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v43 = [(CDASchemaCDAClientEvent *)self userFeedbackCompleted];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(CDASchemaCDAClientEvent *)self userFeedbackCompleted];
    v46 = [v4 userFeedbackCompleted];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self userFeedbackParticipantCollectionReported];
  unint64_t v7 = [v4 userFeedbackParticipantCollectionReported];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v48 = [(CDASchemaCDAClientEvent *)self userFeedbackParticipantCollectionReported];
    if (!v48)
    {

LABEL_51:
      BOOL v53 = 1;
      goto LABEL_49;
    }
    v49 = (void *)v48;
    v50 = [(CDASchemaCDAClientEvent *)self userFeedbackParticipantCollectionReported];
    v51 = [v4 userFeedbackParticipantCollectionReported];
    char v52 = [v50 isEqual:v51];

    if (v52) {
      goto LABEL_51;
    }
  }
  else
  {
LABEL_47:
  }
LABEL_48:
  BOOL v53 = 0;
LABEL_49:

  return v53;
}

- (void)writeTo:(id)a3
{
  id v22 = a3;
  id v4 = [(CDASchemaCDAClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(CDASchemaCDAClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(CDASchemaCDAClientEvent *)self electionDecisionMade];

  if (v6)
  {
    unint64_t v7 = [(CDASchemaCDAClientEvent *)self electionDecisionMade];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CDASchemaCDAClientEvent *)self debugElectionDecisionMade];

  if (v8)
  {
    unint64_t v9 = [(CDASchemaCDAClientEvent *)self debugElectionDecisionMade];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(CDASchemaCDAClientEvent *)self deviceElectionStateContext];

  if (v10)
  {
    int v11 = [(CDASchemaCDAClientEvent *)self deviceElectionStateContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingStartChanged];

  if (v12)
  {
    uint64_t v13 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingStartChanged];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingEndChanged];

  if (v14)
  {
    v15 = [(CDASchemaCDAClientEvent *)self cdaAdvertisingEndChanged];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(CDASchemaCDAClientEvent *)self electionTimerEnded];

  if (v16)
  {
    int v17 = [(CDASchemaCDAClientEvent *)self electionTimerEnded];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(CDASchemaCDAClientEvent *)self userFeedbackCompleted];

  if (v18)
  {
    v19 = [(CDASchemaCDAClientEvent *)self userFeedbackCompleted];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(CDASchemaCDAClientEvent *)self userFeedbackParticipantCollectionReported];

  if (v20)
  {
    v21 = [(CDASchemaCDAClientEvent *)self userFeedbackParticipantCollectionReported];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserFeedbackParticipantCollectionReported
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userFeedbackParticipantCollectionReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CDASchemaCDAUserFeedbackParticipantCollectionReported)userFeedbackParticipantCollectionReported
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_userFeedbackParticipantCollectionReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserFeedbackParticipantCollectionReported:(id)a3
{
  id v4 = (CDASchemaCDAUserFeedbackParticipantCollectionReported *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  unint64_t v12 = 108;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = v4;
}

- (void)deleteUserFeedbackCompleted
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userFeedbackCompleted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CDASchemaCDAUserFeedbackCompleted)userFeedbackCompleted
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_userFeedbackCompleted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserFeedbackCompleted:(id)a3
{
  id v4 = (CDASchemaCDAUserFeedbackCompleted *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  unint64_t v12 = 107;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = v4;
}

- (void)deleteElectionTimerEnded
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_electionTimerEnded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CDASchemaCDAElectionTimerEnded)electionTimerEnded
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_electionTimerEnded;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setElectionTimerEnded:(id)a3
{
  id v4 = (CDASchemaCDAElectionTimerEnded *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  unint64_t v12 = 106;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = v4;
}

- (void)deleteCdaAdvertisingEndChanged
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_cdaAdvertisingEndChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CDASchemaCDADeviceAdvertisingEndContext)cdaAdvertisingEndChanged
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_cdaAdvertisingEndChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCdaAdvertisingEndChanged:(id)a3
{
  id v4 = (CDASchemaCDADeviceAdvertisingEndContext *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  unint64_t v12 = 105;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = v4;
}

- (void)deleteCdaAdvertisingStartChanged
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_cdaAdvertisingStartChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CDASchemaCDADeviceAdvertisingStartContext)cdaAdvertisingStartChanged
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_cdaAdvertisingStartChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCdaAdvertisingStartChanged:(id)a3
{
  id v4 = (CDASchemaCDADeviceAdvertisingStartContext *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  unint64_t v12 = 104;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = v4;
}

- (void)deleteDeviceElectionStateContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_deviceElectionStateContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CDASchemaCDADeviceStateContext)deviceElectionStateContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_deviceElectionStateContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDeviceElectionStateContext:(id)a3
{
  id v4 = (CDASchemaCDADeviceStateContext *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  unint64_t v12 = 103;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = v4;
}

- (void)deleteDebugElectionDecisionMade
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_debugElectionDecisionMade = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CDASchemaCDADebugElectionDecisionMade)debugElectionDecisionMade
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_debugElectionDecisionMade;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDebugElectionDecisionMade:(id)a3
{
  id v4 = (CDASchemaCDADebugElectionDecisionMade *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  unint64_t v12 = 102;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = v4;
}

- (void)deleteElectionDecisionMade
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_electionDecisionMade = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CDASchemaCDAElectionDecisionMade)electionDecisionMade
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_electionDecisionMade;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setElectionDecisionMade:(id)a3
{
  id v4 = (CDASchemaCDAElectionDecisionMade *)a3;
  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  unint64_t v12 = 101;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = v4;
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
  unint64_t v2 = [(CDASchemaCDAClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 7) {
    return @"com.apple.aiml.siri.cda.CDAClientEvent";
  }
  else {
    return off_1E5EACBE0[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 44;
}

@end