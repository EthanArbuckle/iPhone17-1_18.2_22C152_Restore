@interface PPTNotificationCenter
+ (BOOL)isEnabled;
+ (void)addOnceObserverForName:(id)a3 object:(id)a4 usingBlock:(id)a5;
+ (void)postNotificationIfNeededWithName:(id)a3 object:(id)a4 userInfo:(id)a5;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PPTNotificationCenter

+ (void)addOnceObserverForName:(id)a3 object:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [a1 isEnabled];
  if (v10 && v11)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100103CCC;
    v23 = sub_1001046F0;
    id v24 = 0;
    v12 = +[NSNotificationCenter defaultCenter];
    v13 = +[NSOperationQueue mainQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001A06C;
    v16[3] = &unk_1012EDE88;
    v18 = &v19;
    id v17 = v10;
    uint64_t v14 = [v12 addObserverForName:v8 object:v9 queue:v13 usingBlock:v16];
    v15 = (void *)v20[5];
    v20[5] = v14;

    _Block_object_dispose(&v19, 8);
  }
}

+ (void)setEnabled:(BOOL)a3
{
  byte_10160EFD0 = a3;
}

+ (BOOL)isEnabled
{
  return byte_10160EFD0;
}

+ (void)postNotificationIfNeededWithName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([a1 isEnabled])
  {
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:v11 object:v8 userInfo:v9];
  }
}

@end