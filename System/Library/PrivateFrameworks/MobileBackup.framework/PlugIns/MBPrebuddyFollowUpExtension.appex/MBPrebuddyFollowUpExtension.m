void sub_100004288(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t vars8;

  v1 = *(void *)(a1 + 32);
  v2 = +[NSError errorWithDomain:@"MBMegaBackupEligibilityErrorDomain" code:1 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t sub_100004304(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000431C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = [v5 lastObject];

  if (v6)
  {
    v7 = [v5 lastObject];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

void sub_1000043B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = +[NSNumber numberWithBool:a2];
    *(_DWORD *)buf = 138412546;
    v20 = v7;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "saveAccount completed: %@: %@", buf, 0x16u);

    v13 = +[NSNumber numberWithBool:a2];
    _MBLog();
  }
  if (a2)
  {
    unsigned int v8 = [*(id *)(a1 + 32) containsObject:ACAccountDataclassKeychainSync];
    v9 = *(void **)(a1 + 40);
    if (v8)
    {
      uint64_t v10 = *(void *)(a1 + 48);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000045FC;
      v16[3] = &unk_10001C5D0;
      v16[4] = v9;
      id v17 = *(id *)(a1 + 32);
      id v18 = *(id *)(a1 + 56);
      [v9 _enableKeychainSync:v10 completion:v16];

      v11 = v17;
    }
    else
    {
      [*(id *)(a1 + 40) _saveEnabledSyncDataclasses:*(void *)(a1 + 32)];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004668;
      block[3] = &unk_10001C580;
      v12 = *(NSObject **)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      dispatch_async(v12, block);
      v11 = v15;
    }
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0);
  }
}

void sub_1000045FC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) _saveEnabledSyncDataclasses:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_100004668(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000048A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = +[NSNumber numberWithBool:a2];
    *(_DWORD *)buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished enabling Keychain Sync: %@: %@", buf, 0x16u);

    v11 = +[NSNumber numberWithBool:a2];
    _MBLog();
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A34;
  block[3] = &unk_10001C620;
  unsigned int v8 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  char v15 = a2;
  id v13 = v5;
  id v14 = v9;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t sub_100004A34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t sub_100004D28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = v5;
    if ([v7 isCameraRollDomain] && *(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41)) {
      goto LABEL_12;
    }
    if (![*(id *)(a1 + 32) _isSupportedBackupDomain:v7]) {
      goto LABEL_12;
    }
    if ([v7 isAppDomain])
    {
      unsigned int v8 = [v7 bundleID];
      BOOL v9 = [v8 length] != 0;
    }
    else
    {
      BOOL v9 = 1;
    }
    if ([v7 isEnabled]) {
LABEL_12:
    }
      uint64_t v10 = 0;
    else {
      uint64_t v10 = v9 & ~[v7 isRestricted];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t sub_100005158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  if (([*(id *)(a1 + 32) _isSupportedDataclassForDevice:v5] & 1) == 0)
  {
    BOOL v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_disabledSyncDataclassesForAccount: Filtering out %{public}@ because device doesn't support it.", buf, 0xCu);
      _MBLog();
    }

    goto LABEL_8;
  }
  id v7 = [*(id *)(a1 + 40) isProvisionedForDataclass:v5];
  if ([v5 isEqualToString:ACAccountDataclassKeychainSync]) {
    id v8 = +[CDPKeychainSync isUserVisibleKeychainSyncEnabled];
  }
  else {
    id v8 = [*(id *)(a1 + 40) isEnabledForDataclass:v5];
  }
  id v11 = v8;
  v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = +[NSNumber numberWithBool:v11];
    id v14 = +[NSNumber numberWithBool:v7];
    *(_DWORD *)buf = 138543874;
    id v19 = v5;
    __int16 v20 = 2114;
    __int16 v21 = v13;
    __int16 v22 = 2114;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_disabledSyncDataclassesForAccount: Dataclass (%{public}@) isEnabled: %{public}@, isProvisioned: %{public}@", buf, 0x20u);

    char v15 = +[NSNumber numberWithBool:v11];
    id v17 = +[NSNumber numberWithBool:v7];
    _MBLog();
  }
  uint64_t v10 = v7 & ~v11;
LABEL_13:

  return v10;
}

