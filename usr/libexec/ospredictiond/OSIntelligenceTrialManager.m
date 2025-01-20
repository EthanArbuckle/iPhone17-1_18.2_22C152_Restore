@interface OSIntelligenceTrialManager
+ (id)sharedChargePredictionInstance;
- (NSMutableArray)updateHandlers;
- (NSString)experimentID;
- (NSString)treatmentID;
- (NSString)trialNamespaceName;
- (OSIntelligenceTrialManager)init;
- (OS_os_log)log;
- (TRIClient)trialClient;
- (TRITrackingId)trialTrackingID;
- (double)doubleFactorForName:(id)a3;
- (double)loadTrialAdjustedHours;
- (double)loadTrialMinInputChargeDuration;
- (double)loadTrialThreshold;
- (id)loadModelFromPath:(id)a3 deleteExistingFiles:(BOOL)a4;
- (id)loadTrialDurationModelByDeletingExistingModel:(BOOL)a3;
- (id)loadTrialEngageModelByDeletingExistingModel:(BOOL)a3;
- (id)trialFactor:(id)a3;
- (int64_t)longFactorForName:(id)a3;
- (os_unfair_lock_s)lock;
- (void)addUpdateHandler:(id)a3;
- (void)loadTrialUpdates;
- (void)setExperimentID:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setTreatmentID:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)setTrialNamespaceName:(id)a3;
- (void)setTrialTrackingID:(id)a3;
- (void)setUpdateHandlers:(id)a3;
@end

@implementation OSIntelligenceTrialManager

- (OSIntelligenceTrialManager)init
{
  v33.receiver = self;
  v33.super_class = (Class)OSIntelligenceTrialManager;
  v2 = [(OSIntelligenceTrialManager *)&v33 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    os_log_t v4 = os_log_create("com.apple.osintelligence", "chargeprediction.trialmanager");
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    uint64_t v6 = +[TRIClient clientWithIdentifier:220];
    trialClient = v3->_trialClient;
    v3->_trialClient = (TRIClient *)v6;

    v8 = v3->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v3->_trialClient;
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
    }
    uint64_t v10 = [(TRIClient *)v3->_trialClient trackingId];
    trialTrackingID = v3->_trialTrackingID;
    v3->_trialTrackingID = (TRITrackingId *)v10;

    uint64_t v12 = +[TRINamespace namespaceNameFromId:251];
    trialNamespaceName = v3->_trialNamespaceName;
    v3->_trialNamespaceName = (NSString *)v12;

    v14 = v3->_trialClient;
    v15 = v3->_trialNamespaceName;
    id v31 = 0;
    id v32 = 0;
    unsigned __int8 v16 = [(TRIClient *)v14 trialIdentifiersWithNamespaceName:v15 experimentId:&v32 deploymentId:0 treatmentId:&v31];
    id v17 = v32;
    id v18 = v32;
    id v19 = v31;
    id v20 = v31;
    if ((v16 & 1) == 0)
    {
      v21 = v3->_log;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to load experiment/treatment IDs", buf, 2u);
      }
    }
    objc_storeStrong((id *)&v3->_experimentID, v17);
    objc_storeStrong((id *)&v3->_treatmentID, v19);
    uint64_t v22 = +[NSMutableArray array];
    updateHandlers = v3->_updateHandlers;
    v3->_updateHandlers = (NSMutableArray *)v22;

    objc_initWeak((id *)buf, v3);
    v24 = v3->_trialClient;
    v25 = v3->_trialNamespaceName;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100010A30;
    v28[3] = &unk_100064BE8;
    objc_copyWeak(&v30, (id *)buf);
    v29 = v3;
    id v26 = [(TRIClient *)v24 addUpdateHandlerForNamespaceName:v25 usingBlock:v28];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

+ (id)sharedChargePredictionInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010C18;
  block[3] = &unk_100064720;
  block[4] = a1;
  if (qword_10007A860 != -1) {
    dispatch_once(&qword_10007A860, block);
  }
  v2 = (void *)qword_10007A868;

  return v2;
}

- (void)loadTrialUpdates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_log_t v4 = (TRITrackingId *)[(TRIClient *)self->_trialClient newTrackingId];
  trialTrackingID = self->_trialTrackingID;
  self->_trialTrackingID = v4;

  uint64_t v6 = +[TRINamespace namespaceNameFromId:251];
  trialNamespaceName = self->_trialNamespaceName;
  self->_trialNamespaceName = v6;

  trialClient = self->_trialClient;
  v9 = self->_trialNamespaceName;
  id v18 = 0;
  id v19 = 0;
  unsigned __int8 v10 = [(TRIClient *)trialClient trialIdentifiersWithNamespaceName:v9 experimentId:&v19 deploymentId:0 treatmentId:&v18];
  v11 = (NSString *)v19;
  uint64_t v12 = (NSString *)v18;
  if ((v10 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load experiment/treatment IDs", v17, 2u);
    }
  }
  experimentID = self->_experimentID;
  self->_experimentID = v11;
  v15 = v11;

  treatmentID = self->_treatmentID;
  self->_treatmentID = v12;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)longFactorForName:(id)a3
{
  v3 = [(OSIntelligenceTrialManager *)self trialFactor:a3];
  id v4 = [v3 longValue];

  return (int64_t)v4;
}

