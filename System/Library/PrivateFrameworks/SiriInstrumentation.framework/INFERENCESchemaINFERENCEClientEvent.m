@interface INFERENCESchemaINFERENCEClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAbModelEvaluated;
- (BOOL)hasAbModelResultTriggered;
- (BOOL)hasAsrEuclidEmbedding;
- (BOOL)hasCommsAppSelectionGroundTruthGenerated;
- (BOOL)hasContactCandidatesInfoGenerated;
- (BOOL)hasCrrTrainingSampleCollected;
- (BOOL)hasEventMetadata;
- (BOOL)hasMusicAppSelectionGroundTruthGenerated;
- (BOOL)hasNotebookAppSelectionGroundTruthGenerated;
- (BOOL)hasPervasiveEntityResolutionGroundTruthGenerated;
- (BOOL)hasResolutionQueryInfoGenerated;
- (BOOL)hasResolutionRequestContext;
- (BOOL)hasSeasExecutionPathReported;
- (BOOL)hasSimpleTaskInfoGenerated;
- (BOOL)hasUserPromptSelectedInfoGenerated;
- (BOOL)hasVideoPlayOnThirdPartyAppGroundTruthGenerated;
- (BOOL)hasVideoSmartAppSelectionDisambiguation;
- (BOOL)hasWorkoutsAppSelectionGroundTruthGenerated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEABModelEvaluated)abModelEvaluated;
- (INFERENCESchemaINFERENCEABModelResultTriggered)abModelResultTriggered;
- (INFERENCESchemaINFERENCEAsrEuclidEmbedding)asrEuclidEmbedding;
- (INFERENCESchemaINFERENCECRRTrainingSampleCollected)crrTrainingSampleCollected;
- (INFERENCESchemaINFERENCEClientEvent)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEClientEvent)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCEClientEventMetadata)eventMetadata;
- (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated)commsAppSelectionGroundTruthGenerated;
- (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated)contactCandidatesInfoGenerated;
- (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated)musicAppSelectionGroundTruthGenerated;
- (INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated)notebookAppSelectionGroundTruthGenerated;
- (INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated)pervasiveEntityResolutionGroundTruthGenerated;
- (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated)userPromptSelectedInfoGenerated;
- (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated)resolutionQueryInfoGenerated;
- (INFERENCESchemaINFERENCEResolutionRequestContext)resolutionRequestContext;
- (INFERENCESchemaINFERENCESimpleTaskInfoGenerated)simpleTaskInfoGenerated;
- (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported)seasExecutionPathReported;
- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated)videoPlayOnThirdPartyAppGroundTruthGenerated;
- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated)videoSmartAppSelectionDisambiguation;
- (INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated)workoutsAppSelectionGroundTruthGenerated;
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
- (void)deleteAbModelEvaluated;
- (void)deleteAbModelResultTriggered;
- (void)deleteAsrEuclidEmbedding;
- (void)deleteCommsAppSelectionGroundTruthGenerated;
- (void)deleteContactCandidatesInfoGenerated;
- (void)deleteCrrTrainingSampleCollected;
- (void)deleteEventMetadata;
- (void)deleteMusicAppSelectionGroundTruthGenerated;
- (void)deleteNotebookAppSelectionGroundTruthGenerated;
- (void)deletePervasiveEntityResolutionGroundTruthGenerated;
- (void)deleteResolutionQueryInfoGenerated;
- (void)deleteResolutionRequestContext;
- (void)deleteSeasExecutionPathReported;
- (void)deleteSimpleTaskInfoGenerated;
- (void)deleteUserPromptSelectedInfoGenerated;
- (void)deleteVideoPlayOnThirdPartyAppGroundTruthGenerated;
- (void)deleteVideoSmartAppSelectionDisambiguation;
- (void)deleteWorkoutsAppSelectionGroundTruthGenerated;
- (void)setAbModelEvaluated:(id)a3;
- (void)setAbModelResultTriggered:(id)a3;
- (void)setAsrEuclidEmbedding:(id)a3;
- (void)setCommsAppSelectionGroundTruthGenerated:(id)a3;
- (void)setContactCandidatesInfoGenerated:(id)a3;
- (void)setCrrTrainingSampleCollected:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasAbModelEvaluated:(BOOL)a3;
- (void)setHasAbModelResultTriggered:(BOOL)a3;
- (void)setHasAsrEuclidEmbedding:(BOOL)a3;
- (void)setHasCommsAppSelectionGroundTruthGenerated:(BOOL)a3;
- (void)setHasContactCandidatesInfoGenerated:(BOOL)a3;
- (void)setHasCrrTrainingSampleCollected:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasMusicAppSelectionGroundTruthGenerated:(BOOL)a3;
- (void)setHasNotebookAppSelectionGroundTruthGenerated:(BOOL)a3;
- (void)setHasPervasiveEntityResolutionGroundTruthGenerated:(BOOL)a3;
- (void)setHasResolutionQueryInfoGenerated:(BOOL)a3;
- (void)setHasResolutionRequestContext:(BOOL)a3;
- (void)setHasSeasExecutionPathReported:(BOOL)a3;
- (void)setHasSimpleTaskInfoGenerated:(BOOL)a3;
- (void)setHasUserPromptSelectedInfoGenerated:(BOOL)a3;
- (void)setHasVideoPlayOnThirdPartyAppGroundTruthGenerated:(BOOL)a3;
- (void)setHasVideoSmartAppSelectionDisambiguation:(BOOL)a3;
- (void)setHasWorkoutsAppSelectionGroundTruthGenerated:(BOOL)a3;
- (void)setMusicAppSelectionGroundTruthGenerated:(id)a3;
- (void)setNotebookAppSelectionGroundTruthGenerated:(id)a3;
- (void)setPervasiveEntityResolutionGroundTruthGenerated:(id)a3;
- (void)setResolutionQueryInfoGenerated:(id)a3;
- (void)setResolutionRequestContext:(id)a3;
- (void)setSeasExecutionPathReported:(id)a3;
- (void)setSimpleTaskInfoGenerated:(id)a3;
- (void)setUserPromptSelectedInfoGenerated:(id)a3;
- (void)setVideoPlayOnThirdPartyAppGroundTruthGenerated:(id)a3;
- (void)setVideoSmartAppSelectionDisambiguation:(id)a3;
- (void)setWorkoutsAppSelectionGroundTruthGenerated:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEClientEvent

- (int)componentName
{
  v2 = [(INFERENCESchemaINFERENCEClientEvent *)self eventMetadata];
  v3 = [v2 inferenceId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 27;
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
  v2 = [(INFERENCESchemaINFERENCEClientEvent *)self eventMetadata];
  v3 = [v2 inferenceId];

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
  v61.receiver = self;
  v61.super_class = (Class)INFERENCESchemaINFERENCEClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v61 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteEventMetadata];
  }
  v9 = [(INFERENCESchemaINFERENCEClientEvent *)self musicAppSelectionGroundTruthGenerated];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteMusicAppSelectionGroundTruthGenerated];
  }
  v12 = [(INFERENCESchemaINFERENCEClientEvent *)self videoPlayOnThirdPartyAppGroundTruthGenerated];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteVideoPlayOnThirdPartyAppGroundTruthGenerated];
  }
  v15 = [(INFERENCESchemaINFERENCEClientEvent *)self videoSmartAppSelectionDisambiguation];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteVideoSmartAppSelectionDisambiguation];
  }
  v18 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionRequestContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteResolutionRequestContext];
  }
  v21 = [(INFERENCESchemaINFERENCEClientEvent *)self simpleTaskInfoGenerated];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteSimpleTaskInfoGenerated];
  }
  v24 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionQueryInfoGenerated];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteResolutionQueryInfoGenerated];
  }
  v27 = [(INFERENCESchemaINFERENCEClientEvent *)self userPromptSelectedInfoGenerated];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteUserPromptSelectedInfoGenerated];
  }
  v30 = [(INFERENCESchemaINFERENCEClientEvent *)self contactCandidatesInfoGenerated];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteContactCandidatesInfoGenerated];
  }
  v33 = [(INFERENCESchemaINFERENCEClientEvent *)self crrTrainingSampleCollected];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteCrrTrainingSampleCollected];
  }
  v36 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelEvaluated];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteAbModelEvaluated];
  }
  v39 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelResultTriggered];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteAbModelResultTriggered];
  }
  v42 = [(INFERENCESchemaINFERENCEClientEvent *)self workoutsAppSelectionGroundTruthGenerated];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteWorkoutsAppSelectionGroundTruthGenerated];
  }
  v45 = [(INFERENCESchemaINFERENCEClientEvent *)self notebookAppSelectionGroundTruthGenerated];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteNotebookAppSelectionGroundTruthGenerated];
  }
  v48 = [(INFERENCESchemaINFERENCEClientEvent *)self commsAppSelectionGroundTruthGenerated];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteCommsAppSelectionGroundTruthGenerated];
  }
  v51 = [(INFERENCESchemaINFERENCEClientEvent *)self pervasiveEntityResolutionGroundTruthGenerated];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deletePervasiveEntityResolutionGroundTruthGenerated];
  }
  v54 = [(INFERENCESchemaINFERENCEClientEvent *)self seasExecutionPathReported];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteSeasExecutionPathReported];
  }
  v57 = [(INFERENCESchemaINFERENCEClientEvent *)self asrEuclidEmbedding];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(INFERENCESchemaINFERENCEClientEvent *)self deleteAsrEuclidEmbedding];
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
  unint64_t v3 = [(INFERENCESchemaINFERENCEClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 0x10) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA998[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x10) {
    return 0;
  }
  else {
    return off_1E5EAAA20[a3 - 101];
  }
}

