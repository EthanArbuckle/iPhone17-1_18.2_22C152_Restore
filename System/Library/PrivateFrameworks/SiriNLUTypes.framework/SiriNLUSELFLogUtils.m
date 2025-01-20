@interface SiriNLUSELFLogUtils
+ (BOOL)isLegacyNlContextPresent:(id)a3;
+ (BOOL)isNlContextPresent:(id)a3;
+ (id)convertAccepted:(id)a3;
+ (id)convertAcknowledged:(id)a3;
+ (id)convertCancelled:(id)a3;
+ (id)convertCorrectionOutcome:(id)a3;
+ (id)convertDelegated:(id)a3;
+ (id)convertGaveOptions:(id)a3;
+ (id)convertInformed:(id)a3;
+ (id)convertInternalSpanData:(id)a3;
+ (id)convertLegacyNLContext:(id)a3;
+ (id)convertLvcResult:(id)a3;
+ (id)convertMatchInfo:(id)a3;
+ (id)convertMatchingSpan:(id)a3;
+ (id)convertMatchingSpanTier1:(id)a3;
+ (id)convertMentionDetectorSpanData:(id)a3;
+ (id)convertMentionResolverSpanData:(id)a3;
+ (id)convertNLContext:(id)a3;
+ (id)convertNonTier1UsoGraph:(id)a3;
+ (id)convertNonTier1UsoGraph:(id)a3 identifiers:(id)a4 entitySpans:(id)a5;
+ (id)convertOffered:(id)a3;
+ (id)convertPLUMSpanData:(id)a3;
+ (id)convertParser:(id)a3;
+ (id)convertPrompted:(id)a3;
+ (id)convertReformedTurnInputBundle:(id)a3;
+ (id)convertRejected:(id)a3;
+ (id)convertRepetitionResult:(id)a3;
+ (id)convertReportedFailure:(id)a3;
+ (id)convertReportedSuccess:(id)a3;
+ (id)convertSiriVocabularySpanData:(id)a3;
+ (id)convertSystemDialogAct:(id)a3;
+ (id)convertTask:(id)a3;
+ (id)convertToken:(id)a3;
+ (id)convertTokenChain:(id)a3;
+ (id)convertTurnContext:(id)a3;
+ (id)convertTurnInput:(id)a3;
+ (id)convertUUID:(id)a3;
+ (id)convertUserDialogAct:(id)a3;
+ (id)convertUserParse:(id)a3;
+ (id)convertUserStatedTask:(id)a3;
+ (id)convertUsoEdge:(id)a3;
+ (id)convertUsoEntityIdentifier:(id)a3;
+ (id)convertUsoEntityIdentifier:(id)a3 index:(int64_t)a4;
+ (id)convertUsoEntityIdentifierTier1:(id)a3 index:(int64_t)a4;
+ (id)convertUsoEntitySpan:(id)a3;
+ (id)convertUsoEntitySpan:(id)a3 index:(int64_t)a4;
+ (id)convertUsoEntitySpanTier1:(id)a3 index:(int64_t)a4;
+ (id)convertUsoGraph:(id)a3;
+ (id)convertUsoNode:(id)a3;
+ (id)convertUsoNodeDataTier1:(id)a3 index:(int64_t)a4;
+ (id)convertUtteranceAlignment:(id)a3;
+ (id)convertUtteranceSpan:(id)a3;
+ (id)convertVersion:(id)a3;
+ (id)convertWantedToPause:(id)a3;
+ (id)convertWantedToProceed:(id)a3;
+ (id)convertWantedToRepeat:(id)a3;
+ (id)createAllZeroUUID;
+ (id)createCDMAllServicesSetupEndedLog:(id)a3;
+ (id)createCDMAllServicesSetupFailedLog:(id)a3;
+ (id)createCDMAllServicesSetupStartedLog:(id)a3;
+ (id)createCDMAllServicesWarmupEndedLog:(id)a3;
+ (id)createCDMAllServicesWarmupFailedLog:(id)a3;
+ (id)createCDMAllServicesWarmupStartedLog:(id)a3;
+ (id)createCDMAssetSetupEndedLog:(id)a3 metadata:(id)a4;
+ (id)createCDMAssetSetupFailedLog:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 metadata:(id)a6;
+ (id)createCDMAssetSetupStartedLog:(id)a3 serviceTypes:(id)a4 metadata:(id)a5;
+ (id)createCDMAssetsReportedLog:(id)a3 metadata:(id)a4;
+ (id)createCDMClientSetupEndedLog:(id)a3;
+ (id)createCDMClientSetupFailedLog:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5;
+ (id)createCDMClientSetupStartedLog:(id)a3 cdmServiceGraphName:(int)a4;
+ (id)createCDMClientWarmupEndedLog:(id)a3;
+ (id)createCDMClientWarmupFailedLog:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5;
+ (id)createCDMClientWarmupStartedLog:(id)a3 cdmServiceGraphName:(int)a4;
+ (id)createCDMRequestEndedLog:(id)a3 metadata:(id)a4;
+ (id)createCDMRequestFailedLog:(int)a3 errorDomainString:(id)a4 errorCode:(int)a5 metadata:(id)a6;
+ (id)createCDMRequestFailedLog:(int)a3 metadata:(id)a4;
+ (id)createCDMRequestStartedLog:(id)a3 metadata:(id)a4 cdmServiceGraphName:(int)a5;
+ (id)createCDMSetupMissingAssetsDetectedLog:(id)a3 services:(id)a4 metadata:(id)a5;
+ (id)createCdmXpcEventProcessingEndedLog:(id)a3 metadata:(id)a4;
+ (id)createCdmXpcEventProcessingFailedLog:(id)a3 reason:(int)a4 errorCode:(unsigned int)a5 metadata:(id)a6;
+ (id)createCdmXpcEventProcessingStartedLog:(id)a3 xpcType:(int)a4 xpcSystemEventType:(int)a5 serviceName:(int)a6 metadata:(id)a7;
+ (id)createContextUpdateEndedLog:(id)a3 contextUpdateResponse:(id)a4 metadata:(id)a5;
+ (id)createDelegatedUserDialogActTier1Event:(id)a3 withLinkId:(id)a4;
+ (id)createMatchingSpanEndedLog:(id)a3 spanMatchResponse:(id)a4 metadata:(id)a5;
+ (id)createMultiHypoTokenizationEndedLog:(id)a3 tokenizationResponses:(id)a4 tokenizationInputType:(int)a5 metadata:(id)a6;
+ (id)createNLXClientEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithSubRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int *)a8;
+ (id)createNLXClientEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithResultCandidateId:(id)a5 andWithRequester:(int *)a6;
+ (id)createNLXCurareContext:(id)a3 metadata:(id)a4;
+ (id)createNLXLegacyNLContextTier1Event:(id)a3 withLinkId:(id)a4;
+ (id)createNLXRequestLinkWithTarget:(int)a3 andTargetId:(id)a4 metadata:(id)a5;
+ (id)createSystemDialogActTier1Event:(id)a3 withLinkId:(id)a4;
+ (id)createTokenizationEndedLog:(id)a3 tokenizationResponse:(id)a4 metadata:(id)a5;
+ (id)createTokenizationEndedLog:(id)a3 tokenizationResponse:(id)a4 tokenizationInputType:(int)a5 metadata:(id)a6;
+ (id)extractRequestLinkData:(id)a3;
+ (id)getAppBundleTypeEnumsMapping;
+ (id)getErrorDomainMapping;
+ (id)getObjCUsoGraphFromOntologyUsoGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph;
+ (id)getReferenceFromAccepted:(id)a3;
+ (id)getReferenceFromAcknowledged:(id)a3;
+ (id)getReferenceFromCancelled:(id)a3;
+ (id)getReferenceFromRejected:(id)a3;
+ (id)getReferenceFromWantedToPause:(id)a3;
+ (id)getReferenceFromWantedToProceed:(id)a3;
+ (id)getReferenceFromWantedToRepeat:(id)a3;
+ (id)getTaskFromUserStatedTask:(id)a3;
+ (int)convertCDMCorrectionType:(int)a3;
+ (int)convertCDMMatcherName:(int)a3;
+ (int)convertCDMParserAlgorithmType:(int)a3;
+ (int)convertCDMReformType:(int)a3;
+ (int)convertCDMRepetitionType:(int)a3;
+ (int)convertCDMRewriteType:(int)a3;
+ (int)convertComponentInvocationSource:(int)a3;
+ (int)convertLegacyContextSource:(int)a3;
+ (int)convertMatchInfoAliasType:(int)a3;
+ (int)convertUSOEntityIdentifierNluComponent:(int)a3;
+ (int)convertUSOEntitySpanNluComponent:(int)a3;
+ (int)convertUsoBackingAppBundleType:(id)a3;
+ (int)getErrorDomain:(id)a3;
+ (void)populateEventsWithMetadata:(id)a3 metadata:(id)a4;
@end

@implementation SiriNLUSELFLogUtils

+ (id)createCDMAssetsReportedLog:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA09D8]);
  [v7 setAssets:v5];
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v8 setEventMetadata:v6];
  [v8 setCdmAssetsReported:v7];
  v9 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v9 setMainEvent:v8];

  return v9;
}

+ (id)createCDMClientSetupEndedLog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA09E8]);
  [v4 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA09E0]);
  [v5 setEnded:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v6 setEventMetadata:v3];
  [v6 setCdmClientSetupContext:v5];
  id v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v7 setMainEvent:v6];

  return v7;
}

+ (id)createCDMAllServicesWarmupStartedLog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA09B0]);
  [v4 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0998]);
  [v5 setStartedOrChanged:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v6 setEventMetadata:v3];
  [v6 setCdmAllServicesWarmupContext:v5];
  id v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v7 setMainEvent:v6];

  return v7;
}

+ (id)createCDMAllServicesSetupStartedLog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0990]);
  [v4 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0978]);
  [v5 setStartedOrChanged:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v6 setEventMetadata:v3];
  [v6 setCdmAllServicesSetupContext:v5];
  id v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v7 setMainEvent:v6];

  return v7;
}

+ (id)createCDMAssetSetupStartedLog:(id)a3 serviceTypes:(id)a4 metadata:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4FA09D0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v10, "addServices:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "intValue", (void)v20));
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4FA09B8]);
  [v15 setStartedOrChanged:v10];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v7];
  [v15 setContextId:v16];

  id v17 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v17 setEventMetadata:v9];
  [v17 setCdmAssetSetupContext:v15];
  v18 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v18 setMainEvent:v17];

  return v18;
}

+ (id)createCDMClientSetupStartedLog:(id)a3 cdmServiceGraphName:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FA09F8]);
  [v6 setServiceGraphName:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4FA09E0]);
  [v7 setStartedOrChanged:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v8 setEventMetadata:v5];
  [v8 setCdmClientSetupContext:v7];
  id v9 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v9 setMainEvent:v8];

  return v9;
}

+ (id)createCDMAssetSetupEndedLog:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA09C0]);
  [v7 setExists:1];
  id v8 = objc_alloc_init(MEMORY[0x1E4FA09B8]);
  [v8 setEnded:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v5];
  [v8 setContextId:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v10 setEventMetadata:v6];
  [v10 setCdmAssetSetupContext:v8];
  id v11 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v11 setMainEvent:v10];

  return v11;
}

+ (id)createNLXClientEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithResultCandidateId:(id)a5 andWithRequester:(int *)a6
{
  id v6 = [a1 createNLXClientEventMetadataWithNlId:a3 andWithTrpId:a4 andWithRequestId:0 andWithSubRequestId:0 andWithResultCandidateId:a5 andWithRequester:a6];
  return v6;
}

+ (id)convertUUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    v8[1] = objc_msgSend(v3, "highInt", objc_msgSend(v3, "lowInt"));
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v8];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)createCDMAllServicesWarmupEndedLog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA09A0]);
  [v4 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0998]);
  [v5 setEnded:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v6 setEventMetadata:v3];
  [v6 setCdmAllServicesWarmupContext:v5];
  id v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v7 setMainEvent:v6];

  return v7;
}

+ (id)createCDMAllServicesSetupEndedLog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0980]);
  [v4 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0978]);
  [v5 setEnded:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v6 setEventMetadata:v3];
  [v6 setCdmAllServicesSetupContext:v5];
  id v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v7 setMainEvent:v6];

  return v7;
}

