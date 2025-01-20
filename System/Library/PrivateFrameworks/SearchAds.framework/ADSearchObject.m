@interface ADSearchObject
- (ADDESRecordsManager)desRecordManager;
- (ADSearchObject)init;
- (ADSearchObject)initWithSponsoredSearchRequestData:(id)a3 routingInfoData:(id)a4 deviceRequestID:(id)a5 userTargetingID:(id)a6 error:(id)a7;
- (APOdmlReranker)reranker;
- (BOOL)checkForNonWKDiscardOverrides:(BOOL)a3 forAdamID:(id)a4;
- (BOOL)isAppInstalled:(unint64_t)a3;
- (NSArray)advertisements;
- (NSArray)organics;
- (NSError)error;
- (NSString)deviceRequestID;
- (NSString)routingInfoData;
- (NSString)sponsoredSearchRequestData;
- (NSString)userTargetingID;
- (double)SLA;
- (id)filterAdsForNonWK:(id)a3;
- (id)updatedWithTransparencyRenderingData:(id)a3;
- (unint64_t)ident;
- (void)addFeaturesToAdvertisements;
- (void)orderedAds:(id)a3;
- (void)orderedAdsWithODMLSuccess:(id)a3;
- (void)setAdvertisements:(id)a3;
- (void)setDesRecordManager:(id)a3;
- (void)setDeviceRequestID:(id)a3;
- (void)setError:(id)a3;
- (void)setOrganics:(id)a3;
- (void)setReranker:(id)a3;
- (void)setRoutingInfoData:(id)a3;
- (void)setSLA:(double)a3;
- (void)setSponsoredSearchRequestData:(id)a3;
- (void)setUserTargetingID:(id)a3;
@end

@implementation ADSearchObject

- (ADSearchObject)init
{
  v32.receiver = self;
  v32.super_class = (Class)ADSearchObject;
  v6 = [(ADSearchObject *)&v32 init];
  if (v6)
  {
    v7 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], v2, v3, v4, v5);
    char isRunningTests = objc_msgSend_isRunningTests(v7, v8, v9, v10, v11);

    if ((isRunningTests & 1) == 0)
    {
      id v13 = objc_alloc(MEMORY[0x263F61EF0]);
      v18 = objc_msgSend_sharedInstance(MEMORY[0x263F241C0], v14, v15, v16, v17);
      uint64_t isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(v18, v19, v20, v21, v22);
      uint64_t v26 = objc_msgSend_initWithPersonalizedAdsEnabled_placementType_(v13, v24, isPersonalizedAdsEnabled, 0, v25);
      reranker = v6->_reranker;
      v6->_reranker = (APOdmlReranker *)v26;
    }
    v6->_SLA = 0.1;
    v28 = OdmlLogForCategory();
    v6->_ident = os_signpost_id_generate(v28);

    v29 = objc_alloc_init(ADDESRecordsManager);
    desRecordManager = v6->_desRecordManager;
    v6->_desRecordManager = v29;
  }
  return v6;
}

- (ADSearchObject)initWithSponsoredSearchRequestData:(id)a3 routingInfoData:(id)a4 deviceRequestID:(id)a5 userTargetingID:(id)a6 error:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v21 = objc_msgSend_init(self, v17, v18, v19, v20);
  uint64_t v22 = (ADSearchObject *)v21;
  if (v21)
  {
    objc_storeStrong((id *)(v21 + 8), a3);
    objc_storeStrong((id *)&v22->_routingInfoData, a4);
    objc_storeStrong((id *)&v22->_deviceRequestID, a5);
    objc_storeStrong((id *)&v22->_userTargetingID, a6);
    objc_storeStrong((id *)&v22->_error, a7);
  }

  return v22;
}

