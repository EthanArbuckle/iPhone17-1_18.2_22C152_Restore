@interface PLUSSchemaPLUSClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasContactGroundTruthGenerated;
- (BOOL)hasContactSuggesterQueryContext;
- (BOOL)hasContactSuggesterRequestMetadataReported;
- (BOOL)hasContactSuggesterSuggestionMetadataReported;
- (BOOL)hasContactSuggestionAccuracySignalReported;
- (BOOL)hasContactSuggestionGenerated;
- (BOOL)hasContactSuggestionHeartbeatReported;
- (BOOL)hasContactSuggestionOutcomeReported;
- (BOOL)hasContactSuggestionRemoved;
- (BOOL)hasEventMetadata;
- (BOOL)hasInferencePluginInvocationContext;
- (BOOL)hasMediaEvaluationSummaryReported;
- (BOOL)hasMediaGroundTruthGenerated;
- (BOOL)hasPatternSequenceGenerated;
- (BOOL)hasPhoneCallMetadataExtracted;
- (BOOL)hasPlusSuggesterMetadataReported;
- (BOOL)hasPlusSuggesterQueried;
- (BOOL)hasPlusSuggesterSuggestionMetadataReported;
- (BOOL)hasPlusSuggesterSuggestionRedundancyReported;
- (BOOL)hasSendMessageMetadataExtracted;
- (BOOL)hasSuggestionGenerated;
- (BOOL)hasSuggestionOutcomeReported;
- (BOOL)hasTmdcGroundTruthGenerated;
- (BOOL)hasUsoGraphTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSClientEvent)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSClientEvent)initWithJSON:(id)a3;
- (PLUSSchemaPLUSClientEventMetadata)eventMetadata;
- (PLUSSchemaPLUSContactGroundTruthGenerated)contactGroundTruthGenerated;
- (PLUSSchemaPLUSContactSuggesterQueryContext)contactSuggesterQueryContext;
- (PLUSSchemaPLUSContactSuggesterRequestMetadataReported)contactSuggesterRequestMetadataReported;
- (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported)contactSuggesterSuggestionMetadataReported;
- (PLUSSchemaPLUSContactSuggestionAccuracySignalReported)contactSuggestionAccuracySignalReported;
- (PLUSSchemaPLUSContactSuggestionGenerated)contactSuggestionGenerated;
- (PLUSSchemaPLUSContactSuggestionHeartbeatReported)contactSuggestionHeartbeatReported;
- (PLUSSchemaPLUSContactSuggestionOutcomeReported)contactSuggestionOutcomeReported;
- (PLUSSchemaPLUSContactSuggestionRemoved)contactSuggestionRemoved;
- (PLUSSchemaPLUSInferencePluginInvocationContext)inferencePluginInvocationContext;
- (PLUSSchemaPLUSMediaEvaluationSummaryReported)mediaEvaluationSummaryReported;
- (PLUSSchemaPLUSMediaGroundTruthGenerated)mediaGroundTruthGenerated;
- (PLUSSchemaPLUSPhoneCallMetadataExtracted)phoneCallMetadataExtracted;
- (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated)patternSequenceGenerated;
- (PLUSSchemaPLUSSendMessageMetadataExtracted)sendMessageMetadataExtracted;
- (PLUSSchemaPLUSSuggesterMetadataReported)plusSuggesterMetadataReported;
- (PLUSSchemaPLUSSuggesterQueried)plusSuggesterQueried;
- (PLUSSchemaPLUSSuggesterSuggestionMetadataReported)plusSuggesterSuggestionMetadataReported;
- (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported)plusSuggesterSuggestionRedundancyReported;
- (PLUSSchemaPLUSSuggestionGenerated)suggestionGenerated;
- (PLUSSchemaPLUSSuggestionOutcomeReported)suggestionOutcomeReported;
- (PLUSSchemaPLUSTMDCGroundTruthGenerated)tmdcGroundTruthGenerated;
- (PLUSSchemaPLUSUSOGraphTier1)usoGraphTier1;
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
- (void)deleteContactGroundTruthGenerated;
- (void)deleteContactSuggesterQueryContext;
- (void)deleteContactSuggesterRequestMetadataReported;
- (void)deleteContactSuggesterSuggestionMetadataReported;
- (void)deleteContactSuggestionAccuracySignalReported;
- (void)deleteContactSuggestionGenerated;
- (void)deleteContactSuggestionHeartbeatReported;
- (void)deleteContactSuggestionOutcomeReported;
- (void)deleteContactSuggestionRemoved;
- (void)deleteEventMetadata;
- (void)deleteInferencePluginInvocationContext;
- (void)deleteMediaEvaluationSummaryReported;
- (void)deleteMediaGroundTruthGenerated;
- (void)deletePatternSequenceGenerated;
- (void)deletePhoneCallMetadataExtracted;
- (void)deletePlusSuggesterMetadataReported;
- (void)deletePlusSuggesterQueried;
- (void)deletePlusSuggesterSuggestionMetadataReported;
- (void)deletePlusSuggesterSuggestionRedundancyReported;
- (void)deleteSendMessageMetadataExtracted;
- (void)deleteSuggestionGenerated;
- (void)deleteSuggestionOutcomeReported;
- (void)deleteTmdcGroundTruthGenerated;
- (void)deleteUsoGraphTier1;
- (void)setContactGroundTruthGenerated:(id)a3;
- (void)setContactSuggesterQueryContext:(id)a3;
- (void)setContactSuggesterRequestMetadataReported:(id)a3;
- (void)setContactSuggesterSuggestionMetadataReported:(id)a3;
- (void)setContactSuggestionAccuracySignalReported:(id)a3;
- (void)setContactSuggestionGenerated:(id)a3;
- (void)setContactSuggestionHeartbeatReported:(id)a3;
- (void)setContactSuggestionOutcomeReported:(id)a3;
- (void)setContactSuggestionRemoved:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasContactGroundTruthGenerated:(BOOL)a3;
- (void)setHasContactSuggesterQueryContext:(BOOL)a3;
- (void)setHasContactSuggesterRequestMetadataReported:(BOOL)a3;
- (void)setHasContactSuggesterSuggestionMetadataReported:(BOOL)a3;
- (void)setHasContactSuggestionAccuracySignalReported:(BOOL)a3;
- (void)setHasContactSuggestionGenerated:(BOOL)a3;
- (void)setHasContactSuggestionHeartbeatReported:(BOOL)a3;
- (void)setHasContactSuggestionOutcomeReported:(BOOL)a3;
- (void)setHasContactSuggestionRemoved:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasInferencePluginInvocationContext:(BOOL)a3;
- (void)setHasMediaEvaluationSummaryReported:(BOOL)a3;
- (void)setHasMediaGroundTruthGenerated:(BOOL)a3;
- (void)setHasPatternSequenceGenerated:(BOOL)a3;
- (void)setHasPhoneCallMetadataExtracted:(BOOL)a3;
- (void)setHasPlusSuggesterMetadataReported:(BOOL)a3;
- (void)setHasPlusSuggesterQueried:(BOOL)a3;
- (void)setHasPlusSuggesterSuggestionMetadataReported:(BOOL)a3;
- (void)setHasPlusSuggesterSuggestionRedundancyReported:(BOOL)a3;
- (void)setHasSendMessageMetadataExtracted:(BOOL)a3;
- (void)setHasSuggestionGenerated:(BOOL)a3;
- (void)setHasSuggestionOutcomeReported:(BOOL)a3;
- (void)setHasTmdcGroundTruthGenerated:(BOOL)a3;
- (void)setHasUsoGraphTier1:(BOOL)a3;
- (void)setInferencePluginInvocationContext:(id)a3;
- (void)setMediaEvaluationSummaryReported:(id)a3;
- (void)setMediaGroundTruthGenerated:(id)a3;
- (void)setPatternSequenceGenerated:(id)a3;
- (void)setPhoneCallMetadataExtracted:(id)a3;
- (void)setPlusSuggesterMetadataReported:(id)a3;
- (void)setPlusSuggesterQueried:(id)a3;
- (void)setPlusSuggesterSuggestionMetadataReported:(id)a3;
- (void)setPlusSuggesterSuggestionRedundancyReported:(id)a3;
- (void)setSendMessageMetadataExtracted:(id)a3;
- (void)setSuggestionGenerated:(id)a3;
- (void)setSuggestionOutcomeReported:(id)a3;
- (void)setTmdcGroundTruthGenerated:(id)a3;
- (void)setUsoGraphTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSClientEvent

- (int)componentName
{
  v2 = [(PLUSSchemaPLUSClientEvent *)self eventMetadata];
  v3 = [v2 plusId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 19;
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
  v2 = [(PLUSSchemaPLUSClientEvent *)self eventMetadata];
  v3 = [v2 plusId];

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
  v79.receiver = self;
  v79.super_class = (Class)PLUSSchemaPLUSClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v79 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PLUSSchemaPLUSClientEvent *)self deleteUsoGraphTier1];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaGroundTruthGenerated];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaEvaluationSummaryReported];
  }
  if ([v4 isConditionSet:4])
  {
    [(PLUSSchemaPLUSClientEvent *)self deleteUsoGraphTier1];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaGroundTruthGenerated];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaEvaluationSummaryReported];
  }
  if ([v4 isConditionSet:5])
  {
    [(PLUSSchemaPLUSClientEvent *)self deleteUsoGraphTier1];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaGroundTruthGenerated];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaEvaluationSummaryReported];
  }
  if ([v4 isConditionSet:6])
  {
    [(PLUSSchemaPLUSClientEvent *)self deleteUsoGraphTier1];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaGroundTruthGenerated];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaEvaluationSummaryReported];
  }
  if ([v4 isConditionSet:7])
  {
    [(PLUSSchemaPLUSClientEvent *)self deleteUsoGraphTier1];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaGroundTruthGenerated];
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaEvaluationSummaryReported];
  }
  uint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSClientEvent *)self deleteEventMetadata];
  }
  v9 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterQueryContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSClientEvent *)self deleteContactSuggesterQueryContext];
  }
  v12 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionOutcomeReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PLUSSchemaPLUSClientEvent *)self deleteContactSuggestionOutcomeReported];
  }
  v15 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterRequestMetadataReported];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PLUSSchemaPLUSClientEvent *)self deleteContactSuggesterRequestMetadataReported];
  }
  v18 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterSuggestionMetadataReported];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PLUSSchemaPLUSClientEvent *)self deleteContactSuggesterSuggestionMetadataReported];
  }
  v21 = [(PLUSSchemaPLUSClientEvent *)self usoGraphTier1];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PLUSSchemaPLUSClientEvent *)self deleteUsoGraphTier1];
  }
  v24 = [(PLUSSchemaPLUSClientEvent *)self inferencePluginInvocationContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PLUSSchemaPLUSClientEvent *)self deleteInferencePluginInvocationContext];
  }
  v27 = [(PLUSSchemaPLUSClientEvent *)self contactGroundTruthGenerated];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PLUSSchemaPLUSClientEvent *)self deleteContactGroundTruthGenerated];
  }
  v30 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionGenerated];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(PLUSSchemaPLUSClientEvent *)self deleteContactSuggestionGenerated];
  }
  v33 = [(PLUSSchemaPLUSClientEvent *)self phoneCallMetadataExtracted];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(PLUSSchemaPLUSClientEvent *)self deletePhoneCallMetadataExtracted];
  }
  v36 = [(PLUSSchemaPLUSClientEvent *)self tmdcGroundTruthGenerated];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(PLUSSchemaPLUSClientEvent *)self deleteTmdcGroundTruthGenerated];
  }
  v39 = [(PLUSSchemaPLUSClientEvent *)self patternSequenceGenerated];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(PLUSSchemaPLUSClientEvent *)self deletePatternSequenceGenerated];
  }
  v42 = [(PLUSSchemaPLUSClientEvent *)self sendMessageMetadataExtracted];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(PLUSSchemaPLUSClientEvent *)self deleteSendMessageMetadataExtracted];
  }
  v45 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionHeartbeatReported];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(PLUSSchemaPLUSClientEvent *)self deleteContactSuggestionHeartbeatReported];
  }
  v48 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionRemoved];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(PLUSSchemaPLUSClientEvent *)self deleteContactSuggestionRemoved];
  }
  v51 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionAccuracySignalReported];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(PLUSSchemaPLUSClientEvent *)self deleteContactSuggestionAccuracySignalReported];
  }
  v54 = [(PLUSSchemaPLUSClientEvent *)self mediaGroundTruthGenerated];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaGroundTruthGenerated];
  }
  v57 = [(PLUSSchemaPLUSClientEvent *)self mediaEvaluationSummaryReported];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(PLUSSchemaPLUSClientEvent *)self deleteMediaEvaluationSummaryReported];
  }
  v60 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterQueried];
  v61 = [v60 applySensitiveConditionsPolicy:v4];
  int v62 = [v61 suppressMessage];

  if (v62) {
    [(PLUSSchemaPLUSClientEvent *)self deletePlusSuggesterQueried];
  }
  v63 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterMetadataReported];
  v64 = [v63 applySensitiveConditionsPolicy:v4];
  int v65 = [v64 suppressMessage];

  if (v65) {
    [(PLUSSchemaPLUSClientEvent *)self deletePlusSuggesterMetadataReported];
  }
  v66 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionMetadataReported];
  v67 = [v66 applySensitiveConditionsPolicy:v4];
  int v68 = [v67 suppressMessage];

  if (v68) {
    [(PLUSSchemaPLUSClientEvent *)self deletePlusSuggesterSuggestionMetadataReported];
  }
  v69 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionRedundancyReported];
  v70 = [v69 applySensitiveConditionsPolicy:v4];
  int v71 = [v70 suppressMessage];

  if (v71) {
    [(PLUSSchemaPLUSClientEvent *)self deletePlusSuggesterSuggestionRedundancyReported];
  }
  v72 = [(PLUSSchemaPLUSClientEvent *)self suggestionGenerated];
  v73 = [v72 applySensitiveConditionsPolicy:v4];
  int v74 = [v73 suppressMessage];

  if (v74) {
    [(PLUSSchemaPLUSClientEvent *)self deleteSuggestionGenerated];
  }
  v75 = [(PLUSSchemaPLUSClientEvent *)self suggestionOutcomeReported];
  v76 = [v75 applySensitiveConditionsPolicy:v4];
  int v77 = [v76 suppressMessage];

  if (v77) {
    [(PLUSSchemaPLUSClientEvent *)self deleteSuggestionOutcomeReported];
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
  unint64_t v3 = [(PLUSSchemaPLUSClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 0x16) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAB868[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x16) {
    return 0;
  }
  else {
    return off_1E5EAB920[a3 - 101];
  }
}

- (int)clockIsolationLevel
{
  unint64_t v2 = [(PLUSSchemaPLUSClientEvent *)self whichEvent_Type];
  if (v2 - 106 > 0x11) {
    return 1;
  }
  else {
    return dword_1AE47AE58[v2 - 106];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionOutcomeReported, 0);
  objc_storeStrong((id *)&self->_suggestionGenerated, 0);
  objc_storeStrong((id *)&self->_plusSuggesterSuggestionRedundancyReported, 0);
  objc_storeStrong((id *)&self->_plusSuggesterSuggestionMetadataReported, 0);
  objc_storeStrong((id *)&self->_plusSuggesterMetadataReported, 0);
  objc_storeStrong((id *)&self->_plusSuggesterQueried, 0);
  objc_storeStrong((id *)&self->_mediaEvaluationSummaryReported, 0);
  objc_storeStrong((id *)&self->_mediaGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_contactSuggestionAccuracySignalReported, 0);
  objc_storeStrong((id *)&self->_contactSuggestionRemoved, 0);
  objc_storeStrong((id *)&self->_contactSuggestionHeartbeatReported, 0);
  objc_storeStrong((id *)&self->_sendMessageMetadataExtracted, 0);
  objc_storeStrong((id *)&self->_patternSequenceGenerated, 0);
  objc_storeStrong((id *)&self->_tmdcGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_phoneCallMetadataExtracted, 0);
  objc_storeStrong((id *)&self->_contactSuggestionGenerated, 0);
  objc_storeStrong((id *)&self->_contactGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_inferencePluginInvocationContext, 0);
  objc_storeStrong((id *)&self->_usoGraphTier1, 0);
  objc_storeStrong((id *)&self->_contactSuggesterSuggestionMetadataReported, 0);
  objc_storeStrong((id *)&self->_contactSuggesterRequestMetadataReported, 0);
  objc_storeStrong((id *)&self->_contactSuggestionOutcomeReported, 0);
  objc_storeStrong((id *)&self->_contactSuggesterQueryContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasSuggestionOutcomeReported:(BOOL)a3
{
  self->_hasSuggestionOutcomeReported = a3;
}

- (BOOL)hasSuggestionOutcomeReported
{
  return self->_hasSuggestionOutcomeReported;
}

- (void)setHasSuggestionGenerated:(BOOL)a3
{
  self->_hasSuggestionGenerated = a3;
}

- (BOOL)hasSuggestionGenerated
{
  return self->_hasSuggestionGenerated;
}

- (void)setHasPlusSuggesterSuggestionRedundancyReported:(BOOL)a3
{
  self->_hasPlusSuggesterSuggestionRedundancyReported = a3;
}

- (BOOL)hasPlusSuggesterSuggestionRedundancyReported
{
  return self->_hasPlusSuggesterSuggestionRedundancyReported;
}

- (void)setHasPlusSuggesterSuggestionMetadataReported:(BOOL)a3
{
  self->_hasPlusSuggesterSuggestionMetadataReported = a3;
}

- (BOOL)hasPlusSuggesterSuggestionMetadataReported
{
  return self->_hasPlusSuggesterSuggestionMetadataReported;
}

- (void)setHasPlusSuggesterMetadataReported:(BOOL)a3
{
  self->_hasPlusSuggesterMetadataReported = a3;
}

- (BOOL)hasPlusSuggesterMetadataReported
{
  return self->_hasPlusSuggesterMetadataReported;
}

- (void)setHasPlusSuggesterQueried:(BOOL)a3
{
  self->_hasPlusSuggesterQueried = a3;
}

- (BOOL)hasPlusSuggesterQueried
{
  return self->_hasPlusSuggesterQueried;
}

- (void)setHasMediaEvaluationSummaryReported:(BOOL)a3
{
  self->_hasMediaEvaluationSummaryReported = a3;
}

- (BOOL)hasMediaEvaluationSummaryReported
{
  return self->_hasMediaEvaluationSummaryReported;
}

- (void)setHasMediaGroundTruthGenerated:(BOOL)a3
{
  self->_hasMediaGroundTruthGenerated = a3;
}

- (BOOL)hasMediaGroundTruthGenerated
{
  return self->_hasMediaGroundTruthGenerated;
}

- (void)setHasContactSuggestionAccuracySignalReported:(BOOL)a3
{
  self->_hasContactSuggestionAccuracySignalReported = a3;
}

- (BOOL)hasContactSuggestionAccuracySignalReported
{
  return self->_hasContactSuggestionAccuracySignalReported;
}

- (void)setHasContactSuggestionRemoved:(BOOL)a3
{
  self->_hasContactSuggestionRemoved = a3;
}

- (BOOL)hasContactSuggestionRemoved
{
  return self->_hasContactSuggestionRemoved;
}

- (void)setHasContactSuggestionHeartbeatReported:(BOOL)a3
{
  self->_hasContactSuggestionHeartbeatReported = a3;
}

- (BOOL)hasContactSuggestionHeartbeatReported
{
  return self->_hasContactSuggestionHeartbeatReported;
}

- (void)setHasSendMessageMetadataExtracted:(BOOL)a3
{
  self->_hasSendMessageMetadataExtracted = a3;
}

- (BOOL)hasSendMessageMetadataExtracted
{
  return self->_hasSendMessageMetadataExtracted;
}

- (void)setHasPatternSequenceGenerated:(BOOL)a3
{
  self->_hasPatternSequenceGenerated = a3;
}

- (BOOL)hasPatternSequenceGenerated
{
  return self->_hasPatternSequenceGenerated;
}

- (void)setHasTmdcGroundTruthGenerated:(BOOL)a3
{
  self->_hasTmdcGroundTruthGenerated = a3;
}

- (BOOL)hasTmdcGroundTruthGenerated
{
  return self->_hasTmdcGroundTruthGenerated;
}

- (void)setHasPhoneCallMetadataExtracted:(BOOL)a3
{
  self->_hasPhoneCallMetadataExtracted = a3;
}

- (BOOL)hasPhoneCallMetadataExtracted
{
  return self->_hasPhoneCallMetadataExtracted;
}

- (void)setHasContactSuggestionGenerated:(BOOL)a3
{
  self->_hasContactSuggestionGenerated = a3;
}

- (BOOL)hasContactSuggestionGenerated
{
  return self->_hasContactSuggestionGenerated;
}

- (void)setHasContactGroundTruthGenerated:(BOOL)a3
{
  self->_hasContactGroundTruthGenerated = a3;
}

- (BOOL)hasContactGroundTruthGenerated
{
  return self->_hasContactGroundTruthGenerated;
}

- (void)setHasInferencePluginInvocationContext:(BOOL)a3
{
  self->_hasInferencePluginInvocationContext = a3;
}

- (BOOL)hasInferencePluginInvocationContext
{
  return self->_hasInferencePluginInvocationContext;
}

- (void)setHasUsoGraphTier1:(BOOL)a3
{
  self->_hasUsoGraphTier1 = a3;
}

- (BOOL)hasUsoGraphTier1
{
  return self->_hasUsoGraphTier1;
}

- (void)setHasContactSuggesterSuggestionMetadataReported:(BOOL)a3
{
  self->_hasContactSuggesterSuggestionMetadataReported = a3;
}

- (BOOL)hasContactSuggesterSuggestionMetadataReported
{
  return self->_hasContactSuggesterSuggestionMetadataReported;
}

- (void)setHasContactSuggesterRequestMetadataReported:(BOOL)a3
{
  self->_hasContactSuggesterRequestMetadataReported = a3;
}

- (BOOL)hasContactSuggesterRequestMetadataReported
{
  return self->_hasContactSuggesterRequestMetadataReported;
}

- (void)setHasContactSuggestionOutcomeReported:(BOOL)a3
{
  self->_hasContactSuggestionOutcomeReported = a3;
}

- (BOOL)hasContactSuggestionOutcomeReported
{
  return self->_hasContactSuggestionOutcomeReported;
}

- (void)setHasContactSuggesterQueryContext:(BOOL)a3
{
  self->_hasContactSuggesterQueryContext = a3;
}

- (BOOL)hasContactSuggesterQueryContext
{
  return self->_hasContactSuggesterQueryContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (PLUSSchemaPLUSClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PLUSSchemaPLUSClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)PLUSSchemaPLUSClientEvent;
  v5 = [(PLUSSchemaPLUSClientEvent *)&v74 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSClientEventMetadata alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"contactSuggesterQueryContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PLUSSchemaPLUSContactSuggesterQueryContext alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSClientEvent *)v5 setContactSuggesterQueryContext:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"contactSuggestionOutcomeReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PLUSSchemaPLUSContactSuggestionOutcomeReported alloc] initWithDictionary:v10];
      [(PLUSSchemaPLUSClientEvent *)v5 setContactSuggestionOutcomeReported:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"contactSuggesterRequestMetadataReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[PLUSSchemaPLUSContactSuggesterRequestMetadataReported alloc] initWithDictionary:v12];
      [(PLUSSchemaPLUSClientEvent *)v5 setContactSuggesterRequestMetadataReported:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"contactSuggesterSuggestionMetadataReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported alloc] initWithDictionary:v14];
      [(PLUSSchemaPLUSClientEvent *)v5 setContactSuggesterSuggestionMetadataReported:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"usoGraphTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[PLUSSchemaPLUSUSOGraphTier1 alloc] initWithDictionary:v16];
      [(PLUSSchemaPLUSClientEvent *)v5 setUsoGraphTier1:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"inferencePluginInvocationContext"];
    objc_opt_class();
    v73 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PLUSSchemaPLUSInferencePluginInvocationContext alloc] initWithDictionary:v18];
      [(PLUSSchemaPLUSClientEvent *)v5 setInferencePluginInvocationContext:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"contactGroundTruthGenerated"];
    objc_opt_class();
    v72 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PLUSSchemaPLUSContactGroundTruthGenerated alloc] initWithDictionary:v20];
      [(PLUSSchemaPLUSClientEvent *)v5 setContactGroundTruthGenerated:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"contactSuggestionGenerated"];
    objc_opt_class();
    int v71 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[PLUSSchemaPLUSContactSuggestionGenerated alloc] initWithDictionary:v22];
      [(PLUSSchemaPLUSClientEvent *)v5 setContactSuggestionGenerated:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"phoneCallMetadataExtracted"];
    objc_opt_class();
    v70 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[PLUSSchemaPLUSPhoneCallMetadataExtracted alloc] initWithDictionary:v24];
      [(PLUSSchemaPLUSClientEvent *)v5 setPhoneCallMetadataExtracted:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"tmdcGroundTruthGenerated"];
    objc_opt_class();
    v69 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[PLUSSchemaPLUSTMDCGroundTruthGenerated alloc] initWithDictionary:v26];
      [(PLUSSchemaPLUSClientEvent *)v5 setTmdcGroundTruthGenerated:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"patternSequenceGenerated"];
    objc_opt_class();
    int v68 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated alloc] initWithDictionary:v28];
      [(PLUSSchemaPLUSClientEvent *)v5 setPatternSequenceGenerated:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"sendMessageMetadataExtracted"];
    objc_opt_class();
    v67 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[PLUSSchemaPLUSSendMessageMetadataExtracted alloc] initWithDictionary:v30];
      [(PLUSSchemaPLUSClientEvent *)v5 setSendMessageMetadataExtracted:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"contactSuggestionHeartbeatReported"];
    objc_opt_class();
    v66 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[PLUSSchemaPLUSContactSuggestionHeartbeatReported alloc] initWithDictionary:v32];
      [(PLUSSchemaPLUSClientEvent *)v5 setContactSuggestionHeartbeatReported:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"contactSuggestionRemoved"];
    objc_opt_class();
    int v65 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[PLUSSchemaPLUSContactSuggestionRemoved alloc] initWithDictionary:v34];
      [(PLUSSchemaPLUSClientEvent *)v5 setContactSuggestionRemoved:v35];
    }
    v64 = (void *)v6;
    uint64_t v36 = [v4 objectForKeyedSubscript:@"contactSuggestionAccuracySignalReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[PLUSSchemaPLUSContactSuggestionAccuracySignalReported alloc] initWithDictionary:v36];
      [(PLUSSchemaPLUSClientEvent *)v5 setContactSuggestionAccuracySignalReported:v37];
    }
    v58 = (void *)v36;
    v63 = (void *)v8;
    uint64_t v38 = [v4 objectForKeyedSubscript:@"mediaGroundTruthGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[PLUSSchemaPLUSMediaGroundTruthGenerated alloc] initWithDictionary:v38];
      [(PLUSSchemaPLUSClientEvent *)v5 setMediaGroundTruthGenerated:v39];
    }
    int v62 = (void *)v10;
    uint64_t v40 = [v4 objectForKeyedSubscript:@"mediaEvaluationSummaryReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[PLUSSchemaPLUSMediaEvaluationSummaryReported alloc] initWithDictionary:v40];
      [(PLUSSchemaPLUSClientEvent *)v5 setMediaEvaluationSummaryReported:v41];
    }
    v61 = (void *)v12;
    v42 = [v4 objectForKeyedSubscript:@"plusSuggesterQueried"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [[PLUSSchemaPLUSSuggesterQueried alloc] initWithDictionary:v42];
      [(PLUSSchemaPLUSClientEvent *)v5 setPlusSuggesterQueried:v43];
    }
    v60 = (void *)v14;
    int v44 = [v4 objectForKeyedSubscript:@"plusSuggesterMetadataReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [[PLUSSchemaPLUSSuggesterMetadataReported alloc] initWithDictionary:v44];
      [(PLUSSchemaPLUSClientEvent *)v5 setPlusSuggesterMetadataReported:v45];
    }
    int v59 = (void *)v16;
    v46 = objc_msgSend(v4, "objectForKeyedSubscript:", @"plusSuggesterSuggestionMetadataReported", v40);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v47 = [[PLUSSchemaPLUSSuggesterSuggestionMetadataReported alloc] initWithDictionary:v46];
      [(PLUSSchemaPLUSClientEvent *)v5 setPlusSuggesterSuggestionMetadataReported:v47];
    }
    v48 = (void *)v38;
    v49 = [v4 objectForKeyedSubscript:@"plusSuggesterSuggestionRedundancyReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v50 = [[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported alloc] initWithDictionary:v49];
      [(PLUSSchemaPLUSClientEvent *)v5 setPlusSuggesterSuggestionRedundancyReported:v50];
    }
    v51 = [v4 objectForKeyedSubscript:@"suggestionGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = [[PLUSSchemaPLUSSuggestionGenerated alloc] initWithDictionary:v51];
      [(PLUSSchemaPLUSClientEvent *)v5 setSuggestionGenerated:v52];
    }
    int v53 = [v4 objectForKeyedSubscript:@"suggestionOutcomeReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v54 = [[PLUSSchemaPLUSSuggestionOutcomeReported alloc] initWithDictionary:v53];
      [(PLUSSchemaPLUSClientEvent *)v5 setSuggestionOutcomeReported:v54];
    }
    v55 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  unint64_t v2 = [(PLUSSchemaPLUSClientEvent *)self dictionaryRepresentation];
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
  if (self->_contactGroundTruthGenerated)
  {
    id v4 = [(PLUSSchemaPLUSClientEvent *)self contactGroundTruthGenerated];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contactGroundTruthGenerated"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"contactGroundTruthGenerated"];
    }
  }
  if (self->_contactSuggesterQueryContext)
  {
    uint64_t v7 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterQueryContext];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"contactSuggesterQueryContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"contactSuggesterQueryContext"];
    }
  }
  if (self->_contactSuggesterRequestMetadataReported)
  {
    uint64_t v10 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterRequestMetadataReported];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"contactSuggesterRequestMetadataReported"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"contactSuggesterRequestMetadataReported"];
    }
  }
  if (self->_contactSuggesterSuggestionMetadataReported)
  {
    v13 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterSuggestionMetadataReported];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"contactSuggesterSuggestionMetadataReported"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"contactSuggesterSuggestionMetadataReported"];
    }
  }
  if (self->_contactSuggestionAccuracySignalReported)
  {
    uint64_t v16 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionAccuracySignalReported];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"contactSuggestionAccuracySignalReported"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"contactSuggestionAccuracySignalReported"];
    }
  }
  if (self->_contactSuggestionGenerated)
  {
    v19 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionGenerated];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"contactSuggestionGenerated"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"contactSuggestionGenerated"];
    }
  }
  if (self->_contactSuggestionHeartbeatReported)
  {
    uint64_t v22 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionHeartbeatReported];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"contactSuggestionHeartbeatReported"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"contactSuggestionHeartbeatReported"];
    }
  }
  if (self->_contactSuggestionOutcomeReported)
  {
    v25 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionOutcomeReported];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"contactSuggestionOutcomeReported"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"contactSuggestionOutcomeReported"];
    }
  }
  if (self->_contactSuggestionRemoved)
  {
    uint64_t v28 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionRemoved];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"contactSuggestionRemoved"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"contactSuggestionRemoved"];
    }
  }
  if (self->_eventMetadata)
  {
    v31 = [(PLUSSchemaPLUSClientEvent *)self eventMetadata];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_inferencePluginInvocationContext)
  {
    uint64_t v34 = [(PLUSSchemaPLUSClientEvent *)self inferencePluginInvocationContext];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"inferencePluginInvocationContext"];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"inferencePluginInvocationContext"];
    }
  }
  if (self->_mediaEvaluationSummaryReported)
  {
    v37 = [(PLUSSchemaPLUSClientEvent *)self mediaEvaluationSummaryReported];
    uint64_t v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"mediaEvaluationSummaryReported"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"mediaEvaluationSummaryReported"];
    }
  }
  if (self->_mediaGroundTruthGenerated)
  {
    uint64_t v40 = [(PLUSSchemaPLUSClientEvent *)self mediaGroundTruthGenerated];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"mediaGroundTruthGenerated"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"mediaGroundTruthGenerated"];
    }
  }
  if (self->_patternSequenceGenerated)
  {
    v43 = [(PLUSSchemaPLUSClientEvent *)self patternSequenceGenerated];
    int v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"patternSequenceGenerated"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"patternSequenceGenerated"];
    }
  }
  if (self->_phoneCallMetadataExtracted)
  {
    v46 = [(PLUSSchemaPLUSClientEvent *)self phoneCallMetadataExtracted];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"phoneCallMetadataExtracted"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"phoneCallMetadataExtracted"];
    }
  }
  if (self->_plusSuggesterMetadataReported)
  {
    v49 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterMetadataReported];
    int v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"plusSuggesterMetadataReported"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"plusSuggesterMetadataReported"];
    }
  }
  if (self->_plusSuggesterQueried)
  {
    v52 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterQueried];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"plusSuggesterQueried"];
    }
    else
    {
      v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"plusSuggesterQueried"];
    }
  }
  if (self->_plusSuggesterSuggestionMetadataReported)
  {
    v55 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionMetadataReported];
    int v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"plusSuggesterSuggestionMetadataReported"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"plusSuggesterSuggestionMetadataReported"];
    }
  }
  if (self->_plusSuggesterSuggestionRedundancyReported)
  {
    v58 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionRedundancyReported];
    int v59 = [v58 dictionaryRepresentation];
    if (v59)
    {
      [v3 setObject:v59 forKeyedSubscript:@"plusSuggesterSuggestionRedundancyReported"];
    }
    else
    {
      v60 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v60 forKeyedSubscript:@"plusSuggesterSuggestionRedundancyReported"];
    }
  }
  if (self->_sendMessageMetadataExtracted)
  {
    v61 = [(PLUSSchemaPLUSClientEvent *)self sendMessageMetadataExtracted];
    int v62 = [v61 dictionaryRepresentation];
    if (v62)
    {
      [v3 setObject:v62 forKeyedSubscript:@"sendMessageMetadataExtracted"];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v63 forKeyedSubscript:@"sendMessageMetadataExtracted"];
    }
  }
  if (self->_suggestionGenerated)
  {
    v64 = [(PLUSSchemaPLUSClientEvent *)self suggestionGenerated];
    int v65 = [v64 dictionaryRepresentation];
    if (v65)
    {
      [v3 setObject:v65 forKeyedSubscript:@"suggestionGenerated"];
    }
    else
    {
      v66 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v66 forKeyedSubscript:@"suggestionGenerated"];
    }
  }
  if (self->_suggestionOutcomeReported)
  {
    v67 = [(PLUSSchemaPLUSClientEvent *)self suggestionOutcomeReported];
    int v68 = [v67 dictionaryRepresentation];
    if (v68)
    {
      [v3 setObject:v68 forKeyedSubscript:@"suggestionOutcomeReported"];
    }
    else
    {
      v69 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v69 forKeyedSubscript:@"suggestionOutcomeReported"];
    }
  }
  if (self->_tmdcGroundTruthGenerated)
  {
    v70 = [(PLUSSchemaPLUSClientEvent *)self tmdcGroundTruthGenerated];
    int v71 = [v70 dictionaryRepresentation];
    if (v71)
    {
      [v3 setObject:v71 forKeyedSubscript:@"tmdcGroundTruthGenerated"];
    }
    else
    {
      v72 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v72 forKeyedSubscript:@"tmdcGroundTruthGenerated"];
    }
  }
  if (self->_usoGraphTier1)
  {
    v73 = [(PLUSSchemaPLUSClientEvent *)self usoGraphTier1];
    objc_super v74 = [v73 dictionaryRepresentation];
    if (v74)
    {
      [v3 setObject:v74 forKeyedSubscript:@"usoGraphTier1"];
    }
    else
    {
      v75 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v75 forKeyedSubscript:@"usoGraphTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v76 = v3;

  return v76;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(PLUSSchemaPLUSContactSuggesterQueryContext *)self->_contactSuggesterQueryContext hash] ^ v3;
  unint64_t v5 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self->_contactSuggestionOutcomeReported hash];
  unint64_t v6 = v4 ^ v5 ^ [(PLUSSchemaPLUSContactSuggesterRequestMetadataReported *)self->_contactSuggesterRequestMetadataReported hash];
  unint64_t v7 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self->_contactSuggesterSuggestionMetadataReported hash];
  unint64_t v8 = v7 ^ [(PLUSSchemaPLUSUSOGraphTier1 *)self->_usoGraphTier1 hash];
  unint64_t v9 = v6 ^ v8 ^ [(PLUSSchemaPLUSInferencePluginInvocationContext *)self->_inferencePluginInvocationContext hash];
  unint64_t v10 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self->_contactGroundTruthGenerated hash];
  unint64_t v11 = v10 ^ [(PLUSSchemaPLUSContactSuggestionGenerated *)self->_contactSuggestionGenerated hash];
  unint64_t v12 = v11 ^ [(PLUSSchemaPLUSPhoneCallMetadataExtracted *)self->_phoneCallMetadataExtracted hash];
  unint64_t v13 = v9 ^ v12 ^ [(PLUSSchemaPLUSTMDCGroundTruthGenerated *)self->_tmdcGroundTruthGenerated hash];
  unint64_t v14 = [(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)self->_patternSequenceGenerated hash];
  unint64_t v15 = v14 ^ [(PLUSSchemaPLUSSendMessageMetadataExtracted *)self->_sendMessageMetadataExtracted hash];
  unint64_t v16 = v15 ^ [(PLUSSchemaPLUSContactSuggestionHeartbeatReported *)self->_contactSuggestionHeartbeatReported hash];
  unint64_t v17 = v16 ^ [(PLUSSchemaPLUSContactSuggestionRemoved *)self->_contactSuggestionRemoved hash];
  unint64_t v18 = v13 ^ v17 ^ [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self->_contactSuggestionAccuracySignalReported hash];
  unint64_t v19 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self->_mediaGroundTruthGenerated hash];
  unint64_t v20 = v19 ^ [(PLUSSchemaPLUSMediaEvaluationSummaryReported *)self->_mediaEvaluationSummaryReported hash];
  unint64_t v21 = v20 ^ [(PLUSSchemaPLUSSuggesterQueried *)self->_plusSuggesterQueried hash];
  unint64_t v22 = v21 ^ [(PLUSSchemaPLUSSuggesterMetadataReported *)self->_plusSuggesterMetadataReported hash];
  unint64_t v23 = v22 ^ [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self->_plusSuggesterSuggestionMetadataReported hash];
  unint64_t v24 = v18 ^ v23 ^ [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self->_plusSuggesterSuggestionRedundancyReported hash];
  unint64_t v25 = [(PLUSSchemaPLUSSuggestionGenerated *)self->_suggestionGenerated hash];
  return v24 ^ v25 ^ [(PLUSSchemaPLUSSuggestionOutcomeReported *)self->_suggestionOutcomeReported hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_123;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_123;
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v8 = [(PLUSSchemaPLUSClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(PLUSSchemaPLUSClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterQueryContext];
  unint64_t v7 = [v4 contactSuggesterQueryContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v13 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterQueryContext];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterQueryContext];
    unint64_t v16 = [v4 contactSuggesterQueryContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionOutcomeReported];
  unint64_t v7 = [v4 contactSuggestionOutcomeReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v18 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionOutcomeReported];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    unint64_t v20 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionOutcomeReported];
    unint64_t v21 = [v4 contactSuggestionOutcomeReported];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterRequestMetadataReported];
  unint64_t v7 = [v4 contactSuggesterRequestMetadataReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v23 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterRequestMetadataReported];
  if (v23)
  {
    unint64_t v24 = (void *)v23;
    unint64_t v25 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterRequestMetadataReported];
    uint64_t v26 = [v4 contactSuggesterRequestMetadataReported];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterSuggestionMetadataReported];
  unint64_t v7 = [v4 contactSuggesterSuggestionMetadataReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v28 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterSuggestionMetadataReported];
  if (v28)
  {
    int v29 = (void *)v28;
    uint64_t v30 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterSuggestionMetadataReported];
    v31 = [v4 contactSuggesterSuggestionMetadataReported];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self usoGraphTier1];
  unint64_t v7 = [v4 usoGraphTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v33 = [(PLUSSchemaPLUSClientEvent *)self usoGraphTier1];
  if (v33)
  {
    uint64_t v34 = (void *)v33;
    int v35 = [(PLUSSchemaPLUSClientEvent *)self usoGraphTier1];
    uint64_t v36 = [v4 usoGraphTier1];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self inferencePluginInvocationContext];
  unint64_t v7 = [v4 inferencePluginInvocationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v38 = [(PLUSSchemaPLUSClientEvent *)self inferencePluginInvocationContext];
  if (v38)
  {
    v39 = (void *)v38;
    uint64_t v40 = [(PLUSSchemaPLUSClientEvent *)self inferencePluginInvocationContext];
    int v41 = [v4 inferencePluginInvocationContext];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactGroundTruthGenerated];
  unint64_t v7 = [v4 contactGroundTruthGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v43 = [(PLUSSchemaPLUSClientEvent *)self contactGroundTruthGenerated];
  if (v43)
  {
    int v44 = (void *)v43;
    v45 = [(PLUSSchemaPLUSClientEvent *)self contactGroundTruthGenerated];
    v46 = [v4 contactGroundTruthGenerated];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionGenerated];
  unint64_t v7 = [v4 contactSuggestionGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v48 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionGenerated];
  if (v48)
  {
    v49 = (void *)v48;
    int v50 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionGenerated];
    v51 = [v4 contactSuggestionGenerated];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self phoneCallMetadataExtracted];
  unint64_t v7 = [v4 phoneCallMetadataExtracted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v53 = [(PLUSSchemaPLUSClientEvent *)self phoneCallMetadataExtracted];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(PLUSSchemaPLUSClientEvent *)self phoneCallMetadataExtracted];
    int v56 = [v4 phoneCallMetadataExtracted];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self tmdcGroundTruthGenerated];
  unint64_t v7 = [v4 tmdcGroundTruthGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v58 = [(PLUSSchemaPLUSClientEvent *)self tmdcGroundTruthGenerated];
  if (v58)
  {
    int v59 = (void *)v58;
    v60 = [(PLUSSchemaPLUSClientEvent *)self tmdcGroundTruthGenerated];
    v61 = [v4 tmdcGroundTruthGenerated];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self patternSequenceGenerated];
  unint64_t v7 = [v4 patternSequenceGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v63 = [(PLUSSchemaPLUSClientEvent *)self patternSequenceGenerated];
  if (v63)
  {
    v64 = (void *)v63;
    int v65 = [(PLUSSchemaPLUSClientEvent *)self patternSequenceGenerated];
    v66 = [v4 patternSequenceGenerated];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self sendMessageMetadataExtracted];
  unint64_t v7 = [v4 sendMessageMetadataExtracted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v68 = [(PLUSSchemaPLUSClientEvent *)self sendMessageMetadataExtracted];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(PLUSSchemaPLUSClientEvent *)self sendMessageMetadataExtracted];
    int v71 = [v4 sendMessageMetadataExtracted];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionHeartbeatReported];
  unint64_t v7 = [v4 contactSuggestionHeartbeatReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v73 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionHeartbeatReported];
  if (v73)
  {
    objc_super v74 = (void *)v73;
    v75 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionHeartbeatReported];
    id v76 = [v4 contactSuggestionHeartbeatReported];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionRemoved];
  unint64_t v7 = [v4 contactSuggestionRemoved];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v78 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionRemoved];
  if (v78)
  {
    objc_super v79 = (void *)v78;
    v80 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionRemoved];
    v81 = [v4 contactSuggestionRemoved];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionAccuracySignalReported];
  unint64_t v7 = [v4 contactSuggestionAccuracySignalReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v83 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionAccuracySignalReported];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionAccuracySignalReported];
    v86 = [v4 contactSuggestionAccuracySignalReported];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self mediaGroundTruthGenerated];
  unint64_t v7 = [v4 mediaGroundTruthGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v88 = [(PLUSSchemaPLUSClientEvent *)self mediaGroundTruthGenerated];
  if (v88)
  {
    v89 = (void *)v88;
    v90 = [(PLUSSchemaPLUSClientEvent *)self mediaGroundTruthGenerated];
    v91 = [v4 mediaGroundTruthGenerated];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self mediaEvaluationSummaryReported];
  unint64_t v7 = [v4 mediaEvaluationSummaryReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v93 = [(PLUSSchemaPLUSClientEvent *)self mediaEvaluationSummaryReported];
  if (v93)
  {
    v94 = (void *)v93;
    v95 = [(PLUSSchemaPLUSClientEvent *)self mediaEvaluationSummaryReported];
    v96 = [v4 mediaEvaluationSummaryReported];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterQueried];
  unint64_t v7 = [v4 plusSuggesterQueried];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v98 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterQueried];
  if (v98)
  {
    v99 = (void *)v98;
    v100 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterQueried];
    v101 = [v4 plusSuggesterQueried];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterMetadataReported];
  unint64_t v7 = [v4 plusSuggesterMetadataReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v103 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterMetadataReported];
  if (v103)
  {
    v104 = (void *)v103;
    v105 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterMetadataReported];
    v106 = [v4 plusSuggesterMetadataReported];
    int v107 = [v105 isEqual:v106];

    if (!v107) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionMetadataReported];
  unint64_t v7 = [v4 plusSuggesterSuggestionMetadataReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v108 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionMetadataReported];
  if (v108)
  {
    v109 = (void *)v108;
    v110 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionMetadataReported];
    v111 = [v4 plusSuggesterSuggestionMetadataReported];
    int v112 = [v110 isEqual:v111];

    if (!v112) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionRedundancyReported];
  unint64_t v7 = [v4 plusSuggesterSuggestionRedundancyReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v113 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionRedundancyReported];
  if (v113)
  {
    v114 = (void *)v113;
    v115 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionRedundancyReported];
    v116 = [v4 plusSuggesterSuggestionRedundancyReported];
    int v117 = [v115 isEqual:v116];

    if (!v117) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self suggestionGenerated];
  unint64_t v7 = [v4 suggestionGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_122;
  }
  uint64_t v118 = [(PLUSSchemaPLUSClientEvent *)self suggestionGenerated];
  if (v118)
  {
    v119 = (void *)v118;
    v120 = [(PLUSSchemaPLUSClientEvent *)self suggestionGenerated];
    v121 = [v4 suggestionGenerated];
    int v122 = [v120 isEqual:v121];

    if (!v122) {
      goto LABEL_123;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self suggestionOutcomeReported];
  unint64_t v7 = [v4 suggestionOutcomeReported];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v123 = [(PLUSSchemaPLUSClientEvent *)self suggestionOutcomeReported];
    if (!v123)
    {

LABEL_126:
      BOOL v128 = 1;
      goto LABEL_124;
    }
    v124 = (void *)v123;
    v125 = [(PLUSSchemaPLUSClientEvent *)self suggestionOutcomeReported];
    v126 = [v4 suggestionOutcomeReported];
    char v127 = [v125 isEqual:v126];

    if (v127) {
      goto LABEL_126;
    }
  }
  else
  {
LABEL_122:
  }
