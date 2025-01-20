@interface CellularProductExperimentsManager
- (CellularProductExperimentsManager)init;
- (OS_dispatch_queue)cellularProdExpQueue;
- (void)notifyRegisteredClientsForExperimentEnd;
- (void)notifyRegisteredClientsForExperimentStart:(id)a3;
- (void)readParametersFromPlist:(id)a3;
- (void)setCellularProdExpQueue:(id)a3;
- (void)subscribeToTrial;
- (void)updateTreatment;
@end

@implementation CellularProductExperimentsManager

- (CellularProductExperimentsManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CellularProductExperimentsManager;
  v2 = [(CellularProductExperimentsManager *)&v7 init];
  +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: init CellularProductExperimentsManager"];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.WirelessRadioManager.CellularProductExperimentsManager", 0);
  [(CellularProductExperimentsManager *)v2 setCellularProdExpQueue:v3];

  uint64_t v4 = +[TRIClient clientWithIdentifier:259];
  trialClient = v2->trialClient;
  v2->trialClient = (TRIClient *)v4;

  +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: initialized trialClient for Wireless project ID"];
  return v2;
}

- (void)readParametersFromPlist:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v4 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v3 error:&v11];

  uint64_t v5 = v11;
  if ([v4 count]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    CFStringRef v7 = @"CellularProductExperimentsManager: readParametersFromPlist: Error reading from plist file";
LABEL_9:
    +[WCM_Logging logLevel:22 message:v7];
    goto LABEL_10;
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"com.apple.WirelessRadioManagerd"];
  if (!v8)
  {
    CFStringRef v7 = @"CellularProductExperimentsManager: readParametersFromPlist: No Bundle ID com.apple.WirelessRadioManagerd in the plist";
    goto LABEL_9;
  }
  v9 = (void *)v8;
  v10 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
  [v10 setTrialParameters:v9];

LABEL_10:
}

- (void)notifyRegisteredClientsForExperimentStart:(id)a3
{
  id v4 = a3;
  +[WCM_Logging logLevel:22, @"CellularProductExperimentsManager: Experiment Start: set parameters from plist at %@", v4 message];
  [(CellularProductExperimentsManager *)self readParametersFromPlist:v4];
}

- (void)notifyRegisteredClientsForExperimentEnd
{
  +[WCM_Logging logLevel:22, @"CellularProductExperimentsManager: Experiment End: restore to default parameters from default plist file at %@", @"/System/Library/WRM/WRMDefaultCellularProductExperimentParameters.plist" message];
  id v3 = +[NSURL fileURLWithPath:@"/System/Library/WRM/WRMDefaultCellularProductExperimentParameters.plist"];
  [(CellularProductExperimentsManager *)self readParametersFromPlist:v3];
}

- (void)updateTreatment
{
  [(TRIClient *)self->trialClient refresh];
  id v3 = [(TRIClient *)self->trialClient experimentIdentifiersWithNamespaceName:@"WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL"];
  id v20 = v3;
  if (!v3)
  {
    +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: experimentIdentifiers nil. Experiment ended"];
    [(CellularProductExperimentsManager *)self notifyRegisteredClientsForExperimentEnd];
    goto LABEL_14;
  }
  id v4 = [v3 experimentId];
  id v5 = [v20 deploymentId];
  BOOL v6 = [v20 treatmentId];
  +[WCM_Logging logLevel:22, @"CellularProductExperimentsManager: experimentIdentifiers are: experimentId: %@, deploymentId: %d, treatmentId: %@", v4, v5, v6 message];

  CFStringRef v7 = [(TRIClient *)self->trialClient levelForFactor:off_10027CAD0 withNamespaceName:@"WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL"];
  uint64_t v8 = v7;
  if (v7)
  {
    v9 = [v7 fileValue];
    uint64_t v10 = [v9 path];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      v12 = [v8 fileValue];
      v13 = [v12 path];
      id v14 = [v13 length];

      if (v14)
      {
        v15 = [v8 fileValue];
        v16 = [v15 path];
        v17 = +[NSURL fileURLWithPath:v16];

        if (v17)
        {
          v18 = [v8 fileValue];
          v19 = [v18 path];
          +[WCM_Logging logLevel:22, @"CellularProductExperimentsManager: activateTreatment: Trial Asset path: %@", v19 message];

          [(CellularProductExperimentsManager *)self notifyRegisteredClientsForExperimentStart:v17];
        }
        else
        {
          +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: activateTreatment: Invalid asset path in trial"];
        }

        goto LABEL_13;
      }
    }
    else
    {
    }
    +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: activateTreatment: Invalid Asset Path. Treatment ended. Clear trial plist."];
    [(CellularProductExperimentsManager *)self notifyRegisteredClientsForExperimentEnd];
  }
  else
  {
    +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: activateTreatment: Invalid Trial level"];
  }
LABEL_13:

LABEL_14:
}

- (void)subscribeToTrial
{
  if (self->trialClient)
  {
    +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: checkTreatmentUpdate: Subscribing to Trial"];
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    objc_initWeak(&location, self);
    trialClient = self->trialClient;
    cellularProdExpQueue = self->cellularProdExpQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100055F70;
    v7[3] = &unk_10020E600;
    objc_copyWeak(&v8, &location);
    v7[4] = &v10;
    id v6 = [(TRIClient *)trialClient addUpdateHandlerForNamespaceName:@"WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL" queue:cellularProdExpQueue usingBlock:v7];
    if (!*((unsigned char *)v11 + 24))
    {
      +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: checkTreatmentUpdate: trialCallbackReceived : NO"];
      [(CellularProductExperimentsManager *)self updateTreatment];
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    +[WCM_Logging logLevel:22 message:@"CellularProductExperimentsManager: checkTreatmentUpdate: Invalid Trial client"];
  }
}

- (OS_dispatch_queue)cellularProdExpQueue
{
  return self->cellularProdExpQueue;
}

- (void)setCellularProdExpQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cellularProdExpQueue, 0);

  objc_storeStrong((id *)&self->trialClient, 0);
}

@end