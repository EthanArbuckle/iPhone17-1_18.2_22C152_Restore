void sub_100002CE0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  if (v3)
  {
    v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000C39C();
    }
  }
  else
  {
    v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished initial load, resetting timer.", v9, 2u);
    }

    [*(id *)(a1 + 32) resetTimer];
  }
  v6 = +[WLKSettingsStore sharedSettings];
  v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 64);
  *(void *)(v7 + 64) = v6;

  [*(id *)(a1 + 32) _setupObservers];
}

void sub_100002ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002EF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TV app settings changed, removing any disconnected user accounts", v3, 2u);
  }

  [WeakRetained _removeNonConnectedSignedOutUserAccounts];
}

void sub_100003024(uint64_t a1)
{
  lock._uint32_t os_unfair_lock_opaque = [*(id *)(a1 + 32) loadingStoresLock];
  os_unfair_lock_lock(&lock);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000339C;
  v26[3] = &unk_100014518;
  uint32_t os_unfair_lock_opaque = lock._os_unfair_lock_opaque;
  id v27 = *(id *)(a1 + 40);
  v2 = objc_retainBlock(v26);
  if (![*(id *)(a1 + 32) storesLoaded])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v3 = objc_alloc_init((Class)VSSemaphore);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100003400;
    v23 = sub_100003410;
    id v24 = 0;
    v4 = [*(id *)(a1 + 32) container];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100003418;
    v15[3] = &unk_100014540;
    objc_copyWeak(&v18, &location);
    v17 = &v19;
    id v5 = v3;
    id v16 = v5;
    [v4 loadPersistentStoresWithCompletionHandler:v15];

    [v5 wait];
    if ([*(id *)(a1 + 32) storesLoaded])
    {
      v6 = [*(id *)(a1 + 32) preferences];
      unsigned int v7 = [v6 performedSubcriptionToUserAccountMigration];

      if (!v7)
      {
        v10 = VSDefaultLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Migration not performed, will fetch subscriptions for migration...", buf, 2u);
        }

        v11 = *(void **)(a1 + 32);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100003514;
        v12[3] = &unk_100014590;
        v12[4] = v11;
        v13 = v2;
        [v11 _subscriptionsForMigrationWithCompletion:v12];

        goto LABEL_13;
      }
      v8 = VSDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Migration already performed, skipping.", buf, 2u);
      }

      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = v20[5];
    }
    ((void (*)(void *, uint64_t))v2[2])(v2, v9);
LABEL_13:

    objc_destroyWeak(&v18);
    _Block_object_dispose(&v19, 8);

    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  ((void (*)(void *, void))v2[2])(v2, 0);
LABEL_14:
}

void sub_100003358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  objc_destroyWeak(v24);
  _Block_object_dispose(&a24, 8);
  objc_destroyWeak((id *)(v25 - 136));
  _Unwind_Resume(a1);
}

void sub_10000339C(uint64_t a1, void *a2)
{
  id v4 = a2;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

uint64_t sub_100003400(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003410(uint64_t a1)
{
}

void sub_100003418(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      unsigned int v7 = VSErrorLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000C404();
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    }
    else
    {
      v8 = VSDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finished loading persistent stores successfully.", v9, 2u);
      }

      [WeakRetained setStoresLoaded:1];
    }
  }
  [*(id *)(a1 + 32) signal];
}

void sub_100003514(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if ([v5 count])
  {
    int v21 = a2;
    v6 = +[NSValueTransformer valueTransformerForName:VSSubscriptionValueTransformerName];
    id v7 = objc_alloc_init((Class)VSWaitGroup);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v22 = v5;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v13 = [v6 transformedValue:v12];

          if (!v13) {
            +[NSException raise:NSInvalidArgumentException format:@"The [subscriptionTransformer transformedValue:migrationSubscription] parameter must not be nil."];
          }
          v14 = [v6 transformedValue:v12];
          [v7 enter];
          v15 = [*(id *)(a1 + 32) createSaveContext];
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1000037F8;
          v25[3] = &unk_100014568;
          uint64_t v16 = *(void *)(a1 + 32);
          id v26 = v15;
          uint64_t v27 = v16;
          id v28 = v14;
          id v29 = v7;
          id v17 = v14;
          id v18 = v15;
          [v18 performBlock:v25];
        }
        id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v9);
    }

    [v7 wait];
    id v5 = v22;
    a2 = v21;
  }
  if (a2)
  {
    uint64_t v19 = VSDefaultLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Marking migration as completed.", buf, 2u);
    }

    v20 = [*(id *)(a1 + 32) preferences];
    [v20 setPerformedSubcriptionToUserAccountMigration];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000037F8(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "performing migration user account insertion...", buf, 2u);
  }

  uint64_t v3 = [[VSPersistentUserAccount alloc] initWithContext:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _populatePersistentUserAccount:v3 withUserAccount:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "saving migrated persistent account: %@", buf, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v10 = 0;
  unsigned __int8 v7 = [v5 saveContext:v6 withError:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    id v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000C46C();
    }
  }
  [*(id *)(a1 + 56) leave];
}

void sub_100003988(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v2 = objc_begin_catch(exception_object);
      uint64_t v3 = VSErrorLogObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        sub_10000C4D4();
      }

      objc_end_catch();
      JUMPOUT(0x100003934);
    }
    objc_begin_catch(exception_object);
    JUMPOUT(0x100003938);
  }
  _Unwind_Resume(exception_object);
}

void sub_100003CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100003CC8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migration delegate block invoked with completion status %d subscriptions %@", (uint8_t *)v10, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  [*(id *)(a1 + 32) leave];
}

void sub_100003EA8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) prepareUserAccountsToVend:a2 withSecurityTask:*(void *)(a1 + 40)];
  id v10 = *(id *)(a1 + 48);
  id v9 = v6;
  id v7 = v5;
  id v8 = v6;
  VSPerformCompletionHandler();
}

uint64_t sub_100003F84(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100004154(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) prepareUserAccountsToVend:a2 withSecurityTask:*(void *)(a1 + 40)];
  id v10 = *(id *)(a1 + 48);
  id v9 = v6;
  id v7 = v5;
  id v8 = v6;
  VSPerformCompletionHandler();
}

