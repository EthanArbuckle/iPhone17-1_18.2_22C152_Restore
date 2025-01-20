@interface WBSBiomeDonationManager
+ (BOOL)isBiomeStreamDonationAvailable;
+ (WBSBiomeDonationManager)sharedManager;
+ (int64_t)entityComponentTypeFromResult:(id)a3;
- (BOOL)donateForDiagnosticLoggingKey:(id)a3 value:(id)a4 webPageLoadedOverPrivateRelay:(BOOL)a5;
- (WBSBiomeDonationManager)init;
- (_WBSBiomeStream)_windowProxyStream;
- (id)_autoPlayStream;
- (id)_browsingAssistantStream;
- (id)_getVisualComponentAttributeFromComponentType:(int64_t)a3;
- (id)_navigationsStream;
- (id)_pageLoadStream;
- (id)_webAppInFocusStream;
- (id)_webPagePerformanceStream;
- (int)_biomeDeviceClassForUserAgent:(int64_t)a3;
- (int)_biomePageLoadDeviceClassForUserAgent:(int64_t)a3;
- (int)_biomeSignalForAutoPlaySignal:(int64_t)a3;
- (int)_biomeWebAppInFocusWebAppTypeForWebAppType:(int64_t)a3;
- (int)_webPerformanceEventForDiagnosticLoggingKey:(id)a3;
- (void)_clearEventsDonatedSinceDate:(id)a3;
- (void)_donateBrowsingAssistantEvents:(id)a3 dimensionContext:(id)a4 bloomFilterPassed:(id)a5 eligible:(id)a6 webpageUrlSent:(id)a7 serverRequest:(id)a8 render:(id)a9 userInteraction:(id)a10;
- (void)_donateWebPagePerformanceEventWithEvent:(int)a3 domain:(id)a4 webPageLoadedOverPrivateRelay:(BOOL)a5;
- (void)clearEventsDonatedSinceDate:(id)a3;
- (void)donateAutoPlayEventWithSignal:(int64_t)a3 domain:(id)a4 countryCode:(id)a5 webPageLoadedOverPrivateRelay:(BOOL)a6;
- (void)donateBrowsingAssistantBloomFilterPassedEventWithWebPageID:(id)a3;
- (void)donateBrowsingAssistantEligibleEventWithWebPageID:(id)a3;
- (void)donateBrowsingAssistantReaderEventWithWebPageID:(id)a3 eventType:(int64_t)a4 dataToReport:(id)a5;
- (void)donateBrowsingAssistantServerRequestEndedEventWithWebPageID:(id)a3 requestIdentifier:(id)a4;
- (void)donateBrowsingAssistantServerRequestFailedEventWithWebPageID:(id)a3 requestIdentifier:(id)a4;
- (void)donateBrowsingAssistantServerRequestStartedEventWithWebPageID:(id)a3 requestIdentifier:(id)a4 requestType:(int64_t)a5;
- (void)donateBrowsingAssistantUserInteractionDetectedWithWebPageID:(id)a3 componentType:(int64_t)a4 componentIdentifier:(id)a5 tableOfContentsArrayLength:(id)a6 tableOfContentsTextIndex:(id)a7 readerSectionExpanded:(BOOL)a8;
- (void)donateBrowsingAssistantVisualComponentPresentationEndedWithWebPageID:(id)a3 componentType:(int64_t)a4 componentIdentifier:(id)a5 hideReason:(int64_t)a6;
- (void)donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:(id)a3 componentType:(int64_t)a4 componentIdentifier:(id)a5 tableOfContentsArrayLength:(id)a6;
- (void)donateBrowsingAssistantWebPageStartedEventWithWebPageID:(id)a3;
- (void)donateBrowsingAssistantWebpageURLSentWithWebPageID:(id)a3 urlSent:(id)a4;
- (void)donateNavigationWithURL:(id)a3 userAgent:(int64_t)a4 wasPrivateRelayed:(BOOL)a5 statusCode:(int64_t)a6;
- (void)donatePageLoadWithUserAgent:(int64_t)a3 wasSearch:(BOOL)a4 wasPrivateBrowsing:(BOOL)a5 wasActualized:(BOOL)a6 provenance:(int64_t)a7;
- (void)donateWebAppInFocusEventWithStarting:(BOOL)a3 date:(id)a4 webAppType:(int64_t)a5 identifier:(id)a6 name:(id)a7 manifestId:(id)a8;
- (void)performPendingDeletionsBeforeTermination;
@end

@implementation WBSBiomeDonationManager

+ (BOOL)isBiomeStreamDonationAvailable
{
  return 1;
}

+ (WBSBiomeDonationManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)sharedManager_manager;
  return (WBSBiomeDonationManager *)v2;
}

void __40__WBSBiomeDonationManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSBiomeDonationManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
}

- (WBSBiomeDonationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)WBSBiomeDonationManager;
  v2 = [(WBSBiomeDonationManager *)&v10 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.WBSBiomeDonationManager.%@.%p._streamAccessQueue", objc_opt_class(), v2];
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    streamAccessQueue = v2->_streamAccessQueue;
    v2->_streamAccessQueue = (OS_dispatch_queue *)v6;

    v8 = v2;
  }

  return v2;
}

