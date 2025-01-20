@interface ASDTFFeedbackSubmissionService
- (BOOL)_verifyDataSourceIsReadyForSubmission:(id)a3 error:(id *)a4;
- (BOOL)_verifyEmailIsValid:(id)a3;
- (id)_serializeFeedbackForBundleId:(id)a3 withContentsOfDataSource:(id)a4 error:(id *)a5;
- (unint64_t)maxNumberOfCommentSymbolsAllowed;
- (unint64_t)maxNumberOfScreenshotsAllowed;
- (void)submitFeedbackForBundleId:(id)a3 withContentsOfDataSource:(id)a4 completionHandler:(id)a5;
@end

@implementation ASDTFFeedbackSubmissionService

- (unint64_t)maxNumberOfScreenshotsAllowed
{
  return 10;
}

- (unint64_t)maxNumberOfCommentSymbolsAllowed
{
  return 4000;
}

- (void)submitFeedbackForBundleId:(id)a3 withContentsOfDataSource:(id)a4 completionHandler:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)[a4 copy];
  v11 = AMSGenerateLogCorrelationKey();
  v12 = +[TFLogConfiguration defaultConfiguration];
  v13 = [v12 generatedLogger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    id v15 = v14;
    v16 = [v10 debugDescription];
    *(_DWORD *)buf = 138544130;
    v49 = v14;
    __int16 v50 = 2112;
    v51 = v11;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v8;
    __int16 v54 = 2112;
    v55 = v16;
    _os_log_impl(&dword_223064000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%@] submitFeedbackForBundleId bundleId=%@ dataSource=%@", buf, 0x2Au);
  }
  id v43 = 0;
  BOOL v17 = [(ASDTFFeedbackSubmissionService *)self _verifyDataSourceIsReadyForSubmission:v10 error:&v43];
  id v18 = v43;
  v19 = v18;
  if (v17)
  {
    id v42 = 0;
    v20 = [(ASDTFFeedbackSubmissionService *)self _serializeFeedbackForBundleId:v8 withContentsOfDataSource:v10 error:&v42];
    id v21 = v42;
    v22 = v21;
    if (v20)
    {
      v23 = [MEMORY[0x263F25528] sharedInstance];
      [v23 submitFeedback:v20 withCompletionHandler:v9];
    }
    else
    {
      if (!v21)
      {
        uint64_t v32 = [NSString stringWithFormat:@"%@: Data serialization failed without generating error.", objc_opt_class()];
        v39 = (void *)MEMORY[0x263F087E8];
        v40 = (void *)v32;
        uint64_t v44 = *MEMORY[0x263F07F80];
        uint64_t v45 = v32;
        v33 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        v22 = [v39 errorWithDomain:@"TFErrorDomain" code:201 userInfo:v33];
      }
      v34 = +[TFLogConfiguration defaultConfiguration];
      v35 = [v34 generatedLogger];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_opt_class();
        id v41 = v36;
        uint64_t v37 = [v22 localizedDescription];
        *(_DWORD *)buf = 138543874;
        v49 = v36;
        __int16 v50 = 2112;
        v51 = v11;
        __int16 v52 = 2112;
        uint64_t v53 = v37;
        v38 = (void *)v37;
        _os_log_impl(&dword_223064000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%@] _serializeDataSource failed error=%@", buf, 0x20u);
      }
      v9[2](v9, v22);
    }
  }
  else
  {
    if (!v18)
    {
      v24 = [NSString stringWithFormat:@"%@: Data verification failed without generating error.", objc_opt_class()];
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F07F80];
      v47 = v24;
      v26 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      v19 = [v25 errorWithDomain:@"TFErrorDomain" code:201 userInfo:v26];
    }
    v27 = +[TFLogConfiguration defaultConfiguration];
    v28 = [v27 generatedLogger];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_opt_class();
      id v30 = v29;
      v31 = [v19 localizedDescription];
      *(_DWORD *)buf = 138543874;
      v49 = v29;
      __int16 v50 = 2112;
      v51 = v11;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v31;
      _os_log_impl(&dword_223064000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%@] _verifyDataSourceIsReadyForSubmission failed error=%@", buf, 0x20u);
    }
    v9[2](v9, v19);
  }
}