uint64_t sub_100004230(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_100004724(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100004738(uint64_t a1)
{
  if (([*(id *)(a1 + 32) shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) signingIdentifier];
    id v3 = [objc_alloc((Class)VSBundleRecord) initWithBundleID:v2];
    id v4 = v3;
    if (v3)
    {
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = [v3 bundleVersion];
      [v5 setModifierIdentifier:v6];
    }
    [*(id *)(a1 + 40) setModifierType:VSMetricAccountUpdateValueModifierTypeApp];
  }
  id v10 = VSMetricAccountUpdateValueWriteTypeUpdate;
  if ([*(id *)(a1 + 40) isSignedOut])
  {
    id v7 = VSMetricAccountUpdateValueWriteTypeRemove;

    id v10 = v7;
  }
  id v8 = *(void **)(a1 + 40);
  id v9 = [v8 modifierIdentifier];
  +[VSMetricsManagerObjC recordAccountUpdateWithAccount:v8 source:v9 updateType:v10 completion:0];
}

void sub_100004880(uint64_t a1, void *a2)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000499C;
  v9[3] = &unk_1000146D0;
  id v10 = *(id *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 64);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v11 = v4;
  uint64_t v12 = v5;
  id v13 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004C6C;
  v7[3] = &unk_1000146F8;
  id v8 = *(id *)(a1 + 56);
  [a2 unwrapObject:v9 error:v7];
}

void sub_10000499C(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 identityProviderID];
    uint64_t v6 = [v5 forceUnwrapObject];
    unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)];

    if (v7)
    {
      if (*(unsigned char *)(a1 + 64))
      {
        id v8 = [v4 legacyItemHash];

        if (!v8) {
          +[NSException raise:NSInvalidArgumentException format:@"The [account legacyItemHash] parameter must not be nil."];
        }
        id v9 = [v4 legacyItemHash];
        id v10 = VSDefaultLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Associating user account with keychain hash %@", buf, 0xCu);
        }

        [*(id *)(a1 + 40) setKeychainItemHash:[v9 unsignedIntegerValue]];
        [*(id *)(a1 + 48) insertUserAccount:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
        goto LABEL_13;
      }
    }
  }
  id v11 = VSErrorLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10000C68C();
  }

  uint64_t v12 = *(void **)(a1 + 56);
  if (v12)
  {
    id v13 = v12;
    VSPerformCompletionHandler();
    id v9 = v13;
LABEL_13:
  }
}

void sub_100004BA0(uint64_t a1)
{
  VSPublicError();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 bundleIdentifier];

  if (v3
    && (+[VSLSApplicationRecord isAppStoreVendableForBundleIdentifier:v3] & 1) == 0)
  {
    +[NSException raise:@"VSExceptionProviderMismatch" format:@"Not currently signed in to a provider matching the one indicated by the user account"];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004C6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000C6C0();
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = VSPublicError();
    id v7 = *(id *)(a1 + 32);
    id v6 = v5;
    VSPerformCompletionHandler();
  }
}

uint64_t sub_100004D68(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100004D7C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100004F64(uint64_t a1)
{
  if (([*(id *)(a1 + 32) shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) signingIdentifier];
    id v3 = [objc_alloc((Class)VSBundleRecord) initWithBundleID:v2];
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = *(void **)(a1 + 40);
      id v6 = [v3 bundleVersion];
      [v5 setModifierIdentifier:v6];
    }
    [*(id *)(a1 + 40) setModifierType:VSMetricAccountUpdateValueModifierTypeApp];
  }
  id v7 = *(void **)(a1 + 40);
  id v8 = [v7 modifierIdentifier];
  +[VSMetricsManagerObjC recordAccountUpdateWithAccount:v7 source:v8 updateType:VSMetricAccountUpdateValueWriteTypeRemove completion:0];
}

void sub_100005070(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  VSPublicError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_1000050D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000C728();
    }

    id v6 = [v4 copy];
    id v7 = VSPublicError();
  }
  else
  {
    id v7 = 0;
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v10 = v8;
    id v9 = v7;
    VSPerformCompletionHandler();
  }
}

uint64_t sub_1000051EC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000053D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_1000053F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setCurrentUpdateSessionIsForced:1];
    [v3 _update];
  }
  id v4 = *(id *)(a1 + 32);
  VSPerformCompletionHandler();
}

uint64_t sub_1000054A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000054B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000056A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_1000056C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setCurrentUpdateSessionIsForced:1];
    [v3 _forceRefreshAccount:*(void *)(a1 + 32)];
  }
  id v4 = *(id *)(a1 + 40);
  VSPerformCompletionHandler();
}

uint64_t sub_100005778(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000578C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000586C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  VSPerformCompletionHandler();
}

uint64_t sub_100005910(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_1000059CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    id v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000C7F8();
    }

    id v6 = [v4 copy];
    id v7 = VSPublicError();
  }
  else
  {
    id v7 = 0;
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v10 = v8;
    id v9 = v7;
    VSPerformCompletionHandler();
  }
}