- (id)_autoPlayStream
{
  autoPlayStream = self->_autoPlayStream;
  if (!autoPlayStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = [(_WBSBiomeStream *)v4 initWithIdentifier:*MEMORY[0x1E4F4FBD0]];
    dispatch_queue_t v6 = self->_autoPlayStream;
    self->_autoPlayStream = v5;

    autoPlayStream = self->_autoPlayStream;
  }
  return autoPlayStream;
}

- (id)_navigationsStream
{
  navigationsStream = self->_navigationsStream;
  if (!navigationsStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = [(_WBSBiomeStream *)v4 initWithIdentifier:*MEMORY[0x1E4F4FBE0]];
    dispatch_queue_t v6 = self->_navigationsStream;
    self->_navigationsStream = v5;

    navigationsStream = self->_navigationsStream;
  }
  return navigationsStream;
}

- (id)_webPagePerformanceStream
{
  webPagePerformanceStream = self->_webPagePerformanceStream;
  if (!webPagePerformanceStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = [(_WBSBiomeStream *)v4 initWithIdentifier:*MEMORY[0x1E4F4FBF0]];
    dispatch_queue_t v6 = self->_webPagePerformanceStream;
    self->_webPagePerformanceStream = v5;

    webPagePerformanceStream = self->_webPagePerformanceStream;
  }
  return webPagePerformanceStream;
}

- (id)_webAppInFocusStream
{
  webAppInFocusStream = self->_webAppInFocusStream;
  if (!webAppInFocusStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = [(_WBSBiomeStream *)v4 initWithIdentifier:*MEMORY[0x1E4F4FBC0]];
    dispatch_queue_t v6 = self->_webAppInFocusStream;
    self->_webAppInFocusStream = v5;

    webAppInFocusStream = self->_webAppInFocusStream;
  }
  return webAppInFocusStream;
}

- (id)_pageLoadStream
{
  pageLoadStream = self->_pageLoadStream;
  if (!pageLoadStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = [(_WBSBiomeStream *)v4 initWithIdentifier:*MEMORY[0x1E4F4FBE8]];
    dispatch_queue_t v6 = self->_pageLoadStream;
    self->_pageLoadStream = v5;

    pageLoadStream = self->_pageLoadStream;
  }
  return pageLoadStream;
}

- (_WBSBiomeStream)_windowProxyStream
{
  windowProxyStream = self->_windowProxyStream;
  if (!windowProxyStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = [(_WBSBiomeStream *)v4 initWithIdentifier:*MEMORY[0x1E4F4FBF8]];
    dispatch_queue_t v6 = self->_windowProxyStream;
    self->_windowProxyStream = v5;

    windowProxyStream = self->_windowProxyStream;
  }
  return windowProxyStream;
}

- (id)_browsingAssistantStream
{
  browsingAssistantStream = self->_browsingAssistantStream;
  if (!browsingAssistantStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = [(_WBSBiomeStream *)v4 initWithIdentifier:*MEMORY[0x1E4F4FBD8]];
    dispatch_queue_t v6 = self->_browsingAssistantStream;
    self->_browsingAssistantStream = v5;

    browsingAssistantStream = self->_browsingAssistantStream;
  }
  return browsingAssistantStream;
}

- (void)donateAutoPlayEventWithSignal:(int64_t)a3 domain:(id)a4 countryCode:(id)a5 webPageLoadedOverPrivateRelay:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  if ([(id)objc_opt_class() isBiomeStreamDonationAvailable])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F4FFD8]);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:ceil(v13 / 1800.0) * 30.0 * 60.0];
    uint64_t v15 = [(WBSBiomeDonationManager *)self _biomeSignalForAutoPlaySignal:a3];
    v16 = [NSNumber numberWithBool:v6];
    v17 = (void *)[v12 initWithDomain:v10 visited:v14 signal:v15 countryCode:v11 privacyProxy:v16];

    if (v17)
    {
      objc_initWeak(&location, self);
      streamAccessQueue = self->_streamAccessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106__WBSBiomeDonationManager_donateAutoPlayEventWithSignal_domain_countryCode_webPageLoadedOverPrivateRelay___block_invoke;
      block[3] = &unk_1E5C8C948;
      objc_copyWeak(&v21, &location);
      id v20 = v17;
      dispatch_async(streamAccessQueue, block);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __106__WBSBiomeDonationManager_donateAutoPlayEventWithSignal_domain_countryCode_webPageLoadedOverPrivateRelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained _autoPlayStream];
    v4 = [v3 source];
    [v4 sendEvent:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

- (int)_biomeSignalForAutoPlaySignal:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return dword_1A6D45FA8[a3 - 1];
  }
}

