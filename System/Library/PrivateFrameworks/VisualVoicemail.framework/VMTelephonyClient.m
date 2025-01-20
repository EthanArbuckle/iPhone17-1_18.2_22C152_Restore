@interface VMTelephonyClient
- (CTXPCContexts)cached_contexts;
- (NSArray)cached_subscriptions;
- (NSMapTable)cached_iso;
- (NSMapTable)cached_vmnumber;
- (NSMapTable)delegateToQueue;
- (NSString)cached_mcc;
- (NSString)cached_mnc;
- (OS_dispatch_queue)queue;
- (VMTelephonyClient)init;
- (VMTelephonyClient)initWithQueue:(id)a3;
- (id)contexts;
- (id)countryCode:(id)a3;
- (id)fetchContexts;
- (id)fetchCountryCode:(id)a3;
- (id)fetchIsoCountryCode:(id)a3;
- (id)fetchNetworkCode:(id)a3;
- (id)fetchSubscriptions;
- (id)fetchVoicemailPhoneNumber:(id)a3;
- (id)getIsoContryCodes;
- (id)isoCountryCode:(id)a3;
- (id)networkCode:(id)a3;
- (id)subscriptionContextWithPhoneNumber:(id)a3;
- (id)subscriptions;
- (id)userDefaultVoiceSubscriptionContext;
- (id)voicemailPhoneNumber:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (os_unfair_lock_s)delegateLock;
- (void)activeSubscriptionsDidChange;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)carrierBundleChange:(id)a3;
- (void)connectionAvailability:(id)a3 availableConnections:(id)a4;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)performAtomicAccessorBlock:(id)a3;
- (void)performAtomicDelegateBlock:(id)a3;
- (void)performSelectorOnDelegates:(SEL)a3;
- (void)performSelectorOnDelegates:(SEL)a3 withObject:(id)a4;
- (void)performSelectorOnDelegates:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7;
- (void)postSmscAddressAvailable:(id)a3 smsc:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setCached_contexts:(id)a3;
- (void)setCached_iso:(id)a3;
- (void)setCached_mcc:(id)a3;
- (void)setCached_mnc:(id)a3;
- (void)setCached_subscriptions:(id)a3;
- (void)setCached_vmnumber:(id)a3;
- (void)smsReadyStateChanged:(id)a3 info:(BOOL)a4;
- (void)subscriberCountryCodeDidChange:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation VMTelephonyClient

- (VMTelephonyClient)init
{
  return 0;
}

- (VMTelephonyClient)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VMTelephonyClient;
  v6 = [(VMTelephonyClient *)&v13 initWithQueue:v5];
  v7 = v6;
  if (v6)
  {
    v6->_accessorLock._os_unfair_lock_opaque = 0;
    v6->_delegateLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[NSMapTable weakToStrongObjectsMapTable];
    delegateToQueue = v7->_delegateToQueue;
    v7->_delegateToQueue = (NSMapTable *)v8;

    objc_storeStrong((id *)&v7->_queue, a3);
    [(VMTelephonyClient *)v7 setCached_subscriptions:0];
    [(VMTelephonyClient *)v7 setCached_contexts:0];
    v10 = objc_opt_new();
    [(VMTelephonyClient *)v7 setCached_iso:v10];

    [(VMTelephonyClient *)v7 setCached_mcc:0];
    [(VMTelephonyClient *)v7 setCached_mnc:0];
    v11 = objc_opt_new();
    [(VMTelephonyClient *)v7 setCached_vmnumber:v11];

    [(VMTelephonyClient *)v7 setDelegate:v7];
  }

  return v7;
}

- (id)subscriptionContextWithPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(VMTelephonyClient *)self subscriptions];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100079E9C;
  v10[3] = &unk_1000C3530;
  id v6 = v4;
  id v11 = v6;
  id v7 = [v5 indexOfObjectPassingTest:v10];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:v7];
  }

  return v8;
}

