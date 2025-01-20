@interface EPPairingAgentManager
+ (Class)resourceClass;
+ (id)stringFromCBManagerState:(int64_t)a3;
- (CBPairingAgent)agent;
- (EPPairingAgentManager)init;
- (id)newAgentWithDelegate:(id)a3 fromCentral:(BOOL)a4;
- (id)newCentralManagerWithDelegate:(id)a3;
- (id)newPeripheralManagerWithDelegate:(id)a3;
- (void)createResource;
- (void)destroyResource;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)resetStashVaribles;
- (void)update;
@end

@implementation EPPairingAgentManager

- (EPPairingAgentManager)init
{
  v3 = +[EPFactory queue];
  v6.receiver = self;
  v6.super_class = (Class)EPPairingAgentManager;
  v4 = [(EPResourceManager *)&v6 initWithQueue:v3];

  return v4;
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (id)newAgentWithDelegate:(id)a3 fromCentral:(BOOL)a4
{
  self->_fromCentral = a4;
  id v5 = [(EPResourceManager *)self newResourceWithDelegate:a3];
  if (!self->_fromCentral && self->_stashedPeer)
  {
    objc_super v6 = sub_1000A3BC0();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      v8 = sub_1000A3BC0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found stashed peer, retrying", v11, 2u);
      }
    }
    [(AbstractTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;

    [(EPPairingAgentManager *)self pairingAgent:self->_agent peerDidRequestPairing:self->_stashedPeer type:self->_stashedType passkey:self->_stashedPassKey];
    [(EPPairingAgentManager *)self resetStashVaribles];
  }
  return v5;
}

- (id)newCentralManagerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = +[EPFactory sharedFactory];
  id v5 = [v4 newCentralManagerWithDelegate:v3];

  return v5;
}

- (id)newPeripheralManagerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = +[EPFactory sharedFactory];
  id v5 = [v4 newPeripheralManagerWithDelegate:v3];

  return v5;
}

- (void)createResource
{
  v7.receiver = self;
  v7.super_class = (Class)EPPairingAgentManager;
  [(EPResourceManager *)&v7 createResource];
  unsigned int v3 = self->_centralManagerForAgent != 0;
  if (v3 <= (self->_peripheralManagerForAgent != 0)) {
    LOBYTE(v3) = self->_peripheralManagerForAgent != 0;
  }
  if ((v3 & 1) == 0)
  {
    if (self->_fromCentral)
    {
      v4 = [(EPPairingAgentManager *)self newCentralManagerWithDelegate:self];
      centralManagerForAgent = self->_centralManagerForAgent;
      self->_centralManagerForAgent = v4;
    }
    else
    {
      objc_super v6 = [(EPPairingAgentManager *)self newPeripheralManagerWithDelegate:self];
      centralManagerForAgent = self->_peripheralManagerForAgent;
      self->_peripheralManagerForAgent = v6;
    }
  }
}

- (void)destroyResource
{
  v10.receiver = self;
  v10.super_class = (Class)EPPairingAgentManager;
  [(EPResourceManager *)&v10 destroyResource];
  if (self->_agent)
  {
    unsigned int v3 = sub_1000A3BC0();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = sub_1000A3BC0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dellocating sharedPairingAgent", v9, 2u);
      }
    }
    agent = self->_agent;
    self->_agent = 0;
  }
  centralManagerForAgent = self->_centralManagerForAgent;
  self->_centralManagerForAgent = 0;

  peripheralManagerForAgent = self->_peripheralManagerForAgent;
  self->_peripheralManagerForAgent = 0;
}

