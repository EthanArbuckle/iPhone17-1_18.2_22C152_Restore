@interface TrustAnalytics
+ (id)databasePath;
+ (id)logger;
- (void)logHardError:(id)a3 withEventName:(id)a4 withAttributes:(id)a5;
@end

@implementation TrustAnalytics

+ (id)logger
{
  if (sub_1000145D4())
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___TrustAnalytics;
    v3 = [super logger];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)databasePath
{
  return +[SFAnalytics defaultAnalyticsDatabasePath:@"trust_analytics"];
}

- (void)logHardError:(id)a3 withEventName:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000551F8;
  v12[3] = &unk_100081410;
  id v13 = a4;
  id v14 = v8;
  id v15 = a5;
  v16 = self;
  id v9 = v15;
  id v10 = v8;
  id v11 = v13;
  sub_10005536C(v12);
}

@end