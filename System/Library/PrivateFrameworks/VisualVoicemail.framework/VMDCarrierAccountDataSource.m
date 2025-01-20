@interface VMDCarrierAccountDataSource
- (BOOL)isAccountOnline:(id)a3;
- (BOOL)isAccountSubscribed:(id)a3;
- (BOOL)isCallVoicemailSupportedForAccountUUID:(id)a3;
- (BOOL)isPasscodeChangeSupportedForAccountUUID:(id)a3;
- (NSArray)accounts;
- (NSOperationQueue)delegateQueue;
- (OS_dispatch_queue)queue;
- (VMAccountDataSourceDelegate)delegate;
- (VMCarrierBundleClient)carrierBundle;
- (VMCarrierServicesController)carrierServicesController;
- (VMDCarrierAccountDataSource)init;
- (VMDCarrierAccountDataSource)initWithServicesController:(id)a3 queue:(id)a4 telephonyClient:(id)a5;
- (VMTelephonyClient)telephonyClient;
- (id)findValidContextForSubscription:(id)a3;
- (int64_t)maximumPasscodeLengthForAccountUUID:(id)a3;
- (int64_t)minimumPasscodeLengthForAccountUUID:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)checkUpdateAccounts;
- (void)dataMigration_legacy:(id)a3 context:(id)a4 isoCountryCode:(id)a5 phone:(id)a6 accountDir:(id)a7;
- (void)dealloc;
- (void)handleVMCarrierIMAPParametersChangedNotification:(id)a3;
- (void)local_voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4;
- (void)notifyDelegateAccountsDidChange;
- (void)performAtomicAccessorBlock:(id)a3;
- (void)performSynchronousBlock:(id)a3;
- (void)setAccount:(id)a3 forUUID:(id)a4;
- (void)setAccounts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 completion:(id)a5;
- (void)setTelephonyClient:(id)a3;
- (void)updateAccount:(id)a3 withDictionary:(id)a4;
@end

@implementation VMDCarrierAccountDataSource

- (VMDCarrierAccountDataSource)init
{
  return 0;
}

- (VMDCarrierAccountDataSource)initWithServicesController:(id)a3 queue:(id)a4 telephonyClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)VMDCarrierAccountDataSource;
  v12 = [(VMDCarrierAccountDataSource *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    dispatch_queue_set_specific((dispatch_queue_t)v13->_queue, off_1000E0288, v13, 0);
    v13->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v14 = objc_opt_new();
    accounts = v13->_accounts;
    v13->_accounts = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_carrierServicesController, a3);
    [v9 setCarrierAccountDataSource:v13];
    [(VMDCarrierAccountDataSource *)v13 setTelephonyClient:v11];
    v16 = [(VMDCarrierAccountDataSource *)v13 queue];
    [v11 addDelegate:v13 queue:v16];

    v17 = [[VMCarrierBundleClient alloc] initWithTelephonyClient:v11 queue:v13->_queue];
    carrierBundle = v13->_carrierBundle;
    v13->_carrierBundle = v17;

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v13 selector:"handleVMCarrierIMAPParametersChangedNotification:" name:@"VMCarrierIMAPParametersChangedNotification" object:0];
  }
  return v13;
}

- (void)dealloc
{
  v3 = [(VMDCarrierAccountDataSource *)self telephonyClient];
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)VMDCarrierAccountDataSource;
  [(VMDCarrierAccountDataSource *)&v4 dealloc];
}

- (NSArray)accounts
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100034BC4;
  id v9 = sub_100034BD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034BDC;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  v4[5] = &v5;
  [(VMDCarrierAccountDataSource *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (VMAccountDataSourceDelegate)delegate
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100034BC4;
  id v9 = sub_100034BD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034CF0;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  v4[5] = &v5;
  [(VMDCarrierAccountDataSource *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (VMAccountDataSourceDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034DD0;
  v4[3] = &unk_1000C11B8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VMDCarrierAccountDataSource *)v5 performAtomicAccessorBlock:v4];
}

- (NSOperationQueue)delegateQueue
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100034BC4;
  id v9 = sub_100034BD4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034F40;
  v4[3] = &unk_1000C1190;
  void v4[4] = self;
  v4[5] = &v5;
  [(VMDCarrierAccountDataSource *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOperationQueue *)v2;
}

- (void)setDelegateQueue:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035020;
  v4[3] = &unk_1000C11B8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VMDCarrierAccountDataSource *)v5 performAtomicAccessorBlock:v4];
}

