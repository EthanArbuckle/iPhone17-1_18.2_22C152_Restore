@interface MTSchemaMTClientEventV2
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAppBackgrounded;
- (BOOL)hasAppNextButtonTapped;
- (BOOL)hasAppTextBoxDismissed;
- (BOOL)hasAppTimedOut;
- (BOOL)hasAsrStateUpdated;
- (BOOL)hasBatchRequestContext;
- (BOOL)hasEventMetadata;
- (BOOL)hasFrameworkRequestResponseReceived;
- (BOOL)hasFrameworkRequestSent;
- (BOOL)hasInvocationContext;
- (BOOL)hasInvocationStartedTier1;
- (BOOL)hasLanguageDisambiguationUISelected;
- (BOOL)hasLanguageDisambiguationUIShown;
- (BOOL)hasLanguageIdentificationCompleted;
- (BOOL)hasLocalePairResolved;
- (BOOL)hasTranslationTTSPlayed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTASRStateUpdated)asrStateUpdated;
- (MTSchemaMTAppBackgroundedTier1)appBackgrounded;
- (MTSchemaMTAppNextButtonTappedTier1)appNextButtonTapped;
- (MTSchemaMTAppTextBoxDismissedTier1)appTextBoxDismissed;
- (MTSchemaMTAppTimedOutTier1)appTimedOut;
- (MTSchemaMTBatchRequestContext)batchRequestContext;
- (MTSchemaMTClientEventMetadata)eventMetadata;
- (MTSchemaMTClientEventV2)initWithDictionary:(id)a3;
- (MTSchemaMTClientEventV2)initWithJSON:(id)a3;
- (MTSchemaMTFrameworkRequestResponseReceived)frameworkRequestResponseReceived;
- (MTSchemaMTFrameworkRequestSent)frameworkRequestSent;
- (MTSchemaMTInvocationContext)invocationContext;
- (MTSchemaMTInvocationStartedTier1)invocationStartedTier1;
- (MTSchemaMTLanguageDisambiguationUISelected)languageDisambiguationUISelected;
- (MTSchemaMTLanguageDisambiguationUIShown)languageDisambiguationUIShown;
- (MTSchemaMTLanguageIdentificationCompleted)languageIdentificationCompleted;
- (MTSchemaMTLocalePairResolved)localePairResolved;
- (MTSchemaMTTranslationTTSPlayed)translationTTSPlayed;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAppBackgrounded;
- (void)deleteAppNextButtonTapped;
- (void)deleteAppTextBoxDismissed;
- (void)deleteAppTimedOut;
- (void)deleteAsrStateUpdated;
- (void)deleteBatchRequestContext;
- (void)deleteEventMetadata;
- (void)deleteFrameworkRequestResponseReceived;
- (void)deleteFrameworkRequestSent;
- (void)deleteInvocationContext;
- (void)deleteInvocationStartedTier1;
- (void)deleteLanguageDisambiguationUISelected;
- (void)deleteLanguageDisambiguationUIShown;
- (void)deleteLanguageIdentificationCompleted;
- (void)deleteLocalePairResolved;
- (void)deleteTranslationTTSPlayed;
- (void)setAppBackgrounded:(id)a3;
- (void)setAppNextButtonTapped:(id)a3;
- (void)setAppTextBoxDismissed:(id)a3;
- (void)setAppTimedOut:(id)a3;
- (void)setAsrStateUpdated:(id)a3;
- (void)setBatchRequestContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setFrameworkRequestResponseReceived:(id)a3;
- (void)setFrameworkRequestSent:(id)a3;
- (void)setHasAppBackgrounded:(BOOL)a3;
- (void)setHasAppNextButtonTapped:(BOOL)a3;
- (void)setHasAppTextBoxDismissed:(BOOL)a3;
- (void)setHasAppTimedOut:(BOOL)a3;
- (void)setHasAsrStateUpdated:(BOOL)a3;
- (void)setHasBatchRequestContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasFrameworkRequestResponseReceived:(BOOL)a3;
- (void)setHasFrameworkRequestSent:(BOOL)a3;
- (void)setHasInvocationContext:(BOOL)a3;
- (void)setHasInvocationStartedTier1:(BOOL)a3;
- (void)setHasLanguageDisambiguationUISelected:(BOOL)a3;
- (void)setHasLanguageDisambiguationUIShown:(BOOL)a3;
- (void)setHasLanguageIdentificationCompleted:(BOOL)a3;
- (void)setHasLocalePairResolved:(BOOL)a3;
- (void)setHasTranslationTTSPlayed:(BOOL)a3;
- (void)setInvocationContext:(id)a3;
- (void)setInvocationStartedTier1:(id)a3;
- (void)setLanguageDisambiguationUISelected:(id)a3;
- (void)setLanguageDisambiguationUIShown:(id)a3;
- (void)setLanguageIdentificationCompleted:(id)a3;
- (void)setLocalePairResolved:(id)a3;
- (void)setTranslationTTSPlayed:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTClientEventV2