- (int)clockIsolationLevel
{
  unint64_t v2 = [(INFERENCESchemaINFERENCEClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 0xE) {
    return 1;
  }
  else {
    return dword_1AE47ADD0[v2 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrEuclidEmbedding, 0);
  objc_storeStrong((id *)&self->_seasExecutionPathReported, 0);
  objc_storeStrong((id *)&self->_pervasiveEntityResolutionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_commsAppSelectionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_notebookAppSelectionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_workoutsAppSelectionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_abModelResultTriggered, 0);
  objc_storeStrong((id *)&self->_abModelEvaluated, 0);
  objc_storeStrong((id *)&self->_crrTrainingSampleCollected, 0);
  objc_storeStrong((id *)&self->_contactCandidatesInfoGenerated, 0);
  objc_storeStrong((id *)&self->_userPromptSelectedInfoGenerated, 0);
  objc_storeStrong((id *)&self->_resolutionQueryInfoGenerated, 0);
  objc_storeStrong((id *)&self->_simpleTaskInfoGenerated, 0);
  objc_storeStrong((id *)&self->_resolutionRequestContext, 0);
  objc_storeStrong((id *)&self->_videoSmartAppSelectionDisambiguation, 0);
  objc_storeStrong((id *)&self->_videoPlayOnThirdPartyAppGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_musicAppSelectionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasAsrEuclidEmbedding:(BOOL)a3
{
  self->_hasAsrEuclidEmbedding = a3;
}

- (BOOL)hasAsrEuclidEmbedding
{
  return self->_hasAsrEuclidEmbedding;
}

- (void)setHasSeasExecutionPathReported:(BOOL)a3
{
  self->_hasSeasExecutionPathReported = a3;
}

- (BOOL)hasSeasExecutionPathReported
{
  return self->_hasSeasExecutionPathReported;
}

- (void)setHasPervasiveEntityResolutionGroundTruthGenerated:(BOOL)a3
{
  self->_hasPervasiveEntityResolutionGroundTruthGenerated = a3;
}

- (BOOL)hasPervasiveEntityResolutionGroundTruthGenerated
{
  return self->_hasPervasiveEntityResolutionGroundTruthGenerated;
}

- (void)setHasCommsAppSelectionGroundTruthGenerated:(BOOL)a3
{
  self->_hasCommsAppSelectionGroundTruthGenerated = a3;
}

- (BOOL)hasCommsAppSelectionGroundTruthGenerated
{
  return self->_hasCommsAppSelectionGroundTruthGenerated;
}

- (void)setHasNotebookAppSelectionGroundTruthGenerated:(BOOL)a3
{
  self->_hasNotebookAppSelectionGroundTruthGenerated = a3;
}

- (BOOL)hasNotebookAppSelectionGroundTruthGenerated
{
  return self->_hasNotebookAppSelectionGroundTruthGenerated;
}

- (void)setHasWorkoutsAppSelectionGroundTruthGenerated:(BOOL)a3
{
  self->_hasWorkoutsAppSelectionGroundTruthGenerated = a3;
}

- (BOOL)hasWorkoutsAppSelectionGroundTruthGenerated
{
  return self->_hasWorkoutsAppSelectionGroundTruthGenerated;
}

- (void)setHasAbModelResultTriggered:(BOOL)a3
{
  self->_hasAbModelResultTriggered = a3;
}

- (BOOL)hasAbModelResultTriggered
{
  return self->_hasAbModelResultTriggered;
}

- (void)setHasAbModelEvaluated:(BOOL)a3
{
  self->_hasAbModelEvaluated = a3;
}

- (BOOL)hasAbModelEvaluated
{
  return self->_hasAbModelEvaluated;
}

- (void)setHasCrrTrainingSampleCollected:(BOOL)a3
{
  self->_hasCrrTrainingSampleCollected = a3;
}

- (BOOL)hasCrrTrainingSampleCollected
{
  return self->_hasCrrTrainingSampleCollected;
}

- (void)setHasContactCandidatesInfoGenerated:(BOOL)a3
{
  self->_hasContactCandidatesInfoGenerated = a3;
}

- (BOOL)hasContactCandidatesInfoGenerated
{
  return self->_hasContactCandidatesInfoGenerated;
}

- (void)setHasUserPromptSelectedInfoGenerated:(BOOL)a3
{
  self->_hasUserPromptSelectedInfoGenerated = a3;
}

- (BOOL)hasUserPromptSelectedInfoGenerated
{
  return self->_hasUserPromptSelectedInfoGenerated;
}

- (void)setHasResolutionQueryInfoGenerated:(BOOL)a3
{
  self->_hasResolutionQueryInfoGenerated = a3;
}

- (BOOL)hasResolutionQueryInfoGenerated
{
  return self->_hasResolutionQueryInfoGenerated;
}

- (void)setHasSimpleTaskInfoGenerated:(BOOL)a3
{
  self->_hasSimpleTaskInfoGenerated = a3;
}

- (BOOL)hasSimpleTaskInfoGenerated
{
  return self->_hasSimpleTaskInfoGenerated;
}

- (void)setHasResolutionRequestContext:(BOOL)a3
{
  self->_hasResolutionRequestContext = a3;
}

- (BOOL)hasResolutionRequestContext
{
  return self->_hasResolutionRequestContext;
}

- (void)setHasVideoSmartAppSelectionDisambiguation:(BOOL)a3
{
  self->_hasVideoSmartAppSelectionDisambiguation = a3;
}

- (BOOL)hasVideoSmartAppSelectionDisambiguation
{
  return self->_hasVideoSmartAppSelectionDisambiguation;
}

- (void)setHasVideoPlayOnThirdPartyAppGroundTruthGenerated:(BOOL)a3
{
  self->_hasVideoPlayOnThirdPartyAppGroundTruthGenerated = a3;
}

- (BOOL)hasVideoPlayOnThirdPartyAppGroundTruthGenerated
{
  return self->_hasVideoPlayOnThirdPartyAppGroundTruthGenerated;
}

- (void)setHasMusicAppSelectionGroundTruthGenerated:(BOOL)a3
{
  self->_hasMusicAppSelectionGroundTruthGenerated = a3;
}

- (BOOL)hasMusicAppSelectionGroundTruthGenerated
{
  return self->_hasMusicAppSelectionGroundTruthGenerated;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (INFERENCESchemaINFERENCEClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (INFERENCESchemaINFERENCEClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)INFERENCESchemaINFERENCEClientEvent;
  v5 = [(INFERENCESchemaINFERENCEClientEvent *)&v55 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCEClientEventMetadata alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"musicAppSelectionGroundTruthGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated alloc] initWithDictionary:v8];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setMusicAppSelectionGroundTruthGenerated:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"videoPlayOnThirdPartyAppGroundTruthGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated alloc] initWithDictionary:v10];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setVideoPlayOnThirdPartyAppGroundTruthGenerated:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"videoSmartAppSelectionDisambiguation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated alloc] initWithDictionary:v12];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setVideoSmartAppSelectionDisambiguation:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"resolutionRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[INFERENCESchemaINFERENCEResolutionRequestContext alloc] initWithDictionary:v14];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setResolutionRequestContext:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"simpleTaskInfoGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[INFERENCESchemaINFERENCESimpleTaskInfoGenerated alloc] initWithDictionary:v16];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setSimpleTaskInfoGenerated:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"resolutionQueryInfoGenerated"];
    objc_opt_class();
    v54 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated alloc] initWithDictionary:v18];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setResolutionQueryInfoGenerated:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"userPromptSelectedInfoGenerated"];
    objc_opt_class();
    int v53 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated alloc] initWithDictionary:v20];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setUserPromptSelectedInfoGenerated:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"contactCandidatesInfoGenerated"];
    objc_opt_class();
    v52 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated alloc] initWithDictionary:v22];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setContactCandidatesInfoGenerated:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"crrTrainingSampleCollected"];
    objc_opt_class();
    v51 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[INFERENCESchemaINFERENCECRRTrainingSampleCollected alloc] initWithDictionary:v24];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setCrrTrainingSampleCollected:v25];
    }
    v49 = (void *)v8;
    uint64_t v26 = [v4 objectForKeyedSubscript:@"abModelEvaluated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[INFERENCESchemaINFERENCEABModelEvaluated alloc] initWithDictionary:v26];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setAbModelEvaluated:v27];
    }
    int v44 = (void *)v26;
    v48 = (void *)v10;
    v28 = [v4 objectForKeyedSubscript:@"abModelResultTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[INFERENCESchemaINFERENCEABModelResultTriggered alloc] initWithDictionary:v28];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setAbModelResultTriggered:v29];
    }
    int v47 = (void *)v12;
    v30 = [v4 objectForKeyedSubscript:@"workoutsAppSelectionGroundTruthGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated alloc] initWithDictionary:v30];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setWorkoutsAppSelectionGroundTruthGenerated:v31];
    }
    v46 = (void *)v14;
    int v32 = [v4 objectForKeyedSubscript:@"notebookAppSelectionGroundTruthGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated alloc] initWithDictionary:v32];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setNotebookAppSelectionGroundTruthGenerated:v33];
    }
    v45 = (void *)v16;
    v34 = [v4 objectForKeyedSubscript:@"commsAppSelectionGroundTruthGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated alloc] initWithDictionary:v34];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setCommsAppSelectionGroundTruthGenerated:v35];
    }
    int v50 = (void *)v6;
    v36 = [v4 objectForKeyedSubscript:@"pervasiveEntityResolutionGroundTruthGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated alloc] initWithDictionary:v36];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setPervasiveEntityResolutionGroundTruthGenerated:v37];
    }
    int v38 = [v4 objectForKeyedSubscript:@"seasExecutionPathReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported alloc] initWithDictionary:v38];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setSeasExecutionPathReported:v39];
    }
    v40 = [v4 objectForKeyedSubscript:@"asrEuclidEmbedding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[INFERENCESchemaINFERENCEAsrEuclidEmbedding alloc] initWithDictionary:v40];
      [(INFERENCESchemaINFERENCEClientEvent *)v5 setAsrEuclidEmbedding:v41];
    }
    v42 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  unint64_t v2 = [(INFERENCESchemaINFERENCEClientEvent *)self dictionaryRepresentation];
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
  if (self->_abModelEvaluated)
  {
    id v4 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelEvaluated];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"abModelEvaluated"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"abModelEvaluated"];
    }
  }
  if (self->_abModelResultTriggered)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelResultTriggered];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"abModelResultTriggered"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"abModelResultTriggered"];
    }
  }
  if (self->_asrEuclidEmbedding)
  {
    uint64_t v10 = [(INFERENCESchemaINFERENCEClientEvent *)self asrEuclidEmbedding];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"asrEuclidEmbedding"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"asrEuclidEmbedding"];
    }
  }
  if (self->_commsAppSelectionGroundTruthGenerated)
  {
    v13 = [(INFERENCESchemaINFERENCEClientEvent *)self commsAppSelectionGroundTruthGenerated];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"commsAppSelectionGroundTruthGenerated"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"commsAppSelectionGroundTruthGenerated"];
    }
  }
  if (self->_contactCandidatesInfoGenerated)
  {
    uint64_t v16 = [(INFERENCESchemaINFERENCEClientEvent *)self contactCandidatesInfoGenerated];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"contactCandidatesInfoGenerated"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"contactCandidatesInfoGenerated"];
    }
  }
  if (self->_crrTrainingSampleCollected)
  {
    v19 = [(INFERENCESchemaINFERENCEClientEvent *)self crrTrainingSampleCollected];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"crrTrainingSampleCollected"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"crrTrainingSampleCollected"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v22 = [(INFERENCESchemaINFERENCEClientEvent *)self eventMetadata];
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
  if (self->_musicAppSelectionGroundTruthGenerated)
  {
    v25 = [(INFERENCESchemaINFERENCEClientEvent *)self musicAppSelectionGroundTruthGenerated];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"musicAppSelectionGroundTruthGenerated"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"musicAppSelectionGroundTruthGenerated"];
    }
  }
  if (self->_notebookAppSelectionGroundTruthGenerated)
  {
    v28 = [(INFERENCESchemaINFERENCEClientEvent *)self notebookAppSelectionGroundTruthGenerated];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"notebookAppSelectionGroundTruthGenerated"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"notebookAppSelectionGroundTruthGenerated"];
    }
  }
  if (self->_pervasiveEntityResolutionGroundTruthGenerated)
  {
    v31 = [(INFERENCESchemaINFERENCEClientEvent *)self pervasiveEntityResolutionGroundTruthGenerated];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"pervasiveEntityResolutionGroundTruthGenerated"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"pervasiveEntityResolutionGroundTruthGenerated"];
    }
  }
  if (self->_resolutionQueryInfoGenerated)
  {
    v34 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionQueryInfoGenerated];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"resolutionQueryInfoGenerated"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"resolutionQueryInfoGenerated"];
    }
  }
  if (self->_resolutionRequestContext)
  {
    v37 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionRequestContext];
    int v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"resolutionRequestContext"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"resolutionRequestContext"];
    }
  }
  if (self->_seasExecutionPathReported)
  {
    v40 = [(INFERENCESchemaINFERENCEClientEvent *)self seasExecutionPathReported];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"seasExecutionPathReported"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"seasExecutionPathReported"];
    }
  }
  if (self->_simpleTaskInfoGenerated)
  {
    v43 = [(INFERENCESchemaINFERENCEClientEvent *)self simpleTaskInfoGenerated];
    int v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"simpleTaskInfoGenerated"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"simpleTaskInfoGenerated"];
    }
  }
  if (self->_userPromptSelectedInfoGenerated)
  {
    v46 = [(INFERENCESchemaINFERENCEClientEvent *)self userPromptSelectedInfoGenerated];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"userPromptSelectedInfoGenerated"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"userPromptSelectedInfoGenerated"];
    }
  }
  if (self->_videoPlayOnThirdPartyAppGroundTruthGenerated)
  {
    v49 = [(INFERENCESchemaINFERENCEClientEvent *)self videoPlayOnThirdPartyAppGroundTruthGenerated];
    int v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"videoPlayOnThirdPartyAppGroundTruthGenerated"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"videoPlayOnThirdPartyAppGroundTruthGenerated"];
    }
  }
  if (self->_videoSmartAppSelectionDisambiguation)
  {
    v52 = [(INFERENCESchemaINFERENCEClientEvent *)self videoSmartAppSelectionDisambiguation];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"videoSmartAppSelectionDisambiguation"];
    }
    else
    {
      v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"videoSmartAppSelectionDisambiguation"];
    }
  }
  if (self->_workoutsAppSelectionGroundTruthGenerated)
  {
    objc_super v55 = [(INFERENCESchemaINFERENCEClientEvent *)self workoutsAppSelectionGroundTruthGenerated];
    int v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"workoutsAppSelectionGroundTruthGenerated"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"workoutsAppSelectionGroundTruthGenerated"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INFERENCESchemaINFERENCEClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)self->_musicAppSelectionGroundTruthGenerated hash] ^ v3;
  unint64_t v5 = [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *)self->_videoPlayOnThirdPartyAppGroundTruthGenerated hash];
  unint64_t v6 = v4 ^ v5 ^ [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self->_videoSmartAppSelectionDisambiguation hash];
  unint64_t v7 = [(INFERENCESchemaINFERENCEResolutionRequestContext *)self->_resolutionRequestContext hash];
  unint64_t v8 = v7 ^ [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self->_simpleTaskInfoGenerated hash];
  unint64_t v9 = v6 ^ v8 ^ [(INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)self->_resolutionQueryInfoGenerated hash];
  unint64_t v10 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self->_userPromptSelectedInfoGenerated hash];
  unint64_t v11 = v10 ^ [(INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)self->_contactCandidatesInfoGenerated hash];
  unint64_t v12 = v11 ^ [(INFERENCESchemaINFERENCECRRTrainingSampleCollected *)self->_crrTrainingSampleCollected hash];
  unint64_t v13 = v9 ^ v12 ^ [(INFERENCESchemaINFERENCEABModelEvaluated *)self->_abModelEvaluated hash];
  unint64_t v14 = [(INFERENCESchemaINFERENCEABModelResultTriggered *)self->_abModelResultTriggered hash];
  unint64_t v15 = v14 ^ [(INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *)self->_workoutsAppSelectionGroundTruthGenerated hash];
  unint64_t v16 = v15 ^ [(INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *)self->_notebookAppSelectionGroundTruthGenerated hash];
  unint64_t v17 = v16 ^ [(INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)self->_commsAppSelectionGroundTruthGenerated hash];
  unint64_t v18 = v13 ^ v17 ^ [(INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *)self->_pervasiveEntityResolutionGroundTruthGenerated hash];
  unint64_t v19 = [(INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *)self->_seasExecutionPathReported hash];
  return v18 ^ v19 ^ [(INFERENCESchemaINFERENCEAsrEuclidEmbedding *)self->_asrEuclidEmbedding hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_93;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_93;
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v8 = [(INFERENCESchemaINFERENCEClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(INFERENCESchemaINFERENCEClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self musicAppSelectionGroundTruthGenerated];
  unint64_t v7 = [v4 musicAppSelectionGroundTruthGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v13 = [(INFERENCESchemaINFERENCEClientEvent *)self musicAppSelectionGroundTruthGenerated];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(INFERENCESchemaINFERENCEClientEvent *)self musicAppSelectionGroundTruthGenerated];
    unint64_t v16 = [v4 musicAppSelectionGroundTruthGenerated];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self videoPlayOnThirdPartyAppGroundTruthGenerated];
  unint64_t v7 = [v4 videoPlayOnThirdPartyAppGroundTruthGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v18 = [(INFERENCESchemaINFERENCEClientEvent *)self videoPlayOnThirdPartyAppGroundTruthGenerated];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    uint64_t v20 = [(INFERENCESchemaINFERENCEClientEvent *)self videoPlayOnThirdPartyAppGroundTruthGenerated];
    v21 = [v4 videoPlayOnThirdPartyAppGroundTruthGenerated];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self videoSmartAppSelectionDisambiguation];
  unint64_t v7 = [v4 videoSmartAppSelectionDisambiguation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v23 = [(INFERENCESchemaINFERENCEClientEvent *)self videoSmartAppSelectionDisambiguation];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    v25 = [(INFERENCESchemaINFERENCEClientEvent *)self videoSmartAppSelectionDisambiguation];
    uint64_t v26 = [v4 videoSmartAppSelectionDisambiguation];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionRequestContext];
  unint64_t v7 = [v4 resolutionRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v28 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionRequestContext];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionRequestContext];
    v31 = [v4 resolutionRequestContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self simpleTaskInfoGenerated];
  unint64_t v7 = [v4 simpleTaskInfoGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v33 = [(INFERENCESchemaINFERENCEClientEvent *)self simpleTaskInfoGenerated];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(INFERENCESchemaINFERENCEClientEvent *)self simpleTaskInfoGenerated];
    v36 = [v4 simpleTaskInfoGenerated];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionQueryInfoGenerated];
  unint64_t v7 = [v4 resolutionQueryInfoGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v38 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionQueryInfoGenerated];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionQueryInfoGenerated];
    int v41 = [v4 resolutionQueryInfoGenerated];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self userPromptSelectedInfoGenerated];
  unint64_t v7 = [v4 userPromptSelectedInfoGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v43 = [(INFERENCESchemaINFERENCEClientEvent *)self userPromptSelectedInfoGenerated];
  if (v43)
  {
    int v44 = (void *)v43;
    v45 = [(INFERENCESchemaINFERENCEClientEvent *)self userPromptSelectedInfoGenerated];
    v46 = [v4 userPromptSelectedInfoGenerated];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self contactCandidatesInfoGenerated];
  unint64_t v7 = [v4 contactCandidatesInfoGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v48 = [(INFERENCESchemaINFERENCEClientEvent *)self contactCandidatesInfoGenerated];
  if (v48)
  {
    v49 = (void *)v48;
    int v50 = [(INFERENCESchemaINFERENCEClientEvent *)self contactCandidatesInfoGenerated];
    v51 = [v4 contactCandidatesInfoGenerated];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self crrTrainingSampleCollected];
  unint64_t v7 = [v4 crrTrainingSampleCollected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v53 = [(INFERENCESchemaINFERENCEClientEvent *)self crrTrainingSampleCollected];
  if (v53)
  {
    v54 = (void *)v53;
    objc_super v55 = [(INFERENCESchemaINFERENCEClientEvent *)self crrTrainingSampleCollected];
    int v56 = [v4 crrTrainingSampleCollected];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelEvaluated];
  unint64_t v7 = [v4 abModelEvaluated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v58 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelEvaluated];
  if (v58)
  {
    int v59 = (void *)v58;
    v60 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelEvaluated];
    objc_super v61 = [v4 abModelEvaluated];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelResultTriggered];
  unint64_t v7 = [v4 abModelResultTriggered];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v63 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelResultTriggered];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelResultTriggered];
    v66 = [v4 abModelResultTriggered];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self workoutsAppSelectionGroundTruthGenerated];
  unint64_t v7 = [v4 workoutsAppSelectionGroundTruthGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v68 = [(INFERENCESchemaINFERENCEClientEvent *)self workoutsAppSelectionGroundTruthGenerated];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(INFERENCESchemaINFERENCEClientEvent *)self workoutsAppSelectionGroundTruthGenerated];
    v71 = [v4 workoutsAppSelectionGroundTruthGenerated];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self notebookAppSelectionGroundTruthGenerated];
  unint64_t v7 = [v4 notebookAppSelectionGroundTruthGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v73 = [(INFERENCESchemaINFERENCEClientEvent *)self notebookAppSelectionGroundTruthGenerated];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(INFERENCESchemaINFERENCEClientEvent *)self notebookAppSelectionGroundTruthGenerated];
    v76 = [v4 notebookAppSelectionGroundTruthGenerated];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self commsAppSelectionGroundTruthGenerated];
  unint64_t v7 = [v4 commsAppSelectionGroundTruthGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v78 = [(INFERENCESchemaINFERENCEClientEvent *)self commsAppSelectionGroundTruthGenerated];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(INFERENCESchemaINFERENCEClientEvent *)self commsAppSelectionGroundTruthGenerated];
    v81 = [v4 commsAppSelectionGroundTruthGenerated];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self pervasiveEntityResolutionGroundTruthGenerated];
  unint64_t v7 = [v4 pervasiveEntityResolutionGroundTruthGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v83 = [(INFERENCESchemaINFERENCEClientEvent *)self pervasiveEntityResolutionGroundTruthGenerated];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(INFERENCESchemaINFERENCEClientEvent *)self pervasiveEntityResolutionGroundTruthGenerated];
    v86 = [v4 pervasiveEntityResolutionGroundTruthGenerated];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self seasExecutionPathReported];
  unint64_t v7 = [v4 seasExecutionPathReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_92;
  }
  uint64_t v88 = [(INFERENCESchemaINFERENCEClientEvent *)self seasExecutionPathReported];
  if (v88)
  {
    v89 = (void *)v88;
    v90 = [(INFERENCESchemaINFERENCEClientEvent *)self seasExecutionPathReported];
    v91 = [v4 seasExecutionPathReported];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_93;
    }
  }
  else
  {
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self asrEuclidEmbedding];
  unint64_t v7 = [v4 asrEuclidEmbedding];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v93 = [(INFERENCESchemaINFERENCEClientEvent *)self asrEuclidEmbedding];
    if (!v93)
    {

LABEL_96:
      BOOL v98 = 1;
      goto LABEL_94;
    }
    v94 = (void *)v93;
    v95 = [(INFERENCESchemaINFERENCEClientEvent *)self asrEuclidEmbedding];
    v96 = [v4 asrEuclidEmbedding];
    char v97 = [v95 isEqual:v96];

    if (v97) {
      goto LABEL_96;
    }
  }
  else
  {
LABEL_92:
  }
