void sub_100004F18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t vars8;

  v3 = a2;
  if (!v3) {
    [*(id *)(a1 + 40) _setOffWristPreference:*(unsigned __int8 *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100005730(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10000575C(uint64_t a1)
{
}

uint64_t sub_100005764(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  return _objc_release_x1();
}

id sub_10000587C(void *a1)
{
  return [*(id *)(a1[4] + 48) setObject:a1[6] forKeyedSubscript:a1[5]];
}

id sub_100005924(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
}

uint64_t sub_100005A40(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  return _objc_release_x1();
}

void sub_100005B58(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 56) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

id sub_100005C48(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
}

id sub_100006ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _notifyPairResult:a2 error:a3 handler:*(void *)(a1 + 40)];
}

uint64_t sub_100006BD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006C7C(id a1, PURemoteDeviceState *a2, NSError *a3)
{
  v3 = a3;
  v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v5 = @"FAILED to request";
    }
    else {
      CFStringRef v5 = @"Requested";
    }
    if (v3)
    {
      v6 = +[NSString stringWithFormat:@" (%@)", v3];
    }
    else
    {
      v6 = &stru_100018D98;
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v8 = v5;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ notification of next unlock%@", buf, 0x16u);
    if (v3) {
  }
    }
}

void sub_100006E14(id a1, PURemoteDeviceState *a2, NSError *a3)
{
  v3 = a3;
  v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v5 = @"FAILED to request";
    }
    else {
      CFStringRef v5 = @"Requested";
    }
    if (v3)
    {
      v6 = +[NSString stringWithFormat:@" (%@)", v3];
    }
    else
    {
      v6 = &stru_100018D98;
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v8 = v5;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ disabling only remote unlock%@", buf, 0x16u);
    if (v3) {
  }
    }
}

void sub_1000071D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000071EC(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained responseHandlerForRequestMessageID:*(void *)(a1 + 32)];
  CFStringRef v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v6);
    [WeakRetained removeResponseHandlerForRequestMessageID:*(void *)(a1 + 32)];
  }
}

void sub_100007330(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    int v7 = 138412546;
    CFStringRef v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "peer requestDeviceSetWristDetectionDisabled:%@, error: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t sub_100007608(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100007B78(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = pu_log();
  v13 = v12;
  if (a2)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unlock pairing succeeded; notifying other device of new state",
        buf,
        2u);
    }

    [*(id *)(a1 + 32) _notifyCurrentStateReliably:1 completionHandler:&stru_100018788];
    v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100010450();
    }

    v15 = +[MCProfileConnection sharedConnection];
    unsigned int v16 = [v15 changePasscodeFrom:v11 to:v10 outError:0];

    v17 = pu_log();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully changed passcode back. You are now at least no worse off than you were.", v19, 2u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_10001041C();
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v14();
}

void sub_100007D1C(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = pu_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000104B8();
    }
  }
}

void sub_100007D74(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = pu_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = +[NSNumber numberWithBool:a2];
    CFStringRef v8 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
    *(_DWORD *)buf = 138412802;
    v23 = v7;
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 2112;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "enableUnlockWithDevice returned success %@ %@ in state %@", buf, 0x20u);
  }
  if (!a2)
  {
    id v10 = pu_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resetting passcode state = %@", buf, 0xCu);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_9:
    v9();
    goto LABEL_10;
  }
  v12 = [*(id *)(a1 + 48) _createAndStoreNewPasscodeWithCurrentPasscode:*(void *)(a1 + 32)];
  if (v12)
  {
    v13 = +[SFUnlockManager sharedUnlockManager];
    uint64_t v14 = IDSDefaultPairedDevice;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100008050;
    v17[3] = &unk_1000187D8;
    char v21 = *(unsigned char *)(a1 + 72);
    id v20 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 32);
    id v19 = v12;
    [v13 enableUnlockWithDevice:v14 fromKey:0 withPasscode:v19 completionHandler:v17];

    v15 = v20;
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 64);
    v15 = +[NSError errorWithDomain:@"com.apple.paired-unlock" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v15);
  }

LABEL_10:
}

void sub_100008050(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = pu_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting passcode state = %@", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000827C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pu_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100010520();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "wrist detection enabled by user", v6, 2u);
    }

    [*(id *)(a1 + 32) completeEnableOnlyRemoteUnlockWithPasscode:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

uint64_t sub_100008668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 == 0);
}