- (void)setAdvertisements:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v70 = "-[ADSearchObject setAdvertisements:]";
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  if (MGGetBoolAnswer())
  {
    uint64_t v10 = (void *)MEMORY[0x263EFF980];
    uint64_t v11 = objc_msgSend_count(v4, v6, v7, v8, v9);
    id v15 = objc_msgSend_arrayWithCapacity_(v10, v12, v11, v13, v14);
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = sub_236761480;
    v67[3] = &unk_264CADD60;
    id v16 = v15;
    id v68 = v16;
    objc_msgSend_enumerateObjectsUsingBlock_(v4, v17, (uint64_t)v67, v18, v19);
    uint64_t v20 = APLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_AD_jsonString(v16, v21, v22, v23, v24);
      uint64_t v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v70 = v25;
      _os_log_impl(&dword_236756000, v20, OS_LOG_TYPE_DEFAULT, "Received ADAppAdvertisement response: %@", buf, 0xCu);
    }
  }
  uint64_t v26 = objc_msgSend_filterAdsForNonWK_(self, v6, (uint64_t)v4, v8, v9);
  objc_msgSend_updatedWithTransparencyRenderingData_(self, v27, (uint64_t)v26, v28, v29);
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  advertisements = self->_advertisements;
  self->_advertisements = v30;

  objc_msgSend_addFeaturesToAdvertisements(self, v32, v33, v34, v35);
  v36 = OdmlLogForCategory();
  uint64_t v41 = objc_msgSend_ident(self, v37, v38, v39, v40);
  if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v42 = v41;
    if (os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236756000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v42, "App Store Total Reranking", (const char *)&unk_23676A48F, buf, 2u);
    }
  }

  v47 = objc_msgSend_reranker(self, v43, v44, v45, v46);
  v52 = objc_msgSend_copy(v26, v48, v49, v50, v51);
  objc_msgSend_setAndRerankAds_(v47, v53, (uint64_t)v52, v54, v55);

  v60 = objc_msgSend_workQueue(MEMORY[0x263F24230], v56, v57, v58, v59);
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = sub_2367614D8;
  v65[3] = &unk_264CADD88;
  id v66 = v26;
  id v61 = v26;
  objc_msgSend_addOperationWithBlock_(v60, v62, (uint64_t)v65, v63, v64);
}

- (void)setOrganics:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (NSArray *)a3;
  uint64_t v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[ADSearchObject setOrganics:]";
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", (uint8_t *)&v7, 0xCu);
  }

  organics = self->_organics;
  self->_organics = v4;
}

- (void)orderedAds:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v34 = "-[ADSearchObject orderedAds:]";
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  uint64_t v10 = objc_msgSend_advertisements(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

  if (v15)
  {
    uint64_t v20 = objc_msgSend_reranker(self, v16, v17, v18, v19);
    objc_msgSend_SLA(self, v21, v22, v23, v24);
    double v26 = v25;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_2367617A4;
    v31[3] = &unk_264CADDB0;
    v31[4] = self;
    id v32 = v4;
    objc_msgSend_getRerankedAdsWithTimeLimit_completion_(v20, v27, (uint64_t)v31, v28, v29, v26);
  }
  else
  {
    id v30 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    if (v4) {
      (*((void (**)(id, id, void))v4 + 2))(v4, v30, 0);
    }
  }
}

- (void)orderedAdsWithODMLSuccess:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v34 = "-[ADSearchObject orderedAdsWithODMLSuccess:]";
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  uint64_t v10 = objc_msgSend_advertisements(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

  if (v15)
  {
    uint64_t v20 = objc_msgSend_reranker(self, v16, v17, v18, v19);
    objc_msgSend_SLA(self, v21, v22, v23, v24);
    double v26 = v25;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_236761B50;
    v31[3] = &unk_264CADDB0;
    v31[4] = self;
    id v32 = v4;
    objc_msgSend_getRerankedAdsWithTimeLimit_completion_(v20, v27, (uint64_t)v31, v28, v29, v26);
  }
  else
  {
    id v30 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    if (v4) {
      (*((void (**)(id, id, uint64_t))v4 + 2))(v4, v30, 1);
    }
  }
}

- (void)addFeaturesToAdvertisements
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_organics(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_firstObject(v6, v7, v8, v9, v10);
  v72 = objc_msgSend_adamID(v11, v12, v13, v14, v15);

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  objc_msgSend_advertisements(self, v16, v17, v18, v19);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v73, (uint64_t)v77, 16);
  if (v21)
  {
    uint64_t v26 = v21;
    uint64_t v27 = *(void *)v74;
    uint64_t v28 = (void *)*MEMORY[0x263F61F20];
    uint64_t v29 = (void *)*MEMORY[0x263F61F28];
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v74 != v27) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        id v32 = (const void *)objc_msgSend_UTF8String(v28, v22, v23, v24, v25);
        uint64_t v33 = NSNumber;
        uint64_t v38 = objc_msgSend_adamID(v31, v34, v35, v36, v37);
        uint64_t isEqualToString = objc_msgSend_isEqualToString_(v38, v39, (uint64_t)v72, v40, v41);
        uint64_t v46 = objc_msgSend_numberWithBool_(v33, v43, isEqualToString, v44, v45);
        objc_setAssociatedObject(v31, v32, v46, (void *)0x301);

        uint64_t v51 = (const void *)objc_msgSend_UTF8String(v29, v47, v48, v49, v50);
        v52 = NSNumber;
        uint64_t v57 = objc_msgSend_adamID(v31, v53, v54, v55, v56);
        uint64_t v62 = objc_msgSend_longLongValue(v57, v58, v59, v60, v61);
        uint64_t isAppInstalled = objc_msgSend_isAppInstalled_(self, v63, v62, v64, v65);
        v70 = objc_msgSend_numberWithBool_(v52, v67, isAppInstalled, v68, v69);
        objc_setAssociatedObject(v31, v51, v70, (void *)0x301);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v73, (uint64_t)v77, 16);
    }
    while (v26);
  }
}