LABEL_93:
  BOOL v98 = 0;
LABEL_94:

  return v98;
}

- (void)writeTo:(id)a3
{
  id v40 = a3;
  id v4 = [(INFERENCESchemaINFERENCEClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(INFERENCESchemaINFERENCEClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEClientEvent *)self musicAppSelectionGroundTruthGenerated];

  if (v6)
  {
    unint64_t v7 = [(INFERENCESchemaINFERENCEClientEvent *)self musicAppSelectionGroundTruthGenerated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(INFERENCESchemaINFERENCEClientEvent *)self videoPlayOnThirdPartyAppGroundTruthGenerated];

  if (v8)
  {
    unint64_t v9 = [(INFERENCESchemaINFERENCEClientEvent *)self videoPlayOnThirdPartyAppGroundTruthGenerated];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(INFERENCESchemaINFERENCEClientEvent *)self videoSmartAppSelectionDisambiguation];

  if (v10)
  {
    unint64_t v11 = [(INFERENCESchemaINFERENCEClientEvent *)self videoSmartAppSelectionDisambiguation];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionRequestContext];

  if (v12)
  {
    uint64_t v13 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionRequestContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(INFERENCESchemaINFERENCEClientEvent *)self simpleTaskInfoGenerated];

  if (v14)
  {
    unint64_t v15 = [(INFERENCESchemaINFERENCEClientEvent *)self simpleTaskInfoGenerated];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionQueryInfoGenerated];

  if (v16)
  {
    int v17 = [(INFERENCESchemaINFERENCEClientEvent *)self resolutionQueryInfoGenerated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(INFERENCESchemaINFERENCEClientEvent *)self userPromptSelectedInfoGenerated];

  if (v18)
  {
    unint64_t v19 = [(INFERENCESchemaINFERENCEClientEvent *)self userPromptSelectedInfoGenerated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v20 = [(INFERENCESchemaINFERENCEClientEvent *)self contactCandidatesInfoGenerated];

  if (v20)
  {
    v21 = [(INFERENCESchemaINFERENCEClientEvent *)self contactCandidatesInfoGenerated];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(INFERENCESchemaINFERENCEClientEvent *)self crrTrainingSampleCollected];

  if (v22)
  {
    uint64_t v23 = [(INFERENCESchemaINFERENCEClientEvent *)self crrTrainingSampleCollected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v24 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelEvaluated];

  if (v24)
  {
    v25 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelEvaluated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v26 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelResultTriggered];

  if (v26)
  {
    int v27 = [(INFERENCESchemaINFERENCEClientEvent *)self abModelResultTriggered];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(INFERENCESchemaINFERENCEClientEvent *)self workoutsAppSelectionGroundTruthGenerated];

  if (v28)
  {
    int v29 = [(INFERENCESchemaINFERENCEClientEvent *)self workoutsAppSelectionGroundTruthGenerated];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(INFERENCESchemaINFERENCEClientEvent *)self notebookAppSelectionGroundTruthGenerated];

  if (v30)
  {
    v31 = [(INFERENCESchemaINFERENCEClientEvent *)self notebookAppSelectionGroundTruthGenerated];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(INFERENCESchemaINFERENCEClientEvent *)self commsAppSelectionGroundTruthGenerated];

  if (v32)
  {
    uint64_t v33 = [(INFERENCESchemaINFERENCEClientEvent *)self commsAppSelectionGroundTruthGenerated];
    PBDataWriterWriteSubmessage();
  }
  v34 = [(INFERENCESchemaINFERENCEClientEvent *)self pervasiveEntityResolutionGroundTruthGenerated];

  if (v34)
  {
    int v35 = [(INFERENCESchemaINFERENCEClientEvent *)self pervasiveEntityResolutionGroundTruthGenerated];
    PBDataWriterWriteSubmessage();
  }
  v36 = [(INFERENCESchemaINFERENCEClientEvent *)self seasExecutionPathReported];

  if (v36)
  {
    int v37 = [(INFERENCESchemaINFERENCEClientEvent *)self seasExecutionPathReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(INFERENCESchemaINFERENCEClientEvent *)self asrEuclidEmbedding];

  if (v38)
  {
    v39 = [(INFERENCESchemaINFERENCEClientEvent *)self asrEuclidEmbedding];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteAsrEuclidEmbedding
{
  if (self->_whichEvent_Type == 117)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_asrEuclidEmbedding = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEAsrEuclidEmbedding)asrEuclidEmbedding
{
  if (self->_whichEvent_Type == 117) {
    unint64_t v2 = self->_asrEuclidEmbedding;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAsrEuclidEmbedding:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEAsrEuclidEmbedding *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  unint64_t v21 = 117;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = v4;
}

- (void)deleteSeasExecutionPathReported
{
  if (self->_whichEvent_Type == 116)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_seasExecutionPathReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported)seasExecutionPathReported
{
  if (self->_whichEvent_Type == 116) {
    unint64_t v2 = self->_seasExecutionPathReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSeasExecutionPathReported:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 116;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = v4;
}

- (void)deletePervasiveEntityResolutionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 115)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pervasiveEntityResolutionGroundTruthGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated)pervasiveEntityResolutionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 115) {
    unint64_t v2 = self->_pervasiveEntityResolutionGroundTruthGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPervasiveEntityResolutionGroundTruthGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 115;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = v4;
}

- (void)deleteCommsAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 114)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_commsAppSelectionGroundTruthGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated)commsAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 114) {
    unint64_t v2 = self->_commsAppSelectionGroundTruthGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setCommsAppSelectionGroundTruthGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 114;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = v4;
}

- (void)deleteNotebookAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 113)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_notebookAppSelectionGroundTruthGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated)notebookAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 113) {
    unint64_t v2 = self->_notebookAppSelectionGroundTruthGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setNotebookAppSelectionGroundTruthGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 113;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = v4;
}

- (void)deleteWorkoutsAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_workoutsAppSelectionGroundTruthGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated)workoutsAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 112) {
    unint64_t v2 = self->_workoutsAppSelectionGroundTruthGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setWorkoutsAppSelectionGroundTruthGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 112;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = v4;
}