void sub_100005928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100005950(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
      uint64_t v10 = [WeakRetained _iconForSyncDataclass:v9];
      id v11 = [WeakRetained _localizedTitleForDataclass:v9];
    }
    else
    {
      id v11 = 0;
      uint64_t v10 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v7;
      uint64_t v14 = [WeakRetained _iconForBackupDomain:v13];

      uint64_t v15 = [WeakRetained _localizedTitleForBackupDomain:v13];

      id v11 = (void *)v15;
      uint64_t v10 = (void *)v14;
    }
    v12 = [v6 dequeueReusableCellWithIdentifier:@"AppItemCell"];
    v16 = +[UIListContentConfiguration cellConfiguration];
    [v16 setImage:v10];
    [v16 setText:v11];
    id v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    __int16 v18 = [v16 textProperties];
    [v18 setFont:v17];

    [v12 setContentConfiguration:v16];
    id v19 = +[UIColor secondarySystemBackgroundColor];
    [v12 setBackgroundColor:v19];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_100005D94(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) navigationController];
  id v7 = [v6 view];
  [v7 setUserInteractionEnabled:1];

  if ((a2 & 1) == 0)
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to enable disabled sync categories: %@", buf, 0xCu);
      id v13 = v5;
      _MBLog();
    }

    uint64_t v10 = [v5 domain];
    if ([v10 isEqualToString:CDPStateErrorDomain])
    {
      id v11 = [v5 code];

      if (v11 == (id)-5700)
      {
        v12 = *(void **)(a1 + 32);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100005F64;
        v14[3] = &unk_10001C6E8;
        v14[4] = v12;
        [v12 _presentKeychainError:v14];
        goto LABEL_10;
      }
    }
    else
    {
    }
    objc_msgSend(*(id *)(a1 + 32), "_presentUnknownError", v13);
    goto LABEL_10;
  }
  id v8 = [*(id *)(a1 + 32) flow];
  objc_msgSend(v8, "mb_didTapNextFromViewController:", *(void *)(a1 + 32));

LABEL_10:
}

void sub_100005F64(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) flow];
    objc_msgSend(v3, "mb_didTapNextFromViewController:", *(void *)(a1 + 32));
  }
}

uint64_t sub_10000640C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006B1C(id a1)
{
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v2 = dispatch_queue_create("MBMegaBackupEligibilityManager queue", attr);
  id v3 = (void *)qword_1000233F0;
  qword_1000233F0 = (uint64_t)v2;
}

void sub_100006D70(uint64_t a1)
{
  dispatch_queue_t v2 = (void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) _account];
  v4 = *v2;
  if (v3)
  {
    if ([v4 _isCloudBackupRestricted])
    {
      id v5 = MBGetDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "checkMegaBackupEligibility: Cloud Backup is restricted.", (uint8_t *)&buf, 2u);
        _MBLog();
      }

      id v6 = *(NSObject **)(a1 + 40);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000745C;
      block[3] = &unk_10001C580;
      id v41 = *(id *)(a1 + 64);
      dispatch_async(v6, block);
    }
    else if (objc_msgSend(v3, "aa_isManagedAppleID"))
    {
      id v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "checkMegaBackupEligibility: Unsupported Managed Apple ID.", (uint8_t *)&buf, 2u);
        _MBLog();
      }

      v12 = *(NSObject **)(a1 + 40);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000074DC;
      v38[3] = &unk_10001C580;
      id v39 = *(id *)(a1 + 64);
      dispatch_async(v12, v38);
    }
    else if ([*(id *)(a1 + 32) _isHSA2AvailableForAuthenticationContext:v3])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v46 = 0x2020000000;
      char v47 = 1;
      id v13 = [*(id *)(a1 + 32) _usedCapacityForVolume:@"/private/var"];
      uint64_t v14 = [*(id *)(a1 + 32) _usedCapacityForVolume:@"/private/var/mobile"];
      uint64_t v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v13 unsignedLongLongValue] + (void)objc_msgSend(v14, "unsignedLongLongValue"));
      id v16 = objc_alloc_init((Class)_ICQMegaBackupManager);
      uint64_t v17 = *(void *)(a1 + 48);
      id v18 = [*(id *)(a1 + 32) _entryMethodForEntryPoint:*(void *)(a1 + 72)];
      uint64_t v19 = *(void *)(a1 + 40);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10000757C;
      v32[3] = &unk_10001C840;
      uint64_t v20 = *(void *)(a1 + 56);
      id v33 = *(id *)(a1 + 64);
      p_long long buf = &buf;
      [v16 requestMegaBackupForAccount:v3 deviceBackupUUID:v17 deviceTotalUsedSpaceInBytes:v15 entryMethod:v18 deepLinkURL:v20 queue:v19 completion:v32];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      __int16 v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = objc_msgSend(v3, "aa_altDSID");
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "checkMegaBackupEligibility: User needs HSA2 account: %@", (uint8_t *)&buf, 0xCu);

        v31 = objc_msgSend(v3, "aa_altDSID");
        _MBLog();
      }
      CFStringRef v48 = @"MBMegaBackupEligibilityErrorUserInfoAltDSIDKey";
      uint64_t v23 = objc_msgSend(v3, "aa_altDSID");
      v24 = (void *)v23;
      CFStringRef v25 = &stru_10001D030;
      if (v23) {
        CFStringRef v25 = (const __CFString *)v23;
      }
      CFStringRef v49 = v25;
      v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1, v31);

      v27 = +[NSError errorWithDomain:@"MBMegaBackupEligibilityErrorDomain" code:5 userInfo:v26];
      v28 = *(NSObject **)(a1 + 40);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10000755C;
      v35[3] = &unk_10001C818;
      id v29 = *(id *)(a1 + 64);
      id v36 = v27;
      id v37 = v29;
      id v30 = v27;
      dispatch_async(v28, v35);
    }
  }
  else
  {
    unsigned int v7 = [v4 _isAccountModificationDisabledByRestrictions];
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        id v9 = &__kCFBooleanTrue;
      }
      else {
        id v9 = &__kCFBooleanFalse;
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "checkMegaBackupEligibility couldn't get primary Apple Account: %{public}@", (uint8_t *)&buf, 0xCu);
      _MBLog();
    }

    uint64_t v10 = *(NSObject **)(a1 + 40);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000073B0;
    v42[3] = &unk_10001C7F0;
    char v44 = v7;
    id v43 = *(id *)(a1 + 64);
    dispatch_async(v10, v42);
  }
}

