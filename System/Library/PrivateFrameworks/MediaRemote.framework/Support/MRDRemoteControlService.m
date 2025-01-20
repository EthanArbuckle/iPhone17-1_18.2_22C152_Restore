@interface MRDRemoteControlService
- (BOOL)started;
- (MRDAirPlayRemoteControlService)airPlayService;
- (MRDBonjourRemoteControlService)genericNetworkService;
- (MRDBonjourRemoteControlService)televisionNetworkService;
- (MRDGroupSessionRemoteControlService)groupSessionService;
- (MRDIDSCompanionRemoteControlService)companionService;
- (MRDIDSRemoteControlService)idsService;
- (MRDMRRelayRemoteControlService)mrRelayRemoteControlService;
- (MRDRapportRemoteControlService)rapportService;
- (MRDRemoteControlService)initWithRoutingDataSource:(id)a3;
- (MRDRemoteControlServiceDelegate)delegate;
- (NSString)debugDescription;
- (OS_dispatch_queue)workerQueue;
- (id)_notifyDelegateWithConnection:(id)a3;
- (id)idsCompanionRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (id)idsRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)_initializeIDSRemoteControlServiceWithRoutingDataSource:(id)a3;
- (void)airPlayRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)bonjourRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)groupSessionRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)mrRelayRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)rapportRemoteControlService:(id)a3 didAcceptConnection:(id)a4;
- (void)reevaluateGroupSessionService;
- (void)setAirPlayService:(id)a3;
- (void)setCompanionService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGenericNetworkService:(id)a3;
- (void)setGroupSessionService:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setMrRelayRemoteControlService:(id)a3;
- (void)setRapportService:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setTelevisionNetworkService:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDRemoteControlService

- (MRDRemoteControlService)initWithRoutingDataSource:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MRDRemoteControlService;
  v5 = [(MRDRemoteControlService *)&v38 init];
  if (v5)
  {
    v6 = +[MRUserSettings currentSettings];
    if ([v6 shouldInitializeGenericBonjourService])
    {
      v7 = [MRDBonjourRemoteControlService alloc];
      v8 = [(MRDBonjourRemoteControlService *)v7 initWithNetServiceType:kMRExternalDeviceBonjourTypeGeneric];
      genericNetworkService = v5->_genericNetworkService;
      v5->_genericNetworkService = v8;

      [(MRDBonjourRemoteControlService *)v5->_genericNetworkService setDelegate:v5];
    }
    if ([v6 shouldInitializeTelevisionBonjourService])
    {
      v10 = [MRDBonjourRemoteControlService alloc];
      v11 = [(MRDBonjourRemoteControlService *)v10 initWithNetServiceType:kMRExternalDeviceBonjourTypeTelevision];
      televisionNetworkService = v5->_televisionNetworkService;
      v5->_televisionNetworkService = v11;

      [(MRDBonjourRemoteControlService *)v5->_televisionNetworkService setDelegate:v5];
    }
    v13 = objc_alloc_init(MRDAirPlayRemoteControlService);
    airPlayService = v5->_airPlayService;
    v5->_airPlayService = v13;

    [(MRDAirPlayRemoteControlService *)v5->_airPlayService setDelegate:v5];
    if ([v6 shouldInitializeRapportService])
    {
      v15 = objc_alloc_init(MRDRapportRemoteControlService);
      rapportService = v5->_rapportService;
      v5->_rapportService = v15;

      [(MRDRapportRemoteControlService *)v5->_rapportService setDelegate:v5];
    }
    v17 = +[MRUserSettings currentSettings];
    unsigned int v18 = [v17 supportNanoLinkAgent];

    if (v18)
    {
      v32 = _NSConcreteStackBlock;
      uint64_t v33 = 3221225472;
      v34 = sub_10011A6D8;
      v35 = &unk_1004158D8;
      v36 = v5;
      id v37 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v32);
    }
    v19 = +[MRUserSettings currentSettings];
    unsigned int v20 = [v19 shouldInitializeIDSService];

    if (v20)
    {
      v21 = [[MRDIDSRemoteControlService alloc] initWithRoutingDataSource:v4];
      idsService = v5->_idsService;
      v5->_idsService = v21;

      [(MRDIDSRemoteControlService *)v5->_idsService setDelegate:v5];
    }
    v23 = +[MRUserSettings currentSettings];
    unsigned int v24 = [v23 shouldInitializeMRRelayService];

    if (v24)
    {
      v25 = objc_alloc_init(MRDMRRelayRemoteControlService);
      mrRelayRemoteControlService = v5->_mrRelayRemoteControlService;
      v5->_mrRelayRemoteControlService = v25;

      [(MRDMRRelayRemoteControlService *)v5->_mrRelayRemoteControlService setDelegate:v5];
    }
    v27 = +[MRSharedSettings currentSettings];
    unsigned int v28 = [v27 supportGroupSession];

    if (v28)
    {
      v29 = +[NSNotificationCenter defaultCenter];
      [v29 addObserver:v5 selector:"handleGroupSessionServerDidStartNotification:" name:@"MRDGroupSessionServerDidStartNotification" object:0];

      v30 = +[NSNotificationCenter defaultCenter];
      [v30 addObserver:v5 selector:"handleGroupSessionServerDidStopNotification:" name:@"MRDGroupSessionServerDidStopNotification" object:0];

      [(MRDRemoteControlService *)v5 reevaluateGroupSessionService];
    }
  }
  return v5;
}

