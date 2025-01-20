@interface COSiTunesStoreAuthController
+ (id)DSIDForiTunesStoreAccount:(id)a3;
+ (id)altDSIDForiTunesStoreAccount:(id)a3;
+ (id)iTunesStoreAccountInAccountStore;
+ (id)usernameForiTunesStoreAccount:(id)a3;
+ (void)repairDialogsForActiveDeviceWithCompletion:(id)a3;
+ (void)saveToPairedDeviceiTunesStoreAccount:(id)a3 fromAccountStore:(id)a4 completion:(id)a5;
@end

@implementation COSiTunesStoreAuthController

+ (id)usernameForiTunesStoreAccount:(id)a3
{
  return [a3 username];
}

+ (id)DSIDForiTunesStoreAccount:(id)a3
{
  id v3 = a3;
  v4 = sub_100031C7C();
  v5 = [v4 DSIDForAccount:v3 service:AIDAServiceTypeStore];

  return v5;
}

+ (id)altDSIDForiTunesStoreAccount:(id)a3
{
  id v3 = a3;
  v4 = sub_100031C7C();
  v5 = [v4 altDSIDForAccount:v3 service:AIDAServiceTypeStore];

  return v5;
}

+ (id)iTunesStoreAccountInAccountStore
{
  v2 = sub_100031C7C();
  id v3 = [v2 accountForService:AIDAServiceTypeStore];

  return v3;
}

+ (void)saveToPairedDeviceiTunesStoreAccount:(id)a3 fromAccountStore:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = pbb_accountsignin_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving iTunesStore account (%@) to paired device", (uint8_t *)&v12, 0xCu);
  }

  v11 = +[COSAppleIDAuthController amsSaveOptions];
  +[COSAppleIDAuthController saveToPairedDeviceAccount:v7 fromAccountStore:v9 withOptions:v11 completion:v8];
}

+ (void)repairDialogsForActiveDeviceWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)AMSDeviceMessenger);
  id v5 = objc_alloc_init((Class)AMSDeviceMessengerFilter);
  [v5 setDeviceType:1];
  v6 = pbb_accountsignin_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AMSDeviceMessenger (%@)", buf, 0xCu);
  }

  id v7 = [v4 dialogsWithFilter:v5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001013EC;
  v9[3] = &unk_100247280;
  id v10 = v3;
  id v8 = v3;
  [v7 addFinishBlock:v9];
}

@end