void sub_100008894(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = pu_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000105F0();
    }
  }
}

void sub_100009254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose((const void *)(v18 - 160), 8);
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v18 - 200), 8);
  objc_destroyWeak((id *)(v18 - 168));
  _Unwind_Resume(a1);
}

void sub_1000092C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009430;
  v9[3] = &unk_100018870;
  id v10 = *(id *)(a1 + 32);
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v11 = *(id *)(a1 + 40);
  int v7 = objc_retainBlock(v9);
  CFStringRef v8 = (void (**)(void, void))v7;
  if (v6)
  {
    ((void (*)(void *, id))v7[2])(v7, v6);
  }
  else if (+[PUPasscodeState hasSEP] || *(void *)(a1 + 64) != 5)
  {
    v8[2](v8, 0);
  }
  else
  {
    +[PUPasscodeState setWristDetectionDisabled:1 completion:v8];
  }

  objc_destroyWeak(&v12);
}

void sub_10000941C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100009430(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pu_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000106CC(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) actionID]);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "remote action %@ complete", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _sendResultOfMessage:100 requestID:*(void *)(a1 + 40) success:v3 == 0 error:v3];
}

void sub_100009560(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "wrist detection enabled", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000095F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "wrist detection disabled", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009690(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "wrist detection prepared, putting up passcode screen for unlock pairing", buf, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) passcodeType];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  int v8 = *(void **)(v6 + 32);
  uint64_t v9 = *(void *)(a1 + 64);
  if (v3)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000983C;
    v13[3] = &unk_1000188C0;
    id v10 = &v14;
    id v14 = v3;
    id v15 = *(id *)(a1 + 56);
    [v8 peer:v6 remoteDeviceRequestsRemoteAction:v9 type:v5 existingPasscode:v7 showAsReprompt:1 completionHandler:v13];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000993C;
    v11[3] = &unk_100018670;
    id v10 = &v12;
    id v12 = *(id *)(a1 + 56);
    [v8 peer:v6 remoteDeviceRequestsRemoteAction:v9 type:v5 existingPasscode:v7 completionHandler:v11];
  }
}

void sub_10000983C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v6 = +[PUPasscodeState setOffWristEnabled:0 withContext:*(void *)(a1 + 32)];
    uint64_t v7 = pu_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "enabled wrist detection and paired unlock, error %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000993C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v6 = +[PUPasscodeState setOffWristEnabled:0 withContext:0];
    uint64_t v7 = pu_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "enabled wrist detection and paired unlock, error %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100009A3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009A4C(uint64_t a1)
{
}

void sub_100009A54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100009BD8(id a1, PURemoteDeviceState *a2, NSError *a3)
{
  id v3 = a3;
  id v4 = pu_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100010788();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disabled only remote unlock", v6, 2u);
  }
}

void sub_10000A484(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A4A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10000A81C(void *a1, int a2)
{
  id v3 = a1;
  id v4 = +[NSMutableDictionary dictionary];
  sub_10000AA7C(v3);
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrIsPermanent];
  [v4 setObject:v3 forKeyedSubscript:kSecAttrApplicationTag];
  if (a2) {
    [v4 setObject:kSecAttrAccessibleAlwaysThisDeviceOnly forKeyedSubscript:kSecAttrAccessible];
  }
  id v5 = +[NSMutableDictionary dictionary];
  [v5 setObject:kSecAttrKeyTypeRSA forKeyedSubscript:kSecAttrKeyType];
  [v5 setObject:&off_1000191D0 forKeyedSubscript:kSecAttrKeySizeInBits];
  [v5 setObject:v4 forKeyedSubscript:kSecPrivateKeyAttrs];
  [v5 setObject:&__NSDictionary0__struct forKeyedSubscript:kSecPublicKeyAttrs];
  [v5 setObject:@"com.apple.paired-unlock" forKeyedSubscript:kSecAttrAccessGroup];
  SecKeyRef privateKey = 0;
  SecKeyRef publicKey = 0;
  uint64_t v6 = 0;
  if (!SecKeyGeneratePair((CFDictionaryRef)v5, &publicKey, &privateKey))
  {
    uint64_t v7 = +[NSMutableDictionary dictionary];
    [v7 setObject:v3 forKeyedSubscript:kSecAttrApplicationTag];
    [v7 setObject:kSecClassKey forKeyedSubscript:kSecClass];
    [v7 setObject:kSecAttrKeyTypeRSA forKeyedSubscript:kSecAttrKeyType];
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
    [v7 setObject:publicKey forKeyedSubscript:kSecValueRef];
    [v7 setObject:@"com.apple.paired-unlock" forKeyedSubscript:kSecAttrAccessGroup];
    CFTypeRef result = 0;
    if (SecItemAdd((CFDictionaryRef)v7, &result)) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = (void *)result;
    }
  }
  return v6;
}

