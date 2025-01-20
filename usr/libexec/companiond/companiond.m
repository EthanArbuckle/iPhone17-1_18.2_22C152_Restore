void sub_1000031A0(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_1000031A8(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_1000031A8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "learn more session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v19.opaque[0] = 0;
    v19.opaque[1] = 0;
    os_activity_scope_enter(v10, &v19);
    v11 = [[CDGetInfoRequest alloc] initWithRapportDictionary:v7];
    v12 = cps_session_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    v13 = objc_alloc_init(CDLearnMoreGetAuthInfoResponse);
    v14 = (void *)GestaltCopyAnswer();
    [(CDLearnMoreGetAuthInfoResponse *)v13 setDeviceClass:v14];

    v15 = (void *)GestaltCopyAnswer();
    [(CDLearnMoreGetAuthInfoResponse *)v13 setDeviceName:v15];

    v16 = [a1 request];
    v17 = [v16 URL];
    [(CDLearnMoreGetAuthInfoResponse *)v13 setURL:v17];

    v18 = [(CDLearnMoreGetAuthInfoResponse *)v13 makeRapportDictionary];
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v18, 0, 0);

    os_activity_scope_leave(&v19);
  }
}

void sub_1000033B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000033D4(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000033DC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "learn more session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v17.opaque[0] = 0;
    v17.opaque[1] = 0;
    os_activity_scope_enter(v10, &v17);
    v11 = [[CDLearnMoreDidFinishRequest alloc] initWithRapportDictionary:v7];
    v12 = cps_session_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_activity_scope_state_s v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    id v13 = objc_alloc_init((Class)CPSDevice);
    v14 = [(CDLearnMoreDidFinishRequest *)v11 deviceName];
    [v13 setName:v14];

    v15 = [(CDLearnMoreDidFinishRequest *)v11 deviceModel];
    [v13 setModel:v15];

    [v13 setFlags:-[CDLearnMoreDidFinishRequest deviceFlags](v11, "deviceFlags")];
    [a1 _notifyDeviceAcceptedNotification:v13];
    id v16 = objc_alloc_init((Class)CPSLearnMoreResponse);
    [a1 _notifySessionFinished:v16];
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);

    os_activity_scope_leave(&v17);
  }
}

void sub_1000035D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000037C0(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000037C8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v25.opaque[0] = 0;
    v25.opaque[1] = 0;
    os_activity_scope_enter(v10, &v25);
    v11 = [[CDGetInfoRequest alloc] initWithRapportDictionary:v7];
    v12 = cps_session_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    id v13 = [a1 request];
    v14 = [v13 approversAppleAccountAltDSIDs];
    BOOL v15 = v14 == 0;

    if (v15
      || ([(CDGetInfoRequest *)v11 appleAccountToken],
          id v16 = objc_claimAutoreleasedReturnValue(),
          [(CDGetInfoRequest *)v11 nonce],
          os_activity_scope_state_s v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = sub_100003E38(a1, v16, v17),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      os_activity_scope_state_s v19 = objc_alloc_init(CDRestrictedAccessGetAuthInfoResponse);
      v20 = (void *)GestaltCopyAnswer();
      [(CDRestrictedAccessGetAuthInfoResponse *)v19 setDeviceClass:v20];

      v21 = (void *)GestaltCopyAnswer();
      [(CDRestrictedAccessGetAuthInfoResponse *)v19 setDeviceName:v21];

      v22 = [a1 request];
      -[CDRestrictedAccessGetAuthInfoResponse setRestrictionType:](v19, "setRestrictionType:", [v22 restrictionType]);

      v23 = [(CDRestrictedAccessGetAuthInfoResponse *)v19 makeRapportDictionary];
      (*((void (**)(id, void *, void, void))v9 + 2))(v9, v23, 0, 0);
    }
    else
    {
      v24 = cps_session_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100021494(v24);
      }

      NSErrorF();
      os_activity_scope_state_s v19 = (CDRestrictedAccessGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, CDRestrictedAccessGetAuthInfoResponse *))v9 + 2))(v9, 0, 0, v19);
    }

    os_activity_scope_leave(&v25);
  }
}

void sub_100003AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100003AC8(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100003AD0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v19.opaque[0] = 0;
    v19.opaque[1] = 0;
    os_activity_scope_enter(v10, &v19);
    v11 = [[CDRestrictedAccesssDidFinishAuthRequest alloc] initWithRapportDictionary:v7];
    v12 = cps_session_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    id v13 = objc_alloc_init((Class)CPSDevice);
    v14 = [(CDRestrictedAccesssDidFinishAuthRequest *)v11 deviceName];
    [v13 setName:v14];

    BOOL v15 = [(CDRestrictedAccesssDidFinishAuthRequest *)v11 deviceModel];
    [v13 setModel:v15];

    [v13 setFlags:-[CDRestrictedAccesssDidFinishAuthRequest deviceFlags](v11, "deviceFlags")];
    id v16 = [v13 model];
    BOOL v17 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v17) {
      [a1 _notifyDeviceAcceptedNotification:v13];
    }
    if ([(CDRestrictedAccesssDidFinishAuthRequest *)v11 isApproved])
    {
      id v18 = objc_alloc_init((Class)CPSRestrictedAccessResponse);
      [a1 _notifySessionFinished:v18];
    }
    else
    {
      id v18 = [(CDRestrictedAccesssDidFinishAuthRequest *)v11 error];
      [a1 _notifySessionFailed:v18];
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    os_activity_scope_leave(&v19);
  }
}

void sub_100003D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void *sub_100003E38(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = [a1 request];
    id v8 = [v7 approversAppleAccountAltDSIDs];

    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = 0;
          if (v6 && *(void *)(*((void *)&v19 + 1) + 8 * i))
          {
            v14 = +[NSString stringWithFormat:@"%@+%@", *(void *)(*((void *)&v19 + 1) + 8 * i), v6];
            BOOL v15 = [v14 dataUsingEncoding:4];
            if (v15)
            {
              id v16 = malloc_type_malloc(0x40uLL, 0x57A31864uLL);
              id v17 = v15;
              [v17 bytes];
              [v17 length];
              CryptoHashOneShot();
              id v13 = +[NSData dataWithBytesNoCopy:v16 length:64 freeWhenDone:1];
            }
            else
            {
              id v13 = 0;
            }
          }
          if ([v13 isEqualToData:v5])
          {
            unsigned __int8 v23 = 1;

            a1 = (void *)v23;
            goto LABEL_18;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    a1 = 0;
  }
LABEL_18:

  return a1;
}

void sub_100004370(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100004378(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create((void *)&_mh_execute_header, "sharing session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v19.opaque[0] = 0;
    v19.opaque[1] = 0;
    os_activity_scope_enter(v10, &v19);
    uint64_t v11 = [[CDGetInfoRequest alloc] initWithRapportDictionary:v7];
    v12 = cps_session_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    id v13 = objc_alloc_init(CDSharingGetAuthInfoResponse);
    v14 = (void *)GestaltCopyAnswer();
    [(CDSharingGetAuthInfoResponse *)v13 setDeviceClass:v14];

    BOOL v15 = (void *)GestaltCopyAnswer();
    [(CDSharingGetAuthInfoResponse *)v13 setDeviceName:v15];

    id v16 = [a1 request];
    id v17 = [v16 requestData];
    [(CDSharingGetAuthInfoResponse *)v13 setRequestData:v17];

    id v18 = [(CDSharingGetAuthInfoResponse *)v13 makeRapportDictionary];
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v18, 0, 0);

    os_activity_scope_leave(&v19);
  }
}

void sub_100004580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000045A4(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000045AC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create((void *)&_mh_execute_header, "sharing session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v15.opaque[0] = 0;
    v15.opaque[1] = 0;
    os_activity_scope_enter(v10, &v15);
    uint64_t v11 = [[CDSharingDidFinishAuthRequest alloc] initWithRapportDictionary:v7];
    v12 = cps_session_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    id v13 = [(CDSharingDidFinishAuthRequest *)v11 error];

    if (v13)
    {
      id v14 = [(CDSharingDidFinishAuthRequest *)v11 error];
      [a1 _notifySessionFailed:v14];
    }
    else
    {
      id v14 = objc_alloc_init((Class)CPSSharingResponse);
      [a1 _notifySessionFinished:v14];
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    os_activity_scope_leave(&v15);
  }
}

void sub_100004764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

unsigned char *sub_100004980(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[41]) {
    return [result _activated];
  }
  return result;
}

id sub_100004A54(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

id sub_100004DE0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"serviceListener"];
  return [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"currentSession"];
}

id sub_1000052AC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDeviceTappedNotification:a2];
}

id sub_1000052B8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDeviceStartedAuthentication:a2];
}

id sub_1000052C4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDidFinishWithResponse:a2];
}

id sub_1000052D0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDidFailWithError:a2];
}

void sub_1000052DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

void sub_100005740(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 114)) {
    sub_100005754(v1);
  }
}

void sub_100005754(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 176));
    sub_100005A08((id)a1);
    if (*(void *)(a1 + 152))
    {
      sub_100005B04(a1);
    }
    else
    {
      sub_100005B9C((id)a1);
      uint64_t v2 = *(void *)(a1 + 168);
      if (v2 == 2)
      {
        sub_100005E88(a1);
      }
      else if (v2 == 1)
      {
        sub_100005DA4(a1);
      }
      else
      {
        sub_1000058A0(a1);
      }
    }
  }
}

void sub_100005898(uint64_t a1)
{
}

void sub_1000058A0(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 176));
    if (!*(unsigned char *)(a1 + 114))
    {
      uint64_t v2 = cps_session_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Session invalidated.", v14, 2u);
      }

      [*(id *)(a1 + 16) invalidate];
      v3 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;

      [*(id *)(a1 + 24) invalidate];
      uint64_t v4 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      [*(id *)(a1 + 32) invalidate];
      id v5 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      id v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      [*(id *)(a1 + 40) invalidate];
      id v7 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      [*(id *)(a1 + 48) invalidate];
      id v8 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      [*(id *)(a1 + 56) invalidate];
      id v9 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;

      [*(id *)(a1 + 128) cancel];
      id v10 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = 0;

      if (!*(unsigned char *)(a1 + 136) && !*(unsigned char *)(a1 + 112)) {
        [*(id *)(a1 + 144) invalidate];
      }
      uint64_t v11 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = 0;

      uint64_t v12 = *(void *)(a1 + 200);
      if (v12)
      {
        (*(void (**)(void))(v12 + 16))();
        id v13 = *(void **)(a1 + 200);
        *(void *)(a1 + 200) = 0;
      }
      *(unsigned char *)(a1 + 114) = 1;
    }
  }
}

id sub_100005A08(id result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = cps_session_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting system monitor.", buf, 2u);
    }

    id v3 = objc_alloc_init((Class)CUSystemMonitor);
    uint64_t v4 = (void *)*((void *)v1 + 5);
    *((void *)v1 + 5) = v3;

    [*((id *)v1 + 5) setDispatchQueue:*((void *)v1 + 22)];
    id v5 = (void *)*((void *)v1 + 5);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100007F78;
    v6[3] = &unk_1000347D8;
    v6[4] = v1;
    [v5 setScreenOnChangedHandler:v6];
    return [*((id *)v1 + 5) activateWithCompletion:&stru_100034A10];
  }
  return result;
}

void sub_100005B04(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (id *)(a1 + 152);
    if ([*(id *)(a1 + 152) authType] == (id)14)
    {
      sub_100007BB0(a1);
    }
    else
    {
      id v3 = cps_session_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1000214D8(v2, v3);
      }

      sub_1000058A0(a1);
    }
  }
}

id sub_100005B9C(id result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = cps_session_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting device discovery.", buf, 2u);
    }

    id v3 = objc_alloc_init((Class)SFDeviceDiscovery);
    uint64_t v4 = (void *)*((void *)v1 + 6);
    *((void *)v1 + 6) = v3;

    [*((id *)v1 + 6) setDispatchQueue:*((void *)v1 + 22)];
    [*((id *)v1 + 6) setChangeFlags:1];
    [*((id *)v1 + 6) setDiscoveryFlags:16];
    id v5 = (void *)*((void *)v1 + 6);
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 bundleIdentifier];
    [v5 setPurpose:v7];

    [*((id *)v1 + 6) setScanRate:30];
    [*((id *)v1 + 6) setRssiThreshold:-75];
    [*((id *)v1 + 6) setOverrideScreenOff:1];
    id v8 = (void *)*((void *)v1 + 6);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100007C78;
    v13[3] = &unk_1000349A8;
    v13[4] = v1;
    [v8 setDeviceChangedHandler:v13];
    id v9 = (void *)*((void *)v1 + 6);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100007DDC;
    v12[3] = &unk_1000349D0;
    v12[4] = v1;
    [v9 setDeviceLostHandler:v12];
    id v10 = (void *)*((void *)v1 + 6);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100007EB8;
    v11[3] = &unk_100034878;
    v11[4] = v1;
    return [v10 activateWithCompletion:v11];
  }
  return result;
}

void sub_100005DA4(uint64_t a1)
{
  if (a1)
  {
    id v2 = objc_alloc_init((Class)RPCompanionLinkDevice);
    [v2 setIdentifier:*(void *)(a1 + 160)];
    id v3 = objc_alloc_init((Class)RPCompanionLinkClient);
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v3;

    [*(id *)(a1 + 16) setDispatchQueue:*(void *)(a1 + 176)];
    [*(id *)(a1 + 16) setControlFlags:0x80000103800];
    [*(id *)(a1 + 16) setDestinationDevice:v2];
    id v5 = *(void **)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000061FC;
    v6[3] = &unk_100034878;
    v6[4] = a1;
    [v5 activateWithCompletion:v6];
  }
}

void sub_100005E88(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting legacy app sign in session.", buf, 2u);
    }

    uint64_t v4 = +[ACAccountStore defaultStore];
    uint64_t v5 = [v4 ams_activeiCloudAccount];
    id v6 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v5;

    if (*(void *)(a1 + 64))
    {
      id v7 = objc_alloc_init((Class)RPCompanionLinkDevice);
      [v7 setIdentifier:*(void *)(a1 + 160)];
      id v8 = objc_alloc_init((Class)RPCompanionLinkClient);
      id v9 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v8;

      [*(id *)(a1 + 16) setDispatchQueue:*(void *)(a1 + 176)];
      [*(id *)(a1 + 16) setDestinationDevice:v7];
      id v10 = *(void **)(a1 + 16);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100009D4C;
      v12[3] = &unk_100034878;
      v12[4] = a1;
      [v10 activateWithCompletion:v12];
    }
    else
    {
      uint64_t v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100021564();
      }

      sub_1000058A0(a1);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_100006044(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_100006064(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = cps_session_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100021598();
    }

    uint64_t v5 = *(void *)(a1 + 192);
    if (v5)
    {
      if (v3)
      {
        (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
      }
      else
      {
        id v6 = +[NSError errorWithDomain:CPSErrorDomain code:100 userInfo:0];
        (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
      }
    }
  }
}

void sub_100006128(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = cps_session_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Authentication session finished: %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 184);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
  }
}

void sub_1000061FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = cps_session_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100021600();
    }

    sub_1000058A0(*(void *)(a1 + 32));
  }
  else
  {
    sub_100006274(*(void *)(a1 + 32));
  }
}

void sub_100006274(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "auth session/send get auth type request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending get auth type request.", buf, 2u);
    }

    uint64_t v4 = *(void **)(a1 + 16);
    uint64_t v5 = *(void *)(a1 + 120);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000063A8;
    v6[3] = &unk_1000348A0;
    v6[4] = a1;
    [v4 sendRequestID:@"com.apple.CompanionAuthentication.GetAuthType" request:&__NSDictionary0__struct options:v5 responseHandler:v6];
    os_activity_scope_leave(&state);
  }
}

void sub_100006390(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_1000063A8(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000063B0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle get auth type response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v17.opaque[0] = 0;
    v17.opaque[1] = 0;
    os_activity_scope_enter(v10, &v17);
    if (v9)
    {
      uint64_t v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000216B0();
      }

      sub_1000058A0((uint64_t)a1);
    }
    else
    {
      uint64_t v12 = [[CDGetAuthTypeResponse alloc] initWithRapportDictionary:v7];
      id v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_activity_scope_state_s v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth type response: %@", buf, 0xCu);
      }

      int64_t v14 = [(CDGetAuthTypeResponse *)v12 authType];
      uint64_t v15 = 2;
      switch(v14)
      {
        case 1:
          sub_100006698((uint64_t)a1, [(CDGetAuthTypeResponse *)v12 isSandboxPurchase]);
          break;
        case 2:
        case 5:
        case 6:
          a1[10] = [(CDGetAuthTypeResponse *)v12 authFlags];
          sub_100006838((uint64_t)a1);
          break;
        case 4:
          goto LABEL_16;
        case 7:
          uint64_t v15 = 3;
          goto LABEL_16;
        case 8:
          uint64_t v15 = 4;
LABEL_16:
          a1[12] = v15;
          a1[13] = [(CDGetAuthTypeResponse *)v12 authFlags];
          sub_10000690C((uint64_t)a1);
          break;
        case 9:
          sub_1000069E0((uint64_t)a1);
          break;
        case 10:
          sub_100006AB4((uint64_t)a1);
          break;
        case 11:
          sub_100006B88((uint64_t)a1);
          break;
        case 12:
          sub_100006CFC((uint64_t)a1);
          break;
        case 13:
          sub_100006DD0((uint64_t)a1);
          break;
        default:
          id v16 = cps_session_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100021668(buf, [(CDGetAuthTypeResponse *)v12 authType], v16);
          }

          sub_1000058A0((uint64_t)a1);
          break;
      }
    }
    os_activity_scope_leave(&v17);
  }
}