- (void)donateNavigationWithURL:(id)a3 userAgent:(int64_t)a4 wasPrivateRelayed:(BOOL)a5 statusCode:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  if (isIPad_onceToken != -1) {
    dispatch_once(&isIPad_onceToken, &__block_literal_global_177);
  }
  if (isIPad_result) {
    int v11 = 3;
  }
  else {
    int v11 = 2;
  }
  unsigned int v28 = v11;
  id v12 = [v10 host];
  double v13 = objc_msgSend(v12, "safari_highLevelDomainFromHost");

  LODWORD(v12) = [MEMORY[0x1E4F50080] instancesRespondToSelector:sel_initWithDomain_visited_platform_userAgent_countryCode_privacyProxy_error_url_];
  id v14 = objc_alloc(MEMORY[0x1E4F50080]);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:ceil(v15 / 1800.0) * 30.0 * 60.0];
  val = self;
  uint64_t v17 = [(WBSBiomeDonationManager *)self _biomeDeviceClassForUserAgent:a4];
  v18 = [MEMORY[0x1E4F1CA20] currentLocale];
  v19 = [v18 countryCode];
  id v20 = [NSNumber numberWithInt:v7];
  int v21 = BiomeErrorResponseForStatusCode(a6);
  int v22 = v21;
  if (v12)
  {
    v23 = [v10 absoluteString];
    LODWORD(v26) = v22;
    v24 = (void *)[v14 initWithDomain:v13 visited:v16 platform:v28 userAgent:v17 countryCode:v19 privacyProxy:v20 error:v26 url:v23];
  }
  else
  {
    LODWORD(v26) = v21;
    v24 = (void *)[v14 initWithDomain:v13 visited:v16 platform:v28 userAgent:v17 countryCode:v19 privacyProxy:v20 error:v26];
  }

  if (v24)
  {
    objc_initWeak(&location, val);
    streamAccessQueue = val->_streamAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__WBSBiomeDonationManager_donateNavigationWithURL_userAgent_wasPrivateRelayed_statusCode___block_invoke;
    block[3] = &unk_1E5C8C948;
    objc_copyWeak(&v31, &location);
    id v30 = v24;
    dispatch_async(streamAccessQueue, block);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

void __90__WBSBiomeDonationManager_donateNavigationWithURL_userAgent_wasPrivateRelayed_statusCode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained _navigationsStream];
    v4 = [v3 source];
    [v4 sendEvent:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

- (int)_biomeDeviceClassForUserAgent:(int64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

- (BOOL)donateForDiagnosticLoggingKey:(id)a3 value:(id)a4 webPageLoadedOverPrivateRelay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(id)objc_opt_class() isBiomeStreamDonationAvailable]
    && (uint64_t v10 = [(WBSBiomeDonationManager *)self _webPerformanceEventForDiagnosticLoggingKey:v8], v10))
  {
    [(WBSBiomeDonationManager *)self _donateWebPagePerformanceEventWithEvent:v10 domain:v9 webPageLoadedOverPrivateRelay:v5];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_donateWebPagePerformanceEventWithEvent:(int)a3 domain:(id)a4 webPageLoadedOverPrivateRelay:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (isIPad_onceToken != -1) {
    dispatch_once(&isIPad_onceToken, &__block_literal_global_177);
  }
  if (isIPad_result) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F50090]);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  id v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:ceil(v11 / 1800.0) * 30.0 * 60.0];
  double v13 = [NSNumber numberWithBool:v5];
  id v14 = (void *)[v10 initWithDomain:v8 visited:v12 platform:v9 performanceEvent:v6 privacyProxy:v13];

  if (v14)
  {
    objc_initWeak(&location, self);
    streamAccessQueue = self->_streamAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__WBSBiomeDonationManager__donateWebPagePerformanceEventWithEvent_domain_webPageLoadedOverPrivateRelay___block_invoke;
    block[3] = &unk_1E5C8C948;
    objc_copyWeak(&v18, &location);
    id v17 = v14;
    dispatch_async(streamAccessQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __104__WBSBiomeDonationManager__donateWebPagePerformanceEventWithEvent_domain_webPageLoadedOverPrivateRelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained _webPagePerformanceStream];
    v4 = [v3 source];
    [v4 sendEvent:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

- (int)_webPerformanceEventForDiagnosticLoggingKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DomainCausingCrash"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DomainCausingJetsam"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DomainCausingEnergyDrain"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)donateWebAppInFocusEventWithStarting:(BOOL)a3 date:(id)a4 webAppType:(int64_t)a5 identifier:(id)a6 name:(id)a7 manifestId:(id)a8
{
  BOOL v11 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  if ([(id)objc_opt_class() isBiomeStreamDonationAvailable])
  {
    id v16 = objc_alloc(MEMORY[0x1E4F50198]);
    id v17 = [NSNumber numberWithBool:v11];
    id v18 = objc_opt_new();
    v19 = objc_msgSend(v16, "initWithStarting:absoluteTimestamp:type:identifier:name:manifestId:", v17, v18, -[WBSBiomeDonationManager _biomeWebAppInFocusWebAppTypeForWebAppType:](self, "_biomeWebAppInFocusWebAppTypeForWebAppType:", a5), v13, v14, v15);

    if (v19)
    {
      objc_initWeak(&location, self);
      streamAccessQueue = self->_streamAccessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __107__WBSBiomeDonationManager_donateWebAppInFocusEventWithStarting_date_webAppType_identifier_name_manifestId___block_invoke;
      block[3] = &unk_1E5C8C948;
      objc_copyWeak(&v23, &location);
      id v22 = v19;
      dispatch_async(streamAccessQueue, block);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

void __107__WBSBiomeDonationManager_donateWebAppInFocusEventWithStarting_date_webAppType_identifier_name_manifestId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained _webAppInFocusStream];
    int v4 = [v3 source];
    [v4 sendEvent:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

- (int)_biomeWebAppInFocusWebAppTypeForWebAppType:(int64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

- (void)donatePageLoadWithUserAgent:(int64_t)a3 wasSearch:(BOOL)a4 wasPrivateBrowsing:(BOOL)a5 wasActualized:(BOOL)a6 provenance:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  if ([(id)objc_opt_class() isBiomeStreamDonationAvailable])
  {
    if (isIPad_onceToken != -1) {
      dispatch_once(&isIPad_onceToken, &__block_literal_global_177);
    }
    if (isIPad_result) {
      int v13 = 3;
    }
    else {
      int v13 = 2;
    }
    unsigned int v27 = v13;
    if ((unint64_t)a7 > 3) {
      int v26 = 0;
    }
    else {
      int v26 = dword_1A6D45FC0[a7];
    }
    id v14 = objc_alloc(MEMORY[0x1E4F50088]);
    id v15 = [NSNumber numberWithInt:v10];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    id v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:ceil(v16 / 1800.0) * 30.0 * 60.0];
    id v18 = [NSNumber numberWithInt:v9];
    uint64_t v19 = [(WBSBiomeDonationManager *)self _biomePageLoadDeviceClassForUserAgent:a3];
    id v20 = [MEMORY[0x1E4F1CA20] currentLocale];
    int v21 = [v20 countryCode];
    id v22 = [NSNumber numberWithInt:v8];
    LODWORD(v25) = v26;
    id v23 = (void *)[v14 initWithSearch:v15 visited:v17 mode:v18 platform:v27 userAgent:v19 countryCode:v21 entryPoint:v25 actualized:v22];

    if (v23)
    {
      objc_initWeak(&location, self);
      streamAccessQueue = self->_streamAccessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __109__WBSBiomeDonationManager_donatePageLoadWithUserAgent_wasSearch_wasPrivateBrowsing_wasActualized_provenance___block_invoke;
      block[3] = &unk_1E5C8C948;
      objc_copyWeak(&v30, &location);
      id v29 = v23;
      dispatch_async(streamAccessQueue, block);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }
}

void __109__WBSBiomeDonationManager_donatePageLoadWithUserAgent_wasSearch_wasPrivateBrowsing_wasActualized_provenance___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained _pageLoadStream];
    int v4 = [v3 source];
    [v4 sendEvent:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

- (int)_biomePageLoadDeviceClassForUserAgent:(int64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

- (void)donateBrowsingAssistantWebPageStartedEventWithWebPageID:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F50078]);
    v32 = v3;
    id v5 = [v3 dataUsingEncoding:4 allowLossyConversion:0];
    id v31 = (void *)[v4 initWithWebpageViewIdentifier:v5];

    v36 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    uint64_t v6 = (void *)getSADeviceInfoClass_softClass;
    uint64_t v45 = getSADeviceInfoClass_softClass;
    if (!getSADeviceInfoClass_softClass)
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __getSADeviceInfoClass_block_invoke;
      v41[3] = &unk_1E5C8C9B8;
      v41[4] = &v42;
      __getSADeviceInfoClass_block_invoke((uint64_t)v41);
      uint64_t v6 = (void *)v43[3];
    }
    BOOL v7 = v6;
    _Block_object_dispose(&v42, 8);
    v34 = (void *)[[v7 alloc] init];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = [v34 trialExperiment];
    uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v38;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
          id v12 = objc_alloc(MEMORY[0x1E4F50028]);
          int v13 = [v11 experimentNamespace];
          id v14 = [v11 experimentID];
          id v15 = [v11 treatmentID];
          double v16 = [v11 deploymentID];
          uint64_t v17 = [v11 allocationStatus];
          id v18 = [v11 compatibilityVersion];
          uint64_t v19 = objc_msgSend(v12, "initWithExperiment_namespace:experiment_id:treatment_id:deployment_id:allocation_status:compatibility_version:", v13, v14, v15, v16, v17, v18);
          [v36 addObject:v19];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v8);
    }

    id v20 = objc_alloc(MEMORY[0x1E4F4FFF0]);
    int v21 = [v32 dataUsingEncoding:4 allowLossyConversion:0];
    id v22 = [v34 systemLocale];
    id v23 = [v34 currentCountry];
    v24 = [v34 build];
    uint64_t v25 = [v34 osType];
    int v26 = [v34 productType];
    unsigned int v27 = [v34 prefixStoreVersion];
    LODWORD(v30) = 0;
    LODWORD(v29) = 0;
    unsigned int v28 = (void *)[v20 initWithWebpageViewIdentifier:v21 systemLocale:v22 currentCountry:v23 build:v24 osType:v25 productType:v26 buildType:v29 duEnabled:0 searchBarPosition:v30 prefixStoreVersion:v27 trialExperiment:v36];

    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:v31 dimensionContext:0 bloomFilterPassed:0 eligible:0 webpageUrlSent:0 serverRequest:0 render:0 userInteraction:0];
    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:v28 bloomFilterPassed:0 eligible:0 webpageUrlSent:0 serverRequest:0 render:0 userInteraction:0];

    id v3 = v32;
  }
}

