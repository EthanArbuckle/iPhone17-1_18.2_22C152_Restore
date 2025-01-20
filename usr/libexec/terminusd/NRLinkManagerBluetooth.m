@interface NRLinkManagerBluetooth
- (id)copyName;
- (id)copyStatusString;
- (void)cancel;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4;
- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
@end

@implementation NRLinkManagerBluetooth

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheralConnectDate, 0);
  objc_storeStrong((id *)&self->_pipeStateDictionary, 0);
  objc_storeStrong((id *)&self->_linkRequirementsMonitorSource, 0);
  objc_destroyWeak((id *)&self->_bluetoothManagerDelegate);
  objc_storeStrong((id *)&self->_appliedLinkRequirements, 0);
  objc_storeStrong((id *)&self->_requestedLinkRequirements, 0);
  objc_storeStrong((id *)&self->_p2pPipeRegistrations, 0);
  objc_storeStrong((id *)&self->_pipeRegistrations, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);

  objc_storeStrong((id *)&self->_links, 0);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  v12 = (CBCentralManager *)a3;
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    v10 = self->_centralManager;
    if (v10)
    {
      centralManager = self->_centralManager;

      if (centralManager == v12)
      {
        [(NRLinkManager *)self reportEvent:4004, @"peripheral %@ error %@", v8, v9 detailsFormat];
        sub_10002896C((id *)&self->super.super.isa);
      }
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  v17 = (CBCentralManager *)a3;
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    v10 = self->_centralManager;
    if (v10)
    {
      centralManager = self->_centralManager;

      if (centralManager == v17)
      {
        [(NRLinkManager *)self reportEvent:4002, @"peripheral %@ error %@", v8, v9 detailsFormat];
        v12 = (NRAnalyticsLinkManagerBluetooth *)v9;
        v13 = v12;
        if (v12 && [(NRAnalyticsLinkManagerBluetooth *)v12 code] == (id)14)
        {
          v14 = [(NRAnalyticsLinkManagerBluetooth *)v13 domain];
          unsigned int v15 = [v14 isEqualToString:CBErrorDomain];

          if (!v15)
          {
LABEL_11:
            sub_10002896C((id *)&self->super.super.isa);
            goto LABEL_12;
          }
          [(NRLinkManager *)self reportEvent:4015, @"peripheral %@", v8 detailsFormat];
          v16 = objc_alloc_init(NRAnalyticsLinkManagerBluetooth);
          v13 = v16;
          if (v16) {
            v16->_peerRemovedPairingInformation = 1;
          }
          [(NRAnalyticsLinkManagerBluetooth *)v16 submit];
        }

        goto LABEL_11;
      }
    }
  }