uint64_t sub_100005AE0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100005C1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v45 = a1;
    id v46 = v6;
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    id v52 = objc_alloc_init((Class)NSMutableDictionary);
    id v49 = objc_alloc_init((Class)NSMutableArray);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v64 objects:v72 count:16];
    v51 = v8;
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v65;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v65 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          v15 = [v14 subscriptionBillingCycleEndDate];
          if (v15)
          {
            uint64_t v16 = [v14 subscriptionBillingCycleEndDate];
            id v17 = +[NSDate now];
            unsigned int v18 = [v16 vs_isAfter:v17];

            id v8 = v51;
          }
          else
          {
            unsigned int v18 = 1;
          }

          if (([v14 isSignedOut] & 1) == 0
            && v18
            && [v14 sourceType] != (id)2)
          {
            id v19 = [v14 sourceType];
            v20 = [v14 sourceIdentifier];
            int v21 = +[NSString stringWithFormat:@"%ld%@", v19, v20];

            [v49 addObject:v21];
            if ([v14 isFromCurrentDevice])
            {
              [v52 setObject:v14 forKeyedSubscript:v21];
              id v8 = v51;
            }
            else
            {
              id v8 = v51;
              id v22 = [v51 objectForKeyedSubscript:v21];
              if (!v22) {
                id v22 = objc_alloc_init((Class)NSMutableArray);
              }
              [v22 addObject:v14];
              [v51 setObject:v22 forKeyedSubscript:v21];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v11);
    }
    id v47 = v5;

    id v23 = objc_alloc_init((Class)NSMutableArray);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v49;
    id v24 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v61;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
          id v29 = [v8 objectForKeyedSubscript:v28];
          long long v30 = [v52 objectForKeyedSubscript:v28];
          if (v30)
          {
            [v23 addObject:v30];
          }
          else if ([v29 count])
          {
            long long v31 = [v29 firstObject];

            if (!v31) {
              +[NSException raise:NSInvalidArgumentException format:@"The [nonLocalAccounts firstObject] parameter must not be nil."];
            }
            long long v32 = [v29 firstObject];
            [v23 addObject:v32];

            id v8 = v51;
          }
        }
        id v25 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
      }
      while (v25);
    }

    id v50 = objc_alloc_init((Class)NSMutableArray);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v33 = v23;
    id v34 = [v33 countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v57;
      uint64_t v37 = VSSubscriptionValueTransformerName;
      do
      {
        for (k = 0; k != v35; k = (char *)k + 1)
        {
          if (*(void *)v57 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v39 = *(void *)(*((void *)&v56 + 1) + 8 * (void)k);
          v40 = +[NSValueTransformer valueTransformerForName:v37];
          v41 = [v40 reverseTransformedValue:v39];
          if (v41)
          {
            [v50 addObject:v41];
          }
          else
          {
            v42 = VSErrorLogObject();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v69 = v39;
              _os_log_fault_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "Error transforming user account to subscription: %@", buf, 0xCu);
            }
          }
        }
        id v35 = [v33 countByEnumeratingWithState:&v56 objects:v70 count:16];
      }
      while (v35);
    }

    id v55 = *(id *)(v45 + 32);
    id v43 = v50;
    VSPerformCompletionHandler();

    id v7 = v46;
    id v5 = v47;
    v44 = v51;
  }
  else
  {
    id v54 = *(id *)(a1 + 32);
    id v53 = v7;
    VSPerformCompletionHandler();

    v44 = v54;
  }
}

uint64_t sub_100006254(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t sub_10000626C(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Legacy API - Found no active subscriptions.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100006990(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _updateRequestForAccount:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) timer];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) timer];

      if (!v4) {
        +[NSException raise:NSInvalidArgumentException format:@"The [self timer] parameter must not be nil."];
      }
      id v5 = [*(id *)(a1 + 32) timer];
      dispatch_source_cancel(v5);
    }
    id v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "1 update request will be enqueued.", v10, 2u);
    }

    id v7 = *(void **)(a1 + 32);
    id v11 = v2;
    id v8 = +[NSArray arrayWithObjects:&v11 count:1];
    [v7 _setUpdateRequestManagerWithRequests:v8];
  }
  else
  {
    id v9 = VSDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User account did not qualify for force refresh.", v10, 2u);
    }

    [*(id *)(a1 + 32) setCurrentUpdateSessionIsForced:0];
  }
}

void sub_100006BC4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) timer];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) timer];

    if (!v3) {
      +[NSException raise:NSInvalidArgumentException format:@"The [self timer] parameter must not be nil."];
    }
    id v4 = [*(id *)(a1 + 32) timer];
    dispatch_source_cancel(v4);
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = +[NSDate now];
  [v5 setLastUpdateTime:v6];

  id v7 = [*(id *)(a1 + 32) _predicateForUserAccountWithNonnullUpdateURL];
  id v8 = *(void **)(a1 + 32);
  id v9 = [v8 createSaveContext];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_100006D10;
  v10[3] = &unk_1000147E8;
  v10[4] = *(void *)(a1 + 32);
  [v8 _queryUserAccountsWithPredicate:v7 context:v9 completion:v10];
}

void sub_100006D10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_100006EA8;
  id v13 = &unk_1000147C0;
  uint64_t v14 = *(void *)(a1 + 32);
  id v5 = v4;
  id v15 = v5;
  [v3 enumerateObjectsUsingBlock:&v10];

  id v6 = [v5 count:v10, v11, v12, v13, v14];
  id v7 = VSDefaultLogObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = [v5 count];
      *(_DWORD *)buf = 134217984;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%lu update requests will be enqueued.", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _setUpdateRequestManagerWithRequests:v5];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No user accounts qualified for update, will not enqueue any update requests.", buf, 2u);
    }

    [*(id *)(a1 + 32) resetTimer];
  }
}

uint64_t sub_100006EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _updateRequestForAccount:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return _objc_release_x1();
}

void sub_100006F78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000C860();
    }

    id v5 = +[NSNumber numberWithDouble:43200.0];
  }
  [v5 doubleValue];
  uint64_t v9 = v8;
  id v10 = [*(id *)(a1 + 32) privateQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007090;
  v11[3] = &unk_100014888;
  v11[4] = *(void *)(a1 + 32);
  v11[5] = v9;
  [v10 addOperationWithBlock:v11];
}