void sub_100006634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100006698(uint64_t a1, int a2)
{
  if (a1)
  {
    uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    uint64_t v5 = cps_session_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting store purchase session.", v13, 2u);
    }

    int v6 = (id *)&AMSAccountMediaTypeAppStoreSandbox;
    if (!a2) {
      int v6 = (id *)&AMSAccountMediaTypeProduction;
    }
    id v7 = *v6;
    id v8 = +[ACAccountStore ams_sharedAccountStoreForMediaType:v7];
    id v9 = [v8 ams_activeiTunesAccount];

    if (v9 && (objc_msgSend(v9, "ams_isLocalAccount") & 1) == 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    uint64_t v11 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v10;

    if (*(void *)(a1 + 88))
    {
      sub_100008278(a1);
    }
    else
    {
      uint64_t v12 = cps_session_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100021718();
      }

      sub_1000058A0(a1);
    }

    os_activity_scope_leave(&state);
  }
}

void sub_10000681C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_100006838(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "app sign in session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting app sign in session.", v4, 2u);
    }

    sub_10000A9E8(a1);
    os_activity_scope_leave(&state);
  }
}

void sub_1000068F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_10000690C(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "system authentication session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting System Authentication session.", v4, 2u);
    }

    sub_10000B8AC(a1);
    os_activity_scope_leave(&state);
  }
}

void sub_1000069C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_1000069E0(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "sharing session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting Sharing session.", v4, 2u);
    }

    sub_10000C5E0(a1);
    os_activity_scope_leave(&state);
  }
}

void sub_100006A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_100006AB4(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting Restricted Access session.", v4, 2u);
    }

    sub_10000CEC4(a1);
    os_activity_scope_leave(&state);
  }
}

void sub_100006B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_100006B88(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting store authentication session.", v9, 2u);
    }

    uint64_t v4 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeProduction];
    uint64_t v5 = [v4 ams_activeiTunesAccount];

    if (v5 && (objc_msgSend(v5, "ams_isLocalAccount") & 1) == 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    id v7 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v6;

    if (*(void *)(a1 + 88))
    {
      sub_100008EFC(a1);
    }
    else
    {
      id v8 = cps_session_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100021718();
      }

      sub_1000058A0(a1);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_100006CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_100006CFC(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "tv provider session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting TV Provider session.", v4, 2u);
    }

    sub_10000DAA4(a1);
    os_activity_scope_leave(&state);
  }
}

void sub_100006DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_100006DD0(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "learn more session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting Learn More session.", v4, 2u);
    }

    sub_10000E09C(a1);
    os_activity_scope_leave(&state);
  }
}

void sub_100006E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_100006EA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create((void *)&_mh_execute_header, "auth session/send get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    id v8 = cps_session_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending get notif info request: %@", buf, 0xCu);
    }

    id v9 = *(void **)(a1 + 16);
    uint64_t v10 = [v5 makeRapportDictionary];
    uint64_t v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (void *)v10;
    }
    else {
      uint64_t v12 = &__NSDictionary0__struct;
    }
    uint64_t v13 = *(void *)(a1 + 120);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100007078;
    v14[3] = &unk_1000348C8;
    id v15 = v6;
    [v9 sendRequestID:@"com.apple.CompanionAuthentication.GetNotifInfo" request:v12 options:v13 responseHandler:v14];

    os_activity_scope_leave(&state);
  }
}

void sub_100007058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

uint64_t sub_100007078(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007088(uint64_t a1)
{
  if (a1)
  {
    id v2 = _os_activity_create((void *)&_mh_execute_header, "auth session/send did tap notif event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v10.opaque[0] = 0;
    v10.opaque[1] = 0;
    os_activity_scope_enter(v2, &v10);
    id v3 = +[CPSDevice currentDevice];
    uint64_t v4 = objc_alloc_init(CDDeviceUpdateEvent);
    -[CDDeviceUpdateEvent setDeviceFlags:](v4, "setDeviceFlags:", [v3 flags]);
    id v5 = [v3 model];
    [(CDDeviceUpdateEvent *)v4 setDeviceModel:v5];

    id v6 = [v3 name];
    [(CDDeviceUpdateEvent *)v4 setDeviceName:v6];

    id v7 = cps_session_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending did tap notif event: %@", buf, 0xCu);
    }

    id v8 = *(void **)(a1 + 16);
    id v9 = [(CDDeviceUpdateEvent *)v4 makeRapportDictionary];
    [v8 sendEventID:@"com.apple.CompanionAuthentication.DidTapNotif" event:v9 options:*(void *)(a1 + 120) completion:&stru_100034908];

    os_activity_scope_leave(&v10);
  }
}

void sub_100007234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100007258(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002174C();
    }
  }
}

void sub_1000072B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create((void *)&_mh_execute_header, "auth session/send get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    id v8 = cps_session_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending get auth info request: %@", buf, 0xCu);
    }

    id v9 = *(void **)(a1 + 16);
    uint64_t v10 = [v5 makeRapportDictionary];
    uint64_t v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (void *)v10;
    }
    else {
      uint64_t v12 = &__NSDictionary0__struct;
    }
    uint64_t v13 = *(void *)(a1 + 120);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100007484;
    v14[3] = &unk_1000348C8;
    id v15 = v6;
    [v9 sendRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" request:v12 options:v13 responseHandler:v14];

    os_activity_scope_leave(&state);
  }
}

void sub_100007464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

uint64_t sub_100007484(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007494(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "auth session/send did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    id v5 = cps_session_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending did finish auth request: %@", buf, 0xCu);
    }

    id v6 = *(void **)(a1 + 16);
    uint64_t v7 = [v3 makeRapportDictionary];
    id v8 = (void *)v7;
    if (v7) {
      id v9 = (void *)v7;
    }
    else {
      id v9 = &__NSDictionary0__struct;
    }
    uint64_t v10 = *(void *)(a1 + 120);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000763C;
    v11[3] = &unk_1000348A0;
    v11[4] = a1;
    [v6 sendRequestID:@"com.apple.CompanionAuthentication.DidFinishAuth" request:v9 options:v10 responseHandler:v11];

    os_activity_scope_leave(&state);
  }
}

void sub_10000761C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000763C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

void sub_100007648(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle did finish auth response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    if (v3)
    {
      id v5 = cps_session_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000217B4();
      }
    }
    else
    {
      id v5 = cps_session_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received did finish auth response.", v6, 2u);
      }
    }

    sub_1000058A0(a1);
    os_activity_scope_leave(&state);
  }
}

void sub_10000773C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_100007758(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007820;
    block[3] = &unk_100034980;
    block[4] = a1;
    id v10 = v6;
    id v9 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100007820(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 160);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000078E0;
  v4[3] = &unk_100034958;
  v4[4] = v2;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  +[TVRCDeviceQuery getConnectionStatusToDeviceWithIdentifier:v3 completion:v4];
}

void sub_1000078E0(uint64_t a1, int a2)
{
  uint64_t v4 = cps_session_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote app isConnected = %d", buf, 8u);
  }

  unsigned int v5 = [*(id *)(*(void *)(a1 + 32) + 40) systemLockStateSync];
  if ((a2 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 48);
LABEL_10:
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    uint64_t v11 = sub_100007A90;
    uint64_t v12 = &unk_100034930;
    id v8 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = v6;
    [v8 setActionHandler:&v9];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    [*(id *)(a1 + 40) activate:v9, v10, v11, v12, v13];

    return;
  }
  id v6 = *(void **)(a1 + 48);
  if (!v6 || v5 != 4) {
    goto LABEL_10;
  }
  uint64_t v7 = cps_session_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remote app is open and connected, will skip presenting notification.", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100007A90(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = cps_session_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 5) {
      uint64_t v7 = "?";
    }
    else {
      uint64_t v7 = off_100034CF0[(int)a2];
    }
    int v11 = 136315394;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification action: %s, error: %@", (uint8_t *)&v11, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = 0;

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

void sub_100007BB0(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 152);
    uint64_t v3 = sub_10000E6D4(a1, v2);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000E79C;
    v5[3] = &unk_100034C30;
    v5[4] = a1;
    id v6 = v2;
    id v4 = v2;
    sub_100007758(a1, v3, v5);
  }
}

void sub_100007C78(uint64_t a1, void *a2)
{
}

void sub_100007C80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && objc_msgSend(v3, "cad_matchesDeviceIdentifier:", *(void *)(a1 + 160)))
  {
    id v5 = cps_session_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Discovery device changed: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 168);
    if (v6 == 2)
    {
      if ([v4 deviceActionType] == 28) {
        goto LABEL_13;
      }
    }
    else if (v6 != 1 || [v4 deviceActionType] == 34)
    {
      goto LABEL_13;
    }
    uint64_t v7 = cps_session_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Discovery device removed nearby action: %@", (uint8_t *)&v8, 0xCu);
    }

    sub_1000058A0(a1);
  }
LABEL_13:
}

void sub_100007DDC(uint64_t a1, void *a2)
{
}

void sub_100007DE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && objc_msgSend(v3, "cad_matchesDeviceIdentifier:", *(void *)(a1 + 160)))
  {
    id v5 = cps_session_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Discovery device lost: %@", (uint8_t *)&v6, 0xCu);
    }

    sub_1000058A0(a1);
  }
}

void sub_100007EB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = cps_session_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002181C();
    }

    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v6 + 48);
    *(void *)(v6 + 48) = 0;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device discovery started.", v7, 2u);
  }
}

void *sub_100007F78(uint64_t a1)
{
  return sub_100007F80(*(void **)(a1 + 32));
}

void *sub_100007F80(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = [(id)result[5] screenOn];
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Screen power changed: %{BOOL}d", (uint8_t *)v5, 8u);
    }

    if (v2)
    {
      id v4 = cps_session_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v5[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping screen sleep timer.", (uint8_t *)v5, 2u);
      }

      return [(id)v1[7] cancel];
    }
    else
    {
      return sub_100008100(v1);
    }
  }
  return result;
}

void sub_100008098(id a1)
{
  uint64_t v1 = cps_session_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "System monitor started.", v2, 2u);
  }
}

void *sub_100008100(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = cps_session_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting screen sleep timer.", buf, 2u);
    }

    id v3 = (void *)v1[7];
    if (!v3)
    {
      id v4 = [objc_alloc((Class)BSContinuousMachTimer) initWithIdentifier:@"CDProviderSession.screenSleepTimer"];
      id v5 = (void *)v1[7];
      v1[7] = v4;

      id v3 = (void *)v1[7];
    }
    uint64_t v6 = v1[22];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008204;
    v7[3] = &unk_100034A38;
    v7[4] = v1;
    return [v3 scheduleWithFireInterval:v6 leewayInterval:v7 queue:60.0 handler:1.0];
  }
  return result;
}

void sub_100008204(uint64_t a1)
{
  unsigned int v2 = cps_session_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Screen sleep timer fired.", v3, 2u);
  }

  sub_1000058A0(*(void *)(a1 + 32));
}

void sub_100008278(uint64_t a1)
{
  if (a1)
  {
    unsigned int v2 = +[NSUUID UUID];
    id v3 = [v2 UUIDString];

    id v4 = objc_alloc_init(CDGetInfoRequest);
    id v5 = [[*(id *)(a1 + 88) ams_altDSID];
    uint64_t v6 = sub_10000838C((uint64_t)v5, (uint64_t)v3);
    [(CDGetInfoRequest *)v4 setStoreAccountToken:v6];

    [(CDGetInfoRequest *)v4 setNonce:v3];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008498;
    v7[3] = &unk_1000348A0;
    v7[4] = a1;
    sub_100006EA4(a1, v4, v7);
  }
}

id sub_10000838C(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = 0;
  if (a1 && a2)
  {
    id v3 = +[NSString stringWithFormat:@"%@+%@", a1, a2];
    id v4 = [v3 dataUsingEncoding:4];
    if (v4)
    {
      id v5 = malloc_type_malloc(0x40uLL, 0x57A31864uLL);
      id v6 = v4;
      [v6 bytes];
      [v6 length];
      CryptoHashOneShot();
      unsigned int v2 = +[NSData dataWithBytesNoCopy:v5 length:64 freeWhenDone:1];
    }
    else
    {
      unsigned int v2 = 0;
    }
  }

  return v2;
}

void sub_100008498(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000084A0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      int v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100021884();
      }

      sub_1000058A0(a1);
    }
    else
    {
      uint64_t v12 = [[CDGetNotifInfoResponse alloc] initWithRapportDictionary:v7];
      __int16 v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get notif info response: %@", buf, 0xCu);
      }

      id v14 = +[CDUserNotificationContent storePurchaseContent];
      [v14 setIdentifier:*(void *)(a1 + 160)];
      id v15 = [(CDGetNotifInfoResponse *)v12 deviceName];
      [v14 addBodyArgument:v15];

      int v16 = +[CUUserNotificationSession cad_sessionWithContent:v14];
      [v16 setDispatchQueue:*(void *)(a1 + 176)];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100008708;
      v17[3] = &unk_100034A60;
      v17[4] = a1;
      sub_100007758(a1, v16, v17);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_1000086D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_100008708(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    sub_100007088(*(void *)(a1 + 32));
    uint64_t v6 = *(void *)(a1 + 32);
    sub_10000876C(v6);
  }
}

void sub_10000876C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = +[NSUUID UUID];
    id v3 = [v2 UUIDString];

    uint64_t v4 = +[CPSDevice currentDevice];
    id v5 = objc_alloc_init(CDGetInfoRequest);
    uint64_t v6 = [*(id *)(a1 + 88) ams_altDSID];
    id v7 = sub_10000838C((uint64_t)v6, (uint64_t)v3);
    [(CDGetInfoRequest *)v5 setStoreAccountToken:v7];

    [(CDGetInfoRequest *)v5 setNonce:v3];
    id v8 = [v4 buildVersion];
    [(CDGetInfoRequest *)v5 setDeviceBuildVersion:v8];

    id v9 = [v4 model];
    [(CDGetInfoRequest *)v5 setDeviceModel:v9];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000088D8;
    v10[3] = &unk_1000348A0;
    v10[4] = a1;
    sub_1000072B0(a1, v5, v10);
  }
}

void sub_1000088D8(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000088E0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      int v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000218EC();
      }

      sub_1000058A0((uint64_t)a1);
    }
    else
    {
      long long v21 = [[CDStorePurchaseGetAuthInfoResponse alloc] initWithRapportDictionary:v7];
      uint64_t v12 = cps_session_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v21;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      __int16 v13 = [(CDStorePurchaseGetAuthInfoResponse *)v21 purchaseRequest];
      id v14 = +[AMSDelegatePurchaseTask bagSubProfile];
      id v15 = +[AMSDelegatePurchaseTask bagSubProfileVersion];
      int v16 = +[AMSBag bagForProfile:v14 profileVersion:v15];

      id v17 = [objc_alloc((Class)AMSDelegatePurchaseTask) initWithDelegatePurchaseRequest:v13 bag:v16 account:a1[11]];
      id v18 = (void *)a1[16];
      a1[16] = v17;

      os_activity_scope_state_s v19 = cps_session_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Submitting purchase request: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, a1);
      long long v20 = dispatch_get_global_queue(2, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008C10;
      block[3] = &unk_100034AD8;
      block[4] = a1;
      objc_copyWeak(&v23, (id *)buf);
      dispatch_async(v20, block);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_100008BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_100008C10(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) performDelegatePurchase];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008CD4;
  v3[3] = &unk_100034AB0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  [v2 addFinishBlock:v3];

  objc_destroyWeak(&v4);
}

void sub_100008CC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100008CD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = cps_session_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100021954();
      }
    }
    id v9 = WeakRetained[22];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008DDC;
    block[3] = &unk_100034A88;
    block[4] = WeakRetained;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

void sub_100008DDC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 114)) {
    sub_100008DF8(v2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
}

void sub_100008DF8(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    uint64_t v10 = objc_alloc_init(CDStorePurchaseDidFinishAuthRequest);
    [(CDStorePurchaseDidFinishAuthRequest *)v10 setPurchaseResult:v6];

    [(CDStorePurchaseDidFinishAuthRequest *)v10 setError:v5];
    id v7 = +[CPSDevice currentDevice];
    -[CDStorePurchaseDidFinishAuthRequest setDeviceFlags:](v10, "setDeviceFlags:", [v7 flags]);
    id v8 = [v7 model];
    [(CDStorePurchaseDidFinishAuthRequest *)v10 setDeviceModel:v8];

    id v9 = [v7 name];
    [(CDStorePurchaseDidFinishAuthRequest *)v10 setDeviceName:v9];

    sub_100007494(a1, v10);
  }
}

void sub_100008EFC(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = +[NSUUID UUID];
    id v3 = [v2 UUIDString];

    id v4 = objc_alloc_init(CDGetInfoRequest);
    id v5 = [*(id *)(a1 + 88) ams_altDSID];
    id v6 = sub_10000838C((uint64_t)v5, (uint64_t)v3);
    [(CDGetInfoRequest *)v4 setStoreAccountToken:v6];

    [(CDGetInfoRequest *)v4 setNonce:v3];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100009010;
    v7[3] = &unk_1000348A0;
    v7[4] = a1;
    sub_100006EA4(a1, v4, v7);
  }
}

void sub_100009010(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100009018(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100021884();
      }

      sub_1000058A0(a1);
    }
    else
    {
      id v12 = [[CDGetNotifInfoResponse alloc] initWithRapportDictionary:v7];
      __int16 v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get notif info response: %@", buf, 0xCu);
      }

      id v14 = +[CDUserNotificationContent storeAuthenticationContent];
      [v14 setIdentifier:*(void *)(a1 + 160)];
      id v15 = [(CDGetNotifInfoResponse *)v12 deviceName];
      [v14 addBodyArgument:v15];

      int v16 = +[CUUserNotificationSession cad_sessionWithContent:v14];
      [v16 setDispatchQueue:*(void *)(a1 + 176)];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100009280;
      v17[3] = &unk_100034A60;
      v17[4] = a1;
      sub_100007758(a1, v16, v17);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_100009250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_100009280(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    sub_100007088(*(void *)(a1 + 32));
    uint64_t v6 = *(void *)(a1 + 32);
    sub_1000092E4(v6);
  }
}