void sub_100007384(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000073B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = +[NSError errorWithDomain:@"MBMegaBackupEligibilityErrorDomain" code:3 userInfo:0];
    id v3 = *(void (**)(uint64_t, uint64_t, void, uint64_t))(v1 + 16);
    uint64_t v4 = v1;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v2 = +[NSError errorWithDomain:@"MBMegaBackupEligibilityErrorDomain" code:1 userInfo:0];
    id v3 = *(void (**)(uint64_t, uint64_t, void, uint64_t))(v1 + 16);
    uint64_t v4 = v1;
    uint64_t v5 = 1;
  }
  id v6 = (id)v2;
  v3(v4, v5, 0, 21);
}

void sub_10000745C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError errorWithDomain:@"MBMegaBackupEligibilityErrorDomain" code:4 userInfo:0];
  (*(void (**)(uint64_t, void, void, uint64_t, id))(v1 + 16))(v1, 0, 0, 21, v2);
}

void sub_1000074DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError errorWithDomain:@"MBMegaBackupEligibilityErrorDomain" code:2 userInfo:0];
  (*(void (**)(uint64_t, void, void, uint64_t, id))(v1 + 16))(v1, 0, 0, 21, v2);
}

uint64_t sub_10000755C(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, 21, *(void *)(a1 + 32));
}

void sub_10000757C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v13 = a2;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "checkMegaBackupEligibility: _ICQMegaBackupManager response: %ld, error: %@", buf, 0x16u);
    _MBLog();
  }

  if (v7) {
    [v7 integerValue];
  }
  char v10 = 0;
  switch(a2)
  {
    case 0:
      (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
      goto LABEL_11;
    case 1:
      id v11 = +[NSError errorWithDomain:@"MBMegaBackupEligibilityErrorDomain" code:6 userInfo:0];
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1);

      goto LABEL_11;
    case 2:
      goto LABEL_9;
    case 3:
      char v10 = 1;
LABEL_9:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
      goto LABEL_10;
    default:
LABEL_10:
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 2);
LABEL_11:

      return;
  }
}

void sub_100007F44(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v2 = dispatch_queue_create("MBPrebuddyGettingStartedViewController XPC queue", attr);
  id v3 = (void *)qword_100023400;
  qword_100023400 = (uint64_t)v2;
}

void *sub_1000087C0(void *result, int a2)
{
  if (a2)
  {
    dispatch_queue_t v2 = (void *)result[4];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100008838;
    v3[3] = &unk_10001C6E8;
    v3[4] = v2;
    return [v2 _checkEligibilityAndUpgradeHSA2IfNeeded:v3];
  }
  return result;
}

void *sub_100008838(void *result, int a2)
{
  if (a2)
  {
    dispatch_queue_t v2 = (void *)result[4];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000088B0;
    v3[3] = &unk_10001C6E8;
    v3[4] = v2;
    return [v2 _enableBackupIfNeeded:v3];
  }
  return result;
}

void sub_1000088B0(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) flow];
    objc_msgSend(v3, "mb_didTapNextFromViewController:", *(void *)(a1 + 32));
  }
}

void sub_100008C94(id *a1)
{
  dispatch_queue_t v2 = [a1[4] _xpcQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008D48;
  v3[3] = &unk_10001C8B0;
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);
}