LABEL_12:
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  v10 = (CBCentralManager *)a3;
  id v6 = a4;
  if (self)
  {
    v7 = self->_centralManager;
    if (v7)
    {
      centralManager = self->_centralManager;

      if (centralManager == v10)
      {
        id v9 = [v6 description];
        [(NRLinkManager *)self reportEvent:4001 details:v9];

        sub_10002947C((uint64_t)self);
      }
    }
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v6 = (CBCentralManager *)a3;
  if (self)
  {
    v4 = self->_centralManager;
    if (v4)
    {
      centralManager = self->_centralManager;

      if (centralManager == v6) {
        sub_10002A434(self, (uint64_t)[(CBCentralManager *)v6 state]);
      }
    }
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v59 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_81;
    }
LABEL_85:
    id v63 = sub_1000286EC();
    _NRLogWithArgs();

    goto LABEL_81;
  }
  if (!v9)
  {
    id v61 = sub_1000286EC();
    int v62 = _NRLogIsLevelEnabled();

    if (!v62) {
      goto LABEL_81;
    }
    goto LABEL_85;
  }
  v11 = [v9 peer];
  uint64_t v12 = [v11 identifier];

  v73 = (void *)v12;
  if (!v12)
  {
    id v64 = sub_1000286EC();
    int v65 = _NRLogIsLevelEnabled();

    if (!v65) {
      goto LABEL_80;
    }
LABEL_89:
    id v68 = sub_1000286EC();
    _NRLogWithArgs();

    goto LABEL_80;
  }
  v13 = (char *)[v9 priority];
  id v14 = [v9 type];
  if ((unint64_t)(v13 - 1) >= 3)
  {
    if (qword_1001F48D0 != -1) {
      dispatch_once(&qword_1001F48D0, &stru_1001C6548);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F48D0 != -1) {
        dispatch_once(&qword_1001F48D0, &stru_1001C6548);
      }
      _NRLogWithArgs();
    }
    goto LABEL_80;
  }
  id v70 = v8;
  id v71 = v9;
  if (!self) {
    goto LABEL_88;
  }
  id v15 = v14;
  uint64_t v16 = dword_10016C9C4[(void)(v13 - 1)];
  v17 = &OBJC_IVAR___NRLinkManagerBluetooth__pipeRegistrations;
  if (v14 == (id)2) {
    v17 = &OBJC_IVAR___NRLinkManagerBluetooth__p2pPipeRegistrations;
  }
  id v18 = *(id *)((char *)&self->super.super.isa + *v17);
  v19 = +[NSNumber numberWithInteger:v13];
  v20 = [v18 objectForKeyedSubscript:v19];

  if (!v20)
  {
LABEL_88:
    id v66 = sub_1000286EC();
    int v67 = _NRLogIsLevelEnabled();

    id v8 = v70;
    id v9 = v71;
    if (!v67) {
      goto LABEL_80;
    }
    goto LABEL_89;
  }
  id v9 = v71;
  [(NRLinkManager *)self reportEvent:v16, @"pipe %@ bluetoothUUID %@ error %@", v71, v12, v10 detailsFormat];
  [v20[2] removeObject:v71];
  sub_10002AD34((char *)self, (uint64_t)v13, v15 == (id)2);
  if (v13 == (char *)3)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v21 = self->_links;
    id v31 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v83;
      do
      {
        v34 = 0;
        do
        {
          if (*(void *)v83 != v33) {
            objc_enumerationMutation(v21);
          }
          uint64_t v35 = *(void *)(*((void *)&v82 + 1) + 8 * (void)v34);
          if (v35) {
            v36 = *(void **)(v35 + 327);
          }
          else {
            v36 = 0;
          }
          id v37 = v36;
          unsigned int v38 = [v37 isEqual:v73];

          if (v38)
          {
            sub_100083B0C(v35, 0);
            goto LABEL_71;
          }
          v34 = (char *)v34 + 1;
        }
        while (v32 != v34);
        id v39 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v82 objects:v92 count:16];
        id v32 = v39;
      }
      while (v39);
    }
  }
  else
  {
    if (v13 != (char *)2)
    {
      v69 = v20;
      id v40 = objc_alloc_init((Class)NSMutableArray);
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v41 = self->_links;
      id v42 = [(NSMutableSet *)v41 countByEnumeratingWithState:&v78 objects:v91 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v79;
        do
        {
          for (i = 0; i != v43; i = (char *)i + 1)
          {
            if (*(void *)v79 != v44) {
              objc_enumerationMutation(v41);
            }
            uint64_t v46 = *(void *)(*((void *)&v78 + 1) + 8 * i);
            if (v46) {
              v47 = *(void **)(v46 + 327);
            }
            else {
              v47 = 0;
            }
            id v48 = v47;
            unsigned int v49 = [v48 isEqual:v73];

            if (v49) {
              [v40 addObject:v46];
            }
          }
          id v43 = [(NSMutableSet *)v41 countByEnumeratingWithState:&v78 objects:v91 count:16];
        }
        while (v43);
      }

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id obj = v40;
      id v50 = [obj countByEnumeratingWithState:&v74 objects:v90 count:16];
      if (v50)
      {
        id v51 = v50;
        uint64_t v52 = *(void *)v75;
        do
        {
          for (j = 0; j != v51; j = (char *)j + 1)
          {
            if (*(void *)v75 != v52) {
              objc_enumerationMutation(obj);
            }
            v54 = *(unsigned char **)(*((void *)&v74 + 1) + 8 * (void)j);
            v55 = [v54 nrUUID];
            if (v54)
            {
              [v54 setNoTransport:1];
              v54[233] = 1;
              [v54 cancelWithReason:@"Bluetooth Pipe Disconnected"];
            }
            id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothManagerDelegate);
            [WeakRetained pipeDidConnectForNRUUID:0 nrUUID:v55];

            sub_10002AE48((uint64_t)self, v55);
          }
          id v51 = [obj countByEnumeratingWithState:&v74 objects:v90 count:16];
        }
        while (v51);
      }

      id v8 = v70;
      id v9 = v71;
      if (self->_peripheralManager)
      {
        id v57 = v73;
        self;
        v58 = sub_100142940((uint64_t)NRDLocalDevice, v57, 1);

        if (v58 && v58[8] && v58[9])
        {
          sub_10002B090((uint64_t)self);
        }
        else
        {
          if (qword_1001F48D0 != -1) {
            dispatch_once(&qword_1001F48D0, &stru_1001C6548);
          }
          if (_NRLogIsLevelEnabled())
          {
            if (qword_1001F48D0 != -1) {
              dispatch_once(&qword_1001F48D0, &stru_1001C6548);
            }
            _NRLogWithArgs();
          }
        }
      }
      goto LABEL_80;
    }
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v21 = self->_links;
    id v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v86 objects:v93 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v87;
      do
      {
        v25 = 0;
        do
        {
          if (*(void *)v87 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v86 + 1) + 8 * (void)v25);
          if (v26) {
            v27 = *(void **)(v26 + 327);
          }
          else {
            v27 = 0;
          }
          id v28 = v27;
          unsigned int v29 = [v28 isEqual:v73];

          if (v29)
          {
            sub_100084BC8((char *)v26, 0);
            goto LABEL_71;
          }
          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        id v30 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v86 objects:v93 count:16];
        id v23 = v30;
      }
      while (v30);
    }
  }
LABEL_71:

  id v8 = v70;
LABEL_80:

LABEL_81:
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v20 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
LABEL_19:
    id v24 = sub_1000286EC();
    _NRLogWithArgs();

    goto LABEL_15;
  }
  if (!v7)
  {
    id v22 = sub_1000286EC();
    int v23 = _NRLogIsLevelEnabled();

    if (!v23) {
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  self->_noBTCallbackSimCrashGenerated = 0;
  id v9 = (char *)[v7 priority];
  id v10 = [v8 type];
  if ((unint64_t)(v9 - 1) >= 3)
  {
    if (qword_1001F48D0 != -1) {
      dispatch_once(&qword_1001F48D0, &stru_1001C6548);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F48D0 != -1) {
        dispatch_once(&qword_1001F48D0, &stru_1001C6548);
      }
      _NRLogWithArgs();
    }
  }
  else
  {
    uint64_t v11 = dword_10016C9B8[(void)(v9 - 1)];
    uint64_t v12 = &OBJC_IVAR___NRLinkManagerBluetooth__pipeRegistrations;
    if (v10 == (id)2) {
      uint64_t v12 = &OBJC_IVAR___NRLinkManagerBluetooth__p2pPipeRegistrations;
    }
    id v13 = *(id *)((char *)&self->super.super.isa + *v12);
    id v14 = +[NSNumber numberWithInteger:v9];
    id v15 = [v13 objectForKeyedSubscript:v14];

    if (v15)
    {
      [v15[2] addObject:v8];
      uint64_t v16 = [v8 peer];
      v17 = [v16 identifier];
      [(NRLinkManager *)self reportEvent:v11, @"pipe %@ bluetoothUUID %@", v8, v17 detailsFormat];

      objc_initWeak(&location, v15);
      dispatch_time_t v18 = dispatch_time(0x8000000000000000, 500000000);
      v19 = self->super._queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002CB6C;
      block[3] = &unk_1001C79B0;
      objc_copyWeak(&v31, &location);
      id v29 = v8;
      id v30 = self;
      dispatch_after(v18, (dispatch_queue_t)v19, block);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      id v25 = sub_1000286EC();
      int v26 = _NRLogIsLevelEnabled();

      if (v26)
      {
        id v27 = sub_1000286EC();
        _NRLogWithArgs();
      }
    }
  }
LABEL_15:
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v25 = a4;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v7 = queue;
  dispatch_assert_queue_V2(v7);

  if (a3)
  {
    if (v25)
    {
      id v8 = v25;
      id v9 = v8;
      if (!self)
      {
LABEL_20:

        goto LABEL_21;
      }
      if ([v8 isEqualToString:@"com.apple.terminusLink"])
      {
        uint64_t v10 = [(NSMutableDictionary *)self->_pipeRegistrations objectForKeyedSubscript:&off_1001D4870];
        uint64_t v11 = (void *)v10;
        if (v10) {
          *(unsigned char *)(v10 + 8) = 0;
        }
        [(NRLinkManager *)self reportEvent:4207, @"%s %s", "Medium", "pipe" detailsFormat];
        sub_10002AD34((char *)self, 1, 0);

        sub_100029D00((uint64_t)self, 2, 0);
        sub_100029D00((uint64_t)self, 3, 0);
        goto LABEL_20;
      }
      if ([v9 isEqualToString:@"com.apple.terminusLink.urgent"])
      {
        uint64_t v12 = [(NSMutableDictionary *)self->_pipeRegistrations objectForKeyedSubscript:&off_1001D4888];
        id v13 = (void *)v12;
        if (v12) {
          *(unsigned char *)(v12 + 8) = 0;
        }
        [(NRLinkManager *)self reportEvent:4207, @"%s %s", "High", "pipe" detailsFormat];
        id v14 = (char *)self;
        uint64_t v15 = 2;
      }
      else
      {
        if (![v9 isEqualToString:@"com.apple.terminusLink.datagram"])
        {
          if ([v9 isEqualToString:@"com.apple.terminusLink.p2p"])
          {
            uint64_t v18 = [(NSMutableDictionary *)self->_p2pPipeRegistrations objectForKeyedSubscript:&off_1001D4870];
            id v13 = (void *)v18;
            if (v18) {
              *(unsigned char *)(v18 + 8) = 0;
            }
            [(NRLinkManager *)self reportEvent:4207, @"%s %s", "Medium", "p2pPipe" detailsFormat];
            id v14 = (char *)self;
            uint64_t v15 = 1;
            int v17 = 1;
          }
          else if ([v9 isEqualToString:@"com.apple.terminusLink.urgent.p2p"])
          {
            uint64_t v19 = [(NSMutableDictionary *)self->_p2pPipeRegistrations objectForKeyedSubscript:&off_1001D4888];
            id v13 = (void *)v19;
            if (v19) {
              *(unsigned char *)(v19 + 8) = 0;
            }
            [(NRLinkManager *)self reportEvent:4207, @"%s %s", "High", "p2pPipe" detailsFormat];
            id v14 = (char *)self;
            uint64_t v15 = 2;
            int v17 = 1;
          }
          else
          {
            if (![v9 isEqualToString:@"com.apple.terminusLink.datagram.p2p"])
            {
              [(NRLinkManager *)self reportEvent:4208 details:v9];
              goto LABEL_20;
            }
            uint64_t v20 = [(NSMutableDictionary *)self->_p2pPipeRegistrations objectForKeyedSubscript:&off_1001D48A0];
            id v13 = (void *)v20;
            if (v20) {
              *(unsigned char *)(v20 + 8) = 0;
            }
            [(NRLinkManager *)self reportEvent:4207, @"%s %s", "Isochronous", "p2pPipe" detailsFormat];
            id v14 = (char *)self;
            uint64_t v15 = 3;
            int v17 = 1;
          }
          goto LABEL_19;
        }
        uint64_t v16 = [(NSMutableDictionary *)self->_pipeRegistrations objectForKeyedSubscript:&off_1001D48A0];
        id v13 = (void *)v16;
        if (v16) {
          *(unsigned char *)(v16 + 8) = 0;
        }
        [(NRLinkManager *)self reportEvent:4207, @"%s %s", "Isochronous", "pipe" detailsFormat];
        id v14 = (char *)self;
        uint64_t v15 = 3;
      }
      int v17 = 0;
LABEL_19:
      sub_10002AD34(v14, v15, v17);

      goto LABEL_20;
    }
    id v23 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
LABEL_40:
      id v9 = sub_1000286EC();
      _NRLogWithArgs();
      goto LABEL_20;
    }
  }
  else
  {
    id v21 = sub_1000286EC();
    int v22 = _NRLogIsLevelEnabled();

    if (v22) {
      goto LABEL_40;
    }
  }