- (void)donateBrowsingAssistantEligibleEventWithWebPageID:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F4FFF8];
    id v5 = a3;
    id v6 = [v4 alloc];
    BOOL v7 = [v5 dataUsingEncoding:4 allowLossyConversion:0];

    id v8 = (id)[v6 initWithWebpageViewIdentifier:v7];
    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:0 bloomFilterPassed:0 eligible:v8 webpageUrlSent:0 serverRequest:0 render:0 userInteraction:0];
  }
}

- (void)donateBrowsingAssistantWebpageURLSentWithWebPageID:(id)a3 urlSent:(id)a4
{
  if (a3)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F50070];
    id v7 = a4;
    id v8 = a3;
    id v9 = [v6 alloc];
    uint64_t v10 = [v8 dataUsingEncoding:4 allowLossyConversion:0];

    BOOL v11 = [v7 absoluteString];

    id v12 = (id)[v9 initWithWebpageViewIdentifier:v10 url:v11];
    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:0 bloomFilterPassed:0 eligible:0 webpageUrlSent:v12 serverRequest:0 render:0 userInteraction:0];
  }
}

- (void)donateBrowsingAssistantServerRequestStartedEventWithWebPageID:(id)a3 requestIdentifier:(id)a4 requestType:(int64_t)a5
{
  if (a3)
  {
    if (a5 == 2) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = a5 == 1;
    }
    id v8 = (objc_class *)MEMORY[0x1E4F50020];
    id v9 = a4;
    id v10 = a3;
    id v14 = (id)[[v8 alloc] initWithRequestType:v7];
    id v11 = objc_alloc(MEMORY[0x1E4F50008]);
    id v12 = [v10 dataUsingEncoding:4 allowLossyConversion:0];

    int v13 = (void *)[v11 initWithWebpageViewIdentifier:v12 requestIdentifier:v9 started:v14 ended:0 failed:0];
    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:0 bloomFilterPassed:0 eligible:0 webpageUrlSent:0 serverRequest:v13 render:0 userInteraction:0];
  }
}