void sub_100008D48(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)MBManager);
  [v2 setBackupEnabled:1];
  [v2 saveBackupEnabledForMegaBackup];
  id v9 = 0;
  unsigned __int8 v3 = [v2 setMegaBackupTurnOniCloudBackupTelemetry:1 error:&v9];
  id v4 = v9;
  if ((v3 & 1) == 0)
  {
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      CFStringRef v11 = @"MegaBackupTurnOniCloudBackup";
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to set %{public}@: %{public}@", buf, 0x16u);
      _MBLog();
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008EF4;
  block[3] = &unk_10001C8B0;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100008EF4(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void sub_100008F44(id *a1)
{
  id v2 = [a1[4] _xpcQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008FF8;
  v3[3] = &unk_10001C8B0;
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);
}

void sub_100008FF8(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)MBManager);
  id v9 = 0;
  unsigned __int8 v3 = [v2 setMegaBackupTurnOniCloudBackupTelemetry:0 error:&v9];
  id v4 = v9;
  if ((v3 & 1) == 0)
  {
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      CFStringRef v11 = @"MegaBackupTurnOniCloudBackup";
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to set %{public}@: %{public}@", buf, 0x16u);
      _MBLog();
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009190;
  block[3] = &unk_10001C8B0;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100009190(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void sub_100009558(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 signInController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000096CC;
    v9[3] = &unk_10001C580;
    id v10 = *(id *)(a1 + 40);
    [v6 presentViewController:v7 animated:1 completion:v9];
  }
  else
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "AAUISignInController prepareInViewController Error: %{public}@", buf, 0xCu);
      _MBLog();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
}

uint64_t sub_1000096CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100009774(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0
    || ([*(id *)(a1 + 32) altDSIDForHSA2Upgrade],
        unsigned __int8 v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return (id)v6();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _upgradeHSA2IfNeeded:v5];
  }
}

void sub_1000099DC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) setDidHSA2Upgrade:1];
    [*(id *)(a1 + 32) _checkEligibility:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to upgrade to HSA2: %{public}@", buf, 0xCu);
      _MBLog();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
}

void sub_100009C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  [*(id *)(a1 + 32) setEligibilityStatus:a2];
  [*(id *)(a1 + 32) setEligibilityError:v9];
  [*(id *)(a1 + 32) setDaysUntilExpiration:a4];
  [*(id *)(a1 + 32) setNeedsBackupEnabled:*(unsigned __int8 *)(a1 + 48)];
  if (a2 == 2)
  {
    __int16 v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = +[NSNumber numberWithBool:a3];
      *(_DWORD *)long long buf = 138543362;
      id v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Getting Started MBMegaBackupEligibilityStateEligible: needsTemporaryStorage: %{public}@", buf, 0xCu);

      v24 = +[NSNumber numberWithBool:a3];
      _MBLog();
    }
    [*(id *)(a1 + 32) setNeedsTemporaryStorage:a3];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    goto LABEL_19;
  }
  if (a2 != 1)
  {
    if (!a2)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Getting Started MBMegaBackupEligibilityStateError: %{public}@", buf, 0xCu);
        _MBLog();
      }

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100009FE8;
      v27[3] = &unk_10001C818;
      CFStringRef v11 = *(void **)(a1 + 32);
      id v12 = *(id *)(a1 + 40);
      v27[4] = *(void *)(a1 + 32);
      id v28 = v12;
      [v11 _presentError:v9 completion:v27];
      id v13 = v28;
      goto LABEL_15;
    }
LABEL_19:
    objc_msgSend(*(id *)(a1 + 32), "_hideLoadingStatusView", v24);
    goto LABEL_20;
  }
  id v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Getting Started MBMegaBackupEligibilityStateIneligible: %{public}@", buf, 0xCu);
    v24 = v9;
    _MBLog();
  }

  uint64_t v17 = [v9 domain];
  unsigned int v18 = [v17 isEqualToString:@"MBMegaBackupEligibilityErrorDomain"];

  if (!v18)
  {
LABEL_18:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    goto LABEL_19;
  }
  if ([v9 code] != (id)6)
  {
    if ([v9 code] == (id)5)
    {
      __int16 v21 = [*(id *)(a1 + 32) eligibilityError];
      __int16 v22 = [v21 userInfo];
      uint64_t v23 = [v22 objectForKeyedSubscript:@"MBMegaBackupEligibilityErrorUserInfoAltDSIDKey"];
      [*(id *)(a1 + 32) setAltDSIDForHSA2Upgrade:v23];
    }
    goto LABEL_18;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000A030;
  v25[3] = &unk_10001C818;
  uint64_t v19 = *(void **)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  v25[4] = *(void *)(a1 + 32);
  id v26 = v20;
  [v19 _presentError:v9 completion:v25];
  id v13 = v26;
LABEL_15:

LABEL_20:
}

id sub_100009FE8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  return [v2 _hideLoadingStatusView];
}

id sub_10000A030(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  return [v2 _hideLoadingStatusView];
}

uint64_t sub_10000A510(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = +[MBPrebuddyManager sharedManager];
    [v2 cancelPrebuddy];
  }
  unsigned __int8 v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void *sub_10000A72C(void *result, int a2)
{
  if (a2)
  {
    id v2 = (void *)result[4];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000A7A4;
    v3[3] = &unk_10001C6E8;
    void v3[4] = v2;
    return [v2 _enableBackupIfNeeded:v3];
  }
  return result;
}

void sub_10000A7A4(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) flow];
    objc_msgSend(v3, "mb_didTapNextFromViewController:", *(void *)(a1 + 32));
  }
}