LABEL_21:
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v33 = a4;
  id v8 = a5;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  uint64_t v10 = queue;
  dispatch_assert_queue_V2(v10);

  if (a3)
  {
    if (v33)
    {
      id v11 = v33;
      id v12 = v8;
      if (!self)
      {
LABEL_50:

LABEL_51:
        goto LABEL_52;
      }
      if ([v11 isEqualToString:@"com.apple.terminusLink"])
      {
        uint64_t v13 = [(NSMutableDictionary *)self->_pipeRegistrations objectForKeyedSubscript:&off_1001D4870];
        id v14 = (void *)v13;
        if (v12)
        {
          if (v13) {
            *(unsigned char *)(v13 + 8) = 0;
          }
          uint64_t v15 = [v12 localizedDescription];
          id v32 = v15;
          uint64_t v16 = "pipe";
LABEL_11:
          [(NRLinkManager *)self reportEvent:4204, @"%s %s error %@", "Medium", v16, v32 detailsFormat];
LABEL_25:

LABEL_49:
          goto LABEL_50;
        }
        if (v13) {
          *(unsigned char *)(v13 + 8) = 2;
        }
        int v22 = "pipe";
LABEL_29:
        [(NRLinkManager *)self reportEvent:4202, @"%s %s", "Medium", v22 detailsFormat];

        sub_10002947C((uint64_t)self);
        goto LABEL_50;
      }
      if ([v11 isEqualToString:@"com.apple.terminusLink.urgent"])
      {
        uint64_t v17 = [(NSMutableDictionary *)self->_pipeRegistrations objectForKeyedSubscript:&off_1001D4888];
        id v14 = (void *)v17;
        if (v12)
        {
          if (v17) {
            *(unsigned char *)(v17 + 8) = 0;
          }
          uint64_t v18 = [v12 localizedDescription];
          uint64_t v15 = (void *)v18;
          uint64_t v19 = "pipe";
LABEL_17:
          uint64_t v20 = "High";
LABEL_24:
          [(NRLinkManager *)self reportEvent:4204, @"%s %s error %@", v20, v19, v18 detailsFormat];
          goto LABEL_25;
        }
        if (v17) {
          *(unsigned char *)(v17 + 8) = 2;
        }
        id v24 = "pipe";
LABEL_38:
        id v25 = "High";
LABEL_48:
        [(NRLinkManager *)self reportEvent:4202, @"%s %s", v25, v24 detailsFormat];
        goto LABEL_49;
      }
      if ([v11 isEqualToString:@"com.apple.terminusLink.datagram"])
      {
        uint64_t v21 = [(NSMutableDictionary *)self->_pipeRegistrations objectForKeyedSubscript:&off_1001D48A0];
        id v14 = (void *)v21;
        if (v12)
        {
          if (v21) {
            *(unsigned char *)(v21 + 8) = 0;
          }
          uint64_t v18 = [v12 localizedDescription];
          uint64_t v15 = (void *)v18;
          uint64_t v19 = "pipe";
LABEL_23:
          uint64_t v20 = "Isochronous";
          goto LABEL_24;
        }
        if (v21) {
          *(unsigned char *)(v21 + 8) = 2;
        }
        id v24 = "pipe";
      }
      else
      {
        if ([v11 isEqualToString:@"com.apple.terminusLink.p2p"])
        {
          uint64_t v23 = [(NSMutableDictionary *)self->_p2pPipeRegistrations objectForKeyedSubscript:&off_1001D4870];
          id v14 = (void *)v23;
          if (v12)
          {
            if (v23) {
              *(unsigned char *)(v23 + 8) = 0;
            }
            uint64_t v15 = [v12 localizedDescription];
            id v32 = v15;
            uint64_t v16 = "p2pPipe";
            goto LABEL_11;
          }
          if (v23) {
            *(unsigned char *)(v23 + 8) = 2;
          }
          int v22 = "p2pPipe";
          goto LABEL_29;
        }
        if ([v11 isEqualToString:@"com.apple.terminusLink.urgent.p2p"])
        {
          uint64_t v26 = [(NSMutableDictionary *)self->_p2pPipeRegistrations objectForKeyedSubscript:&off_1001D4888];
          id v14 = (void *)v26;
          if (v12)
          {
            if (v26) {
              *(unsigned char *)(v26 + 8) = 0;
            }
            uint64_t v18 = [v12 localizedDescription];
            uint64_t v15 = (void *)v18;
            uint64_t v19 = "p2pPipe";
            goto LABEL_17;
          }
          if (v26) {
            *(unsigned char *)(v26 + 8) = 2;
          }
          id v24 = "p2pPipe";
          goto LABEL_38;
        }
        if (![v11 isEqualToString:@"com.apple.terminusLink.datagram.p2p"])
        {
          if (!v12)
          {
            [(NRLinkManager *)self reportEvent:4203, @"\"%@\"", v11 detailsFormat];
            goto LABEL_50;
          }
          id v14 = [v12 localizedDescription];
          [(NRLinkManager *)self reportEvent:4205, @"\"%@\" error %@", v11, v14 detailsFormat];
          goto LABEL_49;
        }
        uint64_t v27 = [(NSMutableDictionary *)self->_p2pPipeRegistrations objectForKeyedSubscript:&off_1001D48A0];
        id v14 = (void *)v27;
        if (v12)
        {
          if (v27) {
            *(unsigned char *)(v27 + 8) = 0;
          }
          uint64_t v18 = [v12 localizedDescription];
          uint64_t v15 = (void *)v18;
          uint64_t v19 = "p2pPipe";
          goto LABEL_23;
        }
        if (v27) {
          *(unsigned char *)(v27 + 8) = 2;
        }
        id v24 = "p2pPipe";
      }
      id v25 = "Isochronous";
      goto LABEL_48;
    }
    id v30 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
LABEL_75:
      id v11 = sub_1000286EC();
      _NRLogWithArgs();
      goto LABEL_51;
    }
  }
  else
  {
    id v28 = sub_1000286EC();
    int v29 = _NRLogIsLevelEnabled();

    if (v29) {
      goto LABEL_75;
    }
  }
LABEL_52:
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v4 = [a3 state];
  unint64_t v5 = (unint64_t)v4;
  if ((unint64_t)v4 >= 6) {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"UnknownState(%lld)", v4];
  }
  else {
    id v6 = *(&off_1001C65A8 + (void)v4);
  }
  [(NRLinkManager *)self reportEvent:4200 details:v6];

  sub_10002E518((uint64_t)self, v5);
}

- (void)peripheralManager:(id)a3 didStopAdvertisingWithError:(id)a4
{
  id v11 = (CBPeripheralManager *)a3;
  id v6 = a4;
  if (self)
  {
    id v7 = self->_peripheralManager;
    if (v7)
    {
      peripheralManager = self->_peripheralManager;

      if (peripheralManager == v11)
      {
        int currentAdvertisementState = self->_currentAdvertisementState;
        self->_int currentAdvertisementState = 0;
        if (v6)
        {
          uint64_t v10 = [v6 localizedDescription];
          [(NRLinkManager *)self reportEvent:3506 details:v10];
        }
        else
        {
          [(NRLinkManager *)self reportEvent:3505];
          if (currentAdvertisementState == 3) {
            sub_10002B090((uint64_t)self);
          }
        }
      }
    }
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  uint64_t v13 = (CBPeripheralManager *)a3;
  id v6 = a4;
  if (self)
  {
    id v7 = self->_peripheralManager;
    if (v7)
    {
      peripheralManager = self->_peripheralManager;

      if (peripheralManager == v13)
      {
        if (v6)
        {
          id v9 = [v6 domain];
          uint64_t v10 = v9;
          if (v9 == CBErrorDomain)
          {
            id v11 = [v6 code];

            if (v11 != (id)9)
            {
              id v12 = [v6 localizedDescription];
              [(NRLinkManager *)self reportEvent:3503 details:v12];

              self->_int currentAdvertisementState = 0;
            }
          }
          else
          {
          }
        }
        else
        {
          [(NRLinkManager *)self reportEvent:3502];
          self->_int currentAdvertisementState = 4;
        }
      }
    }
  }
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v6 = (CBPeripheralManager *)a3;
  if (self)
  {
    id v4 = self->_peripheralManager;
    if (v4)
    {
      peripheralManager = self->_peripheralManager;

      if (peripheralManager == v6) {
        sub_10002EC58(self, (unint64_t)[(CBPeripheralManager *)v6 state]);
      }
    }
  }
}

- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v8)
  {
    if (self) {
      self = (NRLinkManagerBluetooth *)objc_loadWeakRetained((id *)&self->super._managerDelegate);
    }
    if (objc_opt_respondsToSelector()) {
      [(NRLinkManagerBluetooth *)self linkPeerIsAsleep:v8 isAsleep:v4];
    }
    goto LABEL_6;
  }
  id v6 = sub_1000286EC();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    self = (NRLinkManagerBluetooth *)sub_1000286EC();
    _NRLogWithArgs();