+ (int)convertComponentInvocationSource:(int)a3
{
  if ((a3 - 1) >= 5) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)createAllZeroUUID
{
  v2 = objc_alloc_init(SIRINLUEXTERNALUUID);
  [(SIRINLUEXTERNALUUID *)v2 setLowInt:0];
  [(SIRINLUEXTERNALUUID *)v2 setHighInt:0];
  id v3 = +[SiriNLUSELFLogUtils convertUUID:v2];

  return v3;
}

+ (id)getAppBundleTypeEnumsMapping
{
  if (+[SiriNLUSELFLogUtils getAppBundleTypeEnumsMapping]::onceToken != -1) {
    dispatch_once(&+[SiriNLUSELFLogUtils getAppBundleTypeEnumsMapping]::onceToken, &__block_literal_global_151);
  }
  v2 = (void *)+[SiriNLUSELFLogUtils getAppBundleTypeEnumsMapping]::appBundleTypeEnumsMapping;
  return v2;
}

void __51__SiriNLUSELFLogUtils_getAppBundleTypeEnumsMapping__block_invoke()
{
  v30[27] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4FA38E8];
  v28 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v30[0] = v28;
  v29[1] = *MEMORY[0x1E4FA38F0];
  v27 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v30[1] = v27;
  v29[2] = *MEMORY[0x1E4FA38C0];
  v26 = (void *)[objc_alloc(NSNumber) initWithInt:3];
  v30[2] = v26;
  v29[3] = *MEMORY[0x1E4FA38C8];
  uint64_t v25 = (void *)[objc_alloc(NSNumber) initWithInt:4];
  v30[3] = v25;
  v29[4] = *MEMORY[0x1E4FA3830];
  v24 = (void *)[objc_alloc(NSNumber) initWithInt:24];
  v30[4] = v24;
  v29[5] = *MEMORY[0x1E4FA3838];
  long long v23 = (void *)[objc_alloc(NSNumber) initWithInt:20];
  v30[5] = v23;
  v29[6] = *MEMORY[0x1E4FA3840];
  long long v22 = (void *)[objc_alloc(NSNumber) initWithInt:22];
  v30[6] = v22;
  v29[7] = *MEMORY[0x1E4FA3848];
  long long v21 = (void *)[objc_alloc(NSNumber) initWithInt:13];
  v30[7] = v21;
  v29[8] = *MEMORY[0x1E4FA3850];
  long long v20 = (void *)[objc_alloc(NSNumber) initWithInt:5];
  v30[8] = v20;
  v29[9] = *MEMORY[0x1E4FA3858];
  v19 = (void *)[objc_alloc(NSNumber) initWithInt:18];
  v30[9] = v19;
  v29[10] = @"NlxErrorDomainMDSUaaP";
  v18 = (void *)[objc_alloc(NSNumber) initWithInt:11];
  v30[10] = v18;
  v29[11] = @"NlxErrorDomainPLUM";
  id v17 = (void *)[objc_alloc(NSNumber) initWithInt:12];
  v30[11] = v17;
  v29[12] = @"NlxErrorDomainCATI";
  v16 = (void *)[objc_alloc(NSNumber) initWithInt:13];
  v30[12] = v16;
  v29[13] = *MEMORY[0x1E4FA3860];
  id v15 = (void *)[objc_alloc(NSNumber) initWithInt:6];
  v30[13] = v15;
  v29[14] = *MEMORY[0x1E4FA3868];
  v14 = (void *)[objc_alloc(NSNumber) initWithInt:16];
  v30[14] = v14;
  v29[15] = *MEMORY[0x1E4FA3870];
  uint64_t v13 = (void *)[objc_alloc(NSNumber) initWithInt:7];
  v30[15] = v13;
  v29[16] = *MEMORY[0x1E4FA3878];
  uint64_t v12 = (void *)[objc_alloc(NSNumber) initWithInt:14];
  v30[16] = v12;
  v29[17] = *MEMORY[0x1E4FA3880];
  v0 = (void *)[objc_alloc(NSNumber) initWithInt:17];
  v30[17] = v0;
  v29[18] = *MEMORY[0x1E4FA3888];
  v1 = (void *)[objc_alloc(NSNumber) initWithInt:8];
  v30[18] = v1;
  v29[19] = *MEMORY[0x1E4FA3890];
  v2 = (void *)[objc_alloc(NSNumber) initWithInt:9];
  v30[19] = v2;
  v29[20] = *MEMORY[0x1E4FA3898];
  id v3 = (void *)[objc_alloc(NSNumber) initWithInt:10];
  v30[20] = v3;
  v29[21] = *MEMORY[0x1E4FA38A0];
  id v4 = (void *)[objc_alloc(NSNumber) initWithInt:15];
  v30[21] = v4;
  v29[22] = *MEMORY[0x1E4FA38A8];
  id v5 = (void *)[objc_alloc(NSNumber) initWithInt:19];
  v30[22] = v5;
  v29[23] = *MEMORY[0x1E4FA38B8];
  id v6 = (void *)[objc_alloc(NSNumber) initWithInt:12];
  v30[23] = v6;
  v29[24] = *MEMORY[0x1E4FA38D0];
  id v7 = (void *)[objc_alloc(NSNumber) initWithInt:25];
  v30[24] = v7;
  v29[25] = *MEMORY[0x1E4FA38D8];
  id v8 = (void *)[objc_alloc(NSNumber) initWithInt:21];
  v30[25] = v8;
  v29[26] = *MEMORY[0x1E4FA38E0];
  id v9 = (void *)[objc_alloc(NSNumber) initWithInt:23];
  v30[26] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:27];
  id v11 = (void *)+[SiriNLUSELFLogUtils getAppBundleTypeEnumsMapping]::appBundleTypeEnumsMapping;
  +[SiriNLUSELFLogUtils getAppBundleTypeEnumsMapping]::appBundleTypeEnumsMapping = v10;
}

+ (int)getErrorDomain:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[SiriNLUSELFLogUtils getErrorDomainMapping];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 objectForKey:v3];
      id v7 = v6;
      if (v6) {
        int v8 = [v6 intValue];
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (id)getErrorDomainMapping
{
  if (+[SiriNLUSELFLogUtils getErrorDomainMapping]::onceToken[0] != -1) {
    dispatch_once(+[SiriNLUSELFLogUtils getErrorDomainMapping]::onceToken, &__block_literal_global_2846);
  }
  v2 = (void *)+[SiriNLUSELFLogUtils getErrorDomainMapping]::errorDomainStringToEnum;
  return v2;
}

void __44__SiriNLUSELFLogUtils_getErrorDomainMapping__block_invoke()
{
  v25[22] = *MEMORY[0x1E4F143B8];
  v24[0] = @"NlxErrorDomainCDM";
  long long v23 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v25[0] = v23;
  v24[1] = @"NlxErrorDomainCDMClient";
  long long v22 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v25[1] = v22;
  v24[2] = @"NlxErrorDomainAssetsManager";
  long long v21 = (void *)[objc_alloc(NSNumber) initWithInt:3];
  v25[2] = v21;
  v24[3] = @"NlxErrorDomainDAG";
  long long v20 = (void *)[objc_alloc(NSNumber) initWithInt:4];
  v25[3] = v20;
  v24[4] = @"NlxErrorDomainNlv4";
  v19 = (void *)[objc_alloc(NSNumber) initWithInt:5];
  v25[4] = v19;
  v24[5] = @"NlxErrorDomainSNLC";
  v18 = (void *)[objc_alloc(NSNumber) initWithInt:6];
  v25[5] = v18;
  v24[6] = @"NlxErrorDomainPSC";
  id v17 = (void *)[objc_alloc(NSNumber) initWithInt:7];
  v25[6] = v17;
  v24[7] = @"NlxErrorDomainEmbedding";
  v16 = (void *)[objc_alloc(NSNumber) initWithInt:8];
  v25[7] = v16;
  v24[8] = @"NlxErrorDomainCcqrAerCbR";
  id v15 = (void *)[objc_alloc(NSNumber) initWithInt:9];
  v25[8] = v15;
  v24[9] = @"NlxErrorDomainUaaP";
  v14 = (void *)[objc_alloc(NSNumber) initWithInt:10];
  v25[9] = v14;
  v24[10] = @"NlxErrorDomainMDSUaaP";
  uint64_t v13 = (void *)[objc_alloc(NSNumber) initWithInt:11];
  v25[10] = v13;
  v24[11] = @"NlxErrorDomainPLUM";
  uint64_t v12 = (void *)[objc_alloc(NSNumber) initWithInt:12];
  v25[11] = v12;
  v24[12] = @"NlxErrorDomainCATI";
  v0 = (void *)[objc_alloc(NSNumber) initWithInt:13];
  v25[12] = v0;
  v24[13] = @"NlxErrorDomainTokenizer";
  v1 = (void *)[objc_alloc(NSNumber) initWithInt:14];
  v25[13] = v1;
  v24[14] = @"NlxErrorDomainSpanMatch";
  v2 = (void *)[objc_alloc(NSNumber) initWithInt:15];
  v25[14] = v2;
  v24[15] = @"NlxErrorDomainOverrides";
  id v3 = (void *)[objc_alloc(NSNumber) initWithInt:16];
  v25[15] = v3;
  v24[16] = @"NlxErrorDomainShortcut";
  id v4 = (void *)[objc_alloc(NSNumber) initWithInt:17];
  v25[16] = v4;
  v24[17] = @"NlxErrorDomainRepetitionDetection";
  id v5 = (void *)[objc_alloc(NSNumber) initWithInt:18];
  v25[17] = v5;
  v24[18] = @"NlxErrorDomainMentionDetector";
  id v6 = (void *)[objc_alloc(NSNumber) initWithInt:19];
  v25[18] = v6;
  v24[19] = @"NlxErrorDomainMentionResolver";
  id v7 = (void *)[objc_alloc(NSNumber) initWithInt:20];
  v25[19] = v7;
  v24[20] = @"NlxErrorDomainContextUpdate";
  int v8 = (void *)[objc_alloc(NSNumber) initWithInt:21];
  v25[20] = v8;
  v24[21] = @"NlxErrorDomainContextualSpanMatcher";
  id v9 = (void *)[objc_alloc(NSNumber) initWithInt:22];
  v25[21] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:22];
  id v11 = (void *)+[SiriNLUSELFLogUtils getErrorDomainMapping]::errorDomainStringToEnum;
  +[SiriNLUSELFLogUtils getErrorDomainMapping]::errorDomainStringToEnum = v10;
}