LABEL_123:
  BOOL v128 = 0;
LABEL_124:

  return v128;
}

- (void)writeTo:(id)a3
{
  id v52 = a3;
  id v4 = [(PLUSSchemaPLUSClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(PLUSSchemaPLUSClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterQueryContext];

  if (v6)
  {
    unint64_t v7 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterQueryContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionOutcomeReported];

  if (v8)
  {
    unint64_t v9 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionOutcomeReported];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterRequestMetadataReported];

  if (v10)
  {
    unint64_t v11 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterRequestMetadataReported];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterSuggestionMetadataReported];

  if (v12)
  {
    uint64_t v13 = [(PLUSSchemaPLUSClientEvent *)self contactSuggesterSuggestionMetadataReported];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(PLUSSchemaPLUSClientEvent *)self usoGraphTier1];

  if (v14)
  {
    unint64_t v15 = [(PLUSSchemaPLUSClientEvent *)self usoGraphTier1];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(PLUSSchemaPLUSClientEvent *)self inferencePluginInvocationContext];

  if (v16)
  {
    int v17 = [(PLUSSchemaPLUSClientEvent *)self inferencePluginInvocationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(PLUSSchemaPLUSClientEvent *)self contactGroundTruthGenerated];

  if (v18)
  {
    unint64_t v19 = [(PLUSSchemaPLUSClientEvent *)self contactGroundTruthGenerated];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v20 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionGenerated];

  if (v20)
  {
    unint64_t v21 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionGenerated];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(PLUSSchemaPLUSClientEvent *)self phoneCallMetadataExtracted];

  if (v22)
  {
    uint64_t v23 = [(PLUSSchemaPLUSClientEvent *)self phoneCallMetadataExtracted];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v24 = [(PLUSSchemaPLUSClientEvent *)self tmdcGroundTruthGenerated];

  if (v24)
  {
    unint64_t v25 = [(PLUSSchemaPLUSClientEvent *)self tmdcGroundTruthGenerated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v26 = [(PLUSSchemaPLUSClientEvent *)self patternSequenceGenerated];

  if (v26)
  {
    int v27 = [(PLUSSchemaPLUSClientEvent *)self patternSequenceGenerated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(PLUSSchemaPLUSClientEvent *)self sendMessageMetadataExtracted];

  if (v28)
  {
    int v29 = [(PLUSSchemaPLUSClientEvent *)self sendMessageMetadataExtracted];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v30 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionHeartbeatReported];

  if (v30)
  {
    v31 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionHeartbeatReported];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionRemoved];

  if (v32)
  {
    uint64_t v33 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionRemoved];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v34 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionAccuracySignalReported];

  if (v34)
  {
    int v35 = [(PLUSSchemaPLUSClientEvent *)self contactSuggestionAccuracySignalReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v36 = [(PLUSSchemaPLUSClientEvent *)self mediaGroundTruthGenerated];

  if (v36)
  {
    int v37 = [(PLUSSchemaPLUSClientEvent *)self mediaGroundTruthGenerated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(PLUSSchemaPLUSClientEvent *)self mediaEvaluationSummaryReported];

  if (v38)
  {
    v39 = [(PLUSSchemaPLUSClientEvent *)self mediaEvaluationSummaryReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v40 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterQueried];

  if (v40)
  {
    int v41 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterQueried];
    PBDataWriterWriteSubmessage();
  }
  int v42 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterMetadataReported];

  if (v42)
  {
    uint64_t v43 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterMetadataReported];
    PBDataWriterWriteSubmessage();
  }
  int v44 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionMetadataReported];

  if (v44)
  {
    v45 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionMetadataReported];
    PBDataWriterWriteSubmessage();
  }
  v46 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionRedundancyReported];

  if (v46)
  {
    int v47 = [(PLUSSchemaPLUSClientEvent *)self plusSuggesterSuggestionRedundancyReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v48 = [(PLUSSchemaPLUSClientEvent *)self suggestionGenerated];

  if (v48)
  {
    v49 = [(PLUSSchemaPLUSClientEvent *)self suggestionGenerated];
    PBDataWriterWriteSubmessage();
  }
  int v50 = [(PLUSSchemaPLUSClientEvent *)self suggestionOutcomeReported];

  if (v50)
  {
    v51 = [(PLUSSchemaPLUSClientEvent *)self suggestionOutcomeReported];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSuggestionOutcomeReported
{
  if (self->_whichEvent_Type == 123)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_suggestionOutcomeReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSSuggestionOutcomeReported)suggestionOutcomeReported
{
  if (self->_whichEvent_Type == 123) {
    unint64_t v2 = self->_suggestionOutcomeReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSuggestionOutcomeReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSSuggestionOutcomeReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  unint64_t v27 = 123;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = v4;
}

- (void)deleteSuggestionGenerated
{
  if (self->_whichEvent_Type == 122)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_suggestionGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSSuggestionGenerated)suggestionGenerated
{
  if (self->_whichEvent_Type == 122) {
    unint64_t v2 = self->_suggestionGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSuggestionGenerated:(id)a3
{
  id v4 = (PLUSSchemaPLUSSuggestionGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 122;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = v4;
}

- (void)deletePlusSuggesterSuggestionRedundancyReported
{
  if (self->_whichEvent_Type == 121)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_plusSuggesterSuggestionRedundancyReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported)plusSuggesterSuggestionRedundancyReported
{
  if (self->_whichEvent_Type == 121) {
    unint64_t v2 = self->_plusSuggesterSuggestionRedundancyReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPlusSuggesterSuggestionRedundancyReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 121;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = v4;
}

- (void)deletePlusSuggesterSuggestionMetadataReported
{
  if (self->_whichEvent_Type == 120)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_plusSuggesterSuggestionMetadataReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSSuggesterSuggestionMetadataReported)plusSuggesterSuggestionMetadataReported
{
  if (self->_whichEvent_Type == 120) {
    unint64_t v2 = self->_plusSuggesterSuggestionMetadataReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPlusSuggesterSuggestionMetadataReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 120;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = v4;
}

- (void)deletePlusSuggesterMetadataReported
{
  if (self->_whichEvent_Type == 119)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_plusSuggesterMetadataReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSSuggesterMetadataReported)plusSuggesterMetadataReported
{
  if (self->_whichEvent_Type == 119) {
    unint64_t v2 = self->_plusSuggesterMetadataReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPlusSuggesterMetadataReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSSuggesterMetadataReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 119;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = v4;
}

- (void)deletePlusSuggesterQueried
{
  if (self->_whichEvent_Type == 118)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_plusSuggesterQueried = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSSuggesterQueried)plusSuggesterQueried
{
  if (self->_whichEvent_Type == 118) {
    unint64_t v2 = self->_plusSuggesterQueried;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPlusSuggesterQueried:(id)a3
{
  id v4 = (PLUSSchemaPLUSSuggesterQueried *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 118;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = v4;
}

- (void)deleteMediaEvaluationSummaryReported
{
  if (self->_whichEvent_Type == 117)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_mediaEvaluationSummaryReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSMediaEvaluationSummaryReported)mediaEvaluationSummaryReported
{
  if (self->_whichEvent_Type == 117) {
    unint64_t v2 = self->_mediaEvaluationSummaryReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setMediaEvaluationSummaryReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSMediaEvaluationSummaryReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 117;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = v4;
}

- (void)deleteMediaGroundTruthGenerated
{
  if (self->_whichEvent_Type == 116)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_mediaGroundTruthGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSMediaGroundTruthGenerated)mediaGroundTruthGenerated
{
  if (self->_whichEvent_Type == 116) {
    unint64_t v2 = self->_mediaGroundTruthGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setMediaGroundTruthGenerated:(id)a3
{
  id v4 = (PLUSSchemaPLUSMediaGroundTruthGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 116;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = v4;
}

- (void)deleteContactSuggestionAccuracySignalReported
{
  if (self->_whichEvent_Type == 115)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactSuggestionAccuracySignalReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSContactSuggestionAccuracySignalReported)contactSuggestionAccuracySignalReported
{
  if (self->_whichEvent_Type == 115) {
    unint64_t v2 = self->_contactSuggestionAccuracySignalReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactSuggestionAccuracySignalReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 115;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = v4;
}

- (void)deleteContactSuggestionRemoved
{
  if (self->_whichEvent_Type == 114)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactSuggestionRemoved = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSContactSuggestionRemoved)contactSuggestionRemoved
{
  if (self->_whichEvent_Type == 114) {
    unint64_t v2 = self->_contactSuggestionRemoved;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactSuggestionRemoved:(id)a3
{
  id v4 = (PLUSSchemaPLUSContactSuggestionRemoved *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 114;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = v4;
}

- (void)deleteContactSuggestionHeartbeatReported
{
  if (self->_whichEvent_Type == 113)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactSuggestionHeartbeatReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSContactSuggestionHeartbeatReported)contactSuggestionHeartbeatReported
{
  if (self->_whichEvent_Type == 113) {
    unint64_t v2 = self->_contactSuggestionHeartbeatReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactSuggestionHeartbeatReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSContactSuggestionHeartbeatReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 113;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = v4;
}

- (void)deleteSendMessageMetadataExtracted
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sendMessageMetadataExtracted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSSendMessageMetadataExtracted)sendMessageMetadataExtracted
{
  if (self->_whichEvent_Type == 112) {
    unint64_t v2 = self->_sendMessageMetadataExtracted;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSendMessageMetadataExtracted:(id)a3
{
  id v4 = (PLUSSchemaPLUSSendMessageMetadataExtracted *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 112;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = v4;
}

- (void)deletePatternSequenceGenerated
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_patternSequenceGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated)patternSequenceGenerated
{
  if (self->_whichEvent_Type == 111) {
    unint64_t v2 = self->_patternSequenceGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPatternSequenceGenerated:(id)a3
{
  id v4 = (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 111;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = v4;
}

- (void)deleteTmdcGroundTruthGenerated
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_tmdcGroundTruthGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSTMDCGroundTruthGenerated)tmdcGroundTruthGenerated
{
  if (self->_whichEvent_Type == 110) {
    unint64_t v2 = self->_tmdcGroundTruthGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setTmdcGroundTruthGenerated:(id)a3
{
  id v4 = (PLUSSchemaPLUSTMDCGroundTruthGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 110;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = v4;
}

- (void)deletePhoneCallMetadataExtracted
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_phoneCallMetadataExtracted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSPhoneCallMetadataExtracted)phoneCallMetadataExtracted
{
  if (self->_whichEvent_Type == 109) {
    unint64_t v2 = self->_phoneCallMetadataExtracted;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPhoneCallMetadataExtracted:(id)a3
{
  id v4 = (PLUSSchemaPLUSPhoneCallMetadataExtracted *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 109;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = v4;
}

- (void)deleteContactSuggestionGenerated
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactSuggestionGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSContactSuggestionGenerated)contactSuggestionGenerated
{
  if (self->_whichEvent_Type == 108) {
    unint64_t v2 = self->_contactSuggestionGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactSuggestionGenerated:(id)a3
{
  id v4 = (PLUSSchemaPLUSContactSuggestionGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 108;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = v4;
}

- (void)deleteContactGroundTruthGenerated
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactGroundTruthGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSContactGroundTruthGenerated)contactGroundTruthGenerated
{
  if (self->_whichEvent_Type == 107) {
    unint64_t v2 = self->_contactGroundTruthGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactGroundTruthGenerated:(id)a3
{
  id v4 = (PLUSSchemaPLUSContactGroundTruthGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 107;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = v4;
}

- (void)deleteInferencePluginInvocationContext
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_inferencePluginInvocationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSInferencePluginInvocationContext)inferencePluginInvocationContext
{
  if (self->_whichEvent_Type == 106) {
    unint64_t v2 = self->_inferencePluginInvocationContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setInferencePluginInvocationContext:(id)a3
{
  id v4 = (PLUSSchemaPLUSInferencePluginInvocationContext *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 106;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = v4;
}

- (void)deleteUsoGraphTier1
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_usoGraphTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSUSOGraphTier1)usoGraphTier1
{
  if (self->_whichEvent_Type == 105) {
    unint64_t v2 = self->_usoGraphTier1;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setUsoGraphTier1:(id)a3
{
  id v4 = (PLUSSchemaPLUSUSOGraphTier1 *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 105;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = v4;
}

- (void)deleteContactSuggesterSuggestionMetadataReported
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactSuggesterSuggestionMetadataReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported)contactSuggesterSuggestionMetadataReported
{
  if (self->_whichEvent_Type == 104) {
    unint64_t v2 = self->_contactSuggesterSuggestionMetadataReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactSuggesterSuggestionMetadataReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 104;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = v4;
}

- (void)deleteContactSuggesterRequestMetadataReported
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactSuggesterRequestMetadataReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSContactSuggesterRequestMetadataReported)contactSuggesterRequestMetadataReported
{
  if (self->_whichEvent_Type == 103) {
    unint64_t v2 = self->_contactSuggesterRequestMetadataReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactSuggesterRequestMetadataReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSContactSuggesterRequestMetadataReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 103;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = v4;
}

- (void)deleteContactSuggestionOutcomeReported
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactSuggestionOutcomeReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSContactSuggestionOutcomeReported)contactSuggestionOutcomeReported
{
  if (self->_whichEvent_Type == 102) {
    unint64_t v2 = self->_contactSuggestionOutcomeReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactSuggestionOutcomeReported:(id)a3
{
  id v4 = (PLUSSchemaPLUSContactSuggestionOutcomeReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 102;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = v4;
}

- (void)deleteContactSuggesterQueryContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contactSuggesterQueryContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSContactSuggesterQueryContext)contactSuggesterQueryContext
{
  if (self->_whichEvent_Type == 101) {
    unint64_t v2 = self->_contactSuggesterQueryContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setContactSuggesterQueryContext:(id)a3
{
  id v4 = (PLUSSchemaPLUSContactSuggesterQueryContext *)a3;
  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  unint64_t v27 = 101;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichEvent_Type = v27;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = v4;
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
  unint64_t v2 = [(PLUSSchemaPLUSClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 0x16) {
    return @"com.apple.aiml.siri.plus.PLUSClientEvent";
  }
  else {
    return off_1E5EB3E28[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 38;
}

@end