LABEL_6:
  }
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v9 = queue;
  dispatch_assert_queue_V2(v9);

  if (!v6)
  {
    id v14 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_24;
    }
LABEL_28:
    id v18 = sub_1000286EC();
    _NRLogWithArgs();

    goto LABEL_24;
  }
  if (!v7)
  {
    id v16 = sub_1000286EC();
    int v17 = _NRLogIsLevelEnabled();

    if (!v17) {
      goto LABEL_24;
    }
    goto LABEL_28;
  }
  id v10 = [v6 copyShortDescription];
  [(NRLinkManager *)self reportEvent:2008 details:v10];

  if (self && self->super._state == 1004)
  {
    if (qword_1001F48D0 != -1) {
      dispatch_once(&qword_1001F48D0, &stru_1001C6548);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F48D0 != -1) {
        dispatch_once(&qword_1001F48D0, &stru_1001C6548);
      }
      _NRLogWithArgs();
    }
  }
  else
  {
    id v11 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self) {
        id v12 = self->super._queue;
      }
      else {
        id v12 = 0;
      }
      uint64_t v13 = v12;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002F1BC;
      block[3] = &unk_1001C8868;
      void block[4] = self;
      id v20 = v11;
      id v21 = v7;
      dispatch_async(v13, block);
    }
    else
    {
      if (qword_1001F48D0 != -1) {
        dispatch_once(&qword_1001F48D0, &stru_1001C6548);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F48D0 != -1) {
          dispatch_once(&qword_1001F48D0, &stru_1001C6548);
        }
        _NRLogWithArgs();
      }
    }
  }
LABEL_24:
}

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = [v4 copyShortDescription];
    [(NRLinkManager *)self reportEvent:2007 details:v7];

    if (self && self->super._state == 1004)
    {
      if (qword_1001F48D0 != -1) {
        dispatch_once(&qword_1001F48D0, &stru_1001C6548);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F48D0 != -1) {
          dispatch_once(&qword_1001F48D0, &stru_1001C6548);
        }
        _NRLogWithArgs();
      }
    }
    else
    {
      id v8 = (char *)v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = *(id *)(v8 + 335);
        id v10 = [v9 type];

        id v11 = [v8 nrUUID];
        id v12 = sub_10013DC5C((uint64_t)NRDLocalDevice, v11);

        if (v12 && v12[9] && *(void *)(v8 + 335) && !v8[233])
        {
          if (self) {
            pipeRegistrations = self->_pipeRegistrations;
          }
          else {
            pipeRegistrations = 0;
          }
          uint64_t v23 = [(NSMutableDictionary *)pipeRegistrations objectForKeyedSubscript:&off_1001D4870];
          if (v23) {
            int v13 = v23[8] == 2;
          }
          else {
            int v13 = 0;
          }

          if (v10 == (id)2)
          {
            if (self) {
              p2pPipeRegistrations = self->_p2pPipeRegistrations;
            }
            else {
              p2pPipeRegistrations = 0;
            }
            id v25 = [(NSMutableDictionary *)p2pPipeRegistrations objectForKeyedSubscript:&off_1001D4870];
            if (v25) {
              BOOL v26 = v25[8] == 2;
            }
            else {
              BOOL v26 = 0;
            }

            v13 |= v26;
          }
        }
        else
        {
          int v13 = 0;
        }
        [(NSMutableSet *)self->_links removeObject:v8];
        id v14 = *(id *)(v8 + 327);
        sub_10002F71C((id *)&self->super.super.isa, 0, v14);

        uint64_t v15 = self->super._queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002FC9C;
        block[3] = &unk_1001C8840;
        void block[4] = self;
        id v16 = v8;
        id v31 = v16;
        dispatch_async((dispatch_queue_t)v15, block);

        if (v13)
        {
          int v17 = self->_pipeStateDictionary;
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = [v16 nrUUID];

            if (v19)
            {
              if (qword_1001F48D0 != -1) {
                dispatch_once(&qword_1001F48D0, &stru_1001C6548);
              }
              if (_NRLogIsLevelEnabled())
              {
                if (qword_1001F48D0 != -1) {
                  dispatch_once(&qword_1001F48D0, &stru_1001C6548);
                }
                _NRLogWithArgs();
              }
              id v20 = self->_pipeStateDictionary;
              id v21 = [v16 nrUUID];
              [(NSMutableDictionary *)v20 setObject:0 forKeyedSubscript:v21];
            }
          }
          sub_100029C08((char *)self, v10 == (id)2);
        }
      }
      else
      {
        if (qword_1001F48D0 != -1) {
          dispatch_once(&qword_1001F48D0, &stru_1001C6548);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F48D0 != -1) {
            dispatch_once(&qword_1001F48D0, &stru_1001C6548);
          }
          _NRLogWithArgs();
        }
      }
    }
  }
  else
  {
    id v27 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v29 = sub_1000286EC();
      _NRLogWithArgs();
    }
  }
}

- (void)linkIsSuspended:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = [v4 copyShortDescription];
    [(NRLinkManager *)self reportEvent:2006 details:v7];

    if (self && self->super._state == 1004)
    {
      if (qword_1001F48D0 != -1) {
        dispatch_once(&qword_1001F48D0, &stru_1001C6548);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F48D0 != -1) {
          dispatch_once(&qword_1001F48D0, &stru_1001C6548);
        }
        _NRLogWithArgs();
      }
    }
    else
    {
      id v8 = (char *)v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = *(id *)(v8 + 327);
        sub_10002F71C((id *)&self->super.super.isa, 0, v9);

        if (self) {
          id v10 = self->super._queue;
        }
        else {
          id v10 = 0;
        }
        id v11 = v10;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100030428;
        block[3] = &unk_1001C8840;
        id v16 = v8;
        int v17 = self;
        dispatch_async(v11, block);
      }
      else
      {
        if (qword_1001F48D0 != -1) {
          dispatch_once(&qword_1001F48D0, &stru_1001C6548);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F48D0 != -1) {
            dispatch_once(&qword_1001F48D0, &stru_1001C6548);
          }
          _NRLogWithArgs();
        }
      }
    }
  }
  else
  {
    id v12 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v14 = sub_1000286EC();
      _NRLogWithArgs();
    }
  }
}

