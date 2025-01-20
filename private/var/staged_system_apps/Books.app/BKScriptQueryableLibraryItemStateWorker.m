@interface BKScriptQueryableLibraryItemStateWorker
+ (void)queryForItemStateWithStoreID:(id)a3 completionValue:(id)a4;
@end

@implementation BKScriptQueryableLibraryItemStateWorker

+ (void)queryForItemStateWithStoreID:(id)a3 completionValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001BF704;
  v12[3] = &unk_100A43DD8;
  id v7 = v5;
  id v13 = v7;
  id v8 = v6;
  id v14 = v8;
  v9 = objc_retainBlock(v12);
  if (v9)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v9[2])(v9);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001BF938;
      block[3] = &unk_100A442B8;
      v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

@end