void sub_10000AA7C(void *a1)
{
  v3[0] = kSecClass;
  v3[1] = kSecAttrAccessGroup;
  v4[0] = kSecClassKey;
  v4[1] = @"com.apple.paired-unlock";
  v3[2] = kSecAttrApplicationTag;
  v3[3] = kSecAttrKeyType;
  v4[2] = a1;
  v4[3] = kSecAttrKeyTypeRSA;
  id v1 = a1;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];

  SecItemDelete(v2);
}

CFTypeRef sub_10000AB68(void *a1, int a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = +[NSMutableDictionary dictionary];
  [v6 setObject:v5 forKeyedSubscript:kSecAttrApplicationTag];

  [v6 setObject:kSecClassKey forKeyedSubscript:kSecClass];
  [v6 setObject:kSecAttrKeyTypeRSA forKeyedSubscript:kSecAttrKeyType];
  uint64_t v7 = &kSecAttrKeyClassPublic;
  if (!a2) {
    uint64_t v7 = &kSecAttrKeyClassPrivate;
  }
  [v6 setObject:*v7 forKeyedSubscript:kSecAttrKeyClass];
  [v6 setObject:@"com.apple.paired-unlock" forKeyedSubscript:kSecAttrAccessGroup];
  id v8 = &kSecReturnRef;
  if (!a3) {
    id v8 = &kSecReturnData;
  }
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:*v8];
  CFTypeRef result = 0;
  if (SecItemCopyMatching((CFDictionaryRef)v6, &result)) {
    CFTypeRef v9 = 0;
  }
  else {
    CFTypeRef v9 = result;
  }

  return v9;
}

CFTypeRef sub_10000ACB0(void *a1, int a2)
{
  return sub_10000AB68(a1, a2, 1);
}

CFTypeRef sub_10000ACB8(void *a1, int a2)
{
  return sub_10000AB68(a1, a2, 0);
}

CFTypeRef sub_10000ACC0(void *a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = +[NSMutableDictionary dictionary];
  [v7 setObject:v5 forKeyedSubscript:kSecAttrApplicationTag];

  [v7 setObject:kSecClassKey forKeyedSubscript:kSecClass];
  [v7 setObject:kSecAttrKeyClassPublic forKeyedSubscript:kSecAttrKeyClass];
  [v7 setObject:kSecAttrKeyTypeRSA forKeyedSubscript:kSecAttrKeyType];
  if (a3) {
    [v7 setObject:kSecAttrAccessibleAlwaysThisDeviceOnly forKeyedSubscript:kSecAttrAccessible];
  }
  [v7 setObject:@"com.apple.paired-unlock" forKeyedSubscript:kSecAttrAccessGroup];
  SecItemDelete((CFDictionaryRef)v7);
  [v7 setObject:v6 forKeyedSubscript:kSecValueData];

  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnRef];
  CFTypeRef result = 0;
  if (SecItemAdd((CFDictionaryRef)v7, &result)) {
    CFTypeRef v8 = 0;
  }
  else {
    CFTypeRef v8 = result;
  }

  return v8;
}

uint64_t sub_10000AE40()
{
  return 1;
}

uint64_t PUProtoPasscodeStateReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_52;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_54;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_52:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_54:
        BOOL v34 = v14 != 0;
        uint64_t v35 = 16;
        goto LABEL_67;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                uint64_t v20 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v20 = 0;
        }
LABEL_58:
        BOOL v34 = v20 != 0;
        uint64_t v35 = 17;
        goto LABEL_67;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        while (2)
        {
          unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1 || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                uint64_t v25 = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v25 = 0;
        }
LABEL_62:
        BOOL v34 = v25 != 0;
        uint64_t v35 = 18;
        goto LABEL_67;
      case 4u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (2)
        {
          unint64_t v31 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v31 == -1 || v31 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v31);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
            v30 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              v28 += 7;
              BOOL v9 = v29++ >= 9;
              if (v9)
              {
                uint64_t v30 = 0;
                goto LABEL_66;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v30 = 0;
        }