void sub_100007090(uint64_t a1)
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100003400;
  unsigned int v18 = sub_100003410;
  id v19 = [*(id *)(a1 + 32) timer];
  uint64_t v2 = v15[5];
  if (v2) {
    dispatch_source_cancel(v2);
  }
  uint64_t v3 = [*(id *)(a1 + 32) _predicateForIsSignedOut:0];
  id v4 = [*(id *)(a1 + 32) _predicateForUserAccountWithNonnullUpdateURL];
  id v5 = [*(id *)(a1 + 32) _predicateForUserAccountWithNonnullBillingCycleEndDate];
  v21[0] = v3;
  v21[1] = v4;
  v21[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v21 count:3];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  uint64_t v8 = [*(id *)(a1 + 32) _sortForUserAccountBillingCycleEndDateASC:1];
  uint64_t v9 = *(void **)(a1 + 32);
  v20 = v8;
  id v10 = +[NSArray arrayWithObjects:&v20 count:1];
  uint64_t v11 = [*(id *)(a1 + 32) createSaveContext];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007300;
  v13[3] = &unk_100014860;
  uint64_t v12 = *(void *)(a1 + 32);
  v13[6] = *(void *)(a1 + 40);
  v13[4] = v12;
  v13[5] = &v14;
  [v9 _queryUserAccountsWithPredicate:v7 sorts:v10 fetchLimit:&off_100014FD0 context:v11 completion:v13];

  _Block_object_dispose(&v14, 8);
}

void sub_1000072CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007300(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v25 = a3;
  id v5 = [v24 firstObject];
  id v6 = [v5 subscriptionBillingCycleEndDate];

  id v7 = VSDefaultLogObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      double v29 = *(double *)&v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Soonest expiring account is: %@", buf, 0xCu);
    }

    id v7 = [*(id *)(a1 + 32) lastUpdateTime];
    if (!v7)
    {
      id v7 = +[NSDate distantPast];
    }
    uint64_t v9 = [v7 dateByAddingTimeInterval:*(double *)(a1 + 48)];
    [v6 vs_dateIncrementedByMinutes:1];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v10;
    if (objc_msgSend(v9, "vs_isAfter:", v10))
    {
      uint64_t v12 = VSDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v29 = *(double *)&v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Next refresh time is within update frequency limit, using frequency limit time: %@", buf, 0xCu);
      }

      id v11 = v9;
    }
    id v13 = +[NSDate now];
    [v11 timeIntervalSinceDate:v13];
    double v15 = v14;

    uint64_t v16 = VSDefaultLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      double v29 = v15;
      __int16 v30 = 2112;
      id v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "refresh expiry timer will fire in %f seconds (%@)", buf, 0x16u);
    }

    id v17 = [*(id *)(a1 + 32) privateQueue];
    unsigned int v18 = [v17 underlyingQueue];
    dispatch_source_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v18);
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    int v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    dispatch_time_t v22 = dispatch_time(0, 1000000000 * (unint64_t)v15);
    dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v22, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v23 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100007700;
    handler[3] = &unk_100014838;
    objc_copyWeak(&v27, (id *)buf);
    dispatch_source_set_event_handler(v23, handler);
    [*(id *)(a1 + 32) setTimer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    dispatch_activate(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No subscriptions that qualify for expiration. Not setting up schedule.", buf, 2u);
  }
}

void sub_1000076DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007700(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Schedule timer fired.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _update];
  }
}

uint64_t sub_100007858(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000078F4(uint64_t a1)
{
  uint64_t v2 = +[WLKChannelManager defaultChannelManager];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007988;
  v3[3] = &unk_100014928;
  v3[4] = *(void *)(a1 + 32);
  [v2 vppaConsentedBundleIDsWithCompletion:v3];
}

void sub_100007988(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = v5;
    BOOL v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Consented Bundle IDs: %@", buf, 0xCu);
    }

    uint64_t v9 = [*(id *)(a1 + 32) _predicateForIsSignedOut:1];
    id v10 = *(void **)(a1 + 32);
    id v11 = [v10 createSaveContext];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100007B6C;
    v14[3] = &unk_100014900;
    uint64_t v12 = *(void *)(a1 + 32);
    id v15 = v7;
    uint64_t v16 = v12;
    id v13 = v7;
    [v10 _queryUserAccountsWithPredicate:v9 context:v11 completion:v14];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v9 = VSDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Could not fetch VPPA-Consented and Connected bundleIDs: %@", buf, 0xCu);
    }
  }

LABEL_6:
}

void sub_100007B6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v9 sourceIdentifier:v15];
        if (([*(id *)(a1 + 32) containsObject:v10] & 1) == 0)
        {
          id v11 = VSDefaultLogObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = [v9 sourceIdentifier];
            *(_DWORD *)buf = v15;
            dispatch_time_t v22 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing Signed Out User Account that is Not Connected: %@", buf, 0xCu);
          }
          id v13 = *(void **)(a1 + 40);
          double v14 = [v13 createSaveContext];
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100007D74;
          v16[3] = &unk_1000144C8;
          v16[4] = v9;
          [v13 _deleteUserAccount:v9 context:v14 completion:v16];
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }
}

void sub_100007D74(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000C8C8(a1, (uint64_t)v3, v4);
    }
  }
}

void sub_10000807C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100008098(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error checking for Existing Persistent User Account: %@", buf, 0xCu);
    }
  }
  if ([v5 count])
  {
    BOOL v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000825C;
    v12[3] = &unk_100014950;
    uint64_t v14 = *(void *)(a1 + 64);
    id v13 = *(id *)(a1 + 48);
    [v8 _deduplicatePersistentUserAccounts:v5 context:v9 completion:v12];
  }
  else if (![v5 count])
  {
    id v10 = VSDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New User Account to Insert: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 48) leave];
  }
}

void sub_10000825C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error deduplicating Existing Persistent User Account: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  BOOL v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found matching existing persistent user account to update.", (uint8_t *)&v12, 2u);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  [*(id *)(a1 + 32) leave];
}

