@interface BKContinueReadingBooksProvider
+ (id)getInstance:(int64_t)a3;
- (BKContinueReadingBooksProvider)initWithLimit:(unint64_t)a3;
@end

@implementation BKContinueReadingBooksProvider

+ (id)getInstance:(int64_t)a3
{
  v5 = +[BCJSConfiguration sharedInstance];
  uint64_t v12 = BCJSNumberOfBooksInRecentsKey;
  v6 = +[NSNumber numberWithInteger:a3];
  v13 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v5 updateConfiguration:v7];

  id v8 = objc_alloc((Class)a1);
  v9 = [v5 numberOfBooksAllowedInRecentsList];
  id v10 = [v8 initWithLimit:[v9 integerValue]];

  return v10;
}

- (BKContinueReadingBooksProvider)initWithLimit:(unint64_t)a3
{
  v5 = +[BKLibraryManager fetchRequestForContinueReading];
  [v5 setFetchLimit:a3];
  v6 = +[BSUIAsset propertiesNeededFromBKLibraryAsset];
  [v5 setPropertiesToFetch:v6];

  v7 = BCCurrentBookLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Initializing continue reading books provider with limit %ld", buf, 0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)BKContinueReadingBooksProvider;
  id v8 = [(BKLibraryProvider *)&v11 initWithFetchRequest:v5 name:@"continueReading"];
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100048D2C;
    block[3] = &unk_100A43EF8;
    block[4] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

  return v8;
}

@end