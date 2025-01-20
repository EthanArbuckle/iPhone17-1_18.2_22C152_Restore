@interface EPSagaTransactionPhoneMigration
- (EPRoutingSlipEntry)parentRoutingSlipEntry;
- (EPServiceRegistry)serviceRegistry;
- (id)_deviceCollectionDiffWithPairingID:(id)a3;
- (id)keymaster;
- (id)migrationReporter;
- (id)registry;
- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5;
- (void)routingSlip:(id)a3 entryDidCompleteRollback:(id)a4;
- (void)routingSlip:(id)a3 entryDidCompleteTransaction:(id)a4;
- (void)setParentRoutingSlipEntry:(id)a3;
- (void)setServiceRegistry:(id)a3;
@end

@implementation EPSagaTransactionPhoneMigration

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

- (id)migrationReporter
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (id)_deviceCollectionDiffWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NRDevicePropertyDiffType);
  id v6 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:&__kCFBooleanTrue];
  id v7 = [v5 initWithDiff:v6 andChangeType:1];

  id v28 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:0 andChangeType:2];
  v29 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  v8 = [v29 collection];
  v9 = [v8 objectForKeyedSubscript:v4];
  uint64_t v10 = _NRDevicePropertyMigrationCount;
  v11 = [v9 objectForKeyedSubscript:_NRDevicePropertyMigrationCount];
  v12 = [v11 value];

  id v13 = objc_alloc((Class)NRDevicePropertyDiffType);
  id v14 = objc_alloc((Class)NRDevicePropertyDiff);
  v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v12 integerValue] + 1);
  id v16 = [v14 initWithValue:v15];
  id v17 = [v13 initWithDiff:v16 andChangeType:1];

  id v18 = objc_alloc((Class)NRDevicePropertyDiffType);
  id v19 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:&__kCFBooleanTrue];
  id v20 = [v18 initWithDiff:v19 andChangeType:1];

  v30[0] = NRDevicePropertyIsPaired;
  v30[1] = NRDevicePropertyIsSetup;
  v31[0] = v7;
  v31[1] = v20;
  v21 = v7;
  v30[2] = NRDevicePropertyIsArchived;
  v30[3] = v10;
  v31[2] = v28;
  v31[3] = v17;
  v22 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
  v23 = +[NSMutableDictionary dictionary];
  id v24 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v22];
  id v25 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v24 andChangeType:1];
  [v23 setObject:v25 forKeyedSubscript:v4];

  id v26 = [objc_alloc((Class)NRDeviceCollectionDiff) initWithDeviceCollectionDiffDeviceDiffs:v23];

  return v26;
}

- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5
{
  v8 = (EPRoutingSlipEntry *)a3;
  id v9 = a4;
  id v10 = a5;
  parentRoutingSlipEntry = self->_parentRoutingSlipEntry;
  self->_parentRoutingSlipEntry = v8;
  v12 = v8;

  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  id v13 = [(EPRoutingSlipEntry *)v12 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  id v14 = [(EPSagaTransactionPhoneMigration *)self registry];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001E7CC;
  v18[3] = &unk_1001660A8;
  id v19 = v13;
  id v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v13;
  [v14 grabRegistryWithReadBlock:v18];
}

- (void)routingSlip:(id)a3 entryDidCompleteTransaction:(id)a4
{
  parentRoutingSlipEntry = self->_parentRoutingSlipEntry;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(EPRoutingSlipEntry *)parentRoutingSlipEntry objectForKeyedSubscript:@"nrDeviceIdentifier"];
  id v9 = [(EPSagaTransactionPhoneMigration *)self migrationReporter];
  [v9 checkInWithCompletedMigrationTransaction:v8 routingSlipEntry:v7 forPairingID:v10];
}

- (void)routingSlip:(id)a3 entryDidCompleteRollback:(id)a4
{
  parentRoutingSlipEntry = self->_parentRoutingSlipEntry;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(EPRoutingSlipEntry *)parentRoutingSlipEntry objectForKeyedSubscript:@"nrDeviceIdentifier"];
  id v9 = [(EPSagaTransactionPhoneMigration *)self migrationReporter];
  [v9 checkInWithMigrationTransactionRollback:v8 routingSlipEntry:v7 forPairingID:v10];
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