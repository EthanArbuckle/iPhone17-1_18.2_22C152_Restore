@interface DODMLSchemaDODMLClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAudioFileResultTier1;
- (BOOL)hasEventMetadata;
- (BOOL)hasPersonalizationExperimentContext;
- (BOOL)hasUserEditExperimentContext;
- (BOOL)hasUserEditExperimentEndedTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRAudioFileResultTier1)audioFileResultTier1;
- (DODMLASRSchemaDODMLASRPersonalizationExperimentContext)personalizationExperimentContext;
- (DODMLASRSchemaDODMLASRUserEditExperimentContext)userEditExperimentContext;
- (DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1)userEditExperimentEndedTier1;
- (DODMLSchemaDODMLClientEvent)initWithDictionary:(id)a3;
- (DODMLSchemaDODMLClientEvent)initWithJSON:(id)a3;
- (DODMLSchemaDODMLClientEventMetadata)eventMetadata;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAudioFileResultTier1;
- (void)deleteEventMetadata;
- (void)deletePersonalizationExperimentContext;
- (void)deleteUserEditExperimentContext;
- (void)deleteUserEditExperimentEndedTier1;
- (void)setAudioFileResultTier1:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasAudioFileResultTier1:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasPersonalizationExperimentContext:(BOOL)a3;
- (void)setHasUserEditExperimentContext:(BOOL)a3;
- (void)setHasUserEditExperimentEndedTier1:(BOOL)a3;
- (void)setPersonalizationExperimentContext:(id)a3;
- (void)setUserEditExperimentContext:(id)a3;
- (void)setUserEditExperimentEndedTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLSchemaDODMLClientEvent

- (id)getComponentId
{
  v2 = [(DODMLSchemaDODMLClientEvent *)self eventMetadata];
  v3 = [v2 dodMlId];

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
  v22.receiver = self;
  v22.super_class = (Class)DODMLSchemaDODMLClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(DODMLSchemaDODMLClientEvent *)self deleteUserEditExperimentEndedTier1];
    [(DODMLSchemaDODMLClientEvent *)self deleteAudioFileResultTier1];
  }
  if ([v4 isConditionSet:4])
  {
    [(DODMLSchemaDODMLClientEvent *)self deleteUserEditExperimentEndedTier1];
    [(DODMLSchemaDODMLClientEvent *)self deleteAudioFileResultTier1];
  }
  if ([v4 isConditionSet:5])
  {
    [(DODMLSchemaDODMLClientEvent *)self deleteUserEditExperimentEndedTier1];
    [(DODMLSchemaDODMLClientEvent *)self deleteAudioFileResultTier1];
  }
  if ([v4 isConditionSet:6])
  {
    [(DODMLSchemaDODMLClientEvent *)self deleteUserEditExperimentEndedTier1];
    [(DODMLSchemaDODMLClientEvent *)self deleteAudioFileResultTier1];
  }
  if ([v4 isConditionSet:7])
  {
    [(DODMLSchemaDODMLClientEvent *)self deleteUserEditExperimentEndedTier1];
    [(DODMLSchemaDODMLClientEvent *)self deleteAudioFileResultTier1];
  }
  uint64_t v6 = [(DODMLSchemaDODMLClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DODMLSchemaDODMLClientEvent *)self deleteEventMetadata];
  }
  v9 = [(DODMLSchemaDODMLClientEvent *)self personalizationExperimentContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DODMLSchemaDODMLClientEvent *)self deletePersonalizationExperimentContext];
  }
  v12 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(DODMLSchemaDODMLClientEvent *)self deleteUserEditExperimentContext];
  }
  v15 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentEndedTier1];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(DODMLSchemaDODMLClientEvent *)self deleteUserEditExperimentEndedTier1];
  }
  v18 = [(DODMLSchemaDODMLClientEvent *)self audioFileResultTier1];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(DODMLSchemaDODMLClientEvent *)self deleteAudioFileResultTier1];
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
  unint64_t v3 = [(DODMLSchemaDODMLClientEvent *)self whichEvent_Type];
  if (v3 - 2 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA458[v3 - 2]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 3) {
    return 0;
  }
  else {
    return off_1E5EAA478[a3 - 2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileResultTier1, 0);
  objc_storeStrong((id *)&self->_userEditExperimentEndedTier1, 0);
  objc_storeStrong((id *)&self->_userEditExperimentContext, 0);
  objc_storeStrong((id *)&self->_personalizationExperimentContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasAudioFileResultTier1:(BOOL)a3
{
  self->_hasAudioFileResultTier1 = a3;
}

- (BOOL)hasAudioFileResultTier1
{
  return self->_hasAudioFileResultTier1;
}

- (void)setHasUserEditExperimentEndedTier1:(BOOL)a3
{
  self->_hasUserEditExperimentEndedTier1 = a3;
}

- (BOOL)hasUserEditExperimentEndedTier1
{
  return self->_hasUserEditExperimentEndedTier1;
}

- (void)setHasUserEditExperimentContext:(BOOL)a3
{
  self->_hasUserEditExperimentContext = a3;
}

- (BOOL)hasUserEditExperimentContext
{
  return self->_hasUserEditExperimentContext;
}

- (void)setHasPersonalizationExperimentContext:(BOOL)a3
{
  self->_hasPersonalizationExperimentContext = a3;
}

- (BOOL)hasPersonalizationExperimentContext
{
  return self->_hasPersonalizationExperimentContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (DODMLSchemaDODMLClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (DODMLSchemaDODMLClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DODMLSchemaDODMLClientEvent;
  v5 = [(DODMLSchemaDODMLClientEvent *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[DODMLSchemaDODMLClientEventMetadata alloc] initWithDictionary:v6];
      [(DODMLSchemaDODMLClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"personalizationExperimentContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[DODMLASRSchemaDODMLASRPersonalizationExperimentContext alloc] initWithDictionary:v8];
      [(DODMLSchemaDODMLClientEvent *)v5 setPersonalizationExperimentContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"userEditExperimentContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[DODMLASRSchemaDODMLASRUserEditExperimentContext alloc] initWithDictionary:v10];
      [(DODMLSchemaDODMLClientEvent *)v5 setUserEditExperimentContext:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"userEditExperimentEndedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 alloc] initWithDictionary:v12];
      [(DODMLSchemaDODMLClientEvent *)v5 setUserEditExperimentEndedTier1:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"audioFileResultTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[DODMLASRSchemaDODMLASRAudioFileResultTier1 alloc] initWithDictionary:v14];
      [(DODMLSchemaDODMLClientEvent *)v5 setAudioFileResultTier1:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (DODMLSchemaDODMLClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLSchemaDODMLClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLSchemaDODMLClientEvent *)self dictionaryRepresentation];
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
  if (self->_audioFileResultTier1)
  {
    id v4 = [(DODMLSchemaDODMLClientEvent *)self audioFileResultTier1];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"audioFileResultTier1"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"audioFileResultTier1"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v7 = [(DODMLSchemaDODMLClientEvent *)self eventMetadata];
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
  if (self->_personalizationExperimentContext)
  {
    v10 = [(DODMLSchemaDODMLClientEvent *)self personalizationExperimentContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"personalizationExperimentContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"personalizationExperimentContext"];
    }
  }
  if (self->_userEditExperimentContext)
  {
    v13 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"userEditExperimentContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"userEditExperimentContext"];
    }
  }
  if (self->_userEditExperimentEndedTier1)
  {
    v16 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentEndedTier1];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"userEditExperimentEndedTier1"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"userEditExperimentEndedTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DODMLSchemaDODMLClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentContext *)self->_personalizationExperimentContext hash] ^ v3;
  unint64_t v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentContext *)self->_userEditExperimentContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *)self->_userEditExperimentEndedTier1 hash];
  return v6 ^ [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self->_audioFileResultTier1 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_28;
  }
  unint64_t v6 = [(DODMLSchemaDODMLClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(DODMLSchemaDODMLClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(DODMLSchemaDODMLClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DODMLSchemaDODMLClientEvent *)self personalizationExperimentContext];
  uint64_t v7 = [v4 personalizationExperimentContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(DODMLSchemaDODMLClientEvent *)self personalizationExperimentContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(DODMLSchemaDODMLClientEvent *)self personalizationExperimentContext];
    v16 = [v4 personalizationExperimentContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentContext];
  uint64_t v7 = [v4 userEditExperimentContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentContext];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentContext];
    v21 = [v4 userEditExperimentContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentEndedTier1];
  uint64_t v7 = [v4 userEditExperimentEndedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentEndedTier1];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentEndedTier1];
    v26 = [v4 userEditExperimentEndedTier1];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(DODMLSchemaDODMLClientEvent *)self audioFileResultTier1];
  uint64_t v7 = [v4 audioFileResultTier1];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(DODMLSchemaDODMLClientEvent *)self audioFileResultTier1];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(DODMLSchemaDODMLClientEvent *)self audioFileResultTier1];
    v31 = [v4 audioFileResultTier1];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_31;
    }
  }
  else
  {
LABEL_27:
  }
LABEL_28:
  BOOL v33 = 0;
LABEL_29:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(DODMLSchemaDODMLClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(DODMLSchemaDODMLClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(DODMLSchemaDODMLClientEvent *)self personalizationExperimentContext];

  if (v6)
  {
    uint64_t v7 = [(DODMLSchemaDODMLClientEvent *)self personalizationExperimentContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentContext];

  if (v8)
  {
    v9 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentEndedTier1];

  if (v10)
  {
    int v11 = [(DODMLSchemaDODMLClientEvent *)self userEditExperimentEndedTier1];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(DODMLSchemaDODMLClientEvent *)self audioFileResultTier1];

  if (v12)
  {
    uint64_t v13 = [(DODMLSchemaDODMLClientEvent *)self audioFileResultTier1];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLSchemaDODMLClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioFileResultTier1
{
  if (self->_whichEvent_Type == 5)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioFileResultTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DODMLASRSchemaDODMLASRAudioFileResultTier1)audioFileResultTier1
{
  if (self->_whichEvent_Type == 5) {
    v2 = self->_audioFileResultTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAudioFileResultTier1:(id)a3
{
  id v4 = (DODMLASRSchemaDODMLASRAudioFileResultTier1 *)a3;
  personalizationExperimentContext = self->_personalizationExperimentContext;
  self->_personalizationExperimentContext = 0;

  userEditExperimentContext = self->_userEditExperimentContext;
  self->_userEditExperimentContext = 0;

  userEditExperimentEndedTier1 = self->_userEditExperimentEndedTier1;
  self->_userEditExperimentEndedTier1 = 0;

  unint64_t v8 = 5;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  audioFileResultTier1 = self->_audioFileResultTier1;
  self->_audioFileResultTier1 = v4;
}

- (void)deleteUserEditExperimentEndedTier1
{
  if (self->_whichEvent_Type == 4)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userEditExperimentEndedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1)userEditExperimentEndedTier1
{
  if (self->_whichEvent_Type == 4) {
    v2 = self->_userEditExperimentEndedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserEditExperimentEndedTier1:(id)a3
{
  id v4 = (DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *)a3;
  personalizationExperimentContext = self->_personalizationExperimentContext;
  self->_personalizationExperimentContext = 0;

  userEditExperimentContext = self->_userEditExperimentContext;
  self->_userEditExperimentContext = 0;

  audioFileResultTier1 = self->_audioFileResultTier1;
  self->_audioFileResultTier1 = 0;

  self->_unint64_t whichEvent_Type = 4 * (v4 != 0);
  userEditExperimentEndedTier1 = self->_userEditExperimentEndedTier1;
  self->_userEditExperimentEndedTier1 = v4;
}

- (void)deleteUserEditExperimentContext
{
  if (self->_whichEvent_Type == 3)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userEditExperimentContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DODMLASRSchemaDODMLASRUserEditExperimentContext)userEditExperimentContext
{
  if (self->_whichEvent_Type == 3) {
    v2 = self->_userEditExperimentContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserEditExperimentContext:(id)a3
{
  id v4 = (DODMLASRSchemaDODMLASRUserEditExperimentContext *)a3;
  personalizationExperimentContext = self->_personalizationExperimentContext;
  self->_personalizationExperimentContext = 0;

  userEditExperimentEndedTier1 = self->_userEditExperimentEndedTier1;
  self->_userEditExperimentEndedTier1 = 0;

  audioFileResultTier1 = self->_audioFileResultTier1;
  self->_audioFileResultTier1 = 0;

  unint64_t v8 = 3;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  userEditExperimentContext = self->_userEditExperimentContext;
  self->_userEditExperimentContext = v4;
}

- (void)deletePersonalizationExperimentContext
{
  if (self->_whichEvent_Type == 2)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_personalizationExperimentContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DODMLASRSchemaDODMLASRPersonalizationExperimentContext)personalizationExperimentContext
{
  if (self->_whichEvent_Type == 2) {
    v2 = self->_personalizationExperimentContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPersonalizationExperimentContext:(id)a3
{
  id v4 = (DODMLASRSchemaDODMLASRPersonalizationExperimentContext *)a3;
  userEditExperimentContext = self->_userEditExperimentContext;
  self->_userEditExperimentContext = 0;

  userEditExperimentEndedTier1 = self->_userEditExperimentEndedTier1;
  self->_userEditExperimentEndedTier1 = 0;

  audioFileResultTier1 = self->_audioFileResultTier1;
  self->_audioFileResultTier1 = 0;

  self->_unint64_t whichEvent_Type = 2 * (v4 != 0);
  personalizationExperimentContext = self->_personalizationExperimentContext;
  self->_personalizationExperimentContext = v4;
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
  unint64_t v2 = [(DODMLSchemaDODMLClientEvent *)self whichEvent_Type];
  if (v2 - 2 > 3) {
    return @"com.apple.aiml.siri.dodml.DODMLClientEvent";
  }
  else {
    return off_1E5EAE5F8[v2 - 2];
  }
}

- (int)getAnyEventType
{
  return 37;
}

@end