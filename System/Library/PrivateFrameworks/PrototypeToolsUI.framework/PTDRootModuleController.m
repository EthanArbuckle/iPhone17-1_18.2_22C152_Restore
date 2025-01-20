@interface PTDRootModuleController
- (BOOL)moduleNeedsReload;
- (PTDPrototypingSettings)prototypingSettings;
- (PTDRootModuleController)initWithDomainServer:(id)a3 editingServer:(id)a4;
- (PTModule)module;
- (PTParameterRecords)parameterRecordsOfTunedSettings;
- (PTUIClient)delegate;
- (id)_hardwareEventSection;
- (id)_killSection;
- (id)_volumeSection;
- (id)_volumeSliderRow;
- (void)_avServerConnectionDiedNotification:(id)a3;
- (void)_sendKillSpringBoard;
- (void)_setModuleNeedsReload;
- (void)_subscribeToAVSystemControllerNotifications;
- (void)setDelegate:(id)a3;
- (void)setModuleNeedsReload:(BOOL)a3;
- (void)setParameterRecordsOfTunedSettings:(id)a3;
@end

@implementation PTDRootModuleController

- (PTDRootModuleController)initWithDomainServer:(id)a3 editingServer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PTDRootModuleController;
  v9 = [(PTDRootModuleController *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domainServer, a3);
    objc_storeStrong((id *)&v10->_editingServer, a4);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    avQueue = v10->_avQueue;
    v10->_avQueue = (OS_dispatch_queue *)Serial;

    uint64_t v13 = [(PTDomainServer *)v10->_domainServer localSettingsOfClass:objc_opt_class()];
    prototypingSettings = v10->_prototypingSettings;
    v10->_prototypingSettings = (PTDPrototypingSettings *)v13;

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v10 selector:"_setModuleNeedsReload" name:PTUIEditingServerDidReloadDomainsNotification object:0];
    [v15 addObserver:v10 selector:"_setModuleNeedsReload" name:PTUIEditingServerDidReloadTestRecipesNotification object:0];
    [v15 addObserver:v10 selector:"_avServerConnectionDiedNotification:" name:AVSystemController_ServerConnectionDiedNotification object:0];
    [(PTDRootModuleController *)v10 _subscribeToAVSystemControllerNotifications];
  }
  return v10;
}

- (PTModule)module
{
  v3 = +[NSMutableArray array];
  v4 = [(PTDRootModuleController *)self _volumeSection];
  [v3 addObject:v4];

  v5 = [(PTDRootModuleController *)self _hardwareEventSection];
  [v3 addObject:v5];

  v23 = [(PTUIEditingServer *)self->_editingServer testRecipeSelectionModule];
  v6 = +[PTModule submoduleWithModule:v23];
  [v3 addObject:v6];

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100006CA0;
  v24[3] = &unk_100018930;
  objc_copyWeak(&v25, &location);
  id v7 = objc_retainBlock(v24);
  id v8 = +[PTUIPushViewControllerRowAction actionWithViewControllerCreator:v7];
  v9 = +[PTDrillDownRow rowWithTitle:@"Show Modified Settings" valueKeyPath:@"showModifiedSettings"];
  v10 = [v9 action:v8];
  v28 = v10;
  v11 = +[NSArray arrayWithObjects:&v28 count:1];

  v12 = +[PTModule sectionWithRows:v11];
  v27 = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:&v27 count:1];
  v14 = +[PTModule moduleWithTitle:@"Modified Settings" contents:v13];

  v15 = +[PTModule submoduleWithModule:v14];
  [v3 addObject:v15];

  v16 = [(PTUIEditingServer *)self->_editingServer settingsEditingModule];
  objc_super v17 = +[PTModule submoduleWithModule:v16];
  [v3 addObject:v17];

  v18 = +[PTModule moduleWithSettings:self->_prototypingSettings];
  v19 = +[PTModule submoduleWithModule:v18];
  [v3 addObject:v19];

  v20 = [(PTDRootModuleController *)self _killSection];
  [v3 addObject:v20];

  v21 = +[PTModule moduleWithTitle:@"Prototyping" contents:v3];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return (PTModule *)v21;
}

- (id)_volumeSection
{
  v2 = [(PTDRootModuleController *)self _volumeSliderRow];
  v6 = v2;
  v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v4 = +[PTModule sectionWithRows:v3];

  return v4;
}

- (id)_volumeSliderRow
{
  v2 = +[PTSliderRow rowWithTitle:@"Volume" valueGetter:&stru_100018970 valueSetter:&stru_1000189B0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:v2 selector:"reloadRow" name:AVSystemController_SystemVolumeDidChangeNotification object:0];

  [v2 setUnregisterBlock:&stru_1000189F0];

  return v2;
}

- (void)_avServerConnectionDiedNotification:(id)a3
{
  v4 = PTLogObjectForTopic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AVSystemController server connection died; resubscribing to necessary notifications",
      v5,
      2u);
  }

  [(PTDRootModuleController *)self _subscribeToAVSystemControllerNotifications];
}

- (void)_subscribeToAVSystemControllerNotifications
{
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &stru_100018A10);
  dispatch_async((dispatch_queue_t)self->_avQueue, v3);
}

- (id)_hardwareEventSection
{
  v2 = +[PTDefaults sharedInstance];
  dispatch_block_t v3 = +[NSMutableArray array];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100007404;
  v19 = &unk_100018B00;
  id v20 = v2;
  id v21 = v3;
  id v4 = v3;
  PTPrototypingEnumerateHardwareEventsWithBlock();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007704;
  v14[3] = &unk_100018828;
  id v15 = v20;
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_100007748;
  v12 = &unk_100018B28;
  id v13 = v15;
  id v5 = v15;
  v6 = +[PTSwitchRow rowWithTitle:@"Multi Window Enabled" valueGetter:v14 valueSetter:&v9];
  objc_msgSend(v4, "addObject:", v6, v9, v10, v11, v12);

  id v7 = +[PTModule sectionWithRows:v4 title:@"Show Prototyping UI"];

  return v7;
}

- (id)_killSection
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007A18;
  v6[3] = &unk_100018AB0;
  v6[4] = self;
  v2 = +[PTButtonRow rowWithTitle:@"Kill SpringBoard" actionHandler:v6];
  id v7 = v2;
  dispatch_block_t v3 = +[NSArray arrayWithObjects:&v7 count:1];
  id v4 = +[PTModule sectionWithRows:v3];

  return v4;
}

- (void)_setModuleNeedsReload
{
  self->_moduleNeedsReload = 1;
}

- (void)_sendKillSpringBoard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained killSpringBoard];
}

- (PTUIClient)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PTUIClient *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PTDPrototypingSettings)prototypingSettings
{
  return self->_prototypingSettings;
}

- (PTParameterRecords)parameterRecordsOfTunedSettings
{
  return self->_parameterRecordsOfTunedSettings;
}

- (void)setParameterRecordsOfTunedSettings:(id)a3
{
}

- (BOOL)moduleNeedsReload
{
  return self->_moduleNeedsReload;
}

- (void)setModuleNeedsReload:(BOOL)a3
{
  self->_moduleNeedsReload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterRecordsOfTunedSettings, 0);
  objc_storeStrong((id *)&self->_prototypingSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_avQueue, 0);
  objc_storeStrong((id *)&self->_editingServer, 0);

  objc_storeStrong((id *)&self->_domainServer, 0);
}

@end