- (void)setAccounts:(id)a3
{
  objc_super v4 = (NSArray *)a3;
  uint64_t v5 = [(VMDCarrierAccountDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    accounts = self->_accounts;
    int v12 = 138412546;
    v13 = v4;
    __int16 v14 = 2112;
    v15 = accounts;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Set accounts to %@ from %@", (uint8_t *)&v12, 0x16u);
  }

  if (![(NSArray *)self->_accounts isEqualToArray:v4])
  {
    v8 = (NSArray *)[(NSArray *)v4 copy];
    id v9 = self->_accounts;
    self->_accounts = v8;

    id v10 = vm_vmd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_accounts;
      int v12 = 138412290;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notifying delegate the list of accounts was set to %@", (uint8_t *)&v12, 0xCu);
    }

    [(VMDCarrierAccountDataSource *)self notifyDelegateAccountsDidChange];
  }
}

- (void)setAccount:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VMDCarrierAccountDataSource *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(NSArray *)self->_accounts mutableCopy];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100035420;
  v22[3] = &unk_1000C2010;
  id v10 = v7;
  id v23 = v10;
  id v11 = [v9 indexOfObjectPassingTest:v22];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100035474;
    v15[3] = &unk_1000C11B8;
    id v16 = v9;
    id v17 = v6;
    int v12 = objc_retainBlock(v15);

    v13 = v16;
  }
  else
  {
    id v14 = v11;
    v13 = [v9 objectAtIndexedSubscript:v11];
    if ([v13 isEqualToAccount:v6])
    {
      int v12 = 0;
    }
    else
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100035464;
      v18[3] = &unk_1000C2038;
      id v19 = v9;
      id v21 = v14;
      id v20 = v6;
      int v12 = objc_retainBlock(v18);
    }
  }

  if (v12)
  {
    ((void (*)(void *))v12[2])(v12);
    objc_storeStrong((id *)&self->_accounts, v9);
    [(VMDCarrierAccountDataSource *)self notifyDelegateAccountsDidChange];
  }
}

- (void)dataMigration_legacy:(id)a3 context:(id)a4 isoCountryCode:(id)a5 phone:(id)a6 accountDir:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v15 = objc_alloc_init(VVDataMigrator);
  [(VVDataMigrator *)v15 setLabel:v13];

  [(VVDataMigrator *)v15 setAccountDir:v10];
  [(VVDataMigrator *)v15 setIsoCountryCode:v12];
  id v14 = sub_10001FA20(v11, v12);

  [(VVDataMigrator *)v15 setNormalizedPhoneNumber:v14];
  [(VVDataMigrator *)v15 createFoldersIfNecessary];
  [(VVDataMigrator *)v15 performMigrationIfNecessary];
}

