@interface STPrimitiveReactorBootstrapper
+ (id)bootstrappedReactorWithPersistentContainer:(id)a3 xpcServiceProvider:(id)a4 organizationControllerConfigurationAdapter:(id)a5 askForTimeEventRelay:(id)a6 askForTimeResponseHandler:(id)a7 reactorWillShutdown:(id)a8 reactorDidShutdown:(id)a9;
@end

@implementation STPrimitiveReactorBootstrapper

+ (id)bootstrappedReactorWithPersistentContainer:(id)a3 xpcServiceProvider:(id)a4 organizationControllerConfigurationAdapter:(id)a5 askForTimeEventRelay:(id)a6 askForTimeResponseHandler:(id)a7 reactorWillShutdown:(id)a8 reactorDidShutdown:(id)a9
{
  id v14 = a8;
  id v37 = a9;
  id v42 = a7;
  id v40 = a6;
  id v15 = a5;
  id v41 = a4;
  id v16 = a3;
  v39 = objc_opt_new();
  v48 = objc_opt_new();
  v17 = [[STConcreteIDSTransportPrimitives alloc] initWithServiceName:@"com.apple.private.alloy.screentime"];
  v51 = objc_opt_new();
  v47 = objc_opt_new();
  v49 = objc_opt_new();
  v50 = objc_opt_new();
  v36 = [[STConcreteCoreDataObserver alloc] initWithPersistentContainer:v16];
  v43 = [[STConcreteCoreDataTransformer alloc] initWithOrganizationControllerConfigurationAdapter:v15 deviceInformationPrimitives:v48 persistentContainer:v16];

  v46 = objc_opt_new();
  v45 = objc_opt_new();
  v44 = objc_opt_new();
  v34 = +[STLocations persistentStoreDirectory];
  v33 = [v34 URLByAppendingPathComponent:@"AddressMap/"];
  v32 = [v34 URLByAppendingPathComponent:@"IdentifierMap/"];
  v31 = [v34 URLByAppendingPathComponent:@"MessageLedger/"];
  v30 = [v34 URLByAppendingPathComponent:@"GenesisStateStore/"];
  v18 = (const char *)[@"com.apple.ScreenTimeAgent.reactor" UTF8String];
  v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v29 = dispatch_queue_create(v18, v19);

  v20 = (const char *)[@"com.apple.ScreenTimeAgent.transport-service" UTF8String];
  v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v22 = dispatch_queue_create(v20, v21);

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1000597AC;
  v54[3] = &unk_1002FD220;
  v55 = v17;
  id v56 = v14;
  v23 = v17;
  id v35 = v14;
  v24 = objc_retainBlock(v54);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000597F0;
  v52[3] = &unk_1002FCB70;
  id v53 = v37;
  id v38 = v37;
  v25 = objc_retainBlock(v52);
  v26 = -[STReactor initWithFamilyCirclePrimitives:deviceInformationPrimitives:idsTransportPrimitives:filesystemPrimitives:contactStorePrimitives:xpcServiceProvider:primitiveOSTransactionProvider:primitiveBackgroundActivitySchedulerProvider:coreDataObserver:coreDataConfigurationTransformer:coreDataDeviceStateTransformer:coreDataFamilyInformationTransformer:askForTimeEventRelay:askForTimeResponseHandler:biomeEventWriter:eyeReliefStateWriter:userSafetyPolicyWriter:messageAddressMapDirectoryURL:messageIdentifierMapDirectoryURL:messageLedgerDirectoryURL:genesisStateStoreDirectoryURL:reactorQueue:transportQueue:shutdownWillBegin:shutdownDidComplete:]([STReactor alloc], "initWithFamilyCirclePrimitives:deviceInformationPrimitives:idsTransportPrimitives:filesystemPrimitives:contactStorePrimitives:xpcServiceProvider:primitiveOSTransactionProvider:primitiveBackgroundActivitySchedulerProvider:coreDataObserver:coreDataConfigurationTransformer:coreDataDeviceStateTransformer:coreDataFamilyInformationTransformer:askForTimeEventRelay:askForTimeResponseHandler:biomeEventWriter:eyeReliefStateWriter:userSafetyPolicyWriter:messageAddressMapDirectoryURL:messageIdentifierMapDirectoryURL:messageLedgerDirectoryURL:genesisStateStoreDirectoryURL:reactorQueue:transportQueue:shutdownWillBegin:shutdownDidComplete:", v39, v48, v23, v51, v47, v41, v49, v50, v36, v43, v43, v43,
          v40,
          v42,
          v46,
          v45,
          v44,
          v33,
          v32,
          v31,
          v30,
          v29,
          v22,
          v24,
          v25);

  [(STReactor *)v26 start];
  dispatch_queue_t v27 = dispatch_queue_create((const char *)[@"com.apple.ScreenTimeAgent.family-circle-primitives" UTF8String], 0);
  [v39 startOnQueue:v27];

  [(STConcreteIDSTransportPrimitives *)v23 startOnQueue:v22];
  [(STConcreteCoreDataObserver *)v36 start];
  [(STReactor *)v26 reconcileGenesisStateStore];

  return v26;
}

@end