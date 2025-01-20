@interface ORCHSchemaORCHClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAceCommandContext;
- (BOOL)hasAsrBridgeContext;
- (BOOL)hasAssetSetsReported;
- (BOOL)hasAssistantdLaunchMetadataReported;
- (BOOL)hasAvailableAssets;
- (BOOL)hasCandidateRequestContext;
- (BOOL)hasCdmBridgeContext;
- (BOOL)hasContextSubmissionMessage;
- (BOOL)hasEventMetadata;
- (BOOL)hasExecuteOnRemoteRequestContext;
- (BOOL)hasExecutionBridgeContext;
- (BOOL)hasFlowOutputSubmitted;
- (BOOL)hasIdentityBridgeRequestContext;
- (BOOL)hasIntelligenceFlowQuerySent;
- (BOOL)hasMultiUserResultCandidate;
- (BOOL)hasMultiUserResultSelected;
- (BOOL)hasMuxBridgeContext;
- (BOOL)hasNlRouterBridgeContext;
- (BOOL)hasNlRouterBridgeSubComponentContext;
- (BOOL)hasNlv3ServerFallbackDeprecated;
- (BOOL)hasOrchDeviceDynamicContext;
- (BOOL)hasPommesBridgeContext;
- (BOOL)hasPowerContextPolicyReported;
- (BOOL)hasRequestContext;
- (BOOL)hasRequestMitigated;
- (BOOL)hasResourceUtilizationMetadata;
- (BOOL)hasResultCandidate;
- (BOOL)hasResultSelected;
- (BOOL)hasRouterRewrittenUtterance;
- (BOOL)hasServerFallbackContext;
- (BOOL)hasShimToolContext;
- (BOOL)hasSubRequestContext;
- (BOOL)hasSubRequestFallback;
- (BOOL)hasTrpCandidateCreated;
- (BOOL)hasTrpCandidateReceived;
- (BOOL)hasTrpFinalized;
- (BOOL)hasUiActivationContext;
- (BOOL)hasUnsupportedLanguageDetected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaNLRouterRewrittenUtteranceTier1)routerRewrittenUtterance;
- (ORCHSchemaORCHASRBridgeContext)asrBridgeContext;
- (ORCHSchemaORCHAceCommandContext)aceCommandContext;
- (ORCHSchemaORCHAssetSetsReported)assetSetsReported;
- (ORCHSchemaORCHAssetsReported)availableAssets;
- (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported)assistantdLaunchMetadataReported;
- (ORCHSchemaORCHCDMBridgeContext)cdmBridgeContext;
- (ORCHSchemaORCHCandidateRequestContext)candidateRequestContext;
- (ORCHSchemaORCHClientEvent)initWithDictionary:(id)a3;
- (ORCHSchemaORCHClientEvent)initWithJSON:(id)a3;
- (ORCHSchemaORCHClientEventMetadata)eventMetadata;
- (ORCHSchemaORCHConversationContextSubmitted)contextSubmissionMessage;
- (ORCHSchemaORCHDeviceDynamicContext)orchDeviceDynamicContext;
- (ORCHSchemaORCHExecuteOnRemoteRequestContext)executeOnRemoteRequestContext;
- (ORCHSchemaORCHExecutionBridgeContext)executionBridgeContext;
- (ORCHSchemaORCHFlowOutputSubmitted)flowOutputSubmitted;
- (ORCHSchemaORCHIdentityBridgeRequestContext)identityBridgeRequestContext;
- (ORCHSchemaORCHIntelligenceFlowQuerySent)intelligenceFlowQuerySent;
- (ORCHSchemaORCHIntelligenceFlowSubRequestFallback)subRequestFallback;
- (ORCHSchemaORCHMUXBridgeContext)muxBridgeContext;
- (ORCHSchemaORCHMultiUserResultCandidateReceived)multiUserResultCandidate;
- (ORCHSchemaORCHMultiUserResultCandidateSelected)multiUserResultSelected;
- (ORCHSchemaORCHNLRouterBridgeContext)nlRouterBridgeContext;
- (ORCHSchemaORCHNLRouterBridgeSubComponentContext)nlRouterBridgeSubComponentContext;
- (ORCHSchemaORCHNLV3ServerFallbackDeprecated)nlv3ServerFallbackDeprecated;
- (ORCHSchemaORCHPommesBridgeContext)pommesBridgeContext;
- (ORCHSchemaORCHPowerContextPolicyReported)powerContextPolicyReported;
- (ORCHSchemaORCHRequestContext)requestContext;
- (ORCHSchemaORCHRequestMitigated)requestMitigated;
- (ORCHSchemaORCHResourceUtilizationMetadata)resourceUtilizationMetadata;
- (ORCHSchemaORCHResultCandidateReceived)resultCandidate;
- (ORCHSchemaORCHResultSelected)resultSelected;
- (ORCHSchemaORCHServerFallbackContext)serverFallbackContext;
- (ORCHSchemaORCHShimToolContext)shimToolContext;
- (ORCHSchemaORCHSubRequestContext)subRequestContext;
- (ORCHSchemaORCHTRPCandidateCreated)trpCandidateCreated;
- (ORCHSchemaORCHTRPCandidateReceived)trpCandidateReceived;
- (ORCHSchemaORCHTRPFinalized)trpFinalized;
- (ORCHSchemaORCHUIActivationContext)uiActivationContext;
- (ORCHSchemaORCHUnsupportedLanguageDetected)unsupportedLanguageDetected;
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
- (void)deleteAceCommandContext;
- (void)deleteAsrBridgeContext;
- (void)deleteAssetSetsReported;
- (void)deleteAssistantdLaunchMetadataReported;
- (void)deleteAvailableAssets;
- (void)deleteCandidateRequestContext;
- (void)deleteCdmBridgeContext;
- (void)deleteContextSubmissionMessage;
- (void)deleteEventMetadata;
- (void)deleteExecuteOnRemoteRequestContext;
- (void)deleteExecutionBridgeContext;
- (void)deleteFlowOutputSubmitted;
- (void)deleteIdentityBridgeRequestContext;
- (void)deleteIntelligenceFlowQuerySent;
- (void)deleteMultiUserResultCandidate;
- (void)deleteMultiUserResultSelected;
- (void)deleteMuxBridgeContext;
- (void)deleteNlRouterBridgeContext;
- (void)deleteNlRouterBridgeSubComponentContext;
- (void)deleteNlv3ServerFallbackDeprecated;
- (void)deleteOrchDeviceDynamicContext;
- (void)deletePommesBridgeContext;
- (void)deletePowerContextPolicyReported;
- (void)deleteRequestContext;
- (void)deleteRequestMitigated;
- (void)deleteResourceUtilizationMetadata;
- (void)deleteResultCandidate;
- (void)deleteResultSelected;
- (void)deleteRouterRewrittenUtterance;
- (void)deleteServerFallbackContext;
- (void)deleteShimToolContext;
- (void)deleteSubRequestContext;
- (void)deleteSubRequestFallback;
- (void)deleteTrpCandidateCreated;
- (void)deleteTrpCandidateReceived;
- (void)deleteTrpFinalized;
- (void)deleteUiActivationContext;
- (void)deleteUnsupportedLanguageDetected;
- (void)setAceCommandContext:(id)a3;
- (void)setAsrBridgeContext:(id)a3;
- (void)setAssetSetsReported:(id)a3;
- (void)setAssistantdLaunchMetadataReported:(id)a3;
- (void)setAvailableAssets:(id)a3;
- (void)setCandidateRequestContext:(id)a3;
- (void)setCdmBridgeContext:(id)a3;
- (void)setContextSubmissionMessage:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setExecuteOnRemoteRequestContext:(id)a3;
- (void)setExecutionBridgeContext:(id)a3;
- (void)setFlowOutputSubmitted:(id)a3;
- (void)setHasAceCommandContext:(BOOL)a3;
- (void)setHasAsrBridgeContext:(BOOL)a3;
- (void)setHasAssetSetsReported:(BOOL)a3;
- (void)setHasAssistantdLaunchMetadataReported:(BOOL)a3;
- (void)setHasAvailableAssets:(BOOL)a3;
- (void)setHasCandidateRequestContext:(BOOL)a3;
- (void)setHasCdmBridgeContext:(BOOL)a3;
- (void)setHasContextSubmissionMessage:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasExecuteOnRemoteRequestContext:(BOOL)a3;
- (void)setHasExecutionBridgeContext:(BOOL)a3;
- (void)setHasFlowOutputSubmitted:(BOOL)a3;
- (void)setHasIdentityBridgeRequestContext:(BOOL)a3;
- (void)setHasIntelligenceFlowQuerySent:(BOOL)a3;
- (void)setHasMultiUserResultCandidate:(BOOL)a3;
- (void)setHasMultiUserResultSelected:(BOOL)a3;
- (void)setHasMuxBridgeContext:(BOOL)a3;
- (void)setHasNlRouterBridgeContext:(BOOL)a3;
- (void)setHasNlRouterBridgeSubComponentContext:(BOOL)a3;
- (void)setHasNlv3ServerFallbackDeprecated:(BOOL)a3;
- (void)setHasOrchDeviceDynamicContext:(BOOL)a3;
- (void)setHasPommesBridgeContext:(BOOL)a3;
- (void)setHasPowerContextPolicyReported:(BOOL)a3;
- (void)setHasRequestContext:(BOOL)a3;
- (void)setHasRequestMitigated:(BOOL)a3;
- (void)setHasResourceUtilizationMetadata:(BOOL)a3;
- (void)setHasResultCandidate:(BOOL)a3;
- (void)setHasResultSelected:(BOOL)a3;
- (void)setHasRouterRewrittenUtterance:(BOOL)a3;
- (void)setHasServerFallbackContext:(BOOL)a3;
- (void)setHasShimToolContext:(BOOL)a3;
- (void)setHasSubRequestContext:(BOOL)a3;
- (void)setHasSubRequestFallback:(BOOL)a3;
- (void)setHasTrpCandidateCreated:(BOOL)a3;
- (void)setHasTrpCandidateReceived:(BOOL)a3;
- (void)setHasTrpFinalized:(BOOL)a3;
- (void)setHasUiActivationContext:(BOOL)a3;
- (void)setHasUnsupportedLanguageDetected:(BOOL)a3;
- (void)setIdentityBridgeRequestContext:(id)a3;
- (void)setIntelligenceFlowQuerySent:(id)a3;
- (void)setMultiUserResultCandidate:(id)a3;
- (void)setMultiUserResultSelected:(id)a3;
- (void)setMuxBridgeContext:(id)a3;
- (void)setNlRouterBridgeContext:(id)a3;
- (void)setNlRouterBridgeSubComponentContext:(id)a3;
- (void)setNlv3ServerFallbackDeprecated:(id)a3;
- (void)setOrchDeviceDynamicContext:(id)a3;
- (void)setPommesBridgeContext:(id)a3;
- (void)setPowerContextPolicyReported:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setRequestMitigated:(id)a3;
- (void)setResourceUtilizationMetadata:(id)a3;
- (void)setResultCandidate:(id)a3;
- (void)setResultSelected:(id)a3;
- (void)setRouterRewrittenUtterance:(id)a3;
- (void)setServerFallbackContext:(id)a3;
- (void)setShimToolContext:(id)a3;
- (void)setSubRequestContext:(id)a3;
- (void)setSubRequestFallback:(id)a3;
- (void)setTrpCandidateCreated:(id)a3;
- (void)setTrpCandidateReceived:(id)a3;
- (void)setTrpFinalized:(id)a3;
- (void)setUiActivationContext:(id)a3;
- (void)setUnsupportedLanguageDetected:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHClientEvent

- (int)componentName
{
  v2 = [(ORCHSchemaORCHClientEvent *)self eventMetadata];
  v3 = [v2 requestId];

  if (v3 && ([v3 value], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = [v3 value];
    BOOL v7 = [v6 length] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)getComponentId
{
  v2 = [(ORCHSchemaORCHClientEvent *)self eventMetadata];
  v3 = [v2 requestId];

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
  v122.receiver = self;
  v122.super_class = (Class)ORCHSchemaORCHClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v122 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(ORCHSchemaORCHClientEvent *)self deleteRouterRewrittenUtterance];
  }
  if ([v4 isConditionSet:4]) {
    [(ORCHSchemaORCHClientEvent *)self deleteRouterRewrittenUtterance];
  }
  if ([v4 isConditionSet:5]) {
    [(ORCHSchemaORCHClientEvent *)self deleteRouterRewrittenUtterance];
  }
  if ([v4 isConditionSet:6]) {
    [(ORCHSchemaORCHClientEvent *)self deleteRouterRewrittenUtterance];
  }
  if ([v4 isConditionSet:7]) {
    [(ORCHSchemaORCHClientEvent *)self deleteRouterRewrittenUtterance];
  }
  uint64_t v6 = [(ORCHSchemaORCHClientEvent *)self eventMetadata];
  BOOL v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHClientEvent *)self deleteEventMetadata];
  }
  v9 = [(ORCHSchemaORCHClientEvent *)self resourceUtilizationMetadata];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ORCHSchemaORCHClientEvent *)self deleteResourceUtilizationMetadata];
  }
  v12 = [(ORCHSchemaORCHClientEvent *)self requestContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ORCHSchemaORCHClientEvent *)self deleteRequestContext];
  }
  v15 = [(ORCHSchemaORCHClientEvent *)self asrBridgeContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ORCHSchemaORCHClientEvent *)self deleteAsrBridgeContext];
  }
  v18 = [(ORCHSchemaORCHClientEvent *)self cdmBridgeContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(ORCHSchemaORCHClientEvent *)self deleteCdmBridgeContext];
  }
  v21 = [(ORCHSchemaORCHClientEvent *)self executionBridgeContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(ORCHSchemaORCHClientEvent *)self deleteExecutionBridgeContext];
  }
  v24 = [(ORCHSchemaORCHClientEvent *)self serverFallbackContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(ORCHSchemaORCHClientEvent *)self deleteServerFallbackContext];
  }
  v27 = [(ORCHSchemaORCHClientEvent *)self flowOutputSubmitted];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(ORCHSchemaORCHClientEvent *)self deleteFlowOutputSubmitted];
  }
  v30 = [(ORCHSchemaORCHClientEvent *)self resultCandidate];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(ORCHSchemaORCHClientEvent *)self deleteResultCandidate];
  }
  v33 = [(ORCHSchemaORCHClientEvent *)self resultSelected];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(ORCHSchemaORCHClientEvent *)self deleteResultSelected];
  }
  v36 = [(ORCHSchemaORCHClientEvent *)self contextSubmissionMessage];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(ORCHSchemaORCHClientEvent *)self deleteContextSubmissionMessage];
  }
  v39 = [(ORCHSchemaORCHClientEvent *)self availableAssets];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(ORCHSchemaORCHClientEvent *)self deleteAvailableAssets];
  }
  v42 = [(ORCHSchemaORCHClientEvent *)self orchDeviceDynamicContext];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(ORCHSchemaORCHClientEvent *)self deleteOrchDeviceDynamicContext];
  }
  v45 = [(ORCHSchemaORCHClientEvent *)self pommesBridgeContext];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(ORCHSchemaORCHClientEvent *)self deletePommesBridgeContext];
  }
  v48 = [(ORCHSchemaORCHClientEvent *)self muxBridgeContext];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(ORCHSchemaORCHClientEvent *)self deleteMuxBridgeContext];
  }
  v51 = [(ORCHSchemaORCHClientEvent *)self multiUserResultCandidate];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(ORCHSchemaORCHClientEvent *)self deleteMultiUserResultCandidate];
  }
  v54 = [(ORCHSchemaORCHClientEvent *)self multiUserResultSelected];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(ORCHSchemaORCHClientEvent *)self deleteMultiUserResultSelected];
  }
  v57 = [(ORCHSchemaORCHClientEvent *)self aceCommandContext];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(ORCHSchemaORCHClientEvent *)self deleteAceCommandContext];
  }
  v60 = [(ORCHSchemaORCHClientEvent *)self trpFinalized];
  v61 = [v60 applySensitiveConditionsPolicy:v4];
  int v62 = [v61 suppressMessage];

  if (v62) {
    [(ORCHSchemaORCHClientEvent *)self deleteTrpFinalized];
  }
  v63 = [(ORCHSchemaORCHClientEvent *)self requestMitigated];
  v64 = [v63 applySensitiveConditionsPolicy:v4];
  int v65 = [v64 suppressMessage];

  if (v65) {
    [(ORCHSchemaORCHClientEvent *)self deleteRequestMitigated];
  }
  v66 = [(ORCHSchemaORCHClientEvent *)self nlv3ServerFallbackDeprecated];
  v67 = [v66 applySensitiveConditionsPolicy:v4];
  int v68 = [v67 suppressMessage];

  if (v68) {
    [(ORCHSchemaORCHClientEvent *)self deleteNlv3ServerFallbackDeprecated];
  }
  v69 = [(ORCHSchemaORCHClientEvent *)self uiActivationContext];
  v70 = [v69 applySensitiveConditionsPolicy:v4];
  int v71 = [v70 suppressMessage];

  if (v71) {
    [(ORCHSchemaORCHClientEvent *)self deleteUiActivationContext];
  }
  v72 = [(ORCHSchemaORCHClientEvent *)self trpCandidateReceived];
  v73 = [v72 applySensitiveConditionsPolicy:v4];
  int v74 = [v73 suppressMessage];

  if (v74) {
    [(ORCHSchemaORCHClientEvent *)self deleteTrpCandidateReceived];
  }
  v75 = [(ORCHSchemaORCHClientEvent *)self identityBridgeRequestContext];
  v76 = [v75 applySensitiveConditionsPolicy:v4];
  int v77 = [v76 suppressMessage];

  if (v77) {
    [(ORCHSchemaORCHClientEvent *)self deleteIdentityBridgeRequestContext];
  }
  v78 = [(ORCHSchemaORCHClientEvent *)self assetSetsReported];
  v79 = [v78 applySensitiveConditionsPolicy:v4];
  int v80 = [v79 suppressMessage];

  if (v80) {
    [(ORCHSchemaORCHClientEvent *)self deleteAssetSetsReported];
  }
  v81 = [(ORCHSchemaORCHClientEvent *)self candidateRequestContext];
  v82 = [v81 applySensitiveConditionsPolicy:v4];
  int v83 = [v82 suppressMessage];

  if (v83) {
    [(ORCHSchemaORCHClientEvent *)self deleteCandidateRequestContext];
  }
  v84 = [(ORCHSchemaORCHClientEvent *)self powerContextPolicyReported];
  v85 = [v84 applySensitiveConditionsPolicy:v4];
  int v86 = [v85 suppressMessage];

  if (v86) {
    [(ORCHSchemaORCHClientEvent *)self deletePowerContextPolicyReported];
  }
  v87 = [(ORCHSchemaORCHClientEvent *)self executeOnRemoteRequestContext];
  v88 = [v87 applySensitiveConditionsPolicy:v4];
  int v89 = [v88 suppressMessage];

  if (v89) {
    [(ORCHSchemaORCHClientEvent *)self deleteExecuteOnRemoteRequestContext];
  }
  v90 = [(ORCHSchemaORCHClientEvent *)self assistantdLaunchMetadataReported];
  v91 = [v90 applySensitiveConditionsPolicy:v4];
  int v92 = [v91 suppressMessage];

  if (v92) {
    [(ORCHSchemaORCHClientEvent *)self deleteAssistantdLaunchMetadataReported];
  }
  v93 = [(ORCHSchemaORCHClientEvent *)self intelligenceFlowQuerySent];
  v94 = [v93 applySensitiveConditionsPolicy:v4];
  int v95 = [v94 suppressMessage];

  if (v95) {
    [(ORCHSchemaORCHClientEvent *)self deleteIntelligenceFlowQuerySent];
  }
  v96 = [(ORCHSchemaORCHClientEvent *)self subRequestContext];
  v97 = [v96 applySensitiveConditionsPolicy:v4];
  int v98 = [v97 suppressMessage];

  if (v98) {
    [(ORCHSchemaORCHClientEvent *)self deleteSubRequestContext];
  }
  v99 = [(ORCHSchemaORCHClientEvent *)self routerRewrittenUtterance];
  v100 = [v99 applySensitiveConditionsPolicy:v4];
  int v101 = [v100 suppressMessage];

  if (v101) {
    [(ORCHSchemaORCHClientEvent *)self deleteRouterRewrittenUtterance];
  }
  v102 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeContext];
  v103 = [v102 applySensitiveConditionsPolicy:v4];
  int v104 = [v103 suppressMessage];

  if (v104) {
    [(ORCHSchemaORCHClientEvent *)self deleteNlRouterBridgeContext];
  }
  v105 = [(ORCHSchemaORCHClientEvent *)self shimToolContext];
  v106 = [v105 applySensitiveConditionsPolicy:v4];
  int v107 = [v106 suppressMessage];

  if (v107) {
    [(ORCHSchemaORCHClientEvent *)self deleteShimToolContext];
  }
  v108 = [(ORCHSchemaORCHClientEvent *)self subRequestFallback];
  v109 = [v108 applySensitiveConditionsPolicy:v4];
  int v110 = [v109 suppressMessage];

  if (v110) {
    [(ORCHSchemaORCHClientEvent *)self deleteSubRequestFallback];
  }
  v111 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeSubComponentContext];
  v112 = [v111 applySensitiveConditionsPolicy:v4];
  int v113 = [v112 suppressMessage];

  if (v113) {
    [(ORCHSchemaORCHClientEvent *)self deleteNlRouterBridgeSubComponentContext];
  }
  v114 = [(ORCHSchemaORCHClientEvent *)self unsupportedLanguageDetected];
  v115 = [v114 applySensitiveConditionsPolicy:v4];
  int v116 = [v115 suppressMessage];

  if (v116) {
    [(ORCHSchemaORCHClientEvent *)self deleteUnsupportedLanguageDetected];
  }
  v117 = [(ORCHSchemaORCHClientEvent *)self trpCandidateCreated];
  v118 = [v117 applySensitiveConditionsPolicy:v4];
  int v119 = [v118 suppressMessage];

  if (v119) {
    [(ORCHSchemaORCHClientEvent *)self deleteTrpCandidateCreated];
  }
  id v120 = v5;

  return v120;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(ORCHSchemaORCHClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 0x23) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAB548[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x23) {
    return 0;
  }
  else {
    return off_1E5EAB668[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpCandidateCreated, 0);
  objc_storeStrong((id *)&self->_unsupportedLanguageDetected, 0);
  objc_storeStrong((id *)&self->_nlRouterBridgeSubComponentContext, 0);
  objc_storeStrong((id *)&self->_subRequestFallback, 0);
  objc_storeStrong((id *)&self->_shimToolContext, 0);
  objc_storeStrong((id *)&self->_nlRouterBridgeContext, 0);
  objc_storeStrong((id *)&self->_routerRewrittenUtterance, 0);
  objc_storeStrong((id *)&self->_subRequestContext, 0);
  objc_storeStrong((id *)&self->_intelligenceFlowQuerySent, 0);
  objc_storeStrong((id *)&self->_assistantdLaunchMetadataReported, 0);
  objc_storeStrong((id *)&self->_executeOnRemoteRequestContext, 0);
  objc_storeStrong((id *)&self->_powerContextPolicyReported, 0);
  objc_storeStrong((id *)&self->_candidateRequestContext, 0);
  objc_storeStrong((id *)&self->_assetSetsReported, 0);
  objc_storeStrong((id *)&self->_identityBridgeRequestContext, 0);
  objc_storeStrong((id *)&self->_trpCandidateReceived, 0);
  objc_storeStrong((id *)&self->_uiActivationContext, 0);
  objc_storeStrong((id *)&self->_nlv3ServerFallbackDeprecated, 0);
  objc_storeStrong((id *)&self->_requestMitigated, 0);
  objc_storeStrong((id *)&self->_trpFinalized, 0);
  objc_storeStrong((id *)&self->_aceCommandContext, 0);
  objc_storeStrong((id *)&self->_multiUserResultSelected, 0);
  objc_storeStrong((id *)&self->_multiUserResultCandidate, 0);
  objc_storeStrong((id *)&self->_muxBridgeContext, 0);
  objc_storeStrong((id *)&self->_pommesBridgeContext, 0);
  objc_storeStrong((id *)&self->_orchDeviceDynamicContext, 0);
  objc_storeStrong((id *)&self->_availableAssets, 0);
  objc_storeStrong((id *)&self->_contextSubmissionMessage, 0);
  objc_storeStrong((id *)&self->_resultSelected, 0);
  objc_storeStrong((id *)&self->_resultCandidate, 0);
  objc_storeStrong((id *)&self->_flowOutputSubmitted, 0);
  objc_storeStrong((id *)&self->_serverFallbackContext, 0);
  objc_storeStrong((id *)&self->_executionBridgeContext, 0);
  objc_storeStrong((id *)&self->_cdmBridgeContext, 0);
  objc_storeStrong((id *)&self->_asrBridgeContext, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_resourceUtilizationMetadata, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasTrpCandidateCreated:(BOOL)a3
{
  self->_hasTrpCandidateCreated = a3;
}

- (BOOL)hasTrpCandidateCreated
{
  return self->_hasTrpCandidateCreated;
}

- (void)setHasUnsupportedLanguageDetected:(BOOL)a3
{
  self->_hasUnsupportedLanguageDetected = a3;
}

- (BOOL)hasUnsupportedLanguageDetected
{
  return self->_hasUnsupportedLanguageDetected;
}

- (void)setHasNlRouterBridgeSubComponentContext:(BOOL)a3
{
  self->_hasNlRouterBridgeSubComponentContext = a3;
}

- (BOOL)hasNlRouterBridgeSubComponentContext
{
  return self->_hasNlRouterBridgeSubComponentContext;
}

- (void)setHasSubRequestFallback:(BOOL)a3
{
  self->_hasSubRequestFallback = a3;
}

- (BOOL)hasSubRequestFallback
{
  return self->_hasSubRequestFallback;
}

- (void)setHasShimToolContext:(BOOL)a3
{
  self->_hasShimToolContext = a3;
}

- (BOOL)hasShimToolContext
{
  return self->_hasShimToolContext;
}

- (void)setHasNlRouterBridgeContext:(BOOL)a3
{
  self->_hasNlRouterBridgeContext = a3;
}

- (BOOL)hasNlRouterBridgeContext
{
  return self->_hasNlRouterBridgeContext;
}

- (void)setHasRouterRewrittenUtterance:(BOOL)a3
{
  self->_hasRouterRewrittenUtterance = a3;
}

- (BOOL)hasRouterRewrittenUtterance
{
  return self->_hasRouterRewrittenUtterance;
}

- (void)setHasSubRequestContext:(BOOL)a3
{
  self->_hasSubRequestContext = a3;
}

- (BOOL)hasSubRequestContext
{
  return self->_hasSubRequestContext;
}

- (void)setHasIntelligenceFlowQuerySent:(BOOL)a3
{
  self->_hasIntelligenceFlowQuerySent = a3;
}

- (BOOL)hasIntelligenceFlowQuerySent
{
  return self->_hasIntelligenceFlowQuerySent;
}

- (void)setHasAssistantdLaunchMetadataReported:(BOOL)a3
{
  self->_hasAssistantdLaunchMetadataReported = a3;
}

- (BOOL)hasAssistantdLaunchMetadataReported
{
  return self->_hasAssistantdLaunchMetadataReported;
}

- (void)setHasExecuteOnRemoteRequestContext:(BOOL)a3
{
  self->_hasExecuteOnRemoteRequestContext = a3;
}

- (BOOL)hasExecuteOnRemoteRequestContext
{
  return self->_hasExecuteOnRemoteRequestContext;
}

- (void)setHasPowerContextPolicyReported:(BOOL)a3
{
  self->_hasPowerContextPolicyReported = a3;
}

- (BOOL)hasPowerContextPolicyReported
{
  return self->_hasPowerContextPolicyReported;
}

- (void)setHasCandidateRequestContext:(BOOL)a3
{
  self->_hasCandidateRequestContext = a3;
}

- (BOOL)hasCandidateRequestContext
{
  return self->_hasCandidateRequestContext;
}

- (void)setHasAssetSetsReported:(BOOL)a3
{
  self->_hasAssetSetsReported = a3;
}

- (BOOL)hasAssetSetsReported
{
  return self->_hasAssetSetsReported;
}

- (void)setHasIdentityBridgeRequestContext:(BOOL)a3
{
  self->_hasIdentityBridgeRequestContext = a3;
}

- (BOOL)hasIdentityBridgeRequestContext
{
  return self->_hasIdentityBridgeRequestContext;
}

- (void)setHasTrpCandidateReceived:(BOOL)a3
{
  self->_hasTrpCandidateReceived = a3;
}

- (BOOL)hasTrpCandidateReceived
{
  return self->_hasTrpCandidateReceived;
}

- (void)setHasUiActivationContext:(BOOL)a3
{
  self->_hasUiActivationContext = a3;
}

- (BOOL)hasUiActivationContext
{
  return self->_hasUiActivationContext;
}

- (void)setHasNlv3ServerFallbackDeprecated:(BOOL)a3
{
  self->_hasNlv3ServerFallbackDeprecated = a3;
}

- (BOOL)hasNlv3ServerFallbackDeprecated
{
  return self->_hasNlv3ServerFallbackDeprecated;
}

- (void)setHasRequestMitigated:(BOOL)a3
{
  self->_hasRequestMitigated = a3;
}

- (BOOL)hasRequestMitigated
{
  return self->_hasRequestMitigated;
}

- (void)setHasTrpFinalized:(BOOL)a3
{
  self->_hasTrpFinalized = a3;
}

- (BOOL)hasTrpFinalized
{
  return self->_hasTrpFinalized;
}

- (void)setHasAceCommandContext:(BOOL)a3
{
  self->_hasAceCommandContext = a3;
}

- (BOOL)hasAceCommandContext
{
  return self->_hasAceCommandContext;
}

- (void)setHasMultiUserResultSelected:(BOOL)a3
{
  self->_hasMultiUserResultSelected = a3;
}

- (BOOL)hasMultiUserResultSelected
{
  return self->_hasMultiUserResultSelected;
}

- (void)setHasMultiUserResultCandidate:(BOOL)a3
{
  self->_hasMultiUserResultCandidate = a3;
}

- (BOOL)hasMultiUserResultCandidate
{
  return self->_hasMultiUserResultCandidate;
}

- (void)setHasMuxBridgeContext:(BOOL)a3
{
  self->_hasMuxBridgeContext = a3;
}

- (BOOL)hasMuxBridgeContext
{
  return self->_hasMuxBridgeContext;
}

- (void)setHasPommesBridgeContext:(BOOL)a3
{
  self->_hasPommesBridgeContext = a3;
}

- (BOOL)hasPommesBridgeContext
{
  return self->_hasPommesBridgeContext;
}

- (void)setHasOrchDeviceDynamicContext:(BOOL)a3
{
  self->_hasOrchDeviceDynamicContext = a3;
}

- (BOOL)hasOrchDeviceDynamicContext
{
  return self->_hasOrchDeviceDynamicContext;
}

- (void)setHasAvailableAssets:(BOOL)a3
{
  self->_hasAvailableAssets = a3;
}

- (BOOL)hasAvailableAssets
{
  return self->_hasAvailableAssets;
}

- (void)setHasContextSubmissionMessage:(BOOL)a3
{
  self->_hasContextSubmissionMessage = a3;
}

- (BOOL)hasContextSubmissionMessage
{
  return self->_hasContextSubmissionMessage;
}

- (void)setHasResultSelected:(BOOL)a3
{
  self->_hasResultSelected = a3;
}

- (BOOL)hasResultSelected
{
  return self->_hasResultSelected;
}

- (void)setHasResultCandidate:(BOOL)a3
{
  self->_hasResultCandidate = a3;
}

- (BOOL)hasResultCandidate
{
  return self->_hasResultCandidate;
}

- (void)setHasFlowOutputSubmitted:(BOOL)a3
{
  self->_hasFlowOutputSubmitted = a3;
}

- (BOOL)hasFlowOutputSubmitted
{
  return self->_hasFlowOutputSubmitted;
}

- (void)setHasServerFallbackContext:(BOOL)a3
{
  self->_hasServerFallbackContext = a3;
}

- (BOOL)hasServerFallbackContext
{
  return self->_hasServerFallbackContext;
}

- (void)setHasExecutionBridgeContext:(BOOL)a3
{
  self->_hasExecutionBridgeContext = a3;
}

- (BOOL)hasExecutionBridgeContext
{
  return self->_hasExecutionBridgeContext;
}

- (void)setHasCdmBridgeContext:(BOOL)a3
{
  self->_hasCdmBridgeContext = a3;
}

- (BOOL)hasCdmBridgeContext
{
  return self->_hasCdmBridgeContext;
}

- (void)setHasAsrBridgeContext:(BOOL)a3
{
  self->_hasAsrBridgeContext = a3;
}

- (BOOL)hasAsrBridgeContext
{
  return self->_hasAsrBridgeContext;
}

- (void)setHasRequestContext:(BOOL)a3
{
  self->_hasRequestContext = a3;
}

- (BOOL)hasRequestContext
{
  return self->_hasRequestContext;
}

- (void)setHasResourceUtilizationMetadata:(BOOL)a3
{
  self->_hasResourceUtilizationMetadata = a3;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setResourceUtilizationMetadata:(id)a3
{
}

- (ORCHSchemaORCHResourceUtilizationMetadata)resourceUtilizationMetadata
{
  return self->_resourceUtilizationMetadata;
}

- (void)setEventMetadata:(id)a3
{
}

- (ORCHSchemaORCHClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ORCHSchemaORCHClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v115.receiver = self;
  v115.super_class = (Class)ORCHSchemaORCHClientEvent;
  v5 = [(ORCHSchemaORCHClientEvent *)&v115 init];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [[ORCHSchemaORCHClientEventMetadata alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"resourceUtilizationMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ORCHSchemaORCHResourceUtilizationMetadata alloc] initWithDictionary:v8];
      [(ORCHSchemaORCHClientEvent *)v5 setResourceUtilizationMetadata:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"requestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ORCHSchemaORCHRequestContext alloc] initWithDictionary:v10];
      [(ORCHSchemaORCHClientEvent *)v5 setRequestContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"asrBridgeContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[ORCHSchemaORCHASRBridgeContext alloc] initWithDictionary:v12];
      [(ORCHSchemaORCHClientEvent *)v5 setAsrBridgeContext:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"cdmBridgeContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[ORCHSchemaORCHCDMBridgeContext alloc] initWithDictionary:v14];
      [(ORCHSchemaORCHClientEvent *)v5 setCdmBridgeContext:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"executionBridgeContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[ORCHSchemaORCHExecutionBridgeContext alloc] initWithDictionary:v16];
      [(ORCHSchemaORCHClientEvent *)v5 setExecutionBridgeContext:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"serverFallbackContext"];
    objc_opt_class();
    v114 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[ORCHSchemaORCHServerFallbackContext alloc] initWithDictionary:v18];
      [(ORCHSchemaORCHClientEvent *)v5 setServerFallbackContext:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"flowOutputSubmitted"];
    objc_opt_class();
    int v113 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[ORCHSchemaORCHFlowOutputSubmitted alloc] initWithDictionary:v20];
      [(ORCHSchemaORCHClientEvent *)v5 setFlowOutputSubmitted:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"resultCandidate"];
    objc_opt_class();
    v112 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[ORCHSchemaORCHResultCandidateReceived alloc] initWithDictionary:v22];
      [(ORCHSchemaORCHClientEvent *)v5 setResultCandidate:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"resultSelected"];
    objc_opt_class();
    v111 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[ORCHSchemaORCHResultSelected alloc] initWithDictionary:v24];
      [(ORCHSchemaORCHClientEvent *)v5 setResultSelected:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"contextSubmissionMessage"];
    objc_opt_class();
    int v110 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[ORCHSchemaORCHConversationContextSubmitted alloc] initWithDictionary:v26];
      [(ORCHSchemaORCHClientEvent *)v5 setContextSubmissionMessage:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"availableAssets"];
    objc_opt_class();
    v109 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[ORCHSchemaORCHAssetsReported alloc] initWithDictionary:v28];
      [(ORCHSchemaORCHClientEvent *)v5 setAvailableAssets:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"orchDeviceDynamicContext"];
    objc_opt_class();
    v108 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[ORCHSchemaORCHDeviceDynamicContext alloc] initWithDictionary:v30];
      [(ORCHSchemaORCHClientEvent *)v5 setOrchDeviceDynamicContext:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"pommesBridgeContext"];
    objc_opt_class();
    int v107 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[ORCHSchemaORCHPommesBridgeContext alloc] initWithDictionary:v32];
      [(ORCHSchemaORCHClientEvent *)v5 setPommesBridgeContext:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"muxBridgeContext"];
    objc_opt_class();
    v106 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[ORCHSchemaORCHMUXBridgeContext alloc] initWithDictionary:v34];
      [(ORCHSchemaORCHClientEvent *)v5 setMuxBridgeContext:v35];
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"multiUserResultCandidate"];
    objc_opt_class();
    v105 = (void *)v36;
    if (objc_opt_isKindOfClass())
    {
      v37 = [[ORCHSchemaORCHMultiUserResultCandidateReceived alloc] initWithDictionary:v36];
      [(ORCHSchemaORCHClientEvent *)v5 setMultiUserResultCandidate:v37];
    }
    uint64_t v38 = [v4 objectForKeyedSubscript:@"multiUserResultSelected"];
    objc_opt_class();
    int v104 = (void *)v38;
    if (objc_opt_isKindOfClass())
    {
      v39 = [[ORCHSchemaORCHMultiUserResultCandidateSelected alloc] initWithDictionary:v38];
      [(ORCHSchemaORCHClientEvent *)v5 setMultiUserResultSelected:v39];
    }
    uint64_t v40 = [v4 objectForKeyedSubscript:@"aceCommandContext"];
    objc_opt_class();
    v103 = (void *)v40;
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[ORCHSchemaORCHAceCommandContext alloc] initWithDictionary:v40];
      [(ORCHSchemaORCHClientEvent *)v5 setAceCommandContext:v41];
    }
    uint64_t v42 = [v4 objectForKeyedSubscript:@"trpFinalized"];
    objc_opt_class();
    v102 = (void *)v42;
    if (objc_opt_isKindOfClass())
    {
      v43 = [[ORCHSchemaORCHTRPFinalized alloc] initWithDictionary:v42];
      [(ORCHSchemaORCHClientEvent *)v5 setTrpFinalized:v43];
    }
    uint64_t v44 = [v4 objectForKeyedSubscript:@"requestMitigated"];
    objc_opt_class();
    int v101 = (void *)v44;
    if (objc_opt_isKindOfClass())
    {
      v45 = [[ORCHSchemaORCHRequestMitigated alloc] initWithDictionary:v44];
      [(ORCHSchemaORCHClientEvent *)v5 setRequestMitigated:v45];
    }
    uint64_t v46 = [v4 objectForKeyedSubscript:@"nlv3ServerFallbackDeprecated"];
    objc_opt_class();
    v100 = (void *)v46;
    if (objc_opt_isKindOfClass())
    {
      int v47 = [[ORCHSchemaORCHNLV3ServerFallbackDeprecated alloc] initWithDictionary:v46];
      [(ORCHSchemaORCHClientEvent *)v5 setNlv3ServerFallbackDeprecated:v47];
    }
    uint64_t v48 = [v4 objectForKeyedSubscript:@"uiActivationContext"];
    objc_opt_class();
    v99 = (void *)v48;
    if (objc_opt_isKindOfClass())
    {
      v49 = [[ORCHSchemaORCHUIActivationContext alloc] initWithDictionary:v48];
      [(ORCHSchemaORCHClientEvent *)v5 setUiActivationContext:v49];
    }
    uint64_t v50 = [v4 objectForKeyedSubscript:@"trpCandidateReceived"];
    objc_opt_class();
    int v98 = (void *)v50;
    if (objc_opt_isKindOfClass())
    {
      v51 = [[ORCHSchemaORCHTRPCandidateReceived alloc] initWithDictionary:v50];
      [(ORCHSchemaORCHClientEvent *)v5 setTrpCandidateReceived:v51];
    }
    uint64_t v52 = [v4 objectForKeyedSubscript:@"identityBridgeRequestContext"];
    objc_opt_class();
    v97 = (void *)v52;
    if (objc_opt_isKindOfClass())
    {
      int v53 = [[ORCHSchemaORCHIdentityBridgeRequestContext alloc] initWithDictionary:v52];
      [(ORCHSchemaORCHClientEvent *)v5 setIdentityBridgeRequestContext:v53];
    }
    uint64_t v54 = [v4 objectForKeyedSubscript:@"assetSetsReported"];
    objc_opt_class();
    v96 = (void *)v54;
    if (objc_opt_isKindOfClass())
    {
      v55 = [[ORCHSchemaORCHAssetSetsReported alloc] initWithDictionary:v54];
      [(ORCHSchemaORCHClientEvent *)v5 setAssetSetsReported:v55];
    }
    uint64_t v56 = [v4 objectForKeyedSubscript:@"candidateRequestContext"];
    objc_opt_class();
    int v95 = (void *)v56;
    if (objc_opt_isKindOfClass())
    {
      v57 = [[ORCHSchemaORCHCandidateRequestContext alloc] initWithDictionary:v56];
      [(ORCHSchemaORCHClientEvent *)v5 setCandidateRequestContext:v57];
    }
    uint64_t v58 = [v4 objectForKeyedSubscript:@"powerContextPolicyReported"];
    objc_opt_class();
    v94 = (void *)v58;
    if (objc_opt_isKindOfClass())
    {
      int v59 = [[ORCHSchemaORCHPowerContextPolicyReported alloc] initWithDictionary:v58];
      [(ORCHSchemaORCHClientEvent *)v5 setPowerContextPolicyReported:v59];
    }
    uint64_t v60 = [v4 objectForKeyedSubscript:@"executeOnRemoteRequestContext"];
    objc_opt_class();
    v93 = (void *)v60;
    if (objc_opt_isKindOfClass())
    {
      v61 = [[ORCHSchemaORCHExecuteOnRemoteRequestContext alloc] initWithDictionary:v60];
      [(ORCHSchemaORCHClientEvent *)v5 setExecuteOnRemoteRequestContext:v61];
    }
    uint64_t v62 = [v4 objectForKeyedSubscript:@"assistantdLaunchMetadataReported"];
    objc_opt_class();
    int v92 = (void *)v62;
    if (objc_opt_isKindOfClass())
    {
      v63 = [[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported alloc] initWithDictionary:v62];
      [(ORCHSchemaORCHClientEvent *)v5 setAssistantdLaunchMetadataReported:v63];
    }
    uint64_t v64 = [v4 objectForKeyedSubscript:@"intelligenceFlowQuerySent"];
    objc_opt_class();
    v91 = (void *)v64;
    if (objc_opt_isKindOfClass())
    {
      int v65 = [[ORCHSchemaORCHIntelligenceFlowQuerySent alloc] initWithDictionary:v64];
      [(ORCHSchemaORCHClientEvent *)v5 setIntelligenceFlowQuerySent:v65];
    }
    v85 = (void *)v16;
    uint64_t v66 = [v4 objectForKeyedSubscript:@"subRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v67 = [[ORCHSchemaORCHSubRequestContext alloc] initWithDictionary:v66];
      [(ORCHSchemaORCHClientEvent *)v5 setSubRequestContext:v67];
    }
    v90 = (void *)v6;
    int v68 = objc_msgSend(v4, "objectForKeyedSubscript:", @"routerRewrittenUtterance", v66);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v69 = [[ORCHSchemaNLRouterRewrittenUtteranceTier1 alloc] initWithDictionary:v68];
      [(ORCHSchemaORCHClientEvent *)v5 setRouterRewrittenUtterance:v69];
    }
    int v89 = (void *)v8;
    v70 = [v4 objectForKeyedSubscript:@"nlRouterBridgeContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v71 = [[ORCHSchemaORCHNLRouterBridgeContext alloc] initWithDictionary:v70];
      [(ORCHSchemaORCHClientEvent *)v5 setNlRouterBridgeContext:v71];
    }
    v88 = (void *)v10;
    v72 = [v4 objectForKeyedSubscript:@"shimToolContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v73 = [[ORCHSchemaORCHShimToolContext alloc] initWithDictionary:v72];
      [(ORCHSchemaORCHClientEvent *)v5 setShimToolContext:v73];
    }
    v87 = (void *)v12;
    int v74 = [v4 objectForKeyedSubscript:@"subRequestFallback"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v75 = [[ORCHSchemaORCHIntelligenceFlowSubRequestFallback alloc] initWithDictionary:v74];
      [(ORCHSchemaORCHClientEvent *)v5 setSubRequestFallback:v75];
    }
    int v86 = (void *)v14;
    v76 = [v4 objectForKeyedSubscript:@"nlRouterBridgeSubComponentContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v77 = [[ORCHSchemaORCHNLRouterBridgeSubComponentContext alloc] initWithDictionary:v76];
      [(ORCHSchemaORCHClientEvent *)v5 setNlRouterBridgeSubComponentContext:v77];
    }
    v78 = [v4 objectForKeyedSubscript:@"unsupportedLanguageDetected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v79 = [[ORCHSchemaORCHUnsupportedLanguageDetected alloc] initWithDictionary:v78];
      [(ORCHSchemaORCHClientEvent *)v5 setUnsupportedLanguageDetected:v79];
    }
    int v80 = [v4 objectForKeyedSubscript:@"trpCandidateCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v81 = [[ORCHSchemaORCHTRPCandidateCreated alloc] initWithDictionary:v80];
      [(ORCHSchemaORCHClientEvent *)v5 setTrpCandidateCreated:v81];
    }
    v82 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHClientEvent *)self dictionaryRepresentation];
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
  if (self->_aceCommandContext)
  {
    id v4 = [(ORCHSchemaORCHClientEvent *)self aceCommandContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"aceCommandContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"aceCommandContext"];
    }
  }
  if (self->_asrBridgeContext)
  {
    uint64_t v7 = [(ORCHSchemaORCHClientEvent *)self asrBridgeContext];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"asrBridgeContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"asrBridgeContext"];
    }
  }
  if (self->_assetSetsReported)
  {
    uint64_t v10 = [(ORCHSchemaORCHClientEvent *)self assetSetsReported];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"assetSetsReported"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"assetSetsReported"];
    }
  }
  if (self->_assistantdLaunchMetadataReported)
  {
    v13 = [(ORCHSchemaORCHClientEvent *)self assistantdLaunchMetadataReported];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"assistantdLaunchMetadataReported"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"assistantdLaunchMetadataReported"];
    }
  }
  if (self->_availableAssets)
  {
    uint64_t v16 = [(ORCHSchemaORCHClientEvent *)self availableAssets];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"availableAssets"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"availableAssets"];
    }
  }
  if (self->_candidateRequestContext)
  {
    v19 = [(ORCHSchemaORCHClientEvent *)self candidateRequestContext];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"candidateRequestContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"candidateRequestContext"];
    }
  }
  if (self->_cdmBridgeContext)
  {
    uint64_t v22 = [(ORCHSchemaORCHClientEvent *)self cdmBridgeContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"cdmBridgeContext"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"cdmBridgeContext"];
    }
  }
  if (self->_contextSubmissionMessage)
  {
    v25 = [(ORCHSchemaORCHClientEvent *)self contextSubmissionMessage];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"contextSubmissionMessage"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"contextSubmissionMessage"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v28 = [(ORCHSchemaORCHClientEvent *)self eventMetadata];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_executeOnRemoteRequestContext)
  {
    v31 = [(ORCHSchemaORCHClientEvent *)self executeOnRemoteRequestContext];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"executeOnRemoteRequestContext"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"executeOnRemoteRequestContext"];
    }
  }
  if (self->_executionBridgeContext)
  {
    uint64_t v34 = [(ORCHSchemaORCHClientEvent *)self executionBridgeContext];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"executionBridgeContext"];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"executionBridgeContext"];
    }
  }
  if (self->_flowOutputSubmitted)
  {
    v37 = [(ORCHSchemaORCHClientEvent *)self flowOutputSubmitted];
    uint64_t v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"flowOutputSubmitted"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"flowOutputSubmitted"];
    }
  }
  if (self->_identityBridgeRequestContext)
  {
    uint64_t v40 = [(ORCHSchemaORCHClientEvent *)self identityBridgeRequestContext];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"identityBridgeRequestContext"];
    }
    else
    {
      uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"identityBridgeRequestContext"];
    }
  }
  if (self->_intelligenceFlowQuerySent)
  {
    v43 = [(ORCHSchemaORCHClientEvent *)self intelligenceFlowQuerySent];
    uint64_t v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"intelligenceFlowQuerySent"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"intelligenceFlowQuerySent"];
    }
  }
  if (self->_multiUserResultCandidate)
  {
    uint64_t v46 = [(ORCHSchemaORCHClientEvent *)self multiUserResultCandidate];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"multiUserResultCandidate"];
    }
    else
    {
      uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"multiUserResultCandidate"];
    }
  }
  if (self->_multiUserResultSelected)
  {
    v49 = [(ORCHSchemaORCHClientEvent *)self multiUserResultSelected];
    uint64_t v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"multiUserResultSelected"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"multiUserResultSelected"];
    }
  }
  if (self->_muxBridgeContext)
  {
    uint64_t v52 = [(ORCHSchemaORCHClientEvent *)self muxBridgeContext];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"muxBridgeContext"];
    }
    else
    {
      uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"muxBridgeContext"];
    }
  }
  if (self->_nlRouterBridgeContext)
  {
    v55 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeContext];
    uint64_t v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"nlRouterBridgeContext"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"nlRouterBridgeContext"];
    }
  }
  if (self->_nlRouterBridgeSubComponentContext)
  {
    uint64_t v58 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeSubComponentContext];
    int v59 = [v58 dictionaryRepresentation];
    if (v59)
    {
      [v3 setObject:v59 forKeyedSubscript:@"nlRouterBridgeSubComponentContext"];
    }
    else
    {
      uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v60 forKeyedSubscript:@"nlRouterBridgeSubComponentContext"];
    }
  }
  if (self->_nlv3ServerFallbackDeprecated)
  {
    v61 = [(ORCHSchemaORCHClientEvent *)self nlv3ServerFallbackDeprecated];
    uint64_t v62 = [v61 dictionaryRepresentation];
    if (v62)
    {
      [v3 setObject:v62 forKeyedSubscript:@"nlv3ServerFallbackDeprecated"];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v63 forKeyedSubscript:@"nlv3ServerFallbackDeprecated"];
    }
  }
  if (self->_orchDeviceDynamicContext)
  {
    uint64_t v64 = [(ORCHSchemaORCHClientEvent *)self orchDeviceDynamicContext];
    int v65 = [v64 dictionaryRepresentation];
    if (v65)
    {
      [v3 setObject:v65 forKeyedSubscript:@"orchDeviceDynamicContext"];
    }
    else
    {
      uint64_t v66 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v66 forKeyedSubscript:@"orchDeviceDynamicContext"];
    }
  }
  if (self->_pommesBridgeContext)
  {
    v67 = [(ORCHSchemaORCHClientEvent *)self pommesBridgeContext];
    int v68 = [v67 dictionaryRepresentation];
    if (v68)
    {
      [v3 setObject:v68 forKeyedSubscript:@"pommesBridgeContext"];
    }
    else
    {
      v69 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v69 forKeyedSubscript:@"pommesBridgeContext"];
    }
  }
  if (self->_powerContextPolicyReported)
  {
    v70 = [(ORCHSchemaORCHClientEvent *)self powerContextPolicyReported];
    int v71 = [v70 dictionaryRepresentation];
    if (v71)
    {
      [v3 setObject:v71 forKeyedSubscript:@"powerContextPolicyReported"];
    }
    else
    {
      v72 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v72 forKeyedSubscript:@"powerContextPolicyReported"];
    }
  }
  if (self->_requestContext)
  {
    v73 = [(ORCHSchemaORCHClientEvent *)self requestContext];
    int v74 = [v73 dictionaryRepresentation];
    if (v74)
    {
      [v3 setObject:v74 forKeyedSubscript:@"requestContext"];
    }
    else
    {
      v75 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v75 forKeyedSubscript:@"requestContext"];
    }
  }
  if (self->_requestMitigated)
  {
    v76 = [(ORCHSchemaORCHClientEvent *)self requestMitigated];
    int v77 = [v76 dictionaryRepresentation];
    if (v77)
    {
      [v3 setObject:v77 forKeyedSubscript:@"requestMitigated"];
    }
    else
    {
      v78 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v78 forKeyedSubscript:@"requestMitigated"];
    }
  }
  if (self->_resourceUtilizationMetadata)
  {
    v79 = [(ORCHSchemaORCHClientEvent *)self resourceUtilizationMetadata];
    int v80 = [v79 dictionaryRepresentation];
    if (v80)
    {
      [v3 setObject:v80 forKeyedSubscript:@"resourceUtilizationMetadata"];
    }
    else
    {
      v81 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v81 forKeyedSubscript:@"resourceUtilizationMetadata"];
    }
  }
  if (self->_resultCandidate)
  {
    v82 = [(ORCHSchemaORCHClientEvent *)self resultCandidate];
    int v83 = [v82 dictionaryRepresentation];
    if (v83)
    {
      [v3 setObject:v83 forKeyedSubscript:@"resultCandidate"];
    }
    else
    {
      v84 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v84 forKeyedSubscript:@"resultCandidate"];
    }
  }
  if (self->_resultSelected)
  {
    v85 = [(ORCHSchemaORCHClientEvent *)self resultSelected];
    int v86 = [v85 dictionaryRepresentation];
    if (v86)
    {
      [v3 setObject:v86 forKeyedSubscript:@"resultSelected"];
    }
    else
    {
      v87 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v87 forKeyedSubscript:@"resultSelected"];
    }
  }
  if (self->_routerRewrittenUtterance)
  {
    v88 = [(ORCHSchemaORCHClientEvent *)self routerRewrittenUtterance];
    int v89 = [v88 dictionaryRepresentation];
    if (v89)
    {
      [v3 setObject:v89 forKeyedSubscript:@"routerRewrittenUtterance"];
    }
    else
    {
      v90 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v90 forKeyedSubscript:@"routerRewrittenUtterance"];
    }
  }
  if (self->_serverFallbackContext)
  {
    v91 = [(ORCHSchemaORCHClientEvent *)self serverFallbackContext];
    int v92 = [v91 dictionaryRepresentation];
    if (v92)
    {
      [v3 setObject:v92 forKeyedSubscript:@"serverFallbackContext"];
    }
    else
    {
      v93 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v93 forKeyedSubscript:@"serverFallbackContext"];
    }
  }
  if (self->_shimToolContext)
  {
    v94 = [(ORCHSchemaORCHClientEvent *)self shimToolContext];
    int v95 = [v94 dictionaryRepresentation];
    if (v95)
    {
      [v3 setObject:v95 forKeyedSubscript:@"shimToolContext"];
    }
    else
    {
      v96 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v96 forKeyedSubscript:@"shimToolContext"];
    }
  }
  if (self->_subRequestContext)
  {
    v97 = [(ORCHSchemaORCHClientEvent *)self subRequestContext];
    int v98 = [v97 dictionaryRepresentation];
    if (v98)
    {
      [v3 setObject:v98 forKeyedSubscript:@"subRequestContext"];
    }
    else
    {
      v99 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v99 forKeyedSubscript:@"subRequestContext"];
    }
  }
  if (self->_subRequestFallback)
  {
    v100 = [(ORCHSchemaORCHClientEvent *)self subRequestFallback];
    int v101 = [v100 dictionaryRepresentation];
    if (v101)
    {
      [v3 setObject:v101 forKeyedSubscript:@"subRequestFallback"];
    }
    else
    {
      v102 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v102 forKeyedSubscript:@"subRequestFallback"];
    }
  }
  if (self->_trpCandidateCreated)
  {
    v103 = [(ORCHSchemaORCHClientEvent *)self trpCandidateCreated];
    int v104 = [v103 dictionaryRepresentation];
    if (v104)
    {
      [v3 setObject:v104 forKeyedSubscript:@"trpCandidateCreated"];
    }
    else
    {
      v105 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v105 forKeyedSubscript:@"trpCandidateCreated"];
    }
  }
  if (self->_trpCandidateReceived)
  {
    v106 = [(ORCHSchemaORCHClientEvent *)self trpCandidateReceived];
    int v107 = [v106 dictionaryRepresentation];
    if (v107)
    {
      [v3 setObject:v107 forKeyedSubscript:@"trpCandidateReceived"];
    }
    else
    {
      v108 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v108 forKeyedSubscript:@"trpCandidateReceived"];
    }
  }
  if (self->_trpFinalized)
  {
    v109 = [(ORCHSchemaORCHClientEvent *)self trpFinalized];
    int v110 = [v109 dictionaryRepresentation];
    if (v110)
    {
      [v3 setObject:v110 forKeyedSubscript:@"trpFinalized"];
    }
    else
    {
      v111 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v111 forKeyedSubscript:@"trpFinalized"];
    }
  }
  if (self->_uiActivationContext)
  {
    v112 = [(ORCHSchemaORCHClientEvent *)self uiActivationContext];
    int v113 = [v112 dictionaryRepresentation];
    if (v113)
    {
      [v3 setObject:v113 forKeyedSubscript:@"uiActivationContext"];
    }
    else
    {
      v114 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v114 forKeyedSubscript:@"uiActivationContext"];
    }
  }
  if (self->_unsupportedLanguageDetected)
  {
    objc_super v115 = [(ORCHSchemaORCHClientEvent *)self unsupportedLanguageDetected];
    int v116 = [v115 dictionaryRepresentation];
    if (v116)
    {
      [v3 setObject:v116 forKeyedSubscript:@"unsupportedLanguageDetected"];
    }
    else
    {
      v117 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v117 forKeyedSubscript:@"unsupportedLanguageDetected"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v118 = v3;

  return v118;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ORCHSchemaORCHClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(ORCHSchemaORCHResourceUtilizationMetadata *)self->_resourceUtilizationMetadata hash] ^ v3;
  unint64_t v5 = [(ORCHSchemaORCHRequestContext *)self->_requestContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(ORCHSchemaORCHASRBridgeContext *)self->_asrBridgeContext hash];
  unint64_t v7 = [(ORCHSchemaORCHCDMBridgeContext *)self->_cdmBridgeContext hash];
  unint64_t v8 = v7 ^ [(ORCHSchemaORCHExecutionBridgeContext *)self->_executionBridgeContext hash];
  unint64_t v9 = v6 ^ v8 ^ [(ORCHSchemaORCHServerFallbackContext *)self->_serverFallbackContext hash];
  unint64_t v10 = [(ORCHSchemaORCHFlowOutputSubmitted *)self->_flowOutputSubmitted hash];
  unint64_t v11 = v10 ^ [(ORCHSchemaORCHResultCandidateReceived *)self->_resultCandidate hash];
  unint64_t v12 = v11 ^ [(ORCHSchemaORCHResultSelected *)self->_resultSelected hash];
  unint64_t v13 = v9 ^ v12 ^ [(ORCHSchemaORCHConversationContextSubmitted *)self->_contextSubmissionMessage hash];
  unint64_t v14 = [(ORCHSchemaORCHAssetsReported *)self->_availableAssets hash];
  unint64_t v15 = v14 ^ [(ORCHSchemaORCHDeviceDynamicContext *)self->_orchDeviceDynamicContext hash];
  unint64_t v16 = v15 ^ [(ORCHSchemaORCHPommesBridgeContext *)self->_pommesBridgeContext hash];
  unint64_t v17 = v16 ^ [(ORCHSchemaORCHMUXBridgeContext *)self->_muxBridgeContext hash];
  unint64_t v18 = v13 ^ v17 ^ [(ORCHSchemaORCHMultiUserResultCandidateReceived *)self->_multiUserResultCandidate hash];
  unint64_t v19 = [(ORCHSchemaORCHMultiUserResultCandidateSelected *)self->_multiUserResultSelected hash];
  unint64_t v20 = v19 ^ [(ORCHSchemaORCHAceCommandContext *)self->_aceCommandContext hash];
  unint64_t v21 = v20 ^ [(ORCHSchemaORCHTRPFinalized *)self->_trpFinalized hash];
  unint64_t v22 = v21 ^ [(ORCHSchemaORCHRequestMitigated *)self->_requestMitigated hash];
  unint64_t v23 = v22 ^ [(ORCHSchemaORCHNLV3ServerFallbackDeprecated *)self->_nlv3ServerFallbackDeprecated hash];
  unint64_t v24 = v18 ^ v23 ^ [(ORCHSchemaORCHUIActivationContext *)self->_uiActivationContext hash];
  unint64_t v25 = [(ORCHSchemaORCHTRPCandidateReceived *)self->_trpCandidateReceived hash];
  unint64_t v26 = v25 ^ [(ORCHSchemaORCHIdentityBridgeRequestContext *)self->_identityBridgeRequestContext hash];
  unint64_t v27 = v26 ^ [(ORCHSchemaORCHAssetSetsReported *)self->_assetSetsReported hash];
  unint64_t v28 = v27 ^ [(ORCHSchemaORCHCandidateRequestContext *)self->_candidateRequestContext hash];
  unint64_t v29 = v28 ^ [(ORCHSchemaORCHPowerContextPolicyReported *)self->_powerContextPolicyReported hash];
  unint64_t v30 = v29 ^ [(ORCHSchemaORCHExecuteOnRemoteRequestContext *)self->_executeOnRemoteRequestContext hash];
  unint64_t v31 = v24 ^ v30 ^ [(ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *)self->_assistantdLaunchMetadataReported hash];
  unint64_t v32 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self->_intelligenceFlowQuerySent hash];
  unint64_t v33 = v32 ^ [(ORCHSchemaORCHSubRequestContext *)self->_subRequestContext hash];
  unint64_t v34 = v33 ^ [(ORCHSchemaNLRouterRewrittenUtteranceTier1 *)self->_routerRewrittenUtterance hash];
  unint64_t v35 = v34 ^ [(ORCHSchemaORCHNLRouterBridgeContext *)self->_nlRouterBridgeContext hash];
  unint64_t v36 = v35 ^ [(ORCHSchemaORCHShimToolContext *)self->_shimToolContext hash];
  unint64_t v37 = v36 ^ [(ORCHSchemaORCHIntelligenceFlowSubRequestFallback *)self->_subRequestFallback hash];
  unint64_t v38 = v37 ^ [(ORCHSchemaORCHNLRouterBridgeSubComponentContext *)self->_nlRouterBridgeSubComponentContext hash];
  unint64_t v39 = v31 ^ v38 ^ [(ORCHSchemaORCHUnsupportedLanguageDetected *)self->_unsupportedLanguageDetected hash];
  return v39 ^ [(ORCHSchemaORCHTRPCandidateCreated *)self->_trpCandidateCreated hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_193;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_193;
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v8 = [(ORCHSchemaORCHClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(ORCHSchemaORCHClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self resourceUtilizationMetadata];
  unint64_t v7 = [v4 resourceUtilizationMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v13 = [(ORCHSchemaORCHClientEvent *)self resourceUtilizationMetadata];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(ORCHSchemaORCHClientEvent *)self resourceUtilizationMetadata];
    unint64_t v16 = [v4 resourceUtilizationMetadata];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self requestContext];
  unint64_t v7 = [v4 requestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v18 = [(ORCHSchemaORCHClientEvent *)self requestContext];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    unint64_t v20 = [(ORCHSchemaORCHClientEvent *)self requestContext];
    unint64_t v21 = [v4 requestContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self asrBridgeContext];
  unint64_t v7 = [v4 asrBridgeContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v23 = [(ORCHSchemaORCHClientEvent *)self asrBridgeContext];
  if (v23)
  {
    unint64_t v24 = (void *)v23;
    unint64_t v25 = [(ORCHSchemaORCHClientEvent *)self asrBridgeContext];
    unint64_t v26 = [v4 asrBridgeContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self cdmBridgeContext];
  unint64_t v7 = [v4 cdmBridgeContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v28 = [(ORCHSchemaORCHClientEvent *)self cdmBridgeContext];
  if (v28)
  {
    unint64_t v29 = (void *)v28;
    unint64_t v30 = [(ORCHSchemaORCHClientEvent *)self cdmBridgeContext];
    unint64_t v31 = [v4 cdmBridgeContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self executionBridgeContext];
  unint64_t v7 = [v4 executionBridgeContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v33 = [(ORCHSchemaORCHClientEvent *)self executionBridgeContext];
  if (v33)
  {
    unint64_t v34 = (void *)v33;
    unint64_t v35 = [(ORCHSchemaORCHClientEvent *)self executionBridgeContext];
    unint64_t v36 = [v4 executionBridgeContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self serverFallbackContext];
  unint64_t v7 = [v4 serverFallbackContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v38 = [(ORCHSchemaORCHClientEvent *)self serverFallbackContext];
  if (v38)
  {
    unint64_t v39 = (void *)v38;
    uint64_t v40 = [(ORCHSchemaORCHClientEvent *)self serverFallbackContext];
    int v41 = [v4 serverFallbackContext];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self flowOutputSubmitted];
  unint64_t v7 = [v4 flowOutputSubmitted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v43 = [(ORCHSchemaORCHClientEvent *)self flowOutputSubmitted];
  if (v43)
  {
    uint64_t v44 = (void *)v43;
    v45 = [(ORCHSchemaORCHClientEvent *)self flowOutputSubmitted];
    uint64_t v46 = [v4 flowOutputSubmitted];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self resultCandidate];
  unint64_t v7 = [v4 resultCandidate];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v48 = [(ORCHSchemaORCHClientEvent *)self resultCandidate];
  if (v48)
  {
    v49 = (void *)v48;
    uint64_t v50 = [(ORCHSchemaORCHClientEvent *)self resultCandidate];
    v51 = [v4 resultCandidate];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self resultSelected];
  unint64_t v7 = [v4 resultSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v53 = [(ORCHSchemaORCHClientEvent *)self resultSelected];
  if (v53)
  {
    uint64_t v54 = (void *)v53;
    v55 = [(ORCHSchemaORCHClientEvent *)self resultSelected];
    uint64_t v56 = [v4 resultSelected];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self contextSubmissionMessage];
  unint64_t v7 = [v4 contextSubmissionMessage];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v58 = [(ORCHSchemaORCHClientEvent *)self contextSubmissionMessage];
  if (v58)
  {
    int v59 = (void *)v58;
    uint64_t v60 = [(ORCHSchemaORCHClientEvent *)self contextSubmissionMessage];
    v61 = [v4 contextSubmissionMessage];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self availableAssets];
  unint64_t v7 = [v4 availableAssets];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v63 = [(ORCHSchemaORCHClientEvent *)self availableAssets];
  if (v63)
  {
    uint64_t v64 = (void *)v63;
    int v65 = [(ORCHSchemaORCHClientEvent *)self availableAssets];
    uint64_t v66 = [v4 availableAssets];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self orchDeviceDynamicContext];
  unint64_t v7 = [v4 orchDeviceDynamicContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v68 = [(ORCHSchemaORCHClientEvent *)self orchDeviceDynamicContext];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(ORCHSchemaORCHClientEvent *)self orchDeviceDynamicContext];
    int v71 = [v4 orchDeviceDynamicContext];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self pommesBridgeContext];
  unint64_t v7 = [v4 pommesBridgeContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v73 = [(ORCHSchemaORCHClientEvent *)self pommesBridgeContext];
  if (v73)
  {
    int v74 = (void *)v73;
    v75 = [(ORCHSchemaORCHClientEvent *)self pommesBridgeContext];
    v76 = [v4 pommesBridgeContext];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self muxBridgeContext];
  unint64_t v7 = [v4 muxBridgeContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v78 = [(ORCHSchemaORCHClientEvent *)self muxBridgeContext];
  if (v78)
  {
    v79 = (void *)v78;
    int v80 = [(ORCHSchemaORCHClientEvent *)self muxBridgeContext];
    v81 = [v4 muxBridgeContext];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self multiUserResultCandidate];
  unint64_t v7 = [v4 multiUserResultCandidate];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v83 = [(ORCHSchemaORCHClientEvent *)self multiUserResultCandidate];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(ORCHSchemaORCHClientEvent *)self multiUserResultCandidate];
    int v86 = [v4 multiUserResultCandidate];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self multiUserResultSelected];
  unint64_t v7 = [v4 multiUserResultSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v88 = [(ORCHSchemaORCHClientEvent *)self multiUserResultSelected];
  if (v88)
  {
    int v89 = (void *)v88;
    v90 = [(ORCHSchemaORCHClientEvent *)self multiUserResultSelected];
    v91 = [v4 multiUserResultSelected];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self aceCommandContext];
  unint64_t v7 = [v4 aceCommandContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v93 = [(ORCHSchemaORCHClientEvent *)self aceCommandContext];
  if (v93)
  {
    v94 = (void *)v93;
    int v95 = [(ORCHSchemaORCHClientEvent *)self aceCommandContext];
    v96 = [v4 aceCommandContext];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self trpFinalized];
  unint64_t v7 = [v4 trpFinalized];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v98 = [(ORCHSchemaORCHClientEvent *)self trpFinalized];
  if (v98)
  {
    v99 = (void *)v98;
    v100 = [(ORCHSchemaORCHClientEvent *)self trpFinalized];
    int v101 = [v4 trpFinalized];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self requestMitigated];
  unint64_t v7 = [v4 requestMitigated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v103 = [(ORCHSchemaORCHClientEvent *)self requestMitigated];
  if (v103)
  {
    int v104 = (void *)v103;
    v105 = [(ORCHSchemaORCHClientEvent *)self requestMitigated];
    v106 = [v4 requestMitigated];
    int v107 = [v105 isEqual:v106];

    if (!v107) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self nlv3ServerFallbackDeprecated];
  unint64_t v7 = [v4 nlv3ServerFallbackDeprecated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v108 = [(ORCHSchemaORCHClientEvent *)self nlv3ServerFallbackDeprecated];
  if (v108)
  {
    v109 = (void *)v108;
    int v110 = [(ORCHSchemaORCHClientEvent *)self nlv3ServerFallbackDeprecated];
    v111 = [v4 nlv3ServerFallbackDeprecated];
    int v112 = [v110 isEqual:v111];

    if (!v112) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self uiActivationContext];
  unint64_t v7 = [v4 uiActivationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v113 = [(ORCHSchemaORCHClientEvent *)self uiActivationContext];
  if (v113)
  {
    v114 = (void *)v113;
    objc_super v115 = [(ORCHSchemaORCHClientEvent *)self uiActivationContext];
    int v116 = [v4 uiActivationContext];
    int v117 = [v115 isEqual:v116];

    if (!v117) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self trpCandidateReceived];
  unint64_t v7 = [v4 trpCandidateReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v118 = [(ORCHSchemaORCHClientEvent *)self trpCandidateReceived];
  if (v118)
  {
    int v119 = (void *)v118;
    id v120 = [(ORCHSchemaORCHClientEvent *)self trpCandidateReceived];
    v121 = [v4 trpCandidateReceived];
    int v122 = [v120 isEqual:v121];

    if (!v122) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self identityBridgeRequestContext];
  unint64_t v7 = [v4 identityBridgeRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v123 = [(ORCHSchemaORCHClientEvent *)self identityBridgeRequestContext];
  if (v123)
  {
    v124 = (void *)v123;
    v125 = [(ORCHSchemaORCHClientEvent *)self identityBridgeRequestContext];
    v126 = [v4 identityBridgeRequestContext];
    int v127 = [v125 isEqual:v126];

    if (!v127) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self assetSetsReported];
  unint64_t v7 = [v4 assetSetsReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v128 = [(ORCHSchemaORCHClientEvent *)self assetSetsReported];
  if (v128)
  {
    v129 = (void *)v128;
    v130 = [(ORCHSchemaORCHClientEvent *)self assetSetsReported];
    v131 = [v4 assetSetsReported];
    int v132 = [v130 isEqual:v131];

    if (!v132) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self candidateRequestContext];
  unint64_t v7 = [v4 candidateRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v133 = [(ORCHSchemaORCHClientEvent *)self candidateRequestContext];
  if (v133)
  {
    v134 = (void *)v133;
    v135 = [(ORCHSchemaORCHClientEvent *)self candidateRequestContext];
    v136 = [v4 candidateRequestContext];
    int v137 = [v135 isEqual:v136];

    if (!v137) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self powerContextPolicyReported];
  unint64_t v7 = [v4 powerContextPolicyReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v138 = [(ORCHSchemaORCHClientEvent *)self powerContextPolicyReported];
  if (v138)
  {
    v139 = (void *)v138;
    v140 = [(ORCHSchemaORCHClientEvent *)self powerContextPolicyReported];
    v141 = [v4 powerContextPolicyReported];
    int v142 = [v140 isEqual:v141];

    if (!v142) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self executeOnRemoteRequestContext];
  unint64_t v7 = [v4 executeOnRemoteRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v143 = [(ORCHSchemaORCHClientEvent *)self executeOnRemoteRequestContext];
  if (v143)
  {
    v144 = (void *)v143;
    v145 = [(ORCHSchemaORCHClientEvent *)self executeOnRemoteRequestContext];
    v146 = [v4 executeOnRemoteRequestContext];
    int v147 = [v145 isEqual:v146];

    if (!v147) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self assistantdLaunchMetadataReported];
  unint64_t v7 = [v4 assistantdLaunchMetadataReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v148 = [(ORCHSchemaORCHClientEvent *)self assistantdLaunchMetadataReported];
  if (v148)
  {
    v149 = (void *)v148;
    v150 = [(ORCHSchemaORCHClientEvent *)self assistantdLaunchMetadataReported];
    v151 = [v4 assistantdLaunchMetadataReported];
    int v152 = [v150 isEqual:v151];

    if (!v152) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self intelligenceFlowQuerySent];
  unint64_t v7 = [v4 intelligenceFlowQuerySent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v153 = [(ORCHSchemaORCHClientEvent *)self intelligenceFlowQuerySent];
  if (v153)
  {
    v154 = (void *)v153;
    v155 = [(ORCHSchemaORCHClientEvent *)self intelligenceFlowQuerySent];
    v156 = [v4 intelligenceFlowQuerySent];
    int v157 = [v155 isEqual:v156];

    if (!v157) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self subRequestContext];
  unint64_t v7 = [v4 subRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v158 = [(ORCHSchemaORCHClientEvent *)self subRequestContext];
  if (v158)
  {
    v159 = (void *)v158;
    v160 = [(ORCHSchemaORCHClientEvent *)self subRequestContext];
    v161 = [v4 subRequestContext];
    int v162 = [v160 isEqual:v161];

    if (!v162) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self routerRewrittenUtterance];
  unint64_t v7 = [v4 routerRewrittenUtterance];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v163 = [(ORCHSchemaORCHClientEvent *)self routerRewrittenUtterance];
  if (v163)
  {
    v164 = (void *)v163;
    v165 = [(ORCHSchemaORCHClientEvent *)self routerRewrittenUtterance];
    v166 = [v4 routerRewrittenUtterance];
    int v167 = [v165 isEqual:v166];

    if (!v167) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeContext];
  unint64_t v7 = [v4 nlRouterBridgeContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v168 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeContext];
  if (v168)
  {
    v169 = (void *)v168;
    v170 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeContext];
    v171 = [v4 nlRouterBridgeContext];
    int v172 = [v170 isEqual:v171];

    if (!v172) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self shimToolContext];
  unint64_t v7 = [v4 shimToolContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v173 = [(ORCHSchemaORCHClientEvent *)self shimToolContext];
  if (v173)
  {
    v174 = (void *)v173;
    v175 = [(ORCHSchemaORCHClientEvent *)self shimToolContext];
    v176 = [v4 shimToolContext];
    int v177 = [v175 isEqual:v176];

    if (!v177) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self subRequestFallback];
  unint64_t v7 = [v4 subRequestFallback];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v178 = [(ORCHSchemaORCHClientEvent *)self subRequestFallback];
  if (v178)
  {
    v179 = (void *)v178;
    v180 = [(ORCHSchemaORCHClientEvent *)self subRequestFallback];
    v181 = [v4 subRequestFallback];
    int v182 = [v180 isEqual:v181];

    if (!v182) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeSubComponentContext];
  unint64_t v7 = [v4 nlRouterBridgeSubComponentContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v183 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeSubComponentContext];
  if (v183)
  {
    v184 = (void *)v183;
    v185 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeSubComponentContext];
    v186 = [v4 nlRouterBridgeSubComponentContext];
    int v187 = [v185 isEqual:v186];

    if (!v187) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self unsupportedLanguageDetected];
  unint64_t v7 = [v4 unsupportedLanguageDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_192;
  }
  uint64_t v188 = [(ORCHSchemaORCHClientEvent *)self unsupportedLanguageDetected];
  if (v188)
  {
    v189 = (void *)v188;
    v190 = [(ORCHSchemaORCHClientEvent *)self unsupportedLanguageDetected];
    v191 = [v4 unsupportedLanguageDetected];
    int v192 = [v190 isEqual:v191];

    if (!v192) {
      goto LABEL_193;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self trpCandidateCreated];
  unint64_t v7 = [v4 trpCandidateCreated];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v193 = [(ORCHSchemaORCHClientEvent *)self trpCandidateCreated];
    if (!v193)
    {

LABEL_196:
      BOOL v198 = 1;
      goto LABEL_194;
    }
    v194 = (void *)v193;
    v195 = [(ORCHSchemaORCHClientEvent *)self trpCandidateCreated];
    v196 = [v4 trpCandidateCreated];
    char v197 = [v195 isEqual:v196];

    if (v197) {
      goto LABEL_196;
    }
  }
  else
  {
LABEL_192:
  }
LABEL_193:
  BOOL v198 = 0;
LABEL_194:

  return v198;
}

- (void)writeTo:(id)a3
{
  id v80 = a3;
  id v4 = [(ORCHSchemaORCHClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(ORCHSchemaORCHClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(ORCHSchemaORCHClientEvent *)self resourceUtilizationMetadata];

  if (v6)
  {
    unint64_t v7 = [(ORCHSchemaORCHClientEvent *)self resourceUtilizationMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(ORCHSchemaORCHClientEvent *)self requestContext];

  if (v8)
  {
    unint64_t v9 = [(ORCHSchemaORCHClientEvent *)self requestContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(ORCHSchemaORCHClientEvent *)self asrBridgeContext];

  if (v10)
  {
    unint64_t v11 = [(ORCHSchemaORCHClientEvent *)self asrBridgeContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(ORCHSchemaORCHClientEvent *)self cdmBridgeContext];

  if (v12)
  {
    uint64_t v13 = [(ORCHSchemaORCHClientEvent *)self cdmBridgeContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(ORCHSchemaORCHClientEvent *)self executionBridgeContext];

  if (v14)
  {
    unint64_t v15 = [(ORCHSchemaORCHClientEvent *)self executionBridgeContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(ORCHSchemaORCHClientEvent *)self serverFallbackContext];

  if (v16)
  {
    int v17 = [(ORCHSchemaORCHClientEvent *)self serverFallbackContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(ORCHSchemaORCHClientEvent *)self flowOutputSubmitted];

  if (v18)
  {
    unint64_t v19 = [(ORCHSchemaORCHClientEvent *)self flowOutputSubmitted];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v20 = [(ORCHSchemaORCHClientEvent *)self resultCandidate];

  if (v20)
  {
    unint64_t v21 = [(ORCHSchemaORCHClientEvent *)self resultCandidate];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(ORCHSchemaORCHClientEvent *)self resultSelected];

  if (v22)
  {
    uint64_t v23 = [(ORCHSchemaORCHClientEvent *)self resultSelected];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v24 = [(ORCHSchemaORCHClientEvent *)self contextSubmissionMessage];

  if (v24)
  {
    unint64_t v25 = [(ORCHSchemaORCHClientEvent *)self contextSubmissionMessage];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v26 = [(ORCHSchemaORCHClientEvent *)self availableAssets];

  if (v26)
  {
    int v27 = [(ORCHSchemaORCHClientEvent *)self availableAssets];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(ORCHSchemaORCHClientEvent *)self orchDeviceDynamicContext];

  if (v28)
  {
    unint64_t v29 = [(ORCHSchemaORCHClientEvent *)self orchDeviceDynamicContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v30 = [(ORCHSchemaORCHClientEvent *)self pommesBridgeContext];

  if (v30)
  {
    unint64_t v31 = [(ORCHSchemaORCHClientEvent *)self pommesBridgeContext];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(ORCHSchemaORCHClientEvent *)self muxBridgeContext];

  if (v32)
  {
    uint64_t v33 = [(ORCHSchemaORCHClientEvent *)self muxBridgeContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v34 = [(ORCHSchemaORCHClientEvent *)self multiUserResultCandidate];

  if (v34)
  {
    unint64_t v35 = [(ORCHSchemaORCHClientEvent *)self multiUserResultCandidate];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v36 = [(ORCHSchemaORCHClientEvent *)self multiUserResultSelected];

  if (v36)
  {
    int v37 = [(ORCHSchemaORCHClientEvent *)self multiUserResultSelected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(ORCHSchemaORCHClientEvent *)self aceCommandContext];

  if (v38)
  {
    unint64_t v39 = [(ORCHSchemaORCHClientEvent *)self aceCommandContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v40 = [(ORCHSchemaORCHClientEvent *)self trpFinalized];

  if (v40)
  {
    int v41 = [(ORCHSchemaORCHClientEvent *)self trpFinalized];
    PBDataWriterWriteSubmessage();
  }
  int v42 = [(ORCHSchemaORCHClientEvent *)self requestMitigated];

  if (v42)
  {
    uint64_t v43 = [(ORCHSchemaORCHClientEvent *)self requestMitigated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v44 = [(ORCHSchemaORCHClientEvent *)self nlv3ServerFallbackDeprecated];

  if (v44)
  {
    v45 = [(ORCHSchemaORCHClientEvent *)self nlv3ServerFallbackDeprecated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v46 = [(ORCHSchemaORCHClientEvent *)self uiActivationContext];

  if (v46)
  {
    int v47 = [(ORCHSchemaORCHClientEvent *)self uiActivationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v48 = [(ORCHSchemaORCHClientEvent *)self trpCandidateReceived];

  if (v48)
  {
    v49 = [(ORCHSchemaORCHClientEvent *)self trpCandidateReceived];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v50 = [(ORCHSchemaORCHClientEvent *)self identityBridgeRequestContext];

  if (v50)
  {
    v51 = [(ORCHSchemaORCHClientEvent *)self identityBridgeRequestContext];
    PBDataWriterWriteSubmessage();
  }
  int v52 = [(ORCHSchemaORCHClientEvent *)self assetSetsReported];

  if (v52)
  {
    uint64_t v53 = [(ORCHSchemaORCHClientEvent *)self assetSetsReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v54 = [(ORCHSchemaORCHClientEvent *)self candidateRequestContext];

  if (v54)
  {
    v55 = [(ORCHSchemaORCHClientEvent *)self candidateRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v56 = [(ORCHSchemaORCHClientEvent *)self powerContextPolicyReported];

  if (v56)
  {
    int v57 = [(ORCHSchemaORCHClientEvent *)self powerContextPolicyReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v58 = [(ORCHSchemaORCHClientEvent *)self executeOnRemoteRequestContext];

  if (v58)
  {
    int v59 = [(ORCHSchemaORCHClientEvent *)self executeOnRemoteRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v60 = [(ORCHSchemaORCHClientEvent *)self assistantdLaunchMetadataReported];

  if (v60)
  {
    v61 = [(ORCHSchemaORCHClientEvent *)self assistantdLaunchMetadataReported];
    PBDataWriterWriteSubmessage();
  }
  int v62 = [(ORCHSchemaORCHClientEvent *)self intelligenceFlowQuerySent];

  if (v62)
  {
    uint64_t v63 = [(ORCHSchemaORCHClientEvent *)self intelligenceFlowQuerySent];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v64 = [(ORCHSchemaORCHClientEvent *)self subRequestContext];

  if (v64)
  {
    int v65 = [(ORCHSchemaORCHClientEvent *)self subRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v66 = [(ORCHSchemaORCHClientEvent *)self routerRewrittenUtterance];

  if (v66)
  {
    int v67 = [(ORCHSchemaORCHClientEvent *)self routerRewrittenUtterance];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v68 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeContext];

  if (v68)
  {
    v69 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeContext];
    PBDataWriterWriteSubmessage();
  }
  v70 = [(ORCHSchemaORCHClientEvent *)self shimToolContext];

  if (v70)
  {
    int v71 = [(ORCHSchemaORCHClientEvent *)self shimToolContext];
    PBDataWriterWriteSubmessage();
  }
  int v72 = [(ORCHSchemaORCHClientEvent *)self subRequestFallback];

  if (v72)
  {
    uint64_t v73 = [(ORCHSchemaORCHClientEvent *)self subRequestFallback];
    PBDataWriterWriteSubmessage();
  }
  int v74 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeSubComponentContext];

  if (v74)
  {
    v75 = [(ORCHSchemaORCHClientEvent *)self nlRouterBridgeSubComponentContext];
    PBDataWriterWriteSubmessage();
  }
  v76 = [(ORCHSchemaORCHClientEvent *)self unsupportedLanguageDetected];

  if (v76)
  {
    int v77 = [(ORCHSchemaORCHClientEvent *)self unsupportedLanguageDetected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v78 = [(ORCHSchemaORCHClientEvent *)self trpCandidateCreated];

  if (v78)
  {
    v79 = [(ORCHSchemaORCHClientEvent *)self trpCandidateCreated];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrpCandidateCreated
{
  if (self->_whichEvent_Type == 136)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_trpCandidateCreated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHTRPCandidateCreated)trpCandidateCreated
{
  if (self->_whichEvent_Type == 136) {
    v2 = self->_trpCandidateCreated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTrpCandidateCreated:(id)a3
{
  id v4 = (ORCHSchemaORCHTRPCandidateCreated *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  unint64_t v40 = 136;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = v4;
}

- (void)deleteUnsupportedLanguageDetected
{
  if (self->_whichEvent_Type == 135)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_unsupportedLanguageDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHUnsupportedLanguageDetected)unsupportedLanguageDetected
{
  if (self->_whichEvent_Type == 135) {
    v2 = self->_unsupportedLanguageDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUnsupportedLanguageDetected:(id)a3
{
  id v4 = (ORCHSchemaORCHUnsupportedLanguageDetected *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 135;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = v4;
}

- (void)deleteNlRouterBridgeSubComponentContext
{
  if (self->_whichEvent_Type == 134)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nlRouterBridgeSubComponentContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHNLRouterBridgeSubComponentContext)nlRouterBridgeSubComponentContext
{
  if (self->_whichEvent_Type == 134) {
    v2 = self->_nlRouterBridgeSubComponentContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlRouterBridgeSubComponentContext:(id)a3
{
  id v4 = (ORCHSchemaORCHNLRouterBridgeSubComponentContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 134;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = v4;
}

- (void)deleteSubRequestFallback
{
  if (self->_whichEvent_Type == 133)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_subRequestFallback = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHIntelligenceFlowSubRequestFallback)subRequestFallback
{
  if (self->_whichEvent_Type == 133) {
    v2 = self->_subRequestFallback;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSubRequestFallback:(id)a3
{
  id v4 = (ORCHSchemaORCHIntelligenceFlowSubRequestFallback *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 133;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = v4;
}

- (void)deleteShimToolContext
{
  if (self->_whichEvent_Type == 132)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_shimToolContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHShimToolContext)shimToolContext
{
  if (self->_whichEvent_Type == 132) {
    v2 = self->_shimToolContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setShimToolContext:(id)a3
{
  id v4 = (ORCHSchemaORCHShimToolContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 132;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = v4;
}

- (void)deleteNlRouterBridgeContext
{
  if (self->_whichEvent_Type == 131)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nlRouterBridgeContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHNLRouterBridgeContext)nlRouterBridgeContext
{
  if (self->_whichEvent_Type == 131) {
    v2 = self->_nlRouterBridgeContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlRouterBridgeContext:(id)a3
{
  id v4 = (ORCHSchemaORCHNLRouterBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 131;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = v4;
}

- (void)deleteRouterRewrittenUtterance
{
  if (self->_whichEvent_Type == 130)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_routerRewrittenUtterance = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaNLRouterRewrittenUtteranceTier1)routerRewrittenUtterance
{
  if (self->_whichEvent_Type == 130) {
    v2 = self->_routerRewrittenUtterance;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRouterRewrittenUtterance:(id)a3
{
  id v4 = (ORCHSchemaNLRouterRewrittenUtteranceTier1 *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 130;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = v4;
}

- (void)deleteSubRequestContext
{
  if (self->_whichEvent_Type == 129)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_subRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHSubRequestContext)subRequestContext
{
  if (self->_whichEvent_Type == 129) {
    v2 = self->_subRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSubRequestContext:(id)a3
{
  id v4 = (ORCHSchemaORCHSubRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 129;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = v4;
}

- (void)deleteIntelligenceFlowQuerySent
{
  if (self->_whichEvent_Type == 128)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_intelligenceFlowQuerySent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHIntelligenceFlowQuerySent)intelligenceFlowQuerySent
{
  if (self->_whichEvent_Type == 128) {
    v2 = self->_intelligenceFlowQuerySent;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIntelligenceFlowQuerySent:(id)a3
{
  id v4 = (ORCHSchemaORCHIntelligenceFlowQuerySent *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  self->_unint64_t whichEvent_Type = (unint64_t)(v4 != 0) << 7;
  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = v4;
}

- (void)deleteAssistantdLaunchMetadataReported
{
  if (self->_whichEvent_Type == 127)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantdLaunchMetadataReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported)assistantdLaunchMetadataReported
{
  if (self->_whichEvent_Type == 127) {
    v2 = self->_assistantdLaunchMetadataReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantdLaunchMetadataReported:(id)a3
{
  id v4 = (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 127;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = v4;
}

- (void)deleteExecuteOnRemoteRequestContext
{
  if (self->_whichEvent_Type == 126)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_executeOnRemoteRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHExecuteOnRemoteRequestContext)executeOnRemoteRequestContext
{
  if (self->_whichEvent_Type == 126) {
    v2 = self->_executeOnRemoteRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setExecuteOnRemoteRequestContext:(id)a3
{
  id v4 = (ORCHSchemaORCHExecuteOnRemoteRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 126;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = v4;
}

- (void)deletePowerContextPolicyReported
{
  if (self->_whichEvent_Type == 125)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_powerContextPolicyReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHPowerContextPolicyReported)powerContextPolicyReported
{
  if (self->_whichEvent_Type == 125) {
    v2 = self->_powerContextPolicyReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPowerContextPolicyReported:(id)a3
{
  id v4 = (ORCHSchemaORCHPowerContextPolicyReported *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 125;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = v4;
}

- (void)deleteCandidateRequestContext
{
  if (self->_whichEvent_Type == 124)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_candidateRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHCandidateRequestContext)candidateRequestContext
{
  if (self->_whichEvent_Type == 124) {
    v2 = self->_candidateRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCandidateRequestContext:(id)a3
{
  id v4 = (ORCHSchemaORCHCandidateRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 124;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = v4;
}

- (void)deleteAssetSetsReported
{
  if (self->_whichEvent_Type == 123)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assetSetsReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHAssetSetsReported)assetSetsReported
{
  if (self->_whichEvent_Type == 123) {
    v2 = self->_assetSetsReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssetSetsReported:(id)a3
{
  id v4 = (ORCHSchemaORCHAssetSetsReported *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 123;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = v4;
}

- (void)deleteIdentityBridgeRequestContext
{
  if (self->_whichEvent_Type == 122)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_identityBridgeRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHIdentityBridgeRequestContext)identityBridgeRequestContext
{
  if (self->_whichEvent_Type == 122) {
    v2 = self->_identityBridgeRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIdentityBridgeRequestContext:(id)a3
{
  id v4 = (ORCHSchemaORCHIdentityBridgeRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 122;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = v4;
}

- (void)deleteTrpCandidateReceived
{
  if (self->_whichEvent_Type == 121)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_trpCandidateReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHTRPCandidateReceived)trpCandidateReceived
{
  if (self->_whichEvent_Type == 121) {
    v2 = self->_trpCandidateReceived;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTrpCandidateReceived:(id)a3
{
  id v4 = (ORCHSchemaORCHTRPCandidateReceived *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 121;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = v4;
}

- (void)deleteUiActivationContext
{
  if (self->_whichEvent_Type == 120)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uiActivationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHUIActivationContext)uiActivationContext
{
  if (self->_whichEvent_Type == 120) {
    v2 = self->_uiActivationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUiActivationContext:(id)a3
{
  id v4 = (ORCHSchemaORCHUIActivationContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 120;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = v4;
}

- (void)deleteNlv3ServerFallbackDeprecated
{
  if (self->_whichEvent_Type == 119)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nlv3ServerFallbackDeprecated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHNLV3ServerFallbackDeprecated)nlv3ServerFallbackDeprecated
{
  if (self->_whichEvent_Type == 119) {
    v2 = self->_nlv3ServerFallbackDeprecated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNlv3ServerFallbackDeprecated:(id)a3
{
  id v4 = (ORCHSchemaORCHNLV3ServerFallbackDeprecated *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 119;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = v4;
}

- (void)deleteRequestMitigated
{
  if (self->_whichEvent_Type == 118)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestMitigated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHRequestMitigated)requestMitigated
{
  if (self->_whichEvent_Type == 118) {
    v2 = self->_requestMitigated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestMitigated:(id)a3
{
  id v4 = (ORCHSchemaORCHRequestMitigated *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 118;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = v4;
}

- (void)deleteTrpFinalized
{
  if (self->_whichEvent_Type == 117)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_trpFinalized = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHTRPFinalized)trpFinalized
{
  if (self->_whichEvent_Type == 117) {
    v2 = self->_trpFinalized;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTrpFinalized:(id)a3
{
  id v4 = (ORCHSchemaORCHTRPFinalized *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 117;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = v4;
}

- (void)deleteAceCommandContext
{
  if (self->_whichEvent_Type == 116)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_aceCommandContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHAceCommandContext)aceCommandContext
{
  if (self->_whichEvent_Type == 116) {
    v2 = self->_aceCommandContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAceCommandContext:(id)a3
{
  id v4 = (ORCHSchemaORCHAceCommandContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 116;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = v4;
}

- (void)deleteMultiUserResultSelected
{
  if (self->_whichEvent_Type == 115)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_multiUserResultSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHMultiUserResultCandidateSelected)multiUserResultSelected
{
  if (self->_whichEvent_Type == 115) {
    v2 = self->_multiUserResultSelected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMultiUserResultSelected:(id)a3
{
  id v4 = (ORCHSchemaORCHMultiUserResultCandidateSelected *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 115;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = v4;
}

- (void)deleteMultiUserResultCandidate
{
  if (self->_whichEvent_Type == 114)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_multiUserResultCandidate = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHMultiUserResultCandidateReceived)multiUserResultCandidate
{
  if (self->_whichEvent_Type == 114) {
    v2 = self->_multiUserResultCandidate;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMultiUserResultCandidate:(id)a3
{
  id v4 = (ORCHSchemaORCHMultiUserResultCandidateReceived *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 114;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = v4;
}

- (void)deleteMuxBridgeContext
{
  if (self->_whichEvent_Type == 113)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_muxBridgeContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHMUXBridgeContext)muxBridgeContext
{
  if (self->_whichEvent_Type == 113) {
    v2 = self->_muxBridgeContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMuxBridgeContext:(id)a3
{
  id v4 = (ORCHSchemaORCHMUXBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 113;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = v4;
}

- (void)deletePommesBridgeContext
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pommesBridgeContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHPommesBridgeContext)pommesBridgeContext
{
  if (self->_whichEvent_Type == 112) {
    v2 = self->_pommesBridgeContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPommesBridgeContext:(id)a3
{
  id v4 = (ORCHSchemaORCHPommesBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 112;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = v4;
}

- (void)deleteOrchDeviceDynamicContext
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_orchDeviceDynamicContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHDeviceDynamicContext)orchDeviceDynamicContext
{
  if (self->_whichEvent_Type == 111) {
    v2 = self->_orchDeviceDynamicContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOrchDeviceDynamicContext:(id)a3
{
  id v4 = (ORCHSchemaORCHDeviceDynamicContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 111;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = v4;
}

- (void)deleteAvailableAssets
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_availableAssets = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHAssetsReported)availableAssets
{
  if (self->_whichEvent_Type == 110) {
    v2 = self->_availableAssets;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAvailableAssets:(id)a3
{
  id v4 = (ORCHSchemaORCHAssetsReported *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 110;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  availableAssets = self->_availableAssets;
  self->_availableAssets = v4;
}

- (void)deleteContextSubmissionMessage
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contextSubmissionMessage = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHConversationContextSubmitted)contextSubmissionMessage
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_contextSubmissionMessage;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContextSubmissionMessage:(id)a3
{
  id v4 = (ORCHSchemaORCHConversationContextSubmitted *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 109;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = v4;
}

- (void)deleteResultSelected
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_resultSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHResultSelected)resultSelected
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_resultSelected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setResultSelected:(id)a3
{
  id v4 = (ORCHSchemaORCHResultSelected *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 108;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  resultSelected = self->_resultSelected;
  self->_resultSelected = v4;
}

- (void)deleteResultCandidate
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_resultCandidate = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHResultCandidateReceived)resultCandidate
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_resultCandidate;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setResultCandidate:(id)a3
{
  id v4 = (ORCHSchemaORCHResultCandidateReceived *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 107;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = v4;
}

- (void)deleteFlowOutputSubmitted
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_flowOutputSubmitted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHFlowOutputSubmitted)flowOutputSubmitted
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_flowOutputSubmitted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFlowOutputSubmitted:(id)a3
{
  id v4 = (ORCHSchemaORCHFlowOutputSubmitted *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 106;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = v4;
}

- (void)deleteServerFallbackContext
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_serverFallbackContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHServerFallbackContext)serverFallbackContext
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_serverFallbackContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setServerFallbackContext:(id)a3
{
  id v4 = (ORCHSchemaORCHServerFallbackContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 105;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = v4;
}

- (void)deleteExecutionBridgeContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_executionBridgeContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHExecutionBridgeContext)executionBridgeContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_executionBridgeContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setExecutionBridgeContext:(id)a3
{
  id v4 = (ORCHSchemaORCHExecutionBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 104;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = v4;
}

- (void)deleteCdmBridgeContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_cdmBridgeContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHCDMBridgeContext)cdmBridgeContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_cdmBridgeContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCdmBridgeContext:(id)a3
{
  id v4 = (ORCHSchemaORCHCDMBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 103;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = v4;
}

- (void)deleteAsrBridgeContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_asrBridgeContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHASRBridgeContext)asrBridgeContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_asrBridgeContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAsrBridgeContext:(id)a3
{
  id v4 = (ORCHSchemaORCHASRBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 102;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = v4;
}

- (void)deleteRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHRequestContext)requestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_requestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestContext:(id)a3
{
  id v4 = (ORCHSchemaORCHRequestContext *)a3;
  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  trpCandidateCreated = self->_trpCandidateCreated;
  self->_trpCandidateCreated = 0;

  unint64_t v40 = 101;
  if (!v4) {
    unint64_t v40 = 0;
  }
  self->_unint64_t whichEvent_Type = v40;
  requestContext = self->_requestContext;
  self->_requestContext = v4;
}

- (void)deleteResourceUtilizationMetadata
{
}

- (BOOL)hasResourceUtilizationMetadata
{
  return self->_resourceUtilizationMetadata != 0;
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
  unint64_t v2 = [(ORCHSchemaORCHClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 0x23) {
    return @"com.apple.aiml.siri.orch.ORCHClientEvent";
  }
  else {
    return off_1E5EB3768[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 19;
}

@end