- (id)findValidContextForSubscription:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(VMDCarrierAccountDataSource *)self telephonyClient];
  id v6 = [v5 subscriptions];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 uuid];
        id v12 = [v4 uuid];
        unsigned __int8 v13 = [v11 isEqual:v12];

        if (v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)checkUpdateAccounts
{
  id v2 = self;
  id v3 = [(VMDCarrierAccountDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  v77 = +[NSMutableArray array];
  id v4 = [(VMDCarrierAccountDataSource *)v2 telephonyClient];
  uint64_t v5 = [v4 contexts];

  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v94 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Update accounts for active contexts %@", buf, 0xCu);
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v73 = v5;
  id v7 = [v5 subscriptions];
  id v8 = [v7 countByEnumeratingWithState:&v89 objects:v99 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v90;
    v76 = v7;
    v78 = v2;
    uint64_t v84 = *(void *)v90;
    do
    {
      id v11 = 0;
      id v79 = v9;
      do
      {
        if (*(void *)v90 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(NSObject **)(*((void *)&v89 + 1) + 8 * (void)v11);
        unsigned __int8 v13 = [v12 context];
        if ([v12 slotID])
        {
          id v14 = [(VMDCarrierAccountDataSource *)v2 carrierBundle];
          unsigned int v15 = [v14 isServiceSupportedForSubscription:v13];

          if (v15)
          {
            long long v16 = [(VMDCarrierAccountDataSource *)v2 findValidContextForSubscription:v13];
            if (!v16)
            {
              long long v17 = vm_vmd_log();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v94 = v13;
                _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not find valid context for subscription %@", buf, 0xCu);
              }
            }
            unsigned int v18 = [v16 isSimDataOnly];
            id v19 = vm_vmd_log();
            BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
            if (v18)
            {
              if (v20)
              {
                *(_DWORD *)buf = 138412290;
                v94 = v12;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Current context does not support voice service; cancelling account creation for subscription %@",
                  buf,
                  0xCu);
              }
              goto LABEL_67;
            }
            if (v20)
            {
              *(_DWORD *)buf = 138412290;
              v94 = v12;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Carrier supports voicemail; creating account for subscription %@",
                buf,
                0xCu);
            }

            id v21 = objc_alloc((Class)NSUUID);
            v22 = [v12 labelID];
            id v19 = [v21 initWithUUIDString:v22];

            id v23 = [(VMDCarrierAccountDataSource *)v2 telephonyClient];
            v24 = [v23 isoCountryCode:v12];

            if (!v19 || !v24)
            {
              v30 = vm_vmd_log();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v94 = v19;
                __int16 v95 = 2112;
                v96 = v24;
                __int16 v97 = 2112;
                v98 = v12;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Invalid label UUID %@ or ISO country code %@; unable to create account for subscription %@",
                  buf,
                  0x20u);
              }
              goto LABEL_66;
            }
            v25 = [v12 accountID];
            v85 = sub_10006D8F0(v25);

            v26 = VMMap_copyAccountForLabel(v19);
            v82 = v24;
            if (v26)
            {
              v27 = v26;
              v28 = [v12 accountID];
              unsigned __int8 v29 = [v28 isEqualToString:v27];

              if (v29)
              {
                v81 = v27;
LABEL_43:
                id v40 = [objc_alloc((Class)VMMutableAccount) initWithUUID:v19];
                v41 = [(VMDCarrierAccountDataSource *)v2 telephonyClient];
                uint64_t v42 = [v12 context];
                id v88 = 0;
                [v41 getShortLabel:v42 error:&v88];
                v44 = v43 = v2;
                id v80 = v88;
                [v40 setAbbreviatedAccountDescription:v44];

                v45 = [v12 label];
                [v40 setAccountDescription:v45];

                v46 = [(VMDCarrierAccountDataSource *)v43 telephonyClient];
                v47 = [v46 isoCountryCode:v12];
                v83 = v40;
                [v40 setIsoCountryCode:v47];

                v48 = +[NSFileManager defaultManager];
                v49 = [v85 path];
                LOBYTE(v42) = [v48 fileExistsAtPath:v49];

                v24 = v82;
                if (v42) {
                  goto LABEL_57;
                }
                uint64_t v50 = [v12 phoneNumber];
                if (!v50) {
                  goto LABEL_57;
                }
                v51 = (void *)v50;
                v52 = [v12 phoneNumber];
                id v53 = [v52 length];

                if (!v53) {
                  goto LABEL_57;
                }
                v54 = [v12 phoneNumber];
                v55 = sub_10001FBC4(v54, v82);

                if (v55)
                {
                  v56 = [v55 UUIDString];
                  v57 = sub_10006DA08(v56);

                  if (v57)
                  {
                    v58 = +[NSFileManager defaultManager];
                    id v87 = 0;
                    unsigned int v59 = [v58 moveItemAtURL:v57 toURL:v85 error:&v87];
                    os_log_t log = (os_log_t)v87;

                    if (v59)
                    {
                      v60 = vm_vmd_log();
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                      {
                        v61 = [v57 path];
                        [v85 path];
                        v63 = v62 = v60;
                        *(_DWORD *)buf = 138412546;
                        v94 = v61;
                        __int16 v95 = 2112;
                        v96 = v63;
                        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "successfully moved old storage from %@ to %@", buf, 0x16u);

                        v60 = v62;
                      }
                      os_log_t v64 = log;
LABEL_56:

LABEL_57:
                      v65 = [v85 URLByAppendingPathComponent:@"com.apple.voicemail.imap.parameters.plist" isDirectory:0];
                      v66 = +[NSFileManager defaultManager];
                      v67 = [v65 path];
                      unsigned int v68 = [v66 fileExistsAtPath:v67];

                      id v2 = v78;
                      if (v68)
                      {
                        id v69 = objc_alloc((Class)NSDictionary);
                        id v86 = 0;
                        id v70 = [v69 initWithContentsOfURL:v65 error:&v86];
                        v71 = v86;
                        v72 = v71;
                        if (v70)
                        {
                          [(VMDCarrierAccountDataSource *)v78 updateAccount:v83 withDictionary:v70];
                        }
                        else if (v71)
                        {
                          loga = vm_vmd_log();
                          if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412546;
                            v94 = v65;
                            __int16 v95 = 2112;
                            v96 = v72;
                            _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "Could not open account file at %@ due to error %@", buf, 0x16u);
                          }
                        }
                      }
                      [v77 addObject:v83];

                      id v7 = v76;
                      id v9 = v79;
                      v30 = v85;
LABEL_66:

LABEL_67:
                      uint64_t v10 = v84;
                      goto LABEL_68;
                    }
                    os_log_t v64 = log;
LABEL_55:
                    v60 = [v12 phoneNumber];
                    [(VMDCarrierAccountDataSource *)v78 dataMigration_legacy:v19 context:v12 isoCountryCode:v82 phone:v60 accountDir:v85];
                    goto LABEL_56;
                  }
                }
                else
                {
                  v57 = 0;
                }
                os_log_t v64 = 0;
                goto LABEL_55;
              }
              v31 = vm_vmd_log();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                v32 = [v19 UUIDString];
                *(_DWORD *)buf = 138412546;
                v94 = v27;
                __int16 v95 = 2112;
                v96 = v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "found old mapping %@ <> %@ - unmapping", buf, 0x16u);
              }
              while (1)
              {
                CFTypeRef v33 = VMMap_copyRecordWithLabel(v19);
                if (!v33) {
                  break;
                }
                VMMap_removeRecord();
                CFRelease(v33);
                sub_100079AD0(v27);
              }
              while (1)
              {
                CFTypeRef v34 = VMMap_copyRecordWithAccount([v12 accountID]);
                if (!v34) {
                  break;
                }
                VMMap_removeRecord();
                CFRelease(v34);
              }
            }
            v35 = (const void *)VMMap_addRecord((uint64_t)[v12 accountID], v19);
            if (v35)
            {
              CFRelease(v35);
              v36 = vm_vmd_log();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                v37 = [v12 accountID];
                *(_DWORD *)buf = 138412546;
                v94 = v37;
                __int16 v95 = 2112;
                v96 = v19;
                v38 = v36;
                v39 = "created new account map record: %@ <=> %@";
                goto LABEL_41;
              }
            }
            else
            {
              v36 = vm_vmd_log();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                v37 = [v12 accountID];
                *(_DWORD *)buf = 138412546;
                v94 = v37;
                __int16 v95 = 2112;
                v96 = v19;
                v38 = v36;
                v39 = "FAILED to create new account map record: %@ <=> %@";
LABEL_41:
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 0x16u);
              }
            }

            VMStoreSave();
            v81 = 0;
            goto LABEL_43;
          }
        }
        long long v16 = vm_vmd_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Carrier does not support voicemail; cancelling account creation for subscription %@",
            buf,
            0xCu);
        }