LABEL_66:
        BOOL v34 = v30 != 0;
        uint64_t v35 = 19;
LABEL_67:
        *(unsigned char *)(a1 + v35) = v34;
        goto LABEL_68;
      case 5u:
        v33 = objc_alloc_init(PUProtoPasscodePolicy);
        objc_storeStrong((id *)(a1 + 8), v33);
        if PBReaderPlaceMark() && (PUProtoPasscodePolicyReadFrom((uint64_t)v33, a2))
        {
          PBReaderRecallMark();

LABEL_68:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_68;
    }
  }
}

BOOL PUProtoDidUnlockReadFrom(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
      return v3 == 0;
    }
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      int v3 = 1;
      return v3 == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LOBYTE(v6) = 0;
        int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v6) = 0;
    }
LABEL_13:
    if (v3) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v6 & 7) == 4;
    }
    if (v10) {
      return v3 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

BOOL PUProtoGetPasscodeStateReadFrom(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
      return v3 == 0;
    }
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      int v3 = 1;
      return v3 == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LOBYTE(v6) = 0;
        int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v6) = 0;
    }
LABEL_13:
    if (v3) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v6 & 7) == 4;
    }
    if (v10) {
      return v3 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

BOOL PUProtoStartRemoteActionReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            char v18 = &OBJC_IVAR___PUProtoStartRemoteAction__actionID;
            goto LABEL_37;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            break;
          }
          v12 += 7;
          BOOL v17 = v13++ > 8;
          if (v17)
          {
            LODWORD(v14) = 0;
            char v18 = &OBJC_IVAR___PUProtoStartRemoteAction__actionID;
            goto LABEL_40;
          }
        }
        char v18 = &OBJC_IVAR___PUProtoStartRemoteAction__actionID;
LABEL_38:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_40:
        *(_DWORD *)(a1 + *v18) = v14;
        goto LABEL_41;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_41:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    char v19 = 0;
    unsigned int v20 = 0;
    uint64_t v14 = 0;
    *(unsigned char *)(a1 + 16) |= 1u;
    while (1)
    {
      unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
      v14 |= (unint64_t)(v22 & 0x7F) << v19;
      if ((v22 & 0x80) == 0)
      {
        char v18 = &OBJC_IVAR___PUProtoStartRemoteAction__passcodeType;
        goto LABEL_38;
      }
      v19 += 7;
      BOOL v17 = v20++ > 8;
      if (v17)
      {
        LODWORD(v14) = 0;
        char v18 = &OBJC_IVAR___PUProtoStartRemoteAction__passcodeType;
        goto LABEL_40;
      }
    }
    char v18 = &OBJC_IVAR___PUProtoStartRemoteAction__passcodeType;
LABEL_37:
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
    goto LABEL_38;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL PUProtoRemoveLockoutReadFrom(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
      return v3 == 0;
    }
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      int v3 = 1;
      return v3 == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LOBYTE(v6) = 0;
        int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v6) = 0;
    }
LABEL_13:
    if (v3) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v6 & 7) == 4;
    }
    if (v10) {
      return v3 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t PUProtoRequestCompletedReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_39;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 16) = v14;
        goto LABEL_46;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                uint64_t v20 = 0;
                goto LABEL_45;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v20 = 0;
        }
LABEL_45:
        *(unsigned char *)(a1 + 32) = v20 != 0;
        goto LABEL_46;
      case 3u:
        uint64_t v23 = PBReaderReadData();
        unsigned int v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;

        goto LABEL_46;
      case 4u:
        uint64_t v25 = objc_alloc_init(PUProtoPasscodeState);
        objc_storeStrong((id *)(a1 + 24), v25);
        if PBReaderPlaceMark() && (PUProtoPasscodeStateReadFrom((uint64_t)v25, a2))
        {
          PBReaderRecallMark();

LABEL_46:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_46;
    }
  }
}

BOOL PUProtoRequestDisableOnlyRemoteUnlockReadFrom(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
      return v3 == 0;
    }
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      int v3 = 1;
      return v3 == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LOBYTE(v6) = 0;
        int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v6) = 0;
    }
