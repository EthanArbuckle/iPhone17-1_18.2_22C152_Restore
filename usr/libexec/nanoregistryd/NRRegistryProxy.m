@interface NRRegistryProxy
+ (BOOL)requireAnEntitlement;
+ (id)clientRemoteObjectInterface;
+ (id)entitlements;
+ (id)machServiceName;
+ (id)serverExportedInterface;
- (BOOL)_hasInternalEntitlement;
- (BOOL)loudHasEntitlement:(id)a3;
- (id)registryDelegate;
- (void)logCaller:(SEL)a3 args:(id)a4;
- (void)xpcApplyDiff:(id)a3 withSecureProperties:(id)a4 block:(id)a5;
- (void)xpcBooleanForInternalPreference:(id)a3 withBlock:(id)a4;
- (void)xpcClientInfo:(id)a3;
- (void)xpcDeviceIDAtSwitchIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)xpcGetChangeHistoryWithBlock:(id)a3;
- (void)xpcGetDeviceCollectionWithBlock:(id)a3;
- (void)xpcGetDiffSinceTokenValue:(unint64_t)a3 getSecureProperties:(BOOL)a4 withBlock:(id)a5;
- (void)xpcLongForInternalPreference:(id)a3 withBlock:(id)a4;
- (void)xpcRetrieveSecureProperties:(id)a3 block:(id)a4;
- (void)xpcSetMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5;
- (void)xpcSwitchIndex:(id)a3;
@end

@implementation NRRegistryProxy

+ (id)machServiceName
{
  return @"com.apple.nano.nanoregistry.paireddeviceregistry";
}

+ (id)serverExportedInterface
{
  if (qword_1001A1380 != -1) {
    dispatch_once(&qword_1001A1380, &stru_100169080);
  }
  v2 = (void *)qword_1001A1378;

  return v2;
}

+ (id)clientRemoteObjectInterface
{
  if (qword_1001A1390 != -1) {
    dispatch_once(&qword_1001A1390, &stru_1001690A0);
  }
  v2 = (void *)qword_1001A1388;

  return v2;
}

+ (id)entitlements
{
  v5[0] = @"com.apple.bluetoothregistry";
  v5[1] = @"com.apple.nano.nanoregistry";
  v5[2] = @"com.apple.nano.nanoregistry.pairunpairobliterate";
  v5[3] = @"com.apple.nano.nanoregistry.ids.plugin";
  v5[4] = @"com.apple.nano.nanoregistry.applydiff";
  v5[5] = @"com.apple.nano.nanoregistry.internal";
  v5[6] = @"com.apple.nano.nanoregistry.ids.plugin";
  v5[7] = @"com.apple.nano.nanoregistry.unpairwithbrick";
  v5[8] = @"com.apple.nanoregistry.BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2";
  v5[9] = @"com.apple.nano.nanoregistry.submitrtcpairingmetric";
  v5[10] = @"com.apple.nano.nanoregistry.generalaccess";
  v2 = +[NSArray arrayWithObjects:v5 count:11];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (BOOL)requireAnEntitlement
{
  return 0;
}

- (id)registryDelegate
{
  return [(NRRegistryProxy *)self target];
}

- (BOOL)loudHasEntitlement:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NRRegistryProxy *)self hasEntitlement:v4];
  if ((v5 & 1) == 0)
  {
    v6 = nr_daemon_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000FB14C(self, (uint64_t)v4, v8);
      }
    }
  }

  return v5;
}

- (BOOL)_hasInternalEntitlement
{
  if (_NRIsInternalInstall())
  {
    return [(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.internal"];
  }
  else
  {
    id v4 = nr_daemon_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000FB1FC(v6);
      }
    }
    return 0;
  }
}

- (void)xpcGetDeviceCollectionWithBlock:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NRRegistryProxy *)self hasEntitlements];
  v6 = [(NRRegistryProxy *)self registryDelegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B9204;
  v8[3] = &unk_1001690F0;
  unsigned __int8 v10 = v5;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 xpcGetDeviceCollectionWithBlock:v8];
}