- (void)update
{
  peripheralManagerForAgent = self->_peripheralManagerForAgent;
  if (!peripheralManagerForAgent) {
    peripheralManagerForAgent = self->_centralManagerForAgent;
  }
  id v4 = peripheralManagerForAgent;
  if ([v4 availability] != (id)1)
  {
    if ([v4 availability] == (id)2)
    {
      v8 = [v4 error];
      [(EPResourceManager *)self setAvailability:2 withError:v8];

      if (!self->_agent) {
        goto LABEL_26;
      }
      v9 = sub_1000A3BC0();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        v11 = sub_1000A3BC0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v22 = 0;
          v12 = (uint8_t *)&v22;
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dellocating sharedPairingAgent", v12, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else
    {
      [(EPResourceManager *)self setAvailability:0 withError:0];
      if (!self->_agent) {
        goto LABEL_26;
      }
      v13 = sub_1000A3BC0();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (v14)
      {
        v11 = sub_1000A3BC0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v21 = 0;
          v12 = (uint8_t *)&v21;
          goto LABEL_16;
        }
LABEL_17:
      }
    }
    agent = self->_agent;
    self->_agent = 0;
LABEL_25:

    goto LABEL_26;
  }
  if (!self->_agent)
  {
    id v5 = [(EPPeripheralManager *)self->_peripheralManagerForAgent manager];
    objc_super v6 = v5;
    if (v5)
    {
      objc_super v7 = v5;
    }
    else
    {
      objc_super v7 = [(EPCentralManager *)self->_centralManagerForAgent manager];
    }
    agent = v7;

    v16 = sub_1000A3BC0();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v18 = sub_1000A3BC0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Retrieving sharedPairingAgent", buf, 2u);
      }
    }
    v19 = [(CBPairingAgent *)agent sharedPairingAgent];
    v20 = self->_agent;
    self->_agent = v19;

    [(CBPairingAgent *)self->_agent setDelegate:self];
    [(EPResourceManager *)self setAvailability:1 withError:0];
    goto LABEL_25;
  }
LABEL_26:
}

+ (id)stringFromCBManagerState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    return @"CBManagerStateUnknown";
  }
  else {
    return *(&off_100169CF8 + a3 - 1);
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v5 = a4;
  objc_super v6 = sub_1000A3BC0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v8 = sub_1000A3BC0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v5 identifier];
      BOOL v10 = [v9 UUIDString];
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreBluetooth pairingAgent:peerDidUnpair:%@ received", buf, 0xCu);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E8740;
  v12[3] = &unk_100165908;
  v12[4] = self;
  id v13 = v5;
  id v11 = v5;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v12];
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v5 = a4;
  objc_super v6 = sub_1000A3BC0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v8 = sub_1000A3BC0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v5 identifier];
      BOOL v10 = [v9 UUIDString];
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreBluetooth pairingAgent:peerDidCompletePairing:%@ received", buf, 0xCu);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E88C0;
  v12[3] = &unk_100165908;
  v12[4] = self;
  id v13 = v5;
  id v11 = v5;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v12];
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = sub_1000A3BC0();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = sub_1000A3BC0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v7 identifier];
      id v13 = [v12 UUIDString];
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CoreBluetooth pairingAgent:peerDidFailToCompletePairing:%@ received", buf, 0xCu);
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000E8A64;
  v16[3] = &unk_100165930;
  v16[4] = self;
  id v17 = v7;
  id v18 = v8;
  id v14 = v8;
  id v15 = v7;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v16];
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = sub_1000A3BC0();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = sub_1000A3BC0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v11 identifier];
      id v17 = [v16 UUIDString];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CoreBluetooth pairingAgent:peerDidRequestPairing:%@ received", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000E8E2C;
  v30[3] = &unk_100169CD8;
  p_long long buf = &buf;
  v30[4] = self;
  id v18 = v11;
  id v31 = v18;
  int64_t v34 = a5;
  id v19 = v12;
  id v32 = v19;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v30];
  if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    v20 = sub_1000A3BC0();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      __int16 v22 = sub_1000A3BC0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unable to handle pairing request.  Stashing to try again later", (uint8_t *)&v29, 2u);
      }
    }
    objc_storeStrong((id *)&self->_stashedPeer, a4);
    self->_stashedType = a5;
    objc_storeStrong((id *)&self->_stashedPassKey, a6);
    [(AbstractTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;

    objc_initWeak(&v29, self);
    v24 = +[EPFactory queue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000E8EC0;
    v27[3] = &unk_100165E68;
    objc_copyWeak(&v28, &v29);
    v25 = +[TimerFactory timerWithIdentifier:@"com.apple.nanoregistry.migration.missedbtrequest" delay:1 gracePeriod:v24 waking:v27 handlerQueue:60.0 handlerBlock:0.0];
    v26 = self->_timer;
    self->_timer = v25;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v29);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)resetStashVaribles
{
  stashedPeer = self->_stashedPeer;
  self->_stashedPeer = 0;

  stashedPassKey = self->_stashedPassKey;
  self->_stashedPassKey = 0;

  self->_stashedType = 0;
}

- (CBPairingAgent)agent
{
  return self->_agent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_stashedPassKey, 0);
  objc_storeStrong((id *)&self->_stashedPeer, 0);
  objc_storeStrong((id *)&self->_centralManagerForAgent, 0);

  objc_storeStrong((id *)&self->_peripheralManagerForAgent, 0);
}

@end