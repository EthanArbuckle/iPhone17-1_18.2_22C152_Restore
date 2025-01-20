@interface MCProvisioningProfileJanitor
+ (id)sharedJanitor;
- (BOOL)_updateMCTrustedCodeSigningIdentities:(id)a3 outError:(id *)a4;
- (MCProvisioningProfileJanitor)init;
- (MDMProvisioningProfileTrust)profileTrust;
- (OS_dispatch_queue)workQueue;
- (id)earliestRequiredManagedAppValidationDate;
- (void)setProfileTrust:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateMISTrust;
- (void)updateMISTrustAndValidateApps:(id)a3 validateManagedApps:(BOOL)a4 completion:(id)a5;
@end

@implementation MCProvisioningProfileJanitor

- (MCProvisioningProfileJanitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)MCProvisioningProfileJanitor;
  v2 = [(MCProvisioningProfileJanitor *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MCProvisioningProfileJanitor work queue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc((Class)MDMProvisioningProfileTrust);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("MIS Validate UPP queue", v7);
    v9 = (MDMProvisioningProfileTrust *)[v6 initWithValidationQueue:v8];
    profileTrust = v2->_profileTrust;
    v2->_profileTrust = v9;
  }
  return v2;
}

+ (id)sharedJanitor
{
  if (qword_1001059C8 != -1) {
    dispatch_once(&qword_1001059C8, &stru_1000EBEE0);
  }
  v2 = (void *)qword_1001059C0;

  return v2;
}

- (void)updateMISTrust
{
}

- (void)updateMISTrustAndValidateApps:(id)a3 validateManagedApps:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-UpdateMISTrustValidateApps"];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066AE8;
  block[3] = &unk_1000EBF08;
  block[4] = self;
  id v16 = v8;
  BOOL v19 = a4;
  id v17 = v10;
  id v18 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (BOOL)_updateMCTrustedCodeSigningIdentities:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  uint64_t v7 = MCFeatureTrustedCodeSigningIdentities;
  id v8 = [v5 allObjects];

  [v6 MCSetUnionRestriction:v7 values:v8];
  id v9 = +[MCRestrictionManagerWriter sharedManager];
  id v10 = MCLocalizedFormat();
  id v15 = 0;
  LOBYTE(v14) = 0;
  [v9 setClientRestrictions:v6 overrideRestrictions:0 appsAndOptions:0 system:1 clientType:@"com.apple.profiled.trustedcodesigningidentities" clientUUID:@"com.apple.profiled.trustedcodesigningidentities" sender:@"MCProvisioningProfileJanitor._updateMCTrustedCodeSigningIdentities" localizedClientDescription:v10 localizedWarning:0 shouldRecomputeNag:v14 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:&v15];
  id v11 = v15;

  if (v11)
  {
    id v12 = _MCLogObjects[11];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "MCProvisioningProfileJanitor failed to set MCFeatureTrustedCodeSigningIdentities with error: %{public}@", buf, 0xCu);
    }
    if (a4) {
      *a4 = v11;
    }
  }

  return v11 == 0;
}

- (id)earliestRequiredManagedAppValidationDate
{
  if (+[MDMProvisioningProfileTrust anyUPPExistsForManagedAppSigners])
  {
    v2 = +[NSDate date];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (MDMProvisioningProfileTrust)profileTrust
{
  return self->_profileTrust;
}

- (void)setProfileTrust:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileTrust, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end