@interface APOdmlAnalyticsModelTraining
+ (id)_versionAndIdentifiersFromRecordInfo:(id)a3 isCounterfactual:(BOOL)a4;
+ (id)eventName;
+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4;
+ (void)sendEvent:(id)a3 additionalDetails:(id)a4 info:(id)a5 isCounterfactual:(BOOL)a6 numOfRows:(unint64_t)a7 normDelta:(double)a8;
@end

@implementation APOdmlAnalyticsModelTraining

+ (id)eventName
{
  return @"ModelTraining";
}

+ (void)sendEvent:(id)a3 additionalDetails:(id)a4 info:(id)a5 isCounterfactual:(BOOL)a6 numOfRows:(unint64_t)a7 normDelta:(double)a8
{
  BOOL v10 = a6;
  id v42 = a3;
  id v14 = a4;
  v15 = NSString;
  id v16 = a5;
  v18 = objc_msgSend_stringWithFormat_(v15, v17, @"%@.%@", @"com.apple.ap.SearchAdsODML", @"ModelTraining");
  v20 = objc_msgSend__versionAndIdentifiersFromRecordInfo_isCounterfactual_(a1, v19, (uint64_t)v16, v10);

  if (v42)
  {
    objc_msgSend_setValue_forKey_(v20, v21, @"2", @"statusCode");
    v22 = NSString;
    uint64_t v25 = objc_msgSend_code(v42, v23, v24);
    v27 = objc_msgSend_stringWithFormat_(v22, v26, @"%ld", v25);
    objc_msgSend_setValue_forKey_(v20, v28, (uint64_t)v27, @"statusDetails");

    v31 = objc_msgSend_userInfo(v42, v29, v30);
    v33 = objc_msgSend_objectForKeyedSubscript_(v31, v32, @"errorSource");
    objc_msgSend_setValue_forKey_(v20, v34, (uint64_t)v33, @"errorSource");
  }
  else
  {
    objc_msgSend_setValue_forKey_(v20, v21, @"1", @"statusCode");
  }
  if (a8 != 9.22337204e18)
  {
    v36 = objc_msgSend_stringWithFormat_(NSString, v35, @"%f", *(void *)&a8);
    objc_msgSend_setValue_forKey_(v20, v37, (uint64_t)v36, @"normDelta");
  }
  if (a7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v38 = objc_msgSend_stringWithFormat_(NSString, v35, @"%lu", a7);
    objc_msgSend_setValue_forKey_(v20, v39, (uint64_t)v38, @"numTrainingRows");
  }
  if (v14) {
    objc_msgSend_addEntriesFromDictionary_(v20, v35, (uint64_t)v14);
  }
  v40 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v20);
  objc_msgSend__analyticsSendEvent_eventPayload_(a1, v41, (uint64_t)v18, v40);
}

+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4
{
}

+ (id)_versionAndIdentifiersFromRecordInfo:(id)a3 isCounterfactual:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v6, v7);
  BOOL v10 = objc_msgSend_stringWithFormat_(NSString, v9, @"%d", 4);
  objc_msgSend_setValue_forKey_(v8, v11, (uint64_t)v10, @"ODMLVersion");

  if (v5)
  {
    v13 = objc_msgSend_objectForKey_(v5, v12, @"PlacementType");
    BOOL v14 = v4;
    uint64_t v17 = objc_msgSend_unsignedIntegerValue(v13, v15, v16);
    v19 = objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v18, @"TuriTrialTreatmentID", v17, v4);
    v21 = objc_msgSend_objectForKey_(v5, v20, (uint64_t)v19);

    objc_msgSend_setValue_forKey_(v8, v22, (uint64_t)v21, @"trialTreatmentID");
    uint64_t v25 = objc_msgSend_unsignedIntegerValue(v13, v23, v24);
    v27 = objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v26, @"TuriTrialExperimentID", v25, v14);
    v29 = objc_msgSend_objectForKey_(v5, v28, (uint64_t)v27);

    objc_msgSend_setValue_forKey_(v8, v30, (uint64_t)v29, @"trialExperimentID");
    uint64_t v33 = objc_msgSend_unsignedIntegerValue(v13, v31, v32);
    v35 = objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v34, @"TuriTrialDeploymentID", v33, v14);
    v37 = objc_msgSend_objectForKey_(v5, v36, (uint64_t)v35);

    v40 = objc_msgSend_stringValue(v37, v38, v39);
    objc_msgSend_setValue_forKey_(v8, v41, (uint64_t)v40, @"trialDeploymentID");
  }

  return v8;
}

@end