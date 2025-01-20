@interface PHSpringBoardPreferences
+ (id)sharedPreferences;
- (BOOL)isProximitySensorAvailable;
- (id)domain;
@end

@implementation PHSpringBoardPreferences

+ (id)sharedPreferences
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002800C;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BBFE8 != -1) {
    dispatch_once(&qword_1000BBFE8, block);
  }
  v2 = (void *)qword_1000BBFE0;

  return v2;
}

- (id)domain
{
  return @"com.apple.springboard";
}

- (BOOL)isProximitySensorAvailable
{
  return ![(PHPreferences *)self BOOLForKey:@"SBDisableProximity" defaultValue:0];
}

@end