- (double)doubleFactorForName:(id)a3
{
  v3 = [(OSIntelligenceTrialManager *)self trialFactor:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)addUpdateHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  updateHandlers = self->_updateHandlers;
  id v7 = objc_retainBlock(v5);

  [(NSMutableArray *)updateHandlers addObject:v7];

  os_unfair_lock_unlock(p_lock);
}

- (id)loadTrialEngageModelByDeletingExistingModel:(BOOL)a3
{
  BOOL v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial engagement model", v11, 2u);
  }
  uint64_t v6 = [(OSIntelligenceTrialManager *)self trialFactor:@"trialEngageModel"];
  id v7 = [v6 fileValue];
  v8 = [v7 path];
  v9 = [(OSIntelligenceTrialManager *)self loadModelFromPath:v8 deleteExistingFiles:v3];

  return v9;
}

- (id)loadTrialDurationModelByDeletingExistingModel:(BOOL)a3
{
  BOOL v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial duration model", v11, 2u);
  }
  uint64_t v6 = [(OSIntelligenceTrialManager *)self trialFactor:@"trialDurationModel"];
  id v7 = [v6 fileValue];
  v8 = [v7 path];
  v9 = [(OSIntelligenceTrialManager *)self loadModelFromPath:v8 deleteExistingFiles:v3];

  return v9;
}

