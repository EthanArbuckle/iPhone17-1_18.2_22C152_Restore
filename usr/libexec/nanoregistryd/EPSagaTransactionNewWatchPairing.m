@interface EPSagaTransactionNewWatchPairing
+ (BOOL)shouldFlagNextPairingForAltAccount;
- (EPRoutingSlipEntry)parentRoutingSlipEntry;
- (EPServiceRegistry)serviceRegistry;
- (id)pairingID;
- (id)pairingReport;
- (id)registry;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5;
- (void)notifyPasscode:(id)a3;
- (void)routingSlipDidComplete:(id)a3 serviceRegistry:(id)a4;
- (void)setParentRoutingSlipEntry:(id)a3;
- (void)setServiceRegistry:(id)a3;
@end

@implementation EPSagaTransactionNewWatchPairing

+ (BOOL)shouldFlagNextPairingForAltAccount
{
  v2 = (void *)CFPreferencesCopyValue(@"forNextPairingSetIsIDAltAccount", @"com.apple.NanoRegistry", @"mobile", kCFPreferencesAnyHost);
  v3 = v2;
  if (v2 && [v2 BOOLValue])
  {
    CFPreferencesSetValue(@"forNextPairingSetIsIDAltAccount", 0, @"com.apple.NanoRegistry", @"mobile", kCFPreferencesAnyHost);
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)registry
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v116 = a4;
  id v113 = a5;
  objc_storeStrong((id *)&self->_parentRoutingSlipEntry, a3);
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  v115 = [v9 objectForKeyedSubscript:@"updatedDuringPairing"];
  unsigned __int8 v10 = [v115 BOOLValue];
  v114 = [v9 objectForKeyedSubscript:@"extensiblePairingPairingType"];
  if (objc_msgSend(@"extensiblePairingTypeDiscoverAndPairWithDeviceID", "isEqual:")) {
    [v9 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  }
  else {
  v119 = +[NSUUID UUID];
  }
  v11 = +[NSMutableArray array];
  if ([(id)objc_opt_class() shouldFlagNextPairingForAltAccount])
  {
    v12 = &__kCFBooleanTrue;
  }
  else
  {
    v12 = [v9 objectForKeyedSubscript:@"isAltAccountGizmo"];
  }
  if ([v12 BOOLValue])
  {
    v117 = v12;
  }
  else
  {

    v117 = 0;
  }
  p_info = (__objc2_class_ro **)(NRPBMigrationSetKeyResponse + 32);
  v118 = v9;
  v120 = v11;
  if ((v10 & 1) == 0)
  {
    v110 = [EPRoutingSlipEntry alloc];
    uint64_t v14 = objc_opt_class();
    v146[0] = @"switchToNRDeviceUUID";
    v15 = [[EPSagaOperandUUID alloc] initWithUUID:v119];
    v147[0] = v15;
    v146[1] = @"shouldWaitForConnectivity";
    v16 = [[EPSagaOperandNumber alloc] initWithNumber:&__kCFBooleanFalse];
    v147[1] = v16;
    v146[2] = @"shouldRollBack";
    v17 = [[EPSagaOperandNumber alloc] initWithNumber:&__kCFBooleanFalse];
    v147[2] = v17;
    v146[3] = @"shouldKeepLaunchedDameonsDisabled";
    v18 = [[EPSagaOperandNumber alloc] initWithNumber:&__kCFBooleanTrue];
    v147[3] = v18;
    v146[4] = @"destinationIsAltAccount";
    v19 = [EPSagaOperandNumber alloc];
    if (v117) {
      v20 = v117;
    }
    else {
      v20 = &__kCFBooleanFalse;
    }
    v21 = [(EPSagaOperandNumber *)v19 initWithNumber:v20];
    v147[4] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v147 forKeys:v146 count:5];
    v23 = [(EPRoutingSlipEntry *)v110 initWithName:@"assertion" transactionClass:v14 operands:v22];

    [v11 addObject:v23];
    id v24 = objc_alloc((Class)NRDevicePropertyDiffType);
    v25 = v24;
    if (v117)
    {
      id v26 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v117];
      id v27 = [v25 initWithDiff:v26 andChangeType:1];
    }
    else
    {
      id v27 = [v24 initWithDiff:0 andChangeType:2];
    }
    v109 = v27;
    id v28 = objc_alloc((Class)NRDeviceDiff);
    uint64_t v144 = NRDevicePropertyIsAltAccount;
    id v145 = v27;
    v29 = +[NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
    id v112 = [v28 initWithDiffPropertyDiffs:v29];

    id v111 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v112 andChangeType:1];
    id v30 = objc_alloc((Class)NRDeviceCollectionDiff);
    v142 = v119;
    id v143 = v111;
    v31 = +[NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];
    id v108 = [v30 initWithDeviceCollectionDiffDeviceDiffs:v31];

    v32 = [EPRoutingSlipEntry alloc];
    uint64_t v33 = objc_opt_class();
    CFStringRef v140 = @"transactionDiff";
    v34 = [[EPSagaOperandDiff alloc] initWithDiff:v108];
    v141 = v34;
    v35 = +[NSDictionary dictionaryWithObjects:&v141 forKeys:&v140 count:1];
    v36 = [(EPRoutingSlipEntry *)v32 initWithName:@"setAltAccountGizmo" transactionClass:v33 operands:v35];

    [v11 addObject:v36];
    v106 = [[EPRoutingSlipEntry alloc] initWithName:@"prepareIDSServices" transactionClass:objc_opt_class() operands:&__NSDictionary0__struct];

    [v11 addObject:v106];
    v103 = [EPRoutingSlipEntry alloc];
    uint64_t v102 = objc_opt_class();
    v138[0] = @"extensiblePairingDeviceID";
    v107 = [[EPSagaOperandUUID alloc] initWithUUID:v119];
    v139[0] = v107;
    v138[1] = @"extensiblePairingPairingType";
    v37 = [EPSagaOperandString alloc];
    v105 = [v118 objectForKeyedSubscript:@"extensiblePairingPairingType"];
    v104 = [(EPSagaOperandString *)v37 initWithString:v105];
    v139[1] = v104;
    v138[2] = @"extensiblePairingAdvertisedName";
    v38 = [EPSagaOperandString alloc];
    v101 = [v118 objectForKeyedSubscript:@"extensiblePairingAdvertisedName"];
    v39 = [(EPSagaOperandString *)v38 initWithString:v101];
    v139[2] = v39;
    v138[3] = @"extensiblePairingShouldFilePairingReport";
    v40 = [EPSagaOperandNumber alloc];
    v41 = [v118 objectForKeyedSubscript:@"extensiblePairingShouldFilePairingReport"];
    v42 = [(EPSagaOperandNumber *)v40 initWithNumber:v41];
    v139[3] = v42;
    v138[4] = @"extensiblePairingGizmoPairingVersion";
    v43 = [EPSagaOperandNumber alloc];
    v44 = [v118 objectForKeyedSubscript:@"extensiblePairingGizmoPairingVersion"];
    v45 = [(EPSagaOperandNumber *)v43 initWithNumber:v44];
    v139[4] = v45;
    v138[5] = @"isAltAccountGizmo";
    v46 = [[EPSagaOperandNumber alloc] initWithNumber:v117];
    v139[5] = v46;
    v47 = +[NSDictionary dictionaryWithObjects:v139 forKeys:v138 count:6];
    v48 = [(EPRoutingSlipEntry *)v103 initWithName:@"pairing" transactionClass:v102 operands:v47];

    p_info = NRPBMigrationSetKeyResponse.info;
    [v11 addObject:v48];
    v49 = [[EPRoutingSlipEntry alloc] initWithName:@"updateAppRemovability" transactionClass:objc_opt_class() operands:&__NSDictionary0__struct];

    [v11 addObject:v49];
  }
  v50 = [EPRoutingSlipEntry alloc];
  uint64_t v51 = objc_opt_class();
  v136[0] = @"notificationName";
  id v52 = [objc_alloc((Class)(p_info + 501)) initWithString:@"NRNotificationWaitForBridgeComplete"];
  v137[0] = v52;
  v136[1] = @"isDarwinNotification";
  v53 = v11;
  v54 = [[EPSagaOperandNumber alloc] initWithNumber:&__kCFBooleanFalse];
  v137[1] = v54;
  v55 = +[NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:2];
  v56 = [(EPRoutingSlipEntry *)v50 initWithName:@"waitForBridge" transactionClass:v51 operands:v55];

  [v53 addObject:v56];
  v57 = [EPRoutingSlipEntry alloc];
  uint64_t v58 = objc_opt_class();
  v134[0] = @"setDaemonsEnabledNormalizeDeviceID";
  v59 = [[EPSagaOperandUUID alloc] initWithUUID:v119];
  v135[0] = v59;
  v134[1] = @"setDaemonsEnabledRollback";
  v60 = [[EPSagaOperandNumber alloc] initWithNumber:&off_100177408];
  v135[1] = v60;
  v134[2] = @"forceEnableIfPairedOrActive";
  v61 = [[EPSagaOperandNumber alloc] initWithNumber:&__kCFBooleanTrue];
  v135[2] = v61;
  v62 = +[NSDictionary dictionaryWithObjects:v135 forKeys:v134 count:3];
  v63 = [(EPRoutingSlipEntry *)v57 initWithName:@"enableDaemons" transactionClass:v58 operands:v62];

  [v120 addObject:v63];
  v64 = [EPRoutingSlipEntry alloc];
  uint64_t v65 = objc_opt_class();
  CFStringRef v132 = @"timeoutDuration";
  v66 = [[EPSagaOperandNumber alloc] initWithNumber:&off_100177500];
  v133 = v66;
  v67 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
  v68 = [(EPRoutingSlipEntry *)v64 initWithName:@"wallClockWaitForDaemonsToEnable" transactionClass:v65 operands:v67];

  [v120 addObject:v68];
  v69 = [EPRoutingSlipEntry alloc];
  uint64_t v70 = objc_opt_class();
  v130[0] = @"nrDeviceIdentifier";
  v71 = [[EPSagaOperandUUID alloc] initWithUUID:v119];
  v131[0] = v71;
  v130[1] = @"isPaired";
  v72 = [[EPSagaOperandNumber alloc] initWithNumber:&__kCFBooleanTrue];
  v131[1] = v72;
  v73 = +[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:2];
  v74 = [(EPRoutingSlipEntry *)v69 initWithName:@"setDeviceAsPaired" transactionClass:v70 operands:v73];

  [v120 addObject:v74];
  v75 = [[EPRoutingSlipEntry alloc] initWithName:@"finishSetupIfNotAltAccount" transactionClass:objc_opt_class() operands:0];

  [v120 addObject:v75];
  v76 = [EPRoutingSlipEntry alloc];
  uint64_t v77 = objc_opt_class();
  v128[0] = @"nrDeviceIdentifier";
  v78 = [[EPSagaOperandUUID alloc] initWithUUID:v119];
  v129[0] = v78;
  v128[1] = @"extensiblePairingShouldFilePairingReport";
  v79 = [EPSagaOperandNumber alloc];
  v80 = [v118 objectForKeyedSubscript:@"extensiblePairingShouldFilePairingReport"];
  v81 = [(EPSagaOperandNumber *)v79 initWithNumber:v80];
  v129[1] = v81;
  v128[2] = @"extensiblePairingGizmoPairingVersion";
  v82 = [EPSagaOperandNumber alloc];
  v83 = [v118 objectForKeyedSubscript:@"extensiblePairingGizmoPairingVersion"];
  v84 = [(EPSagaOperandNumber *)v82 initWithNumber:v83];
  v129[2] = v84;
  v128[3] = @"shouldWaitForIsSetup";
  v85 = [[EPSagaOperandNumber alloc] initWithNumber:&off_100177420];
  v129[3] = v85;
  v86 = +[NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:4];
  v87 = [(EPRoutingSlipEntry *)v76 initWithName:@"pairedSyncIfNotAltAccount" transactionClass:v77 operands:v86];

  [v120 addObject:v87];
  if ([v117 BOOLValue])
  {
    v88 = [EPRoutingSlipEntry alloc];
    uint64_t v89 = objc_opt_class();
    CFStringRef v126 = @"timeoutDuration";
    v90 = [[EPSagaOperandNumber alloc] initWithNumber:&off_100177510];
    v127 = v90;
    v91 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
    v92 = [(EPRoutingSlipEntry *)v88 initWithName:@"wallClockWaitForNPSToStart" transactionClass:v89 operands:v91];

    [v120 addObject:v92];
    v87 = v92;
  }
  v93 = [EPRoutingSlipEntry alloc];
  uint64_t v94 = objc_opt_class();
  CFStringRef v124 = @"nrDeviceIdentifier";
  v95 = [[EPSagaOperandUUID alloc] initWithUUID:v119];
  v125 = v95;
  v96 = +[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
  v97 = [(EPRoutingSlipEntry *)v93 initWithName:@"tellIDSLocalPairingSetupCompleted" transactionClass:v94 operands:v96];

  [v120 addObject:v97];
  v98 = [v118 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100099A6C;
  block[3] = &unk_100165A70;
  id v122 = v120;
  id v123 = v113;
  id v99 = v120;
  id v100 = v113;
  dispatch_async(v98, block);
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 addService:self];
  v8.receiver = self;
  v8.super_class = (Class)EPSagaTransactionNewWatchPairing;
  [(EPSagaTransactionRoutingSlip *)&v8 beginTransactionWithRoutingSlipEntry:v7 serviceRegistry:v6];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 addService:self];
  v8.receiver = self;
  v8.super_class = (Class)EPSagaTransactionNewWatchPairing;
  [(EPSagaTransactionRoutingSlip *)&v8 beginRollbackWithRoutingSlipEntry:v7 serviceRegistry:v6];
}

- (void)routingSlipDidComplete:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 removeService:self];
  v8.receiver = self;
  v8.super_class = (Class)EPSagaTransactionNewWatchPairing;
  [(EPSagaTransactionRoutingSlip *)&v8 routingSlipDidComplete:v7 serviceRegistry:v6];
}

- (void)notifyPasscode:(id)a3
{
  serviceRegistry = self->_serviceRegistry;
  id v4 = a3;
  id v5 = [(EPServiceRegistry *)serviceRegistry optionalServiceFromClass:objc_opt_class()];
  [v5 notifyPasscode:v4];
}

- (id)pairingReport
{
  v2 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  uint64_t v3 = [v2 pairingReport];

  return v3;
}

- (id)pairingID
{
  v2 = [(EPServiceRegistry *)self->_serviceRegistry optionalServiceFromClass:objc_opt_class()];
  uint64_t v3 = [v2 pairingID];

  return v3;
}

- (EPRoutingSlipEntry)parentRoutingSlipEntry
{
  return self->_parentRoutingSlipEntry;
}

- (void)setParentRoutingSlipEntry:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRegistry, 0);

  objc_storeStrong((id *)&self->_parentRoutingSlipEntry, 0);
}

@end