LABEL_68:

        id v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [v7 countByEnumeratingWithState:&v89 objects:v99 count:16];
    }
    while (v9);
  }

  [(VMDCarrierAccountDataSource *)v2 setAccounts:v77];
}

- (void)updateAccount:(id)a3 withDictionary:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(VMDCarrierAccountDataSource *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 objectForKeyedSubscript:@"AccountState"];
  id v9 = [v6 objectForKeyedSubscript:@"AccountSettings"];

  uint64_t v10 = sub_100057130();
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v8) {
    objc_msgSend(v13, "setProvisioned:", objc_msgSend(v8, "isEqualToString:", @"NewAccount") ^ 1);
  }
  if (v11)
  {
    id v12 = [objc_alloc((Class)VMHandle) initWithType:1 value:v11];
    [v13 setHandle:v12];
  }
}

- (void)performAtomicAccessorBlock:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v6[2]();
    os_unfair_lock_unlock(&self->_accessorLock);
  }
  else
  {
    uint64_t v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"VMDCarrierAccountDataSource.m", 365, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(off_1000E0288) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    id v7 = [(VMDCarrierAccountDataSource *)self queue];
    dispatch_sync(v7, v5);
  }
}

- (void)notifyDelegateAccountsDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = objc_loadWeakRetained((id *)&self->_delegateQueue);
  id v5 = [v4 underlyingQueue];

  if (!v5)
  {
    id v5 = &_dispatch_main_q;
    id v6 = &_dispatch_main_q;
  }
  if (objc_opt_respondsToSelector())
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000364A8;
    v7[3] = &unk_1000C11B8;
    id v8 = WeakRetained;
    id v9 = self;
    dispatch_async(v5, v7);
  }
}