void sub_1000092E4(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = +[NSUUID UUID];
    id v3 = [v2 UUIDString];

    uint64_t v4 = +[CPSDevice currentDevice];
    id v5 = objc_alloc_init(CDGetInfoRequest);
    uint64_t v6 = [[*(id *)(a1 + 88) ams_altDSID];
    id v7 = sub_10000838C((uint64_t)v6, (uint64_t)v3);
    [(CDGetInfoRequest *)v5 setStoreAccountToken:v7];

    [(CDGetInfoRequest *)v5 setNonce:v3];
    id v8 = [v4 buildVersion];
    [(CDGetInfoRequest *)v5 setDeviceBuildVersion:v8];

    id v9 = [v4 model];
    [(CDGetInfoRequest *)v5 setDeviceModel:v9];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100009450;
    v10[3] = &unk_1000348A0;
    v10[4] = a1;
    sub_1000072B0(a1, v5, v10);
  }
}

void sub_100009450(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100009458(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v14.opaque[0] = 0;
    v14.opaque[1] = 0;
    os_activity_scope_enter(v10, &v14);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000218EC();
      }

      sub_1000058A0(a1);
    }
    else
    {
      id v12 = [[CDStoreAuthenticationGetAuthInfoResponse alloc] initWithRapportDictionary:v7];
      __int16 v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      sub_100009608(a1, v12);
    }
    os_activity_scope_leave(&v14);
  }
}

void sub_1000095E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100009608(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/start prox card transaction", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    id v5 = cps_session_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting prox card transaction.", buf, 2u);
    }

    id v6 = objc_alloc_init((Class)SFClient);
    [v6 setDispatchQueue:*(void *)(a1 + 176)];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100009764;
    v7[3] = &unk_100034B00;
    v7[4] = a1;
    id v8 = v3;
    id v9 = v6;
    [v6 startProxCardTransactionWithOptions:127 completion:v7];

    os_activity_scope_leave(&state);
  }
}

void sub_10000974C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_100009764(uint64_t a1, int a2)
{
  uint64_t v4 = cps_session_log();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prox card transaction activated.", v6, 2u);
    }

    sub_100007088(*(void *)(a1 + 32));
    sub_100009824(*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000219BC();
    }

    [*(id *)(a1 + 48) invalidate];
    sub_1000058A0(*(void *)(a1 + 32));
  }
}

void sub_100009824(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    id v8 = objc_alloc_init((Class)CPSStoreAuthenticationRequest);
    id v9 = [v5 authenticationRequest];
    [v8 setAuthenticationRequest:v9];

    uint64_t v10 = +[ACAccountStore ams_sharedAccountStoreForMediaType:0];
    id v11 = [v10 ams_activeiTunesAccount];

    if (v11 && (objc_msgSend(v11, "ams_isLocalAccount") & 1) == 0) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    [v8 setAccount:v12];
    __int16 v13 = objc_alloc_init(CDProviderViewService);
    [(CDProviderViewService *)v13 setDispatchQueue:*(void *)(a1 + 176)];
    [(CDProviderViewService *)v13 setViewControllerClassName:@"StoreAuthenticationViewController"];
    os_activity_scope_state_s v14 = [v5 deviceName];
    [(CDProviderViewService *)v13 setRemoteDeviceName:v14];

    [(CDProviderViewService *)v13 setStoreAuthenticationRequest:v8];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100009AE4;
    v20[3] = &unk_100034B28;
    v20[4] = a1;
    [(CDProviderViewService *)v13 setStoreAuthenticationCompletionHandler:v20];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100009CD8;
    v19[3] = &unk_100034B50;
    v19[4] = a1;
    [(CDProviderViewService *)v13 setActionHandler:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100009CEC;
    v17[3] = &unk_1000347D8;
    id v18 = v6;
    [(CDProviderViewService *)v13 setInvalidationHandler:v17];
    [(CDProviderViewService *)v13 activateWithCompletionHandler:&stru_100034B70];
    id v15 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v13;
    int v16 = v13;

    os_activity_scope_leave(&state);
  }
}

void sub_100009ACC(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_100009AE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = cps_session_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Store authentication completion {authenticationResult = %@, error = %@}", (uint8_t *)&v8, 0x16u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
  sub_100009BD4(*(void *)(a1 + 32), v5, v6);
}

void sub_100009BD4(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    __int16 v10 = objc_alloc_init(CDStoreAuthenticationDidFinishAuthRequest);
    [(CDStoreAuthenticationDidFinishAuthRequest *)v10 setAuthenticationResult:v6];

    [(CDStoreAuthenticationDidFinishAuthRequest *)v10 setError:v5];
    id v7 = +[CPSDevice currentDevice];
    -[CDStoreAuthenticationDidFinishAuthRequest setDeviceFlags:](v10, "setDeviceFlags:", [v7 flags]);
    int v8 = [v7 model];
    [(CDStoreAuthenticationDidFinishAuthRequest *)v10 setDeviceModel:v8];

    id v9 = [v7 name];
    [(CDStoreAuthenticationDidFinishAuthRequest *)v10 setDeviceName:v9];

    sub_100007494(a1, v10);
  }
}

void sub_100009CD8(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    sub_100009BD4(*(void *)(a1 + 32), 0, a3);
  }
}

id sub_100009CEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_100009CF4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000219F0();
    }
  }
}

void sub_100009D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    sub_1000058A0(v2);
  }
  else {
    sub_100009D5C(v2);
  }
}

void sub_100009D5C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = +[NSUUID UUID];
    id v3 = [v2 UUIDString];

    uint64_t v4 = objc_alloc_init(CDGetInfoRequest);
    id v5 = +[ACAccountStore defaultStore];
    id v6 = [v5 aa_primaryAppleAccount];

    id v7 = [v6 aa_altDSID];
    int v8 = sub_10000838C((uint64_t)v7, (uint64_t)v3);
    [(CDGetInfoRequest *)v4 setAppleAccountToken:v8];

    [(CDGetInfoRequest *)v4 setNonce:v3];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009E98;
    v9[3] = &unk_1000348A0;
    v9[4] = a1;
    sub_100006EA4(a1, v4, v9);
  }
}

void sub_100009E98(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100009EA0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    __int16 v10 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    id v11 = [v9 domain];
    if ([v11 isEqualToString:RPErrorDomain])
    {
      BOOL v12 = [v9 code] == (id)-6714;

      if (v12)
      {
        __int16 v13 = +[CDUserNotificationContent legacyAppSignInContent];
        os_activity_scope_state_s v14 = [*(id *)(a1 + 64) username];
        [v13 addBodyArgument:v14];

        cps_session_log();
        id v15 = (CDGetNotifInfoResponse *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, &v15->super, OS_LOG_TYPE_DEFAULT, "Request not handled. Will show legacy app sign in notification.", buf, 2u);
        }
        goto LABEL_14;
      }
    }
    else
    {
    }
    if (v9)
    {
      int v16 = cps_session_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100021884();
      }

      sub_1000058A0(a1);
      goto LABEL_15;
    }
    id v15 = [[CDGetNotifInfoResponse alloc] initWithRapportDictionary:v7];
    id v17 = cps_session_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received get notif info response: %@", buf, 0xCu);
    }

    __int16 v13 = +[CDUserNotificationContent appSignInContent];
    id v18 = [(CDGetNotifInfoResponse *)v15 appName];
    [v13 addTitleArgument:v18];

    os_activity_scope_state_s v19 = [(CDGetNotifInfoResponse *)v15 deviceName];
    [v13 addBodyArgument:v19];

LABEL_14:
    [v13 setIdentifier:*(void *)(a1 + 160)];
    long long v20 = +[CUUserNotificationSession cad_sessionWithContent:v13];
    [v20 setDispatchQueue:*(void *)(a1 + 176)];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000A1E8;
    v21[3] = &unk_100034A60;
    v21[4] = a1;
    sub_100007758(a1, v20, v21);

LABEL_15:
    os_activity_scope_leave(&state);
  }
}

void sub_10000A1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000A1E8(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    sub_10000A244(v6);
  }
}

void sub_10000A244(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/send get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    id v3 = +[CPSDevice currentDevice];
    uint64_t v4 = objc_alloc_init(CDGetInfoRequest);
    -[CDGetInfoRequest setDeviceFlags:](v4, "setDeviceFlags:", [v3 flags]);
    id v5 = [v3 model];
    [(CDGetInfoRequest *)v4 setDeviceModel:v5];

    uint64_t v6 = [v3 name];
    [(CDGetInfoRequest *)v4 setDeviceName:v6];

    id v7 = cps_session_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_activity_scope_state_s v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending get auth info request: %@", buf, 0xCu);
    }

    id v8 = *(void **)(a1 + 16);
    id v9 = [(CDGetInfoRequest *)v4 makeRapportDictionary];
    uint64_t v10 = *(void *)(a1 + 120);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000A458;
    v11[3] = &unk_1000348A0;
    v11[4] = a1;
    [v8 sendRequestID:@"com.apple.AuthKit.StartAuthorization" request:v9 options:v10 responseHandler:v11];

    os_activity_scope_leave(&state);
  }
}

void sub_10000A434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000A458(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000A460(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000218EC();
      }

      sub_1000058A0(a1);
    }
    else
    {
      BOOL v12 = [[CDLegacyAppSignInGetAuthInfoResponse alloc] initWithRapportDictionary:v7];
      __int16 v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      os_activity_scope_state_s v14 = [(CDLegacyAppSignInGetAuthInfoResponse *)v12 credentialRequest];
      id v15 = (CDLegacyAppSignInGetAuthInfoResponse *)[v14 copy];

      id v16 = objc_alloc_init((Class)AKAuthorizationController);
      id v17 = cps_session_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Submitting credential request: %@", buf, 0xCu);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000A6F4;
      v18[3] = &unk_100034B98;
      v18[4] = a1;
      [v16 performAuthorizationWithContext:v15 completion:v18];
    }
    os_activity_scope_leave(&state);
  }
}

void sub_10000A6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000A6F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = cps_session_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100021A58();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 176);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A7F0;
  block[3] = &unk_100034A88;
  block[4] = v8;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void sub_10000A7F0(uint64_t a1)
{
}

void sub_10000A800(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/send did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    uint64_t v8 = objc_alloc_init(CDLegacyAppSignInDidFinishAuthRequest);
    [(CDLegacyAppSignInDidFinishAuthRequest *)v8 setAuthorization:v5];
    [(CDLegacyAppSignInDidFinishAuthRequest *)v8 setError:v6];
    id v9 = cps_session_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending did finish auth request: %@", buf, 0xCu);
    }

    id v10 = *(void **)(a1 + 16);
    id v11 = [(CDLegacyAppSignInDidFinishAuthRequest *)v8 makeRapportDictionary];
    uint64_t v12 = *(void *)(a1 + 120);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000A9DC;
    v13[3] = &unk_1000348A0;
    v13[4] = a1;
    [v10 sendRequestID:@"com.apple.AuthKit.AuthorizationDidFinish" request:v11 options:v12 responseHandler:v13];

    os_activity_scope_leave(&state);
  }
}

void sub_10000A9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000A9DC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

void sub_10000A9E8(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = +[NSUUID UUID];
    id v3 = [v2 UUIDString];

    uint64_t v4 = objc_alloc_init(CDGetInfoRequest);
    id v5 = +[ACAccountStore defaultStore];
    id v6 = [v5 aa_primaryAppleAccount];

    id v7 = [v6 aa_altDSID];
    uint64_t v8 = sub_10000838C((uint64_t)v7, (uint64_t)v3);
    [(CDGetInfoRequest *)v4 setAppleAccountToken:v8];

    [(CDGetInfoRequest *)v4 setNonce:v3];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000AB24;
    v9[3] = &unk_1000348A0;
    v9[4] = a1;
    sub_100006EA4(a1, v4, v9);
  }
}

void sub_10000AB24(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000AB2C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create((void *)&_mh_execute_header, "app sign in session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100021884();
      }

      sub_1000058A0(a1);
    }
    else
    {
      uint64_t v12 = [[CDGetNotifInfoResponse alloc] initWithRapportDictionary:v7];
      id v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get notif info response: %@", buf, 0xCu);
      }

      if (*(unsigned char *)(a1 + 80))
      {
        id v14 = +[CDUserNotificationContent registerPasskeyContent];
        id v15 = [(CDGetNotifInfoResponse *)v12 appName];
        [v14 addBodyArgument:v15];
      }
      else
      {
        id v14 = +[CDUserNotificationContent appSignInContent];
        id v15 = [(CDGetNotifInfoResponse *)v12 appName];
        [v14 addTitleArgument:v15];
      }

      id v16 = [(CDGetNotifInfoResponse *)v12 deviceName];
      [v14 addBodyArgument:v16];

      [v14 setIdentifier:*(void *)(a1 + 160)];
      id v17 = +[CUUserNotificationSession cad_sessionWithContent:v14];
      [v17 setDispatchQueue:*(void *)(a1 + 176)];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000AE0C;
      v18[3] = &unk_100034A60;
      v18[4] = a1;
      sub_100007758(a1, v17, v18);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_10000ADDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000AE0C(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    sub_100007088(*(void *)(a1 + 32));
    uint64_t v6 = *(void *)(a1 + 32);
    sub_10000AE70(v6);
  }
}

void sub_10000AE70(uint64_t a1)
{
  if (a1)
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472;
    v1[2] = sub_10000AEE8;
    v1[3] = &unk_1000348A0;
    v1[4] = a1;
    sub_1000072B0(a1, 0, v1);
  }
}

void sub_10000AEE8(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000AEF0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create((void *)&_mh_execute_header, "app sign in session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000218EC();
      }

      sub_1000058A0(a1);
    }
    else
    {
      uint64_t v12 = [[CDAppSignInGetAuthInfoResponse alloc] initWithRapportDictionary:v7];
      id v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_activity_scope_state_s v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      id v14 = [(CDAppSignInGetAuthInfoResponse *)v12 webRequest];
      BOOL v15 = v14 == 0;

      if (v15)
      {
        id v16 = +[CDAppSignInUtilities credentialRequestFromClientAuthenticationContext:v12];
        id v18 = objc_alloc_init((Class)ASCAgentProxy);
        os_activity_scope_state_s v19 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v18;

        long long v20 = cps_session_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          os_activity_scope_state_s v25 = v16;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Submitting credential request: %@", buf, 0xCu);
        }

        long long v21 = *(void **)(a1 + 72);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10000B424;
        v22[3] = &unk_100034BC0;
        v22[4] = a1;
        [v21 performAuthorizationRequestsForContext:v16 withCompletionHandler:v22];
      }
      else
      {
        id v16 = [(CDAppSignInGetAuthInfoResponse *)v12 webRequest];
        id v17 = [(CDAppSignInGetAuthInfoResponse *)v12 appDomains];
        sub_10000B1CC(a1, v16, v17);
      }
    }
    os_activity_scope_leave(&state);
  }
}

void sub_10000B19C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000B1CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      uint64_t v12 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"webRequest != ((void *)0)"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100021AC0("_performWebAuthenticationWithRequest:proxiedAppDomains:", a1, (uint64_t)v12);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10000B3FCLL);
    }
    id v7 = _os_activity_create((void *)&_mh_execute_header, "CompAuth/WebAuth/perform", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    id v8 = cps_session_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing web authentication: %@", buf, 0xCu);
    }

    id v9 = objc_alloc_init(CDProviderViewService);
    [(CDProviderViewService *)v9 setDispatchQueue:*(void *)(a1 + 176)];
    [(CDProviderViewService *)v9 setViewControllerClassName:@"WebAuthenticationViewController"];
    [(CDProviderViewService *)v9 setWebAuthenticationRequest:v5];
    [(CDProviderViewService *)v9 setProxiedAppDomains:v6];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000B734;
    v13[3] = &unk_100034BE8;
    v13[4] = a1;
    [(CDProviderViewService *)v9 setWebAuthenticationCompletionHandler:v13];
    [(CDProviderViewService *)v9 activateWithCompletionHandler:&stru_100034C08];
    id v10 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v9;
    id v11 = v9;

    os_activity_scope_leave(&state);
  }
}

void sub_10000B404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000B424(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = cps_session_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100021A58();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 176);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B520;
  block[3] = &unk_100034A88;
  block[4] = v8;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void sub_10000B520(uint64_t a1)
{
}

void sub_10000B530(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = objc_alloc_init(CDAppSignInDidFinishAuthRequest);
    uint64_t v8 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = [v5 authorization];
      [(CDAppSignInDidFinishAuthRequest *)v7 setAppleIDAuthorization:v10];
    }
    else
    {
      id v11 = self;
      char v12 = objc_opt_isKindOfClass();

      if ((v12 & 1) == 0)
      {
        id v16 = self;
        char v17 = objc_opt_isKindOfClass();

        if (v17)
        {
          [(CDAppSignInDidFinishAuthRequest *)v7 setPlatformKeyCredentialAssertion:v5];
        }
        else
        {
          id v18 = self;
          char v19 = objc_opt_isKindOfClass();

          if (v19)
          {
            [(CDAppSignInDidFinishAuthRequest *)v7 setPlatformKeyCredentialRegistration:v5];
          }
          else
          {
            if (v5)
            {
              long long v20 = cps_session_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
                sub_100021BC4();
              }
            }
            [(CDAppSignInDidFinishAuthRequest *)v7 setError:v6];
          }
        }
        goto LABEL_7;
      }
      id v13 = objc_alloc((Class)CASPasswordCredential);
      id v14 = [v5 user];
      BOOL v15 = [v5 password];
      id v10 = [v13 initWithUser:v14 password:v15];

      [(CDAppSignInDidFinishAuthRequest *)v7 setPasswordCredential:v10];
    }

LABEL_7:
    sub_100007494(a1, v7);
  }
}

void sub_10000B734(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = cps_session_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100021C2C();
    }
  }
  sub_10000B7B8(*(void *)(a1 + 32), v5, v6);
}

void sub_10000B7B8(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = objc_alloc_init(CDAppSignInDidFinishAuthRequest);
    [(CDAppSignInDidFinishAuthRequest *)v7 setWebCallbackURL:v6];

    [(CDAppSignInDidFinishAuthRequest *)v7 setError:v5];
    sub_100007494(a1, v7);
  }
}