LABEL_13:
    if (v3) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v6 & 7) == 4;
    }
    if (v10) {
      return v3 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t PUProtoPasscodePolicyReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      char v17 = 0;
      unsigned int v18 = 0;
      uint64_t v19 = 0;
      *(unsigned char *)(a1 + 16) |= 1u;
      while (1)
      {
        unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
        v19 |= (unint64_t)(v21 & 0x7F) << v17;
        if ((v21 & 0x80) == 0) {
          goto LABEL_40;
        }
        v17 += 7;
        BOOL v9 = v18++ >= 9;
        if (v9)
        {
          LODWORD(v19) = 0;
          goto LABEL_42;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v19) = 0;
      }
LABEL_42:
      *(_DWORD *)(a1 + 8) = v19;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_36;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          uint64_t v14 = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_38:
      *(unsigned char *)(a1 + 12) = v14 != 0;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t PUProtoSetShouldNotifyNextUnlockReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(unsigned char *)(a1 + 8) = v14 != 0;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000E29C(id a1, OS_xpc_object *a2)
{
  CFDictionaryRef v2 = a2;
  int v3 = pu_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "com.apple.notifyd.matching event received", buf, 2u);
  }

  char v4 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E38C;
  block[3] = &unk_1000189B8;
  unint64_t v7 = v2;
  unsigned int v5 = v2;
  dispatch_async(v4, block);
}

void sub_10000E38C(uint64_t a1)
{
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), _xpc_event_key_name);
  if (!strcmp(string, "KeybagStateChanged"))
  {
    CFDictionaryRef v2 = pu_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "com.apple.notifyd.matching KeybagStateChanged - event received", v9, 2u);
    }

    int v3 = MKBGetDeviceLockState();
    if ((v3 - 3) <= 0xFFFFFFFD)
    {
      int v4 = v3;
      unsigned int v5 = [(id)qword_10001EED8 gizmoWantsNotificationOnNextUnlock];
      unint64_t v6 = pu_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notifying watch of unlock", buf, 2u);
        }

        char v8 = [(id)qword_10001EED8 peer];
        [v8 notifyThisDeviceDidUnlock];

        [(id)qword_10001EED8 setGizmoWantsNotificationOnNextUnlock:0];
      }
      else
      {
        if (v7)
        {
          *(_WORD *)int v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Watch hasn’t asked for a notification of unlock; not bothering",
            v10,
            2u);
        }
      }
      if (v4 == 3) {
        [(id)qword_10001EED8 _handlePasscodeRemoval];
      }
    }
  }
}

void sub_10000EA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_10000EA7C(uint64_t a1)
{
  CFDictionaryRef v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = objc_loadWeakRetained(v2);
    [v4 _removeConnection:v5];

    unint64_t v6 = pu_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Server connection invalidated!", v7, 2u);
    }
  }
}

uint64_t sub_10000F0B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F23C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F3A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v8 = objc_msgSend(WeakRetained, "connections", 0);

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      char v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) remoteObjectProxy];
        [v13 remoteDeviceDidCompleteRemoteAction:v6 == 0 remoteDeviceState:v5 error:v6];

        char v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

void sub_10000F608(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10000F624(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_msgSend(WeakRetained, "connections", 0);

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) remoteObjectProxy];
        [v11 didUnpairForUnlock:v4 == 0 error:v4];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_10000F7D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "copy", 0);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remoteObjectProxy];
        [v10 didEnableOnlyRemoteUnlock:v4 == 0 error:v4];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

void sub_10000F96C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "copy", 0);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remoteObjectProxy];
        [v10 didDisableOnlyRemoteUnlock:v4 == 0 error:v4];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

uint64_t sub_10000FB2C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000FBB8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "copy", 0);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remoteObjectProxy];
        [v10 remoteDeviceDidRemoveLockout:v4 == 0 error:v4];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

void sub_10000FD64(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    int v3 = pu_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100010928((uint64_t)v2, v3);
    }
  }
}

uint64_t start()
{
  if (qword_10001EEF8 != -1) {
    dispatch_once(&qword_10001EEF8, &stru_100018AD8);
  }
  id v1 = objc_alloc_init(PUServer);
  uint64_t v2 = (void *)qword_10001EEE0;
  qword_10001EEE0 = (uint64_t)v1;

  int v3 = +[NSRunLoop currentRunLoop];
  [v3 run];

  return 0;
}