- (void)local_voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VMDCarrierAccountDataSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003658C;
  block[3] = &unk_1000C11E0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (BOOL)isAccountSubscribed:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDCarrierAccountDataSource *)self carrierServicesController];
  unsigned __int8 v6 = [v5 isAccountSubscribed:v4];

  return v6;
}

- (BOOL)isAccountOnline:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDCarrierAccountDataSource *)self carrierServicesController];
  unsigned __int8 v6 = [v5 isAccountOnline:v4];

  return v6;
}

- (BOOL)isCallVoicemailSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDCarrierAccountDataSource *)self carrierServicesController];
  unsigned __int8 v6 = [v5 isCallVoicemailSupportedForAccountUUID:v4];

  return v6;
}

- (BOOL)isPasscodeChangeSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(VMDCarrierAccountDataSource *)self telephonyClient];
  unsigned __int8 v6 = [v5 contexts];
  id v7 = [v6 subscriptions];

  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [v12 labelID];
        id v14 = [v4 UUIDString];
        unsigned int v15 = [v13 isEqual:v14];

        if (v15)
        {
          long long v17 = [(VMDCarrierAccountDataSource *)self carrierBundle];
          unsigned int v18 = [v12 context];
          unsigned __int8 v16 = [v17 isPasswordChangeSupportedForSubscription:v18];

          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v16 = 0;
LABEL_11:

  return v16;
}

- (int64_t)minimumPasscodeLengthForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDCarrierAccountDataSource *)self carrierServicesController];
  id v6 = [v5 minimumPasscodeLengthForAccountUUID:v4];

  return (int64_t)v6;
}

- (int64_t)maximumPasscodeLengthForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDCarrierAccountDataSource *)self carrierServicesController];
  id v6 = [v5 maximumPasscodeLengthForAccountUUID:v4];

  return (int64_t)v6;
}

- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VMDCarrierAccountDataSource *)self carrierServicesController];
  [v11 setPasscode:v10 forAccountUUID:v9 completion:v8];
}

- (void)handleVMCarrierIMAPParametersChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2112;
    id v15 = v4;
    id v6 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@ ", buf, 0x16u);
  }
  id v7 = [(VMDCarrierAccountDataSource *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100036FD0;
  v9[3] = &unk_1000C11B8;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (VMTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (VMCarrierServicesController)carrierServicesController
{
  return self->_carrierServicesController;
}

- (VMCarrierBundleClient)carrierBundle
{
  return self->_carrierBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierBundle, 0);
  objc_storeStrong((id *)&self->_carrierServicesController, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegateQueue);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end