void sub_10000B854(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000219F0();
    }
  }
}

void sub_10000B8AC(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = +[NSUUID UUID];
    id v3 = [v2 UUIDString];

    uint64_t v4 = objc_alloc_init(CDGetInfoRequest);
    id v5 = +[ACAccountStore defaultStore];
    id v6 = [v5 aa_primaryAppleAccount];

    id v7 = [v6 aa_altDSID];
    uint64_t v8 = sub_10000838C((uint64_t)v7, (uint64_t)v3);
    [(CDGetInfoRequest *)v4 setAppleAccountToken:v8];

    [(CDGetInfoRequest *)v4 setNonce:v3];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000B9E8;
    v9[3] = &unk_1000348A0;
    v9[4] = a1;
    sub_1000072B0(a1, v4, v9);
  }
}

void sub_10000B9E8(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000B9F0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create((void *)&_mh_execute_header, "system authentication session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000218EC();
      }

      sub_1000058A0(a1);
    }
    else
    {
      char v12 = [[CDSystemAuthenticationGetAuthInfoResponse alloc] initWithRapportDictionary:v7];
      id v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      id v14 = sub_10000BC08(a1, v12);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000BDFC;
      v15[3] = &unk_100034C30;
      v15[4] = a1;
      v15[5] = v12;
      sub_100007758(a1, v14, v15);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_10000BBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_10000BC08(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[CDUserNotificationContent notificationContentForSystemService:*(void *)(a1 + 96)];
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 96);
      if (v5 == 2)
      {
        id v6 = [v3 deviceName];
        [v4 addBodyArgument:v6];

        uint64_t v5 = *(void *)(a1 + 96);
      }
      if (v5 == 3)
      {
        id v7 = +[ACAccountStore defaultStore];
        id v8 = [v7 aa_primaryAppleAccount];

        id v9 = [v8 username];
        [v4 addBodyArgument:v9];

        id v10 = [v3 deviceName];
        [v4 addBodyArgument:v10];

        uint64_t v5 = *(void *)(a1 + 96);
      }
      if (v5 == 4)
      {
        id v11 = [v3 deviceName];
        [v4 addBodyArgument:v11];
      }
      char v12 = +[CUUserNotificationSession cad_sessionWithContent:v4];
      [v12 setDispatchQueue:*(void *)(a1 + 176)];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

void sub_10000BDFC(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  id v6 = cps_session_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 5) {
      id v7 = "?";
    }
    else {
      id v7 = off_100034CF0[a2];
    }
    int v10 = 136315394;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification action: %s, error: %@", (uint8_t *)&v10, 0x16u);
  }

  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = 0;

    sub_10000BF10(*(void *)(a1 + 32), *(void **)(a1 + 40));
  }
}

void sub_10000BF10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "system authentication session/start prox card transaction", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    id v5 = cps_session_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting prox card transaction.", buf, 2u);
    }

    id v6 = objc_alloc_init((Class)SFClient);
    [v6 setDispatchQueue:*(void *)(a1 + 176)];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000C06C;
    v7[3] = &unk_100034B00;
    v7[4] = a1;
    id v8 = v3;
    id v9 = v6;
    [v6 startProxCardTransactionWithOptions:127 completion:v7];

    os_activity_scope_leave(&state);
  }
}

void sub_10000C054(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_10000C06C(uint64_t a1, int a2)
{
  uint64_t v4 = cps_session_log();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prox card transaction activated.", v6, 2u);
    }

    sub_100007088(*(void *)(a1 + 32));
    sub_10000C12C(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000219BC();
    }

    [*(id *)(a1 + 48) invalidate];
    sub_1000058A0(*(void *)(a1 + 32));
  }
}

void sub_10000C12C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create((void *)&_mh_execute_header, "system authentication session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    id v8 = objc_alloc_init((Class)CPSSystemAuthenticationRequest);
    [v8 setService:a1[12]];
    [v8 setOptions:a1[13]];
    id v9 = objc_alloc_init(CDProviderViewService);
    [(CDProviderViewService *)v9 setDispatchQueue:a1[22]];
    [(CDProviderViewService *)v9 setViewControllerClassName:@"ConfirmViewController"];
    int v10 = [v5 deviceName];
    [(CDProviderViewService *)v9 setRemoteDeviceName:v10];

    [(CDProviderViewService *)v9 setSystemAuthenticationRequest:v8];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000C338;
    v18[3] = &unk_100034B50;
    v18[4] = a1;
    [(CDProviderViewService *)v9 setActionHandler:v18];
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    BOOL v15 = sub_10000C560;
    id v16 = &unk_1000347D8;
    id v17 = v6;
    [(CDProviderViewService *)v9 setInvalidationHandler:&v13];
    -[CDProviderViewService activateWithCompletionHandler:](v9, "activateWithCompletionHandler:", &stru_100034C50, v13, v14, v15, v16);
    id v11 = (void *)a1[18];
    a1[18] = v9;
    __int16 v12 = v9;

    os_activity_scope_leave(&state);
  }
}

void sub_10000C320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_10000C338(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = cps_session_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) >= 3)
    {
      id v7 = +[NSString stringWithFormat:@"(unknown: %ld)", a2];
    }
    else
    {
      id v7 = off_100034D20[a2 - 1];
    }
    *(_DWORD *)buf = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received view service action: %@, error: %@", buf, 0x16u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = a2 == 3;
  sub_10000C468(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(a1 + 32) + 136), v5);
}

void sub_10000C468(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v9 = objc_alloc_init(CDSystemAuthenticationDidFinishAuthRequest);
    [(CDSystemAuthenticationDidFinishAuthRequest *)v9 setEnabled:a2];
    [(CDSystemAuthenticationDidFinishAuthRequest *)v9 setError:v5];

    id v6 = +[CPSDevice currentDevice];
    -[CDSystemAuthenticationDidFinishAuthRequest setDeviceFlags:](v9, "setDeviceFlags:", [v6 flags]);
    id v7 = [v6 model];
    [(CDSystemAuthenticationDidFinishAuthRequest *)v9 setDeviceModel:v7];

    id v8 = [v6 name];
    [(CDSystemAuthenticationDidFinishAuthRequest *)v9 setDeviceName:v8];

    sub_100007494(a1, v9);
  }
}

id sub_10000C560(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_10000C568(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000219F0();
    }
  }
}

void sub_10000C5C0(uint64_t a1)
{
}

void sub_10000C5D0(uint64_t a1)
{
}

void sub_10000C5E0(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = +[NSUUID UUID];
    id v3 = [v2 UUIDString];

    uint64_t v4 = objc_alloc_init(CDGetInfoRequest);
    id v5 = +[ACAccountStore defaultStore];
    id v6 = [v5 aa_primaryAppleAccount];

    id v7 = [v6 aa_altDSID];
    id v8 = sub_10000838C((uint64_t)v7, (uint64_t)v3);
    [(CDGetInfoRequest *)v4 setAppleAccountToken:v8];

    [(CDGetInfoRequest *)v4 setNonce:v3];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C71C;
    v9[3] = &unk_1000348A0;
    v9[4] = a1;
    sub_1000072B0(a1, v4, v9);
  }
}

void sub_10000C71C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000C724(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    __int16 v10 = _os_activity_create((void *)&_mh_execute_header, "sharing session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000218EC();
      }

      sub_1000058A0(a1);
    }
    else
    {
      __int16 v12 = [[CDSharingGetAuthInfoResponse alloc] initWithRapportDictionary:v7];
      id v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      uint64_t v14 = sub_10000C93C(a1, v12);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000CAF0;
      v15[3] = &unk_100034C30;
      v15[4] = a1;
      v15[5] = v12;
      sub_100007758(a1, v14, v15);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_10000C910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_10000C93C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)GestaltCopyAnswer();
    id v5 = v4;
    if (!v4)
    {
      id v5 = +[NSNull null];
    }
    v11[0] = v5;
    id v6 = [v3 deviceName];
    id v7 = v6;
    if (!v6)
    {
      id v7 = +[NSNull null];
    }
    v11[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v11 count:2];
    if (!v6) {

    }
    if (!v4) {
    id v9 = objc_alloc_init((Class)CUUserNotificationSession);
    }
    [v9 setFlags:1];
    [v9 setIdentifier:*(void *)(a1 + 160)];
    [v9 setBundleID:@"com.apple.CompanionNotifications"];
    [v9 setCategoryID:@"CDUserNotificationCategoryGeneric"];
    [v9 setTitleKey:@"Apple TV"];
    [v9 setBodyKey:@"Use your %@ to share from “%@”."];
    [v9 setBodyArguments:v8];
    [v9 setDispatchQueue:*(void *)(a1 + 176)];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_10000CAF0(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    sub_10000CB4C(v6, v7);
  }
}

void sub_10000CB4C(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    sub_100007088(a1);
    sub_10000CBAC(a1, v3);
  }
}

void sub_10000CBAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "sharing session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    id v5 = objc_alloc_init(CDProviderViewService);
    [(CDProviderViewService *)v5 setDispatchQueue:*(void *)(a1 + 176)];
    [(CDProviderViewService *)v5 setViewControllerClassName:@"SharingViewController"];
    uint64_t v6 = [v3 deviceName];
    [(CDProviderViewService *)v5 setRemoteDeviceName:v6];

    id v7 = [v3 requestData];
    [(CDProviderViewService *)v5 setSharingData:v7];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000CD24;
    v8[3] = &unk_100034B50;
    v8[4] = a1;
    [(CDProviderViewService *)v5 setActionHandler:v8];
    [(CDProviderViewService *)v5 setInvalidationHandler:&stru_100034C70];
    [(CDProviderViewService *)v5 activateWithCompletionHandler:&stru_100034C90];

    os_activity_scope_leave(&state);
  }
}

void sub_10000CD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000CD24(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = cps_session_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received view service dismissal, error: %@", (uint8_t *)&v6, 0xCu);
  }

  sub_10000CDE8(*(void *)(a1 + 32), v4);
}

void sub_10000CDE8(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v4 = objc_alloc_init(CDSharingDidFinishAuthRequest);
    [(CDSharingDidFinishAuthRequest *)v4 setError:v3];

    sub_100007494(a1, v4);
  }
}

void sub_10000CE6C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000219F0();
    }
  }
}

void sub_10000CEC4(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = +[NSUUID UUID];
    id v3 = [v2 UUIDString];

    id v4 = objc_alloc_init(CDGetInfoRequest);
    id v5 = +[ACAccountStore defaultStore];
    int v6 = [v5 aa_primaryAppleAccount];

    id v7 = [v6 aa_altDSID];
    id v8 = sub_10000838C((uint64_t)v7, (uint64_t)v3);
    [(CDGetInfoRequest *)v4 setAppleAccountToken:v8];

    [(CDGetInfoRequest *)v4 setNonce:v3];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000D000;
    v9[3] = &unk_1000348A0;
    v9[4] = a1;
    sub_1000072B0(a1, v4, v9);
  }
}

void sub_10000D000(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000D008(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    __int16 v10 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000218EC();
      }

      sub_1000058A0(a1);
    }
    else
    {
      __int16 v12 = [[CDRestrictedAccessGetAuthInfoResponse alloc] initWithRapportDictionary:v7];
      id v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      uint64_t v14 = sub_10000D220(a1, v12);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000D38C;
      v15[3] = &unk_100034C30;
      v15[4] = a1;
      v15[5] = v12;
      sub_100007758(a1, v14, v15);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_10000D1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_10000D220(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = +[CDUserNotificationContent restrictedAccessContentForRestrictionType:](CDUserNotificationContent, "restrictedAccessContentForRestrictionType:", [v3 restrictionType]);
    if (v5)
    {
      int v6 = [v4 currentUserName];
      [v5 addBodyArgument:v6];

      id v7 = [v4 deviceName];
      [v5 addBodyArgument:v7];

      id v8 = +[CUUserNotificationSession cad_sessionWithContent:v5];
      [v8 setDispatchQueue:*(void *)(a1 + 176)];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_10000D38C(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    sub_10000D3E8(v6, v7);
  }
}

void sub_10000D3E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/start prox card transaction", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    id v5 = cps_session_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting prox card transaction.", buf, 2u);
    }

    id v6 = objc_alloc_init((Class)SFClient);
    [v6 setDispatchQueue:*(void *)(a1 + 176)];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D65C;
    v7[3] = &unk_100034B00;
    v7[4] = a1;
    id v8 = v3;
    id v9 = v6;
    [v6 startProxCardTransactionWithOptions:127 completion:v7];

    os_activity_scope_leave(&state);
  }
}

void sub_10000D52C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_10000D544(uint64_t a1)
{
}

void sub_10000D554(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v9 = objc_alloc_init(CDRestrictedAccesssDidFinishAuthRequest);
    [(CDRestrictedAccesssDidFinishAuthRequest *)v9 setApproved:a2];
    [(CDRestrictedAccesssDidFinishAuthRequest *)v9 setError:v5];

    id v6 = +[CPSDevice currentDevice];
    -[CDRestrictedAccesssDidFinishAuthRequest setDeviceFlags:](v9, "setDeviceFlags:", [v6 flags]);
    id v7 = [v6 model];
    [(CDRestrictedAccesssDidFinishAuthRequest *)v9 setDeviceModel:v7];

    id v8 = [v6 name];
    [(CDRestrictedAccesssDidFinishAuthRequest *)v9 setDeviceName:v8];

    sub_100007494(a1, v9);
  }
}

void sub_10000D64C(uint64_t a1)
{
}

void sub_10000D65C(uint64_t a1, int a2)
{
  uint64_t v4 = cps_session_log();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prox card transaction activated.", v6, 2u);
    }

    sub_100007088(*(void *)(a1 + 32));
    sub_10000D71C(*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000219BC();
    }

    [*(id *)(a1 + 48) invalidate];
    sub_1000058A0(*(void *)(a1 + 32));
  }
}

void sub_10000D71C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    id v8 = objc_alloc_init((Class)CPSRestrictedAccessRequest);
    id v9 = objc_alloc_init(CDProviderViewService);
    [(CDProviderViewService *)v9 setDispatchQueue:*(void *)(a1 + 176)];
    [(CDProviderViewService *)v9 setViewControllerClassName:@"ConfirmViewController"];
    __int16 v10 = [v5 deviceName];
    [(CDProviderViewService *)v9 setRemoteDeviceName:v10];

    [(CDProviderViewService *)v9 setRestrictedAccessRequest:v8];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000D914;
    v18[3] = &unk_100034B50;
    v18[4] = a1;
    [(CDProviderViewService *)v9 setActionHandler:v18];
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    BOOL v15 = sub_10000DA44;
    id v16 = &unk_1000347D8;
    id v17 = v6;
    [(CDProviderViewService *)v9 setInvalidationHandler:&v13];
    -[CDProviderViewService activateWithCompletionHandler:](v9, "activateWithCompletionHandler:", &stru_100034CB0, v13, v14, v15, v16);
    id v11 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v9;
    __int16 v12 = v9;

    os_activity_scope_leave(&state);
  }
}

void sub_10000D8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_10000D914(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = cps_session_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) >= 3)
    {
      id v7 = +[NSString stringWithFormat:@"(unknown: %ld)", a2];
    }
    else
    {
      id v7 = off_100034D20[a2 - 1];
    }
    *(_DWORD *)buf = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received view service action: %@, error: %@", buf, 0x16u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = a2 == 3;
  sub_10000D554(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(a1 + 32) + 136), v5);
}

id sub_10000DA44(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_10000DA4C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000219F0();
    }
  }
}

void sub_10000DAA4(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = objc_alloc_init(CDGetInfoRequest);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000DB40;
    v3[3] = &unk_1000348A0;
    void v3[4] = a1;
    sub_1000072B0(a1, v2, v3);
  }
}

void sub_10000DB40(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000DB48(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    __int16 v10 = _os_activity_create((void *)&_mh_execute_header, "tv provider session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000218EC();
      }

      sub_1000058A0(a1);
    }
    else
    {
      __int16 v12 = [[CDTVProviderGetAuthInfoResponse alloc] initWithRapportDictionary:v7];
      id v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      uint64_t v14 = sub_10000DD60(a1, v12);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000DE38;
      v15[3] = &unk_100034C30;
      v15[4] = a1;
      v15[5] = v12;
      sub_100007758(a1, v14, v15);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_10000DD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_10000DD60(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[CDUserNotificationContent tvProviderContent];
    if (v4)
    {
      id v5 = [v3 providerName];
      [v4 addBodyArgument:v5];

      id v6 = [v3 deviceName];
      [v4 addBodyArgument:v6];

      id v7 = +[CUUserNotificationSession cad_sessionWithContent:v4];
      [v7 setDispatchQueue:*(void *)(a1 + 176)];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_10000DE38(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    sub_100007088(*(void *)(a1 + 32));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    sub_10000DE9C(v6, v7);
  }
}

void sub_10000DE9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "tv provider session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    id v5 = objc_alloc_init((Class)CPSTVProviderRequest);
    uint64_t v6 = [v3 providerURL];
    [v5 setProviderURL:v6];

    id v7 = [v3 providerName];
    [v5 setProviderName:v7];

    id v8 = objc_alloc_init(CDProviderViewService);
    [(CDProviderViewService *)v8 setDispatchQueue:*(void *)(a1 + 176)];
    [(CDProviderViewService *)v8 setViewControllerClassName:@"WebViewController"];
    [(CDProviderViewService *)v8 setTvProviderRequest:v5];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_10000E03C;
    v11[3] = &unk_1000347D8;
    v11[4] = a1;
    [(CDProviderViewService *)v8 setInvalidationHandler:v11];
    [(CDProviderViewService *)v8 activateWithCompletionHandler:&stru_100034CD0];
    id v9 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v8;
    __int16 v10 = v8;

    os_activity_scope_leave(&state);
  }
}

void sub_10000E024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000E03C(uint64_t a1)
{
}

void sub_10000E044(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000219F0();
    }
  }
}

