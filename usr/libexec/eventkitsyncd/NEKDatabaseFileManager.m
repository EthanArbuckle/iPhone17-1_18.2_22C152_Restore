@interface NEKDatabaseFileManager
- (id)pairingID;
- (id)pairingStorePath;
- (id)syncStateDBPathFor:(id)a3;
@end

@implementation NEKDatabaseFileManager

- (id)syncStateDBPathFor:(id)a3
{
  id v4 = a3;
  v5 = [(NEKDatabaseFileManager *)self pairingStorePath];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 stringByAppendingPathComponent:@"EventKitSync"];
    v8 = +[NSFileManager defaultManager];
    unsigned __int8 v9 = [v8 fileExistsAtPath:v7];

    if ((v9 & 1) == 0)
    {
      v10 = +[NSFileManager defaultManager];
      [v10 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v11 = [v7 stringByAppendingPathComponent:v4];
  }
  else
  {
    v12 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006E8FC(v12);
    }
    v11 = 0;
  }
  v13 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Returning suggested db path: %@", (uint8_t *)&v15, 0xCu);
  }

  return v11;
}

- (id)pairingID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned __int8 v9 = sub_100036E40;
  v10 = sub_100036E50;
  id v11 = 0;
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100036E58;
  v5[3] = &unk_1000A9680;
  v5[4] = &v6;
  [v2 waitForPairingStorePathPairingID:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)pairingStorePath
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned __int8 v9 = sub_100036E40;
  v10 = sub_100036E50;
  id v11 = 0;
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100036FBC;
  v5[3] = &unk_1000A9680;
  v5[4] = &v6;
  [v2 waitForPairingStorePathPairingID:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

@end