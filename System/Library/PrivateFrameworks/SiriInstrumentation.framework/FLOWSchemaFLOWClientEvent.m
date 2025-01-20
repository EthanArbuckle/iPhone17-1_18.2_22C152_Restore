@interface FLOWSchemaFLOWClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAppleMusicVoicePreviewOfferNotShown;
- (BOOL)hasEventMetadata;
- (BOOL)hasFlowDomainExecutionContext;
- (BOOL)hasFlowEntityContextTier1;
- (BOOL)hasFlowStep;
- (BOOL)hasLocationAccessPermissionPromptContext;
- (BOOL)hasMediaPlayerPlaybackContextTier1;
- (BOOL)hasMediaPlayerRadioStationContextTier1;
- (BOOL)hasPegasusContextTier1;
- (BOOL)hasSmsAttachmentMetadataTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown)appleMusicVoicePreviewOfferNotShown;
- (FLOWSchemaFLOWClientEvent)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWClientEvent)initWithJSON:(id)a3;
- (FLOWSchemaFLOWDomainExecutionContext)flowDomainExecutionContext;
- (FLOWSchemaFLOWEntityContextTier1)flowEntityContextTier1;
- (FLOWSchemaFLOWEventMetadata)eventMetadata;
- (FLOWSchemaFLOWLocationAccessPermissionPromptContext)locationAccessPermissionPromptContext;
- (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1)mediaPlayerPlaybackContextTier1;
- (FLOWSchemaFLOWMediaPlayerRadioStationContextTier1)mediaPlayerRadioStationContextTier1;
- (FLOWSchemaFLOWPegasusContextTier1)pegasusContextTier1;
- (FLOWSchemaFLOWSmsAttachmentMetadataTier1)smsAttachmentMetadataTier1;
- (FLOWSchemaFLOWStep)flowStep;
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
- (void)deleteAppleMusicVoicePreviewOfferNotShown;
- (void)deleteEventMetadata;
- (void)deleteFlowDomainExecutionContext;
- (void)deleteFlowEntityContextTier1;
- (void)deleteFlowStep;
- (void)deleteLocationAccessPermissionPromptContext;
- (void)deleteMediaPlayerPlaybackContextTier1;
- (void)deleteMediaPlayerRadioStationContextTier1;
- (void)deletePegasusContextTier1;
- (void)deleteSmsAttachmentMetadataTier1;
- (void)setAppleMusicVoicePreviewOfferNotShown:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setFlowDomainExecutionContext:(id)a3;
- (void)setFlowEntityContextTier1:(id)a3;
- (void)setFlowStep:(id)a3;
- (void)setHasAppleMusicVoicePreviewOfferNotShown:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasFlowDomainExecutionContext:(BOOL)a3;
- (void)setHasFlowEntityContextTier1:(BOOL)a3;
- (void)setHasFlowStep:(BOOL)a3;
- (void)setHasLocationAccessPermissionPromptContext:(BOOL)a3;
- (void)setHasMediaPlayerPlaybackContextTier1:(BOOL)a3;
- (void)setHasMediaPlayerRadioStationContextTier1:(BOOL)a3;
- (void)setHasPegasusContextTier1:(BOOL)a3;
- (void)setHasSmsAttachmentMetadataTier1:(BOOL)a3;
- (void)setLocationAccessPermissionPromptContext:(id)a3;
- (void)setMediaPlayerPlaybackContextTier1:(id)a3;
- (void)setMediaPlayerRadioStationContextTier1:(id)a3;
- (void)setPegasusContextTier1:(id)a3;
- (void)setSmsAttachmentMetadataTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWClientEvent

- (int)componentName
{
  v3 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
  v4 = [v3 flowId];

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
    LODWORD(v9) = 3;
  }
  else
  {
LABEL_5:
    v10 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
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
      v16 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
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
  v3 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
  v4 = [v3 flowId];

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
  v9 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
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
  uint64_t v15 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
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
  v37.receiver = self;
  v37.super_class = (Class)FLOWSchemaFLOWClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v37 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(FLOWSchemaFLOWClientEvent *)self deleteFlowEntityContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deletePegasusContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerPlaybackContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerRadioStationContextTier1];
  }
  if ([v4 isConditionSet:4])
  {
    [(FLOWSchemaFLOWClientEvent *)self deleteFlowEntityContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deletePegasusContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerPlaybackContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerRadioStationContextTier1];
  }
  if ([v4 isConditionSet:5])
  {
    [(FLOWSchemaFLOWClientEvent *)self deleteFlowEntityContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deletePegasusContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerPlaybackContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerRadioStationContextTier1];
  }
  if ([v4 isConditionSet:6])
  {
    [(FLOWSchemaFLOWClientEvent *)self deleteFlowEntityContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deletePegasusContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerPlaybackContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerRadioStationContextTier1];
  }
  if ([v4 isConditionSet:7])
  {
    [(FLOWSchemaFLOWClientEvent *)self deleteFlowEntityContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deletePegasusContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerPlaybackContextTier1];
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerRadioStationContextTier1];
  }
  v6 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWClientEvent *)self deleteEventMetadata];
  }
  v9 = [(FLOWSchemaFLOWClientEvent *)self flowStep];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWClientEvent *)self deleteFlowStep];
  }
  uint64_t v12 = [(FLOWSchemaFLOWClientEvent *)self flowEntityContextTier1];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(FLOWSchemaFLOWClientEvent *)self deleteFlowEntityContextTier1];
  }
  uint64_t v15 = [(FLOWSchemaFLOWClientEvent *)self smsAttachmentMetadataTier1];
  id v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(FLOWSchemaFLOWClientEvent *)self deleteSmsAttachmentMetadataTier1];
  }
  uint64_t v18 = [(FLOWSchemaFLOWClientEvent *)self appleMusicVoicePreviewOfferNotShown];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(FLOWSchemaFLOWClientEvent *)self deleteAppleMusicVoicePreviewOfferNotShown];
  }
  v21 = [(FLOWSchemaFLOWClientEvent *)self pegasusContextTier1];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(FLOWSchemaFLOWClientEvent *)self deletePegasusContextTier1];
  }
  v24 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerPlaybackContextTier1];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerPlaybackContextTier1];
  }
  v27 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerRadioStationContextTier1];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(FLOWSchemaFLOWClientEvent *)self deleteMediaPlayerRadioStationContextTier1];
  }
  v30 = [(FLOWSchemaFLOWClientEvent *)self flowDomainExecutionContext];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(FLOWSchemaFLOWClientEvent *)self deleteFlowDomainExecutionContext];
  }
  v33 = [(FLOWSchemaFLOWClientEvent *)self locationAccessPermissionPromptContext];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(FLOWSchemaFLOWClientEvent *)self deleteLocationAccessPermissionPromptContext];
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
  unint64_t v3 = [(FLOWSchemaFLOWClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 8) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA4E8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 8) {
    return 0;
  }
  else {
    return off_1E5EAA530[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAccessPermissionPromptContext, 0);
  objc_storeStrong((id *)&self->_flowDomainExecutionContext, 0);
  objc_storeStrong((id *)&self->_mediaPlayerRadioStationContextTier1, 0);
  objc_storeStrong((id *)&self->_mediaPlayerPlaybackContextTier1, 0);
  objc_storeStrong((id *)&self->_pegasusContextTier1, 0);
  objc_storeStrong((id *)&self->_appleMusicVoicePreviewOfferNotShown, 0);
  objc_storeStrong((id *)&self->_smsAttachmentMetadataTier1, 0);
  objc_storeStrong((id *)&self->_flowEntityContextTier1, 0);
  objc_storeStrong((id *)&self->_flowStep, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasLocationAccessPermissionPromptContext:(BOOL)a3
{
  self->_hasLocationAccessPermissionPromptContext = a3;
}

- (BOOL)hasLocationAccessPermissionPromptContext
{
  return self->_hasLocationAccessPermissionPromptContext;
}

- (void)setHasFlowDomainExecutionContext:(BOOL)a3
{
  self->_hasFlowDomainExecutionContext = a3;
}

- (BOOL)hasFlowDomainExecutionContext
{
  return self->_hasFlowDomainExecutionContext;
}

- (void)setHasMediaPlayerRadioStationContextTier1:(BOOL)a3
{
  self->_hasMediaPlayerRadioStationContextTier1 = a3;
}

- (BOOL)hasMediaPlayerRadioStationContextTier1
{
  return self->_hasMediaPlayerRadioStationContextTier1;
}

- (void)setHasMediaPlayerPlaybackContextTier1:(BOOL)a3
{
  self->_hasMediaPlayerPlaybackContextTier1 = a3;
}

- (BOOL)hasMediaPlayerPlaybackContextTier1
{
  return self->_hasMediaPlayerPlaybackContextTier1;
}

- (void)setHasPegasusContextTier1:(BOOL)a3
{
  self->_hasPegasusContextTier1 = a3;
}

- (BOOL)hasPegasusContextTier1
{
  return self->_hasPegasusContextTier1;
}

- (void)setHasAppleMusicVoicePreviewOfferNotShown:(BOOL)a3
{
  self->_hasAppleMusicVoicePreviewOfferNotShown = a3;
}

- (BOOL)hasAppleMusicVoicePreviewOfferNotShown
{
  return self->_hasAppleMusicVoicePreviewOfferNotShown;
}

- (void)setHasSmsAttachmentMetadataTier1:(BOOL)a3
{
  self->_hasSmsAttachmentMetadataTier1 = a3;
}

- (BOOL)hasSmsAttachmentMetadataTier1
{
  return self->_hasSmsAttachmentMetadataTier1;
}

- (void)setHasFlowEntityContextTier1:(BOOL)a3
{
  self->_hasFlowEntityContextTier1 = a3;
}

- (BOOL)hasFlowEntityContextTier1
{
  return self->_hasFlowEntityContextTier1;
}

- (void)setHasFlowStep:(BOOL)a3
{
  self->_hasFlowStep = a3;
}

- (BOOL)hasFlowStep
{
  return self->_hasFlowStep;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (FLOWSchemaFLOWEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (FLOWSchemaFLOWClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FLOWSchemaFLOWClientEvent;
  uint64_t v5 = [(FLOWSchemaFLOWClientEvent *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLOWSchemaFLOWEventMetadata alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"flowStep"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[FLOWSchemaFLOWStep alloc] initWithDictionary:v8];
      [(FLOWSchemaFLOWClientEvent *)v5 setFlowStep:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"flowEntityContextTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[FLOWSchemaFLOWEntityContextTier1 alloc] initWithDictionary:v10];
      [(FLOWSchemaFLOWClientEvent *)v5 setFlowEntityContextTier1:v11];
    }
    v30 = (void *)v10;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"smsAttachmentMetadataTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[FLOWSchemaFLOWSmsAttachmentMetadataTier1 alloc] initWithDictionary:v12];
      [(FLOWSchemaFLOWClientEvent *)v5 setSmsAttachmentMetadataTier1:v13];
    }
    int v29 = (void *)v12;
    int v14 = [v4 objectForKeyedSubscript:@"appleMusicVoicePreviewOfferNotShown"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [[FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown alloc] initWithDictionary:v14];
      [(FLOWSchemaFLOWClientEvent *)v5 setAppleMusicVoicePreviewOfferNotShown:v15];
    }
    id v16 = [v4 objectForKeyedSubscript:@"pegasusContextTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[FLOWSchemaFLOWPegasusContextTier1 alloc] initWithDictionary:v16];
      [(FLOWSchemaFLOWClientEvent *)v5 setPegasusContextTier1:v17];
    }
    v31 = (void *)v8;
    uint64_t v18 = [v4 objectForKeyedSubscript:@"mediaPlayerPlaybackContextTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 alloc] initWithDictionary:v18];
      [(FLOWSchemaFLOWClientEvent *)v5 setMediaPlayerPlaybackContextTier1:v19];
    }
    int v20 = (void *)v6;
    v21 = [v4 objectForKeyedSubscript:@"mediaPlayerRadioStationContextTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 alloc] initWithDictionary:v21];
      [(FLOWSchemaFLOWClientEvent *)v5 setMediaPlayerRadioStationContextTier1:v22];
    }
    int v23 = [v4 objectForKeyedSubscript:@"flowDomainExecutionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[FLOWSchemaFLOWDomainExecutionContext alloc] initWithDictionary:v23];
      [(FLOWSchemaFLOWClientEvent *)v5 setFlowDomainExecutionContext:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"locationAccessPermissionPromptContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[FLOWSchemaFLOWLocationAccessPermissionPromptContext alloc] initWithDictionary:v25];
      [(FLOWSchemaFLOWClientEvent *)v5 setLocationAccessPermissionPromptContext:v26];
    }
    v27 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWClientEvent *)self dictionaryRepresentation];
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
  if (self->_appleMusicVoicePreviewOfferNotShown)
  {
    id v4 = [(FLOWSchemaFLOWClientEvent *)self appleMusicVoicePreviewOfferNotShown];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appleMusicVoicePreviewOfferNotShown"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appleMusicVoicePreviewOfferNotShown"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v7 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
    uint64_t v8 = [v7 dictionaryRepresentation];
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
  if (self->_flowDomainExecutionContext)
  {
    uint64_t v10 = [(FLOWSchemaFLOWClientEvent *)self flowDomainExecutionContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"flowDomainExecutionContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"flowDomainExecutionContext"];
    }
  }
  if (self->_flowEntityContextTier1)
  {
    v13 = [(FLOWSchemaFLOWClientEvent *)self flowEntityContextTier1];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"flowEntityContextTier1"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"flowEntityContextTier1"];
    }
  }
  if (self->_flowStep)
  {
    id v16 = [(FLOWSchemaFLOWClientEvent *)self flowStep];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"flowStep"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"flowStep"];
    }
  }
  if (self->_locationAccessPermissionPromptContext)
  {
    v19 = [(FLOWSchemaFLOWClientEvent *)self locationAccessPermissionPromptContext];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"locationAccessPermissionPromptContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"locationAccessPermissionPromptContext"];
    }
  }
  if (self->_mediaPlayerPlaybackContextTier1)
  {
    v22 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerPlaybackContextTier1];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"mediaPlayerPlaybackContextTier1"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"mediaPlayerPlaybackContextTier1"];
    }
  }
  if (self->_mediaPlayerRadioStationContextTier1)
  {
    v25 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerRadioStationContextTier1];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"mediaPlayerRadioStationContextTier1"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"mediaPlayerRadioStationContextTier1"];
    }
  }
  if (self->_pegasusContextTier1)
  {
    v28 = [(FLOWSchemaFLOWClientEvent *)self pegasusContextTier1];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"pegasusContextTier1"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"pegasusContextTier1"];
    }
  }
  if (self->_smsAttachmentMetadataTier1)
  {
    v31 = [(FLOWSchemaFLOWClientEvent *)self smsAttachmentMetadataTier1];
    objc_super v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"smsAttachmentMetadataTier1"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"smsAttachmentMetadataTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLOWSchemaFLOWEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(FLOWSchemaFLOWStep *)self->_flowStep hash] ^ v3;
  unint64_t v5 = [(FLOWSchemaFLOWEntityContextTier1 *)self->_flowEntityContextTier1 hash];
  unint64_t v6 = v4 ^ v5 ^ [(FLOWSchemaFLOWSmsAttachmentMetadataTier1 *)self->_smsAttachmentMetadataTier1 hash];
  unint64_t v7 = [(FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *)self->_appleMusicVoicePreviewOfferNotShown hash];
  unint64_t v8 = v7 ^ [(FLOWSchemaFLOWPegasusContextTier1 *)self->_pegasusContextTier1 hash];
  unint64_t v9 = v6 ^ v8 ^ [(FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)self->_mediaPlayerPlaybackContextTier1 hash];
  unint64_t v10 = [(FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *)self->_mediaPlayerRadioStationContextTier1 hash];
  unint64_t v11 = v10 ^ [(FLOWSchemaFLOWDomainExecutionContext *)self->_flowDomainExecutionContext hash];
  return v9 ^ v11 ^ [(FLOWSchemaFLOWLocationAccessPermissionPromptContext *)self->_locationAccessPermissionPromptContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_53;
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v8 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self flowStep];
  unint64_t v7 = [v4 flowStep];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v13 = [(FLOWSchemaFLOWClientEvent *)self flowStep];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(FLOWSchemaFLOWClientEvent *)self flowStep];
    id v16 = [v4 flowStep];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self flowEntityContextTier1];
  unint64_t v7 = [v4 flowEntityContextTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v18 = [(FLOWSchemaFLOWClientEvent *)self flowEntityContextTier1];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(FLOWSchemaFLOWClientEvent *)self flowEntityContextTier1];
    v21 = [v4 flowEntityContextTier1];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self smsAttachmentMetadataTier1];
  unint64_t v7 = [v4 smsAttachmentMetadataTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v23 = [(FLOWSchemaFLOWClientEvent *)self smsAttachmentMetadataTier1];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(FLOWSchemaFLOWClientEvent *)self smsAttachmentMetadataTier1];
    int v26 = [v4 smsAttachmentMetadataTier1];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self appleMusicVoicePreviewOfferNotShown];
  unint64_t v7 = [v4 appleMusicVoicePreviewOfferNotShown];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v28 = [(FLOWSchemaFLOWClientEvent *)self appleMusicVoicePreviewOfferNotShown];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(FLOWSchemaFLOWClientEvent *)self appleMusicVoicePreviewOfferNotShown];
    v31 = [v4 appleMusicVoicePreviewOfferNotShown];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self pegasusContextTier1];
  unint64_t v7 = [v4 pegasusContextTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v33 = [(FLOWSchemaFLOWClientEvent *)self pegasusContextTier1];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(FLOWSchemaFLOWClientEvent *)self pegasusContextTier1];
    v36 = [v4 pegasusContextTier1];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerPlaybackContextTier1];
  unint64_t v7 = [v4 mediaPlayerPlaybackContextTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v38 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerPlaybackContextTier1];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerPlaybackContextTier1];
    v41 = [v4 mediaPlayerPlaybackContextTier1];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerRadioStationContextTier1];
  unint64_t v7 = [v4 mediaPlayerRadioStationContextTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v43 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerRadioStationContextTier1];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerRadioStationContextTier1];
    v46 = [v4 mediaPlayerRadioStationContextTier1];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self flowDomainExecutionContext];
  unint64_t v7 = [v4 flowDomainExecutionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v48 = [(FLOWSchemaFLOWClientEvent *)self flowDomainExecutionContext];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(FLOWSchemaFLOWClientEvent *)self flowDomainExecutionContext];
    v51 = [v4 flowDomainExecutionContext];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self locationAccessPermissionPromptContext];
  unint64_t v7 = [v4 locationAccessPermissionPromptContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v53 = [(FLOWSchemaFLOWClientEvent *)self locationAccessPermissionPromptContext];
    if (!v53)
    {

LABEL_56:
      BOOL v58 = 1;
      goto LABEL_54;
    }
    v54 = (void *)v53;
    v55 = [(FLOWSchemaFLOWClientEvent *)self locationAccessPermissionPromptContext];
    v56 = [v4 locationAccessPermissionPromptContext];
    char v57 = [v55 isEqual:v56];

    if (v57) {
      goto LABEL_56;
    }
  }
  else
  {
LABEL_52:
  }