- (BOOL)_verifyDataSourceIsReadyForSubmission:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 stringForIdentifier:@"a"];
  BOOL v8 = [(ASDTFFeedbackSubmissionService *)self _verifyEmailIsValid:v7];
  if (v7 && !v8)
  {
    v9 = [NSString stringWithFormat:@"%@: Data validation failed - Provided email is malformed.", objc_opt_class()];
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F07F80];
    v29[0] = v9;
    v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v12 = v10;
    uint64_t v13 = 302;
LABEL_6:
    [v12 errorWithDomain:@"TFErrorDomain" code:v13 userInfo:v11];
    BOOL v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ([v6 isLoading])
  {
    v9 = [NSString stringWithFormat:@"%@: Data validation failed - Submitting data source that is still loading.", objc_opt_class()];
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F07F80];
    v27 = v9;
    v11 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v12 = v14;
    uint64_t v13 = 301;
    goto LABEL_6;
  }
  v9 = [v6 imageCollectionForIdentifer:@"c"];
  v11 = [v6 stringForIdentifier:@"b"];
  v16 = [v6 stringForIdentifier:@"d"];
  if (v9)
  {
    BOOL v17 = [v9 count] != 0;
    if (v11) {
      goto LABEL_9;
    }
LABEL_12:
    BOOL v18 = 0;
    if (v16) {
      goto LABEL_10;
    }
LABEL_13:
    BOOL v19 = 0;
    goto LABEL_14;
  }
  BOOL v17 = 0;
  if (!v11) {
    goto LABEL_12;
  }
LABEL_9:
  BOOL v18 = [v11 length] != 0;
  if (!v16) {
    goto LABEL_13;
  }
LABEL_10:
  BOOL v19 = [v16 length] != 0;
LABEL_14:
  BOOL v15 = v17 || v18 || v19;
  if (!v15)
  {
    v20 = [NSString stringWithFormat:@"%@: Data validation failed - Submitting data source without comments or screenshots.", objc_opt_class()];
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F07F80];
    v25 = v20;
    id v21 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    *a4 = [v23 errorWithDomain:@"TFErrorDomain" code:303 userInfo:v21];
  }
LABEL_17:

  return v15;
}