void sub_10000E09C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = objc_alloc_init(CDGetInfoRequest);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000E138;
    v3[3] = &unk_1000348A0;
    void v3[4] = a1;
    sub_1000072B0(a1, v2, v3);
  }
}

void sub_10000E138(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000E140(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    __int16 v10 = _os_activity_create((void *)&_mh_execute_header, "learn more session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      id v11 = cps_session_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000218EC();
      }

      sub_1000058A0(a1);
    }
    else
    {
      __int16 v12 = [[CDLearnMoreGetAuthInfoResponse alloc] initWithRapportDictionary:v7];
      id v13 = cps_session_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      uint64_t v14 = sub_10000E358(a1, v12);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000E47C;
      v15[3] = &unk_100034C30;
      v15[4] = a1;
      v15[5] = v12;
      sub_100007758(a1, v14, v15);
    }
    os_activity_scope_leave(&state);
  }
}

void sub_10000E32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_10000E358(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[CDUserNotificationContent learnMoreContent];
    if (v4)
    {
      id v5 = [v3 URL];
      uint64_t v6 = [v5 host];
      id v7 = [v5 path];
      id v8 = [v6 stringByAppendingString:v7];

      [v4 addBodyArgument:v8];
      id v9 = [v3 deviceName];
      [v4 addBodyArgument:v9];

      __int16 v10 = +[CUUserNotificationSession cad_sessionWithContent:v4];
      [v10 setDispatchQueue:*(void *)(a1 + 176)];
    }
    else
    {
      __int16 v10 = 0;
    }
  }
  else
  {
    __int16 v10 = 0;
  }

  return v10;
}

void sub_10000E47C(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    sub_10000E4D8(v6, v7);
  }
}

void sub_10000E4D8(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = +[LSApplicationWorkspace defaultWorkspace];
    id v5 = [v3 URL];

    uint64_t v16 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    id v17 = &__kCFBooleanTrue;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    unsigned __int8 v7 = [v4 openURL:v5 withOptions:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = cps_session_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100021C94(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    sub_10000E604(a1);
  }
}

void sub_10000E604(uint64_t a1)
{
  if (a1)
  {
    id v5 = objc_alloc_init(CDLearnMoreDidFinishRequest);
    uint64_t v2 = +[CPSDevice currentDevice];
    -[CDLearnMoreDidFinishRequest setDeviceFlags:](v5, "setDeviceFlags:", [v2 flags]);
    id v3 = [v2 model];
    [(CDLearnMoreDidFinishRequest *)v5 setDeviceModel:v3];

    uint64_t v4 = [v2 name];
    [(CDLearnMoreDidFinishRequest *)v5 setDeviceName:v4];

    sub_100007494(a1, v5);
  }
}

id sub_10000E6D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = +[CDUserNotificationContent dedicatedCameraContentForDeviceType:](CDUserNotificationContent, "dedicatedCameraContentForDeviceType:", [v3 deviceType]);
    if (v5)
    {
      uint64_t v6 = [v4 deviceName];
      [v5 addBodyArgument:v6];

      unsigned __int8 v7 = +[CUUserNotificationSession cad_sessionWithContent:v5];
      [v7 setDispatchQueue:*(void *)(a1 + 176)];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

void sub_10000E79C(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    unsigned __int8 v7 = *(void **)(a1 + 40);
    sub_10000E7F8(v6, v7);
  }
}

void sub_10000E7F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "dedicated camera session/start prox card transaction", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    id v5 = cps_session_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting prox card transaction.", buf, 2u);
    }

    id v6 = objc_alloc_init((Class)SFClient);
    [v6 setDispatchQueue:*(void *)(a1 + 176)];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000ED60;
    v7[3] = &unk_100034B00;
    v7[4] = a1;
    id v8 = v3;
    id v9 = v6;
    [v6 startProxCardTransactionWithOptions:127 completion:v7];

    os_activity_scope_leave(&state);
  }
}

void sub_10000E93C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_10000E954(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    unsigned __int8 v7 = _os_activity_create((void *)&_mh_execute_header, "dedicated camera provider session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    id v8 = objc_alloc_init(CDProviderViewService);
    [(CDProviderViewService *)v8 setDispatchQueue:*(void *)(a1 + 176)];
    [(CDProviderViewService *)v8 setViewControllerClassName:@"DedicatedCameraViewController"];
    [(CDProviderViewService *)v8 setDedicatedCameraRequest:v5];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000EB48;
    v13[3] = &unk_100034800;
    id v14 = v6;
    uint64_t v15 = a1;
    [(CDProviderViewService *)v8 setInvalidationHandler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000EB84;
    v12[3] = &unk_100034B50;
    v12[4] = a1;
    [(CDProviderViewService *)v8 setActionHandler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_10000ECE8;
    v11[3] = &unk_100034878;
    v11[4] = a1;
    [(CDProviderViewService *)v8 activateWithCompletionHandler:v11];
    id v9 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v8;
    uint64_t v10 = v8;

    os_activity_scope_leave(&state);
  }
}

void sub_10000EB34(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_10000EB48(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 40);

  sub_1000058A0(v2);
}

void sub_10000EB84(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = cps_session_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) >= 3)
    {
      unsigned __int8 v7 = +[NSString stringWithFormat:@"(unknown: %ld)", a2];
    }
    else
    {
      unsigned __int8 v7 = off_100034D20[a2 - 1];
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received view service action: %@, error: %@", buf, 0x16u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = a2 == 3;
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 136))
  {
    id v9 = objc_alloc_init((Class)CPSDedicatedCameraResponse);
    sub_100006128(v8, v9);
  }
  else
  {
    sub_100006064(*(void *)(a1 + 32), v5);
  }
  sub_1000058A0(*(void *)(a1 + 32));
}

void sub_10000ECE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = cps_session_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000219F0();
    }

    sub_100006064(*(void *)(a1 + 32), v3);
    sub_1000058A0(*(void *)(a1 + 32));
  }
}

void sub_10000ED60(uint64_t a1, int a2)
{
  uint64_t v4 = cps_session_log();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prox card transaction activated.", v6, 2u);
    }

    sub_10000E954(*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000219BC();
    }

    [*(id *)(a1 + 48) invalidate];
    sub_1000058A0(*(void *)(a1 + 32));
  }
}

void sub_10000EF70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000EF98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10000EFB4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000F200(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000F208(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v29.opaque[0] = 0;
    v29.opaque[1] = 0;
    os_activity_scope_enter(v10, &v29);
    uint64_t v11 = [[CDGetInfoRequest alloc] initWithRapportDictionary:v7];
    __int16 v12 = cps_session_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    id v13 = [(CDGetInfoRequest *)v11 storeAccountToken];
    id v14 = [(CDGetInfoRequest *)v11 nonce];
    unsigned __int8 v15 = sub_10000F8F4(a1, v13, v14);

    if (v15)
    {
      uint64_t v16 = objc_alloc_init(CDStoreAuthenticationGetAuthInfoResponse);
      [(CDStoreAuthenticationGetAuthInfoResponse *)v16 setAuthenticationRequest:a1[14]];
      id v17 = (void *)GestaltCopyAnswer();
      [(CDStoreAuthenticationGetAuthInfoResponse *)v16 setDeviceClass:v17];

      id v18 = (void *)GestaltCopyAnswer();
      [(CDStoreAuthenticationGetAuthInfoResponse *)v16 setDeviceName:v18];

      char v19 = cps_session_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending get auth info response: %@", buf, 0xCu);
      }

      long long v20 = [(CDStoreAuthenticationGetAuthInfoResponse *)v16 makeRapportDictionary];
      (*((void (**)(id, void *, void, void))v9 + 2))(v9, v20, 0, 0);
    }
    else
    {
      long long v21 = cps_session_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100021D04(v21, v22, v23, v24, v25, v26, v27, v28);
      }

      NSErrorF();
      uint64_t v16 = (CDStoreAuthenticationGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, CDStoreAuthenticationGetAuthInfoResponse *))v9 + 2))(v9, 0, 0, v16);
    }

    os_activity_scope_leave(&v29);
  }
}

void sub_10000F4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000F51C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000F524(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v26.opaque[0] = 0;
    v26.opaque[1] = 0;
    os_activity_scope_enter(v10, &v26);
    uint64_t v11 = [[CDStoreAuthenticationDidFinishAuthRequest alloc] initWithRapportDictionary:v7];
    id v12 = objc_alloc_init((Class)CPSDevice);
    id v13 = [(CDStoreAuthenticationDidFinishAuthRequest *)v11 deviceName];
    [v12 setName:v13];

    id v14 = [(CDStoreAuthenticationDidFinishAuthRequest *)v11 deviceModel];
    [v12 setModel:v14];

    [v12 setFlags:-[CDStoreAuthenticationDidFinishAuthRequest deviceFlags](v11, "deviceFlags")];
    unsigned __int8 v15 = [v12 model];
    BOOL v16 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v16) {
      [a1 _notifyDeviceAcceptedNotification:v12];
    }
    id v17 = cps_session_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    id v18 = [(CDStoreAuthenticationDidFinishAuthRequest *)v11 authenticationResult];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      id v23 = [(CDStoreAuthenticationDidFinishAuthRequest *)v11 error];
      [a1 _notifySessionFailed:v23];
    }
    else
    {
      long long v20 = [v8 bs_safeStringForKey:RPOptionSenderModelID];
      long long v21 = [v8 bs_safeNumberForKey:RPOptionStatusFlags];
      id v22 = [v21 unsignedIntegerValue];
      if (CPSMetrics) {
        +[CPSMetrics sendProviderDeviceUsageEvent:](CPSMetrics, "sendProviderDeviceUsageEvent:", v20, v22);
      }
      else {

      }
      id v24 = objc_alloc((Class)CPSStoreAuthenticationResponse);
      uint64_t v25 = [(CDStoreAuthenticationDidFinishAuthRequest *)v11 authenticationResult];
      id v23 = [v24 initWithAuthenticationResult:v25];

      [a1 _notifySessionFinished:v23];
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    [a1 _invalidated];

    os_activity_scope_leave(&v26);
  }
}

void sub_10000F810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void *sub_10000F8F4(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = (void *)a1[15];
    id v7 = a2;
    uint64_t v8 = [v6 ams_altDSID];
    id v9 = (void *)v8;
    uint64_t v10 = 0;
    if (v5 && v8)
    {
      uint64_t v11 = +[NSString stringWithFormat:@"%@+%@", v8, v5];
      id v12 = [v11 dataUsingEncoding:4];
      if (v12)
      {
        id v13 = malloc_type_malloc(0x40uLL, 0x57A31864uLL);
        id v14 = v12;
        [v14 bytes];
        [v14 length];
        CryptoHashOneShot();
        uint64_t v10 = +[NSData dataWithBytesNoCopy:v13 length:64 freeWhenDone:1];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    a1 = [v10 isEqualToData:v7];
  }
  return a1;
}

id sub_10000FC54(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"connection"];
}

void sub_10000FD30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    if ([v10 hasStorePurchaseEntitlement])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
    }
    else
    {
      WeakRetained = +[NSError errorWithDomain:CPSErrorDomain code:103 userInfo:0];
      v8[2](v8, WeakRetained);
    }
  }
}

void sub_10000FE10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    id v9 = [v7 overrideBundleIdentifier];

    if (v9)
    {
      if ([v13 hasAppSignInOverrideBundleIdentifierEntitlement])
      {
        if (_BSIsInternalInstall()) {
          goto LABEL_5;
        }
        uint64_t v11 = CPSErrorDomain;
        uint64_t v12 = 101;
      }
      else
      {
        uint64_t v11 = CPSErrorDomain;
        uint64_t v12 = 103;
      }
      WeakRetained = +[NSError errorWithDomain:v11 code:v12 userInfo:0];
      v8[2](v8, WeakRetained);
      goto LABEL_9;
    }
LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained serviceConnection:a1 serviceClient:v13 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
LABEL_9:
  }
}

void sub_10000FF34(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    if ([v10 hasSystemAuthenticationEntitlement])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
    }
    else
    {
      WeakRetained = +[NSError errorWithDomain:CPSErrorDomain code:103 userInfo:0];
      v8[2](v8, WeakRetained);
    }
  }
}

void sub_100010014(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (a1)
  {
    id v7 = (id *)(a1 + 16);
    id v8 = a4;
    id v9 = a3;
    id v10 = a2;
    id WeakRetained = objc_loadWeakRetained(v7);
    [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v9 completionHandler:v8];
  }
}

void sub_1000100B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v10 hasRestrictedAccessEntitlement])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
    }
    else
    {
      id WeakRetained = +[NSError errorWithDomain:CPSErrorDomain code:103 userInfo:0];
      v8[2](v8, WeakRetained);
    }
  }
}

void sub_100010198(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v10 hasStoreAuthenticationEntitlement])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
    }
    else
    {
      id WeakRetained = +[NSError errorWithDomain:CPSErrorDomain code:103 userInfo:0];
      v8[2](v8, WeakRetained);
    }
  }
}

void sub_100010278(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v10 hasDedicatedCameraEntitlement])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
    }
    else
    {
      id WeakRetained = +[NSError errorWithDomain:CPSErrorDomain code:103 userInfo:0];
      v8[2](v8, WeakRetained);
    }
  }
}

void sub_100010888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_1000108B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = cps_service_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100021D74((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Started authentication session.", v12, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100010E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10001100C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100011030(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = cps_service_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100021E68((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_1000111E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10001120C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = cps_service_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100021E68((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

id sub_1000117EC(uint64_t a1)
{
  return self;
}

void sub_1000118D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    uint64_t v3 = *(void *)(a1 + 40);
LABEL_4:
    uint64_t v4 = NSErrorWithOSStatusF();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    uint64_t v5 = *(void *)(a1 + 32);
    sub_100011998(v5);
    return;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 49)) {
    goto LABEL_4;
  }
  uint64_t v6 = *(void **)(a1 + 40);

  sub_100011AF4(v2, v6);
}

void sub_100011998(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
    if (!*(unsigned char *)(a1 + 49))
    {
      *(unsigned char *)(a1 + 49) = 1;
      uint64_t v2 = [*(id *)(a1 + 24) remoteObjectProxyWithErrorHandler:&stru_100034DF0];
      [v2 cancel];

      [*(id *)(a1 + 16) invalidate];
      uint64_t v3 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;

      [*(id *)(a1 + 24) invalidate];
      uint64_t v4 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      [*(id *)(a1 + 32) invalidate];
      uint64_t v5 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      uint64_t v6 = *(void *)(a1 + 56);
      if (v6)
      {
        (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, 1, 0);
        uint64_t v7 = *(void **)(a1 + 56);
        *(void *)(a1 + 56) = 0;
      }
      uint64_t v8 = *(void *)(a1 + 128);
      if (v8)
      {
        uint64_t v9 = NSErrorF();
        (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

        uint64_t v10 = *(void **)(a1 + 128);
        *(void *)(a1 + 128) = 0;
      }
      uint64_t v11 = *(void *)(a1 + 72);
      if (v11)
      {
        (*(void (**)(void))(v11 + 16))();
        uint64_t v12 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = 0;
      }
    }
  }
}

void sub_100011AF4(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t v5 = v3;
    *(unsigned char *)(a1 + 48) = 1;
    if (*(void *)(a1 + 88))
    {
      sub_100011C20((id)a1);
      sub_100011C90(a1);
      v5[2](v5, 0);
    }
    else
    {
      uint64_t v4 = NSErrorWithOSStatusF();
      ((void (**)(id, void *))v5)[2](v5, v4);
    }
    uint64_t v3 = v5;
  }
}

void sub_100011C18(uint64_t a1)
{
}

id sub_100011C20(id result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = +[NSXPCListener anonymousListener];
    uint64_t v3 = (void *)*((void *)v1 + 2);
    *((void *)v1 + 2) = v2;

    [*((id *)v1 + 2) _setQueue:*((void *)v1 + 8)];
    [*((id *)v1 + 2) setDelegate:v1];
    uint64_t v4 = (void *)*((void *)v1 + 2);
    return [v4 resume];
  }
  return result;
}

void sub_100011C90(uint64_t a1)
{
  if (a1)
  {
    id v8 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.CompanionViewService" viewControllerClassName:*(void *)(a1 + 88)];
    id v2 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    uint64_t v3 = [*(id *)(a1 + 16) endpoint];
    uint64_t v4 = [v3 _endpoint];
    [v2 setXpcEndpoint:v4];

    uint64_t v5 = sub_100011DD4((void *)a1);
    [v2 setUserInfo:v5];

    id v6 = +[SBSRemoteAlertHandle newHandleWithDefinition:v8 configurationContext:v2];
    uint64_t v7 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v6;

    [*(id *)(a1 + 32) registerObserver:a1];
    [*(id *)(a1 + 32) activateWithContext:0];
  }
}

id *sub_100011D98(id *a1)
{
  if (a1)
  {
    a1 = [a1[3] remoteObjectProxyWithErrorHandler:&stru_100034DF0];
    uint64_t v1 = vars8;
  }
  return a1;
}

void *sub_100011DD4(void *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = +[NSMutableDictionary dictionary];
    uint64_t v3 = sub_100011E58(v1);
    [v2 setObject:v3 forKeyedSubscript:@"presentationContextData"];

    uint64_t v1 = [v2 copy];
  }

  return v1;
}

void *sub_100011E58(void *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init((Class)CPSViewServicePresentationContext);
    [v2 setDeviceName:v1[10]];
    [v2 setSystemAuthenticationRequest:v1[13]];
    [v2 setWebAuthenticationRequest:v1[14]];
    [v2 setProxiedAppDomains:v1[15]];
    [v2 setSharingData:v1[12]];
    [v2 setRestrictedAccessRequest:v1[17]];
    [v2 setStoreAuthenticationRequest:v1[18]];
    [v2 setTvProviderRequest:v1[20]];
    [v2 setDedicatedCameraRequest:v1[21]];
    id v6 = 0;
    uint64_t v1 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v6];
    id v3 = v6;
    if (!v1)
    {
      uint64_t v4 = cps_daemon_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100021F4C((uint64_t)v3, v4);
      }
    }
  }

  return v1;
}