- (BOOL)isAppInstalled:(unint64_t)a3
{
  id v4 = objc_alloc(MEMORY[0x263F01878]);
  uint64_t v7 = objc_msgSend_initWithStoreItemIdentifier_error_(v4, v5, a3, 0, v6);
  LOBYTE(a3) = v7 != 0;

  return a3;
}

- (id)updatedWithTransparencyRenderingData:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_sharedInstance(MEMORY[0x263F20B60], v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_locationEnabled(v8, v9, v10, v11, v12);

  id v14 = objc_alloc_init(MEMORY[0x263F51788]);
  uint64_t v19 = objc_msgSend_personalizedAds(v14, v15, v16, v17, v18);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = v3;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v22)
  {
    uint64_t v27 = v22;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v20);
        }
        id v30 = objc_msgSend_adData(*(void **)(*((void *)&v34 + 1) + 8 * i), v23, v24, v25, v26, (void)v34);
        objc_msgSend_updateAdDataWithLocationState_personalizedAdsState_(v30, v31, v13, v19, v32);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v27);
  }

  return v20;
}

- (id)filterAdsForNonWK:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6, v7);
  id v58 = (id)objc_claimAutoreleasedReturnValue();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v60, (uint64_t)v71, 16);
  if (v9)
  {
    uint64_t v15 = v9;
    int isCapableOfAction_capabilities = 0;
    uint64_t v17 = *(void *)v61;
    *(void *)&long long v14 = 138412802;
    long long v56 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v61 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        id v20 = objc_msgSend_appBinaryTraits(v19, v10, v11, v12, v13, v56);
        uint64_t v21 = APLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v65 = v20;
          _os_log_impl(&dword_236756000, v21, OS_LOG_TYPE_DEFAULT, "App Binary Traits: %@", buf, 0xCu);
        }

        if (!v20)
        {
          int v34 = 0;
          goto LABEL_14;
        }
        uint64_t v26 = objc_msgSend_appBinaryTraits(v19, v22, v23, v24, v25);
        if (objc_msgSend_containsObject_(v26, v27, @"uses-non-webkit-browser-engine", v28, v29))
        {
        }
        else
        {
          long long v35 = objc_msgSend_appBinaryTraits(v19, v30, v31, v32, v33);
          int v34 = objc_msgSend_containsObject_(v35, v36, @"is-custom-browser-engine-app", v37, v38);

          if (!v34) {
            goto LABEL_14;
          }
        }
        v70[0] = @"uses-non-webkit-browser-engine";
        v70[1] = @"is-custom-browser-engine-app";
        uint64_t v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v22, (uint64_t)v70, 2, v25);
        int isCapableOfAction_capabilities = objc_msgSend_isCapableOfAction_capabilities_(MEMORY[0x263F253E0], v40, 4, (uint64_t)v39, v41);

        int v34 = 1;