id MBPrebuddyAlertIcon()
{
  v0 = +[UIColor whiteColor];
  uint64_t v1 = +[UIColor colorWithRed:0.0 green:0.62745098 blue:0.549019608 alpha:1.0];
  id v2 = +[UIColor colorWithRed:0.0 green:0.447058824 blue:0.392156863 alpha:1.0];
  id v3 = v0;
  id v4 = v1;
  v20.width = 256.0;
  v20.height = 256.0;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 1.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = 256.0;
  v21.size.height = 256.0;
  CGRect v22 = CGRectInset(v21, 1.0, 1.0);
  CGContextAddEllipseInRect(CurrentContext, v22);
  CGContextClip(CurrentContext);
  id v6 = +[CAGradientLayer layer];
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, 256.0, 256.0);
  id v7 = v4;
  id v8 = [v7 CGColor];

  v18[0] = v8;
  id v9 = v2;
  v18[1] = [v9 CGColor];
  id v10 = +[NSArray arrayWithObjects:v18 count:2];
  [v6 setColors:v10];

  [v6 renderInContext:CurrentContext];
  CFStringRef v11 = +[UIImage systemImageNamed:@"arrow.circlepath"];
  id v12 = [v11 imageWithTintColor:v3];

  [v12 size];
  double v15 = 153.6 / fmax(v13, v14);
  objc_msgSend(v12, "drawInRect:", (256.0 - v13 * v15) * 0.5 + -6.6, (256.0 - v14 * v15) * 0.5 + 0.48);
  id v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

void sub_10000BB7C(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v2 = dispatch_queue_create("Prebuddy Follow Up XPC queue", attr);
  id v3 = (void *)qword_100023410;
  qword_100023410 = (uint64_t)v2;
}

void sub_10000BC54(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_DEFAULT, 0);

  dispatch_queue_t v2 = dispatch_queue_create("Prebuddy Follow Up Telemetry queue", attr);
  id v3 = (void *)qword_100023420;
  qword_100023420 = (uint64_t)v2;
}

void sub_10000C7E4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v3 = MBPrebuddyFollowUpFinishedFlowKey;
  id v4 = &__kCFBooleanTrue;
  dispatch_queue_t v2 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  [v1 finishProcessingWithUserInfo:v2];
}

void sub_10000C914(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v3 = MBPrebuddyFollowUpFinishedFlowKey;
  id v4 = &__kCFBooleanFalse;
  dispatch_queue_t v2 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  [v1 finishProcessingWithUserInfo:v2];
}

id sub_10000D318(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    dispatch_queue_t v2 = +[MBPrebuddyManager sharedManager];
    [v2 cancelPrebuddy];
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 prebuddyCancel:v3];
}

void sub_10000DAE4(uint64_t a1)
{
  dispatch_queue_t v2 = [[MBPrebuddyLoadingViewController alloc] initWithTitle:&stru_10001D030 detailText:&stru_10001D030 icon:0];
  [*(id *)(a1 + 32) setLoadingViewController:v2];

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 loadingViewController];
  [v3 _presentNavigationViewControllerWithRootViewController:v4];
}

void sub_10000DB74(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DC08;
  block[3] = &unk_10001C9E0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_10000DC08(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

void sub_10000DC10(uint64_t a1)
{
  dispatch_queue_t v2 = [[MBPrebuddyLoadingViewController alloc] initWithTitle:&stru_10001D030 detailText:&stru_10001D030 icon:0];
  [*(id *)(a1 + 32) setLoadingViewController:v2];

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 loadingViewController];
  [v3 _presentNavigationViewControllerWithRootViewController:v4];
}

void sub_10000DCA0(uint64_t a1)
{
  dispatch_queue_t v2 = +[MBPrebuddyManager sharedManager];
  unsigned int v3 = [v2 isPrebuddyMode];

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DE1C;
    block[3] = &unk_10001C9E0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v4 = objc_alloc_init((Class)MBManager);
    char v5 = [v4 isBackupEnabled] ^ 1;
    id v6 = [v4 backupDeviceUUID];
    id v8 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 32) deepLinkURL];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000DE74;
    v10[3] = &unk_10001CA30;
    v10[4] = *(void *)(a1 + 32);
    char v11 = v5;
    [v8 checkMegaBackupEligibility:v7 deepLinkURL:v9 backupDeviceUUID:v6 queue:&_dispatch_main_q completion:v10];
  }
}

void sub_10000DE1C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 _doneViewController];
  [v1 _presentNavigationViewControllerWithRootViewController:v2];
}

id sub_10000DE74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _processEligibilityStatus:a2 needsTemporaryStorage:a3 daysUntilExpiration:a4 needsBackupEnabled:*(unsigned __int8 *)(a1 + 40) error:a5];
}