- (BOOL)_verifyEmailIsValid:(id)a3
{
  if (!a3) {
    return 1;
  }
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v6 length])
  {
    v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF MATCHES %@", @".+@.+"];
    char v8 = [v7 evaluateWithObject:v6];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (id)_serializeFeedbackForBundleId:(id)a3 withContentsOfDataSource:(id)a4 error:(id *)a5
{
  v58[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263F253F8]);
  id v41 = v8;
  [v10 setBundleID:v8];
  uint64_t v45 = [MEMORY[0x263EFF910] date];
  objc_msgSend(v10, "setTimestamp:", objc_msgSend(v45, "tf_posixTimestampInMilliseconds"));
  uint64_t v44 = [v9 stringForIdentifier:@"a"];
  v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v12 = [v44 stringByTrimmingCharactersInSet:v11];
  [v10 setEmail:v12];

  uint64_t v13 = [v9 imageCollectionForIdentifer:@"c"];
  v14 = v13;
  if (!v13) {
    goto LABEL_9;
  }
  unint64_t v15 = [v13 count];
  if (v15 <= [(ASDTFFeedbackSubmissionService *)self maxNumberOfScreenshotsAllowed])
  {
    uint64_t v49 = 0;
    __int16 v50 = &v49;
    uint64_t v51 = 0x3032000000;
    __int16 v52 = __Block_byref_object_copy__0;
    uint64_t v53 = __Block_byref_object_dispose__0;
    id v54 = 0;
    BOOL v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __95__ASDTFFeedbackSubmissionService__serializeFeedbackForBundleId_withContentsOfDataSource_error___block_invoke;
    v46[3] = &unk_26468E9F0;
    v46[4] = self;
    v48 = &v49;
    id v19 = v18;
    id v47 = v19;
    [v14 enumerateObjectsUsingBlock:v46];
    v20 = (void *)v50[5];
    if (v20) {
      *a5 = v20;
    }
    else {
      [v10 setImagesData:v19];
    }

    _Block_object_dispose(&v49, 8);
    if (v20)
    {
      id v17 = 0;
      goto LABEL_18;
    }
LABEL_9:
    id v43 = [v9 stringForIdentifier:@"b"];
    if (v43)
    {
      unint64_t v21 = [v43 length];
      if (v21 > [(ASDTFFeedbackSubmissionService *)self maxNumberOfCommentSymbolsAllowed])
      {
        id v42 = [NSString stringWithFormat:@"%@: Data serialization failed for too many comment symbols.", objc_opt_class()];
        v22 = (void *)MEMORY[0x263F087E8];
        uint64_t v55 = *MEMORY[0x263F07F80];
        uint64_t v56 = v42;
        v39 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        [v22 errorWithDomain:@"TFErrorDomain" code:402 userInfo:v39];
        id v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      [v10 setComments:v43];
    }
    v23 = [v9 stringForIdentifier:@"d"];
    [v10 setIncidentID:v23];

    id v42 = [v9 numberForIdentifier:@"i"];
    if (v42) {
      objc_msgSend(v10, "setAppUptime:", 1000 * objc_msgSend(v42, "unsignedLongLongValue"));
    }
    v40 = [v9 stringForIdentifier:@"m"];
    v38 = [v9 stringForIdentifier:@"n"];
    uint64_t v37 = [v9 stringForIdentifier:@"l"];
    [v10 setDeviceType:v40];
    [v10 setOsVersion:v38];
    [v10 setArchitecture:v37];
    v36 = [v9 numberForIdentifier:@"o"];
    v35 = [v9 numberForIdentifier:@"p"];
    objc_msgSend(v10, "setScreenWidth:", objc_msgSend(v36, "unsignedIntValue"));
    objc_msgSend(v10, "setScreenHeight:", objc_msgSend(v35, "unsignedIntValue"));
    v34 = [v9 stringForIdentifier:@"w"];
    v33 = [v9 stringForIdentifier:@"x"];
    [v10 setLocale:v34];
    [v10 setTimeZone:v33];
    uint64_t v32 = [v9 stringForIdentifier:@"t"];
    v31 = [v9 stringForIdentifier:@"u"];
    uint64_t v24 = [v9 stringForIdentifier:@"v"];
    [v10 setCarrier:v32];
    [v10 setCellularNetworkType:v31];
    [v10 setNetworkConnectionType:v24];
    v25 = [v9 numberForIdentifier:@"r"];
    uint64_t v26 = [v9 numberForIdentifier:@"s"];
    objc_msgSend(v10, "setDiskTotal:", objc_msgSend(v25, "unsignedLongLongValue"));
    objc_msgSend(v10, "setDiskAvailable:", objc_msgSend(v26, "unsignedLongLongValue"));
    v27 = [v9 numberForIdentifier:@"q"];
    objc_msgSend(v10, "setBatteryPercentage:", objc_msgSend(v27, "unsignedIntValue"));
    uint64_t v28 = [v9 stringForIdentifier:@"j"];
    v29 = [v9 stringForIdentifier:@"k"];
    [v10 setPairedWatchModel:v28];
    [v10 setPairedWatchOSVersion:v29];
    id v17 = v10;

    goto LABEL_17;
  }
  id v43 = [NSString stringWithFormat:@"%@: Data serialization failed for too many screenshot images.", objc_opt_class()];
  v16 = (void *)MEMORY[0x263F087E8];
  uint64_t v57 = *MEMORY[0x263F07F80];
  v58[0] = v43;
  id v42 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
  [v16 errorWithDomain:@"TFErrorDomain" code:401 userInfo:v42];
  id v17 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:

  return v17;
}

void __95__ASDTFFeedbackSubmissionService__serializeFeedbackForBundleId_withContentsOfDataSource_error___block_invoke(uint64_t a1, UIImage *a2, uint64_t a3, unsigned char *a4)
{
  TFImageJPEGRepresentation(a2);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v11 length] <= 0xA00000)
  {
    [*(id *)(a1 + 40) addObject:v11];
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"%@: Image %@ too large", objc_opt_class(), @"(no name provided)"];
    v7 = [MEMORY[0x263EFF9A0] dictionary];
    [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F07F80]];
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TFErrorDomain" code:404 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

@end