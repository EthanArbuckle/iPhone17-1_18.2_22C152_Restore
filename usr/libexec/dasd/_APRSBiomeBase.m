@interface _APRSBiomeBase
+ (id)config;
+ (id)eventStream;
+ (id)getStoragePath;
+ (id)publisherForEventsStartingFromDate:(id)a3;
+ (id)sharedEventQueue;
+ (id)sourceForStream;
+ (void)postEvent:(id)a3;
+ (void)postEvent:(id)a3 usingSource:(id)a4;
+ (void)pruneEventsOlderThanDate:(id)a3;
+ (void)setStoragePath:(id)a3;
@end

@implementation _APRSBiomeBase

+ (id)config
{
  id v2 = +[BMStoreConfig newPrivateStreamDefaultConfigurationWithStoreBasePath:](BMStoreConfig, "newPrivateStreamDefaultConfigurationWithStoreBasePath:");
  v3 = (void *)qword_1001C3F10;
  qword_1001C3F10 = (uint64_t)v2;

  v4 = (void *)qword_1001C3F10;

  return v4;
}

+ (void)setStoragePath:(id)a3
{
}

+ (id)getStoragePath
{
  return (id)qword_1001C3F08;
}

+ (id)eventStream
{
  id v2 = +[_APRSBiomeBase config];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v4 substringFromIndex:1];

  id v6 = [objc_alloc((Class)BMStoreStream) initWithPrivateStreamIdentifier:v5 storeConfig:v2];

  return v6;
}

+ (id)sourceForStream
{
  id v2 = [(id)objc_opt_class() eventStream];
  v3 = [v2 source];

  return v3;
}

+ (id)sharedEventQueue
{
  if (qword_1001C3F20 != -1) {
    dispatch_once(&qword_1001C3F20, &stru_100176570);
  }
  id v2 = (void *)qword_1001C3F18;

  return v2;
}

+ (void)postEvent:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() eventStream];
  id v5 = [v4 source];

  [(id)objc_opt_class() postEvent:v3 usingSource:v5];
}

+ (void)postEvent:(id)a3 usingSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[_APRSBiomeBase sharedEventQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005B8A8;
  v10[3] = &unk_100175570;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

+ (id)publisherForEventsStartingFromDate:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() eventStream];
  [v3 timeIntervalSinceReferenceDate];
  double v6 = v5;

  v7 = [v4 publisherFromStartTime:v6];

  return v7;
}

+ (void)pruneEventsOlderThanDate:(id)a3
{
  id v4 = a3;
  double v5 = [a1 eventStream];
  [v4 timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;

  id v8 = +[_APRSBiomeBase sharedEventQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005BA10;
  v10[3] = &unk_100175F40;
  id v11 = v5;
  uint64_t v12 = v7;
  id v9 = v5;
  dispatch_async(v8, v10);
}

@end