- (void)linkIsReady:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = [v4 copyShortDescription];
    [(NRLinkManager *)self reportEvent:2005 details:v7];

    if (self && self->super._state == 1004)
    {
      if (qword_1001F48D0 != -1) {
        dispatch_once(&qword_1001F48D0, &stru_1001C6548);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F48D0 != -1) {
          dispatch_once(&qword_1001F48D0, &stru_1001C6548);
        }
        _NRLogWithArgs();
      }
    }
    else
    {
      id v8 = (char *)v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = *(id *)(v8 + 335);
        BOOL v10 = [v9 type] == (id)2;

        sub_10002B498((uint64_t)self, 3, v10);
        sub_10002B498((uint64_t)self, 2, v10);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v51 = v4;
        if (self) {
          pipeRegistrations = self->_pipeRegistrations;
        }
        else {
          pipeRegistrations = 0;
        }
        id v12 = pipeRegistrations;
        uint64_t v13 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:&off_1001D4888];
        id v14 = (void *)v13;
        uint64_t v52 = self;
        if (v13) {
          uint64_t v15 = *(void **)(v13 + 16);
        }
        else {
          uint64_t v15 = 0;
        }
        id v16 = v15;

        id v17 = [v16 countByEnumeratingWithState:&v60 objects:v65 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v61;
LABEL_19:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v61 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v60 + 1) + 8 * v20);
            int v22 = [v21 peer];
            uint64_t v23 = [v22 identifier];
            id v24 = *(id *)(v8 + 327);
            unsigned __int8 v25 = [v23 isEqual:v24];

            if (v25) {
              break;
            }
            if (v18 == (id)++v20)
            {
              id v18 = [v16 countByEnumeratingWithState:&v60 objects:v65 count:16];
              if (v18) {
                goto LABEL_19;
              }
              goto LABEL_25;
            }
          }
          BOOL v26 = v21;

          if (v26) {
            goto LABEL_47;
          }
        }
        else
        {
LABEL_25:
        }
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        if (v52) {
          p2pPipeRegistrations = v52->_p2pPipeRegistrations;
        }
        else {
          p2pPipeRegistrations = 0;
        }
        id v28 = p2pPipeRegistrations;
        uint64_t v29 = [(NSMutableDictionary *)v28 objectForKeyedSubscript:&off_1001D4888];
        id v30 = (void *)v29;
        if (v29) {
          id v31 = *(void **)(v29 + 16);
        }
        else {
          id v31 = 0;
        }
        id v32 = v31;

        id v33 = [v32 countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v57;
LABEL_39:
          uint64_t v36 = 0;
          while (1)
          {
            if (*(void *)v57 != v35) {
              objc_enumerationMutation(v32);
            }
            id v37 = *(void **)(*((void *)&v56 + 1) + 8 * v36);
            unsigned int v38 = [v37 peer];
            id v39 = [v38 identifier];
            id v40 = *(id *)(v8 + 327);
            unsigned __int8 v41 = [v39 isEqual:v40];

            if (v41) {
              break;
            }
            if (v34 == (id)++v36)
            {
              id v34 = [v32 countByEnumeratingWithState:&v56 objects:v64 count:16];
              if (v34) {
                goto LABEL_39;
              }
              goto LABEL_45;
            }
          }
          BOOL v26 = v37;

          if (!v26) {
            goto LABEL_48;
          }
LABEL_47:
          sub_100084BC8(v8, v26);
        }
        else
        {
LABEL_45:

          BOOL v26 = 0;
        }
LABEL_48:
        id v42 = *(id *)(v8 + 327);
        if (v52)
        {
          id v43 = v52->_requestedLinkRequirements;
          uint64_t v44 = [(NSMutableDictionary *)v43 objectForKeyedSubscript:v42];
          sub_10002F71C((id *)&v52->super.super.isa, v44, v42);

          v45 = v52->super._queue;
        }
        else
        {
          id v50 = [0 objectForKeyedSubscript:v42];
          sub_10002F71C(0, v50, v42);

          v45 = 0;
        }
        uint64_t v46 = v45;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100030B74;
        block[3] = &unk_1001C8840;
        v54 = v8;
        v55 = v52;
        dispatch_async(v46, block);

        id v4 = v51;
      }
      else
      {
        if (qword_1001F48D0 != -1) {
          dispatch_once(&qword_1001F48D0, &stru_1001C6548);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F48D0 != -1) {
            dispatch_once(&qword_1001F48D0, &stru_1001C6548);
          }
          _NRLogWithArgs();
        }
      }
    }
  }
  else
  {
    id v47 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v49 = sub_1000286EC();
      _NRLogWithArgs();
    }
  }
}

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = [v4 copyShortDescription];
    id v8 = [v4 nrUUID];
    id v9 = [v8 UUIDString];
    [(NRLinkManager *)self reportEvent:2004, @"%@ %@", v7, v9 detailsFormat];

    if (self && self->super._state == 1004)
    {
      if (qword_1001F48D0 != -1) {
        dispatch_once(&qword_1001F48D0, &stru_1001C6548);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F48D0 != -1) {
          dispatch_once(&qword_1001F48D0, &stru_1001C6548);
        }
        _NRLogWithArgs();
      }
    }
    else
    {
      BOOL v10 = (char *)v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = self;
        id v29 = v4;
        if (self) {
          links = self->_links;
        }
        else {
          links = 0;
        }
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v12 = [(NSMutableSet *)links copy];
        id v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v34;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v34 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              if (v17) {
                id v18 = *(void **)(v17 + 327);
              }
              else {
                id v18 = 0;
              }
              id v19 = v18;
              id v20 = *(id *)(v10 + 327);
              unsigned int v21 = [v19 isEqual:v20];

              if (v21)
              {
                id v22 = [v10 copyShortDescription];
                [(id)v17 cancelWithReason:@"Replaced by new link %@", v22];
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v14);
        }

        if (v28)
        {
          [(NSMutableSet *)v28->_links addObject:v10];
          uint64_t v23 = v28->super._queue;
        }
        else
        {
          [0 addObject:v10];
          uint64_t v23 = 0;
        }
        id v4 = v29;
        id v24 = v23;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000310E0;
        block[3] = &unk_1001C8840;
        id v31 = v10;
        id v32 = v28;
        dispatch_async(v24, block);
      }
      else
      {
        if (qword_1001F48D0 != -1) {
          dispatch_once(&qword_1001F48D0, &stru_1001C6548);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F48D0 != -1) {
            dispatch_once(&qword_1001F48D0, &stru_1001C6548);
          }
          _NRLogWithArgs();
        }
      }
    }
  }
  else
  {
    id v25 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v27 = sub_1000286EC();
      _NRLogWithArgs();
    }
  }
}

