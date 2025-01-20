@interface WISTrialExperimentsManager
+ (id)getSharedInstance;
- (WISTrialExperimentsManager)init;
- (dispatch_queue_s)cellularProdExpQueue;
- (void)notifyRegisteredClientsForExperimentEnd;
- (void)notifyRegisteredClientsForExperimentStart:(id)a3;
- (void)readParametersFromPlist:(id)a3;
- (void)setCellularProdExpQueue:(dispatch_queue_s *)a3;
- (void)subscribeToTrial;
- (void)updateTreatment;
@end

@implementation WISTrialExperimentsManager

+ (id)getSharedInstance
{
  if (qword_1001D7C48 != -1) {
    dispatch_once(&qword_1001D7C48, &stru_1001B6940);
  }
  v2 = (void *)qword_1001D7C40;

  return v2;
}

- (WISTrialExperimentsManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WISTrialExperimentsManager;
  v2 = [(WISTrialExperimentsManager *)&v9 init];
  if (v2)
  {
    v3 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1001432A4(v3);
    }
    [(WISTrialExperimentsManager *)v2 setCellularProdExpQueue:dispatch_queue_create("com.apple.WirelessInsights.CellularProductExperimentsManager", 0)];
    uint64_t v4 = +[TRIClient clientWithIdentifier:259];
    trialClient = v2->trialClient;
    v2->trialClient = (TRIClient *)v4;

    v6 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100143220(v6);
    }
    if (v2->trialClient) {
      [(WISTrialExperimentsManager *)v2 subscribeToTrial];
    }
    v7 = v2;
  }

  return v2;
}

- (void)readParametersFromPlist:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v17 = 0;
    id v4 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v3 error:&v17];
    v5 = (__CFString *)v17;
    if ([v4 count]) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      v13 = [v4 objectForKeyedSubscript:@"com.apple.wirelessinsightsd"];
      v14 = *(NSObject **)(qword_1001D8080 + 48);
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138412546;
          v19 = off_1001D6E90;
          __int16 v20 = 2080;
          v21 = "-[WISTrialExperimentsManager readParametersFromPlist:]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#I %@: Bundle ID com.apple.wirelessinsightsd found in the plist, %s", buf, 0x16u);
          v14 = *(NSObject **)(qword_1001D8080 + 48);
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v19 = v13;
          __int16 v20 = 2112;
          v21 = (const char *)off_1001D6E90;
          __int16 v22 = 2080;
          v23 = "-[WISTrialExperimentsManager readParametersFromPlist:]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#I %@: WirelessInsightsd parameters for product experimentation are %@, %s", buf, 0x20u);
        }
        v16 = +[FederatedMobility getSharedInstance];
        [v16 initializeWithConfig:v13];

        goto LABEL_20;
      }
      if (v15)
      {
        *(_DWORD *)buf = 138412546;
        v19 = off_1001D6E90;
        __int16 v20 = 2080;
        v21 = "-[WISTrialExperimentsManager readParametersFromPlist:]";
        v8 = "#I %@: readParametersFromPlist: No Bundle ID com.apple.wirelessinsightsd in the plist, %s";
        objc_super v9 = v14;
        uint32_t v10 = 22;
        goto LABEL_18;
      }
    }
    else
    {
      v7 = *(NSObject **)(qword_1001D8080 + 48);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v19 = v5;
        __int16 v20 = 2112;
        v21 = (const char *)off_1001D6E90;
        __int16 v22 = 2080;
        v23 = "-[WISTrialExperimentsManager readParametersFromPlist:]";
        v8 = "#I %@: readParametersFromPlist: Error reading from plist file: %@, %s";
        objc_super v9 = v7;
        uint32_t v10 = 32;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
      }
    }
    v13 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v11 = +[FederatedMobility getSharedInstance];
  [v11 initializeWithConfig:&__NSDictionary0__struct];

  v12 = *(NSObject **)(qword_1001D8080 + 48);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = off_1001D6E90;
    __int16 v20 = 2080;
    v21 = "-[WISTrialExperimentsManager readParametersFromPlist:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#I %@: No active Experiment: Initialize FederatedMobility object with empty config %s", buf, 0x16u);
  }
LABEL_21:
}

- (void)notifyRegisteredClientsForExperimentStart:(id)a3
{
  id v4 = a3;
  v5 = *(NSObject **)(qword_1001D8080 + 48);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412802;
    v7 = off_1001D6E90;
    __int16 v8 = 2112;
    id v9 = v4;
    __int16 v10 = 2080;
    v11 = "-[WISTrialExperimentsManager notifyRegisteredClientsForExperimentStart:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#I %@: Experiment Start: set parameters from plist at %@, %s", (uint8_t *)&v6, 0x20u);
  }
  [(WISTrialExperimentsManager *)self readParametersFromPlist:v4];
}

- (void)notifyRegisteredClientsForExperimentEnd
{
  id v3 = *(NSObject **)(qword_1001D8080 + 48);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412546;
    v5 = off_1001D6E90;
    __int16 v6 = 2080;
    v7 = "-[WISTrialExperimentsManager notifyRegisteredClientsForExperimentEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#I %@: Experiment End: restore to default parameters %s", (uint8_t *)&v4, 0x16u);
  }
  [(WISTrialExperimentsManager *)self readParametersFromPlist:0];
}