- (void)xpcGetDiffSinceTokenValue:(unint64_t)a3 getSecureProperties:(BOOL)a4 withBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  unsigned int v9 = [(NRRegistryProxy *)self hasEntitlements];
  unsigned __int8 v10 = [(NRRegistryProxy *)self registryDelegate];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B941C;
  v12[3] = &unk_100169118;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 xpcGetDiffSinceTokenValue:a3 getSecureProperties:v9 & v5 withBlock:v12];
}

- (void)xpcRetrieveSecureProperties:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRRegistryProxy *)self hasEntitlements])
  {
    id v8 = [(NRRegistryProxy *)self registryDelegate];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B9620;
    v9[3] = &unk_100169140;
    v9[4] = self;
    id v10 = v7;
    [v8 xpcRetrieveSecureProperties:v6 block:v9];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)xpcSwitchIndex:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NRRegistryProxy *)self registryDelegate];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B97AC;
  v7[3] = &unk_100169190;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 xpcSwitchIndex:v7];
}

- (void)xpcLongForInternalPreference:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NRRegistryProxy *)self registryDelegate];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B993C;
  v10[3] = &unk_1001691E0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 xpcLongForInternalPreference:v7 withBlock:v10];
}

- (void)xpcBooleanForInternalPreference:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NRRegistryProxy *)self registryDelegate];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B9AD0;
  v10[3] = &unk_100169230;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 xpcBooleanForInternalPreference:v7 withBlock:v10];
}

- (void)xpcDeviceIDAtSwitchIndex:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(NRRegistryProxy *)self registryDelegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B9C60;
  v9[3] = &unk_100169258;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 xpcDeviceIDAtSwitchIndex:v4 withBlock:v9];
}

- (void)xpcClientInfo:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self _hasInternalEntitlement])
  {
    BOOL v5 = [(NRRegistryProxy *)self registryDelegate];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B9E38;
    v6[3] = &unk_100168128;
    v6[4] = self;
    id v7 = v4;
    [v5 xpcClientInfo:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)xpcGetChangeHistoryWithBlock:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self _hasInternalEntitlement])
  {
    BOOL v5 = [(NRRegistryProxy *)self registryDelegate];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BA040;
    v12[3] = &unk_100169280;
    v12[4] = self;
    id v13 = v4;
    id v6 = v4;
    [v5 xpcGetChangeHistoryWithBlock:v12];

    id v7 = v13;
  }
  else
  {
    id v8 = [(NRRegistryProxy *)self connection];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BA118;
    v10[3] = &unk_100165D10;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    id v7 = v11;
  }
}

- (void)xpcApplyDiff:(id)a3 withSecureProperties:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.applydiff"])
  {
    id v11 = [(NRRegistryProxy *)self registryDelegate];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000BA294;
    v18[3] = &unk_1001678C0;
    v18[4] = self;
    id v19 = v10;
    id v12 = v10;
    [v11 xpcApplyDiff:v8 withSecureProperties:v9 block:v18];

    id v13 = v19;
  }
  else
  {
    v14 = [(NRRegistryProxy *)self connection];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000BA36C;
    v16[3] = &unk_100165D10;
    id v17 = v10;
    id v15 = v10;
    [v14 runCompletionBlock:v16];

    id v13 = v17;
  }
}

- (void)xpcSetMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v10 = [(NRRegistryProxy *)self registryDelegate];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000BA5A0;
    v17[3] = &unk_100166210;
    v17[4] = self;
    id v18 = v9;
    id v11 = v9;
    [v10 xpcSetMigrationConsented:v6 forDeviceID:v8 withBlock:v17];

    id v12 = v18;
  }
  else
  {
    id v13 = [(NRRegistryProxy *)self connection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000BA650;
    v15[3] = &unk_100165D10;
    id v16 = v9;
    id v14 = v9;
    [v13 runCompletionBlock:v15];

    id v12 = v16;
  }
}

- (void)logCaller:(SEL)a3 args:(id)a4
{
  id v6 = a4;
  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(NRRegistryProxy *)self appPath];
      id v11 = NSStringFromSelector(a3);
      int v12 = 138543874;
      id v13 = v10;
      __int16 v14 = 2114;
      id v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ called %{public}@ %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
}

@end