void sub_10000FEC4(id a1)
{
  char v21 = &off_1000191E8;
  char v22 = &stru_100018AF8;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  uint64_t v2 = (void *)qword_10001EEE8;
  qword_10001EEE8 = v1;

  uint64_t v3 = objc_opt_new();
  id v4 = (void *)qword_10001EEF0;
  qword_10001EEF0 = v3;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)qword_10001EEE8;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [(id)qword_10001EEE8 objectForKeyedSubscript:v9];
        id v11 = [v9 integerValue];
        id v12 = v10;
        long long v13 = +[NSNumber numberWithInteger:v11];
        NSLog(@"setting up signal handler for %@", v13);

        signal((int)v11, (void (__cdecl *)(int))1);
        long long v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, (uintptr_t)v11, 0, (dispatch_queue_t)&_dispatch_main_q);
        dispatch_source_set_event_handler(v14, v12);

        dispatch_resume(v14);
        [(id)qword_10001EEF0 setObject:v14 forKeyedSubscript:v9];
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

void sub_1000100E0(id a1)
{
  uint64_t v1 = pu_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM has been received, exiting...", v2, 2u);
  }

  exit(0);
}

void sub_100010140(char a1, uint64_t a2, NSObject *a3)
{
  id v5 = +[NSNumber numberWithBool:a1 & 1];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "couldn't set wrist detection disabled to %@, error %@", (uint8_t *)&v6, 0x16u);
}

void sub_100010200()
{
  sub_10000A4D4();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Send of message with id:%@ FAILED with error: %@", v2, 0x16u);
}

void sub_10001027C()
{
  sub_10000A4C8();
  sub_10000A4A0((void *)&_mh_execute_header, v0, v1, "Send protobuf FAILED with error %@", v2, v3, v4, v5, v6);
}

void sub_1000102E4()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "Attempted to pair while passcode locked", v2, v3, v4, v5, v6);
}

void sub_100010318()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "Attempted to pair with incorrect passcode", v2, v3, v4, v5, v6);
}

void sub_10001034C()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "FAILED to change passcode back! SOMETHING IS HORRIBLY WRONG", v2, v3, v4, v5, v6);
}

void sub_100010380()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "FAILED to store new passcode! Bailing back to old one", v2, v3, v4, v5, v6);
}

void sub_1000103B4()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "FAILED to change passcode", v2, v3, v4, v5, v6);
}

void sub_1000103E8()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "FAILED to generate random passcode", v2, v3, v4, v5, v6);
}

void sub_10001041C()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "FAILED to change passcode back! SOMETHING IS EVEN MORE HORRIBLY WRONG.", v2, v3, v4, v5, v6);
}

void sub_100010450()
{
  sub_10000A4C8();
  sub_10000A4A0((void *)&_mh_execute_header, v0, v1, "Unlock pairing with new passcode FAILED (%@), bailing back to the old one", v2, v3, v4, v5, v6);
}

void sub_1000104B8()
{
  sub_10000A4C8();
  sub_10000A4A0((void *)&_mh_execute_header, v0, v1, "ERROR notifying paired device that we’re in only-remote-unlock mode: %@", v2, v3, v4, v5, v6);
}

void sub_100010520()
{
  sub_10000A4C8();
  sub_10000A4A0((void *)&_mh_execute_header, v0, v1, "could not enable wrist detection %{public}@", v2, v3, v4, v5, v6);
}

void sub_100010588()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "FAILED to find passcode entry in keychain!", v2, v3, v4, v5, v6);
}

void sub_1000105BC()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "FAILED to change passcode back!", v2, v3, v4, v5, v6);
}

void sub_1000105F0()
{
  sub_10000A4C8();
  sub_10000A4A0((void *)&_mh_execute_header, v0, v1, "ERROR notifying paired device that we’re out of only-remote-unlock mode: %@", v2, v3, v4, v5, v6);
}

void sub_100010658(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000106CC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) actionID]);
  sub_10000A4D4();
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "remote action %@ complete, error = %@", v6, 0x16u);
}

void sub_100010788()
{
  sub_10000A4C8();
  sub_10000A4A0((void *)&_mh_execute_header, v0, v1, "FAILED to disable unly remote unlock: %@", v2, v3, v4, v5, v6);
}

void sub_1000107F0()
{
  sub_10000A4BC();
  sub_10000A484((void *)&_mh_execute_header, v0, v1, "Wrist detect setting wasn't returned from remote device", v2, v3, v4, v5, v6);
}

void sub_100010824()
{
  sub_10000A4C8();
  sub_10000A4A0((void *)&_mh_execute_header, v0, v1, "failed to pair for unlocking: %@", v2, v3, v4, v5, v6);
}

