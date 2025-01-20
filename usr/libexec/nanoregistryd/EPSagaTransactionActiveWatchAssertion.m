@interface EPSagaTransactionActiveWatchAssertion
- (BOOL)rollback;
- (EPActiveDeviceAssertion)assertion;
- (EPRoutingSlipEntry)parentRoutingSlipEntry;
- (EPRoutingSlipEntry)routingSlipEntry;
- (EPServiceRegistry)serviceRegistry;
- (id)delegate;
- (id)keymaster;
- (id)registry;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5;
- (void)getBluetoothIDForPairingID:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)resourceAvailabilityDidChange:(id)a3;
- (void)setAssertion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setParentRoutingSlipEntry:(id)a3;
- (void)setRollback:(BOOL)a3;
- (void)setRoutingSlipEntry:(id)a3;
- (void)setServiceRegistry:(id)a3;
@end

@implementation EPSagaTransactionActiveWatchAssertion

- (id)registry
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (id)keymaster
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (void)getBluetoothIDForPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(EPSagaTransactionActiveWatchAssertion *)self registry];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D599C;
  v11[3] = &unk_100167398;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 grabRegistryWithReadBlockAsync:v11];
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_routingSlipEntry, a3);
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  self->_rollback = 0;
  id v9 = [v7 objectForKeyedSubscript:@"switchToNRDeviceUUID"];
  id v10 = [(EPSagaTransactionActiveWatchAssertion *)self registry];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000D5C00;
  v14[3] = &unk_1001656B8;
  id v15 = v9;
  v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  [v10 grabRegistryWithReadBlockAsync:v14];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_routingSlipEntry, a3);
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  self->_rollback = 1;
  uint64_t v9 = [v7 objectForKeyedSubscript:@"switchFromNRDeviceUUID"];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [(EPSagaTransactionActiveWatchAssertion *)self registry];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000D65C0;
    v25[3] = &unk_1001677B8;
    id v12 = v10;
    id v26 = v12;
    v27 = &v28;
    [v11 deasyncGrabRegistryWithReadBlock:v25];
  }
  else
  {
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"8FC052B6-229F-49A7-BC78-3F56A5149994"];
  }
  [(EPResource *)self->_assertion invalidate];
  assertion = self->_assertion;
  self->_assertion = 0;

  id v14 = [v8 serviceFromClass:objc_opt_class()];
  id v15 = [v14 assertionWithPairingID:v12 isAltAccount:*((unsigned __int8 *)v29 + 24) delegate:self];
  v16 = self->_assertion;
  self->_assertion = v15;

  id v17 = [v7 objectForKeyedSubscript:@"switchToNRDeviceUUID"];
  if (!v17) {
    id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"8FC052B6-229F-49A7-BC78-3F56A5149994"];
  }
  id v18 = [v8 serviceFromClass:objc_opt_class()];
  v19 = +[NRQueue registryDaemonQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000D6620;
  v22[3] = &unk_100165530;
  id v20 = v18;
  id v23 = v20;
  id v21 = v17;
  id v24 = v21;
  [v19 dispatchAsync:v22];

  _Block_object_dispose(&v28, 8);
}

- (void)resourceAvailabilityDidChange:(id)a3
{
  v4 = (EPActiveDeviceAssertion *)a3;
  v5 = v4;
  if (self->_assertion == v4)
  {
    if ((id)[(EPResource *)v4 availability] == (id)1)
    {
      routingSlipEntry = self->_routingSlipEntry;
      serviceRegistry = self->_serviceRegistry;
      if (self->_rollback) {
        -[EPSagaTransactionRoutingSlip beginRollbackWithRoutingSlipEntry:serviceRegistry:](&v16, "beginRollbackWithRoutingSlipEntry:serviceRegistry:", routingSlipEntry, serviceRegistry, v14.receiver, v14.super_class, v15.receiver, v15.super_class, self, EPSagaTransactionActiveWatchAssertion);
      }
      else {
        -[EPSagaTransactionRoutingSlip beginTransactionWithRoutingSlipEntry:serviceRegistry:](&v15, "beginTransactionWithRoutingSlipEntry:serviceRegistry:", routingSlipEntry, serviceRegistry, v14.receiver, v14.super_class, self, EPSagaTransactionActiveWatchAssertion, v16.receiver, v16.super_class);
      }
    }
    else if ((id)[(EPResource *)v5 availability] == (id)2)
    {
      [(EPResource *)self->_assertion invalidate];
      assertion = self->_assertion;
      self->_assertion = 0;

      if (self->_rollback)
      {
        -[EPSagaTransactionRoutingSlip beginRollbackWithRoutingSlipEntry:serviceRegistry:](&v14, "beginRollbackWithRoutingSlipEntry:serviceRegistry:", self->_routingSlipEntry, self->_serviceRegistry, self, EPSagaTransactionActiveWatchAssertion, v15.receiver, v15.super_class, v16.receiver, v16.super_class);
      }
      else
      {
        uint64_t v9 = [(EPRoutingSlipEntry *)self->_routingSlipEntry errors];
        id v10 = [(EPResource *)v5 error];
        [v9 addObject:v10];

        id v11 = [(EPSagaTransactionRoutingSlip *)self childRoutingSlip];
        id v12 = [v11 state];

        if (!v12)
        {
          id v13 = [(EPSagaTransactionActiveWatchAssertion *)self delegate];
          [v13 transactionDidComplete:self];
        }
      }
    }
  }
}

