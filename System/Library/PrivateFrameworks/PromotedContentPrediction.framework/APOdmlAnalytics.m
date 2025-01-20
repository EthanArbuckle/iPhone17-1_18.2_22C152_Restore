@interface APOdmlAnalytics
+ (id)_versionAndIdentifiers;
+ (id)eventName;
+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4;
+ (void)sendEvent:(id)a3 additionalDetails:(id)a4;
+ (void)sendTimedEvent:(id)a3 statusSuccess:(BOOL)a4 additionalDetails:(id)a5 startDate:(id)a6 endDate:(id)a7;
@end

@implementation APOdmlAnalytics

+ (void)sendTimedEvent:(id)a3 statusSuccess:(BOOL)a4 additionalDetails:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = NSString;
  v19 = objc_msgSend_eventName(a1, v17, v18);
  v21 = objc_msgSend_stringWithFormat_(v16, v20, @"%@.%@", @"com.apple.ap.SearchAdsODML", v19);

  double v24 = 0.0;
  if (v14)
  {
    if (v15)
    {
      objc_msgSend_timeIntervalSinceDate_(v15, v22, (uint64_t)v14);
      double v24 = v25;
      if (v25 < 0.0)
      {
        v26 = OdmlLogForCategory(8uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v43 = "+[APOdmlAnalytics sendTimedEvent:statusSuccess:additionalDetails:startDate:endDate:]";
          _os_log_impl(&dword_1BBC44000, v26, OS_LOG_TYPE_ERROR, "%s Start date is prior to end date", buf, 0xCu);
        }
      }
    }
  }
  v27 = objc_msgSend__versionAndIdentifiers(a1, v22, v23);
  objc_msgSend_setValue_forKey_(v27, v28, @"1", @"statusCode");
  v31 = objc_msgSend_numberWithDouble_(NSNumber, v29, v30, v24);
  objc_msgSend_setValue_forKey_(v27, v32, (uint64_t)v31, @"processingTime");

  if (v12)
  {
    if (!a4) {
      objc_msgSend_setValue_forKey_(v27, v33, @"2", @"statusCode");
    }
    v35 = NSString;
    uint64_t v36 = objc_msgSend_code(v12, v33, v34);
    v38 = objc_msgSend_stringWithFormat_(v35, v37, @"%ld", v36);
    objc_msgSend_setValue_forKey_(v27, v39, (uint64_t)v38, @"statusDetails");
  }
  if (v13) {
    objc_msgSend_addEntriesFromDictionary_(v27, v33, (uint64_t)v13);
  }
  v40 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v27);
  objc_msgSend__analyticsSendEvent_eventPayload_(a1, v41, (uint64_t)v21, v40);
}

+ (void)sendEvent:(id)a3 additionalDetails:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  v7 = NSString;
  v10 = objc_msgSend_eventName(a1, v8, v9);
  id v12 = objc_msgSend_stringWithFormat_(v7, v11, @"%@.%@", @"com.apple.ap.SearchAdsODML", v10);

  v16 = objc_msgSend__versionAndIdentifiers(a1, v13, v14);
  if (v27)
  {
    objc_msgSend_setValue_forKey_(v16, v15, @"2", @"statusCode");
    v17 = NSString;
    uint64_t v20 = objc_msgSend_code(v27, v18, v19);
    v22 = objc_msgSend_stringWithFormat_(v17, v21, @"%ld", v20);
    objc_msgSend_setValue_forKey_(v16, v23, (uint64_t)v22, @"statusDetails");

    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_msgSend_setValue_forKey_(v16, v15, @"1", @"statusCode");
  if (v6) {
LABEL_3:
  }
    objc_msgSend_addEntriesFromDictionary_(v16, v24, (uint64_t)v6);
LABEL_4:
  double v25 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v16);
  objc_msgSend__analyticsSendEvent_eventPayload_(a1, v26, (uint64_t)v12, v25);
}

+ (id)_versionAndIdentifiers
{
  v3 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  v5 = objc_msgSend_clientWithIdentifier_(MEMORY[0x1E4FB0098], v4, 238);
  v7 = objc_msgSend_experimentIdentifiersWithNamespaceName_(v5, v6, @"AD_PLATFORMS_ODML");
  uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v8, @"%d", 4);
  objc_msgSend_setValue_forKey_(v3, v10, (uint64_t)v9, @"ODMLVersion");

  id v13 = objc_msgSend_treatmentId(v7, v11, v12);
  objc_msgSend_setValue_forKey_(v3, v14, (uint64_t)v13, @"trialTreatmentID");

  v17 = objc_msgSend_experimentId(v7, v15, v16);
  objc_msgSend_setValue_forKey_(v3, v18, (uint64_t)v17, @"trialExperimentID");

  uint64_t v19 = NSString;
  uint64_t v22 = objc_msgSend_deploymentId(v7, v20, v21);
  double v24 = objc_msgSend_stringWithFormat_(v19, v23, @"%d", v22);
  objc_msgSend_setValue_forKey_(v3, v25, (uint64_t)v24, @"trialDeploymentID");

  return v3;
}

+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4
{
}

+ (id)eventName
{
  return @"eventName";
}

@end