- (void)donateBrowsingAssistantServerRequestEndedEventWithWebPageID:(id)a3 requestIdentifier:(id)a4
{
  if (a3)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F50000];
    id v7 = a4;
    id v8 = a3;
    id v9 = [v6 alloc];
    id v10 = [MEMORY[0x1E4F1C978] array];
    id v15 = (id)[v9 initWithSummaryText:0 tableOfContentsTexts:v10];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F50010]) initWithServerReleaseVersion:&stru_1EFBE3CF8 responseData:v15];
    id v12 = objc_alloc(MEMORY[0x1E4F50008]);
    int v13 = [v8 dataUsingEncoding:4 allowLossyConversion:0];

    id v14 = (void *)[v12 initWithWebpageViewIdentifier:v13 requestIdentifier:v7 started:0 ended:v11 failed:0];
    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:0 bloomFilterPassed:0 eligible:0 webpageUrlSent:0 serverRequest:v14 render:0 userInteraction:0];
  }
}

- (void)donateBrowsingAssistantServerRequestFailedEventWithWebPageID:(id)a3 requestIdentifier:(id)a4
{
  if (a3)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F50018];
    id v7 = a4;
    id v8 = a3;
    id v12 = (id)[[v6 alloc] initWithExists:0];
    id v9 = objc_alloc(MEMORY[0x1E4F50008]);
    id v10 = [v8 dataUsingEncoding:4 allowLossyConversion:0];

    id v11 = (void *)[v9 initWithWebpageViewIdentifier:v10 requestIdentifier:v7 started:0 ended:0 failed:v12];
    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:0 bloomFilterPassed:0 eligible:0 webpageUrlSent:0 serverRequest:v11 render:0 userInteraction:0];
  }
}

- (void)donateBrowsingAssistantBloomFilterPassedEventWithWebPageID:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F4FFE8];
    id v5 = a3;
    id v6 = [v4 alloc];
    id v7 = [v5 dataUsingEncoding:4 allowLossyConversion:0];

    id v8 = (id)[v6 initWithWebpageViewIdentifier:v7];
    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:0 bloomFilterPassed:v8 eligible:0 webpageUrlSent:0 serverRequest:0 render:0 userInteraction:0];
  }
}

- (void)donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:(id)a3 componentType:(int64_t)a4 componentIdentifier:(id)a5 tableOfContentsArrayLength:(id)a6
{
  if (a3)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a3;
    id v19 = [(WBSBiomeDonationManager *)self _getVisualComponentAttributeFromComponentType:a4];
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F50048]) initWithSummaryText:0 tableOfContentsArrayLength:v10];

    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50038]) initWithVisualComponentAttribute:v19 visualComponentData:v13 identifier:v11];
    id v15 = objc_alloc(MEMORY[0x1E4F50058]);
    double v16 = [v12 dataUsingEncoding:4 allowLossyConversion:0];

    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50068]) initWithExists:0];
    id v18 = (void *)[v15 initWithWebpageViewIdentifier:v16 visualComponent:v14 started:v17 ended:0];

    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:0 bloomFilterPassed:0 eligible:0 webpageUrlSent:0 serverRequest:0 render:v18 userInteraction:0];
  }
}