- (id)getComponentId
{
  v2 = [(MTSchemaMTClientEventV2 *)self eventMetadata];
  v3 = [v2 mtId];

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
  v55.receiver = self;
  v55.super_class = (Class)MTSchemaMTClientEventV2;
  v5 = [(SISchemaInstrumentationMessage *)&v55 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(MTSchemaMTClientEventV2 *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MTSchemaMTClientEventV2 *)self deleteEventMetadata];
  }
  v9 = [(MTSchemaMTClientEventV2 *)self batchRequestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MTSchemaMTClientEventV2 *)self deleteBatchRequestContext];
  }
  v12 = [(MTSchemaMTClientEventV2 *)self invocationContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(MTSchemaMTClientEventV2 *)self deleteInvocationContext];
  }
  v15 = [(MTSchemaMTClientEventV2 *)self asrStateUpdated];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(MTSchemaMTClientEventV2 *)self deleteAsrStateUpdated];
  }
  v18 = [(MTSchemaMTClientEventV2 *)self localePairResolved];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(MTSchemaMTClientEventV2 *)self deleteLocalePairResolved];
  }
  v21 = [(MTSchemaMTClientEventV2 *)self invocationStartedTier1];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(MTSchemaMTClientEventV2 *)self deleteInvocationStartedTier1];
  }
  v24 = [(MTSchemaMTClientEventV2 *)self appNextButtonTapped];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(MTSchemaMTClientEventV2 *)self deleteAppNextButtonTapped];
  }
  v27 = [(MTSchemaMTClientEventV2 *)self appTextBoxDismissed];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(MTSchemaMTClientEventV2 *)self deleteAppTextBoxDismissed];
  }
  v30 = [(MTSchemaMTClientEventV2 *)self appTimedOut];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(MTSchemaMTClientEventV2 *)self deleteAppTimedOut];
  }
  v33 = [(MTSchemaMTClientEventV2 *)self frameworkRequestSent];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(MTSchemaMTClientEventV2 *)self deleteFrameworkRequestSent];
  }
  v36 = [(MTSchemaMTClientEventV2 *)self frameworkRequestResponseReceived];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(MTSchemaMTClientEventV2 *)self deleteFrameworkRequestResponseReceived];
  }
  v39 = [(MTSchemaMTClientEventV2 *)self appBackgrounded];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(MTSchemaMTClientEventV2 *)self deleteAppBackgrounded];
  }
  v42 = [(MTSchemaMTClientEventV2 *)self languageIdentificationCompleted];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(MTSchemaMTClientEventV2 *)self deleteLanguageIdentificationCompleted];
  }
  v45 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUIShown];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(MTSchemaMTClientEventV2 *)self deleteLanguageDisambiguationUIShown];
  }
  v48 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUISelected];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(MTSchemaMTClientEventV2 *)self deleteLanguageDisambiguationUISelected];
  }
  v51 = [(MTSchemaMTClientEventV2 *)self translationTTSPlayed];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(MTSchemaMTClientEventV2 *)self deleteTranslationTTSPlayed];
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
  unint64_t v3 = [(MTSchemaMTClientEventV2 *)self whichEvent_Type];
  if (v3 - 101 > 0xE) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAAEF8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0xE) {
    return 0;
  }
  else {
    return off_1E5EAAF70[a3 - 101];
  }
}