+ (id)extractRequestLinkData:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(SiriNLUSELFRequestLinkData);
  if (v3)
  {
    id v5 = @"No ResultCandidateId";
    uint64_t v6 = [v3 connectionId];
    id v7 = [v3 idA];
    v31 = (void *)v6;

    if (v7)
    {
      int v8 = [v3 idA];
      id v9 = [v8 componentsSeparatedByString:@":"];

      if (v9 && [v9 count])
      {
        uint64_t v10 = [v9 count];
        id v11 = [v9 objectAtIndex:0];
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
        uint64_t v13 = loggerContext(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
          _os_log_debug_impl(&dword_1C8881000, v13, OS_LOG_TYPE_DEBUG, "%s SELF RequestLink: Getting NL ID info...", buf, 0xCu);
        }

        v14 = loggerContext(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
          __int16 v34 = 2112;
          uint64_t v35 = (uint64_t)v11;
          _os_log_debug_impl(&dword_1C8881000, v14, OS_LOG_TYPE_DEBUG, "%s Target ID: %@", buf, 0x16u);
        }

        if (v12)
        {
          id v15 = [MEMORY[0x1E4F9F9A8] derivedIdentifierForComponentName:7 fromSourceIdentifier:v12];
          v16 = +[SiriNLUExternalTypesConverter convertFromUUID:v15];
          id v17 = loggerContext(0);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v29 = [v15 UUIDString];
            *(_DWORD *)buf = 136315394;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            __int16 v34 = 2112;
            uint64_t v35 = (uint64_t)v29;
            _os_log_debug_impl(&dword_1C8881000, v17, OS_LOG_TYPE_DEBUG, "%s SELF RequestLink: NL ID: %@", buf, 0x16u);
          }
        }
        else
        {
          id v15 = loggerContext(0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            _os_log_impl(&dword_1C8881000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: SELF RequestLink extraction error - upstream UUID could not be converted into NSUUID!", buf, 0xCu);
          }
          v16 = 0;
        }

        if (v10 == 2)
        {
          id v5 = [v9 objectAtIndex:1];
          long long v20 = loggerContext(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            __int16 v34 = 2112;
            uint64_t v35 = (uint64_t)v5;
            _os_log_debug_impl(&dword_1C8881000, v20, OS_LOG_TYPE_DEBUG, "%s SELF RequestLink: RC ID: %@", buf, 0x16u);
          }

          uint64_t v10 = 2;
        }
        else
        {
          id v5 = @"No ResultCandidateId";
        }
      }
      else
      {
        id v11 = loggerContext(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
          _os_log_impl(&dword_1C8881000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: SELF RequestLink: Splitting the ID with a delimiter returned nil or an array of size 0!", buf, 0xCu);
        }
        uint64_t v10 = 0;
        uint64_t v12 = 0;
        v16 = 0;
      }

      if (![v3 hasTrpId]
        || ([v3 trpId],
            long long v21 = objc_claimAutoreleasedReturnValue(),
            BOOL v22 = [v21 length] == 0,
            v21,
            v22))
      {
        uint64_t v25 = loggerContext(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
          _os_log_impl(&dword_1C8881000, v25, OS_LOG_TYPE_INFO, "%s [WARN]: SELF TRP ID: The transition relevance place Id (trpId) inside RequestID was nil!", buf, 0xCu);
        }
        v19 = 0;
      }
      else
      {
        id v23 = objc_alloc(MEMORY[0x1E4F29128]);
        v24 = [v3 trpId];
        uint64_t v25 = [v23 initWithUUIDString:v24];

        if (v25)
        {
          v19 = +[SiriNLUExternalTypesConverter convertFromUUID:v25];
          v26 = loggerContext(0);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v27 = [v25 UUIDString];
            *(_DWORD *)buf = 136315394;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            __int16 v34 = 2112;
            uint64_t v35 = v27;
            v30 = (void *)v27;
            _os_log_debug_impl(&dword_1C8881000, v26, OS_LOG_TYPE_DEBUG, "%s SELF TRP ID: %@", buf, 0x16u);
          }
        }
        else
        {
          v26 = loggerContext(0);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            _os_log_impl(&dword_1C8881000, v26, OS_LOG_TYPE_INFO, "%s [WARN]: SELF TRP ID extraction error - upstream UUID for TRP ID could not be converted into NSUUID!", buf, 0xCu);
          }
          v19 = 0;
        }
      }
    }
    else
    {
      id v9 = loggerContext(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
        _os_log_impl(&dword_1C8881000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: SELF RequestLink: The ID inside RequestID was nil!", buf, 0xCu);
      }
      uint64_t v10 = 0;
      uint64_t v12 = 0;
      v19 = 0;
      v16 = 0;
    }

    v18 = v31;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    v18 = 0;
    v19 = 0;
    v16 = 0;
    id v5 = @"No ResultCandidateId";
  }
  -[SiriNLUSELFRequestLinkData setNlId:](v4, "setNlId:", v16, v30);
  [(SiriNLUSELFRequestLinkData *)v4 setTrpId:v19];
  [(SiriNLUSELFRequestLinkData *)v4 setResultCandidateId:v5];
  [(SiriNLUSELFRequestLinkData *)v4 setTargetName:v18];
  [(SiriNLUSELFRequestLinkData *)v4 setTargetUUID:v12];
  [(SiriNLUSELFRequestLinkData *)v4 setSplitCount:v10];

  return v4;
}

+ (int)convertLegacyContextSource:(int)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return dword_1C8C3F224[a3 - 1];
  }
}

+ (int)convertCDMParserAlgorithmType:(int)a3
{
  if (a3 < 3) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)convertCDMReformType:(int)a3
{
  if (a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)convertCDMRewriteType:(int)a3
{
  if (a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)convertCDMCorrectionType:(int)a3
{
  return a3 == 1;
}

+ (int)convertCDMRepetitionType:(int)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return dword_1C8C3EB60[a3];
  }
}

+ (int)convertCDMMatcherName:(int)a3
{
  if (a3 < 9) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)convertMatchInfoAliasType:(int)a3
{
  if (a3 < 8) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)convertUSOEntitySpanNluComponent:(int)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return dword_1C8C3F208[a3];
  }
}

+ (int)convertUSOEntityIdentifierNluComponent:(int)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return dword_1C8C3F208[a3];
  }
}

+ (id)convertLvcResult:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0A48]);
    id v5 = [v3 multilingualVariants];

    if (v5)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v6 = objc_msgSend(v3, "multilingualVariants", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v19 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            id v11 = objc_alloc_init(MEMORY[0x1E4FA0A70]);
            uint64_t v12 = [v10 languageVariantName];
            [v11 setLanguageVariantName:v12];

            [v10 languageVariantScore];
            objc_msgSend(v11, "setLanguageVariantConfidenceScore:");
            [v4 addMultilingualVariants:v11];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v7);
      }
    }
    uint64_t v13 = [v3 parser];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      id v15 = [v3 parser];
      v16 = +[SiriNLUSELFLogUtils convertParser:v15];
      [v4 setCdmParser:v16];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertReformedTurnInputBundle:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0A88]);
    objc_msgSend(v4, "setType:", +[SiriNLUSELFLogUtils convertCDMReformType:](SiriNLUSELFLogUtils, "convertCDMReformType:", objc_msgSend(v3, "type")));
    id v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
    uint64_t v6 = [v3 currentTurn];
    uint64_t v7 = +[SiriNLUSELFLogUtils convertTurnInput:v6];

    if (v7)
    {
      uint64_t v8 = [v7 mainItem];
      [v4 setCurrentTurn:v8];

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v9 = objc_msgSend(v7, "tier1Events", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v9);
            }
            [(SiriInstrumentationObjectContainer *)v5 addTier1Event:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }
    }
    [(SiriInstrumentationObjectContainer *)v5 setMainItem:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertToken:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B10]);
    id v5 = [v3 value];
    [v4 setValue:v5];

    objc_msgSend(v4, "setBegin:", objc_msgSend(v3, "begin"));
    objc_msgSend(v4, "setEnd:", objc_msgSend(v3, "end"));
    objc_msgSend(v4, "setIsSignificant:", objc_msgSend(v3, "isSignificant"));
    objc_msgSend(v4, "setIsWhitespace:", objc_msgSend(v3, "isWhitespace"));
    objc_msgSend(v4, "setNonWhitespaceTokenIndex:", objc_msgSend(v3, "nonWhitespaceTokenIndex"));
    uint64_t v6 = [v3 cleanValue];
    [v4 setCleanValue:v6];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = objc_msgSend(v3, "normalizedValues", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          [v4 addNormalizedValues:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    objc_msgSend(v4, "setTokenIndex:", objc_msgSend(v3, "tokenIndex"));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertTokenChain:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B18]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(v3, "tokens", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = +[SiriNLUSELFLogUtils convertToken:*(void *)(*((void *)&v11 + 1) + 8 * i)];
          [v4 addTokens:v9];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertMentionResolverSpanData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0C58]);
    [v3 modelScore];
    objc_msgSend(v4, "setModelScore:");
    [v3 jointScore];
    objc_msgSend(v4, "setJointScore:");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertMentionDetectorSpanData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0C50]);
    [v3 score];
    objc_msgSend(v4, "setScore:");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertPLUMSpanData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0C88]);
    [v3 score];
    objc_msgSend(v4, "setScore:");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertSiriVocabularySpanData:(id)a3
{
  if (a3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0AC0]);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)convertInternalSpanData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0A40]);
    id v5 = [v3 siriVocabularySpanData];
    uint64_t v6 = +[SiriNLUSELFLogUtils convertSiriVocabularySpanData:v5];
    [v4 setSiriVocabularySpanData:v6];

    uint64_t v7 = [v3 plumSpanData];
    uint64_t v8 = +[SiriNLUSELFLogUtils convertPLUMSpanData:v7];
    [v4 setPlumSpanData:v8];

    uint64_t v9 = [v3 mentionDetectorSpanData];
    uint64_t v10 = +[SiriNLUSELFLogUtils convertMentionDetectorSpanData:v9];
    [v4 setMentionDetectorSpanData:v10];

    long long v11 = [v3 mentionResolverSpanData];
    long long v12 = +[SiriNLUSELFLogUtils convertMentionResolverSpanData:v11];
    [v4 setMentionResolverSpanData:v12];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertMatchingSpanTier1:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0A68]);
    id v5 = [v3 input];
    [v4 setInput:v5];

    uint64_t v6 = [v3 semanticValue];
    [v4 setSemanticValue:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertMatchingSpan:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  if (v26)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4FA0A50]);
    id v3 = [v26 label];
    [v25 setLabel:v3];

    objc_msgSend(v25, "setStartTokenIndex:", objc_msgSend(v26, "startTokenIndex"));
    objc_msgSend(v25, "setEndTokenIndex:", objc_msgSend(v26, "endTokenIndex"));
    id v4 = [v26 internalSpanData];
    id v5 = +[SiriNLUSELFLogUtils convertInternalSpanData:v4];
    [v25 setInternalSpanData:v5];

    unint64_t v6 = 0;
    char v7 = 0;
    while ([v26 matcherNamesCount] > v6)
    {
      objc_msgSend(v25, "addMatcherNames:", +[SiriNLUSELFLogUtils convertCDMMatcherName:](SiriNLUSELFLogUtils, "convertCDMMatcherName:", objc_msgSend(v26, "matcherNamesAtIndex:", v6)));
      v7 |= [v26 matcherNamesAtIndex:v6++] == 2;
    }
    uint64_t v8 = objc_alloc_init(SiriInstrumentationObjectContainer);
    uint64_t v9 = [v26 usoGraph];
    uint64_t v10 = +[SiriNLUSELFLogUtils convertUsoGraph:v9];

    uint64_t v23 = v10;
    if (v10)
    {
      long long v11 = [v10 mainItem];
      [v25 setUsoGraph:v11];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      obuint64_t j = [v10 tier1Events];
      uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(obj);
            }
            long long v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (v7)
            {
              long long v30 = 0u;
              long long v31 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              uint64_t v16 = [v15 cdmUsoGraphTier1];
              uint64_t v17 = [v16 usoGraphTier1];
              long long v18 = [v17 linkedUsoGraphNodeDatas];

              uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v29;
                do
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    if (*(void *)v29 != v20) {
                      objc_enumerationMutation(v18);
                    }
                    objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "setLinkedUsoNodeData:", 0, v23);
                  }
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
                }
                while (v19);
              }
            }
            -[SiriInstrumentationObjectContainer addTier1Event:](v8, "addTier1Event:", v15, v23);
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v12);
      }
    }
    -[SiriInstrumentationObjectContainer setMainItem:](v8, "setMainItem:", v25, v23);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)getTaskFromUserStatedTask:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 task];
    unint64_t v6 = +[SiriNLUSELFLogUtils convertUsoGraph:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromWantedToPause:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 reference];
    unint64_t v6 = +[SiriNLUSELFLogUtils convertUsoGraph:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromWantedToProceed:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 reference];
    unint64_t v6 = +[SiriNLUSELFLogUtils convertUsoGraph:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromAcknowledged:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 reference];
    unint64_t v6 = +[SiriNLUSELFLogUtils convertUsoGraph:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromWantedToRepeat:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 reference];
    unint64_t v6 = +[SiriNLUSELFLogUtils convertUsoGraph:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromCancelled:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 reference];
    unint64_t v6 = +[SiriNLUSELFLogUtils convertUsoGraph:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromRejected:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 reference];
    unint64_t v6 = +[SiriNLUSELFLogUtils convertUsoGraph:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromAccepted:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 reference];
    unint64_t v6 = +[SiriNLUSELFLogUtils convertUsoGraph:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)convertUserStatedTask:(id)a3
{
  if (a3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FA0B68]);
    [v3 setExists:1];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

