@interface PTDRemotePrototypingServer
- (BOOL)isEnabled;
- (PTDRemotePrototypingServer)initWithDomainServer:(id)a3 queue:(id)a4;
- (PTDomainServer)domainServer;
- (id)allowedRemotePeerDisplayNames;
- (id)getAllDomainInfoByID;
- (id)getRootProxyDefinitionForDomainID:(id)a3;
- (id)localPeerDisplayName;
- (id)supportedStateTypes;
- (void)_broadCastState:(id)a3 withStateInfo:(id)a4;
- (void)_disableRemoteEditingServer;
- (void)applyArchiveValue:(id)a3;
- (void)didReceiveState:(id)a3 withInfo:(id)a4 fromPeer:(id)a5;
- (void)invokeOutletAtKeyPath:(id)a3;
- (void)restoreDefaultValuesForDomainID:(id)a3;
- (void)sendEventForTestRecipeID:(id)a3;
- (void)setActiveTestRecipeID:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation PTDRemotePrototypingServer

- (PTDRemotePrototypingServer)initWithDomainServer:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PTDRemotePrototypingServer;
  v9 = [(PTDRemotePrototypingServer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domainServer, a3);
    objc_storeStrong((id *)&v10->_mainQueue, a4);
  }

  return v10;
}

- (BOOL)isEnabled
{
  return self->_remoteEditingServerController != 0;
}

- (void)setEnabled:(BOOL)a3
{
  remoteEditingServerController = self->_remoteEditingServerController;
  if (a3)
  {
    if (!remoteEditingServerController)
    {
      PTTransactionBegin();
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x2050000000;
      v5 = (void *)qword_1000205C8;
      uint64_t v17 = qword_1000205C8;
      if (!qword_1000205C8)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100008AE8;
        v13[3] = &unk_100018BA0;
        v13[4] = &v14;
        sub_100008AE8((uint64_t)v13);
        v5 = (void *)v15[3];
      }
      v6 = v5;
      _Block_object_dispose(&v14, 8);
      id v7 = (RSPeerToPeerServerController *)[[v6 alloc] initWithDataSource:self];
      id v8 = self->_remoteEditingServerController;
      self->_remoteEditingServerController = v7;

      [(RSPeerToPeerServerController *)self->_remoteEditingServerController setDelegate:self];
      [(RSPeerToPeerServerController *)self->_remoteEditingServerController prepareForConnection];
      unint64_t v9 = self->_remoteEditingServerControllerRevision + 1;
      self->_remoteEditingServerControllerRevision = v9;
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
      mainQueue = self->_mainQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008040;
      block[3] = &unk_100018B78;
      block[4] = self;
      block[5] = v9;
      dispatch_after(v10, mainQueue, block);
      return;
    }
  }
  else if (!remoteEditingServerController)
  {
    return;
  }

  [(PTDRemotePrototypingServer *)self _disableRemoteEditingServer];
}

- (void)_disableRemoteEditingServer
{
  PTTransactionEnd();
  [(RSPeerToPeerServerController *)self->_remoteEditingServerController abort];
  remoteEditingServerController = self->_remoteEditingServerController;
  self->_remoteEditingServerController = 0;

  v4 = PTLogObjectForTopic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote editing server disabled.", v5, 2u);
  }
}

- (id)localPeerDisplayName
{
  v2 = +[UIDevice currentDevice];
  v3 = [v2 name];
  v4 = +[NSString stringWithFormat:@"Prototype on %@", v3];

  return v4;
}

- (id)allowedRemotePeerDisplayNames
{
  return &off_100019580;
}

- (id)supportedStateTypes
{
  return &__NSArray0__struct;
}

- (void)didReceiveState:(id)a3 withInfo:(id)a4 fromPeer:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  mainQueue = self->_mainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008310;
  block[3] = &unk_100018878;
  id v13 = v8;
  id v14 = v7;
  v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(mainQueue, block);
}

- (void)_broadCastState:(id)a3 withStateInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mainQueue = self->_mainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008618;
  block[3] = &unk_100018878;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(mainQueue, block);
}

- (id)getAllDomainInfoByID
{
  domainServer = self->_domainServer;
  if (!domainServer)
  {
    v4 = (PTDomainServer *)objc_alloc_init((Class)PTDomainServer);
    v5 = self->_domainServer;
    self->_domainServer = v4;

    domainServer = self->_domainServer;
  }
  id v6 = [(PTDomainServer *)domainServer domainInfoByID];
  uint64_t v10 = 0;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:0 error:&v10];
  id v8 = [v7 base64EncodedStringWithOptions:0];

  return v8;
}

- (id)getRootProxyDefinitionForDomainID:(id)a3
{
  v4 = [a3 objectForKey:@"domainID"];
  domainServer = self->_domainServer;
  if (!domainServer)
  {
    id v6 = (PTDomainServer *)objc_alloc_init((Class)PTDomainServer);
    id v7 = self->_domainServer;
    self->_domainServer = v6;

    domainServer = self->_domainServer;
  }
  id v8 = [(PTDomainServer *)domainServer rootSettingsProxyDefinitionForDomainID:v4];
  uint64_t v12 = 0;
  id v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:0 error:&v12];
  uint64_t v10 = [v9 base64EncodedStringWithOptions:0];

  return v10;
}

- (void)applyArchiveValue:(id)a3
{
  id v4 = a3;
  id v7 = [v4 objectForKey:@"value"];
  v5 = [v4 objectForKey:@"keyPath"];
  id v6 = [v4 objectForKey:@"domainID"];

  if (v7 && v5 && v6) {
    [(PTDomainServer *)self->_domainServer applyArchiveValue:v7 forRootSettingsKeyPath:v5 domainID:v6];
  }
}

- (void)restoreDefaultValuesForDomainID:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"domainID"];
  if (v4) {
    [(PTDomainServer *)self->_domainServer restoreDefaultValuesForDomainID:v4];
  }

  _objc_release_x1();
}

- (void)invokeOutletAtKeyPath:(id)a3
{
  id v4 = a3;
  id v6 = [v4 objectForKey:@"keyPath"];
  v5 = [v4 objectForKey:@"domainID"];

  if (v6 && v5) {
    [(PTDomainServer *)self->_domainServer invokeOutletAtKeyPath:v6 domainID:v5];
  }
}

- (void)sendEventForTestRecipeID:(id)a3
{
  id v4 = a3;
  id v6 = [v4 objectForKey:@"event"];
  v5 = [v4 objectForKey:@"recipeID"];

  if (v6 && v5) {
    -[PTDomainServer sendEvent:forTestRecipeID:](self->_domainServer, "sendEvent:forTestRecipeID:", [v6 unsignedIntegerValue], v5);
  }
}

- (void)setActiveTestRecipeID:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"recipeID"];
  if (v4) {
    [(PTDomainServer *)self->_domainServer setActiveTestRecipeID:v4];
  }

  _objc_release_x1();
}

- (PTDomainServer)domainServer
{
  return self->_domainServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainServer, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);

  objc_storeStrong((id *)&self->_remoteEditingServerController, 0);
}

@end