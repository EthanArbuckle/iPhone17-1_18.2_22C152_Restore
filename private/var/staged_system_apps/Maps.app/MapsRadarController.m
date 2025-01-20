@interface MapsRadarController
+ (id)sharedInstance;
- (GEOObserverHashTable)observers;
- (MapsRadarController)init;
- (OS_dispatch_queue)carplayDarwinQueue;
- (OS_dispatch_queue)diagnosticExtensionDarwinQueue;
- (OS_dispatch_queue)isolationQueue;
- (int)carplayDarwinToken;
- (int)diagnosticExtensionDarwinToken;
- (void)_collectAttachmentsWithRadarDraft:(id)a3 completion:(id)a4;
- (void)addAttachmentProvider:(id)a3;
- (void)dealloc;
- (void)launchTTR;
- (void)launchTTRWithRadar:(id)a3;
- (void)launchTTRWithRadar:(id)a3 promptTitle:(id)a4 fromViewController:(id)a5;
- (void)removeAttachmentProvider:(id)a3;
- (void)setCarplayDarwinQueue:(id)a3;
- (void)setCarplayDarwinToken:(int)a3;
- (void)setDiagnosticExtensionDarwinQueue:(id)a3;
- (void)setDiagnosticExtensionDarwinToken:(int)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation MapsRadarController

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003B7D34;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160EA98 != -1) {
    dispatch_once(&qword_10160EA98, block);
  }
  v2 = (void *)qword_10160EA90;

  return v2;
}

- (MapsRadarController)init
{
  v3 = +[GEOPlatform sharedPlatform];
  unsigned __int8 v4 = [v3 isInternalInstall];

  if (v4)
  {
    v49.receiver = self;
    v49.super_class = (Class)MapsRadarController;
    v5 = [(MapsRadarController *)&v49 init];
    if (v5)
    {
      v6 = sub_1003B8398();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v51 = (const char *)v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
      }

      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = +[NSString stringWithFormat:@"%@.%@.isolationQueue.%p", v7, objc_opt_class(), v5];

      id v40 = v8;
      v9 = (const char *)[v40 UTF8String];
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
      isolationQueue = v5->_isolationQueue;
      v5->_isolationQueue = (OS_dispatch_queue *)v11;

      v13 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MapsRadarAttachmentProvider queue:v5->_isolationQueue];
      observers = v5->_observers;
      v5->_observers = v13;

      objc_initWeak((id *)buf, v5);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1003B83EC;
      v47[3] = &unk_1012E79C0;
      objc_copyWeak(&v48, (id *)buf);
      v15 = objc_retainBlock(v47);
      v16 = +[NSBundle bundleForClass:objc_opt_class()];
      v17 = +[NSString stringWithFormat:@"%@.%@.DiagnosticExtensionDarwinQueue.%p", v16, objc_opt_class(), v5];

      id v18 = v17;
      v19 = (const char *)[v18 UTF8String];
      v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v21 = dispatch_queue_create(v19, v20);
      diagnosticExtensionDarwinQueue = v5->_diagnosticExtensionDarwinQueue;
      v5->_diagnosticExtensionDarwinQueue = (OS_dispatch_queue *)v21;

      v5->_diagnosticExtensionDarwinToken = -1;
      v23 = v5->_diagnosticExtensionDarwinQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1003B88A8;
      handler[3] = &unk_1012E7A10;
      objc_copyWeak(&v46, (id *)buf);
      v24 = v15;
      id v45 = v24;
      notify_register_dispatch("com.apple.Maps.DEMapsExtension.CollectionRequest", &v5->_diagnosticExtensionDarwinToken, v23, handler);
      v25 = +[NSBundle bundleForClass:objc_opt_class()];
      v26 = +[NSString stringWithFormat:@"%@.%@.CarPlayDarwinQueue.%p", v25, objc_opt_class(), v5];

      id v27 = v26;
      v28 = (const char *)[v27 UTF8String];
      v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v30 = dispatch_queue_create(v28, v29);
      carplayDarwinQueue = v5->_carplayDarwinQueue;
      v5->_carplayDarwinQueue = (OS_dispatch_queue *)v30;

      v5->_carplayDarwinToken = -1;
      v32 = (const char *)[@"com.apple.carkit.maps-diagnostics-starting" UTF8String];
      v33 = v5->_carplayDarwinQueue;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1003B8A84;
      v41[3] = &unk_1012E7A10;
      objc_copyWeak(&v43, (id *)buf);
      v34 = v24;
      id v42 = v34;
      notify_register_dispatch(v32, &v5->_carplayDarwinToken, v33, v41);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v46);

      objc_destroyWeak(&v48);
      objc_destroyWeak((id *)buf);
    }
    self = v5;
    v35 = self;
  }
  else
  {
    v36 = sub_1005762E4();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "-[MapsRadarController init]";
      __int16 v52 = 2080;
      v53 = "MapsRadarController.m";
      __int16 v54 = 1024;
      int v55 = 65;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v37 = sub_1005762E4();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v51 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v35 = 0;
  }

  return v35;
}

