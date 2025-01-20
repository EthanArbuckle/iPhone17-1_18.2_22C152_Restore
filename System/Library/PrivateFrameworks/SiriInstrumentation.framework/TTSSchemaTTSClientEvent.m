@interface TTSSchemaTTSClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasRequestReceived;
- (BOOL)hasRequestReceivedTier1;
- (BOOL)hasSpeechContext;
- (BOOL)hasSynthesisContext;
- (BOOL)hasVoiceFallbackOccurred;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (TTSSchemaTTSClientEvent)initWithDictionary:(id)a3;
- (TTSSchemaTTSClientEvent)initWithJSON:(id)a3;
- (TTSSchemaTTSClientEventMetadata)eventMetadata;
- (TTSSchemaTTSClientSpeechContext)speechContext;
- (TTSSchemaTTSClientSynthesisContext)synthesisContext;
- (TTSSchemaTTSRequestReceived)requestReceived;
- (TTSSchemaTTSRequestReceivedTier1)requestReceivedTier1;
- (TTSSchemaTTSVoiceFallbackOccurred)voiceFallbackOccurred;
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
- (void)deleteRequestReceived;
- (void)deleteRequestReceivedTier1;
- (void)deleteSpeechContext;
- (void)deleteSynthesisContext;
- (void)deleteVoiceFallbackOccurred;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasRequestReceived:(BOOL)a3;
- (void)setHasRequestReceivedTier1:(BOOL)a3;
- (void)setHasSpeechContext:(BOOL)a3;
- (void)setHasSynthesisContext:(BOOL)a3;
- (void)setHasVoiceFallbackOccurred:(BOOL)a3;
- (void)setRequestReceived:(id)a3;
- (void)setRequestReceivedTier1:(id)a3;
- (void)setSpeechContext:(id)a3;
- (void)setSynthesisContext:(id)a3;
- (void)setVoiceFallbackOccurred:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTSSchemaTTSClientEvent

- (int)componentName
{
  v3 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
  v4 = [v3 ttsId];

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
    int v9 = 13;
  }
  else
  {
LABEL_5:
    v10 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
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
  v3 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
  v4 = [v3 ttsId];

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
  int v9 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
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
  v25.receiver = self;
  v25.super_class = (Class)TTSSchemaTTSClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v25 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(TTSSchemaTTSClientEvent *)self deleteRequestReceivedTier1];
  }
  if ([v4 isConditionSet:4]) {
    [(TTSSchemaTTSClientEvent *)self deleteRequestReceivedTier1];
  }
  if ([v4 isConditionSet:5]) {
    [(TTSSchemaTTSClientEvent *)self deleteRequestReceivedTier1];
  }
  if ([v4 isConditionSet:6]) {
    [(TTSSchemaTTSClientEvent *)self deleteRequestReceivedTier1];
  }
  if ([v4 isConditionSet:7]) {
    [(TTSSchemaTTSClientEvent *)self deleteRequestReceivedTier1];
  }
  v6 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(TTSSchemaTTSClientEvent *)self deleteEventMetadata];
  }
  int v9 = [(TTSSchemaTTSClientEvent *)self speechContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(TTSSchemaTTSClientEvent *)self deleteSpeechContext];
  }
  uint64_t v12 = [(TTSSchemaTTSClientEvent *)self requestReceived];
  uint64_t v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(TTSSchemaTTSClientEvent *)self deleteRequestReceived];
  }
  v15 = [(TTSSchemaTTSClientEvent *)self requestReceivedTier1];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(TTSSchemaTTSClientEvent *)self deleteRequestReceivedTier1];
  }
  v18 = [(TTSSchemaTTSClientEvent *)self voiceFallbackOccurred];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(TTSSchemaTTSClientEvent *)self deleteVoiceFallbackOccurred];
  }
  v21 = [(TTSSchemaTTSClientEvent *)self synthesisContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(TTSSchemaTTSClientEvent *)self deleteSynthesisContext];
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
  unint64_t v3 = [(TTSSchemaTTSClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 4) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAC138[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4) {
    return 0;
  }
  else {
    return off_1E5EAC160[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisContext, 0);
  objc_storeStrong((id *)&self->_voiceFallbackOccurred, 0);
  objc_storeStrong((id *)&self->_requestReceivedTier1, 0);
  objc_storeStrong((id *)&self->_requestReceived, 0);
  objc_storeStrong((id *)&self->_speechContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasSynthesisContext:(BOOL)a3
{
  self->_hasSynthesisContext = a3;
}

- (BOOL)hasSynthesisContext
{
  return self->_hasSynthesisContext;
}

- (void)setHasVoiceFallbackOccurred:(BOOL)a3
{
  self->_hasVoiceFallbackOccurred = a3;
}

- (BOOL)hasVoiceFallbackOccurred
{
  return self->_hasVoiceFallbackOccurred;
}

- (void)setHasRequestReceivedTier1:(BOOL)a3
{
  self->_hasRequestReceivedTier1 = a3;
}

- (BOOL)hasRequestReceivedTier1
{
  return self->_hasRequestReceivedTier1;
}

- (void)setHasRequestReceived:(BOOL)a3
{
  self->_hasRequestReceived = a3;
}

- (BOOL)hasRequestReceived
{
  return self->_hasRequestReceived;
}

- (void)setHasSpeechContext:(BOOL)a3
{
  self->_hasSpeechContext = a3;
}

- (BOOL)hasSpeechContext
{
  return self->_hasSpeechContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (TTSSchemaTTSClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (TTSSchemaTTSClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TTSSchemaTTSClientEvent;
  uint64_t v5 = [(TTSSchemaTTSClientEvent *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[TTSSchemaTTSClientEventMetadata alloc] initWithDictionary:v6];
      [(TTSSchemaTTSClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"speechContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [[TTSSchemaTTSClientSpeechContext alloc] initWithDictionary:v8];
      [(TTSSchemaTTSClientEvent *)v5 setSpeechContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"requestReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[TTSSchemaTTSRequestReceived alloc] initWithDictionary:v10];
      [(TTSSchemaTTSClientEvent *)v5 setRequestReceived:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"requestReceivedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [[TTSSchemaTTSRequestReceivedTier1 alloc] initWithDictionary:v12];
      [(TTSSchemaTTSClientEvent *)v5 setRequestReceivedTier1:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"voiceFallbackOccurred"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[TTSSchemaTTSVoiceFallbackOccurred alloc] initWithDictionary:v14];
      [(TTSSchemaTTSClientEvent *)v5 setVoiceFallbackOccurred:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"synthesisContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[TTSSchemaTTSClientSynthesisContext alloc] initWithDictionary:v16];
      [(TTSSchemaTTSClientEvent *)v5 setSynthesisContext:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (TTSSchemaTTSClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(TTSSchemaTTSClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTSSchemaTTSClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
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
  if (self->_requestReceived)
  {
    uint64_t v7 = [(TTSSchemaTTSClientEvent *)self requestReceived];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"requestReceived"];
    }
    else
    {
      int v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"requestReceived"];
    }
  }
  if (self->_requestReceivedTier1)
  {
    v10 = [(TTSSchemaTTSClientEvent *)self requestReceivedTier1];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"requestReceivedTier1"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"requestReceivedTier1"];
    }
  }
  if (self->_speechContext)
  {
    uint64_t v13 = [(TTSSchemaTTSClientEvent *)self speechContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"speechContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"speechContext"];
    }
  }
  if (self->_synthesisContext)
  {
    v16 = [(TTSSchemaTTSClientEvent *)self synthesisContext];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"synthesisContext"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"synthesisContext"];
    }
  }
  if (self->_voiceFallbackOccurred)
  {
    v19 = [(TTSSchemaTTSClientEvent *)self voiceFallbackOccurred];
    objc_super v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"voiceFallbackOccurred"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"voiceFallbackOccurred"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TTSSchemaTTSClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(TTSSchemaTTSClientSpeechContext *)self->_speechContext hash] ^ v3;
  unint64_t v5 = [(TTSSchemaTTSRequestReceived *)self->_requestReceived hash];
  unint64_t v6 = v4 ^ v5 ^ [(TTSSchemaTTSRequestReceivedTier1 *)self->_requestReceivedTier1 hash];
  unint64_t v7 = [(TTSSchemaTTSVoiceFallbackOccurred *)self->_voiceFallbackOccurred hash];
  return v6 ^ v7 ^ [(TTSSchemaTTSClientSynthesisContext *)self->_synthesisContext hash];
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
  unint64_t v6 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v8 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(TTSSchemaTTSClientEvent *)self speechContext];
  unint64_t v7 = [v4 speechContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v13 = [(TTSSchemaTTSClientEvent *)self speechContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(TTSSchemaTTSClientEvent *)self speechContext];
    v16 = [v4 speechContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(TTSSchemaTTSClientEvent *)self requestReceived];
  unint64_t v7 = [v4 requestReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v18 = [(TTSSchemaTTSClientEvent *)self requestReceived];
  if (v18)
  {
    v19 = (void *)v18;
    objc_super v20 = [(TTSSchemaTTSClientEvent *)self requestReceived];
    v21 = [v4 requestReceived];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(TTSSchemaTTSClientEvent *)self requestReceivedTier1];
  unint64_t v7 = [v4 requestReceivedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v23 = [(TTSSchemaTTSClientEvent *)self requestReceivedTier1];
  if (v23)
  {
    v24 = (void *)v23;
    objc_super v25 = [(TTSSchemaTTSClientEvent *)self requestReceivedTier1];
    v26 = [v4 requestReceivedTier1];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(TTSSchemaTTSClientEvent *)self voiceFallbackOccurred];
  unint64_t v7 = [v4 voiceFallbackOccurred];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v28 = [(TTSSchemaTTSClientEvent *)self voiceFallbackOccurred];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(TTSSchemaTTSClientEvent *)self voiceFallbackOccurred];
    v31 = [v4 voiceFallbackOccurred];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(TTSSchemaTTSClientEvent *)self synthesisContext];
  unint64_t v7 = [v4 synthesisContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v33 = [(TTSSchemaTTSClientEvent *)self synthesisContext];
    if (!v33)
    {

LABEL_36:
      BOOL v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    v35 = [(TTSSchemaTTSClientEvent *)self synthesisContext];
    v36 = [v4 synthesisContext];
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
  id v4 = [(TTSSchemaTTSClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(TTSSchemaTTSClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(TTSSchemaTTSClientEvent *)self speechContext];

  if (v6)
  {
    unint64_t v7 = [(TTSSchemaTTSClientEvent *)self speechContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(TTSSchemaTTSClientEvent *)self requestReceived];

  if (v8)
  {
    int v9 = [(TTSSchemaTTSClientEvent *)self requestReceived];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(TTSSchemaTTSClientEvent *)self requestReceivedTier1];

  if (v10)
  {
    int v11 = [(TTSSchemaTTSClientEvent *)self requestReceivedTier1];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(TTSSchemaTTSClientEvent *)self voiceFallbackOccurred];

  if (v12)
  {
    uint64_t v13 = [(TTSSchemaTTSClientEvent *)self voiceFallbackOccurred];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(TTSSchemaTTSClientEvent *)self synthesisContext];

  if (v14)
  {
    v15 = [(TTSSchemaTTSClientEvent *)self synthesisContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSynthesisContext
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_synthesisContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (TTSSchemaTTSClientSynthesisContext)synthesisContext
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_synthesisContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSynthesisContext:(id)a3
{
  id v4 = (TTSSchemaTTSClientSynthesisContext *)a3;
  speechContext = self->_speechContext;
  self->_speechContext = 0;

  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = 0;

  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = 0;

  unint64_t v9 = 105;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = v4;
}

- (void)deleteVoiceFallbackOccurred
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_voiceFallbackOccurred = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (TTSSchemaTTSVoiceFallbackOccurred)voiceFallbackOccurred
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_voiceFallbackOccurred;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVoiceFallbackOccurred:(id)a3
{
  id v4 = (TTSSchemaTTSVoiceFallbackOccurred *)a3;
  speechContext = self->_speechContext;
  self->_speechContext = 0;

  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = 0;

  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = 0;

  unint64_t v9 = 104;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = v4;
}

- (void)deleteRequestReceivedTier1
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestReceivedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (TTSSchemaTTSRequestReceivedTier1)requestReceivedTier1
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_requestReceivedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestReceivedTier1:(id)a3
{
  id v4 = (TTSSchemaTTSRequestReceivedTier1 *)a3;
  speechContext = self->_speechContext;
  self->_speechContext = 0;

  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = 0;

  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = 0;

  unint64_t v9 = 103;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = v4;
}

- (void)deleteRequestReceived
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (TTSSchemaTTSRequestReceived)requestReceived
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_requestReceived;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestReceived:(id)a3
{
  id v4 = (TTSSchemaTTSRequestReceived *)a3;
  speechContext = self->_speechContext;
  self->_speechContext = 0;

  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = 0;

  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = 0;

  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = 0;

  unint64_t v9 = 102;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  requestReceived = self->_requestReceived;
  self->_requestReceived = v4;
}

- (void)deleteSpeechContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speechContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (TTSSchemaTTSClientSpeechContext)speechContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_speechContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeechContext:(id)a3
{
  id v4 = (TTSSchemaTTSClientSpeechContext *)a3;
  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = 0;

  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = 0;

  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = 0;

  unint64_t v9 = 101;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  speechContext = self->_speechContext;
  self->_speechContext = v4;
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
  unint64_t v2 = [(TTSSchemaTTSClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 4) {
    return @"com.apple.aiml.siri.tts.TTSClientEvent";
  }
  else {
    return off_1E5EB97D0[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 24;
}

@end