+ (id)convertDelegated:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  if (v24)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4FA0A30]);
    objc_msgSend(v22, "setAsrHypothesisIndex:", objc_msgSend(v24, "asrHypothesisIndex"));
    id v3 = [v24 externalParserId];
    [v22 setExternalParserId:v3];

    uint64_t v23 = objc_alloc_init(SiriInstrumentationObjectContainer);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = [v24 matchingSpans];
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v4);
          }
          unint64_t v11 = 0;
          uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          while ([v12 matcherNamesCount] > v11)
          {
            if ([v12 matcherNamesAtIndex:v11] == 1) {
              uint64_t v5 = (v5 + 1);
            }
            else {
              uint64_t v5 = v5;
            }
            int v13 = [v12 matcherNamesAtIndex:v11];
            int v14 = [v12 matcherNamesAtIndex:v11];
            if (v13 == 3) {
              uint64_t v6 = (v6 + 1);
            }
            else {
              uint64_t v6 = v6;
            }
            if (v14 == 4) {
              uint64_t v7 = (v7 + 1);
            }
            else {
              uint64_t v7 = v7;
            }
            ++v11;
          }
        }
        uint64_t v8 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }

    long long v15 = v22;
    [v22 setSiriVocabularySpanCount:v5];
    [v22 setMentionResolverSpanCount:v6];
    [v22 setContextMatcherSpanCount:v7];
    if ([v24 hasRewrite])
    {
      uint64_t v16 = [v24 rewrite];
      objc_msgSend(v22, "setRewriteType:", +[SiriNLUSELFLogUtils convertCDMRewriteType:](SiriNLUSELFLogUtils, "convertCDMRewriteType:", objc_msgSend(v16, "rewriteType")));

      id v17 = objc_alloc(MEMORY[0x1E4FA1378]);
      id v18 = objc_alloc_init(MEMORY[0x1E4F29128]);
      uint64_t v19 = (void *)[v17 initWithNSUUID:v18];

      [v22 setLinkId:v19];
      uint64_t v20 = +[SiriNLUSELFLogUtils createDelegatedUserDialogActTier1Event:v24 withLinkId:v19];
      [(SiriInstrumentationObjectContainer *)v23 addTier1Event:v20];

      long long v15 = v22;
    }
    [(SiriInstrumentationObjectContainer *)v23 setMainItem:v15];
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)convertWantedToPause:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B70]);
    uint64_t v5 = [v3 taskId];

    if (v5)
    {
      uint64_t v6 = [v3 taskId];
      uint64_t v7 = +[SiriNLUSELFLogUtils convertUUID:v6];
      [v4 setTaskId:v7];
    }
    else
    {
      uint64_t v6 = +[SiriNLUSELFLogUtils createAllZeroUUID];
      [v4 setTaskId:v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertWantedToProceed:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B78]);
    uint64_t v5 = [v3 taskId];

    if (v5)
    {
      uint64_t v6 = [v3 taskId];
      uint64_t v7 = +[SiriNLUSELFLogUtils convertUUID:v6];
      [v4 setTaskId:v7];
    }
    else
    {
      uint64_t v6 = +[SiriNLUSELFLogUtils createAllZeroUUID];
      [v4 setTaskId:v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertAcknowledged:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B40]);
    uint64_t v5 = [v3 systemDialogActId];

    if (v5)
    {
      uint64_t v6 = [v3 systemDialogActId];
      uint64_t v7 = +[SiriNLUSELFLogUtils convertUUID:v6];
      [v4 setSystemDialogActId:v7];
    }
    else
    {
      uint64_t v6 = +[SiriNLUSELFLogUtils createAllZeroUUID];
      [v4 setSystemDialogActId:v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertWantedToRepeat:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B80]);
    uint64_t v5 = [v3 systemDialogActId];

    if (v5)
    {
      uint64_t v6 = [v3 systemDialogActId];
      uint64_t v7 = +[SiriNLUSELFLogUtils convertUUID:v6];
      [v4 setSystemDialogActId:v7];
    }
    else
    {
      uint64_t v6 = +[SiriNLUSELFLogUtils createAllZeroUUID];
      [v4 setSystemDialogActId:v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertCancelled:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B48]);
    uint64_t v5 = [v3 taskId];

    if (v5)
    {
      uint64_t v6 = [v3 taskId];
      uint64_t v7 = +[SiriNLUSELFLogUtils convertUUID:v6];
      [v4 setTaskId:v7];
    }
    else
    {
      uint64_t v6 = +[SiriNLUSELFLogUtils createAllZeroUUID];
      [v4 setTaskId:v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertRejected:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B60]);
    uint64_t v5 = [v3 offerId];

    if (v5)
    {
      uint64_t v6 = [v3 offerId];
      uint64_t v7 = +[SiriNLUSELFLogUtils convertUUID:v6];
      [v4 setOfferId:v7];
    }
    else
    {
      uint64_t v6 = +[SiriNLUSELFLogUtils createAllZeroUUID];
      [v4 setOfferId:v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertAccepted:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B38]);
    uint64_t v5 = [v3 offerId];

    if (v5)
    {
      uint64_t v6 = [v3 offerId];
      uint64_t v7 = +[SiriNLUSELFLogUtils convertUUID:v6];
      [v4 setOfferId:v7];
    }
    else
    {
      uint64_t v6 = +[SiriNLUSELFLogUtils createAllZeroUUID];
      [v4 setOfferId:v6];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertUserDialogAct:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v7 = 0;
    goto LABEL_27;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0B50]);
  uint64_t v5 = [v3 alignment];
  uint64_t v6 = +[SiriNLUSELFLogUtils convertUtteranceAlignment:v5];
  [v4 setAlignment:v6];

  uint64_t v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
  if ([v3 hasAccepted])
  {
    uint64_t v8 = [v3 accepted];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertAccepted:v8];
    [v4 setAccepted:v9];

    uint64_t v10 = [v3 accepted];
    uint64_t v11 = +[SiriNLUSELFLogUtils getReferenceFromAccepted:v10];
  }
  else if ([v3 hasRejected])
  {
    uint64_t v12 = [v3 rejected];
    int v13 = +[SiriNLUSELFLogUtils convertRejected:v12];
    [v4 setRejected:v13];

    uint64_t v10 = [v3 rejected];
    uint64_t v11 = +[SiriNLUSELFLogUtils getReferenceFromRejected:v10];
  }
  else if ([v3 hasCancelled])
  {
    int v14 = [v3 cancelled];
    long long v15 = +[SiriNLUSELFLogUtils convertCancelled:v14];
    [v4 setCancelled:v15];

    uint64_t v10 = [v3 cancelled];
    uint64_t v11 = +[SiriNLUSELFLogUtils getReferenceFromCancelled:v10];
  }
  else if ([v3 hasWantedToRepeat])
  {
    uint64_t v16 = [v3 wantedToRepeat];
    id v17 = +[SiriNLUSELFLogUtils convertWantedToRepeat:v16];
    [v4 setWantedToRepeat:v17];

    uint64_t v10 = [v3 wantedToRepeat];
    uint64_t v11 = +[SiriNLUSELFLogUtils getReferenceFromWantedToRepeat:v10];
  }
  else if ([v3 hasAcknowledged])
  {
    id v18 = [v3 acknowledged];
    uint64_t v19 = +[SiriNLUSELFLogUtils convertAcknowledged:v18];
    [v4 setAcknowledged:v19];

    uint64_t v10 = [v3 acknowledged];
    uint64_t v11 = +[SiriNLUSELFLogUtils getReferenceFromAcknowledged:v10];
  }
  else if ([v3 hasWantedToProceed])
  {
    uint64_t v20 = [v3 wantedToProceed];
    long long v21 = +[SiriNLUSELFLogUtils convertWantedToProceed:v20];
    [v4 setWantedToProceed:v21];

    uint64_t v10 = [v3 wantedToProceed];
    uint64_t v11 = +[SiriNLUSELFLogUtils getReferenceFromWantedToProceed:v10];
  }
  else if ([v3 hasWantedToPause])
  {
    id v22 = [v3 wantedToPause];
    uint64_t v23 = +[SiriNLUSELFLogUtils convertWantedToPause:v22];
    [v4 setWantedToPause:v23];

    uint64_t v10 = [v3 wantedToPause];
    uint64_t v11 = +[SiriNLUSELFLogUtils getReferenceFromWantedToPause:v10];
  }
  else
  {
    if ([v3 hasDelegated])
    {
      long long v31 = [v3 delegated];
      long long v26 = +[SiriNLUSELFLogUtils convertDelegated:v31];

      if (v26)
      {
        long long v32 = [v26 mainItem];
        [v4 setDelegated:v32];

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v33 = [v26 tier1Events];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v44 != v35) {
                objc_enumerationMutation(v33);
              }
              [(SiriInstrumentationObjectContainer *)v7 addTier1Event:*(void *)(*((void *)&v43 + 1) + 8 * i)];
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v34);
        }
      }
      id v24 = 0;
      goto LABEL_25;
    }
    if (![v3 hasUserStatedTask])
    {
      id v24 = 0;
      goto LABEL_26;
    }
    v37 = [v3 userStatedTask];
    uint64_t v38 = +[SiriNLUSELFLogUtils convertUserStatedTask:v37];
    [v4 setUserStatedTask:v38];

    uint64_t v10 = [v3 userStatedTask];
    uint64_t v11 = +[SiriNLUSELFLogUtils getTaskFromUserStatedTask:v10];
  }
  id v24 = (void *)v11;

  if (v24)
  {
    long long v25 = [v24 mainItem];
    [v4 setReference:v25];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v26 = objc_msgSend(v24, "tier1Events", 0);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v26);
          }
          [(SiriInstrumentationObjectContainer *)v7 addTier1Event:*(void *)(*((void *)&v39 + 1) + 8 * j)];
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v27);
    }
LABEL_25:
  }
LABEL_26:
  [(SiriInstrumentationObjectContainer *)v7 setMainItem:v4];

LABEL_27:
  return v7;
}

+ (id)convertParser:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0A80]);
    objc_msgSend(v4, "setAlgorithm:", +[SiriNLUSELFLogUtils convertCDMParserAlgorithmType:](SiriNLUSELFLogUtils, "convertCDMParserAlgorithmType:", objc_msgSend(v3, "algorithm")));
    objc_msgSend(v4, "setParserId:", objc_msgSend(v3, "parserId"));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertRepetitionResult:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0A90]);
    objc_msgSend(v4, "setAsrHypothesisIndex:", objc_msgSend(v3, "asrHypothesisIndex"));
    objc_msgSend(v4, "setRepetitionType:", +[SiriNLUSELFLogUtils convertCDMRepetitionType:](SiriNLUSELFLogUtils, "convertCDMRepetitionType:", objc_msgSend(v3, "repetitionType")));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertCorrectionOutcome:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0A28]);
    objc_msgSend(v4, "setCorrectionType:", +[SiriNLUSELFLogUtils convertCDMCorrectionType:](SiriNLUSELFLogUtils, "convertCDMCorrectionType:", objc_msgSend(v3, "type")));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertUserParse:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  if (v24)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4FA0B58]);
    id v3 = [v24 idA];
    id v4 = +[SiriNLUSELFLogUtils convertUUID:v3];
    [v25 setId:v4];

    uint64_t v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v6 = [v24 userDialogActs];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = +[SiriNLUSELFLogUtils convertUserDialogAct:](SiriNLUSELFLogUtils, "convertUserDialogAct:", *(void *)(*((void *)&v30 + 1) + 8 * i), v24);
          uint64_t v11 = v10;
          if (v10)
          {
            uint64_t v12 = [v10 mainItem];
            [v25 addUserDialogActs:v12];

            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            int v13 = [v11 tier1Events];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v27;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v27 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  [(SiriInstrumentationObjectContainer *)v5 addTier1Event:*(void *)(*((void *)&v26 + 1) + 8 * j)];
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v14);
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    [v24 probability];
    objc_msgSend(v25, "setProbability:");
    id v17 = [v24 repetitionResult];
    id v18 = +[SiriNLUSELFLogUtils convertRepetitionResult:v17];
    [v25 setRepetitionResult:v18];

    uint64_t v19 = [v24 parser];
    uint64_t v20 = +[SiriNLUSELFLogUtils convertParser:v19];
    [v25 setParser:v20];

    [v24 comparableProbability];
    objc_msgSend(v25, "setComparableProbability:");
    long long v21 = [v24 correctionOutcome];
    id v22 = +[SiriNLUSELFLogUtils convertCorrectionOutcome:v21];
    [v25 setCorrectionOutcome:v22];

    [(SiriInstrumentationObjectContainer *)v5 setMainItem:v25];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)convertReportedFailure:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0AF8]);
    uint64_t v5 = [v3 taskId];
    uint64_t v6 = +[SiriNLUSELFLogUtils convertUUID:v5];
    [v4 setTaskId:v6];

    uint64_t v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
    uint64_t v8 = [v3 reason];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertUsoGraph:v8];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setReason:v10];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v11 = [v9 tier1Events];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v11);
            }
            [(SiriInstrumentationObjectContainer *)v7 addTier1Event:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v12);
      }
    }
    uint64_t v15 = [v3 task];
    uint64_t v16 = +[SiriNLUSELFLogUtils convertUsoGraph:v15];

    if (v16)
    {
      id v17 = [v16 mainItem];
      [v4 setTask:v17];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v18 = objc_msgSend(v16, "tier1Events", 0);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v18);
            }
            [(SiriInstrumentationObjectContainer *)v7 addTier1Event:*(void *)(*((void *)&v23 + 1) + 8 * j)];
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v19);
      }
    }
    [(SiriInstrumentationObjectContainer *)v7 setMainItem:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)convertReportedSuccess:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B00]);
    uint64_t v5 = [v3 taskId];
    uint64_t v6 = +[SiriNLUSELFLogUtils convertUUID:v5];
    [v4 setTaskId:v6];

    uint64_t v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
    uint64_t v8 = [v3 task];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertUsoGraph:v8];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setTask:v10];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v11 = objc_msgSend(v9, "tier1Events", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v11);
            }
            [(SiriInstrumentationObjectContainer *)v7 addTier1Event:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }
    }
    [(SiriInstrumentationObjectContainer *)v7 setMainItem:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)convertInformed:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  if (v20)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4FA0AE0]);
    id v3 = [v20 taskId];
    id v4 = +[SiriNLUSELFLogUtils convertUUID:v3];
    [v21 setTaskId:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v6 = [v20 entities];
    uint64_t v7 = v6;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", *(void *)(*((void *)&v26 + 1) + 8 * i), v20);
          uint64_t v12 = v11;
          if (v11)
          {
            uint64_t v13 = [v11 mainItem];
            [v21 addEntities:v13];

            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            uint64_t v14 = [v12 tier1Events];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v23;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v23 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  [v5 addObject:*(void *)(*((void *)&v22 + 1) + 8 * j)];
                }
                uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }
              while (v15);
            }
          }
        }
        uint64_t v6 = v7;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    long long v18 = objc_alloc_init(SiriInstrumentationObjectContainer);
    [(SiriInstrumentationObjectContainer *)v18 setMainItem:v21];
    [(SiriInstrumentationObjectContainer *)v18 setTier1Events:v5];
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