void sub_100008390(uint64_t a1)
{
  uint64_t v2 = (VSPersistentUserAccount *)*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v2)
  {
    id v3 = v2;
    id v4 = VSDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found matching existing persistent user account to update.", buf, 2u);
    }
  }
  else
  {
    id v3 = [[VSPersistentUserAccount alloc] initWithContext:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) _populatePersistentUserAccount:v3 withUserAccount:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (!v5 || [v5 signedOut])
  {
    id v6 = +[NSDate now];
    [(VSPersistentUserAccount *)v3 setCreated:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 56) signingIdentifier];
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = v7;
    if ((+[VSLSApplicationRecord isAppStoreVendableForBundleIdentifier:](VSLSApplicationRecord, "isAppStoreVendableForBundleIdentifier:", v9) & 1) == 0&& (+[VSLSApplicationRecord isDeletableForBundleIdentifier:](VSLSApplicationRecord, "isDeletableForBundleIdentifier:", v9) & 1) != 0|| [*(id *)(a1 + 48) isDeveloperCreated])
    {
      [(VSPersistentUserAccount *)v3 setDeveloper:1];
    }
  }
  id v10 = +[VSDevice currentDevice];
  uint64_t v11 = [v10 name];
  [(VSPersistentUserAccount *)v3 setDeviceName:v11];

  uint64_t v13 = *(void *)(a1 + 32);
  int v12 = *(void **)(a1 + 40);
  id v17 = 0;
  LOBYTE(v11) = [v12 saveContext:v13 withError:&v17];
  id v14 = v17;
  if (v11)
  {
    [*(id *)(a1 + 40) resetTimer];
    long long v15 = [*(id *)(a1 + 40) remoteNotifier];
    [v15 postNotification];

    if (([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) signedOut] & 1) == 0
      && [*(id *)(a1 + 48) isSignedOut])
    {
      [*(id *)(a1 + 40) _removeNonConnectedSignedOutUserAccounts];
    }
  }
  else
  {
    id v16 = VSErrorLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000CA24();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_1000085EC(void *exc_buf, int a2)
{
  if (a2 == 2)
  {
    id v3 = objc_begin_catch(exc_buf);
    id v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_10000C9BC();
    }

    VSPublicError();
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
  }
  else
  {
    objc_begin_catch(exc_buf);
  }
  JUMPOUT(0x100008598);
}

void sub_100008804(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000CA8C();
    }

    id v8 = v6;
  }
  else if ([v5 count])
  {
    id v9 = v5;
    goto LABEL_8;
  }
  id v9 = 0;
LABEL_8:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008938;
  v14[3] = &unk_100014608;
  id v10 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = v11;
  id v15 = v9;
  id v12 = v6;
  id v13 = v9;
  [v10 performBlock:v14];
}

uint64_t sub_100008938(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100008CA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_100008CD0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to delete duplicate persistent user account: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

void sub_100008F04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000CBB0();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (v5)
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      uint64_t v8 = VSErrorLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10000CB28(v5, v8);
      }
    }
    id v9 = [v5 firstObject];
    if (v9)
    {
      [*(id *)(a1 + 32) _deletePersistentUserAccount:v9 withContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }
    else
    {
      id v10 = VSErrorLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000CAF4();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void sub_100009120(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) sourceIdentifier];
    *(_DWORD *)buf = 138412290;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Going to delete account: %@", buf, 0xCu);
  }
  [*(id *)(a1 + 40) deleteObject:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v13 = 0;
  unsigned __int8 v6 = [v4 saveContext:v5 withError:&v13];
  id v7 = v13;
  if (v6)
  {
    uint64_t v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Success Delete: Posting Notification", buf, 2u);
    }

    id v9 = [*(id *)(a1 + 48) remoteNotifier];
    [v9 postNotification];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000CC18();
    }

    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = VSPublicError();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void sub_1000093E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(a1 + 32) _userAccountForPersistentUserAccount:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11) context:*(void *)(a1 + 40) userAccountID:v13];
          [v6 addObject:v12];

          uint64_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1000096A0(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1[4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000097A8;
  v6[3] = &unk_100014A68;
  id v7 = v3;
  id v12 = a1[8];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v11 = a1[4];
  id v5 = v3;
  [v4 performBlock:v6];
}

void sub_1000097A8(void *a1)
{
  if (a1[4])
  {
    VSPublicError();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[9] + 16))();
  }
  else
  {
    uint64_t v2 = +[VSPersistentUserAccount fetchRequest];
    [v2 setIncludesPendingChanges:0];
    [v2 setPredicate:a1[5]];
    [v2 setSortDescriptors:a1[6]];
    id v3 = (void *)a1[7];
    if (v3) {
      [v2 setFetchLimit:[v3 unsignedIntegerValue]];
    }
    id v4 = VSDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v2 predicate];
      *(_DWORD *)buf = 138412290;
      id v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Using predicate for fetch request: %@", buf, 0xCu);
    }
    id v6 = (void *)a1[8];
    id v24 = 0;
    id v7 = [v6 executeFetchRequest:v2 error:&v24];
    id v8 = v24;
    if (v7)
    {
      id v9 = VSDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v7 count];
        *(_DWORD *)buf = 134218242;
        id v27 = v10;
        __int16 v28 = 2112;
        double v29 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrieved %lu persistent user accounts: %@", buf, 0x16u);
      }

      id v11 = objc_alloc_init((Class)NSMutableArray);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            [v11 addObject:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          }
          id v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v14);
      }

      id v17 = *(void (**)(void))(a1[9] + 16);
    }
    else
    {
      long long v18 = VSErrorLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10000CC80();
      }

      VSPublicError();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = *(void (**)(void))(a1[9] + 16);
    }
    v17();
  }
}

