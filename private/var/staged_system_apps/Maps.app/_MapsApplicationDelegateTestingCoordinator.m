@interface _MapsApplicationDelegateTestingCoordinator
+ (BOOL)_writeSampleDataToHistoryContainer;
+ (BOOL)application:(id)a3 testName:(id)a4 options:(id)a5 shouldLoadSampleProactiveData:(BOOL)a6 shouldRaiseExceptionIfNeeded:(BOOL)a7 runTest:(id)a8;
+ (MapsAppTest)currentTest;
+ (void)doPostLauchTestSetupWithMapView:(id)a3 mapsAppTesting:(id)a4;
+ (void)setCurrentTest:(id)a3;
@end

@implementation _MapsApplicationDelegateTestingCoordinator

+ (MapsAppTest)currentTest
{
  return (MapsAppTest *)(id)qword_10160F240;
}

+ (void)doPostLauchTestSetupWithMapView:(id)a3 mapsAppTesting:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[GEOCountryConfiguration sharedConfiguration];
  v8 = [v7 countryCode];

  if ([v8 isEqualToString:@"US"])
  {
    [v5 _mapstest_jumpToCupertino];
  }
  else if ([v8 isEqualToString:@"JP"])
  {
    [v5 _mapstest_jumpToTokyo];
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100107900;
  v14[3] = &unk_1012E5D08;
  id v9 = v6;
  id v15 = v9;
  v10 = objc_retainBlock(v14);
  if ([v5 isFullyDrawn])
  {
    ((void (*)(void *))v10[2])(v10);
  }
  else
  {
    uint64_t v11 = VKMapViewDidBecomeFullyDrawnNotification;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001078F0;
    v12[3] = &unk_1012EEF90;
    v13 = v10;
    +[PPTNotificationCenter addOnceObserverForName:v11 object:0 usingBlock:v12];
  }
}

+ (void)setCurrentTest:(id)a3
{
}

+ (BOOL)application:(id)a3 testName:(id)a4 options:(id)a5 shouldLoadSampleProactiveData:(BOOL)a6 shouldRaiseExceptionIfNeeded:(BOOL)a7 runTest:(id)a8
{
  BOOL v9 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = (void (**)(id, id, id, id))a8;
  v17 = [v15 _mapstest_readSubTestsFromTestSerial];
  if ([v17 count])
  {
    v18 = +[NSMutableDictionary dictionaryWithDictionary:v15];
    [v18 setObject:v17 forKeyedSubscript:@"serialSubTests"];

    id v15 = v18;
  }
  if (v9 && ![a1 _writeSampleDataToHistoryContainer])
  {
    BOOL v21 = 0;
  }
  else
  {
    v19 = v16[2](v16, v14, v13, v15);
    [a1 setCurrentTest:v19];

    v20 = [a1 currentTest];
    BOOL v21 = v20 != 0;
  }
  return v21;
}

+ (BOOL)_writeSampleDataToHistoryContainer
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"PPTTestProactiveData" ofType:@"mapsdata"];

  id v12 = 0;
  id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3 options:0 error:&v12];
  id v5 = v12;
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    BOOL v9 = +[MSPMapsPaths geoHistorySettingsPath];
    id v11 = 0;
    unsigned __int8 v8 = [v4 writeToFile:v9 options:1 error:&v11];
    id v7 = v11;
  }
  else
  {
    id v7 = v5;
    unsigned __int8 v8 = 0;
  }

  return v8;
}

@end