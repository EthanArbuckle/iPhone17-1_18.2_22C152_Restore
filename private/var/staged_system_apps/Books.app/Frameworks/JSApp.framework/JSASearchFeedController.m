@interface JSASearchFeedController
- (void)updateSearchText:(id)a3;
@end

@implementation JSASearchFeedController

- (void)updateSearchText:(id)a3
{
  id v4 = a3;
  if ([v4 isString])
  {
    v5 = [v4 toString];
  }
  else
  {
    v5 = 0;
  }
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_18A70;
  v12[3] = &unk_B2BE0;
  objc_copyWeak(&v14, &location);
  id v6 = v5;
  id v13 = v6;
  v7 = objc_retainBlock(v12);
  if (v7)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v7[2])(v7);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_18AD4;
      block[3] = &unk_B2028;
      v11 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v14);
  if (v6)
  {
    CFStringRef v16 = @"searchText";
    id v17 = v6;
    v8 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  }
  else
  {
    v8 = &__NSDictionary0__struct;
  }
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"JSASearchFeedControllerUpdateSearchTextNotification" object:self userInfo:v8];

  objc_destroyWeak(&location);
}

@end