void sub_100009BFC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) updateURL];
  [v2 setUpdateURL:v3];

  [*(id *)(a1 + 32) setRequiresSystemTrust:[*(id *)(a1 + 40) requiresSystemTrust]];
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) accountProviderIdentifier];
  [v4 setProviderID:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) identifier];
  [v6 setAccountIdentifier:v7];

  [*(id *)(a1 + 32) setAccountType:[*(id *)(a1 + 40) accountType]];
  [*(id *)(a1 + 32) setSignedOut:[*(id *)(a1 + 40) isSignedOut]];
  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) subscriptionBillingCycleEndDate];
  [v8 setBillingCycleEndDate:v9];

  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) tierIdentifiers];
  [v10 setTierIdentifiers:v11];

  id v12 = *(void **)(a1 + 32);
  id v13 = [*(id *)(a1 + 40) billingIdentifier];
  [v12 setBillingIdentifier:v13];

  id v14 = *(void **)(a1 + 32);
  uint64_t v15 = [*(id *)(a1 + 40) authenticationData];
  [v14 setAuthenticationData:v15];

  [*(id *)(a1 + 32) setDeviceType:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setSourceType:[*(id *)(a1 + 40) sourceType]];
  long long v16 = *(void **)(a1 + 32);
  id v17 = [*(id *)(a1 + 40) sourceIdentifier];
  [v16 setSourceIdentifier:v17];

  long long v18 = *(void **)(a1 + 32);
  id v19 = [*(id *)(a1 + 40) deviceIdentifier];
  [v18 setDeviceIdentifier:v19];

  [*(id *)(a1 + 32) setKeychainItemHash:[*(id *)(a1 + 40) keychainItemHash]];
  long long v20 = *(void **)(a1 + 32);
  long long v21 = +[NSDate now];
  [v20 setModified:v21];

  [*(id *)(a1 + 32) setDeveloper:[*(id *)(a1 + 40) isDeveloperCreated]];
  long long v22 = *(void **)(a1 + 32);
  long long v23 = [*(id *)(a1 + 40) created];
  [v22 setCreated:v23];

  id v24 = *(void **)(a1 + 32);
  id v25 = [*(id *)(a1 + 40) deviceName];
  [v24 setDeviceName:v25];

  uint64_t v26 = *(void **)(a1 + 32);
  id v27 = [*(id *)(a1 + 40) appleSubscription];
  [v26 setAppleSubscription:v27];
}

void sub_10000A320(id *a1, void *a2)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v8 sourceType] == (id)2)
        {
          id v9 = [v8 sourceIdentifier];
          unsigned int v10 = [v9 isEqualToString:a1[4]];

          if (v10)
          {
            id v12 = a1[5];
            id v13 = [v8 billingCycleEndDate];
            [v12 setSubscriptionBillingCycleEndDate:v13];

            [a1[6] signal];
            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v11 = +[VSAccountStore sharedAccountStore];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000A52C;
  v14[3] = &unk_100014B98;
  id v15 = a1[4];
  id v16 = a1[5];
  id v17 = a1[6];
  [v11 fetchAccountsWithCompletionHandler:v14];

LABEL_12:
}

void sub_10000A52C(id *a1, void *a2)
{
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  uint64_t v6 = sub_10000A5E0;
  id v7 = &unk_100014B30;
  id v8 = a1[4];
  id v9 = a1[5];
  [a2 unwrapObject:&v4 error:&stru_100014B70];
  [a1[6] signal:v4, v5, v6, v7];
}

void sub_10000A5E0(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = [v5 identityProviderID];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000A6CC;
    v8[3] = &unk_100014B08;
    id v9 = *(id *)(a1 + 32);
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    id v7 = v5;
    [v6 conditionallyUnwrapObject:v8];
  }
}

void sub_10000A6CC(uint64_t a1, void *a2)
{
  if ([a2 isEqualToString:*(void *)(a1 + 32)])
  {
    id v3 = [*(id *)(a1 + 40) legacyItemHash];
    id v4 = [v3 unsignedIntegerValue];
    id v5 = [*(id *)(a1 + 48) keychainItemHash];

    if (v4 == v5)
    {
      uint64_t v6 = [*(id *)(a1 + 40) authenticationToken];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10000A7B4;
      v7[3] = &unk_100014AE0;
      id v8 = *(id *)(a1 + 48);
      [v6 conditionallyUnwrapObject:v7];
    }
  }
}

void sub_10000A7B4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 expirationDate];
  [v2 setSubscriptionBillingCycleEndDate:v3];
}

void sub_10000A80C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Could not get account for expiration: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000B7AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000D018();
    }
  }
  else
  {
    int v4 = VSDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully inserted updated account from JS refresh: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_10000BAD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000BAFC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000BB24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10000BB40(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000BB60(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Entering main() for videosubscriptionsd.", buf, 2u);
  }
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100014C00);
  uint64_t v1 = VSLoadBundleAtPath();
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Will load VideoSubscriberAccount framework.", buf, 2u);
    }
    id v10 = 0;
    unsigned int v4 = [v1 loadAndReturnError:&v10];
    id v5 = v10;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Did load VideoSubscriberAccount framework.", buf, 2u);
      }
      id v7 = objc_alloc_init(NSClassFromString(@"VSUserAccountService"));
      id v8 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.VideoSubscriberAccount.videosubscriptionsd"];
      [v8 setDelegate:v7];
      [v8 resume];
      uint64_t v9 = +[NSRunLoop currentRunLoop];
      [v9 run];

LABEL_12:
      exit(1);
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    uint64_t v2 = "Error loading framework: %@";
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v12 = 0;
    uint64_t v2 = "Unable to find framework using path: %@";
  }
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v2, buf, 0xCu);
  goto LABEL_12;
}

void sub_10000BDDC(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000D080();
  }
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    unsigned int v4 = string;
    if (!strcmp(string, "Application Installed") || !strcmp(v4, "Application Uninstalled"))
    {
      id v5 = +[NSNotificationCenter defaultCenter];
      [v5 postNotificationName:@"VSInstalledApplicationsDidChange" object:0];
    }
  }
}

void sub_10000C1AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000D0C8((uint64_t)v4, v5);
    }

    int v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void sub_10000C39C()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error performing initial load: %@", v2, v3, v4, v5, v6);
}

void sub_10000C404()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error loading persistent stores: %@", v2, v3, v4, v5, v6);
}

void sub_10000C46C()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error saving context after migration insertion: %@", v2, v3, v4, v5, v6);
}

void sub_10000C4D4()
{
  sub_10000BAF0();
  sub_10000BB24((void *)&_mh_execute_header, v0, v1, "Error saving after user account migration insertion: %@", v2, v3, v4, v5, v6);
}

void sub_10000C53C()
{
  sub_10000BB18();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Attempted to fetch migration data from nil delegate.", v1, 2u);
}

void sub_10000C57C()
{
  sub_10000BB18();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Timed out waiting for migration block invocation.", v1, 2u);
}

void sub_10000C5BC()
{
  sub_10000BAF0();
  sub_10000BB24((void *)&_mh_execute_header, v0, v1, "The entitlement to update the user account was not valid for bundleID: %@", v2, v3, v4, v5, v6);
}

