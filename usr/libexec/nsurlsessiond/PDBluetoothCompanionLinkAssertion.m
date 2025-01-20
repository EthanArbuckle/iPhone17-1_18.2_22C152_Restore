@interface PDBluetoothCompanionLinkAssertion
- (PDBluetoothCompanionLinkAssertion)init;
- (void)_updateState;
- (void)acquire;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PDBluetoothCompanionLinkAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_companionPeerIdentifier, 0);

  objc_storeStrong((id *)&self->_bluetoothSerialQueue, 0);
}

- (void)_updateState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_bluetoothSerialQueue);
  if (self->_isActive)
  {
    if (!self->_hasLoadedCompanionPeerIdentifier)
    {
      self->_hasLoadedCompanionPeerIdentifier = 1;
      v3 = +[NRPairedDeviceRegistry sharedInstance];
      v4 = [v3 getActivePairedDevice];
      v5 = [v3 deviceIDForNRDevice:v4];
      companionPeerIdentifier = self->_companionPeerIdentifier;
      self->_companionPeerIdentifier = v5;
    }
    if (self->_companionPeerIdentifier)
    {
      if (!self->_pipeManager)
      {
        v7 = (CBScalablePipeManager *)[objc_alloc((Class)CBScalablePipeManager) initWithDelegate:self queue:self->_bluetoothSerialQueue];
        pipeManager = self->_pipeManager;
        self->_pipeManager = v7;
      }
      if (!self->_hasSetLinkRequirements && [(CBScalablePipeManager *)self->_pipeManager state] == (id)5)
      {
        self->_hasSetLinkRequirements = 1;
        v9 = self->_pipeManager;
        v10 = self->_companionPeerIdentifier;
        [(CBScalablePipeManager *)v9 setLinkRequirementsForPeer:v10 packetsPerSecond:200 inputBytesPerSecond:0 outputBytesPerSecond:0];
      }
    }
  }
  else
  {
    v11 = self->_pipeManager;
    if (v11)
    {
      [(CBScalablePipeManager *)v11 setDelegate:0];
      if (self->_companionPeerIdentifier && self->_hasSetLinkRequirements) {
        -[CBScalablePipeManager setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:](self->_pipeManager, "setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:");
      }
      v12 = self->_pipeManager;
      self->_pipeManager = 0;
    }
    v13 = self->_companionPeerIdentifier;
    self->_companionPeerIdentifier = 0;

    self->_hasLoadedCompanionPeerIdentifier = 0;
  }
}

- (void)invalidate
{
  bluetoothSerialQueue = self->_bluetoothSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015C90;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(bluetoothSerialQueue, block);
}

- (void)acquire
{
  bluetoothSerialQueue = self->_bluetoothSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015DC0;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(bluetoothSerialQueue, block);
}

- (void)dealloc
{
  pipeManager = self->_pipeManager;
  if (pipeManager)
  {
    [(CBScalablePipeManager *)pipeManager setDelegate:0];
    companionPeerIdentifier = self->_companionPeerIdentifier;
    if (companionPeerIdentifier && self->_isActive && self->_hasSetLinkRequirements)
    {
      v5 = qword_1000CB110;
      if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v10 = self;
        __int16 v11 = 2112;
        v12 = companionPeerIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Relinquishing link requirements for %@", buf, 0x16u);
        companionPeerIdentifier = self->_companionPeerIdentifier;
      }
      [(CBScalablePipeManager *)self->_pipeManager setLinkRequirementsForPeer:companionPeerIdentifier packetsPerSecond:0 inputBytesPerSecond:0 outputBytesPerSecond:0];
    }
    v6 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_pipeManager;
      *(_DWORD *)buf = 138543618;
      v10 = self;
      __int16 v11 = 2114;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Releasing %{public}@", buf, 0x16u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PDBluetoothCompanionLinkAssertion;
  [(PDBluetoothCompanionLinkAssertion *)&v8 dealloc];
}

- (PDBluetoothCompanionLinkAssertion)init
{
  v7.receiver = self;
  v7.super_class = (Class)PDBluetoothCompanionLinkAssertion;
  v2 = [(PDBluetoothCompanionLinkAssertion *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nsurlsessiond.PDBluetoothCompanionLinkAssertion.bluetoothSerialQueue", v3);
    bluetoothSerialQueue = v2->_bluetoothSerialQueue;
    v2->_bluetoothSerialQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

@end