void sub_100011F80(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = cps_daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100021FC4((uint64_t)v2, v3);
  }
}

void sub_10001218C(uint64_t a1)
{
}

void sub_100012344(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  if (v3)
  {
    (*(void (**)(void, uint64_t, void))(v3 + 16))(*(void *)(v2 + 56), 2, *(void *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  sub_100011998(v2);
}

void sub_1000123AC(uint64_t a1)
{
}

void sub_1000124D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, 3, 0);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;
  }
}

void sub_1000125D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  if (v3)
  {
    (*(void (**)(void, uint64_t, void))(v3 + 16))(*(void *)(v2 + 56), 2, *(void *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  sub_100011998(v2);
}

void sub_1000126D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 128);
  if (v3)
  {
    (*(void (**)(void, void, void))(v3 + 16))(*(void *)(v2 + 128), *(void *)(a1 + 40), 0);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  sub_100011998(v2);
}

void sub_1000127D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 128);
  if (v3)
  {
    (*(void (**)(void, void, void))(v3 + 16))(*(void *)(v2 + 128), 0, *(void *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  sub_100011998(v2);
}

void sub_1000128B4(uint64_t a1)
{
}

void sub_100012954(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  if (v3)
  {
    (*(void (**)(void, uint64_t, void))(v3 + 16))(*(void *)(v2 + 56), 2, *(void *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  sub_100011998(v2);
}

void sub_100012A54(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 152);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 40), 0);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 152);
    *(void *)(v3 + 152) = 0;
  }
}

void sub_100012B54(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 152);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, *(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 152);
    *(void *)(v3 + 152) = 0;
  }
}

unsigned char *sub_100012EC4(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[9]) {
    return [result _activated];
  }
  return result;
}

id sub_100012F4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

id sub_100012FC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startRapportDiscovery];
}

id sub_10001304C()
{
  if (qword_10003FEF8 != -1) {
    dispatch_once(&qword_10003FEF8, &stru_100034E38);
  }
  v0 = (void *)qword_10003FEF0;

  return v0;
}

uint64_t sub_1000131FC(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100013348(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = 0;

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v8, a3);
  }
}

void sub_1000133CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

void sub_100013450(id a1)
{
  qword_10003FEF0 = (uint64_t)os_log_create("com.apple.CompanionServices", "CDDeviceDiscovery");

  _objc_release_x1();
}

unsigned char *sub_100013580(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[9]) {
    return [result _activated];
  }
  return result;
}

id sub_100013608(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

id sub_100013768(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleDeviceFound:a2];
}

void sub_100013774(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100013840();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000220C4((uint64_t)v3, v5);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Discovery started.", v8, 2u);
    }

    [*(id *)(a1 + 32) _startDiscoveryTimer];
  }
}

id sub_100013840()
{
  if (qword_10003FF08 != -1) {
    dispatch_once(&qword_10003FF08, &stru_100034E80);
  }
  v0 = (void *)qword_10003FF00;

  return v0;
}

id sub_100013B38(uint64_t a1)
{
  uint64_t v2 = sub_100013840();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Timer fired.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100013C3C(id a1)
{
  qword_10003FF00 = (uint64_t)os_log_create("com.apple.CompanionServices", "CDRapportDiscovery");

  _objc_release_x1();
}

void sub_100013D34(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "CompAuth/RapportClient/handleRequest", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v10, &v14);
  if (!*(unsigned char *)(a1 + 40)
    || (objc_msgSend(v8, "bs_safeNumberForKey:", RPOptionStatusFlags),
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 integerValue],
        v11,
        (v12 & 0x80000) != 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000221B4();
    }
    id v13 = NSErrorF();
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v13);
  }
  os_activity_scope_leave(&v14);
}

void sub_100013E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100013F5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "CompAuth/RapportClient/handleEvent", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v7, &v10);
  if (!*(unsigned char *)(a1 + 40)
    || (objc_msgSend(v6, "bs_safeNumberForKey:", RPOptionStatusFlags),
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 integerValue],
        v8,
        (v9 & 0x80000) != 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000221B4();
  }
  os_activity_scope_leave(&v10);
}

void sub_100014054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100014184(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10001418C(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    os_activity_scope_state_s v10 = _os_activity_create((void *)&_mh_execute_header, "system auth session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v24.opaque[0] = 0;
    v24.opaque[1] = 0;
    os_activity_scope_enter(v10, &v24);
    uint64_t v11 = [[CDGetInfoRequest alloc] initWithRapportDictionary:v7];
    unsigned int v12 = cps_session_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_activity_scope_state_s v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    id v13 = [a1 request];
    os_activity_scope_state_s v14 = [v13 appleAccountAltDSID];
    BOOL v15 = v14 == 0;

    if (v15
      || ([(CDGetInfoRequest *)v11 appleAccountToken],
          BOOL v16 = objc_claimAutoreleasedReturnValue(),
          [(CDGetInfoRequest *)v11 nonce],
          id v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = sub_100014A3C(a1, v16, v17),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      BOOL v19 = objc_alloc_init(CDSystemAuthenticationGetAuthInfoResponse);
      long long v20 = (void *)GestaltCopyAnswer();
      [(CDSystemAuthenticationGetAuthInfoResponse *)v19 setDeviceClass:v20];

      long long v21 = (void *)GestaltCopyAnswer();
      [(CDSystemAuthenticationGetAuthInfoResponse *)v19 setDeviceName:v21];

      id v22 = [(CDSystemAuthenticationGetAuthInfoResponse *)v19 makeRapportDictionary];
      (*((void (**)(id, void *, void, void))v9 + 2))(v9, v22, 0, 0);
    }
    else
    {
      id v23 = cps_session_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000221FC(v23);
      }

      NSErrorF();
      BOOL v19 = (CDSystemAuthenticationGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, CDSystemAuthenticationGetAuthInfoResponse *))v9 + 2))(v9, 0, 0, v19);
    }

    os_activity_scope_leave(&v24);
  }
}

void sub_100014438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100014460(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100014468(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    os_activity_scope_state_s v10 = _os_activity_create((void *)&_mh_execute_header, "system auth session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v23.opaque[0] = 0;
    v23.opaque[1] = 0;
    os_activity_scope_enter(v10, &v23);
    uint64_t v11 = [[CDSystemAuthenticationDidFinishAuthRequest alloc] initWithRapportDictionary:v7];
    unsigned int v12 = cps_session_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    id v13 = objc_alloc_init((Class)CPSDevice);
    os_activity_scope_state_s v14 = [(CDSystemAuthenticationDidFinishAuthRequest *)v11 deviceName];
    [v13 setName:v14];

    BOOL v15 = [(CDSystemAuthenticationDidFinishAuthRequest *)v11 deviceModel];
    [v13 setModel:v15];

    [v13 setFlags:-[CDSystemAuthenticationDidFinishAuthRequest deviceFlags](v11, "deviceFlags")];
    BOOL v16 = [v13 model];
    BOOL v17 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v17) {
      [a1 _notifyDeviceAcceptedNotification:v13];
    }
    if ([(CDSystemAuthenticationDidFinishAuthRequest *)v11 isEnabled])
    {
      unsigned __int8 v18 = [a1 request];
      +[CPSMetrics sendSystemSessionCompletedEvent:](CPSMetrics, "sendSystemSessionCompletedEvent:", [v18 service], 1);

      BOOL v19 = [v8 bs_safeStringForKey:RPOptionSenderModelID];
      long long v20 = [v8 bs_safeNumberForKey:RPOptionStatusFlags];
      id v21 = [v20 unsignedIntegerValue];
      if (CPSMetrics) {
        +[CPSMetrics sendProviderDeviceUsageEvent:](CPSMetrics, "sendProviderDeviceUsageEvent:", v19, v21);
      }
      else {

      }
      id v22 = objc_alloc_init((Class)CPSSystemAuthenticationResponse);
      [a1 _notifySessionFinished:v22];
    }
    else
    {
      id v22 = [(CDSystemAuthenticationDidFinishAuthRequest *)v11 error];
      sub_100014974(a1, v22);
      [a1 _notifySessionFailed:v22];
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    os_activity_scope_leave(&v23);
  }
}

void sub_100014750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100014974(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    uint64_t v4 = [v3 domain];
    if ([v4 isEqualToString:CPSErrorDomain])
    {
      id v5 = [v8 code];

      if (v5 == (id)104)
      {
        uint64_t v6 = 2;
LABEL_7:
        id v7 = [a1 request];
        +[CPSMetrics sendSystemSessionCompletedEvent:](CPSMetrics, "sendSystemSessionCompletedEvent:", [v7 service], v6);

        id v3 = v8;
        goto LABEL_8;
      }
    }
    else
    {
    }
    uint64_t v6 = 3;
    goto LABEL_7;
  }
LABEL_8:
}

id sub_100014A3C(id a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    id v7 = [a1 request];
    uint64_t v8 = [v7 appleAccountAltDSID];
    id v9 = (void *)v8;
    os_activity_scope_state_s v10 = 0;
    if (v5 && v8)
    {
      uint64_t v11 = +[NSString stringWithFormat:@"%@+%@", v8, v5];
      unsigned int v12 = [v11 dataUsingEncoding:4];
      if (v12)
      {
        id v13 = malloc_type_malloc(0x40uLL, 0x57A31864uLL);
        id v14 = v12;
        [v14 bytes];
        [v14 length];
        CryptoHashOneShot();
        os_activity_scope_state_s v10 = +[NSData dataWithBytesNoCopy:v13 length:64 freeWhenDone:1];
      }
      else
      {
        os_activity_scope_state_s v10 = 0;
      }
    }
    a1 = [v10 isEqualToData:v6];
  }
  return a1;
}

unsigned char *sub_100014CC4(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[9]) {
    return [result _activated];
  }
  return result;
}

id sub_100014D4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100014E0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100014E28(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && !WeakRetained[9]) {
    [WeakRetained _handleEvent:v5];
  }
}

id sub_100015244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleGetAuthInfoRequest:a2 options:a3 responseHandler:a4];
}

void sub_1000154A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000156EC(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000156F4(void *a1, void *a2, void *a3, void *a4)
{
  id v30 = a2;
  id v29 = a3;
  id v7 = a4;
  if (a1)
  {
    uint64_t v8 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = [[CDGetInfoRequest alloc] initWithRapportDictionary:v30];
    os_activity_scope_state_s v10 = cps_session_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    uint64_t v11 = [(CDGetInfoRequest *)v9 storeAccountToken];
    unsigned int v12 = [(CDGetInfoRequest *)v9 nonce];
    unsigned __int8 v13 = sub_100015FEC(a1, v11, v12);

    if (v13)
    {
      id v14 = objc_alloc_init(CDStorePurchaseGetAuthInfoResponse);
      uint64_t v15 = [(CDGetInfoRequest *)v9 deviceBuildVersion];
      uint64_t v28 = +[BSBuildVersion fromString:v15];

      id v16 = [v29 objectForKeyedSubscript:RPOptionSenderModelID];
      LOBYTE(v15) = [v16 hasPrefix:@"iPhone"];

      if (((v15 & 1) != 0
         || (id v17 = v16,
             unsigned int v18 = [v17 hasPrefix:@"iPad"],
             v17,
             v18))
        && (uint64_t)objc_msgSend(v28, "majorBuildNumber", v28) <= 20)
      {
        BOOL v19 = cps_session_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "iOS device requires legacy purchase request", buf, 2u);
        }

        long long v20 = +[AMSDelegatePurchaseTask bagSubProfile];
        id v21 = +[AMSDelegatePurchaseTask bagSubProfileVersion];
        id v22 = +[AMSBag bagForProfile:v20 profileVersion:v21];

        id v23 = [objc_alloc((Class)AMSDelegatePurchasePaymentDialogTask) initWithDelegatePurchaseRequest:a1[14] bag:v22 andDesignVersion:&off_100036CC0];
        os_activity_scope_state_s v24 = cps_session_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Loading legacy purchase request.", buf, 2u);
        }

        uint64_t v25 = [v23 performTask];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1000161A8;
        v31[3] = &unk_100034F48;
        v31[4] = a1;
        id v33 = v7;
        v32 = v14;
        [v25 addFinishBlock:v31];
      }
      else
      {
        -[CDStorePurchaseGetAuthInfoResponse setPurchaseRequest:](v14, "setPurchaseRequest:", a1[14], v28);
        uint64_t v27 = cps_session_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v14;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sending get auth info response: %@", buf, 0xCu);
        }

        id v22 = [(CDStorePurchaseGetAuthInfoResponse *)v14 makeRapportDictionary];
        (*((void (**)(id, void *, void, void))v7 + 2))(v7, v22, 0, 0);
      }
    }
    else
    {
      os_activity_scope_state_s v26 = cps_session_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100022240(v26);
      }

      NSErrorF();
      id v14 = (CDStorePurchaseGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, CDStorePurchaseGetAuthInfoResponse *))v7 + 2))(v7, 0, 0, v14);
    }

    os_activity_scope_leave(&state);
  }
}

void sub_100015BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_100015C14(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100015C1C(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    os_activity_scope_state_s v10 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v26.opaque[0] = 0;
    v26.opaque[1] = 0;
    os_activity_scope_enter(v10, &v26);
    uint64_t v11 = [[CDStorePurchaseDidFinishAuthRequest alloc] initWithRapportDictionary:v7];
    id v12 = objc_alloc_init((Class)CPSDevice);
    unsigned __int8 v13 = [(CDStorePurchaseDidFinishAuthRequest *)v11 deviceName];
    [v12 setName:v13];

    id v14 = [(CDStorePurchaseDidFinishAuthRequest *)v11 deviceModel];
    [v12 setModel:v14];

    [v12 setFlags:-[CDStorePurchaseDidFinishAuthRequest deviceFlags](v11, "deviceFlags")];
    uint64_t v15 = [v12 model];
    BOOL v16 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v16) {
      [a1 _notifyDeviceAcceptedNotification:v12];
    }
    id v17 = cps_session_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    unsigned int v18 = [(CDStorePurchaseDidFinishAuthRequest *)v11 purchaseResult];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      id v23 = [(CDStorePurchaseDidFinishAuthRequest *)v11 error];
      [a1 _notifySessionFailed:v23];
    }
    else
    {
      long long v20 = [v8 bs_safeStringForKey:RPOptionSenderModelID];
      id v21 = [v8 bs_safeNumberForKey:RPOptionStatusFlags];
      id v22 = [v21 unsignedIntegerValue];
      if (CPSMetrics) {
        +[CPSMetrics sendProviderDeviceUsageEvent:](CPSMetrics, "sendProviderDeviceUsageEvent:", v20, v22);
      }
      else {

      }
      id v24 = objc_alloc((Class)CPSStorePurchaseResponse);
      uint64_t v25 = [(CDStorePurchaseDidFinishAuthRequest *)v11 purchaseResult];
      id v23 = [v24 initWithPurchaseResult:v25];

      [a1 _notifySessionFinished:v23];
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    [a1 _invalidated];

    os_activity_scope_leave(&v26);
  }
}

void sub_100015F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void *sub_100015FEC(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = (void *)a1[15];
    id v7 = a2;
    uint64_t v8 = [v6 ams_altDSID];
    id v9 = (void *)v8;
    os_activity_scope_state_s v10 = 0;
    if (v5 && v8)
    {
      uint64_t v11 = +[NSString stringWithFormat:@"%@+%@", v8, v5];
      id v12 = [v11 dataUsingEncoding:4];
      if (v12)
      {
        unsigned __int8 v13 = malloc_type_malloc(0x40uLL, 0x57A31864uLL);
        id v14 = v12;
        [v14 bytes];
        [v14 length];
        CryptoHashOneShot();
        os_activity_scope_state_s v10 = +[NSData dataWithBytesNoCopy:v13 length:64 freeWhenDone:1];
      }
      else
      {
        os_activity_scope_state_s v10 = 0;
      }
    }
    a1 = [v10 isEqualToData:v7];
  }
  return a1;
}

void sub_1000161A8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] dispatchQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000162A8;
  v10[3] = &unk_100034F20;
  id v11 = v6;
  id v14 = a1[6];
  id v12 = v5;
  id v13 = a1[5];
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void sub_1000162A8(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = cps_session_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100022284(v2, v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got legacy purchase request: %@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 48) setPurchaseRequest:*(void *)(a1 + 40)];
    id v7 = cps_session_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending get auth info response: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 56);
    os_activity_scope_state_s v10 = [*(id *)(a1 + 48) makeRapportDictionary];
    (*(void (**)(uint64_t, void *, void, void))(v9 + 16))(v9, v10, 0, 0);
  }
}

unsigned char *sub_1000165A4(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[21]) {
    return [result _activated];
  }
  return result;
}

id sub_10001665C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100016870(id a1, int a2)
{
  uint64_t v2 = cps_service_listener_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "System language changed. Exiting.", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

id sub_1000169E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"listener"];
}

id sub_100016C14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionInvalidated:*(void *)(a1 + 40)];
}

void sub_100017524(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[33])
  {
    uint64_t v3 = *(void *)(a1 + 40);
LABEL_4:
    NSErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

    return;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2[34]) {
    goto LABEL_4;
  }
  uint64_t v4 = *(void **)(a1 + 40);

  sub_1000175F8(v2, v4);
}

void sub_1000175F8(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    _DWORD v5[2] = sub_10001770C;
    v5[3] = &unk_100034FB0;
    v5[4] = a1;
    id v6 = v3;
    [a1 _prepareForActivationWithCompletionHandler:v5];
  }
}

id sub_100017704(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_10001770C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v3 = *(void **)(a1 + 32);
    [v3 _invalidated];
  }
  else
  {
    [*(id *)(a1 + 32) _sessionActivated];
    [*(id *)(a1 + 32) _presentViewService];
    sub_100017794(*(void *)(a1 + 32), *(void **)(a1 + 40));
    sub_1000179E4(*(id *)(a1 + 32));
    uint64_t v4 = *(id **)(a1 + 32);
    sub_100017A44(v4);
  }
}

