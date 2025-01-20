@interface CHIconCacheStoreLookup
+ (void)fetchIconWithCHIconParameters:(id)a3 withCompletion:(id)a4;
+ (void)initialize;
@end

@implementation CHIconCacheStoreLookup

+ (void)initialize
{
  v2 = (const char *)HKSingletonDispatchQueueName();
  dispatch_queue_t v3 = dispatch_queue_create(v2, 0);
  uint64_t v4 = qword_10096B550;
  qword_10096B550 = (uint64_t)v3;

  _objc_release_x1(v3, v4);
}

+ (void)fetchIconWithCHIconParameters:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = qword_10096B550;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10014C824;
    v8[3] = &unk_1008AD938;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, v8);
  }
}

@end