- (void)_initializeIDSRemoteControlServiceWithRoutingDataSource:(id)a3
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10011A9F4;
  unsigned int v28 = sub_10011AA04;
  id v29 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10011AA0C;
  v21[3] = &unk_100416870;
  v21[4] = self;
  id v3 = a3;
  id v22 = v3;
  v23 = &v24;
  id v4 = objc_retainBlock(v21);
  id v5 = objc_alloc((Class)MRBlockGuard);
  uint64_t v6 = NRPairedDeviceRegistryDeviceDidPairNotification;
  id v7 = &_dispatch_main_q;
  id v8 = [v5 initWithTimeout:v6 reason:&_dispatch_main_q queue:0 handler:0.0];

  v9 = +[NSNotificationCenter defaultCenter];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10011AAB0;
  v18[3] = &unk_10041D658;
  id v10 = v8;
  id v19 = v10;
  v11 = v4;
  id v20 = v11;
  uint64_t v12 = [v9 addObserverForName:v6 object:0 queue:0 usingBlock:v18];
  v13 = (void *)v25[5];
  v25[5] = v12;

  v14 = +[NRPairedDeviceRegistry sharedInstance];
  v15 = [v14 getActivePairedDevice];

  if (v15 && [v10 disarm])
  {
    v16 = _MRLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v15 name];
      *(_DWORD *)buf = 138412290;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlService] Found activePairedDevice <%@>, creating IDSRemoteControlService...", buf, 0xCu);
    }
    v11[2](v11);
  }

  _Block_object_dispose(&v24, 8);
}

- (NSString)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  id v5 = MRCreateIndentedDebugDescriptionFromObject();
  uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject();
  id v7 = MRCreateIndentedDebugDescriptionFromObject();
  id v8 = MRCreateIndentedDebugDescriptionFromObject();
  v9 = MRCreateIndentedDebugDescriptionFromObject();
  id v10 = [v3 initWithFormat:@"<%@ %p {\n  AirPlayService = %@\n  CompanionService = %@\n  RapportService = %@\n  IDSService = %@\n  MRRelayService = %@\n}>", v4, self, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (void)bonjourRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = [(MRDRemoteControlService *)self _notifyDelegateWithConnection:a4];
}

- (void)airPlayRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = [(MRDRemoteControlService *)self _notifyDelegateWithConnection:a4];
}

- (void)rapportRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = [(MRDRemoteControlService *)self _notifyDelegateWithConnection:a4];
}

- (id)idsCompanionRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  return [(MRDRemoteControlService *)self _notifyDelegateWithConnection:a4];
}

- (id)idsRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  return [(MRDRemoteControlService *)self _notifyDelegateWithConnection:a4];
}

- (void)groupSessionRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = [(MRDRemoteControlService *)self _notifyDelegateWithConnection:a4];
}

