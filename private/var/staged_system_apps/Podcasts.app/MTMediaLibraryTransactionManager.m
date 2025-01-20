@interface MTMediaLibraryTransactionManager
- (MTMediaLibraryTransactionManager)init;
- (OS_dispatch_queue)serialQueue;
- (int64_t)counterForGeneratingLibraryChangeNotifications;
- (void)_beginGeneratingLibraryChangeNotifications;
- (void)_endGeneratingLibraryChangeNotifications;
- (void)beginGeneratingLibraryChangeNotifications:(id)a3;
- (void)endGeneratingLibraryChangeNotifications:(id)a3;
- (void)requestMediaLibraryReadTransaction:(id)a3;
- (void)requestMediaLibraryWriteTransaction:(id)a3;
- (void)requestMediaLibraryWriteTransaction:(id)a3 completion:(id)a4;
- (void)setCounterForGeneratingLibraryChangeNotifications:(int64_t)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation MTMediaLibraryTransactionManager

- (MTMediaLibraryTransactionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTMediaLibraryTransactionManager;
  v2 = [(MTMediaLibraryTransactionManager *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MTMediaLibraryManager", 0);
    [(MTMediaLibraryTransactionManager *)v2 setSerialQueue:v3];

    [(MTMediaLibraryTransactionManager *)v2 setCounterForGeneratingLibraryChangeNotifications:0];
  }
  return v2;
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setCounterForGeneratingLibraryChangeNotifications:(int64_t)a3
{
  self->_counterForGeneratingLibraryChangeNotifications = a3;
}

- (void)requestMediaLibraryWriteTransaction:(id)a3
{
}

- (void)requestMediaLibraryWriteTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(MTMediaLibraryTransactionManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126F48;
  block[3] = &unk_100552570;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)requestMediaLibraryReadTransaction:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MTMediaLibraryTransactionManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100127124;
  block[3] = &unk_10054D6E8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)_beginGeneratingLibraryChangeNotifications
{
  dispatch_queue_t v3 = _MTLogCategoryMediaLibrary();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134217984;
    int64_t v8 = [(MTMediaLibraryTransactionManager *)self counterForGeneratingLibraryChangeNotifications];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "will beginGeneratingLibraryChangeNotifications: %li", (uint8_t *)&v7, 0xCu);
  }

  id v4 = +[MPMediaLibrary defaultMediaLibrary];
  [v4 beginGeneratingLibraryChangeNotifications];

  [(MTMediaLibraryTransactionManager *)self setCounterForGeneratingLibraryChangeNotifications:(char *)[(MTMediaLibraryTransactionManager *)self counterForGeneratingLibraryChangeNotifications]+ 1];
  objc_super v5 = _MTLogCategoryMediaLibrary();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int64_t v6 = [(MTMediaLibraryTransactionManager *)self counterForGeneratingLibraryChangeNotifications];
    int v7 = 134217984;
    int64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "did beginGeneratingLibraryChangeNotifications: %li", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_endGeneratingLibraryChangeNotifications
{
  if (![(MTMediaLibraryTransactionManager *)self counterForGeneratingLibraryChangeNotifications])
  {
    dispatch_queue_t v3 = _MTLogCategoryMediaLibrary();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "attempting to endGeneratingLibraryChangeNotifications when already ended -- could result in unbalanced calls", (uint8_t *)&v9, 2u);
    }
  }
  id v4 = _MTLogCategoryMediaLibrary();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int64_t v5 = [(MTMediaLibraryTransactionManager *)self counterForGeneratingLibraryChangeNotifications];
    int v9 = 134217984;
    int64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "will endGeneratingLibraryChangeNotifications: %ld", (uint8_t *)&v9, 0xCu);
  }

  int64_t v6 = +[MPMediaLibrary defaultMediaLibrary];
  [v6 endGeneratingLibraryChangeNotifications];

  [(MTMediaLibraryTransactionManager *)self setCounterForGeneratingLibraryChangeNotifications:(char *)[(MTMediaLibraryTransactionManager *)self counterForGeneratingLibraryChangeNotifications]- 1];
  int v7 = _MTLogCategoryMediaLibrary();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int64_t v8 = [(MTMediaLibraryTransactionManager *)self counterForGeneratingLibraryChangeNotifications];
    int v9 = 134217984;
    int64_t v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "will endGeneratingLibraryChangeNotifications: %ld", (uint8_t *)&v9, 0xCu);
  }
}

- (void)beginGeneratingLibraryChangeNotifications:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MTMediaLibraryTransactionManager *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001274F8;
  v7[3] = &unk_10054E398;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)endGeneratingLibraryChangeNotifications:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MTMediaLibraryTransactionManager *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001275F4;
  v7[3] = &unk_10054D738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (int64_t)counterForGeneratingLibraryChangeNotifications
{
  return self->_counterForGeneratingLibraryChangeNotifications;
}

- (void).cxx_destruct
{
}

@end