- (void)donateBrowsingAssistantVisualComponentPresentationEndedWithWebPageID:(id)a3 componentType:(int64_t)a4 componentIdentifier:(id)a5 hideReason:(int64_t)a6
{
  if (a3)
  {
    id v10 = a5;
    id v11 = a3;
    id v18 = [(WBSBiomeDonationManager *)self _getVisualComponentAttributeFromComponentType:a4];
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F50048]) initWithSummaryText:0 tableOfContentsArrayLength:0];
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F50038]) initWithVisualComponentAttribute:v18 visualComponentData:v12 identifier:v10];

    if ((unint64_t)(a6 - 1) < 3) {
      a6 = a6;
    }
    else {
      a6 = 0;
    }
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50060]) initWithHideReason:a6];
    id v15 = objc_alloc(MEMORY[0x1E4F50058]);
    double v16 = [v11 dataUsingEncoding:4 allowLossyConversion:0];

    uint64_t v17 = (void *)[v15 initWithWebpageViewIdentifier:v16 visualComponent:v13 started:0 ended:v14];
    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:0 bloomFilterPassed:0 eligible:0 webpageUrlSent:0 serverRequest:0 render:v17 userInteraction:0];
  }
}

+ (int64_t)entityComponentTypeFromResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domainName];
  id v5 = [v4 lowercaseString];
  if ([v5 isEqualToString:@"kg"])
  {
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [v3 entityType];
      id v8 = [v7 lowercaseString];

      if ([v8 isEqualToString:@"sb104"])
      {
        int64_t v9 = 4;
LABEL_13:

        goto LABEL_14;
      }
      if ([v8 isEqualToString:@"sb117"])
      {
        int64_t v9 = 6;
        goto LABEL_13;
      }
      char v17 = [v8 isEqualToString:@"sb183"];

      if (v17)
      {
        int64_t v9 = 6;
        goto LABEL_14;
      }
    }
  }
  else
  {
  }
  id v10 = [v3 domainName];
  id v11 = [v10 lowercaseString];
  char v12 = [v11 isEqualToString:@"media"];

  if (v12)
  {
    int64_t v9 = 7;
  }
  else
  {
    int v13 = [v3 domainName];
    id v14 = [v13 lowercaseString];
    int v15 = [v14 isEqualToString:@"maps"];

    if (v15) {
      int64_t v9 = 5;
    }
    else {
      int64_t v9 = 3;
    }
  }
LABEL_14:

  return v9;
}

- (void)donateBrowsingAssistantUserInteractionDetectedWithWebPageID:(id)a3 componentType:(int64_t)a4 componentIdentifier:(id)a5 tableOfContentsArrayLength:(id)a6 tableOfContentsTextIndex:(id)a7 readerSectionExpanded:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a7;
  if (a3)
  {
    id v27 = v14;
    id v15 = a6;
    id v16 = a5;
    id v17 = a3;
    id v18 = [(WBSBiomeDonationManager *)self _getVisualComponentAttributeFromComponentType:a4];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50048]) initWithSummaryText:0 tableOfContentsArrayLength:v15];

    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50038]) initWithVisualComponentAttribute:v18 visualComponentData:v19 identifier:v16];
    int v21 = 0;
    if ((unint64_t)(a4 - 8) <= 2)
    {
      if (v8) {
        unsigned int v22 = 2;
      }
      else {
        unsigned int v22 = 1;
      }
      if (v27) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = v22;
      }
      int v21 = (void *)[objc_alloc(MEMORY[0x1E4F50050]) initWithTableOfContentsText:0 tableOfContentsTextIndex:v27 hideShowButton:v23];
    }
    id v24 = objc_alloc(MEMORY[0x1E4F50030]);
    uint64_t v25 = [v17 dataUsingEncoding:4 allowLossyConversion:0];

    int v26 = (void *)[v24 initWithWebpageViewIdentifier:v25 visualComponent:v20 userInteractionType:1 visualComponentInteractionInfo:v21];
    [(WBSBiomeDonationManager *)self _donateBrowsingAssistantEvents:0 dimensionContext:0 bloomFilterPassed:0 eligible:0 webpageUrlSent:0 serverRequest:0 render:0 userInteraction:v26];

    id v14 = v27;
  }
}