void sub_10000C624()
{
  sub_10000BAF0();
  sub_10000BB24((void *)&_mh_execute_header, v0, v1, "Attempt to write user account with no device identifier: %@", v2, v3, v4, v5, v6);
}

void sub_10000C68C()
{
  sub_10000BB18();
  sub_10000BAFC((void *)&_mh_execute_header, v0, v1, "Not currently signed in to a provider matching the one indicated by the user account, denying.", v2, v3, v4, v5, v6);
}

void sub_10000C6C0()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error fetching accounts for user account validation: %@", v2, v3, v4, v5, v6);
}

void sub_10000C728()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error deleting user account: %@", v2, v3, v4, v5, v6);
}

void sub_10000C790()
{
  sub_10000BB18();
  sub_10000BAFC((void *)&_mh_execute_header, v0, v1, "Client not entitled for force refresh accounts.", v2, v3, v4, v5, v6);
}

void sub_10000C7C4()
{
  sub_10000BB18();
  sub_10000BAFC((void *)&_mh_execute_header, v0, v1, "Client not entitled for force refresh user account.", v2, v3, v4, v5, v6);
}

void sub_10000C7F8()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error inserting user account: %@", v2, v3, v4, v5, v6);
}

void sub_10000C860()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error fetching maximum update frequency from bag: %@", v2, v3, v4, v5, v6);
}

void sub_10000C8C8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to delete signed out non-connected user account: %@ - error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10000C954()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error Updating UserAccount with NO deviceID: %@", v2, v3, v4, v5, v6);
}

void sub_10000C9BC()
{
  sub_10000BAF0();
  sub_10000BB24((void *)&_mh_execute_header, v0, v1, "Error saving after user account insertion: %@", v2, v3, v4, v5, v6);
}

void sub_10000CA24()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error saving context after insertion: %@", v2, v3, v4, v5, v6);
}

void sub_10000CA8C()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error fetching existing persistent user account: %@", v2, v3, v4, v5, v6);
}

void sub_10000CAF4()
{
  sub_10000BB18();
  sub_10000BAFC((void *)&_mh_execute_header, v0, v1, "Did not find any persistent user accounts to delete.", v2, v3, v4, v5, v6);
}

void sub_10000CB28(void *a1, NSObject *a2)
{
  [a1 count];
  sub_10000BAF0();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Found %ld existing persistent user accounts that match the user account to delete.", v3, 0xCu);
}

void sub_10000CBB0()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error fetching persistent user account to delete: %@", v2, v3, v4, v5, v6);
}

void sub_10000CC18()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error saving context after deletion: %@", v2, v3, v4, v5, v6);
}

void sub_10000CC80()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error fetching persistent user accounts: %@", v2, v3, v4, v5, v6);
}

void sub_10000CCE8(void *a1)
{
  [a1 sourceType];
  sub_10000BAF0();
  sub_10000BB40((void *)&_mh_execute_header, v1, v2, "Invalid Update Query - Preventing Access For Non-Web SourceType: %ld", v3, v4, v5, v6, v7);
}

void sub_10000CD60()
{
  sub_10000BB18();
  sub_10000BAFC((void *)&_mh_execute_header, v0, v1, "Invalid Update Query - Preventing Access For Non-Internally-Entitled Client", v2, v3, v4, v5, v6);
}

void sub_10000CD94()
{
  sub_10000BB18();
  sub_10000BAFC((void *)&_mh_execute_header, v0, v1, "Invalid Update Query - No Bundle Identifier Found", v2, v3, v4, v5, v6);
}

void sub_10000CDC8(void *a1)
{
  uint64_t v1 = [a1 sourceIdentifier];
  sub_10000BAF0();
  sub_10000BB60((void *)&_mh_execute_header, v2, v3, "Invalid Update Query - Incorrect Source Identifier: %@ Does Not Match %@", v4, v5, v6, v7, v8);
}

void sub_10000CE64(void *a1)
{
  [a1 sourceType];
  sub_10000BAF0();
  sub_10000BB40((void *)&_mh_execute_header, v1, v2, "Invalid Update Query - Non-App Source Type: %ld", v3, v4, v5, v6, v7);
}

void sub_10000CEDC()
{
  sub_10000BB18();
  sub_10000BAFC((void *)&_mh_execute_header, v0, v1, "Invalid Update Query - Minimum Entitlement Not Found", v2, v3, v4, v5, v6);
}

void sub_10000CF10()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Updated user account denied insert for request: %@", v2, v3, v4, v5, v6);
}

void sub_10000CF78(void *a1)
{
  uint8_t v7 = [a1 updateError];
  sub_10000BB60((void *)&_mh_execute_header, v1, v2, "Error updating request %@: %@", v3, v4, v5, v6, 2u);
}

void sub_10000D018()
{
  sub_10000BAF0();
  sub_10000BAD4((void *)&_mh_execute_header, v0, v1, "Error inserting account updated via update JS: %@", v2, v3, v4, v5, v6);
}

void sub_10000D080()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received distnoted matching event.", v0, 2u);
}

void sub_10000D0C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching subscriptions for migration: %@", (uint8_t *)&v2, 0xCu);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t VSDefaultLogObject()
{
  return _VSDefaultLogObject();
}

uint64_t VSErrorLogObject()
{
  return _VSErrorLogObject();
}

uint64_t VSLoadBundleAtPath()
{
  return _VSLoadBundleAtPath();
}

uint64_t VSPerformCompletionHandler()
{
  return _VSPerformCompletionHandler();
}

uint64_t VSPublicError()
{
  return _VSPublicError();
}

uint64_t VSUserAccountServiceInterface()
{
  return _VSUserAccountServiceInterface();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend__isValidForDeleteQueryForCurrentTask(void *a1, const char *a2, ...)
{
  return [a1 _isValidForDeleteQueryForCurrentTask];
}

id objc_msgSend__predicateForFetchingAllResults(void *a1, const char *a2, ...)
{
  return [a1 _predicateForFetchingAllResults];
}

id objc_msgSend__predicateForFetchingZeroResults(void *a1, const char *a2, ...)
{
  return [a1 _predicateForFetchingZeroResults];
}

id objc_msgSend__predicateForUserAccountFromCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 _predicateForUserAccountFromCurrentDevice];
}