LABEL_53:
  BOOL v58 = 0;
LABEL_54:

  return v58;
}

- (void)writeTo:(id)a3
{
  id v24 = a3;
  id v4 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(FLOWSchemaFLOWClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(FLOWSchemaFLOWClientEvent *)self flowStep];

  if (v6)
  {
    unint64_t v7 = [(FLOWSchemaFLOWClientEvent *)self flowStep];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(FLOWSchemaFLOWClientEvent *)self flowEntityContextTier1];

  if (v8)
  {
    unint64_t v9 = [(FLOWSchemaFLOWClientEvent *)self flowEntityContextTier1];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(FLOWSchemaFLOWClientEvent *)self smsAttachmentMetadataTier1];

  if (v10)
  {
    unint64_t v11 = [(FLOWSchemaFLOWClientEvent *)self smsAttachmentMetadataTier1];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(FLOWSchemaFLOWClientEvent *)self appleMusicVoicePreviewOfferNotShown];

  if (v12)
  {
    uint64_t v13 = [(FLOWSchemaFLOWClientEvent *)self appleMusicVoicePreviewOfferNotShown];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(FLOWSchemaFLOWClientEvent *)self pegasusContextTier1];

  if (v14)
  {
    uint64_t v15 = [(FLOWSchemaFLOWClientEvent *)self pegasusContextTier1];
    PBDataWriterWriteSubmessage();
  }
  id v16 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerPlaybackContextTier1];

  if (v16)
  {
    int v17 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerPlaybackContextTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerRadioStationContextTier1];

  if (v18)
  {
    v19 = [(FLOWSchemaFLOWClientEvent *)self mediaPlayerRadioStationContextTier1];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(FLOWSchemaFLOWClientEvent *)self flowDomainExecutionContext];

  if (v20)
  {
    v21 = [(FLOWSchemaFLOWClientEvent *)self flowDomainExecutionContext];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(FLOWSchemaFLOWClientEvent *)self locationAccessPermissionPromptContext];

  if (v22)
  {
    uint64_t v23 = [(FLOWSchemaFLOWClientEvent *)self locationAccessPermissionPromptContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocationAccessPermissionPromptContext
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_locationAccessPermissionPromptContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWLocationAccessPermissionPromptContext)locationAccessPermissionPromptContext
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_locationAccessPermissionPromptContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLocationAccessPermissionPromptContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWLocationAccessPermissionPromptContext *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  unint64_t v13 = 109;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = v4;
}