- (int)clockIsolationLevel
{
  if ([(MTSchemaMTClientEventV2 *)self whichEvent_Type] - 101 >= 0xF) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationTTSPlayed, 0);
  objc_storeStrong((id *)&self->_languageDisambiguationUISelected, 0);
  objc_storeStrong((id *)&self->_languageDisambiguationUIShown, 0);
  objc_storeStrong((id *)&self->_languageIdentificationCompleted, 0);
  objc_storeStrong((id *)&self->_appBackgrounded, 0);
  objc_storeStrong((id *)&self->_frameworkRequestResponseReceived, 0);
  objc_storeStrong((id *)&self->_frameworkRequestSent, 0);
  objc_storeStrong((id *)&self->_appTimedOut, 0);
  objc_storeStrong((id *)&self->_appTextBoxDismissed, 0);
  objc_storeStrong((id *)&self->_appNextButtonTapped, 0);
  objc_storeStrong((id *)&self->_invocationStartedTier1, 0);
  objc_storeStrong((id *)&self->_localePairResolved, 0);
  objc_storeStrong((id *)&self->_asrStateUpdated, 0);
  objc_storeStrong((id *)&self->_invocationContext, 0);
  objc_storeStrong((id *)&self->_batchRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasTranslationTTSPlayed:(BOOL)a3
{
  self->_hasTranslationTTSPlayed = a3;
}

- (BOOL)hasTranslationTTSPlayed
{
  return self->_hasTranslationTTSPlayed;
}

- (void)setHasLanguageDisambiguationUISelected:(BOOL)a3
{
  self->_hasLanguageDisambiguationUISelected = a3;
}

- (BOOL)hasLanguageDisambiguationUISelected
{
  return self->_hasLanguageDisambiguationUISelected;
}

- (void)setHasLanguageDisambiguationUIShown:(BOOL)a3
{
  self->_hasLanguageDisambiguationUIShown = a3;
}

- (BOOL)hasLanguageDisambiguationUIShown
{
  return self->_hasLanguageDisambiguationUIShown;
}

- (void)setHasLanguageIdentificationCompleted:(BOOL)a3
{
  self->_hasLanguageIdentificationCompleted = a3;
}

- (BOOL)hasLanguageIdentificationCompleted
{
  return self->_hasLanguageIdentificationCompleted;
}

- (void)setHasAppBackgrounded:(BOOL)a3
{
  self->_hasAppBackgrounded = a3;
}

- (BOOL)hasAppBackgrounded
{
  return self->_hasAppBackgrounded;
}

- (void)setHasFrameworkRequestResponseReceived:(BOOL)a3
{
  self->_hasFrameworkRequestResponseReceived = a3;
}

- (BOOL)hasFrameworkRequestResponseReceived
{
  return self->_hasFrameworkRequestResponseReceived;
}

- (void)setHasFrameworkRequestSent:(BOOL)a3
{
  self->_hasFrameworkRequestSent = a3;
}

- (BOOL)hasFrameworkRequestSent
{
  return self->_hasFrameworkRequestSent;
}

- (void)setHasAppTimedOut:(BOOL)a3
{
  self->_hasAppTimedOut = a3;
}

- (BOOL)hasAppTimedOut
{
  return self->_hasAppTimedOut;
}

- (void)setHasAppTextBoxDismissed:(BOOL)a3
{
  self->_hasAppTextBoxDismissed = a3;
}

- (BOOL)hasAppTextBoxDismissed
{
  return self->_hasAppTextBoxDismissed;
}

- (void)setHasAppNextButtonTapped:(BOOL)a3
{
  self->_hasAppNextButtonTapped = a3;
}

- (BOOL)hasAppNextButtonTapped
{
  return self->_hasAppNextButtonTapped;
}

- (void)setHasInvocationStartedTier1:(BOOL)a3
{
  self->_hasInvocationStartedTier1 = a3;
}

- (BOOL)hasInvocationStartedTier1
{
  return self->_hasInvocationStartedTier1;
}

- (void)setHasLocalePairResolved:(BOOL)a3
{
  self->_hasLocalePairResolved = a3;
}

- (BOOL)hasLocalePairResolved
{
  return self->_hasLocalePairResolved;
}

- (void)setHasAsrStateUpdated:(BOOL)a3
{
  self->_hasAsrStateUpdated = a3;
}

- (BOOL)hasAsrStateUpdated
{
  return self->_hasAsrStateUpdated;
}

- (void)setHasInvocationContext:(BOOL)a3
{
  self->_hasInvocationContext = a3;
}

- (BOOL)hasInvocationContext
{
  return self->_hasInvocationContext;
}

- (void)setHasBatchRequestContext:(BOOL)a3
{
  self->_hasBatchRequestContext = a3;
}

- (BOOL)hasBatchRequestContext
{
  return self->_hasBatchRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (MTSchemaMTClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (MTSchemaMTClientEventV2)initWithDictionary:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MTSchemaMTClientEventV2;
  v5 = [(MTSchemaMTClientEventV2 *)&v50 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[MTSchemaMTClientEventMetadata alloc] initWithDictionary:v6];
      [(MTSchemaMTClientEventV2 *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"batchRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[MTSchemaMTBatchRequestContext alloc] initWithDictionary:v8];
      [(MTSchemaMTClientEventV2 *)v5 setBatchRequestContext:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"invocationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[MTSchemaMTInvocationContext alloc] initWithDictionary:v10];
      [(MTSchemaMTClientEventV2 *)v5 setInvocationContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"asrStateUpdated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[MTSchemaMTASRStateUpdated alloc] initWithDictionary:v12];
      [(MTSchemaMTClientEventV2 *)v5 setAsrStateUpdated:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"localePairResolved"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[MTSchemaMTLocalePairResolved alloc] initWithDictionary:v14];
      [(MTSchemaMTClientEventV2 *)v5 setLocalePairResolved:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"invocationStartedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[MTSchemaMTInvocationStartedTier1 alloc] initWithDictionary:v16];
      [(MTSchemaMTClientEventV2 *)v5 setInvocationStartedTier1:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"appNextButtonTapped"];
    objc_opt_class();
    v49 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[MTSchemaMTAppNextButtonTappedTier1 alloc] initWithDictionary:v18];
      [(MTSchemaMTClientEventV2 *)v5 setAppNextButtonTapped:v19];
    }
    v48 = (void *)v6;
    uint64_t v20 = [v4 objectForKeyedSubscript:@"appTextBoxDismissed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[MTSchemaMTAppTextBoxDismissedTier1 alloc] initWithDictionary:v20];
      [(MTSchemaMTClientEventV2 *)v5 setAppTextBoxDismissed:v21];
    }
    v42 = (void *)v20;
    int v47 = (void *)v8;
    uint64_t v22 = [v4 objectForKeyedSubscript:@"appTimedOut"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[MTSchemaMTAppTimedOutTier1 alloc] initWithDictionary:v22];
      [(MTSchemaMTClientEventV2 *)v5 setAppTimedOut:v23];
    }
    v46 = (void *)v10;
    uint64_t v24 = [v4 objectForKeyedSubscript:@"frameworkRequestSent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[MTSchemaMTFrameworkRequestSent alloc] initWithDictionary:v24];
      [(MTSchemaMTClientEventV2 *)v5 setFrameworkRequestSent:v25];
    }
    v45 = (void *)v12;
    int v26 = [v4 objectForKeyedSubscript:@"frameworkRequestResponseReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[MTSchemaMTFrameworkRequestResponseReceived alloc] initWithDictionary:v26];
      [(MTSchemaMTClientEventV2 *)v5 setFrameworkRequestResponseReceived:v27];
    }
    int v44 = (void *)v14;
    v28 = [v4 objectForKeyedSubscript:@"appBackgrounded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[MTSchemaMTAppBackgroundedTier1 alloc] initWithDictionary:v28];
      [(MTSchemaMTClientEventV2 *)v5 setAppBackgrounded:v29];
    }
    int v41 = (void *)v24;
    v43 = (void *)v16;
    v30 = [v4 objectForKeyedSubscript:@"languageIdentificationCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[MTSchemaMTLanguageIdentificationCompleted alloc] initWithDictionary:v30];
      [(MTSchemaMTClientEventV2 *)v5 setLanguageIdentificationCompleted:v31];
    }
    int v32 = (void *)v22;
    v33 = [v4 objectForKeyedSubscript:@"languageDisambiguationUIShown"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[MTSchemaMTLanguageDisambiguationUIShown alloc] initWithDictionary:v33];
      [(MTSchemaMTClientEventV2 *)v5 setLanguageDisambiguationUIShown:v34];
    }
    int v35 = [v4 objectForKeyedSubscript:@"languageDisambiguationUISelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[MTSchemaMTLanguageDisambiguationUISelected alloc] initWithDictionary:v35];
      [(MTSchemaMTClientEventV2 *)v5 setLanguageDisambiguationUISelected:v36];
    }
    v37 = [v4 objectForKeyedSubscript:@"translationTTSPlayed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v38 = [[MTSchemaMTTranslationTTSPlayed alloc] initWithDictionary:v37];
      [(MTSchemaMTClientEventV2 *)v5 setTranslationTTSPlayed:v38];
    }
    v39 = v5;
  }
  return v5;
}

- (MTSchemaMTClientEventV2)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTClientEventV2 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTClientEventV2 *)self dictionaryRepresentation];
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
  if (self->_appBackgrounded)
  {
    id v4 = [(MTSchemaMTClientEventV2 *)self appBackgrounded];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appBackgrounded"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appBackgrounded"];
    }
  }
  if (self->_appNextButtonTapped)
  {
    uint64_t v7 = [(MTSchemaMTClientEventV2 *)self appNextButtonTapped];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"appNextButtonTapped"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"appNextButtonTapped"];
    }
  }
  if (self->_appTextBoxDismissed)
  {
    uint64_t v10 = [(MTSchemaMTClientEventV2 *)self appTextBoxDismissed];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"appTextBoxDismissed"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"appTextBoxDismissed"];
    }
  }
  if (self->_appTimedOut)
  {
    v13 = [(MTSchemaMTClientEventV2 *)self appTimedOut];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"appTimedOut"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"appTimedOut"];
    }
  }
  if (self->_asrStateUpdated)
  {
    uint64_t v16 = [(MTSchemaMTClientEventV2 *)self asrStateUpdated];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"asrStateUpdated"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"asrStateUpdated"];
    }
  }
  if (self->_batchRequestContext)
  {
    v19 = [(MTSchemaMTClientEventV2 *)self batchRequestContext];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"batchRequestContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"batchRequestContext"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v22 = [(MTSchemaMTClientEventV2 *)self eventMetadata];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_frameworkRequestResponseReceived)
  {
    v25 = [(MTSchemaMTClientEventV2 *)self frameworkRequestResponseReceived];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"frameworkRequestResponseReceived"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"frameworkRequestResponseReceived"];
    }
  }
  if (self->_frameworkRequestSent)
  {
    v28 = [(MTSchemaMTClientEventV2 *)self frameworkRequestSent];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"frameworkRequestSent"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"frameworkRequestSent"];
    }
  }
  if (self->_invocationContext)
  {
    v31 = [(MTSchemaMTClientEventV2 *)self invocationContext];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"invocationContext"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"invocationContext"];
    }
  }
  if (self->_invocationStartedTier1)
  {
    v34 = [(MTSchemaMTClientEventV2 *)self invocationStartedTier1];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"invocationStartedTier1"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"invocationStartedTier1"];
    }
  }
  if (self->_languageDisambiguationUISelected)
  {
    v37 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUISelected];
    int v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"languageDisambiguationUISelected"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"languageDisambiguationUISelected"];
    }
  }
  if (self->_languageDisambiguationUIShown)
  {
    v40 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUIShown];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"languageDisambiguationUIShown"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"languageDisambiguationUIShown"];
    }
  }
  if (self->_languageIdentificationCompleted)
  {
    v43 = [(MTSchemaMTClientEventV2 *)self languageIdentificationCompleted];
    int v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"languageIdentificationCompleted"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"languageIdentificationCompleted"];
    }
  }
  if (self->_localePairResolved)
  {
    v46 = [(MTSchemaMTClientEventV2 *)self localePairResolved];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"localePairResolved"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"localePairResolved"];
    }
  }
  if (self->_translationTTSPlayed)
  {
    v49 = [(MTSchemaMTClientEventV2 *)self translationTTSPlayed];
    objc_super v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"translationTTSPlayed"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"translationTTSPlayed"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTSchemaMTClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(MTSchemaMTBatchRequestContext *)self->_batchRequestContext hash] ^ v3;
  unint64_t v5 = [(MTSchemaMTInvocationContext *)self->_invocationContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(MTSchemaMTASRStateUpdated *)self->_asrStateUpdated hash];
  unint64_t v7 = [(MTSchemaMTLocalePairResolved *)self->_localePairResolved hash];
  unint64_t v8 = v7 ^ [(MTSchemaMTInvocationStartedTier1 *)self->_invocationStartedTier1 hash];
  unint64_t v9 = v6 ^ v8 ^ [(MTSchemaMTAppNextButtonTappedTier1 *)self->_appNextButtonTapped hash];
  unint64_t v10 = [(MTSchemaMTAppTextBoxDismissedTier1 *)self->_appTextBoxDismissed hash];
  unint64_t v11 = v10 ^ [(MTSchemaMTAppTimedOutTier1 *)self->_appTimedOut hash];
  unint64_t v12 = v11 ^ [(MTSchemaMTFrameworkRequestSent *)self->_frameworkRequestSent hash];
  unint64_t v13 = v9 ^ v12 ^ [(MTSchemaMTFrameworkRequestResponseReceived *)self->_frameworkRequestResponseReceived hash];
  unint64_t v14 = [(MTSchemaMTAppBackgroundedTier1 *)self->_appBackgrounded hash];
  unint64_t v15 = v14 ^ [(MTSchemaMTLanguageIdentificationCompleted *)self->_languageIdentificationCompleted hash];
  unint64_t v16 = v15 ^ [(MTSchemaMTLanguageDisambiguationUIShown *)self->_languageDisambiguationUIShown hash];
  unint64_t v17 = v16 ^ [(MTSchemaMTLanguageDisambiguationUISelected *)self->_languageDisambiguationUISelected hash];
  return v13 ^ v17 ^ [(MTSchemaMTTranslationTTSPlayed *)self->_translationTTSPlayed hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_83;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_83;
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v8 = [(MTSchemaMTClientEventV2 *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(MTSchemaMTClientEventV2 *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self batchRequestContext];
  unint64_t v7 = [v4 batchRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v13 = [(MTSchemaMTClientEventV2 *)self batchRequestContext];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(MTSchemaMTClientEventV2 *)self batchRequestContext];
    unint64_t v16 = [v4 batchRequestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self invocationContext];
  unint64_t v7 = [v4 invocationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v18 = [(MTSchemaMTClientEventV2 *)self invocationContext];
  if (v18)
  {
    v19 = (void *)v18;
    uint64_t v20 = [(MTSchemaMTClientEventV2 *)self invocationContext];
    v21 = [v4 invocationContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self asrStateUpdated];
  unint64_t v7 = [v4 asrStateUpdated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v23 = [(MTSchemaMTClientEventV2 *)self asrStateUpdated];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    v25 = [(MTSchemaMTClientEventV2 *)self asrStateUpdated];
    int v26 = [v4 asrStateUpdated];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self localePairResolved];
  unint64_t v7 = [v4 localePairResolved];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v28 = [(MTSchemaMTClientEventV2 *)self localePairResolved];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(MTSchemaMTClientEventV2 *)self localePairResolved];
    v31 = [v4 localePairResolved];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self invocationStartedTier1];
  unint64_t v7 = [v4 invocationStartedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v33 = [(MTSchemaMTClientEventV2 *)self invocationStartedTier1];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(MTSchemaMTClientEventV2 *)self invocationStartedTier1];
    v36 = [v4 invocationStartedTier1];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self appNextButtonTapped];
  unint64_t v7 = [v4 appNextButtonTapped];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v38 = [(MTSchemaMTClientEventV2 *)self appNextButtonTapped];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(MTSchemaMTClientEventV2 *)self appNextButtonTapped];
    int v41 = [v4 appNextButtonTapped];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self appTextBoxDismissed];
  unint64_t v7 = [v4 appTextBoxDismissed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v43 = [(MTSchemaMTClientEventV2 *)self appTextBoxDismissed];
  if (v43)
  {
    int v44 = (void *)v43;
    v45 = [(MTSchemaMTClientEventV2 *)self appTextBoxDismissed];
    v46 = [v4 appTextBoxDismissed];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self appTimedOut];
  unint64_t v7 = [v4 appTimedOut];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v48 = [(MTSchemaMTClientEventV2 *)self appTimedOut];
  if (v48)
  {
    v49 = (void *)v48;
    objc_super v50 = [(MTSchemaMTClientEventV2 *)self appTimedOut];
    v51 = [v4 appTimedOut];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self frameworkRequestSent];
  unint64_t v7 = [v4 frameworkRequestSent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v53 = [(MTSchemaMTClientEventV2 *)self frameworkRequestSent];
  if (v53)
  {
    v54 = (void *)v53;
    objc_super v55 = [(MTSchemaMTClientEventV2 *)self frameworkRequestSent];
    v56 = [v4 frameworkRequestSent];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self frameworkRequestResponseReceived];
  unint64_t v7 = [v4 frameworkRequestResponseReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v58 = [(MTSchemaMTClientEventV2 *)self frameworkRequestResponseReceived];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [(MTSchemaMTClientEventV2 *)self frameworkRequestResponseReceived];
    v61 = [v4 frameworkRequestResponseReceived];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self appBackgrounded];
  unint64_t v7 = [v4 appBackgrounded];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v63 = [(MTSchemaMTClientEventV2 *)self appBackgrounded];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(MTSchemaMTClientEventV2 *)self appBackgrounded];
    v66 = [v4 appBackgrounded];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self languageIdentificationCompleted];
  unint64_t v7 = [v4 languageIdentificationCompleted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v68 = [(MTSchemaMTClientEventV2 *)self languageIdentificationCompleted];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(MTSchemaMTClientEventV2 *)self languageIdentificationCompleted];
    v71 = [v4 languageIdentificationCompleted];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUIShown];
  unint64_t v7 = [v4 languageDisambiguationUIShown];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v73 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUIShown];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUIShown];
    v76 = [v4 languageDisambiguationUIShown];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUISelected];
  unint64_t v7 = [v4 languageDisambiguationUISelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_82;
  }
  uint64_t v78 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUISelected];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUISelected];
    v81 = [v4 languageDisambiguationUISelected];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self translationTTSPlayed];
  unint64_t v7 = [v4 translationTTSPlayed];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v83 = [(MTSchemaMTClientEventV2 *)self translationTTSPlayed];
    if (!v83)
    {

LABEL_86:
      BOOL v88 = 1;
      goto LABEL_84;
    }
    v84 = (void *)v83;
    v85 = [(MTSchemaMTClientEventV2 *)self translationTTSPlayed];
    v86 = [v4 translationTTSPlayed];
    char v87 = [v85 isEqual:v86];

    if (v87) {
      goto LABEL_86;
    }
  }
  else
  {
LABEL_82:
  }
