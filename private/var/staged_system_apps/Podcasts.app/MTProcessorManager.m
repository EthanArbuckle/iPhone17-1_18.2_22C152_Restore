@interface MTProcessorManager
- (MTProcessorManager)init;
- (void)_playbackStateChanged:(id)a3;
- (void)_startProcessor:(unint64_t)a3;
- (void)dealloc;
- (void)startAllProcessors;
- (void)startProcessors:(unint64_t)a3;
- (void)startProcessorsForCarPlay;
- (void)startProcessorsForFeedUpdates;
- (void)startProcessorsForPlayback;
@end

@implementation MTProcessorManager

- (MTProcessorManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTProcessorManager;
  v2 = [(MTProcessorManager *)&v9 init];
  if (v2)
  {
    v10[0] = &off_100579218;
    v11[0] = objc_opt_class();
    v10[1] = &off_100579230;
    v11[1] = objc_opt_class();
    v10[2] = &off_100579248;
    v11[2] = objc_opt_class();
    v10[3] = &off_100579260;
    v11[3] = objc_opt_class();
    v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
    v4 = (NSMutableDictionary *)[v3 mutableCopy];
    classMap = v2->_classMap;
    v2->_classMap = v4;

    v6 = objc_opt_class();
    [(NSMutableDictionary *)v2->_classMap setObject:v6 forKey:&off_100579278];
    os_feature_enabled_debounced_asset_management();
    [(NSMutableDictionary *)v2->_classMap setObject:objc_opt_class() forKey:&off_100579290];
    os_feature_enabled_debounced_asset_management();
    [(NSMutableDictionary *)v2->_classMap setObject:objc_opt_class() forKey:&off_1005792A8];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_playbackStateChanged:" name:IMAVPlayerNotification_StateDidChange object:0];
  }
  return v2;
}

- (void)startProcessors:(unint64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(NSMutableDictionary *)self->_classMap allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = (unint64_t)[*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) unsignedIntegerValue];
        if ((v10 & a3) != 0) {
          [(MTProcessorManager *)self _startProcessor:v10];
        }
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_startProcessor:(unint64_t)a3
{
  classMap = self->_classMap;
  v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSMutableDictionary *)classMap objectForKeyedSubscript:v4];

  id v6 = [v5 sharedInstance];
  if ([v6 isRunning])
  {
    id v7 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = NSStringFromClass((Class)v5);
      int v10 = 138412290;
      long long v11 = v8;
      objc_super v9 = "%@ is already running";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [v6 start];
    id v7 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = NSStringFromClass((Class)v5);
      int v10 = 138412290;
      long long v11 = v8;
      objc_super v9 = "%@ has been started";
      goto LABEL_6;
    }
  }
}

- (void)startAllProcessors
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AE50;
  block[3] = &unk_10054D570;
  block[4] = self;
  if (qword_10060A648 != -1) {
    dispatch_once(&qword_10060A648, block);
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:IMAVPlayerNotification_StateDidChange object:0];

  v4.receiver = self;
  v4.super_class = (Class)MTProcessorManager;
  [(MTProcessorManager *)&v4 dealloc];
}

- (void)_playbackStateChanged:(id)a3
{
  objc_super v4 = +[MTPlayerController defaultInstance];
  unsigned int v5 = [v4 isPlayingLocally];

  if (v5)
  {
    [(MTProcessorManager *)self startProcessorsForPlayback];
  }
}

- (void)startProcessorsForFeedUpdates
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000745C4;
  block[3] = &unk_10054D570;
  block[4] = self;
  if (qword_10060A650 != -1) {
    dispatch_once(&qword_10060A650, block);
  }
}

- (void)startProcessorsForPlayback
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000746C4;
  block[3] = &unk_10054D570;
  block[4] = self;
  if (qword_10060A658 != -1) {
    dispatch_once(&qword_10060A658, block);
  }
}

- (void)startProcessorsForCarPlay
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000747C4;
  block[3] = &unk_10054D570;
  block[4] = self;
  if (qword_10060A660 != -1) {
    dispatch_once(&qword_10060A660, block);
  }
}

- (void).cxx_destruct
{
}

@end