void sub_100017794(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [(id)a1 _requireOwnerDevice];
    id v5 = objc_alloc_init((Class)RPCompanionLinkClient);
    id v6 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v5;

    [*(id *)(a1 + 16) setDispatchQueue:*(void *)(a1 + 64)];
    [(id)a1 _configureRapportClient:*(void *)(a1 + 16)];
    id v7 = *(void **)(a1 + 16);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100017C00;
    v17[3] = &unk_1000347B0;
    void v17[4] = a1;
    [v7 cad_registerRequestID:@"com.apple.CompanionAuthentication.GetNotifInfo" options:0 requireOwnerDevice:v4 handler:v17];
    uint64_t v8 = *(void **)(a1 + 16);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100017FCC;
    v16[3] = &unk_100034FD8;
    v16[4] = a1;
    [v8 cad_registerEventID:@"com.apple.CompanionAuthentication.DidTapNotif" options:0 requireOwnerDevice:v4 handler:v16];
    uint64_t v9 = *(void **)(a1 + 16);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000181CC;
    v15[3] = &unk_1000347B0;
    v15[4] = a1;
    [v9 cad_registerRequestID:@"com.apple.CompanionAuthentication.GetAuthType" options:0 requireOwnerDevice:v4 handler:v15];
    os_activity_scope_state_s v10 = *(void **)(a1 + 16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000183F8;
    v14[3] = &unk_100034FD8;
    void v14[4] = a1;
    [v10 cad_registerEventID:@"com.apple.CompanionAuthentication.DidStartAuth" options:0 requireOwnerDevice:v4 handler:v14];
    int v11 = *(void **)(a1 + 16);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000185CC;
    v12[3] = &unk_100034FB0;
    v12[4] = a1;
    id v13 = v3;
    [v11 activateWithCompletion:v12];
  }
}

id sub_1000179E4(id result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = objc_alloc_init(CDIDSService);
    id v3 = (void *)*((void *)v1 + 5);
    *((void *)v1 + 5) = v2;

    [*((id *)v1 + 5) setDispatchQueue:*((void *)v1 + 8)];
    id v4 = (void *)*((void *)v1 + 5);
    return [v4 activate];
  }
  return result;
}

void sub_100017A44(id *a1)
{
  if (a1)
  {
    uint64_t v2 = [a1 _idsMessageRecipientUsernames];
    if ([v2 count])
    {
      [a1[5] sendMessage:0 toUsernames:v2];
    }
    else
    {
      id v3 = cps_session_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_100022388(v3);
      }
    }
  }
}

void sub_100017B84(id *a1)
{
  if (a1)
  {
    uint64_t v2 = [a1 _idsMessageRecipientUsernames];
    if ([v2 count])
    {
      [a1[5] sendMessage:1 toUsernames:v2];
    }
    else
    {
      id v3 = cps_session_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_100022388(v3);
      }
    }
  }
}

void sub_100017C00(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100017C08(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    os_activity_scope_state_s v10 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v23.opaque[0] = 0;
    v23.opaque[1] = 0;
    os_activity_scope_enter(v10, &v23);
    int v11 = [v8 objectForKeyedSubscript:RPOptionSenderIDSDeviceID];
    uint64_t v12 = [a1 _notifyDeviceIDSIdentifier];
    id v13 = v12;
    if (v12 && v11 && ([v12 isEqualToString:v11] & 1) == 0)
    {
      NSErrorF();
      id v14 = (CDGetInfoRequest *)objc_claimAutoreleasedReturnValue();
      id v22 = cps_session_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Rejecting get notif info request from device with IDS ID %@", buf, 0xCu);
      }

      (*((void (**)(id, void, void, CDGetInfoRequest *))v9 + 2))(v9, 0, 0, v14);
    }
    else
    {
      id v14 = [[CDGetInfoRequest alloc] initWithRapportDictionary:v7];
      uint64_t v15 = cps_session_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received get notif info request: %@", buf, 0xCu);
      }

      BOOL v16 = [a1 _responseForGetNotifInfoRequest:v14];
      if (v16)
      {
        id v17 = (void *)GestaltCopyAnswer();
        [(CDGetInfoRequest *)v16 setDeviceClass:v17];

        unsigned int v18 = (void *)GestaltCopyAnswer();
        [(CDGetInfoRequest *)v16 setDeviceName:v18];

        BOOL v19 = cps_session_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending get notif info response: %@", buf, 0xCu);
        }

        long long v20 = [(CDGetInfoRequest *)v16 makeRapportDictionary];
        (*((void (**)(id, void *, void, void))v9 + 2))(v9, v20, 0, 0);
      }
      else
      {
        long long v20 = NSErrorF();
        id v21 = cps_session_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000223CC((uint64_t)v20, v21);
        }

        (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v20);
      }
    }
    os_activity_scope_leave(&v23);
  }
}

void sub_100017F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100017FCC(uint64_t a1, void *a2, void *a3)
{
}

void sub_100017FD4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle did tap notif event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v15.opaque[0] = 0;
    v15.opaque[1] = 0;
    os_activity_scope_enter(v7, &v15);
    id v8 = [[CDDeviceUpdateEvent alloc] initWithRapportDictionary:v5];
    id v9 = cps_session_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received did tap notif event: %@", buf, 0xCu);
    }

    os_activity_scope_state_s v10 = [(CDDeviceUpdateEvent *)v8 deviceModel];
    BOOL v11 = GestaltProductTypeStringToDeviceClass() == 6;

    if (!v11) {
      [a1 _stopAdvertisingNearbyAction];
    }
    id v12 = objc_alloc_init((Class)CPSDevice);
    [v12 setFlags:-[CDDeviceUpdateEvent deviceFlags](v8, "deviceFlags")];
    id v13 = [(CDDeviceUpdateEvent *)v8 deviceModel];
    [v12 setModel:v13];

    id v14 = [(CDDeviceUpdateEvent *)v8 deviceName];
    [v12 setName:v14];

    [a1 _notifyDeviceAcceptedNotification:v12];
    os_activity_scope_leave(&v15);
  }
}

void sub_1000181A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000181CC(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000181D4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    os_activity_scope_state_s v10 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle get auth type request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v17.opaque[0] = 0;
    v17.opaque[1] = 0;
    os_activity_scope_enter(v10, &v17);
    BOOL v11 = cps_session_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received get auth type request.", buf, 2u);
    }

    id v12 = objc_alloc_init(CDGetAuthTypeResponse);
    id v13 = [a1 request];
    id v14 = [v13 authType];

    [(CDGetAuthTypeResponse *)v12 setAuthType:v14];
    -[CDGetAuthTypeResponse setSandboxPurchase:](v12, "setSandboxPurchase:", [a1 _isSandboxPurchase]);
    -[CDGetAuthTypeResponse setAuthFlags:](v12, "setAuthFlags:", [a1 _authFlags]);
    os_activity_scope_state_s v15 = cps_session_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending get auth type response: %@", buf, 0xCu);
    }

    BOOL v16 = [(CDGetAuthTypeResponse *)v12 makeRapportDictionary];
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v16, 0, 0);

    os_activity_scope_leave(&v17);
  }
}

void sub_1000183D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000183F8(uint64_t a1, void *a2, void *a3)
{
}

void sub_100018400(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle did start auth event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v13.opaque[0] = 0;
    v13.opaque[1] = 0;
    os_activity_scope_enter(v7, &v13);
    id v8 = [[CDDeviceUpdateEvent alloc] initWithRapportDictionary:v5];
    id v9 = cps_session_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_activity_scope_state_s v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received did start auth event: %@", buf, 0xCu);
    }

    id v10 = objc_alloc_init((Class)CPSDevice);
    [v10 setFlags:-[CDDeviceUpdateEvent deviceFlags](v8, "deviceFlags")];
    BOOL v11 = [(CDDeviceUpdateEvent *)v8 deviceModel];
    [v10 setModel:v11];

    id v12 = [(CDDeviceUpdateEvent *)v8 deviceName];
    [v10 setName:v12];

    [a1 _notifyDeviceStartedAuthentication:v10];
    os_activity_scope_leave(&v13);
  }
}

void sub_1000185A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000185CC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v3 = *(void **)(a1 + 32);
    [v3 _invalidated];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    sub_100018634(v4, v5);
  }
}

void sub_100018634(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init((Class)SFService);
    id v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v4;

    [*(id *)(a1 + 24) setDispatchQueue:*(void *)(a1 + 64)];
    [*(id *)(a1 + 24) setDeviceActionType:[(id)a1 _deviceActionType]];
    id v6 = *(void **)(a1 + 24);
    id v7 = +[NSUUID UUID];
    id v8 = [v7 UUIDString];
    [v6 setIdentifier:v8];

    [*(id *)(a1 + 24) setAdvertiseRate:50];
    id v9 = *(void **)(a1 + 24);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100018760;
    v10[3] = &unk_100034FB0;
    void v10[4] = a1;
    id v11 = v3;
    [v9 activateWithCompletion:v10];
  }
}

id sub_100018760(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  if (a2)
  {
    v3();
    id v4 = *(void **)(a1 + 32);
    return [v4 _invalidated];
  }
  else
  {
    return (id)((uint64_t (*)(void))v3)();
  }
}

uint64_t start()
{
  v0 = cps_daemon_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "The companion daemon is starting.", v9, 2u);
  }

  if ((_set_user_dir_suffix() & 1) == 0)
  {
    uint64_t v2 = cps_daemon_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      sub_1000224BC(v2);
    }
  }
  +[AMSEphemeralDefaults setPreferEphemeralURLSessions:1];
  +[AMSEphemeralDefaults setSuppressEngagement:1];
  id v3 = objc_alloc_init(CDProviderDaemon);
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.companiond.main", v4);
  [(CDProviderDaemon *)v3 setDispatchQueue:v5];
  [(CDProviderDaemon *)v3 activate];
  id v6 = objc_alloc_init((Class)DTDaemonShim);
  [v6 activate];

  id v7 = +[NSRunLoop currentRunLoop];
  [v7 run];

  return 0;
}

void sub_100019F68(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  self;
  if (v5)
  {
    if ([v4 length])
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10001AD34;
      v7[3] = &unk_100035050;
      id v8 = v5;
      +[SFSafariCredentialStore getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:v4 completionHandler:v7];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100022628();
      }
      (*((void (**)(id, void *))v5 + 2))(v5, &__NSArray0__struct);
    }
  }
  else
  {
    id v6 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completionHandler != ((void *)0)"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022564("_approvedWebCredentialsDomainsForApplicationIdentifier:completionHandler:");
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void sub_10001A0E8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  self;
  if (v5)
  {
    if ([v4 length])
    {
      id v6 = dispatch_get_global_queue(25, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001AEB0;
      block[3] = &unk_100034DD0;
      id v9 = v4;
      id v10 = v5;
      dispatch_async(v6, block);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100022734();
      }
      (*((void (**)(id, void *))v5 + 2))(v5, &__NSArray0__struct);
    }
  }
  else
  {
    id v7 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completionHandler != ((void *)0)"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022670("_allWebCredentialsDomainsForApplicationIdentifier:completionHandler:");
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void sub_10001A28C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = a2;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001B0D8;
  v14[3] = &unk_1000350C8;
  id v16 = v9;
  uint64_t v17 = self;
  id v15 = v8;
  id v12 = v9;
  id v13 = v8;
  sub_10001B370(v17, v11, v10, v14);
}

void sub_10001A4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001A500(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = CPSCustomAuthenticationMethodOther;
  id v7 = a2;
  if ([v7 isEqualToString:v6]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) |= 4u;
  }
  if ([v7 isEqualToString:CPSCustomAuthenticationMethodRestorePurchase]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) |= 8u;
  }
  unsigned int v8 = [v7 isEqualToString:CPSCustomAuthenticationMethodVideoSubscriberAccount];

  if (v8) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) |= 0x10u;
  }
  *a4 = (~*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) & 0x1C) == 0;
}

id sub_10001A8E0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = +[NSMutableSet set];
  id v7 = [v5 relyingPartyIdentifier];

  [v6 bs_safeAddObject:v7];
  unsigned int v8 = [v4 relyingPartyIdentifier];

  [v6 bs_safeAddObject:v8];
  if ([v6 count] == (id)1)
  {
    id v9 = [v6 anyObject];
    if ([v9 length]) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void sub_10001AD34(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001AE58;
  v9[3] = &unk_100035028;
  id v4 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v10 = v4;
  [v3 enumerateObjectsUsingBlock:v9];

  if (IsAppleInternalBuild())
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    uint64_t v6 = [v5 stringArrayForKey:@"ExtraAssociatedDomains"];
    [v4 addObjectsFromArray:v6];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  unsigned int v8 = [v4 array];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void sub_10001AE58(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 domain];
  [v2 addObject:v3];
}

void sub_10001AEB0(uint64_t a1)
{
  id v2 = [objc_alloc((Class)_SWCServiceSpecifier) initWithServiceType:0 applicationIdentifier:*(void *)(a1 + 32) domain:0];
  id v15 = 0;
  id v3 = +[_SWCServiceDetails serviceDetailsWithServiceSpecifier:v2 error:&v15];
  id v4 = v15;
  if (v3)
  {
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = sub_10001B06C;
    id v13 = &unk_100035078;
    id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
    id v14 = v5;
    [v3 enumerateObjectsUsingBlock:&v10];
    if (IsAppleInternalBuild())
    {
      uint64_t v6 = +[NSUserDefaults standardUserDefaults];
      uint64_t v7 = [v6 stringArrayForKey:@"ExtraAssociatedDomains"];
      [v5 addObjectsFromArray:v7];
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [v5 array:v10, v11, v12, v13];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022840((uint64_t)v4);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10001B06C(uint64_t a1, void *a2)
{
  id v4 = [a2 serviceSpecifier];
  id v3 = [v4 domain];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_10001B0D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:AKAppleIDAuthenticationErrorDomain];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001B1D4;
    v8[3] = &unk_1000350A0;
    uint64_t v7 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    id v9 = v3;
    sub_10001B1E8(v7, v9, v6, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_10001B1D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001B1E8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = a3;
  self;
  id v9 = [v6 userInfo];
  id v10 = [v9 mutableCopy];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSMutableDictionary dictionary];
  }
  id v13 = v12;

  [v13 setObject:v8 forKeyedSubscript:AKClientBundleIDKey];
  id v14 = [v6 domain];
  id v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, [v6 code], v13);

  id v16 = objc_alloc_init((Class)AKAlertHandler);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001B538;
  v18[3] = &unk_100035118;
  id v19 = v7;
  id v17 = v7;
  [v16 showAlertForError:v15 withCompletion:v18];
}

void sub_10001B370(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  self;
  id v18 = 0;
  unsigned __int8 v9 = +[AKAuthorizationValidator canPerformCredentialRequest:v8 error:&v18];

  id v10 = v18;
  if (v9)
  {
    if (v6
      && (+[AKAccountManager sharedInstance],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          [v11 continuationTokenForAccount:v6],
          id v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      id v13 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
      id v14 = [v6 username];
      [v13 setUsername:v14];

      [v13 setIsUsernameEditable:0];
      id v15 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001B524;
      v16[3] = &unk_1000350F0;
      id v17 = v7;
      [v15 authenticateWithContext:v13 completion:v16];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v10);
  }
}

uint64_t sub_10001B524(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001B538(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001B570(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

unsigned char *sub_10001B698(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[9]) {
    return [result _activated];
  }
  return result;
}

id sub_10001B720(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

id sub_10001B7CC()
{
  if (qword_10003FF18 != -1) {
    dispatch_once(&qword_10003FF18, &stru_100035160);
  }
  v0 = (void *)qword_10003FF10;

  return v0;
}

void sub_10001B964(uint64_t a1)
{
  id v2 = +[NSMutableSet set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = (char *)[v3 countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v4)
  {
    unsigned int v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)IDSCopyBestGuessIDForID();
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      unsigned int v5 = (char *)[v3 countByEnumeratingWithState:&v22 objects:v36 count:16];
    }
    while (v5);
  }

  v34[0] = IDSSessionAlwaysSkipSelfKey;
  v34[1] = IDSSendMessageOptionFireAndForgetKey;
  v35[0] = &__kCFBooleanTrue;
  v35[1] = &__kCFBooleanTrue;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  CFStringRef v32 = @"type";
  id v10 = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
  id v33 = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  id v12 = *(void **)(*(void *)(a1 + 40) + 16);
  id v20 = 0;
  id v21 = 0;
  unsigned __int8 v13 = [v12 sendMessage:v11 toDestinations:v2 priority:300 options:v9 identifier:&v21 error:&v20];
  id v14 = v21;
  id v15 = v20;
  id v16 = sub_10001B7CC();
  id v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      id v29 = v2;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sent IDS message. {users = %@, destinations = %@, identifier=%@}", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v19;
    __int16 v28 = 2112;
    id v29 = v2;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error sending IDS message. {usernames = %@, destinations = %@, error = %@}", buf, 0x20u);
  }
}

void sub_10001BF64(id a1)
{
  qword_10003FF10 = (uint64_t)os_log_create("com.apple.CompanionServices", "CDIDSService");

  _objc_release_x1();
}

id sub_10001CD14(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = +[NSSet setWithObject:a3];
  id v8 = v5;
  id v9 = v6;
  CFDataGetTypeID();
  id v10 = CFDictionaryGetTypedValue();

  if (v10)
  {
    id v14 = 0;
    uint64_t v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v10 error:&v14];
    id v12 = v14;
    if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000228C0((uint64_t)v12);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id sub_10001D014(uint64_t a1)
{
  if (a1)
  {
    id v4 = 0;
    id v1 = +[NSKeyedArchiver archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v4];
    id v2 = v4;
    if (v2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022940((uint64_t)v2);
    }
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

unsigned char *sub_1000207D8(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[49]) {
    return [result _activated];
  }
  return result;
}

id sub_100020860(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100020B38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

id sub_100020BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _foundDeviceWithIdentifier:a2 discoveryType:a3];
}

void *sub_100020CA8(void *result, uint64_t a2)
{
  if (a2 == 1) {
    return [*(id *)(result[4] + 32) invalidate];
  }
  if (!a2)
  {
    uint64_t v2 = result[4];
    if (!*(void *)(v2 + 32)) {
      return [*(id *)(v2 + 24) startDiscovery];
    }
  }
  return result;
}

id sub_100020E38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"serviceListener"];
  id v3 = [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"deviceDiscovery"];
  return [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"currentSession"];
}

id sub_100021264(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDidFinishWithResponse:a2];
}

id sub_100021270(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDidFailWithError:a2];
}