LABEL_14:
        os_signpost_id_t v42 = objc_msgSend_adamID(v19, v22, v23, v24, v25);
        v43 = APLogForCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v56;
          uint64_t v65 = v42;
          __int16 v66 = 1024;
          int v67 = v34;
          __int16 v68 = 1024;
          int v69 = isCapableOfAction_capabilities & 1;
          _os_log_impl(&dword_236756000, v43, OS_LOG_TYPE_DEFAULT, "App discard state for %@: isEntitledApp: %d isDMAEligible: %d", buf, 0x18u);
        }

        uint64_t v44 = v34 & (isCapableOfAction_capabilities ^ 1u);
        if (MGGetBoolAnswer())
        {
          if ((objc_msgSend_checkForNonWKDiscardOverrides_forAdamID_(self, v45, v44, (uint64_t)v42, v48) & 1) == 0) {
            goto LABEL_18;
          }
        }
        else if (!v44)
        {
LABEL_18:
          objc_msgSend_addObject_(v58, v45, (uint64_t)v19, v47, v48);
          goto LABEL_23;
        }
        uint64_t v49 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v45, v46, v47, v48);
        objc_msgSend_setValue_forKey_(v49, v50, MEMORY[0x263EFFA80], @"wasServed", v51);
        objc_msgSend_setValue_forKey_(v49, v52, (uint64_t)&unk_26E9B52F0, @"placement", v53);
        AnalyticsSendEvent();
        uint64_t v54 = APLogForCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v65 = v42;
          _os_log_impl(&dword_236756000, v54, OS_LOG_TYPE_DEFAULT, "Discarding ad with adamID: %@ ", buf, 0xCu);
        }

LABEL_23:
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v60, (uint64_t)v71, 16);
    }
    while (v15);
  }

  return v58;
}

- (BOOL)checkForNonWKDiscardOverrides:(BOOL)a3 forAdamID:(id)a4
{
  *(void *)&v36[5] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v10 = objc_msgSend_initWithSuiteName_(v6, v7, *MEMORY[0x263F24150], v8, v9);
  if (objc_msgSend_BOOLForKey_(v10, v11, @"enableNonWKOverrides", v12, v13))
  {
    uint64_t v17 = objc_msgSend_stringForKey_(v10, v14, @"nonWKAppsSearchAds", v15, v16);
    uint64_t v21 = objc_msgSend_componentsSeparatedByString_(v17, v18, @",", v19, v20);
    BOOL v29 = (objc_msgSend_containsObject_(v21, v22, (uint64_t)v5, v23, v24) & 1) != 0
       || objc_msgSend_count(v21, v25, v26, v27, v28) == 0;
    int v30 = objc_msgSend_BOOLForKey_(v10, v25, @"enableDMAEligible", v27, v28);
    uint64_t v31 = APLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 67109376;
      v36[0] = v29;
      LOWORD(v36[1]) = 1024;
      *(_DWORD *)((char *)&v36[1] + 2) = v30;
      _os_log_impl(&dword_236756000, v31, OS_LOG_TYPE_DEFAULT, "App discard state after overrides check: isEntitledApp: %d isDMAEligible: %d", (uint8_t *)&v35, 0xEu);
    }

    char v32 = !v29 | v30;
    if ((v32 & 1) == 0)
    {
      uint64_t v33 = APLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138412290;
        *(void *)long long v36 = v5;
        _os_log_impl(&dword_236756000, v33, OS_LOG_TYPE_DEFAULT, "Discarding ad with adamid: %@ based off overrides.", (uint8_t *)&v35, 0xCu);
      }
    }
    a3 = v32 ^ 1;
  }
  return a3;
}

- (NSString)sponsoredSearchRequestData
{
  return self->_sponsoredSearchRequestData;
}

- (void)setSponsoredSearchRequestData:(id)a3
{
}

- (NSString)routingInfoData
{
  return self->_routingInfoData;
}

- (void)setRoutingInfoData:(id)a3
{
}

- (NSString)deviceRequestID
{
  return self->_deviceRequestID;
}

- (void)setDeviceRequestID:(id)a3
{
}

- (NSString)userTargetingID
{
  return self->_userTargetingID;
}

- (void)setUserTargetingID:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (APOdmlReranker)reranker
{
  return self->_reranker;
}

- (void)setReranker:(id)a3
{
}

- (double)SLA
{
  return self->_SLA;
}

- (void)setSLA:(double)a3
{
  self->_SLA = a3;
}

- (unint64_t)ident
{
  return self->_ident;
}

- (ADDESRecordsManager)desRecordManager
{
  return self->_desRecordManager;
}

- (void)setDesRecordManager:(id)a3
{
}

- (NSArray)advertisements
{
  return self->_advertisements;
}

- (NSArray)organics
{
  return self->_organics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organics, 0);
  objc_storeStrong((id *)&self->_advertisements, 0);
  objc_storeStrong((id *)&self->_desRecordManager, 0);
  objc_storeStrong((id *)&self->_reranker, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_userTargetingID, 0);
  objc_storeStrong((id *)&self->_deviceRequestID, 0);
  objc_storeStrong((id *)&self->_routingInfoData, 0);
  objc_storeStrong((id *)&self->_sponsoredSearchRequestData, 0);
}

@end