- (id)copyStatusString
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = objc_alloc_init((Class)NSMutableString);
  [v4 appendString:@"["];
  if (self) {
    pipeRegistrations = self->_pipeRegistrations;
  }
  else {
    pipeRegistrations = 0;
  }
  id v6 = pipeRegistrations;
  id v7 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:&off_1001D4870];

  if (v7)
  {
    int v8 = v7[8];
    if ((v8 - 1) <= 1)
    {
      if (v8 == 1) {
        id v9 = "(inprog)";
      }
      else {
        id v9 = "";
      }
      [v4 appendFormat:@"%s%s,", @"M", v9];
    }
  }

  if (self) {
    BOOL v10 = self->_pipeRegistrations;
  }
  else {
    BOOL v10 = 0;
  }
  id v11 = v10;
  id v12 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:&off_1001D4888];

  if (v12)
  {
    int v13 = v12[8];
    if ((v13 - 1) <= 1)
    {
      if (v13 == 1) {
        id v14 = "(inprog)";
      }
      else {
        id v14 = "";
      }
      [v4 appendFormat:@"%s%s,", @"H", v14];
    }
  }

  if (self) {
    uint64_t v15 = self->_pipeRegistrations;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;
  uint64_t v17 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:&off_1001D48A0];

  if (v17)
  {
    int v18 = v17[8];
    if ((v18 - 1) <= 1)
    {
      if (v18 == 1) {
        id v19 = "(inprog)";
      }
      else {
        id v19 = "";
      }
      [v4 appendFormat:@"%s%s,", "I", v19];
    }
  }

  if (self) {
    p2pPipeRegistrations = self->_p2pPipeRegistrations;
  }
  else {
    p2pPipeRegistrations = 0;
  }
  unsigned int v21 = p2pPipeRegistrations;
  id v22 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:&off_1001D4870];

  if (v22)
  {
    int v23 = v22[8];
    if ((v23 - 1) <= 1)
    {
      if (v23 == 1) {
        id v24 = "(inprog)";
      }
      else {
        id v24 = "";
      }
      [v4 appendFormat:@"%s%s,", @"M(p2p)", v24];
    }
  }

  if (self) {
    id v25 = self->_p2pPipeRegistrations;
  }
  else {
    id v25 = 0;
  }
  BOOL v26 = v25;
  id v27 = [(NSMutableDictionary *)v26 objectForKeyedSubscript:&off_1001D4888];

  if (v27)
  {
    int v28 = v27[8];
    if ((v28 - 1) <= 1)
    {
      if (v28 == 1) {
        id v29 = "(inprog)";
      }
      else {
        id v29 = "";
      }
      [v4 appendFormat:@"%s%s,", "H(p2p)", v29];
    }
  }

  if (self) {
    id v30 = self->_p2pPipeRegistrations;
  }
  else {
    id v30 = 0;
  }
  id v31 = v30;
  id v32 = [(NSMutableDictionary *)v31 objectForKeyedSubscript:&off_1001D48A0];

  if (v32)
  {
    int v33 = v32[8];
    if ((v33 - 1) <= 1)
    {
      if (v33 == 1) {
        long long v34 = "(inprog)";
      }
      else {
        long long v34 = "";
      }
      [v4 appendFormat:@"%s%s,", "I(p2p)", v34];
    }
  }

  [v4 appendString:@"]"];
  id v35 = [(NRLinkManagerBluetooth *)self copyName];
  [v3 appendFormat:@"\nName: %@", v35];

  StringFromNRLinkType = (void *)createStringFromNRLinkType();
  [v3 appendFormat:@"\nLinkManager type: %@", StringFromNRLinkType];

  if (self) {
    uint64_t state = self->super._state;
  }
  else {
    uint64_t state = 0;
  }
  id v38 = sub_1000AB278(state);
  [v3 appendFormat:@"\nState: %@ %@", v38, v4];

  if (self)
  {
    id v39 = self->_links;
    [v3 appendFormat:@"\nLinks: %@", v39];

    id v40 = self->_pipeRegistrations;
  }
  else
  {
    [v3 appendFormat:@"\nLinks: %@", 0];
    id v40 = 0;
  }
  unsigned __int8 v41 = v40;
  id v42 = [(NSMutableDictionary *)v41 objectForKeyedSubscript:&off_1001D4870];

  if (v42)
  {
    id v43 = v42[2];
    [v3 appendFormat:@"\nMedium Pipes: %@", v43];
  }
  if (self) {
    uint64_t v44 = self->_pipeRegistrations;
  }
  else {
    uint64_t v44 = 0;
  }
  v45 = v44;
  uint64_t v46 = [(NSMutableDictionary *)v45 objectForKeyedSubscript:&off_1001D4888];

  if (v46)
  {
    id v47 = v46[2];
    [v3 appendFormat:@"\nHigh Pipes: %@", v47];
  }
  if (self) {
    id v48 = self->_pipeRegistrations;
  }
  else {
    id v48 = 0;
  }
  id v49 = v48;
  id v50 = [(NSMutableDictionary *)v49 objectForKeyedSubscript:&off_1001D48A0];

  if (v50)
  {
    id v51 = v50[2];
    [v3 appendFormat:@"\nIsochronous Pipes: %@", v51];
  }
  if (self) {
    uint64_t v52 = self->_p2pPipeRegistrations;
  }
  else {
    uint64_t v52 = 0;
  }
  v53 = v52;
  v54 = [(NSMutableDictionary *)v53 objectForKeyedSubscript:&off_1001D4870];

  if (v54)
  {
    id v55 = v54[2];
    [v3 appendFormat:@"\nMedium P2P Pipes: %@", v55];
  }
  if (self) {
    long long v56 = self->_p2pPipeRegistrations;
  }
  else {
    long long v56 = 0;
  }
  long long v57 = v56;
  long long v58 = [(NSMutableDictionary *)v57 objectForKeyedSubscript:&off_1001D4888];

  if (v58)
  {
    id v59 = v58[2];
    [v3 appendFormat:@"\nHigh P2P Pipes: %@", v59];
  }
  if (self) {
    long long v60 = self->_p2pPipeRegistrations;
  }
  else {
    long long v60 = 0;
  }
  long long v61 = v60;
  long long v62 = [(NSMutableDictionary *)v61 objectForKeyedSubscript:&off_1001D48A0];

  if (v62)
  {
    id v63 = v62[2];
    [v3 appendFormat:@"\nIsochronous P2P Pipes: %@", v63];
  }
  if (self) {
    peripherals = self->_peripherals;
  }
  else {
    peripherals = 0;
  }
  int v65 = peripherals;
  [v3 appendFormat:@"\nPeripherals: %@", v65];

  id v66 = objc_alloc_init((Class)NSDateFormatter);
  [v66 setDateFormat:@"YYYY-MM-dd HH:mm:ss z"];
  id v67 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
  [v66 setLocale:v67];

  if (self)
  {
    id v68 = self->_peripheralConnectDate;
    v69 = [v66 stringFromDate:v68];
    [v3 appendFormat:@"\nconnectPeripheral invoked: %@", v69];

    centralManager = self->_centralManager;
  }
  else
  {
    long long v81 = [v66 stringFromDate:0];
    [v3 appendFormat:@"\nconnectPeripheral invoked: %@", v81];

    centralManager = 0;
  }
  id v71 = centralManager;
  [v3 appendFormat:@"\nCentralMgr: %@", v71];

  if (self)
  {
    v72 = self->_peripheralManager;
    [v3 appendFormat:@"\nPeripheralMgr: %@", v72];

    unint64_t currentAdvertisementState = self->_currentAdvertisementState;
    if (currentAdvertisementState >= 5) {
      id v74 = [objc_alloc((Class)NSString) initWithFormat:@"UnknownType(%lld)", currentAdvertisementState];
    }
    else {
      id v74 = *(&off_1001C6580 + currentAdvertisementState);
    }
    [v3 appendFormat:@"\ncurrentAdvertisementState: %@", v74];

    uint64_t currentAdvertisementRate = self->_currentAdvertisementRate;
    if (self->_currentAdvertisementRate)
    {
      if (currentAdvertisementRate == 1) {
        long long v76 = @"1 sec";
      }
      else {
        long long v76 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"UnknownType(%lld)", currentAdvertisementRate];
      }
    }
    else
    {
      long long v76 = @"Default";
    }
    [v3 appendFormat:@"\ncurrentAdvertisementRate: %@", v76];

    pipeStateDictionary = self->_pipeStateDictionary;
  }
  else
  {
    [v3 appendFormat:@"\nPeripheralMgr: %@", 0];
    [v3 appendFormat:@"\ncurrentAdvertisementState: %@", @"Idle"];
    [v3 appendFormat:@"\ncurrentAdvertisementRate: %@", @"Default"];
    pipeStateDictionary = 0;
  }
  long long v78 = pipeStateDictionary;
  [v3 appendFormat:@"\nBT connection state: %@", v78];

  id v79 = v3;
  return v79;
}