+ (id)convertGaveOptions:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if (v16)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4FA0AD8]);
    id v3 = objc_alloc_init(SiriInstrumentationObjectContainer);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = [v16 choices];
    obuint64_t j = v4;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = +[SiriNLUSELFLogUtils convertUserDialogAct:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          uint64_t v9 = v8;
          if (v8)
          {
            uint64_t v10 = [v8 mainItem];
            [v18 addChoices:v10];

            long long v21 = 0u;
            long long v22 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            uint64_t v11 = [v9 tier1Events];
            uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v20;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v20 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  [(SiriInstrumentationObjectContainer *)v3 addTier1Event:*(void *)(*((void *)&v19 + 1) + 8 * j)];
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
              }
              while (v12);
            }
          }
        }
        id v4 = obj;
        uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v5);
    }

    [(SiriInstrumentationObjectContainer *)v3 setMainItem:v18];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)convertOffered:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0AE8]);
    uint64_t v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
    uint64_t v6 = [v3 offeredAct];
    uint64_t v7 = +[SiriNLUSELFLogUtils convertUserDialogAct:v6];

    if (v7)
    {
      uint64_t v8 = [v7 mainItem];
      [v4 setOfferedAct:v8];

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v9 = objc_msgSend(v7, "tier1Events", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v9);
            }
            [(SiriInstrumentationObjectContainer *)v5 addTier1Event:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }
    }
    [(SiriInstrumentationObjectContainer *)v5 setMainItem:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)convertPrompted:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0AF0]);
    uint64_t v5 = [v3 taskId];
    uint64_t v6 = +[SiriNLUSELFLogUtils convertUUID:v5];
    [v4 setTaskId:v6];

    uint64_t v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
    uint64_t v8 = [v3 target];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertUsoGraph:v8];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setTarget:v10];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v11 = objc_msgSend(v9, "tier1Events", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v11);
            }
            [(SiriInstrumentationObjectContainer *)v7 addTier1Event:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }
    }
    [(SiriInstrumentationObjectContainer *)v7 setMainItem:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)convertSystemDialogAct:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v5 = 0;
    goto LABEL_32;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0AC8]);
  uint64_t v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
  uint64_t v6 = [v3 idA];
  uint64_t v7 = +[SiriNLUSELFLogUtils convertUUID:v6];
  [v4 setId:v7];

  if ([v3 hasPrompted])
  {
    uint64_t v8 = [v3 prompted];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertPrompted:v8];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setPrompted:v10];
LABEL_21:

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v16 = objc_msgSend(v9, "tier1Events", 0);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v16);
            }
            [(SiriInstrumentationObjectContainer *)v5 addTier1Event:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v17);
      }
    }
  }
  else if ([v3 hasOffered])
  {
    uint64_t v11 = [v3 offered];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertOffered:v11];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setOffered:v10];
      goto LABEL_21;
    }
  }
  else if ([v3 hasGaveOptions])
  {
    uint64_t v12 = [v3 gaveOptions];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertGaveOptions:v12];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setGaveOptions:v10];
      goto LABEL_21;
    }
  }
  else if ([v3 hasInformed])
  {
    uint64_t v13 = [v3 informed];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertInformed:v13];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setInformed:v10];
      goto LABEL_21;
    }
  }
  else if ([v3 hasReportedSuccess])
  {
    long long v14 = [v3 reportedSuccess];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertReportedSuccess:v14];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setReportedSuccess:v10];
      goto LABEL_21;
    }
  }
  else if ([v3 hasReportedFailure])
  {
    long long v15 = [v3 reportedFailure];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertReportedFailure:v15];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setReportedFailure:v10];
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ([v3 hasRenderedText])
  {
    id v20 = objc_alloc(MEMORY[0x1E4FA1378]);
    id v21 = objc_alloc_init(MEMORY[0x1E4F29128]);
    long long v22 = (void *)[v20 initWithNSUUID:v21];

    [v4 setLinkId:v22];
    long long v23 = +[SiriNLUSELFLogUtils createSystemDialogActTier1Event:v3 withLinkId:v22];
    [(SiriInstrumentationObjectContainer *)v5 addTier1Event:v23];
  }
  [(SiriInstrumentationObjectContainer *)v5 setMainItem:v4];

LABEL_32:
  return v5;
}

+ (id)convertLegacyNLContext:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0C78]);
    objc_msgSend(v4, "setIsDictationPrompt:", objc_msgSend(v3, "dictationPrompt"));
    objc_msgSend(v4, "setIsStrictPrompt:", objc_msgSend(v3, "strictPrompt"));
    uint64_t v5 = [v3 previousDomainName];
    [v4 setPreviousDomainName:v5];

    objc_msgSend(v4, "setIsListenAfterSpeaking:", objc_msgSend(v3, "listenAfterSpeaking"));
    objc_msgSend(v4, "setLegacyContextSource:", +[SiriNLUSELFLogUtils convertLegacyContextSource:](SiriNLUSELFLogUtils, "convertLegacyContextSource:", objc_msgSend(v3, "legacyContextSource")));
    id v6 = objc_alloc(MEMORY[0x1E4FA1378]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F29128]);
    uint64_t v8 = (void *)[v6 initWithNSUUID:v7];

    [v4 setLinkId:v8];
    uint64_t v9 = objc_alloc_init(SiriInstrumentationObjectContainer);
    [(SiriInstrumentationObjectContainer *)v9 setMainItem:v4];
    uint64_t v10 = +[SiriNLUSELFLogUtils createNLXLegacyNLContextTier1Event:v3 withLinkId:v8];
    [(SiriInstrumentationObjectContainer *)v9 addTier1Event:v10];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)convertTask:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B08]);
    uint64_t v5 = [v3 taskId];
    id v6 = +[SiriNLUSELFLogUtils convertUUID:v5];
    [v4 setTaskId:v6];

    id v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
    uint64_t v8 = [v3 task];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertUsoGraph:v8];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setTask:v10];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v11 = objc_msgSend(v9, "tier1Events", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v11);
            }
            [(SiriInstrumentationObjectContainer *)v7 addTier1Event:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
    if ([v3 hasScore])
    {
      long long v15 = [v3 score];
      [v15 value];
      objc_msgSend(v4, "setScore:");
    }
    [(SiriInstrumentationObjectContainer *)v7 setMainItem:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)convertNLContext:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    long long v39 = v3;
    uint64_t v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
    id v43 = objc_alloc_init(MEMORY[0x1E4FA0A78]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = [v4 activeTasks];
    uint64_t v6 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v65 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = +[SiriNLUSELFLogUtils convertTask:*(void *)(*((void *)&v64 + 1) + 8 * i)];
          uint64_t v10 = v9;
          if (v9)
          {
            uint64_t v11 = [v9 mainItem];
            [v43 addActiveTasks:v11];

            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            uint64_t v12 = [v10 tier1Events];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v60 objects:v72 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v61;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v61 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  [(SiriInstrumentationObjectContainer *)v5 addTier1Event:*(void *)(*((void *)&v60 + 1) + 8 * j)];
                }
                uint64_t v13 = [v12 countByEnumeratingWithState:&v60 objects:v72 count:16];
              }
              while (v13);
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
      }
      while (v6);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v16 = [v39 executedTasks];
    id obja = v16;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v71 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v57 != v18) {
            objc_enumerationMutation(obja);
          }
          long long v20 = +[SiriNLUSELFLogUtils convertTask:*(void *)(*((void *)&v56 + 1) + 8 * k)];
          id v21 = v20;
          if (v20)
          {
            uint64_t v22 = [v20 mainItem];
            [v43 addExecutedTasks:v22];

            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v23 = [v21 tier1Events];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v70 count:16];
            if (v24)
            {
              uint64_t v25 = *(void *)v53;
              do
              {
                for (uint64_t m = 0; m != v24; ++m)
                {
                  if (*(void *)v53 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  [(SiriInstrumentationObjectContainer *)v5 addTier1Event:*(void *)(*((void *)&v52 + 1) + 8 * m)];
                }
                uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v70 count:16];
              }
              while (v24);
            }
          }
        }
        long long v16 = obja;
        uint64_t v17 = [obja countByEnumeratingWithState:&v56 objects:v71 count:16];
      }
      while (v17);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v27 = [v39 systemDialogActs];
    id objb = v27;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v69 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v49;
      do
      {
        for (uint64_t n = 0; n != v28; ++n)
        {
          if (*(void *)v49 != v29) {
            objc_enumerationMutation(objb);
          }
          long long v31 = +[SiriNLUSELFLogUtils convertSystemDialogAct:*(void *)(*((void *)&v48 + 1) + 8 * n)];
          uint64_t v32 = v31;
          if (v31)
          {
            uint64_t v33 = [v31 mainItem];
            [v43 addSystemDialogActs:v33];

            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            uint64_t v34 = [v32 tier1Events];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v44 objects:v68 count:16];
            if (v35)
            {
              uint64_t v36 = *(void *)v45;
              do
              {
                for (iuint64_t i = 0; ii != v35; ++ii)
                {
                  if (*(void *)v45 != v36) {
                    objc_enumerationMutation(v34);
                  }
                  [(SiriInstrumentationObjectContainer *)v5 addTier1Event:*(void *)(*((void *)&v44 + 1) + 8 * ii)];
                }
                uint64_t v35 = [v34 countByEnumeratingWithState:&v44 objects:v68 count:16];
              }
              while (v35);
            }
          }
        }
        long long v27 = objb;
        uint64_t v28 = [objb countByEnumeratingWithState:&v48 objects:v69 count:16];
      }
      while (v28);
    }

    [(SiriInstrumentationObjectContainer *)v5 setMainItem:v43];
    id v4 = v39;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)isLegacyNlContextPresent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if (([v4 dictationPrompt] & 1) == 0
      && ([v5 strictPrompt] & 1) == 0
      && ([v5 listenAfterSpeaking] & 1) == 0)
    {
      int v6 = [v5 hasPreviousDomainName];
      if (v6
        && ([v5 previousDomainName],
            id v3 = objc_claimAutoreleasedReturnValue(),
            ([v3 isEqualToString:&stru_1F23304F0] & 1) == 0))
      {
      }
      else
      {
        uint64_t v7 = [v5 renderedTextsCount];
        if (v6) {

        }
        if (!v7) {
          goto LABEL_10;
        }
      }
    }
    BOOL v8 = 1;
    goto LABEL_13;
  }