void sub_10002127C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void sub_100021494(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Device account is not in list of approvers.", v1, 2u);
}

void sub_1000214D8(id *a1, NSObject *a2)
{
  [*a1 authType];
  sub_10000EF8C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown local auth type: %ld", v3, 0xCu);
}

void sub_100021564()
{
  sub_10000EFD0();
  sub_10000EFB4((void *)&_mh_execute_header, v0, v1, "No eligible iCloud account found.", v2, v3, v4, v5, v6);
}

void sub_100021598()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Authentication session failed: %@", v2, v3, v4, v5, v6);
}

void sub_100021600()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Failed to start rapport client : %@", v2, v3, v4, v5, v6);
}

void sub_100021668(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received unknown auth type: %ld", buf, 0xCu);
}

void sub_1000216B0()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Get auth type request failed: %@", v2, v3, v4, v5, v6);
}

void sub_100021718()
{
  sub_10000EFD0();
  sub_10000EFB4((void *)&_mh_execute_header, v0, v1, "No eligible store account found.", v2, v3, v4, v5, v6);
}

void sub_10002174C()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Failed to send did tap notif event: %@", v2, v3, v4, v5, v6);
}

void sub_1000217B4()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Received did finish auth response with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002181C()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Failed to start device discovery: %@", v2, v3, v4, v5, v6);
}

void sub_100021884()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Get notif info request failed: %@", v2, v3, v4, v5, v6);
}

void sub_1000218EC()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Get auth info request failed: %@", v2, v3, v4, v5, v6);
}

void sub_100021954()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Purchase request failed: %@", v2, v3, v4, v5, v6);
}

void sub_1000219BC()
{
  sub_10000EFD0();
  sub_10000EFB4((void *)&_mh_execute_header, v0, v1, "Prox card transaction rejected.", v2, v3, v4, v5, v6);
}

void sub_1000219F0()
{
  sub_10000EF8C();
  sub_10000EF98((void *)&_mh_execute_header, v0, v1, "Failed to activate view service: %@", v2, v3, v4, v5, v6);
}

void sub_100021A58()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Credential request failed: %@", v2, v3, v4, v5, v6);
}

void sub_100021AC0(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = NSStringFromSelector(a1);
  uint8_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  CFStringRef v15 = @"CDProviderSession.m";
  __int16 v16 = 1024;
  int v17 = 1530;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

void sub_100021BC4()
{
  sub_10000EF8C();
  sub_10000EF98((void *)&_mh_execute_header, v0, v1, "Unexpected credential type: %@", v2, v3, v4, v5, v6);
}

void sub_100021C2C()
{
  sub_10000EF8C();
  sub_10000EF70((void *)&_mh_execute_header, v0, v1, "Web authentication failed: %@", v2, v3, v4, v5, v6);
}

void sub_100021C94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021D04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021D3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021D74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021DE0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "performAMSDelegatePurchaseWithRequest is only supported on internal builds.", v1, 2u);
}

void sub_100021E24(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing AMS delegate purchase entitlement.", v1, 2u);
}

void sub_100021E68(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000EF70((void *)&_mh_execute_header, a2, a3, "Failed to get remote object proxy. error=%@", a5, a6, a7, a8, 2u);
}

void sub_100021ED4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load application record: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100021F4C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to encode presentation context: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100021FC4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "remoteViewService proxy error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002203C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "View service invalidated: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000220C4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to start discovery: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002213C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Device found with nil IDS identifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000221B4()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Rejecting message from non-owner device", v0, 2u);
}

void sub_1000221FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid account token.", v1, 2u);
}

void sub_100022240(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid store account token.", v1, 2u);
}

void sub_100022284(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load legacy purchase request: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100022300(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "activate called", v1, 2u);
}

void sub_100022344(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "invalidate called", v1, 2u);
}

void sub_100022388(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "IDS recipient usernames is nil or empty. Will not send message.", v1, 2u);
}

void sub_1000223CC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Rejecting get notif info request: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100022444(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Authentication session failed: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000224BC(NSObject *a1)
{
  int v2 = *__error();
  uint64_t v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  id v7 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed. Error code: %d, Error: %s", (uint8_t *)v5, 0x12u);
}

void sub_100022564(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_10001B548();
  sub_10001B58C();
  sub_10001B59C();
  sub_10001B570((void *)&_mh_execute_header, &_os_log_default, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void sub_100022628()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to fetch approved web credentials domains: missing application identifier", v0, 2u);
}

void sub_100022670(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_10001B548();
  sub_10001B58C();
  sub_10001B59C();
  sub_10001B570((void *)&_mh_execute_header, &_os_log_default, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void sub_100022734()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to fetch web credentials domains: missing application identifier", v0, 2u);
}

void sub_10002277C(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_10001B548();
  sub_10001B58C();
  sub_10001B59C();
  sub_10001B570((void *)&_mh_execute_header, &_os_log_default, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void sub_100022840(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to fetch associated domains: %@", (uint8_t *)&v1, 0xCu);
}

void sub_1000228C0(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to unarchive: %@", (uint8_t *)&v1, 0xCu);
}

void sub_100022940(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to archive: %@", (uint8_t *)&v1, 0xCu);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

uint64_t CFDictionaryGetInt64()
{
  return _CFDictionaryGetInt64();
}

uint64_t CFDictionaryGetTypedValue()
{
  return _CFDictionaryGetTypedValue();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t CPSErrorGetCustomAuthenticationMethod()
{
  return _CPSErrorGetCustomAuthenticationMethod();
}

uint64_t CPSErrorMake()
{
  return _CPSErrorMake();
}

uint64_t CPSMetricsSessionResultWithCustomMethod()
{
  return _CPSMetricsSessionResultWithCustomMethod();
}

uint64_t CUPrintFlags64()
{
  return _CUPrintFlags64();
}

uint64_t CUPrintNSObjectMasked()
{
  return _CUPrintNSObjectMasked();
}

uint64_t CryptoHashOneShot()
{
  return _CryptoHashOneShot();
}

uint64_t GestaltCopyAnswer()
{
  return _GestaltCopyAnswer();
}

uint64_t GestaltGetBoolean()
{
  return _GestaltGetBoolean();
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return _GestaltProductTypeStringToDeviceClass();
}

uint64_t IDSCopyBestGuessIDForID()
{
  return _IDSCopyBestGuessIDForID();
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t NSDictionaryGetNSArrayOfClass()
{
  return _NSDictionaryGetNSArrayOfClass();
}

uint64_t NSDictionaryGetNSNumber()
{
  return _NSDictionaryGetNSNumber();
}

uint64_t NSErrorF()
{
  return _NSErrorF();
}

uint64_t NSErrorWithOSStatusF()
{
  return _NSErrorWithOSStatusF();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _BSIsInternalInstall()
{
  return __BSIsInternalInstall();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _bs_set_crash_log_message()
{
  return __bs_set_crash_log_message();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t cps_daemon_log()
{
  return _cps_daemon_log();
}

uint64_t cps_service_listener_log()
{
  return _cps_service_listener_log();
}

uint64_t cps_service_log()
{
  return _cps_service_log();
}

uint64_t cps_session_log()
{
  return _cps_session_log();
}

uint64_t cps_signpost_log()
{
  return _cps_signpost_log();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__authFlags(void *a1, const char *a2, ...)
{
  return [a1 _authFlags];
}

id objc_msgSend__deviceActionType(void *a1, const char *a2, ...)
{
  return [a1 _deviceActionType];
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return [a1 _endpoint];
}

id objc_msgSend__idsMessageRecipientUsernames(void *a1, const char *a2, ...)
{
  return [a1 _idsMessageRecipientUsernames];
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return [a1 _invalidated];
}

id objc_msgSend__isSandboxPurchase(void *a1, const char *a2, ...)
{
  return [a1 _isSandboxPurchase];
}

id objc_msgSend__languageNotificationEnsureStarted(void *a1, const char *a2, ...)
{
  return [a1 _languageNotificationEnsureStarted];
}

id objc_msgSend__languageNotificationEnsureStopped(void *a1, const char *a2, ...)
{
  return [a1 _languageNotificationEnsureStopped];
}

id objc_msgSend__notifyDeviceIDSIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _notifyDeviceIDSIdentifier];
}

id objc_msgSend__photosContent(void *a1, const char *a2, ...)
{
  return [a1 _photosContent];
}

id objc_msgSend__presentViewService(void *a1, const char *a2, ...)
{
  return [a1 _presentViewService];
}

id objc_msgSend__recognizeMyVoiceContent(void *a1, const char *a2, ...)
{
  return [a1 _recognizeMyVoiceContent];
}

id objc_msgSend__requireOwnerDevice(void *a1, const char *a2, ...)
{
  return [a1 _requireOwnerDevice];
}

id objc_msgSend__sessionActivated(void *a1, const char *a2, ...)
{
  return [a1 _sessionActivated];
}

id objc_msgSend__sharedWithYouContent(void *a1, const char *a2, ...)
{
  return [a1 _sharedWithYouContent];
}

id objc_msgSend__startDeviceDiscovery(void *a1, const char *a2, ...)
{
  return [a1 _startDeviceDiscovery];
}

id objc_msgSend__startDiscoveryTimer(void *a1, const char *a2, ...)
{
  return [a1 _startDiscoveryTimer];
}

id objc_msgSend__startRapportListener(void *a1, const char *a2, ...)
{
  return [a1 _startRapportListener];
}

id objc_msgSend__startServiceListener(void *a1, const char *a2, ...)
{
  return [a1 _startServiceListener];
}

id objc_msgSend__stopAdvertisingNearbyAction(void *a1, const char *a2, ...)
{
  return [a1 _stopAdvertisingNearbyAction];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appBundleIdentifier];
}

id objc_msgSend_appDomains(void *a1, const char *a2, ...)
{
  return [a1 appDomains];
}

id objc_msgSend_appIconData(void *a1, const char *a2, ...)
{
  return [a1 appIconData];
}

id objc_msgSend_appIconScale(void *a1, const char *a2, ...)
{
  return [a1 appIconScale];
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appIdentifier];
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return [a1 appName];
}

id objc_msgSend_appSignInContent(void *a1, const char *a2, ...)
{
  return [a1 appSignInContent];
}

id objc_msgSend_appTeamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appTeamIdentifier];
}

id objc_msgSend_appleAccountAltDSID(void *a1, const char *a2, ...)
{
  return [a1 appleAccountAltDSID];
}

id objc_msgSend_appleAccountToken(void *a1, const char *a2, ...)
{
  return [a1 appleAccountToken];
}

id objc_msgSend_appleIDRequest(void *a1, const char *a2, ...)
{
  return [a1 appleIDRequest];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_approversAppleAccountAltDSIDs(void *a1, const char *a2, ...)
{
  return [a1 approversAppleAccountAltDSIDs];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authFlags(void *a1, const char *a2, ...)
{
  return [a1 authFlags];
}

id objc_msgSend_authType(void *a1, const char *a2, ...)
{
  return [a1 authType];
}

id objc_msgSend_authenticationRequest(void *a1, const char *a2, ...)
{
  return [a1 authenticationRequest];
}

id objc_msgSend_authenticationResult(void *a1, const char *a2, ...)
{
  return [a1 authenticationResult];
}

id objc_msgSend_authorization(void *a1, const char *a2, ...)
{
  return [a1 authorization];
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return [a1 bagSubProfile];
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return [a1 bagSubProfileVersion];
}

id objc_msgSend_bodyArguments(void *a1, const char *a2, ...)
{
  return [a1 bodyArguments];
}

id objc_msgSend_bodyKey(void *a1, const char *a2, ...)
{
  return [a1 bodyKey];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return [a1 clientInterface];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credentialRequest(void *a1, const char *a2, ...)
{
  return [a1 credentialRequest];
}

id objc_msgSend_currentClient(void *a1, const char *a2, ...)
{
  return [a1 currentClient];
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

id objc_msgSend_currentUserName(void *a1, const char *a2, ...)
{
  return [a1 currentUserName];
}

id objc_msgSend_customAuthenticationMethods(void *a1, const char *a2, ...)
{
  return [a1 customAuthenticationMethods];
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return [a1 daemonInterface];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deviceActionType(void *a1, const char *a2, ...)
{
  return [a1 deviceActionType];
}

id objc_msgSend_deviceBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 deviceBuildVersion];
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return [a1 deviceFlags];
}

id objc_msgSend_deviceModel(void *a1, const char *a2, ...)
{
  return [a1 deviceModel];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_establishConnection(void *a1, const char *a2, ...)
{
  return [a1 establishConnection];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_hasAMSDelegatePurchaseEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasAMSDelegatePurchaseEntitlement];
}

id objc_msgSend_hasAppSignInOverrideBundleIdentifierEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasAppSignInOverrideBundleIdentifierEntitlement];
}

id objc_msgSend_hasDaemonStatusEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasDaemonStatusEntitlement];
}

id objc_msgSend_hasDedicatedCameraEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasDedicatedCameraEntitlement];
}

id objc_msgSend_hasRestrictedAccessEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasRestrictedAccessEntitlement];
}

id objc_msgSend_hasStoreAuthenticationEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasStoreAuthenticationEntitlement];
}

id objc_msgSend_hasStorePurchaseEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasStorePurchaseEntitlement];
}

id objc_msgSend_hasSystemAuthenticationEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasSystemAuthenticationEntitlement];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_iconName(void *a1, const char *a2, ...)
{
  return [a1 iconName];
}

id objc_msgSend_iconSystemName(void *a1, const char *a2, ...)
{
  return [a1 iconSystemName];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsDeviceIdentifier];
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsIdentifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isApproved(void *a1, const char *a2, ...)
{
  return [a1 isApproved];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isSandboxPurchase(void *a1, const char *a2, ...)
{
  return [a1 isSandboxPurchase];
}

id objc_msgSend_learnMoreContent(void *a1, const char *a2, ...)
{
  return [a1 learnMoreContent];
}

id objc_msgSend_legacyAppSignInContent(void *a1, const char *a2, ...)
{
  return [a1 legacyAppSignInContent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_majorBuildNumber(void *a1, const char *a2, ...)
{
  return [a1 majorBuildNumber];
}

id objc_msgSend_makeRapportDictionary(void *a1, const char *a2, ...)
{
  return [a1 makeRapportDictionary];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nonce(void *a1, const char *a2, ...)
{
  return [a1 nonce];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_overrideBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 overrideBundleIdentifier];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_passwordRequest(void *a1, const char *a2, ...)
{
  return [a1 passwordRequest];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_performDelegatePurchase(void *a1, const char *a2, ...)
{
  return [a1 performDelegatePurchase];
}

id objc_msgSend_performTask(void *a1, const char *a2, ...)
{
  return [a1 performTask];
}

id objc_msgSend_platformKeyCredentialAssertionOptions(void *a1, const char *a2, ...)
{
  return [a1 platformKeyCredentialAssertionOptions];
}

id objc_msgSend_platformKeyCredentialRegistrationOptions(void *a1, const char *a2, ...)
{
  return [a1 platformKeyCredentialRegistrationOptions];
}

id objc_msgSend_presenterInterface(void *a1, const char *a2, ...)
{
  return [a1 presenterInterface];
}

id objc_msgSend_presentingInterface(void *a1, const char *a2, ...)
{
  return [a1 presentingInterface];
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return [a1 providerName];
}

id objc_msgSend_providerURL(void *a1, const char *a2, ...)
{
  return [a1 providerURL];
}

id objc_msgSend_purchaseRequest(void *a1, const char *a2, ...)
{
  return [a1 purchaseRequest];
}

id objc_msgSend_purchaseResult(void *a1, const char *a2, ...)
{
  return [a1 purchaseResult];
}

id objc_msgSend_rapportIdentifier(void *a1, const char *a2, ...)
{
  return [a1 rapportIdentifier];
}

id objc_msgSend_registerPasskeyContent(void *a1, const char *a2, ...)
{
  return [a1 registerPasskeyContent];
}

id objc_msgSend_relyingPartyIdentifier(void *a1, const char *a2, ...)
{
  return [a1 relyingPartyIdentifier];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestData(void *a1, const char *a2, ...)
{
  return [a1 requestData];
}

id objc_msgSend_restrictionType(void *a1, const char *a2, ...)
{
  return [a1 restrictionType];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return [a1 screenOn];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceSpecifier(void *a1, const char *a2, ...)
{
  return [a1 serviceSpecifier];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldReceiveDeviceEvents(void *a1, const char *a2, ...)
{
  return [a1 shouldReceiveDeviceEvents];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return [a1 statusFlags];
}

id objc_msgSend_storeAccountToken(void *a1, const char *a2, ...)
{
  return [a1 storeAccountToken];
}

id objc_msgSend_storeAuthenticationContent(void *a1, const char *a2, ...)
{
  return [a1 storeAuthenticationContent];
}

id objc_msgSend_storePurchaseContent(void *a1, const char *a2, ...)
{
  return [a1 storePurchaseContent];
}

id objc_msgSend_succinctDescriptionBuilder(void *a1, const char *a2, ...)
{
  return [a1 succinctDescriptionBuilder];
}

id objc_msgSend_systemLockStateSync(void *a1, const char *a2, ...)
{
  return [a1 systemLockStateSync];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_titleArguments(void *a1, const char *a2, ...)
{
  return [a1 titleArguments];
}

id objc_msgSend_titleKey(void *a1, const char *a2, ...)
{
  return [a1 titleKey];
}

id objc_msgSend_tvProviderContent(void *a1, const char *a2, ...)
{
  return [a1 tvProviderContent];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_webRequest(void *a1, const char *a2, ...)
{
  return [a1 webRequest];
}