@interface FMDLocationManagerFactory
+ (FMDLocationManagerFactory)sharedInstance;
- (FMDLocationManagerFactory)init;
- (NSMutableArray)locationManagers;
- (id)_newCLLocationManager;
- (id)newLocationManager;
- (void)_discardLocationManager:(id)a3;
- (void)setLocationManagers:(id)a3;
@end

@implementation FMDLocationManagerFactory

+ (FMDLocationManagerFactory)sharedInstance
{
  if (qword_10031E6A0 != -1) {
    dispatch_once(&qword_10031E6A0, &stru_1002D91C0);
  }
  v2 = (void *)qword_10031E698;

  return (FMDLocationManagerFactory *)v2;
}

- (FMDLocationManagerFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDLocationManagerFactory;
  v2 = [(FMDLocationManagerFactory *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(FMDLocationManagerFactory *)v2 setLocationManagers:v3];
  }
  return v2;
}

- (id)newLocationManager
{
  id v3 = [(FMDLocationManagerFactory *)self _newCLLocationManager];
  v4 = [[FMDLocationManagerProxy alloc] initWithLocationManager:v3];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000073A0;
  v6[3] = &unk_1002D91E8;
  objc_copyWeak(&v7, &location);
  [(FMDLocationManagerProxy *)v4 setProxyDeallocationBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_newCLLocationManager
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100007644;
  v14 = sub_100007654;
  id v15 = 0;
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDLocationManagerFactory creating location manager", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000765C;
  v9[3] = &unk_1002D9210;
  v9[4] = self;
  v9[5] = &v10;
  v4 = objc_retainBlock(v9);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v4[2])(v4);
  }
  else {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
  }
  objc_super v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v11[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDLocationManagerFactory created %@", buf, 0xCu);
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)_discardLocationManager:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000077CC;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (NSMutableArray)locationManagers
{
  return self->_locationManagers;
}

- (void)setLocationManagers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end