- (void)deleteAbModelResultTriggered
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_abModelResultTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEABModelResultTriggered)abModelResultTriggered
{
  if (self->_whichEvent_Type == 111) {
    unint64_t v2 = self->_abModelResultTriggered;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAbModelResultTriggered:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEABModelResultTriggered *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 111;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = v4;
}

- (void)deleteAbModelEvaluated
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_abModelEvaluated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEABModelEvaluated)abModelEvaluated
{
  if (self->_whichEvent_Type == 110) {
    unint64_t v2 = self->_abModelEvaluated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAbModelEvaluated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEABModelEvaluated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 110;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = v4;
}

- (void)deleteCrrTrainingSampleCollected
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_crrTrainingSampleCollected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCECRRTrainingSampleCollected)crrTrainingSampleCollected
{
  if (self->_whichEvent_Type == 109) {
    unint64_t v2 = self->_crrTrainingSampleCollected;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setCrrTrainingSampleCollected:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCECRRTrainingSampleCollected *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 109;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = v4;
}

- (void)deleteContactCandidatesInfoGenerated
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactCandidatesInfoGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated)contactCandidatesInfoGenerated
{
  if (self->_whichEvent_Type == 108) {
    unint64_t v2 = self->_contactCandidatesInfoGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactCandidatesInfoGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 108;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = v4;
}

- (void)deleteUserPromptSelectedInfoGenerated
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userPromptSelectedInfoGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated)userPromptSelectedInfoGenerated
{
  if (self->_whichEvent_Type == 107) {
    unint64_t v2 = self->_userPromptSelectedInfoGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setUserPromptSelectedInfoGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 107;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = v4;
}

- (void)deleteResolutionQueryInfoGenerated
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_resolutionQueryInfoGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated)resolutionQueryInfoGenerated
{
  if (self->_whichEvent_Type == 106) {
    unint64_t v2 = self->_resolutionQueryInfoGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setResolutionQueryInfoGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 106;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = v4;
}

- (void)deleteSimpleTaskInfoGenerated
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_simpleTaskInfoGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCESimpleTaskInfoGenerated)simpleTaskInfoGenerated
{
  if (self->_whichEvent_Type == 105) {
    unint64_t v2 = self->_simpleTaskInfoGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSimpleTaskInfoGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 105;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = v4;
}

- (void)deleteResolutionRequestContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_resolutionRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEResolutionRequestContext)resolutionRequestContext
{
  if (self->_whichEvent_Type == 104) {
    unint64_t v2 = self->_resolutionRequestContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setResolutionRequestContext:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEResolutionRequestContext *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 104;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = v4;
}

- (void)deleteVideoSmartAppSelectionDisambiguation
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_videoSmartAppSelectionDisambiguation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated)videoSmartAppSelectionDisambiguation
{
  if (self->_whichEvent_Type == 103) {
    unint64_t v2 = self->_videoSmartAppSelectionDisambiguation;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setVideoSmartAppSelectionDisambiguation:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 103;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = v4;
}

- (void)deleteVideoPlayOnThirdPartyAppGroundTruthGenerated
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated)videoPlayOnThirdPartyAppGroundTruthGenerated
{
  if (self->_whichEvent_Type == 102) {
    unint64_t v2 = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setVideoPlayOnThirdPartyAppGroundTruthGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 102;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = v4;
}

- (void)deleteMusicAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_musicAppSelectionGroundTruthGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated)musicAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 101) {
    unint64_t v2 = self->_musicAppSelectionGroundTruthGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setMusicAppSelectionGroundTruthGenerated:(id)a3
{
  id v4 = (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)a3;
  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  unint64_t v21 = 101;
  if (!v4) {
    unint64_t v21 = 0;
  }
  self->_unint64_t whichEvent_Type = v21;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = v4;
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
  unint64_t v2 = [(INFERENCESchemaINFERENCEClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 0x10) {
    return @"com.apple.aiml.siri.inference.INFERENCEClientEvent";
  }
  else {
    return off_1E5EB0D20[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 57;
}

@end