- (void)mrRelayRemoteControlService:(id)a3 didAcceptConnection:(id)a4
{
  id v4 = [(MRDRemoteControlService *)self _notifyDelegateWithConnection:a4];
}

- (void)start
{
  self->_started = 1;
  [(MRDBonjourRemoteControlService *)self->_genericNetworkService start];
  [(MRDBonjourRemoteControlService *)self->_televisionNetworkService start];
  [(MRDAirPlayRemoteControlService *)self->_airPlayService start];
  [(MRDRapportRemoteControlService *)self->_rapportService start];
  [(MRDIDSCompanionRemoteControlService *)self->_companionService start];
  [(MRDIDSRemoteControlService *)self->_idsService start];
  mrRelayRemoteControlService = self->_mrRelayRemoteControlService;

  [(MRDMRRelayRemoteControlService *)mrRelayRemoteControlService start];
}

- (void)stop
{
  self->_started = 0;
}

- (id)_notifyDelegateWithConnection:(id)a3
{
  uint64_t v4 = qword_10047E268;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_10047E268, &stru_10041D678);
  }
  uint64_t v6 = [MRDExternalDeviceServerClientConnection alloc];
  id v7 = [(MRDExternalDeviceServerClientConnection *)v6 initWithConnection:v5 queue:qword_10047E260];
  id v8 = [v5 label];
  [(MRDExternalDeviceServerClientConnection *)v7 setLabel:v8];

  v9 = [v5 destinationOutputDeviceUID];
  [(MRDExternalDeviceServerClientConnection *)v7 setDestinationOutputDeviceUID:v9];

  id v10 = [v5 destinationGroupUID];
  [(MRDExternalDeviceServerClientConnection *)v7 setDestinationGroupUID:v10];

  v11 = [v5 connectUserInfo];

  [(MRDExternalDeviceServerClientConnection *)v7 setConnectUserInfo:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteControlService:self didAcceptClientConnection:v7];

  return v7;
}

- (void)reevaluateGroupSessionService
{
  id v3 = +[MRDMediaRemoteServer server];
  uint64_t v4 = [v3 groupSessionServer];
  id v7 = [v4 sessionManager];

  id v5 = v7;
  groupSessionService = self->_groupSessionService;
  if (!groupSessionService && v7)
  {
    id v5 = [[MRDGroupSessionRemoteControlService alloc] initWithGroupSessionManager:v7 delegate:self];
    groupSessionService = self->_groupSessionService;
LABEL_6:
    self->_groupSessionService = v5;

    id v5 = v7;
    goto LABEL_7;
  }
  if (groupSessionService && !v7) {
    goto LABEL_6;
  }
LABEL_7:
}

- (MRDAirPlayRemoteControlService)airPlayService
{
  return self->_airPlayService;
}

- (void)setAirPlayService:(id)a3
{
}

- (MRDRemoteControlServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDRemoteControlServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRDBonjourRemoteControlService)genericNetworkService
{
  return self->_genericNetworkService;
}

- (void)setGenericNetworkService:(id)a3
{
}

- (MRDBonjourRemoteControlService)televisionNetworkService
{
  return self->_televisionNetworkService;
}

- (void)setTelevisionNetworkService:(id)a3
{
}

- (MRDRapportRemoteControlService)rapportService
{
  return self->_rapportService;
}

- (void)setRapportService:(id)a3
{
}

- (MRDIDSCompanionRemoteControlService)companionService
{
  return self->_companionService;
}

- (void)setCompanionService:(id)a3
{
}

- (MRDIDSRemoteControlService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (MRDGroupSessionRemoteControlService)groupSessionService
{
  return self->_groupSessionService;
}

- (void)setGroupSessionService:(id)a3
{
}

- (MRDMRRelayRemoteControlService)mrRelayRemoteControlService
{
  return self->_mrRelayRemoteControlService;
}

- (void)setMrRelayRemoteControlService:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_mrRelayRemoteControlService, 0);
  objc_storeStrong((id *)&self->_groupSessionService, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_companionService, 0);
  objc_storeStrong((id *)&self->_rapportService, 0);
  objc_storeStrong((id *)&self->_televisionNetworkService, 0);
  objc_storeStrong((id *)&self->_genericNetworkService, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_airPlayService, 0);
}

@end