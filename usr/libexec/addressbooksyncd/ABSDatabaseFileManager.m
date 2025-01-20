@interface ABSDatabaseFileManager
+ (id)_sharedInstance;
+ (id)pairingID;
+ (id)pairingStorePath;
+ (id)syncStateDBPathFor:(id)a3;
@end

@implementation ABSDatabaseFileManager

+ (id)_sharedInstance
{
  if (qword_100069CE8 != -1) {
    dispatch_once(&qword_100069CE8, &stru_100055588);
  }
  v2 = (void *)qword_100069CF0;

  return v2;
}

+ (id)syncStateDBPathFor:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() pairingStorePath];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 stringByAppendingPathComponent:@"AddressBook"];
    v7 = +[NSFileManager defaultManager];
    unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

    if ((v8 & 1) == 0)
    {
      v9 = +[NSFileManager defaultManager];
      [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v10 = [v6 stringByAppendingPathComponent:v3];
  }
  else
  {
    v11 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No device available from NanoRegistry at present -- will not store sync states until pairing completes.", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)pairingID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100022844;
  v10 = sub_100022854;
  id v11 = 0;
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002285C;
  v5[3] = &unk_1000555B0;
  v5[4] = &v6;
  [v2 waitForPairingStorePathPairingID:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)pairingStorePath
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100022844;
  v10 = sub_100022854;
  id v11 = 0;
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000229C0;
  v5[3] = &unk_1000555B0;
  v5[4] = &v6;
  [v2 waitForPairingStorePathPairingID:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

@end