LABEL_10:
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

+ (BOOL)isNlContextPresent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  BOOL v5 = v3
    && ([v3 activeTasksCount]
     || [v4 executedTasksCount]
     || [v4 systemDialogActsCount]);

  return v5;
}

+ (id)convertTurnContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    BOOL v5 = 0;
    goto LABEL_21;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0B28]);
  BOOL v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
  int v6 = [v3 nlContext];
  BOOL v7 = +[SiriNLUSELFLogUtils isNlContextPresent:v6];

  if (v7)
  {
    BOOL v8 = [v3 nlContext];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertNLContext:v8];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setNlContext:v10];
LABEL_9:
    }
  }
  else
  {
    uint64_t v11 = [v3 legacyNlContext];
    BOOL v12 = +[SiriNLUSELFLogUtils isLegacyNlContextPresent:v11];

    if (!v12)
    {
      uint64_t v9 = 0;
      goto LABEL_11;
    }
    uint64_t v13 = [v3 legacyNlContext];
    uint64_t v9 = +[SiriNLUSELFLogUtils convertLegacyNLContext:v13];

    if (v9)
    {
      uint64_t v10 = [v9 mainItem];
      [v4 setLegacyNlContext:v10];
      goto LABEL_9;
    }
  }
LABEL_11:
  [(SiriInstrumentationObjectContainer *)v5 setMainItem:v4];
  if (v9)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v14 = objc_msgSend(v9, "tier1Events", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v14);
          }
          [(SiriInstrumentationObjectContainer *)v5 addTier1Event:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
LABEL_21:

  return v5;
}

+ (id)convertTurnInput:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0B30]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    BOOL v5 = [v3 asrOutputs];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (v9)
          {
            uint64_t v10 = [v9 idA];
            uint64_t v11 = +[SiriNLUSELFLogUtils convertUUID:v10];
            [v4 addAsrHypothesisIds:v11];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v6);
    }

    objc_msgSend(v4, "setIsTapToEdit:", objc_msgSend(v3, "tapToEdit"));
    BOOL v12 = objc_alloc_init(SiriInstrumentationObjectContainer);
    uint64_t v13 = [v3 turnContext];
    uint64_t v14 = +[SiriNLUSELFLogUtils convertTurnContext:v13];

    if (v14)
    {
      uint64_t v15 = [v14 mainItem];
      [v4 setTurnContext:v15];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v16 = objc_msgSend(v14, "tier1Events", 0);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v16);
            }
            [(SiriInstrumentationObjectContainer *)v12 addTier1Event:*(void *)(*((void *)&v21 + 1) + 8 * j)];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v17);
      }
    }
    [(SiriInstrumentationObjectContainer *)v12 setMainItem:v4];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)getObjCUsoGraphFromOntologyUsoGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph
{
  id v3 = *(siri::ontology::UsoGraphProtoWriter **)a3.var0.var0;
  if (*(void *)a3.var0.var0)
  {
    BOOL v5 = &unk_1F232F360;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    siri::ontology::UsoGraphProtoWriter::toProtobuf(v3, (const siri::ontology::UsoGraph *)&v5, (sirinluexternal::UsoGraph *)a3.var0.var0);
    operator new();
  }
  return 0;
}

+ (id)convertUsoEntitySpanTier1:(id)a3 index:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  if (v30)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FA1498]);
    [v5 setIndex:a4];
    if ([v30 hasOriginAppId])
    {
      long long v6 = [v30 originAppId];
      long long v7 = [v6 value];
      [v5 setOriginAppId:v7];
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v8 = [v30 properties];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v13 = objc_alloc_init(MEMORY[0x1E4FA14E0]);
          uint64_t v14 = [v12 key];
          [v13 setKey:v14];

          if ([v12 hasValueString])
          {
            uint64_t v15 = [v12 valueString];
            uint64_t v16 = [v15 value];
            [v13 setValueString:v16];
          }
          if ([v12 hasValueInt])
          {
            uint64_t v17 = [v12 valueInt];
            objc_msgSend(v13, "setValueInt:", objc_msgSend(v17, "value"));
          }
          if ([v12 hasValueFloat])
          {
            uint64_t v18 = [v12 valueFloat];
            [v18 value];
            objc_msgSend(v13, "setValueFloat:");
          }
          [v5 addProperties:v13];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v9);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v19 = [v30 alternatives];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v19);
          }
          long long v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          id v24 = objc_alloc_init(MEMORY[0x1E4FA1468]);
          long long v25 = [v23 alternative];
          [v24 setAlternative:v25];

          if ([v23 hasProbability])
          {
            long long v26 = [v23 probability];
            [v26 value];
            objc_msgSend(v24, "setProbability:");
          }
          [v5 addAlternatives:v24];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v20);
    }

    if ([v30 hasOriginEntityId])
    {
      long long v27 = [v30 originEntityId];
      long long v28 = [v27 value];
      [v5 setOriginEntityId:v28];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertUsoEntityIdentifierTier1:(id)a3 index:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA1488]);
    [v6 setIndex:a4];
    long long v7 = [v5 value];
    [v6 setValue:v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)convertUsoNodeDataTier1:(id)a3 index:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA14D8]);
    [v6 setIndex:a4];
    if ([v5 hasStringPayload])
    {
      long long v7 = [v5 stringPayload];
      long long v8 = [v7 value];
      [v6 setStringPayload:v8];
    }
    if ([v5 hasIntegerPayload])
    {
      uint64_t v9 = [v5 integerPayload];
      objc_msgSend(v6, "setIntegerPayload:", objc_msgSend(v9, "value"));
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = objc_msgSend(v5, "normalizedStringPayloads", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          [v6 addNormalizedStringPayloads:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)convertUtteranceSpan:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA14F0]);
    if ([v3 hasStartIndex]) {
      objc_msgSend(v4, "setStartIndex:", objc_msgSend(v3, "startIndex"));
    }
    if ([v3 hasEndIndex]) {
      objc_msgSend(v4, "setEndIndex:", objc_msgSend(v3, "endIndex"));
    }
    if ([v3 hasStartUnicodeScalarIndex]) {
      objc_msgSend(v4, "setStartUnicodeScalarIndex:", objc_msgSend(v3, "startUnicodeScalarIndex"));
    }
    if ([v3 hasEndUnicodeScalarIndex]) {
      objc_msgSend(v4, "setEndUnicodeScalarIndex:", objc_msgSend(v3, "endUnicodeScalarIndex"));
    }
    if ([v3 hasStartMilliSeconds]) {
      objc_msgSend(v4, "setStartMilliseconds:", objc_msgSend(v3, "startMilliSeconds"));
    }
    if ([v3 hasEndMilliSeconds]) {
      objc_msgSend(v4, "setEndMilliseconds:", objc_msgSend(v3, "endMilliSeconds"));
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertUtteranceAlignment:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA14E8]);
    if ([v3 hasAsrHypothesisIndex]) {
      objc_msgSend(v4, "setAsrHypothesisIndex:", objc_msgSend(v3, "asrHypothesisIndex"));
    }
    if ([v3 hasNodeIndex]) {
      objc_msgSend(v4, "setNodeIndex:", objc_msgSend(v3, "nodeIndex"));
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(v3, "spans", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = +[SiriNLUSELFLogUtils convertUtteranceSpan:*(void *)(*((void *)&v11 + 1) + 8 * i)];
          [v4 addSpans:v9];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (int)convertUsoBackingAppBundleType:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[SiriNLUSELFLogUtils getAppBundleTypeEnumsMapping];
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 objectForKey:v3];
      uint64_t v7 = v6;
      if (v6) {
        int v8 = [v6 intValue];
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (id)convertUsoEntitySpan:(id)a3 index:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA1490]);
    if (a4 == -1) {
      a4 = [v5 nodeIndex];
    }
    [v6 setNodeIndex:a4];
    if ([v5 hasSourceComponent]) {
      uint64_t v7 = +[SiriNLUSELFLogUtils convertUSOEntitySpanNluComponent:](SiriNLUSELFLogUtils, "convertUSOEntitySpanNluComponent:", [v5 sourceComponent]);
    }
    else {
      uint64_t v7 = 0;
    }
    [v6 setSourceComponent:v7];
    if ([v5 hasLabel])
    {
      int v8 = [v5 label];
      uint64_t v9 = [v8 value];
      [v6 setLabel:v9];
    }
    if ([v5 hasMatchInfo])
    {
      uint64_t v10 = [v5 matchInfo];
      long long v11 = +[SiriNLUSELFLogUtils convertMatchInfo:v10];
      [v6 setMatchInfo:v11];
    }
    if ([v5 hasStartIndex])
    {
      long long v12 = [v5 startIndex];
      objc_msgSend(v6, "setStartIndex:", objc_msgSend(v12, "value"));
    }
    if ([v5 hasEndIndex])
    {
      long long v13 = [v5 endIndex];
      objc_msgSend(v6, "setEndIndex:", objc_msgSend(v13, "value"));
    }
    if ([v5 hasOriginAppId])
    {
      long long v14 = [v5 originAppId];
      long long v15 = [v14 value];
      objc_msgSend(v6, "setOriginAppBundleIdType:", +[SiriNLUSELFLogUtils convertUsoBackingAppBundleType:](SiriNLUSELFLogUtils, "convertUsoBackingAppBundleType:", v15));
    }
    else
    {
      [v6 setOriginAppBundleIdType:0];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)convertUsoEntitySpan:(id)a3
{
  id v3 = +[SiriNLUSELFLogUtils convertUsoEntitySpan:a3 index:-1];
  return v3;
}

+ (id)convertMatchInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA14C8]);
    if ([v3 hasMatchSignalBitset]) {
      objc_msgSend(v4, "setMatchSignalBitset:", objc_msgSend(v3, "matchSignalBitset"));
    }
    if ([v3 hasMatchScore])
    {
      id v5 = [v3 matchScore];
      [v5 value];
      objc_msgSend(v4, "setMatchScore:");
    }
    if ([v3 hasMaxTokenCount])
    {
      id v6 = [v3 maxTokenCount];
      objc_msgSend(v4, "setMaxTokenCount:", objc_msgSend(v6, "value"));
    }
    if ([v3 hasMatchedTokenCount])
    {
      uint64_t v7 = [v3 matchedTokenCount];
      objc_msgSend(v4, "setMatchedTokenCount:", objc_msgSend(v7, "value"));
    }
    if ([v3 hasMaxStopWordCount])
    {
      int v8 = [v3 maxStopWordCount];
      objc_msgSend(v4, "setMaxStopWordCount:", objc_msgSend(v8, "value"));
    }
    if ([v3 hasMatchedStopWordCount])
    {
      uint64_t v9 = [v3 matchedStopWordCount];
      objc_msgSend(v4, "setMatchedStopWordCount:", objc_msgSend(v9, "value"));
    }
    if ([v3 hasEditDistance])
    {
      uint64_t v10 = [v3 editDistance];
      objc_msgSend(v4, "setEditDistance:", objc_msgSend(v10, "value"));
    }
    if ([v3 hasMaxAliasCount])
    {
      long long v11 = [v3 maxAliasCount];
      objc_msgSend(v4, "setMaxAliasCount:", objc_msgSend(v11, "value"));
    }
    if ([v3 hasMatchedAliasCount])
    {
      long long v12 = [v3 matchedAliasCount];
      objc_msgSend(v4, "setMatchedAliasCount:", objc_msgSend(v12, "value"));
    }
    for (unint64_t i = 0; [v3 matchedAliasTypesCount] > i; ++i)
      objc_msgSend(v4, "addMatchedAliasTypes:", +[SiriNLUSELFLogUtils convertMatchInfoAliasType:](SiriNLUSELFLogUtils, "convertMatchInfoAliasType:", objc_msgSend(v3, "matchedAliasTypesAtIndex:", i)));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertUsoEntityIdentifier:(id)a3 index:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA1480]);
    if (a4 == -1) {
      a4 = [v5 nodeIndex];
    }
    [v6 setNodeIndex:a4];
    if ([v5 hasProbability])
    {
      uint64_t v7 = [v5 probability];
      [v7 value];
      objc_msgSend(v6, "setProbability:");
    }
    if ([v5 hasNamespaceA])
    {
      int v8 = [v5 namespaceA];
      uint64_t v9 = [v8 value];
      [v6 setIdentifierNamespace:v9];
    }
    if ([v5 hasSourceComponent]) {
      uint64_t v10 = +[SiriNLUSELFLogUtils convertUSOEntityIdentifierNluComponent:](SiriNLUSELFLogUtils, "convertUSOEntityIdentifierNluComponent:", [v5 sourceComponent]);
    }
    else {
      uint64_t v10 = 0;
    }
    [v6 setSourceNluComponent:v10];
    if ([v5 hasBackingAppBundleId])
    {
      long long v11 = [v5 backingAppBundleId];
      objc_msgSend(v6, "setBackingAppBundleType:", +[SiriNLUSELFLogUtils convertUsoBackingAppBundleType:](SiriNLUSELFLogUtils, "convertUsoBackingAppBundleType:", v11));
    }
    else
    {
      [v6 setBackingAppBundleType:0];
    }
    if ([v5 hasGroupIndex]) {
      objc_msgSend(v6, "setGroupIndex:", objc_msgSend(v5, "groupIndex"));
    }
    if ([v5 hasInterpretationGroup]) {
      objc_msgSend(v6, "setInterpretationGroup:", objc_msgSend(v5, "interpretationGroup"));
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)convertUsoEntityIdentifier:(id)a3
{
  id v3 = +[SiriNLUSELFLogUtils convertUsoEntityIdentifier:a3 index:-1];
  return v3;
}