- (void)donateBrowsingAssistantReaderEventWithWebPageID:(id)a3 eventType:(int64_t)a4 dataToReport:(id)a5
{
  id v32 = a3;
  id v7 = a5;
  BOOL v8 = v7;
  switch(a4)
  {
    case 0:
      int64_t v9 = +[WBSBiomeDonationManager sharedManager];
      [v9 donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:v32 componentType:8 componentIdentifier:0 tableOfContentsArrayLength:0];
      goto LABEL_15;
    case 1:
      id v10 = [v7 objectForKey:@"length"];

      if (!v10) {
        goto LABEL_16;
      }
      id v11 = [v8 objectForKey:@"length"];
      uint64_t v12 = [v11 integerValue];

      int64_t v9 = +[WBSBiomeDonationManager sharedManager];
      int v13 = [NSNumber numberWithInteger:v12];
      [v9 donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:v32 componentType:9 componentIdentifier:0 tableOfContentsArrayLength:v13];

      goto LABEL_15;
    case 2:
      id v14 = [v7 objectForKey:@"expanded"];

      if (!v14) {
        goto LABEL_16;
      }
      id v15 = [v8 objectForKey:@"expanded"];
      uint64_t v16 = [v15 BOOLValue];

      id v17 = +[WBSBiomeDonationManager sharedManager];
      int64_t v9 = v17;
      id v18 = v32;
      uint64_t v19 = 8;
      goto LABEL_14;
    case 3:
      id v20 = [v7 objectForKey:@"expanded"];

      if (!v20) {
        goto LABEL_16;
      }
      int v21 = [v8 objectForKey:@"expanded"];
      uint64_t v16 = [v21 BOOLValue];

      id v17 = +[WBSBiomeDonationManager sharedManager];
      int64_t v9 = v17;
      id v18 = v32;
      uint64_t v19 = 9;
      goto LABEL_14;
    case 4:
      unsigned int v22 = [v7 objectForKey:@"index"];

      if (!v22) {
        goto LABEL_16;
      }
      uint64_t v23 = [v8 objectForKey:@"length"];

      if (!v23) {
        goto LABEL_16;
      }
      id v24 = [v8 objectForKey:@"index"];
      uint64_t v25 = [v24 integerValue];

      int v26 = [v8 objectForKey:@"length"];
      uint64_t v27 = [v26 integerValue];

      int64_t v9 = +[WBSBiomeDonationManager sharedManager];
      unsigned int v28 = [NSNumber numberWithInteger:v27];
      uint64_t v29 = [NSNumber numberWithInteger:v25];
      [v9 donateBrowsingAssistantUserInteractionDetectedWithWebPageID:v32 componentType:9 componentIdentifier:0 tableOfContentsArrayLength:v28 tableOfContentsTextIndex:v29 readerSectionExpanded:0];

      goto LABEL_15;
    case 5:
      uint64_t v30 = [v7 objectForKey:@"expanded"];

      if (!v30) {
        goto LABEL_16;
      }
      id v31 = [v8 objectForKey:@"expanded"];
      uint64_t v16 = [v31 BOOLValue];

      id v17 = +[WBSBiomeDonationManager sharedManager];
      int64_t v9 = v17;
      id v18 = v32;
      uint64_t v19 = 10;
LABEL_14:
      [v17 donateBrowsingAssistantUserInteractionDetectedWithWebPageID:v18 componentType:v19 componentIdentifier:0 tableOfContentsArrayLength:0 tableOfContentsTextIndex:0 readerSectionExpanded:v16];
LABEL_15:

LABEL_16:

      return;
    default:
      goto LABEL_16;
  }
}

- (id)_getVisualComponentAttributeFromComponentType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 1;
      goto LABEL_16;
    case 1:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 2;
      goto LABEL_16;
    case 2:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 2;
      uint64_t v8 = 1;
      goto LABEL_17;
    case 3:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 2;
      uint64_t v8 = 2;
      goto LABEL_17;
    case 4:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 2;
      uint64_t v8 = 2;
      uint64_t v9 = 1;
      goto LABEL_18;
    case 5:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 2;
      uint64_t v8 = 2;
      uint64_t v9 = 2;
      goto LABEL_18;
    case 6:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 2;
      uint64_t v8 = 2;
      uint64_t v9 = 3;
      goto LABEL_18;
    case 7:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 2;
      uint64_t v8 = 2;
      uint64_t v9 = 4;
      goto LABEL_18;
    case 8:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 3;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 1;
      goto LABEL_19;
    case 9:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 3;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 2;
      goto LABEL_19;
    case 10:
      id v5 = objc_alloc(MEMORY[0x1E4F50040]);
      uint64_t v6 = 3;
LABEL_16:
      uint64_t v8 = 0;
LABEL_17:
      uint64_t v9 = 0;
LABEL_18:
      uint64_t v10 = 0;
LABEL_19:
      self = (WBSBiomeDonationManager *)objc_msgSend(v5, "initWithComponentType:cardType:entityType:readerViewSectionType:", v6, v8, v9, v10, v3);
      break;
    default:
      break;
  }
  return self;
}

- (void)_donateBrowsingAssistantEvents:(id)a3 dimensionContext:(id)a4 bloomFilterPassed:(id)a5 eligible:(id)a6 webpageUrlSent:(id)a7 serverRequest:(id)a8 render:(id)a9 userInteraction:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (+[WBSBrowsingAssistantController userConsentState] == 1)
  {
    val = self;
    id v24 = (void *)[objc_alloc(MEMORY[0x1E4F4FFE0]) initWithWebpageViewStarted:v16 dimensionContext:v17 bloomFilterPassed:v18 eligible:v19 webpageUrlSent:v20 serverRequestContext:v21 visualComponentPresentationContext:v22 userInteractionDetected:v23];
    uint64_t v25 = WBS_LOG_CHANNEL_PREFIXBiomeDonation();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:]((uint64_t)v24, v25);
      if (!v24) {
        goto LABEL_5;
      }
    }
    else if (!v24)
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_initWeak(&location, val);
    vala = val->_streamAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __154__WBSBiomeDonationManager__donateBrowsingAssistantEvents_dimensionContext_bloomFilterPassed_eligible_webpageUrlSent_serverRequest_render_userInteraction___block_invoke;
    block[3] = &unk_1E5C8C948;
    objc_copyWeak(&v30, &location);
    id v29 = v24;
    dispatch_async(vala, block);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    goto LABEL_5;
  }