void sub_10000E0DC(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  switch(a2)
  {
    case 2:
      id v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v47 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Server allowed expiration date extension: %{public}@", buf, 0xCu);
        _MBLog();
      }

      if (v7)
      {
        uint64_t v17 = [a1[4] _xpcQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000E74C;
        block[3] = &unk_10001CAA8;
        id v40 = a1[5];
        id v41 = v7;
        id v42 = a1[6];
        dispatch_async(v17, block);
      }
      else
      {
        (*((void (**)(id))a1[6] + 2))(a1[6]);
      }
      break;
    case 1:
      unsigned int v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Server did not allow expiration date extension", buf, 2u);
        _MBLog();
      }

      uint64_t v19 = MBLocalizedStringFromTable();
      CGSize v20 = MBLocalizedStringFromTable();
      CGRect v21 = +[UIAlertController alertControllerWithTitle:v19 message:v20 preferredStyle:1];

      CGRect v22 = MBPrebuddyAlertIcon();
      [v21 setImage:v22];

      uint64_t v23 = MBLocalizedStringFromTable();
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10000E850;
      v36[3] = &unk_10001CA80;
      id v37 = v21;
      id v38 = a1[6];
      id v24 = v21;
      CFStringRef v25 = +[UIAlertAction actionWithTitle:v23 style:0 handler:v36];

      [v24 addAction:v25];
      id v26 = [a1[4] navController];
      v27 = [v26 visibleViewController];
      [v27 presentViewController:v24 animated:1 completion:0];

      break;
    case 0:
      id v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v47 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Server error for expiration extension: %@", buf, 0xCu);
        _MBLog();
      }

      id v10 = MBLocalizedStringFromTable();
      char v11 = [v8 domain];
      unsigned int v12 = [v11 isEqualToString:_ICQMegaBackupErrorDomain];

      if (v12 && [v8 code] == (id)5)
      {
        int v13 = MGGetBoolAnswer();
        CFStringRef v14 = @"WIFI";
        if (v13) {
          CFStringRef v14 = @"WLAN";
        }
        double v15 = +[NSString stringWithFormat:@"MB_PREBUDDY_NETWORK_%@_ERROR_TITLE", v14];

        id v10 = 0;
      }
      else
      {
        double v15 = @"MB_PREBUDDY_EXPIRATION_DENIED_TITLE";
      }
      id v28 = MBLocalizedStringFromTable();
      id v29 = +[UIAlertController alertControllerWithTitle:v28 message:v10 preferredStyle:1];

      id v30 = MBPrebuddyAlertIcon();
      [v29 setImage:v30];

      v31 = MBLocalizedStringFromTable();
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10000E6FC;
      v43[3] = &unk_10001CA80;
      id v44 = v29;
      id v45 = a1[6];
      id v32 = v29;
      id v33 = +[UIAlertAction actionWithTitle:v31 style:0 handler:v43];

      [v32 addAction:v33];
      v34 = [a1[4] navController];
      v35 = [v34 visibleViewController];
      [v35 presentViewController:v32 animated:1 completion:0];

      break;
  }
}

uint64_t sub_10000E6FC(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void sub_10000E74C(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  unsigned __int8 v4 = [v2 updateMegaBackupExpirationDate:v3 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to update mega backup expiration date: %@", buf, 0xCu);
      _MBLog();
    }
  }
  (*(void (**)(void))(a1[6] + 16))(a1[6]);
}

uint64_t sub_10000E850(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void sub_10000E954(uint64_t a1)
{
  id v2 = +[MBPrebuddyManager sharedManager];
  if (![*(id *)(a1 + 32) needsTemporaryStorage])
  {
    [v2 cancelPrebuddy];
    id v5 = objc_alloc_init((Class)MBManager);
    id v6 = objc_alloc_init((Class)MBStartBackupOptions);
    if ([*(id *)(a1 + 32) expensiveNetwork]) {
      +[MBCellularAccess expensiveCellularAccess];
    }
    else {
    id v7 = +[MBCellularAccess inexpensiveCellularAccess];
    }
    [v6 setCellularAccess:v7];
    id v11 = 0;
    unsigned __int8 v8 = [v5 startBackupWithOptions:v6 error:&v11];
    id v9 = v11;
    if ((v8 & 1) == 0)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to start normal backup for prebuddy: %@", buf, 0xCu);
        _MBLog();
      }
    }
    goto LABEL_13;
  }
  id v3 = [*(id *)(a1 + 32) fromManualSignal];
  id v12 = 0;
  unsigned __int8 v4 = [v2 beginPrebuddyBackupFromManualSignal:v3 error:&v12];
  id v5 = v12;
  if ((v4 & 1) == 0)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to start prebuddy backup: %@", buf, 0xCu);
      _MBLog();
    }
LABEL_13:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

void sub_10000EDE8(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = *(void **)(a1 + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000EF54;
  v12[3] = &unk_10001CB40;
  v12[4] = v3;
  id v13 = *(id *)(a1 + 40);
  unsigned __int8 v4 = v2;
  id v14 = v4;
  [v3 _beginBackup:v12];
  dispatch_time_t v5 = dispatch_time(0, 300000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    id v6 = [*(id *)(a1 + 32) navController];
    id v7 = [v6 topViewController];
    unsigned __int8 v8 = [*(id *)(a1 + 32) loadingViewController];
    unsigned __int8 v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = [*(id *)(a1 + 32) navController];
      id v11 = [*(id *)(a1 + 32) loadingViewController];
      [v10 pushViewController:v11 animated:1];
    }
  }
}