- (id)userDefaultVoiceSubscriptionContext
{
  v3 = [(VMTelephonyClient *)self subscriptions];
  id v14 = 0;
  id v4 = [(VMTelephonyClient *)self getUserDefaultVoiceSubscriptionContext:&v14];
  id v5 = v14;
  id v6 = 0;
  if (!v5)
  {
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_100079FF0;
    v12 = &unk_1000C3530;
    id v13 = v4;
    id v7 = [v3 indexOfObjectPassingTest:&v9];
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = objc_msgSend(v3, "objectAtIndexedSubscript:", v7, v9, v10, v11, v12);
    }
  }
  return v6;
}

- (id)subscriptions
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_10007A154;
  v9 = sub_10007A164;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007A16C;
  v4[3] = &unk_1000C1230;
  v4[4] = self;
  v4[5] = &v5;
  [(VMTelephonyClient *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)contexts
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_10007A154;
  v9 = sub_10007A164;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007A2F0;
  v4[3] = &unk_1000C1230;
  v4[4] = self;
  v4[5] = &v5;
  [(VMTelephonyClient *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)isoCountryCode:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10007A154;
  id v14 = sub_10007A164;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007A4AC;
  v6[3] = &unk_1000C1960;
  v9 = &v10;
  uint64_t v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(VMTelephonyClient *)v7 performAtomicAccessorBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)countryCode:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10007A154;
  id v14 = sub_10007A164;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007A6F8;
  v6[3] = &unk_1000C1208;
  uint64_t v7 = self;
  id v3 = a3;
  id v8 = v3;
  v9 = &v10;
  [(VMTelephonyClient *)v7 performAtomicAccessorBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)networkCode:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10007A154;
  id v14 = sub_10007A164;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007A8A8;
  v6[3] = &unk_1000C1208;
  uint64_t v7 = self;
  id v3 = a3;
  id v8 = v3;
  v9 = &v10;
  [(VMTelephonyClient *)v7 performAtomicAccessorBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)getIsoContryCodes
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10007A154;
  v9 = sub_10007A164;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007AA2C;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  v4[5] = &v5;
  [(VMTelephonyClient *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)voicemailPhoneNumber:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10007A154;
  id v14 = sub_10007A164;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007ABBC;
  v6[3] = &unk_1000C1208;
  uint64_t v7 = self;
  id v3 = a3;
  id v8 = v3;
  v9 = &v10;
  [(VMTelephonyClient *)v7 performAtomicAccessorBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007AD50;
  v9[3] = &unk_1000C11E0;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(VMTelephonyClient *)self performAtomicDelegateBlock:v9];
}

- (void)removeDelegate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007AE48;
  v4[3] = &unk_1000C11B8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VMTelephonyClient *)v5 performAtomicDelegateBlock:v4];
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
    [v5 handleFailureInMethod:a2, self, @"VMTelephonyClient.m", 210, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (void)performAtomicDelegateBlock:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v6[2]();
    os_unfair_lock_unlock(&self->_delegateLock);
  }
  else
  {
    uint64_t v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"VMTelephonyClient.m", 222, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (id)fetchSubscriptions
{
  id v8 = 0;
  id v2 = [(VMTelephonyClient *)self getSubscriptionInfoWithError:&v8];
  id v3 = v8;
  id v4 = [v2 subscriptionsValid];

  if (v4 || ([v3 domain], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    uint64_t v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrieving subscriptions %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100081D50();
    }
  }

  return v4;
}

- (id)fetchContexts
{
  id v8 = 0;
  id v2 = [(VMTelephonyClient *)self getActiveContexts:&v8];
  id v3 = v8;
  id v4 = v3;
  if (v2 || ([v3 domain], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    uint64_t v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrieving contexts %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100081DB8();
    }
  }

  return v2;
}

- (id)fetchIsoCountryCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 context];
  id v13 = 0;
  id v6 = [(VMTelephonyClient *)self getMobileSubscriberHomeCountryList:v5 error:&v13];
  id v7 = v13;

  if (!v6 || ![v6 count])
  {
    v9 = vm_vmd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100081E20();
    }
    goto LABEL_12;
  }
  id v8 = [v6 firstObject];
  if (![v8 length])
  {
    id v10 = vm_vmd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Retrieved <empty> ISO country code for %@.", buf, 0xCu);
    }

    v9 = v8;