+ (id)convertUsoEdge:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA1470]);
    objc_msgSend(v4, "setFromIndex:", objc_msgSend(v3, "fromIndex"));
    objc_msgSend(v4, "setToIndex:", objc_msgSend(v3, "toIndex"));
    if ([v3 hasLabel])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4FA1478]);
      id v6 = [v3 label];
      objc_msgSend(v5, "setUsoElementId:", objc_msgSend(v6, "usoElementId"));

      uint64_t v7 = [v3 label];
      objc_msgSend(v5, "setEnumeration:", objc_msgSend(v7, "enumeration"));

      int v8 = [v3 label];
      int v9 = [v8 hasBaseEdgeLabel];

      if (v9)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4FA14C0]);
        long long v11 = [v3 label];
        long long v12 = [v11 baseEdgeLabel];
        long long v13 = [v12 value];
        [v10 setValue:v13];

        [v5 setBaseEdgeLabel:v10];
      }
      [v4 setLabel:v5];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertUsoNode:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA14D0]);
    if ([v3 hasUsoElementId]) {
      objc_msgSend(v4, "setUsoElementId:", objc_msgSend(v3, "usoElementId"));
    }
    if ([v3 hasUsoVerbElementId])
    {
      id v5 = [v3 usoVerbElementId];
      objc_msgSend(v4, "setUsoVerbElementId:", objc_msgSend(v5, "value"));
    }
    if ([v3 hasEntityLabel])
    {
      id v6 = [v3 entityLabel];
      [v4 setEntityLabel:v6];
    }
    if ([v3 hasVerbLabel])
    {
      uint64_t v7 = [v3 verbLabel];
      [v4 setVerbLabel:v7];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertNonTier1UsoGraph:(id)a3 identifiers:(id)a4 entitySpans:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FA14A8]);
    long long v11 = [v7 version];
    long long v12 = +[SiriNLUSELFLogUtils convertVersion:v11];
    [v10 setVersion:v12];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v13 = [v7 nodes];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v71 objects:v81 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v72 != v15) {
            objc_enumerationMutation(v13);
          }
          long long v17 = +[SiriNLUSELFLogUtils convertUsoNode:*(void *)(*((void *)&v71 + 1) + 8 * i)];
          [v10 addNodes:v17];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v71 objects:v81 count:16];
      }
      while (v14);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v18 = [v7 edges];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v67 objects:v80 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v68 != v20) {
            objc_enumerationMutation(v18);
          }
          long long v22 = +[SiriNLUSELFLogUtils convertUsoEdge:*(void *)(*((void *)&v67 + 1) + 8 * j)];
          [v10 addEdges:v22];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v67 objects:v80 count:16];
      }
      while (v19);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v23 = [v7 alignments];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v63 objects:v79 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v64 != v25) {
            objc_enumerationMutation(v23);
          }
          long long v27 = +[SiriNLUSELFLogUtils convertUtteranceAlignment:*(void *)(*((void *)&v63 + 1) + 8 * k)];
          [v10 addAlignments:v27];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v63 objects:v79 count:16];
      }
      while (v24);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v28 = [v7 identifiers];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v78 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v60;
      do
      {
        for (uint64_t m = 0; m != v29; ++m)
        {
          if (*(void *)v60 != v30) {
            objc_enumerationMutation(v28);
          }
          long long v32 = +[SiriNLUSELFLogUtils convertUsoEntityIdentifier:*(void *)(*((void *)&v59 + 1) + 8 * m)];
          [v10 addIdentifiers:v32];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v78 count:16];
      }
      while (v29);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v33 = [v7 spans];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v55 objects:v77 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v56;
      do
      {
        for (uint64_t n = 0; n != v34; ++n)
        {
          if (*(void *)v56 != v35) {
            objc_enumerationMutation(v33);
          }
          long long v37 = +[SiriNLUSELFLogUtils convertUsoEntitySpan:*(void *)(*((void *)&v55 + 1) + 8 * n)];
          [v10 addSpans:v37];
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v55 objects:v77 count:16];
      }
      while (v34);
    }

    if (v8)
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v38 = v8;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v76 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v52;
        do
        {
          for (iuint64_t i = 0; ii != v39; ++ii)
          {
            if (*(void *)v52 != v40) {
              objc_enumerationMutation(v38);
            }
            [v10 addIdentifiers:*(void *)(*((void *)&v51 + 1) + 8 * ii)];
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v76 count:16];
        }
        while (v39);
      }
    }
    if (v9)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v42 = v9;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v47 objects:v75 count:16];
      if (v43)
      {
        uint64_t v44 = *(void *)v48;
        do
        {
          for (juint64_t j = 0; jj != v43; ++jj)
          {
            if (*(void *)v48 != v44) {
              objc_enumerationMutation(v42);
            }
            objc_msgSend(v10, "addSpans:", *(void *)(*((void *)&v47 + 1) + 8 * jj), (void)v47);
          }
          uint64_t v43 = [v42 countByEnumeratingWithState:&v47 objects:v75 count:16];
        }
        while (v43);
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)convertNonTier1UsoGraph:(id)a3
{
  id v3 = +[SiriNLUSELFLogUtils convertNonTier1UsoGraph:a3 identifiers:0 entitySpans:0];
  return v3;
}

+ (id)convertUsoGraph:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (siri::ontology *)a3;
  id v9 = v3;
  if (v3)
  {
    SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v3);
    uint64_t v6 = *SharedUsoVocabManager;
    id v5 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v8 = v5;
    +[SiriNLUTypesConverterUtils convertUsoGraphFromObjCToCpp:v9];
    if (v8)
    {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v10 = v6;
      long long v11 = v8;
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    else
    {
      uint64_t v10 = v6;
      long long v11 = 0;
    }
    siri::ontology::UsoGraphProtoReader::fromProtobuf((siri::ontology::UsoGraphProtoReader *)&v10, v12);
  }

  return 0;
}

+ (id)convertVersion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA1388]);
    objc_msgSend(v4, "setMajor:", objc_msgSend(v3, "majorVersion"));
    objc_msgSend(v4, "setMinor:", objc_msgSend(v3, "minorVersion"));
    objc_msgSend(v4, "setPatch:", objc_msgSend(v3, "patchVersion"));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)createDelegatedUserDialogActTier1Event:(id)a3 withLinkId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0A38]);
    [v7 setLinkId:v6];
    if ([v5 hasRewrite])
    {
      id v8 = [v5 rewrite];
      int v9 = [v8 rewriteType];

      if (v9 != 3)
      {
        uint64_t v10 = [v5 rewrite];
        long long v11 = [v10 rewrittenUtterance];
        [v7 setRewrittenUtterance:v11];
      }
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
    [v12 setCdmDelegatedUserDialogActTier1:v7];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)createSystemDialogActTier1Event:(id)a3 withLinkId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0AD0]);
    [v7 setLinkId:v6];
    if ([v5 hasRenderedText])
    {
      id v8 = [v5 renderedText];
      int v9 = [v8 value];
      [v7 setRenderedText:v9];
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
    [v10 setCdmSystemDialogActTier1:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)createNLXLegacyNLContextTier1Event:(id)a3 withLinkId:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0C80]);
    [v7 setLinkId:v6];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = objc_msgSend(v5, "renderedTexts", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (v12 && [*(id *)(*((void *)&v16 + 1) + 8 * i) hasValue])
          {
            uint64_t v13 = [v12 value];
            [v7 addRenderedTexts:v13];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
    [v14 setNlxLegacyNLContextTier1:v7];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)createCdmXpcEventProcessingFailedLog:(id)a3 reason:(int)a4 errorCode:(unsigned int)a5 metadata:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4FA0BA0]);
  [v11 setReason:v8];
  [v11 setErrorCode:v7];
  id v12 = objc_alloc_init(MEMORY[0x1E4FA0B90]);
  [v12 setFailed:v11];
  if (v9)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v9];
    [v12 setContextId:v13];
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v14 setEventMetadata:v10];
  [v14 setCdmXpcEventProcessingContext:v12];
  uint64_t v15 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v15 setMainEvent:v14];

  return v15;
}

+ (id)createCdmXpcEventProcessingEndedLog:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0B98]);
  [v7 setExists:1];
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0B90]);
  [v8 setEnded:v7];
  if (v5)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v5];
    [v8 setContextId:v9];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v10 setEventMetadata:v6];
  [v10 setCdmXpcEventProcessingContext:v8];
  id v11 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v11 setMainEvent:v10];

  return v11;
}

+ (id)createCdmXpcEventProcessingStartedLog:(id)a3 xpcType:(int)a4 xpcSystemEventType:(int)a5 serviceName:(int)a6 metadata:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a7;
  id v13 = objc_alloc_init(MEMORY[0x1E4FA0BA8]);
  [v13 setXpcType:v10];
  [v13 setXpcSystemEventType:v9];
  [v13 setServiceName:v8];
  id v14 = objc_alloc_init(MEMORY[0x1E4FA0B90]);
  [v14 setStartedOrChanged:v13];
  if (v11)
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v11];
    [v14 setContextId:v15];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v16 setEventMetadata:v12];
  [v16 setCdmXpcEventProcessingContext:v14];
  long long v17 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v17 setMainEvent:v16];

  return v17;
}

+ (id)createContextUpdateEndedLog:(id)a3 contextUpdateResponse:(id)a4 metadata:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v7 = a4;
  id v25 = a5;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FA0A20]);
    if (v24)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v24];
      [v8 setContextId:v9];
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (unint64_t i = 0; objc_msgSend(v7, "reformedTurnInputBundlesCount", v24) > i; ++i)
    {
      id v12 = [v7 reformedTurnInputBundlesAtIndex:i];
      id v13 = +[SiriNLUSELFLogUtils convertReformedTurnInputBundle:v12];

      if (v13)
      {
        id v14 = [v13 mainItem];
        [v8 addReformedTurnInputBundles:v14];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v15 = [v13 tier1Events];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v27 != v17) {
                objc_enumerationMutation(v15);
              }
              [v10 addObject:*(void *)(*((void *)&v26 + 1) + 8 * j)];
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v16);
        }
      }
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
    [v19 setEventMetadata:v25];
    [v19 setCdmContextUpdateEnded:v8];
    uint64_t v20 = objc_alloc_init(SiriInstrumentationEventContainer);
    [(SiriInstrumentationEventContainer *)v20 setMainEvent:v19];
    uint64_t v21 = (void *)[v10 copy];
    [(SiriInstrumentationEventContainer *)v20 setTier1Events:v21];

    long long v22 = [(SiriInstrumentationEventContainer *)v20 tier1Events];
    +[SiriNLUSELFLogUtils populateEventsWithMetadata:v22 metadata:v25];
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