- (void)dealloc
{
  v3 = sub_1003B8398();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  int diagnosticExtensionDarwinToken = self->_diagnosticExtensionDarwinToken;
  if (diagnosticExtensionDarwinToken != -1) {
    notify_cancel(diagnosticExtensionDarwinToken);
  }
  int carplayDarwinToken = self->_carplayDarwinToken;
  if (carplayDarwinToken != -1) {
    notify_cancel(carplayDarwinToken);
  }
  v6.receiver = self;
  v6.super_class = (Class)MapsRadarController;
  [(MapsRadarController *)&v6 dealloc];
}

- (void)addAttachmentProvider:(id)a3
{
  id v4 = a3;
  v5 = sub_1003B8398();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349314;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Adding attachment provider: %@", (uint8_t *)&v6, 0x16u);
  }

  [(GEOObserverHashTable *)self->_observers registerObserver:v4 queue:&_dispatch_main_q];
}

- (void)removeAttachmentProvider:(id)a3
{
  id v4 = a3;
  v5 = sub_1003B8398();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349314;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Removing attachment provider: %@", (uint8_t *)&v6, 0x16u);
  }

  [(GEOObserverHashTable *)self->_observers unregisterObserver:v4];
}

- (void)launchTTR
{
}

- (void)launchTTRWithRadar:(id)a3
{
}