- (id)copyName
{
  return @"Link Manager - Bluetooth";
}

- (void)dealloc
{
  if (qword_1001F48D0 != -1) {
    dispatch_once(&qword_1001F48D0, &stru_1001C6548);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F48D0 != -1) {
      dispatch_once(&qword_1001F48D0, &stru_1001C6548);
    }
    id v3 = (id)qword_1001F48C8;
    uint64_t v6 = 348;
    id v7 = [(NRLinkManagerBluetooth *)self copyName];
    id v4 = "";
    unint64_t v5 = "-[NRLinkManagerBluetooth dealloc]";
    _NRLogWithArgs();
  }
  [(NRLinkManagerBluetooth *)self invalidateManager];
  v8.receiver = self;
  v8.super_class = (Class)NRLinkManagerBluetooth;
  [(NRLinkManagerBluetooth *)&v8 dealloc];
}

- (void)invalidateManager
{
  v7.receiver = self;
  v7.super_class = (Class)NRLinkManagerBluetooth;
  [(NRLinkManager *)&v7 invalidateManager];
  if (self)
  {
    [(CBScalablePipeManager *)self->_pipeManager setDelegate:0];
    objc_storeWeak((id *)&self->_bluetoothManagerDelegate, 0);
    pipeManager = self->_pipeManager;
    self->_pipeManager = 0;

    if (self->_centralManager)
    {
      sub_100028BB4((uint64_t)self);
      [(CBCentralManager *)self->_centralManager setDelegate:0];
      centralManager = self->_centralManager;
      self->_centralManager = 0;
    }
    peripherals = self->_peripherals;
    self->_peripherals = 0;

    if (self->_peripheralManager)
    {
      sub_10002D9D8((id *)&self->super.super.isa);
      [(CBPeripheralManager *)self->_peripheralManager setDelegate:0];
      peripheralManager = self->_peripheralManager;
      self->_peripheralManager = 0;
    }
    self->_uint64_t currentAdvertisementRate = 0;
  }
  else
  {
    [0 setDelegate:0];
  }
}

- (void)cancel
{
  if (self)
  {
    self->super._uint64_t state = 1004;
    [(NRLinkManager *)self reportEvent:2003];
    [(NRLinkManagerBluetooth *)self invalidateManager];
    links = self->_links;
  }
  else
  {
    [0 reportEvent:2003];
    [0 invalidateManager];
    links = 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSMutableSet *)links copy];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) cancelWithReason:@"Cancelling Bluetooth link manager" v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  if (self) {
    id v9 = self->_links;
  }
  else {
    id v9 = 0;
  }
  [(NSMutableSet *)v9 removeAllObjects];
}

@end