- (void)deleteFlowDomainExecutionContext
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_flowDomainExecutionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWDomainExecutionContext)flowDomainExecutionContext
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_flowDomainExecutionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFlowDomainExecutionContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWDomainExecutionContext *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  unint64_t v13 = 108;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = v4;
}

- (void)deleteMediaPlayerRadioStationContextTier1
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_mediaPlayerRadioStationContextTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWMediaPlayerRadioStationContextTier1)mediaPlayerRadioStationContextTier1
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_mediaPlayerRadioStationContextTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMediaPlayerRadioStationContextTier1:(id)a3
{
  id v4 = (FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  unint64_t v13 = 107;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = v4;
}

- (void)deleteMediaPlayerPlaybackContextTier1
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_mediaPlayerPlaybackContextTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1)mediaPlayerPlaybackContextTier1
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_mediaPlayerPlaybackContextTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMediaPlayerPlaybackContextTier1:(id)a3
{
  id v4 = (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  unint64_t v13 = 106;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = v4;
}

- (void)deletePegasusContextTier1
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusContextTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWPegasusContextTier1)pegasusContextTier1
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_pegasusContextTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusContextTier1:(id)a3
{
  id v4 = (FLOWSchemaFLOWPegasusContextTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  unint64_t v13 = 105;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = v4;
}

- (void)deleteAppleMusicVoicePreviewOfferNotShown
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appleMusicVoicePreviewOfferNotShown = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown)appleMusicVoicePreviewOfferNotShown
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_appleMusicVoicePreviewOfferNotShown;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppleMusicVoicePreviewOfferNotShown:(id)a3
{
  id v4 = (FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  unint64_t v13 = 104;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = v4;
}

- (void)deleteSmsAttachmentMetadataTier1
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_smsAttachmentMetadataTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWSmsAttachmentMetadataTier1)smsAttachmentMetadataTier1
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_smsAttachmentMetadataTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSmsAttachmentMetadataTier1:(id)a3
{
  id v4 = (FLOWSchemaFLOWSmsAttachmentMetadataTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  unint64_t v13 = 103;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = v4;
}

- (void)deleteFlowEntityContextTier1
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_flowEntityContextTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWEntityContextTier1)flowEntityContextTier1
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_flowEntityContextTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFlowEntityContextTier1:(id)a3
{
  id v4 = (FLOWSchemaFLOWEntityContextTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  unint64_t v13 = 102;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = v4;
}

- (void)deleteFlowStep
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_flowStep = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWStep)flowStep
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_flowStep;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFlowStep:(id)a3
{
  id v4 = (FLOWSchemaFLOWStep *)a3;
  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  unint64_t v13 = 101;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  flowStep = self->_flowStep;
  self->_flowStep = v4;
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
  unint64_t v2 = [(FLOWSchemaFLOWClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 8) {
    return @"com.apple.aiml.siri.flow.FLOWClientEvent";
  }
  else {
    return off_1E5EAEBC0[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 13;
}

@end