- (void)updateTreatment
{
  [(TRIClient *)self->trialClient refresh];
  id v3 = [(TRIClient *)self->trialClient experimentIdentifiersWithNamespaceName:@"WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL"];
  int v4 = *(NSObject **)(qword_1001D8080 + 48);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      __int16 v6 = off_1001D6E90;
      v7 = [v3 experimentId];
      unsigned int v8 = [v3 deploymentId];
      id v9 = [v3 treatmentId];
      int v27 = 138413314;
      v28 = v6;
      __int16 v29 = 2112;
      v30 = v7;
      __int16 v31 = 1024;
      *(_DWORD *)v32 = v8;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v9;
      __int16 v33 = 2080;
      v34 = "-[WISTrialExperimentsManager updateTreatment]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#I %@: experimentIdentifiers are: experimentId: %@, deploymentId: %d, treatmentId: %@, %s", (uint8_t *)&v27, 0x30u);
    }
    __int16 v10 = [(TRIClient *)self->trialClient levelForFactor:off_1001D6E98 withNamespaceName:@"WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL"];
    v11 = v10;
    if (!v10)
    {
      v25 = *(NSObject **)(qword_1001D8080 + 48);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412546;
        v28 = off_1001D6E90;
        __int16 v29 = 2080;
        v30 = "-[WISTrialExperimentsManager updateTreatment]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#I %@: activateTreatment: Invalid Trial level, %s", (uint8_t *)&v27, 0x16u);
      }
      goto LABEL_23;
    }
    v12 = [v10 fileValue];
    v13 = [v12 path];
    if (v13)
    {
      v14 = [v11 fileValue];
      BOOL v15 = [v14 path];
      BOOL v16 = [v15 length] == 0;

      if (!v16)
      {
        id v17 = [v11 fileValue];
        v18 = [v17 path];
        v19 = +[NSURL fileURLWithPath:v18];

        __int16 v20 = *(NSObject **)(qword_1001D8080 + 48);
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
        if (v19)
        {
          if (v21)
          {
            __int16 v22 = off_1001D6E90;
            v23 = [v11 fileValue];
            v24 = [v23 path];
            int v27 = 138412802;
            v28 = v22;
            __int16 v29 = 2112;
            v30 = v24;
            __int16 v31 = 2080;
            *(void *)v32 = "-[WISTrialExperimentsManager updateTreatment]";
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#I %@: activateTreatment: Trial Asset path: %@, %s", (uint8_t *)&v27, 0x20u);
          }
          [(WISTrialExperimentsManager *)self notifyRegisteredClientsForExperimentStart:v19];
        }
        else if (v21)
        {
          int v27 = 138412546;
          v28 = off_1001D6E90;
          __int16 v29 = 2080;
          v30 = "-[WISTrialExperimentsManager updateTreatment]";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#I %@: activateTreatment: Invalid asset path in trial, %s", (uint8_t *)&v27, 0x16u);
        }

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
    }
    v26 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412546;
      v28 = off_1001D6E90;
      __int16 v29 = 2080;
      v30 = "-[WISTrialExperimentsManager updateTreatment]";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "#I %@: activateTreatment: Invalid Asset Path. Treatment ended. Clear trial plist, %s", (uint8_t *)&v27, 0x16u);
    }
    [(WISTrialExperimentsManager *)self notifyRegisteredClientsForExperimentEnd];
    goto LABEL_23;
  }
  if (v5)
  {
    int v27 = 138412546;
    v28 = off_1001D6E90;
    __int16 v29 = 2080;
    v30 = "-[WISTrialExperimentsManager updateTreatment]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#I %@: experimentIdentifiers nil. Experiment ended, %s", (uint8_t *)&v27, 0x16u);
  }
  [(WISTrialExperimentsManager *)self notifyRegisteredClientsForExperimentEnd];
LABEL_24:
}

- (void)subscribeToTrial
{
  trialClient = self->trialClient;
  int v4 = *(NSObject **)(qword_1001D8080 + 48);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (trialClient)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = off_1001D6E90;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[WISTrialExperimentsManager subscribeToTrial]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#I %@: checkTreatmentUpdate: Subscribing to Trial, %s", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v19 = 0;
    objc_initWeak(&location, self);
    v7 = self->trialClient;
    unsigned int v8 = [(WISTrialExperimentsManager *)self cellularProdExpQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100048F54;
    v11[3] = &unk_1001B6968;
    objc_copyWeak(&v12, &location);
    v11[4] = buf;
    id v9 = [(TRIClient *)v7 addUpdateHandlerForNamespaceName:@"WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL" queue:v8 usingBlock:v11];
    if (!*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      __int16 v10 = *(NSObject **)(qword_1001D8080 + 48);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v14 = 138412546;
        BOOL v15 = off_1001D6E90;
        __int16 v16 = 2080;
        id v17 = "-[WISTrialExperimentsManager subscribeToTrial]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#I %@: checkTreatmentUpdate: trialCallbackReceived : NO, %s", v14, 0x16u);
      }
      [(WISTrialExperimentsManager *)self updateTreatment];
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else if (v5)
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = off_1001D6E90;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[WISTrialExperimentsManager subscribeToTrial]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#I %@: checkTreatmentUpdate: Invalid Trial client, %s", buf, 0x16u);
  }
}

- (dispatch_queue_s)cellularProdExpQueue
{
  return self->_cellularProdExpQueue;
}

- (void)setCellularProdExpQueue:(dispatch_queue_s *)a3
{
  self->_cellularProdExpQueue = a3;
}

- (void).cxx_destruct
{
}

@end