@interface ANCSchemaANCClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (ANCSchemaANCClientEvent)initWithDictionary:(id)a3;
- (ANCSchemaANCClientEvent)initWithJSON:(id)a3;
- (ANCSchemaANCClientEventMetadata)eventMetadata;
- (ANCSchemaANCNotificationReceived)notificationReceived;
- (ANCSchemaANCNotificationReceivedTier1)notificationReceivedTier1;
- (ANCSchemaANCUserResponseEvaluated)userResponseEvaluated;
- (BOOL)hasEventMetadata;
- (BOOL)hasNotificationReceived;
- (BOOL)hasNotificationReceivedTier1;
- (BOOL)hasUserResponseEvaluated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)deleteNotificationReceived;
- (void)deleteNotificationReceivedTier1;
- (void)deleteUserResponseEvaluated;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasNotificationReceived:(BOOL)a3;
- (void)setHasNotificationReceivedTier1:(BOOL)a3;
- (void)setHasUserResponseEvaluated:(BOOL)a3;
- (void)setNotificationReceived:(id)a3;
- (void)setNotificationReceivedTier1:(id)a3;
- (void)setUserResponseEvaluated:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ANCSchemaANCClientEvent

- (int)componentName
{
  v3 = [(ANCSchemaANCClientEvent *)self eventMetadata];
  v4 = [v3 ancId];

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
    int v9 = 12;
  }
  else
  {
LABEL_5:
    v10 = [(ANCSchemaANCClientEvent *)self eventMetadata];
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
  v3 = [(ANCSchemaANCClientEvent *)self eventMetadata];
  v4 = [v3 ancId];

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
  int v9 = [(ANCSchemaANCClientEvent *)self eventMetadata];
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
  v19.receiver = self;
  v19.super_class = (Class)ANCSchemaANCClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(ANCSchemaANCClientEvent *)self deleteNotificationReceivedTier1];
  }
  if ([v4 isConditionSet:4]) {
    [(ANCSchemaANCClientEvent *)self deleteNotificationReceivedTier1];
  }
  if ([v4 isConditionSet:5]) {
    [(ANCSchemaANCClientEvent *)self deleteNotificationReceivedTier1];
  }
  if ([v4 isConditionSet:6]) {
    [(ANCSchemaANCClientEvent *)self deleteNotificationReceivedTier1];
  }
  if ([v4 isConditionSet:7]) {
    [(ANCSchemaANCClientEvent *)self deleteNotificationReceivedTier1];
  }
  v6 = [(ANCSchemaANCClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ANCSchemaANCClientEvent *)self deleteEventMetadata];
  }
  int v9 = [(ANCSchemaANCClientEvent *)self notificationReceived];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ANCSchemaANCClientEvent *)self deleteNotificationReceived];
  }
  uint64_t v12 = [(ANCSchemaANCClientEvent *)self userResponseEvaluated];
  uint64_t v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ANCSchemaANCClientEvent *)self deleteUserResponseEvaluated];
  }
  v15 = [(ANCSchemaANCClientEvent *)self notificationReceivedTier1];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ANCSchemaANCClientEvent *)self deleteNotificationReceivedTier1];
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
  unint64_t v3 = [(ANCSchemaANCClientEvent *)self whichEvent_Type];
  if (v3 - 2 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EA9C50[v3 - 2]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 2) {
    return 0;
  }
  else {
    return off_1E5EA9C68[a3 - 2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationReceivedTier1, 0);
  objc_storeStrong((id *)&self->_userResponseEvaluated, 0);
  objc_storeStrong((id *)&self->_notificationReceived, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasNotificationReceivedTier1:(BOOL)a3
{
  self->_hasNotificationReceivedTier1 = a3;
}

- (BOOL)hasNotificationReceivedTier1
{
  return self->_hasNotificationReceivedTier1;
}

- (void)setHasUserResponseEvaluated:(BOOL)a3
{
  self->_hasUserResponseEvaluated = a3;
}

- (BOOL)hasUserResponseEvaluated
{
  return self->_hasUserResponseEvaluated;
}

- (void)setHasNotificationReceived:(BOOL)a3
{
  self->_hasNotificationReceived = a3;
}

- (BOOL)hasNotificationReceived
{
  return self->_hasNotificationReceived;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (ANCSchemaANCClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ANCSchemaANCClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ANCSchemaANCClientEvent;
  uint64_t v5 = [(ANCSchemaANCClientEvent *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ANCSchemaANCClientEventMetadata alloc] initWithDictionary:v6];
      [(ANCSchemaANCClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"notificationReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [[ANCSchemaANCNotificationReceived alloc] initWithDictionary:v8];
      [(ANCSchemaANCClientEvent *)v5 setNotificationReceived:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"userResponseEvaluated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ANCSchemaANCUserResponseEvaluated alloc] initWithDictionary:v10];
      [(ANCSchemaANCClientEvent *)v5 setUserResponseEvaluated:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"notificationReceivedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [[ANCSchemaANCNotificationReceivedTier1 alloc] initWithDictionary:v12];
      [(ANCSchemaANCClientEvent *)v5 setNotificationReceivedTier1:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (ANCSchemaANCClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(ANCSchemaANCClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ANCSchemaANCClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(ANCSchemaANCClientEvent *)self eventMetadata];
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
  if (self->_notificationReceived)
  {
    uint64_t v7 = [(ANCSchemaANCClientEvent *)self notificationReceived];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"notificationReceived"];
    }
    else
    {
      int v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"notificationReceived"];
    }
  }
  if (self->_notificationReceivedTier1)
  {
    v10 = [(ANCSchemaANCClientEvent *)self notificationReceivedTier1];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"notificationReceivedTier1"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"notificationReceivedTier1"];
    }
  }
  if (self->_userResponseEvaluated)
  {
    uint64_t v13 = [(ANCSchemaANCClientEvent *)self userResponseEvaluated];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"userResponseEvaluated"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"userResponseEvaluated"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ANCSchemaANCClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(ANCSchemaANCNotificationReceived *)self->_notificationReceived hash] ^ v3;
  unint64_t v5 = [(ANCSchemaANCUserResponseEvaluated *)self->_userResponseEvaluated hash];
  return v4 ^ v5 ^ [(ANCSchemaANCNotificationReceivedTier1 *)self->_notificationReceivedTier1 hash];
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
  v6 = [(ANCSchemaANCClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(ANCSchemaANCClientEvent *)self eventMetadata];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = [(ANCSchemaANCClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(ANCSchemaANCClientEvent *)self notificationReceived];
  uint64_t v7 = [v4 notificationReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(ANCSchemaANCClientEvent *)self notificationReceived];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(ANCSchemaANCClientEvent *)self notificationReceived];
    objc_super v16 = [v4 notificationReceived];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(ANCSchemaANCClientEvent *)self userResponseEvaluated];
  uint64_t v7 = [v4 userResponseEvaluated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(ANCSchemaANCClientEvent *)self userResponseEvaluated];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(ANCSchemaANCClientEvent *)self userResponseEvaluated];
    v21 = [v4 userResponseEvaluated];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(ANCSchemaANCClientEvent *)self notificationReceivedTier1];
  uint64_t v7 = [v4 notificationReceivedTier1];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(ANCSchemaANCClientEvent *)self notificationReceivedTier1];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(ANCSchemaANCClientEvent *)self notificationReceivedTier1];
    v26 = [v4 notificationReceivedTier1];
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
  id v4 = [(ANCSchemaANCClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(ANCSchemaANCClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ANCSchemaANCClientEvent *)self notificationReceived];

  if (v6)
  {
    uint64_t v7 = [(ANCSchemaANCClientEvent *)self notificationReceived];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(ANCSchemaANCClientEvent *)self userResponseEvaluated];

  if (v8)
  {
    int v9 = [(ANCSchemaANCClientEvent *)self userResponseEvaluated];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(ANCSchemaANCClientEvent *)self notificationReceivedTier1];

  if (v10)
  {
    int v11 = [(ANCSchemaANCClientEvent *)self notificationReceivedTier1];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteNotificationReceivedTier1
{
  if (self->_whichEvent_Type == 4)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_notificationReceivedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ANCSchemaANCNotificationReceivedTier1)notificationReceivedTier1
{
  if (self->_whichEvent_Type == 4) {
    v2 = self->_notificationReceivedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNotificationReceivedTier1:(id)a3
{
  id v4 = (ANCSchemaANCNotificationReceivedTier1 *)a3;
  notificationReceived = self->_notificationReceived;
  self->_notificationReceived = 0;

  userResponseEvaluated = self->_userResponseEvaluated;
  self->_userResponseEvaluated = 0;

  self->_unint64_t whichEvent_Type = 4 * (v4 != 0);
  notificationReceivedTier1 = self->_notificationReceivedTier1;
  self->_notificationReceivedTier1 = v4;
}

- (void)deleteUserResponseEvaluated
{
  if (self->_whichEvent_Type == 3)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userResponseEvaluated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ANCSchemaANCUserResponseEvaluated)userResponseEvaluated
{
  if (self->_whichEvent_Type == 3) {
    v2 = self->_userResponseEvaluated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserResponseEvaluated:(id)a3
{
  id v4 = (ANCSchemaANCUserResponseEvaluated *)a3;
  notificationReceived = self->_notificationReceived;
  self->_notificationReceived = 0;

  notificationReceivedTier1 = self->_notificationReceivedTier1;
  self->_notificationReceivedTier1 = 0;

  unint64_t v7 = 3;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  userResponseEvaluated = self->_userResponseEvaluated;
  self->_userResponseEvaluated = v4;
}

- (void)deleteNotificationReceived
{
  if (self->_whichEvent_Type == 2)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_notificationReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ANCSchemaANCNotificationReceived)notificationReceived
{
  if (self->_whichEvent_Type == 2) {
    v2 = self->_notificationReceived;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNotificationReceived:(id)a3
{
  id v4 = (ANCSchemaANCNotificationReceived *)a3;
  userResponseEvaluated = self->_userResponseEvaluated;
  self->_userResponseEvaluated = 0;

  notificationReceivedTier1 = self->_notificationReceivedTier1;
  self->_notificationReceivedTier1 = 0;

  self->_unint64_t whichEvent_Type = 2 * (v4 != 0);
  notificationReceived = self->_notificationReceived;
  self->_notificationReceived = v4;
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
  unint64_t v2 = [(ANCSchemaANCClientEvent *)self whichEvent_Type];
  if (v2 - 2 > 2) {
    return @"com.apple.aiml.siri.anc.ANCClientEvent";
  }
  else {
    return off_1E5EAC270[v2 - 2];
  }
}

- (int)getAnyEventType
{
  return 28;
}

@end