+ (id)createMultiHypoTokenizationEndedLog:(id)a3 tokenizationResponses:(id)a4 tokenizationInputType:(int)a5 metadata:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v9 = a4;
  id v21 = a6;
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FA0B20]);
    if (v22)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v22];
      [v10 setContextId:v11];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "tokenChain", v21);
          uint64_t v17 = +[SiriNLUSELFLogUtils convertTokenChain:v16];
          [v10 addTokenChains:v17];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    [v10 setInputType:v7];
    id v18 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
    [v18 setEventMetadata:v21];
    [v18 setCdmTokenizationEnded:v10];
    id v19 = objc_alloc_init(SiriInstrumentationEventContainer);
    [(SiriInstrumentationEventContainer *)v19 setMainEvent:v18];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)createTokenizationEndedLog:(id)a3 tokenizationResponse:(id)a4 tokenizationInputType:(int)a5 metadata:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4FA0B20]);
    if (v9)
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v9];
      [v12 setContextId:v13];
    }
    uint64_t v14 = [v10 tokenChain];
    uint64_t v15 = +[SiriNLUSELFLogUtils convertTokenChain:v14];
    [v12 addTokenChains:v15];

    [v12 setInputType:v7];
    id v16 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
    [v16 setEventMetadata:v11];
    [v16 setCdmTokenizationEnded:v12];
    uint64_t v17 = objc_alloc_init(SiriInstrumentationEventContainer);
    [(SiriInstrumentationEventContainer *)v17 setMainEvent:v16];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)createTokenizationEndedLog:(id)a3 tokenizationResponse:(id)a4 metadata:(id)a5
{
  id v5 = +[SiriNLUSELFLogUtils createTokenizationEndedLog:a3 tokenizationResponse:a4 tokenizationInputType:0 metadata:a5];
  return v5;
}

+ (id)createMatchingSpanEndedLog:(id)a3 spanMatchResponse:(id)a4 metadata:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v7 = a4;
  id v32 = a5;
  if (v7)
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4FA0A58]);
    if (v31)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v31];
      [v33 setContextId:v8];
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4FA0A60]);
    id v11 = objc_alloc(MEMORY[0x1E4FA1378]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F29128]);
    uint64_t v13 = [v11 initWithNSUUID:v12];

    uint64_t v30 = (void *)v13;
    [v33 setLinkId:v13];
    [v10 setLinkId:v13];
    for (unint64_t i = 0; [v7 matchingSpansCount] > i; ++i)
    {
      uint64_t v15 = [v7 matchingSpansAtIndex:i];
      id v16 = +[SiriNLUSELFLogUtils convertMatchingSpan:v15];

      if (v16)
      {
        uint64_t v17 = [v16 mainItem];
        [v33 addMatchingSpans:v17];

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v18 = [v16 tier1Events];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(v18);
              }
              [v9 addObject:*(void *)(*((void *)&v34 + 1) + 8 * j)];
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v19);
        }
      }
      id v22 = [v7 matchingSpansAtIndex:i];
      long long v23 = +[SiriNLUSELFLogUtils convertMatchingSpanTier1:v22];

      [v10 addMatchingSpans:v23];
    }
    id v24 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
    [v24 setEventMetadata:v32];
    [v24 setCdmMatchingSpanEndedTier1:v10];
    [v9 addObject:v24];
    id v25 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
    [v25 setEventMetadata:v32];
    [v25 setCdmMatchingSpanEnded:v33];
    long long v26 = objc_alloc_init(SiriInstrumentationEventContainer);
    [(SiriInstrumentationEventContainer *)v26 setMainEvent:v25];
    long long v27 = (void *)[v9 copy];
    [(SiriInstrumentationEventContainer *)v26 setTier1Events:v27];

    uint64_t v28 = [(SiriInstrumentationEventContainer *)v26 tier1Events];
    +[SiriNLUSELFLogUtils populateEventsWithMetadata:v28 metadata:v32];
  }
  else
  {
    long long v26 = 0;
  }

  return v26;
}

+ (id)createCDMSetupMissingAssetsDetectedLog:(id)a3 services:(id)a4 metadata:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0AB8]);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v7];
  [v10 setContextId:v11];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v10, "addServicesMissingAsset:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "intValue", (void)v19));
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v16 setEventMetadata:v9];
  [v16 setCdmSetupMissingAssetsDetected:v10];
  uint64_t v17 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v17 setMainEvent:v16];

  return v17;
}

+ (id)createCDMAssetSetupFailedLog:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 metadata:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4FA09C8]);
  [v11 setErrorDomain:v8];
  [v11 setErrorCode:v7];
  id v12 = objc_alloc_init(MEMORY[0x1E4FA09B8]);
  [v12 setFailed:v11];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v9];
  [v12 setContextId:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v14 setEventMetadata:v10];
  [v14 setCdmAssetSetupContext:v12];
  uint64_t v15 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v15 setMainEvent:v14];

  return v15;
}

+ (id)createCDMAllServicesWarmupFailedLog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA09A8]);
  [v4 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0998]);
  [v5 setFailed:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v6 setEventMetadata:v3];
  [v6 setCdmAllServicesWarmupContext:v5];
  uint64_t v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v7 setMainEvent:v6];

  return v7;
}

+ (id)createCDMClientWarmupFailedLog:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0A10]);
  [v8 setErrorDomain:v6];
  [v8 setErrorCode:v5];
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0A00]);
  [v9 setFailed:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v10 setEventMetadata:v7];
  [v10 setCdmClientWarmupContext:v9];
  id v11 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v11 setMainEvent:v10];

  return v11;
}

+ (id)createCDMClientWarmupEndedLog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0A08]);
  [v4 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0A00]);
  [v5 setEnded:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v6 setEventMetadata:v3];
  [v6 setCdmClientWarmupContext:v5];
  id v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v7 setMainEvent:v6];

  return v7;
}

+ (id)createCDMClientWarmupStartedLog:(id)a3 cdmServiceGraphName:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0A18]);
  [v6 setServiceGraphName:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0A00]);
  [v7 setStartedOrChanged:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v8 setEventMetadata:v5];
  [v8 setCdmClientWarmupContext:v7];
  id v9 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v9 setMainEvent:v8];

  return v9;
}

+ (id)createCDMAllServicesSetupFailedLog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA0988]);
  [v4 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0978]);
  [v5 setFailed:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v6 setEventMetadata:v3];
  [v6 setCdmAllServicesSetupContext:v5];
  id v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v7 setMainEvent:v6];

  return v7;
}

+ (id)createCDMClientSetupFailedLog:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4FA09F0]);
  [v8 setErrorDomain:v6];
  [v8 setErrorCode:v5];
  id v9 = objc_alloc_init(MEMORY[0x1E4FA09E0]);
  [v9 setFailed:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v10 setEventMetadata:v7];
  [v10 setCdmClientSetupContext:v9];
  id v11 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v11 setMainEvent:v10];

  return v11;
}

+ (id)createCDMRequestFailedLog:(int)a3 errorDomainString:(id)a4 errorCode:(int)a5 metadata:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4FA0AA8]);
  [v11 setCode:v8];
  objc_msgSend(v11, "setErrorDomain:", +[SiriNLUSELFLogUtils getErrorDomain:](SiriNLUSELFLogUtils, "getErrorDomain:", v9));
  [v11 setErrorCode:v7];
  id v12 = objc_alloc_init(MEMORY[0x1E4FA0A98]);
  [v12 setFailed:v11];
  id v13 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v13 setEventMetadata:v10];
  [v13 setCdmRequestContext:v12];
  id v14 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v14 setMainEvent:v13];

  return v14;
}

+ (id)createCDMRequestFailedLog:(int)a3 metadata:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0AA8]);
  [v6 setCode:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0A98]);
  [v7 setFailed:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v8 setEventMetadata:v5];
  [v8 setCdmRequestContext:v7];
  id v9 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v9 setMainEvent:v8];

  return v9;
}

+ (id)createCDMRequestEndedLog:(id)a3 metadata:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a4;
  id v29 = objc_alloc_init(MEMORY[0x1E4FA0AA0]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v28)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = [v28 parses];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = +[SiriNLUSELFLogUtils convertUserParse:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          id v11 = v10;
          if (v10)
          {
            id v12 = [v10 mainItem];
            [v29 addParses:v12];

            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            id v13 = [v11 tier1Events];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v31;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v31 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  [v5 addObject:*(void *)(*((void *)&v30 + 1) + 8 * j)];
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v14);
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v7);
    }

    uint64_t v17 = [v28 languageVariantResult];
    BOOL v18 = v17 == 0;

    if (!v18)
    {
      long long v19 = [v28 languageVariantResult];
      long long v20 = +[SiriNLUSELFLogUtils convertLvcResult:v19];
      [v29 setLanguageVariantClassifierResult:v20];
    }
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4FA0A98]);
  [v21 setEnded:v29];
  id v22 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v22 setEventMetadata:v27];
  [v22 setCdmRequestContext:v21];
  long long v23 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v23 setMainEvent:v22];
  uint64_t v24 = (void *)[v5 copy];
  [(SiriInstrumentationEventContainer *)v23 setTier1Events:v24];

  id v25 = [(SiriInstrumentationEventContainer *)v23 tier1Events];
  +[SiriNLUSELFLogUtils populateEventsWithMetadata:v25 metadata:v27];

  return v23;
}

+ (id)createCDMRequestStartedLog:(id)a3 metadata:(id)a4 cdmServiceGraphName:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0AB0]);
  id v10 = objc_alloc_init(SiriInstrumentationEventContainer);
  if (v7)
  {
    id v11 = [v7 currentTurnInput];
    id v12 = +[SiriNLUSELFLogUtils convertTurnInput:v11];

    id v13 = [v7 requestId];
    if (v13)
    {
      uint64_t v14 = [v7 requestId];
      int v15 = [v14 hasLoggableUserId];

      if (v15)
      {
        id v16 = [v7 requestId];
        uint64_t v17 = [v16 loggableUserId];
        [v9 setLoggableSharedUserId:v17];
      }
    }
    if (v12)
    {
      BOOL v18 = [v12 mainItem];
      [v9 setCurrentTurnInput:v18];

      long long v19 = [v12 tier1Events];
      long long v20 = (void *)[v19 copy];
      [(SiriInstrumentationEventContainer *)v10 setTier1Events:v20];

      id v21 = [(SiriInstrumentationEventContainer *)v10 tier1Events];
      +[SiriNLUSELFLogUtils populateEventsWithMetadata:v21 metadata:v8];
    }
  }
  [v9 setServiceGraphName:v5];
  id v22 = objc_alloc_init(MEMORY[0x1E4FA0A98]);
  [v22 setStartedOrChanged:v9];
  id v23 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v23 setEventMetadata:v8];
  [v23 setCdmRequestContext:v22];
  [(SiriInstrumentationEventContainer *)v10 setMainEvent:v23];

  return v10;
}

+ (id)createNLXCurareContext:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0C70]);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v5];
  [v7 setCurareId:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v9 setNlxCurareContext:v7];
  [v9 setEventMetadata:v6];
  id v10 = objc_alloc_init(SiriInstrumentationEventContainer);
  [(SiriInstrumentationEventContainer *)v10 setMainEvent:v9];

  return v10;
}

+ (id)createNLXRequestLinkWithTarget:(int)a3 andTargetId:(id)a4 metadata:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4FA12F8]);
  id v10 = objc_alloc_init(MEMORY[0x1E4FA1308]);
  [v10 setComponent:7];
  id v11 = [v8 nlId];
  [v10 setUuid:v11];

  [v9 setSource:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4FA1308]);
  [v12 setComponent:v6];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v7];
  [v12 setUuid:v13];

  [v9 setTarget:v12];
  return v9;
}

+ (id)createNLXClientEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithSubRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = objc_alloc_init(MEMORY[0x1E4FA0C68]);
  long long v19 = +[SiriNLUSELFLogUtils convertUUID:v13];
  [v18 setNlId:v19];

  long long v20 = +[SiriNLUSELFLogUtils convertUUID:v14];
  [v18 setTrpId:v20];

  id v21 = +[SiriNLUSELFLogUtils convertUUID:v15];
  [v18 setRequestId:v21];

  id v22 = +[SiriNLUSELFLogUtils convertUUID:v16];
  [v18 setSubRequestId:v22];

  [v18 setResultCandidateId:v17];
  objc_msgSend(v18, "setComponentInvocationSource:", +[SiriNLUSELFLogUtils convertComponentInvocationSource:](SiriNLUSELFLogUtils, "convertComponentInvocationSource:", *a8));

  return v18;
}

+ (void)populateEventsWithMetadata:(id)a3 metadata:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setEventMetadata:", v6, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

@end