- (void)launchTTRWithRadar:(id)a3 promptTitle:(id)a4 fromViewController:(id)a5
{
  __int16 v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = sub_1003B8398();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349826;
    v56 = self;
    __int16 v57 = 2112;
    v58 = v8;
    __int16 v59 = 2112;
    *(void *)v60 = v9;
    *(_WORD *)&v60[8] = 2112;
    *(void *)&v60[10] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Launching TTR with radar: %@ promptTitle: %@ viewController: %@", buf, 0x2Au);
  }

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  __int16 v52 = sub_100103B4C;
  v53 = sub_100104630;
  if (v8) {
    v12 = v8;
  }
  else {
    v12 = (char *)objc_opt_new();
  }
  __int16 v54 = v12;
  objc_initWeak(&location, self);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1003B97B8;
  v45[3] = &unk_1012E73F0;
  v47 = &v49;
  id v13 = v9;
  id v46 = v13;
  id v40 = objc_retainBlock(v45);
  if (v13)
  {
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    v15 = dispatch_queue_get_label(0);
    if (label != v15 && (!label || !v15 || strcmp(label, v15)))
    {
      v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        dispatch_queue_t v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v31 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        v56 = (MapsRadarController *)"-[MapsRadarController launchTTRWithRadar:promptTitle:fromViewController:]";
        __int16 v57 = 2080;
        v58 = "MapsRadarController.m";
        __int16 v59 = 1024;
        *(_DWORD *)v60 = 183;
        *(_WORD *)&v60[4] = 2080;
        *(void *)&v60[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v60[14] = 2080;
        *(void *)&v60[16] = v30;
        __int16 v61 = 2080;
        v62 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v32 = sub_1005762E4();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v56 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    if (!v10)
    {
      v16 = +[UIApplication _maps_keyMapsSceneDelegate];
      if (!v16)
      {
        v34 = sub_1005762E4();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v56 = (MapsRadarController *)"-[MapsRadarController launchTTRWithRadar:promptTitle:fromViewController:]";
          __int16 v57 = 2080;
          v58 = "MapsRadarController.m";
          __int16 v59 = 1024;
          *(_DWORD *)v60 = 186;
          *(_WORD *)&v60[4] = 2080;
          *(void *)&v60[6] = "mapsKeySceneDelegate != nil";
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v35 = sub_1005762E4();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v56 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      id v10 = [v16 topMostPresentedViewController];
      if (!v10)
      {
        v37 = sub_1005762E4();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v56 = (MapsRadarController *)"-[MapsRadarController launchTTRWithRadar:promptTitle:fromViewController:]";
          __int16 v57 = 2080;
          v58 = "MapsRadarController.m";
          __int16 v59 = 1024;
          *(_DWORD *)v60 = 188;
          *(_WORD *)&v60[4] = 2080;
          *(void *)&v60[6] = "viewController != nil";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v38 = sub_1005762E4();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v56 = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
    }
  }
  if ([v13 length])
  {
    v17 = [v13 substringToIndex:1];
    id v18 = [v17 uppercaseString];
    v19 = [v13 stringByReplacingCharactersInRange:0, 1, v18];
    v20 = [v19 stringByAppendingString:@". Would you like to file a Radar?"];

    dispatch_queue_t v21 = +[UIAlertController alertControllerWithTitle:@"[Internal only]\nTap-to-Radar" message:v20 preferredStyle:1];
    v22 = +[UIImage _maps_radar_symbolFilled];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1003B9AE8;
    v41[3] = &unk_1012E7A38;
    objc_copyWeak(&v44, &location);
    id v43 = &v49;
    id v42 = v40;
    v23 = +[UIAlertAction _actionWithTitle:@"OK" image:v22 style:0 handler:v41 shouldDismissHandler:0];
    [v21 addAction:v23];

    v24 = +[UIAlertAction actionWithTitle:@"Not now" style:1 handler:0];
    [v21 addAction:v24];

    v25 = +[MapsInternalAlertPresentationController sharedInstance];
    v26 = [v10 view];
    id v27 = [v26 window];
    v28 = [v27 windowScene];
    [v25 presentAlertController:v21 fromWindowScene:v28];

    objc_destroyWeak(&v44);
  }
  else
  {
    [(MapsRadarController *)self _collectAttachmentsWithRadarDraft:v50[5] completion:v40];
  }

  objc_destroyWeak(&location);
  _Block_object_dispose(&v49, 8);
}

- (void)_collectAttachmentsWithRadarDraft:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[MapsRadarController _collectAttachmentsWithRadarDraft:completion:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "MapsRadarController.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v34) = 209;
      WORD2(v34) = 2080;
      *(void *)((char *)&v34 + 6) = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        dispatch_queue_t v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  __int16 v8 = sub_1003B8398();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Collecting attachments", buf, 0xCu);
  }

  id v9 = +[NSUserDefaults standardUserDefaults];
  [v9 setBool:1 forKey:off_1015DF058];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v34 = sub_100103B4C;
  *((void *)&v34 + 1) = sub_100104630;
  id v10 = +[NSBundle mainBundle];
  dispatch_queue_t v11 = [v10 bundleIdentifier];
  id v12 = +[NSString stringWithFormat:@"%@.%@.%p.attachments", v11, objc_opt_class(), self];
  [v12 UTF8String];
  id v35 = (id)os_transaction_create();

  dispatch_group_t v13 = dispatch_group_create();
  objc_initWeak(&location, self);
  v14 = [(MapsRadarController *)self observers];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1003B9FA8;
  v27[3] = &unk_1012E7AB0;
  objc_copyWeak(&v31, &location);
  v15 = v13;
  v28 = v15;
  v29 = self;
  id v16 = v6;
  id v30 = v16;
  [v14 enumerateObserversWithGroup:v15 visitor:v27];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003BA4C4;
  block[3] = &unk_1012E7AD8;
  objc_copyWeak(&v26, &location);
  id v23 = v16;
  id v24 = v7;
  v25 = buf;
  id v17 = v7;
  id v18 = v16;
  dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
}

- (OS_dispatch_queue)diagnosticExtensionDarwinQueue
{
  return self->_diagnosticExtensionDarwinQueue;
}

- (void)setDiagnosticExtensionDarwinQueue:(id)a3
{
}

- (int)diagnosticExtensionDarwinToken
{
  return self->_diagnosticExtensionDarwinToken;
}

- (void)setDiagnosticExtensionDarwinToken:(int)a3
{
  self->_int diagnosticExtensionDarwinToken = a3;
}

- (OS_dispatch_queue)carplayDarwinQueue
{
  return self->_carplayDarwinQueue;
}

- (void)setCarplayDarwinQueue:(id)a3
{
}

- (int)carplayDarwinToken
{
  return self->_carplayDarwinToken;
}

- (void)setCarplayDarwinToken:(int)a3
{
  self->_int carplayDarwinToken = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_carplayDarwinQueue, 0);
  objc_storeStrong((id *)&self->_diagnosticExtensionDarwinQueue, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end