- (double)loadTrialThreshold
{
  BOOL v3 = [(OSIntelligenceTrialManager *)self trialFactor:@"engagementThreshold"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = log;
      [v3 doubleValue];
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Threshold value is %lf", (uint8_t *)&v10, 0xCu);
    }
    [v3 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)loadTrialAdjustedHours
{
  BOOL v3 = [(OSIntelligenceTrialManager *)self trialFactor:@"adjustedHours"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = log;
      [v3 doubleValue];
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Duration hours is %lf", (uint8_t *)&v10, 0xCu);
    }
    [v3 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)loadTrialMinInputChargeDuration
{
  BOOL v3 = [(OSIntelligenceTrialManager *)self trialFactor:@"minInputChargeDuration"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = log;
      [v3 doubleValue];
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Minimum charge duration considered for model input is %lf", (uint8_t *)&v10, 0xCu);
    }
    [v3 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (id)trialFactor:(id)a3
{
  return [(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_trialNamespaceName];
}

- (id)loadModelFromPath:(id)a3 deleteExistingFiles:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (__CFString *)a3;
  uint64_t v7 = os_transaction_create();
  double v8 = (void *)v7;
  if (v6)
  {
    v59 = (void *)v7;
    if (([(__CFString *)v6 isAbsolutePath] & 1) == 0)
    {
      v9 = +[NSBundle bundleForClass:objc_opt_class()];
      int v10 = [v9 pathForResource:v6 ofType:0];

      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v71 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Not an absolute path, loading absolute path...Path is %@", buf, 0xCu);
      }
      if (v10)
      {
        uint64_t v12 = v10;

        uint64_t v6 = v12;
      }
    }
    v13 = +[NSFileManager defaultManager];
    char v68 = 0;
    v14 = [(__CFString *)v6 lastPathComponent];
    v15 = +[NSString stringWithFormat:@"%@%@", v14, @"c"];

    v78[0] = @"/var/mobile/Library/OSIntelligence";
    v78[1] = v15;
    unsigned __int8 v16 = +[NSArray arrayWithObjects:v78 count:2];
    id v17 = +[NSURL fileURLWithPathComponents:v16];

    if (v4)
    {
      id v18 = [(__CFString *)v17 path];
      id v19 = self->_log;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v71 = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "Removing existing files from %@", buf, 0xCu);
      }
      id v67 = 0;
      unsigned __int8 v20 = [v13 removeItemAtPath:v18 error:&v67];
      v21 = (__CFString *)v67;
      if ((v20 & 1) == 0)
      {
        uint64_t v22 = self->_log;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v71 = v18;
          __int16 v72 = 2112;
          v73 = v21;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v21 = 0;
    }
    v25 = [(__CFString *)v17 path];
    unsigned int v26 = [v13 fileExistsAtPath:v25 isDirectory:&v68];

    if (v26)
    {
      v66 = v21;
      v27 = +[MLModel modelWithContentsOfURL:v17 error:&v66];
      v28 = v66;

      if (v28)
      {
        v29 = self->_log;
        if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v71 = v17;
          __int16 v72 = 2112;
          v73 = v28;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v29, OS_LOG_TYPE_DEFAULT, "Failed to load model: %@ -- %@", buf, 0x16u);
        }
        v24 = 0;
      }
      else
      {
        v27 = v27;
        v24 = v27;
      }
      goto LABEL_54;
    }
    CFStringRef v57 = v17;
    v58 = v15;
    id v30 = [v13 temporaryDirectory];
    id v31 = [v30 path];
    v77[0] = v31;
    uint64_t v32 = +[NSUUID UUID];
    objc_super v33 = [(id)v32 UUIDString];
    v77[1] = v33;
    v34 = +[NSArray arrayWithObjects:v77 count:2];
    v27 = +[NSString pathWithComponents:v34];

    v65 = v21;
    LOBYTE(v32) = [v13 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:&v65];
    v28 = v65;

    if ((v32 & 1) == 0)
    {
      v40 = self->_log;
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v71 = v27;
        __int16 v72 = 2112;
        v73 = v28;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_DEFAULT, "Failed to create directory at path %@ -- %@", buf, 0x16u);
      }
      v24 = 0;
      id v17 = (__CFString *)v57;
      v15 = v58;
      goto LABEL_54;
    }
    v76[0] = v27;
    uint64_t v35 = [(__CFString *)v6 lastPathComponent];
    v76[1] = v35;
    v36 = +[NSArray arrayWithObjects:v76 count:2];
    v37 = +[NSURL fileURLWithPathComponents:v36];

    v38 = [(__CFString *)v37 path];
    v64 = v28;
    LOBYTE(v35) = [v13 copyItemAtPath:v6 toPath:v38 error:&v64];
    v39 = v64;

    if ((v35 & 1) == 0)
    {
      v41 = self->_log;
      id v17 = (__CFString *)v57;
      v15 = v58;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v71 = v6;
        __int16 v72 = 2112;
        v73 = v37;
        __int16 v74 = 2112;
        v75 = v39;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v41, OS_LOG_TYPE_DEFAULT, "Failed to copy model from %@ to %@ -- %@", buf, 0x20u);
      }
      v24 = 0;
      goto LABEL_53;
    }

    id v17 = (__CFString *)v57;
    if ([v13 fileExistsAtPath:@"/var/mobile/Library/OSIntelligence" isDirectory:&v68])
    {
      v39 = 0;
    }
    else
    {
      id v63 = 0;
      unsigned __int8 v42 = [v13 createDirectoryAtPath:@"/var/mobile/Library/OSIntelligence" withIntermediateDirectories:1 attributes:0 error:&v63];
      v39 = (__CFString *)v63;
      if ((v42 & 1) == 0)
      {
        v51 = self->_log;
        if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v71 = @"/var/mobile/Library/OSIntelligence";
          __int16 v72 = 2112;
          v73 = v39;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v51, OS_LOG_TYPE_DEFAULT, "Failed to create directory at path %@ -- %@", buf, 0x16u);
        }
        v24 = 0;
        v15 = v58;
        goto LABEL_53;
      }
    }
    CFStringRef v69 = @"/var/mobile/Library/OSIntelligence";
    v43 = +[NSArray arrayWithObjects:&v69 count:1];
    v44 = +[NSURL fileURLWithPathComponents:v43];

    v45 = +[MLCompilerOptions defaultOptions];
    id v62 = 0;
    v46 = +[MLCompiler compileSpecificationAtURL:v37 toURL:v44 options:v45 error:&v62];
    v39 = (__CFString *)v62;

    if (v39)
    {
      v47 = self->_log;
      v15 = v58;
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v71 = v37;
        __int16 v72 = 2112;
        v73 = v39;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v47, OS_LOG_TYPE_DEFAULT, "Failed to compile model: %@ -- %@", buf, 0x16u);
      }
      v24 = 0;
    }
    else
    {
      id v61 = 0;
      v56 = +[MLModel modelWithContentsOfURL:v57 error:&v61];
      v48 = (__CFString *)v61;
      v15 = v58;
      if (v48)
      {
        v39 = v48;
        v49 = self->_log;
        if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v71 = v57;
          __int16 v72 = 2112;
          v73 = v39;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v49, OS_LOG_TYPE_DEFAULT, "Failed to load model: %@ -- %@", buf, 0x16u);
        }
        v24 = 0;
        v50 = v56;
      }
      else
      {
        v55 = v46;
        id v60 = 0;
        unsigned __int8 v52 = [v13 removeItemAtPath:v27 error:&v60];
        v39 = (__CFString *)v60;
        if ((v52 & 1) == 0)
        {
          v53 = self->_log;
          if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v71 = v27;
            __int16 v72 = 2112;
            v73 = v39;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v53, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
          }
        }
        v24 = v56;
        v50 = v56;
        v46 = v55;
      }
    }
LABEL_53:

    v28 = v39;
LABEL_54:

    double v8 = v59;
    goto LABEL_55;
  }
  v23 = self->_log;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Failed to load model from null path", buf, 2u);
  }
  v24 = 0;
LABEL_55:

  return v24;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSString)treatmentID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTreatmentID:(id)a3
{
}

- (NSString)experimentID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExperimentID:(id)a3
{
}

- (NSString)trialNamespaceName
{
  return self->_trialNamespaceName;
}

- (void)setTrialNamespaceName:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTrialTrackingID:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableArray)updateHandlers
{
  return self->_updateHandlers;
}

- (void)setUpdateHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);

  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end