LABEL_83:
  BOOL v88 = 0;
LABEL_84:

  return v88;
}

- (void)writeTo:(id)a3
{
  id v36 = a3;
  id v4 = [(MTSchemaMTClientEventV2 *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(MTSchemaMTClientEventV2 *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(MTSchemaMTClientEventV2 *)self batchRequestContext];

  if (v6)
  {
    unint64_t v7 = [(MTSchemaMTClientEventV2 *)self batchRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(MTSchemaMTClientEventV2 *)self invocationContext];

  if (v8)
  {
    unint64_t v9 = [(MTSchemaMTClientEventV2 *)self invocationContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(MTSchemaMTClientEventV2 *)self asrStateUpdated];

  if (v10)
  {
    unint64_t v11 = [(MTSchemaMTClientEventV2 *)self asrStateUpdated];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(MTSchemaMTClientEventV2 *)self localePairResolved];

  if (v12)
  {
    uint64_t v13 = [(MTSchemaMTClientEventV2 *)self localePairResolved];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(MTSchemaMTClientEventV2 *)self invocationStartedTier1];

  if (v14)
  {
    unint64_t v15 = [(MTSchemaMTClientEventV2 *)self invocationStartedTier1];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(MTSchemaMTClientEventV2 *)self appNextButtonTapped];

  if (v16)
  {
    int v17 = [(MTSchemaMTClientEventV2 *)self appNextButtonTapped];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(MTSchemaMTClientEventV2 *)self appTextBoxDismissed];

  if (v18)
  {
    v19 = [(MTSchemaMTClientEventV2 *)self appTextBoxDismissed];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v20 = [(MTSchemaMTClientEventV2 *)self appTimedOut];

  if (v20)
  {
    v21 = [(MTSchemaMTClientEventV2 *)self appTimedOut];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(MTSchemaMTClientEventV2 *)self frameworkRequestSent];

  if (v22)
  {
    uint64_t v23 = [(MTSchemaMTClientEventV2 *)self frameworkRequestSent];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v24 = [(MTSchemaMTClientEventV2 *)self frameworkRequestResponseReceived];

  if (v24)
  {
    v25 = [(MTSchemaMTClientEventV2 *)self frameworkRequestResponseReceived];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(MTSchemaMTClientEventV2 *)self appBackgrounded];

  if (v26)
  {
    int v27 = [(MTSchemaMTClientEventV2 *)self appBackgrounded];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(MTSchemaMTClientEventV2 *)self languageIdentificationCompleted];

  if (v28)
  {
    int v29 = [(MTSchemaMTClientEventV2 *)self languageIdentificationCompleted];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUIShown];

  if (v30)
  {
    v31 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUIShown];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUISelected];

  if (v32)
  {
    uint64_t v33 = [(MTSchemaMTClientEventV2 *)self languageDisambiguationUISelected];
    PBDataWriterWriteSubmessage();
  }
  v34 = [(MTSchemaMTClientEventV2 *)self translationTTSPlayed];

  if (v34)
  {
    int v35 = [(MTSchemaMTClientEventV2 *)self translationTTSPlayed];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTClientEventV2ReadFrom(self, (uint64_t)a3);
}

- (void)deleteTranslationTTSPlayed
{
  if (self->_whichEvent_Type == 115)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_translationTTSPlayed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTTranslationTTSPlayed)translationTTSPlayed
{
  if (self->_whichEvent_Type == 115) {
    v2 = self->_translationTTSPlayed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTranslationTTSPlayed:(id)a3
{
  id v4 = (MTSchemaMTTranslationTTSPlayed *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  unint64_t v19 = 115;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = v4;
}

- (void)deleteLanguageDisambiguationUISelected
{
  if (self->_whichEvent_Type == 114)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_languageDisambiguationUISelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTLanguageDisambiguationUISelected)languageDisambiguationUISelected
{
  if (self->_whichEvent_Type == 114) {
    v2 = self->_languageDisambiguationUISelected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLanguageDisambiguationUISelected:(id)a3
{
  id v4 = (MTSchemaMTLanguageDisambiguationUISelected *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 114;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = v4;
}

- (void)deleteLanguageDisambiguationUIShown
{
  if (self->_whichEvent_Type == 113)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_languageDisambiguationUIShown = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTLanguageDisambiguationUIShown)languageDisambiguationUIShown
{
  if (self->_whichEvent_Type == 113) {
    v2 = self->_languageDisambiguationUIShown;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLanguageDisambiguationUIShown:(id)a3
{
  id v4 = (MTSchemaMTLanguageDisambiguationUIShown *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 113;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = v4;
}

- (void)deleteLanguageIdentificationCompleted
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_languageIdentificationCompleted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTLanguageIdentificationCompleted)languageIdentificationCompleted
{
  if (self->_whichEvent_Type == 112) {
    v2 = self->_languageIdentificationCompleted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLanguageIdentificationCompleted:(id)a3
{
  id v4 = (MTSchemaMTLanguageIdentificationCompleted *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 112;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = v4;
}

- (void)deleteAppBackgrounded
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appBackgrounded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTAppBackgroundedTier1)appBackgrounded
{
  if (self->_whichEvent_Type == 111) {
    v2 = self->_appBackgrounded;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppBackgrounded:(id)a3
{
  id v4 = (MTSchemaMTAppBackgroundedTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 111;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = v4;
}

- (void)deleteFrameworkRequestResponseReceived
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_frameworkRequestResponseReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTFrameworkRequestResponseReceived)frameworkRequestResponseReceived
{
  if (self->_whichEvent_Type == 110) {
    v2 = self->_frameworkRequestResponseReceived;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFrameworkRequestResponseReceived:(id)a3
{
  id v4 = (MTSchemaMTFrameworkRequestResponseReceived *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 110;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = v4;
}

- (void)deleteFrameworkRequestSent
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_frameworkRequestSent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTFrameworkRequestSent)frameworkRequestSent
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_frameworkRequestSent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFrameworkRequestSent:(id)a3
{
  id v4 = (MTSchemaMTFrameworkRequestSent *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 109;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = v4;
}

- (void)deleteAppTimedOut
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appTimedOut = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTAppTimedOutTier1)appTimedOut
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_appTimedOut;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppTimedOut:(id)a3
{
  id v4 = (MTSchemaMTAppTimedOutTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 108;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = v4;
}

- (void)deleteAppTextBoxDismissed
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appTextBoxDismissed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTAppTextBoxDismissedTier1)appTextBoxDismissed
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_appTextBoxDismissed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppTextBoxDismissed:(id)a3
{
  id v4 = (MTSchemaMTAppTextBoxDismissedTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 107;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = v4;
}

- (void)deleteAppNextButtonTapped
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appNextButtonTapped = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTAppNextButtonTappedTier1)appNextButtonTapped
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_appNextButtonTapped;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppNextButtonTapped:(id)a3
{
  id v4 = (MTSchemaMTAppNextButtonTappedTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 106;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = v4;
}

- (void)deleteInvocationStartedTier1
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_invocationStartedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTInvocationStartedTier1)invocationStartedTier1
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_invocationStartedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInvocationStartedTier1:(id)a3
{
  id v4 = (MTSchemaMTInvocationStartedTier1 *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 105;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = v4;
}

- (void)deleteLocalePairResolved
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_localePairResolved = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTLocalePairResolved)localePairResolved
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_localePairResolved;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLocalePairResolved:(id)a3
{
  id v4 = (MTSchemaMTLocalePairResolved *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 104;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = v4;
}

- (void)deleteAsrStateUpdated
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_asrStateUpdated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTASRStateUpdated)asrStateUpdated
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_asrStateUpdated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAsrStateUpdated:(id)a3
{
  id v4 = (MTSchemaMTASRStateUpdated *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 103;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = v4;
}

- (void)deleteInvocationContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_invocationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTInvocationContext)invocationContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_invocationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInvocationContext:(id)a3
{
  id v4 = (MTSchemaMTInvocationContext *)a3;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 102;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  invocationContext = self->_invocationContext;
  self->_invocationContext = v4;
}

- (void)deleteBatchRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_batchRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTBatchRequestContext)batchRequestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_batchRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setBatchRequestContext:(id)a3
{
  id v4 = (MTSchemaMTBatchRequestContext *)a3;
  invocationContext = self->_invocationContext;
  self->_invocationContext = 0;

  asrStateUpdated = self->_asrStateUpdated;
  self->_asrStateUpdated = 0;

  localePairResolved = self->_localePairResolved;
  self->_localePairResolved = 0;

  invocationStartedTier1 = self->_invocationStartedTier1;
  self->_invocationStartedTier1 = 0;

  appNextButtonTapped = self->_appNextButtonTapped;
  self->_appNextButtonTapped = 0;

  appTextBoxDismissed = self->_appTextBoxDismissed;
  self->_appTextBoxDismissed = 0;

  appTimedOut = self->_appTimedOut;
  self->_appTimedOut = 0;

  frameworkRequestSent = self->_frameworkRequestSent;
  self->_frameworkRequestSent = 0;

  frameworkRequestResponseReceived = self->_frameworkRequestResponseReceived;
  self->_frameworkRequestResponseReceived = 0;

  appBackgrounded = self->_appBackgrounded;
  self->_appBackgrounded = 0;

  languageIdentificationCompleted = self->_languageIdentificationCompleted;
  self->_languageIdentificationCompleted = 0;

  languageDisambiguationUIShown = self->_languageDisambiguationUIShown;
  self->_languageDisambiguationUIShown = 0;

  languageDisambiguationUISelected = self->_languageDisambiguationUISelected;
  self->_languageDisambiguationUISelected = 0;

  translationTTSPlayed = self->_translationTTSPlayed;
  self->_translationTTSPlayed = 0;

  unint64_t v19 = 101;
  if (!v4) {
    unint64_t v19 = 0;
  }
  self->_unint64_t whichEvent_Type = v19;
  batchRequestContext = self->_batchRequestContext;
  self->_batchRequestContext = v4;
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
  unint64_t v2 = [(MTSchemaMTClientEventV2 *)self whichEvent_Type];
  if (v2 - 101 > 0xE) {
    return @"com.apple.aiml.mi.mt.MTClientEventV2";
  }
  else {
    return off_1E5EB1AA0[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 43;
}

@end