void sub_10001088C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 serviceName];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Connection is missing required entitlement. Rejecting. Service Name: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100010928(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "could not restore wrist detection setting %@", (uint8_t *)&v2, 0xCu);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t NRRawVersionFromString()
{
  return _NRRawVersionFromString();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return _NRVersionIsGreaterThanOrEqual();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecKeyGeneratePair(CFDictionaryRef parameters, SecKeyRef *publicKey, SecKeyRef *privateKey)
{
  return _SecKeyGeneratePair(parameters, publicKey, privateKey);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

id objc_retainAutorelease(id a1)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t pu_log()
{
  return _pu_log();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

id objc_msgSend__handlePasscodeRemoval(void *a1, const char *a2, ...)
{
  return [a1 _handlePasscodeRemoval];
}

id objc_msgSend__retrieveUnlockOnlyPasscode(void *a1, const char *a2, ...)
{
  return [a1 _retrieveUnlockOnlyPasscode];
}

id objc_msgSend_actionID(void *a1, const char *a2, ...)
{
  return [a1 actionID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 defaultPairedDevice];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_errorData(void *a1, const char *a2, ...)
{
  return [a1 errorData];
}

id objc_msgSend_gizmoWantsNotificationOnNextUnlock(void *a1, const char *a2, ...)
{
  return [a1 gizmoWantsNotificationOnNextUnlock];
}

id objc_msgSend_hasIsWristDetectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 hasIsWristDetectionEnabled];
}

id objc_msgSend_hasPasscode(void *a1, const char *a2, ...)
{
  return [a1 hasPasscode];
}

id objc_msgSend_hasPolicy(void *a1, const char *a2, ...)
{
  return [a1 hasPolicy];
}

id objc_msgSend_hasSEP(void *a1, const char *a2, ...)
{
  return [a1 hasSEP];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isModificationAllowed(void *a1, const char *a2, ...)
{
  return [a1 isModificationAllowed];
}

id objc_msgSend_isPasscodeModificationAllowed(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeModificationAllowed];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeSet];
}

id objc_msgSend_isUnlockOnly(void *a1, const char *a2, ...)
{
  return [a1 isUnlockOnly];
}

id objc_msgSend_isWristDetectionDisabled(void *a1, const char *a2, ...)
{
  return [a1 isWristDetectionDisabled];
}

id objc_msgSend_isWristDetectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWristDetectionEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_messageID(void *a1, const char *a2, ...)
{
  return [a1 messageID];
}

id objc_msgSend_minimumLength(void *a1, const char *a2, ...)
{
  return [a1 minimumLength];
}

id objc_msgSend_modificationAllowed(void *a1, const char *a2, ...)
{
  return [a1 modificationAllowed];
}

id objc_msgSend_notifyThisDeviceDidUnlock(void *a1, const char *a2, ...)
{
  return [a1 notifyThisDeviceDidUnlock];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_passcodeMinimumLength(void *a1, const char *a2, ...)
{
  return [a1 passcodeMinimumLength];
}

id objc_msgSend_passcodeState(void *a1, const char *a2, ...)
{
  return [a1 passcodeState];
}

id objc_msgSend_passcodeType(void *a1, const char *a2, ...)
{
  return [a1 passcodeType];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return [a1 peer];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return [a1 policy];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_remoteDeviceDidUnlock(void *a1, const char *a2, ...)
{
  return [a1 remoteDeviceDidUnlock];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_requestRemoteDeviceDisableOnlyRemoteUnlock(void *a1, const char *a2, ...)
{
  return [a1 requestRemoteDeviceDisableOnlyRemoteUnlock];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedUnlockManager(void *a1, const char *a2, ...)
{
  return [a1 sharedUnlockManager];
}

id objc_msgSend_shouldNotify(void *a1, const char *a2, ...)
{
  return [a1 shouldNotify];
}

id objc_msgSend_syncPasscodeState(void *a1, const char *a2, ...)
{
  return [a1 syncPasscodeState];
}

id objc_msgSend_toProtobuf(void *a1, const char *a2, ...)
{
  return [a1 toProtobuf];
}

id objc_msgSend_unlockScreenType(void *a1, const char *a2, ...)
{
  return [a1 unlockScreenType];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_wristDetectDisabledPreference(void *a1, const char *a2, ...)
{
  return [a1 wristDetectDisabledPreference];
}