id objc_msgSend__predicateForUserAccountWithNonnullBillingCycleEndDate(void *a1, const char *a2, ...)
{
  return [a1 _predicateForUserAccountWithNonnullBillingCycleEndDate];
}

id objc_msgSend__predicateForUserAccountWithNonnullUpdateURL(void *a1, const char *a2, ...)
{
  return [a1 _predicateForUserAccountWithNonnullUpdateURL];
}

id objc_msgSend__removeNonConnectedSignedOutUserAccounts(void *a1, const char *a2, ...)
{
  return [a1 _removeNonConnectedSignedOutUserAccounts];
}

id objc_msgSend__securityTaskForCurrentConnection(void *a1, const char *a2, ...)
{
  return [a1 _securityTaskForCurrentConnection];
}

id objc_msgSend__setupObservers(void *a1, const char *a2, ...)
{
  return [a1 _setupObservers];
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return [a1 _update];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountProviderIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountProviderIdentifier];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_appleSubscription(void *a1, const char *a2, ...)
{
  return [a1 appleSubscription];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authenticationData(void *a1, const char *a2, ...)
{
  return [a1 authenticationData];
}

id objc_msgSend_authenticationToken(void *a1, const char *a2, ...)
{
  return [a1 authenticationToken];
}

id objc_msgSend_billingCycleEndDate(void *a1, const char *a2, ...)
{
  return [a1 billingCycleEndDate];
}

id objc_msgSend_billingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 billingIdentifier];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createSaveContext(void *a1, const char *a2, ...)
{
  return [a1 createSaveContext];
}

id objc_msgSend_created(void *a1, const char *a2, ...)
{
  return [a1 created];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentUpdateSessionIsForced(void *a1, const char *a2, ...)
{
  return [a1 currentUpdateSessionIsForced];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultChannelManager(void *a1, const char *a2, ...)
{
  return [a1 defaultChannelManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_developer(void *a1, const char *a2, ...)
{
  return [a1 developer];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enter(void *a1, const char *a2, ...)
{
  return [a1 enter];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_forceUnwrapObject(void *a1, const char *a2, ...)
{
  return [a1 forceUnwrapObject];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identityProviderID(void *a1, const char *a2, ...)
{
  return [a1 identityProviderID];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isDeveloperCreated(void *a1, const char *a2, ...)
{
  return [a1 isDeveloperCreated];
}

id objc_msgSend_isFromCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 isFromCurrentDevice];
}

id objc_msgSend_isSignedOut(void *a1, const char *a2, ...)
{
  return [a1 isSignedOut];
}

id objc_msgSend_keychainItemHash(void *a1, const char *a2, ...)
{
  return [a1 keychainItemHash];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastUpdateTime(void *a1, const char *a2, ...)
{
  return [a1 lastUpdateTime];
}

id objc_msgSend_leave(void *a1, const char *a2, ...)
{
  return [a1 leave];
}

id objc_msgSend_legacyItemHash(void *a1, const char *a2, ...)
{
  return [a1 legacyItemHash];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadingStoresLock(void *a1, const char *a2, ...)
{
  return [a1 loadingStoresLock];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_modified(void *a1, const char *a2, ...)
{
  return [a1 modified];
}

id objc_msgSend_modifierIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modifierIdentifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundContext];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_performedSubcriptionToUserAccountMigration(void *a1, const char *a2, ...)
{
  return [a1 performedSubcriptionToUserAccountMigration];
}

id objc_msgSend_postNotification(void *a1, const char *a2, ...)
{
  return [a1 postNotification];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return [a1 predicate];
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return [a1 preferences];
}

id objc_msgSend_privacyFacade(void *a1, const char *a2, ...)
{
  return [a1 privacyFacade];
}

id objc_msgSend_privateQueue(void *a1, const char *a2, ...)
{
  return [a1 privateQueue];
}

id objc_msgSend_providerID(void *a1, const char *a2, ...)
{
  return [a1 providerID];
}

id objc_msgSend_remoteNotifier(void *a1, const char *a2, ...)
{
  return [a1 remoteNotifier];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requiresSystemTrust(void *a1, const char *a2, ...)
{
  return [a1 requiresSystemTrust];
}

id objc_msgSend_resetTimer(void *a1, const char *a2, ...)
{
  return [a1 resetTimer];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_setPerformedSubcriptionToUserAccountMigration(void *a1, const char *a2, ...)
{
  return [a1 setPerformedSubcriptionToUserAccountMigration];
}

id objc_msgSend_sharedAccountStore(void *a1, const char *a2, ...)
{
  return [a1 sharedAccountStore];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedSettings];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_signedOut(void *a1, const char *a2, ...)
{
  return [a1 signedOut];
}

id objc_msgSend_signingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 signingIdentifier];
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceIdentifier];
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return [a1 sourceType];
}

id objc_msgSend_storesLoaded(void *a1, const char *a2, ...)
{
  return [a1 storesLoaded];
}

id objc_msgSend_subscriptionBillingCycleEndDate(void *a1, const char *a2, ...)
{
  return [a1 subscriptionBillingCycleEndDate];
}

id objc_msgSend_tierIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 tierIdentifiers];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return [a1 underlyingQueue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateError(void *a1, const char *a2, ...)
{
  return [a1 updateError];
}

id objc_msgSend_updateURL(void *a1, const char *a2, ...)
{
  return [a1 updateURL];
}

id objc_msgSend_updateUserAccounts(void *a1, const char *a2, ...)
{
  return [a1 updateUserAccounts];
}

id objc_msgSend_updatedUserAccount(void *a1, const char *a2, ...)
{
  return [a1 updatedUserAccount];
}

id objc_msgSend_userAccount(void *a1, const char *a2, ...)
{
  return [a1 userAccount];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_waitWithMilliseconds_(void *a1, const char *a2, ...)
{
  return [a1 waitWithMilliseconds:];
}