LABEL_6:
}

void __154__WBSBiomeDonationManager__donateBrowsingAssistantEvents_dimensionContext_bloomFilterPassed_eligible_webpageUrlSent_serverRequest_render_userInteraction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained _browsingAssistantStream];
    uint64_t v4 = [v3 source];
    [v4 sendEvent:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

- (void)clearEventsDonatedSinceDate:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isBiomeStreamDonationAvailable])
  {
    streamAccessQueue = self->_streamAccessQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__WBSBiomeDonationManager_clearEventsDonatedSinceDate___block_invoke;
    v6[3] = &unk_1E5C8C920;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(streamAccessQueue, v6);
  }
}

uint64_t __55__WBSBiomeDonationManager_clearEventsDonatedSinceDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearEventsDonatedSinceDate:*(void *)(a1 + 40)];
}

- (void)_clearEventsDonatedSinceDate:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSBiomeDonationManager *)self _autoPlayStream];
  uint64_t v6 = [v5 pruner];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke;
  v38[3] = &unk_1E5C8C970;
  id v7 = v4;
  id v39 = v7;
  [v6 deleteEventsPassingTest:v38];

  uint64_t v8 = [(WBSBiomeDonationManager *)self _webPagePerformanceStream];
  uint64_t v9 = [v8 pruner];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_2;
  v36[3] = &unk_1E5C8C970;
  id v10 = v7;
  id v37 = v10;
  [v9 deleteEventsPassingTest:v36];

  id v11 = [(WBSBiomeDonationManager *)self _navigationsStream];
  uint64_t v12 = [v11 pruner];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_3;
  v34[3] = &unk_1E5C8C970;
  id v13 = v10;
  id v35 = v13;
  [v12 deleteEventsPassingTest:v34];

  id v14 = [(WBSBiomeDonationManager *)self _webAppInFocusStream];
  id v15 = [v14 pruner];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_4;
  v32[3] = &unk_1E5C8C970;
  id v16 = v13;
  id v33 = v16;
  [v15 deleteEventsPassingTest:v32];

  id v17 = [(WBSBiomeDonationManager *)self _pageLoadStream];
  id v18 = [v17 pruner];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_5;
  v30[3] = &unk_1E5C8C970;
  id v19 = v16;
  id v31 = v19;
  [v18 deleteEventsPassingTest:v30];

  id v20 = [(WBSBiomeDonationManager *)self _windowProxyStream];
  id v21 = [v20 pruner];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_6;
  v28[3] = &unk_1E5C8C970;
  id v29 = v19;
  id v22 = v19;
  [v21 deleteEventsPassingTest:v28];

  [v22 timeIntervalSinceReferenceDate];
  uint64_t v24 = v23;
  uint64_t v25 = [(WBSBiomeDonationManager *)self _browsingAssistantStream];
  int v26 = [v25 pruner];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_7;
  v27[3] = &__block_descriptor_40_e26_B24__0__BMStoreEvent_8_B16l;
  v27[4] = v24;
  [v26 deleteEventsPassingTest:v27];
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  id v4 = [v3 visited];
  if (v4)
  {
    id v5 = [v3 visited];
    uint64_t v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  id v4 = [v3 visited];
  if (v4)
  {
    id v5 = [v3 visited];
    uint64_t v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  id v4 = [v3 visited];
  if (v4)
  {
    id v5 = [v3 visited];
    uint64_t v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  id v4 = [v3 absoluteTimestamp];
  if (v4)
  {
    id v5 = [v3 absoluteTimestamp];
    uint64_t v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  id v4 = [v3 visited];
  if (v4)
  {
    id v5 = [v3 visited];
    uint64_t v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  id v4 = [v3 visited];
  if (v4)
  {
    id v5 = [v3 visited];
    uint64_t v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

BOOL __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_7(uint64_t a1, void *a2)
{
  [a2 timestamp];
  return v3 >= *(double *)(a1 + 32);
}

- (void)performPendingDeletionsBeforeTermination
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browsingAssistantStream, 0);
  objc_storeStrong((id *)&self->_windowProxyStream, 0);
  objc_storeStrong((id *)&self->_pageLoadStream, 0);
  objc_storeStrong((id *)&self->_webAppInFocusStream, 0);
  objc_storeStrong((id *)&self->_webPagePerformanceStream, 0);
  objc_storeStrong((id *)&self->_navigationsStream, 0);
  objc_storeStrong((id *)&self->_autoPlayStream, 0);
  objc_storeStrong((id *)&self->_streamAccessQueue, 0);
}

- (void)_donateBrowsingAssistantEvents:(uint64_t)a1 dimensionContext:(NSObject *)a2 bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Donating Browsing Assistant event: %{sensitive}@", (uint8_t *)&v2, 0xCu);
}

@end