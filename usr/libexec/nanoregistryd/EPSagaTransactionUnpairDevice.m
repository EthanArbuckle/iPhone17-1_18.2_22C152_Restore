@interface EPSagaTransactionUnpairDevice
- (EPRoutingSlipEntry)parentRoutingSlipEntry;
- (EPRoutingSlipEntry)routingSlipEntry;
- (EPServiceRegistry)serviceRegistry;
- (id)_deviceCollectionDiffWithPairingID:(id)a3;
- (id)registry;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5;
- (void)setParentRoutingSlipEntry:(id)a3;
- (void)setRoutingSlipEntry:(id)a3;
- (void)setServiceRegistry:(id)a3;
@end

@implementation EPSagaTransactionUnpairDevice

- (id)registry
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (id)_deviceCollectionDiffWithPairingID:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  id v5 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:0 andChangeType:2];
  [v4 setObject:v5 forKeyedSubscript:v3];

  id v6 = [objc_alloc((Class)NRDeviceCollectionDiff) initWithDeviceCollectionDiffDeviceDiffs:v4];

  return v6;
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  v8 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  if (v8)
  {
    v9 = [(EPSagaTransactionUnpairDevice *)self registry];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10007D424;
    v11[3] = &unk_1001656B8;
    id v12 = v8;
    id v13 = v6;
    id v14 = v7;
    v15 = self;
    [v9 grabRegistryWithReadBlockAsync:v11];
  }
  else
  {
    v10 = [(EPSagaTransactionRoutingSlip *)self delegate];
    [v10 transactionDidComplete:self];
  }
}

- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)&self->_parentRoutingSlipEntry, a3);
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_10007DC04;
  v41[4] = sub_10007DC14;
  id v42 = [v9 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  id v12 = [v9 objectForKeyedSubscript:@"shouldBrick"];
  id v13 = [v9 objectForKeyedSubscript:@"storeUnpair"];
  id v14 = [v9 objectForKeyedSubscript:@"migrationUnpair"];
  v15 = [v9 objectForKeyedSubscript:@"shouldPreserveESim"];
  v16 = [v9 objectForKeyedSubscript:@"pairingReport"];
  v17 = [v9 objectForKeyedSubscript:@"remoteUnpairRequestID"];
  v27 = v10;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_10007DC04;
  v39[4] = sub_10007DC14;
  id v40 = [v9 objectForKeyedSubscript:@"obliterationString"];
  v18 = [(EPSagaTransactionUnpairDevice *)self registry];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10007DC1C;
  v28[3] = &unk_100168330;
  v37 = v41;
  v28[4] = self;
  id v19 = v11;
  id v36 = v19;
  id v20 = v14;
  id v29 = v20;
  id v21 = v9;
  id v30 = v21;
  id v22 = v16;
  id v31 = v22;
  id v23 = v13;
  id v32 = v23;
  v38 = v39;
  id v24 = v15;
  id v33 = v24;
  id v25 = v12;
  id v34 = v25;
  id v26 = v17;
  id v35 = v26;
  [v18 grabRegistryWithReadBlockAsync:v28];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);

  objc_storeStrong((id *)&self->_parentRoutingSlipEntry, 0);
}

@end