- (void)invalidate
{
  [(EPResource *)self->_assertion invalidate];
  assertion = self->_assertion;
  self->_assertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)EPSagaTransactionActiveWatchAssertion;
  [(EPSagaTransactionRoutingSlip *)&v4 invalidate];
}

- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v71 = a4;
  id v70 = a5;
  objc_storeStrong((id *)&self->_parentRoutingSlipEntry, a3);
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  id v10 = [v9 objectForKeyedSubscript:@"switchFromNRDeviceUUID"];
  uint64_t v11 = [v9 objectForKeyedSubscript:@"switchFromIDSDeviceUUID"];
  id v12 = [v9 objectForKeyedSubscript:@"switchToNRDeviceUUID"];
  id v13 = [v9 objectForKeyedSubscript:@"switchToIDSDeviceUUID"];
  v72 = [v9 objectForKeyedSubscript:@"isPaired"];
  objc_super v14 = [v9 objectForKeyedSubscript:];
  v74 = [v9 objectForKeyedSubscript:v73];
  v76 = [v9 objectForKeyedSubscript:@"shouldKeepLaunchedDameonsDisabled"];
  objc_super v15 = +[NSMutableArray array];
  v78 = v15;
  if (v11 && ([v10 isEqual:v12] & 1) == 0)
  {
    id v17 = [EPRoutingSlipEntry alloc];
    uint64_t v18 = objc_opt_class();
    CFStringRef v91 = @"nrDeviceIdentifier";
    v19 = [[EPSagaOperandUUID alloc] initWithUUID:v10];
    v92 = v19;
    id v20 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    objc_super v16 = [(EPRoutingSlipEntry *)v17 initWithName:@"healthSync" transactionClass:v18 operands:v20];

    objc_super v15 = v78;
    [v78 addObject:v16];
  }
  else
  {
    objc_super v16 = 0;
  }
  v75 = v10;
  v77 = v14;
  v73 = (void *)v11;
  if (v10 != v12 && ([v10 isEqual:v12] & 1) == 0)
  {
    if ([v76 BOOLValue]) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = 2;
    }
    v65 = [EPRoutingSlipEntry alloc];
    v67 = v13;
    uint64_t v22 = objc_opt_class();
    v89[0] = @"setDaemonsEnabled";
    id v23 = [EPSagaOperandNumber alloc];
    id v24 = +[NSNumber numberWithUnsignedInteger:v21];
    v25 = [(EPSagaOperandNumber *)v23 initWithNumber:v24];
    v90[0] = v25;
    v89[1] = @"shouldRollBack";
    id v26 = [[EPSagaOperandNumber alloc] initWithNumber:v77];
    v90[1] = v26;
    v89[2] = @"setDaemonsEnabledRollbackNormalizeDeviceID";
    v27 = [[EPSagaOperandUUID alloc] initWithUUID:v10];
    v90[2] = v27;
    uint64_t v28 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:3];
    v29 = [(EPRoutingSlipEntry *)v65 initWithName:@"disableDaemons" transactionClass:v22 operands:v28];

    objc_super v14 = v77;
    uint64_t v11 = (uint64_t)v73;

    objc_super v15 = v78;
    [v78 addObject:v29];
    objc_super v16 = v29;
    id v13 = v67;
  }
  if (v10 && ([v10 isEqual:v12] & 1) == 0)
  {
    uint64_t v30 = [EPRoutingSlipEntry alloc];
    uint64_t v31 = objc_opt_class();
    CFStringRef v87 = @"shouldRollBack";
    v32 = [[EPSagaOperandNumber alloc] initWithNumber:v14];
    v88 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    uint64_t v34 = v31;
    objc_super v15 = v78;
    v35 = [(EPRoutingSlipEntry *)v30 initWithName:@"deactivateDevice" transactionClass:v34 operands:v33];

    objc_super v14 = v77;
    [v78 addObject:v35];
    objc_super v16 = v35;
  }
  if (!v13
    || ([v13 isEqual:v11] & 1) == 0 && objc_msgSend(v72, "BOOLValue"))
  {
    v66 = [EPRoutingSlipEntry alloc];
    uint64_t v36 = objc_opt_class();
    v85[0] = @"idsDeviceIdentifier";
    v37 = [[EPSagaOperandUUID alloc] initWithUUID:v13];
    v86[0] = v37;
    v85[1] = @"shouldRollBack";
    v68 = v13;
    v38 = [[EPSagaOperandNumber alloc] initWithNumber:v14];
    v86[1] = v38;
    v85[2] = @"shouldWaitForConnectivity";
    v39 = [[EPSagaOperandNumber alloc] initWithNumber:v74];
    v86[2] = v39;
    v85[3] = @"coreBluetoothSwitchBackID";
    v40 = [[EPSagaOperandUUID alloc] initWithUUID:v11];
    v86[3] = v40;
    v85[4] = @"nrDeviceIdentifier";
    v41 = [[EPSagaOperandUUID alloc] initWithUUID:v12];
    v86[4] = v41;
    v42 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:5];
    v43 = [(EPRoutingSlipEntry *)v66 initWithName:@"switchIDS" transactionClass:v36 operands:v42];

    objc_super v14 = v77;
    id v13 = v68;

    objc_super v15 = v78;
    [v78 addObject:v43];
    objc_super v16 = v43;
  }
  unsigned __int8 v44 = [v76 BOOLValue];
  v45 = v75;
  if (v75 != v12 && (v44 & 1) == 0 && ([v75 isEqual:v12] & 1) == 0)
  {
    v69 = [EPRoutingSlipEntry alloc];
    uint64_t v46 = objc_opt_class();
    v83[0] = @"setDaemonsEnabledNormalizeDeviceID";
    v47 = [[EPSagaOperandUUID alloc] initWithUUID:v12];
    v84[0] = v47;
    v83[1] = @"shouldRollBack";
    v48 = [[EPSagaOperandNumber alloc] initWithNumber:v14];
    v84[1] = v48;
    v83[2] = @"setDaemonsEnabledRollback";
    v49 = [[EPSagaOperandNumber alloc] initWithNumber:&off_100177498];
    v84[2] = v49;
    v83[3] = @"forceEnableIfPairedOrActive";
    v50 = [[EPSagaOperandNumber alloc] initWithNumber:&__kCFBooleanTrue];
    v84[3] = v50;
    +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:4];
    v52 = v51 = v13;
    v53 = [(EPRoutingSlipEntry *)v69 initWithName:@"enableDaemons" transactionClass:v46 operands:v52];

    id v13 = v51;
    objc_super v14 = v77;

    v45 = v75;
    [v78 addObject:v53];
    v54 = [EPRoutingSlipEntry alloc];
    uint64_t v55 = objc_opt_class();
    CFStringRef v81 = @"timeoutDuration";
    v56 = [[EPSagaOperandNumber alloc] initWithNumber:&off_100177540];
    v82 = v56;
    v57 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    objc_super v16 = [(EPRoutingSlipEntry *)v54 initWithName:@"wallClockWaitForDaemonsToEnable" transactionClass:v55 operands:v57];

    objc_super v15 = v78;
    [v78 addObject:v16];
  }
  if (v12)
  {
    v58 = [EPRoutingSlipEntry alloc];
    uint64_t v59 = objc_opt_class();
    v79[0] = @"nrDeviceIdentifier";
    v60 = [[EPSagaOperandUUID alloc] initWithUUID:v12];
    v79[1] = @"shouldRollBack";
    v80[0] = v60;
    v61 = [[EPSagaOperandNumber alloc] initWithNumber:v14];
    v80[1] = v61;
    v62 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
    uint64_t v63 = v59;
    objc_super v15 = v78;
    v64 = [(EPRoutingSlipEntry *)v58 initWithName:@"activateDevice" transactionClass:v63 operands:v62];

    objc_super v14 = v77;
    [v78 addObject:v64];
    objc_super v16 = v64;
  }
  (*((void (**)(id, void *, void, void))v70 + 2))(v70, v15, 0, 0);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EPRoutingSlipEntry)parentRoutingSlipEntry
{
  return self->_parentRoutingSlipEntry;
}

- (void)setParentRoutingSlipEntry:(id)a3
{
}

- (EPRoutingSlipEntry)routingSlipEntry
{
  return self->_routingSlipEntry;
}

- (void)setRoutingSlipEntry:(id)a3
{
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (EPActiveDeviceAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (BOOL)rollback
{
  return self->_rollback;
}

- (void)setRollback:(BOOL)a3
{
  self->_rollback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);
  objc_storeStrong((id *)&self->_parentRoutingSlipEntry, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end