LABEL_12:
    id v8 = 0;
LABEL_13:

    goto LABEL_14;
  }
  if (v8)
  {
    v9 = vm_vmd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrieved ISO country code '%@' for %@.", buf, 0x16u);
    }
    goto LABEL_13;
  }
LABEL_14:
  id v11 = v8;

  return v11;
}

- (id)fetchCountryCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 context];
  id v12 = 0;
  id v6 = [(VMTelephonyClient *)self copyLastKnownMobileSubscriberCountryCode:v5 error:&v12];
  id v7 = v12;

  id v8 = [v7 domain];

  v9 = vm_vmd_log();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100081E88();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Retrieved country code '%@' for %@", buf, 0x16u);
  }

  return v6;
}

- (id)fetchNetworkCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 context];
  id v12 = 0;
  id v6 = [(VMTelephonyClient *)self copyMobileSubscriberNetworkCode:v5 error:&v12];
  id v7 = v12;

  id v8 = [v7 domain];

  v9 = vm_vmd_log();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100081EF0();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Retrieved network code '%@' for %@", buf, 0x16u);
  }

  return v6;
}

- (id)fetchVoicemailPhoneNumber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 context];
  id v11 = 0;
  id v6 = [(VMTelephonyClient *)self getVoicemailCallInDetails:v5 outError:&v11];
  id v7 = v11;

  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:kCTVVMNumberKey];
    v9 = vm_vmd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrieved call-in phoneNumber [%@] for %@", buf, 0x16u);
    }
  }
  else
  {
    v9 = vm_vmd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100081F58();
    }
    id v8 = 0;
  }

  return v8;
}

- (void)subscriptionInfoDidChange
{
  id v3 = [(VMTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Subscription information has changed; updating the cached list of subscriptions.",
      buf,
      2u);
  }

  uint64_t v5 = [(VMTelephonyClient *)self fetchSubscriptions];
  *(void *)buf = 0;
  id v12 = buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007B9D0;
  v7[3] = &unk_1000C1208;
  id v6 = v5;
  id v8 = v6;
  v9 = self;
  id v10 = buf;
  [(VMTelephonyClient *)self performAtomicAccessorBlock:v7];
  if (v12[24]) {
    [(VMTelephonyClient *)self performSelectorOnDelegates:"subscriptionDataOnlyDidChange"];
  }

  _Block_object_dispose(buf, 8);
}

- (void)activeSubscriptionsDidChange
{
  id v3 = [(VMTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Active context information has changed; updating the cached list of active contexts.",
      buf,
      2u);
  }

  [(VMTelephonyClient *)self fetchContexts];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_10007BEF4;
  v9 = &unk_1000C11B8;
  id v10 = self;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v11;
  [(VMTelephonyClient *)self performAtomicAccessorBlock:&v6];
  -[VMTelephonyClient performSelectorOnDelegates:](self, "performSelectorOnDelegates:", "activeSubscriptionsDidChange", v6, v7, v8, v9, v10);
}

- (void)subscriberCountryCodeDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(VMTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10007C0A0;
  id v11 = &unk_1000C11B8;
  id v12 = self;
  id v6 = v4;
  id v13 = v6;
  [(VMTelephonyClient *)self performAtomicAccessorBlock:&v8];
  uint64_t v7 = vm_vmd_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ISO country code has changed for subscription %@; updating the cached list of subscriptions.",
      buf,
      0xCu);
  }

  -[VMTelephonyClient performSelectorOnDelegates:withObject:](self, "performSelectorOnDelegates:withObject:", "subscriberCountryCodeDidChange:", v6, v8, v9, v10, v11, v12);
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  id v5 = [(VMTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10007C258;
  id v11 = &unk_1000C11B8;
  id v12 = self;
  id v6 = v4;
  id v13 = v6;
  [(VMTelephonyClient *)self performAtomicAccessorBlock:&v8];
  uint64_t v7 = vm_vmd_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CB changed for %@", buf, 0xCu);
  }

  -[VMTelephonyClient performSelectorOnDelegates:withObject:](self, "performSelectorOnDelegates:withObject:", "carrierBundleChange:", v6, v8, v9, v10, v11, v12);
}

- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007C384;
  v12[3] = &unk_1000C3558;
  id v13 = self;
  id v14 = a3;
  BOOL v18 = a4;
  int64_t v15 = a5;
  int64_t v16 = a6;
  int64_t v17 = a7;
  id v11 = v14;
  [(VMTelephonyClient *)v13 performAtomicDelegateBlock:v12];
}

- (void)connectionAvailability:(id)a3 availableConnections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = vm_vmd_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connectionAvailability changed for %@", (uint8_t *)&v9, 0xCu);
  }

  [(VMTelephonyClient *)self performSelectorOnDelegates:"connectionAvailability:availableConnections:" withObject:v6 withObject:v7];
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = vm_vmd_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "connectionStateChanged changed for %@", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007C798;
  v13[3] = &unk_1000C1D08;
  v13[4] = self;
  id v14 = v8;
  int v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(VMTelephonyClient *)self performAtomicDelegateBlock:v13];
}

- (void)smsReadyStateChanged:(id)a3 info:(BOOL)a4
{
  id v6 = a3;
  id v7 = vm_vmd_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "smsReadyStateChanged changed for %@", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007CAA0;
  v9[3] = &unk_1000C2650;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [(VMTelephonyClient *)self performAtomicDelegateBlock:v9];
}

- (void)postSmscAddressAvailable:(id)a3 smsc:(id)a4
{
}

- (void)performSelectorOnDelegates:(SEL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10007CCEC;
  v3[3] = &unk_1000C1DD0;
  v3[4] = self;
  v3[5] = a3;
  [(VMTelephonyClient *)self performAtomicDelegateBlock:v3];
}

- (void)performSelectorOnDelegates:(SEL)a3 withObject:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007CF30;
  v7[3] = &unk_1000C2038;
  id v8 = a4;
  SEL v9 = a3;
  void v7[4] = self;
  id v6 = v8;
  [(VMTelephonyClient *)self performAtomicDelegateBlock:v7];
}

- (void)performSelectorOnDelegates:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007D1BC;
  v9[3] = &unk_1000C25B0;
  id v10 = self;
  id v11 = a4;
  id v12 = a5;
  SEL v13 = a3;
  id v7 = v12;
  id v8 = v11;
  [(VMTelephonyClient *)v10 performAtomicDelegateBlock:v9];
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (os_unfair_lock_s)delegateLock
{
  return self->_delegateLock;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)cached_subscriptions
{
  return self->_cached_subscriptions;
}

- (void)setCached_subscriptions:(id)a3
{
}

- (CTXPCContexts)cached_contexts
{
  return self->_cached_contexts;
}

- (void)setCached_contexts:(id)a3
{
}

- (NSMapTable)cached_iso
{
  return self->_cached_iso;
}

- (void)setCached_iso:(id)a3
{
}

- (NSString)cached_mcc
{
  return self->_cached_mcc;
}

- (void)setCached_mcc:(id)a3
{
}

- (NSString)cached_mnc
{
  return self->_cached_mnc;
}

- (void)setCached_mnc:(id)a3
{
}

- (NSMapTable)cached_vmnumber
{
  return self->_cached_vmnumber;
}

- (void)setCached_vmnumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_vmnumber, 0);
  objc_storeStrong((id *)&self->_cached_mnc, 0);
  objc_storeStrong((id *)&self->_cached_mcc, 0);
  objc_storeStrong((id *)&self->_cached_iso, 0);
  objc_storeStrong((id *)&self->_cached_contexts, 0);
  objc_storeStrong((id *)&self->_cached_subscriptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
}

@end