@interface APOdmlTrainingRowBiomeEvent
+ (id)featureForKey:(id)a3;
+ (id)makeEventWithRecordID:(id)a3 adamID:(id)a4 odmlResponse:(id)a5 appInstalled:(BOOL)a6 isDupe:(BOOL)a7 rerankingError:(id)a8 impressed:(BOOL)a9 tapped:(BOOL)a10;
+ (void)eventWithRecordID:(id)a3 adamID:(id)a4 odmlResponse:(id)a5 appInstalled:(BOOL)a6 isDupe:(BOOL)a7 rerankingError:(id)a8;
+ (void)removeAll;
+ (void)sendEvent:(id)a3;
+ (void)updateWithRecordID:(id)a3 adamID:(id)a4 event:(int64_t)a5;
@end

@implementation APOdmlTrainingRowBiomeEvent

+ (void)eventWithRecordID:(id)a3 adamID:(id)a4 odmlResponse:(id)a5 appInstalled:(BOOL)a6 isDupe:(BOOL)a7 rerankingError:(id)a8
{
  __int16 v9 = 0;
  objc_msgSend_makeEventWithRecordID_adamID_odmlResponse_appInstalled_isDupe_rerankingError_impressed_tapped_(APOdmlTrainingRowBiomeEvent, a2, (uint64_t)a3, a4, a5, a6, a7, a8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendEvent_(APOdmlTrainingRowBiomeEvent, v8, (uint64_t)v10);
}

+ (void)updateWithRecordID:(id)a3 adamID:(id)a4 event:(int64_t)a5
{
  HIBYTE(v6) = a5 == 2;
  LOBYTE(v6) = a5 == 1;
  objc_msgSend_makeEventWithRecordID_adamID_odmlResponse_appInstalled_isDupe_rerankingError_impressed_tapped_(APOdmlTrainingRowBiomeEvent, a2, (uint64_t)a3, a4, 0, 0, 0, 0, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendEvent_(APOdmlTrainingRowBiomeEvent, v5, (uint64_t)v7);
}

+ (void)sendEvent:(id)a3
{
  id v3 = a3;
  v4 = BiomeLibrary();
  id v7 = objc_msgSend_AdPlatforms(v4, v5, v6);
  id v10 = objc_msgSend_ODML(v7, v8, v9);
  objc_msgSend_TrainingRows(v10, v11, v12);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend_source(v17, v13, v14);
  objc_msgSend_sendEvent_(v15, v16, (uint64_t)v3);
}

+ (void)removeAll
{
  v2 = BiomeLibrary();
  v5 = objc_msgSend_AdPlatforms(v2, v3, v4);
  v8 = objc_msgSend_ODML(v5, v6, v7);
  objc_msgSend_TrainingRows(v8, v9, v10);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend_pruner(v15, v11, v12);
  objc_msgSend_deleteWithPolicy_eventsPassingTest_(v13, v14, @"personalized-ads-on", &unk_1F14FE758);
}

+ (id)makeEventWithRecordID:(id)a3 adamID:(id)a4 odmlResponse:(id)a5 appInstalled:(BOOL)a6 isDupe:(BOOL)a7 rerankingError:(id)a8 impressed:(BOOL)a9 tapped:(BOOL)a10
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  id v62 = a3;
  id v61 = a4;
  id v15 = a8;
  id v16 = a5;
  id v17 = [APOdmlSettings alloc];
  v19 = objc_msgSend_initWithPlacementType_assetManagerType_(v17, v18, 0, 0);
  v60 = objc_msgSend_featureForKey_(APOdmlTrainingRowBiomeEvent, v20, @"appUsageVector");
  v59 = objc_msgSend_featureForKey_(APOdmlTrainingRowBiomeEvent, v21, @"installedAppVector");
  v58 = objc_msgSend_featureForKey_(APOdmlTrainingRowBiomeEvent, v22, @"appDownloadVector");
  v57 = objc_msgSend_featureForKey_(APOdmlTrainingRowBiomeEvent, v23, @"userQueryVector");
  v56 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v24, (uint64_t)v16, 1, 0);

  id v25 = objc_alloc(MEMORY[0x1E4F4FC78]);
  v26 = NSString;
  uint64_t v29 = objc_msgSend_deploymentID(v19, v27, v28);
  v55 = objc_msgSend_stringWithFormat_(v26, v30, @"%d", v29);
  v33 = objc_msgSend_experimentID(v19, v31, v32);
  v36 = objc_msgSend_treatmentID(v19, v34, v35);
  v38 = objc_msgSend_numberWithBool_(NSNumber, v37, a9);
  v40 = objc_msgSend_numberWithBool_(NSNumber, v39, a10);
  v42 = objc_msgSend_numberWithBool_(NSNumber, v41, v11);
  uint64_t v44 = objc_msgSend_numberWithBool_(NSNumber, v43, v12);
  v47 = (void *)v44;
  if (v15)
  {
    v48 = NSNumber;
    uint64_t v49 = objc_msgSend_code(v15, v45, v46);
    v51 = objc_msgSend_numberWithLong_(v48, v50, v49);
    Vector_serverResponse_recordID = objc_msgSend_initWithDeploymentID_experimentID_treatmentID_adamID_impressed_tapped_dupe_installed_errorCode_appUsageVector_appDownloadVector_installedAppVector_userQueryVector_serverResponse_recordID_(v25, v52, (uint64_t)v55, v33, v36, v61, v38, v40, v42, v47, v51, v60, v58, v59, v57, v56, v62);
  }
  else
  {
    Vector_serverResponse_recordID = objc_msgSend_initWithDeploymentID_experimentID_treatmentID_adamID_impressed_tapped_dupe_installed_errorCode_appUsageVector_appDownloadVector_installedAppVector_userQueryVector_serverResponse_recordID_(v25, v45, (uint64_t)v55, v33, v36, v61, v38, v40, v42, v44, 0, v60, v58, v59, v57, v56, v62);
  }

  return Vector_serverResponse_recordID;
}

+ (id)featureForKey:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v4, v5);
  v8 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v6, v7, 0, 0);
  uint64_t v10 = objc_msgSend_featureForName_(v8, v9, (uint64_t)v3);

  v13 = objc_msgSend_arrayOfNumbers(v10, v11, v12);

  return v13;
}

@end