void sub_10000EF54(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000EFF0;
  v3[3] = &unk_10001CB18;
  dispatch_semaphore_t v2 = *(void **)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000EFF0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

void sub_10000F1B0(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) _prebuddyTelemetryForStep:*(void *)(a1 + 40)];
  id v8 = 0;
  unsigned __int8 v4 = [v2 logPrebuddyFlowTelemetry:v3 error:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 134218242;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to log prebuddy flow telemetry at %ld: %@", buf, 0x16u);
      _MBLog();
    }
  }
}

void sub_10000F58C(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F628;
  v3[3] = &unk_10001CB18;
  id v2 = *(void **)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000F628(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t MBGetDefaultLog()
{
  return _MBGetDefaultLog();
}

uint64_t MBLocalizedStringFromTable()
{
  return _MBLocalizedStringFromTable();
}

uint64_t MBLocalizedStringWithSubstitutionsFromTable()
{
  return _MBLocalizedStringWithSubstitutionsFromTable();
}

uint64_t MBUsedDiskSpaceForVolume()
{
  return _MBUsedDiskSpaceForVolume();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MBLog()
{
  return __MBLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__account(void *a1, const char *a2, ...)
{
  return [a1 _account];
}

id objc_msgSend__backupToCloudImage(void *a1, const char *a2, ...)
{
  return [a1 _backupToCloudImage];
}

id objc_msgSend__configureButtonTray(void *a1, const char *a2, ...)
{
  return [a1 _configureButtonTray];
}

id objc_msgSend__disabledBackupDomains(void *a1, const char *a2, ...)
{
  return [a1 _disabledBackupDomains];
}

id objc_msgSend__disabledSyncCategories(void *a1, const char *a2, ...)
{
  return [a1 _disabledSyncCategories];
}

id objc_msgSend__doneViewController(void *a1, const char *a2, ...)
{
  return [a1 _doneViewController];
}

id objc_msgSend__entryPoint(void *a1, const char *a2, ...)
{
  return [a1 _entryPoint];
}

id objc_msgSend__extraStorageOfferViewController(void *a1, const char *a2, ...)
{
  return [a1 _extraStorageOfferViewController];
}

id objc_msgSend__fetchDeepLinkURL(void *a1, const char *a2, ...)
{
  return [a1 _fetchDeepLinkURL];
}

id objc_msgSend__gettingStartedViewController(void *a1, const char *a2, ...)
{
  return [a1 _gettingStartedViewController];
}

id objc_msgSend__hasDisabledCategories(void *a1, const char *a2, ...)
{
  return [a1 _hasDisabledCategories];
}

id objc_msgSend__hideLoadingStatusView(void *a1, const char *a2, ...)
{
  return [a1 _hideLoadingStatusView];
}

id objc_msgSend__initialViewController(void *a1, const char *a2, ...)
{
  return [a1 _initialViewController];
}

id objc_msgSend__isAccountModificationDisabledByRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _isAccountModificationDisabledByRestrictions];
}

id objc_msgSend__isCloudBackupRestricted(void *a1, const char *a2, ...)
{
  return [a1 _isCloudBackupRestricted];
}

id objc_msgSend__leadingMargins(void *a1, const char *a2, ...)
{
  return [a1 _leadingMargins];
}

id objc_msgSend__phoneTransferImage(void *a1, const char *a2, ...)
{
  return [a1 _phoneTransferImage];
}

id objc_msgSend__presentUnknownError(void *a1, const char *a2, ...)
{
  return [a1 _presentUnknownError];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend__setUp(void *a1, const char *a2, ...)
{
  return [a1 _setUp];
}

id objc_msgSend__showLoadingStatusView(void *a1, const char *a2, ...)
{
  return [a1 _showLoadingStatusView];
}

id objc_msgSend__startTransferViewController(void *a1, const char *a2, ...)
{
  return [a1 _startTransferViewController];
}

id objc_msgSend__telemetryQueue(void *a1, const char *a2, ...)
{
  return [a1 _telemetryQueue];
}

id objc_msgSend__trailingMargins(void *a1, const char *a2, ...)
{
  return [a1 _trailingMargins];
}

id objc_msgSend__viewControllerAfterExtraStorageOffer(void *a1, const char *a2, ...)
{
  return [a1 _viewControllerAfterExtraStorageOffer];
}

id objc_msgSend__viewControllerAfterMoveAllAppsAndData(void *a1, const char *a2, ...)
{
  return [a1 _viewControllerAfterMoveAllAppsAndData];
}

id objc_msgSend__xpcQueue(void *a1, const char *a2, ...)
{
  return [a1 _xpcQueue];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_altDSIDForHSA2Upgrade(void *a1, const char *a2, ...)
{
  return [a1 altDSIDForHSA2Upgrade];
}

id objc_msgSend_backItem(void *a1, const char *a2, ...)
{
  return [a1 backItem];
}

id objc_msgSend_backupDeviceUUID(void *a1, const char *a2, ...)
{
  return [a1 backupDeviceUUID];
}

id objc_msgSend_backupToCloudImageName(void *a1, const char *a2, ...)
{
  return [a1 backupToCloudImageName];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_cancelPrebuddy(void *a1, const char *a2, ...)
{
  return [a1 cancelPrebuddy];
}

id objc_msgSend_cellConfiguration(void *a1, const char *a2, ...)
{
  return [a1 cellConfiguration];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearFollowUp(void *a1, const char *a2, ...)
{
  return [a1 clearFollowUp];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return [a1 commonInit];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dateOfLastBackup(void *a1, const char *a2, ...)
{
  return [a1 dateOfLastBackup];
}

id objc_msgSend_daysUntilExpiration(void *a1, const char *a2, ...)
{
  return [a1 daysUntilExpiration];
}

id objc_msgSend_deepLinkURL(void *a1, const char *a2, ...)
{
  return [a1 deepLinkURL];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteAllItems(void *a1, const char *a2, ...)
{
  return [a1 deleteAllItems];
}

id objc_msgSend_disabledDomainInfos(void *a1, const char *a2, ...)
{
  return [a1 disabledDomainInfos];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return [a1 domainName];
}

id objc_msgSend_eligibilityError(void *a1, const char *a2, ...)
{
  return [a1 eligibilityError];
}

id objc_msgSend_eligibilityStatus(void *a1, const char *a2, ...)
{
  return [a1 eligibilityStatus];
}

id objc_msgSend_expensiveCellularAccess(void *a1, const char *a2, ...)
{
  return [a1 expensiveCellularAccess];
}

id objc_msgSend_expensiveNetwork(void *a1, const char *a2, ...)
{
  return [a1 expensiveNetwork];
}

id objc_msgSend_extraProminentInsetGroupedHeaderConfiguration(void *a1, const char *a2, ...)
{
  return [a1 extraProminentInsetGroupedHeaderConfiguration];
}

id objc_msgSend_flow(void *a1, const char *a2, ...)
{
  return [a1 flow];
}

id objc_msgSend_fromManualSignal(void *a1, const char *a2, ...)
{
  return [a1 fromManualSignal];
}

id objc_msgSend_hasPrebuddyFollowUp(void *a1, const char *a2, ...)
{
  return [a1 hasPrebuddyFollowUp];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inexpensiveCellularAccess(void *a1, const char *a2, ...)
{
  return [a1 inexpensiveCellularAccess];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_isAppDomain(void *a1, const char *a2, ...)
{
  return [a1 isAppDomain];
}

id objc_msgSend_isBackupEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBackupEnabled];
}

id objc_msgSend_isCameraRollDomain(void *a1, const char *a2, ...)
{
  return [a1 isCameraRollDomain];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isExpensive(void *a1, const char *a2, ...)
{
  return [a1 isExpensive];
}

id objc_msgSend_isPrebuddyMode(void *a1, const char *a2, ...)
{
  return [a1 isPrebuddyMode];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return [a1 isRestricted];
}

id objc_msgSend_isUserVisibleKeychainSyncEnabled(void *a1, const char *a2, ...)
{
  return [a1 isUserVisibleKeychainSyncEnabled];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return [a1 linkButton];
}

id objc_msgSend_loadingViewController(void *a1, const char *a2, ...)
{
  return [a1 loadingViewController];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_navController(void *a1, const char *a2, ...)
{
  return [a1 navController];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_needsAccountSignIn(void *a1, const char *a2, ...)
{
  return [a1 needsAccountSignIn];
}

id objc_msgSend_needsBackupEnabled(void *a1, const char *a2, ...)
{
  return [a1 needsBackupEnabled];
}

id objc_msgSend_needsTemporaryStorage(void *a1, const char *a2, ...)
{
  return [a1 needsTemporaryStorage];
}

id objc_msgSend_noInitialAccount(void *a1, const char *a2, ...)
{
  return [a1 noInitialAccount];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeAllButtons(void *a1, const char *a2, ...)
{
  return [a1 removeAllButtons];
}

id objc_msgSend_saveBackupEnabledForMegaBackup(void *a1, const char *a2, ...)
{
  return [a1 saveBackupEnabledForMegaBackup];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemBackgroundColor];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_signInController(void *a1, const char *a2, ...)
{
  return [a1 signInController];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_spacing(void *a1, const char *a2, ...)
{
  return [a1 spacing];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_statusView(void *a1, const char *a2, ...)
{
  return [a1 statusView];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_twoDeviceImageName(void *a1, const char *a2, ...)
{
  return [a1 twoDeviceImageName];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return [a1 visibleViewController];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}