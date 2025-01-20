uint64_t NotifyCFCallback(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t result;

  if (a2 && a3 >= 0x18)
  {
    v4 = (uint64_t *)(a4 + 8);
    while (1)
    {
      v4 = (uint64_t *)*v4;
      if (!v4) {
        break;
      }
      if (*(_DWORD *)(a2 + 20) == *((_DWORD *)v4 + 8)) {
        return ((uint64_t (*)(uint64_t, uint64_t *))v4[2])(v4[3], v4);
      }
    }
  }
  return result;
}

void UIAllowedInvokeCallback(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (S_wifi_suppressed)
  {
    if ((a1 & 1) == 0) {
      return;
    }
    BOOL v1 = 0;
  }
  else
  {
    BOOL v1 = (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
    if (v1 == a1) {
      return;
    }
  }
  logger = mysyslog_get_logger();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    v4 = "false";
    if (v1) {
      v4 = "true";
    }
    int v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_225F82000, logger, v3, "uiallowed: %s", (uint8_t *)&v5, 0xCu);
  }
  if (S_callback) {
    S_callback(v1);
  }
}

void CaptiveHandleUIAllowedChange(int a1)
{
  if (a1)
  {
    for (uint64_t i = S_stateHeadStorage; i; uint64_t i = *(void *)i)
    {
      if (*(unsigned char *)(i + 252)) {
        CaptiveInteract(i);
      }
    }
  }
}

void UIAllowedNetworkingAppNotify(uint64_t a1, uint64_t a2)
{
  if (S_wifi_suppressed) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
  }
  UIAllowedNetworkingAppCheck(a2);

  UIAllowedInvokeCallback(v2);
}

void UIAllowedNetworkingAppCheck(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  if (a1 && NotifyGet(a1, &v5)) {
    int v1 = v5 & 1;
  }
  else {
    int v1 = 0;
  }
  if (S_networking_app_in_foreground != v1)
  {
    S_networking_app_in_foreground = v1;
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      v4 = "";
      if (!S_networking_app_in_foreground) {
        v4 = "not ";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v7 = "UIAllowedNetworkingAppCheck";
      __int16 v8 = 2080;
      v9 = v4;
      _os_log_impl(&dword_225F82000, logger, v3, "%s: Networking App %sin foreground", buf, 0x16u);
    }
  }
}

os_log_t mysyslog_get_logger()
{
  os_log_t result = (os_log_t)S_captive_logger;
  if (!S_captive_logger)
  {
    os_log_t result = os_log_create("com.apple.captive", "Framework");
    S_captive_logger = (uint64_t)result;
  }
  return result;
}

BOOL NotifyGet(uint64_t a1, uint64_t *a2)
{
  return notify_get_state(*(_DWORD *)(a1 + 32), a2) == 0;
}

void *CopySIMStatus()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x22A643350]();
  id v1 = objc_alloc_init(MEMORY[0x263F02D38]);
  BOOL v2 = v1;
  if (!v1)
  {
    v6 = mysyslog_get_logger();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, v6, v9, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }
    goto LABEL_9;
  }
  os_log_type_t v3 = GetUserPreferredSubscriptionContext(v1);
  if (v3)
  {
    id v11 = 0;
    v4 = [v2 getSIMStatus:v3 error:&v11];
    uint64_t v5 = v11;
    if (!v5)
    {
      v6 = v4;

      os_log_type_t v3 = v6;
      goto LABEL_10;
    }
    v6 = v5;
    uint64_t v7 = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_225F82000, v7, v8, "getSIMStatus failed with error: %@", buf, 0xCu);
    }

LABEL_9:
    os_log_type_t v3 = 0;
LABEL_10:
  }
  return v3;
}

id GetUserPreferredSubscriptionContext(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v27 = 0;
  id v1 = [a1 getSubscriptionInfoWithError:&v27];
  id v2 = v27;
  if (v2)
  {
    os_log_type_t v3 = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v3, v4))
    {
LABEL_5:
      id v9 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 138412290;
    id v30 = v2;
    uint64_t v5 = "CoreTelephonyClient.getSubscriptionInfoWithError failed with error: %@";
    v6 = v3;
    os_log_type_t v7 = v4;
    uint32_t v8 = 12;
LABEL_4:
    _os_log_impl(&dword_225F82000, v6, v7, v5, buf, v8);
    goto LABEL_5;
  }
  if (!v1)
  {
    uint64_t v18 = [0 subscriptions];
    if (!v18
      || (v19 = (void *)v18,
          [0 subscriptions],
          v20 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = [v20 count],
          v20,
          v19,
          !v21))
    {
      os_log_type_t v3 = mysyslog_get_logger();
      os_log_type_t v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v3, v22)) {
        goto LABEL_5;
      }
      *(_WORD *)buf = 0;
      uint64_t v5 = "failed to get the subscription contexts";
      v6 = v3;
      os_log_type_t v7 = v22;
      uint32_t v8 = 2;
      goto LABEL_4;
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  os_log_type_t v3 = objc_msgSend(v1, "subscriptions", 0);
  id v9 = (id)[v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v3);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (v13)
        {
          uint64_t v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) userDataPreferred];
          if (v14)
          {
            v15 = (void *)v14;
            v16 = [v13 userDataPreferred];
            int v17 = [v16 BOOLValue];

            if (v17)
            {
              id v9 = v13;
              goto LABEL_6;
            }
          }
        }
      }
      id v9 = (id)[v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_6:

  return v9;
}

uint64_t CopyPhoneNumber()
{
  v0 = (void *)MEMORY[0x22A643350]();
  id v1 = objc_alloc_init(MEMORY[0x263F02D38]);
  id v2 = v1;
  if (v1)
  {
    os_log_type_t v3 = GetUserPreferredSubscriptionContext(v1);
    if (!v3)
    {
      uint64_t v5 = 0;
      goto LABEL_9;
    }
    os_log_type_t v4 = v3;
    uint64_t v5 = [v3 phoneNumber];
  }
  else
  {
    os_log_type_t v4 = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v4, v6))
    {
      *(_WORD *)uint32_t v8 = 0;
      _os_log_impl(&dword_225F82000, v4, v6, "failed to get the CoreTelephonyClient instance", v8, 2u);
    }
    uint64_t v5 = 0;
  }

LABEL_9:
  return v5;
}

id CopyRATSelection()
{
  v0 = (void *)MEMORY[0x22A643350]();
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v1 = objc_alloc_init(MEMORY[0x263F02D38]);
  id v2 = v1;
  if (!v1)
  {
    os_log_type_t v3 = mysyslog_get_logger();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, v3, v10, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }
    id v9 = 0;
    goto LABEL_13;
  }
  os_log_type_t v3 = GetUserPreferredSubscriptionContext(v1);
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __CopyRATSelection_block_invoke;
    v12[3] = &unk_264784898;
    uint64_t v14 = &v16;
    uint64_t v5 = v4;
    v13 = v5;
    [v2 getRatSelection:v3 completion:v12];
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      os_log_type_t v7 = mysyslog_get_logger();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225F82000, v7, v8, "timed out while waiting for getting RAT selection", buf, 2u);
      }

      id v9 = 0;
    }
    else
    {
      id v9 = (id)v17[5];
    }

LABEL_13:
    goto LABEL_14;
  }
  id v9 = 0;
LABEL_14:

  _Block_object_dispose(&v16, 8);
  return v9;
}

void sub_225F850E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __CopyRATSelection_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = mysyslog_get_logger();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_225F82000, v9, v10, "getRatSelection failed with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id CopyMobileEquipmentInfo()
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x22A643350]();
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  id v1 = objc_alloc_init(MEMORY[0x263F02D38]);
  id v2 = v1;
  if (!v1)
  {
    os_log_type_t v3 = mysyslog_get_logger();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, v3, v11, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }
    goto LABEL_10;
  }
  os_log_type_t v3 = GetUserPreferredSubscriptionContext(v1);
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __CopyMobileEquipmentInfo_block_invoke;
    v27[3] = &unk_2647848C0;
    v29 = &v31;
    uint64_t v5 = v4;
    v28 = v5;
    [v2 copyMobileEquipmentInfo:v27];
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      id v7 = mysyslog_get_logger();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225F82000, v7, v8, "timed out while waiting for copying mobile equipment info list", buf, 2u);
      }
      id v9 = 0;
      id v10 = 0;
LABEL_7:

      goto LABEL_24;
    }
    id v12 = (void *)v32[5];
    if (!v12 || ![v12 count])
    {
      id v9 = 0;
      id v10 = 0;
LABEL_24:

      goto LABEL_25;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = (id)v32[5];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
LABEL_16:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        int v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
        uint64_t v18 = objc_msgSend(v17, "slotId", (void)v23);
        if (v18 == [v3 slotID]) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v37 count:16];
          if (v14) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
      id v10 = v17;

      if (!v10) {
        goto LABEL_32;
      }
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v20 = [v10 MEID];

      if (v20)
      {
        id v21 = [v10 MEID];
        [v9 setObject:v21 forKeyedSubscript:*MEMORY[0x263F02E58]];
      }
      os_log_type_t v22 = [v10 EUIMID];

      if (v22)
      {
        id v7 = [v10 EUIMID];
        [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F02E50]];
        goto LABEL_7;
      }
      goto LABEL_24;
    }
LABEL_22:

LABEL_32:
LABEL_10:
    id v9 = 0;
    id v10 = 0;
LABEL_25:

    goto LABEL_26;
  }
  id v9 = 0;
  id v10 = 0;
LABEL_26:

  _Block_object_dispose(&v31, 8);
  return v9;
}

void sub_225F8561C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __CopyMobileEquipmentInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    dispatch_time_t v6 = mysyslog_get_logger();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v7))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_225F82000, v6, v7, "copyMobileEquipmentInfo failed with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = [a2 meInfoList];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t CopyCarrierAccountSettings(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x22A643350]();
  uint64_t v21 = 0;
  os_log_type_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v3 = objc_alloc_init(MEMORY[0x263F02D38]);
  dispatch_semaphore_t v4 = v3;
  if (!v3)
  {
    id v5 = mysyslog_get_logger();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, v5, v10, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }
    goto LABEL_10;
  }
  id v5 = GetUserPreferredSubscriptionContext(v3);
  if (!v5)
  {
LABEL_13:
    uint64_t v11 = v22[3];
    goto LABEL_14;
  }
  dispatch_time_t v6 = (void *)[objc_alloc(MEMORY[0x263F02C28]) initWithBundleType:1];
  if (!v6)
  {
LABEL_12:

    goto LABEL_13;
  }
  *(void *)buf = 0;
  uint64_t v16 = buf;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __CopyCarrierAccountSettings_block_invoke;
  v14[3] = &unk_2647848E8;
  v14[4] = &v21;
  v14[5] = buf;
  [v4 copyCarrierBundleValue:v5 key:a1 bundleType:v6 completion:v14];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  if (!dispatch_semaphore_wait(*((dispatch_semaphore_t *)v16 + 5), v7))
  {
    _Block_object_dispose(buf, 8);

    goto LABEL_12;
  }
  uint64_t v8 = mysyslog_get_logger();
  os_log_type_t v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_225F82000, v8, v9, "timed out while waiting for copying carrier settings", v13, 2u);
  }

  _Block_object_dispose(buf, 8);
LABEL_10:
  uint64_t v11 = 0;
LABEL_14:

  _Block_object_dispose(&v21, 8);
  return v11;
}

void sub_225F859D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __CopyCarrierAccountSettings_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  dispatch_time_t v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      uint64_t v8 = mysyslog_get_logger();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v8, v9))
      {
        int v10 = 138412290;
        uint64_t v11 = v7;
        _os_log_impl(&dword_225F82000, v8, v9, "copyCarrierBundleValue failed with error: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
      CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

CarrierSettingsStatusIndicator *_CBAccessConnectionCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)MEMORY[0x22A643350]();
  dispatch_time_t v7 = objc_alloc_init(CarrierSettingsStatusIndicator);
  [(CarrierSettingsStatusIndicator *)v7 createConnection];
  [(CarrierSettingsStatusIndicator *)v7 setCallback:a1];
  [(CarrierSettingsStatusIndicator *)v7 setRunloop:a2];
  [(CarrierSettingsStatusIndicator *)v7 setRunloopMode:a3];
  return v7;
}

void CaptiveAnalyticsSessionPostNonCaptiveEvent(unsigned int *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    id v5 = "Event Post Failed";
    if (v2) {
      id v5 = "Event Posted";
    }
    uint64_t v6 = *a1;
    if (v6 > 4) {
      dispatch_time_t v7 = "<unknown>";
    }
    else {
      dispatch_time_t v7 = CaptiveWiFiSecurityTypeGetString_names[v6];
    }
    uint64_t v8 = "true";
    int v9 = *((unsigned __int8 *)a1 + 4);
    *(_DWORD *)buf = 136315906;
    if (!v9) {
      uint64_t v8 = "false";
    }
    uint64_t v11 = "com.apple.captive.session.non-captive";
    __int16 v12 = 2080;
    uint64_t v13 = v5;
    __int16 v14 = 2080;
    uint64_t v15 = v7;
    __int16 v16 = 2080;
    uint64_t v17 = v8;
    _os_log_impl(&dword_225F82000, logger, v4, "%s %s \n \t    { \n \t\tWi-Fi Security Type: %s \n \t\tCaptive Bypass: %s \n \t    }", buf, 0x2Au);
  }
}

xpc_object_t __CaptiveAnalyticsSessionPostNonCaptiveEvent_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "CaptiveBypass", *(unsigned __int8 *)(*(void *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "SecurityType", **(unsigned int **)(a1 + 32));
  return v2;
}

void CaptiveAnalyticsSessionPostBuiltinEvent(uint64_t *a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    id v5 = "Event Post Failed";
    if (v2) {
      id v5 = "Event Posted";
    }
    uint64_t v6 = *((unsigned int *)a1 + 2);
    if (v6 > 3) {
      dispatch_time_t v7 = "<unknown>";
    }
    else {
      dispatch_time_t v7 = CaptiveDetectionTypeGetString_names[v6];
    }
    uint64_t v8 = *a1;
    uint64_t v9 = a1[2];
    int v10 = "false";
    if (*((unsigned char *)a1 + 24)) {
      int v10 = "true";
    }
    uint64_t v12 = a1[4];
    uint64_t v11 = a1[5];
    uint64_t v13 = *((unsigned int *)a1 + 12);
    if (v13 > 4) {
      __int16 v14 = "<unknown>";
    }
    else {
      __int16 v14 = CaptiveWiFiSecurityTypeGetString_names[v13];
    }
    *(_DWORD *)buf = 136317186;
    __int16 v16 = "com.apple.captive.session.builtin";
    __int16 v17 = 2080;
    uint64_t v18 = v5;
    __int16 v19 = 2080;
    dispatch_semaphore_t v20 = v7;
    __int16 v21 = 2048;
    uint64_t v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 2080;
    long long v26 = v10;
    __int16 v27 = 2048;
    uint64_t v28 = v12;
    __int16 v29 = 2048;
    uint64_t v30 = v11;
    __int16 v31 = 2080;
    v32 = v14;
    _os_log_impl(&dword_225F82000, logger, v4, "%s %s \n \t    {\t\n \t\tDetection type: %s, \n \t\tTotal Duration %qu seconds \n \t\tMaintenance Interval: %qu, \n \t\tAuto Login Used: %s \n \t\tCorrect Passive Detection Count: %lld, \n \t\tIncorrect Passive Detection Count: %lld, \n \t\tWi-Fi Security Type: %s \n \t    }", buf, 0x5Cu);
  }
}

xpc_object_t __CaptiveAnalyticsSessionPostBuiltinEvent_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "TotalDuration", **(void **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "DetectionType", *(unsigned int *)(*(void *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "AutoLoginUsed", *(unsigned char *)(*(void *)(a1 + 32) + 24) != 0);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    xpc_dictionary_set_uint64(v2, "MaintenanceInterval", v4);
    xpc_dictionary_set_uint64(v2, "CorrectPassiveDetections", *(void *)(*(void *)(a1 + 32) + 32));
    xpc_dictionary_set_uint64(v2, "IncorrectPassiveDetections", *(void *)(*(void *)(a1 + 32) + 40));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  xpc_dictionary_set_uint64(v2, "SecurityType", *(unsigned int *)(v3 + 48));
  return v2;
}

void CaptiveAnalyticsSessionPostHSHelperEvent(uint64_t *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    id v5 = "Event Post Failed";
    uint64_t v6 = *a1;
    uint64_t v7 = a1[1];
    int v8 = *((unsigned __int8 *)a1 + 16);
    if (v2) {
      id v5 = "Event Posted";
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v9 = "false";
    uint64_t v11 = "com.apple.captive.session.hotspot-helper";
    __int16 v12 = 2080;
    if (v8) {
      uint64_t v9 = "true";
    }
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    __int16 v18 = 2080;
    __int16 v19 = v9;
    _os_log_impl(&dword_225F82000, logger, v4, "%s %s \n \t    { \n \t\tTotal Duration %qu seconds \n \t\tBundle Identifier: %@, \n \t\tInternet Access: %s \n \t    }", buf, 0x34u);
  }
}

xpc_object_t __CaptiveAnalyticsSessionPostHSHelperEvent_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "TotalDuration", **(void **)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  CFStringRef v4 = *(const __CFString **)(v3 + 8);
  if (v4)
  {
    CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
    xpc_dictionary_set_string(v2, "BundleID", CStringPtr);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  xpc_dictionary_set_BOOL(v2, "InternetAccess", *(unsigned char *)(v3 + 16) != 0);
  return v2;
}

void CaptiveAnalyticsSessionPostIncompleteEvent(unsigned int a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    id v5 = "Event Post Failed";
    if (v2) {
      id v5 = "Event Posted";
    }
    if (a1 > 4) {
      uint64_t v6 = "<unknown>";
    }
    else {
      uint64_t v6 = CaptiveIncompleteReasonGetString_names[a1];
    }
    *(_DWORD *)buf = 136315650;
    int v8 = "com.apple.captive.session.incomplete";
    __int16 v9 = 2080;
    int v10 = v5;
    __int16 v11 = 2080;
    __int16 v12 = v6;
    _os_log_impl(&dword_225F82000, logger, v4, "%s %s \n \t    { \n \t\tReason: %s, \n \t    }", buf, 0x20u);
  }
}

xpc_object_t __CaptiveAnalyticsSessionPostIncompleteEvent_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Reason", *(unsigned int *)(a1 + 32));
  return v2;
}

void CaptiveAnalyticsSessionPostInconclusiveEvent(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    id v5 = "Event Post Failed";
    *(_DWORD *)buf = 136315650;
    uint64_t v7 = "com.apple.captive.session.inconclusive";
    if (v2) {
      id v5 = "Event Posted";
    }
    __int16 v8 = 2080;
    __int16 v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    _os_log_impl(&dword_225F82000, logger, v4, "%s %s \n \t    { \n \t\terror Code: %qu \n \t    }", buf, 0x20u);
  }
}

xpc_object_t __CaptiveAnalyticsSessionPostInconclusiveEvent_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "ErrorCode", *(void *)(a1 + 32));
  return v2;
}

void *captive_agent_send_probe(const void *a1, const __CFString *a2, int a3, __CFString *a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v15 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  __int16 v16 = v15;
  if (!v15) {
    return v16;
  }
  *((void *)v15 + 6) = 0;
  v15[1] = 0u;
  v15[2] = 0u;
  _OWORD *v15 = 0u;
  create_connection((uint64_t)v15);
  v16[4] = a6;
  void *v16 = a8;
  v16[1] = a7;
  *((_DWORD *)v16 + 7) = 0;
  CFDictionaryRef v17 = (const __CFDictionary *)CaptiveCopyProbeSettings();
  CFDictionaryRef v18 = v17;
  if (v17)
  {
    Value = (__CFString *)CFDictionaryGetValue(v17, @"ProbeURL");
    if (Value)
    {
      uint64_t v20 = Value;
      CFTypeID v21 = CFGetTypeID(Value);
      if (v21 == CFStringGetTypeID()) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = 0;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    __int16 v27 = (__CFString *)CFDictionaryGetValue(v18, @"UserAgent");
    long long v26 = @"wispr";
    if (v27)
    {
      uint64_t v28 = v27;
      CFTypeID v29 = CFGetTypeID(v27);
      if (v29 == CFStringGetTypeID()) {
        long long v26 = v28;
      }
    }
    if (a1
      && (CFDictionaryRef v30 = (const __CFDictionary *)CFDictionaryGetValue(v18, @"SSIDExceptions")) != 0
      && (CFDictionaryRef v31 = v30, v32 = CFGetTypeID(v30), v32 == CFDictionaryGetTypeID())
      && (CFDictionaryRef v33 = (const __CFDictionary *)CFDictionaryGetValue(v31, a1)) != 0
      && (CFDictionaryRef v34 = v33, v35 = CFGetTypeID(v33), v35 == CFDictionaryGetTypeID()))
    {
      id v36 = (__CFString *)CFDictionaryGetValue(v34, @"ProbeURL");
      if (v36)
      {
        v37 = v36;
        CFTypeID v38 = CFGetTypeID(v36);
        if (v38 == CFStringGetTypeID()) {
          __int16 v25 = v37;
        }
        else {
          __int16 v25 = 0;
        }
      }
      else
      {
        __int16 v25 = 0;
      }
      v54 = (__CFString *)CFDictionaryGetValue(v34, @"UserAgent");
      if (v54)
      {
        v55 = v54;
        CFTypeID v56 = CFGetTypeID(v54);
        if (v56 == CFStringGetTypeID()) {
          long long v26 = v55;
        }
      }
    }
    else
    {
      __int16 v25 = 0;
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v24))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, logger, v24, "Unable to open settings file, using default values", buf, 2u);
    }
    __int16 v25 = 0;
    uint64_t v22 = 0;
    long long v26 = @"wispr";
  }
  if (a4)
  {
    CFRetain(a4);
    if (!a3) {
      goto LABEL_58;
    }
LABEL_29:
    v39 = @"NetworkCTS";
    goto LABEL_30;
  }
  if (a3)
  {
    a4 = @"http://netcts.cdn-apple.com";
    CFRetain(@"http://netcts.cdn-apple.com");
    goto LABEL_29;
  }
  v52 = @"http://captive.apple.com/hotspot-detect.html";
  if (v22) {
    v52 = v22;
  }
  if (v25) {
    a4 = v25;
  }
  else {
    a4 = v52;
  }
  CFRetain(a4);
LABEL_58:
  CFStringRef v53 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%s %@", "CaptiveNetworkSupport-480.60.4", v26);
  if (!v53)
  {
    v39 = @"CaptiveNetworkSupport-??? wispr";
LABEL_30:
    CFRetain(v39);
    if (!v18) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  v39 = (__CFString *)v53;
  if (v18) {
LABEL_31:
  }
    CFRelease(v18);
LABEL_32:
  v40 = mysyslog_get_logger();
  os_log_type_t v41 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v40, v41))
  {
    *(_DWORD *)buf = 138412546;
    v60 = v39;
    __int16 v61 = 2112;
    v62 = a4;
    _os_log_impl(&dword_225F82000, v40, v41, "user-agent:\"%@\" url:\"%@\"", buf, 0x16u);
  }
  v42 = (char *)copy_cstring(a2);
  if (v42)
  {
    v43 = v42;
    v44 = (char *)copy_cstring(a4);
    if (v44)
    {
      v45 = v44;
      v46 = (char *)copy_cstring(v39);
      if (v46)
      {
        xpc_object_t v47 = xpc_dictionary_create(0, 0, 0);
        v48 = v47;
        if (v47)
        {
          xpc_dictionary_set_uint64(v47, "MessageType", 0);
          xpc_dictionary_set_string(v48, "ProbeURL", v45);
          xpc_dictionary_set_string(v48, "InterfaceName", v43);
          xpc_dictionary_set_string(v48, "UserAgent", v46);
          xpc_dictionary_set_uint64(v48, "ProbeTimeout", a5);
        }
      }
      else
      {
        v48 = 0;
      }
      CFAllocatorRef v49 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v43);
      CFAllocatorDeallocate(v49, v45);
      if (v46) {
        CFAllocatorDeallocate(v49, v46);
      }
      goto LABEL_44;
    }
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v43);
  }
  v48 = 0;
LABEL_44:
  CFRelease(a4);
  if (v39) {
    CFRelease(v39);
  }
  if (v48)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __captive_agent_send_probe_block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    block[4] = v16;
    block[5] = v48;
    dispatch_sync((dispatch_queue_t)g_queue, block);
    xpc_release(v48);
  }
  else
  {
    v50 = (void *)v16[2];
    if (v50) {
      xpc_release(v50);
    }
    free(v16);
    return 0;
  }
  return v16;
}

void create_connection(uint64_t a1)
{
  if (create_connection_client_init != -1) {
    dispatch_once(&create_connection_client_init, &__block_literal_global);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.captiveagent", (dispatch_queue_t)g_queue, 2uLL);
  *(void *)(a1 + 16) = mach_service;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __create_connection_block_invoke_2;
  handler[3] = &__block_descriptor_tmp_89;
  handler[4] = a1;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(*(xpc_connection_t *)(a1 + 16));
}

void __captive_agent_send_probe_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = g_connections;
  *(void *)(v1 + 40) = g_connections;
  if (v2) {
    *(void *)(v2 + 48) = v1 + 40;
  }
  g_connections = v1;
  *(void *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(void *)(a1 + 32));
}

void send_message(void *a1, uint64_t a2)
{
  if (CaptiveIsDebug()) {
    xpc_dictionary_set_BOOL(a1, "EnableDebug", 1);
  }
  os_log_type_t v4 = *(_xpc_connection_s **)(a2 + 16);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __send_message_block_invoke;
  handler[3] = &__block_descriptor_tmp_97;
  handler[4] = a2;
  xpc_connection_send_message_with_reply(v4, a1, (dispatch_queue_t)g_queue, handler);
}

void captive_agent_abort_probe(void *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_probe_block_invoke;
  block[3] = &__block_descriptor_tmp_1;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_probe_block_invoke(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 32);
  uint64_t v2 = g_connections;
  if (v1) {
    BOOL v3 = g_connections == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    while (v2 != v1)
    {
      uint64_t v2 = *(void *)(v2 + 40);
      if (!v2) {
        return;
      }
    }
    *(unsigned char *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

unsigned char *captive_agent_login(const __CFDictionary *a1, const __CFString *a2, const __CFDictionary *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v12 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  uint64_t v13 = v12;
  if (!v12) {
    return v13;
  }
  *((void *)v12 + 6) = 0;
  v12[1] = 0u;
  v12[2] = 0u;
  *uint64_t v12 = 0u;
  create_connection((uint64_t)v12);
  v13[24] = 0;
  *((void *)v13 + 4) = a5;
  *((_DWORD *)v13 + 7) = 1;
  *(void *)uint64_t v13 = a4;
  *((void *)v13 + 1) = a6;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, kWISPrLoginURL[0]);
  CFStringRef v15 = (const __CFString *)CFDictionaryGetValue(a1, kUserAgent[0]);
  if (!a3 || (MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3)) == 0)
  {
    CFDictionaryRef v17 = 0;
    BOOL v18 = Value == 0;
    BOOL v19 = v15 == 0;
    int v21 = 1;
LABEL_11:
    logger = mysyslog_get_logger();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v23))
    {
      os_log_type_t v24 = "";
      __int16 v25 = " url";
      if (!v18) {
        __int16 v25 = "";
      }
      long long v26 = " agent";
      if (!v19) {
        long long v26 = "";
      }
      *(_DWORD *)buf = 136315650;
      v48 = v25;
      __int16 v49 = 2080;
      v50 = v26;
      if (v21) {
        os_log_type_t v24 = " POST variables";
      }
      __int16 v51 = 2080;
      v52 = v24;
      _os_log_impl(&dword_225F82000, logger, v23, "wispr dictionary does not contain%s%s%s", buf, 0x20u);
    }
    if (v21) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  CFDictionaryRef v17 = MutableCopy;
  CFDictionaryAddValue(MutableCopy, @"OriginatingServer", @"http://www.apple.com/");
  CFDictionaryAddValue(v17, @"button", @"Login");
  CFDictionaryAddValue(v17, @"FNAME", @"0");
  BOOL v18 = Value == 0;
  BOOL v19 = v15 == 0;
  if (Value) {
    BOOL v20 = v15 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    int v21 = 0;
    goto LABEL_11;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  if (Mutable)
  {
    CFStringRef v30 = Mutable;
    CFDictionaryApplyFunction(v17, (CFDictionaryApplierFunction)add_post_variable, Mutable);
    CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], v30, 0x8000100u, 0);
    CFRelease(v30);
    if (ExternalRepresentation)
    {
      size_t Length = CFDataGetLength(ExternalRepresentation);
      CFDictionaryRef v34 = (UInt8 *)malloc_type_malloc(Length, 0xF45CFB6BuLL);
      if (v34)
      {
        v54.length = CFDataGetLength(ExternalRepresentation);
        v54.location = 0;
        CFDataGetBytes(ExternalRepresentation, v54, v34);
        CFTypeID v35 = (char *)copy_cstring(a2);
        if (v35)
        {
          id v36 = (char *)copy_cstring(Value);
          if (v36)
          {
            v37 = (char *)copy_cstring(v15);
            if (v37)
            {
              xpc_object_t v38 = xpc_dictionary_create(0, 0, 0);
              if (v38)
              {
                v39 = v38;
                xpc_dictionary_set_uint64(v38, "MessageType", 2uLL);
                xpc_dictionary_set_string(v39, "LoginURL", v36);
                xpc_dictionary_set_string(v39, "InterfaceName", v35);
                xpc_dictionary_set_string(v39, "UserAgent", v37);
                size_t v40 = CFDataGetLength(ExternalRepresentation);
                xpc_dictionary_set_data(v39, "LoginBody", v34, v40);
                CFRelease(v17);
                CFRelease(ExternalRepresentation);
LABEL_41:
                free(v34);
                v45 = v39;
LABEL_42:
                if (v35) {
                  CFAllocatorDeallocate(v31, v35);
                }
                if (v36) {
                  CFAllocatorDeallocate(v31, v36);
                }
                if (v37) {
                  CFAllocatorDeallocate(v31, v37);
                }
                if (v45)
                {
                  v46[0] = MEMORY[0x263EF8330];
                  v46[1] = 0x40000000;
                  v46[2] = __captive_agent_login_block_invoke;
                  v46[3] = &__block_descriptor_tmp_2;
                  v46[4] = v13;
                  v46[5] = v45;
                  dispatch_sync((dispatch_queue_t)g_queue, v46);
                  xpc_release(v45);
                  return v13;
                }
                goto LABEL_21;
              }
            }
LABEL_40:
            CFRelease(v17);
            CFRelease(ExternalRepresentation);
            v39 = 0;
            v45 = 0;
            if (!v34) {
              goto LABEL_42;
            }
            goto LABEL_41;
          }
LABEL_39:
          v37 = 0;
          goto LABEL_40;
        }
      }
      else
      {
        CFTypeID v35 = 0;
      }
      id v36 = 0;
      goto LABEL_39;
    }
  }
  else
  {
    os_log_type_t v41 = mysyslog_get_logger();
    os_log_type_t v42 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v41, v42))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, v41, v42, "CFStringCreateMutable failed", buf, 2u);
    }
  }
  v43 = mysyslog_get_logger();
  os_log_type_t v44 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v43, v44))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225F82000, v43, v44, "create_login_body() failed", buf, 2u);
  }
LABEL_20:
  CFRelease(v17);
LABEL_21:
  __int16 v27 = (void *)*((void *)v13 + 2);
  if (v27) {
    xpc_release(v27);
  }
  free(v13);
  return 0;
}

void __captive_agent_login_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = g_connections;
  *(void *)(v1 + 40) = g_connections;
  if (v2) {
    *(void *)(v2 + 48) = v1 + 40;
  }
  g_connections = v1;
  *(void *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(void *)(a1 + 32));
}

void captive_agent_abort_login(void *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_login_block_invoke;
  block[3] = &__block_descriptor_tmp_3;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_login_block_invoke(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 32);
  uint64_t v2 = g_connections;
  if (v1) {
    BOOL v3 = g_connections == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    while (v2 != v1)
    {
      uint64_t v2 = *(void *)(v2 + 40);
      if (!v2) {
        return;
      }
    }
    *(unsigned char *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

void *captive_agent_token_login(const __CFString *a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  uint64_t v13 = v12;
  if (v12)
  {
    v12[6] = 0;
    *((_OWORD *)v12 + 1) = 0u;
    *((_OWORD *)v12 + 2) = 0u;
    *(_OWORD *)uint64_t v12 = 0u;
    create_connection((uint64_t)v12);
    *((unsigned char *)v13 + 24) = 0;
    v13[4] = a5;
    *((_DWORD *)v13 + 7) = 5;
    void *v13 = a4;
    v13[1] = a6;
    CFStringRef Value = (__CFString *)CFDictionaryGetValue(a2, kTokenAuthLoginURL[0]);
    CFStringRef v15 = (const __CFString *)CFDictionaryGetValue(a2, @"Password");
    CFTypeID TypeID = CFStringGetTypeID();
    if (!v15) {
      return 0;
    }
    if (CFGetTypeID(v15) != TypeID) {
      return 0;
    }
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], v15, 0x8000100u, 0);
    if (!ExternalRepresentation) {
      return 0;
    }
    CFDataRef v19 = ExternalRepresentation;
    BOOL v20 = (char *)copy_cstring(a1);
    if (!v20)
    {
      CFRelease(v19);
      return 0;
    }
    int v21 = v20;
    CFTypeID v22 = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == v22)
      {
        CFStringRef Value = (__CFString *)copy_cstring(Value);
        if (!Value)
        {
          os_log_type_t v23 = 0;
          CFStringRef Value = (__CFString *)v21;
          goto LABEL_17;
        }
      }
      else
      {
        CFStringRef Value = 0;
      }
    }
    xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
    os_log_type_t v23 = v24;
    if (v24)
    {
      xpc_dictionary_set_uint64(v24, "MessageType", 0xAuLL);
      if (Value) {
        xpc_dictionary_set_string(v23, "TokenAuthURL", (const char *)Value);
      }
      xpc_dictionary_set_string(v23, "InterfaceName", v21);
      xpc_dictionary_set_string(v23, "UserAgent", "CaptiveNetworkSupport-480.60.4");
      xpc_dictionary_set_uint64(v23, "TokenAuthTimeout", a3);
      BytePtr = CFDataGetBytePtr(v19);
      size_t Length = CFDataGetLength(v19);
      xpc_dictionary_set_data(v23, "TokenAuthCredential", BytePtr, Length);
    }
    CFAllocatorDeallocate(v17, v21);
    if (!Value)
    {
LABEL_18:
      CFRelease(v19);
      if (v23)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 0x40000000;
        v28[2] = __captive_agent_token_login_block_invoke;
        v28[3] = &__block_descriptor_tmp_4;
        v28[4] = v13;
        v28[5] = v23;
        dispatch_sync((dispatch_queue_t)g_queue, v28);
        xpc_release(v23);
        return v13;
      }
      return 0;
    }
LABEL_17:
    CFAllocatorDeallocate(v17, Value);
    goto LABEL_18;
  }
  return v13;
}

void __captive_agent_token_login_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = g_connections;
  *(void *)(v1 + 40) = g_connections;
  if (v2) {
    *(void *)(v2 + 48) = v1 + 40;
  }
  g_connections = v1;
  *(void *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(void *)(a1 + 32));
}

void captive_agent_abort_token_auth(void *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_token_auth_block_invoke;
  block[3] = &__block_descriptor_tmp_5;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_token_auth_block_invoke(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 32);
  uint64_t v2 = g_connections;
  if (v1) {
    BOOL v3 = g_connections == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    while (v2 != v1)
    {
      uint64_t v2 = *(void *)(v2 + 40);
      if (!v2) {
        return;
      }
    }
    *(unsigned char *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

void *captive_agent_logout(const __CFDictionary *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, kWISPrLogoffURL[0]);
  if (!Value)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v27))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, logger, v27, "login result dictionary does not contain logout URL", buf, 2u);
    }
    return 0;
  }
  CFStringRef v11 = Value;
  CFStringRef v12 = (const __CFString *)CFDictionaryGetValue(a1, kUserAgent[0]);
  if (v12) {
    CFStringRef v13 = v12;
  }
  else {
    CFStringRef v13 = @"CaptiveNetworkSupport-??? wispr";
  }
  __int16 v14 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  CFStringRef v15 = v14;
  if (v14)
  {
    *((void *)v14 + 6) = 0;
    v14[1] = 0u;
    v14[2] = 0u;
    *__int16 v14 = 0u;
    create_connection((uint64_t)v14);
    v15[4] = a4;
    void *v15 = a3;
    v15[1] = a5;
    *((_DWORD *)v15 + 7) = 2;
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    if (v16)
    {
      CFAllocatorRef v17 = v16;
      BOOL v18 = (char *)copy_cstring(v11);
      if (v18)
      {
        CFDataRef v19 = v18;
        BOOL v20 = (char *)copy_cstring(a2);
        if (v20)
        {
          int v21 = v20;
          CFTypeID v22 = (const char *)copy_cstring(v13);
          if (v22)
          {
            xpc_dictionary_set_uint64(v17, "MessageType", 4uLL);
            xpc_dictionary_set_string(v17, "LogoffURL", v19);
            xpc_dictionary_set_string(v17, "InterfaceName", v21);
            xpc_dictionary_set_string(v17, "UserAgent", v22);
          }
          CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v19);
          CFAllocatorDeallocate(v23, v21);
          if (!v22) {
            goto LABEL_21;
          }
          CFAllocatorRef v24 = v23;
          __int16 v25 = (void *)v22;
        }
        else
        {
          CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          __int16 v25 = v19;
        }
        CFAllocatorDeallocate(v24, v25);
      }
LABEL_21:
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 0x40000000;
      v30[2] = __captive_agent_logout_block_invoke;
      v30[3] = &__block_descriptor_tmp_7;
      v30[4] = v15;
      v30[5] = v17;
      dispatch_sync((dispatch_queue_t)g_queue, v30);
      xpc_release(v17);
      return v15;
    }
    uint64_t v28 = (void *)v15[2];
    if (v28) {
      xpc_release(v28);
    }
    free(v15);
    return 0;
  }
  return v15;
}

void __captive_agent_logout_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = g_connections;
  *(void *)(v1 + 40) = g_connections;
  if (v2) {
    *(void *)(v2 + 48) = v1 + 40;
  }
  g_connections = v1;
  *(void *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(void *)(a1 + 32));
}

void captive_agent_abort_logout(void *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_logout_block_invoke;
  block[3] = &__block_descriptor_tmp_8;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_logout_block_invoke(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 32);
  uint64_t v2 = g_connections;
  if (v1) {
    BOOL v3 = g_connections == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    while (v2 != v1)
    {
      uint64_t v2 = *(void *)(v2 + 40);
      if (!v2) {
        return;
      }
    }
    *(unsigned char *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

void *captive_agent_query_api(uint64_t a1, const __CFString *a2, const __CFString *a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  CFStringRef v13 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  __int16 v14 = v13;
  if (v13)
  {
    *((void *)v13 + 6) = 0;
    v13[1] = 0u;
    v13[2] = 0u;
    _OWORD *v13 = 0u;
    create_connection((uint64_t)v13);
    v14[4] = a5;
    *__int16 v14 = a7;
    v14[1] = a6;
    *((_DWORD *)v14 + 7) = 4;
    CFStringRef v15 = (char *)copy_cstring(a2);
    if (v15)
    {
      xpc_object_t v16 = v15;
      CFAllocatorRef v17 = (char *)copy_cstring(a3);
      if (v17)
      {
        BOOL v18 = v17;
        xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
        if (v19)
        {
          BOOL v20 = v19;
          xpc_dictionary_set_uint64(v19, "MessageType", 8uLL);
          xpc_dictionary_set_string(v20, "PortalAPIURI", v18);
          xpc_dictionary_set_string(v20, "InterfaceName", v16);
          xpc_dictionary_set_string(v20, "UserAgent", "CaptiveNetworkSupport-480.60.4");
          xpc_dictionary_set_uint64(v20, "ProbeTimeout", a4);
          CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v16);
          CFAllocatorDeallocate(v21, v18);
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 0x40000000;
          v27[2] = __captive_agent_query_api_block_invoke;
          v27[3] = &__block_descriptor_tmp_9;
          void v27[4] = v14;
          v27[5] = v20;
          dispatch_sync((dispatch_queue_t)g_queue, v27);
          xpc_release(v20);
          return v14;
        }
        CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v16);
        CFAllocatorRef v22 = v24;
        CFAllocatorRef v23 = v18;
      }
      else
      {
        CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFAllocatorRef v23 = v16;
      }
      CFAllocatorDeallocate(v22, v23);
    }
    __int16 v25 = (void *)v14[2];
    if (v25) {
      xpc_release(v25);
    }
    free(v14);
    return 0;
  }
  return v14;
}

void __captive_agent_query_api_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = g_connections;
  *(void *)(v1 + 40) = g_connections;
  if (v2) {
    *(void *)(v2 + 48) = v1 + 40;
  }
  g_connections = v1;
  *(void *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(void *)(a1 + 32));
}

void captive_agent_abort_query(void *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_query_block_invoke;
  block[3] = &__block_descriptor_tmp_10;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_query_block_invoke(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 32);
  uint64_t v2 = g_connections;
  if (v1) {
    BOOL v3 = g_connections == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    while (v2 != v1)
    {
      uint64_t v2 = *(void *)(v2 + 40);
      if (!v2) {
        return;
      }
    }
    *(unsigned char *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

void *captive_agent_get_credentials(const __CFString *a1, const __CFString *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  CFStringRef v13 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  __int16 v14 = v13;
  if (v13)
  {
    *((void *)v13 + 6) = 0;
    v13[1] = 0u;
    v13[2] = 0u;
    _OWORD *v13 = 0u;
    create_connection((uint64_t)v13);
    v14[4] = a5;
    *__int16 v14 = a7;
    v14[1] = a6;
    *((_DWORD *)v14 + 7) = 3;
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    if (v15)
    {
      xpc_object_t v16 = v15;
      CFAllocatorRef v17 = (char *)copy_cstring(a1);
      if (v17)
      {
        BOOL v18 = v17;
        xpc_object_t v19 = (char *)copy_cstring(a2);
        if (v19)
        {
          BOOL v20 = v19;
          CFAllocatorRef v21 = (const char *)copy_cstring(@"CaptiveNetworkSupport-480.60.4");
          if (v21)
          {
            xpc_dictionary_set_uint64(v16, "MessageType", 6uLL);
            xpc_dictionary_set_string(v16, "CredentialsURL", v18);
            xpc_dictionary_set_string(v16, "UserAgent", v21);
            xpc_dictionary_set_string(v16, "ServiceType", v20);
            xpc_dictionary_set_uint64(v16, "ProbeTimeout", a4);
          }
          CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v18);
          CFAllocatorDeallocate(v22, v20);
          if (!v21) {
            goto LABEL_14;
          }
          CFAllocatorRef v23 = v22;
          CFAllocatorRef v24 = (void *)v21;
        }
        else
        {
          CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFAllocatorRef v24 = v18;
        }
        CFAllocatorDeallocate(v23, v24);
      }
LABEL_14:
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 0x40000000;
      v27[2] = __captive_agent_get_credentials_block_invoke;
      v27[3] = &__block_descriptor_tmp_14_0;
      void v27[4] = v14;
      v27[5] = v16;
      dispatch_sync((dispatch_queue_t)g_queue, v27);
      xpc_release(v16);
      return v14;
    }
    __int16 v25 = (void *)v14[2];
    if (v25) {
      xpc_release(v25);
    }
    free(v14);
    return 0;
  }
  return v14;
}

void __captive_agent_get_credentials_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = g_connections;
  *(void *)(v1 + 40) = g_connections;
  if (v2) {
    *(void *)(v2 + 48) = v1 + 40;
  }
  g_connections = v1;
  *(void *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(void *)(a1 + 32));
}

void captive_agent_get_credentials_abort(void *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __captive_agent_get_credentials_abort_block_invoke;
  block[3] = &__block_descriptor_tmp_15;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_get_credentials_abort_block_invoke(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 32);
  uint64_t v2 = g_connections;
  if (v1) {
    BOOL v3 = g_connections == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    while (v2 != v1)
    {
      uint64_t v2 = *(void *)(v2 + 40);
      if (!v2) {
        return;
      }
    }
    *(unsigned char *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

void *copy_cstring(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v5 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], MaximumSizeForEncoding, 0);
  if (v5 && !CFStringGetCString(a1, (char *)v5, MaximumSizeForEncoding, 0x8000100u))
  {
    CFAllocatorDeallocate(v4, v5);
    return 0;
  }
  return v5;
}

void add_post_variable(CFStringRef originalString, const __CFString *a2, __CFString *a3)
{
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v6 = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x263EFFB08], originalString, 0, 0, 0x8000100u);
  CFTypeID TypeID = CFStringGetTypeID();
  if (a2)
  {
    if (CFGetTypeID(a2) == TypeID) {
      a2 = CFURLCreateStringByAddingPercentEscapes(v5, a2, 0, 0, 0x8000100u);
    }
    else {
      CFRetain(a2);
    }
  }
  if (CFStringGetLength(a3) >= 1) {
    CFStringAppend(a3, @"&");
  }
  if (v6) {
    BOOL v8 = a2 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    CFStringAppendFormat(a3, 0, @"%@=%@", v6, a2);
    goto LABEL_17;
  }
  if (v6)
  {
LABEL_17:
    CFRelease(v6);
    if (!a2) {
      return;
    }
    goto LABEL_14;
  }
  if (!a2) {
    return;
  }
LABEL_14:

  CFRelease(a2);
}

dispatch_queue_t __create_connection_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.captiveagent", 0);
  g_queue = (uint64_t)result;
  g_connections = 0;
  return result;
}

void __create_connection_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a2 && MEMORY[0x22A643790](a2) == MEMORY[0x263EF8720])
  {
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
      LODWORD(v13) = 136315138;
      *(void *)((char *)&v13 + 4) = string;
      _os_log_impl(&dword_225F82000, logger, v5, "xpc event handler block got an error on the XPC connection: %s", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      uint64_t v8 = g_connections;
      if (g_connections)
      {
        while (v8 != v7)
        {
          uint64_t v8 = *(void *)(v8 + 40);
          if (!v8) {
            return;
          }
        }
        if (*(unsigned char *)(v7 + 24))
        {
          cleanup_context(*(void **)(a1 + 32));
        }
        else
        {
          switch(*(_DWORD *)(v7 + 28))
          {
            case 0:
              schedule_probe_response_handler(*(void *)(v7 + 32), *(void *)(a1 + 32), *(CFRunLoopRef *)v7, *(void *)(v7 + 8), 13, 0);
              break;
            case 1:
              schedule_login_response_handler(*(void *)(v7 + 32), *(void *)(a1 + 32), *(CFRunLoopRef *)v7, *(void *)(v7 + 8), 0);
              break;
            case 2:
              uint64_t v9 = *(void *)(v7 + 32);
              CFStringRef v11 = *(__CFRunLoop **)v7;
              uint64_t v10 = *(void *)(v7 + 8);
              CFStringRef v12 = (const void *)*MEMORY[0x263EFFE88];
              *(void *)&long long v13 = MEMORY[0x263EF8330];
              *((void *)&v13 + 1) = 0x40000000;
              __int16 v14 = __schedule_logout_response_handler_block_invoke;
              xpc_object_t v15 = &__block_descriptor_tmp_95;
              uint64_t v16 = v7;
              uint64_t v17 = v9;
              uint64_t v18 = v10;
              int v19 = 13;
              CFRunLoopPerformBlock(v11, v12, &v13);
              CFRunLoopWakeUp(v11);
              break;
            case 3:
              schedule_get_creds_response_handler(*(void *)(v7 + 32), *(void *)(a1 + 32), *(CFRunLoopRef *)v7, *(void *)(v7 + 8), 13, 0);
              break;
            case 4:
              schedule_query_api_response_handler(*(void *)(v7 + 32), *(void *)(a1 + 32), *(CFRunLoopRef *)v7, *(void *)(v7 + 8), 13, 0);
              break;
            default:
              return;
          }
        }
      }
    }
  }
}

void cleanup_context(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    *(void *)(v2 + 48) = a1[6];
  }
  *(void *)a1[6] = v2;
  BOOL v3 = (void *)a1[2];
  if (v3) {
    xpc_release(v3);
  }

  free(a1);
}

void schedule_probe_response_handler(uint64_t a1, uint64_t a2, CFRunLoopRef rl, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7 = (const void *)*MEMORY[0x263EFFE88];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __schedule_probe_response_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_90;
  block[4] = a2;
  void block[5] = a1;
  int v9 = a5;
  void block[6] = a4;
  block[7] = a6;
  CFRunLoopPerformBlock(rl, v7, block);
  CFRunLoopWakeUp(rl);
}

void schedule_query_api_response_handler(uint64_t a1, uint64_t a2, CFRunLoopRef rl, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7 = (const void *)*MEMORY[0x263EFFE88];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __schedule_query_api_response_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_92;
  block[4] = a2;
  void block[5] = a1;
  int v9 = a5;
  void block[6] = a4;
  block[7] = a6;
  CFRunLoopPerformBlock(rl, v7, block);
  CFRunLoopWakeUp(rl);
}

void schedule_login_response_handler(uint64_t a1, uint64_t a2, CFRunLoopRef rl, uint64_t a4, uint64_t a5)
{
  CFStringRef v6 = (const void *)*MEMORY[0x263EFFE88];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 0x40000000;
  v7[2] = __schedule_login_response_handler_block_invoke;
  v7[3] = &__block_descriptor_tmp_93;
  v7[4] = a2;
  v7[5] = a1;
  v7[6] = a4;
  v7[7] = a5;
  CFRunLoopPerformBlock(rl, v6, v7);
  CFRunLoopWakeUp(rl);
}

void schedule_get_creds_response_handler(uint64_t a1, uint64_t a2, CFRunLoopRef rl, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7 = (const void *)*MEMORY[0x263EFFE88];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __schedule_get_creds_response_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_94;
  block[4] = a2;
  void block[5] = a1;
  int v9 = a5;
  void block[6] = a4;
  block[7] = a6;
  CFRunLoopPerformBlock(rl, v7, block);
  CFRunLoopWakeUp(rl);
}

void __schedule_probe_response_handler_block_invoke(uint64_t a1)
{
  if (should_process_response(*(void *)(a1 + 32))) {
    (*(void (**)(void, void, void))(a1 + 40))(*(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56));
  }
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t should_process_response(uint64_t a1)
{
  uint64_t v4 = 0;
  os_log_type_t v5 = &v4;
  uint64_t v6 = 0x2000000000;
  char v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = __should_process_response_block_invoke;
  v3[3] = &unk_264784C28;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void __should_process_response_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = g_connections;
  if (v1) {
    BOOL v3 = g_connections == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    while (v2 != v1)
    {
      uint64_t v2 = *(void *)(v2 + 40);
      if (!v2) {
        return;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(unsigned char *)(v1 + 24) == 0;
    cleanup_context(*(void **)(a1 + 40));
  }
}

void __schedule_query_api_response_handler_block_invoke(uint64_t a1)
{
  if (should_process_response(*(void *)(a1 + 32))) {
    (*(void (**)(void, void, void))(a1 + 40))(*(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56));
  }
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __schedule_login_response_handler_block_invoke(uint64_t a1)
{
  if (should_process_response(*(void *)(a1 + 32))) {
    (*(void (**)(void, void))(a1 + 40))(*(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __schedule_get_creds_response_handler_block_invoke(uint64_t a1)
{
  if (should_process_response(*(void *)(a1 + 32))) {
    (*(void (**)(void, void, void))(a1 + 40))(*(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56));
  }
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t __schedule_logout_response_handler_block_invoke(uint64_t a1)
{
  uint64_t result = should_process_response(*(void *)(a1 + 32));
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v5 = *(unsigned int *)(a1 + 56);
    return v4(v3, v5);
  }
  return result;
}

void __send_message_block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (MEMORY[0x22A643790](a2) == MEMORY[0x263EF8708])
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4)
      {
        uint64_t v5 = g_connections;
        if (g_connections)
        {
          while (v5 != v4)
          {
            uint64_t v5 = *(void *)(v5 + 40);
            if (!v5) {
              return;
            }
          }
          if (*(unsigned char *)(v4 + 24))
          {
            cleanup_context((void *)v4);
          }
          else
          {
            switch(xpc_dictionary_get_uint64(a2, "MessageType"))
            {
              case 1uLL:
                uint64_t v6 = *(void *)(v4 + 32);
                uint64_t v8 = *(__CFRunLoop **)v4;
                uint64_t v7 = *(void *)(v4 + 8);
                int uint64 = xpc_dictionary_get_uint64(a2, "ResultCode");
                if (xpc_dictionary_get_value(a2, "ProbeResultDict")) {
                  uint64_t v10 = _CFXPCCreateCFObjectFromXPCObject();
                }
                else {
                  uint64_t v10 = 0;
                }
                schedule_probe_response_handler(v6, v4, v8, v7, uint64, v10);
                break;
              case 3uLL:
                uint64_t v11 = *(void *)(v4 + 32);
                long long v13 = *(__CFRunLoop **)v4;
                uint64_t v12 = *(void *)(v4 + 8);
                if (xpc_dictionary_get_value(a2, "LoginResultDict")) {
                  uint64_t v14 = _CFXPCCreateCFObjectFromXPCObject();
                }
                else {
                  uint64_t v14 = 0;
                }
                schedule_login_response_handler(v11, v4, v13, v12, v14);
                break;
              case 7uLL:
                uint64_t v15 = *(void *)(v4 + 32);
                uint64_t v17 = *(__CFRunLoop **)v4;
                uint64_t v16 = *(void *)(v4 + 8);
                int v18 = xpc_dictionary_get_uint64(a2, "ResultCode");
                if (xpc_dictionary_get_value(a2, "GetCredsResultDict")) {
                  uint64_t v19 = _CFXPCCreateCFObjectFromXPCObject();
                }
                else {
                  uint64_t v19 = 0;
                }
                schedule_get_creds_response_handler(v15, v4, v17, v16, v18, v19);
                break;
              case 9uLL:
                uint64_t v20 = *(void *)(v4 + 32);
                CFAllocatorRef v22 = *(__CFRunLoop **)v4;
                uint64_t v21 = *(void *)(v4 + 8);
                int v23 = xpc_dictionary_get_uint64(a2, "ResultCode");
                if (xpc_dictionary_get_value(a2, "APIResultDict")) {
                  uint64_t v24 = _CFXPCCreateCFObjectFromXPCObject();
                }
                else {
                  uint64_t v24 = 0;
                }
                schedule_query_api_response_handler(v20, v4, v22, v21, v23, v24);
                break;
              case 0xBuLL:
                uint64_t v25 = *(void *)(v4 + 32);
                long long v26 = *(__CFRunLoop **)v4;
                uint64_t v27 = *(void *)(v4 + 8);
                int v28 = xpc_dictionary_get_uint64(a2, "ResultCode");
                uint64_t value = (uint64_t)xpc_dictionary_get_value(a2, "TokenAuthResultDict");
                if (value) {
                  uint64_t value = _CFXPCCreateCFObjectFromXPCObject();
                }
                CFStringRef v30 = (const void *)*MEMORY[0x263EFFE88];
                block[0] = MEMORY[0x263EF8330];
                block[1] = 0x40000000;
                block[2] = __schedule_token_auth_response_handler_block_invoke;
                block[3] = &__block_descriptor_tmp_104;
                block[4] = v4;
                void block[5] = v25;
                int v32 = v28;
                void block[6] = v27;
                block[7] = value;
                CFRunLoopPerformBlock(v26, v30, block);
                CFRunLoopWakeUp(v26);
                break;
              default:
                return;
            }
          }
        }
      }
    }
  }
}

void __schedule_token_auth_response_handler_block_invoke(uint64_t a1)
{
  if (should_process_response(*(void *)(a1 + 32))) {
    (*(void (**)(void, void, void))(a1 + 40))(*(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56));
  }
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

BOOL is_internal_install()
{
  int v0 = is_internal_install_isInternal;
  if (is_internal_install_isInternal == -1)
  {
    int v1 = open("/AppleInternal", 0);
    if (v1 == -1)
    {
      int v0 = 0;
      is_internal_install_isInternal = 0;
    }
    else
    {
      is_internal_install_isInternal = 1;
      close(v1);
      int v0 = is_internal_install_isInternal;
    }
  }
  return v0 == 1;
}

uint64_t CaptiveCopyInterfaceSSIDData(CFTypeRef cf2)
{
  uint64_t v2 = &S_stateHeadStorage;
  do
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      return 0;
    }
  }
  while (!CFEqual((CFTypeRef)v2[4], cf2));
  uint64_t v3 = v2[7];
  if (v3) {
    CFRetain((CFTypeRef)v2[7]);
  }
  return v3;
}

uint64_t CaptiveCopyInterfaceSSID(CFTypeRef cf2)
{
  uint64_t v2 = &S_stateHeadStorage;
  do
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      return 0;
    }
  }
  while (!CFEqual((CFTypeRef)v2[4], cf2));
  uint64_t v3 = v2[6];
  if (v3) {
    CFRetain((CFTypeRef)v2[6]);
  }
  return v3;
}

uint64_t CaptiveCopyInitialURL(CFTypeRef cf2)
{
  uint64_t v2 = &S_stateHeadStorage;
  do
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      return 0;
    }
  }
  while (!CFEqual((CFTypeRef)v2[4], cf2));
  uint64_t v3 = v2[14];
  if (v3) {
    CFRetain((CFTypeRef)v2[14]);
  }
  return v3;
}

uint64_t CaptiveCopyPortalURL(CFTypeRef cf2)
{
  uint64_t v2 = &S_stateHeadStorage;
  do
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      return 0;
    }
  }
  while (!CFEqual((CFTypeRef)v2[4], cf2));
  uint64_t v3 = v2[15];
  if (v3) {
    CFRetain((CFTypeRef)v2[15]);
  }
  return v3;
}

void CaptiveUpdateAPIState(CFTypeRef cf2, const void *a2)
{
  uint64_t v4 = &S_stateHeadStorage;
  while (1)
  {
    uint64_t v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    if (CFEqual((CFTypeRef)v4[4], cf2))
    {
      my_FieldSetRetainedCFType((const void **)v4 + 18, a2);
      return;
    }
  }
}

uint64_t CaptiveGetRedirectForInterface(CFTypeRef cf2)
{
  uint64_t v2 = &S_stateHeadStorage;
  while (1)
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (CFEqual((CFTypeRef)v2[4], cf2)) {
      return v2[16];
    }
  }
  return 0;
}

uint64_t CaptiveGetAuthReplyForInterface(CFTypeRef cf2)
{
  uint64_t v2 = &S_stateHeadStorage;
  while (1)
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (CFEqual((CFTypeRef)v2[4], cf2)) {
      return v2[17];
    }
  }
  return 0;
}

void CaptiveDumpStates()
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225F82000, logger, v1, "Captive states:", buf, 2u);
  }
  for (uint64_t i = S_stateHeadStorage; i; uint64_t i = *(void *)i)
  {
    uint64_t v3 = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = i;
      _os_log_impl(&dword_225F82000, v3, v4, "State %p:", buf, 0xCu);
    }
    uint64_t v5 = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = *(void *)(i + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v7;
      _os_log_impl(&dword_225F82000, v5, v6, "  interface:   %@", buf, 0xCu);
    }
    uint64_t v8 = mysyslog_get_logger();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = *(void *)(i + 64);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v10;
      _os_log_impl(&dword_225F82000, v8, v9, "  stage:       %@", buf, 0xCu);
    }
    uint64_t v11 = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *(void *)(i + 72);
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = v13;
      _os_log_impl(&dword_225F82000, v11, v12, "  detect_ref:  %p", buf, 0xCu);
    }
    uint64_t v14 = mysyslog_get_logger();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = *(void *)(i + 88);
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = v16;
      _os_log_impl(&dword_225F82000, v14, v15, "  query_ref:   %p", buf, 0xCu);
    }
    uint64_t v17 = mysyslog_get_logger();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = *(void *)(i + 80);
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = v19;
      _os_log_impl(&dword_225F82000, v17, v18, "  login_ref:   %p", buf, 0xCu);
    }
    uint64_t v20 = mysyslog_get_logger();
    os_log_type_t v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = *(void *)(i + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = v22;
      _os_log_impl(&dword_225F82000, v20, v21, "  thirdParty:  %p", buf, 0xCu);
    }
    int v23 = mysyslog_get_logger();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = *(void *)(i + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v25;
      _os_log_impl(&dword_225F82000, v23, v24, "  ssid:        %@", buf, 0xCu);
    }
    long long v26 = mysyslog_get_logger();
    os_log_type_t v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = *(void *)(i + 224);
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = v28;
      _os_log_impl(&dword_225F82000, v26, v27, "  websheet:    %p", buf, 0xCu);
    }
    CFTypeID v29 = mysyslog_get_logger();
    os_log_type_t v30 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = *(void *)(i + 144);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v31;
      _os_log_impl(&dword_225F82000, v29, v30, "  api:         %@", buf, 0xCu);
    }
    int v32 = mysyslog_get_logger();
    os_log_type_t v33 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = *(void *)(i + 152);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v34;
      _os_log_impl(&dword_225F82000, v32, v33, "  token_auth_result:         %@", buf, 0xCu);
    }
    CFTypeID v35 = mysyslog_get_logger();
    os_log_type_t v36 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = *(void *)(i + 232);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v37;
      _os_log_impl(&dword_225F82000, v35, v36, "  name:        %@", buf, 0xCu);
    }
    xpc_object_t v38 = mysyslog_get_logger();
    os_log_type_t v39 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v38, v39))
    {
      size_t v40 = "!NULL";
      if (!*(void *)(i + 240)) {
        size_t v40 = "NULL";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v63 = (uint64_t)v40;
      _os_log_impl(&dword_225F82000, v38, v39, "  pass:        %s", buf, 0xCu);
    }
    os_log_type_t v41 = mysyslog_get_logger();
    os_log_type_t v42 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = "TRUE";
      if (!*(unsigned char *)(i + 252)) {
        v43 = "FALSE";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v63 = (uint64_t)v43;
      _os_log_impl(&dword_225F82000, v41, v42, "  waitingonu:  %s", buf, 0xCu);
    }
    os_log_type_t v44 = mysyslog_get_logger();
    os_log_type_t v45 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v44, v45))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, v44, v45, "  redirect:", buf, 2u);
    }
    v46 = mysyslog_get_logger();
    os_log_type_t v47 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = *(void *)(i + 128);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v48;
      _os_log_impl(&dword_225F82000, v46, v47, "    %@", buf, 0xCu);
    }
    __int16 v49 = mysyslog_get_logger();
    os_log_type_t v50 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v49, v50))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, v49, v50, "  authreply", buf, 2u);
    }
    __int16 v51 = mysyslog_get_logger();
    os_log_type_t v52 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = *(void *)(i + 136);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v53;
      _os_log_impl(&dword_225F82000, v51, v52, "    %@", buf, 0xCu);
    }
    CFRange v54 = mysyslog_get_logger();
    os_log_type_t v55 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v54, v55))
    {
      int v56 = *(_DWORD *)(i + 168);
      *(_DWORD *)buf = 67109120;
      LODWORD(v63) = v56;
      _os_log_impl(&dword_225F82000, v54, v55, "  accountOn:   %d", buf, 8u);
    }
    v57 = mysyslog_get_logger();
    os_log_type_t v58 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v57, v58))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225F82000, v57, v58, "  matchingAccounts:", buf, 2u);
    }
    v59 = mysyslog_get_logger();
    os_log_type_t v60 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = *(void *)(i + 160);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v61;
      _os_log_impl(&dword_225F82000, v59, v60, "    %@", buf, 0xCu);
    }
  }
}

uint64_t CaptiveAuthenticateUsing(CFTypeRef cf2, const __CFString *a2, int a3)
{
  os_log_type_t v6 = &S_stateHeadStorage;
  do
  {
    os_log_type_t v6 = (uint64_t *)*v6;
    if (!v6) {
      return 22;
    }
  }
  while (!CFEqual((CFTypeRef)v6[4], cf2));
  if (v6[23] || v6[8] != kStage_WebSheet) {
    return 16;
  }
  CaptiveSetStage((uint64_t)v6, (__CFString *)kStage_CredQuery);
  *((_DWORD *)v6 + 48) = a3;
  uint64_t v8 = (const void *)v6[22];
  if (v8)
  {
    CFRelease(v8);
    v6[22] = 0;
  }
  v6[22] = (uint64_t)a2;
  CFRetain(a2);
  Start = CNAccountsCredentialsQueryStart(a2, (const __CFString *)v6[6], v6[4], v6[16], (uint64_t)CaptiveHandleCredentials, (uint64_t)v6);
  v6[23] = (uint64_t)Start;
  if (Start) {
    return 0;
  }
  *((_DWORD *)v6 + 48) = 0;
  return 0xFFFFFFFFLL;
}

void CaptiveSetStage(uint64_t a1, __CFString *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (*(__CFString **)(a1 + 64) != a2)
  {
    *(void *)(a1 + 64) = a2;
    if ((__CFString *)kStage_WebSheet != a2 && kStage_UIRequired[0] != a2) {
      *(unsigned char *)(a1 + 252) = 0;
    }
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)*MEMORY[0x263F1BC10], *(CFStringRef *)(a1 + 32), (CFStringRef)*MEMORY[0x263F308C8]);
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      __int16 v45 = 2112;
      uint64_t v46 = v10;
      _os_log_impl(&dword_225F82000, logger, v8, "%@ - %@", buf, 0x16u);
    }
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F308D8], *(const void **)(a1 + 64));
    uint64_t v11 = (const void **)MEMORY[0x263EFFB40];
    if (!*(unsigned char *)(a1 + 252)) {
      uint64_t v11 = (const void **)MEMORY[0x263EFFB38];
    }
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F308E8], *v11);
    os_log_type_t v12 = *(const void **)(a1 + 128);
    if (v12) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F308D0], v12);
    }
    uint64_t v13 = *(const void **)(a1 + 136);
    if (v13) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F308C0], v13);
    }
    uint64_t v14 = *(const void **)(a1 + 144);
    if (v14) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F308B8], v14);
    }
    os_log_type_t v15 = *(const void **)(a1 + 152);
    if (v15) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F308E0], v15);
    }
    uint64_t v16 = (const __SCDynamicStore *)NetIFGetStore();
    if (!SCDynamicStoreSetValue(v16, NetworkInterfaceEntity, Mutable))
    {
      uint64_t v17 = mysyslog_get_logger();
      os_log_type_t v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v17, v18))
      {
        int v19 = SCError();
        uint64_t v20 = SCErrorString(v19);
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl(&dword_225F82000, v17, v18, "Failed to update dynamic store, %s", buf, 0xCu);
      }
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (NetworkInterfaceEntity) {
      CFRelease(NetworkInterfaceEntity);
    }
    if (*(void *)(a1 + 144))
    {
      uint64_t v21 = NetIFCopyCurrentWiFiNetwork(*(void *)(a1 + 32));
      if (v21)
      {
        uint64_t v22 = (const void *)v21;
        CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), kCAPPORTUserPortalURL[0]);
        os_log_type_t v24 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), kCAPPORTVenueInfoURL[0]);
        uint64_t v25 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), kCAPPORTCanExtendSession[0]);
        CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), kCAPPORTSecondsRemaining[0]);
        CFTypeID TypeID = CFNumberGetTypeID();
        if (v26)
        {
          if (CFGetTypeID(v26) == TypeID)
          {
            *(void *)buf = 0;
            CFNumberGetValue(v26, kCFNumberDoubleType, buf);
            CFNumberRef v26 = 0;
            if (*(double *)buf > 0.0)
            {
              double valuePtr = CFAbsoluteTimeGetCurrent() + *(double *)buf;
              CFNumberRef v26 = CFNumberCreate(v4, kCFNumberDoubleType, &valuePtr);
            }
          }
          else
          {
            CFNumberRef v26 = 0;
          }
        }
        if (Value)
        {
          uint64_t v31 = mysyslog_get_logger();
          os_log_type_t v32 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = Value;
            __int16 v45 = 2112;
            uint64_t v46 = v33;
            _os_log_impl(&dword_225F82000, v31, v32, "Setting UserPortalURL to %@ for interface %@", buf, 0x16u);
          }
          NetIFWiFiNetworkSetCaptivePortalUserPortalURL((uint64_t)v22, Value);
        }
        if (v24)
        {
          uint64_t v34 = mysyslog_get_logger();
          os_log_type_t v35 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v34, v35))
          {
            uint64_t v36 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v24;
            __int16 v45 = 2112;
            uint64_t v46 = v36;
            _os_log_impl(&dword_225F82000, v34, v35, "Setting VenueInfoURL to %@ for interface %@", buf, 0x16u);
          }
          NetIFWiFiNetworkSetCaptivePortalVenueInfoURL((uint64_t)v22, v24);
        }
        if (v25)
        {
          uint64_t v37 = mysyslog_get_logger();
          os_log_type_t v38 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v37, v38))
          {
            uint64_t v39 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v25;
            __int16 v45 = 2112;
            uint64_t v46 = v39;
            _os_log_impl(&dword_225F82000, v37, v38, "Setting CanExtendSession to %@ for interface %@", buf, 0x16u);
          }
          NetIFWiFiNetworkSetCaptivePortalCanExtendSession((uint64_t)v22, v25);
        }
        if (v26)
        {
          size_t v40 = mysyslog_get_logger();
          os_log_type_t v41 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v40, v41))
          {
            uint64_t v42 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v26;
            __int16 v45 = 2112;
            uint64_t v46 = v42;
            _os_log_impl(&dword_225F82000, v40, v41, "Setting SessionExpiration to %@ for interface %@", buf, 0x16u);
          }
          NetIFWiFiNetworkSetCaptivePortalSessionExpiration((uint64_t)v22, v26);
          CFRelease(v26);
        }
        CFRelease(v22);
      }
      else
      {
        uint64_t v28 = mysyslog_get_logger();
        os_log_type_t v29 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl(&dword_225F82000, v28, v29, "NetIFCopyCurrentWiFiNetwork returned NULL for interface %@ ", buf, 0xCu);
        }
      }
    }
  }
}

void CaptiveHandleCredentials(uint64_t a1, const __CFDictionary *a2)
{
  *(void *)(a1 + 184) = 0;
  CaptiveSetStage(a1, (__CFString *)kStage_Login);
  if (a2)
  {
    CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 128);
    CFStringRef v5 = *(const __CFString **)(a1 + 32);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    uint64_t v7 = captive_agent_login(v4, v5, a2, (uint64_t)Current, (uint64_t)CaptiveHandleAuthenticateResult, a1);
    *(void *)(a1 + 80) = v7;
    if (v7)
    {
LABEL_3:
      v19.version = 0;
      memset(&v19.retain, 0, 24);
      v19.info = (void *)a1;
      os_log_type_t v8 = *(__CFRunLoopTimer **)(a1 + 208);
      if (v8)
      {
        CFRunLoopTimerInvalidate(v8);
        CFRelease(*(CFTypeRef *)(a1 + 208));
      }
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerRef v11 = CFRunLoopTimerCreate(v9, v10 + 15.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)CaptiveAuthTimerCallback, &v19);
      *(void *)(a1 + 208) = v11;
      if (v11)
      {
        os_log_type_t v12 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v12, *(CFRunLoopTimerRef *)(a1 + 208), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
      }
      logger = mysyslog_get_logger();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v14))
      {
        LOWORD(v19.version) = 0;
        _os_log_impl(&dword_225F82000, logger, v14, "Authenticating...", (uint8_t *)&v19, 2u);
      }
      return;
    }
  }
  else if (*(void *)(a1 + 80))
  {
    goto LABEL_3;
  }
  mach_port_t v15 = *(_DWORD *)(a1 + 192);
  if (v15)
  {
    AuthenticateUsingReply(v15, -1);
    *(_DWORD *)(a1 + 192) = 0;
  }
  else
  {
    uint64_t v16 = *(const void **)(a1 + 256);
    ++*(_DWORD *)(a1 + 168);
    if ((CaptiveTryNextAccount(a1) & 1) == 0 && v16)
    {
      CaptiveSetStage(a1, kStage_UIRequired[0]);
      uint64_t v17 = ResponseDictCreate(v16, 2);
      CNBuiltinPluginProvideResponse(v17);
      CFRelease(v17);
      os_log_type_t v18 = kStage_UIRequired[0];
      CaptiveSetStage(a1, v18);
    }
  }
}

uint64_t CaptiveAuthenticateUsingToken(CFTypeRef cf2, const __CFString *a2, int a3)
{
  os_log_type_t v6 = &S_stateHeadStorage;
  do
  {
    os_log_type_t v6 = (uint64_t *)*v6;
    if (!v6) {
      return 22;
    }
  }
  while (!CFEqual((CFTypeRef)v6[4], cf2));
  if (v6[23]) {
    return 16;
  }
  CaptiveSetStage((uint64_t)v6, (__CFString *)kStage_CredQuery);
  *((_DWORD *)v6 + 48) = a3;
  os_log_type_t v8 = (const void *)v6[22];
  if (v8)
  {
    CFRelease(v8);
    v6[22] = 0;
  }
  if (!a2) {
    a2 = (const __CFString *)v6[6];
  }
  Start = CNAccountsCredentialsQueryStart(0, a2, v6[4], v6[16], (uint64_t)CaptiveHandleTokenCredentials, (uint64_t)v6);
  v6[23] = (uint64_t)Start;
  if (Start) {
    return 0;
  }
  *((_DWORD *)v6 + 48) = 0;
  return 0xFFFFFFFFLL;
}

void CaptiveHandleTokenCredentials(uint64_t a1, const __CFDictionary *a2)
{
  *(void *)(a1 + 184) = 0;
  CaptiveSetStage(a1, (__CFString *)kStage_Login);
  if (a2)
  {
    CFStringRef v4 = *(const __CFString **)(a1 + 32);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    os_log_type_t v6 = captive_agent_token_login(v4, a2, 0x1EuLL, (uint64_t)Current, (uint64_t)CaptiveHandleTokenAuthResponse, a1);
    *(void *)(a1 + 80) = v6;
    if (v6) {
      goto LABEL_3;
    }
  }
  else if (*(void *)(a1 + 80))
  {
LABEL_3:
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_225F82000, logger, v8, "Authenticating using token...", v13, 2u);
    }
    return;
  }
  mach_port_t v9 = *(_DWORD *)(a1 + 192);
  if (v9)
  {
    AuthenticateUsingReply(v9, -1);
    *(_DWORD *)(a1 + 192) = 0;
  }
  else
  {
    CFAbsoluteTime v10 = *(const void **)(a1 + 256);
    if (v10)
    {
      CaptiveSetStage(a1, kStage_UIRequired[0]);
      CFRunLoopTimerRef v11 = ResponseDictCreate(v10, 2);
      CNBuiltinPluginProvideResponse(v11);
      CFRelease(v11);
      os_log_type_t v12 = kStage_UIRequired[0];
      CaptiveSetStage(a1, v12);
    }
  }
}

BOOL CaptiveIsActive()
{
  return gActive != 0;
}

BOOL CaptiveIsDebug()
{
  return gDebug != 0;
}

BOOL CaptiveIsUIRequired(CFTypeRef cf2)
{
  uint64_t v2 = &S_stateHeadStorage;
  while (1)
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (CFEqual((CFTypeRef)v2[4], cf2)) {
      return WebSheetStateGetIsUIRequired(v2[28]) != 0;
    }
  }
  return 0;
}

BOOL CaptiveIsWebSheetStagePending()
{
  int v0 = &S_stateHeadStorage;
  while (1)
  {
    int v0 = (uint64_t *)*v0;
    if (!v0) {
      break;
    }
    if (v0[8] == kStage_WebSheet)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v2 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v2))
      {
        *(_WORD *)CFStringRef v4 = 0;
        _os_log_impl(&dword_225F82000, logger, v2, "WebSheetStagePending == TRUE", v4, 2u);
      }
      return v0 != 0;
    }
  }
  return v0 != 0;
}

void start()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  pthread_t v7 = 0;
  memset(&v10, 0, sizeof(v10));
  sConfigdRunLoop = (uint64_t)CFRunLoopGetCurrent();
  if (!CNSRegisterServer())
  {
    logger = mysyslog_get_logger();
    os_log_type_t v1 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v1)) {
      return;
    }
    *(_WORD *)buf = 0;
    os_log_type_t v2 = "CNSRegisterServer failed";
    goto LABEL_7;
  }
  if (pthread_attr_init(&v10))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v1 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v1)) {
      return;
    }
    *(_WORD *)buf = 0;
    os_log_type_t v2 = "pthread_attr_init failed";
    goto LABEL_7;
  }
  if (pthread_attr_setdetachstate(&v10, 2))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v1 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v1))
    {
      *(_WORD *)buf = 0;
      os_log_type_t v2 = "pthread_attr_setdetachstate failed";
LABEL_7:
      _os_log_impl(&dword_225F82000, logger, v1, v2, buf, 2u);
    }
  }
  else if (pthread_create(&v7, &v10, (void *(__cdecl *)(void *))captived_thread, 0))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v1 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v1))
    {
      *(_WORD *)buf = 0;
      os_log_type_t v2 = "pthread_create failed";
      goto LABEL_7;
    }
  }
  else
  {
    pthread_mutex_lock(&sLock);
    while (!sStopThreadSource)
    {
      int v3 = pthread_cond_wait(&sCond, &sLock);
      if (v3)
      {
        int v4 = v3;
        CFStringRef v5 = mysyslog_get_logger();
        os_log_type_t v6 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v5, v6))
        {
          *(_DWORD *)buf = 67109120;
          int v9 = v4;
          _os_log_impl(&dword_225F82000, v5, v6, "pthread_cond_wait failed: %d", buf, 8u);
        }
      }
    }
    pthread_mutex_unlock(&sLock);
    pthread_attr_destroy(&v10);
  }
}

uint64_t captived_thread()
{
  memset(&v1, 0, 72);
  v1.perform = (void (__cdecl *)(void *))captived_thread_stop;
  pthread_mutex_lock(&sLock);
  gThreadRunLoop = (uint64_t)CFRunLoopGetCurrent();
  sStopThreadSource = (uint64_t)CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &v1);
  CFRunLoopAddSource((CFRunLoopRef)gThreadRunLoop, (CFRunLoopSourceRef)sStopThreadSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  pthread_mutex_unlock(&sLock);
  pthread_cond_signal(&sCond);
  S_stateHeadStorage = 0;
  CaptivePrefsInit((__CFRunLoop *)gThreadRunLoop, (uint64_t (*)(void))prefs_changed);
  mysyslog_init_logger(0);
  CaptiveCheckPreferences(1);
  if (gActive)
  {
    UIAllowedRegisterForCallbacks((uint64_t (*)(void))CaptiveHandleUIAllowedChange);
    WebSheetHandlerInitialize((uint64_t (*)(void, void, void))CaptiveWebsheetDone);
    CNPluginHandlerInitialize((uint64_t)CaptiveBuiltinPluginProcessCommand);
  }
  CNSStartServer();
  CFRunLoopRun();
  pthread_mutex_lock(&sLock);
  gThreadRunLoop = 0;
  sStopThreadSource = 0;
  if (sStopConfigdSource)
  {
    CFRunLoopSourceSignal((CFRunLoopSourceRef)sStopConfigdSource);
    CFRunLoopWakeUp((CFRunLoopRef)sConfigdRunLoop);
  }
  pthread_mutex_unlock(&sLock);
  CNSShutdownServer();
  return 0;
}

uint64_t stop(__CFRunLoopSource *a1)
{
  pthread_mutex_lock(&sLock);
  if (sStopThreadSource)
  {
    sStopConfigdSource = (uint64_t)a1;
    CFRunLoopSourceSignal((CFRunLoopSourceRef)sStopThreadSource);
    CFRunLoopWakeUp((CFRunLoopRef)gThreadRunLoop);
  }
  else
  {
    CFRunLoopSourceSignal(a1);
  }

  return pthread_mutex_unlock(&sLock);
}

void CaptiveHandleAuthenticateResult(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  os_log_type_t v2 = *(const void **)(a1 + 256);
  *(void *)(a1 + 80) = 0;
  if (!v2) {
    return;
  }
  CFStringRef v5 = *(__CFRunLoopTimer **)(a1 + 208);
  if (v5)
  {
    CFRunLoopTimerInvalidate(v5);
    os_log_type_t v6 = *(const void **)(a1 + 208);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 208) = 0;
    }
  }
  if (!theDict)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v19))
    {
      *(_WORD *)v67 = 0;
      uint64_t v20 = "Login attempt failed, no response.";
      uint64_t v21 = logger;
      os_log_type_t v22 = v19;
      uint32_t v23 = 2;
LABEL_16:
      _os_log_impl(&dword_225F82000, v21, v22, v20, v67, v23);
    }
LABEL_49:
    CaptiveSetStage(a1, kStage_UIRequired[0]);
    int v56 = ResponseDictCreate(v2, 2);
    CNBuiltinPluginProvideResponse(v56);
    CFRelease(v56);
    return;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, kWISPrMessageType[0]);
  IntCFStringRef Value = CFStringGetIntValue(Value);
  if (IntValue != 120)
  {
    SInt32 v9 = IntValue;
    if (IntValue != 140)
    {
      os_log_type_t v24 = mysyslog_get_logger();
      os_log_type_t v25 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v24, v25))
      {
        *(void *)v67 = 0x7804000300;
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)&v67[10] = 140;
        *(_WORD *)&v67[14] = 1024;
        *(_DWORD *)&v67[16] = v9;
        uint64_t v20 = "Expected AuthNotify message (%d) or AuthPollReply message (%d), received %d";
        uint64_t v21 = v24;
        os_log_type_t v22 = v25;
        uint32_t v23 = 20;
        goto LABEL_16;
      }
      goto LABEL_49;
    }
  }
  CFStringRef v10 = (const __CFString *)CFDictionaryGetValue(theDict, kWISPrResponseCode[0]);
  SInt32 v11 = CFStringGetIntValue(v10);
  os_log_type_t v12 = CFDictionaryGetValue(theDict, kWISPrReplyMessage[0]);
  uint64_t v13 = mysyslog_get_logger();
  os_log_type_t v14 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)v67 = 67109378;
    *(_DWORD *)&v67[4] = v11;
    *(_WORD *)&v67[8] = 2112;
    *(void *)&v67[10] = v12;
    _os_log_impl(&dword_225F82000, v13, v14, "AuthNotify responseCode=%d, reply message=%@", v67, 0x12u);
  }
  CFArrayRef v15 = *(const __CFArray **)(a1 + 160);
  if (v15)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v15, *(int *)(a1 + 168));
    unsigned int v17 = CNAccountsIsCarrierCredential(ValueAtIndex);
  }
  else
  {
    unsigned int v17 = 0;
    ValueAtIndex = 0;
  }
  if (v11 == 50)
  {
    CFNumberRef v26 = mysyslog_get_logger();
    os_log_type_t v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      uint64_t v29 = *(void *)(a1 + 48);
      *(_DWORD *)v67 = 138412546;
      *(void *)&v67[4] = v28;
      *(_WORD *)&v67[12] = 2112;
      *(void *)&v67[14] = v29;
      _os_log_impl(&dword_225F82000, v26, v27, "%@: Login succeeded on '%@'", v67, 0x16u);
    }
    uint64_t v30 = *(const void **)(a1 + 136);
    if (v30) {
      CFRelease(v30);
    }
    *(void *)(a1 + 136) = theDict;
    CFRetain(theDict);
    mach_port_t v31 = *(_DWORD *)(a1 + 192);
    if (v31)
    {
      AuthenticateUsingReply(v31, 0);
      *(_DWORD *)(a1 + 192) = 0;
      CFStringRef v32 = *(const __CFString **)(a1 + 176);
      CFStringRef v33 = *(const __CFString **)(a1 + 48);
      CFStringRef v34 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 128), kWISPrLoginURL[0]);
      CNAccountsAddInternal(v32, 0, v33, v34, 1, 0);
    }
    os_log_type_t v35 = (__CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kWISPrLogoffURL[0]);
    CFStringRef v36 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kWISPrRedirectionURL[0]);
    if (!v36) {
      goto LABEL_52;
    }
    CFDictionaryRef v37 = CaptiveCopyCarrierSettings(*(const void **)(a1 + 48));
    if (v37)
    {
      CFDictionaryRef v38 = v37;
      CFArrayRef v39 = (const __CFArray *)CFDictionaryGetValue(v37, @"LandingPageURLHostNameMatchList");
      CFTypeID TypeID = CFArrayGetTypeID();
      if (v39 && CFGetTypeID(v39) == TypeID && (CFStringRef v41 = URLStringCopyHostName(v36)) != 0)
      {
        CFStringRef v42 = v41;
        v74.length = CFArrayGetCount(v39);
        v74.location = 0;
        int v43 = CFArrayContainsValue(v39, v74, v42);
        os_log_type_t v44 = mysyslog_get_logger();
        os_log_type_t v45 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = "";
          if (!v43) {
            uint64_t v46 = " not";
          }
          *(_DWORD *)v67 = 138412546;
          *(void *)&v67[4] = v42;
          *(_WORD *)&v67[12] = 2080;
          *(void *)&v67[14] = v46;
          _os_log_impl(&dword_225F82000, v44, v45, "%@ is%s in the LandingPageURLHostNameMatchList", v67, 0x16u);
        }
        CFRelease(v42);
        CFRelease(v38);
        if (v43) {
          goto LABEL_52;
        }
      }
      else
      {
        CFRelease(v38);
      }
    }
    CFStringRef v36 = 0;
LABEL_52:
    v57 = mysyslog_get_logger();
    os_log_type_t v58 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = " (LogoffURL=";
      *(_DWORD *)v67 = 136316418;
      os_log_type_t v60 = "";
      if (!v35) {
        v59 = "";
      }
      *(void *)&v67[4] = v59;
      uint64_t v61 = &stru_26D9AB620;
      if (v35) {
        v62 = v35;
      }
      else {
        v62 = &stru_26D9AB620;
      }
      *(_WORD *)&v67[12] = 2112;
      *(void *)&v67[14] = v62;
      if (v35) {
        uint64_t v63 = ")";
      }
      else {
        uint64_t v63 = "";
      }
      *(_WORD *)&v67[22] = 2080;
      *(void *)&v67[24] = v63;
      uint64_t v64 = " (RedirectionURL=";
      *(_WORD *)v68 = 2080;
      if (!v36) {
        uint64_t v64 = "";
      }
      *(void *)&v68[2] = v64;
      if (v36) {
        uint64_t v61 = (__CFString *)v36;
      }
      __int16 v69 = 2112;
      if (v36) {
        os_log_type_t v60 = ")";
      }
      v70 = v61;
      __int16 v71 = 2080;
      v72 = v60;
      _os_log_impl(&dword_225F82000, v57, v58, "Online%s%@%s%s%@%s", v67, 0x3Eu);
    }
    v65 = ResponseDictCreate(v2, 0);
    if (v36)
    {
      *(void *)v67 = mach_absolute_time();
      CFNumberRef v66 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, v67);
      CFDictionarySetValue(v65, @"RedirectionURL", v36);
      CFDictionarySetValue(v65, @"RedirectionURLGenerationID", v66);
      CFRelease(v66);
    }
    if (v35) {
      CFDictionarySetValue(v65, @"LogoffURL", v35);
    }
    CFDictionarySetValue(v65, @"WISPrLoginUsed", (const void *)*MEMORY[0x263EFFB40]);
    CNBuiltinPluginProvideResponse(v65);
    CFRelease(v65);
    CaptiveSetStage(a1, kStage_Online[0]);
    return;
  }
  mach_port_t v47 = *(_DWORD *)(a1 + 192);
  if (v47)
  {
    AuthenticateUsingReply(v47, v11);
    *(_DWORD *)(a1 + 192) = 0;
    goto LABEL_49;
  }
  if (v11 == 100) {
    CNAccountsRejected(ValueAtIndex, *(const void **)(a1 + 48), *(void *)(a1 + 128), (uint64_t)theDict);
  }
  if (v17)
  {
    ++*(_DWORD *)(a1 + 248);
    uint64_t v48 = mysyslog_get_logger();
    os_log_type_t v49 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v48, v49))
    {
      int v50 = *(_DWORD *)(a1 + 248);
      *(_DWORD *)v67 = 67109634;
      *(_DWORD *)&v67[4] = v50;
      *(_WORD *)&v67[8] = 1024;
      *(_DWORD *)&v67[10] = 3;
      *(_WORD *)&v67[14] = 2112;
      *(void *)&v67[16] = v12;
      _os_log_impl(&dword_225F82000, v48, v49, "Carrier login attempt (%d of %d) failed: %@", v67, 0x18u);
    }
    __int16 v51 = *(__CFRunLoopTimer **)(a1 + 200);
    if (v51)
    {
      CFRunLoopTimerInvalidate(v51);
      CFRelease(*(CFTypeRef *)(a1 + 200));
    }
    if (*(int *)(a1 + 248) <= 2)
    {
      *(void *)v67 = 0;
      *(_OWORD *)&v67[16] = 0u;
      *(void *)v68 = 0;
      *(void *)&v67[8] = a1;
      CFAllocatorRef v52 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerRef v54 = CFRunLoopTimerCreate(v52, Current + 1.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)CaptiveRetryCarrierCredentials, (CFRunLoopTimerContext *)v67);
      *(void *)(a1 + 200) = v54;
      if (v54)
      {
        os_log_type_t v55 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v55, *(CFRunLoopTimerRef *)(a1 + 200), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
        return;
      }
    }
  }
  ++*(_DWORD *)(a1 + 168);
  if ((CaptiveTryNextAccount(a1) & 1) == 0) {
    goto LABEL_49;
  }
}

CFArrayRef CaptiveTryNextAccount(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CFArrayRef result = *(const __CFArray **)(a1 + 160);
  if (result)
  {
    CFIndex v3 = *(int *)(a1 + 168);
    if (CFArrayGetCount(result) <= v3)
    {
      return 0;
    }
    else
    {
      CaptiveSetStage(a1, (__CFString *)kStage_CredQuery);
      CFIndex v4 = *(int *)(a1 + 168);
      if (CFArrayGetCount(*(CFArrayRef *)(a1 + 160)) <= v4)
      {
LABEL_14:
        uint64_t v13 = *(const void **)(a1 + 160);
        if (v13)
        {
          CFRelease(v13);
          *(void *)(a1 + 160) = 0;
        }
        CFArrayRef result = 0;
        *(_DWORD *)(a1 + 168) = 0;
      }
      else
      {
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 160), *(int *)(a1 + 168));
          logger = mysyslog_get_logger();
          os_log_type_t v7 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v7))
          {
            *(_DWORD *)buf = 138412290;
            CFArrayRef v15 = ValueAtIndex;
            _os_log_impl(&dword_225F82000, logger, v7, "Resolving account %@", buf, 0xCu);
          }
          int v8 = *(_DWORD *)(a1 + 268);
          SInt32 v9 = v8 == 2 ? CaptiveHandleTokenCredentials : CaptiveHandleCredentials;
          CFStringRef v10 = v8 == 2 ? 0 : (const __CFString *)ValueAtIndex;
          Start = CNAccountsCredentialsQueryStart(v10, *(const __CFString **)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 128), (uint64_t)v9, a1);
          *(void *)(a1 + 184) = Start;
          if (Start) {
            return (const __CFArray *)1;
          }
          *(_DWORD *)(a1 + 248) = 0;
          uint64_t v12 = *(int *)(a1 + 168);
          *(_DWORD *)(a1 + 168) = v12 + 1;
          if (CFArrayGetCount(*(CFArrayRef *)(a1 + 160)) <= v12 + 1) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  return result;
}

__CFDictionary *ResponseDictCreate(const void *a1, int a2)
{
  int valuePtr = a2;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"UniqueID", a1);
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(Mutable, @"Result", v4);
  CFRelease(v4);
  return Mutable;
}

void CaptiveRetryCarrierCredentials(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFIndex v3 = *(const void **)(a2 + 200);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a2 + 200) = 0;
  }
  CFNumberRef v4 = *(const void **)(a2 + 112);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a2 + 112) = 0;
  }
  CFStringRef v5 = *(const void **)(a2 + 128);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a2 + 128) = 0;
  }
  os_log_type_t v6 = *(const void **)(a2 + 136);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a2 + 136) = 0;
  }
  os_log_type_t v7 = *(const void **)(a2 + 232);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a2 + 232) = 0;
  }
  int v8 = *(const void **)(a2 + 240);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(a2 + 240) = 0;
  }
  SInt32 v9 = *(const void **)(a2 + 40);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(a2 + 40) = 0;
  }
  logger = mysyslog_get_logger();
  os_log_type_t v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v11))
  {
    uint64_t v12 = *(void *)(a2 + 32);
    int v19 = 138412290;
    uint64_t v20 = v12;
    _os_log_impl(&dword_225F82000, logger, v11, "%@: Retrying probe for carrier login", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v13 = captive_agent_send_probe(*(const void **)(a2 + 48), *(const __CFString **)(a2 + 32), 0, *(__CFString **)(a2 + 112), 0x28u, (uint64_t)CaptiveHandleRedirect, a2, gThreadRunLoop);
  *(void *)(a2 + 72) = v13;
  if (!v13)
  {
    os_log_type_t v14 = *(const void **)(a2 + 256);
    CFArrayRef v15 = mysyslog_get_logger();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_225F82000, v15, v16, "Probe: captive_agent_send_probe failed", (uint8_t *)&v19, 2u);
    }
    if (v14)
    {
      unsigned int v17 = kStage_UIRequired;
      CaptiveSetStage(a2, kStage_UIRequired[0]);
      os_log_type_t v18 = ResponseDictCreate(v14, 2);
      CNBuiltinPluginProvideResponse(v18);
      CFRelease(v18);
    }
    else
    {
      unsigned int v17 = &kStage_Unknown;
    }
    CaptiveSetStage(a2, *v17);
  }
}

CFMutableDictionaryRef CaptiveCopyCarrierSettings(const void *a1)
{
  if (!sCarrierBundleChangedRef)
  {
    CNAccountsImportCarrierCredentials();
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    sCarrierBundleChangedRef = (uint64_t)_CBAccessConnectionCreate((uint64_t)CaptiveSIMChanged, (uint64_t)Current, *MEMORY[0x263EFFE88]);
    if (!sCarrierBundleChangedRef)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v4))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_225F82000, logger, v4, "_CBAccessConnectionCreate() returned NULL", v12, 2u);
      }
    }
  }
  CFDictionaryRef v5 = (const __CFDictionary *)CopyCarrierAccountSettings(@"CaptiveSettings");
  os_log_type_t v6 = (const void *)CopyCarrierAccountSettings(@"CaptiveSettingsBySSID");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v6) {
    return v5;
  }
  if (CFGetTypeID(v6) != TypeID) {
    goto LABEL_10;
  }
  CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v6, a1);
  CFTypeID v9 = CFDictionaryGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == v9)
    {
      CFRetain(Value);
      goto LABEL_11;
    }
LABEL_10:
    CFStringRef Value = 0;
  }
LABEL_11:
  CFRelease(v6);
  if (v5 && Value)
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, (CFDictionaryRef)Value);
    if (MutableCopy) {
      CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)CaptiveMergeDictionaryApplier, MutableCopy);
    }
    CFRelease(Value);
    CFRelease(v5);
  }
  else if (Value)
  {
    return (CFMutableDictionaryRef)Value;
  }
  else
  {
    return v5;
  }
  return MutableCopy;
}

void CaptiveSIMChanged()
{
  logger = mysyslog_get_logger();
  os_log_type_t v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)os_log_type_t v2 = 0;
    _os_log_impl(&dword_225F82000, logger, v1, "Detected updated carrier settings", v2, 2u);
  }
  CNAccountsImportCarrierCredentials();
}

void CaptiveMergeDictionaryApplier(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void CaptiveHandleRedirect(uint64_t a1, int a2, const __CFDictionary *a3)
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  CFIndex v3 = *(const void **)(a1 + 256);
  *(void *)(a1 + 72) = 0;
  if (v3)
  {
    unsigned int v5 = a2;
    int v7 = 1;
    switch(a2)
    {
      case 4:
        logger = mysyslog_get_logger();
        os_log_type_t v22 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(logger, v22)) {
          goto LABEL_29;
        }
        uint64_t v23 = *(void *)(a1 + 32);
        os_log_type_t v24 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        *(void *)v87 = v23;
        *(_WORD *)&v87[8] = 2112;
        v88 = v24;
        os_log_type_t v25 = "%@: received too big html document on '%@'";
        goto LABEL_28;
      case 7:
      case 8:
      case 10:
      case 11:
      case 13:
        goto LABEL_3;
      case 14:
        CFNumberRef v26 = mysyslog_get_logger();
        os_log_type_t v27 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v26, v27))
        {
          uint64_t v28 = *(void *)(a1 + 32);
          uint64_t v29 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138412546;
          *(void *)v87 = v28;
          *(_WORD *)&v87[8] = 2112;
          v88 = v29;
          _os_log_impl(&dword_225F82000, v26, v27, "%@: received TLS connection abort on '%@'", buf, 0x16u);
        }
        int v7 = 0;
        char v8 = 1;
        goto LABEL_30;
      case 15:
        logger = mysyslog_get_logger();
        os_log_type_t v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v22))
        {
          uint64_t v30 = *(void *)(a1 + 32);
          mach_port_t v31 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138412546;
          *(void *)v87 = v30;
          *(_WORD *)&v87[8] = 2112;
          v88 = v31;
          os_log_type_t v25 = "%@: failed to trust the server certificate chain on '%@'";
LABEL_28:
          _os_log_impl(&dword_225F82000, logger, v22, v25, buf, 0x16u);
        }
LABEL_29:
        char v8 = 0;
        int v7 = 0;
LABEL_30:
        unsigned int v5 = 3;
        goto LABEL_31;
      default:
        int v7 = 0;
LABEL_3:
        char v8 = 1;
        if (a2 > 10)
        {
          if (a2 == 11)
          {
            CFTypeID v9 = "Unknown state: Assuming not captive";
            goto LABEL_14;
          }
          if (a2 == 12)
          {
            CFTypeID v9 = "Probe whitelist detected: Marking as not captive";
            goto LABEL_14;
          }
        }
        else
        {
          if (!a2)
          {
            CFTypeID v9 = "No redirect detected";
            goto LABEL_14;
          }
          if (a2 == 9)
          {
            CFTypeID v9 = "Web proxy detected: Assuming not captive";
LABEL_14:
            uint64_t v12 = mysyslog_get_logger();
            os_log_type_t v13 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v12, v13))
            {
              os_log_type_t v14 = *(void **)(a1 + 32);
              uint64_t v15 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 136315650;
              *(void *)v87 = v9;
              *(_WORD *)&v87[8] = 2112;
              v88 = v14;
              __int16 v89 = 2112;
              uint64_t v90 = v15;
              _os_log_impl(&dword_225F82000, v12, v13, "%s on %@ (%@)", buf, 0x20u);
            }
            uint64_t v16 = *(void *)(a1 + 64);
            if (v16 == kStage_Maintain || v16 == kStage_Login) {
              CaptiveSetStage(a1, kStage_Online[0]);
            }
            int v17 = 0;
            int v18 = 0;
            int v19 = 0;
            int ConfidenceFromAccounts = 0;
            goto LABEL_79;
          }
        }
LABEL_31:
        if (*(void *)(a1 + 64) == kStage_Login) {
          int v7 = 2;
        }
        if ((v5 & 0xFFFFFFFE) == 2)
        {
          CFStringRef v32 = mysyslog_get_logger();
          os_log_type_t v33 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v32, v33))
          {
            uint64_t v34 = *(void *)(a1 + 32);
            os_log_type_t v35 = "WISPr";
            uint64_t v36 = *(void *)(a1 + 48);
            if (v5 == 3) {
              os_log_type_t v35 = "Redirect";
            }
            *(_DWORD *)buf = 138412802;
            *(void *)v87 = v34;
            *(_WORD *)&v87[8] = 2080;
            v88 = (void *)v35;
            __int16 v89 = 2112;
            uint64_t v90 = v36;
            _os_log_impl(&dword_225F82000, v32, v33, "%@: %s detected on '%@'", buf, 0x20u);
          }
          if (*(void *)(a1 + 64) == kStage_Maintain) {
            int v7 = 4;
          }
          int v18 = 1;
        }
        else
        {
          int v18 = 0;
        }
        switch(v5)
        {
          case 3u:
            if (a3)
            {
              CFDictionaryRef v37 = mysyslog_get_logger();
              os_log_type_t v38 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v37, v38))
              {
                uint64_t v39 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138412546;
                *(void *)v87 = v39;
                *(_WORD *)&v87[8] = 2112;
                v88 = a3;
                _os_log_impl(&dword_225F82000, v37, v38, "%@: detected HTTP redirect %@", buf, 0x16u);
              }
              CFStringRef Value = CFDictionaryGetValue(a3, kInitialURL[0]);
              int v19 = CFDictionaryGetValue(a3, kRedirectHostname[0]);
              if (Value)
              {
                my_FieldSetRetainedCFType((const void **)(a1 + 112), Value);
                CFStringRef v41 = mysyslog_get_logger();
                os_log_type_t v42 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v41, v42))
                {
                  uint64_t v43 = *(void *)(a1 + 112);
                  *(_DWORD *)buf = 138412290;
                  *(void *)v87 = v43;
                  _os_log_impl(&dword_225F82000, v41, v42, "InitialURL: %@:", buf, 0xCu);
                }
              }
            }
            else
            {
              if ((v8 & 1) == 0)
              {
                CFDictionaryRef v48 = (const __CFDictionary *)CaptiveCopyProbeSettings();
                if (v48)
                {
                  CFDictionaryRef v49 = v48;
                  int v50 = CFDictionaryGetValue(v48, @"ProbeURL");
                  if (isA_CFString(v50))
                  {
                    my_FieldSetRetainedCFType((const void **)(a1 + 112), v50);
                    __int16 v51 = mysyslog_get_logger();
                    os_log_type_t v52 = _SC_syslog_os_log_mapping();
                    if (os_log_type_enabled(v51, v52))
                    {
                      uint64_t v53 = *(void *)(a1 + 112);
                      *(_DWORD *)buf = 138412290;
                      *(void *)v87 = v53;
                      _os_log_impl(&dword_225F82000, v51, v52, "InitialURL: %@:", buf, 0xCu);
                    }
                  }
                  CFRelease(v49);
                }
              }
              int v19 = 0;
            }
            if (_os_feature_enabled_impl())
            {
              CFRunLoopTimerRef v54 = mysyslog_get_logger();
              os_log_type_t v55 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v54, v55))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_225F82000, v54, v55, "AirPlay/SetupAssistantCaptivePortalMitigation feature is enabled", buf, 2u);
              }
              int ConfidenceFromAccounts = GetConfidenceFromAccounts(a1);
              if (ConfidenceFromAccounts)
              {
                int v17 = 4 * (*(_DWORD *)(a1 + 268) == 2);
                goto LABEL_77;
              }
              CaptiveSetStage(a1, kStage_UIRequired[0]);
            }
            else
            {
              CaptiveSetStage(a1, kStage_UIRequired[0]);
              int ConfidenceFromAccounts = 0;
            }
            int v17 = 1;
LABEL_77:
            if (v7 != 1) {
              goto LABEL_79;
            }
            goto LABEL_78;
          case 6u:
            int v56 = mysyslog_get_logger();
            os_log_type_t v57 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v56, v57))
            {
              uint64_t v58 = *(void *)(a1 + 32);
              v59 = *(void **)(a1 + 48);
              *(_DWORD *)buf = 138412546;
              *(void *)v87 = v58;
              *(_WORD *)&v87[8] = 2112;
              v88 = v59;
              os_log_type_t v60 = "Timed out on %@ (%@), assuming online";
              uint64_t v61 = v56;
              os_log_type_t v62 = v57;
              uint32_t v63 = 22;
LABEL_73:
              _os_log_impl(&dword_225F82000, v61, v62, v60, buf, v63);
            }
            break;
          case 2u:
            if (a3)
            {
              os_log_type_t v44 = mysyslog_get_logger();
              os_log_type_t v45 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v44, v45))
              {
                uint64_t v46 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138412546;
                *(void *)v87 = v46;
                *(_WORD *)&v87[8] = 2112;
                v88 = a3;
                _os_log_impl(&dword_225F82000, v44, v45, "%@: detected WISPr %@", buf, 0x16u);
              }
              CFStringRef v47 = (const __CFString *)CFDictionaryGetValue(a3, kWISPrMessageType[0]);
              int v85 = v18;
              if (v47) {
                IntCFStringRef Value = CFStringGetIntValue(v47);
              }
              else {
                IntCFStringRef Value = 0;
              }
              int v19 = CFDictionaryGetValue(a3, kRedirectHostname[0]);
              v70 = CFDictionaryGetValue(a3, kInitialURL[0]);
              if (v70)
              {
                my_FieldSetRetainedCFType((const void **)(a1 + 112), v70);
                __int16 v71 = mysyslog_get_logger();
                os_log_type_t v72 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v71, v72))
                {
                  uint64_t v73 = *(void *)(a1 + 112);
                  *(_DWORD *)buf = 138412290;
                  *(void *)v87 = v73;
                  _os_log_impl(&dword_225F82000, v71, v72, "InitialURL: %@:", buf, 0xCu);
                }
              }
              SInt32 v69 = IntValue;
              if (IntValue == 100)
              {
                CFRange v74 = CFDictionaryGetValue(a3, kLocationURL[0]);
                int v18 = v85;
                if (v74)
                {
                  v75 = v74;
                  os_log_t v76 = mysyslog_get_logger();
                  os_log_type_t v77 = _SC_syslog_os_log_mapping();
                  v84 = v76;
                  v78 = v76;
                  os_log_type_t v79 = v77;
                  if (os_log_type_enabled(v78, v77))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v87 = v75;
                    _os_log_impl(&dword_225F82000, v84, v79, "LocationURL: %@:", buf, 0xCu);
                  }
                }
                v80 = *(const void **)(a1 + 128);
                if (v80) {
                  CFRelease(v80);
                }
                *(void *)(a1 + 128) = a3;
                CFRetain(a3);
                if (*(void *)(a1 + 64) == kStage_Login)
                {
                  if (CaptiveTryNextAccount(a1)) {
                    return;
                  }
                  CaptiveSetStage(a1, kStage_UIRequired[0]);
                  int ConfidenceFromAccounts = 0;
                }
                else
                {
                  int ConfidenceFromAccounts = GetConfidenceFromAccounts(a1);
                  if (!ConfidenceFromAccounts) {
                    CaptiveSetStage(a1, kStage_UIRequired[0]);
                  }
                }
                int v17 = 2;
                goto LABEL_77;
              }
              int v18 = v85;
            }
            else
            {
              int v19 = 0;
              SInt32 v69 = 0;
            }
            v81 = mysyslog_get_logger();
            os_log_type_t v82 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v81, v82))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v87 = v69;
              *(_WORD *)&v87[4] = 1024;
              *(_DWORD *)&v87[6] = 100;
              _os_log_impl(&dword_225F82000, v81, v82, "Received message type %d, expected kWISPrMsg_Redirect (%d)", buf, 0xEu);
            }
            CaptiveSetStage(a1, kStage_UIRequired[0]);
            int v17 = 0;
            int ConfidenceFromAccounts = 0;
            unsigned int v5 = 2;
LABEL_79:
            if (*(unsigned char *)(a1 + 254))
            {
              if ((v5 & 0xFFFFFFFE) == 2) {
                CFNumberRef v66 = (__CFDictionary *)CaptiveCopyAuthenticationResult(a1, 0, v3);
              }
              else {
                CFNumberRef v66 = ResponseDictCreate(v3, v7);
              }
              v68 = v66;
            }
            else
            {
              v67 = ResponseDictCreate(v3, v7);
              v68 = v67;
              if (!v7) {
                ResponseDictSetIsCaptiveAndConfidence(v67, v18, ConfidenceFromAccounts, v17);
              }
            }
            if (v68)
            {
              if (v19) {
                CFDictionarySetValue(v68, @"RedirectHostname", v19);
              }
              CNBuiltinPluginProvideResponse(v68);
              CFRelease(v68);
            }
            return;
          default:
            uint64_t v64 = mysyslog_get_logger();
            os_log_type_t v65 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v64, v65))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v87 = v5;
              os_log_type_t v60 = "Unknown result value: %d, assuming online";
              uint64_t v61 = v64;
              os_log_type_t v62 = v65;
              uint32_t v63 = 8;
              goto LABEL_73;
            }
            break;
        }
        int ConfidenceFromAccounts = 0;
        int v19 = 0;
        int v17 = 0;
LABEL_78:
        CaptiveAnalyticsSessionPostInconclusiveEvent(v5);
        int v7 = 1;
        goto LABEL_79;
    }
  }
  CFStringRef v10 = mysyslog_get_logger();
  os_log_type_t v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v10, v11))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225F82000, v10, v11, "no command to be processed", buf, 2u);
  }
}

const void *isA_CFString(const void *a1)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1) {
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0;
}

uint64_t GetConfidenceFromAccounts(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1 + 160);
  if (!v2)
  {
    CFArrayRef v2 = CNAccountsCopyMatching(*(void *)(a1 + 48), *(const __CFDictionary **)(a1 + 128));
    *(void *)(a1 + 160) = v2;
    *(_DWORD *)(a1 + 168) = 0;
    if (!v2) {
      return 0;
    }
  }
  CFIndex Count = CFArrayGetCount(v2);
  if (Count < 1) {
    return 0;
  }
  CFIndex v4 = Count;
  LODWORD(v5) = 0;
  CFIndex v6 = 0;
  while (1)
  {
    int v10 = 0;
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 160), v6);
    CFStringRef v8 = (const __CFString *)CNAccountsLookupPasswordType(ValueAtIndex);
    if (CNAccountsLookupAuthType(ValueAtIndex, &v10) == 1) {
      *(_DWORD *)(a1 + 268) = v10;
    }
    if (CFStringCompare(v8, @"Keychain", 0)) {
      break;
    }
    ++v6;
    uint64_t v5 = 1;
    if (v4 == v6) {
      return v5;
    }
  }
  if (CNAccountsCredentialsValidate(ValueAtIndex) == 1) {
    return 2;
  }
  else {
    return v5;
  }
}

__CFDictionary *CaptiveCopyAuthenticationResult(uint64_t a1, const __CFDictionary *a2, const void *a3)
{
  CFIndex v6 = *(const void **)(a1 + 40);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 40) = 0;
  }
  if (CaptiveBypass(a2, *(const void **)(a1 + 48), &v10))
  {
    CaptiveSetStage(a1, kStage_Online[0]);
    int v7 = ResponseDictCreate(a3, 0);
    CFDictionarySetValue(v7, @"DisableMaintaining", (const void *)*MEMORY[0x263EFFB40]);
    return v7;
  }
  CFTypeID v9 = *(__CFString **)(a1 + 64);
  if (v9 != kStage_UIRequired[0])
  {
    if (CaptiveTryNextAccount(a1))
    {
      my_FieldSetRetainedCFType((const void **)(a1 + 256), a3);
      return 0;
    }
    CFTypeID v9 = kStage_UIRequired[0];
  }
  CaptiveSetStage(a1, v9);

  return ResponseDictCreate(a3, 2);
}

void ResponseDictSetIsCaptiveAndConfidence(__CFDictionary *a1, int a2, int a3, int a4)
{
  int v12 = a4;
  int valuePtr = a3;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFStringRef v8 = Mutable;
  CFTypeID v9 = (const void **)MEMORY[0x263EFFB40];
  if (!a2) {
    CFTypeID v9 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(Mutable, @"IsCaptive", *v9);
  if (a2)
  {
    CFNumberRef v10 = CFNumberCreate(v6, kCFNumberSInt32Type, &valuePtr);
    CFDictionarySetValue(v8, @"Confidence", v10);
    CFRelease(v10);
    CFNumberRef v11 = CFNumberCreate(v6, kCFNumberSInt32Type, &v12);
    CFDictionarySetValue(v8, @"DetectionType", v11);
    CFRelease(v11);
  }
  CFDictionarySetValue(a1, @"Network", v8);
  CFRelease(v8);
}

uint64_t CaptiveBypass(const __CFDictionary *a1, const void *a2, unsigned char *a3)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (a1)
  {
    if (CFGetTypeID(a1) == TypeID)
    {
      CFStringRef Value = CFDictionaryGetValue(a1, @"CaptiveBypass");
      CFTypeID v8 = CFBooleanGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == v8 && CFBooleanGetValue((CFBooleanRef)Value))
        {
          *a3 = 0;
          return 1;
        }
      }
    }
  }
  if (a2)
  {
    uint64_t result = (uint64_t)CaptiveCopyCarrierSettings(a2);
    if (!result) {
      return result;
    }
    CFNumberRef v10 = (const void *)result;
    CFBooleanRef v11 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)result, @"Bypass");
    CFTypeID v12 = CFBooleanGetTypeID();
    if (v11 && CFGetTypeID(v11) == v12)
    {
      int v13 = CFBooleanGetValue(v11);
      CFRelease(v10);
      if (v13)
      {
        uint64_t result = 1;
        *a3 = 1;
        return result;
      }
    }
    else
    {
      CFRelease(v10);
    }
  }
  return 0;
}

void CaptiveAuthTimerCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_225F82000, logger, v4, "Authentication timed out", (uint8_t *)&v9, 2u);
  }
  if (*(void *)(a2 + 64) == kStage_Login)
  {
    CaptiveSetStage(a2, (__CFString *)kStage_WebSheet);
    mach_port_t v8 = *(_DWORD *)(a2 + 192);
    if (v8)
    {
      AuthenticateUsingReply(v8, -1);
      *(_DWORD *)(a2 + 192) = 0;
    }
    else
    {
      CaptiveInteract(a2);
    }
  }
  else
  {
    uint64_t v5 = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = *(void *)(a2 + 64);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_225F82000, v5, v6, "Authentication Timed out in incorrect stage=%@", (uint8_t *)&v9, 0xCu);
    }
  }
}

void CaptiveInteract(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (UIAllowed())
  {
    *(unsigned char *)(a1 + 252) = 0;
    if (*(void *)(a1 + 112)) {
      CFArrayRef v2 = *(__CFString **)(a1 + 112);
    }
    else {
      CFArrayRef v2 = @"http://www.apple.com/";
    }
    uint64_t v3 = *(void *)(a1 + 224);
    logger = mysyslog_get_logger();
    if (v3)
    {
      os_log_type_t v5 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(logger, v5)) {
        return;
      }
      CFIndex v6 = *(void *)(a1 + 32);
      LODWORD(buf.version) = 138412546;
      *(CFIndex *)((char *)&buf.version + 4) = v6;
      WORD2(buf.info) = 2112;
      *(void **)((char *)&buf.info + 6) = v2;
      uint64_t v7 = "%@: Websheet already exists, urlstr = %@";
      mach_port_t v8 = logger;
      os_log_type_t v9 = v5;
      uint32_t v10 = 22;
      goto LABEL_8;
    }
    uint64_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v14))
    {
      CFIndex v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void **)(a1 + 48);
      LODWORD(buf.version) = 138412802;
      *(CFIndex *)((char *)&buf.version + 4) = v15;
      WORD2(buf.info) = 2112;
      *(void **)((char *)&buf.info + 6) = v16;
      HIWORD(buf.retain) = 2112;
      buf.release = (void (__cdecl *)(const void *))v2;
      _os_log_impl(&dword_225F82000, logger, (os_log_type_t)v14, "%@: Launching Websheet on SSID %@ with URL \"%@\"", (uint8_t *)&buf, 0x20u);
    }
    int v17 = WebSheetStateLaunchApplication((__CFRunLoopTimer *)a1, *(const void **)(a1 + 32), v2, *(const void **)(a1 + 48));
    *(void *)(a1 + 224) = v17;
    if (v17)
    {
      WebSheetStateSetIsAllowed((uint64_t)v17, 1);
      CaptiveSetStage(a1, (__CFString *)kStage_WebSheet);
      if (!IsWebSheetRestrictionEnabled() || !*(void *)(a1 + 224) || *(void *)(a1 + 64) != kStage_WebSheet) {
        goto LABEL_38;
      }
      int v18 = *(__CFRunLoopTimer **)(a1 + 216);
      if (v18)
      {
        CFRunLoopTimerInvalidate(v18);
        int v19 = *(const void **)(a1 + 216);
        if (v19)
        {
          CFRelease(v19);
          *(void *)(a1 + 216) = 0;
        }
      }
      if (ApplyWebSheetRunTimeRestriction_retry > 3) {
        goto LABEL_38;
      }
      buf.version = 0;
      memset(&buf.retain, 0, 24);
      buf.info = (void *)a1;
      double v20 = *(double *)&S_WebSheetInSetupDismissalInterval;
      if (ApplyWebSheetRunTimeRestriction_retry == 3)
      {
        double v21 = 0.333333333;
      }
      else
      {
        if (ApplyWebSheetRunTimeRestriction_retry != 2)
        {
LABEL_34:
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          *(void *)(a1 + 216) = CFRunLoopTimerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v20 + Current, 0.0, 0, 0, (CFRunLoopTimerCallBack)WebSheetDismissalTimerCallback, &buf);
          uint64_t v30 = mysyslog_get_logger();
          os_log_type_t v31 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v30, v31))
          {
            int v33 = 134217984;
            double v34 = v20;
            _os_log_impl(&dword_225F82000, v30, v31, "scheduling WebSheet dismissal after %g seconds", (uint8_t *)&v33, 0xCu);
          }
          CFStringRef v32 = CFRunLoopGetCurrent();
          CFRunLoopAddTimer(v32, *(CFRunLoopTimerRef *)(a1 + 216), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
          if (++ApplyWebSheetRunTimeRestriction_retry == 4) {
            S_canLaunchWebSheetInSetupAssistantMode = 1;
          }
LABEL_38:
          WebSheetStateSetIsUIRequired(*(void *)(a1 + 224), 1);
          return;
        }
        double v21 = 0.666666667;
      }
      double v20 = *(double *)&S_WebSheetInSetupDismissalInterval * v21;
      goto LABEL_34;
    }
    os_log_type_t v22 = *(const void **)(a1 + 256);
    uint64_t v23 = mysyslog_get_logger();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      CFIndex v25 = *(void *)(a1 + 32);
      LODWORD(buf.version) = 138412290;
      *(CFIndex *)((char *)&buf.version + 4) = v25;
      _os_log_impl(&dword_225F82000, v23, v24, "%@: Unknown (websheet failed)", (uint8_t *)&buf, 0xCu);
    }
    CaptiveSetStage(a1, kStage_Unknown);
    if (v22)
    {
      CFNumberRef v26 = ResponseDictCreate(v22, 0);
      CNBuiltinPluginProvideResponse(v26);
      CFRelease(v26);
    }
    else
    {
      os_log_type_t v27 = mysyslog_get_logger();
      uint64_t v28 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v27, (os_log_type_t)v28))
      {
        LOWORD(buf.version) = 0;
        uint64_t v7 = "no uniqueID";
        mach_port_t v8 = v27;
        os_log_type_t v9 = v28;
        uint32_t v10 = 2;
LABEL_8:
        _os_log_impl(&dword_225F82000, v8, v9, v7, (uint8_t *)&buf, v10);
      }
    }
  }
  else if (!*(unsigned char *)(a1 + 252))
  {
    uint64_t v11 = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      CFIndex v13 = *(void *)(a1 + 32);
      LODWORD(buf.version) = 138412290;
      *(CFIndex *)((char *)&buf.version + 4) = v13;
      _os_log_impl(&dword_225F82000, v11, v12, "%@ waiting for UI", (uint8_t *)&buf, 0xCu);
    }
    *(unsigned char *)(a1 + 252) = 1;
  }
}

BOOL IsWebSheetRestrictionEnabled()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v0 = _AMIsDeviceSetupCompleted();
  logger = mysyslog_get_logger();
  os_log_type_t v2 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v2))
  {
    uint64_t v3 = "completed";
    if (!v0) {
      uint64_t v3 = "not completed";
    }
    int v8 = 136315138;
    os_log_type_t v9 = v3;
    _os_log_impl(&dword_225F82000, logger, v2, "device setup is %s", (uint8_t *)&v8, 0xCu);
  }
  if (v0) {
    return 0;
  }
  int v5 = _AMIsDeviceActivated();
  CFIndex v6 = mysyslog_get_logger();
  os_log_type_t v7 = _SC_syslog_os_log_mapping();
  BOOL result = os_log_type_enabled(v6, v7);
  if (v5)
  {
    if (result)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_225F82000, v6, v7, "device activation is completed", (uint8_t *)&v8, 2u);
      return 0;
    }
  }
  else
  {
    if (result)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_225F82000, v6, v7, "device activation is not completed", (uint8_t *)&v8, 2u);
    }
    return 1;
  }
  return result;
}

void WebSheetDismissalTimerCallback(uint64_t a1, uint64_t a2)
{
  if (a2 && *(void *)(a2 + 64) == kStage_WebSheet && *(void *)(a2 + 224))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      *(_WORD *)CFIndex v6 = 0;
      _os_log_impl(&dword_225F82000, logger, v4, "dismissing WebSheet and tearing down Wi-Fi association ...", v6, 2u);
    }
    WebSheetStateIssueExitCommand(*(void *)(a2 + 224));
    WebSheetStateSetIsAllowed(*(void *)(a2 + 224), 0);
    *(void *)(a2 + 224) = 0;
    int v5 = ResponseDictCreate(*(const void **)(a2 + 256), 1);
    CNBuiltinPluginProvideResponse(v5);
    CFRelease(v5);
    CaptiveSetStage(a2, kStage_Unknown);
  }
}

void CaptiveHandleTokenAuthResponse(uint64_t a1, unsigned int a2, const void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  CFIndex v6 = *(const void **)(a1 + 256);
  logger = mysyslog_get_logger();
  os_log_type_t v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v8))
  {
    int v37 = 67109378;
    *(_DWORD *)os_log_type_t v38 = a2;
    *(_WORD *)&v38[4] = 2114;
    *(void *)&v38[6] = a3;
    _os_log_impl(&dword_225F82000, logger, v8, "received token authentication result with code:[%d], result: %{public}@", (uint8_t *)&v37, 0x12u);
  }
  *(void *)(a1 + 96) = 0;
  if (v6)
  {
    os_log_type_t v9 = *(__CFRunLoopTimer **)(a1 + 208);
    if (v9)
    {
      CFRunLoopTimerInvalidate(v9);
      uint64_t v10 = *(const void **)(a1 + 208);
      if (v10)
      {
        CFRelease(v10);
        *(void *)(a1 + 208) = 0;
      }
    }
    int v11 = 0;
    if (a2 > 0x13)
    {
      LODWORD(v18) = 0;
      int v17 = 0;
      goto LABEL_19;
    }
    if (((1 << a2) & 0xEEDC2) != 0)
    {
      os_log_type_t v12 = mysyslog_get_logger();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        int v37 = 67109120;
        *(_DWORD *)os_log_type_t v38 = a2;
        _os_log_impl(&dword_225F82000, v12, v13, "Token Authentication failed, result: %d", (uint8_t *)&v37, 8u);
      }
      if (a2 - 17 > 2)
      {
        int v11 = 0;
        LODWORD(v18) = 0;
        int v17 = 1;
        goto LABEL_19;
      }
      CNAccountsPurgeSSID(*(const void **)(a1 + 48));
      uint64_t v14 = mysyslog_get_logger();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        int v37 = 138412290;
        *(void *)os_log_type_t v38 = v16;
        _os_log_impl(&dword_225F82000, v14, v15, "purged account record for SSID: [%@]", (uint8_t *)&v37, 0xCu);
      }
      int v11 = 0;
      int v17 = 2;
      LODWORD(v18) = 1;
      int v19 = kStage_UIRequired;
LABEL_15:
      CaptiveSetStage(a1, *v19);
LABEL_19:
      mach_port_t v22 = *(_DWORD *)(a1 + 192);
      if (v22)
      {
        AuthenticateUsingReply(v22, a2);
        *(_DWORD *)(a1 + 192) = 0;
      }
      uint64_t v23 = ResponseDictCreate(v6, v17);
      os_log_type_t v24 = v23;
      if (!v17) {
        ResponseDictSetIsCaptiveAndConfidence(v23, (int)v18, v11, 4);
      }
      if (v24)
      {
        CNBuiltinPluginProvideResponse(v24);
        CFRelease(v24);
      }
      return;
    }
    LODWORD(v18) = 0;
    int v17 = 0;
    if (a2) {
      goto LABEL_19;
    }
    CFIndex v25 = mysyslog_get_logger();
    os_log_type_t v26 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v25, v26))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_225F82000, v25, v26, "Token Authentication was successful", (uint8_t *)&v37, 2u);
    }
    if (a3)
    {
      os_log_type_t v27 = mysyslog_get_logger();
      os_log_type_t v28 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = *(void *)(a1 + 32);
        int v37 = 138412546;
        *(void *)os_log_type_t v38 = v29;
        *(_WORD *)&v38[8] = 2112;
        *(void *)&v38[10] = a3;
        _os_log_impl(&dword_225F82000, v27, v28, "%@: received Token Authentication state %@", (uint8_t *)&v37, 0x16u);
      }
      my_FieldSetRetainedCFType((const void **)(a1 + 152), a3);
      CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a3, kTokenAuthWebSheetRequired[0]);
      CFBooleanRef v18 = Value;
      if (Value)
      {
        CFTypeID v31 = CFGetTypeID(Value);
        if (v31 == CFBooleanGetTypeID()) {
          LODWORD(v18) = CFBooleanGetValue(v18);
        }
        else {
          LODWORD(v18) = 0;
        }
      }
      CFBooleanRef v32 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a3, kTokenAuthAccessTokenUsed[0]);
      if (v32 && (CFBooleanRef v33 = v32, v34 = CFGetTypeID(v32), v34 == CFBooleanGetTypeID()) && CFBooleanGetValue(v33)) {
        os_log_type_t v35 = CFDictionaryGetValue((CFDictionaryRef)a3, kTokenAuthAccessToken[0]);
      }
      else {
        os_log_type_t v35 = 0;
      }
      CFStringRef v36 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, kTokenAuthLoginURL[0]);
      int v11 = 2;
      CNAccountsAddInternal(0, v35, *(const __CFString **)(a1 + 48), v36, 2, 0);
      if (v18)
      {
        int v19 = kStage_UIRequired;
        int v17 = 2;
        goto LABEL_15;
      }
    }
    else
    {
      int v11 = 0;
    }
    LODWORD(v18) = 0;
    int v17 = 0;
    int v19 = kStage_Online;
    goto LABEL_15;
  }
  double v20 = mysyslog_get_logger();
  uint64_t v21 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v20, (os_log_type_t)v21))
  {
    LOWORD(v37) = 0;
    _os_log_impl(&dword_225F82000, v20, (os_log_type_t)v21, "no command to be processed", (uint8_t *)&v37, 2u);
  }
}

void captived_thread_stop()
{
}

void CaptiveWebsheetDone(uint64_t *a1, int a2, uint64_t a3)
{
  int v4 = a2;
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v5 = &S_stateHeadStorage;
  do
  {
    int v5 = (uint64_t *)*v5;
    if (v5) {
      BOOL v6 = v5 == a1;
    }
    else {
      BOOL v6 = 1;
    }
  }
  while (!v6);
  if (v5)
  {
    if (!a2 || (v5[28] = 0, a2 != 6))
    {
      logger = mysyslog_get_logger();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        *(_DWORD *)CFRunLoopTimerContext buf = 67109378;
        *(_DWORD *)os_log_type_t v27 = v4;
        *(_WORD *)&void v27[4] = 2112;
        *(void *)&void v27[6] = a3;
        _os_log_impl(&dword_225F82000, logger, v8, "WebSheet Complete, result=%d, options: %@", buf, 0x12u);
      }
      os_log_type_t v9 = (const void *)v5[32];
      if (v9)
      {
        CFIndex v25 = (__CFString *)kStage_Offline;
        uint64_t v10 = 0;
        char v11 = 1;
        os_log_type_t v12 = "cancelled";
        unsigned int v13 = 4;
        char v14 = 1;
        switch(v4)
        {
          case 0:
            unsigned int v13 = 0;
            char v11 = 0;
            int v4 = 0;
            CFIndex v25 = kStage_Online[0];
            LOBYTE(v10) = 1;
            os_log_type_t v12 = "success";
            goto LABEL_24;
          case 1:
            goto LABEL_24;
          case 2:
            LOBYTE(v10) = 0;
            char v11 = 0;
            int v4 = 6;
            unsigned int v13 = 2;
            os_log_type_t v12 = "died";
            goto LABEL_24;
          case 3:
            unsigned int v13 = 0;
            char v11 = 0;
            int v4 = 6;
            LOBYTE(v10) = 1;
            os_log_type_t v12 = "timed out";
            goto LABEL_24;
          case 4:
            LOBYTE(v10) = 0;
            int v4 = 6;
            unsigned int v13 = 2;
            os_log_type_t v12 = "closed";
            goto LABEL_24;
          case 5:
            LOBYTE(v10) = 0;
            char v14 = 0;
            int v4 = 0;
            CFIndex v25 = kStage_Unknown;
            os_log_type_t v12 = "remain associated";
            unsigned int v13 = 3;
LABEL_24:
            int v19 = mysyslog_get_logger();
            os_log_type_t v20 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v19, v20))
            {
              *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
              *(void *)os_log_type_t v27 = v25;
              *(_WORD *)&v27[8] = 2080;
              *(void *)&v27[10] = v12;
              _os_log_impl(&dword_225F82000, v19, v20, "%@ (websheet: %s)", buf, 0x16u);
            }
            if ((v10 & 1) == 0) {
              CaptiveAnalyticsSessionPostIncompleteEvent(v13);
            }
            uint64_t v10 = v25;
            break;
          default:
            int v17 = mysyslog_get_logger();
            os_log_type_t v18 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v17, v18))
            {
              *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
              *(void *)os_log_type_t v27 = 0;
              *(_WORD *)&v27[8] = 1024;
              *(_DWORD *)&v27[10] = v4;
              _os_log_impl(&dword_225F82000, v17, v18, "%@ (websheet: result %d)", buf, 0x12u);
            }
            char v11 = 0;
            int v4 = 6;
            char v14 = 1;
            break;
        }
        *((unsigned char *)v5 + 253) = v11;
        CaptiveSetStage((uint64_t)v5, v10);
        uint64_t v21 = ResponseDictCreate(v9, v4);
        mach_port_t v22 = v21;
        uint64_t v23 = (const void **)MEMORY[0x263EFFB40];
        if (*((unsigned char *)v5 + 253)) {
          CFDictionarySetValue(v21, @"DisableMaintaining", (const void *)*MEMORY[0x263EFFB40]);
        }
        if ((v14 & 1) == 0) {
          CFDictionarySetValue(v22, @"DisableAutologin", *v23);
        }
        if (v10 == kStage_Online[0]) {
          CFDictionarySetValue(v22, @"UpdateWebSheetLoginDate", *v23);
        }
        CFDictionaryRef APIStateSecondsRemaining = CaptiveGetAPIStateSecondsRemaining((const __CFDictionary *)v5);
        if (APIStateSecondsRemaining) {
          CFDictionarySetValue(v22, @"APIStateSecondsRemaining", APIStateSecondsRemaining);
        }
        CNBuiltinPluginProvideResponse(v22);
        CFRelease(v22);
      }
      else
      {
        os_log_type_t v15 = mysyslog_get_logger();
        os_log_type_t v16 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v15, v16))
        {
          *(_WORD *)CFRunLoopTimerContext buf = 0;
          _os_log_impl(&dword_225F82000, v15, v16, "no uniqueID", buf, 2u);
        }
      }
    }
  }
}

void CaptiveBuiltinPluginProcessCommand(const __CFDictionary *a1)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  char v92 = 0;
  CFBooleanRef Value = CFDictionaryGetValue(a1, @"Type");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!Value) {
    return;
  }
  if (CFGetTypeID(Value) != TypeID) {
    return;
  }
  int valuePtr = 0;
  if (!CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr)) {
    return;
  }
  int v4 = (void *)CFDictionaryGetValue(a1, @"UniqueID");
  CFStringRef v5 = (const __CFString *)CFDictionaryGetValue(a1, @"InterfaceName");
  CFDictionaryRef v6 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"Network");
  CFDictionaryRef v7 = v6;
  if (v6)
  {
    os_log_type_t v8 = CFDictionaryGetValue(v6, @"SSIDString");
    os_log_type_t v9 = CFDictionaryGetValue(v7, @"SSID");
    CFTypeRef cf = CFDictionaryGetValue(v7, @"BecameCaptive");
    CFBooleanRef v10 = (const __CFBoolean *)CFDictionaryGetValue(v7, @"QuickProbeRequired");
    CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(v7, @"PortalURL");
    if (v11)
    {
      CFStringRef v12 = v11;
      if (CFStringHasPrefix(v11, @"https://")) {
        CFStringRef v13 = v12;
      }
      else {
        CFStringRef v13 = 0;
      }
    }
    else
    {
      CFStringRef v13 = 0;
    }
  }
  else
  {
    CFBooleanRef v10 = 0;
    CFTypeRef cf = 0;
    CFStringRef v13 = 0;
    os_log_type_t v9 = 0;
    os_log_type_t v8 = 0;
  }
  char v14 = &S_stateHeadStorage;
  while (1)
  {
    char v14 = (uint64_t *)*v14;
    if (!v14) {
      break;
    }
    if (CFEqual((CFTypeRef)v14[4], v5)) {
      goto LABEL_18;
    }
  }
  char v14 = (uint64_t *)malloc_type_malloc(0x110uLL, 0x10E0040162B702FuLL);
  *(_OWORD *)char v14 = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *((_OWORD *)v14 + 3) = 0u;
  *((_OWORD *)v14 + 4) = 0u;
  *((_OWORD *)v14 + 5) = 0u;
  *((_OWORD *)v14 + 6) = 0u;
  *((_OWORD *)v14 + 7) = 0u;
  *((_OWORD *)v14 + 8) = 0u;
  *((_OWORD *)v14 + 9) = 0u;
  *((_OWORD *)v14 + 10) = 0u;
  *((_OWORD *)v14 + 11) = 0u;
  *((_OWORD *)v14 + 12) = 0u;
  *((_OWORD *)v14 + 13) = 0u;
  *((_OWORD *)v14 + 14) = 0u;
  *((_OWORD *)v14 + 15) = 0u;
  *((_OWORD *)v14 + 16) = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  v14[4] = (uint64_t)CFRetain(v5);
  CFStringGetCString(v5, (char *)v14 + 16, 16, 0x600u);
  uint64_t v15 = S_stateHeadStorage;
  *char v14 = S_stateHeadStorage;
  if (v15) {
    *(void *)(v15 + 8) = v14;
  }
  S_stateHeadStorage = (uint64_t)v14;
  v14[1] = (uint64_t)&S_stateHeadStorage;
LABEL_18:
  switch(valuePtr)
  {
    case 0:
      logger = mysyslog_get_logger();
      os_log_type_t v17 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v17))
      {
        uint64_t v18 = v14[4];
        *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
        uint64_t v95 = v18;
        __int16 v96 = 2112;
        v97 = v4;
        _os_log_impl(&dword_225F82000, logger, v17, "%@ None(Cleanup) %@", buf, 0x16u);
      }
      CaptiveStateCleanup((uint64_t)v14, 1);
      return;
    case 2:
      uint64_t v21 = mysyslog_get_logger();
      os_log_type_t v22 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = v14[4];
        *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
        uint64_t v95 = v23;
        __int16 v96 = 2112;
        v97 = v4;
        _os_log_impl(&dword_225F82000, v21, v22, "%@ Evaluate %@", buf, 0x16u);
      }
      CaptiveStateCleanup((uint64_t)v14, 1);
      my_FieldSetRetainedCFType((const void **)v14 + 32, 0);
      my_FieldSetRetainedCFType((const void **)v14 + 7, v9);
      my_FieldSetRetainedCFType((const void **)v14 + 6, v8);
      my_FieldSetRetainedCFType((const void **)v14 + 15, v13);
      CFTypeID v24 = CFBooleanGetTypeID();
      if (v10 && CFGetTypeID(v10) == v24) {
        *((unsigned char *)v14 + 264) = CFBooleanGetValue(v10) != 0;
      }
      CFIndex v25 = mysyslog_get_logger();
      os_log_type_t v26 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = v14[4];
        *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
        uint64_t v95 = v27;
        __int16 v96 = 2112;
        v97 = (void *)v13;
        _os_log_impl(&dword_225F82000, v25, v26, "%@ Evaluate found portal url %@", buf, 0x16u);
      }
      if (!v8 || !v9)
      {
        uint64_t v53 = mysyslog_get_logger();
        os_log_type_t v54 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v53, v54)) {
          goto LABEL_76;
        }
        uint64_t v55 = v14[4];
        *(_DWORD *)CFRunLoopTimerContext buf = 138412290;
        uint64_t v95 = v55;
        goto LABEL_75;
      }
      if (CaptiveBypass(v7, v8, &v92))
      {
        uint64_t v28 = mysyslog_get_logger();
        os_log_type_t v29 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = v14[4];
          if (v92) {
            CFTypeID v31 = @"disabled by carrier";
          }
          else {
            CFTypeID v31 = @"disabled by user";
          }
          *(_DWORD *)CFRunLoopTimerContext buf = 138412802;
          uint64_t v95 = v30;
          __int16 v96 = 2112;
          v97 = (void *)v8;
          __int16 v98 = 2112;
          v99 = v31;
          _os_log_impl(&dword_225F82000, v28, v29, "%@: Not probing '%@' (%@)", buf, 0x20u);
        }
        CFBooleanRef v32 = ResponseDictCreate(v4, 0);
        CFBooleanRef v33 = v32;
        int ConfidenceFromAccounts = 1;
LABEL_107:
        ResponseDictSetIsCaptiveAndConfidence(v32, 1, ConfidenceFromAccounts, 0);
        goto LABEL_79;
      }
      if (v7
        && !my_CFDictionaryGetBooleanValue(v7, @"WasCaptive", 0)
        && my_CFDictionaryGetBooleanValue(v7, @"IsCached", 0))
      {
        os_log_type_t v79 = mysyslog_get_logger();
        os_log_type_t v80 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v79, v80))
        {
          uint64_t v81 = v14[4];
          *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
          uint64_t v95 = v81;
          __int16 v96 = 2112;
          v97 = (void *)v8;
          _os_log_impl(&dword_225F82000, v79, v80, "%@: Not probing '%@' (cache indicates not captive)", buf, 0x16u);
        }
        CFBooleanRef v33 = ResponseDictCreate(v4, 0);
        ResponseDictSetIsCaptiveAndConfidence(v33, 0, 0, 0);
        CFRange v74 = kStage_Unknown;
LABEL_113:
        CaptiveSetStage((uint64_t)v14, v74);
        goto LABEL_79;
      }
      if (CNAccountsIsCarrierSSID((uint64_t)v8))
      {
        v68 = mysyslog_get_logger();
        os_log_type_t v69 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v68, v69))
        {
          uint64_t v70 = v14[4];
          *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
          uint64_t v95 = v70;
          __int16 v96 = 2112;
          v97 = (void *)v8;
          _os_log_impl(&dword_225F82000, v68, v69, "%@: Found carrier network '%@'", buf, 0x16u);
        }
        *((unsigned char *)v14 + 254) = 1;
        CFBooleanRef v33 = ResponseDictCreate(v4, 0);
        int ConfidenceFromAccounts = GetConfidenceFromAccounts((uint64_t)v14);
        CFBooleanRef v32 = v33;
        goto LABEL_107;
      }
      SendEvaluateAck(v4);
      uint64_t v39 = (__CFString *)kStage_Evaluate;
      if (!v13) {
        goto LABEL_43;
      }
      goto LABEL_125;
    case 3:
      os_log_type_t v35 = mysyslog_get_logger();
      os_log_type_t v36 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = v14[4];
        uint64_t v38 = v14[8];
        *(_DWORD *)CFRunLoopTimerContext buf = 138412802;
        uint64_t v95 = v37;
        __int16 v96 = 2112;
        v97 = v4;
        __int16 v98 = 2112;
        v99 = (__CFString *)v38;
        _os_log_impl(&dword_225F82000, v35, v36, "%@ Authenticate %@ %@", buf, 0x20u);
      }
      if (*((unsigned char *)v14 + 254))
      {
        uint64_t v39 = (__CFString *)kStage_Evaluate;
        goto LABEL_43;
      }
      my_FieldSetRetainedCFType((const void **)v14 + 32, 0);
      API = CaptiveCopyAuthenticationResult((uint64_t)v14, v7, v4);
      goto LABEL_78;
    case 4:
      CFStringRef v41 = mysyslog_get_logger();
      os_log_type_t v42 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = v14[4];
        *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
        uint64_t v95 = v43;
        __int16 v96 = 2112;
        v97 = v4;
        _os_log_impl(&dword_225F82000, v41, v42, "%@ PresentUI %@", buf, 0x16u);
      }
      my_FieldSetRetainedCFType((const void **)v14 + 32, 0);
      if ((__CFString *)v14[8] != kStage_UIRequired[0])
      {
        os_log_type_t v44 = mysyslog_get_logger();
        os_log_type_t v45 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v44, v45))
        {
          *(_WORD *)CFRunLoopTimerContext buf = 0;
          _os_log_impl(&dword_225F82000, v44, v45, "PresentUI command not expected (not in Websheet stage)", buf, 2u);
        }
        int v19 = v4;
        int v20 = 0;
LABEL_77:
        API = ResponseDictCreate(v19, v20);
        goto LABEL_78;
      }
      uint64_t v58 = NetIFCopyCurrentWiFiNetwork(v14[4]);
      if (!v58)
      {
        v75 = mysyslog_get_logger();
        os_log_type_t v76 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v75, v76))
        {
          uint64_t v77 = v14[4];
          *(_DWORD *)CFRunLoopTimerContext buf = 138412290;
          uint64_t v95 = v77;
          _os_log_impl(&dword_225F82000, v75, v76, "NetIFCopyCurrentWiFiNetwork returned NULL for interface %@ ", buf, 0xCu);
        }
        goto LABEL_141;
      }
      v59 = (const void *)v58;
      if (IsWebSheetRestrictionEnabled() && S_canLaunchWebSheetInSetupAssistantMode)
      {
        os_log_type_t v60 = (__CFRunLoopTimer *)v14[27];
        if (v60)
        {
          CFRunLoopTimerInvalidate(v60);
          uint64_t v61 = (const void *)v14[27];
          if (v61)
          {
            CFRelease(v61);
            v14[27] = 0;
          }
        }
        os_log_type_t v62 = mysyslog_get_logger();
        os_log_type_t v63 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v62, v63))
        {
          *(_WORD *)CFRunLoopTimerContext buf = 0;
          _os_log_impl(&dword_225F82000, v62, v63, "The device ran out of retries to login to captive network while running in setup assistant mode", buf, 2u);
        }
        BOOL v64 = 0;
        os_log_type_t v65 = "WebSheet cannot be used in setup assistant mode anymore";
        goto LABEL_93;
      }
      if (NetIFWiFiNetworkWasAutoJoined((uint64_t)v59))
      {
        if (!NetIFWiFiNetworkIsCarPlayAndInternet())
        {
          CFTypeID v78 = CFBooleanGetTypeID();
          if (cf && CFGetTypeID(cf) == v78 && CFBooleanGetValue((CFBooleanRef)cf))
          {
            BOOL v64 = 0;
            os_log_type_t v65 = "this network has become captive";
            goto LABEL_93;
          }
          CFDateRef LastWebSheetLoginDate = (const __CFDate *)NetIFWiFiNetworkGetLastWebSheetLoginDate();
          if (LastWebSheetLoginDate)
          {
            CFDateRef v85 = LastWebSheetLoginDate;
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            CFDateRef v87 = CFDateCreate(0, Current);
            v88 = mysyslog_get_logger();
            os_log_type_t v89 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v88, v89))
            {
              *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
              uint64_t v95 = (uint64_t)v87;
              __int16 v96 = 2112;
              v97 = v85;
              _os_log_impl(&dword_225F82000, v88, v89, "Current time : [%@], Last WebSheet Login time: [%@]", buf, 0x16u);
            }
            CFTimeInterval TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v87, v85);
            BOOL v64 = TimeIntervalSinceDate <= *(double *)&S_WebSheetLoginValidityInterval;
            if (TimeIntervalSinceDate > *(double *)&S_WebSheetLoginValidityInterval) {
              os_log_type_t v65 = "last WebSheet login is older than configured time period";
            }
            else {
              os_log_type_t v65 = 0;
            }
            if (v87) {
              CFRelease(v87);
            }
LABEL_93:
            CFRelease(v59);
            if (!v64 && v65)
            {
              CFNumberRef v66 = mysyslog_get_logger();
              os_log_type_t v67 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v66, v67))
              {
                *(_DWORD *)CFRunLoopTimerContext buf = 136315394;
                uint64_t v95 = (uint64_t)v65;
                __int16 v96 = 2112;
                v97 = (void *)v8;
                _os_log_impl(&dword_225F82000, v66, v67, "Unable to launch WebSheet because %s, blacklisting network [%@]", buf, 0x16u);
              }
              os_log_type_t v57 = ResponseDictCreate(v4, 6);
              CFBooleanRef v33 = v57;
              goto LABEL_81;
            }
LABEL_141:
            my_FieldSetRetainedCFType((const void **)v14 + 32, v4);
            CaptiveInteract((uint64_t)v14);
            return;
          }
        }
      }
      else
      {
        os_log_type_t v82 = mysyslog_get_logger();
        os_log_type_t v83 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v82, v83))
        {
          *(_WORD *)CFRunLoopTimerContext buf = 0;
          _os_log_impl(&dword_225F82000, v82, v83, "It's a manual join so no further checks required", buf, 2u);
        }
      }
      CFRelease(v59);
      goto LABEL_141;
    case 5:
      uint64_t v46 = mysyslog_get_logger();
      os_log_type_t v47 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = v14[4];
        *(_DWORD *)CFRunLoopTimerContext buf = 138412802;
        uint64_t v95 = v48;
        __int16 v96 = 2112;
        v97 = v4;
        __int16 v98 = 2112;
        v99 = (__CFString *)v13;
        _os_log_impl(&dword_225F82000, v46, v47, "%@ Maintain %@ portal url: [%@]", buf, 0x20u);
      }
      if ((__CFString *)v14[8] != kStage_Online[0]
        || v7 && my_CFDictionaryGetBooleanValue(v7, @"WasJustJoined", 0))
      {
        CaptiveStateCleanup((uint64_t)v14, 0);
      }
      *((unsigned char *)v14 + 254) = 0;
      my_FieldSetRetainedCFType((const void **)v14 + 32, 0);
      my_FieldSetRetainedCFType((const void **)v14 + 7, v9);
      my_FieldSetRetainedCFType((const void **)v14 + 6, v8);
      my_FieldSetRetainedCFType((const void **)v14 + 15, v13);
      if (v14[9]) {
        captive_agent_abort_probe(v14 + 9);
      }
      if (v14[10]) {
        captive_agent_abort_login(v14 + 10);
      }
      if (v14[11]) {
        captive_agent_abort_query(v14 + 11);
      }
      if (v14[12]) {
        captive_agent_abort_token_auth(v14 + 12);
      }
      if (!v8 || !v9)
      {
        uint64_t v53 = mysyslog_get_logger();
        os_log_type_t v54 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v53, v54)) {
          goto LABEL_76;
        }
        uint64_t v56 = v14[4];
        *(_DWORD *)CFRunLoopTimerContext buf = 138412290;
        uint64_t v95 = v56;
LABEL_75:
        _os_log_impl(&dword_225F82000, v53, v54, "%@: ssid is NULL", buf, 0xCu);
LABEL_76:
        CaptiveSetStage((uint64_t)v14, kStage_Unknown);
        int v19 = v4;
        int v20 = 1;
        goto LABEL_77;
      }
      if (CaptiveBypass(v7, v8, &v92))
      {
        CFDictionaryRef v49 = mysyslog_get_logger();
        os_log_type_t v50 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v51 = v14[4];
          if (v92) {
            os_log_type_t v52 = @"disabled by carrier";
          }
          else {
            os_log_type_t v52 = @"disabled by user";
          }
          *(_DWORD *)CFRunLoopTimerContext buf = 138412802;
          uint64_t v95 = v51;
          __int16 v96 = 2112;
          v97 = (void *)v8;
          __int16 v98 = 2112;
          v99 = v52;
          _os_log_impl(&dword_225F82000, v49, v50, "%@: Not probing '%@' (%@)", buf, 0x20u);
        }
        CFBooleanRef v33 = ResponseDictCreate(v4, 0);
        CFDictionarySetValue(v33, @"DisableMaintaining", (const void *)*MEMORY[0x263EFFB40]);
LABEL_112:
        CFRange v74 = kStage_Online[0];
        goto LABEL_113;
      }
      if (*((unsigned char *)v14 + 253))
      {
        __int16 v71 = mysyslog_get_logger();
        os_log_type_t v72 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v71, v72))
        {
          uint64_t v73 = v14[4];
          *(_DWORD *)CFRunLoopTimerContext buf = 138412546;
          uint64_t v95 = v73;
          __int16 v96 = 2112;
          v97 = (void *)v8;
          _os_log_impl(&dword_225F82000, v71, v72, "%@: Not probing '%@' (ignoring until next association)", buf, 0x16u);
        }
        CFBooleanRef v33 = ResponseDictCreate(v4, 0);
        goto LABEL_112;
      }
      uint64_t v39 = (__CFString *)kStage_Maintain;
      if (v13) {
LABEL_125:
      }
        API = CaptiveQueryAPI((uint64_t)v14, v4, v39, v13);
      else {
LABEL_43:
      }
        API = CaptiveStartProbe((uint64_t)v14, v4, v39);
LABEL_78:
      CFBooleanRef v33 = API;
LABEL_79:
      if (v33)
      {
        os_log_type_t v57 = v33;
LABEL_81:
        CNBuiltinPluginProvideResponse(v57);
        CFRelease(v33);
      }
      return;
    default:
      int v19 = v4;
      int v20 = 3;
      goto LABEL_77;
  }
}

void prefs_changed()
{
}

void CaptiveCheckPreferences(int a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = gDebug;
  int v3 = gVerbose;
  CaptivePrefsRefresh();
  if (a1) {
    gActive = CaptivePrefsIsActive();
  }
  gVerbose = CaptivePrefsIsVerbose();
  gDebug = CaptivePrefsIsDebug();
  int v4 = gVerbose;
  if (v3 != gVerbose)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    BOOL v7 = os_log_type_enabled(logger, v6);
    if (v4 == 1)
    {
      if (v7)
      {
        LOWORD(v16) = 0;
        os_log_type_t v8 = "Verbose mode enabled";
LABEL_9:
        _os_log_impl(&dword_225F82000, logger, v6, v8, (uint8_t *)&v16, 2u);
      }
    }
    else if (v7)
    {
      LOWORD(v16) = 0;
      os_log_type_t v8 = "Verbose mode disabled";
      goto LABEL_9;
    }
  }
  if (v2 != gDebug)
  {
    os_log_type_t v9 = mysyslog_get_logger();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      CFStringRef v11 = "disabled";
      if (!v2) {
        CFStringRef v11 = "enabled";
      }
      int v16 = 136315138;
      uint64_t v17 = (uint64_t)v11;
      _os_log_impl(&dword_225F82000, v9, v10, "Debug mode %s", (uint8_t *)&v16, 0xCu);
    }
  }
  CNPluginHandlerCheckPreferences();
  S_WebSheetLoginValidityInterval = CCPGetWebSheetLoginValidityInterval();
  CFStringRef v12 = mysyslog_get_logger();
  os_log_type_t v13 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v12, v13))
  {
    int v16 = 134217984;
    uint64_t v17 = S_WebSheetLoginValidityInterval;
    _os_log_impl(&dword_225F82000, v12, v13, "WebSheetLoginValidityInterval = %g", (uint8_t *)&v16, 0xCu);
  }
  S_WebSheetInSetupDismissalInterval = CCPGetWebSheetInSetupDismissalInterval();
  char v14 = mysyslog_get_logger();
  os_log_type_t v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v14, v15))
  {
    int v16 = 134217984;
    uint64_t v17 = S_WebSheetInSetupDismissalInterval;
    _os_log_impl(&dword_225F82000, v14, v15, "WebSheetInSetupDismissalInterval = %g", (uint8_t *)&v16, 0xCu);
  }
}

CFDictionaryRef CaptiveGetAPIStateSecondsRemaining(const __CFDictionary *result)
{
  if (result)
  {
    BOOL result = (const __CFDictionary *)*((void *)result + 18);
    if (result)
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(result, kCAPPORTSecondsRemaining[0]);
      CFTypeID TypeID = CFNumberGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        double valuePtr = 0.0;
        CFNumberGetValue(Value, kCFNumberDoubleType, &valuePtr);
        if (valuePtr <= 0.0) {
          return 0;
        }
        else {
          return Value;
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

void CaptiveStateCleanup(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    os_log_type_t v6 = *(const char **)(a1 + 64);
    int v22 = 138412290;
    uint64_t v23 = v6;
    _os_log_impl(&dword_225F82000, logger, v5, "cancelling operations for built-in plugin in stage: [%@]", (uint8_t *)&v22, 0xCu);
  }
  if ((a2 == 1 || *(void *)(a1 + 64) == kStage_WebSheet) && *(void *)(a1 + 224))
  {
    BOOL v7 = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = "WebSheetStagePending == TRUE. Make Old State Go Away.";
      if (a2 == 1) {
        os_log_type_t v9 = "Make Stale WebSheet Go Away.";
      }
      int v22 = 136315138;
      uint64_t v23 = v9;
      _os_log_impl(&dword_225F82000, v7, v8, "%s", (uint8_t *)&v22, 0xCu);
    }
    WebSheetStateIssueExitCommand(*(void *)(a1 + 224));
    WebSheetStateSetIsAllowed(*(void *)(a1 + 224), 0);
    *(void *)(a1 + 224) = 0;
  }
  my_FieldSetRetainedCFType((const void **)(a1 + 256), 0);
  if (*(void *)(a1 + 72)) {
    captive_agent_abort_probe((void *)(a1 + 72));
  }
  if (*(void *)(a1 + 80)) {
    captive_agent_abort_login((void *)(a1 + 80));
  }
  if (*(void *)(a1 + 88)) {
    captive_agent_abort_query((void *)(a1 + 88));
  }
  if (*(void *)(a1 + 96)) {
    captive_agent_abort_token_auth((void *)(a1 + 96));
  }
  os_log_type_t v10 = *(const void **)(a1 + 112);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(a1 + 112) = 0;
  }
  CFStringRef v11 = *(const void **)(a1 + 128);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(a1 + 128) = 0;
  }
  CFStringRef v12 = *(const void **)(a1 + 136);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(a1 + 136) = 0;
  }
  my_FieldSetRetainedCFType((const void **)(a1 + 144), 0);
  my_FieldSetRetainedCFType((const void **)(a1 + 152), 0);
  os_log_type_t v13 = *(const void **)(a1 + 160);
  if (v13)
  {
    CFRelease(v13);
    *(void *)(a1 + 160) = 0;
  }
  *(_DWORD *)(a1 + 168) = 0;
  char v14 = *(const void **)(a1 + 176);
  if (v14)
  {
    CFRelease(v14);
    *(void *)(a1 + 176) = 0;
  }
  uint64_t v15 = *(void *)(a1 + 184);
  if (v15)
  {
    CNAccountsCredentialsQueryAbort(v15);
    *(void *)(a1 + 184) = 0;
  }
  *(_DWORD *)(a1 + 192) = 0;
  int v16 = *(__CFRunLoopTimer **)(a1 + 200);
  if (v16)
  {
    CFRunLoopTimerInvalidate(v16);
    uint64_t v17 = *(const void **)(a1 + 200);
    if (v17)
    {
      CFRelease(v17);
      *(void *)(a1 + 200) = 0;
    }
  }
  uint64_t v18 = *(__CFRunLoopTimer **)(a1 + 208);
  if (v18)
  {
    CFRunLoopTimerInvalidate(v18);
    int v19 = *(const void **)(a1 + 208);
    if (v19)
    {
      CFRelease(v19);
      *(void *)(a1 + 208) = 0;
    }
  }
  int v20 = *(const void **)(a1 + 232);
  if (v20)
  {
    CFRelease(v20);
    *(void *)(a1 + 232) = 0;
  }
  uint64_t v21 = *(const void **)(a1 + 240);
  if (v21)
  {
    CFRelease(v21);
    *(void *)(a1 + 240) = 0;
  }
  *(_DWORD *)(a1 + 248) = 0;
  *(unsigned char *)(a1 + 252) = 0;
  my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
  my_FieldSetRetainedCFType((const void **)(a1 + 56), 0);
  my_FieldSetRetainedCFType((const void **)(a1 + 120), 0);
  my_FieldSetRetainedCFType((const void **)(a1 + 144), 0);
  *(_WORD *)(a1 + 253) = 0;
  *(unsigned char *)(a1 + 264) = 0;
}

void SendEvaluateAck(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int valuePtr = 2;
  CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  *(_OWORD *)keys = xmmword_264784D08;
  values[0] = a1;
  values[1] = v2;
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CNBuiltinPluginAckEvaluateCommand(v3);
  CFRelease(v2);
  CFRelease(v3);
}

__CFDictionary *CaptiveQueryAPI(uint64_t a1, const void *a2, __CFString *cf1, const __CFString *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v8 = CFEqual(cf1, (CFTypeRef)kStage_Maintain);
  logger = mysyslog_get_logger();
  os_log_type_t v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v10))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    CFStringRef v12 = @"Maintaining";
    uint64_t v13 = *(void *)(a1 + 48);
    if (!v8) {
      CFStringRef v12 = @"Evaluating API";
    }
    int v20 = 138412802;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    _os_log_impl(&dword_225F82000, logger, v10, "%@: %@ '%@'", (uint8_t *)&v20, 0x20u);
    goto LABEL_6;
  }
  if (a1)
  {
LABEL_6:
    uint64_t v14 = *(void *)(a1 + 48);
    goto LABEL_7;
  }
  uint64_t v14 = 0;
LABEL_7:
  apuint64_t i = captive_agent_query_api(v14, *(const __CFString **)(a1 + 32), a4, 0xAu, (uint64_t)CaptiveHandleAPIResponse, a1, gThreadRunLoop);
  *(void *)(a1 + 88) = api;
  if (api)
  {
    CaptiveSetStage(a1, cf1);
    my_FieldSetRetainedCFType((const void **)(a1 + 256), a2);
    return 0;
  }
  else
  {
    uint64_t v17 = mysyslog_get_logger();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_225F82000, v17, v18, "captive_agent_query_api failed", (uint8_t *)&v20, 2u);
    }
    int v16 = ResponseDictCreate(a2, 1);
    CaptiveSetStage(a1, kStage_Unknown);
  }
  return v16;
}

__CFDictionary *CaptiveStartProbe(uint64_t a1, const void *a2, __CFString *cf1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  os_log_type_t v6 = @"Probing";
  if (!CFEqual(cf1, (CFTypeRef)kStage_Evaluate) && CFEqual(cf1, (CFTypeRef)kStage_Maintain)) {
    os_log_type_t v6 = @"Maintaining";
  }
  logger = mysyslog_get_logger();
  os_log_type_t v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v8))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    int v19 = 138412802;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    _os_log_impl(&dword_225F82000, logger, v8, "%@: %@ '%@'", (uint8_t *)&v19, 0x20u);
  }
  if (*(unsigned char *)(a1 + 264))
  {
    uint64_t v11 = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    unsigned int v13 = 5;
    if (os_log_type_enabled(v11, v12))
    {
      int v19 = 67109120;
      LODWORD(v20) = 5;
      _os_log_impl(&dword_225F82000, v11, v12, "quick probe is requested, setting timeout to %d seconds", (uint8_t *)&v19, 8u);
    }
  }
  else
  {
    unsigned int v13 = 40;
  }
  uint64_t v14 = captive_agent_send_probe(*(const void **)(a1 + 48), *(const __CFString **)(a1 + 32), 0, *(__CFString **)(a1 + 112), v13, (uint64_t)CaptiveHandleRedirect, a1, gThreadRunLoop);
  *(void *)(a1 + 72) = v14;
  if (v14)
  {
    CaptiveSetStage(a1, cf1);
    my_FieldSetRetainedCFType((const void **)(a1 + 256), a2);
    return 0;
  }
  else
  {
    int v16 = mysyslog_get_logger();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_225F82000, v16, v17, "captive_agent_send_probe failed", (uint8_t *)&v19, 2u);
    }
    uint64_t v15 = ResponseDictCreate(a2, 1);
    CaptiveSetStage(a1, kStage_Unknown);
  }
  return v15;
}

void CaptiveHandleAPIResponse(uint64_t a1, int a2, const void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFDictionaryRef v3 = *(const void **)(a1 + 256);
  *(void *)(a1 + 88) = 0;
  if (v3)
  {
    int v4 = a3;
    if ((a2 - 6) > 9)
    {
      int v6 = 0;
      if (!a2)
      {
LABEL_4:
        if (!a3) {
          goto LABEL_19;
        }
        goto LABEL_13;
      }
    }
    else
    {
      int v6 = dword_225FB1908[a2 - 6];
      if (!a2) {
        goto LABEL_4;
      }
    }
    if (a2 != 16)
    {
      LODWORD(v4) = 0;
LABEL_19:
      LODWORD(v13) = 0;
      goto LABEL_27;
    }
    if (*(void *)(a1 + 64) == kStage_Maintain) {
      int v6 = 4;
    }
    if (!a3) {
      goto LABEL_19;
    }
LABEL_13:
    logger = mysyslog_get_logger();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v10))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v23 = 138412546;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v4;
      _os_log_impl(&dword_225F82000, logger, v10, "%@: received Captive API state %@", (uint8_t *)&v23, 0x16u);
    }
    my_FieldSetRetainedCFType((const void **)(a1 + 144), v4);
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v4, kCAPPORTCaptiveFlag[0]);
    CFBooleanRef v13 = Value;
    if (Value)
    {
      CFTypeID v14 = CFGetTypeID(Value);
      if (v14 == CFBooleanGetTypeID()) {
        LODWORD(v13) = CFBooleanGetValue(v13);
      }
      else {
        LODWORD(v13) = 0;
      }
    }
    uint64_t v15 = CFDictionaryGetValue((CFDictionaryRef)v4, kCAPPORTUserPortalURL[0]);
    if (v15)
    {
      my_FieldSetRetainedCFType((const void **)(a1 + 112), v15);
      int v16 = mysyslog_get_logger();
      os_log_type_t v17 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = *(void *)(a1 + 112);
        int v23 = 138412290;
        uint64_t v24 = v18;
        _os_log_impl(&dword_225F82000, v16, v17, "InitialURL: %@:", (uint8_t *)&v23, 0xCu);
      }
    }
    int v19 = kStage_Online;
    if (v13) {
      int v19 = kStage_UIRequired;
    }
    CaptiveSetStage(a1, *v19);
    LODWORD(v4) = 2;
LABEL_27:
    uint64_t v20 = ResponseDictCreate(v3, v6);
    __int16 v21 = v20;
    if (v6)
    {
      if (!v13)
      {
LABEL_31:
        CFDictionaryRef APIStateSecondsRemaining = CaptiveGetAPIStateSecondsRemaining((const __CFDictionary *)a1);
        if (APIStateSecondsRemaining) {
          CFDictionarySetValue(v21, @"APIStateSecondsRemaining", APIStateSecondsRemaining);
        }
      }
    }
    else
    {
      ResponseDictSetIsCaptiveAndConfidence(v20, (int)v13, (int)v4, 3);
      if (!v13) {
        goto LABEL_31;
      }
    }
    if (v21)
    {
      CNBuiltinPluginProvideResponse(v21);
      CFRelease(v21);
    }
    return;
  }
  uint64_t v7 = mysyslog_get_logger();
  uint64_t v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v7, (os_log_type_t)v8))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_225F82000, v7, (os_log_type_t)v8, "no command to be processed", (uint8_t *)&v23, 2u);
  }
}

uint64_t CNSServerUnImp()
{
  return 5;
}

uint64_t CNSServerParsePost(uint64_t a1, char a2, const char *a3, const char *a4, const char *a5, const char *a6, int *a7)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (!CaptiveIsActive())
  {
    *a7 = 6;
    return 0;
  }
  BOOL v13 = is_internal_install();
  if ((a2 & 1) == 0 || v13)
  {
    *a7 = 1;
    CFStringRef theString = 0;
    CFTypeRef cf = 0;
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v15 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, 0x8000100u);
    CFStringRef v16 = CFStringCreateWithCString(v14, a5, 0x8000100u);
    CFStringRef v17 = CFStringCreateWithCString(v14, a4, 0x8000100u);
    CFStringRef v18 = CFStringCreateWithCString(v14, a6, 0x8000100u);
    CFStringRef v19 = v18;
    if (v15) {
      BOOL v20 = v17 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (v20 || v16 == 0 || v18 == 0)
    {
      CFStringRef v23 = 0;
      CFStringRef v24 = 0;
      if (!v16) {
        goto LABEL_63;
      }
      goto LABEL_62;
    }
    if (!CaptivePostDataToUserNameAndPassword(v16, v18, &cf, (CFTypeRef *)&theString))
    {
      if (a2)
      {
        CFStringRef v23 = 0;
        int v31 = 2;
      }
      else
      {
        CFStringRef v28 = v17;
        logger = mysyslog_get_logger();
        os_log_type_t v30 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v30))
        {
          *(_WORD *)CFRunLoopTimerContext buf = 0;
          int v31 = 2;
          _os_log_impl(&dword_225F82000, logger, v30, "failed to scrape credentials", buf, 2u);
          CFStringRef v23 = 0;
        }
        else
        {
          CFStringRef v23 = 0;
          int v31 = 2;
        }
        CFStringRef v17 = v28;
      }
      goto LABEL_61;
    }
    CFStringRef v59 = v17;
    CFDictionaryRef RedirectForInterface = (const __CFDictionary *)CaptiveGetRedirectForInterface(v15);
    if (RedirectForInterface
      && (CFDictionaryRef v26 = RedirectForInterface, v27 = CFGetTypeID(RedirectForInterface), v27 == CFDictionaryGetTypeID()))
    {
      CFStringRef URLString = (const __CFString *)CFDictionaryGetValue(v26, kWISPrLoginURL[0]);
    }
    else
    {
      CFStringRef URLString = 0;
    }
    CFStringRef v17 = v59;
    CFStringRef v58 = (const __CFString *)CaptiveCopyInterfaceSSID(v15);
    if (!v58 || !URLString)
    {
LABEL_50:
      uint64_t v46 = mysyslog_get_logger();
      os_log_type_t v47 = _SC_syslog_os_log_mapping();
      BOOL v48 = os_log_type_enabled(v46, v47);
      if (URLString && v58)
      {
        if (v48)
        {
          *(_DWORD *)CFRunLoopTimerContext buf = 138412802;
          CFTypeRef v64 = URLString;
          __int16 v65 = 2080;
          CFTypeRef v66 = a4;
          __int16 v67 = 2112;
          CFTypeRef v68 = cf;
          CFDictionaryRef v49 = "login URL %@ does not match post url %s, not storing credentials for %@";
          os_log_type_t v50 = v46;
          os_log_type_t v51 = v47;
          uint32_t v52 = 32;
LABEL_56:
          _os_log_impl(&dword_225F82000, v50, v51, v49, buf, v52);
        }
      }
      else if (v48)
      {
        *(_DWORD *)CFRunLoopTimerContext buf = 136315394;
        CFTypeRef v64 = a3;
        __int16 v65 = 2112;
        CFTypeRef v66 = cf;
        CFDictionaryRef v49 = "Couldn't determine login URL or ssid for %s, not storing credentials for %@";
        os_log_type_t v50 = v46;
        os_log_type_t v51 = v47;
        uint32_t v52 = 22;
        goto LABEL_56;
      }
      if (a2) {
        int v31 = 0;
      }
      else {
        int v31 = 3;
      }
      CFStringRef v23 = v58;
LABEL_61:
      *a7 = v31;
LABEL_62:
      CFRelease(v16);
      CFStringRef v24 = v23;
LABEL_63:
      if (v15) {
        CFRelease(v15);
      }
      if (v17) {
        CFRelease(v17);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      if (theString)
      {
        CFRelease(theString);
        CFStringRef theString = 0;
      }
      if (v24) {
        CFRelease(v24);
      }
      if (v19) {
        CFRelease(v19);
      }
      return 0;
    }
    CFURLRef v32 = CFURLCreateWithString(v14, URLString, 0);
    CFURLRef v33 = CFURLCreateWithString(v14, v59, 0);
    CFURLRef v34 = v32;
    CFURLRef v35 = v33;
    if (v34 && v33)
    {
      CFURLRef v36 = v34;
      CFStringRef theString2 = CFURLCopyHostName(v34);
      CFStringRef v37 = CFURLCopyHostName(v35);
      CFURLRef v34 = v36;
    }
    else
    {
      CFStringRef v37 = 0;
      CFStringRef theString2 = 0;
      CFStringRef v38 = 0;
      CFStringRef v39 = 0;
      if (!v34) {
        goto LABEL_36;
      }
    }
    CFStringRef v40 = v37;
    CFRelease(v34);
    CFStringRef v38 = v40;
    CFStringRef v39 = theString2;
LABEL_36:
    CFStringRef theString2a = v38;
    if (v35)
    {
      CFRelease(v35);
      CFStringRef v38 = theString2a;
    }
    if (v39 && v38)
    {
      BOOL v41 = CFStringCompare(v39, v38, 1uLL) == kCFCompareEqualTo;
    }
    else
    {
      BOOL v41 = 0;
      BOOL v42 = 0;
      if (!v39) {
        goto LABEL_43;
      }
    }
    BOOL v42 = v41;
    CFRelease(v39);
LABEL_43:
    if (theString2a) {
      CFRelease(theString2a);
    }
    CFStringRef v17 = v59;
    if (v42)
    {
      if (a2)
      {
        os_log_type_t v54 = mysyslog_get_logger();
        os_log_type_t v55 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v54, v55))
        {
          *(_DWORD *)CFRunLoopTimerContext buf = 138412290;
          CFTypeRef v64 = cf;
          _os_log_impl(&dword_225F82000, v54, v55, "Parsed credentails for user %@. Hostnames match, would store.", buf, 0xCu);
        }
        int v31 = 0;
        CFStringRef v23 = v58;
        CFStringRef v17 = v59;
      }
      else
      {
        CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v14, theString, 0x8000100u, 0);
        os_log_type_t v44 = mysyslog_get_logger();
        os_log_type_t v45 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v44, v45))
        {
          *(_DWORD *)CFRunLoopTimerContext buf = 138412290;
          CFTypeRef v64 = cf;
          _os_log_impl(&dword_225F82000, v44, v45, "storing credentials for user %@", buf, 0xCu);
        }
        CFStringRef v23 = v58;
        CNAccountsAddInternal((const __CFString *)cf, ExternalRepresentation, v58, URLString, 1, 1);
        int v31 = 0;
        CFStringRef v17 = v59;
      }
      goto LABEL_61;
    }
    goto LABEL_50;
  }
  return 0;
}

uint64_t CNSServerLogoff(uint64_t a1, int a2, const char *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (CaptiveIsActive())
  {
    CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, 0x8000100u);
    logger = mysyslog_get_logger();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v7))
    {
      int v13 = 136315138;
      CFAllocatorRef v14 = a3;
      _os_log_impl(&dword_225F82000, logger, v7, "logging out of %s", (uint8_t *)&v13, 0xCu);
    }
    if (v5)
    {
      uint64_t AuthReplyForInterface = CaptiveGetAuthReplyForInterface(v5);
      if (AuthReplyForInterface)
      {
        CFDictionaryRef v9 = (const __CFDictionary *)AuthReplyForInterface;
        os_log_type_t v10 = malloc_type_malloc(0x10uLL, 0x10800407411B482uLL);
        *(_DWORD *)os_log_type_t v10 = a2;
        CFRunLoopRef Current = CFRunLoopGetCurrent();
        v10[1] = captive_agent_logout(v9, v5, (uint64_t)Current, (uint64_t)CNSLogoutComplete, (uint64_t)v10);
        CFRelease(v5);
        if (!v10[1]) {
          free(v10);
        }
      }
      else
      {
        CFRelease(v5);
      }
    }
  }
  return 0;
}

void CNSLogoutComplete(mach_port_t *a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    int v9 = 67109120;
    int v10 = a2;
    _os_log_impl(&dword_225F82000, logger, v5, "logout complete: %d", (uint8_t *)&v9, 8u);
  }
  if (a2 == 150)
  {
    int v6 = 0;
  }
  else
  {
    os_log_type_t v7 = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      int v9 = 67109120;
      int v10 = a2;
      _os_log_impl(&dword_225F82000, v7, v8, "unexpected result %d", (uint8_t *)&v9, 8u);
    }
    int v6 = 5;
  }
  LogoffReply(*a1, v6);
  free(a1);
}

uint64_t CNSServerForgetNetwork(int a1, const UInt8 *a2, CFIndex length)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v4 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, length);
  if (!v4) {
    return 5;
  }
  CFDataRef v5 = v4;
  CFStringRef v6 = CFStringCreateFromExternalRepresentation(v3, v4, 0x8000100u);
  if (v6)
  {
    CFStringRef v7 = v6;
    logger = mysyslog_get_logger();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v9))
    {
      int v11 = 138412290;
      CFStringRef v12 = v7;
      _os_log_impl(&dword_225F82000, logger, v9, "Forgetting SSID '%@'", (uint8_t *)&v11, 0xCu);
    }
    CNAccountsPurgeSSID(v7);
    CNPluginHandlerForgetSSID();
    CFRelease(v7);
  }
  CFRelease(v5);
  return 0;
}

uint64_t CNSServerPurgeAccountRecord(int a1, const UInt8 *a2, CFIndex length)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t result = 5;
  if (a2 && length)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, length);
    if (v5)
    {
      CFDataRef v6 = v5;
      CFStringRef v7 = CFStringCreateFromExternalRepresentation(v4, v5, 0x8000100u);
      if (v7)
      {
        CFStringRef v8 = v7;
        logger = mysyslog_get_logger();
        os_log_type_t v10 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v10))
        {
          int v11 = 138412290;
          CFStringRef v12 = v8;
          _os_log_impl(&dword_225F82000, logger, v10, "Purging account record for SSID [%@]", (uint8_t *)&v11, 0xCu);
        }
        CNAccountsPurgeSSID(v8);
        CFRelease(v8);
      }
      CFRelease(v6);
      return 0;
    }
    else
    {
      return 5;
    }
  }
  return result;
}

uint64_t CNSServerDumpState()
{
  if (CaptiveIsActive()) {
    CaptiveDumpStates();
  }
  return 0;
}

uint64_t CNSServerUserInteractionIsRequired(uint64_t a1, int *a2, _DWORD *a3, _OWORD *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!CaptiveIsActive()) {
    goto LABEL_7;
  }
  long long v7 = a4[1];
  v15[0] = *a4;
  v15[1] = v7;
  if (!audit_token_has_BOOLean_entitlement(v15, @"com.apple.captive.private"))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v13 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v13))
    {
      LODWORD(v15[0]) = 136315138;
      *(void *)((char *)v15 + 4) = "com.apple.captive.private";
      _os_log_impl(&dword_225F82000, logger, v13, "calling procss does not have [%s] entitlement", (uint8_t *)v15, 0xCu);
    }
    int v11 = 1;
    goto LABEL_11;
  }
  CFStringRef v8 = CNPluginHandlerCopyInterfaceList();
  if (!v8 || (CFArrayRef v9 = v8, CFArrayGetCount(v8) < 1) || (ValueAtIndex = CFArrayGetValueAtIndex(v9, 0)) == 0)
  {
LABEL_7:
    int v11 = 6;
LABEL_11:
    *a2 = v11;
    return 0;
  }
  *a2 = 0;
  *a3 = CaptiveIsUIRequired(ValueAtIndex);
  CFRelease(v9);
  return 0;
}

uint64_t CNSServerCopySupportedInterfaces(uint64_t a1, vm_offset_t *a2, mach_msg_type_number_t *a3, _DWORD *a4)
{
  *a2 = 0;
  *a3 = 0;
  if (CaptiveIsActive())
  {
    *a4 = 1;
    long long v7 = CNPluginHandlerCopyInterfaceList();
    if (v7)
    {
      CFStringRef v8 = v7;
      *a4 = 0;
      MIGSerialize(v7, a2, a3);
      CFRelease(v8);
    }
  }
  else
  {
    *a4 = 6;
  }
  return 0;
}

uint64_t CNSServerCopyCurrentNetworkInfo(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5, _DWORD *a6)
{
  *a6 = 0;
  *a4 = 0;
  *a5 = 0;
  return 0;
}

uint64_t CNSServerAuthenticateUsing(uint64_t a1, const char *a2, const char *a3, int *a4, int a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (CaptiveIsActive())
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x8000100u);
    CFStringRef v11 = CFStringCreateWithCString(v9, a3, 0x8000100u);
    CFStringRef v12 = v11;
    *a4 = 12;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (!v10)
      {
        if (!v11) {
          return 0;
        }
        goto LABEL_17;
      }
    }
    else
    {
      logger = mysyslog_get_logger();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v15))
      {
        int v22 = 138412546;
        CFStringRef v23 = v12;
        __int16 v24 = 2112;
        CFStringRef v25 = v10;
        _os_log_impl(&dword_225F82000, logger, v15, "Authenticating using %@ on %@", (uint8_t *)&v22, 0x16u);
      }
      int v17 = CaptiveAuthenticateUsing(v10, v12, a5);
      *a4 = v17;
      if (v17)
      {
        CFStringRef v18 = mysyslog_get_logger();
        os_log_type_t v19 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v18, v19))
        {
          int v20 = *a4;
          int v22 = 67109120;
          LODWORD(v23) = v20;
          _os_log_impl(&dword_225F82000, v18, v19, "AuthenticateUsing failed: %d", (uint8_t *)&v22, 8u);
        }
      }
    }
    CFRelease(v10);
    if (v12) {
LABEL_17:
    }
      CFRelease(v12);
  }
  else
  {
    *a4 = 6;
  }
  return 0;
}

uint64_t CNSServerAuthenticateUsingToken(uint64_t a1, const char *a2, const UInt8 *a3, unsigned int a4, int *a5, int a6, _OWORD *a7)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!CaptiveIsActive())
  {
    int v20 = 6;
LABEL_17:
    *a5 = v20;
    return 0;
  }
  long long v13 = a7[1];
  *(_OWORD *)int v31 = *a7;
  *(_OWORD *)&v31[16] = v13;
  if (!audit_token_has_BOOLean_entitlement(v31, @"com.apple.captive.private"))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v22 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v22))
    {
      *(_DWORD *)int v31 = 136315138;
      *(void *)&v31[4] = "com.apple.captive.private";
      _os_log_impl(&dword_225F82000, logger, v22, "calling procss does not have [%s] entitlement", v31, 0xCu);
    }
    int v20 = 1;
    goto LABEL_17;
  }
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v15 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x8000100u);
  CFDataRef v16 = CFDataCreate(v14, a3, a4);
  CFStringRef v17 = CFStringCreateFromExternalRepresentation(v14, v16, 0x8000100u);
  CFStringRef v18 = v17;
  *a5 = 12;
  if (v15) {
    BOOL v19 = v17 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    if (!v15)
    {
      if (!v16) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    __int16 v24 = mysyslog_get_logger();
    os_log_type_t v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)int v31 = 138412546;
      *(void *)&v31[4] = v18;
      *(_WORD *)&v31[12] = 2112;
      *(void *)&v31[14] = v15;
      _os_log_impl(&dword_225F82000, v24, v25, "Token Authentication using %@ on %@", v31, 0x16u);
    }
    int v27 = CaptiveAuthenticateUsingToken(v15, v18, a6);
    *a5 = v27;
    if (v27)
    {
      CFStringRef v28 = mysyslog_get_logger();
      os_log_type_t v29 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v28, v29))
      {
        int v30 = *a5;
        *(_DWORD *)int v31 = 67109120;
        *(_DWORD *)&v31[4] = v30;
        _os_log_impl(&dword_225F82000, v28, v29, "CaptiveAuthenticateUsingToken failed: %d", v31, 8u);
      }
    }
  }
  CFRelease(v15);
  if (v16) {
LABEL_10:
  }
    CFRelease(v16);
LABEL_11:
  if (v18) {
    CFRelease(v18);
  }
  return 0;
}

uint64_t CNSServerCopyAccountList(uint64_t a1, vm_offset_t *a2, mach_msg_type_number_t *a3, _DWORD *a4)
{
  *a2 = 0;
  *a3 = 0;
  if (CaptiveIsActive())
  {
    CFMutableArrayRef v7 = CNAccountsCopyMatching(0, 0);
    if (v7)
    {
      CFMutableArrayRef v8 = v7;
      MIGSerialize(v7, a2, a3);
      CFRelease(v8);
    }
  }
  else
  {
    *a4 = 6;
  }
  return 0;
}

uint64_t CNSServerAddAccount(uint64_t a1, const char *a2, const UInt8 *a3, unsigned int a4, const char *a5, const char *a6, int a7, int *a8, _OWORD *a9)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!CaptiveIsActive())
  {
    uint64_t result = 0;
    int v22 = 6;
LABEL_12:
    *a8 = v22;
    return result;
  }
  long long v16 = a9[1];
  v27[0] = *a9;
  v27[1] = v16;
  if (!audit_token_has_BOOLean_entitlement(v27, @"com.apple.captive.private"))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v24))
    {
      LODWORD(v27[0]) = 136315138;
      *(void *)((char *)v27 + 4) = "com.apple.captive.private";
      _os_log_impl(&dword_225F82000, logger, v24, "calling procss does not have [%s] entitlement", (uint8_t *)v27, 0xCu);
    }
    uint64_t result = 0;
    int v22 = 1;
    goto LABEL_12;
  }
  uint64_t result = 5;
  if (a3 && a4)
  {
    CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v19 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, a4);
    if (v19)
    {
      CFDataRef v20 = v19;
      if (*a2) {
        CFStringRef v21 = CFStringCreateWithCString(v18, a2, 0x8000100u);
      }
      else {
        CFStringRef v21 = 0;
      }
      if (*a5) {
        CFStringRef v25 = CFStringCreateWithCString(v18, a5, 0x8000100u);
      }
      else {
        CFStringRef v25 = 0;
      }
      if (*a6) {
        CFStringRef v26 = CFStringCreateWithCString(v18, a6, 0x8000100u);
      }
      else {
        CFStringRef v26 = 0;
      }
      CNAccountsAddInternal(v21, v20, v25, v26, a7, 0);
      *a8 = 0;
      if (v21) {
        CFRelease(v21);
      }
      CFRelease(v20);
      if (v25) {
        CFRelease(v25);
      }
      if (v26) {
        CFRelease(v26);
      }
      return 0;
    }
    else
    {
      return 5;
    }
  }
  return result;
}

uint64_t CNSServerResolveAccount(uint64_t a1, uint64_t a2, int *a3)
{
  if (CaptiveIsActive()) {
    int v4 = -1;
  }
  else {
    int v4 = 6;
  }
  *a3 = v4;
  return 0;
}

uint64_t CNSServerCopyLandingPageURL(uint64_t a1, void *a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  LandingPageURL = (const void *)CNPluginHandlerGetLandingPageURL(a4);
  if (LandingPageURL) {
    LandingPageURL = my_CFPropertyListCreateVMData(LandingPageURL, a3);
  }
  else {
    *a3 = 0;
  }
  *a2 = LandingPageURL;
  *a5 = 2 * (LandingPageURL == 0);
  return 0;
}

BOOL CNSRegisterServer()
{
  kern_return_t v0;
  NSObject *logger;
  os_log_type_t v2;
  mach_port_t sp;
  uint8_t buf[4];
  kern_return_t v6;
  uint64_t v7;

  CFMutableArrayRef v7 = *MEMORY[0x263EF8340];
  sp = 0;
  CNSRegisterServer_sCaptiveNetworkServerParameters = (uint64_t)CNSServer_server;
  dword_26ABEB490 = dword_26D9AAAC0;
  int v0 = bootstrap_check_in(*MEMORY[0x263EF87F0], "com.apple.networking.captivenetworksupport", &sp);
  if (v0)
  {
    logger = mysyslog_get_logger();
    CFNumberRef v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      *(_DWORD *)CFRunLoopTimerContext buf = 67109120;
      CFDataRef v6 = v0;
      _os_log_impl(&dword_225F82000, logger, v2, "bootstrap_check_in failed: 0x%x", buf, 8u);
    }
  }
  else
  {
    notify_post("com.apple.networking.captivenetworksupport.startserver");
    gServerMachPort = _SC_CFMachPortCreateWithPort();
  }
  return v0 == 0;
}

void CNSStartServer()
{
  if (gServerMachPort)
  {
    RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFMachPortRef)gServerMachPort, 0);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    if (RunLoopSource)
    {
      CFRelease(RunLoopSource);
    }
  }
}

void CNSShutdownServer()
{
  if (gServerMachPort)
  {
    CFMachPortInvalidate((CFMachPortRef)gServerMachPort);
    if (gServerMachPort)
    {
      CFRelease((CFTypeRef)gServerMachPort);
      gServerMachPort = 0;
    }
  }
}

void MachServerCallback(uint64_t a1, mach_msg_header_t *a2, uint64_t a3, uint64_t a4)
{
  CFDataRef v6 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], *(unsigned int *)(a4 + 8), 0);
  (*(void (**)(mach_msg_header_t *, mach_msg_header_t *))a4)(a2, v6);
  if ((v6->msgh_bits & 0x80000000) == 0)
  {
    mach_port_t msgh_remote_port = v6[1].msgh_remote_port;
    if (msgh_remote_port == -305) {
      goto LABEL_11;
    }
    if (msgh_remote_port)
    {
      a2->mach_port_t msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
  }
  if (v6->msgh_remote_port)
  {
    if ((v6->msgh_bits & 0x1F) == 0x12) {
      mach_msg_option_t v8 = 17;
    }
    else {
      mach_msg_option_t v8 = 1;
    }
    if ((mach_msg(v6, v8, v6->msgh_size, 0, 0, 0, 0) - 268435459) > 1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ((v6->msgh_bits & 0x80000000) != 0) {
LABEL_10:
  }
    mach_msg_destroy(v6);
LABEL_11:

  CFAllocatorDeallocate(0, v6);
}

CFTypeRef MIGCFPropertyListCreateBinaryData(CFAllocatorRef bufferAllocator, const void *a2)
{
  CFAllocatorRef v3 = CFWriteStreamCreateWithAllocatedBuffers(bufferAllocator, bufferAllocator);
  if (!v3) {
    return 0;
  }
  int v4 = v3;
  if (CFWriteStreamOpen(v3))
  {
    CFPropertyListWrite(a2, v4, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFWriteStreamClose(v4);
    CFTypeRef v5 = CFWriteStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x263EFFE98]);
  }
  else
  {
    CFTypeRef v5 = 0;
  }
  CFRelease(v4);
  return v5;
}

CFPropertyListRef MIGUnserializeAndVMDealloc(UInt8 *bytes, CFIndex length)
{
  CFPropertyListRef v2 = 0;
  if (bytes && length)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v5 = length;
    CFDataRef v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    if (v6)
    {
      CFDataRef v7 = v6;
      CFPropertyListRef v2 = CFPropertyListCreateWithData(v4, v6, 0, 0, 0);
      CFRelease(v7);
    }
    else
    {
      CFPropertyListRef v2 = 0;
    }
    MEMORY[0x22A643670](*MEMORY[0x263EF8960], bytes, v5);
  }
  return v2;
}

CFDataRef MIGSerialize(const void *a1, vm_offset_t *a2, mach_msg_type_number_t *a3)
{
  kern_return_t v9;
  mach_msg_type_number_t dataCnt;

  CFDataRef result = (const __CFData *)MIGCFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x263EFFB08], a1);
  if (result)
  {
    CFDataRef v6 = result;
    dataCnt = 0;
    *a3 = CFDataGetLength(result);
    vm_map_read_t v7 = *MEMORY[0x263EF8960];
    BytePtr = CFDataGetBytePtr(v6);
    CFAllocatorRef v9 = vm_read(v7, (vm_address_t)BytePtr, *a3, a2, &dataCnt);
    CFRelease(v6);
    CFDataRef result = (const __CFData *)(v9 == 0);
    if (v9) {
      *a2 = 0;
    }
    *a3 = dataCnt;
  }
  return result;
}

uint64_t _AMLaunchApplicationWithIdentifier(uint64_t a1, int a2)
{
  v28[1] = *MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (void *)MEMORY[0x22A643350]();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  id v6 = objc_alloc_init(MEMORY[0x263F3F790]);
  vm_map_read_t v7 = (void *)MEMORY[0x263F3F778];
  if (a2) {
    uint64_t v8 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v8 = MEMORY[0x263EFFA80];
  }
  uint64_t v27 = *MEMORY[0x263F3F598];
  v28[0] = v8;
  CFAllocatorRef v9 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
  CFStringRef v10 = [v7 optionsWithDictionary:v9];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = ___AMLaunchApplicationWithIdentifier_block_invoke;
  v17[3] = &unk_264784D48;
  CFDataRef v19 = &v21;
  uint64_t v20 = a1;
  CFStringRef v11 = v5;
  CFAllocatorRef v18 = v11;
  [v6 openApplication:a1 withOptions:v10 completion:v17];
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    long long v13 = mysyslog_get_logger();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)CFRunLoopTimerContext buf = 138412290;
      uint64_t v26 = a1;
      _os_log_impl(&dword_225F82000, v13, v14, "application [%@] launch timed out", buf, 0xCu);
    }

    uint64_t v15 = 3;
    *((_DWORD *)v22 + 6) = 3;
  }
  else
  {
    uint64_t v15 = *((unsigned int *)v22 + 6);
  }

  _Block_object_dispose(&v21, 8);
  return v15;
}

void sub_225F91434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AMCopyDisplayIdentifierForProcessID(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFPropertyListRef v2 = (void *)MEMORY[0x22A643350]();
  CFAllocatorRef v3 = [MEMORY[0x263F64580] identifierWithPid:a1];
  CFAllocatorRef v4 = [MEMORY[0x263F64570] handleForIdentifier:v3 error:0];
  if (v4)
  {
    dispatch_semaphore_t v5 = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    vm_map_read_t v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      uint64_t v8 = [v4 bundle];
      CFAllocatorRef v9 = [v8 identifier];
      int v13 = 138412546;
      os_log_type_t v14 = v9;
      __int16 v15 = 1024;
      int v16 = a1;
      _os_log_impl(&dword_225F82000, v7, v6, "found application bundle identifier [%@] for pid %d", (uint8_t *)&v13, 0x12u);
    }
    CFStringRef v10 = [v4 bundle];
    uint64_t v11 = [v10 identifier];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id _AMCreateProcessAssertionForPID(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  CFPropertyListRef v2 = (void *)MEMORY[0x22A643350]();
  id v3 = objc_alloc(MEMORY[0x263F64408]);
  CFAllocatorRef v4 = [MEMORY[0x263F64630] targetWithPid:a1];
  dispatch_semaphore_t v5 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.CaptiveNetworkSupport" name:@"HotspotHelper"];
  v16[0] = v5;
  os_log_type_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  vm_map_read_t v7 = (void *)[v3 initWithExplanation:@"HotspotHelper" target:v4 attributes:v6];

  if (v7 && [v7 acquireWithError:0])
  {
    uint64_t v8 = mysyslog_get_logger();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      int v14 = 67109120;
      int v15 = a1;
      _os_log_impl(&dword_225F82000, v8, v9, "acquired assertion for pid %d", (uint8_t *)&v14, 8u);
    }

    id v10 = v7;
  }
  else
  {
    uint64_t v11 = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      int v14 = 67109120;
      int v15 = a1;
      _os_log_impl(&dword_225F82000, v11, v12, "failed to acquire assertion for pid %d", (uint8_t *)&v14, 8u);
    }

    id v10 = 0;
  }

  return v10;
}

void _AMInvalidateProcessAssertion(void *a1)
{
  CFPropertyListRef v2 = (void *)MEMORY[0x22A643350]();
  id v3 = a1;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFAllocatorRef v4 = mysyslog_get_logger();
      os_log_type_t v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v4, v5))
      {
        *(_WORD *)os_log_type_t v6 = 0;
        _os_log_impl(&dword_225F82000, v4, v5, "invalidated assertion", v6, 2u);
      }

      [v3 invalidate];
    }
  }
}

void *_AMCopyBackgroundModesForPID(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFPropertyListRef v2 = (void *)MEMORY[0x22A643350]();
  id v3 = [MEMORY[0x263F64580] identifierWithPid:a1];
  if (v3)
  {
    CFAllocatorRef v4 = [MEMORY[0x263F64570] handleForIdentifier:v3 error:0];
    os_log_type_t v5 = v4;
    if (v4)
    {
      os_log_type_t v6 = [v4 bundle];

      if (v6)
      {
        vm_map_read_t v7 = [v5 bundle];
        uint64_t v8 = [v7 bundleInfoValueForKey:kUIBackgroundModes];

        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            os_log_type_t v9 = mysyslog_get_logger();
            os_log_type_t v10 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v9, v10))
            {
              int v13 = 67109378;
              int v14 = a1;
              __int16 v15 = 2112;
              int v16 = v8;
              _os_log_impl(&dword_225F82000, v9, v10, "background modes for pid %d : %@", (uint8_t *)&v13, 0x12u);
            }
            goto LABEL_13;
          }
        }
      }
    }
  }
  else
  {
    os_log_type_t v5 = 0;
  }
  os_log_type_t v9 = mysyslog_get_logger();
  os_log_type_t v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v11))
  {
    int v13 = 67109120;
    int v14 = a1;
    _os_log_impl(&dword_225F82000, v9, v11, "failed to find background modes for pid %d", (uint8_t *)&v13, 8u);
  }
  uint64_t v8 = 0;
LABEL_13:

  return v8;
}

void *_AMCopyLocalizedApplicationNameForDisplayIdentifier(uint64_t a1)
{
  CFPropertyListRef v2 = (void *)MEMORY[0x22A643350]();
  id v3 = [MEMORY[0x263F01868] applicationProxyForIdentifier:a1];
  CFAllocatorRef v4 = [v3 localizedNameForContext:0];

  if (v4) {
    id v5 = v4;
  }

  return v4;
}

uint64_t _AMCopyApplicationDisplayIdentifiers()
{
  int v0 = (void *)MEMORY[0x22A643350]();
  uint64_t v5 = 0;
  os_log_type_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFMutableArrayRef Mutable = 0;
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  os_log_type_t v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = ___AMCopyApplicationDisplayIdentifiers_block_invoke;
  v4[3] = &unk_264784D70;
  v4[4] = &v5;
  [v1 enumerateBundlesOfType:1 block:v4];
  uint64_t v2 = v6[3];

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_225F91DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AMIsDeviceActivated()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v0 = (void *)MEMORY[0x22A643350]();
  os_log_type_t v1 = (void *)MAEGetActivationStateWithError();
  id v2 = 0;
  if (v2)
  {
    id v3 = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)CFRunLoopTimerContext buf = 138412290;
      id v8 = v2;
      _os_log_impl(&dword_225F82000, v3, v4, "MAEGetActivationStateWithError failed, error: %@", buf, 0xCu);
    }
  }
  int v5 = [v1 isEqualToString:*MEMORY[0x263F55850]];

  return v5 ^ 1u;
}

uint64_t _AMIsDeviceSetupCompleted()
{
  int v0 = (void *)MEMORY[0x22A643350]();
  uint64_t v1 = BYSetupAssistantNeedsToRun() ^ 1;
  return v1;
}

uint64_t PassiveDetectSetCallBack(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = (_OWORD *)passiveDetect;
  if (!passiveDetect)
  {
    os_log_type_t v4 = malloc_type_malloc(0x40uLL, 0x10E0040913719CAuLL);
    passiveDetect = (uint64_t)v4;
    _OWORD *v4 = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    *((unsigned char *)v4 + 36) = 1;
    if (a1) {
      goto LABEL_4;
    }
LABEL_9:
    if (*((void *)v4 + 6))
    {
      PassiveDetectClearInfo(0);
      CaptiveSymptomEnablePassiveDetection(0, 0);
      logger = mysyslog_get_logger();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v11))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_225F82000, logger, v11, "Captive passive detection DISABLED", (uint8_t *)&v13, 2u);
      }
    }
    return 1;
  }
  if (!*(unsigned char *)(passiveDetect + 36)) {
    return 0;
  }
  if (!a1) {
    goto LABEL_9;
  }
LABEL_4:
  if (*((void *)v4 + 2)) {
    return 1;
  }
  *(void *)(passiveDetect + 16) = my_CFRunLoopSourceCreateForBSDNotification("com.apple.symptoms.managed_events.captive-network", (uint64_t)handleNotification, 0, (_DWORD *)v4 + 2, (__CFMachPort **)v4);
  int v5 = mysyslog_get_logger();
  os_log_type_t v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(passiveDetect + 40);
    int v13 = 138412290;
    uint64_t v14 = v7;
    _os_log_impl(&dword_225F82000, v5, v6, "Captive passive detection ENABLED (hostname %@)", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v8 = passiveDetect;
  *(void *)(passiveDetect + 48) = a1;
  *(void *)(v8 + 56) = a2;
  uint64_t v9 = 1;
  *(unsigned char *)(v8 + 37) = 1;
  CaptiveSymptomEnablePassiveDetection(1, *(void *)(v8 + 40));
  return v9;
}

void PassiveDetectClearInfo(int a1)
{
  uint64_t v2 = passiveDetect;
  *(void *)(passiveDetect + 48) = 0;
  *(void *)(v2 + 56) = 0;
  if (*(void *)v2)
  {
    CFMachPortInvalidate(*(CFMachPortRef *)v2);
    uint64_t v2 = passiveDetect;
    if (passiveDetect)
    {
      if (*(void *)passiveDetect)
      {
        CFRelease(*(CFTypeRef *)passiveDetect);
        *(void *)uint64_t v2 = 0;
        uint64_t v2 = passiveDetect;
      }
    }
  }
  id v3 = *(__CFRunLoopSource **)(v2 + 16);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    uint64_t v2 = passiveDetect;
    os_log_type_t v4 = *(const void **)(passiveDetect + 16);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(v2 + 16) = 0;
      uint64_t v2 = passiveDetect;
    }
  }
  if (*(_DWORD *)(v2 + 8))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_225F82000, logger, v6, "Disabling passive detection", v7, 2u);
    }
    notify_cancel(*(_DWORD *)(passiveDetect + 8));
    uint64_t v2 = passiveDetect;
    *(_DWORD *)(passiveDetect + 8) = 0;
  }
  if (a1)
  {
    *(_DWORD *)(v2 + 32) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 37) = 0;
    PassiveDetectSetRedirectURLHostname(0);
  }
}

void handleNotification()
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v1 = passiveDetect;
  if (*(double *)(passiveDetect + 24) + 60.0 > Current)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_225F82000, logger, v4, "Passive notification ignored (too soon)", v5, 2u);
    }
  }
  else
  {
    uint64_t state64 = 0;
    int v2 = *(_DWORD *)(passiveDetect + 8);
    if (v2)
    {
      notify_get_state(v2, &state64);
      CFRunLoopGetCurrent();
      CaptiveSymptomScheduleEventFetch(state64, &__block_literal_global_0);
      uint64_t v1 = passiveDetect;
    }
    *(double *)(v1 + 24) = Current;
    (*(void (**)(void))(v1 + 48))(*(void *)(v1 + 56));
  }
}

void PassiveDetectReportNotCaptive()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v0 = (void *)passiveDetect;
  if (passiveDetect)
  {
    if (!*(unsigned char *)(passiveDetect + 36)) {
      return;
    }
  }
  else
  {
    int v0 = malloc_type_malloc(0x40uLL, 0x10E0040913719CAuLL);
    passiveDetect = (uint64_t)v0;
    *(_OWORD *)int v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
    *((_OWORD *)v0 + 2) = 0u;
    *((_OWORD *)v0 + 3) = 0u;
    *((unsigned char *)v0 + 36) = 1;
  }
  if (*((unsigned char *)v0 + 37))
  {
    ++*((_DWORD *)v0 + 8);
    uint64_t state64 = 0;
    notify_get_state(*((_DWORD *)v0 + 2), &state64);
    CaptiveSymptomReportCaptiveState();
    int v1 = *(_DWORD *)(passiveDetect + 32);
    logger = mysyslog_get_logger();
    if (v1 < 3)
    {
      os_log_type_t v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v4))
      {
        int v5 = *(_DWORD *)(passiveDetect + 32);
        *(_DWORD *)CFRunLoopTimerContext buf = 67109376;
        int v8 = v5;
        __int16 v9 = 1024;
        int v10 = 2;
        _os_log_impl(&dword_225F82000, logger, v4, "Reporting False Positive: %d (of %d)", buf, 0xEu);
      }
    }
    else
    {
      os_log_type_t v3 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v3))
      {
        *(_WORD *)CFRunLoopTimerContext buf = 0;
        _os_log_impl(&dword_225F82000, logger, v3, "Exceeded threshold for false positive.", buf, 2u);
      }
      PassiveDetectSetCallBack(0, 0);
      *(unsigned char *)(passiveDetect + 36) = 0;
    }
  }
}

void PassiveDetectNewNetwork()
{
  int v0 = (_OWORD *)passiveDetect;
  if (!passiveDetect)
  {
    int v0 = malloc_type_malloc(0x40uLL, 0x10E0040913719CAuLL);
    passiveDetect = (uint64_t)v0;
    _OWORD *v0 = 0u;
    v0[1] = 0u;
    v0[2] = 0u;
    v0[3] = 0u;
    *((unsigned char *)v0 + 36) = 1;
  }
  *((unsigned char *)v0 + 36) = 1;

  PassiveDetectClearInfo(1);
}

void PassiveDetectSetRedirectURLHostname(CFTypeRef cf)
{
  int v2 = (char *)passiveDetect;
  if (!passiveDetect)
  {
    int v2 = (char *)malloc_type_malloc(0x40uLL, 0x10E0040913719CAuLL);
    passiveDetect = (uint64_t)v2;
    *(_OWORD *)int v2 = 0u;
    *((_OWORD *)v2 + 1) = 0u;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    v2[36] = 1;
  }
  os_log_type_t v3 = (const void **)(v2 + 40);

  my_FieldSetRetainedCFType(v3, cf);
}

void __PassiveDetectReportNotificationInfo_block_invoke(int a1, int a2, int a3, CFDictionaryRef theDict)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    if (theDict)
    {
      CFBooleanRef Value = CFDictionaryGetValue(theDict, @"bundle_details");
      CFTypeID TypeID = CFStringGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == TypeID)
        {
          logger = mysyslog_get_logger();
          os_log_type_t v7 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v7))
          {
            int v8 = 138412290;
            __int16 v9 = Value;
            _os_log_impl(&dword_225F82000, logger, v7, "App [%@] triggered passive symptom", (uint8_t *)&v8, 0xCu);
          }
        }
      }
    }
  }
}

BOOL UIAllowed()
{
  return !S_wifi_suppressed
      && (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
}

void UIAllowedRegisterForCallbacks(uint64_t (*a1)(void))
{
  S_callback = a1;
  double Current = CFRunLoopGetCurrent();
  int v2 = NotifyRegister(Current, "com.apple.airport.userNotification", (uint64_t)UIAllowedNetworkingAppNotify, 0);
  os_log_type_t v3 = CFRunLoopGetCurrent();
  os_log_type_t v4 = NotifyRegister(v3, "com.apple.airportsettingsvisible", (uint64_t)UIAllowedWiFiSettingsNotify, 0);
  UIAllowedNetworkingAppCheck((uint64_t)v2);

  UIAllowedWiFiSettingsCheck((uint64_t)v4);
}

void UIAllowedWiFiSettingsNotify(uint64_t a1, uint64_t a2)
{
  if (S_wifi_suppressed) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
  }
  UIAllowedWiFiSettingsCheck(a2);

  UIAllowedInvokeCallback(v2);
}

void UIAllowedWiFiSettingsCheck(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  int v1 = a1 && NotifyGet(a1, &v5) && v5 != 0;
  if (S_wifi_settings_in_foreground != v1)
  {
    S_wifi_settings_in_foreground = v1;
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      os_log_type_t v4 = "";
      if (!S_wifi_settings_in_foreground) {
        os_log_type_t v4 = "not ";
      }
      *(_DWORD *)CFRunLoopTimerContext buf = 136315394;
      os_log_type_t v7 = "UIAllowedWiFiSettingsCheck";
      __int16 v8 = 2080;
      __int16 v9 = v4;
      _os_log_impl(&dword_225F82000, logger, v3, "%s: Wi-Fi Settings %sin foreground", buf, 0x16u);
    }
  }
}

void UIAllowedNewInterface(void (__cdecl *a1)(const void *))
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (S_interface)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v3)) {
      return;
    }
    LODWORD(buf.version) = 136315650;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"UIAllowedNewInterface";
    WORD2(buf.info) = 2112;
    *(void **)((char *)&buf.info + 6) = (void *)SCNetworkInterfaceGetBSDName((SCNetworkInterfaceRef)S_interface);
    HIWORD(buf.retain) = 2112;
    buf.release = a1;
    os_log_type_t v4 = "%s: %@ already registered, ignoring %@";
    goto LABEL_4;
  }
  __int16 v9 = (const __SCNetworkInterface *)_SCNetworkInterfaceCreateWithBSDName();
  S_interface = (uint64_t)v9;
  if (v9)
  {
    uint64_t v10 = v9;
    buf.version = 0;
    memset(&buf.retain, 0, 24);
    buf.info = v9;
    SCDynamicStoreRef v11 = SCDynamicStoreCreate(0, @"UIAllowed", (SCDynamicStoreCallBack)UIAllowedInterfaceAdvisoryChanged, &buf);
    if (v11)
    {
      os_log_type_t v12 = v11;
      values = (void *)SCNetworkInterfaceCopyAdvisoryNotificationKey();
      CFArrayRef v13 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
      CFRelease(values);
      int v14 = SCDynamicStoreSetNotificationKeys(v12, v13, 0);
      CFRelease(v13);
      if (v14)
      {
        RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v12, 0);
        double Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
        CFRelease(RunLoopSource);
        UIAllowedWiFiSuppressedCheck(v10);
        return;
      }
      uint64_t v21 = mysyslog_get_logger();
      os_log_type_t v22 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v21, v22))
      {
        int v24 = 136315138;
        CFStringRef v25 = "UIAllowedRegisterForAdvisoryChanges";
        os_log_type_t v4 = "%s: SCDynamicStoreSetNotificationKeys failed";
        p_SCDynamicStoreContext buf = (uint8_t *)&v24;
        os_log_type_t v6 = v21;
        os_log_type_t v7 = v22;
        uint32_t v8 = 12;
        goto LABEL_5;
      }
    }
    else
    {
      CFAllocatorRef v18 = mysyslog_get_logger();
      os_log_type_t v19 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v18, v19))
      {
        int v20 = SCError();
        int v24 = 136315394;
        CFStringRef v25 = "UIAllowedRegisterForAdvisoryChanges";
        __int16 v26 = 2080;
        uint64_t v27 = SCErrorString(v20);
        os_log_type_t v4 = "%s: SCDynamicStoreCreate() failed, %s";
        p_SCDynamicStoreContext buf = (uint8_t *)&v24;
        os_log_type_t v6 = v18;
        os_log_type_t v7 = v19;
        uint32_t v8 = 22;
        goto LABEL_5;
      }
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      int v17 = SCError();
      LODWORD(buf.version) = 136315650;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"UIAllowedNewInterface";
      WORD2(buf.info) = 2112;
      *(void **)((char *)&buf.info + 6) = a1;
      HIWORD(buf.retain) = 2080;
      buf.release = (void (__cdecl *)(const void *))SCErrorString(v17);
      os_log_type_t v4 = "%s: _SCNetworkInterfaceCreateWithBSDName(%@) failed %s";
LABEL_4:
      p_SCDynamicStoreContext buf = (uint8_t *)&buf;
      os_log_type_t v6 = logger;
      os_log_type_t v7 = v3;
      uint32_t v8 = 32;
LABEL_5:
      _os_log_impl(&dword_225F82000, v6, v7, v4, p_buf, v8);
    }
  }
}

void UIAllowedInterfaceAdvisoryChanged(uint64_t a1, uint64_t a2, const __SCNetworkInterface *a3)
{
  if (S_wifi_suppressed) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
  }
  UIAllowedWiFiSuppressedCheck(a3);

  UIAllowedInvokeCallback(v3);
}

void UIAllowedWiFiSuppressedCheck(const __SCNetworkInterface *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = SCNetworkInterfaceAdvisoryIsSpecificSet() != 0;
  if (S_wifi_suppressed != v2)
  {
    S_wifi_suppressed = v2;
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      CFStringRef BSDName = SCNetworkInterfaceGetBSDName(a1);
      uint32_t v8 = "UIAllowedWiFiSuppressedCheck";
      int v7 = 136315650;
      if (S_wifi_suppressed) {
        os_log_type_t v6 = "";
      }
      else {
        os_log_type_t v6 = "not ";
      }
      __int16 v9 = 2112;
      CFStringRef v10 = BSDName;
      __int16 v11 = 2080;
      os_log_type_t v12 = v6;
      _os_log_impl(&dword_225F82000, logger, v4, "%s: Wi-Fi %@ is %ssuppressed", (uint8_t *)&v7, 0x20u);
    }
  }
}

void BBMonitorCheckPreferences()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  S_BBMProbeTimeout = CCPGetBrokenBackhaulProbeTimeout();
  S_BBMProbeInterval = CCPGetBrokenBackhaulProbeInterval();
  logger = mysyslog_get_logger();
  os_log_type_t v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    int v6 = 134217984;
    uint64_t v7 = S_BBMProbeTimeout;
    _os_log_impl(&dword_225F82000, logger, v1, "BrokenBackhaulProbeTimeout %g", (uint8_t *)&v6, 0xCu);
  }
  int v2 = mysyslog_get_logger();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v2, v3))
  {
    int v6 = 134217984;
    uint64_t v7 = S_BBMProbeInterval;
    _os_log_impl(&dword_225F82000, v2, v3, "BrokenBackhaulProbeInterval %g", (uint8_t *)&v6, 0xCu);
  }
  S_BBMPromptInterval = CCPGetBrokenBackhaulPromptInterval();
  os_log_type_t v4 = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 134217984;
    uint64_t v7 = S_BBMPromptInterval;
    _os_log_impl(&dword_225F82000, v4, v5, "BrokenBackhaulPromptInterval %g", (uint8_t *)&v6, 0xCu);
  }
}

uint64_t BBMonitorCreate(uint64_t a1, const void *a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  __int16 v11 = malloc_type_malloc(0x80uLL, 0x10E00409DCE37B5uLL);
  uint64_t v12 = (uint64_t)v11;
  *(_OWORD *)((char *)v11 + 4) = 0u;
  *(_OWORD *)((char *)v11 + 20) = 0u;
  *(_OWORD *)((char *)v11 + 36) = 0u;
  *(_OWORD *)((char *)v11 + 52) = 0u;
  *(_OWORD *)((char *)v11 + 68) = 0u;
  *(_OWORD *)((char *)v11 + 84) = 0u;
  *(_OWORD *)((char *)v11 + 100) = 0u;
  v11[7] = 0u;
  if (a4)
  {
    *((_DWORD *)v11 + 1) = 8;
    int v13 = 24;
    if ((a4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v13 = 16;
  if ((a4 & 2) != 0) {
LABEL_5:
  }
    *((_DWORD *)v11 + 1) = v13;
LABEL_6:
  *(_DWORD *)__int16 v11 = 1;
  *((void *)v11 + 1) = _SCNetworkInterfaceCopyActive();
  *(void *)(v12 + 16) = CFRetain(a2);
  int v14 = my_CFRunLoopSourceCreateForBSDNotification("com.apple.symptoms.managed_events.broken-backhaul", (uint64_t)bb_state_changed, v12, (_DWORD *)(v12 + 64), (__CFMachPort **)(v12 + 48));
  *(void *)(v12 + 56) = v14;
  *(void *)(v12 + 32) = a5;
  *(void *)(v12 + 40) = a6;
  if (!v14)
  {
    BBMonitorRelease((void *)v12);
    uint64_t v12 = 0;
  }
  *(unsigned char *)(v12 + 24) = a3;
  CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v12 + 8));
  uint64_t v16 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
  if (v16)
  {
    int v17 = (const void *)v16;
    SSID = (const void *)WiFiNetworkGetSSID();
    if (SSID)
    {
      if (CFEqual(SSID, *(CFTypeRef *)(v12 + 16)))
      {
        CFBooleanRef Property = (const __CFBoolean *)WiFiNetworkGetProperty();
        int v20 = (const void *)WiFiNetworkGetProperty();
        CFTypeID TypeID = CFBooleanGetTypeID();
        if (Property)
        {
          if (CFGetTypeID(Property) == TypeID)
          {
            CFTypeID v22 = CFDateGetTypeID();
            if (v20)
            {
              if (CFGetTypeID(v20) == v22)
              {
                *(unsigned char *)(v12 + 120) = CFBooleanGetValue(Property);
                *(double *)(v12 + 112) = MEMORY[0x22A642570](v20);
                BBMonitorLogUserChoice(v12, (uint64_t)"Loaded", (uint64_t)v20);
              }
            }
          }
        }
      }
    }
    CFRelease(v17);
  }
  return v12;
}

void bb_state_changed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void BBMonitorRelease(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    int v4 = *(_DWORD *)a1;
    int v5 = *(_DWORD *)a1 - 1;
    v9[0] = 67109376;
    v9[1] = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_225F82000, logger, v3, "BBMRelease: retain_count %d -> %d", (uint8_t *)v9, 0xEu);
  }
  int v6 = (*(_DWORD *)a1)--;
  if (v6 == 1)
  {
    BBMonitorInvalidate((uint64_t)a1);
    uint64_t v7 = (const void *)a1[1];
    if (v7)
    {
      CFRelease(v7);
      a1[1] = 0;
    }
    uint64_t v8 = (const void *)a1[2];
    if (v8) {
      CFRelease(v8);
    }
    free(a1);
  }
  else if (v6 <= 0)
  {
    abort();
  }
}

uint64_t BBMonitorInvalidate(uint64_t a1)
{
  BBMonitorCancelEvents(a1);
  BBMonitorReleaseWiFiAssertion(a1);
  int v2 = *(__CFMachPort **)(a1 + 48);
  if (v2)
  {
    CFMachPortInvalidate(v2);
    os_log_type_t v3 = *(const void **)(a1 + 48);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 48) = 0;
    }
  }
  int v4 = *(__CFRunLoopSource **)(a1 + 56);
  if (v4)
  {
    CFRunLoopSourceInvalidate(v4);
    int v5 = *(const void **)(a1 + 56);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 56) = 0;
    }
  }
  uint64_t result = *(unsigned int *)(a1 + 64);
  if (result)
  {
    uint64_t result = notify_cancel(result);
    *(_DWORD *)(a1 + 64) = 0;
  }
  return result;
}

void BBMonitorCancelEvents(uint64_t a1)
{
  TimerRelease((uint64_t *)(a1 + 80));
  if (*(void *)(a1 + 72)) {
    captive_agent_abort_probe((void *)(a1 + 72));
  }

  BBMonitorCancelPrompt(a1);
}

void BBMonitorReleaseWiFiAssertion(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 4) & 0x40) != 0)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_225F82000, logger, v3, "BBMonitorReleaseWiFiAssertion", v4, 2u);
    }
    *(_DWORD *)(a1 + 4) &= ~0x40u;
    NetIFReleaseWiFiAssertion();
  }
}

void BBMonitorRetain(int *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    int v4 = *a1;
    int v5 = *a1 + 1;
    v6[0] = 67109376;
    v6[1] = v4;
    __int16 v7 = 1024;
    int v8 = v5;
    _os_log_impl(&dword_225F82000, logger, v3, "BBMRetain: retain_count %d -> %d", (uint8_t *)v6, 0xEu);
  }
  ++*a1;
}

void BBMonitorStart(uint64_t a1)
{
}

void BBMonitorScheduleStateFetch(uint64_t a1, int a2)
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  if (*(void *)(a1 + 56))
  {
    CFRunLoopRef v5 = Current;
    uint64_t state64 = 0;
    if (a2) {
      uint64_t state64 = 7;
    }
    else {
      notify_get_state(*(_DWORD *)(a1 + 64), &state64);
    }
    BBMonitorRetain((int *)a1);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = __BBMonitorScheduleStateFetch_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_17;
    aBlock[4] = v5;
    aBlock[5] = a1;
    if (!CaptiveSymptomScheduleEventFetch(state64, aBlock)) {
      BBMonitorRelease((void *)a1);
    }
  }
}

void BBMonitorLogUserChoice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v7))
  {
    int v8 = "Use Cellular";
    uint64_t v9 = *(void *)(a1 + 16);
    if (!*(unsigned char *)(a1 + 120)) {
      int v8 = "Remain On WiFi";
    }
    int v10 = 136315906;
    uint64_t v11 = a2;
    __int16 v12 = 2080;
    int v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = a3;
    _os_log_impl(&dword_225F82000, logger, v7, "BBMonitor: %s user's choice '%s' for SSID '%@' [%@]", (uint8_t *)&v10, 0x2Au);
  }
}

void BBMonitorCancelPrompt(uint64_t a1)
{
  if (*(void *)(a1 + 96))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_225F82000, logger, v3, "canceling prompt", v8, 2u);
    }
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 96), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    CFRunLoopRef v5 = *(const void **)(a1 + 96);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 96) = 0;
    }
    _BBMonitorPostEvent(a1, 0);
  }
  int v6 = *(__CFUserNotification **)(a1 + 88);
  if (v6)
  {
    CFUserNotificationCancel(v6);
    os_log_type_t v7 = *(const void **)(a1 + 88);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a1 + 88) = 0;
    }
  }
  if (S_bb == a1) {
    S_bb = 0;
  }
}

void _BBMonitorPostEvent(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = *(double *)(a1 + 104);
  if (Current <= v5) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = (unint64_t)(Current - v5);
  }
  int v7 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  os_log_type_t v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v9))
  {
    int v10 = PromptResultGetString_names[a2];
    uint64_t v11 = "Event Post Failed";
    *(_DWORD *)SCDynamicStoreContext buf = 136315906;
    if (v7) {
      uint64_t v11 = "Event Posted";
    }
    int v13 = v11;
    __int16 v14 = 2080;
    uint64_t v15 = v10;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2048;
    unint64_t v19 = v6;
    _os_log_impl(&dword_225F82000, logger, v9, "%s %s (%d) duration %qu", buf, 0x26u);
  }
}

void __BBMonitorScheduleStateFetch_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  int v4 = *(__CFRunLoop **)(a1 + 32);
  double v5 = (const void *)*MEMORY[0x263EFFE88];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __BBMonitorScheduleStateFetch_block_invoke_2;
  block[3] = &__block_descriptor_tmp_15_0;
  uint64_t v6 = *(void *)(a1 + 40);
  int v8 = a2;
  block[4] = v6;
  void block[5] = a3;
  CFRunLoopPerformBlock(v4, v5, block);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 32));
}

void __BBMonitorScheduleStateFetch_block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 56)) {
    goto LABEL_9;
  }
  int v3 = *(_DWORD *)(a1 + 48);
  int v4 = *(const char **)(a1 + 40);
  int v5 = *(_DWORD *)(v2 + 4);
  if ((v5 & 0x10) != 0) {
    *(_DWORD *)(v2 + 4) = v5 & 0xFFFFFFEF;
  }
  if (!v3)
  {
    if (v4)
    {
      if (v4 != (const char *)1)
      {
        if (v4 == (const char *)2)
        {
          logger = mysyslog_get_logger();
          os_log_type_t v13 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v13))
          {
            *(_WORD *)SCDynamicStoreContext buf = 0;
            _os_log_impl(&dword_225F82000, logger, v13, "BBMonitor: confirmed broken", buf, 2u);
          }
          unsigned int v14 = *(_DWORD *)(v2 + 28);
          if (v14 >= 2)
          {
            if (v14 != 4)
            {
              CFURLRef v35 = mysyslog_get_logger();
              os_log_type_t v36 = _SC_syslog_os_log_mapping();
              if (!os_log_type_enabled(v35, v36)) {
                goto LABEL_9;
              }
              uint64_t v37 = *(unsigned int *)(v2 + 28);
              if (v37 > 6) {
                CFStringRef v38 = "<unknown>";
              }
              else {
                CFStringRef v38 = off_264784E28[v37];
              }
              *(_DWORD *)SCDynamicStoreContext buf = 136315394;
              uint64_t v43 = v38;
              __int16 v44 = 1024;
              int v45 = v37;
              int v8 = "BBMonitor state is %s (%d), ignoring";
              os_log_type_t v9 = v35;
              os_log_type_t v10 = v36;
              uint32_t v11 = 18;
              goto LABEL_8;
            }
            uint64_t v6 = mysyslog_get_logger();
            os_log_type_t v7 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v6, v7)) {
              goto LABEL_9;
            }
            *(_WORD *)SCDynamicStoreContext buf = 0;
            int v8 = "BBMonitor: in broken state";
            goto LABEL_7;
          }
          *(_DWORD *)(v2 + 4) &= ~2u;
LABEL_29:
          BBMonitor_Probing(v2, 0, 0);
          goto LABEL_9;
        }
        __int16 v18 = mysyslog_get_logger();
        os_log_type_t v19 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v18, v19))
        {
LABEL_53:
          if ((v5 & 0x10) != 0) {
            BBMonitor_Detecting(v2, 0);
          }
          goto LABEL_9;
        }
        *(_DWORD *)SCDynamicStoreContext buf = 134217984;
        uint64_t v43 = v4;
        __int16 v26 = "BBMonitor: unrecognized state %qu";
LABEL_52:
        _os_log_impl(&dword_225F82000, v18, v19, v26, buf, 0xCu);
        goto LABEL_53;
      }
      CFTypeID v22 = mysyslog_get_logger();
      os_log_type_t v23 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v22, v23))
      {
        *(_WORD *)SCDynamicStoreContext buf = 0;
        _os_log_impl(&dword_225F82000, v22, v23, "BBMonitor: detected broken", buf, 2u);
      }
      int v24 = *(_DWORD *)(v2 + 4);
      *(_DWORD *)(v2 + 4) = v24 & 0xFFFFFFFD;
      unsigned int v25 = *(_DWORD *)(v2 + 28);
      if (v25 > 6) {
        goto LABEL_47;
      }
      if (((1 << v25) & 0x63) != 0)
      {
        if ((v24 & 0x20) == 0) {
          goto LABEL_29;
        }
        char v41 = 1;
        uint64_t v27 = mysyslog_get_logger();
        os_log_type_t v28 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v27, v28))
        {
          *(_WORD *)SCDynamicStoreContext buf = 0;
          _os_log_impl(&dword_225F82000, v27, v28, "BBMonitor: skipping probing whitelisted network", buf, 2u);
        }
        uint64_t v29 = (unsigned __int8 *)&v41;
        uint64_t v30 = v2;
        goto LABEL_39;
      }
      if (v25 == 4)
      {
        int v31 = mysyslog_get_logger();
        os_log_type_t v32 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v31, v32)) {
          goto LABEL_9;
        }
        uint64_t v33 = *(unsigned int *)(v2 + 28);
        if (v33 > 6) {
          CFURLRef v34 = "<unknown>";
        }
        else {
          CFURLRef v34 = off_264784E28[v33];
        }
        *(_DWORD *)SCDynamicStoreContext buf = 136315138;
        uint64_t v43 = v34;
        int v8 = "BBMonitor(%s): waiting until next probe interval";
      }
      else
      {
LABEL_47:
        int v31 = mysyslog_get_logger();
        os_log_type_t v32 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v31, v32)) {
          goto LABEL_9;
        }
        uint64_t v39 = *(unsigned int *)(v2 + 28);
        if (v39 > 6) {
          CFStringRef v40 = "<unknown>";
        }
        else {
          CFStringRef v40 = off_264784E28[v39];
        }
        *(_DWORD *)SCDynamicStoreContext buf = 136315138;
        uint64_t v43 = v40;
        int v8 = "BBMonitor(%s): ignoring";
      }
      os_log_type_t v9 = v31;
      os_log_type_t v10 = v32;
      uint32_t v11 = 12;
      goto LABEL_8;
    }
    uint64_t v15 = mysyslog_get_logger();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl(&dword_225F82000, v15, v16, "BBMonitor: not broken", buf, 2u);
    }
    unsigned int v17 = *(_DWORD *)(v2 + 28);
    if (v17 < 2) {
      goto LABEL_53;
    }
    if (v17 == 6)
    {
      __int16 v18 = mysyslog_get_logger();
      os_log_type_t v19 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v18, v19)) {
        goto LABEL_53;
      }
      uint64_t v20 = *(unsigned int *)(v2 + 28);
      if (v20 > 6) {
        uint64_t v21 = "<unknown>";
      }
      else {
        uint64_t v21 = off_264784E28[v20];
      }
      *(_DWORD *)SCDynamicStoreContext buf = 136315138;
      uint64_t v43 = v21;
      __int16 v26 = "BBMonitor(%s): ignoring";
      goto LABEL_52;
    }
    uint64_t v30 = v2;
    uint64_t v29 = 0;
LABEL_39:
    BBMonitor_Idle(v30, 0, v29);
    goto LABEL_9;
  }
  uint64_t v6 = mysyslog_get_logger();
  os_log_type_t v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v6, v7))
  {
    *(_WORD *)SCDynamicStoreContext buf = 0;
    int v8 = "BBMonitor: symptom error encountered";
LABEL_7:
    os_log_type_t v9 = v6;
    os_log_type_t v10 = v7;
    uint32_t v11 = 2;
LABEL_8:
    _os_log_impl(&dword_225F82000, v9, v10, v8, buf, v11);
  }
LABEL_9:
  BBMonitorRelease(*(void **)(a1 + 32));
}

void BBMonitor_Idle(uint64_t a1, int a2, unsigned __int8 *a3)
{
  if (!a2)
  {
    BBMonitorReleaseWiFiAssertion(a1);
    if (a3)
    {
      int v5 = *a3;
      BBMonitorSetState(a1, 1u);
      BBMonitorCancelEvents(a1);
      if (!v5) {
        return;
      }
    }
    else
    {
      BBMonitorSetState(a1, 1u);
      BBMonitorCancelEvents(a1);
    }
    BBMonitorReportState(a1, 0);
    BBMonitorSetInterfaceAdvisory(a1, 0);
  }
}

void BBMonitor_Probing(uint64_t a1, int a2, int *a3)
{
  if (a2 == 1)
  {
    int v4 = *a3;
    BBMonitorReportState(a1, *a3 == 3);
    if (v4 == 3)
    {
      BBMonitor_Selecting(a1, 0, 0);
    }
    else
    {
      BBMonitor_Idle(a1, 0, 0);
    }
  }
  else if (!a2)
  {
    BBMonitorSetState(a1, 2u);
    BBMonitorCancelEvents(a1);
    if (!BBMonitorStartProbe(a1))
    {
      unsigned __int8 v5 = 0;
      BBMonitor_Idle(a1, 0, &v5);
    }
  }
}

void BBMonitor_Detecting(uint64_t a1, int a2)
{
  unsigned __int8 v5 = 0;
  if (a2 == 1) {
    goto LABEL_9;
  }
  if (!a2)
  {
    BBMonitorSetState(a1, 6u);
    BBMonitorCancelEvents(a1);
    if ((*(unsigned char *)(a1 + 4) & 0x40) == 0)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v4))
      {
        *(_WORD *)SCDynamicStoreContext buf = 0;
        _os_log_impl(&dword_225F82000, logger, v4, "BBMonitorRetainWiFiAssertion", buf, 2u);
      }
      *(_DWORD *)(a1 + 4) |= 0x40u;
      NetIFRetainWiFiAssertion();
    }
    if (!BBMonitorStartProbe(a1))
    {
      unsigned __int8 v5 = 0;
LABEL_9:
      BBMonitor_Idle(a1, 0, &v5);
    }
  }
}

void BBMonitorSetState(uint64_t a1, unsigned int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    if (a2 > 6) {
      uint64_t v6 = "<unknown>";
    }
    else {
      uint64_t v6 = off_264784E28[a2];
    }
    int v7 = 136315138;
    int v8 = v6;
    _os_log_impl(&dword_225F82000, logger, v5, "BBMonitorState: %s", (uint8_t *)&v7, 0xCu);
  }
  *(_DWORD *)(a1 + 28) = a2;
}

uint64_t BBMonitorReportState(uint64_t result, int a2)
{
  uint64_t v3 = result;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((*(_DWORD *)(result + 4) & 2) == 0 || (*(_DWORD *)(result + 4) & 1) != a2)
  {
    uint64_t state64 = 0;
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      uint64_t v6 = "";
      if (!a2) {
        uint64_t v6 = "not ";
      }
      *(_DWORD *)SCDynamicStoreContext buf = 136315138;
      __int16 v12 = v6;
      _os_log_impl(&dword_225F82000, logger, v5, "BrokenBackhaul: telling symptoms backhaul is %sbroken", buf, 0xCu);
    }
    notify_get_state(*(_DWORD *)(v3 + 64), &state64);
    uint64_t result = CaptiveSymptomReportBackhaulState();
    int v7 = *(_DWORD *)(v3 + 4);
    int v8 = v7 | 3;
    unsigned int v9 = v7 & 0xFFFFFFFC | 2;
    if (a2) {
      unsigned int v9 = v8;
    }
    *(_DWORD *)(v3 + 4) = v9;
  }
  return result;
}

void BBMonitorSetInterfaceAdvisory(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2) {
    uint64_t v2 = @"unable to reach probe server";
  }
  else {
    uint64_t v2 = @"probe server is reachable again";
  }
  if (((*(_DWORD *)(a1 + 4) >> 2) & 1) != a2)
  {
    int v5 = SCNetworkInterfaceSetAdvisory();
    logger = mysyslog_get_logger();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v7))
    {
      int v8 = "Set";
      if (!a2) {
        int v8 = "Clear";
      }
      int v10 = 136315650;
      uint32_t v11 = v8;
      if (v5) {
        unsigned int v9 = "";
      }
      else {
        unsigned int v9 = " FAILED";
      }
      __int16 v12 = 2112;
      uint64_t v13 = v2;
      __int16 v14 = 2080;
      uint64_t v15 = v9;
      _os_log_impl(&dword_225F82000, logger, v7, "BBMonitor: %sAdvisory '%@'%s", (uint8_t *)&v10, 0x20u);
    }
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a1 + 4) & 0xFFFFFFFB | (4 * (a2 != 0));
  }
}

BOOL BBMonitorStartProbe(uint64_t a1)
{
  CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 8));
  BBMonitorCancelEvents(a1);
  int v3 = (*(unsigned __int8 *)(a1 + 4) >> 3) & 1;
  os_log_type_t v4 = *(const void **)(a1 + 16);
  unsigned int v5 = *(double *)&S_BBMProbeTimeout;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  os_log_type_t v7 = captive_agent_send_probe(v4, BSDName, v3, 0, v5, (uint64_t)HandleProbeResult, a1, (uint64_t)Current);
  *(void *)(a1 + 72) = v7;
  if (v7) {
    return 1;
  }
  logger = mysyslog_get_logger();
  os_log_type_t v10 = _SC_syslog_os_log_mapping();
  BOOL result = os_log_type_enabled(logger, v10);
  if (result)
  {
    *(_WORD *)uint32_t v11 = 0;
    _os_log_impl(&dword_225F82000, logger, v10, "BBMonitor: captive_agent_send_probe failed", v11, 2u);
    return 0;
  }
  return result;
}

void BBMonitor_Selecting(uint64_t a1, int a2, unsigned char *a3)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (a2 == 3)
  {
    *(CFAbsoluteTime *)(a1 + 112) = CFAbsoluteTimeGetCurrent();
    *(unsigned char *)(a1 + 120) = *a3;
    CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 8));
    uint64_t v18 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
    if (v18)
    {
      os_log_type_t v19 = (const void *)v18;
      SSID = (const void *)WiFiNetworkGetSSID();
      if (SSID && CFEqual(SSID, *(CFTypeRef *)(a1 + 16)))
      {
        WiFiNetworkSetProperty();
        CFDateRef v21 = CFDateCreate(0, *(CFAbsoluteTime *)(a1 + 112));
        WiFiNetworkSetProperty();
        BBMonitorLogUserChoice(a1, (uint64_t)"Saved", (uint64_t)v21);
        CFRelease(v21);
      }
      NetIFUpdateWiFiNetwork();
      CFRelease(v19);
    }
  }
  else
  {
    if (a2) {
      return;
    }
    BBMonitorSetState(a1, 3u);
    BBMonitorCancelEvents(a1);
    double v4 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 112);
    if (v4 > *(double *)&S_BBMPromptInterval)
    {
      SInt32 error = 0;
      if (S_bb)
      {
        logger = mysyslog_get_logger();
        os_log_type_t v6 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v6))
        {
          *(_WORD *)SCDynamicStoreContext buf = 0;
          _os_log_impl(&dword_225F82000, logger, v6, "BBMonitor: canceling pending prompt", buf, 2u);
        }
        BBMonitorCancelPrompt(S_bb);
      }
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      Bundle = (__CFBundle *)CaptiveGetBundle();
      CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE50];
      CFPreferencesSynchronize(@".GlobalPreferences", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
      CFArrayRef v10 = (const __CFArray *)CFPreferencesCopyValue(@"AppleLanguages", @".GlobalPreferences", @"mobile", v9);
      CFTypeID TypeID = CFArrayGetTypeID();
      if (v10 && CFGetTypeID(v10) == TypeID)
      {
        CFArrayRef v12 = CFBundleCopyBundleLocalizations(Bundle);
        if (!v12)
        {
          os_log_type_t v32 = mysyslog_get_logger();
          os_log_type_t v33 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v32, v33)) {
            goto LABEL_31;
          }
          *(_WORD *)SCDynamicStoreContext buf = 0;
          CFURLRef v34 = "failed to retrieve localizations";
          goto LABEL_30;
        }
        CFArrayRef v13 = CFBundleCopyLocalizationsForPreferences(v12, v10);
        if (v13)
        {
          CFArrayRef v14 = v13;
          if (CFArrayGetCount(v13))
          {
            ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(v14, 0);
LABEL_32:
            CFURLRef v35 = mysyslog_get_logger();
            os_log_type_t v36 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v35, v36))
            {
              *(_DWORD *)SCDynamicStoreContext buf = 138412290;
              double v56 = *(double *)&ValueAtIndex;
              _os_log_impl(&dword_225F82000, v35, v36, "Using localization for %@", buf, 0xCu);
            }
            CFRetain(ValueAtIndex);
            CFURLRef v37 = CFBundleCopyBundleURL(Bundle);
            if (v37)
            {
              CFURLRef v38 = v37;
              CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F00018], v37);
              CFRelease(v38);
            }
            if (*(unsigned char *)(a1 + 24)) {
              uint64_t v39 = @"BROKEN_BACKHAUL_ALTERNATE_BUTTON_CH";
            }
            else {
              uint64_t v39 = @"BROKEN_BACKHAUL_ALTERNATE_BUTTON";
            }
            if (*(unsigned char *)(a1 + 24)) {
              CFStringRef v40 = @"BROKEN_BACKHAUL_HEADER_FORMAT_CH";
            }
            else {
              CFStringRef v40 = @"BROKEN_BACKHAUL_HEADER_FORMAT";
            }
            if (*(unsigned char *)(a1 + 24)) {
              char v41 = @"BROKEN_BACKHAUL_MESSAGE_CH";
            }
            else {
              char v41 = @"BROKEN_BACKHAUL_MESSAGE";
            }
            BOOL v42 = (const void *)*MEMORY[0x263EFFFC8];
            uint64_t v43 = *(void *)(a1 + 16);
            CFStringRef v44 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
            if (v44)
            {
              CFStringRef v45 = v44;
              CFStringRef v46 = CFStringCreateWithFormat(0, 0, v44, v43);
              CFDictionaryAddValue(Mutable, v42, v46);
              CFRelease(v46);
              CFRelease(v45);
            }
            else
            {
              CFDictionaryAddValue(Mutable, v42, v40);
            }
            add_localized_string((uint64_t)Bundle, (uint64_t)ValueAtIndex, Mutable, (const void *)*MEMORY[0x263EFFFD8], v41);
            add_localized_string((uint64_t)Bundle, (uint64_t)ValueAtIndex, Mutable, (const void *)*MEMORY[0x263F00000], @"BROKEN_BACKHAUL_DEFAULT_BUTTON");
            add_localized_string((uint64_t)Bundle, (uint64_t)ValueAtIndex, Mutable, (const void *)*MEMORY[0x263EFFFE8], v39);
            os_log_type_t v47 = CFUserNotificationCreate(0, 0.0, 0, &error, Mutable);
            CFRelease(Mutable);
            CFRelease(ValueAtIndex);
            if (v47)
            {
              RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v47, (CFUserNotificationCallBack)BBMonitorUserResponse, 0);
              CFRunLoopRef Current = CFRunLoopGetCurrent();
              CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
              *(void *)(a1 + 88) = v47;
              *(void *)(a1 + 96) = RunLoopSource;
              *(CFAbsoluteTime *)(a1 + 104) = CFAbsoluteTimeGetCurrent();
              S_bb = a1;
              os_log_type_t v50 = mysyslog_get_logger();
              os_log_type_t v51 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v50, v51))
              {
                *(_WORD *)SCDynamicStoreContext buf = 0;
                _os_log_impl(&dword_225F82000, v50, v51, "BBMonitor: prompting user, waiting for response", buf, 2u);
              }
            }
            else
            {
              uint32_t v52 = mysyslog_get_logger();
              uint64_t v53 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v52, (os_log_type_t)v53))
              {
                *(_WORD *)SCDynamicStoreContext buf = 0;
                _os_log_impl(&dword_225F82000, v52, (os_log_type_t)v53, "BBMonitor: failed to create CFUserNotification", buf, 2u);
              }
              buf[0] = 0;
              BBMonitor_Idle(a1, 0, buf);
            }
            return;
          }
        }
        os_log_type_t v32 = mysyslog_get_logger();
        os_log_type_t v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          *(_WORD *)SCDynamicStoreContext buf = 0;
          CFURLRef v34 = "failed to retrieve preferred localization";
          goto LABEL_30;
        }
      }
      else
      {
        os_log_type_t v32 = mysyslog_get_logger();
        os_log_type_t v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          *(_WORD *)SCDynamicStoreContext buf = 0;
          CFURLRef v34 = "No default language";
LABEL_30:
          _os_log_impl(&dword_225F82000, v32, v33, v34, buf, 2u);
        }
      }
LABEL_31:
      ValueAtIndex = @"en";
      goto LABEL_32;
    }
    CFTypeID v22 = mysyslog_get_logger();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 134218240;
      double v56 = v4;
      __int16 v57 = 2048;
      uint64_t v58 = S_BBMPromptInterval;
      _os_log_impl(&dword_225F82000, v22, v23, "BBMonitor: can't show prompt (%g < %g)", buf, 0x16u);
    }
  }
  int v24 = *(unsigned __int8 *)(a1 + 120);
  unsigned int v25 = mysyslog_get_logger();
  os_log_type_t v26 = _SC_syslog_os_log_mapping();
  BOOL v27 = os_log_type_enabled(v25, v26);
  if (v24)
  {
    if (v27)
    {
      uint64_t v28 = *(unsigned int *)(a1 + 28);
      if (v28 > 6) {
        uint64_t v29 = "<unknown>";
      }
      else {
        uint64_t v29 = off_264784E28[v28];
      }
      *(_DWORD *)SCDynamicStoreContext buf = 136315138;
      double v56 = *(double *)&v29;
      _os_log_impl(&dword_225F82000, v25, v26, "BBMonitor(%s): using cellular", buf, 0xCu);
    }
    BBMonitor_Broken((__CFRunLoopTimer *)a1, 0, 0);
  }
  else
  {
    if (v27)
    {
      uint64_t v30 = *(unsigned int *)(a1 + 28);
      if (v30 > 6) {
        int v31 = "<unknown>";
      }
      else {
        int v31 = off_264784E28[v30];
      }
      *(_DWORD *)SCDynamicStoreContext buf = 136315138;
      double v56 = *(double *)&v31;
      _os_log_impl(&dword_225F82000, v25, v26, "BBMonitor(%s): staying on Wi-Fi", buf, 0xCu);
    }
    BBMonitor_Ignoring(a1, 0);
  }
}

void HandleProbeResult(uint64_t a1, unsigned int a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *(void *)(a1 + 72) = 0;
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    if (a2 > 0xA) {
      os_log_type_t v6 = "<unknown>";
    }
    else {
      os_log_type_t v6 = off_264784E60[a2];
    }
    *(_DWORD *)SCDynamicStoreContext buf = 136315394;
    CFTypeID v22 = (void *)v6;
    __int16 v23 = 1024;
    LODWORD(v24) = a2;
    _os_log_impl(&dword_225F82000, logger, v5, "BBMonitor: probe result '%s' (%d)", buf, 0x12u);
  }
  uint64_t v7 = *(unsigned int *)(a1 + 28);
  if (v7 <= 6 && v7)
  {
    int v8 = (void (*)(uint64_t, uint64_t, int *))BBMStateMachineFunctionGet_funcs[v7];
    if (a2 <= 0xC)
    {
      if (((1 << a2) & 0x1E02) != 0)
      {
        int v20 = 0;
        CFStringRef v9 = "";
LABEL_11:
        CFArrayRef v10 = mysyslog_get_logger();
        os_log_type_t v11 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v10, v11))
        {
          CFArrayRef v12 = off_264784E28[v7];
          if (a2 > 0xA) {
            CFArrayRef v13 = "<unknown>";
          }
          else {
            CFArrayRef v13 = off_264784E60[a2];
          }
          *(_DWORD *)SCDynamicStoreContext buf = 136315650;
          CFTypeID v22 = v12;
          __int16 v23 = 2080;
          int v24 = v13;
          __int16 v25 = 2080;
          os_log_type_t v26 = v9;
          _os_log_impl(&dword_225F82000, v10, v11, "BBMonitor (%s): Probe Complete: Result %s%s", buf, 0x20u);
        }
        v8(a1, 1, &v20);
        unsigned int v17 = *(void (**)(void, uint64_t))(a1 + 32);
        if (v17 && (v20 - 1) <= 1)
        {
          unsigned int v18 = (*(_DWORD *)(a1 + 4) >> 2) & 2 | (v20 == 2);
          if (v7 == 6) {
            uint64_t v19 = v18 | 4;
          }
          else {
            uint64_t v19 = v18;
          }
          v17(*(void *)(a1 + 40), v19);
        }
        return;
      }
      if (((1 << a2) & 0xC) != 0)
      {
        int v20 = 2;
        int v16 = *(_DWORD *)(a1 + 4);
        if ((v16 & 8) != 0)
        {
          *(_DWORD *)(a1 + 4) = v16 | 0x20;
          CaptiveAnalyticsSessionPostIncompleteEvent(1u);
          CFStringRef v9 = " [captive whitelist]";
        }
        else
        {
          CFStringRef v9 = " [captive]";
        }
        goto LABEL_11;
      }
      if (!a2)
      {
        int v20 = 1;
        CFStringRef v9 = " [not captive]";
        goto LABEL_11;
      }
    }
    int v20 = 3;
    CFStringRef v9 = " [broken]";
    goto LABEL_11;
  }
  CFArrayRef v14 = mysyslog_get_logger();
  os_log_type_t v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)SCDynamicStoreContext buf = 67109120;
    LODWORD(v22) = v7;
    _os_log_impl(&dword_225F82000, v14, v15, "BBMonitor: no function for state %d", buf, 8u);
  }
}

void BBMonitor_Broken(__CFRunLoopTimer *a1, int a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2 == 2)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_225F82000, logger, v8, "BBMonitor: woke up, probing again", (uint8_t *)&v12, 2u);
    }
    BBMonitorCancelEvents((uint64_t)a1);
    if (!BBMonitorStartProbe((uint64_t)a1))
    {
      double v6 = *(double *)&S_BBMProbeInterval;
LABEL_11:
      BBMonitorSetTimer((uint64_t)a1, a1, v6);
    }
  }
  else
  {
    if (a2 != 1)
    {
      if (a2) {
        return;
      }
      BBMonitorSetState((uint64_t)a1, 4u);
      BBMonitorCancelEvents((uint64_t)a1);
      BBMonitorReportState((uint64_t)a1, 1);
      BBMonitorSetInterfaceAdvisory((uint64_t)a1, 1);
      double v4 = mysyslog_get_logger();
      os_log_type_t v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v4, v5))
      {
        int v12 = 134217984;
        uint64_t v13 = S_BBMProbeInterval;
        _os_log_impl(&dword_225F82000, v4, v5, "BBMonitor: setting timer to wake up in %g seconds", (uint8_t *)&v12, 0xCu);
      }
      double v6 = *(double *)&S_BBMProbeInterval;
      goto LABEL_11;
    }
    if (*a3 == 3)
    {
      double v9 = *(double *)&S_BBMProbeInterval;
      BBMonitorSetTimer((uint64_t)a1, a1, v9);
    }
    else
    {
      CFArrayRef v10 = mysyslog_get_logger();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_225F82000, v10, v11, "BBMonitor: no longer broken", (uint8_t *)&v12, 2u);
      }
      BBMonitor_Idle((uint64_t)a1, 0, 0);
    }
  }
}

void BBMonitor_Ignoring(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    BBMonitorSetState(a1, 5u);
    BBMonitorCancelEvents(a1);
    CFDateRef v3 = CFDateCreate(0, *(double *)(a1 + 112) + *(double *)&S_BBMPromptInterval);
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      uint64_t v6 = *(unsigned int *)(a1 + 28);
      if (v6 > 6) {
        uint64_t v7 = "<unknown>";
      }
      else {
        uint64_t v7 = off_264784E28[v6];
      }
      int v8 = 136315394;
      double v9 = v7;
      __int16 v10 = 2112;
      CFDateRef v11 = v3;
      _os_log_impl(&dword_225F82000, logger, v5, "BBMonitor(%s): waiting to prompt again until %@", (uint8_t *)&v8, 0x16u);
    }
    CFRelease(v3);
  }
}

void BBMonitorSetTimer(uint64_t a1, __CFRunLoopTimer *a2, double a3)
{
  uint64_t v6 = *(CFRunLoopTimerRef **)(a1 + 80);
  if (!v6)
  {
    TimerCreate();
    *(void *)(a1 + 80) = v6;
  }

  TimerSet(v6, (__CFRunLoopTimer *)BBMonitor_Broken, a2, (__CFRunLoopTimer *)2, 0, a3);
}

void add_localized_string(uint64_t a1, uint64_t a2, __CFDictionary *a3, const void *a4, const void *a5)
{
  int v8 = (const void *)CFBundleCopyLocalizedStringForLocalization();
  if (v8)
  {
    double v9 = v8;
    CFDictionaryAddValue(a3, a4, v8);
    CFRelease(v9);
  }
  else
  {
    CFDictionaryAddValue(a3, a4, a5);
  }
}

void BBMonitorUserResponse(uint64_t a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    int v21 = 134217984;
    CFTypeID v22 = a2;
    _os_log_impl(&dword_225F82000, logger, v5, "response flags 0x%lx", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v6 = S_bb;
  if (S_bb)
  {
    if (*(void *)(S_bb + 88) == a1)
    {
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(v6 + 96), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      uint64_t v14 = *(const void **)(v6 + 96);
      if (v14)
      {
        CFRelease(v14);
        *(void *)(v6 + 96) = 0;
      }
      os_log_type_t v15 = *(const void **)(v6 + 88);
      if (v15)
      {
        CFRelease(v15);
        *(void *)(v6 + 88) = 0;
      }
      S_bb = 0;
      if (*(_DWORD *)(v6 + 28) == 3)
      {
        LOBYTE(v21) = (a2 & 3) == 0;
        if ((a2 & 3) != 0) {
          int v16 = 2;
        }
        else {
          int v16 = 1;
        }
        _BBMonitorPostEvent(v6, v16);
        BBMonitor_Selecting(v6, 3, &v21);
      }
      else
      {
        unsigned int v17 = mysyslog_get_logger();
        os_log_type_t v18 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = *(unsigned int *)(v6 + 28);
          if (v19 > 6) {
            int v20 = "<unknown>";
          }
          else {
            int v20 = off_264784E28[v19];
          }
          int v21 = 136315138;
          CFTypeID v22 = v20;
          double v9 = "BBMonitor: not selecting (%s), ignoring";
          __int16 v10 = v17;
          os_log_type_t v11 = v18;
          uint32_t v12 = 12;
          goto LABEL_10;
        }
      }
    }
    else
    {
      uint64_t v7 = mysyslog_get_logger();
      LOBYTE(v8) = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, (os_log_type_t)v8))
      {
        LOWORD(v21) = 0;
        double v9 = "BBMonitorUserResponse: mismatch cfun";
LABEL_9:
        __int16 v10 = v7;
        os_log_type_t v11 = v8;
        uint32_t v12 = 2;
LABEL_10:
        _os_log_impl(&dword_225F82000, v10, v11, v9, (uint8_t *)&v21, v12);
      }
    }
  }
  else
  {
    uint64_t v7 = mysyslog_get_logger();
    uint64_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, (os_log_type_t)v8))
    {
      LOWORD(v21) = 0;
      double v9 = "BBMonitorUserResponse: why S_bb NULL?";
      goto LABEL_9;
    }
  }
}

uint64_t WebSheetStateSetIsAllowed(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 72) = a2;
  }
  return result;
}

void WebSheetStateIssueExitCommand(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  logger = mysyslog_get_logger();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  BOOL v5 = os_log_type_enabled(logger, v4);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl(&dword_225F82000, logger, v4, "WebSheet is registered, issuing exit command", buf, 2u);
    }
    my_FieldSetRetainedCFType((const void **)(a1 + 40), 0);
    CFDictionaryRef Command = createCommand(3, 0, 0, 0);
    WebSheetStateIssueCommand(a1, Command, 1);
    CFRelease(Command);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_225F82000, logger, v4, "WebSheet is not registered, cleaning up WebSheet state", v7, 2u);
    }
    WebSheetStateCleanup((uint64_t *)a1);
  }
}

CFDictionaryRef createCommand(int a1, CFStringRef a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int valuePtr = a1;
  if (a2)
  {
    CFStringRef v6 = 0;
  }
  else
  {
    CFStringRef v6 = my_CFUUIDStringCreate(0);
    a2 = v6;
  }
  unsigned int v17 = 0;
  uint64_t v18 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  keys[0] = @"UniqueID";
  values[0] = (void *)a2;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  keys[1] = @"Type";
  values[1] = v8;
  if (a3)
  {
    unsigned int v17 = @"Info";
    uint64_t v14 = a3;
    unsigned int v9 = 3;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  unsigned int v9 = 2;
  if (a4)
  {
LABEL_6:
    keys[v9] = @"ProbeResult";
    values[v9++] = a4;
  }
LABEL_7:
  CFDictionaryRef v10 = CFDictionaryCreate(v7, (const void **)keys, (const void **)values, v9, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v8) {
    CFRelease(v8);
  }
  if (v6) {
    CFRelease(v6);
  }
  return v10;
}

uint64_t WebSheetStateIssueCommand(uint64_t a1, void *value, int a3)
{
  CFMutableArrayRef Mutable = *(__CFArray **)(a1 + 48);
  if (Mutable)
  {
    if (a3)
    {
      CFArrayRemoveAllValues(Mutable);
      CFMutableArrayRef Mutable = *(__CFArray **)(a1 + 48);
    }
  }
  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    *(void *)(a1 + 48) = Mutable;
  }
  CFArrayAppendValue(Mutable, value);
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    return CommandHandlerNotify(result);
  }
  return result;
}

void WebSheetStateCleanup(uint64_t *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1 && *((unsigned char *)a1 + 112))
  {
    *((unsigned char *)a1 + 112) = 0;
    notify_post((const char *)*MEMORY[0x263F308F0]);
  }
  my_FieldSetRetainedCFType((const void **)a1 + 8, 0);
  my_FieldSetRetainedCFType((const void **)a1 + 5, 0);
  uint64_t v2 = (const void *)a1[6];
  if (v2)
  {
    CFRelease(v2);
    a1[6] = 0;
  }
  if (S_prober_list)
  {
    unint64_t Count = CFDictionaryGetCount((CFDictionaryRef)S_prober_list);
    uint64_t v4 = Count;
    if (Count < 0xB) {
      BOOL v5 = (const void **)v13;
    }
    else {
      BOOL v5 = (const void **)malloc_type_malloc(16 * Count, 0xC996A348uLL);
    }
    memset(v13, 0, sizeof(v13));
    if (v4 >= 1)
    {
      CFDictionaryGetKeysAndValues((CFDictionaryRef)S_prober_list, v5, &v5[v4]);
      CFStringRef v6 = (void **)v5;
      uint64_t v7 = v4;
      do
      {
        CFNumberRef v8 = *v6;
        if (*(uint64_t **)CFDataGetBytePtr((CFDataRef)v6[v4]) == a1) {
          ProberContextRemove(v8);
        }
        ++v6;
        --v7;
      }
      while (v7);
    }
    if (v5 != (const void **)v13) {
      free(v5);
    }
  }
  S_webSheetDoneCallback(a1[4], 6, 0);
  *((_WORD *)a1 + 36) = 0;
  WebSheetStateClearCheckInTimer((uint64_t)a1);
  unsigned int v9 = (const void *)a1[10];
  if (v9)
  {
    CFRelease(v9);
    a1[10] = 0;
  }
  CFDictionaryRef v10 = (const void *)a1[11];
  if (v10)
  {
    CFRelease(v10);
    a1[11] = 0;
  }
  os_log_type_t v11 = (const void *)a1[2];
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v12 = *a1;
  if (*a1) {
    *(void *)(v12 + 8) = a1[1];
  }
  *(void *)a1[1] = v12;
  free(a1);
}

CFRunLoopTimerRef *WebSheetStateLaunchApplication(__CFRunLoopTimer *a1, const void *a2, const void *a3, const void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v11)) {
      return 0;
    }
    LODWORD(v28.version) = 138412290;
    *(CFIndex *)((char *)&v28.version + 4) = (CFIndex)a2;
    uint64_t v12 = "Unable to find WebSheet state given interface: %@";
    uint64_t v13 = logger;
    os_log_type_t v14 = v11;
    uint32_t v15 = 12;
LABEL_9:
    _os_log_impl(&dword_225F82000, v13, v14, v12, (uint8_t *)&v28, v15);
    return 0;
  }
  unsigned int v9 = (CFRunLoopTimerRef *)&S_WebSheetStateHeadStorage;
  while (1)
  {
    unsigned int v9 = (CFRunLoopTimerRef *)*v9;
    if (!v9) {
      break;
    }
    if (CFEqual(a2, v9[2])) {
      goto LABEL_19;
    }
  }
  CFTypeID v17 = CFStringGetTypeID();
  if (CFGetTypeID(a2) == v17)
  {
    uint64_t v18 = (CFRunLoopTimerRef *)malloc_type_malloc(0x78uLL, 0x10E004041B342B6uLL);
    unsigned int v9 = v18;
    if (v18)
    {
      v18[14] = 0;
      *((_OWORD *)v18 + 5) = 0u;
      *((_OWORD *)v18 + 6) = 0u;
      *((_OWORD *)v18 + 3) = 0u;
      *((_OWORD *)v18 + 4) = 0u;
      *((_OWORD *)v18 + 1) = 0u;
      *((_OWORD *)v18 + 2) = 0u;
      *(_OWORD *)uint64_t v18 = 0u;
      v18[2] = (CFRunLoopTimerRef)CFRetain(a2);
    }
  }
  else
  {
    unsigned int v9 = 0;
  }
  uint64_t v19 = S_WebSheetStateHeadStorage;
  CFRunLoopTimerRef *v9 = (CFRunLoopTimerRef)S_WebSheetStateHeadStorage;
  if (v19) {
    *(void *)(v19 + 8) = v9;
  }
  S_WebSheetStateHeadStorage = (uint64_t)v9;
  v9[1] = (CFRunLoopTimerRef)&S_WebSheetStateHeadStorage;
LABEL_19:
  v9[4] = a1;
  my_FieldSetRetainedCFType((const void **)v9 + 10, a4);
  my_FieldSetRetainedCFType((const void **)v9 + 11, a3);
  if (v9[8] || v9[3] || v9[12] || v9[13])
  {
    int v20 = mysyslog_get_logger();
    os_log_type_t v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v20, v21))
    {
      LOWORD(v28.version) = 0;
      _os_log_impl(&dword_225F82000, v20, v21, "WebSheet is already running", (uint8_t *)&v28, 2u);
    }
    return v9;
  }
  if (_AMLaunchApplicationWithIdentifier(@"com.apple.WebSheet", 1))
  {
    CFTypeID v22 = mysyslog_get_logger();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v22, v23)) {
      return 0;
    }
    LOWORD(v28.version) = 0;
    uint64_t v12 = "Failed to launch WebSheet";
    uint64_t v13 = v22;
    os_log_type_t v14 = v23;
    uint32_t v15 = 2;
    goto LABEL_9;
  }
  v28.version = 0;
  memset(&v28.retain, 0, 24);
  v28.info = v9;
  CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFRunLoopTimerRef v26 = CFRunLoopTimerCreate(v24, Current + 10.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)WebSheetLaunchTimeout, &v28);
  v9[3] = v26;
  if (v26)
  {
    uint64_t v27 = CFRunLoopGetCurrent();
    CFRunLoopAddTimer(v27, v9[3], (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  }
  return v9;
}

void WebSheetLaunchTimeout(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 24) == a1)
  {
    if (!*(unsigned char *)(a2 + 73))
    {
      *(unsigned char *)(a2 + 73) = 1;
      if (*(unsigned char *)(a2 + 72) == 1) {
        S_webSheetDoneCallback(*(void *)(a2 + 32), 2, 0);
      }
    }
    WebSheetStateCleanup((uint64_t *)a2);
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_225F82000, logger, v3, "Timer fired but no timer set", v5, 2u);
    }
  }
}

uint64_t WebSheetStateSetIsUIRequired(uint64_t result, int a2)
{
  if (result)
  {
    if (*(unsigned __int8 *)(result + 112) != a2)
    {
      *(unsigned char *)(result + 112) = a2;
      return notify_post((const char *)*MEMORY[0x263F308F0]);
    }
  }
  return result;
}

uint64_t WebSheetStateGetIsUIRequired(uint64_t result)
{
  if (result) {
    return *(unsigned __int8 *)(result + 112);
  }
  return result;
}

void WebSheetHandlerInitialize(uint64_t (*a1)(void, void, void))
{
  S_WebSheetStateHeadStorage = 0;
  CommandHandlerClassRegister(1u, (uint64_t)WebSheetHandlerMethods);
  S_webSheetDoneCallback = a1;
}

uint64_t CNSServerDebugLaunchWebsheet(uint64_t a1, UInt8 *a2, unsigned int a3, _DWORD *a4, _OWORD *a5)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  *a4 = 1;
  long long v8 = a5[1];
  v30[0] = *a5;
  v30[1] = v8;
  if (isCallingInternalProcEntitled(v30))
  {
    if (!CaptiveIsActive())
    {
      *a4 = 6;
      goto LABEL_25;
    }
    CFDataRef v9 = my_CFPropertyListCreateWithBytePtrAndLength(a2, a3);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (v9 && CFGetTypeID(v9) == TypeID)
    {
      CFBooleanRef Value = (__CFString *)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x263F308A8]);
      CFTypeID v12 = CFStringGetTypeID();
      uint64_t v13 = @"http://www.apple.com";
      if (Value && CFGetTypeID(Value) == v12) {
        uint64_t v13 = Value;
      }
      os_log_type_t v14 = (__CFString *)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x263F30888]);
      CFTypeID v15 = CFStringGetTypeID();
      int v16 = @"en0";
      if (v14 && CFGetTypeID(v14) == v15) {
        int v16 = v14;
      }
      CFTypeID v17 = (__CFString *)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x263F30898]);
      CFTypeID v18 = CFStringGetTypeID();
      uint64_t v19 = @"AppleWiFi";
      if (v17 && CFGetTypeID(v17) == v18) {
        uint64_t v19 = v17;
      }
      logger = mysyslog_get_logger();
      os_log_type_t v21 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v21))
      {
        LODWORD(v30[0]) = 138412290;
        *(void *)((char *)v30 + 4) = v9;
        _os_log_impl(&dword_225F82000, logger, v21, "launching websheet: %@", (uint8_t *)v30, 0xCu);
      }
      CFTypeID v22 = WebSheetStateLaunchApplication(0, v16, v13, v19);
      if (v22)
      {
        *a4 = 0;
        *((unsigned char *)v22 + 72) = 1;
      }
      else
      {
        CFRunLoopTimerContext v28 = mysyslog_get_logger();
        os_log_type_t v29 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v28, v29))
        {
          LOWORD(v30[0]) = 0;
          _os_log_impl(&dword_225F82000, v28, v29, "CreateWebSheet failed", (uint8_t *)v30, 2u);
        }
      }
LABEL_24:
      CFRelease(v9);
      goto LABEL_25;
    }
    __int16 v25 = mysyslog_get_logger();
    os_log_type_t v26 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v25, v26))
    {
      LOWORD(v30[0]) = 0;
      _os_log_impl(&dword_225F82000, v25, v26, "WebSheet data is invalid", (uint8_t *)v30, 2u);
    }
    *a4 = 22;
    if (v9) {
      goto LABEL_24;
    }
  }
  else
  {
    *a4 = 1;
    os_log_type_t v23 = mysyslog_get_logger();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      LOWORD(v30[0]) = 0;
      _os_log_impl(&dword_225F82000, v23, v24, "Calling application is not entitled", (uint8_t *)v30, 2u);
    }
  }
LABEL_25:
  if (a2) {
    MEMORY[0x22A643670](*MEMORY[0x263EF8960], a2, a3);
  }
  return 0;
}

void WebSheetStateClearCheckInTimer(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(Current, *(CFRunLoopTimerRef *)(a1 + 24), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(a1 + 24));
    os_log_type_t v3 = *(const void **)(a1 + 24);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 24) = 0;
    }
  }
}

void ProberContextRemove(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = ProberContextGet(a1);
  if (v2)
  {
    os_log_type_t v3 = v2;
    uint64_t v4 = (uint64_t *)(v2 + 8);
    if (*((void *)v2 + 1))
    {
      logger = mysyslog_get_logger();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v6))
      {
        uint64_t v7 = *v4;
        int v13 = 138412546;
        os_log_type_t v14 = a1;
        __int16 v15 = 2048;
        uint64_t v16 = v7;
        _os_log_impl(&dword_225F82000, logger, v6, "prober %@ detect %p removed", (uint8_t *)&v13, 0x16u);
      }
      captive_agent_abort_probe(v4);
    }
    uint64_t v9 = *((void *)v3 + 2);
    long long v8 = (uint64_t *)(v3 + 16);
    if (v9)
    {
      CFDictionaryRef v10 = mysyslog_get_logger();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = *v8;
        int v13 = 138412546;
        os_log_type_t v14 = a1;
        __int16 v15 = 2048;
        uint64_t v16 = v12;
        _os_log_impl(&dword_225F82000, v10, v11, "prober %@ query_api %p removed", (uint8_t *)&v13, 0x16u);
      }
      captive_agent_abort_query(v8);
    }
    CFDictionaryRemoveValue((CFMutableDictionaryRef)S_prober_list, a1);
    if (!CFDictionaryGetCount((CFDictionaryRef)S_prober_list))
    {
      if (S_prober_list)
      {
        CFRelease((CFTypeRef)S_prober_list);
        S_prober_list = 0;
      }
    }
  }
}

const UInt8 *ProberContextGet(void *key)
{
  if (!S_prober_list) {
    return 0;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)S_prober_list, key);
  if (!Value) {
    return 0;
  }

  return CFDataGetBytePtr(Value);
}

uint64_t WebSheetAuthorize(_OWORD *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v2 = a1[1];
  *(_OWORD *)os_log_type_t v21 = *a1;
  *(_OWORD *)&v21[16] = v2;
  int pid = audit_token_get_pid(v21);
  long long v4 = a1[1];
  *(_OWORD *)os_log_type_t v21 = *a1;
  *(_OWORD *)&v21[16] = v4;
  uint64_t has_BOOLean_entitlement = audit_token_has_BOOLean_entitlement(v21, @"com.apple.captive.private");
  logger = mysyslog_get_logger();
  os_log_type_t v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v7))
  {
    long long v8 = "has";
    if (!has_BOOLean_entitlement) {
      long long v8 = "does not have";
    }
    *(_DWORD *)os_log_type_t v21 = 67109634;
    *(_DWORD *)&v21[4] = pid;
    *(_WORD *)&v21[8] = 2080;
    *(void *)&v21[10] = v8;
    *(_WORD *)&v21[18] = 2080;
    *(void *)&v21[20] = "com.apple.captive.private";
    _os_log_impl(&dword_225F82000, logger, v7, "pid %d %s entitlement [%s]", v21, 0x1Cu);
  }
  if (has_BOOLean_entitlement)
  {
    if (pid >= 1)
    {
      uint64_t v9 = &S_WebSheetStateHeadStorage;
      while (1)
      {
        uint64_t v9 = (uint64_t *)*v9;
        if (!v9) {
          break;
        }
        int v10 = *((_DWORD *)v9 + 19);
        if (v10 == pid && v10 >= 1)
        {
          uint64_t v12 = mysyslog_get_logger();
          os_log_type_t v13 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v12, v13))
          {
            uint64_t v14 = v9[2];
            int v15 = *((_DWORD *)v9 + 19);
            *(_DWORD *)os_log_type_t v21 = 138412546;
            *(void *)&v21[4] = v14;
            *(_WORD *)&v21[12] = 1024;
            *(_DWORD *)&v21[14] = v15;
            _os_log_impl(&dword_225F82000, v12, v13, "WebSheet for %@ already associated with pid %d", v21, 0x12u);
          }
          goto LABEL_15;
        }
      }
      CFTypeID v18 = &S_WebSheetStateHeadStorage;
      while (1)
      {
        CFTypeID v18 = (uint64_t *)*v18;
        if (!v18) {
          break;
        }
        if (!*((_DWORD *)v18 + 19))
        {
          uint64_t has_BOOLean_entitlement = *((unsigned __int8 *)v18 + 72);
          if (*((unsigned char *)v18 + 72)) {
            int v19 = pid;
          }
          else {
            int v19 = 0;
          }
          *((_DWORD *)v18 + 19) = v19;
          return has_BOOLean_entitlement;
        }
      }
    }
LABEL_15:
    uint64_t v16 = mysyslog_get_logger();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)os_log_type_t v21 = 0;
      _os_log_impl(&dword_225F82000, v16, v17, "No state found to support WebSheet", v21, 2u);
    }
  }
  return has_BOOLean_entitlement;
}

uint64_t WebSheetRegister(uint64_t *a1)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  int PID = CommandHandlerGetPID(*a1);
  os_log_type_t v3 = (const void *)*a1;
  int v4 = CommandHandlerGetPID(*a1);
  BOOL v5 = (const void *)DisplayIDCopy();
  if (v5)
  {
    os_log_type_t v6 = v5;
    os_log_type_t v7 = &S_WebSheetStateHeadStorage;
    while (1)
    {
      os_log_type_t v7 = (uint64_t *)*v7;
      if (!v7) {
        break;
      }
      int v8 = *((_DWORD *)v7 + 19);
      if (v8 == v4 && v8 > 0)
      {
        CommandHandlerSetInformation((uint64_t)v3, v5);
        my_FieldSetRetainedCFType((const void **)v7 + 8, v3);
        WebSheetStateClearCheckInTimer((uint64_t)v7);
        CFRelease(v6);
        int v10 = &S_WebSheetStateHeadStorage;
        while (1)
        {
          int v10 = (uint64_t *)*v10;
          if (!v10) {
            break;
          }
          int v11 = *((_DWORD *)v10 + 19);
          if (v11 == PID && v11 > 0)
          {
            os_log_type_t v13 = (void *)*MEMORY[0x263F308A8];
            keys[0] = *(void **)MEMORY[0x263F30888];
            keys[1] = v13;
            keys[2] = *(void **)MEMORY[0x263F30898];
            values = (void *)v10[2];
            int8x16_t v33 = vextq_s8(*((int8x16_t *)v10 + 5), *((int8x16_t *)v10 + 5), 8uLL);
            CFDictionaryRef v14 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            if (v14)
            {
              CFDictionaryRef v15 = v14;
              uint64_t v16 = 1;
              CFDictionaryRef Command = createCommand(1, 0, (uint64_t)v14, 0);
              CFRelease(v15);
              my_FieldSetRetainedCFType((const void **)v10 + 5, Command);
              CFRelease(Command);
              uint64_t v18 = v10[8];
              if (v18) {
                CommandHandlerNotify(v18);
              }
              return v16;
            }
            logger = mysyslog_get_logger();
            os_log_type_t v30 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(logger, v30))
            {
              LOWORD(keys[0]) = 0;
              __int16 v25 = "info dict is NULL";
              os_log_type_t v26 = logger;
              os_log_type_t v27 = v30;
              uint32_t v28 = 2;
LABEL_27:
              _os_log_impl(&dword_225F82000, v26, v27, v25, (uint8_t *)keys, v28);
            }
            return 1;
          }
        }
        os_log_type_t v23 = mysyslog_get_logger();
        os_log_type_t v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
        {
          LODWORD(keys[0]) = 67109120;
          HIDWORD(keys[0]) = PID;
          __int16 v25 = "Couldn't find the state for pid: %d";
          os_log_type_t v26 = v23;
          os_log_type_t v27 = v24;
          uint32_t v28 = 8;
          goto LABEL_27;
        }
        return 1;
      }
    }
    CFRelease(v5);
  }
  else
  {
    int v19 = mysyslog_get_logger();
    os_log_type_t v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v19, v20))
    {
      LODWORD(keys[0]) = 67109120;
      HIDWORD(keys[0]) = v4;
      _os_log_impl(&dword_225F82000, v19, v20, "Cannot get display ID for pid %d", (uint8_t *)keys, 8u);
    }
  }
  os_log_type_t v21 = mysyslog_get_logger();
  os_log_type_t v22 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v21, v22))
  {
    LODWORD(keys[0]) = 67109120;
    HIDWORD(keys[0]) = PID;
    _os_log_impl(&dword_225F82000, v21, v22, "Failed to register pid %d", (uint8_t *)keys, 8u);
  }
  return 0;
}

void WebSheetRemove(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int PID = CommandHandlerGetPID(a1);
  int v2 = PID;
  os_log_type_t v3 = &S_WebSheetStateHeadStorage;
  while (1)
  {
    os_log_type_t v3 = (uint64_t *)*v3;
    if (!v3) {
      break;
    }
    int v4 = *((_DWORD *)v3 + 19);
    if (v4 == PID && v4 > 0)
    {
      if (!*((unsigned char *)v3 + 73))
      {
        *((unsigned char *)v3 + 73) = 1;
        if (*((unsigned char *)v3 + 72) == 1) {
          S_webSheetDoneCallback(v3[4], 2, 0);
        }
      }
      WebSheetStateCleanup(v3);
      return;
    }
  }
  logger = mysyslog_get_logger();
  os_log_type_t v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v7))
  {
    v8[0] = 67109120;
    v8[1] = v2;
    _os_log_impl(&dword_225F82000, logger, v7, "Couldn't find the state for pid: %d", (uint8_t *)v8, 8u);
  }
}

BOOL WebSheetProvideCommand(uint64_t *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int PID = CommandHandlerGetPID(*a1);
  int v3 = PID;
  int v4 = &S_WebSheetStateHeadStorage;
  while (1)
  {
    int v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    int v5 = *((_DWORD *)v4 + 19);
    if (v5 == PID && v5 > 0)
    {
      CFArrayRef v7 = (const __CFArray *)v4[6];
      if (v4[5])
      {
        if (v7)
        {
          CFIndex Count = CFArrayGetCount(v7);
          CFIndex v9 = Count + 1;
        }
        else
        {
          CFIndex Count = 0;
          CFIndex v9 = 1;
        }
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0, v9, MEMORY[0x263EFFF70]);
        CFArrayAppendValue(Mutable, (const void *)v4[5]);
        CFArrayRef v14 = (const __CFArray *)v4[6];
        if (v14)
        {
          v17.location = 0;
          v17.length = Count;
          CFArrayAppendArray(Mutable, v14, v17);
        }
      }
      else if (v7)
      {
        CFMutableArrayRef Mutable = (__CFArray *)CFRetain(v7);
      }
      else
      {
        CFMutableArrayRef Mutable = 0;
      }
      a1[1] = (uint64_t)Mutable;
      return 1;
    }
  }
  logger = mysyslog_get_logger();
  os_log_type_t v11 = _SC_syslog_os_log_mapping();
  BOOL result = os_log_type_enabled(logger, v11);
  if (result)
  {
    v15[0] = 67109120;
    v15[1] = v3;
    _os_log_impl(&dword_225F82000, logger, v11, "Couldn't find the state for pid: %d", (uint8_t *)v15, 8u);
    return 0;
  }
  return result;
}

uint64_t WebSheetProcessResponse(uint64_t *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int PID = CommandHandlerGetPID(*a1);
  int v3 = &S_WebSheetStateHeadStorage;
  do
  {
    int v3 = (uint64_t *)*v3;
    if (!v3)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v16 = _SC_syslog_os_log_mapping();
      uint64_t result = os_log_type_enabled(logger, v16);
      if (!result) {
        return result;
      }
      int v18 = CommandHandlerGetPID(*a1);
      v30[0] = 67109120;
      v30[1] = v18;
      int v19 = "Couldn't find the state for pid: %d";
      os_log_type_t v20 = logger;
      os_log_type_t v21 = v16;
      uint32_t v22 = 8;
LABEL_23:
      _os_log_impl(&dword_225F82000, v20, v21, v19, (uint8_t *)v30, v22);
      return 0;
    }
    int v4 = *((_DWORD *)v3 + 19);
  }
  while (v4 != PID || v4 <= 0);
  CFDictionaryRef v6 = (const __CFDictionary *)a1[1];
  CFDataRef Value = CFDictionaryGetValue(v6, @"UniqueID");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    os_log_type_t v23 = mysyslog_get_logger();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    uint64_t result = os_log_type_enabled(v23, v24);
    if (!result) {
      return result;
    }
    LOWORD(v30[0]) = 0;
    int v19 = "missing/invalid uniqueID";
    os_log_type_t v20 = v23;
    os_log_type_t v21 = v24;
    uint32_t v22 = 2;
    goto LABEL_23;
  }
  CFDictionaryRef v9 = (const __CFDictionary *)v3[5];
  if (v9 && commandContainsUniqueID(v9, Value))
  {
    v30[0] = 0;
    int v10 = CFDictionaryGetValue(v6, @"Result");
    CFTypeID v11 = CFNumberGetTypeID();
    if (!v10 || CFGetTypeID(v10) != v11 || !CFNumberGetValue((CFNumberRef)v10, kCFNumberSInt32Type, v30)) {
      v30[0] = 4;
    }
    uint64_t v12 = CFDictionaryGetValue(v6, @"ResultOptions");
    CFTypeID v13 = CFDictionaryGetTypeID();
    if (v12)
    {
      if (CFGetTypeID(v12) == v13) {
        CFArrayRef v14 = v12;
      }
      else {
        CFArrayRef v14 = 0;
      }
    }
    else
    {
      CFArrayRef v14 = 0;
    }
    if (!*((unsigned char *)v3 + 73))
    {
      uint64_t v29 = v30[0];
      *((unsigned char *)v3 + 73) = 1;
      if (*((unsigned char *)v3 + 72) == 1) {
        S_webSheetDoneCallback(v3[4], v29, v14);
      }
    }
    return 1;
  }
  uint64_t result = v3[6];
  if (result)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)result);
    if (Count >= 1)
    {
      CFIndex v26 = Count;
      CFIndex v27 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v3[6], v27);
        uint64_t result = (uint64_t)commandContainsUniqueID(ValueAtIndex, Value);
        if (result) {
          break;
        }
        if (v26 == ++v27) {
          return result;
        }
      }
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)v3[6], v27);
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t WebSheetProcessControl(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int valuePtr = 0;
  int PID = CommandHandlerGetPID(*(void *)a1);
  int v3 = PID;
  int v4 = &S_WebSheetStateHeadStorage;
  do
  {
    int v4 = (uint64_t *)*v4;
    if (!v4)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v20))
      {
        *(_DWORD *)SCDynamicStoreContext buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v3;
        _os_log_impl(&dword_225F82000, logger, v20, "Couldn't find the state for pid: %d", buf, 8u);
      }
      return 0;
    }
    int v5 = *((_DWORD *)v4 + 19);
  }
  while (v5 != PID || v5 <= 0);
  CFDataRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), @"Type");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  uint64_t v9 = 0;
  if (!CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr) || valuePtr != 1) {
    return v9;
  }
  CFStringRef v10 = (const __CFString *)v4[2];
  uint64_t v11 = CaptiveCopyInterfaceSSID(v10);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = (const void *)v11;
  CFTypeID v13 = (__CFString *)my_CFUUIDStringCreate(0);
  values = v13;
  CFStringRef v14 = (const __CFString *)CaptiveCopyPortalURL(v10);
  if (v14)
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    apuint64_t i = (unint64_t)captive_agent_query_api((uint64_t)v12, v10, v14, 0xAu, (uint64_t)WebSheetQueryAPIComplete, (uint64_t)v13, (uint64_t)Current);
    CFRange v17 = 0;
    unint64_t v18 = 0;
  }
  else
  {
    CFRange v17 = (__CFString *)CaptiveCopyInitialURL(v10);
    if (!v17)
    {
      CFRange v17 = @"http://www.apple.com/library/test/success.html";
      CFRetain(@"http://www.apple.com/library/test/success.html");
    }
    CFRunLoopRef v22 = CFRunLoopGetCurrent();
    unint64_t v18 = (unint64_t)captive_agent_send_probe(v12, v10, 0, v17, 0x28u, (uint64_t)WebSheetProbeComplete, (uint64_t)v13, (uint64_t)v22);
    apuint64_t i = 0;
  }
  if (v18 | api)
  {
    keys = @"ProbeID";
    *(void *)(a1 + 16) = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    __int16 v25 = values;
    if (!S_prober_list) {
      S_prober_list = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    *(void *)SCDynamicStoreContext buf = v4;
    *(void *)&uint8_t buf[8] = v18;
    *(void *)&uint8_t buf[16] = api;
    CFDataRef v26 = CFDataCreate(0, buf, 24);
    CFDictionarySetValue((CFMutableDictionaryRef)S_prober_list, v25, v26);
    CFRelease(v26);
    CFIndex v27 = mysyslog_get_logger();
    os_log_type_t v28 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v27, v28))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412546;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_225F82000, v27, v28, "prober %@ detect %p added", buf, 0x16u);
    }
    uint64_t v9 = 1;
  }
  else
  {
    os_log_type_t v23 = mysyslog_get_logger();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl(&dword_225F82000, v23, v24, "Unable to send probe to the network", buf, 2u);
    }
    uint64_t v9 = 0;
  }
  CFRelease(v12);
  if (v17) {
    CFRelease(v17);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (values) {
    CFRelease(values);
  }
  return v9;
}

const void *commandContainsUniqueID(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, @"UniqueID");
  if (result) {
    return (const void *)(CFEqual(result, a2) != 0);
  }
  return result;
}

void WebSheetQueryAPIComplete(__CFString *a1, int a2, const void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFDictionaryRef v6 = (uint64_t *)ProberContextGet(a1);
  logger = mysyslog_get_logger();
  if (v6)
  {
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      uint64_t v9 = v6[2];
      *(_DWORD *)SCDynamicStoreContext buf = 138412802;
      os_log_type_t v16 = a1;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 1024;
      int v20 = a2;
      _os_log_impl(&dword_225F82000, logger, v8, "prober %@ query_api %p complete, result %d", buf, 0x1Cu);
    }
    CaptiveUpdateAPIState(*(CFTypeRef *)(*v6 + 16), a3);
    if (a2 == 16) {
      int v10 = 3;
    }
    else {
      int v10 = a2;
    }
    int valuePtr = v10;
    CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    CFDictionaryRef Command = createCommand(2, a1, 0, v11);
    CFRelease(v11);
    WebSheetStateIssueCommand(*v6, Command, 0);
    v6[1] = 0;
    ProberContextRemove(a1);
    CFRelease(Command);
  }
  else
  {
    uint64_t v13 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v13))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      os_log_type_t v16 = a1;
      _os_log_impl(&dword_225F82000, logger, (os_log_type_t)v13, "No context for %@", buf, 0xCu);
    }
  }
}

void WebSheetProbeComplete(__CFString *a1, int a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int valuePtr = a2;
  int v4 = (uint64_t *)ProberContextGet(a1);
  logger = mysyslog_get_logger();
  if (v4)
  {
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      uint64_t v7 = v4[1];
      *(_DWORD *)SCDynamicStoreContext buf = 138412802;
      uint64_t v13 = a1;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      __int16 v16 = 1024;
      int v17 = a2;
      _os_log_impl(&dword_225F82000, logger, v6, "prober %@ detect %p complete, result %d", buf, 0x1Cu);
    }
    CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    CFDictionaryRef Command = createCommand(2, a1, 0, v8);
    CFRelease(v8);
    WebSheetStateIssueCommand(*v4, Command, 0);
    v4[1] = 0;
    ProberContextRemove(a1);
    CFRelease(Command);
  }
  else
  {
    uint64_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v10))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      uint64_t v13 = a1;
      _os_log_impl(&dword_225F82000, logger, (os_log_type_t)v10, "No context for %@", buf, 0xCu);
    }
  }
}

BOOL CaptivePostDataToUserNameAndPassword(const __CFString *a1, const __CFString *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v126 = *MEMORY[0x263EF8340];
  *a4 = 0;
  *a3 = 0;
  CFDictionaryRef v8 = (const __CFDictionary *)CaptiveCopySettings();
  CFDictionaryRef v9 = v8;
  if (!v8 || (CFTypeID v10 = CFGetTypeID(v8), v10 != CFDictionaryGetTypeID()))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v45 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v45))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl(&dword_225F82000, logger, v45, "failed to open settings file", buf, 2u);
    }
    if (!v9) {
      return 0;
    }
    CFDictionaryRef v46 = v9;
    goto LABEL_53;
  }
  CFDataRef Value = CFDictionaryGetValue(v9, @"ScrapingParameters");
  if (Value)
  {
    uint64_t v12 = Value;
    CFTypeID v13 = CFGetTypeID(Value);
    if (v13 == CFDictionaryGetTypeID())
    {
      CFRetain(v12);
      CFRelease(v9);
      if (CaptiveIsDebug())
      {
        __int16 v14 = mysyslog_get_logger();
        os_log_type_t v15 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)SCDynamicStoreContext buf = 138412290;
          CFTypeRef v123 = a1;
          _os_log_impl(&dword_225F82000, v14, v15, "content-type: %@. content:", buf, 0xCu);
        }
        __int16 v16 = mysyslog_get_logger();
        os_log_type_t v17 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)SCDynamicStoreContext buf = 138412290;
          CFTypeRef v123 = a2;
          _os_log_impl(&dword_225F82000, v16, v17, "%@", buf, 0xCu);
        }
      }
      v120 = v4;
      v121 = v5;
      if (CFStringFind(a1, @"multipart/form-data", 1uLL).location != -1)
      {
        CFRange v18 = CFStringFind(a1, @"boundary=", 1uLL);
        if (v18.location == -1 || (CFStringRef v19 = CaptiveCopyValueAfterEqual(a1, v18.location + v18.length)) == 0)
        {
          os_log_type_t v50 = mysyslog_get_logger();
          os_log_type_t v51 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v50, v51))
          {
            *(_DWORD *)SCDynamicStoreContext buf = 138412290;
            CFTypeRef v123 = a1;
            uint32_t v52 = "Failed to find divider in %@";
            uint64_t v53 = v50;
            os_log_type_t v54 = v51;
            uint32_t v55 = 12;
LABEL_60:
            _os_log_impl(&dword_225F82000, v53, v54, v52, buf, v55);
          }
        }
        else
        {
          CFStringRef v20 = v19;
          CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, v19);
          CFRelease(v20);
          if (ArrayBySeparatingStrings)
          {
            uint64_t Count = CFArrayGetCount(ArrayBySeparatingStrings);
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v21, Count, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFDictionaryRef v25 = Mutable;
            uint64_t v119 = Count;
            if (Count >= 1 && Mutable)
            {
              v117 = v12;
              CFIndex v26 = 0;
              while (1)
              {
                CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v26);
                CFIndex location = CFStringFind(ValueAtIndex, @"\r\n", 0).location;
                CFStringRef v29 = @"\r\n";
                if (location == -1)
                {
                  CFIndex v30 = CFStringFind(ValueAtIndex, @"\r", 0).location;
                  CFStringRef v29 = @"\r";
                  if (v30 == -1)
                  {
                    CFIndex v31 = CFStringFind(ValueAtIndex, @"\n", 0).location;
                    CFStringRef v29 = @"\n";
                    if (v31 == -1) {
                      goto LABEL_47;
                    }
                  }
                }
                os_log_type_t v32 = v25;
                CFArrayRef v33 = CFStringCreateArrayBySeparatingStrings(v21, ValueAtIndex, v29);
                CFIndex v34 = CFArrayGetCount(v33);
                CFIndex v35 = v34 - 1;
                if (v34 >= 1)
                {
                  CFIndex v36 = v34;
                  CFStringRef v37 = 0;
                  CFIndex v38 = 0;
                  while (1)
                  {
                    CFStringRef v39 = (const __CFString *)CFArrayGetValueAtIndex(v33, v38);
                    CFStringRef v40 = v39;
                    if (v37)
                    {
                      if (CFStringGetLength(v39))
                      {
                        CFRetain(v40);
                        if (!v33) {
                          goto LABEL_37;
                        }
LABEL_36:
                        CFRelease(v33);
                        goto LABEL_37;
                      }
LABEL_26:
                      if (v36 == ++v38) {
                        goto LABEL_34;
                      }
                    }
                    else
                    {
                      if ((unint64_t)CFStringFind(v39, @"Content-Disposition", 1uLL).location) {
                        goto LABEL_26;
                      }
                      CFRange v41 = CFStringFind(v40, @"name=", 1uLL);
                      if (v41.location == -1) {
                        break;
                      }
                      CFStringRef v37 = CaptiveCopyValueAfterEqual(v40, v41.location + v41.length);
                      CFStringRef v40 = 0;
                      if (!v37) {
                        goto LABEL_35;
                      }
                      BOOL v42 = v35 == v38++;
                      if (v42) {
                        goto LABEL_35;
                      }
                    }
                  }
                }
                CFStringRef v37 = 0;
LABEL_34:
                CFStringRef v40 = 0;
LABEL_35:
                if (v33) {
                  goto LABEL_36;
                }
LABEL_37:
                CFDictionaryRef v25 = v32;
                if (v37)
                {
                  if (v40)
                  {
                    uint64_t v43 = CFStringCopyToLower(v37);
                    CFRelease(v37);
                    if (v43)
                    {
                      CFDictionaryAddValue(v32, v43, v40);
                      CFRelease(v43);
                    }
                  }
                  else
                  {
                    CFStringRef v40 = v37;
                  }
                }
                else if (!v40)
                {
                  goto LABEL_47;
                }
                CFRelease(v40);
LABEL_47:
                if (++v26 == v119)
                {
                  uint64_t v12 = v117;
                  int v4 = v120;
                  int v5 = v121;
                  break;
                }
              }
            }
LABEL_82:
            CFRelease(ArrayBySeparatingStrings);
            if (v25)
            {
              if (CaptiveIsDebug())
              {
                uint64_t v73 = mysyslog_get_logger();
                os_log_type_t v74 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v73, v74))
                {
                  *(_WORD *)SCDynamicStoreContext buf = 0;
                  _os_log_impl(&dword_225F82000, v73, v74, "Parse Dictionary:", buf, 2u);
                }
                v75 = mysyslog_get_logger();
                os_log_type_t v76 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v75, v76))
                {
                  *(_DWORD *)SCDynamicStoreContext buf = 138412290;
                  CFTypeRef v123 = v25;
                  _os_log_impl(&dword_225F82000, v75, v76, "    %@", buf, 0xCu);
                }
              }
              CFArrayRef v77 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v12, @"UserFields");
              if (v77)
              {
                CFArrayRef v78 = v77;
                CFTypeID v79 = CFGetTypeID(v77);
                if (v79 == CFArrayGetTypeID())
                {
                  CFIndex v80 = CFArrayGetCount(v78);
                  CFIndex v81 = v80 - 1;
                  if (v80 >= 1)
                  {
                    CFIndex v82 = 0;
                    do
                    {
                      os_log_type_t v83 = CFArrayGetValueAtIndex(v78, v82);
                      v84 = CFDictionaryGetValue(v25, v83);
                      *int v5 = v84;
                      if (v84) {
                        break;
                      }
                      BOOL v42 = v81 == v82++;
                    }
                    while (!v42);
                  }
                }
              }
              CFArrayRef v85 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v12, @"PasswordFields");
              if (v85)
              {
                CFArrayRef v86 = v85;
                CFTypeID v87 = CFGetTypeID(v85);
                if (v87 == CFArrayGetTypeID())
                {
                  CFIndex v88 = CFArrayGetCount(v86);
                  CFIndex v89 = v88 - 1;
                  if (v88 >= 1)
                  {
                    CFIndex v90 = 0;
                    do
                    {
                      uint64_t v91 = CFArrayGetValueAtIndex(v86, v90);
                      char v92 = CFDictionaryGetValue(v25, v91);
                      CFTypeRef *v4 = v92;
                      if (v92) {
                        break;
                      }
                      BOOL v42 = v89 == v90++;
                    }
                    while (!v42);
                  }
                }
              }
              CFArrayRef v93 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v12, @"RealmFields");
              if (v93 && (v94 = v93, CFTypeID v95 = CFGetTypeID(v93), v95 == CFArrayGetTypeID()))
              {
                CFDictionaryRef v96 = v25;
                CFIndex v97 = CFArrayGetCount(v94);
                if (v97 < 1)
                {
LABEL_108:
                  CFStringRef v102 = 0;
                }
                else
                {
                  CFIndex v98 = v97;
                  CFIndex v99 = 0;
                  while (1)
                  {
                    uint64_t v100 = CFArrayGetValueAtIndex(v94, v99);
                    CFStringRef v101 = (const __CFString *)CFDictionaryGetValue(v96, v100);
                    if (v101) {
                      break;
                    }
                    if (v98 == ++v99) {
                      goto LABEL_108;
                    }
                  }
                  CFStringRef v102 = v101;
                }
                CFDictionaryRef v25 = v96;
              }
              else
              {
                CFStringRef v102 = 0;
              }
              if (*v5)
              {
                if (CFStringFind((CFStringRef)*v5, @"@", 0).location == -1)
                {
                  if (v102 && CFStringGetLength(v102) >= 1)
                  {
                    if (CFStringGetCharacterAtIndex(v102, 0) == 64) {
                      CFStringRef v103 = CFStringCreateWithFormat(v21, 0, @"%@%@", *v5, v102);
                    }
                    else {
                      CFStringRef v103 = CFStringCreateWithFormat(v21, 0, @"%@@%@", *v5, v102);
                    }
                    *int v5 = v103;
                  }
                  else
                  {
                    *int v5 = 0;
                  }
                }
                else
                {
                  CFRetain(*v5);
                }
              }
              if (*v4) {
                CFRetain(*v4);
              }
              CFRelease(v25);
              if (*v5)
              {
                v104 = v12;
                CFArrayRef v105 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v12, @"DisabledRealms");
                if (v105)
                {
                  CFArrayRef v106 = v105;
                  CFTypeID v107 = CFGetTypeID(v105);
                  if (v107 == CFArrayGetTypeID())
                  {
                    CFIndex v108 = CFArrayGetCount(v106);
                    if (v108 >= 1)
                    {
                      CFIndex v109 = v108;
                      for (CFIndex i = 0; i != v109; ++i)
                      {
                        CFStringRef v111 = (const __CFString *)*v5;
                        CFStringRef v112 = (const __CFString *)CFArrayGetValueAtIndex(v106, i);
                        if (CFStringHasSuffix(v111, v112))
                        {
                          v113 = mysyslog_get_logger();
                          os_log_type_t v114 = _SC_syslog_os_log_mapping();
                          if (os_log_type_enabled(v113, v114))
                          {
                            CFTypeRef v115 = *v121;
                            v116 = CFArrayGetValueAtIndex(v106, i);
                            *(_DWORD *)SCDynamicStoreContext buf = 138412546;
                            CFTypeRef v123 = v115;
                            __int16 v124 = 2112;
                            v125 = v116;
                            _os_log_impl(&dword_225F82000, v113, v114, "User %@ is in disabled realm %@, not caching credentials", buf, 0x16u);
                          }
                          int v4 = v120;
                          int v5 = v121;
                          if (*v121)
                          {
                            CFRelease(*v121);
                            CFTypeRef *v121 = 0;
                          }
                        }
                      }
                    }
                  }
                }
                uint64_t v12 = v104;
                if (*v5)
                {
                  if (*v4) {
                    goto LABEL_141;
                  }
                  CFRelease(*v5);
                  *int v5 = 0;
                }
              }
              if (*v4)
              {
                CFRelease(*v4);
                CFTypeRef *v4 = 0;
              }
LABEL_141:
              CFRelease(v12);
              if (*v5) {
                return *v4 != 0;
              }
              return 0;
            }
            goto LABEL_109;
          }
          __int16 v71 = mysyslog_get_logger();
          os_log_type_t v72 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v71, v72))
          {
            *(_WORD *)SCDynamicStoreContext buf = 0;
            uint32_t v52 = "CFStringCreateArrayBySeparatingStrings failed";
            uint64_t v53 = v71;
            os_log_type_t v54 = v72;
            uint32_t v55 = 2;
            goto LABEL_60;
          }
        }
LABEL_109:
        CFDictionaryRef v46 = (const __CFDictionary *)v12;
LABEL_53:
        CFRelease(v46);
        return 0;
      }
      CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFArrayRef v56 = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, @"&");
      if (!v56) {
        goto LABEL_109;
      }
      CFArrayRef ArrayBySeparatingStrings = v56;
      CFIndex v57 = CFArrayGetCount(v56);
      if (v57 < 1)
      {
        CFDictionaryRef v25 = 0;
        goto LABEL_82;
      }
      CFIndex v58 = v57;
      v118 = v12;
      CFIndex v59 = 0;
      CFDictionaryRef v25 = 0;
      while (1)
      {
        if (!v25)
        {
          CFDictionaryRef v25 = CFDictionaryCreateMutable(v21, v58, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          if (!v25)
          {
LABEL_78:
            uint64_t v12 = v118;
            goto LABEL_82;
          }
        }
        CFStringRef v60 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v59);
        CFArrayRef v61 = CFStringCreateArrayBySeparatingStrings(v21, v60, @"=");
        if (v61) {
          break;
        }
LABEL_77:
        if (v58 == ++v59) {
          goto LABEL_78;
        }
      }
      CFArrayRef v62 = v61;
      if (CFArrayGetCount(v61) != 2)
      {
LABEL_76:
        CFRelease(v62);
        goto LABEL_77;
      }
      CFArrayRef v63 = ArrayBySeparatingStrings;
      CFTypeRef v64 = v25;
      CFStringRef v65 = (const __CFString *)CFArrayGetValueAtIndex(v62, 0);
      CFStringRef v66 = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(v21, v65, &stru_26D9AB620, 0x8000100u);
      CFStringRef v67 = (const __CFString *)CFArrayGetValueAtIndex(v62, 1);
      CFAllocatorRef v68 = v21;
      CFStringRef v69 = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(v21, v67, &stru_26D9AB620, 0x8000100u);
      if (v66)
      {
        uint64_t v70 = CFStringCopyToLower(v66);
        CFRelease(v66);
        if (v70 && v69)
        {
          CFDictionaryAddValue(v64, v70, v69);
        }
        else if (!v70)
        {
          goto LABEL_74;
        }
        CFRelease(v70);
      }
LABEL_74:
      CFAllocatorRef v21 = v68;
      CFDictionaryRef v25 = v64;
      CFArrayRef ArrayBySeparatingStrings = v63;
      int v4 = v120;
      int v5 = v121;
      if (v69) {
        CFRelease(v69);
      }
      goto LABEL_76;
    }
  }
  CFRelease(v9);
  BOOL v48 = mysyslog_get_logger();
  os_log_type_t v49 = _SC_syslog_os_log_mapping();
  BOOL result = os_log_type_enabled(v48, v49);
  if (result)
  {
    *(_WORD *)SCDynamicStoreContext buf = 0;
    _os_log_impl(&dword_225F82000, v48, v49, "no scraping parameters", buf, 2u);
    return 0;
  }
  return result;
}

__CFString *CFStringCopyToLower(CFStringRef theString)
{
  CFMutableDictionaryRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  int v2 = MutableCopy;
  if (MutableCopy) {
    CFStringLowercase(MutableCopy, 0);
  }
  return v2;
}

CFStringRef CaptiveCopyValueAfterEqual(const __CFString *a1, CFIndex a2)
{
  CFIndex Length = CFStringGetLength(a1);
  if (Length < a2) {
    return 0;
  }
  CFIndex v5 = Length;
  int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, a2);
  if (CharacterAtIndex == 34) {
    ++a2;
  }
  if (v5 <= a2) {
    return 0;
  }
  int v7 = CharacterAtIndex;
  CFIndex v8 = 0;
  while (1)
  {
    unsigned int v9 = CFStringGetCharacterAtIndex(a1, a2 + v8);
    if (v7 == 34 && v9 == 34) {
      break;
    }
    if (v9 <= 0x3B && ((1 << v9) & 0x800000100002400) != 0) {
      break;
    }
    ++v8;
    if (a2 + v8 >= v5)
    {
      CFIndex v8 = v5 - a2;
      break;
    }
  }
  if (!v8) {
    return 0;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v11.CFIndex location = a2;
  v11.length = v8;

  return CFStringCreateWithSubstring(v10, a1, v11);
}

os_log_t mysyslog_init_logger(os_log_t result)
{
  if (result <= 3 && !S_captive_logger)
  {
    BOOL result = os_log_create("com.apple.captive", S_captive_os_log_categories[result]);
    S_captive_logger = (uint64_t)result;
  }
  return result;
}

CFDataRef my_CFPropertyListCreateData(CFPropertyListRef propertyList)
{
  return CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
}

CFDataRef my_CFPropertyListCreateVMData(CFPropertyListRef propertyList, _DWORD *a2)
{
  vm_address_t address = 0;
  *a2 = 0;
  CFDataRef result = CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (result)
  {
    CFDataRef v4 = result;
    int Length = CFDataGetLength(result);
    if (!vm_allocate(*MEMORY[0x263EF8960], &address, Length, 1))
    {
      os_log_type_t v6 = (void *)address;
      BytePtr = CFDataGetBytePtr(v4);
      memmove(v6, BytePtr, Length);
      *a2 = Length;
    }
    CFRelease(v4);
    return (const __CFData *)address;
  }
  return result;
}

CFDataRef my_CFPropertyListCreateWithBytePtrAndLength(UInt8 *bytes, int a2)
{
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, bytes, a2, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (result)
  {
    CFDataRef v3 = result;
    CFPropertyListRef v4 = CFPropertyListCreateWithData(0, result, 0, 0, 0);
    CFRelease(v3);
    return (const __CFData *)v4;
  }
  return result;
}

uint64_t my_CFEqual(const void *a1, const void *a2)
{
  if (!a1) {
    return a2 == 0;
  }
  if (a2) {
    return CFEqual(a1, a2);
  }
  return 0;
}

CFStringRef my_CFUUIDStringCreate(const __CFAllocator *a1)
{
  CFUUIDRef v2 = CFUUIDCreate(a1);
  CFStringRef v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

void my_CFDictionaryMergeDictionary(void *context, CFDictionaryRef theDict)
{
}

void merge_dict_applier(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

CFArrayRef my_CFArrayContainsStringsOnly(const __CFArray *result)
{
  unsigned __int8 context = 1;
  if (result)
  {
    CFArrayRef v1 = result;
    v3.length = CFArrayGetCount(result);
    v3.CFIndex location = 0;
    CFArrayApplyFunction(v1, v3, (CFArrayApplierFunction)CheckIsString, &context);
    return (const __CFArray *)context;
  }
  return result;
}

CFTypeID CheckIsString(const void *a1, unsigned char *a2)
{
  CFTypeID result = CFStringGetTypeID();
  if (!a1 || (CFTypeID v5 = result, result = CFGetTypeID(a1), result != v5)) {
    *a2 = 0;
  }
  return result;
}

uint64_t my_CFArrayContainsAnyArrayValues(CFArrayRef theArray, const __CFArray *a2)
{
  uint64_t result = 0;
  if (theArray && a2)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFIndex v6 = CFArrayGetCount(a2);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      CFIndex v7 = v6;
      CFIndex v8 = 0;
      while (1)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        v10.CFIndex location = 0;
        v10.length = v7;
        if (CFArrayContainsValue(a2, v10, ValueAtIndex)) {
          break;
        }
        if (Count == ++v8) {
          return 0;
        }
      }
      return 1;
    }
  }
  return result;
}

void my_FieldSetRetainedCFType(const void **a1, CFTypeRef cf)
{
  CFPropertyListRef v4 = *a1;
  if (cf) {
    CFRetain(cf);
  }
  if (v4) {
    CFRelease(v4);
  }
  *a1 = cf;
}

uint64_t my_CFDictionaryGetBooleanValue(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFDataRef Value = CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return a3;
  }

  return CFBooleanGetValue((CFBooleanRef)Value);
}

uint64_t my_CFArrayPointerAddValue(CFArrayRef *a1, const void *a2)
{
  CFArrayRef v3 = *a1;
  if (*a1)
  {
    v7.length = CFArrayGetCount(*a1);
    v7.CFIndex location = 0;
    if (CFArrayContainsValue(v3, v7, a2)) {
      return 0;
    }
    CFMutableDictionaryRef Mutable = v3;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    *a1 = Mutable;
  }
  CFArrayAppendValue(Mutable, a2);
  return 1;
}

CFIndex my_CFArrayFindValue(const __CFArray *a1, const void *a2)
{
  if (!a1) {
    return -1;
  }
  v4.length = CFArrayGetCount(a1);
  v4.CFIndex location = 0;

  return CFArrayGetFirstIndexOfValue(a1, v4, a2);
}

uint64_t my_CFArrayFindDictWithKeyAndValue(const __CFArray *a1, const void *a2, const void *a3)
{
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v8);
        CFDataRef Value = CFDictionaryGetValue(ValueAtIndex, a2);
        int v11 = a3 == 0;
        if (!Value) {
          goto LABEL_7;
        }
        if (a3) {
          break;
        }
LABEL_8:
        if (v7 == ++v8) {
          return -1;
        }
      }
      int v11 = CFEqual(Value, a3);
LABEL_7:
      if (v11) {
        return v8;
      }
      goto LABEL_8;
    }
  }
  return -1;
}

CFStringRef URLStringCopyHostName(CFStringRef URLString)
{
  if (!URLString) {
    return 0;
  }
  CFURLRef v1 = CFURLCreateWithString(0, URLString, 0);
  if (!v1) {
    return 0;
  }
  CFURLRef v2 = v1;
  CFStringRef v3 = CFURLCopyHostName(v1);
  CFRelease(v2);
  return v3;
}

void CNSPreferencesFlush()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_225F82000, logger, v1, (const char *)&unk_225FB3E9A, (uint8_t *)&v15, 2u);
  }
  if (preferencesURL) {
    BOOL v2 = preferences == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    CFStringRef v3 = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v3, v4)) {
      return;
    }
    LOWORD(v15) = 0;
    CFTypeID v5 = "not saving preferences - URL or preferences is NULL";
LABEL_10:
    CFIndex v6 = v3;
    os_log_type_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_24;
  }
  unsigned int v9 = CFWriteStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFURLRef)preferencesURL);
  if (v9)
  {
    CFRange v10 = v9;
    if (CFWriteStreamOpen(v9))
    {
      if (CFPropertyListWrite((CFPropertyListRef)preferences, v10, (CFPropertyListFormat)preferencesFormat, 0, 0))
      {
        CFRelease(v10);
        CFStringRef v3 = mysyslog_get_logger();
        os_log_type_t v4 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v3, v4)) {
          return;
        }
        LOWORD(v15) = 0;
        CFTypeID v5 = "Updated preferences";
        goto LABEL_10;
      }
      int v11 = 1;
    }
    else
    {
      int v11 = 2;
    }
    CFRelease(v10);
  }
  else
  {
    int v11 = 2;
  }
  uint64_t v12 = mysyslog_get_logger();
  os_log_type_t v13 = _SC_syslog_os_log_mapping();
  if (!os_log_type_enabled(v12, v13)) {
    return;
  }
  __int16 v14 = "failed to open write stream";
  if (v11 == 1) {
    __int16 v14 = "failed to write to stream";
  }
  int v15 = 136315138;
  __int16 v16 = v14;
  CFTypeID v5 = "Failed to flush preferences. err =%s";
  CFIndex v6 = v12;
  os_log_type_t v7 = v13;
  uint32_t v8 = 12;
LABEL_24:
  _os_log_impl(&dword_225F82000, v6, v7, v5, (uint8_t *)&v15, v8);
}

const void *CNSPreferencesGet(const void *a1)
{
  CFDictionaryRef v2 = CNSPreferences();

  return CFDictionaryGetValue(v2, a1);
}

CFMutableDictionaryRef CNSPreferences()
{
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)preferences;
  CFURLRef v1 = (const __CFURL *)preferencesURL;
  CFDictionaryRef v2 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (__PAIR128__(preferencesURL, preferences) == 0)
  {
    CFURLRef v1 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)"/Library/Preferences/com.apple.captive.plist", 45, 0);
    preferencesURL = (uint64_t)v1;
    CFMutableDictionaryRef result = (CFMutableDictionaryRef)preferences;
  }
  if (result) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0;
  }
  if (!v3)
  {
    CFAllocatorRef v4 = *v2;
    CFTypeID v5 = CFReadStreamCreateWithFile(*v2, v1);
    if (v5)
    {
      CFIndex v6 = v5;
      if (CFReadStreamOpen(v5))
      {
        CFPropertyListRef v7 = CFPropertyListCreateWithStream(v4, v6, 0, 1uLL, (CFPropertyListFormat *)&preferencesFormat, 0);
        preferences = (uint64_t)v7;
        if (v7)
        {
          uint32_t v8 = v7;
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (CFGetTypeID(v8) == TypeID)
          {
            uint64_t v10 = 0;
            char v11 = 1;
            do
            {
              while (1)
              {
                uint64_t v12 = off_264784ED8[v10];
                if (!CFDictionaryContainsKey((CFDictionaryRef)preferences, v12)) {
                  break;
                }
                CFDictionaryRemoveValue((CFMutableDictionaryRef)preferences, v12);
                char v11 = 0;
                BOOL v3 = v10++ == 2;
                if (v3) {
                  goto LABEL_23;
                }
              }
              ++v10;
            }
            while (v10 != 3);
            if (v11) {
              goto LABEL_24;
            }
LABEL_23:
            CNSPreferencesFlush();
          }
          else
          {
            logger = mysyslog_get_logger();
            os_log_type_t v14 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(logger, v14))
            {
              *(_WORD *)SCDynamicStoreContext buf = 0;
              _os_log_impl(&dword_225F82000, logger, v14, "preferences are the wrong format", buf, 2u);
            }
            if (preferences)
            {
              CFRelease((CFTypeRef)preferences);
              preferences = 0;
            }
          }
        }
      }
LABEL_24:
      CFRelease(v6);
    }
    CFMutableDictionaryRef result = (CFMutableDictionaryRef)preferences;
  }
  if (!result)
  {
    int v15 = mysyslog_get_logger();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_225F82000, v15, v16, "Creating new preferences", v17, 2u);
    }
    CFMutableDictionaryRef result = CFDictionaryCreateMutable(*v2, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    preferences = (uint64_t)result;
  }
  return result;
}

void CNSPreferencesSet(const void *a1, const void *a2)
{
  CFAllocatorRef v4 = CNSPreferences();
  CFDictionarySetValue(v4, a1, a2);

  CNSPreferencesFlush();
}

int *NotifyRegister(__CFRunLoop *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint32_t v8 = &sourceHead;
  while (1)
  {
    uint32_t v8 = (uint64_t *)*v8;
    if (!v8) {
      break;
    }
    if ((__CFRunLoop *)v8[3] == a1) {
      goto LABEL_7;
    }
  }
  unsigned int v9 = (uint64_t *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
  if (!v9) {
    return 0;
  }
  uint32_t v8 = v9;
  _DWORD v9[2] = 0;
  v9[3] = (uint64_t)a1;
  uint64_t *v9 = sourceHead;
  v9[1] = 0;
  sourceHead = (uint64_t)v9;
LABEL_7:
  mach_port_t notify_port = 0;
  uint64_t v10 = (__CFMachPort *)v8[2];
  if (v10)
  {
    mach_port_t Port = CFMachPortGetPort(v10);
    mach_port_t notify_port = Port;
  }
  else
  {
    mach_port_t Port = 0;
  }
  uint64_t v12 = (int *)malloc_type_malloc(0x28uLL, 0x10A0040DE786E1EuLL);
  os_log_type_t v13 = v12;
  if (v12)
  {
    v12[8] = 0;
    *((void *)v12 + 1) = v8;
    *((void *)v12 + 2) = a3;
    *((void *)v12 + 3) = a4;
    if (notify_register_mach_port(a2, &notify_port, Port != 0, v12 + 8))
    {
LABEL_12:
      free(v13);
      return 0;
    }
    if (v8[2]) {
      goto LABEL_15;
    }
    v18[1] = 0;
    long long v19 = 0u;
    uint64_t v20 = 0;
    v18[2] = (char *)v8;
    v18[0] = 0;
    asprintf(v18, "CaptiveNetworkSupport/%s", a2);
    _DWORD v8[2] = _SC_CFMachPortCreateWithPort();
    free(v18[0]);
    int v15 = (__CFMachPort *)v8[2];
    if (v15)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x263EFFB08], v15, 0);
      if (RunLoopSource)
      {
        uint64_t v17 = RunLoopSource;
        CFRunLoopAddSource(a1, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
        CFRelease(v17);
LABEL_15:
        *(void *)os_log_type_t v13 = v8[1];
        v8[1] = (uint64_t)v13;
        return v13;
      }
      CFMachPortInvalidate((CFMachPortRef)v8[2]);
      CFRelease((CFTypeRef)v8[2]);
      _DWORD v8[2] = 0;
    }
    notify_cancel(v13[8]);
    goto LABEL_12;
  }
  return v13;
}

BOOL NotifySet(uint64_t a1, uint64_t a2)
{
  return notify_set_state(*(_DWORD *)(a1 + 32), a2) == 0;
}

void NotificationDispose(void *a1)
{
  uint64_t v2 = a1[1];
  BOOL v3 = (void *)(v2 + 8);
  while (1)
  {
    CFAllocatorRef v4 = v3;
    BOOL v3 = (void *)*v3;
    if (!v3) {
      break;
    }
    if (v3 == a1)
    {
      void *v4 = *a1;
      break;
    }
  }
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  if (!*(void *)(v2 + 8))
  {
    CFMachPortInvalidate(*(CFMachPortRef *)(v2 + 16));
    CFRelease(*(CFTypeRef *)(v2 + 16));
    *(void *)(v2 + 16) = 0;
  }
  notify_cancel(*((_DWORD *)a1 + 8));

  free(a1);
}

void CNAccountsImportCarrierCredentials()
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFDictionaryRef v0 = (const __CFDictionary *)CNAccountsGet();
  if (!v0) {
    return;
  }
  CFDictionaryRef v1 = v0;
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    CFArrayRef v3 = Mutable;
    CFDictionaryApplyFunction(v1, (CFDictionaryApplierFunction)CNAccountsCarrierPurgeApplier, Mutable);
    CFIndex Count = CFArrayGetCount(v3);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        CFDictionaryRemoveValue(v1, ValueAtIndex);
      }
    }
    CFRelease(v3);
  }
  uint64_t v8 = CopyCarrierAccountSettings(@"WISPrAccounts");
  if (!v8)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v19))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_225F82000, logger, v19, "no carrier credentials", (uint8_t *)&v22, 2u);
    }
    goto LABEL_17;
  }
  CFDictionaryRef v9 = (const __CFDictionary *)v8;
  BOOL IsDebug = CaptiveIsDebug();
  char v11 = mysyslog_get_logger();
  os_log_type_t v12 = _SC_syslog_os_log_mapping();
  BOOL v13 = os_log_type_enabled(v11, v12);
  if (IsDebug)
  {
    if (v13)
    {
      int v22 = 138412290;
      CFDictionaryRef v23 = v9;
      os_log_type_t v14 = "merging carrier accounts: %@";
      int v15 = v11;
      os_log_type_t v16 = v12;
      uint32_t v17 = 12;
LABEL_15:
      _os_log_impl(&dword_225F82000, v15, v16, v14, (uint8_t *)&v22, v17);
    }
  }
  else if (v13)
  {
    LOWORD(v22) = 0;
    os_log_type_t v14 = "merging carrier accounts";
    int v15 = v11;
    os_log_type_t v16 = v12;
    uint32_t v17 = 2;
    goto LABEL_15;
  }
  CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)CNAccountsCarrierMergeApplier, v1);
  CFRelease(v9);
LABEL_17:
  if (CaptiveIsDebug())
  {
    uint64_t v20 = mysyslog_get_logger();
    os_log_type_t v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v20, v21))
    {
      int v22 = 138412290;
      CFDictionaryRef v23 = v1;
      _os_log_impl(&dword_225F82000, v20, v21, "accounts: %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

const void *CNAccountsGet()
{
  CFMutableDictionaryRef result = (const void *)CNAccountsGet_preferences;
  if (!CNAccountsGet_preferences)
  {
    sSourcesHead = (uint64_t)&CNAccountsInit_keychainSource;
    qword_26ABEB428 = 0;
    unk_26ABEB430 = 0;
    qword_26ABEB418 = @"Keychain";
    unk_26ABEB420 = CNAccountsKeychainQueryStart;
    CNAccountsInit_keychainSource = (uint64_t)&CNAccountsInit_attSource;
    qword_26ABEB3F0 = kWISPrPasswordATTMD5;
    unk_26ABEB3F8 = CNAccountsATTQueryStart;
    CNAccountsInit_attSource = (uint64_t)&CNAccountsInit_sfrSource;
    qword_26ABEB400 = 0;
    unk_26ABEB408 = CNAccountsATTValidate;
    qword_26ABEB440 = @"SFR WiFi";
    unk_26ABEB448 = CNAccountsSFRQueryStart;
    qword_26ABEB450 = (uint64_t)CNAccountsSFRRejected;
    CNAccountsInit_sfrSource = (uint64_t)&CNAccountsInit_vzwSource;
    qword_26ABEB458 = (uint64_t)CNAccountsSFRValidate;
    qword_26ABEB468 = @"Verizon WiFi";
    unk_26ABEB470 = CNAccountsVZWQueryStart;
    CNAccountsInit_vzwSource = 0;
    qword_26ABEB478 = 0;
    unk_26ABEB480 = CNAccountsVZWValidate;
    CFMutableDictionaryRef result = CNSPreferencesGet(@"WISPrAccounts");
    CNAccountsGet_preferences = (uint64_t)result;
    if (!result)
    {
      CNAccountsGet_preferences = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CNSPreferencesSet(@"WISPrAccounts", (const void *)CNAccountsGet_preferences);
      CFRelease((CFTypeRef)CNAccountsGet_preferences);
      return (const void *)CNAccountsGet_preferences;
    }
  }
  return result;
}

void CNAccountsCarrierMergeApplier(const void *a1, const __CFDictionary *a2, __CFDictionary *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFTypeID v6 = CFGetTypeID(a1);
  if (v6 == CFStringGetTypeID() && (CFTypeID v7 = CFGetTypeID(a2), v7 == CFDictionaryGetTypeID()))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v9))
    {
      int v13 = 138412290;
      os_log_type_t v14 = a1;
      _os_log_impl(&dword_225F82000, logger, v9, "merging credential %@", (uint8_t *)&v13, 0xCu);
    }
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a2);
    CFDictionaryAddValue(MutableCopy, @"Source", @"Carrier");
    CFDictionaryAddValue(a3, a1, MutableCopy);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
  }
  else
  {
    char v11 = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      int v13 = 138412290;
      os_log_type_t v14 = a1;
      _os_log_impl(&dword_225F82000, v11, v12, "invalid carrier credential %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

CFMutableArrayRef CNAccountsCopyMatching(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a1 && a2) {
    return 0;
  }
  logger = mysyslog_get_logger();
  os_log_type_t v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v6))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_impl(&dword_225F82000, logger, v6, "looking for accounts for SSID %@", (uint8_t *)&buf, 0xCu);
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  CFDictionaryRef v7 = (const __CFDictionary *)CNAccountsGet();
  if (v7 && (CFDictionaryRef v8 = v7, CFDictionaryGetCount(v7) >= 1))
  {
    *(void *)&long long buf = a1;
    if (a2)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a2, kWISPrLoginURL[0]);
      CFStringRef v10 = URLStringCopyHostName(Value);
    }
    else
    {
      CFStringRef v10 = 0;
    }
    *((void *)&buf + 1) = v10;
    CFMutableArrayRef v21 = Mutable;
    int v13 = mysyslog_get_logger();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      int v16 = 138412546;
      uint64_t v17 = a1;
      __int16 v18 = 2112;
      CFStringRef v19 = v10;
      _os_log_impl(&dword_225F82000, v13, v14, "Matching on ssid=%@, host=%@", (uint8_t *)&v16, 0x16u);
    }
    if (!a2 || v10)
    {
      CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)CNAccountsMatchDictionaryIterator, &buf);
      if (*((void *)&buf + 1)) {
        CFRelease(*((CFTypeRef *)&buf + 1));
      }
    }
  }
  else
  {
    char v11 = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_225F82000, v11, v12, "No accounts to search through", (uint8_t *)&buf, 2u);
    }
  }
  if (!CFArrayGetCount(Mutable) && Mutable)
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

void CNAccountsMatchDictionaryIterator(const void *a1, const void *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID || (CFTypeID v7 = CFDictionaryGetTypeID(), !a2) || CFGetTypeID(a2) != v7)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v11)) {
      return;
    }
    LOWORD(v30) = 0;
    os_log_type_t v12 = "accounts contain invalid data";
    int v13 = logger;
    os_log_type_t v14 = v11;
    uint32_t v15 = 2;
    goto LABEL_12;
  }
  if (*(void *)a3 && !CFEqual(*(CFTypeRef *)a3, a1))
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, @"MatchingSSIDs");
    CFTypeID v17 = CFDictionaryGetTypeID();
    if (Value && CFGetTypeID(Value) == v17)
    {
      if (!CFDictionaryContainsKey(Value, *(const void **)a3) || !*(void *)(a3 + 8)) {
        return;
      }
      CFArrayRef v18 = (const __CFArray *)CFDictionaryGetValue(Value, *(const void **)a3);
      if (!v18)
      {
        CFIndex v27 = mysyslog_get_logger();
        os_log_type_t v28 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v27, v28)) {
          return;
        }
        CFStringRef v29 = *(const void **)a3;
        int v30 = 138412546;
        CFIndex v31 = a1;
        __int16 v32 = 2112;
        CFArrayRef v33 = v29;
        os_log_type_t v12 = "%@ does not match ssid %@";
        int v13 = v27;
        os_log_type_t v14 = v28;
        uint32_t v15 = 22;
LABEL_12:
        _os_log_impl(&dword_225F82000, v13, v14, v12, (uint8_t *)&v30, v15);
        return;
      }
      CFArrayRef v19 = v18;
      CFIndex Count = CFArrayGetCount(v18);
      if (Count >= 1)
      {
        CFIndex v21 = Count;
        CFIndex v22 = 0;
        do
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v19, v22);
          CFTypeID v24 = CFGetTypeID(ValueAtIndex);
          if (v24 == CFStringGetTypeID())
          {
            if (CFStringHasSuffix(*(CFStringRef *)(a3 + 8), ValueAtIndex)) {
              goto LABEL_7;
            }
          }
        }
        while (v21 != ++v22);
      }
      CFDictionaryRef v25 = mysyslog_get_logger();
      os_log_type_t v26 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v25, v26)) {
        return;
      }
      int v30 = 138412290;
      CFIndex v31 = a1;
      os_log_type_t v12 = "%@ matches ssid but not trusted hosts";
    }
    else
    {
      CFDictionaryRef v25 = mysyslog_get_logger();
      os_log_type_t v26 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v25, v26)) {
        return;
      }
      int v30 = 138412290;
      CFIndex v31 = a1;
      os_log_type_t v12 = "%@ contains no matching SSIDs";
    }
    int v13 = v25;
    os_log_type_t v14 = v26;
    uint32_t v15 = 12;
    goto LABEL_12;
  }
LABEL_7:
  CFDictionaryRef v8 = mysyslog_get_logger();
  os_log_type_t v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    int v30 = 138412290;
    CFIndex v31 = a1;
    _os_log_impl(&dword_225F82000, v8, v9, "%@ matches", (uint8_t *)&v30, 0xCu);
  }
  CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 16), a1);
}

BOOL CNAccountsIsCarrierSSID(uint64_t a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)CNAccountsGet();
  if (v2 && (CFDictionaryRef v3 = v2, CFDictionaryGetCount(v2) >= 1))
  {
    CFBooleanRef v4 = (const __CFBoolean *)*MEMORY[0x263EFFB38];
    uint64_t v8 = a1;
    CFBooleanRef BOOLean = v4;
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)CNAccountsIsCarrierSSIDIterator, &v8);
    return CFBooleanGetValue(BOOLean) != 0;
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(logger, v7);
    if (result)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_225F82000, logger, v7, "No carrier accounts to search through", (uint8_t *)&v8, 2u);
      return 0;
    }
  }
  return result;
}

void CNAccountsIsCarrierSSIDIterator(const void *a1, const void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID || (CFTypeID v7 = CFDictionaryGetTypeID(), !a2) || CFGetTypeID(a2) != v7)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v16)) {
      return;
    }
    LOWORD(v20) = 0;
    int v13 = "accounts contain invalid data";
    os_log_type_t v14 = logger;
    os_log_type_t v17 = v16;
    uint32_t v18 = 2;
    goto LABEL_14;
  }
  if (CNAccountsIsCarrierCredential(a1) && *(void *)a3)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, @"MatchingSSIDs");
    CFTypeID v9 = CFDictionaryGetTypeID();
    if (Value && CFGetTypeID(Value) == v9)
    {
      if (CFDictionaryContainsKey(Value, *(const void **)a3) == 1)
      {
        *(void *)(a3 + 8) = *MEMORY[0x263EFFB40];
        CFStringRef v10 = mysyslog_get_logger();
        os_log_type_t v11 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v10, v11))
        {
          os_log_type_t v12 = *(const void **)a3;
          int v20 = 138412290;
          CFIndex v21 = v12;
          int v13 = "Found the carrier ssid: %@";
          os_log_type_t v14 = v10;
LABEL_18:
          os_log_type_t v17 = v11;
          uint32_t v18 = 12;
LABEL_14:
          _os_log_impl(&dword_225F82000, v14, v17, v13, (uint8_t *)&v20, v18);
        }
      }
    }
    else
    {
      CFArrayRef v19 = mysyslog_get_logger();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v11))
      {
        int v20 = 138412290;
        CFIndex v21 = a1;
        int v13 = "%@ contains no matching SSIDs";
        os_log_type_t v14 = v19;
        goto LABEL_18;
      }
    }
  }
}

const void *CNAccountsLookupPasswordType(const void *a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)CNAccountsGet();
  if (!v2) {
    return 0;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v2, a1);
  if (!Value) {
    return 0;
  }

  return CFDictionaryGetValue(Value, @"PasswordType");
}

uint64_t CNAccountsLookupAuthType(const void *a1, int *a2)
{
  uint64_t result = (uint64_t)CNAccountsGet();
  if (!a2) {
    return 0;
  }
  *a2 = 0;
  if (!result) {
    return result;
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a1);
  if (!result) {
    return result;
  }
  CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)result, @"AuthScheme");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  if (my_CFEqual(Value, @"Form"))
  {
    int v7 = 1;
LABEL_12:
    *a2 = v7;
    return 1;
  }
  uint64_t result = my_CFEqual(Value, @"Bearer");
  if (result)
  {
    int v7 = 2;
    goto LABEL_12;
  }
  return result;
}

uint64_t CNAccountsCredentialsValidate(const void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFDictionaryRef v2 = (const __CFDictionary *)CNAccountsGet();
  if (!v2)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v15))
    {
      LOWORD(v16) = 0;
      CFStringRef v10 = "Unable to create account setting";
      os_log_type_t v11 = logger;
      os_log_type_t v12 = v15;
      uint32_t v13 = 2;
      goto LABEL_13;
    }
    return 0;
  }
  CFDictionaryRef Value = CFDictionaryGetValue(v2, a1);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    uint64_t v8 = mysyslog_get_logger();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      int v16 = 138412290;
      os_log_type_t v17 = a1;
      CFStringRef v10 = "Account %@ not found";
      os_log_type_t v11 = v8;
      os_log_type_t v12 = v9;
      uint32_t v13 = 12;
LABEL_13:
      _os_log_impl(&dword_225F82000, v11, v12, v10, (uint8_t *)&v16, v13);
      return 0;
    }
    return 0;
  }
  CFIndex v5 = CNAccountsLookupSource((const __CFDictionary *)Value);
  if (!v5) {
    return 0;
  }
  os_log_type_t v6 = (uint64_t (*)(void))v5[4];
  if (!v6) {
    return 0;
  }

  return v6();
}

uint64_t *CNAccountsLookupSource(const __CFDictionary *a1)
{
  CFDictionaryRef Value = CFDictionaryGetValue(a1, @"PasswordType");
  if (!Value) {
    return 0;
  }
  CFDictionaryRef v2 = Value;
  CFDictionaryRef v3 = &sSourcesHead;
  do
    CFDictionaryRef v3 = (uint64_t *)*v3;
  while (v3 && !CFEqual(v2, (CFTypeRef)v3[1]));
  return v3;
}

void *CNAccountsCredentialsQueryStart(const __CFString *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  char v33 = 0;
  if (!CNAccountsGet())
  {
    logger = mysyslog_get_logger();
    os_log_type_t v29 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v29))
    {
      *(_WORD *)long long buf = 0;
      CFTypeID v24 = "Unable to create accounts setting";
      CFDictionaryRef v25 = logger;
      os_log_type_t v26 = v29;
      uint32_t v27 = 2;
      goto LABEL_20;
    }
    return 0;
  }
  CFMutableDictionaryRef v12 = CNAccountCopyCurrentAccountRecord(a2, a1, &v33);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v12 || CFGetTypeID(v12) != TypeID)
  {
    uint64_t v22 = mysyslog_get_logger();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex v35 = (void *)a1;
      CFTypeID v24 = "account %@ not found";
      CFDictionaryRef v25 = v22;
      os_log_type_t v26 = v23;
      uint32_t v27 = 12;
LABEL_20:
      _os_log_impl(&dword_225F82000, v25, v26, v24, buf, v27);
      return 0;
    }
    return 0;
  }
  os_log_type_t v14 = mysyslog_get_logger();
  os_log_type_t v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v14, v15))
  {
    if (v33) {
      int v16 = "ssid";
    }
    else {
      int v16 = "name";
    }
    *(_DWORD *)long long buf = 136315138;
    CFIndex v35 = (void *)v16;
    _os_log_impl(&dword_225F82000, v14, v15, "account found for %s ", buf, 0xCu);
  }
  os_log_type_t v17 = CNAccountsLookupSource(v12);
  if (v17
    && (uint64_t v18 = (uint64_t (*)(const __CFString *, CFMutableDictionaryRef, const __CFString *, uint64_t, uint64_t, uint64_t, uint64_t))v17[2]) != 0)
  {
    if (v33) {
      CFStringRef v19 = a2;
    }
    else {
      CFStringRef v19 = a1;
    }
    int v20 = (void *)v18(v19, v12, a2, a3, a4, a5, a6);
    CFIndex v21 = v20;
    if (v20)
    {
      void *v20 = sQueriesHead;
      sQueriesHead = (uint64_t)v20;
    }
  }
  else
  {
    CFIndex v31 = mysyslog_get_logger();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v31, v32))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex v35 = (void *)a1;
      _os_log_impl(&dword_225F82000, v31, v32, "unsupported password type for account %@", buf, 0xCu);
    }
    CFIndex v21 = 0;
  }
  CFRelease(v12);
  return v21;
}

CFMutableDictionaryRef CNAccountCopyCurrentAccountRecord(const __CFString *a1, const __CFString *a2, unsigned char *a3)
{
  CFDictionaryRef v6 = (const __CFDictionary *)CNAccountsGet();
  if (!a3) {
    return 0;
  }
  CFDictionaryRef v7 = v6;
  if (!v6) {
    return 0;
  }
  *a3 = 0;
  if (!a2 || CFStringGetLength(a2) <= 0)
  {
    CFDictionaryGetTypeID();
    CFDictionaryRef Value = 0;
    goto LABEL_8;
  }
  CFDictionaryRef Value = CFDictionaryGetValue(v7, a2);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!Value)
  {
LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  BOOL v10 = CFGetTypeID(Value) != TypeID;
LABEL_9:
  if (a1 && v10 && CFStringGetLength(a1) >= 1)
  {
    CFDictionaryRef Value = CFDictionaryGetValue(v7, a1);
    *a3 = 1;
  }
  CFTypeID v11 = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != v11) {
    return 0;
  }

  return CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)Value);
}

uint64_t CNAccountsCredentialsQueryAbort(uint64_t result)
{
  CFDictionaryRef v1 = &sQueriesHead;
  while (1)
  {
    CFDictionaryRef v2 = v1;
    CFDictionaryRef v1 = (uint64_t *)*v1;
    if (!v1) {
      break;
    }
    if (v1 == (uint64_t *)result)
    {
      *CFDictionaryRef v2 = *(void *)result;
      *(void *)uint64_t result = 0;
      return (*(uint64_t (**)(void))(result + 8))();
    }
  }
  return result;
}

CFDictionaryRef CNAccountsIsCarrierCredential(const void *a1)
{
  CFDictionaryRef result = (const __CFDictionary *)CNAccountsGet();
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a1);
    if (result)
    {
      CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"Source");
      if (result) {
        return (const __CFDictionary *)(CFEqual(result, @"Carrier") != 0);
      }
    }
  }
  return result;
}

void CNAccountsAddInternal(const __CFString *a1, const void *a2, const __CFString *a3, const __CFString *a4, int a5, int a6)
{
  values[1] = *(void **)MEMORY[0x263EF8340];
  CFMutableDictionaryRef v12 = (__CFDictionary *)CNAccountsGet();
  BOOL v76 = 0;
  if (!v12)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v18)) {
      return;
    }
    *(_WORD *)long long buf = 0;
    CFStringRef v19 = "unable to get accounts";
    int v20 = logger;
    os_log_type_t v21 = v18;
    uint32_t v22 = 2;
    goto LABEL_24;
  }
  uint32_t v13 = v12;
  CFMutableDictionaryRef v14 = CNAccountCopyCurrentAccountRecord(a3, a1, &v76);
  CFMutableDictionaryRef v15 = v14;
  if (v14)
  {
    CFDictionaryRef v16 = v14;
    if (!a2)
    {
LABEL_51:
      if (v76)
      {
        CFDictionaryRef Value = CFDictionaryGetValue(v16, @"AuthScheme");
        CFTypeID TypeID = CFStringGetTypeID();
        if (Value)
        {
          if (CFGetTypeID(Value) == TypeID && CFEqual(Value, @"Bearer"))
          {
            if (a4 && CFStringGetLength(a4) >= 9) {
              CFDictionarySetValue(v16, kTokenAuthLoginURL[0], a4);
            }
            else {
              CFDictionaryRemoveValue(v16, kTokenAuthLoginURL[0]);
            }
          }
        }
      }
      goto LABEL_59;
    }
    goto LABEL_30;
  }
  os_log_type_t v23 = mysyslog_get_logger();
  os_log_type_t v24 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v23, v24))
  {
    if (a1) {
      CFStringRef v25 = a1;
    }
    else {
      CFStringRef v25 = a3;
    }
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v25;
    _os_log_impl(&dword_225F82000, v23, v24, "adding new account record for %@", buf, 0xCu);
  }
  if (!a2
    || (CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x263EFFB08],
        (CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) == 0))
  {
    os_log_type_t v32 = mysyslog_get_logger();
    os_log_type_t v33 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v32, v33)) {
      return;
    }
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = a1;
    CFStringRef v19 = "failed to create new account record for %@";
    int v20 = v32;
    os_log_type_t v21 = v33;
    uint32_t v22 = 12;
LABEL_24:
    _os_log_impl(&dword_225F82000, v20, v21, v19, buf, v22);
    return;
  }
  os_log_type_t v28 = Mutable;
  BOOL v76 = a1 == 0;
  if (a6) {
    os_log_type_t v29 = @"Websheet";
  }
  else {
    os_log_type_t v29 = @"API";
  }
  CFDictionaryAddValue(Mutable, @"Source", v29);
  CFDictionaryAddValue(v28, @"PasswordType", @"Keychain");
  BOOL v30 = a5 == 2;
  CFDictionaryRef v16 = v28;
  CFIndex v31 = @"AuthScheme";
  if (v30)
  {
    CFDictionaryAddValue(v28, @"AuthScheme", @"Bearer");
    if (!a4 || CFStringGetLength(a4) < 9) {
      goto LABEL_26;
    }
    CFIndex v31 = kTokenAuthLoginURL[0];
    CFIndex v35 = v28;
    uint64_t v34 = (__CFString *)a4;
  }
  else
  {
    uint64_t v34 = @"Form";
    CFIndex v35 = v28;
  }
  CFDictionaryAddValue(v35, v31, v34);
LABEL_26:
  CFStringRef v36 = a3;
  if (!v76)
  {
    CFMutableDictionaryRef v37 = CFDictionaryCreateMutable(v26, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryAddValue(v16, @"MatchingSSIDs", v37);
    CFStringRef v36 = a1;
    if (v37)
    {
      CFRelease(v37);
      CFStringRef v36 = a1;
    }
  }
  CFDictionaryAddValue(v13, v36, v16);
LABEL_30:
  CFDictionaryRef v75 = v16;
  if (a1) {
    CFStringRef v38 = a1;
  }
  else {
    CFStringRef v38 = a3;
  }
  CFStringRef v39 = mysyslog_get_logger();
  os_log_type_t v40 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v39, v40))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v38;
    _os_log_impl(&dword_225F82000, v39, v40, "updating password for %@", buf, 0xCu);
  }
  CFAllocatorRef v41 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  BOOL v42 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171D8]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x263F17078], kWISPrSecurityDomain);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x263F17028], (const void *)*MEMORY[0x263F17030]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x263F16EF0], (const void *)*MEMORY[0x263F16EF8]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x263F16E90], (const void *)*MEMORY[0x263F16E98]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x263F16ED8], v38);
  uint64_t v43 = (const void *)*MEMORY[0x263F175A8];
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x263F175A8], a2);
  OSStatus v44 = SecItemAdd(v42, 0);
  if (!v44) {
    goto LABEL_42;
  }
  OSStatus v45 = v44;
  if (v44 != -25299)
  {
    CFIndex v57 = mysyslog_get_logger();
    os_log_type_t v49 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v57, v49)) {
      goto LABEL_48;
    }
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v45;
    os_log_type_t v50 = "SecItemAdd failed: %d";
    os_log_type_t v51 = buf;
    uint32_t v52 = v57;
    goto LABEL_46;
  }
  *(void *)long long buf = v43;
  values[0] = (void *)CFDictionaryGetValue(v42, v43);
  CFDictionaryRef v46 = CFDictionaryCreate(v41, (const void **)buf, (const void **)values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRemoveValue(v42, v43);
  OSStatus v47 = SecItemUpdate(v42, v46);
  if (v46) {
    CFRelease(v46);
  }
  if (!v47)
  {
LABEL_42:
    uint64_t v53 = mysyslog_get_logger();
    os_log_type_t v54 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v53, v54)) {
      goto LABEL_48;
    }
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v38;
    os_log_type_t v50 = "added password for account %@ to keychain";
    os_log_type_t v51 = buf;
    uint32_t v52 = v53;
    os_log_type_t v55 = v54;
    uint32_t v56 = 12;
    goto LABEL_47;
  }
  BOOL v48 = mysyslog_get_logger();
  os_log_type_t v49 = _SC_syslog_os_log_mapping();
  if (!os_log_type_enabled(v48, v49)) {
    goto LABEL_48;
  }
  v82[0] = 67109120;
  v82[1] = v47;
  os_log_type_t v50 = "SecItemUpdate failed: %d";
  os_log_type_t v51 = (uint8_t *)v82;
  uint32_t v52 = v48;
LABEL_46:
  os_log_type_t v55 = v49;
  uint32_t v56 = 8;
LABEL_47:
  _os_log_impl(&dword_225F82000, v52, v55, v50, v51, v56);
LABEL_48:
  if (v42) {
    CFRelease(v42);
  }
  CFDictionaryRef v16 = v75;
  if (v15) {
    goto LABEL_51;
  }
LABEL_59:
  if (!a3 || !a4 || v76)
  {
LABEL_73:
    if (v15)
    {
      if (a1) {
        CFStringRef v68 = a1;
      }
      else {
        CFStringRef v68 = a3;
      }
      CFStringRef v69 = mysyslog_get_logger();
      os_log_type_t v70 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v69, v70))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_impl(&dword_225F82000, v69, v70, "updating account record for [%@]", buf, 0xCu);
      }
      CFDictionarySetValue(v13, v68, v16);
    }
LABEL_83:
    CFRelease(v16);
    CNSPreferencesFlush();
    return;
  }
  CFStringRef v60 = URLStringCopyHostName(a4);
  CFArrayRef v61 = mysyslog_get_logger();
  os_log_type_t v62 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v61, v62))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = a3;
    __int16 v78 = 2112;
    CFStringRef v79 = v60;
    __int16 v80 = 2112;
    CFStringRef v81 = a1;
    _os_log_impl(&dword_225F82000, v61, v62, "adding ssid=%@, host=%@ to %@", buf, 0x20u);
  }
  if (!v60) {
    goto LABEL_83;
  }
  CFDictionaryRef v63 = (const __CFDictionary *)CFDictionaryGetValue(v16, @"MatchingSSIDs");
  if (!v63 || (CFDictionaryRef v64 = v63, v65 = CFGetTypeID(v63), v65 != CFDictionaryGetTypeID()))
  {
    __int16 v71 = mysyslog_get_logger();
    os_log_type_t v72 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v71, v72))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = a1;
      _os_log_impl(&dword_225F82000, v71, v72, "unable to add trusted ssid/host to account %@", buf, 0xCu);
    }
    CFRelease(v60);
    goto LABEL_83;
  }
  CFArrayRef v66 = (const __CFArray *)CFDictionaryGetValue(v64, a3);
  if (v66)
  {
LABEL_70:
    v84.length = CFArrayGetCount(v66);
    v84.CFIndex location = 0;
    if (!CFArrayContainsValue(v66, v84, v60)) {
      CFArrayAppendValue(v66, v60);
    }
    CFRelease(v60);
    goto LABEL_73;
  }
  CFMutableArrayRef v67 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (v67)
  {
    CFArrayRef v66 = v67;
    CFDictionaryAddValue(v64, a3, v67);
    CFRelease(v66);
    goto LABEL_70;
  }
  uint64_t v73 = mysyslog_get_logger();
  os_log_type_t v74 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v73, v74))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_225F82000, v73, v74, "failed to add trusted hosts", buf, 2u);
  }
  CFRelease(v60);
  CFRelease(v16);
}

void CNAccountsRejected(const void *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  CFDictionaryRef v8 = (const __CFDictionary *)CNAccountsGet();
  if (v8)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v8, a1);
    if (Value)
    {
      CFDictionaryRef v10 = Value;
      CFTypeID v11 = CFGetTypeID(Value);
      if (v11 == CFDictionaryGetTypeID())
      {
        char v16 = 1;
        CFMutableDictionaryRef v12 = CNAccountsLookupSource(v10);
        if (v12
          && (uint32_t v13 = (void (*)(const void *, const __CFDictionary *, const void *, uint64_t, uint64_t, char *))v12[3]) != 0)
        {
          v13(a1, v10, a2, a3, a4, &v16);
          if (!v16) {
            return;
          }
        }
        else if (CFDictionaryGetValue(v10, @"Source"))
        {
          CFMutableDictionaryRef v14 = CFDictionaryGetValue(v10, @"Source");
          if (CFEqual(v14, @"Carrier")) {
            return;
          }
        }
        CFMutableDictionaryRef v15 = (__CFDictionary *)CFDictionaryGetValue(v10, @"MatchingSSIDs");
        if (v15) {
          CFDictionaryRemoveValue(v15, a2);
        }
        CNSPreferencesFlush();
      }
    }
  }
}

void CNAccountsPurgeSSID(const void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CFDictionaryRef v2 = (const __CFDictionary *)CNAccountsGet();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    if (CFDictionaryGetCount(v2))
    {
      logger = mysyslog_get_logger();
      os_log_type_t v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v5))
      {
        *(_DWORD *)long long buf = 138412290;
        os_log_type_t v23 = a1;
        _os_log_impl(&dword_225F82000, logger, v5, "Removing ssid \"%@\" from all accounts", buf, 0xCu);
      }
      if (CFDictionaryContainsKey(v3, a1)
        && (v6 = CFDictionaryGetValue(v3, a1), CFTypeID v7 = CFDictionaryGetTypeID(), v6)
        && CFGetTypeID(v6) == v7)
      {
        CNAccountsKeychainRemovePassword(a1);
        CFDictionaryRemoveValue(v3, a1);
      }
      else
      {
        CFIndex Count = CFDictionaryGetCount(v3);
        os_log_type_t v9 = malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
        bzero(v9, 8 * Count);
        CFDictionaryGetKeysAndValues(v3, (const void **)v9, 0);
        if (Count >= 1)
        {
          CFDictionaryRef v10 = (const void **)v9;
          do
          {
            CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, *v10);
            if (Value)
            {
              CFDictionaryRef v12 = Value;
              CFTypeID v13 = CFGetTypeID(Value);
              if (v13 == CFDictionaryGetTypeID())
              {
                CFMutableDictionaryRef v14 = *v10;
                CFMutableDictionaryRef v15 = mysyslog_get_logger();
                os_log_type_t v16 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v15, v16))
                {
                  *(_DWORD *)long long buf = 138412546;
                  os_log_type_t v23 = v14;
                  __int16 v24 = 2112;
                  CFStringRef v25 = a1;
                  _os_log_impl(&dword_225F82000, v15, v16, "Checking Account=[%@] for ssid=[%@]", buf, 0x16u);
                }
                os_log_type_t v17 = CFDictionaryGetValue(v12, @"Source");
                if (!CFEqual(v17, @"Carrier"))
                {
                  os_log_type_t v18 = (__CFDictionary *)CFDictionaryGetValue(v12, @"MatchingSSIDs");
                  CFTypeID TypeID = CFDictionaryGetTypeID();
                  if (v18)
                  {
                    if (CFGetTypeID(v18) == TypeID)
                    {
                      CFDictionaryRemoveValue(v18, a1);
                      if (!CFDictionaryGetCount(v18))
                      {
                        int v20 = mysyslog_get_logger();
                        os_log_type_t v21 = _SC_syslog_os_log_mapping();
                        if (os_log_type_enabled(v20, v21))
                        {
                          *(_DWORD *)long long buf = 138412290;
                          os_log_type_t v23 = v14;
                          _os_log_impl(&dword_225F82000, v20, v21, "Account %@ has no more ssids. PURGE!", buf, 0xCu);
                        }
                        CNAccountsKeychainRemovePassword(v14);
                        CFDictionaryRemoveValue(v3, v14);
                      }
                    }
                  }
                }
              }
            }
            ++v10;
            --Count;
          }
          while (Count);
        }
        free(v9);
      }
      CNSPreferencesFlush();
    }
  }
}

void CNAccountsKeychainRemovePassword(const void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFDictionaryRef v3 = Mutable;
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171D8]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x263F17078], kWISPrSecurityDomain);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x263F17028], (const void *)*MEMORY[0x263F17030]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x263F16EF0], (const void *)*MEMORY[0x263F16EF8]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x263F16E90], (const void *)*MEMORY[0x263F16E98]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x263F16ED8], a1);
    OSStatus v4 = SecItemDelete(v3);
    if (v4)
    {
      OSStatus v5 = v4;
      logger = mysyslog_get_logger();
      os_log_type_t v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v7))
      {
        v8[0] = 67109120;
        v8[1] = v5;
        _os_log_impl(&dword_225F82000, logger, v7, "SecItemDelete failed: %d", (uint8_t *)v8, 8u);
      }
    }
    CFRelease(v3);
  }
}

uint64_t *CNAccountsCredentialQueryInvalidate(uint64_t *result)
{
  CFDictionaryRef v1 = &sQueriesHead;
  while (1)
  {
    CFDictionaryRef v2 = v1;
    CFDictionaryRef v1 = (uint64_t *)*v1;
    if (!v1) {
      break;
    }
    if (v1 == result)
    {
      *CFDictionaryRef v2 = *result;
      return result;
    }
  }
  return result;
}

CFDictionaryRef WISPrCredentialsDictionaryCreate(void *a1, void *a2)
{
  CFDictionaryRef result = 0;
  keys[2] = *(void **)MEMORY[0x263EF8340];
  if (a1)
  {
    if (a2)
    {
      keys[0] = @"UserName";
      keys[1] = @"Password";
      values[0] = a1;
      values[1] = a2;
      return CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
  }
  return result;
}

CFRunLoopSourceRef *CNAccountsKeychainQueryStart(__CFRunLoopSource *a1, __CFRunLoopSource *a2, uint64_t a3, uint64_t a4, uint64_t a5, __CFRunLoopSource *a6, __CFRunLoopSource *a7)
{
  CFTypeID v11 = (CFRunLoopSourceRef *)malloc_type_malloc(0x38uLL, 0xE00409C3A2E09uLL);
  CFDictionaryRef v12 = v11;
  if (v11)
  {
    v15.version = 0;
    memset(&v15.retain, 0, 56);
    v15.info = v11;
    v15.perform = (void (__cdecl *)(void *))CNAccountsKeychainQueryDo;
    *(_OWORD *)CFTypeID v11 = 0u;
    *((_OWORD *)v11 + 1) = 0u;
    v11[6] = 0;
    *((_OWORD *)v11 + 2) = 0u;
    v11[1] = (CFRunLoopSourceRef)CNAccountsKeychainQueryAbort;
    v11[2] = a6;
    v11[3] = a7;
    v11[6] = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &v15);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v12[6], (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRunLoopSourceSignal(v12[6]);
    void v12[4] = a1;
    CFRetain(a1);
    v12[5] = a2;
    CFRetain(a2);
  }
  return v12;
}

void CNAccountsKeychainQueryDo(uint64_t *a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  CFRunLoopSourceInvalidate((CFRunLoopSourceRef)a1[6]);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)a1[6], (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  CFDictionaryRef v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
    a1[6] = 0;
  }
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    uint64_t v6 = a1[4];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_225F82000, logger, v5, "querying keychain for %@", (uint8_t *)&buf, 0xCu);
  }
  os_log_type_t v7 = &sQueriesHead;
  while (1)
  {
    CFDictionaryRef v8 = v7;
    os_log_type_t v7 = (uint64_t *)*v7;
    if (!v7) {
      break;
    }
    if (v7 == a1)
    {
      *CFDictionaryRef v8 = *a1;
      break;
    }
  }
  uint64_t v9 = *MEMORY[0x263F17078];
  *(void *)&long long buf = *MEMORY[0x263F171B8];
  *((void *)&buf + 1) = v9;
  uint64_t v10 = *MEMORY[0x263F17028];
  uint64_t v36 = *MEMORY[0x263F16ED8];
  uint64_t v37 = v10;
  uint64_t v11 = *MEMORY[0x263F17520];
  uint64_t v38 = *MEMORY[0x263F16EF0];
  uint64_t v39 = v11;
  values[0] = *(void **)MEMORY[0x263F171D8];
  values[1] = kWISPrSecurityDomain;
  CFDictionaryRef v12 = (void *)*MEMORY[0x263F17030];
  values[2] = (void *)a1[4];
  values[3] = v12;
  CFTypeID v13 = (void *)*MEMORY[0x263EFFB40];
  values[4] = *(void **)MEMORY[0x263F16EF8];
  values[5] = v13;
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v15 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&buf, (const void **)values, 6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFTypeRef result = 0;
  OSStatus v16 = SecItemCopyMatching(v15, &result);
  if (v15) {
    CFRelease(v15);
  }
  if (v16 || (CFTypeRef v24 = result, TypeID = CFDataGetTypeID(), !v24) || CFGetTypeID(v24) != TypeID)
  {
    os_log_type_t v17 = mysyslog_get_logger();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = a1[4];
      *(_DWORD *)BOOL v30 = 138412546;
      uint64_t v31 = v19;
      __int16 v32 = 1024;
      OSStatus v33 = v16;
      _os_log_impl(&dword_225F82000, v17, v18, "Failed to get password for %@: %d", v30, 0x12u);
    }
    int v20 = 0;
    goto LABEL_15;
  }
  int v20 = (__CFString *)CFStringCreateFromExternalRepresentation(v14, (CFDataRef)result, 0x8000100u);
  CFDictionaryRef v26 = WISPrCredentialsDictionaryCreate((void *)a1[4], v20);
  if (!v26)
  {
LABEL_15:
    CFMutableDictionaryRef MutableCopy = 0;
    goto LABEL_16;
  }
  CFDictionaryRef v27 = v26;
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v26);
  if (CFDictionaryContainsKey((CFDictionaryRef)a1[5], kTokenAuthLoginURL[0]))
  {
    CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)a1[5], kTokenAuthLoginURL[0]);
    CFDictionaryAddValue(MutableCopy, kTokenAuthLoginURL[0], Value);
    CFRelease(v27);
  }
  else
  {
    CFRelease(MutableCopy);
    CFMutableDictionaryRef MutableCopy = v27;
  }
LABEL_16:
  ((void (*)(uint64_t, __CFDictionary *))a1[2])(a1[3], MutableCopy);
  uint32_t v22 = (const void *)a1[4];
  if (v22)
  {
    CFRelease(v22);
    a1[4] = 0;
  }
  os_log_type_t v23 = (const void *)a1[5];
  if (v23)
  {
    CFRelease(v23);
    a1[5] = 0;
  }
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0;
  }
  if (v20) {
    CFRelease(v20);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  free(a1);
}

void CNAccountsKeychainQueryAbort(uint64_t a1)
{
  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 48));
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 48), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  CFDictionaryRef v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 48) = 0;
  }
  OSStatus v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 32) = 0;
  }
  os_log_type_t v5 = *(const void **)(a1 + 40);
  if (v5) {
    CFRelease(v5);
  }

  free((void *)a1);
}

void CNAccountsCarrierPurgeApplier(const void *a1, CFTypeRef cf, __CFArray *a3)
{
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 != CFDictionaryGetTypeID()
    || (CFTypeID v7 = CFGetTypeID(a1), v7 != CFStringGetTypeID())
    || (CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)cf, @"Source"), CFEqual(Value, @"Carrier")))
  {
    CFArrayAppendValue(a3, a1);
  }
}

CFRunLoopSourceRef *CNAccountsATTQueryStart(__CFRunLoopSource *a1, __CFRunLoopSource *a2, uint64_t a3, uint64_t a4, __CFRunLoopSource *a5, __CFRunLoopSource *a6, __CFRunLoopSource *a7)
{
  CFDictionaryRef v12 = (CFRunLoopSourceRef *)CopySIMStatus();
  CFTypeID v13 = v12;
  if (v12)
  {
    int v14 = CFEqual(v12, (CFTypeRef)*MEMORY[0x263F03080]);
    CFRelease(v13);
    if (v14)
    {
      return 0;
    }
    else
    {
      CFDictionaryRef v15 = (CFRunLoopSourceRef *)malloc_type_malloc(0x40uLL, 0xE0040B3D8CE0AuLL);
      CFTypeID v13 = v15;
      if (v15)
      {
        v18.version = 0;
        memset(&v18.retain, 0, 56);
        v18.info = v15;
        v18.perform = (void (__cdecl *)(void *))CNAccountsATTQueryDo;
        *(_OWORD *)CFDictionaryRef v15 = 0u;
        *((_OWORD *)v15 + 1) = 0u;
        *((_OWORD *)v15 + 2) = 0u;
        *((_OWORD *)v15 + 3) = 0u;
        v15[1] = (CFRunLoopSourceRef)CNAccountsATTQueryAbort;
        _DWORD v15[2] = a6;
        v15[3] = a7;
        v15[7] = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &v18);
        CFRunLoopRef Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v13[7], (CFRunLoopMode)*MEMORY[0x263EFFE78]);
        CFRunLoopSourceSignal(v13[7]);
        v13[4] = a1;
        CFRetain(a1);
        v13[6] = a2;
        CFRetain(a2);
        v13[5] = a5;
        CFRetain(a5);
      }
    }
  }
  return v13;
}

void CNAccountsATTQueryDo(uint64_t a1)
{
  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 56));
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 56), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  CFDictionaryRef v3 = *(const void **)(a1 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 56) = 0;
  }
  CNAccountsCredentialQueryInvalidate((uint64_t *)a1);
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 40);
  if (!v4)
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27)) {
      goto LABEL_37;
    }
    *(_WORD *)long long buf = 0;
    os_log_type_t v28 = "redirect missing";
LABEL_36:
    _os_log_impl(&dword_225F82000, logger, (os_log_type_t)v27, v28, buf, 2u);
    goto LABEL_37;
  }
  CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 48);
  if (!v5)
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27)) {
      goto LABEL_37;
    }
    *(_WORD *)long long buf = 0;
    os_log_type_t v28 = "account missing";
    goto LABEL_36;
  }
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), kATTAuthenticationSeed[0]))
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27)) {
      goto LABEL_37;
    }
    *(_WORD *)long long buf = 0;
    os_log_type_t v28 = "Authentication seed missing";
    goto LABEL_36;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, kWISPrLoginURL[0]);
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef v8 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x263EFFB08], Value, 0);
  if (!v8)
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27)) {
      goto LABEL_37;
    }
    *(_WORD *)long long buf = 0;
    os_log_type_t v28 = "URL missing";
    goto LABEL_36;
  }
  CFURLRef v9 = v8;
  CFStringRef String = CFURLCopyQueryString(v8, &stru_26D9AB620);
  CFRelease(v9);
  if (!String)
  {
    logger = mysyslog_get_logger();
    uint64_t v27 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27)) {
      goto LABEL_37;
    }
    *(_WORD *)long long buf = 0;
    os_log_type_t v28 = "Query string missing";
    goto LABEL_36;
  }
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v7, String, @"&");
  CFRelease(String);
  if (!ArrayBySeparatingStrings)
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v27))
    {
      *(_WORD *)long long buf = 0;
      os_log_type_t v28 = "elements missing";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
  if (Count < 1)
  {
LABEL_32:
    CFRelease(ArrayBySeparatingStrings);
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v27))
    {
      *(_WORD *)long long buf = 0;
      os_log_type_t v28 = "macAddress missing";
      goto LABEL_36;
    }
LABEL_37:
    os_log_type_t v29 = 0;
    goto LABEL_38;
  }
  CFIndex v13 = Count;
  CFIndex v14 = 0;
  while (1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v14);
    CFArrayRef v16 = CFStringCreateArrayBySeparatingStrings(v7, ValueAtIndex, @"=");
    if (v16) {
      break;
    }
LABEL_15:
    if (v13 == ++v14) {
      goto LABEL_32;
    }
  }
  CFArrayRef v17 = v16;
  if (CFArrayGetCount(v16) != 2
    || (CFStringRef v18 = (const __CFString *)CFArrayGetValueAtIndex(v17, 0), CFStringCompare(v18, @"MacAddr", 0)))
  {
    CFRelease(v17);
    goto LABEL_15;
  }
  uint64_t v19 = CFArrayGetValueAtIndex(v17, 1);
  CFRetain(v19);
  CFRelease(v17);
  if (!v19) {
    goto LABEL_15;
  }
  CFRelease(ArrayBySeparatingStrings);
  CFStringRef v20 = (const __CFString *)CFDictionaryGetValue(v5, @"SharedSecret");
  os_log_type_t v21 = (void *)_SC_cfstring_to_cstring();
  uint32_t v22 = (void *)_SC_cfstring_to_cstring();
  uint64_t v23 = _SC_cfstring_to_cstring();
  CFTypeRef v24 = (void *)v23;
  if (v21 && v23 && v22)
  {
    CFStringRef v25 = CFStringCreateWithFormat(v7, 0, @"%s%s%s", v21, v23, v22);
    goto LABEL_60;
  }
  uint64_t v38 = mysyslog_get_logger();
  os_log_type_t v39 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v38, v39))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_225F82000, v38, v39, "Could not convert strings", buf, 2u);
  }
  CFStringRef v25 = 0;
  CFStringRef v40 = 0;
  if (v21)
  {
LABEL_60:
    free(v21);
    CFStringRef v40 = v25;
  }
  if (v24) {
    free(v24);
  }
  if (v22) {
    free(v22);
  }
  if (!v40)
  {
    OSStatus v44 = mysyslog_get_logger();
    uint64_t v45 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v44, (os_log_type_t)v45))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_225F82000, v44, (os_log_type_t)v45, "Could not compute pre-hash", buf, 2u);
    }
    CFRelease(v19);
    goto LABEL_37;
  }
  CFRelease(v19);
  CFIndex Length = CFStringGetLength(v40);
  if (Length <= CFStringGetLength(v20))
  {
    os_log_type_t v29 = CaptiveAccountsATTMD5Hash(v40);
  }
  else
  {
    CFIndex v42 = CFStringGetLength(v40);
    v47.length = v42 - CFStringGetLength(v20);
    v47.CFIndex location = 0;
    CFStringRef v43 = CFStringCreateWithSubstring(v7, v40, v47);
    os_log_type_t v29 = CaptiveAccountsATTMD5Hash(v40);
    if (v43) {
      CFRelease(v43);
    }
  }
  CFRelease(v40);
LABEL_38:
  CFStringRef v30 = CNAccountsATTCopyPhoneNumber();
  uint64_t v31 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"AuthenticationRealm");
  if (v29 && v30 && v31)
  {
    CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@@%@", v30, v31);
    goto LABEL_43;
  }
  CFStringRef v32 = 0;
  OSStatus v33 = 0;
  if (v30)
  {
LABEL_43:
    CFRelease(v30);
    OSStatus v33 = (__CFString *)v32;
  }
  CFDictionaryRef v34 = WISPrCredentialsDictionaryCreate(v33, v29);
  (*(void (**)(void, CFDictionaryRef))(a1 + 16))(*(void *)(a1 + 24), v34);
  CFIndex v35 = *(const void **)(a1 + 32);
  if (v35)
  {
    CFRelease(v35);
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v36 = *(const void **)(a1 + 40);
  if (v36)
  {
    CFRelease(v36);
    *(void *)(a1 + 40) = 0;
  }
  uint64_t v37 = *(const void **)(a1 + 48);
  if (v37)
  {
    CFRelease(v37);
    *(void *)(a1 + 48) = 0;
  }
  if (v29) {
    CFRelease(v29);
  }
  if (v33) {
    CFRelease(v33);
  }
  if (v34) {
    CFRelease(v34);
  }
  free((void *)a1);
}

void CNAccountsATTQueryAbort(uint64_t a1)
{
  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 56));
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 56), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  CFDictionaryRef v3 = *(const void **)(a1 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 56) = 0;
  }
  CFDictionaryRef v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 32) = 0;
  }
  CFDictionaryRef v5 = *(const void **)(a1 + 40);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 40) = 0;
  }
  CFTypeID v6 = *(const void **)(a1 + 48);
  if (v6) {
    CFRelease(v6);
  }

  free((void *)a1);
}

BOOL CNAccountsATTValidate()
{
  CFStringRef v0 = CNAccountsATTCopyPhoneNumber();
  CFStringRef v1 = v0;
  if (v0) {
    CFRelease(v0);
  }
  return v1 != 0;
}

CFStringRef CNAccountsATTCopyPhoneNumber()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v0 = CopyPhoneNumber();
  if (!v0) {
    return 0;
  }
  CFStringRef v1 = (const __CFString *)v0;
  logger = mysyslog_get_logger();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    int v7 = 138412290;
    CFStringRef v8 = v1;
    _os_log_impl(&dword_225F82000, logger, v3, "phone number: %@", (uint8_t *)&v7, 0xCu);
  }
  CFIndex Length = CFStringGetLength(v1);
  if (Length < 10)
  {
    CFStringRef v5 = 0;
  }
  else
  {
    v10.length = 10;
    v10.CFIndex location = Length - 10;
    CFStringRef v5 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, v10);
  }
  CFRelease(v1);
  return v5;
}

char *CaptiveAccountsATTMD5Hash(const __CFString *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFIndex v2 = CFStringGetLength(a1) + 1;
  CFTypeRef result = (char *)malloc_type_malloc(v2, 0x351E99B8uLL);
  if (result)
  {
    CFDictionaryRef v4 = result;
    if (CFStringGetCString(a1, result, v2, 0x8000100u))
    {
      *(void *)md = 0;
      uint64_t v7 = 0;
      CC_LONG v5 = strlen(v4);
      CC_MD5(v4, v5, md);
      free(v4);
      return (char *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v7, BYTE1(v7), BYTE2(v7), BYTE3(v7), BYTE4(v7), BYTE5(v7), BYTE6(v7), HIBYTE(v7));
    }
    else
    {
      free(v4);
      return 0;
    }
  }
  return result;
}

void CNAccountsSFRRejected(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *a6 = 0;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171D8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17028], (const void *)*MEMORY[0x263F17030]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16EF0], (const void *)*MEMORY[0x263F16EF8]);
  CFStringRef v9 = CFStringCreateWithFormat(v7, 0, @"%@-%@", kWISPrSecurityDomain, a1);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17078], v9);
  if (v9) {
    CFRelease(v9);
  }
  SecItemDelete(Mutable);
  logger = mysyslog_get_logger();
  os_log_type_t v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v11))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v13 = a1;
    _os_log_impl(&dword_225F82000, logger, v11, "Purged credentials for account %@", buf, 0xCu);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void SFRHandleGetResult(uint64_t a1, int a2, const __CFDictionary *a3)
{
  values[2] = *(void **)MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 56)) {
    return;
  }
  if (a2 != 5) {
    *(void *)(a1 + 56) = 0;
  }
  CFStringRef Value = (__CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"ResponseCodeKey");
  CFTypeID v6 = (__CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"UsernameKey");
  CFAllocatorRef v7 = (__CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"PasswordKey");
  if (Value) {
    uint64_t v8 = Value;
  }
  else {
    uint64_t v8 = @"c_response";
  }
  CFStringRef v9 = CFDictionaryGetValue(a3, v8);
  if (!v9)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v37 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v37))
    {
      *(_DWORD *)keys = 138412290;
      *(void *)&keys[4] = v8;
      _os_log_impl(&dword_225F82000, logger, v37, "%@ missing", keys, 0xCu);
    }
    uint64_t v38 = mysyslog_get_logger();
    os_log_type_t v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39)) {
      goto LABEL_40;
    }
    *(_WORD *)keys = 0;
    CFStringRef v40 = "Carrier credentials failed. Unable to parse response.";
    CFAllocatorRef v41 = v38;
    os_log_type_t v42 = v39;
    uint32_t v43 = 2;
    goto LABEL_39;
  }
  CFRange v10 = v9;
  os_log_type_t v11 = (__CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"SuccessCodeValue");
  if (v11) {
    CFDictionaryRef v12 = v11;
  }
  else {
    CFDictionaryRef v12 = @"1";
  }
  if (!CFEqual(v10, v12))
  {
    CFDictionaryRef v44 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"ResponseCodes");
    if (v44) {
      uint64_t v45 = CFDictionaryGetValue(v44, v10);
    }
    else {
      uint64_t v45 = 0;
    }
    CFDictionaryRef v46 = mysyslog_get_logger();
    os_log_type_t v47 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v46, v47)) {
      goto LABEL_40;
    }
    *(_DWORD *)keys = 138412546;
    *(void *)&keys[4] = v10;
    *(_WORD *)&keys[12] = 2112;
    *(void *)&keys[14] = v45;
    CFStringRef v40 = "Carrier credentials failed. Response code: %@ - %@";
    CFAllocatorRef v41 = v46;
    os_log_type_t v42 = v47;
    uint32_t v43 = 22;
LABEL_39:
    _os_log_impl(&dword_225F82000, v41, v42, v40, keys, v43);
LABEL_40:
    uint64_t v14 = 0;
    CFArrayRef v17 = 0;
    goto LABEL_41;
  }
  if (v6) {
    uint64_t v13 = v6;
  }
  else {
    uint64_t v13 = @"m_response";
  }
  uint64_t v14 = (void *)CFDictionaryGetValue(a3, v13);
  if (v7) {
    CFDictionaryRef v15 = v7;
  }
  else {
    CFDictionaryRef v15 = @"p_response";
  }
  CFArrayRef v16 = (__CFString *)CFDictionaryGetValue(a3, v15);
  CFArrayRef v17 = v16;
  if (v14 && v16)
  {
    uint64_t v18 = *(void *)(a1 + 32);
    CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171D8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17028], (const void *)*MEMORY[0x263F17030]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16EF0], (const void *)*MEMORY[0x263F16EF8]);
    CFStringRef v21 = CFStringCreateWithFormat(v19, 0, @"%@-%@", kWISPrSecurityDomain, v18);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17078], v21);
    if (v21) {
      CFRelease(v21);
    }
    SecItemDelete(Mutable);
    uint32_t v22 = (const void *)*MEMORY[0x263F16ED8];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v14);
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v19, v17, 0x8000100u, 0);
    if (!ExternalRepresentation)
    {
      os_log_type_t v49 = mysyslog_get_logger();
      os_log_type_t v50 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v49, v50)) {
        goto LABEL_54;
      }
      *(_WORD *)keys = 0;
      CFStringRef v32 = "CFStringCreateExternalRepresentation failed";
      OSStatus v33 = keys;
      CFDictionaryRef v34 = v49;
      os_log_type_t v35 = v50;
      uint32_t v51 = 2;
      goto LABEL_53;
    }
    CFDataRef v24 = ExternalRepresentation;
    CFStringRef v25 = (const void *)*MEMORY[0x263F175A8];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F175A8], ExternalRepresentation);
    CFRelease(v24);
    OSStatus v26 = SecItemAdd(Mutable, 0);
    if (v26)
    {
      OSStatus v27 = v26;
      if (v26 != -25299)
      {
        os_log_type_t v54 = mysyslog_get_logger();
        os_log_type_t v55 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v54, v55)) {
          goto LABEL_54;
        }
        *(_DWORD *)keys = 67109120;
        *(_DWORD *)&keys[4] = v27;
        CFStringRef v32 = "SecItemAdd failed: %d";
        OSStatus v33 = keys;
        CFDictionaryRef v34 = v54;
        os_log_type_t v35 = v55;
        goto LABEL_52;
      }
      *(void *)keys = v22;
      *(void *)&keys[8] = v25;
      values[0] = (void *)CFDictionaryGetValue(Mutable, v22);
      values[1] = (void *)CFDictionaryGetValue(Mutable, v25);
      CFDictionaryRef v28 = CFDictionaryCreate(v19, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionaryRemoveValue(Mutable, v25);
      OSStatus v29 = SecItemUpdate(Mutable, v28);
      if (v28) {
        CFRelease(v28);
      }
      if (v29)
      {
        CFStringRef v30 = mysyslog_get_logger();
        os_log_type_t v31 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v30, v31)) {
          goto LABEL_54;
        }
        v57[0] = 67109120;
        v57[1] = v29;
        CFStringRef v32 = "SecItemUpdate failed: %d";
        OSStatus v33 = (uint8_t *)v57;
        CFDictionaryRef v34 = v30;
        os_log_type_t v35 = v31;
LABEL_52:
        uint32_t v51 = 8;
LABEL_53:
        _os_log_impl(&dword_225F82000, v34, v35, v32, v33, v51);
LABEL_54:
        if (Mutable) {
          CFRelease(Mutable);
        }
        goto LABEL_41;
      }
    }
    uint32_t v52 = mysyslog_get_logger();
    os_log_type_t v53 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v52, v53)) {
      goto LABEL_54;
    }
    *(_DWORD *)keys = 138412290;
    *(void *)&keys[4] = v14;
    CFStringRef v32 = "added password for account %@ to keychain";
    OSStatus v33 = keys;
    CFDictionaryRef v34 = v52;
    os_log_type_t v35 = v53;
    uint32_t v51 = 12;
    goto LABEL_53;
  }
LABEL_41:
  if (!*(void *)(a1 + 56))
  {
    CFDictionaryRef v48 = WISPrCredentialsDictionaryCreate(v14, v17);
    (*(void (**)(void, CFDictionaryRef))(a1 + 16))(*(void *)(a1 + 24), v48);
    if (v48) {
      CFRelease(v48);
    }
    SFRStateCleanup((void *)a1);
  }
}

void SFRStateCleanup(void *a1)
{
  CFIndex v2 = (const void *)*((void *)a1 + 4);
  if (v2)
  {
    CFRelease(v2);
    *((void *)a1 + 4) = 0;
  }
  os_log_type_t v3 = (const void *)*((void *)a1 + 5);
  if (v3)
  {
    CFRelease(v3);
    *((void *)a1 + 5) = 0;
  }
  CFDictionaryRef v4 = (__CFRunLoopSource *)*((void *)a1 + 6);
  if (v4)
  {
    CFRunLoopSourceInvalidate(v4);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *((CFRunLoopSourceRef *)a1 + 6), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFTypeID v6 = (const void *)*((void *)a1 + 6);
    if (v6)
    {
      CFRelease(v6);
      *((void *)a1 + 6) = 0;
    }
  }
  if (*((void *)a1 + 7)) {
    captive_agent_get_credentials_abort((void *)a1 + 7);
  }

  free(a1);
}

uint64_t CNAccountsSFRValidate()
{
  return 1;
}

CFRunLoopSourceRef *CNAccountsSFRQueryStart(__CFRunLoopSource *a1, __CFRunLoopSource *a2, uint64_t a3, uint64_t a4, uint64_t a5, __CFRunLoopSource *a6, __CFRunLoopSource *a7)
{
  os_log_type_t v11 = (CFRunLoopSourceRef *)malloc_type_malloc(0x40uLL, 0xE0040C44E1B7CuLL);
  CFDictionaryRef v12 = v11;
  if (v11)
  {
    v15.version = 0;
    memset(&v15.retain, 0, 56);
    v15.info = v11;
    v15.perform = (void (__cdecl *)(void *))SFRQueryDo;
    *(_OWORD *)os_log_type_t v11 = 0u;
    *((_OWORD *)v11 + 1) = 0u;
    *((_OWORD *)v11 + 2) = 0u;
    *((_OWORD *)v11 + 3) = 0u;
    v11[1] = (CFRunLoopSourceRef)SFRQueryAbort;
    v11[2] = a6;
    v11[3] = a7;
    v11[6] = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &v15);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v12[6], (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRunLoopSourceSignal(v12[6]);
    void v12[4] = a1;
    CFRetain(a1);
    v12[5] = a2;
    CFRetain(a2);
  }
  return v12;
}

void SFRQueryDo(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 48));
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 48), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  os_log_type_t v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 48) = 0;
  }
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_225F82000, logger, v5, "querying keychain for %@", (uint8_t *)&buf, 0xCu);
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@-%@", kWISPrSecurityDomain, *(void *)(a1 + 32));
  uint64_t v9 = *MEMORY[0x263F17078];
  *(void *)&long long buf = *MEMORY[0x263F171B8];
  *((void *)&buf + 1) = v9;
  uint64_t v10 = *MEMORY[0x263F16EF0];
  uint64_t v35 = *MEMORY[0x263F17028];
  uint64_t v36 = v10;
  uint64_t v11 = *MEMORY[0x263F17518];
  uint64_t v37 = *MEMORY[0x263F17520];
  uint64_t v38 = v11;
  values[0] = *(void **)MEMORY[0x263F171D8];
  values[1] = (void *)v8;
  CFDictionaryRef v12 = (void *)*MEMORY[0x263F16EF8];
  values[2] = *(void **)MEMORY[0x263F17030];
  values[3] = v12;
  uint64_t v32 = *MEMORY[0x263EFFB40];
  uint64_t v33 = v32;
  CFDictionaryRef v13 = CFDictionaryCreate(v7, (const void **)&buf, (const void **)values, 6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v8) {
    CFRelease(v8);
  }
  CFTypeRef result = 0;
  OSStatus v14 = SecItemCopyMatching(v13, &result);
  if (v13) {
    CFRelease(v13);
  }
  if (!v14 && result)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x263F175A8]);
    if (Value) {
      CFArrayRef v16 = (__CFString *)CFStringCreateFromExternalRepresentation(v7, Value, 0x8000100u);
    }
    else {
      CFArrayRef v16 = 0;
    }
    CFArrayRef v17 = (void *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x263F16ED8]);
    CFRetain(v17);
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
    if (v17 && v16)
    {
      CFDictionaryRef v18 = WISPrCredentialsDictionaryCreate(v17, v16);
      (*(void (**)(void, CFDictionaryRef))(a1 + 16))(*(void *)(a1 + 24), v18);
      SFRStateCleanup((void *)a1);
      CFRelease(v17);
      CFRelease(v16);
      if (v18) {
        CFRelease(v18);
      }
      return;
    }
    if (v17) {
      CFRelease(v17);
    }
    if (v16) {
      CFRelease(v16);
    }
  }
  CFStringRef v19 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"CredentialsURL");
  if (!v19)
  {
    OSStatus v27 = mysyslog_get_logger();
    os_log_type_t v28 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v27, v28))
    {
      *(_WORD *)os_log_type_t v39 = 0;
      OSStatus v29 = "carrier account is missing CredentialsURL";
      goto LABEL_36;
    }
LABEL_37:
    (*(void (**)(void, void))(a1 + 16))(*(void *)(a1 + 24), 0);
    SFRStateCleanup((void *)a1);
    return;
  }
  CFStringRef v20 = v19;
  CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"ServiceType");
  if (v21) {
    CFStringRef v22 = v21;
  }
  else {
    CFStringRef v22 = (const __CFString *)*MEMORY[0x263F02E18];
  }
  if (CaptiveIsDebug())
  {
    uint64_t v23 = mysyslog_get_logger();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      *(_DWORD *)os_log_type_t v39 = 138412290;
      CFStringRef v40 = v20;
      _os_log_impl(&dword_225F82000, v23, v24, "getting credentials from %@", v39, 0xCu);
    }
  }
  CFRunLoopRef v25 = CFRunLoopGetCurrent();
  credentials = captive_agent_get_credentials(v20, v22, @"CaptiveNetworkSupport-480.60.4", 0x1Eu, (uint64_t)SFRHandleGetResult, a1, (uint64_t)v25);
  *(void *)(a1 + 56) = credentials;
  if (!credentials)
  {
    OSStatus v27 = mysyslog_get_logger();
    os_log_type_t v28 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v27, v28))
    {
      *(_WORD *)os_log_type_t v39 = 0;
      OSStatus v29 = "failed to start http GET";
LABEL_36:
      _os_log_impl(&dword_225F82000, v27, v28, v29, v39, 2u);
      goto LABEL_37;
    }
    goto LABEL_37;
  }
}

void PowerChangeRegister(uint64_t (*a1)(void))
{
  if (!S_power_connection)
  {
    IONotificationPortRef thePortRef = 0;
    S_power_connection = IORegisterForSystemPower(0, &thePortRef, (IOServiceInterestCallback)power_changed, (io_object_t *)&S_power_notifier);
    if (S_power_connection)
    {
      S_power_rls = (uint64_t)IONotificationPortGetRunLoopSource(thePortRef);
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, (CFRunLoopSourceRef)S_power_rls, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      if (S_power_connection)
      {
        S_awake = 1;
        S_callback_0 = a1;
      }
    }
  }
}

void PowerChangeDeregister()
{
  if (S_power_connection)
  {
    if (S_power_rls)
    {
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)S_power_rls, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      S_power_rls = 0;
    }
    if (S_power_notifier)
    {
      IODeregisterForSystemPower((io_object_t *)&S_power_notifier);
      S_power_notifier = 0;
    }
    if (S_power_connection)
    {
      IOServiceClose(S_power_connection);
      S_power_connection = 0;
    }
    S_callback_0 = 0;
    S_awake = 0;
  }
}

void power_changed(int a1, int a2, int a3, intptr_t notificationID)
{
  if (a3 == -536870288)
  {
LABEL_7:
    io_connect_t v5 = S_power_connection;
    IOAllowPowerChange(v5, notificationID);
    return;
  }
  if (a3 != -536870112)
  {
    if (a3 != -536870272 || S_awake != 1) {
      return;
    }
    S_awake = 0;
    if (S_callback_0) {
      S_callback_0(0);
    }
    goto LABEL_7;
  }
  if ((S_awake & 1) == 0)
  {
    S_awake = 1;
    uint64_t v6 = (void (*)(uint64_t))S_callback_0;
    if (S_callback_0)
    {
      v6(1);
    }
  }
}

const __SCPreferences *CaptivePrefsInit(__CFRunLoop *a1, uint64_t (*a2)(void))
{
  CFTypeRef result = SCPreferencesCreate(0, @"CaptivePrefs", @"com.apple.captive.control.plist");
  S_prefs = (uint64_t)result;
  if (a1)
  {
    if (a2)
    {
      S_callback_1 = a2;
      SCPreferencesSetCallback(result, (SCPreferencesCallBack)CaptivePrefsChanged, 0);
      CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE78];
      SCPreferencesScheduleWithRunLoop((SCPreferencesRef)S_prefs, a1, (CFStringRef)*MEMORY[0x263EFFE78]);
      memset(&v6, 0, 72);
      v6.perform = (void (__cdecl *)(void *))prefs_changed_0;
      S_source = (uint64_t)CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &v6);
      CFRunLoopAddSource(a1, (CFRunLoopSourceRef)S_source, v5);
      dispatch_get_global_queue(0, 0);
      CFTypeRef result = (const __SCPreferences *)_scprefs_observer_watch();
      S_prefs_observer = (uint64_t)result;
      S_runloop = (uint64_t)a1;
    }
  }
  return result;
}

uint64_t (*CaptivePrefsChanged())(void)
{
  CFTypeRef result = S_callback_1;
  if (S_callback_1) {
    return (uint64_t (*)(void))S_callback_1();
  }
  return result;
}

void CaptivePrefsRefresh()
{
  if (S_prefs) {
    SCPreferencesSynchronize((SCPreferencesRef)S_prefs);
  }
  uint64_t v0 = (const __SCPreferences *)S_managed_prefs;
  if (S_managed_prefs)
  {
    SCPreferencesSynchronize(v0);
  }
}

uint64_t CaptivePrefsSave()
{
  uint64_t result = S_prefs;
  if (S_prefs)
  {
    uint64_t v1 = SCPreferencesCommitChanges((SCPreferencesRef)S_prefs);
    SCPreferencesSynchronize((SCPreferencesRef)S_prefs);
    return v1;
  }
  return result;
}

uint64_t CaptivePrefsIsActive()
{
  return CaptivePrefsGetBoolean(@"Active", 1);
}

uint64_t CaptivePrefsGetBoolean(const __CFString *a1, uint64_t a2)
{
  char v7 = 0;
  CFDictionaryRef v4 = (const __SCPreferences *)S_managed_prefs;
  if (!S_managed_prefs)
  {
    CFDictionaryRef v4 = SCPreferencesCreate(0, @"CaptivePrefs", @"/Library/Managed Preferences/mobile/com.apple.captive.control.plist");
    S_managed_prefs = (uint64_t)v4;
  }
  uint64_t result = prefs_common_get_BOOLean(v4, a1, a2, &v7);
  if (!v7)
  {
    CFRunLoopSourceContext v6 = (const __SCPreferences *)S_prefs;
    if (!S_prefs)
    {
      CFRunLoopSourceContext v6 = SCPreferencesCreate(0, @"CaptivePrefs", @"com.apple.captive.control.plist");
      S_prefs = (uint64_t)v6;
    }
    return prefs_common_get_BOOLean(v6, a1, a2, 0);
  }
  return result;
}

uint64_t CaptivePrefsIsDebug()
{
  return CaptivePrefsGetBoolean(@"Debug", 0);
}

uint64_t CaptivePrefsIsVerbose()
{
  return CaptivePrefsGetBoolean(@"Verbose", 0);
}

const __SCPreferences *CaptivePrefsSetActive(int a1)
{
  uint64_t v1 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a1) {
    uint64_t v1 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  return prefs_set_value(@"Active", *v1);
}

const __SCPreferences *CaptivePrefsSetBoolean(const __CFString *a1, int a2)
{
  CFIndex v2 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a2) {
    CFIndex v2 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  return prefs_set_value(a1, *v2);
}

const __SCPreferences *CaptivePrefsSetDebug(int a1)
{
  uint64_t v1 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a1) {
    uint64_t v1 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  return prefs_set_value(@"Debug", *v1);
}

const __SCPreferences *CaptivePrefsSetVerbose(int a1)
{
  uint64_t v1 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a1) {
    uint64_t v1 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  return prefs_set_value(@"Verbose", *v1);
}

const __SCPreferences *CaptivePrefsUnset(CFStringRef key)
{
  uint64_t result = (const __SCPreferences *)S_prefs;
  if (S_prefs
    || (uint64_t result = SCPreferencesCreate(0, @"CaptivePrefs", @"com.apple.captive.control.plist"),
        (S_prefs = (uint64_t)result) != 0))
  {
    return (const __SCPreferences *)SCPreferencesRemoveValue(result, key);
  }
  return result;
}

uint64_t CaptivePrefsGetNumber(CFStringRef key, void *a2)
{
  CFDictionaryRef v4 = (const __SCPreferences *)S_prefs;
  if (!S_prefs)
  {
    CFDictionaryRef v4 = SCPreferencesCreate(0, @"CaptivePrefs", @"com.apple.captive.control.plist");
    S_prefs = (uint64_t)v4;
    if (!v4) {
      return 0;
    }
  }
  CFPropertyListRef Value = SCPreferencesGetValue(v4, key);
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }

  return CFNumberGetValue((CFNumberRef)Value, kCFNumberDoubleType, a2);
}

void CaptivePrefsSetNumber(const __CFString *a1, double a2)
{
  double valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberDoubleType, &valuePtr);
  prefs_set_value(a1, v3);
  CFRelease(v3);
}

const __SCPreferences *prefs_set_value(CFStringRef key, CFPropertyListRef value)
{
  uint64_t result = (const __SCPreferences *)S_prefs;
  if (S_prefs
    || (uint64_t result = SCPreferencesCreate(0, @"CaptivePrefs", @"com.apple.captive.control.plist"),
        (S_prefs = (uint64_t)result) != 0))
  {
    return (const __SCPreferences *)SCPreferencesSetValue(result, key, value);
  }
  return result;
}

uint64_t prefs_common_get_BOOLean(const __SCPreferences *a1, const __CFString *a2, uint64_t a3, unsigned char *a4)
{
  if (a4) {
    *a4 = 0;
  }
  if (!a1) {
    return a3;
  }
  CFPropertyListRef Value = SCPreferencesGetValue(a1, a2);
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return a3;
  }
  if (a4) {
    *a4 = 1;
  }

  return CFBooleanGetValue((CFBooleanRef)Value);
}

uint64_t (*prefs_changed_0())(void)
{
  uint64_t result = S_callback_1;
  if (S_callback_1) {
    return (uint64_t (*)(void))S_callback_1();
  }
  return result;
}

void __enable_prefs_observer_block_invoke()
{
  if (S_source)
  {
    CFRunLoopSourceSignal((CFRunLoopSourceRef)S_source);
    uint64_t v0 = (__CFRunLoop *)S_runloop;
    if (S_runloop)
    {
      CFRunLoopWakeUp(v0);
    }
  }
}

uint64_t CNPluginHandleResponse(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t result = (uint64_t)CNPluginStateProcessResponse(a1, a2);
  if (result)
  {
    CFStringRef v5 = (const void *)result;
    CFRunLoopSourceContext v6 = &S_CNInfoHeadStorage;
    while (1)
    {
      CFRunLoopSourceContext v6 = (uint64_t *)*v6;
      if (!v6) {
        break;
      }
      if (my_CFDictionaryContainsKeyAndValue((const __CFDictionary *)v6[8], v5))
      {
        char v7 = v6 + 8;
        CFStringRef v8 = v6 + 8;
        goto LABEL_10;
      }
      if (my_CFDictionaryContainsKeyAndValue((const __CFDictionary *)v6[14], v5))
      {
        char v7 = v6 + 8;
        CFStringRef v8 = v6 + 14;
LABEL_10:
        uint64_t v11 = *v8;
        if (v11 == *v7)
        {
          v30[0] = a1;
          v30[1] = a2;
          switch(*((_DWORD *)v6 + 14))
          {
            case 2:
              CNInfoEvaluating((uint64_t)v6, 1, (uint64_t)v30);
              break;
            case 3:
              CNInfoAuthenticating((uint64_t)v6, 1, (uint64_t)v30);
              break;
            case 5:
              CNInfoMaintaining((uint64_t)v6, 1, (uint64_t)v30);
              break;
            case 7:
              CNInfoPresentingUI((uint64_t)v6, 1, (uint64_t)v30);
              break;
            case 8:
              CNInfoLoggingOff((uint64_t)v6, 1);
              break;
            default:
              logger = mysyslog_get_logger();
              os_log_type_t v20 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(logger, v20))
              {
                *(_DWORD *)long long buf = 138412546;
                uint64_t DisplayID = CNPluginStateGetDisplayID(a1);
                __int16 v33 = 2112;
                CFDictionaryRef v34 = a2;
                CFStringRef v21 = "%@: ignoring response %@";
                CFStringRef v22 = logger;
                os_log_type_t v23 = v20;
                uint32_t v24 = 22;
                goto LABEL_35;
              }
              break;
          }
        }
        else if (v11 == v6[14])
        {
          uint64_t v12 = CNPluginStateGetDisplayID(a1);
          CFDictionaryRef v13 = mysyslog_get_logger();
          os_log_type_t v14 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v13, v14))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t DisplayID = v12;
            __int16 v33 = 2112;
            CFDictionaryRef v34 = a2;
            _os_log_impl(&dword_225F82000, v13, v14, "%@: filter results = %@", buf, 0x16u);
          }
          if (S_filter_request_count)
          {
            int v15 = responseGetResult(a2);
            if (v15)
            {
              int v16 = v15;
              CFArrayRef v17 = mysyslog_get_logger();
              os_log_type_t v18 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v17, v18))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t DisplayID = v12;
                _os_log_impl(&dword_225F82000, v17, v18, "%@: FilterScanList failed", buf, 0xCu);
              }
              if (v16 == 3) {
                CNPluginStateDisableFilterCommand(a1);
              }
            }
            else
            {
              CFPropertyListRef Value = (void *)CFDictionaryGetValue(a2, @"NetworkList");
              CFTypeID TypeID = CFArrayGetTypeID();
              if (Value && CFGetTypeID(Value) == TypeID)
              {
                CFStringRef BSDName = (__CFString *)SCNetworkInterfaceGetBSDName((SCNetworkInterfaceRef)v6[4]);
                CNPluginStateSetFilterResults(a1, BSDName, Value);
                CNScanListFilterAggregateResults((uint64_t)v6);
              }
              else
              {
                os_log_type_t v28 = mysyslog_get_logger();
                os_log_type_t v29 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v28, v29))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t DisplayID = v12;
                  CFStringRef v21 = "%@: FilterScanList network list invalid";
                  CFStringRef v22 = v28;
                  os_log_type_t v23 = v29;
                  uint32_t v24 = 12;
LABEL_35:
                  _os_log_impl(&dword_225F82000, v22, v23, v21, buf, v24);
                }
              }
            }
          }
        }
        return 1;
      }
    }
    uint64_t v9 = mysyslog_get_logger();
    uint64_t v10 = _SC_syslog_os_log_mapping();
    uint64_t result = os_log_type_enabled(v9, (os_log_type_t)v10);
    if (result)
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t DisplayID = (uint64_t)a2;
      _os_log_impl(&dword_225F82000, v9, (os_log_type_t)v10, "can't find cninfo for %@", buf, 0xCu);
      return 0;
    }
  }
  return result;
}

void CNBuiltinPluginProvideResponse(const void *a1)
{
  if (S_builtin_plugin) {
    CNPluginStateBuiltinProvideResponse(S_builtin_plugin, a1);
  }
}

void CNBuiltinPluginAckEvaluateCommand(const void *a1)
{
  if (S_builtin_plugin) {
    CNPluginStateBuiltinAckEvaluateCommand(S_builtin_plugin, a1);
  }
}

__CFArray *CNPluginHandlerCopyInterfaceList()
{
  uint64_t v0 = S_CNInfoHeadStorage;
  if (!S_CNInfoHeadStorage) {
    return 0;
  }
  CFMutableArrayRef Mutable = 0;
  CFIndex v2 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  do
  {
    if (!Mutable) {
      CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, v2);
    }
    CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v0 + 32));
    CFArrayAppendValue(Mutable, BSDName);
    uint64_t v0 = *(void *)v0;
  }
  while (v0);
  return Mutable;
}

void *CNPluginHandlerForgetSSID()
{
  for (uint64_t i = S_CNInfoHeadStorage; i; uint64_t i = *(void *)i)
    uint64_t result = NetCacheApplyFunction(*(void ***)(i + 136), (uint64_t (*)(void))RemoveCacheEntryWithSSID);
  return result;
}

uint64_t RemoveCacheEntryWithSSID(uint64_t *a1, const void *a2)
{
  Name = (const void *)CNPluginStateGetName((uint64_t)a1);
  uint64_t result = 0;
  if (a2 && Name)
  {
    if (CFEqual(a2, Name)) {
      NetCacheEntryDestroy(a1);
    }
    return 1;
  }
  return result;
}

void *CNPluginHandlerInitialize(uint64_t a1)
{
  CFTypeRef cf = 0;
  int v5 = 0;
  CommandHandlerClassRegister(3u, (uint64_t)CNPluginHandlerMethods);
  CommandHandlerClassRegister(5u, (uint64_t)CNScanListFilterHandlerMethods);
  CNPluginStateListInitialize();
  S_CNInfoHeadStorage = 0;
  CNPluginMonitorHandlerInitialize();
  notify_key = (const char *)nwi_state_get_notify_key();
  CFNumberRef v3 = my_CFRunLoopSourceCreateForBSDNotification(notify_key, (uint64_t)CNPluginHandlerNWIChanged, 0, &v5, (__CFMachPort **)&cf);
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
  S_builtin_plugin = CNPluginStateBuiltinRegister(a1);
  NetIFSetNewInterfaceCallBack((uint64_t)CNPluginHandlerInterfaceAttached);
  NetIFSetWiFiManagerRestartCallBack(CNPluginHandlerWiFiManagerRestart);
  NetIFCheckForNewInterfaces();
  return NetIFSetScanResultsCallBack(CNScanListFilterHandleScanResults);
}

void CNPluginHandlerNWIChanged()
{
  logger = mysyslog_get_logger();
  os_log_type_t v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)CFIndex v2 = 0;
    _os_log_impl(&dword_225F82000, logger, v1, "network information changed", v2, 2u);
  }
  CNPluginHandlerNetworkInformationChanged();
}

void CNPluginHandlerInterfaceAttached(__CFString *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!CNInfoFind(a1))
  {
    CFIndex v2 = (const __SCNetworkInterface **)CNInfoGet(a1);
    if (v2)
    {
      CFNumberRef v3 = v2;
      logger = mysyslog_get_logger();
      os_log_type_t v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v5))
      {
        int v8 = 138412290;
        uint64_t v9 = a1;
        _os_log_impl(&dword_225F82000, logger, v5, "%@ added", (uint8_t *)&v8, 0xCu);
      }
      UIAllowedNewInterface((void (__cdecl *)(const void *))a1);
      if (!NetIFWiFiNetworkIsProtectedForInterface((uint64_t)a1))
      {
        CFRunLoopSourceContext v6 = mysyslog_get_logger();
        os_log_type_t v7 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v6, v7))
        {
          int v8 = 138412290;
          uint64_t v9 = a1;
          _os_log_impl(&dword_225F82000, v6, v7, "%@: joined unsecure network, setting interface rank to Never", (uint8_t *)&v8, 0xCu);
        }
        NetIFSetRankNever(v3[4]);
      }
      CNPluginHandlerNetworkInformationChanged();
    }
  }
}

void CNScanListFilterHandleScanResults(const __CFString *a1, const __CFArray *a2)
{
  values[4] = *(void **)MEMORY[0x263EF8340];
  if (a2)
  {
    if (S_filter_request_count)
    {
      CFDictionaryRef v4 = CNInfoGet(a1);
      if (v4)
      {
        uint64_t v5 = (uint64_t)v4;
        if (!CNPluginStateListShouldSendFilterCommand())
        {
          CNInfoFlushFilterCommand(v5);
          CNPluginStateListApplyFunction((uint64_t)CNScanListFilterFlushResultsApplier, (uint64_t)a1);
          *(_DWORD *)(v5 + 128) = 0;
          logger = mysyslog_get_logger();
          os_log_type_t v29 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(logger, v29)) {
            return;
          }
          LOWORD(keys[0]) = 0;
          CFDictionaryRef v13 = "No plugins can handle FilterScanList command";
          os_log_type_t v14 = logger;
          os_log_type_t v15 = v29;
          uint32_t v16 = 2;
          goto LABEL_30;
        }
        double Current = CFAbsoluteTimeGetCurrent();
        double v7 = Current;
        int v8 = *(_DWORD *)(v5 + 128);
        if (v8)
        {
          double v9 = Current - *(double *)(v5 + 120);
          double v10 = v8 >= 3 ? 30.0 : 5.0;
          if (v9 < v10)
          {
            uint64_t v11 = mysyslog_get_logger();
            os_log_type_t v12 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v11, v12)) {
              return;
            }
            LODWORD(keys[0]) = 138412802;
            *(void **)((char *)keys + 4) = (void *)a1;
            WORD2(keys[1]) = 2048;
            *(void **)((char *)&keys[1] + 6) = *(void **)&v9;
            HIWORD(keys[2]) = 2048;
            keys[3] = *(void **)&v10;
            CFDictionaryRef v13 = "%@: NOT issuing filter command (elapsed %g < %g)";
            os_log_type_t v14 = v11;
            os_log_type_t v15 = v12;
            uint32_t v16 = 32;
LABEL_30:
            _os_log_impl(&dword_225F82000, v14, v15, v13, (uint8_t *)keys, v16);
            return;
          }
        }
        uint64_t Count = CFArrayGetCount(a2);
        CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], Count, MEMORY[0x263EFFF70]);
        if (Count >= 1)
        {
          for (CFIndex i = 0; i != Count; ++i)
          {
            long long v32 = 0u;
            long long v33 = 0u;
            memset(keys, 0, sizeof(keys));
            CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
            networkAttributesInit(keys, ValueAtIndex, 0, 0);
            CFDictionaryRef v22 = copy_network_dict((uint64_t *)keys);
            networkAttributesRelease((uint64_t)keys);
            if (v22)
            {
              CFArrayAppendValue(Mutable, v22);
              CFRelease(v22);
            }
          }
        }
        if (CFArrayGetCount(Mutable))
        {
          int valuePtr = 1;
          if (!Mutable) {
            return;
          }
          CFStringRef v23 = my_CFUUIDStringCreate(0);
          keys[0] = @"UniqueID";
          values[0] = (void *)v23;
          CFNumberRef v24 = CFNumberCreate(v18, kCFNumberSInt32Type, &valuePtr);
          keys[1] = @"Type";
          keys[2] = @"InterfaceName";
          values[1] = v24;
          values[2] = (void *)a1;
          keys[3] = @"NetworkList";
          values[3] = Mutable;
          CFDictionaryRef v25 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          if (v23) {
            CFRelease(v23);
          }
          if (v24) {
            CFRelease(v24);
          }
          if (v25)
          {
            ++*(_DWORD *)(v5 + 128);
            *(double *)(v5 + 120) = v7;
            CNInfoFlushFilterCommand(v5);
            CNPluginStateListApplyFunction((uint64_t)CNScanListFilterFlushResultsApplier, (uint64_t)a1);
            my_FieldSetRetainedCFType((const void **)(v5 + 112), v25);
            OSStatus v26 = mysyslog_get_logger();
            os_log_type_t v27 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v26, v27))
            {
              LODWORD(keys[0]) = 138412290;
              *(void **)((char *)keys + 4) = (void *)a1;
              _os_log_impl(&dword_225F82000, v26, v27, "%@: issuing filter command", (uint8_t *)keys, 0xCu);
            }
            CNPluginStateListIssueFilterCommand((uint64_t)v25);
            CFRelease(v25);
            if (!CNPluginStateListShouldSendFilterCommand()) {
              CNScanListFilterSendClearResults(v5);
            }
          }
        }
        else if (!Mutable)
        {
          return;
        }
        CFRelease(Mutable);
      }
    }
  }
}

uint64_t CNPluginHandlerGetLandingPageURL(void *a1)
{
  os_log_type_t v1 = (void *)S_CNInfoHeadStorage;
  if (!S_CNInfoHeadStorage) {
    return 0;
  }
  while (1)
  {
    CacheEntry = CNInfoGetCacheEntry(v1);
    if (CacheEntry)
    {
      uint64_t result = NetCacheEntryGetRedirectionURL((uint64_t)CacheEntry, a1);
      if (result) {
        break;
      }
    }
    os_log_type_t v1 = (void *)*v1;
    if (!v1) {
      return 0;
    }
  }
  return result;
}

uint64_t *CNInfoGetCacheEntry(void *a1)
{
  if (a1[5]) {
    SSID = (const void *)WiFiNetworkGetSSID();
  }
  else {
    SSID = 0;
  }
  CFNumberRef v3 = (uint64_t **)a1[17];
  double Current = CFAbsoluteTimeGetCurrent();
  CFArrayRef v5 = (const __CFArray *)a1[6];

  return NetCacheLookupEntry(v3, v5, SSID, Current);
}

BOOL CNPluginHandlerIsHandledInterface(const void *a1)
{
  return CNInfoFind(a1) != 0;
}

uint64_t *CNInfoFind(const void *a1)
{
  CFIndex v2 = &S_CNInfoHeadStorage;
  do
  {
    CFIndex v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    CFStringRef BSDName = SCNetworkInterfaceGetBSDName((SCNetworkInterfaceRef)v2[4]);
  }
  while (!CFEqual(a1, BSDName));
  return v2;
}

void CNPluginHandlerCheckPreferences()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BBMonitorCheckPreferences();
  S_UnwhitelistedNetworkProbeInterval = CCPGetUnwhitelistedNetworkProbeInterval();
  S_WhitelistedNetworkProbeInterval = CCPGetWhitelistedNetworkProbeInterval();
  logger = mysyslog_get_logger();
  os_log_type_t v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    int v10 = 134217984;
    uint64_t v11 = S_UnwhitelistedNetworkProbeInterval;
    _os_log_impl(&dword_225F82000, logger, v1, "UnwhitelistedNetworkProbeInterval = %g", (uint8_t *)&v10, 0xCu);
  }
  CFIndex v2 = mysyslog_get_logger();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v2, v3))
  {
    int v10 = 134217984;
    uint64_t v11 = S_WhitelistedNetworkProbeInterval;
    _os_log_impl(&dword_225F82000, v2, v3, "WhitelistedNetworkProbeInterval = %g", (uint8_t *)&v10, 0xCu);
  }
  S_WhitelistedNetworkDetectionEnabled = CCPGetWhitelistedNetworkDetectionEnabled();
  S_WhitelistedProtectedNetworkDetectionEnabled = CCPGetWhitelistedProtectedNetworkDetectionEnabled();
  CFDictionaryRef v4 = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    if (S_WhitelistedNetworkDetectionEnabled) {
      CFRunLoopSourceContext v6 = "on";
    }
    else {
      CFRunLoopSourceContext v6 = "off";
    }
    int v10 = 136315138;
    uint64_t v11 = (uint64_t)v6;
    _os_log_impl(&dword_225F82000, v4, v5, "WhitelistedNetworkDetectionEnabled = %s", (uint8_t *)&v10, 0xCu);
  }
  double v7 = mysyslog_get_logger();
  os_log_type_t v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v7, v8))
  {
    if (S_WhitelistedProtectedNetworkDetectionEnabled) {
      double v9 = "on";
    }
    else {
      double v9 = "off";
    }
    int v10 = 136315138;
    uint64_t v11 = (uint64_t)v9;
    _os_log_impl(&dword_225F82000, v7, v8, "WhitelistedProtectedNetworkDetectionEnabled = %s", (uint8_t *)&v10, 0xCu);
  }
}

CFDictionaryRef CNPluginHandlerCopyCurrentNetworkInfo(uint64_t a1)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  uint64_t v1 = NetIFCopyCurrentWiFiNetwork(a1);
  if (!v1) {
    return 0;
  }
  CFIndex v2 = (const void *)v1;
  CFBooleanRef Property = (void *)WiFiNetworkGetProperty();
  SSIDData = (void *)WiFiNetworkGetSSIDData();
  SSID = (void *)WiFiNetworkGetSSID();
  CFDictionaryRef v6 = 0;
  if (SSIDData && SSID && Property)
  {
    double v7 = (void *)*MEMORY[0x263F1BBE0];
    keys[0] = *(void **)MEMORY[0x263F1BBE8];
    keys[1] = v7;
    keys[2] = *(void **)MEMORY[0x263F1BBD8];
    values[0] = SSIDData;
    values[1] = SSID;
    values[2] = Property;
    CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  CFRelease(v2);
  return v6;
}

void CNInfoEvaluating(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  switch(a2)
  {
    case 0:
      CNInfoSetAuthState(a1, 2);
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(void *)(a1 + 88));
      my_FieldSetRetainedCFType((const void **)(a1 + 72), 0);
      *(_DWORD *)(a1 + 80) = 0;
      CNInfoFlushAuthCommand(a1);
      *(_DWORD *)(a1 + 104) &= ~1u;
      networkAttributesInit(&v76, *(CFTypeRef *)(a1 + 40), 1, 0);
      if (a3) {
        *((void *)&v76 + 1) = *(void *)a3;
      }
      if ((void)v78)
      {
        if (NetIFGetWiFiNetworkWasCaptive(v78)) {
          *(void *)&long long v77 = *MEMORY[0x263EFFB40];
        }
        CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        *((void *)&v79 + 1) = networkCopyCaptivePortalAPIURL((uint64_t)BSDName);
      }
      CacheEntry = CNInfoGetCacheEntry((void *)a1);
      if (CacheEntry)
      {
        double v7 = CacheEntry;
        if (NetCacheEntryGetIsCaptive((uint64_t)CacheEntry)) {
          NetCacheEntryDestroy(v7);
        }
        else {
          *((void *)&v77 + 1) = *MEMORY[0x263EFFB40];
        }
      }
      CFDictionaryRef v44 = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      AuthCFDictionaryRef Command = createAuthCommand(v44, 2, (uint64_t *)&v76);
      networkAttributesRelease((uint64_t)&v76);
      my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
      unsigned int v46 = CNPluginStateListIssueEvaluateCommand((uint64_t)AuthCommand, *(CFArrayRef *)(a1 + 96));
      CFRelease(AuthCommand);
      if (v46)
      {
        uint32_t v16 = *(CFRunLoopTimerRef **)(a1 + 88);
        double v17 = 5.0;
        CFAllocatorRef v18 = (__CFRunLoopTimer *)a1;
        uint64_t v19 = 3;
        goto LABEL_55;
      }
      buf.info = @"Evaluate command has no recipients";
      buf.isa = (void *)1;
      logger = mysyslog_get_logger();
      int v48 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, (os_log_type_t)v48))
      {
        *(_WORD *)CFDictionaryRef v75 = 0;
        _os_log_impl(&dword_225F82000, logger, (os_log_type_t)v48, "Evaluate command has no recipients", v75, 2u);
      }
      CNInfoFailure(a1, &buf);
      return;
    case 1:
      uint64_t DisplayID = (void *)CNPluginStateGetDisplayID(*(void *)a3);
      CFPropertyListRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), @"RedirectHostname");
      if (Value) {
        PassiveDetectSetRedirectURLHostname(Value);
      }
      unsigned int Result = responseGetResult(*(const __CFDictionary **)(a3 + 8));
      CNPluginStateSetEvaluateCommandStatus(*(void *)a3, 1);
      if (Result)
      {
        uint64_t v11 = mysyslog_get_logger();
        os_log_type_t v12 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v11, v12))
        {
          LODWORD(buf.isa) = 138412802;
          *(void **)((char *)&buf.isa + 4) = DisplayID;
          WORD2(buf.info) = 2080;
          *(uint64_t *)((char *)&buf.info + 6) = (uint64_t)CNPResultGetString(Result);
          HIWORD(buf.data) = 1024;
          LODWORD(buf.length) = Result;
          _os_log_impl(&dword_225F82000, v11, v12, "%@: Evaluate result is %s (%d)", (uint8_t *)&buf, 0x1Cu);
        }
        if (NetIFWiFiNetworkIsCarPlayAndInternet())
        {
          CFDictionaryRef v13 = mysyslog_get_logger();
          os_log_type_t v14 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v13, v14))
          {
            SSID = *(void **)(a1 + 40);
            if (SSID) {
              SSID = (void *)WiFiNetworkGetSSID();
            }
            LODWORD(buf.isa) = 138412290;
            *(void **)((char *)&buf.isa + 4) = SSID;
            _os_log_impl(&dword_225F82000, v13, v14, "continuing to evaluate CarPlay Wi-Fi %@", (uint8_t *)&buf, 0xCu);
          }
          uint32_t v16 = *(CFRunLoopTimerRef **)(a1 + 88);
          double v17 = 300.0;
          CFAllocatorRef v18 = (__CFRunLoopTimer *)a1;
          uint64_t v19 = 0;
          goto LABEL_55;
        }
        *(_DWORD *)(a1 + 104) |= 1u;
        if (*(_DWORD *)(a1 + 232) == 1)
        {
          *(_DWORD *)(a1 + 232) = 3;
          os_log_type_t v49 = mysyslog_get_logger();
          os_log_type_t v50 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v49, v50))
          {
            LODWORD(buf.isa) = 138412290;
            *(void **)((char *)&buf.isa + 4) = DisplayID;
            _os_log_impl(&dword_225F82000, v49, v50, "%@: Evaluation with IPv6 Only configuration failed", (uint8_t *)&buf, 0xCu);
          }
          int v51 = *(_DWORD *)(a1 + 104);
          if ((v51 & 2) != 0)
          {
            *(_DWORD *)(a1 + 104) = v51 & 0xFFFFFFFD;
            double Current = CFRunLoopGetCurrent();
            CFArrayRef v61 = (const void *)*MEMORY[0x263EFFE88];
            buf.isa = (void *)MEMORY[0x263EF8330];
            buf.info = 0x40000000;
            buf.data = (char *)___handleIPv6OnlyEvaluationFailure_block_invoke;
            buf.length = (uint64_t)&__block_descriptor_tmp_4;
            uint64_t v81 = a1;
            CFRunLoopPerformBlock(Current, v61, &buf);
            os_log_type_t v62 = CFRunLoopGetCurrent();
            CFRunLoopWakeUp(v62);
          }
          else
          {
            CNInfoInactive(a1, 5);
          }
          return;
        }
        goto LABEL_64;
      }
      os_log_type_t v27 = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), @"Network");
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (!v27
        || CFGetTypeID(v27) != TypeID
        || (v29 = CFDictionaryGetValue((CFDictionaryRef)v27, @"IsCaptive"), CFTypeID v30 = CFBooleanGetTypeID(), !v29)
        || CFGetTypeID(v29) != v30
        || !CFBooleanGetValue((CFBooleanRef)v29))
      {
        os_log_type_t v42 = mysyslog_get_logger();
        os_log_type_t v43 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v42, v43))
        {
          LODWORD(buf.isa) = 138412290;
          *(void **)((char *)&buf.isa + 4) = DisplayID;
          _os_log_impl(&dword_225F82000, v42, v43, "%@: network is not captive", (uint8_t *)&buf, 0xCu);
        }
        if (CNPluginStateIsBuiltin(*(void *)a3) == 1) {
          postNonCaptiveAnalyticsEvent(a1);
        }
LABEL_64:
        unsigned int Confidence = 0;
        goto LABEL_65;
      }
      NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
      os_log_type_t v31 = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), @"Network");
      unsigned int Confidence = networkGetConfidence(v31, (uint64_t)DisplayID);
      CFNumberRef v33 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), @"Network");
      CFTypeID v34 = CFDictionaryGetTypeID();
      if (v33)
      {
        if (CFGetTypeID(v33) == v34
          && (CFNumberRef v33 = (const __CFNumber *)CFDictionaryGetValue(v33, @"DetectionType"),
              LODWORD(buf.isa) = 0,
              CFTypeID v35 = CFNumberGetTypeID(),
              v33)
          && CFGetTypeID(v33) == v35)
        {
          CFNumberGetValue(v33, kCFNumberSInt32Type, &buf);
          LODWORD(v33) = buf.isa;
          if (LODWORD(buf.isa) >= 4)
          {
            uint64_t v36 = mysyslog_get_logger();
            os_log_type_t v37 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v36, v37))
            {
              LODWORD(buf.isa) = 138412546;
              *(void **)((char *)&buf.isa + 4) = DisplayID;
              WORD2(buf.info) = 1024;
              *(_DWORD *)((char *)&buf.info + 6) = v33;
              _os_log_impl(&dword_225F82000, v36, v37, "%@: invalid captive detection type value %d treating as None", (uint8_t *)&buf, 0x12u);
            }
          }
        }
        else
        {
          LODWORD(v33) = 0;
        }
      }
      CFMutableArrayRef v67 = mysyslog_get_logger();
      os_log_type_t v68 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v67, v68))
      {
        CFStringRef String = CNPConfidenceGetString(Confidence);
        os_log_type_t v70 = CNPCaptiveDetectionTypeGetString(v33);
        LODWORD(buf.isa) = 138412802;
        *(void **)((char *)&buf.isa + 4) = DisplayID;
        WORD2(buf.info) = 2080;
        *(uint64_t *)((char *)&buf.info + 6) = (uint64_t)String;
        HIWORD(buf.data) = 2080;
        buf.length = (uint64_t)v70;
        _os_log_impl(&dword_225F82000, v67, v68, "%@: network is captive Confidence: %s, Detection Type: %s", (uint8_t *)&buf, 0x20u);
      }
      if (!*(void *)(a1 + 72) || Confidence > *(_DWORD *)(a1 + 80))
      {
        my_FieldSetRetainedCFType((const void **)(a1 + 72), *(CFTypeRef *)a3);
        *(_DWORD *)(a1 + 80) = Confidence;
      }
      *(_DWORD *)(a1 + 164) = v33;
      BOOL HasNeverBeenCaptive = NetIFWiFiNetworkHasNeverBeenCaptive(*(void *)(a1 + 40));
      *(unsigned char *)(a1 + 161) = HasNeverBeenCaptive;
      if (HasNeverBeenCaptive)
      {
        os_log_type_t v72 = mysyslog_get_logger();
        os_log_type_t v73 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v72, v73))
        {
          os_log_type_t v74 = *(void **)(a1 + 40);
          if (v74) {
            os_log_type_t v74 = (void *)WiFiNetworkGetSSID();
          }
          LODWORD(buf.isa) = 138412290;
          *(void **)((char *)&buf.isa + 4) = v74;
          _os_log_impl(&dword_225F82000, v72, v73, "SSID %@ became captive network", (uint8_t *)&buf, 0xCu);
        }
      }
LABEL_65:
      if (!CNPluginStateListIsEvaluateResponsePending() || Confidence == 2)
      {
        if (*(void *)(a1 + 72))
        {
          SendCleanupCommandToBuiltinPluginIfNecessary(a1, 0);
          goto LABEL_69;
        }
        int v52 = NetIFIsQuickProbeRequired();
        os_log_type_t v53 = mysyslog_get_logger();
        os_log_type_t v54 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v53, v54))
        {
          os_log_type_t v55 = "was";
          if (!v52) {
            os_log_type_t v55 = "was not";
          }
          LODWORD(buf.isa) = 136315138;
          *(void **)((char *)&buf.isa + 4) = (void *)v55;
          _os_log_impl(&dword_225F82000, v53, v54, "quick probe %s used", (uint8_t *)&buf, 0xCu);
        }
        if (!Result || !v52)
        {
          if (v52)
          {
            CFDictionaryRef v63 = mysyslog_get_logger();
            os_log_type_t v64 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v63, v64))
            {
              CFStringRef v65 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
              uint64_t v66 = *(void *)(a1 + 40);
              if (v66) {
                uint64_t v66 = WiFiNetworkGetSSID();
              }
              LODWORD(buf.isa) = 138412546;
              *(void **)((char *)&buf.isa + 4) = (void *)v65;
              WORD2(buf.info) = 2112;
              *(uint64_t *)((char *)&buf.info + 6) = v66;
              _os_log_impl(&dword_225F82000, v63, v64, "%@: SSID '%@' reporting quick probe success", (uint8_t *)&buf, 0x16u);
            }
            NetIFReportQuickProbeResult();
          }
          goto LABEL_88;
        }
        uint32_t v56 = mysyslog_get_logger();
        os_log_type_t v57 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v56, v57))
        {
          CFStringRef v58 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
          uint64_t v59 = *(void *)(a1 + 40);
          if (v59) {
            uint64_t v59 = WiFiNetworkGetSSID();
          }
          LODWORD(buf.isa) = 138412546;
          *(void **)((char *)&buf.isa + 4) = (void *)v58;
          WORD2(buf.info) = 2112;
          *(uint64_t *)((char *)&buf.info + 6) = v59;
          _os_log_impl(&dword_225F82000, v56, v57, "%@: SSID '%@' reporting quick probe failure", (uint8_t *)&buf, 0x16u);
        }
        NetIFReportQuickProbeResult();
      }
      return;
    case 2:
      CNPluginStateListHandleUnregistered();
      uint64_t v20 = *(void *)(a1 + 72);
      if (!v20)
      {
        uint64_t v38 = mysyslog_get_logger();
        os_log_type_t v39 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v38, v39))
        {
          LOWORD(buf.isa) = 0;
          _os_log_impl(&dword_225F82000, v38, v39, "Evaluate timed out, these plugins did not respond:", (uint8_t *)&buf, 2u);
        }
        CNPluginStateListLogPendingCommand(*(void *)(a1 + 64));
        goto LABEL_88;
      }
      CFStringRef v21 = (void *)CNPluginStateGetDisplayID(v20);
      CFDictionaryRef v22 = mysyslog_get_logger();
      os_log_type_t v23 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v22, v23)) {
        goto LABEL_69;
      }
      LODWORD(buf.isa) = 138412290;
      *(void **)((char *)&buf.isa + 4) = v21;
      CFNumberRef v24 = "Evaluate timeout fired, using %@";
      goto LABEL_47;
    case 3:
      CFDictionaryRef v25 = mysyslog_get_logger();
      os_log_type_t v26 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v25, v26))
      {
        LOWORD(buf.isa) = 0;
        _os_log_impl(&dword_225F82000, v25, v26, "Evaluate acknowledgement timeout fired", (uint8_t *)&buf, 2u);
      }
      CNPluginStateListSetEvaluateCmdAckTimeoutStatus();
      if (CNPluginStateListIsEvaluateResponsePending())
      {
        uint32_t v16 = *(CFRunLoopTimerRef **)(a1 + 88);
        double v17 = 40.0;
        CFAllocatorRef v18 = (__CFRunLoopTimer *)a1;
        uint64_t v19 = 2;
LABEL_55:
        TimerSet(v16, (__CFRunLoopTimer *)CNInfoEvaluating, v18, (__CFRunLoopTimer *)v19, 0, v17);
      }
      else
      {
        CNPluginStateListHandleUnregistered();
        uint64_t v40 = *(void *)(a1 + 72);
        if (v40)
        {
          uint64_t v41 = (void *)CNPluginStateGetDisplayID(v40);
          CFDictionaryRef v22 = mysyslog_get_logger();
          os_log_type_t v23 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v22, v23))
          {
            LODWORD(buf.isa) = 138412290;
            *(void **)((char *)&buf.isa + 4) = v41;
            CFNumberRef v24 = "Evaluate acknowledgement timeout fired, using %@";
LABEL_47:
            _os_log_impl(&dword_225F82000, v22, v23, v24, (uint8_t *)&buf, 0xCu);
          }
LABEL_69:
          CNInfoAuthenticating(a1, 0, 0);
        }
        else
        {
LABEL_88:
          CNInfoAuthenticated(a1, 0, 0);
        }
      }
      return;
    default:
      return;
  }
}

void CNInfoAuthenticating(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  memset(&v26, 0, sizeof(v26));
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(void *)(a1 + 88));
      uint64_t DisplayID = (void *)CNPluginStateGetDisplayID(*(void *)a3);
      unsigned int Result = responseGetResult(*(const __CFDictionary **)(a3 + 8));
      char v12 = 1;
      CFDictionaryRef v13 = @"authentication failure";
      switch(Result)
      {
        case 0u:
          CNInfoAuthenticated(a1, 0, (CFDictionaryRef *)a3);
          return;
        case 2u:
          CNInfoPresentingUI(a1, 0, 0);
          return;
        case 5u:
          logger = mysyslog_get_logger();
          os_log_type_t v23 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v23))
          {
            *(_DWORD *)__CFString buf = 138412290;
            os_log_type_t v31 = DisplayID;
            _os_log_impl(&dword_225F82000, logger, v23, "%@: Authenticate failed: Unsupported Network", buf, 0xCu);
          }
          CNInfoAddExcludedDisplayID(a1, DisplayID);
          goto LABEL_23;
        case 6u:
          CFDictionaryRef v13 = 0;
          char v12 = 0;
          goto LABEL_25;
        default:
LABEL_25:
          LOBYTE(v26.isa) = v12;
          v26.info = (uint64_t)v13;
          CFNumberRef v24 = mysyslog_get_logger();
          os_log_type_t v25 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v24, v25)) {
            goto LABEL_28;
          }
          *(_DWORD *)__CFString buf = 138412802;
          os_log_type_t v31 = DisplayID;
          __int16 v32 = 2080;
          CFStringRef String = CNPResultGetString(Result);
          __int16 v34 = 1024;
          unsigned int v35 = Result;
          CFAllocatorRef v18 = "%@: Authenticate result %s (%d)";
          uint64_t v19 = v24;
          os_log_type_t v20 = v25;
          uint32_t v21 = 28;
          break;
      }
    }
    else
    {
      if (a2) {
        return;
      }
      CNInfoSetAuthState(a1, 3);
      CNInfoFlushAuthCommand(a1);
      *(_DWORD *)(a1 + 104) &= 0xFFFFFFFC;
      *(_DWORD *)(a1 + 232) = 0;
      uint64_t v4 = *(void *)(a1 + 72);
      if (v4)
      {
        NetIFWiFiNetworkSetCaptive(*(void *)(a1 + 40), 1u);
        CNInfoUpdateWiFiNetwork(a1);
        networkAttributesInit(&v26.data, *(CFTypeRef *)(a1 + 40), 1, 0);
        CFStringRef BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        AuthCFDictionaryRef Command = createAuthCommand(BSDName, 3, (uint64_t *)&v26.data);
        networkAttributesRelease((uint64_t)&v26.data);
        my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
        CNPluginStateIssueCommand(v4, AuthCommand);
        CFRelease(AuthCommand);
        TimerSet(*(CFRunLoopTimerRef **)(a1 + 88), (__CFRunLoopTimer *)CNInfoAuthenticating, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)2, 0, 45.0);
        if (*(double *)(a1 + 184) > 0.0)
        {
          ++*(_DWORD *)(a1 + 192);
          double Current = CFAbsoluteTimeGetCurrent();
          double v8 = *(double *)(a1 + 184);
          if (Current > v8) {
            *(double *)(a1 + 200) = Current - v8 + *(double *)(a1 + 200);
          }
          *(void *)(a1 + 184) = 0;
        }
        return;
      }
      LOBYTE(v26.isa) = 1;
      v26.info = @"no plugin";
      uint32_t v16 = mysyslog_get_logger();
      os_log_type_t v17 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v16, v17))
      {
LABEL_28:
        CNInfoFailure(a1, &v26);
        return;
      }
      *(_WORD *)__CFString buf = 0;
      CFAllocatorRef v18 = "no plugin";
      uint64_t v19 = v16;
      os_log_type_t v20 = v17;
      uint32_t v21 = 2;
    }
    _os_log_impl(&dword_225F82000, v19, v20, v18, buf, v21);
    goto LABEL_28;
  }
  os_log_type_t v14 = mysyslog_get_logger();
  os_log_type_t v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v14, v15))
  {
    *(_WORD *)__CFString buf = 0;
    _os_log_impl(&dword_225F82000, v14, v15, "Authenticate timed out", buf, 2u);
  }
LABEL_23:
  CNInfoEvaluating(a1, 0, 0);
}

void CNInfoMaintaining(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  memset(v23, 0, sizeof(v23));
  switch(a2)
  {
    case 0:
      CNInfoSetAuthState(a1, 5);
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(void *)(a1 + 88));
      CNInfoFlushAuthCommand(a1);
      *(_DWORD *)(a1 + 104) &= ~1u;
      uint64_t v5 = *(void *)(a1 + 72);
      if (v5)
      {
        networkAttributesInit(v23, *(CFTypeRef *)(a1 + 40), 1, 0);
        if (a3)
        {
          *((void *)&v23[0] + 1) = *(void *)a3;
          if (*(unsigned char *)(a3 + 8)) {
            double v6 = 3.0;
          }
          else {
            double v6 = 45.0;
          }
          if (*(unsigned char *)(a3 + 8)) {
            uint64_t v7 = 3;
          }
          else {
            uint64_t v7 = 2;
          }
        }
        else
        {
          uint64_t v7 = 2;
          double v6 = 45.0;
        }
        *((void *)&v24 + 1) = NetIFWiFiNetworkCopyCaptivePortalAPIURL(*(void *)(a1 + 40));
        CFStringRef BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        AuthCFDictionaryRef Command = createAuthCommand(BSDName, 5, (uint64_t *)v23);
        networkAttributesRelease((uint64_t)v23);
        my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
        CNPluginStateIssueCommand(v5, AuthCommand);
        CFRelease(AuthCommand);
        TimerSet(*(CFRunLoopTimerRef **)(a1 + 88), (__CFRunLoopTimer *)CNInfoMaintaining, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)v7, 0, v6);
      }
      else
      {
        *(_OWORD *)&buf.isa = xmmword_264784F78;
        logger = mysyslog_get_logger();
        uint64_t v17 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, (os_log_type_t)v17))
        {
          *(_WORD *)CFDictionaryRef v22 = 0;
          _os_log_impl(&dword_225F82000, logger, (os_log_type_t)v17, "no plugin", v22, 2u);
        }
        CNInfoFailure(a1, &buf);
      }
      break;
    case 1:
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(void *)(a1 + 88));
      uint64_t DisplayID = (void *)CNPluginStateGetDisplayID(*(void *)a3);
      CFPropertyListRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), @"RedirectHostname");
      if (Value) {
        PassiveDetectSetRedirectURLHostname(Value);
      }
      unsigned int Result = responseGetResult(*(const __CFDictionary **)(a3 + 8));
      if (Result == 4)
      {
        NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
        if (*(unsigned char *)(a1 + 163)) {
          ++*(_DWORD *)(a1 + 208);
        }
        CNInfoAuthenticating(a1, 0, 0);
      }
      else
      {
        unsigned int v11 = Result;
        if (Result)
        {
          CFAllocatorRef v18 = mysyslog_get_logger();
          os_log_type_t v19 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v18, v19))
          {
            LODWORD(buf.isa) = 138412802;
            *(void **)((char *)&buf.isa + 4) = DisplayID;
            WORD2(buf.info) = 2080;
            *(uint64_t *)((char *)&buf.info + 6) = (uint64_t)CNPResultGetString(v11);
            HIWORD(buf.data) = 1024;
            LODWORD(buf.length) = v11;
            _os_log_impl(&dword_225F82000, v18, v19, "%@: Maintain result is %s (%d)", (uint8_t *)&buf, 0x1Cu);
          }
          NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
          goto LABEL_35;
        }
        PassiveDetectReportNotCaptive();
        if (*(unsigned char *)(a1 + 163)) {
          ++*(_DWORD *)(a1 + 212);
        }
        CNInfoAuthenticated(a1, 0, a3);
      }
      break;
    case 2:
      char v12 = mysyslog_get_logger();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        LOWORD(buf.isa) = 0;
        _os_log_impl(&dword_225F82000, v12, v13, "Maintain timed out", (uint8_t *)&buf, 2u);
      }
LABEL_35:
      CNInfoEvaluating(a1, 0, 0);
      break;
    case 3:
      os_log_type_t v14 = mysyslog_get_logger();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v15))
      {
        LOWORD(buf.isa) = 0;
        _os_log_impl(&dword_225F82000, v14, v15, "Maintain timed out at wake, setting interface rank to Never", (uint8_t *)&buf, 2u);
      }
      NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
      break;
    default:
      return;
  }
}

void CNInfoPresentingUI(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  memset(&v23, 0, sizeof(v23));
  if (a2 != 1)
  {
    if (a2) {
      return;
    }
    CNInfoSetAuthState(a1, 7);
    PassiveDetectSetCallBack(0, 0);
    TimerCancel(*(void *)(a1 + 88));
    CNInfoFlushAuthCommand(a1);
    uint64_t v4 = *(void *)(a1 + 72);
    if (v4)
    {
      networkAttributesInit(&v23.data, *(CFTypeRef *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 161));
      CFStringRef BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      AuthCFDictionaryRef Command = createAuthCommand(BSDName, 4, (uint64_t *)&v23.data);
      networkAttributesRelease((uint64_t)&v23.data);
      my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
      CNPluginStateIssueForegroundCommand(v4, AuthCommand);
      CFRelease(AuthCommand);
      return;
    }
    LOBYTE(v23.isa) = 1;
    v23.info = @"no plugin";
    logger = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v12)) {
      goto LABEL_21;
    }
    *(_WORD *)__CFString buf = 0;
    os_log_type_t v13 = "no plugin";
    os_log_type_t v14 = logger;
    os_log_type_t v15 = v12;
    uint32_t v16 = 2;
    goto LABEL_20;
  }
  uint64_t DisplayID = (void *)CNPluginStateGetDisplayID(*(void *)a3);
  unsigned int Result = responseGetResult(*(const __CFDictionary **)(a3 + 8));
  unsigned int v10 = Result;
  if (Result == 6)
  {
    uint64_t v17 = 0;
    char v18 = 0;
    goto LABEL_18;
  }
  if (Result != 5)
  {
    if (!Result)
    {
      CNInfoAuthenticated(a1, 0, (CFDictionaryRef *)a3);
      return;
    }
    char v18 = 1;
    uint64_t v17 = @"PresentUI failure";
LABEL_18:
    LOBYTE(v23.isa) = v18;
    v23.info = (uint64_t)v17;
    uint32_t v21 = mysyslog_get_logger();
    os_log_type_t v22 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v21, v22))
    {
LABEL_21:
      CNInfoFailure(a1, &v23);
      return;
    }
    *(_DWORD *)__CFString buf = 138412802;
    long long v28 = DisplayID;
    __int16 v29 = 2080;
    CFStringRef String = CNPResultGetString(v10);
    __int16 v31 = 1024;
    unsigned int v32 = v10;
    os_log_type_t v13 = "%@: PresentUI result %s (%d)";
    os_log_type_t v14 = v21;
    os_log_type_t v15 = v22;
    uint32_t v16 = 28;
LABEL_20:
    _os_log_impl(&dword_225F82000, v14, v15, v13, buf, v16);
    goto LABEL_21;
  }
  os_log_type_t v19 = mysyslog_get_logger();
  os_log_type_t v20 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v19, v20))
  {
    *(_DWORD *)__CFString buf = 138412290;
    long long v28 = DisplayID;
    _os_log_impl(&dword_225F82000, v19, v20, "%@: PresentUI failed: Unsupported Network", buf, 0xCu);
  }
  CNInfoAddExcludedDisplayID(a1, DisplayID);
  CNInfoEvaluating(a1, 0, 0);
}

void CNInfoLoggingOff(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(v14, 0, sizeof(v14));
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    if ((a2 - 1) >= 2)
    {
      if (!a2)
      {
        CNInfoSetAuthState(a1, 8);
        PassiveDetectSetCallBack(0, 0);
        TimerCancel(*(void *)(a1 + 88));
        CNInfoFlushAuthCommand(a1);
        networkAttributesInit(v14, *(CFTypeRef *)(a1 + 40), 1, 0);
        CFStringRef BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        AuthCFDictionaryRef Command = createAuthCommand(BSDName, 6, (uint64_t *)v14);
        networkAttributesRelease((uint64_t)v14);
        my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
        CNPluginStateIssueCommand(v2, AuthCommand);
        CFRelease(AuthCommand);
        TimerSet(*(CFRunLoopTimerRef **)(a1 + 88), (__CFRunLoopTimer *)CNInfoLoggingOff, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)2, 0, 45.0);
      }
    }
    else
    {
      uint64_t DisplayID = CNPluginStateGetDisplayID(*(void *)(a1 + 72));
      logger = mysyslog_get_logger();
      os_log_type_t v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v7))
      {
        double v8 = "complete";
        if (a2 == 2) {
          double v8 = "timed out";
        }
        *(_DWORD *)__CFString buf = 136315394;
        uint32_t v16 = v8;
        __int16 v17 = 2112;
        uint64_t v18 = DisplayID;
        _os_log_impl(&dword_225F82000, logger, v7, "CNPluginHandler: Logoff %s (%@)", buf, 0x16u);
      }
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(void *)(a1 + 88));
      if (*(void *)(a1 + 40))
      {
        CFStringRef v9 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        NetIFTakeWiFiNetworkOffline((uint64_t)v9, *(void *)(a1 + 40), 0, 0);
      }
      else
      {
        CNInfoInactive(a1, 0);
      }
    }
  }
  else
  {
    unsigned int v10 = mysyslog_get_logger();
    uint64_t v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, (os_log_type_t)v11))
    {
      *(_WORD *)__CFString buf = 0;
      _os_log_impl(&dword_225F82000, v10, (os_log_type_t)v11, "no plugin", buf, 2u);
    }
  }
}

uint64_t my_CFDictionaryContainsKeyAndValue(const __CFDictionary *a1, const void *a2)
{
  if (!a1) {
    return 0;
  }
  CFPropertyListRef Value = CFDictionaryGetValue(a1, @"UniqueID");
  if (!Value) {
    return 0;
  }

  return CFEqual(Value, a2);
}

void CNInfoSetAuthState(uint64_t a1, int a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 72);
  *(_DWORD *)(a1 + 56) = a2;
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  BOOL v6 = os_log_type_enabled(logger, v5);
  if (v3)
  {
    if (!v6) {
      return;
    }
    CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    uint64_t v8 = *(unsigned int *)(a1 + 56);
    if (v8 <= 8) {
      CFStringRef v9 = AuthStateString_strings[v8];
    }
    else {
      CFStringRef v9 = "<unknown>";
    }
    int v17 = 138412802;
    CFStringRef v18 = BSDName;
    __int16 v19 = 2080;
    os_log_type_t v20 = v9;
    __int16 v21 = 2112;
    uint64_t DisplayID = CNPluginStateGetDisplayID(v3);
    os_log_type_t v13 = "CNPluginHandler %@: %s (%@)";
    os_log_type_t v14 = logger;
    os_log_type_t v15 = v5;
    uint32_t v16 = 32;
  }
  else
  {
    if (!v6) {
      return;
    }
    CFStringRef v10 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    uint64_t v11 = *(unsigned int *)(a1 + 56);
    if (v11 <= 8) {
      os_log_type_t v12 = AuthStateString_strings[v11];
    }
    else {
      os_log_type_t v12 = "<unknown>";
    }
    int v17 = 138412546;
    CFStringRef v18 = v10;
    __int16 v19 = 2080;
    os_log_type_t v20 = v12;
    os_log_type_t v13 = "CNPluginHandler %@: %s";
    os_log_type_t v14 = logger;
    os_log_type_t v15 = v5;
    uint32_t v16 = 22;
  }
  _os_log_impl(&dword_225F82000, v14, v15, v13, (uint8_t *)&v17, v16);
}

void CNInfoFlushAuthCommand(uint64_t a1)
{
  uint64_t v2 = (const void **)(a1 + 64);
  uint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    CNPluginStateListRemoveCommand(v1);
    my_FieldSetRetainedCFType(v2, 0);
  }
}

_OWORD *networkAttributesInit(_OWORD *result, CFTypeRef cf, int a3, int a4)
{
  result[2] = 0u;
  result[3] = 0u;
  *uint64_t result = 0u;
  result[1] = 0u;
  if (cf)
  {
    os_log_type_t v7 = result;
    uint64_t result = CFRetain(cf);
    v7[4] = cf;
    if (a3)
    {
      uint64_t result = (_OWORD *)NetIFWiFiNetworkWasAutoJoined((uint64_t)cf);
      uint64_t v8 = *MEMORY[0x263EFFB40];
      uint64_t v9 = *MEMORY[0x263EFFB38];
      if (result) {
        uint64_t v10 = *MEMORY[0x263EFFB40];
      }
      else {
        uint64_t v10 = *MEMORY[0x263EFFB38];
      }
      *os_log_type_t v7 = v10;
    }
    else
    {
      uint64_t v8 = *MEMORY[0x263EFFB40];
      uint64_t v9 = *MEMORY[0x263EFFB38];
    }
    if (!a4) {
      uint64_t v8 = v9;
    }
    v7[6] = v8;
  }
  return result;
}

CFDictionaryRef networkCopyCaptivePortalAPIURL(uint64_t a1)
{
  int v2 = _os_feature_enabled_impl();
  if (a1 && v2)
  {
    CFDictionaryRef v3 = NetIFCopyAllServiceInformation();
    if (v3)
    {
      CFDictionaryRef v4 = v3;
      CFDictionaryRef v5 = NetIFCopyCaptivePortal(v3, a1);
      CFRelease(v4);
      return v5;
    }
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_225F82000, logger, v8, "Failed to get service info", v9, 2u);
    }
  }
  return 0;
}

CFDictionaryRef createAuthCommand(void *a1, int a2, uint64_t *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int valuePtr = a2;
  uint32_t v16 = 0;
  CFDictionaryRef v14 = 0;
  CFStringRef v5 = my_CFUUIDStringCreate(0);
  keys[0] = @"UniqueID";
  values[0] = (void *)v5;
  CFIndex v6 = 3;
  CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  keys[1] = @"Type";
  keys[2] = @"InterfaceName";
  values[1] = v7;
  values[2] = a1;
  if (a3)
  {
    CFDictionaryRef v8 = copy_network_dict(a3);
    a3 = (uint64_t *)v8;
    if (v8)
    {
      char v9 = 0;
      uint32_t v16 = @"Network";
      CFDictionaryRef v14 = v8;
      CFIndex v6 = 4;
    }
    else
    {
      char v9 = 1;
      CFIndex v6 = 3;
    }
  }
  else
  {
    char v9 = 1;
  }
  CFDictionaryRef v10 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v5) {
    CFRelease(v5);
  }
  if (v7) {
    CFRelease(v7);
  }
  if ((v9 & 1) == 0) {
    CFRelease(a3);
  }
  return v10;
}

void networkAttributesRelease(uint64_t a1)
{
  int v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 32) = 0;
  }
  CFDictionaryRef v3 = *(const void **)(a1 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 56) = 0;
  }
}

void CNInfoFailure(uint64_t a1, __CFString *a2)
{
  CNInfoSetAuthState(a1, 6);
  if (*(void *)(a1 + 40)) {
    SSID = (const void *)WiFiNetworkGetSSID();
  }
  else {
    SSID = 0;
  }
  CFStringRef v5 = *(uint64_t ***)(a1 + 136);
  double Current = CFAbsoluteTimeGetCurrent();
  CFNumberRef v7 = NetCacheLookupEntry(v5, *(const __CFArray **)(a1 + 48), SSID, Current);
  if (v7) {
    NetCacheEntryDestroy(v7);
  }
  my_FieldSetRetainedCFType((const void **)(a1 + 72), 0);
  *(_DWORD *)(a1 + 80) = 0;
  PassiveDetectSetCallBack(0, 0);
  TimerCancel(*(void *)(a1 + 88));
  CNInfoFlushAuthCommand(a1);
  CFDictionaryRef v8 = *(const void **)(a1 + 96);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(a1 + 96) = 0;
  }
  if (*(void *)(a1 + 40))
  {
    if (a2)
    {
      int isa_low = LOBYTE(a2->isa);
      a2 = (__CFString *)a2->info;
    }
    else
    {
      int isa_low = 0;
    }
    CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    uint64_t v11 = *(void *)(a1 + 40);
    NetIFTakeWiFiNetworkOffline((uint64_t)BSDName, v11, isa_low, a2);
  }
  else
  {
    CNInfoInactive(a1, 0);
  }
}

uint64_t responseGetResult(const __CFDictionary *a1)
{
  unsigned int valuePtr = 0;
  CFPropertyListRef Value = CFDictionaryGetValue(a1, @"Result");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr);
  return valuePtr;
}

void postNonCaptiveAnalyticsEvent(uint64_t a1)
{
  if (!NetIFGetWiFiNetworkWasCaptive(*(void *)(a1 + 40)))
  {
    uint64_t v4 = 0;
    int SecurityType = NetIFWiFiNetworkGetSecurityType();
    if ((SecurityType - 1) >= 4) {
      int v3 = 0;
    }
    else {
      int v3 = SecurityType;
    }
    LODWORD(v4) = v3;
    BYTE4(v4) = NetIFWiFiNetworkIsUserBypass(*(void *)(a1 + 40));
    CaptiveAnalyticsSessionPostNonCaptiveEvent((unsigned int *)&v4);
  }
}

void SendCleanupCommandToBuiltinPluginIfNecessary(uint64_t a1, int a2)
{
  if (a2 || (uint64_t v3 = *(void *)(a1 + 72)) == 0)
  {
    if (!a2) {
      return;
    }
  }
  else if (CNPluginStateIsBuiltin(v3))
  {
    return;
  }
  uint64_t v4 = CNPluginStateGet(@"__BUILTIN__");
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    CNPluginStateBuiltinFlushAllCommands((uint64_t)v4);
    CFStringRef BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    AuthCFDictionaryRef Command = createAuthCommand(BSDName, 0, 0);
    CNPluginStateIssueCommand(v5, AuthCommand);
    CFRelease(AuthCommand);
  }
}

void CNInfoAuthenticated(uint64_t a1, int a2, CFDictionaryRef *a3)
{
  uint64_t v3 = a3;
  uint64_t v115 = *MEMORY[0x263EF8340];
  uint64_t valuePtr = 0;
  if (a2 != 4)
  {
    if (a2) {
      return;
    }
    CNInfoSetAuthState(a1, 4);
    PassiveDetectSetCallBack(0, 0);
    TimerCancel(*(void *)(a1 + 88));
    CNInfoFlushAuthCommand(a1);
    int v5 = *(_DWORD *)(a1 + 104);
    *(_DWORD *)(a1 + 104) = v5 & 0xFFFFFFFD;
    *(_DWORD *)(a1 + 232) = 0;
    uint64_t v6 = *(void *)(a1 + 72);
    if (v3)
    {
      CFDictionaryRef v7 = v3[1];
      if (v7)
      {
        CFPropertyListRef Value = CFDictionaryGetValue(v7, @"LogoffURL");
        char v9 = CFDictionaryGetValue(v3[1], @"RedirectionURL");
        CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(v3[1], @"RedirectionURLGenerationID");
        if (v10) {
          CFNumberGetValue(v10, kCFNumberSInt64Type, &valuePtr);
        }
        uint64_t v11 = CFDictionaryGetValue(v3[1], @"WISPrLoginUsed");
        CFTypeID TypeID = CFBooleanGetTypeID();
        BOOL v13 = v11 && CFGetTypeID(v11) == TypeID;
        *(unsigned char *)(a1 + 216) = v13;
        BooleanCFPropertyListRef Value = my_CFDictionaryGetBooleanValue(v3[1], @"DisableMaintaining", 0);
        int v20 = my_CFDictionaryGetBooleanValue(v3[1], @"DisableAutologin", 0);
        int v21 = my_CFDictionaryGetBooleanValue(v3[1], @"UpdateWebSheetLoginDate", 0);
        uint64_t v3 = (CFDictionaryRef *)CFDictionaryGetValue(v3[1], @"APIStateSecondsRemaining");
LABEL_25:
        BOOL v22 = (v5 & 1) != 0 && v6 == 0;
        char v23 = !v22;
        if (v22)
        {
          NetIFSetRankDefault(*(const __SCNetworkInterface **)(a1 + 32));
        }
        else
        {
          CFArrayRef v105 = v9;
          int v106 = v21;
          int v24 = BooleanValue;
          *(_DWORD *)(a1 + 104) &= ~2u;
          if (!*(void *)(a1 + 40) || !NetIFWiFiNetworkIsCarPlayAndInternet())
          {
            char v25 = v23;
            logger = mysyslog_get_logger();
            os_log_type_t v27 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(logger, v27))
            {
              uint64_t SSID = *(void *)(a1 + 40);
              if (SSID) {
                uint64_t SSID = WiFiNetworkGetSSID();
              }
              *(_DWORD *)__CFString buf = 138412290;
              *(void *)&uint8_t buf[4] = SSID;
              _os_log_impl(&dword_225F82000, logger, v27, "adding/updating network [%@] to network cache", buf, 0xCu);
            }
            char v23 = v25;
            if (*(void *)(a1 + 40))
            {
              uint64_t v104 = valuePtr;
              uint64_t v29 = WiFiNetworkGetSSID();
              if (v29)
              {
                CFTypeID v30 = (const void *)v29;
                uint64_t v31 = *(void *)(a1 + 72);
                if (v31) {
                  uint64_t DisplayID = (const void *)CNPluginStateGetDisplayID(v31);
                }
                else {
                  uint64_t DisplayID = 0;
                }
                uint64_t v41 = *(uint64_t ***)(a1 + 136);
                double Current = CFAbsoluteTimeGetCurrent();
                updated = NetCacheUpdateEntry(v41, *(CFArrayRef *)(a1 + 48), v30, DisplayID != 0, DisplayID, Current);
                uint64_t v44 = (uint64_t)updated;
                if (Value) {
                  NetCacheEntrySetLogoffURL((uint64_t)updated, Value);
                }
                char v23 = v25;
                if (v105) {
                  NetCacheEntrySetRedirectionURL(v44, v105, v104);
                }
              }
            }
          }
          NetIFSetRankDefault(*(const __SCNetworkInterface **)(a1 + 32));
          BooleanCFPropertyListRef Value = v24;
          if (v6)
          {
            int IsBuiltin = CNPluginStateIsBuiltin(v6);
            if (Value)
            {
              unsigned int v46 = mysyslog_get_logger();
              os_log_type_t v47 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v46, v47))
              {
                CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
                *(_DWORD *)__CFString buf = 138412546;
                *(void *)&uint8_t buf[4] = BSDName;
                __int16 v109 = 2112;
                uint64_t v110 = (uint64_t)Value;
                _os_log_impl(&dword_225F82000, v46, v47, "%@: LogoffURL %@", buf, 0x16u);
              }
            }
            BooleanCFPropertyListRef Value = v24;
            if (IsBuiltin != 1 || v24)
            {
              int v50 = v106;
              if (!IsBuiltin)
              {
LABEL_91:
                int v51 = *(CFRunLoopTimerRef **)(a1 + 88);
                double v52 = 300.0;
                goto LABEL_92;
              }
              if (BooleanValue) {
                goto LABEL_93;
              }
            }
            else
            {
              CFTypeID v49 = CFNumberGetTypeID();
              int v50 = v106;
              if (v3 && CFGetTypeID(v3) == v49)
              {
                *(void *)__CFString buf = 0;
                CFNumberGetValue((CFNumberRef)v3, kCFNumberDoubleType, buf);
                int v51 = *(CFRunLoopTimerRef **)(a1 + 88);
                double v52 = *(double *)buf;
LABEL_92:
                TimerSet(v51, (__CFRunLoopTimer *)CNInfoMaintaining, (__CFRunLoopTimer *)a1, 0, 0, v52);
LABEL_93:
                PowerChangeRegister((uint64_t (*)(void))CNPluginHandlerPowerChange);
                CNPluginStateGetDisplayID(v6);
                if (v20) {
                  int v73 = 7;
                }
                else {
                  int v73 = 3;
                }
                if (v50) {
                  unsigned int v74 = v73 | 0x20;
                }
                else {
                  unsigned int v74 = v73;
                }
                CNScanListFilterAggregateResults(a1);
                if (!v20)
                {
                  if (*(double *)(a1 + 168) == 0.0) {
                    *(CFAbsoluteTime *)(a1 + 168) = CFAbsoluteTimeGetCurrent();
                  }
                  *(CFAbsoluteTime *)(a1 + 184) = CFAbsoluteTimeGetCurrent();
                }
                if (!IsBuiltin && !*(void *)(a1 + 224))
                {
                  CFDictionaryRef v75 = (const __CFDictionary *)CaptiveCopyProbeSettings();
                  if (!v75)
                  {
                    long long v77 = 0;
                    goto LABEL_140;
                  }
                  CFDictionaryRef v76 = v75;
                  long long v77 = (__CFString *)CFDictionaryGetValue(v75, @"ProbeURL");
                  CFTypeID v78 = CFStringGetTypeID();
                  if (v77 && CFGetTypeID(v77) == v78)
                  {
                    CFRelease(v76);
LABEL_140:
                    CFIndex v98 = mysyslog_get_logger();
                    os_log_type_t v99 = _SC_syslog_os_log_mapping();
                    if (os_log_type_enabled(v98, v99))
                    {
                      *(_WORD *)__CFString buf = 0;
                      _os_log_impl(&dword_225F82000, v98, v99, "starting probe for an Internet access", buf, 2u);
                    }
                    if (*(void *)(a1 + 40)) {
                      uint64_t v100 = (const void *)WiFiNetworkGetSSID();
                    }
                    else {
                      uint64_t v100 = 0;
                    }
                    CFStringRef v101 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
                    CFRunLoopRef v102 = CFRunLoopGetCurrent();
                    CFStringRef v103 = captive_agent_send_probe(v100, v101, 0, v77, 0xAu, (uint64_t)HandleInternetAccessProbeResult, a1, (uint64_t)v102);
                    char v54 = 0;
                    *(void *)(a1 + 224) = v103;
                    goto LABEL_125;
                  }
                  CFRelease(v76);
                }
                char v54 = 0;
                goto LABEL_125;
              }
            }
            if (PassiveDetectSetCallBack((uint64_t)CNPluginHandlerDetectedCaptive, a1)) {
              goto LABEL_93;
            }
            goto LABEL_91;
          }
        }
        BOOL IsProtected = NetIFWiFiNetworkIsProtected(*(void *)(a1 + 40));
        if (IsProtected || !S_WhitelistedNetworkDetectionEnabled)
        {
          char v54 = 0;
          if (!IsProtected || !S_WhitelistedProtectedNetworkDetectionEnabled)
          {
LABEL_114:
            if (NetIFGetWiFiNetworkWasCaptive(*(void *)(a1 + 40)))
            {
              *(unsigned char *)(a1 + 163) = 0;
              PassiveDetectSetCallBack((uint64_t)CNPluginHandlerDetectedCaptive, a1);
            }
            if (v23)
            {
              unsigned int v74 = 2;
            }
            else
            {
              uint64_t v81 = mysyslog_get_logger();
              os_log_type_t v82 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v81, v82))
              {
                CFStringRef v83 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
                uint64_t v84 = *(void *)(a1 + 40);
                if (v84) {
                  uint64_t v84 = WiFiNetworkGetSSID();
                }
                *(_DWORD *)__CFString buf = 138412546;
                *(void *)&uint8_t buf[4] = v83;
                __int16 v109 = 2112;
                uint64_t v110 = v84;
                _os_log_impl(&dword_225F82000, v81, v82, "%@ reporting inconclusive captive evaluation for '%@' to symptoms", buf, 0x16u);
              }
              CaptiveSymptomReportInconclusiveCaptiveEvaluation();
              unsigned int v74 = 66;
            }
LABEL_125:
            NetIFWiFiNetworkSetCaptive(*(void *)(a1 + 40), v74);
            if (BooleanValue || *(void *)(a1 + 152)) {
              return;
            }
            CFStringRef v85 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
            if (*(void *)(a1 + 40) && (uint64_t v86 = WiFiNetworkGetSSID()) != 0)
            {
              CFTypeID v87 = (const void *)v86;
              char v88 = IsChinaDevice();
              uint64_t v89 = BBMonitorCreate((uint64_t)v85, v87, v88, v54, (uint64_t)_BrokenBackhaulMonitorComplete, a1);
              *(void *)(a1 + 152) = v89;
              CFIndex v90 = mysyslog_get_logger();
              os_log_type_t v91 = _SC_syslog_os_log_mapping();
              BOOL v92 = os_log_type_enabled(v90, v91);
              if (v89)
              {
                if (v92)
                {
                  *(_DWORD *)__CFString buf = 138412546;
                  *(void *)&uint8_t buf[4] = v85;
                  __int16 v109 = 2112;
                  uint64_t v110 = (uint64_t)v87;
                  _os_log_impl(&dword_225F82000, v90, v91, "BrokenBackhaulMonitor started on %@ (%@)", buf, 0x16u);
                }
                BBMonitorStart(*(void *)(a1 + 152));
                return;
              }
              if (!v92) {
                return;
              }
              *(_WORD *)__CFString buf = 0;
              CFTypeID v95 = "BrokenBackhaulMonitor failed to start";
              CFDictionaryRef v96 = v90;
              os_log_type_t v97 = v91;
            }
            else
            {
              CFArrayRef v93 = mysyslog_get_logger();
              os_log_type_t v94 = _SC_syslog_os_log_mapping();
              if (!os_log_type_enabled(v93, v94)) {
                return;
              }
              *(_WORD *)__CFString buf = 0;
              CFTypeID v95 = "BrokenBackhaulMonitor can't be started: no SSID";
              CFDictionaryRef v96 = v93;
              os_log_type_t v97 = v94;
            }
            _os_log_impl(&dword_225F82000, v96, v97, v95, buf, 2u);
            return;
          }
        }
        if (*(void *)(a1 + 40))
        {
          CFDateRef WhitelistedCaptiveNetworkProbeDate = (const __CFDate *)NetIFWiFiNetworkGetWhitelistedCaptiveNetworkProbeDate();
          if (WhitelistedCaptiveNetworkProbeDate)
          {
            CFDateRef v56 = WhitelistedCaptiveNetworkProbeDate;
            int IsWhitelistedCaptiveNetwork = NetIFWiFiNetworkIsWhitelistedCaptiveNetwork(*(void *)(a1 + 40));
            CFStringRef v58 = mysyslog_get_logger();
            os_log_type_t v59 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v58, v59))
            {
              CFStringRef v60 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
              uint64_t v61 = *(void *)(a1 + 40);
              if (v61) {
                uint64_t v61 = WiFiNetworkGetSSID();
              }
              os_log_type_t v62 = "already ";
              *(_DWORD *)__CFString buf = 138412802;
              *(void *)&uint8_t buf[4] = v60;
              if (!IsWhitelistedCaptiveNetwork) {
                os_log_type_t v62 = "not ";
              }
              __int16 v109 = 2112;
              uint64_t v110 = v61;
              __int16 v111 = 2080;
              double v112 = *(double *)&v62;
              _os_log_impl(&dword_225F82000, v58, v59, "%@: %@ %smarked whitelisted", buf, 0x20u);
            }
            CFAbsoluteTime v63 = CFAbsoluteTimeGetCurrent();
            CFDateRef v64 = CFDateCreate(0, v63);
            double TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v64, v56);
            CFRelease(v64);
            uint64_t v66 = &S_WhitelistedNetworkProbeInterval;
            if (!IsWhitelistedCaptiveNetwork) {
              uint64_t v66 = &S_UnwhitelistedNetworkProbeInterval;
            }
            double v67 = *(double *)v66;
            os_log_type_t v68 = mysyslog_get_logger();
            os_log_type_t v69 = _SC_syslog_os_log_mapping();
            BOOL v70 = os_log_type_enabled(v68, v69);
            if (TimeIntervalSinceDate < v67)
            {
              if (v70)
              {
                CFStringRef v71 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
                uint64_t v72 = *(void *)(a1 + 40);
                if (v72) {
                  uint64_t v72 = WiFiNetworkGetSSID();
                }
                *(_DWORD *)__CFString buf = 138413058;
                *(void *)&uint8_t buf[4] = v71;
                __int16 v109 = 2112;
                uint64_t v110 = v72;
                __int16 v111 = 2048;
                double v112 = TimeIntervalSinceDate;
                __int16 v113 = 2048;
                double v114 = v67;
                _os_log_impl(&dword_225F82000, v68, v69, "%@: %@ BrokenBackhaulMonitor can't probe yet (%g < %g)", buf, 0x2Au);
              }
              goto LABEL_87;
            }
            if (v70)
            {
              CFStringRef v79 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
              uint64_t v80 = *(void *)(a1 + 40);
              if (v80) {
                uint64_t v80 = WiFiNetworkGetSSID();
              }
              *(_DWORD *)__CFString buf = 138413058;
              *(void *)&uint8_t buf[4] = v79;
              __int16 v109 = 2112;
              uint64_t v110 = v80;
              __int16 v111 = 2048;
              double v112 = TimeIntervalSinceDate;
              __int16 v113 = 2048;
              double v114 = v67;
              _os_log_impl(&dword_225F82000, v68, v69, "%@: %@ BrokenBackhaulMonitor can probe again (%g >= %g)", buf, 0x2Au);
            }
          }
          char v54 = 3;
          goto LABEL_114;
        }
LABEL_87:
        char v54 = 1;
        goto LABEL_114;
      }
      uint64_t v3 = 0;
    }
    char v9 = 0;
    CFPropertyListRef Value = 0;
    BooleanCFPropertyListRef Value = 0;
    int v21 = 0;
    int v20 = 0;
    goto LABEL_25;
  }
  if (a3) {
    int v14 = *(unsigned __int8 *)a3;
  }
  else {
    int v14 = 0;
  }
  os_log_type_t v15 = mysyslog_get_logger();
  os_log_type_t v16 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v15, v16))
  {
    CFStringRef v17 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    CFStringRef v18 = " [whitelist]";
    if (!v14) {
      CFStringRef v18 = "";
    }
    *(_DWORD *)__CFString buf = 138412546;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v109 = 2080;
    uint64_t v110 = (uint64_t)v18;
    _os_log_impl(&dword_225F82000, v15, v16, "%@: detected captive%s", buf, 0x16u);
  }
  if (*(void *)(a1 + 72))
  {
    CNInfoMaintaining(a1, 0, 0);
  }
  else if (NetIFGetWiFiNetworkWasCaptive(*(void *)(a1 + 40)))
  {
    CNInfoEvaluating(a1, 0, 0);
  }
  else if ((*(unsigned char *)(a1 + 104) & 1) == 0 && v14)
  {
    PassiveDetectSetCallBack(0, 0);
    NetIFWiFiNetworkSetCaptive(*(void *)(a1 + 40), 0x18u);
    CNInfoUpdateWiFiNetwork(a1);
    uint64_t v33 = mysyslog_get_logger();
    os_log_type_t v34 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v33, v34))
    {
      CFStringRef v35 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      uint64_t v36 = *(void *)(a1 + 40);
      if (v36) {
        uint64_t v36 = WiFiNetworkGetSSID();
      }
      *(_DWORD *)__CFString buf = 138412546;
      *(void *)&uint8_t buf[4] = v35;
      __int16 v109 = 2112;
      uint64_t v110 = v36;
      _os_log_impl(&dword_225F82000, v33, v34, "%@: %@ whitelists our probe", buf, 0x16u);
    }
    os_log_type_t v37 = mysyslog_get_logger();
    os_log_type_t v38 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v37, v38))
    {
      CFStringRef v39 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      uint64_t v40 = *(void *)(a1 + 40);
      if (v40) {
        uint64_t v40 = WiFiNetworkGetSSID();
      }
      *(_DWORD *)__CFString buf = 138412546;
      *(void *)&uint8_t buf[4] = v39;
      __int16 v109 = 2112;
      uint64_t v110 = v40;
      _os_log_impl(&dword_225F82000, v37, v38, "%@: %@ disabling broken backhaul monitor", buf, 0x16u);
    }
    CNInfoStopBrokenBackhaulMonitor(a1);
  }
}

CFDictionaryRef copy_network_dict(uint64_t *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)keys = 0u;
  memset(v20, 0, sizeof(v20));
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t SSID = WiFiNetworkGetSSID();
    if (SSID)
    {
      keys[0] = @"SSIDString";
      *(void *)&v20[0] = SSID;
      unsigned int v4 = 1;
    }
    else
    {
      unsigned int v4 = 0;
    }
    uint64_t SSIDData = WiFiNetworkGetSSIDData();
    if (SSIDData)
    {
      *(void *)((unint64_t)keys | (8 * v4)) = @"SSID";
      *(void *)((unint64_t)v20 & 0xFFFFFFFFFFFFFFF7 | (8 * (v4++ & 1))) = SSIDData;
    }
    CFBooleanRef Property = (const void *)WiFiNetworkGetProperty();
    CFTypeID TypeID = CFStringGetTypeID();
    if (Property && CFGetTypeID(Property) == TypeID)
    {
      keys[v4] = @"BSSID";
      *((void *)v20 + v4++) = Property;
    }
    BOOL IsProtected = NetIFWiFiNetworkIsProtected(v2);
    char v9 = (void *)MEMORY[0x263EFFB40];
    if (IsProtected)
    {
      keys[v4] = @"IsProtected";
      *((void *)v20 + v4++) = *v9;
    }
    if (NetIFWiFiNetworkIsUserBypass(v2))
    {
      keys[v4] = @"CaptiveBypass";
      *((void *)v20 + v4++) = *v9;
    }
    CFNumberRef v10 = (const void *)WiFiNetworkGetProperty();
    CFTypeID v11 = CFNumberGetTypeID();
    if (v10 && CFGetTypeID(v10) == v11)
    {
      keys[v4] = @"SignalStrength";
      *((void *)v20 + v4++) = v10;
    }
    if (NetIFIsQuickProbeRequired())
    {
      keys[v4] = @"QuickProbeRequired";
      *((void *)v20 + v4++) = *v9;
    }
  }
  else
  {
    unsigned int v4 = 0;
  }
  uint64_t v12 = *a1;
  if (*a1)
  {
    keys[v4] = @"WasAutoJoined";
    *((void *)v20 + v4++) = v12;
  }
  uint64_t v13 = a1[1];
  if (v13)
  {
    keys[v4] = @"WasJustJoined";
    *((void *)v20 + v4++) = v13;
  }
  uint64_t v14 = a1[2];
  if (v14)
  {
    keys[v4] = @"WasCaptive";
    *((void *)v20 + v4++) = v14;
  }
  uint64_t v15 = a1[3];
  if (v15)
  {
    keys[v4] = @"IsCached";
    *((void *)v20 + v4++) = v15;
  }
  uint64_t v16 = a1[5];
  if (v16)
  {
    keys[v4] = @"IsChosenPlugin";
    *((void *)v20 + v4++) = v16;
  }
  uint64_t v17 = a1[6];
  if (v17)
  {
    keys[v4] = @"BecameCaptive";
    *((void *)v20 + v4++) = v17;
  }
  uint64_t v18 = a1[7];
  if (v18)
  {
    keys[v4] = @"PortalURL";
    *((void *)v20 + v4++) = v18;
  }
  else if (!v4)
  {
    return 0;
  }
  return CFDictionaryCreate(0, (const void **)keys, (const void **)v20, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
}

void CNInfoInactive(uint64_t a1, int a2)
{
  if (a2 == 5)
  {
    PassiveDetectSetCallBack(0, 0);
    TimerCancel(*(void *)(a1 + 88));
    my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
    uint64_t v13 = *(const void **)(a1 + 40);
    if (v13)
    {
      CFRelease(v13);
      *(void *)(a1 + 40) = 0;
    }
    CNInfoSetAuthState(a1, 1);
    PowerChangeDeregister();
  }
  else if (!a2)
  {
    CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    NetIFSetCarPlayModeChangeCallBack((uint64_t)BSDName, 0);
    uint64_t v4 = *(void *)(a1 + 72);
    double Current = CFAbsoluteTimeGetCurrent();
    if (v4)
    {
      double v6 = *(double *)(a1 + 168);
      if (v6 != 0.0)
      {
        if (Current <= v6) {
          unint64_t v7 = 0;
        }
        else {
          unint64_t v7 = (unint64_t)(Current - v6);
        }
        if (CNPluginStateIsBuiltin(v4))
        {
          long long DisplayID = 0u;
          memset(v18, 0, sizeof(v18));
          LODWORD(DisplayID) = *(_DWORD *)(a1 + 164);
          unint64_t v16 = v7;
          int v8 = *(_DWORD *)(a1 + 192);
          if (v8 >= 1)
          {
            uint64_t v9 = *(void *)(a1 + 208);
            *((void *)&DisplayID + 1) = llround(*(double *)(a1 + 200) / (double)v8);
            *(void *)&long long v10 = (int)v9;
            *((void *)&v10 + 1) = SHIDWORD(v9);
            *(_OWORD *)((char *)v18 + 8) = v10;
          }
          int SecurityType = NetIFWiFiNetworkGetSecurityType();
          if ((SecurityType - 1) >= 4) {
            int v12 = 0;
          }
          else {
            int v12 = SecurityType;
          }
          DWORD2(v18[1]) = v12;
          LOBYTE(v18[0]) = *(unsigned char *)(a1 + 216);
          CaptiveAnalyticsSessionPostBuiltinEvent((uint64_t *)&v16);
        }
        else
        {
          unint64_t v16 = v7;
          long long DisplayID = (unint64_t)CNPluginStateGetDisplayID(v4);
          BYTE8(DisplayID) = *(unsigned char *)(a1 + 217);
          CaptiveAnalyticsSessionPostHSHelperEvent((uint64_t *)&v16);
        }
      }
    }
    my_FieldSetRetainedCFType((const void **)(a1 + 72), 0);
    *(_DWORD *)(a1 + 80) = 0;
    PassiveDetectSetCallBack(0, 0);
    TimerCancel(*(void *)(a1 + 88));
    CNInfoFlushAuthCommand(a1);
    SendCleanupCommandToBuiltinPluginIfNecessary(a1, 1);
    my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
    uint64_t v14 = *(const void **)(a1 + 40);
    if (v14)
    {
      CFRelease(v14);
      *(void *)(a1 + 40) = 0;
    }
    uint64_t v15 = *(const void **)(a1 + 96);
    if (v15)
    {
      CFRelease(v15);
      *(void *)(a1 + 96) = 0;
    }
    PassiveDetectNewNetwork();
    if (*(_DWORD *)(a1 + 56) >= 2u)
    {
      CNInfoSetAuthState(a1, 1);
      NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
    }
    *(_DWORD *)(a1 + 104) &= 0xFFFFFFFC;
    CNInfoStopBrokenBackhaulMonitor(a1);
    *(_DWORD *)(a1 + 232) = 0;
    PowerChangeDeregister();
  }
}

void CNInfoStopBrokenBackhaulMonitor(uint64_t a1)
{
  if (*(void *)(a1 + 152))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_225F82000, logger, v3, "Stopping BrokenBackhaulMonitor", v4, 2u);
    }
    BBMonitorInvalidate(*(void *)(a1 + 152));
    BBMonitorRelease(*(void **)(a1 + 152));
    *(void *)(a1 + 152) = 0;
  }
}

uint64_t ___handleIPv6OnlyEvaluationFailure_block_invoke(uint64_t a1)
{
  logger = mysyslog_get_logger();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_225F82000, logger, v3, "scheduling captive evaluation retry", v5, 2u);
  }
  return CNInfoEvaluating(*(void *)(a1 + 32), 0, 0);
}

const void *networkGetConfidence(const void *Confidence, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Confidence)
  {
    if (CFGetTypeID(Confidence) != TypeID) {
      return 0;
    }
    CFPropertyListRef Value = CFDictionaryGetValue((CFDictionaryRef)Confidence, @"Confidence");
    unsigned int Confidence = (const void *)numberGetConfidence(Value);
    if (Confidence >= 3)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v7))
      {
        int v9 = 138412546;
        uint64_t v10 = a2;
        __int16 v11 = 1024;
        int v12 = (int)Confidence;
        _os_log_impl(&dword_225F82000, logger, v7, "%@: invalid Confidence value %d treating as None", (uint8_t *)&v9, 0x12u);
      }
      return 0;
    }
  }
  return Confidence;
}

uint64_t numberGetConfidence(const void *a1)
{
  unsigned int valuePtr = 0;
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0;
  }
  CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, &valuePtr);
  return valuePtr;
}

void CNPluginHandlerDetectedCaptive(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v7 = 0;
  if (*(_DWORD *)(a1 + 56) == 4)
  {
    *(unsigned char *)(a1 + 163) = 1;
    CNInfoAuthenticated(a1, 4, &v7);
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      uint64_t v5 = *(unsigned int *)(a1 + 56);
      if (v5 <= 8) {
        double v6 = AuthStateString_strings[v5];
      }
      else {
        double v6 = "<unknown>";
      }
      *(_DWORD *)__CFString buf = 138412546;
      CFStringRef v9 = BSDName;
      __int16 v10 = 2080;
      __int16 v11 = v6;
      _os_log_impl(&dword_225F82000, logger, v3, "CNPluginHandler %@: passive detected in %s state, ignoring", buf, 0x16u);
    }
  }
}

void CNPluginHandlerPowerChange(int a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    uint64_t v4 = "Wake";
    if (!a1) {
      uint64_t v4 = "Sleep";
    }
    *(_DWORD *)__CFString buf = 136315138;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_225F82000, logger, v3, "%s", buf, 0xCu);
  }
  if (a1)
  {
    for (uint64_t i = S_CNInfoHeadStorage; i; uint64_t i = *(void *)i)
    {
      *(_OWORD *)__CFString buf = 0uLL;
      if (*(void *)(i + 40))
      {
        if (*(void *)(i + 72))
        {
          CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(i + 32));
          uint64_t v7 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
          if (v7)
          {
            int v8 = (const void *)v7;
            uint64_t SSID = (const void *)WiFiNetworkGetSSID();
            __int16 v10 = (const void *)WiFiNetworkGetSSID();
            LODWORD(SSID) = my_CFEqual(SSID, v10);
            CFRelease(v8);
            if (SSID)
            {
              __int16 v11 = mysyslog_get_logger();
              os_log_type_t v12 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v11, v12))
              {
                *(_WORD *)uint64_t v13 = 0;
                _os_log_impl(&dword_225F82000, v11, v12, "wake on the same captive network", v13, 2u);
              }
              *(void *)__CFString buf = 0;
              *(void *)&uint8_t buf[8] = 1;
              CNInfoMaintaining(i, 0, (uint64_t)buf);
            }
          }
        }
      }
    }
  }
}

void CNScanListFilterAggregateResults(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (S_filter_request_count)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    *(_OWORD *)theArray = 0u;
    CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      *((void *)&v24 + 1) = WiFiNetworkGetSSID();
      LOBYTE(v25) = NetIFWiFiNetworkIsProtected(v2);
      *((void *)&v25 + 1) = *(void *)(a1 + 72);
    }
    CNPluginStateListApplyFunction((uint64_t)CNScanListFilterAggregateResultsApplier, (uint64_t)&BSDName);
    CFArrayRef v3 = theArray[0];
    if (theArray[0])
    {
      if (*(void *)(a1 + 144)
        || (CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]),
            (*(void *)(a1 + 144) = Mutable) != 0))
      {
        CFIndex Count = CFArrayGetCount(v3);
        if (Count >= 1)
        {
          CFIndex v6 = Count;
          for (CFIndex i = 0; i != v6; ++i)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, i);
            if (!NetworkArrayContainsNetwork(*(const __CFArray **)(a1 + 144), ValueAtIndex))
            {
              CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ValueAtIndex);
              if (MutableCopy)
              {
                __int16 v10 = MutableCopy;
                CFDictionaryRemoveValue(MutableCopy, @"Password");
                CFDictionaryRemoveValue(v10, @"PluginNames");
                CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 144), v10);
                CFRelease(v10);
              }
            }
          }
        }
        CFIndex v11 = CFArrayGetCount(*(CFArrayRef *)(a1 + 144));
        if (v11 >= 1)
        {
          CFIndex v12 = v11;
          for (CFIndex j = 0; j < v12; ++j)
          {
            uint64_t v14 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 144), j);
            if (!NetworkArrayContainsNetwork(v3, (const __CFDictionary *)v14))
            {
              CFArrayAppendValue(v3, v14);
              CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), j);
              --v12;
              if (j <= 0) {
                CFIndex j = 0;
              }
              else {
                --j;
              }
            }
          }
        }
      }
      else
      {
        logger = mysyslog_get_logger();
        os_log_type_t v21 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v21))
        {
          *(_WORD *)__CFString buf = 0;
          _os_log_impl(&dword_225F82000, logger, v21, "failed to allocate memory for cached filter results.", buf, 2u);
        }
      }
      uint64_t v15 = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      ScanListProcessCFDictionaryRef Command = createScanListProcessCommand(v15, theArray[0]);
      CFRelease(theArray[0]);
      if (ScanListProcessCommand)
      {
        CommandHandlerListApplyFunction(5u, (uint64_t)CNScanListFilterAppendCommandApplier, (uint64_t)ScanListProcessCommand);
        if (CaptiveIsDebug())
        {
          uint64_t v17 = mysyslog_get_logger();
          os_log_type_t v18 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v17, v18))
          {
            CFStringRef v19 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
            *(_DWORD *)__CFString buf = 138412546;
            CFStringRef v27 = v19;
            __int16 v28 = 2112;
            CFDictionaryRef v29 = ScanListProcessCommand;
            _os_log_impl(&dword_225F82000, v17, v18, "%@: %@", buf, 0x16u);
          }
        }
        CFRelease(ScanListProcessCommand);
      }
    }
    else
    {
      CNScanListFilterSendClearResults(a1);
    }
  }
}

void CNInfoUpdateWiFiNetwork(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 40))
  {
    uint64_t SSID = WiFiNetworkGetSSID();
    if (SSID)
    {
      CFArrayRef v3 = (const void *)SSID;
      CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      uint64_t v5 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
      if (v5)
      {
        CFIndex v6 = (const void *)v5;
        uint64_t v7 = (const void *)WiFiNetworkGetSSID();
        int v8 = v7;
        if (v7 && CFEqual(v7, v3))
        {
          CFStringRef v9 = *(const void **)(a1 + 40);
          if (v9) {
            CFRelease(v9);
          }
          *(void *)(a1 + 40) = v6;
          logger = mysyslog_get_logger();
          os_log_type_t v11 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v11))
          {
            CFStringRef v12 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
            uint64_t v13 = *(void *)(a1 + 40);
            if (v13) {
              uint64_t v13 = WiFiNetworkGetSSID();
            }
            int v18 = 138412546;
            CFStringRef v19 = v12;
            __int16 v20 = 2112;
            uint64_t v21 = v13;
            _os_log_impl(&dword_225F82000, logger, v11, "%@: %@ updated", (uint8_t *)&v18, 0x16u);
          }
        }
        else
        {
          uint64_t v14 = mysyslog_get_logger();
          os_log_type_t v15 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v14, v15))
          {
            CFStringRef v16 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
            uint64_t v17 = *(void *)(a1 + 40);
            if (v17) {
              uint64_t v17 = WiFiNetworkGetSSID();
            }
            int v18 = 138412802;
            CFStringRef v19 = v16;
            __int16 v20 = 2112;
            uint64_t v21 = v17;
            __int16 v22 = 2112;
            long long v23 = v8;
            _os_log_impl(&dword_225F82000, v14, v15, "%@: %@ not updated (new %@)", (uint8_t *)&v18, 0x20u);
          }
          CFRelease(v6);
        }
      }
    }
  }
}

void CNScanListFilterAggregateResultsApplier(uint64_t a1, uint64_t a2)
{
  long long DisplayID = (const void *)CNPluginStateGetDisplayID(a1);
  uint64_t v38 = a1;
  CFArrayRef FilterResults = CNPluginStateGetFilterResults(a1, *(const void **)a2);
  if (FilterResults)
  {
    CFArrayRef v6 = FilterResults;
    CFIndex Count = CFArrayGetCount(FilterResults);
    if (Count)
    {
      if (!*(void *)(a2 + 8)) {
        *(void *)(a2 + 8) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      }
      if (Count >= 1)
      {
        CFIndex v7 = 0;
        while (1)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v7);
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ValueAtIndex);
          if (MutableCopy) {
            break;
          }
LABEL_37:
          if (Count == ++v7) {
            return;
          }
        }
        CFDictionaryRef v10 = MutableCopy;
        if (DisplayID) {
          CFDictionarySetValue(MutableCopy, @"PluginBundleID", DisplayID);
        }
        os_log_type_t v11 = DisplayID;
        Name = (const void *)CNPluginStateGetName(v38);
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (CFGetTypeID(v10) == TypeID)
        {
          CFPropertyListRef Value = CFDictionaryGetValue(v10, @"SSIDString");
          CFTypeID v15 = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) != v15) {
            CFPropertyListRef Value = 0;
          }
          CFStringRef v16 = CFDictionaryGetValue(v10, @"BSSID");
          CFTypeID v17 = CFStringGetTypeID();
          if (v16)
          {
            if (CFGetTypeID(v16) == v17) {
              int v18 = v16;
            }
            else {
              int v18 = 0;
            }
          }
          else
          {
            int v18 = 0;
          }
          CFBooleanRef v19 = (const __CFBoolean *)CFDictionaryGetValue(v10, @"IsProtected");
          CFTypeID v20 = CFBooleanGetTypeID();
          if (v19 && CFGetTypeID(v19) == v20)
          {
            int v21 = CFBooleanGetValue(v19);
            if (!Value) {
              goto LABEL_36;
            }
          }
          else
          {
            int v21 = 0;
            if (!Value) {
              goto LABEL_36;
            }
          }
          if (!v18) {
            goto LABEL_36;
          }
          uint64_t v22 = *(void *)(a2 + 48);
          if (v22)
          {
            if (v22 != v38 && *(unsigned __int8 *)(a2 + 40) == v21)
            {
              long long v23 = *(const void **)(a2 + 32);
              if (v23)
              {
                if (CFEqual(v23, Value)) {
                  goto LABEL_36;
                }
              }
            }
          }
          uint64_t v24 = CNPluginStateGetDisplayID(v38);
          unsigned int Confidence = networkGetConfidence(v10, v24);
          CFIndex v26 = CFArrayBSearchValues(*(CFArrayRef *)(a2 + 8), *(CFRange *)(a2 + 16), v10, (CFComparatorFunction)filterDictCompare, 0);
          if (v26 >= *(void *)(a2 + 24))
          {
            CFDictionaryRef v30 = CFDictionaryCreateMutableCopy(0, 0, v10);
            filterDictAnnotate(v30, Name, Confidence);
            CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 8), v30);
            goto LABEL_35;
          }
          CFIndex v27 = v26;
          CFDictionaryRef v28 = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 8), v26);
          CFComparisonResult v29 = filterDictCompare(v10, v28);
          if (v29 == kCFCompareEqualTo)
          {
            CFDictionaryRef v31 = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 8), v27);
            filterDictAnnotate(v31, Name, Confidence);
            unsigned int v32 = CFDictionaryGetValue(v10, @"Password");
            CFTypeID v33 = CFStringGetTypeID();
            if (v32 && CFGetTypeID(v32) == v33)
            {
              os_log_type_t v34 = CFDictionaryGetValue(v31, @"Password");
              CFTypeID v35 = CFStringGetTypeID();
              if (v34 && CFGetTypeID(v34) == v35)
              {
                if (!CFEqual(v32, v34))
                {
                  logger = mysyslog_get_logger();
                  os_log_type_t v37 = _SC_syslog_os_log_mapping();
                  if (os_log_type_enabled(logger, v37))
                  {
                    *(_WORD *)__CFString buf = 0;
                    _os_log_impl(&dword_225F82000, logger, v37, "Different passwords provided for the same network", buf, 2u);
                  }
                }
              }
              else
              {
                CFDictionarySetValue(v31, @"Password", v32);
              }
            }
            goto LABEL_36;
          }
          if (v29 == kCFCompareLessThan)
          {
            CFDictionaryRef v30 = CFDictionaryCreateMutableCopy(0, 0, v10);
            filterDictAnnotate(v30, Name, Confidence);
            CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a2 + 8), v27, v30);
LABEL_35:
            CFRelease(v30);
            ++*(void *)(a2 + 24);
          }
        }
LABEL_36:
        CFRelease(v10);
        long long DisplayID = v11;
        goto LABEL_37;
      }
    }
  }
}

CFDictionaryRef createScanListProcessCommand(void *a1, CFArrayRef theArray)
{
  CFDictionaryRef v2 = theArray;
  keys[4] = *(void **)MEMORY[0x263EF8340];
  int valuePtr = 1;
  if (theArray)
  {
    if (CFArrayGetCount(theArray))
    {
      keys[3] = 0;
      values[3] = 0;
      CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
      keys[0] = @"Type";
      keys[1] = @"InterfaceName";
      values[0] = v4;
      values[1] = a1;
      keys[2] = @"NetworkList";
      values[2] = v2;
      CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v4) {
        CFRelease(v4);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void CNScanListFilterSendClearResults(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1 + 144);
  if (v2 && CFArrayGetCount(v2) >= 1)
  {
    CFStringRef BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    ScanListProcessCFDictionaryRef Command = createScanListProcessCommand(BSDName, *(CFArrayRef *)(a1 + 144));
    if (ScanListProcessCommand)
    {
      CFDictionaryRef v5 = ScanListProcessCommand;
      CommandHandlerListApplyFunction(5u, (uint64_t)CNScanListFilterAppendCommandApplier, (uint64_t)ScanListProcessCommand);
      CFRelease(v5);
    }
    CFRelease(*(CFTypeRef *)(a1 + 144));
    *(void *)(a1 + 144) = 0;
  }
}

CFComparisonResult filterDictCompare(const __CFDictionary *a1, const __CFDictionary *a2)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"SSIDString");
  CFStringRef v5 = (const __CFString *)CFDictionaryGetValue(a2, @"SSIDString");
  CFComparisonResult result = CFStringCompare(Value, v5, 0);
  if (result == kCFCompareEqualTo)
  {
    CFStringRef v7 = (const __CFString *)CFDictionaryGetValue(a1, @"BSSID");
    CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(a2, @"BSSID");
    return CFStringCompare(v7, v8, 0);
  }
  return result;
}

void filterDictAnnotate(const __CFDictionary *a1, const void *a2, unsigned int a3)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"PluginNames");
  CFArrayRef v7 = (const __CFArray *)CFDictionaryGetValue(a1, @"__ConfidenceList");
  CFStringRef v8 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (Value)
  {
    CFArrayRef Mutable = v7;
    CFIndex Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v11 = Count;
      CFIndex v12 = 0;
      CFIndex v13 = -1;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(Value, v12);
        if (CFEqual(ValueAtIndex, a2)) {
          return;
        }
        if (v13 == -1)
        {
          CFTypeID v15 = CFArrayGetValueAtIndex(Mutable, v12);
          if (numberGetConfidence(v15) >= a3) {
            CFIndex v13 = -1;
          }
          else {
            CFIndex v13 = v12;
          }
        }
        if (v11 == ++v12) {
          goto LABEL_13;
        }
      }
    }
  }
  else
  {
    CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFTypeID v17 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    CFArrayRef Value = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    CFDictionarySetValue(a1, @"PluginNames", Value);
    CFRelease(Value);
    CFArrayRef Mutable = CFArrayCreateMutable(v16, 0, v17);
    CFDictionarySetValue(a1, @"__ConfidenceList", Mutable);
    CFRelease(Mutable);
  }
  CFIndex v13 = -1;
LABEL_13:
  unsigned int valuePtr = a3;
  CFNumberRef v18 = CFNumberCreate(*v8, kCFNumberSInt32Type, &valuePtr);
  if (v13 == -1)
  {
    CFArrayAppendValue(Value, a2);
    CFArrayAppendValue(Mutable, v18);
  }
  else
  {
    CFArrayInsertValueAtIndex(Value, v13, a2);
    CFArrayInsertValueAtIndex(Mutable, v13, v18);
  }
  CFRelease(v18);
}

uint64_t NetworkArrayContainsNetwork(const __CFArray *a1, const __CFDictionary *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v5 = Count;
  CFIndex v6 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v6);
    CFArrayRef Value = CFDictionaryGetValue(a2, @"SSIDString");
    CFStringRef v9 = CFDictionaryGetValue(ValueAtIndex, @"SSIDString");
    uint64_t result = CFEqual(Value, v9);
    if (result == 1) {
      break;
    }
    if (v5 == ++v6) {
      return 0;
    }
  }
  return result;
}

void CNScanListFilterAppendCommandApplier(uint64_t a1, const void *a2)
{
  CFDictionaryRef Information = (const __CFDictionary *)CommandHandlerGetInformation(a1);
  CFArrayRef Value = (__CFArray *)CFDictionaryGetValue(Information, @"CommandList");
  if (!Value)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    CNScanListFilterSetCommandList(a1, Mutable);
    CFRelease(Mutable);
LABEL_14:
    CFArrayAppendValue(Mutable, a2);
    CommandHandlerNotify(a1);
    return;
  }
  CFMutableArrayRef Mutable = Value;
  CFArrayRef v7 = CFDictionaryGetValue((CFDictionaryRef)a2, @"InterfaceName");
  if (v7)
  {
    CFStringRef v8 = v7;
    CFIndex Count = CFArrayGetCount(Mutable);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      CFIndex v11 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v11);
        CFIndex v13 = CFDictionaryGetValue(ValueAtIndex, @"InterfaceName");
        if (!v13 || CFEqual(v13, v8)) {
          break;
        }
        if (v10 == ++v11) {
          goto LABEL_14;
        }
      }
      CFArrayRemoveValueAtIndex(Mutable, v11);
    }
    goto LABEL_14;
  }
  logger = mysyslog_get_logger();
  os_log_type_t v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v15))
  {
    *(_WORD *)CFAllocatorRef v16 = 0;
    _os_log_impl(&dword_225F82000, logger, v15, "if_name is NULL", v16, 2u);
  }
}

void CNScanListFilterSetCommandList(uint64_t a1, const void *a2)
{
  CFDictionaryRef Information = (__CFDictionary *)CommandHandlerGetInformation(a1);
  if (Information)
  {
    if (a2)
    {
      CFDictionarySetValue(Information, @"CommandList", a2);
    }
    else
    {
      CFDictionaryRemoveValue(Information, @"CommandList");
    }
  }
}

void HandleInternetAccessProbeResult(uint64_t a1, unsigned int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(void *)(a1 + 224) = 0;
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    if (a2 > 0xA) {
      CFIndex v6 = "<unknown>";
    }
    else {
      CFIndex v6 = off_264784FA8[a2];
    }
    int v7 = 136315394;
    CFStringRef v8 = v6;
    __int16 v9 = 1024;
    unsigned int v10 = a2;
    _os_log_impl(&dword_225F82000, logger, v5, "Internet Access Probe: result '%s' (%d)", (uint8_t *)&v7, 0x12u);
  }
  *(unsigned char *)(a1 + 217) = a2 == 0;
}

void _BrokenBackhaulMonitorComplete(uint64_t a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 56) == 4)
  {
    LOBYTE(v9) = (a2 & 2) != 0;
    if (a2)
    {
      CNInfoAuthenticated(a1, 4, &v9);
    }
    else if ((a2 >> 1))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      if (v3)
      {
        NetIFWiFiNetworkSetCaptive(v3, 8u);
        CNInfoUpdateWiFiNetwork(a1);
      }
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      uint64_t v7 = *(unsigned int *)(a1 + 56);
      if (v7 <= 8) {
        CFStringRef v8 = AuthStateString_strings[v7];
      }
      else {
        CFStringRef v8 = "<unknown>";
      }
      int v9 = 138412546;
      CFStringRef v10 = BSDName;
      __int16 v11 = 2080;
      CFIndex v12 = v8;
      _os_log_impl(&dword_225F82000, logger, v5, "CNPluginHandler %@: probe completed in %s state, ignoring", (uint8_t *)&v9, 0x16u);
    }
  }
}

void CNInfoAddExcludedDisplayID(uint64_t a1, void *value)
{
  CFMutableArrayRef Mutable = *(__CFArray **)(a1 + 96);
  if (!Mutable)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    *(void *)(a1 + 96) = Mutable;
  }

  CFArrayAppendValue(Mutable, value);
}

uint64_t CNPluginAuthorize(long long *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v2 = a1[1];
  long long v7 = *a1;
  long long v8 = v2;
  uint64_t result = audit_token_has_BOOLean_entitlement(&v7, @"com.apple.developer.CaptiveNetworkPlugin");
  if (!result)
  {
    long long v4 = a1[1];
    long long v7 = *a1;
    long long v8 = v4;
    uint64_t result = audit_token_has_BOOLean_entitlement(&v7, @"com.apple.developer.networking.HotspotHelper");
    if (!result)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      uint64_t result = os_log_type_enabled(logger, v6);
      if (result)
      {
        LODWORD(v7) = 138412290;
        *(void *)((char *)&v7 + 4) = @"com.apple.developer.networking.HotspotHelper";
        _os_log_impl(&dword_225F82000, logger, v6, "missing '%@' entitlement", (uint8_t *)&v7, 0xCu);
        return 0;
      }
    }
  }
  return result;
}

BOOL CNPluginRegister(uint64_t *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = CNPluginStateRegister((uint64_t)a1);
  if (v2)
  {
    uint64_t v3 = S_CNInfoHeadStorage;
    if (S_CNInfoHeadStorage)
    {
      uint64_t v4 = v2;
      do
      {
        os_log_type_t v5 = *(const void **)(v3 + 64);
        if (*(_DWORD *)(v3 + 56) == 2 && v5 != 0)
        {
          CNPluginStateSetEvaluateCommandStatus(v4, 0);
          CNPluginStateIssueCommand(v4, v5);
        }
        long long v7 = *(const void **)(v3 + 112);
        if (v7) {
          CNPluginStateIssueCommand(v4, v7);
        }
        uint64_t v3 = *(void *)v3;
      }
      while (v3);
    }
    return 1;
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(logger, v10);
    if (result)
    {
      int PID = CommandHandlerGetPID(*a1);
      v12[0] = 67109120;
      v12[1] = PID;
      _os_log_impl(&dword_225F82000, logger, v10, "failed to register pid %d", (uint8_t *)v12, 8u);
      return 0;
    }
  }
  return result;
}

void CNPluginRemove(uint64_t a1)
{
  CFDictionaryRef Information = (void *)CommandHandlerGetInformation(a1);
  uint64_t v2 = CNPluginStateGet(Information);
  if (v2)
  {
    CNPluginStateSetNotRunning((uint64_t)v2);
  }
}

uint64_t CNPluginProvideCommand(uint64_t *a1)
{
  CFDictionaryRef Information = (void *)CommandHandlerGetInformation(*a1);
  uint64_t v3 = CNPluginStateGet(Information);
  if (v3) {
    a1[1] = (uint64_t)CNPluginStateCopyCommandList((uint64_t)v3);
  }
  return 1;
}

const void *CNPluginProcessResponse(uint64_t *a1)
{
  CFDictionaryRef Information = (void *)CommandHandlerGetInformation(*a1);
  BOOL result = CNPluginStateGet(Information);
  if (result)
  {
    CFDictionaryRef v4 = (const __CFDictionary *)a1[1];
    return (const void *)CNPluginHandleResponse((uint64_t)result, v4);
  }
  return result;
}

uint64_t CNPluginProcessControl(uint64_t a1)
{
  CFDictionaryRef Information = (void *)CommandHandlerGetInformation(*(void *)a1);
  uint64_t result = (uint64_t)CNPluginStateGet(Information);
  if (result)
  {
    uint64_t v4 = result;
    CFArrayRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), @"Type");
    CFTypeID TypeID = CFNumberGetTypeID();
    if (!Value || CFGetTypeID(Value) != TypeID) {
      return 0;
    }
    int valuePtr = 0;
    uint64_t result = CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr);
    if (!result) {
      return result;
    }
    if (valuePtr == 2)
    {
      uint64_t v15 = S_CNInfoHeadStorage;
      if (S_CNInfoHeadStorage)
      {
        CFMutableArrayRef Mutable = 0;
        uint64_t v17 = *MEMORY[0x263EFFB40];
        CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFBooleanRef v19 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
        do
        {
          long long v27 = 0u;
          long long v28 = 0u;
          memset(v26, 0, sizeof(v26));
          CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v15 + 32));
          if (*(void *)(v15 + 72) == v4) {
            int v21 = (const void *)NetIFCopyCurrentWiFiNetworkWithSignal((uint64_t)BSDName);
          }
          else {
            int v21 = (const void *)NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
          }
          uint64_t v22 = v21;
          networkAttributesInit(v26, v21, 1, 0);
          if (*(void *)(v15 + 72) == v4) {
            *((void *)&v27 + 1) = v17;
          }
          long long v23 = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v15 + 32));
          AuthCFDictionaryRef Command = createAuthCommand(v23, 0, (uint64_t *)v26);
          networkAttributesRelease((uint64_t)v26);
          if (v22) {
            CFRelease(v22);
          }
          if (!Mutable) {
            CFMutableArrayRef Mutable = CFArrayCreateMutable(v18, 0, v19);
          }
          CFArrayAppendValue(Mutable, AuthCommand);
          CFRelease(AuthCommand);
          uint64_t v15 = *(void *)v15;
        }
        while (v15);
      }
      else
      {
        CFMutableArrayRef Mutable = 0;
      }
      *(void *)(a1 + 16) = Mutable;
      return 1;
    }
    if (valuePtr != 1) {
      return 0;
    }
    CFDictionaryRef v7 = *(const __CFDictionary **)(a1 + 8);
    long long v8 = CFDictionaryGetValue(v7, @"InterfaceName");
    CFTypeID v9 = CFStringGetTypeID();
    if (!v8 || CFGetTypeID(v8) != v9) {
      return 0;
    }
    uint64_t result = (uint64_t)CNInfoFind(v8);
    if (!result) {
      return result;
    }
    uint64_t v10 = result;
    if (*(void *)(result + 72) != v4) {
      return 0;
    }
    if (*(_DWORD *)(result + 56) != 4) {
      return 0;
    }
    __int16 v11 = CFDictionaryGetValue(v7, @"Network");
    CFTypeID v12 = CFDictionaryGetTypeID();
    if (!v11 || CFGetTypeID(v11) != v12) {
      return 0;
    }
    if (!*(void *)(v10 + 40))
    {
LABEL_19:
      CNInfoLoggingOff(v10, 0);
      return 1;
    }
    uint64_t v13 = CFDictionaryGetValue((CFDictionaryRef)v11, @"SSID");
    CFTypeID v14 = CFDataGetTypeID();
    if (v13 && CFGetTypeID(v13) == v14)
    {
      uint64_t result = WiFiNetworkGetSSIDData();
      if (result)
      {
        uint64_t result = CFEqual(v13, (CFTypeRef)result);
        if (result) {
          goto LABEL_19;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const void *CNPluginProcessAck(uint64_t *a1)
{
  CFDictionaryRef Information = (void *)CommandHandlerGetInformation(*a1);
  uint64_t result = CNPluginStateGet(Information);
  if (result)
  {
    CFDictionaryRef v4 = (const __CFDictionary *)a1[1];
    return (const void *)CNPluginStateProcessCmdAck((uint64_t)result, v4);
  }
  return result;
}

uint64_t CNScanListFilterAuthorize(_OWORD *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  long long v1 = a1[1];
  v6[0] = *a1;
  v6[1] = v1;
  uint64_t has_BOOLean_entitlement = audit_token_has_BOOLean_entitlement(v6, @"com.apple.wifi.manager-access");
  if (!has_BOOLean_entitlement)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      LODWORD(v6[0]) = 138412290;
      *(void *)((char *)v6 + 4) = @"com.apple.wifi.manager-access";
      _os_log_impl(&dword_225F82000, logger, v4, "missing '%@' entitlement", (uint8_t *)v6, 0xCu);
    }
  }
  return has_BOOLean_entitlement;
}

uint64_t CNScanListFilterRegister(uint64_t *a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CommandHandlerSetInformation(*a1, Mutable);
  CFRelease(Mutable);
  return 1;
}

void CNScanListFilterRemove(uint64_t a1)
{
}

uint64_t CNScanListFilterProvideCommand(uint64_t *a1)
{
  CFDictionaryRef Information = (const __CFDictionary *)CommandHandlerGetInformation(*a1);
  CFArrayRef Value = CFDictionaryGetValue(Information, @"CommandList");
  if (Value)
  {
    a1[1] = (uint64_t)CFRetain(Value);
    os_log_type_t v4 = (__CFDictionary *)CommandHandlerGetInformation(*a1);
    if (v4) {
      CFDictionaryRemoveValue(v4, @"CommandList");
    }
  }
  return 1;
}

uint64_t CNScanListFilterProcessResponse()
{
  return 1;
}

uint64_t CNScanListFilterProcessControl(uint64_t a1)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), @"Type");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    int valuePtr = 0;
    uint64_t result = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    if (!result) {
      return result;
    }
    if (valuePtr == 1)
    {
      int v5 = 1;
      goto LABEL_10;
    }
    if (valuePtr == 2)
    {
      int v5 = 0;
LABEL_10:
      CNScanListFilterSetIsEnabled(*(void *)a1, v5);
      return 1;
    }
  }
  return 0;
}

void CNScanListFilterSetIsEnabled(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFDictionaryRef Information = (const __CFDictionary *)CommandHandlerGetInformation(a1);
  if (Information)
  {
    int v5 = Information;
    if (CFDictionaryContainsKey(Information, @"IsEnabled") != a2)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v7 = _SC_syslog_os_log_mapping();
      BOOL v8 = os_log_type_enabled(logger, v7);
      if (a2)
      {
        if (v8)
        {
          int v17 = 67109120;
          int PID = CommandHandlerGetPID(a1);
          _os_log_impl(&dword_225F82000, logger, v7, "ScanListFilter ENABLE [pid %d]", (uint8_t *)&v17, 8u);
        }
        CFDictionarySetValue(v5, @"IsEnabled", (const void *)*MEMORY[0x263EFFB40]);
        if (!S_filter_request_count)
        {
          CFTypeID v9 = mysyslog_get_logger();
          os_log_type_t v10 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v9, v10))
          {
            LOWORD(v17) = 0;
            _os_log_impl(&dword_225F82000, v9, v10, "START monitoring scan results", (uint8_t *)&v17, 2u);
          }
          for (uint64_t i = S_CNInfoHeadStorage; i; uint64_t i = *(void *)i)
          {
            *(_DWORD *)(i + 128) = 0;
            CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(i + 32));
            NetIFEnableScanResults((uint64_t)BSDName);
          }
        }
        ++S_filter_request_count;
      }
      else
      {
        if (v8)
        {
          int v17 = 67109120;
          int PID = CommandHandlerGetPID(a1);
          _os_log_impl(&dword_225F82000, logger, v7, "ScanListFilter DISABLE [pid %d]", (uint8_t *)&v17, 8u);
        }
        CFDictionaryRemoveValue(v5, @"IsEnabled");
        if (!--S_filter_request_count)
        {
          uint64_t v13 = mysyslog_get_logger();
          os_log_type_t v14 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v13, v14))
          {
            LOWORD(v17) = 0;
            _os_log_impl(&dword_225F82000, v13, v14, "STOP monitoring scan results", (uint8_t *)&v17, 2u);
          }
          CNPluginStateListApplyFunction((uint64_t)CNScanListFilterFlushResultsApplier, 0);
          for (uint64_t j = S_CNInfoHeadStorage; j; uint64_t j = *(void *)j)
          {
            CFStringRef v16 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(j + 32));
            NetIFDisableScanResults((uint64_t)v16);
            CNInfoFlushFilterCommand(j);
          }
        }
      }
    }
  }
}

void CNInfoFlushFilterCommand(uint64_t a1)
{
  uint64_t v2 = (const void **)(a1 + 112);
  uint64_t v1 = *(void *)(a1 + 112);
  if (v1)
  {
    CNPluginStateListRemoveCommand(v1);
    my_FieldSetRetainedCFType(v2, 0);
  }
}

void CNScanListFilterFlushResultsApplier(uint64_t a1, void *a2)
{
}

void CNPluginHandlerNetworkInformationChanged()
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v0 = nwi_state_copy();
  if (!v0)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      *(_WORD *)__CFString buf = 0;
      _os_log_impl(&dword_225F82000, logger, v2, "nwi_state_copy returned NULL", buf, 2u);
    }
  }
  CFDictionaryRef v3 = NetIFCopyAllServiceInformation();
  uint64_t v4 = S_CNInfoHeadStorage;
  if (S_CNInfoHeadStorage)
  {
    while (1)
    {
      if (v0)
      {
        uint64_t ifstate = nwi_state_get_ifstate();
        if (ifstate) {
          LOBYTE(ifstate) = nwi_ifstate_get_flags();
        }
      }
      else
      {
        LOBYTE(ifstate) = 0;
      }
      uint64_t v6 = ifstate & 5;
      uint64_t v7 = ifstate & 6;
      int v8 = *(_DWORD *)(v4 + 232);
      BOOL v10 = v6 == 5 || v7 == 6;
      uint64_t v11 = ~(_BYTE)ifstate & 7;
      CFTypeID v12 = mysyslog_get_logger();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      BOOL v14 = os_log_type_enabled(v12, v13);
      if (v11)
      {
        if (v6 == 5)
        {
          if (v14)
          {
            *(_WORD *)__CFString buf = 0;
            _os_log_impl(&dword_225F82000, v12, v13, "received nwi state change notification for DNS with IPv4", buf, 2u);
          }
          if (v8 == 1)
          {
LABEL_75:
            os_log_type_t v34 = mysyslog_get_logger();
            os_log_type_t v35 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v34, v35))
            {
              *(_WORD *)__CFString buf = 0;
              _os_log_impl(&dword_225F82000, v34, v35, "IPv6 Only probe is in progress, setting evaluation retry flag", buf, 2u);
            }
            *(_DWORD *)(v4 + 104) |= 2u;
            if (!v3) {
              goto LABEL_72;
            }
LABEL_71:
            CFRelease(v3);
            goto LABEL_72;
          }
          goto LABEL_35;
        }
        if (v7 == 6)
        {
          if (v14)
          {
            *(_WORD *)__CFString buf = 0;
            _os_log_impl(&dword_225F82000, v12, v13, "received nwi state change notification for DNS with IPv6", buf, 2u);
          }
          if (v8 != 3)
          {
            if (!v8) {
              *(_DWORD *)(v4 + 232) = 1;
            }
LABEL_35:
            CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v4 + 32));
            CFArrayRef v16 = NetIFCopySignatures(v3, (uint64_t)BSDName);
            int v17 = 0;
            int v18 = 1;
            goto LABEL_37;
          }
        }
        else
        {
          if (v14)
          {
            *(_WORD *)__CFString buf = 0;
            _os_log_impl(&dword_225F82000, v12, v13, "received nwi state change notification with no DNS", buf, 2u);
          }
          *(_DWORD *)(v4 + 104) &= ~2u;
          *(_DWORD *)(v4 + 232) = 0;
          if (v10) {
            goto LABEL_35;
          }
        }
      }
      else
      {
        if (v14)
        {
          *(_WORD *)__CFString buf = 0;
          _os_log_impl(&dword_225F82000, v12, v13, "received nwi state change notification for DNS with dual stack", buf, 2u);
        }
        if (v8 == 1) {
          goto LABEL_75;
        }
        if (v10) {
          goto LABEL_35;
        }
      }
      int v18 = 0;
      CFArrayRef v16 = 0;
      int v17 = 1;
LABEL_37:
      uint64_t v19 = mysyslog_get_logger();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        CFStringRef v21 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v4 + 32));
        *(_DWORD *)__CFString buf = 138412546;
        uint64_t v22 = "is not active";
        if (v18) {
          uint64_t v22 = "is active";
        }
        os_log_type_t v37 = (void *)v21;
        __int16 v38 = 2080;
        CFStringRef v39 = v22;
        _os_log_impl(&dword_225F82000, v19, v20, "interface %@ %s", buf, 0x16u);
      }
      if (v17)
      {
        CNInfoSetWiFiAdvisory(v4, 1);
        CNInfoInactive(v4, 0);
        if (!v16) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      CFArrayRef v23 = *(const __CFArray **)(v4 + 48);
      if (v16)
      {
        if (v23) {
          BOOL v24 = my_CFArrayContainsAnyArrayValues(v23, v16) != 0;
        }
        else {
          BOOL v24 = 0;
        }
      }
      else
      {
        BOOL v24 = *(_DWORD *)(v4 + 56) != 1 && v23 == 0;
      }
      my_FieldSetRetainedCFType((const void **)(v4 + 48), v16);
      CFIndex v26 = mysyslog_get_logger();
      os_log_type_t v27 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v26, v27))
      {
        long long v28 = "starting";
        if (v24) {
          long long v28 = "not starting";
        }
        *(_DWORD *)__CFString buf = 136315138;
        os_log_type_t v37 = (void *)v28;
        _os_log_impl(&dword_225F82000, v26, v27, "%s captive state machine", buf, 0xCu);
        if (!v24)
        {
LABEL_63:
          CFComparisonResult v29 = *(const void **)(v4 + 96);
          if (v29)
          {
            CFRelease(v29);
            *(void *)(v4 + 96) = 0;
          }
          CNInfoStopBrokenBackhaulMonitor(v4);
          *(_DWORD *)(v4 + 104) &= ~2u;
          CNInfoNetworkActive(v4);
          if (!v16) {
            goto LABEL_58;
          }
LABEL_57:
          CFRelease(v16);
          goto LABEL_58;
        }
      }
      else if (!v24)
      {
        goto LABEL_63;
      }
      if (v16) {
        goto LABEL_57;
      }
LABEL_58:
      uint64_t v4 = *(void *)v4;
      if (!v4) {
        goto LABEL_70;
      }
    }
  }
  CFDictionaryRef v30 = mysyslog_get_logger();
  os_log_type_t v31 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v30, v31))
  {
    *(_WORD *)__CFString buf = 0;
    _os_log_impl(&dword_225F82000, v30, v31, "no Wi-Fi interfaces found", buf, 2u);
  }
  double Current = CFRunLoopGetCurrent();
  CFRunLoopPerformBlock(Current, (CFTypeRef)*MEMORY[0x263EFFE88], &__block_literal_global_2);
  CFTypeID v33 = CFRunLoopGetCurrent();
  CFRunLoopWakeUp(v33);
LABEL_70:
  if (v3) {
    goto LABEL_71;
  }
LABEL_72:
  if (v0) {
    nwi_state_release();
  }
}

void __CNPluginHandlerNetworkInformationChanged_block_invoke()
{
  logger = mysyslog_get_logger();
  os_log_type_t v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)os_log_type_t v2 = 0;
    _os_log_impl(&dword_225F82000, logger, v1, "checking for new Wi-Fi interfaces", v2, 2u);
  }
  NetIFCheckForNewInterfaces();
}

void CNInfoSetWiFiAdvisory(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a2) {
    os_log_type_t v2 = @"WiFi is unavailable";
  }
  else {
    os_log_type_t v2 = @"WiFi is available";
  }
  if (*(unsigned __int8 *)(a1 + 160) != a2)
  {
    int v5 = SCNetworkInterfaceSetAdvisory();
    logger = mysyslog_get_logger();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v7))
    {
      CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      CFTypeID v9 = "Set";
      if (!a2) {
        CFTypeID v9 = "Clear";
      }
      int v11 = 138413058;
      CFStringRef v12 = BSDName;
      __int16 v13 = 2080;
      BOOL v14 = v9;
      __int16 v15 = 2112;
      CFArrayRef v16 = v2;
      if (v5) {
        BOOL v10 = "";
      }
      else {
        BOOL v10 = " FAILED";
      }
      __int16 v17 = 2080;
      int v18 = v10;
      _os_log_impl(&dword_225F82000, logger, v7, "%@: %sAdvisory '%@'%s", (uint8_t *)&v11, 0x2Au);
    }
    *(unsigned char *)(a1 + 160) = a2;
  }
}

void CNInfoNetworkActive(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  os_log_type_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 40) = 0;
  }
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  CFStringRef BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
  uint64_t v4 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
  *(void *)(a1 + 40) = v4;
  if (v4 && (SSID = WiFiNetworkGetSSID(), *(void *)(a1 + 40)) && (uint64_t v6 = SSID) != 0)
  {
    CFStringRef v7 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    CFDictionaryRef v8 = networkCopyCaptivePortalAPIURL((uint64_t)v7);
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      NetIFWiFiNetworkSetCaptivePortalAPIURL(*(void *)(a1 + 40), v8);
      CFRelease(v9);
    }
    if (!NetIFWiFiNetworkIsCarPlay()) {
      goto LABEL_14;
    }
    BOOL IsCarPlayOnly = NetIFWiFiNetworkIsCarPlayOnly();
    logger = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v12))
    {
      CFStringRef v13 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      BOOL v14 = "CarPlay Only";
      *(_DWORD *)__CFString buf = 138412802;
      CFStringRef v39 = v13;
      if (!IsCarPlayOnly) {
        BOOL v14 = "CarPlay And Internet";
      }
      __int16 v40 = 2112;
      uint64_t v41 = v6;
      __int16 v42 = 2080;
      os_log_type_t v43 = v14;
      _os_log_impl(&dword_225F82000, logger, v12, "%@: device is associated to CarPlay network SSID '%@' in %s mode", buf, 0x20u);
    }
    CFStringRef v15 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    NetIFSetCarPlayModeChangeCallBack((uint64_t)v15, (uint64_t (*)(void, void))CNPluginHandlerCarPlayModeChange);
    if (!IsCarPlayOnly)
    {
LABEL_14:
      CNInfoSetWiFiAdvisory(a1, 0);
      BOOL IsProtected = NetIFWiFiNetworkIsProtected(*(void *)(a1 + 40));
      CacheEntry = CNInfoGetCacheEntry((void *)a1);
      if (CacheEntry)
      {
        int v18 = CacheEntry;
        if (NetCacheEntryGetIsCaptive((uint64_t)CacheEntry))
        {
          CFDictionaryRef Information = (void *)CommandHandlerGetInformation((uint64_t)v18);
          if (Information && (os_log_type_t v20 = CNPluginStateGet(Information)) != 0)
          {
            my_FieldSetRetainedCFType((const void **)(a1 + 72), v20);
            BOOL v21 = 0;
            *(_DWORD *)(a1 + 80) = 2;
            char v22 = 1;
            CFArrayRef v23 = "cached captive network";
          }
          else
          {
            NetCacheEntryDestroy(v18);
            BOOL v21 = 0;
            char v22 = 0;
            CFArrayRef v23 = "plugin no longer present";
          }
        }
        else
        {
          char v22 = 0;
          BOOL v21 = 1;
          CFArrayRef v23 = "cache indicates network not captive";
        }
      }
      else
      {
        char v22 = 0;
        BOOL v21 = IsProtected;
        if (IsProtected) {
          CFArrayRef v23 = "protected network";
        }
        else {
          CFArrayRef v23 = "no cache entry";
        }
      }
      BOOL IsCarPlayAndInternet = NetIFWiFiNetworkIsCarPlayAndInternet();
      BOOL v28 = !IsCarPlayAndInternet && v21;
      CFComparisonResult v29 = mysyslog_get_logger();
      os_log_type_t v30 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v29, v30))
      {
        CFStringRef v31 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        unsigned int v32 = "Default";
        if (!v28) {
          unsigned int v32 = "Never";
        }
        *(_DWORD *)__CFString buf = 138413058;
        CFStringRef v39 = v31;
        __int16 v40 = 2112;
        uint64_t v41 = v6;
        __int16 v42 = 2080;
        os_log_type_t v43 = v32;
        if (IsCarPlayAndInternet) {
          CFTypeID v33 = "CarPlay Wi-Fi network";
        }
        else {
          CFTypeID v33 = v23;
        }
        __int16 v44 = 2080;
        uint64_t v45 = v33;
        _os_log_impl(&dword_225F82000, v29, v30, "%@: SSID '%@' setting interface rank %s (%s)", buf, 0x2Au);
      }
      os_log_type_t v34 = *(const __SCNetworkInterface **)(a1 + 32);
      if (v28) {
        NetIFSetRankDefault(v34);
      }
      else {
        NetIFSetRankNever(v34);
      }
      PassiveDetectNewNetwork();
      uint64_t v36 = *MEMORY[0x263EFFB40];
      uint64_t v37 = 0;
      uint64_t v35 = *(void *)(a1 + 224);
      *(_OWORD *)(a1 + 163) = 0u;
      *(_OWORD *)(a1 + 179) = 0u;
      *(unsigned char *)(a1 + 195) = 0;
      *(void *)(a1 + 200) = 0;
      *(void *)(a1 + 208) = 0;
      *(unsigned char *)(a1 + 216) = 0;
      if (v35)
      {
        captive_agent_abort_probe((void *)(a1 + 224));
        *(void *)(a1 + 224) = 0;
      }
      if (v22) {
        CNInfoMaintaining(a1, 0, (uint64_t)&v36);
      }
      else {
        CNInfoEvaluating(a1, 0, (uint64_t)&v36);
      }
    }
  }
  else
  {
    BOOL v24 = mysyslog_get_logger();
    os_log_type_t v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v24, v25))
    {
      CFStringRef v26 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      *(_DWORD *)__CFString buf = 138412290;
      CFStringRef v39 = v26;
      _os_log_impl(&dword_225F82000, v24, v25, "%@: WiFi network or SSID is NULL", buf, 0xCu);
    }
    CNInfoInactive(a1, 0);
  }
}

void CNPluginHandlerCarPlayModeChange(int a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    uint64_t v6 = "CarPlay And Internet";
    if (!a1) {
      uint64_t v6 = "CarPlay Only Mode";
    }
    int v7 = 136315138;
    CFDictionaryRef v8 = v6;
    _os_log_impl(&dword_225F82000, logger, v5, "CarPlay mode changed to %s", (uint8_t *)&v7, 0xCu);
  }
  if (a1) {
    CNInfoNetworkActive(a2);
  }
  else {
    CNInfoInactive(a2, 0);
  }
}

void *CNInfoGet(const __CFString *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  os_log_type_t v2 = CNInfoFind(a1);
  if (!v2)
  {
    uint64_t v3 = NetIFCopyNetworkInterface();
    if (v3)
    {
      uint64_t v4 = v3;
      os_log_type_t v2 = malloc_type_malloc(0xF0uLL, 0x10E004006BEAF24uLL);
      *(_OWORD *)os_log_type_t v2 = 0u;
      *((_OWORD *)v2 + 2) = 0u;
      *((_OWORD *)v2 + 3) = 0u;
      *((_OWORD *)v2 + 4) = 0u;
      *((_OWORD *)v2 + 5) = 0u;
      *((_OWORD *)v2 + 6) = 0u;
      *((_OWORD *)v2 + 7) = 0u;
      *((_OWORD *)v2 + 8) = 0u;
      *((_OWORD *)v2 + 9) = 0u;
      *((_OWORD *)v2 + 10) = 0u;
      *((_OWORD *)v2 + 11) = 0u;
      *((_OWORD *)v2 + 12) = 0u;
      *((_OWORD *)v2 + 13) = 0u;
      *((_OWORD *)v2 + 14) = 0u;
      *((_OWORD *)v2 + 1) = 0u;
      *((void *)v2 + 4) = v4;
      CFStringGetCString(a1, (char *)v2 + 16, 16, 0x600u);
      uint64_t v5 = S_CNInfoHeadStorage;
      *(void *)os_log_type_t v2 = S_CNInfoHeadStorage;
      if (v5) {
        *(void *)(v5 + 8) = v2;
      }
      S_CNInfoHeadStorage = (uint64_t)v2;
      *((void *)v2 + 1) = &S_CNInfoHeadStorage;
      TimerCreate();
      *((void *)v2 + 11) = v6;
      *((void *)v2 + 17) = NetCacheCreate();
    }
    else
    {
      logger = mysyslog_get_logger();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        int v10 = 138412290;
        CFStringRef v11 = a1;
        _os_log_impl(&dword_225F82000, logger, v8, "NetIFCopyNetworkInterface(%@) failed", (uint8_t *)&v10, 0xCu);
      }
      return 0;
    }
  }
  return v2;
}

uint64_t CNPluginStateIsBuiltin(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t CNPluginStateSetEvaluateCommandStatus(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 112) != 3) {
    *(_DWORD *)(result + 112) = a2;
  }
  return result;
}

uint64_t CNPluginStateGetDisplayID(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t CNPluginStateGetName(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

const void *CNPluginStateGet(void *key)
{
  uint64_t result = (const void *)S_plugins;
  if (S_plugins) {
    return CFDictionaryGetValue((CFDictionaryRef)S_plugins, key);
  }
  return result;
}

void CNPluginStateListInitialize()
{
  uint64_t v0 = (const __SCPreferences *)prefs_get();
  if (v0)
  {
    CFPropertyListRef Value = SCPreferencesGetValue(v0, @"Plugins");
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (Value && CFGetTypeID(Value) == TypeID)
    {
      CFRetain(Value);
      CFDictionaryApplyFunction((CFDictionaryRef)Value, (CFDictionaryApplierFunction)CNPluginStateLoadApplier, 0);
      CFRelease(Value);
    }
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    if (DistributedCenter)
    {
      CFNotificationCenterAddObserver(DistributedCenter, Current, (CFNotificationCallback)AppUninstallationCallback, @"com.apple.LaunchServices.applicationUnregistered", 0, CFNotificationSuspensionBehaviorCoalesce);
    }
    else
    {
      logger = mysyslog_get_logger();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v6))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl(&dword_225F82000, logger, v6, "failed to get the distributed notification center", v7, 2u);
      }
    }
  }
}

uint64_t prefs_get()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!prefs_get_S_prefs)
  {
    prefs_get_S_prefs = (uint64_t)SCPreferencesCreate(0, @"com.apple.captive.plugins.plist", @"com.apple.captive.plugins.plist");
    if (!prefs_get_S_prefs)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v1 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v1))
      {
        int v2 = SCError();
        int v4 = 136315138;
        uint64_t v5 = SCErrorString(v2);
        _os_log_impl(&dword_225F82000, logger, v1, "SCPreferencesCreate failed: %s", (uint8_t *)&v4, 0xCu);
      }
    }
  }
  return prefs_get_S_prefs;
}

uint64_t CNPluginStateBuiltinRegister(uint64_t a1)
{
  if (S_plugins && CFDictionaryGetValue((CFDictionaryRef)S_plugins, @"__BUILTIN__"))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      LOWORD(v7.version) = 0;
      _os_log_impl(&dword_225F82000, logger, v3, "built-in already registered", (uint8_t *)&v7, 2u);
    }
    return 0;
  }
  else
  {
    uint64_t v4 = CNPluginStateAdd(@"__BUILTIN__");
    *(unsigned char *)(v4 + 16) = 1;
    *(void *)(v4 + 32) = CFRetain(@"__NAME__");
    *(void *)(v4 + 72) = a1;
    v7.version = 0;
    memset(&v7.retain, 0, 56);
    v7.info = (void *)v4;
    v7.perform = (void (__cdecl *)(void *))CNPluginStateBuiltinProcessSource;
    *(void *)(v4 + 80) = CFRunLoopSourceCreate(0, 0, &v7);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(v4 + 80), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  return v4;
}

uint64_t CNPluginStateAdd(const void *a1)
{
  if (!__kCNPluginStateTypeID) {
    __kCNPluginStateCFTypeID TypeID = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(void *)(Instance + 112) = 0;
  *(void *)(Instance + 24) = CFRetain(a1);
  CFMutableDictionaryRef Mutable = (__CFDictionary *)S_plugins;
  if (!S_plugins)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    S_plugins = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, a1, (const void *)Instance);
  CFRelease((CFTypeRef)Instance);
  return Instance;
}

void CNPluginStateBuiltinProcessSource(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16))
  {
    if (*(void *)(a1 + 104))
    {
      CNPluginHandleBuiltinEvaluateAck(a1);
      int v2 = *(const void **)(a1 + 104);
      if (v2)
      {
        CFRelease(v2);
        *(void *)(a1 + 104) = 0;
      }
    }
    CFArrayRef v3 = *(const __CFArray **)(a1 + 96);
    if (v3)
    {
      CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 96));
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0; i != v5; ++i)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
          CNPluginHandleBuiltinResponse(a1, ValueAtIndex);
        }
      }
      os_log_type_t v8 = *(const void **)(a1 + 96);
      if (v8)
      {
        CFRelease(v8);
        *(void *)(a1 + 96) = 0;
      }
    }
    CFArrayRef v9 = *(const __CFArray **)(a1 + 56);
    if (v9)
    {
      CFIndex v10 = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
      if (v10 >= 1)
      {
        CFIndex v11 = v10;
        for (CFIndex j = 0; j != v11; ++j)
        {
          CFDictionaryRef v13 = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, j);
          CFPropertyListRef Value = CFDictionaryGetValue(v13, @"UniqueID");
          if (my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 88), Value)) {
            (*(void (**)(const __CFDictionary *))(a1 + 72))(v13);
          }
        }
      }
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v16))
    {
      *(_WORD *)__int16 v17 = 0;
      _os_log_impl(&dword_225F82000, logger, v16, "non-builtin trying to be builtin", v17, 2u);
    }
  }
}

void CNPluginStateBuiltinProvideResponse(uint64_t a1, const void *a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 96), a2);
    if (*(unsigned char *)(a1 + 16))
    {
      CFArrayRef v3 = *(__CFRunLoopSource **)(a1 + 80);
      if (v3)
      {
        CFRunLoopSourceSignal(v3);
      }
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_225F82000, logger, v5, "non-builtin trying to provide response", v6, 2u);
    }
  }
}

void CNPluginStateBuiltinAckEvaluateCommand(uint64_t a1, const void *a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    my_FieldSetRetainedCFType((const void **)(a1 + 104), a2);
    if (*(unsigned char *)(a1 + 16))
    {
      CFArrayRef v3 = *(__CFRunLoopSource **)(a1 + 80);
      if (v3)
      {
        CFRunLoopSourceSignal(v3);
      }
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_225F82000, logger, v5, "non-builtin trying to ack", v6, 2u);
    }
  }
}

uint64_t CNPluginStateRegister(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t PID = CommandHandlerGetPID(*(void *)a1);
  uint64_t v3 = DisplayIDCopy();
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    os_log_type_t v5 = *(const void **)(a1 + 8);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (v5
      && CFGetTypeID(v5) == TypeID
      && (CFPropertyListRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), @"DisplayName"),
          CFTypeID v8 = CFStringGetTypeID(),
          Value)
      && CFGetTypeID(Value) == v8)
    {
      CFRetain(Value);
    }
    else
    {
      CFPropertyListRef Value = _AMCopyLocalizedApplicationNameForDisplayIdentifier((uint64_t)v4);
      if (!Value)
      {
        logger = mysyslog_get_logger();
        os_log_type_t v21 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v21))
        {
          *(_DWORD *)__CFString buf = 138412546;
          *(void *)&uint8_t buf[4] = v4;
          __int16 v44 = 1024;
          LODWORD(v45) = PID;
          _os_log_impl(&dword_225F82000, logger, v21, "can't get application name for %@ (%d)", buf, 0x12u);
        }
        goto LABEL_26;
      }
    }
    CFArrayRef v9 = (const __CFArray *)_AMCopyBackgroundModesForPID(PID);
    if (v9)
    {
      CFArrayRef v10 = v9;
      CFTypeID v11 = CFArrayGetTypeID();
      if (CFGetTypeID(v10) == v11)
      {
        v47.length = CFArrayGetCount(v10);
        v47.CFIndex location = 0;
        int v12 = CFArrayContainsValue(v10, v47, @"network-authentication");
        CFRelease(v10);
        if (v12)
        {
          CommandHandlerSetInformation(*(void *)a1, v4);
          if (S_plugins)
          {
            CFDictionaryRef v13 = CFDictionaryGetValue((CFDictionaryRef)S_plugins, v4);
            if (v13)
            {
              uint64_t v14 = (uint64_t)v13;
              v13[88] = 0;
              if (*((void *)v13 + 9))
              {
                CFStringRef v15 = mysyslog_get_logger();
                os_log_type_t v16 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v15, v16))
                {
                  *(_DWORD *)__CFString buf = 138412290;
                  *(void *)&uint8_t buf[4] = v4;
                  __int16 v17 = "%@ trying to register again";
LABEL_45:
                  BOOL v24 = v15;
                  os_log_type_t v25 = v16;
                  uint32_t v26 = 12;
                  goto LABEL_24;
                }
LABEL_25:
                CFRelease(Value);
LABEL_26:
                uint64_t v14 = 0;
LABEL_27:
                CFRelease(v4);
                return v14;
              }
LABEL_39:
              *(void *)(v14 + 72) = *(void *)a1;
              CFStringRef v39 = *(const void **)(v14 + 32);
              if (v39) {
                CFRelease(v39);
              }
              *(void *)(v14 + 32) = Value;
              __int16 v40 = mysyslog_get_logger();
              os_log_type_t v41 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v40, v41))
              {
                *(_DWORD *)__CFString buf = 138412546;
                *(void *)&uint8_t buf[4] = Value;
                __int16 v44 = 2112;
                uint64_t v45 = v4;
                _os_log_impl(&dword_225F82000, v40, v41, "CaptiveNetworkPlugin %@ %@ RUNNING", buf, 0x16u);
              }
              goto LABEL_27;
            }
          }
          BOOL v28 = (const __SCPreferences *)prefs_get();
          *(void *)__CFString buf = 0;
          if (v28)
          {
            CFComparisonResult v29 = v28;
            CFDictionaryRef entry_and_plugins = prefs_get_entry_and_plugins(v28, v4, buf);
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            CFDateRef v32 = CFDateCreate(0, Current);
            if (entry_and_plugins) {
              CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, entry_and_plugins);
            }
            else {
              CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            }
            uint64_t v36 = MutableCopy;
            CFDictionaryAddValue(MutableCopy, @"DateFirstRegistered", v32);
            CFDictionarySetValue(v36, @"DisplayIdentifier", v4);
            CFDictionarySetValue(v36, @"DateLastRegistered", v32);
            CFRelease(v32);
            prefs_set_entry(v29, *(CFDictionaryRef *)buf, v4, v36);
            CFRelease(v36);
            if (SCPreferencesCommitChanges(v29))
            {
              uint64_t v14 = CNPluginStateAdd(v4);
              uint64_t v37 = mysyslog_get_logger();
              os_log_type_t v38 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v37, v38))
              {
                *(_DWORD *)__CFString buf = 138412290;
                *(void *)&uint8_t buf[4] = v4;
                _os_log_impl(&dword_225F82000, v37, v38, "CaptiveNetworkPlugin %@ REGISTERED", buf, 0xCu);
              }
              CNPluginMonitorHandlerPluginListChanged();
              if (!v14) {
                goto LABEL_25;
              }
              goto LABEL_39;
            }
          }
          else
          {
            os_log_type_t v34 = mysyslog_get_logger();
            os_log_type_t v35 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v34, v35))
            {
              *(_WORD *)__int16 v42 = 0;
              _os_log_impl(&dword_225F82000, v34, v35, "prefs is NULL", v42, 2u);
            }
          }
          CFStringRef v15 = mysyslog_get_logger();
          os_log_type_t v16 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v15, v16)) {
            goto LABEL_25;
          }
          *(_DWORD *)__CFString buf = 138412290;
          *(void *)&uint8_t buf[4] = v4;
          __int16 v17 = "failed to create registration for %@";
          goto LABEL_45;
        }
      }
      else
      {
        CFRelease(v10);
      }
    }
    char v22 = mysyslog_get_logger();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)__CFString buf = 138412546;
      *(void *)&uint8_t buf[4] = v4;
      __int16 v44 = 1024;
      LODWORD(v45) = PID;
      __int16 v17 = "CaptiveNetworkPlugin %@ [pid=%d] UIBackgroundModes missing network-authentication";
      BOOL v24 = v22;
      os_log_type_t v25 = v23;
      uint32_t v26 = 18;
LABEL_24:
      _os_log_impl(&dword_225F82000, v24, v25, v17, buf, v26);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  int v18 = mysyslog_get_logger();
  os_log_type_t v19 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v18, v19))
  {
    *(_DWORD *)__CFString buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = PID;
    _os_log_impl(&dword_225F82000, v18, v19, "can't get display ID for pid %d", buf, 8u);
  }
  return 0;
}

__CFArray *CNPluginStateCopyCommandList(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1 + 56);
  if (v2)
  {
    CFIndex Count = (__CFArray *)CFArrayGetCount(v2);
    os_log_type_t v5 = (const void **)(a1 + 64);
    CFArrayRef v4 = *(const __CFArray **)(a1 + 64);
    if (!v4)
    {
      if (!Count) {
        return Count;
      }
      goto LABEL_13;
    }
  }
  else
  {
    os_log_type_t v5 = (const void **)(a1 + 64);
    CFArrayRef v4 = *(const __CFArray **)(a1 + 64);
    if (!v4) {
      return 0;
    }
    CFIndex Count = 0;
  }
  CFIndex v6 = CFArrayGetCount(v4);
  CFIndex v7 = v6;
  if (Count) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    CFIndex Count = CFArrayCreateMutableCopy(0, (CFIndex)Count + v6, *(CFArrayRef *)(a1 + 56));
    v12.CFIndex location = 0;
    v12.length = v7;
    CFArrayAppendArray(Count, *(CFArrayRef *)(a1 + 64), v12);
    return Count;
  }
  if (!Count)
  {
    if (v6)
    {
      CFArrayRef v9 = *v5;
      goto LABEL_14;
    }
    return 0;
  }
LABEL_13:
  CFArrayRef v9 = *(const void **)(a1 + 56);
LABEL_14:

  return (__CFArray *)CFRetain(v9);
}

void CNPluginStateIssueCommand(uint64_t a1, const void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 56), a2);
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v3 = *(__CFRunLoopSource **)(a1 + 80);
    if (v3)
    {
      CFRunLoopSourceSignal(v3);
    }
    return;
  }
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v16)) {
      return;
    }
    uint64_t v17 = *(void *)(a1 + 24);
    int v21 = 138412290;
    uint64_t v22 = v17;
    CFTypeID v11 = "No command handler found for application [%@]";
    CFRange v12 = logger;
    os_log_type_t v13 = v16;
    uint32_t v14 = 12;
    goto LABEL_18;
  }
  if (!CommandHandlerNotify(*(void *)(a1 + 72)))
  {
    int v18 = mysyslog_get_logger();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v18, v19)) {
      return;
    }
    LOWORD(v21) = 0;
    CFTypeID v11 = "CommandHandlerNotify() failed";
    goto LABEL_17;
  }
  uint64_t PID = CommandHandlerGetPID(v4);
  if (*(unsigned char *)(a1 + 16) || *(void *)(a1 + 80)) {
    return;
  }
  int v6 = PID;
  id v7 = _AMCreateProcessAssertionForPID(PID);
  *(void *)(a1 + 80) = v7;
  BOOL v8 = mysyslog_get_logger();
  if (v7)
  {
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v8, v9)) {
      return;
    }
    uint64_t v10 = *(void *)(a1 + 24);
    int v21 = 138412546;
    uint64_t v22 = v10;
    __int16 v23 = 1024;
    int v24 = v6;
    CFTypeID v11 = "Created process assertion for %@ (%d)";
    CFRange v12 = v8;
    os_log_type_t v13 = v9;
    uint32_t v14 = 18;
    goto LABEL_18;
  }
  os_log_type_t v20 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v20))
  {
    int v21 = 67109120;
    LODWORD(v22) = v6;
    _os_log_impl(&dword_225F82000, v8, v20, "Failed to create process assertion for pid %d", (uint8_t *)&v21, 8u);
  }
  int v18 = mysyslog_get_logger();
  os_log_type_t v19 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v18, v19))
  {
    LOWORD(v21) = 0;
    CFTypeID v11 = "CNPluginStateSetProcessAssertion() failed";
LABEL_17:
    CFRange v12 = v18;
    os_log_type_t v13 = v19;
    uint32_t v14 = 2;
LABEL_18:
    _os_log_impl(&dword_225F82000, v12, v13, v11, (uint8_t *)&v21, v14);
  }
}

void CNPluginStateIssueForegroundCommand(uint64_t a1, const void *a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 56), a2);
    if (*(unsigned char *)(a1 + 16))
    {
      uint64_t v3 = *(__CFRunLoopSource **)(a1 + 80);
      if (v3)
      {
        CFRunLoopSourceSignal(v3);
      }
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 72);
    my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 64), a2);
    if (v4)
    {
      CommandHandlerNotify(v4);
    }
  }
}

void CNPluginStateSetNotRunning(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 16))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      uint64_t v4 = *(void *)(a1 + 24);
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_225F82000, logger, v3, "CaptiveNetworkPlugin %@ NOT RUNNING", (uint8_t *)&v7, 0xCu);
    }
    *(void *)(a1 + 72) = 0;
    os_log_type_t v5 = *(const void **)(a1 + 56);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 56) = 0;
    }
    int v6 = *(const void **)(a1 + 64);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 64) = 0;
    }
    CNPluginStateClearProcessAssertion(a1);
  }
}

void CNPluginStateClearProcessAssertion(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 16) && *(void *)(a1 + 80))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      uint64_t v4 = *(void *)(a1 + 24);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_225F82000, logger, v3, "Removing assertion for %@", (uint8_t *)&v6, 0xCu);
    }
    _AMInvalidateProcessAssertion(*(void **)(a1 + 80));
    os_log_type_t v5 = *(const void **)(a1 + 80);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 80) = 0;
    }
  }
}

CFDictionaryRef CNPluginStateGetFilterResults(uint64_t a1, const void *a2)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 40);
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, a2);
  }
  return result;
}

void CNPluginStateSetFilterResults(uint64_t a1, void *key, void *value)
{
  CFMutableDictionaryRef Mutable = *(CFMutableDictionaryRef *)(a1 + 40);
  if (Mutable)
  {
    if (!key)
    {
      CFRelease(Mutable);
      *(void *)(a1 + 40) = 0;
      return;
    }
    if (!value)
    {
      CFDictionaryRemoveValue(Mutable, key);
      return;
    }
  }
  else
  {
    if (!key || !value) {
      return;
    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(a1 + 40) = Mutable;
  }

  CFDictionarySetValue(Mutable, key, value);
}

uint64_t CNPluginStateDisableFilterCommand(uint64_t result)
{
  *(unsigned char *)(result + 48) = 1;
  return result;
}

CFDictionaryRef CNPluginStateListIssueCommand(uint64_t a1, CFArrayRef theArray)
{
  return CNPluginStateListIssueCommandCommon(a1, 0, 0, theArray);
}

CFDictionaryRef CNPluginStateListIssueCommandCommon(uint64_t a1, char a2, char a3, CFArrayRef theArray)
{
  CFDictionaryRef result = (const __CFDictionary *)S_plugins;
  if (S_plugins)
  {
    uint64_t v8 = 0;
    long long v10 = 0u;
    uint64_t v7 = a1;
    BYTE4(v8) = a2;
    BYTE5(v8) = a3;
    CFArrayRef v9 = theArray;
    if (!theArray
      || (*(void *)&long long v10 = 0,
          *((void *)&v10 + 1) = CFArrayGetCount(theArray),
          (CFDictionaryRef result = (const __CFDictionary *)S_plugins) != 0))
    {
      unsigned __int8 context = CNPluginStateAddCommandApplier;
      p_CFArrayRef theArraya = (CFArrayRef *)&v7;
      CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)CNPluginStateListApplier, &context);
      CFArrayRef theArraya = 0;
      if (S_plugins)
      {
        unsigned __int8 context = CNPluginStateLaunchApplier;
        p_CFArrayRef theArraya = &theArraya;
        CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, &context);
        CFArrayRef v6 = theArraya;
        if (theArraya)
        {
          v14.length = CFArrayGetCount(theArraya);
          v14.CFIndex location = 0;
          CFArrayApplyFunction(v6, v14, (CFArrayApplierFunction)CNPluginStateRemoveApplier, 0);
          CFRelease(theArraya);
          CNPluginMonitorHandlerPluginListChanged();
        }
      }
    }
    return v8;
  }
  return result;
}

CFDictionaryRef CNPluginStateListIssueEvaluateCommand(uint64_t a1, CFArrayRef theArray)
{
  return CNPluginStateListIssueCommandCommon(a1, 0, 1, theArray);
}

CFDictionaryRef CNPluginStateListIssueFilterCommand(uint64_t a1)
{
  return CNPluginStateListIssueCommandCommon(a1, 1, 0, 0);
}

void CNPluginStateListRemoveCommand(uint64_t a1)
{
  if (S_plugins)
  {
    v1[0] = CNPluginStateRemoveCommandApplier;
    v1[1] = a1;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, v1);
  }
}

void CNPluginStateListApplyFunction(uint64_t a1, uint64_t a2)
{
  if (S_plugins)
  {
    v2[0] = a1;
    v2[1] = a2;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, v2);
  }
}

void CNPluginStateRemoveCommandApplier(uint64_t a1, CFDictionaryRef theDict)
{
  if (*(unsigned char *)(a1 + 16))
  {
    CFPropertyListRef Value = CFDictionaryGetValue(theDict, @"UniqueID");
    if (Value) {
      CNPluginStateBuiltinRemoveDeliveredCommand(a1, Value);
    }
  }
  CFIndex v5 = my_CFArrayFindValue(*(const __CFArray **)(a1 + 56), theDict);
  if (v5 == -1)
  {
    CFIndex v6 = my_CFArrayFindValue(*(const __CFArray **)(a1 + 64), theDict);
    if (v6 != -1)
    {
      CFIndex v7 = v6;
      uint64_t v8 = *(__CFArray **)(a1 + 64);
      CFArrayRemoveValueAtIndex(v8, v7);
    }
  }
  else
  {
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 56), v5);
    if (!CFArrayGetCount(*(CFArrayRef *)(a1 + 56)))
    {
      CNPluginStateClearProcessAssertion(a1);
    }
  }
}

void CNPluginStateBuiltinFlushAllCommands(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16))
  {
    CFArrayRef v2 = *(const __CFArray **)(a1 + 56);
    if (v2 && CFArrayGetCount(v2)) {
      CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 56));
    }
    CFArrayRef v3 = *(const __CFArray **)(a1 + 88);
    if (v3 && CFArrayGetCount(v3)) {
      CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 88));
    }
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      *(_WORD *)CFIndex v6 = 0;
      _os_log_impl(&dword_225F82000, logger, v5, "flushed all the commands for builtin", v6, 2u);
    }
  }
}

void CNPluginStateListSetEvaluateCmdAckTimeoutStatus()
{
  int v0 = 3;
  if (S_plugins)
  {
    context[0] = CNPluginStateEvaluateCommandStatusApplier;
    context[1] = &v0;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, context);
  }
}

uint64_t CNPluginStateEvaluateCommandStatusApplier(uint64_t result, _DWORD *a2)
{
  if (!*(_DWORD *)(result + 112) && *a2 == 3) {
    *(_DWORD *)(result + 112) = 3;
  }
  return result;
}

uint64_t CNPluginStateListIsEvaluateResponsePending()
{
  int v1 = 0;
  uint64_t result = S_plugins;
  if (S_plugins)
  {
    context[0] = CNPluginStateCheckEvaluateResponsesPending;
    context[1] = &v1;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, context);
    return v1 > 0;
  }
  return result;
}

void CNPluginStateCheckEvaluateResponsesPending(uint64_t a1, _DWORD *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 16) && (*(unsigned char *)(a1 + 88) || !*(void *)(a1 + 72)))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v9))
    {
      uint64_t v10 = *(void *)(a1 + 24);
      if (*(unsigned char *)(a1 + 88)) {
        CFTypeID v11 = "failed to launch";
      }
      else {
        CFTypeID v11 = "launched";
      }
      uint64_t v12 = *(void *)(a1 + 72);
      int v20 = 138412802;
      uint64_t v21 = v10;
      __int16 v22 = 2080;
      if (v12) {
        os_log_type_t v13 = "handler registered";
      }
      else {
        os_log_type_t v13 = "no handler registered";
      }
      __int16 v23 = v11;
      __int16 v24 = 2080;
      uint64_t v25 = v13;
      _os_log_impl(&dword_225F82000, logger, v9, "[%@] [%s] [%s]", (uint8_t *)&v20, 0x20u);
    }
  }
  switch(*(_DWORD *)(a1 + 112))
  {
    case 0:
      uint64_t v4 = mysyslog_get_logger();
      os_log_type_t v5 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v4, v5)) {
        goto LABEL_19;
      }
      uint64_t v6 = *(void *)(a1 + 24);
      int v20 = 138412290;
      uint64_t v21 = v6;
      CFIndex v7 = "[%@] acknowledgement is pending";
      goto LABEL_18;
    case 1:
      CFRange v14 = mysyslog_get_logger();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15)) {
        return;
      }
      uint64_t v16 = *(void *)(a1 + 24);
      int v20 = 138412290;
      uint64_t v21 = v16;
      uint64_t v17 = "[%@] responded to command";
      break;
    case 2:
      uint64_t v4 = mysyslog_get_logger();
      os_log_type_t v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v18 = *(void *)(a1 + 24);
        int v20 = 138412290;
        uint64_t v21 = v18;
        CFIndex v7 = "[%@] acknowledged the command delivery";
LABEL_18:
        _os_log_impl(&dword_225F82000, v4, v5, v7, (uint8_t *)&v20, 0xCu);
      }
LABEL_19:
      ++*a2;
      return;
    case 3:
      CFRange v14 = mysyslog_get_logger();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15)) {
        return;
      }
      uint64_t v19 = *(void *)(a1 + 24);
      int v20 = 138412290;
      uint64_t v21 = v19;
      uint64_t v17 = "[%@] timed out to acknowledge the command delivery";
      break;
    default:
      return;
  }
  _os_log_impl(&dword_225F82000, v14, v15, v17, (uint8_t *)&v20, 0xCu);
}

void CNPluginStateListLogPendingCommand(uint64_t a1)
{
  if (S_plugins)
  {
    v1[0] = CNPluginStateListPrintPendingCommand;
    v1[1] = a1;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, v1);
  }
}

void CNPluginStateListPrintPendingCommand(uint64_t a1, const void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 16) && (*(unsigned char *)(a1 + 88) || !*(void *)(a1 + 72)))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v5)) {
      return;
    }
    uint64_t v8 = *(void *)(a1 + 24);
    int v9 = 138412290;
    uint64_t v10 = v8;
    CFIndex v7 = "Skipping %@ (launch failed or command handler not registered)";
    goto LABEL_9;
  }
  if (my_CFArrayFindValue(*(const __CFArray **)(a1 + 56), a2) != -1
    || my_CFArrayFindValue(*(const __CFArray **)(a1 + 64), a2) != -1)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      uint64_t v6 = *(void *)(a1 + 24);
      int v9 = 138412290;
      uint64_t v10 = v6;
      CFIndex v7 = "%@";
LABEL_9:
      _os_log_impl(&dword_225F82000, logger, v5, v7, (uint8_t *)&v9, 0xCu);
    }
  }
}

void CNPluginStateListHandleUnregistered()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (S_plugins)
  {
    *(void *)&long long v3 = CNPluginStateFindPluginsWithoutHandlers;
    *((void *)&v3 + 1) = Mutable;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, &v3);
  }
  if (CFArrayGetCount(Mutable) >= 1)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      LODWORD(v3) = 138412290;
      *(void *)((char *)&v3 + 4) = Mutable;
      _os_log_impl(&dword_225F82000, logger, v2, "Forgetting plugins that failed to register %@", (uint8_t *)&v3, 0xCu);
    }
    v5.length = CFArrayGetCount(Mutable);
    v5.CFIndex location = 0;
    CFArrayApplyFunction(Mutable, v5, (CFArrayApplierFunction)CNPluginStateRemoveApplier, 0);
    CNPluginMonitorHandlerPluginListChanged();
  }
  CFRelease(Mutable);
}

void CNPluginStateFindPluginsWithoutHandlers(uint64_t a1, __CFArray *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 16) && !*(unsigned char *)(a1 + 88) && !*(void *)(a1 + 72))
  {
    uint64_t v4 = *(const void **)(a1 + 24);
    ++*(_DWORD *)(a1 + 116);
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      int v7 = *(_DWORD *)(a1 + 116);
      int v8 = 138412546;
      int v9 = v4;
      __int16 v10 = 1024;
      int v11 = v7;
      _os_log_impl(&dword_225F82000, logger, v6, "[%@] was launched but it did not provide command handler [no registration count: %d]", (uint8_t *)&v8, 0x12u);
    }
    if (*(int *)(a1 + 116) >= 5) {
      CFArrayAppendValue(a2, v4);
    }
  }
}

const __SCPreferences *CNPluginStateRemoveApplier(void *key)
{
  if (S_plugins) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)S_plugins, key);
  }
  os_log_type_t v2 = (const __SCPreferences *)prefs_get();

  return prefs_remove_entry(v2, key);
}

uint64_t CNPluginStateListApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))a3)(a2, *(void *)(a3 + 8));
}

uint64_t CNPluginStateListShouldSendFilterCommand()
{
  unsigned __int8 v1 = 0;
  uint64_t result = S_plugins;
  if (S_plugins)
  {
    context[0] = CNPluginStateShouldSendFilterCommandApplier;
    context[1] = &v1;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, context);
    return v1;
  }
  return result;
}

uint64_t CNPluginStateShouldSendFilterCommandApplier(uint64_t result, unsigned char *a2)
{
  if (!*(unsigned char *)(result + 16) && !*(unsigned char *)(result + 48)) {
    *a2 = 1;
  }
  return result;
}

const void *CNPluginStateProcessResponse(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFPropertyListRef Value = CFDictionaryGetValue(theDict, @"UniqueID");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v8)) {
      return 0;
    }
    uint64_t v9 = *(void *)(a1 + 24);
    int v14 = 138412546;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    CFDictionaryRef v17 = theDict;
    __int16 v10 = "CaptiveNetworkPlugin %@ response %@ missing uniqueID";
LABEL_10:
    _os_log_impl(&dword_225F82000, logger, v8, v10, (uint8_t *)&v14, 0x16u);
    return 0;
  }
  if (*(unsigned char *)(a1 + 16)) {
    CNPluginStateBuiltinRemoveDeliveredCommand(a1, Value);
  }
  DictWithKeyAndCFPropertyListRef Value = my_CFArrayFindDictWithKeyAndValue(*(const __CFArray **)(a1 + 56), @"UniqueID", Value);
  if (DictWithKeyAndValue == -1)
  {
    CFIndex v12 = my_CFArrayFindDictWithKeyAndValue(*(const __CFArray **)(a1 + 64), @"UniqueID", Value);
    if (v12 != -1)
    {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 64), v12);
      return Value;
    }
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v8)) {
      return 0;
    }
    uint64_t v13 = *(void *)(a1 + 24);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    CFDictionaryRef v17 = theDict;
    __int16 v10 = "CaptiveNetworkPlugin %@ response %@ is stale";
    goto LABEL_10;
  }
  CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 56), DictWithKeyAndValue);
  if (!CFArrayGetCount(*(CFArrayRef *)(a1 + 56))) {
    CNPluginStateClearProcessAssertion(a1);
  }
  return Value;
}

BOOL CNPluginStateProcessCmdAck(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unsigned int valuePtr = 0;
  CFPropertyListRef Value = CFDictionaryGetValue(theDict, @"UniqueID");
  CFRange v5 = CFDictionaryGetValue(theDict, @"Type");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(logger, v14);
    if (!result) {
      return result;
    }
    uint64_t v16 = *(void *)(a1 + 24);
    *(_DWORD *)__CFString buf = 138412290;
    uint64_t v24 = v16;
    CFDictionaryRef v17 = "command acknowledgement from [%@] is missing uniqueID";
LABEL_13:
    _os_log_impl(&dword_225F82000, logger, v14, v17, buf, 0xCu);
    return 0;
  }
  CFTypeID v7 = CFNumberGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v7 || !CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(logger, v14);
    if (!result) {
      return result;
    }
    uint64_t v18 = *(void *)(a1 + 24);
    *(_DWORD *)__CFString buf = 138412290;
    uint64_t v24 = v18;
    CFDictionaryRef v17 = "command acknowledgement from [%@] is missing commandType";
    goto LABEL_13;
  }
  int v8 = *(_DWORD *)(a1 + 112);
  uint64_t v9 = mysyslog_get_logger();
  if (v8 == 3)
  {
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = *(void *)(a1 + 24);
      CFStringRef String = CNPCommandTypeGetString(valuePtr);
      *(_DWORD *)__CFString buf = 138412546;
      uint64_t v24 = v11;
      __int16 v25 = 2080;
      uint64_t v26 = String;
      _os_log_impl(&dword_225F82000, v9, v10, "[%@] acknowledged delivery for command %s after acknowledgement timeout", buf, 0x16u);
    }
  }
  else
  {
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v19))
    {
      uint64_t v20 = *(void *)(a1 + 24);
      uint64_t v21 = CNPCommandTypeGetString(valuePtr);
      *(_DWORD *)__CFString buf = 138412546;
      uint64_t v24 = v20;
      __int16 v25 = 2080;
      uint64_t v26 = v21;
      _os_log_impl(&dword_225F82000, v9, v19, "[%@] acknowledged delivery for command %s", buf, 0x16u);
    }
    if (valuePtr == 2) {
      *(_DWORD *)(a1 + 112) = 2;
    }
  }
  return 1;
}

CFMutableArrayRef CNPluginStateListCopyDisplayIDs()
{
  if (S_plugins) {
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)S_plugins);
  }
  else {
    CFIndex Count = 0;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
  if (S_plugins)
  {
    v3[0] = CNPluginStateAddDisplayIDToArray;
    v3[1] = Mutable;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, v3);
  }
  if (!CFArrayGetCount(Mutable))
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

void CNPluginStateAddDisplayIDToArray(uint64_t a1, CFMutableArrayRef theArray)
{
  if (!*(unsigned char *)(a1 + 16)) {
    CFArrayAppendValue(theArray, *(const void **)(a1 + 24));
  }
}

void AppUninstallationCallback(int a1, void *a2, int a3, int a4, CFDictionaryRef theDict)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  uint64_t v20 = 0;
  if (theDict)
  {
    if (S_plugins)
    {
      CFPropertyListRef Value = CFDictionaryGetValue(theDict, @"isPlaceholder");
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == TypeID && CFBooleanGetValue((CFBooleanRef)Value) != 1)
        {
          uint64_t v9 = CFDictionaryGetValue(theDict, @"bundleIDs");
          v18[3] = (uint64_t)v9;
          CFTypeID v10 = CFArrayGetTypeID();
          if (v9)
          {
            if (CFGetTypeID(v9) == v10 && CFArrayGetCount((CFArrayRef)v18[3]))
            {
              CFTypeID v11 = CFGetTypeID(a2);
              if (v11 == CFRunLoopGetTypeID())
              {
                CFRetain((CFTypeRef)v18[3]);
                CFIndex v12 = (const void *)*MEMORY[0x263EFFE88];
                block[0] = MEMORY[0x263EF8330];
                block[1] = 0x40000000;
                block[2] = __AppUninstallationCallback_block_invoke;
                block[3] = &unk_264785008;
                block[4] = &v17;
                CFRunLoopPerformBlock((CFRunLoopRef)a2, v12, block);
                CFRunLoopWakeUp((CFRunLoopRef)a2);
              }
              else
              {
                logger = mysyslog_get_logger();
                os_log_type_t v14 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(logger, v14))
                {
                  *(_WORD *)__CFString buf = 0;
                  _os_log_impl(&dword_225F82000, logger, v14, "observer does not match CFRunLoppRef type", buf, 2u);
                }
              }
            }
          }
        }
      }
    }
  }
  _Block_object_dispose(&v17, 8);
}

void __AppUninstallationCallback_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CFArrayRef v2 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  CFIndex Count = CFArrayGetCount(v2);
  CFIndex v4 = Count - 1;
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    char v7 = 1;
    while (2)
    {
      CFIndex v8 = v6;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v2, v8);
        uint64_t v13 = ValueAtIndex;
        if (S_plugins)
        {
          uint64_t v14 = 0;
          *(void *)&long long context = CompareAppIDWithPluginID;
          *((void *)&context + 1) = &v13;
          CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, &context);
          if (v14 == 1) {
            break;
          }
        }
        if (v5 == ++v8)
        {
          if (v7) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
      }
      logger = mysyslog_get_logger();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v11))
      {
        LODWORD(CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)merge_dict_applier, context) = 138412290;
        *(void *)((char *)&context + 4) = ValueAtIndex;
        _os_log_impl(&dword_225F82000, logger, v11, "cleaning up data for app %@", (uint8_t *)&context, 0xCu);
      }
      NetIFWiFiNetworkForgetAppOwnedNetworks();
      if (S_plugins) {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)S_plugins, ValueAtIndex);
      }
      CFIndex v12 = (const __SCPreferences *)prefs_get();
      prefs_remove_entry(v12, ValueAtIndex);
      char v7 = 0;
      CFIndex v6 = v8 + 1;
      if (v4 != v8) {
        continue;
      }
      break;
    }
LABEL_15:
    CNPluginMonitorHandlerPluginListChanged();
  }
LABEL_16:
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

uint64_t CompareAppIDWithPluginID(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(result + 16))
  {
    BOOL result = CFEqual(*(CFTypeRef *)a2, *(CFTypeRef *)(result + 24));
    if (result) {
      *(unsigned char *)(a2 + 8) = 1;
    }
  }
  return result;
}

const __SCPreferences *prefs_remove_entry(const __SCPreferences *a1, const void *a2)
{
  CFDictionaryRef theDict = 0;
  BOOL result = prefs_get_entry_and_plugins(a1, a2, &theDict);
  if (result)
  {
    prefs_set_entry(a1, theDict, a2, 0);
    return (const __SCPreferences *)SCPreferencesCommitChanges(a1);
  }
  return result;
}

const __SCPreferences *prefs_get_entry_and_plugins(const __SCPreferences *result, const void *a2, void *a3)
{
  if (!result)
  {
LABEL_13:
    CFPropertyListRef Value = 0;
    if (!a3) {
      return result;
    }
    goto LABEL_14;
  }
  CFPropertyListRef Value = SCPreferencesGetValue(result, @"Plugins");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!Value) {
    goto LABEL_10;
  }
  if (CFGetTypeID(Value) != TypeID)
  {
    BOOL result = 0;
    goto LABEL_13;
  }
  char v7 = (const __SCPreferences *)CFDictionaryGetValue((CFDictionaryRef)Value, a2);
  CFTypeID v8 = CFDictionaryGetTypeID();
  if (!v7)
  {
LABEL_10:
    BOOL result = 0;
    if (!a3) {
      return result;
    }
LABEL_14:
    *a3 = Value;
    return result;
  }
  if (CFGetTypeID(v7) == v8) {
    BOOL result = v7;
  }
  else {
    BOOL result = 0;
  }
  if (a3) {
    goto LABEL_14;
  }
  return result;
}

void prefs_set_entry(const __SCPreferences *a1, CFDictionaryRef theDict, const void *a3, const void *a4)
{
  if (!theDict)
  {
    if (!a4) {
      return;
    }
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    goto LABEL_6;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  CFMutableArrayRef Mutable = MutableCopy;
  if (a4)
  {
LABEL_6:
    CFDictionarySetValue(Mutable, a3, a4);
    goto LABEL_7;
  }
  CFDictionaryRemoveValue(MutableCopy, a3);
LABEL_7:
  SCPreferencesSetValue(a1, @"Plugins", Mutable);

  CFRelease(Mutable);
}

void __CNPluginStateDeallocate(uint64_t a1)
{
  CFArrayRef v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 24) = 0;
  }
  long long v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 32) = 0;
  }
  CFIndex v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 56) = 0;
  }
  CFIndex v5 = *(const void **)(a1 + 64);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 64) = 0;
  }
  CFIndex v6 = *(const void **)(a1 + 40);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 40) = 0;
  }
  CFTypeID v8 = (CFTypeRef *)(a1 + 80);
  char v7 = *(void **)(a1 + 80);
  if (!*(unsigned char *)(a1 + 16))
  {
    _AMInvalidateProcessAssertion(v7);
    CFTypeRef v11 = *v8;
    if (!*v8) {
      return;
    }
    goto LABEL_21;
  }
  if (v7)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)v7);
    CFRelease(*v8);
  }
  uint64_t v9 = *(const void **)(a1 + 88);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(a1 + 88) = 0;
  }
  CFTypeID v10 = *(const void **)(a1 + 96);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(a1 + 96) = 0;
  }
  uint64_t v13 = *(const void **)(a1 + 104);
  CFIndex v12 = (CFTypeRef *)(a1 + 104);
  CFTypeRef v11 = v13;
  if (v13)
  {
    CFTypeID v8 = v12;
LABEL_21:
    CFRelease(v11);
    *CFTypeID v8 = 0;
  }
}

CFStringRef __CNPluginStateCopyDebugDesc(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t PID = 0;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 72);
    if (v4) {
      uint64_t PID = CommandHandlerGetPID(v4);
    }
    else {
      uint64_t PID = 0xFFFFFFFFLL;
    }
  }
  return CFStringCreateWithFormat(v2, 0, @"<CNPluginState %@ pid=%d>", *(void *)(a1 + 24), PID);
}

void CNPluginStateAddCommandApplier(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a2 + 12) && (*(unsigned char *)(a1 + 16) || *(unsigned char *)(a1 + 48)))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v5)) {
      return;
    }
    CFIndex v6 = *(const void **)(a1 + 24);
    int v14 = 138412290;
    uint64_t v15 = v6;
    char v7 = "Not sending filter command to %@";
    CFTypeID v8 = logger;
    os_log_type_t v9 = v5;
LABEL_12:
    _os_log_impl(&dword_225F82000, v8, v9, v7, (uint8_t *)&v14, 0xCu);
    return;
  }
  if (*(unsigned char *)(a2 + 13)) {
    *(_DWORD *)(a1 + 112) = 0;
  }
  CFArrayRef v10 = *(const __CFArray **)(a2 + 16);
  if (v10)
  {
    CFTypeRef v11 = *(const void **)(a1 + 24);
    v17.CFIndex location = *(void *)(a2 + 24);
    v17.length = *(void *)(a2 + 32);
    if (CFArrayContainsValue(v10, v17, v11))
    {
      CFIndex v12 = mysyslog_get_logger();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v12, v13)) {
        return;
      }
      int v14 = 138412290;
      uint64_t v15 = v11;
      char v7 = "Not sending command to excluded plugin %@";
      CFTypeID v8 = v12;
      os_log_type_t v9 = v13;
      goto LABEL_12;
    }
  }
  CNPluginStateIssueCommand(a1, *(const void **)a2);
  ++*(_DWORD *)(a2 + 8);
}

void CNPluginStateLaunchApplier(uint64_t a1, CFArrayRef *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 16))
  {
    uint64_t v4 = *(const void **)(a1 + 24);
    uint64_t v5 = *(void *)(a1 + 72);
    logger = mysyslog_get_logger();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    BOOL v8 = os_log_type_enabled(logger, v7);
    if (v5)
    {
      if (!v8) {
        return;
      }
      int v18 = 138412290;
      uint64_t v19 = v4;
      os_log_type_t v9 = "Plugin %@ is already running";
      CFArrayRef v10 = logger;
      os_log_type_t v11 = v7;
      goto LABEL_14;
    }
    if (v8)
    {
      int v18 = 138412290;
      uint64_t v19 = v4;
      _os_log_impl(&dword_225F82000, logger, v7, "Launching %@ in the background", (uint8_t *)&v18, 0xCu);
    }
    int v12 = _AMLaunchApplicationWithIdentifier((uint64_t)v4, 1);
    *(unsigned char *)(a1 + 88) = 0;
    if (!v12)
    {
      int v14 = mysyslog_get_logger();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15)) {
        return;
      }
      int v18 = 138412290;
      uint64_t v19 = v4;
      os_log_type_t v9 = "Launched %@ in the background";
      goto LABEL_13;
    }
    int v13 = v12;
    if (v12 == 1)
    {
      my_CFArrayPointerAddValue(a2, v4);
      int v14 = mysyslog_get_logger();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15)) {
        return;
      }
      int v18 = 138412290;
      uint64_t v19 = v4;
      os_log_type_t v9 = "Application %@ is no longer installed";
LABEL_13:
      CFArrayRef v10 = v14;
      os_log_type_t v11 = v15;
LABEL_14:
      _os_log_impl(&dword_225F82000, v10, v11, v9, (uint8_t *)&v18, 0xCu);
      return;
    }
    uint64_t v16 = mysyslog_get_logger();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      int v18 = 138412546;
      uint64_t v19 = v4;
      __int16 v20 = 1024;
      int v21 = v13;
      _os_log_impl(&dword_225F82000, v16, v17, "_AMLaunchApplicationWithIdentifier(%@) failed, %d", (uint8_t *)&v18, 0x12u);
    }
    *(unsigned char *)(a1 + 88) = 1;
  }
}

void CNPluginStateBuiltinRemoveDeliveredCommand(uint64_t a1, const void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFArrayRef v3 = *(const __CFArray **)(a1 + 88);
  if (v3)
  {
    CFIndex Value = my_CFArrayFindValue(v3, a2);
    if (Value != -1)
    {
      CFIndex v6 = Value;
      logger = mysyslog_get_logger();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        int v9 = 138412290;
        CFArrayRef v10 = a2;
        _os_log_impl(&dword_225F82000, logger, v8, "Removing %@", (uint8_t *)&v9, 0xCu);
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 88), v6);
    }
  }
}

uint64_t CommandHandlerNotify(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 32);
  if (result)
  {
    _SC_sendMachMessage();
    return 1;
  }
  return result;
}

uint64_t CNSServerConnectionEstablish(int a1, UInt8 *bytes, unsigned int a3, mach_port_name_t a4, _DWORD *a5, int *a6, long long *a7)
{
  kern_return_t v46;
  mach_error_t v47;
  NSObject *v48;
  os_log_type_t v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  const char *v53;
  uint64_t Instance;
  __CFMachPort *v55;
  __CFRunLoop *Current;
  kern_return_t v57;
  mach_error_t v58;
  NSObject *v59;
  os_log_type_t v60;
  char *v61;
  NSObject *v62;
  os_log_type_t v63;
  mach_port_t Port;
  CFNumberRef v65;
  NSObject *v66;
  os_log_type_t v67;
  const char *v68;
  NSObject *v69;
  os_log_type_t v70;
  const char *v71;
  unsigned int (**v72)(long long *);
  const void *v73;
  long long v74;
  long long v75;
  unsigned int valuePtr;
  mach_port_name_t name[2];
  uint64_t v78;
  const void *v79;
  uint8_t buf[32];
  long long v81;
  long long v82;
  long long v83;
  uint64_t v84;

  uint64_t v84 = *MEMORY[0x263EF8340];
  unsigned int valuePtr = 0;
  *a5 = 0;
  int v9 = (ipc_space_t *)MEMORY[0x263EF8960];
  if (!bytes)
  {
    CFDictionaryGetTypeID();
    CFDataRef v14 = 0;
LABEL_12:
    char v21 = 1;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  CFDataRef v14 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, a3);
  MEMORY[0x22A643670](*v9, bytes, a3);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v14) {
    goto LABEL_12;
  }
  if (CFGetTypeID(v14) == TypeID)
  {
    CFIndex Value = CFDictionaryGetValue(v14, @"Class");
    CFTypeID v17 = CFNumberGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == v17 && CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr))
      {
        int v18 = CFDictionaryGetValue(v14, @"Information");
        CFTypeID v19 = CFDictionaryGetTypeID();
        if (v18)
        {
          if (CFGetTypeID(v18) == v19) {
            __int16 v20 = v18;
          }
          else {
            __int16 v20 = 0;
          }
        }
        else
        {
          __int16 v20 = 0;
        }
        unsigned int v24 = valuePtr;
        long long v25 = a7[1];
        unsigned int v74 = *a7;
        CFDictionaryRef v75 = v25;
        CFTypeID v78 = 0;
        CFStringRef v79 = 0;
        *(void *)name = 0;
        if (valuePtr >= 7)
        {
          logger = mysyslog_get_logger();
          os_log_type_t v27 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v27))
          {
            *(_DWORD *)__CFString buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v24;
            _os_log_impl(&dword_225F82000, logger, v27, "class %d >= kCommandHandlerClassLast", buf, 8u);
          }
          int v22 = 22;
          goto LABEL_58;
        }
        BOOL v28 = (unsigned int (**)(long long *))S_class_methods[valuePtr];
        if (!v28)
        {
          os_log_type_t v34 = mysyslog_get_logger();
          int v22 = 6;
          os_log_type_t v35 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v34, v35)) {
            goto LABEL_58;
          }
          uint64_t v36 = CommandHandlerClassString(v24);
          *(_DWORD *)__CFString buf = 136315138;
          *(void *)&uint8_t buf[4] = v36;
          uint64_t v37 = "no class handler for %s";
          os_log_type_t v38 = v34;
          os_log_type_t v39 = v35;
          goto LABEL_47;
        }
        long long v29 = a7[1];
        *(_OWORD *)__CFString buf = *a7;
        *(_OWORD *)&uint8_t buf[16] = v29;
        int pid = audit_token_get_pid(buf);
        int v73 = v20;
        if (!S_handlers || (unint64_t Count = CFDictionaryGetCount((CFDictionaryRef)S_handlers)) == 0)
        {
LABEL_43:
          if (!(*v28)(&v74))
          {
            int v51 = mysyslog_get_logger();
            double v52 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v51, v52))
            {
              os_log_type_t v53 = CommandHandlerClassString(v24);
              *(_DWORD *)__CFString buf = 136315138;
              *(void *)&uint8_t buf[4] = v53;
              _os_log_impl(&dword_225F82000, v51, v52, "class handler %s denied registration", buf, 0xCu);
            }
            int v22 = 1;
            goto LABEL_58;
          }
          uint64_t v46 = mach_port_allocate(*v9, 1u, name);
          if (v46)
          {
            CFRange v47 = v46;
            int v48 = mysyslog_get_logger();
            CFTypeID v49 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v48, v49))
            {
              int v22 = 12;
LABEL_58:
              if (a4) {
                mach_port_deallocate(*v9, a4);
              }
              goto LABEL_60;
            }
            int v50 = mach_error_string(v47);
            *(_DWORD *)__CFString buf = 136315138;
            *(void *)&uint8_t buf[4] = v50;
            uint64_t v37 = "mach_port_allocate failed, %s";
            int v22 = 12;
            os_log_type_t v38 = v48;
            os_log_type_t v39 = v49;
LABEL_47:
            _os_log_impl(&dword_225F82000, v38, v39, v37, buf, 0xCu);
            goto LABEL_58;
          }
          if (!__kCommandHandlerTypeID) {
            __kCommandHandlerCFTypeID TypeID = _CFRuntimeRegisterClass();
          }
          uint64_t Instance = _CFRuntimeCreateInstance();
          *(_OWORD *)(Instance + 16) = 0u;
          *(_OWORD *)(Instance + 32) = 0u;
          *(void *)(Instance + 48) = 0;
          os_log_type_t v55 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
          *(void *)(Instance + 16) = v55;
          if (v55)
          {
            *(void *)(Instance + 24) = CFMachPortCreateRunLoopSource(0, v55, 0);
            CFAbsoluteTime Current = CFRunLoopGetCurrent();
            CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(Instance + 24), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
            mach_port_insert_right(*v9, name[0], name[0], 0x14u);
            os_log_type_t v57 = mach_port_request_notification(*v9, name[0], 70, 1u, name[0], 0x15u, &name[1]);
            if (!v57)
            {
              *(_DWORD *)(Instance + 32) = a4;
              *(_DWORD *)(Instance + 36) = v24;
              *(_DWORD *)(Instance + 40) = pid;
              *(_OWORD *)__CFString buf = v74;
              *(_OWORD *)&uint8_t buf[16] = v75;
              *(_DWORD *)(Instance + 44) = audit_token_get_euid(buf);
              CFTypeID v78 = Instance;
              CFStringRef v79 = v73;
              mach_port_t Port = CFMachPortGetPort(*(CFMachPortRef *)(Instance + 16));
              if (!S_handlers) {
                S_handlers = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              }
              *(_DWORD *)__CFString buf = Port;
              CFStringRef v65 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, buf);
              CFDictionarySetValue((CFMutableDictionaryRef)S_handlers, v65, (const void *)Instance);
              CFRelease(v65);
              if (v28[1]((long long *)&v78))
              {
                uint64_t v66 = mysyslog_get_logger();
                double v67 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v66, v67))
                {
                  os_log_type_t v68 = CommandHandlerClassString(v24);
                  *(_DWORD *)__CFString buf = 136315394;
                  *(void *)&uint8_t buf[4] = v68;
                  *(_WORD *)&unsigned char buf[12] = 1024;
                  *(_DWORD *)&buf[14] = pid;
                  _os_log_impl(&dword_225F82000, v66, v67, "CommandHandlerServer: %s pid %d registered", buf, 0x12u);
                }
                int v22 = 0;
              }
              else
              {
                name[0] = 0;
                remove_handler(Instance);
                os_log_type_t v69 = mysyslog_get_logger();
                BOOL v70 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v69, v70))
                {
                  CFStringRef v71 = CommandHandlerClassString(v24);
                  *(_DWORD *)__CFString buf = 136315394;
                  *(void *)&uint8_t buf[4] = v71;
                  *(_WORD *)&unsigned char buf[12] = 1024;
                  *(_DWORD *)&buf[14] = pid;
                  _os_log_impl(&dword_225F82000, v69, v70, "Registering %s pid %d FAILED", buf, 0x12u);
                }
                int v22 = 22;
              }
              goto LABEL_73;
            }
            CFStringRef v58 = v57;
            name[0] = 0;
            os_log_type_t v59 = mysyslog_get_logger();
            CFStringRef v60 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v59, v60))
            {
              uint64_t v61 = mach_error_string(v58);
              *(_DWORD *)__CFString buf = 136315138;
              *(void *)&uint8_t buf[4] = v61;
              int v22 = 12;
              _os_log_impl(&dword_225F82000, v59, v60, "request MACH_NOTIFY_NO_SENDERS failed, %s", buf, 0xCu);
LABEL_73:
              CFRelease((CFTypeRef)Instance);
LABEL_60:
              *a5 = name[0];
              goto LABEL_15;
            }
          }
          else
          {
            os_log_type_t v62 = mysyslog_get_logger();
            CFAbsoluteTime v63 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v62, v63))
            {
              *(_WORD *)__CFString buf = 0;
              _os_log_impl(&dword_225F82000, v62, v63, "failed to create session port", buf, 2u);
            }
          }
          int v22 = 12;
          goto LABEL_73;
        }
        uint64_t v32 = Count;
        uint64_t v72 = v28;
        os_log_type_t v82 = 0u;
        CFStringRef v83 = 0u;
        uint64_t v81 = 0u;
        memset(buf, 0, sizeof(buf));
        if (Count <= 0xA)
        {
          CFTypeID v33 = (const void **)buf;
          CFDictionaryGetKeysAndValues((CFDictionaryRef)S_handlers, 0, (const void **)buf);
        }
        else
        {
          CFTypeID v33 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
          CFDictionaryGetKeysAndValues((CFDictionaryRef)S_handlers, 0, v33);
          if (v32 < 1)
          {
LABEL_36:
            os_log_type_t v41 = 0;
            goto LABEL_37;
          }
        }
        uint64_t v40 = 0;
        while (1)
        {
          os_log_type_t v41 = v33[v40];
          if (v41[10] == pid) {
            break;
          }
          if (v32 == ++v40) {
            goto LABEL_36;
          }
        }
LABEL_37:
        if (v33 != (const void **)buf) {
          free(v33);
        }
        BOOL v28 = v72;
        if (v41)
        {
          __int16 v42 = mysyslog_get_logger();
          os_log_type_t v43 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v42, v43))
          {
            __int16 v44 = CommandHandlerClassString(v41[9]);
            uint64_t v45 = CommandHandlerClassString(v24);
            *(_DWORD *)__CFString buf = 67109634;
            *(_DWORD *)&uint8_t buf[4] = pid;
            *(_WORD *)&uint8_t buf[8] = 2080;
            *(void *)&buf[10] = v44;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v45;
            _os_log_impl(&dword_225F82000, v42, v43, "pid %d class %s trying to register again as class %s", buf, 0x1Cu);
          }
          int v22 = 16;
          goto LABEL_58;
        }
        goto LABEL_43;
      }
    }
  }
  char v21 = 0;
  if (a4) {
LABEL_13:
  }
    mach_port_deallocate(*v9, a4);
LABEL_14:
  int v22 = 22;
  if ((v21 & 1) == 0) {
LABEL_15:
  }
    CFRelease(v14);
  *a6 = v22;
  return 0;
}

uint64_t CNSServerConnectionProvideResponse(int a1, UInt8 *a2, unsigned int a3, int *a4)
{
  return 0;
}

void CNSServerConnectionHandleType(int a1, int a2, UInt8 *a3, unsigned int a4, const __CFData **a5, _DWORD *a6, int *a7)
{
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  handler = (unsigned int *)get_handler(a1);
  if (handler)
  {
    CFDataRef v14 = handler;
    if (a3)
    {
      CFDataRef v15 = my_CFPropertyListCreateWithBytePtrAndLength(a3, a4);
      MEMORY[0x22A643670](*MEMORY[0x263EF8960], a3, a4);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (!v15)
      {
LABEL_36:
        int v17 = 22;
        goto LABEL_37;
      }
      if (CFGetTypeID(v15) != TypeID)
      {
        int v17 = 22;
LABEL_18:
        CFRelease(v15);
        goto LABEL_37;
      }
    }
    else
    {
      CFDataRef v15 = 0;
    }
    uint64_t v18 = v14[9];
    if (v18 <= 6 && (CFTypeID v19 = (uint64_t (**)(unsigned int **))S_class_methods[v18]) != 0)
    {
      switch(a2)
      {
        case 0:
          long long v25 = v14;
          CFDataRef v26 = 0;
          int v20 = v19[3](&v25);
          CFDataRef v21 = v26;
          goto LABEL_23;
        case 1:
          if (!v15) {
            goto LABEL_36;
          }
          long long v25 = v14;
          CFDataRef v26 = v15;
          int v22 = v19[4](&v25);
          goto LABEL_39;
        case 2:
          if (!v15) {
            goto LABEL_36;
          }
          long long v25 = v14;
          CFDataRef v26 = v15;
          CFDataRef v27 = 0;
          int v20 = v19[5](&v25);
          CFDataRef v21 = v27;
LABEL_23:
          if (v20) {
            CFDataRef v23 = v21;
          }
          else {
            CFDataRef v23 = 0;
          }
          if (v20) {
            goto LABEL_27;
          }
          goto LABEL_40;
        case 3:
          if (!v15) {
            goto LABEL_36;
          }
          long long v25 = v14;
          CFDataRef v26 = v15;
          unsigned int v24 = v19[6];
          if (v24) {
            int v22 = v24(&v25);
          }
          else {
            int v22 = 0;
          }
LABEL_39:
          CFDataRef v23 = 0;
          if (!v22) {
            goto LABEL_40;
          }
LABEL_27:
          if (v23)
          {
            if (a5) {
              *a5 = my_CFPropertyListCreateVMData(v23, a6);
            }
            CFRelease(v23);
          }
          int v17 = 0;
          break;
        default:
LABEL_40:
          int v17 = 22;
          break;
      }
    }
    else
    {
      int v17 = 6;
    }
    if (v15) {
      goto LABEL_18;
    }
  }
  else
  {
    int v17 = 2;
  }
LABEL_37:
  *a7 = v17;
}

uint64_t CNSServerConnectionSendCmdAck(int a1, UInt8 *a2, unsigned int a3, int *a4)
{
  return 0;
}

uint64_t CNSServerConnectionProcessControl(int a1, UInt8 *a2, unsigned int a3, const __CFData **a4, _DWORD *a5, int *a6)
{
  return 0;
}

uint64_t CNSServerConnectionGetCommandInfo(int a1, const __CFData **a2, _DWORD *a3, int *a4)
{
  return 0;
}

uint64_t CommandHandlerGetPID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t CommandHandlerGetUID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

void CommandHandlerSetInformation(uint64_t a1, const void *a2)
{
}

uint64_t CommandHandlerGetInformation(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

void CommandHandlerListApplyFunction(unsigned int a1, uint64_t a2, uint64_t a3)
{
  if (S_handlers)
  {
    context[1] = a2;
    context[0] = a1;
    void context[2] = a3;
    CFDictionaryApplyFunction((CFDictionaryRef)S_handlers, (CFDictionaryApplierFunction)CommandHandlerListApplier, context);
  }
}

uint64_t CommandHandlerListApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_DWORD *)a3 || *(_DWORD *)a3 == *(_DWORD *)(a2 + 36)) {
    return (*(uint64_t (**)(uint64_t, void))(a3 + 8))(a2, *(void *)(a3 + 16));
  }
  return result;
}

void CommandHandlerClassRegister(unsigned int a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1 >= 7)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v4)) {
      return;
    }
    int v6 = 136315138;
    os_log_type_t v7 = CommandHandlerClassString(a1);
    uint64_t v5 = "Class Handler for %s NOT Registered";
    goto LABEL_7;
  }
  S_class_methods[a1] = a2;
  if (CaptiveIsDebug())
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      int v6 = 136315138;
      os_log_type_t v7 = CommandHandlerClassString(a1);
      uint64_t v5 = "Class Handler for %s Registered";
LABEL_7:
      _os_log_impl(&dword_225F82000, logger, v4, v5, (uint8_t *)&v6, 0xCu);
    }
  }
}

void command_handler_server(uint64_t a1, mach_msg_header_t *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFArrayRef v3 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], dword_26D9AAAC0, 0);
  if (!CNSServer_server(a2, (uint64_t)v3) && a2->msgh_id == 70)
  {
    mach_port_name_t msgh_local_port = a2->msgh_local_port;
    handler = (unsigned int *)get_handler(msgh_local_port);
    if (handler)
    {
      uint64_t v6 = (uint64_t)handler;
      uint64_t v7 = handler[9];
      logger = mysyslog_get_logger();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v9))
      {
        CFArrayRef v10 = CommandHandlerClassString(v7);
        int v11 = *(_DWORD *)(v6 + 40);
        int v15 = 136315394;
        uint64_t v16 = v10;
        __int16 v17 = 1024;
        int v18 = v11;
        _os_log_impl(&dword_225F82000, logger, v9, "CommandHandlerServer: %s pid %d died", (uint8_t *)&v15, 0x12u);
      }
      if (v7 <= 6)
      {
        uint64_t v12 = S_class_methods[v7];
        if (v12) {
          (*(void (**)(uint64_t))(v12 + 16))(v6);
        }
      }
      remove_handler(v6);
      mach_port_mod_refs(*MEMORY[0x263EF8960], msgh_local_port, 1u, -1);
    }
  }
  if ((v3->msgh_bits & 0x80000000) == 0)
  {
    mach_port_t msgh_remote_port = v3[1].msgh_remote_port;
    if (msgh_remote_port == -305) {
      goto LABEL_20;
    }
    if (msgh_remote_port)
    {
      a2->mach_port_t msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
  }
  if (!v3->msgh_remote_port)
  {
    if ((v3->msgh_bits & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if ((v3->msgh_bits & 0x1F) == 0x12) {
    mach_msg_option_t v14 = 1;
  }
  else {
    mach_msg_option_t v14 = 17;
  }
  if ((mach_msg(v3, v14, v3->msgh_size, 0, 0, 0, 0) - 268435459) <= 1) {
LABEL_19:
  }
    mach_msg_destroy(v3);
LABEL_20:
  CFAllocatorDeallocate(0, v3);
}

void remove_handler(uint64_t a1)
{
  mach_port_t valuePtr = CFMachPortGetPort(*(CFMachPortRef *)(a1 + 16));
  CFNumberRef v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)S_handlers, v1);
  CFRelease(v1);
}

void __CommandHandlerDeallocate(uint64_t a1)
{
  CFAllocatorRef v2 = *(__CFRunLoopSource **)(a1 + 24);
  if (v2)
  {
    CFRunLoopSourceInvalidate(v2);
    CFRelease(*(CFTypeRef *)(a1 + 24));
  }
  CFArrayRef v3 = *(__CFMachPort **)(a1 + 16);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 16));
  }
  mach_port_name_t v4 = *(_DWORD *)(a1 + 32);
  if (v4) {
    mach_port_deallocate(*MEMORY[0x263EF8960], v4);
  }

  my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
}

CFStringRef __CommandHandlerCopyDebugDesc(unsigned int *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFArrayRef v3 = CommandHandlerClassString(a1[9]);
  return CFStringCreateWithFormat(v2, 0, @"<CommandHandler %s pid %d>", v3, a1[10]);
}

const void *get_handler(int a1)
{
  if (!S_handlers) {
    return 0;
  }
  int valuePtr = a1;
  CFNumberRef v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  CFIndex Value = CFDictionaryGetValue((CFDictionaryRef)S_handlers, v1);
  CFRelease(v1);
  return Value;
}

double TimerCreate()
{
  int v0 = malloc_type_malloc(0x28uLL, 0xA00400EBEDA77uLL);
  if (v0)
  {
    v0[4] = 0;
    double result = 0.0;
    *(_OWORD *)int v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void TimerRelease(uint64_t *a1)
{
  CFNumberRef v1 = (void *)*a1;
  if (*a1)
  {
    TimerCancel(*a1);
    free(v1);
    *a1 = 0;
  }
}

void TimerCancel(uint64_t a1)
{
  if (a1)
  {
    *(void *)a1 = 0;
    if (*(void *)(a1 + 32))
    {
      logger = mysyslog_get_logger();
      os_log_type_t v3 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v3))
      {
        *(_WORD *)mach_port_name_t v4 = 0;
        _os_log_impl(&dword_225F82000, logger, v3, "timer: freeing timer source", v4, 2u);
      }
      CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(a1 + 32));
      CFRelease(*(CFTypeRef *)(a1 + 32));
      *(void *)(a1 + 32) = 0;
    }
  }
}

void TimerSet(CFRunLoopTimerRef *a1, __CFRunLoopTimer *a2, __CFRunLoopTimer *a3, __CFRunLoopTimer *a4, __CFRunLoopTimer *a5, double a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  memset(&v16, 0, sizeof(v16));
  if (a1)
  {
    TimerCancel((uint64_t)a1);
    if (a2)
    {
      *a1 = a2;
      a1[1] = a3;
      a1[2] = a4;
      a1[3] = a5;
      v16.info = a1;
      double v12 = CFAbsoluteTimeGetCurrent() + a6;
      a1[4] = CFRunLoopTimerCreate(0, v12, 0.0, 0, 0, (CFRunLoopTimerCallBack)TimerProcess, &v16);
      logger = mysyslog_get_logger();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v14))
      {
        *(_DWORD *)__CFString buf = 134218240;
        double v18 = a6;
        __int16 v19 = 2048;
        double v20 = v12;
        _os_log_impl(&dword_225F82000, logger, v14, "timer: wakeup time is (%0.09g) %0.09g", buf, 0x16u);
      }
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(Current, a1[4], (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
  }
}

uint64_t TimerProcess(uint64_t a1, uint64_t a2)
{
  CFAllocatorRef v2 = *(uint64_t (**)(void, void, void))a2;
  if (*(void *)a2)
  {
    *(void *)a2 = 0;
    return v2(*(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
  }
  return result;
}

void ThirdPartyAppRegisterSSIDs(void *key, void *value)
{
  CFMutableArrayRef Mutable = (__CFDictionary *)S_appID_list;
  if (!S_appID_list)
  {
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    S_appID_list = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, key, value);

  BuildSSIDLookup();
}

void BuildSSIDLookup()
{
  if (S_ssid_list)
  {
    CFRelease((CFTypeRef)S_ssid_list);
    S_ssid_list = 0;
  }
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  S_ssid_list = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRef Mutable = (const __CFDictionary *)S_appID_list;
  if (!S_appID_list)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(v0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    S_appID_list = (uint64_t)Mutable;
  }

  CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)AppIDAddSSIDList, 0);
}

const void *ThirdPartyAppCopyIDsForSSID(void *key)
{
  CFIndex Value = 0;
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (key)
  {
    if (S_ssid_list)
    {
      CFIndex Value = CFDictionaryGetValue((CFDictionaryRef)S_ssid_list, key);
      if (Value)
      {
        logger = mysyslog_get_logger();
        os_log_type_t v3 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v3))
        {
          int v5 = 138412290;
          uint64_t v6 = Value;
          _os_log_impl(&dword_225F82000, logger, v3, "The current ssid is found in ssidLookup: %@", (uint8_t *)&v5, 0xCu);
        }
        CFRetain(Value);
      }
    }
  }
  return Value;
}

void ThirdPartyAppRemoveSSIDs(void *key)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFDictionaryRef Mutable = (const __CFDictionary *)S_appID_list;
  if (!S_appID_list)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    S_appID_list = (uint64_t)Mutable;
  }
  if (CFDictionaryContainsKey(Mutable, key))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      int v6 = 138412290;
      uint64_t v7 = key;
      _os_log_impl(&dword_225F82000, logger, v4, "Removing SSID registrations for %@", (uint8_t *)&v6, 0xCu);
    }
    int v5 = (__CFDictionary *)S_appID_list;
    if (!S_appID_list)
    {
      int v5 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      S_appID_list = (uint64_t)v5;
    }
    CFDictionaryRemoveValue(v5, key);
    BuildSSIDLookup();
  }
}

void ThirdPartyAppHandlerInitialize()
{
}

void AppIDAddSSIDList(void *a1, CFArrayRef theArray)
{
  v4.length = CFArrayGetCount(theArray);
  v4.CFIndex location = 0;

  CFArrayApplyFunction(theArray, v4, (CFArrayApplierFunction)SSIDAddAppID, a1);
}

void SSIDAddAppID(void *key, const void *a2)
{
  CFIndex Value = (void *)CFDictionaryGetValue((CFDictionaryRef)S_ssid_list, key);
  if (!Value)
  {
    CFIndex Value = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    CFDictionaryAddValue((CFMutableDictionaryRef)S_ssid_list, key, Value);
    CFRelease(Value);
  }

  CFArrayAppendValue((CFMutableArrayRef)Value, a2);
}

uint64_t ThirdPartyAppAuthorize()
{
  return 1;
}

uint64_t ThirdPartyAppRegister()
{
  return 1;
}

void ThirdPartyAppRemove(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t PID = CommandHandlerGetPID(a1);
  logger = mysyslog_get_logger();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    v5[0] = 67109120;
    v5[1] = PID;
    _os_log_impl(&dword_225F82000, logger, v3, "Third party app died %d", (uint8_t *)v5, 8u);
  }
  CFRange v4 = (void *)DisplayIDCopy(PID);
  ThirdPartyAppRemoveSSIDs(v4);
  CFRelease(v4);
}

uint64_t ThirdPartyAppProvideCommand()
{
  return 0;
}

uint64_t ThirdPartyAppProcessResponse()
{
  return 0;
}

uint64_t ThirdPartyAppProcessControl()
{
  return 0;
}

double CCPGetUnwhitelistedNetworkProbeIntervalRange()
{
  return 259200.0;
}

double CCPGetUnwhitelistedNetworkProbeInterval()
{
  double v3 = 259200.0;
  int Number = CaptivePrefsGetNumber(@"UnwhitelistedNetworkProbeInterval", &v3);
  double result = v3;
  if (v3 < 60.0 || Number == 0) {
    return 259200.0;
  }
  return result;
}

uint64_t CCPSetUnwhitelistedNetworkProbeInterval(double a1)
{
  if (a1 < 60.0) {
    return 0;
  }
  CaptivePrefsSetNumber(@"UnwhitelistedNetworkProbeInterval", a1);
  return 1;
}

const __SCPreferences *CCPUnsetUnwhitelistedNetworkProbeInterval()
{
  return CaptivePrefsUnset(@"UnwhitelistedNetworkProbeInterval");
}

double CCPGetWhitelistedNetworkProbeIntervalRange()
{
  return 86400.0;
}

double CCPGetWhitelistedNetworkProbeInterval()
{
  double v3 = 86400.0;
  int Number = CaptivePrefsGetNumber(@"WhitelistedNetworkProbeInterval", &v3);
  double result = v3;
  if (v3 < 60.0 || Number == 0) {
    return 86400.0;
  }
  return result;
}

uint64_t CCPSetWhitelistedNetworkProbeInterval(double a1)
{
  if (a1 < 60.0) {
    return 0;
  }
  CaptivePrefsSetNumber(@"WhitelistedNetworkProbeInterval", a1);
  return 1;
}

const __SCPreferences *CCPUnsetWhitelistedNetworkProbeInterval()
{
  return CaptivePrefsUnset(@"WhitelistedNetworkProbeInterval");
}

double CCPGetBrokenBackhaulProbeIntervalRange()
{
  return 300.0;
}

double CCPGetBrokenBackhaulProbeInterval()
{
  double v1 = 300.0;
  if (!CaptivePrefsGetNumber(@"BrokenBackhaulProbeInterval", &v1)) {
    return 300.0;
  }
  double result = v1;
  if (v1 < 5.0 || v1 > 3600.0) {
    return 300.0;
  }
  return result;
}

uint64_t CCPSetBrokenBackhaulProbeInterval(double a1)
{
  uint64_t result = 0;
  if (a1 >= 5.0 && a1 <= 3600.0)
  {
    CaptivePrefsSetNumber(@"BrokenBackhaulProbeInterval", a1);
    return 1;
  }
  return result;
}

const __SCPreferences *CCPUnsetBrokenBackhaulProbeInterval()
{
  return CaptivePrefsUnset(@"BrokenBackhaulProbeInterval");
}

double CCPGetBrokenBackhaulProbeTimeoutRange()
{
  return 20.0;
}

double CCPGetBrokenBackhaulProbeTimeout()
{
  double v2 = 20.0;
  if (!CaptivePrefsGetNumber(@"BrokenBackhaulProbeTimeout", &v2)) {
    return 20.0;
  }
  double result = v2;
  if (v2 < 5.0 || v2 > 120.0) {
    return 20.0;
  }
  return result;
}

uint64_t CCPSetBrokenBackhaulProbeTimeout(double a1)
{
  if (a1 < 5.0 || a1 > 120.0) {
    return 0;
  }
  CaptivePrefsSetNumber(@"BrokenBackhaulProbeTimeout", a1);
  return 1;
}

const __SCPreferences *CCPUnsetBrokenBackhaulProbeTimeout()
{
  return CaptivePrefsUnset(@"BrokenBackhaulProbeTimeout");
}

double CCPGetBrokenBackhaulPromptInterval()
{
  double v3 = 86400.0;
  int Number = CaptivePrefsGetNumber(@"BrokenBackhaulPromptInterval", &v3);
  double result = v3;
  if (v3 < 60.0 || Number == 0) {
    return 86400.0;
  }
  return result;
}

uint64_t CCPSetBrokenBackhaulPromptInterval(double a1)
{
  if (a1 < 60.0) {
    return 0;
  }
  CaptivePrefsSetNumber(@"BrokenBackhaulPromptInterval", a1);
  return 1;
}

const __SCPreferences *CCPUnsetBrokenBackhaulPromptInterval()
{
  return CaptivePrefsUnset(@"BrokenBackhaulPromptInterval");
}

uint64_t CCPGetWhitelistedNetworkDetectionEnabled()
{
  return CaptivePrefsGetBoolean(@"WhitelistedNetworkDetectionEnabled", 1);
}

const __SCPreferences *CCPSetWhitelistedNetworkDetectionEnabled(int a1)
{
  return CaptivePrefsSetBoolean(@"WhitelistedNetworkDetectionEnabled", a1);
}

const __SCPreferences *CCPUnsetWhitelistedNetworkDetectionEnabled()
{
  return CaptivePrefsUnset(@"WhitelistedNetworkDetectionEnabled");
}

uint64_t CCPGetWhitelistedProtectedNetworkDetectionEnabled()
{
  return CaptivePrefsGetBoolean(@"WhitelistedProtectedNetworkDetectionEnabled", 0);
}

const __SCPreferences *CCPSetWhitelistedProtectedNetworkDetectionEnabled(int a1)
{
  return CaptivePrefsSetBoolean(@"WhitelistedProtectedNetworkDetectionEnabled", a1);
}

const __SCPreferences *CCPUnsetWhitelistedProtectedNetworkDetectionEnabled()
{
  return CaptivePrefsUnset(@"WhitelistedProtectedNetworkDetectionEnabled");
}

double CCPGetWebSheetLoginValidityIntervalRange()
{
  return 2592000.0;
}

double CCPGetWebSheetLoginValidityInterval()
{
  double v1 = 2592000.0;
  if (!CaptivePrefsGetNumber(@"WebSheetLoginValidityInterval", &v1)) {
    return 2592000.0;
  }
  double result = v1;
  if (v1 < 15.0 || v1 > 2592000.0) {
    return 2592000.0;
  }
  return result;
}

uint64_t CCPSetWebSheetLoginValidityInterval(double a1)
{
  uint64_t result = 0;
  if (a1 >= 15.0 && a1 <= 2592000.0)
  {
    CaptivePrefsSetNumber(@"WebSheetLoginValidityInterval", a1);
    return 1;
  }
  return result;
}

const __SCPreferences *CCPUnsetWebSheetLoginValidityInterval()
{
  return CaptivePrefsUnset(@"WebSheetLoginValidityInterval");
}

double CCPGetWebSheetInSetupDismissalIntervalRange()
{
  return 1800.0;
}

double CCPGetWebSheetInSetupDismissalInterval()
{
  double v1 = 1800.0;
  if (!CaptivePrefsGetNumber(@"WebSheetInSetupDismissalInterval", &v1)) {
    return 1800.0;
  }
  double result = v1;
  if (v1 < 300.0 || v1 > 3600.0) {
    return 1800.0;
  }
  return result;
}

uint64_t CCPSetWebSheetInSetupDismissalInterval(double a1)
{
  uint64_t result = 0;
  if (a1 >= 300.0 && a1 <= 3600.0)
  {
    CaptivePrefsSetNumber(@"WebSheetInSetupDismissalInterval", a1);
    return 1;
  }
  return result;
}

const __SCPreferences *CCPUnsetWebSheetInSetupDismissalInterval()
{
  return CaptivePrefsUnset(@"WebSheetInSetupDismissalInterval");
}

uint64_t CaptiveSymptomFramework()
{
  uint64_t result = CaptiveSymptomFramework_framework;
  if (!CaptiveSymptomFramework_framework)
  {
    uint64_t result = symptom_framework_init();
    CaptiveSymptomFramework_framework = result;
  }
  return result;
}

uint64_t CaptiveSymptomEnablePassiveDetection(int a1, uint64_t a2)
{
  if (!CaptiveSymptomFramework_framework) {
    CaptiveSymptomFramework_framework = symptom_framework_init();
  }
  symptom_new();
  uint64_t result = symptom_send();
  if (a1)
  {
    if (!CaptiveSymptomFramework_framework) {
      CaptiveSymptomFramework_framework = symptom_framework_init();
    }
    symptom_new();
    if (a2)
    {
      int v5 = (const char *)_SC_cfstring_to_cstring();
      if (v5)
      {
        uint64_t v6 = (char *)v5;
        strlen(v5);
        symptom_set_additional_qualifier();
        CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v6);
      }
    }
    return symptom_send();
  }
  return result;
}

uint64_t CaptiveSymptomReportCaptiveState()
{
  if (!CaptiveSymptomFramework_framework) {
    CaptiveSymptomFramework_framework = symptom_framework_init();
  }
  symptom_new();
  symptom_set_qualifier();
  symptom_set_qualifier();

  return symptom_send();
}

uint64_t CaptiveSymptomReportInconclusiveCaptiveEvaluation()
{
  if (!CaptiveSymptomFramework_framework) {
    CaptiveSymptomFramework_framework = symptom_framework_init();
  }
  symptom_new();

  return symptom_send();
}

uint64_t CaptiveSymptomReportBackhaulState()
{
  if (!CaptiveSymptomFramework_framework) {
    CaptiveSymptomFramework_framework = symptom_framework_init();
  }
  symptom_new();
  symptom_set_qualifier();
  symptom_set_qualifier();

  return symptom_send();
}

uint64_t CaptiveSymptomScheduleEventFetch(int a1, void *aBlock)
{
  double v2 = _Block_copy(aBlock);
  uint64_t v3 = managed_event_fetch();
  if ((v3 & 1) == 0) {
    _Block_release(v2);
  }
  return v3;
}

void __CaptiveSymptomScheduleEventFetch_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a2)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      int v18 = 67109120;
      LODWORD(v19) = a2;
      _os_log_impl(&dword_225F82000, logger, v6, "managed_event_fetch failed %d", (uint8_t *)&v18, 8u);
    }
  }
  else if (a3)
  {
    uint64_t v8 = (const void *)a3[6];
    uint64_t v9 = a3[4];
    CFArrayRef v10 = mysyslog_get_logger();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = a3[1];
      uint64_t v13 = a3[2];
      uint64_t v14 = a3[3];
      uint64_t v15 = a3[5];
      int v18 = 134219266;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      uint64_t v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2080;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      long long v29 = v8;
      _os_log_impl(&dword_225F82000, v10, v11, "managed_event_fetch:\nid = %lld\nclass = %s\ntime = %f\ncause = %s\ncode = %lld\nadditional info = %@", (uint8_t *)&v18, 0x3Eu);
    }
    CFDictionaryGetTypeID();
    if (v8) {
      CFGetTypeID(v8);
    }
  }
  else
  {
    CFRunLoopTimerContext v16 = mysyslog_get_logger();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_225F82000, v16, v17, "managed_event_fetch returned NULL event", (uint8_t *)&v18, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

const char *CommandHandlerClassString(unsigned int a1)
{
  if (a1 <= 6) {
    return CommandHandlerClassString_strings[a1];
  }
  else {
    return "<unknown>";
  }
}

void NetIFRetainWiFiAssertion()
{
  int v0 = S_assertion_refcount++;
  if (!v0 && getWiFiManagerClient())
  {
    logger = mysyslog_get_logger();
    os_log_type_t v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_225F82000, logger, v2, "NetIFRetainWiFiAssertion", v3, 2u);
    }
    WiFiManagerClientSetType();
  }
}

uint64_t getWiFiManagerClient()
{
  if (!getWiFiManagerClient_client)
  {
    getWiFiManagerClient_client = WiFiManagerClientCreate();
    if (!getWiFiManagerClient_client)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v1 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v1))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl(&dword_225F82000, logger, v1, "Failed to create a WiFiManager client", v3, 2u);
      }
    }
  }
  return getWiFiManagerClient_client;
}

void NetIFReleaseWiFiAssertion()
{
  int v0 = S_assertion_refcount;
  if (S_assertion_refcount)
  {
    --S_assertion_refcount;
    if (v0 == 1 && getWiFiManagerClient())
    {
      logger = mysyslog_get_logger();
      os_log_type_t v2 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v2))
      {
        *(_WORD *)int v5 = 0;
        _os_log_impl(&dword_225F82000, logger, v2, "NetIFReleaseWiFiAssertion", v5, 2u);
      }
      WiFiManagerClientSetType();
    }
  }
  else
  {
    uint64_t v3 = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)__CFString buf = 0;
      _os_log_impl(&dword_225F82000, v3, v4, "NetIFReleaseWiFiAssertion: Assertion count is zero!", buf, 2u);
    }
  }
}

void NetIFWiFiSetProperty(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (getWiFiManagerClient() && !WiFiManagerClientSetNetworkProperty())
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      int v5 = 138412290;
      uint64_t v6 = a2;
      _os_log_impl(&dword_225F82000, logger, v4, "WiFiManagerClientSetNetworkProperty returned FALSE for property [%@]", (uint8_t *)&v5, 0xCu);
    }
  }
}

void NetIFSetRankNever(const __SCNetworkInterface *a1)
{
}

void NetIFSetRank(const __SCNetworkInterface *a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  CFStringRef BSDName = SCNetworkInterfaceGetBSDName(a1);
  if (a2 == 3) {
    os_log_type_t v4 = "Never";
  }
  else {
    os_log_type_t v4 = "Default";
  }
  if (SCNetworkInterfaceSetPrimaryRank())
  {
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v6)) {
      return;
    }
    int v14 = 138412546;
    CFStringRef v15 = BSDName;
    __int16 v16 = 2080;
    os_log_type_t v17 = v4;
    uint64_t v7 = "%@: set Rank%s";
    uint64_t v8 = logger;
    os_log_type_t v9 = v6;
    uint32_t v10 = 22;
  }
  else
  {
    int v11 = SCError();
    uint64_t v12 = mysyslog_get_logger();
    os_log_type_t v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v12, v13)) {
      return;
    }
    int v14 = 138412802;
    CFStringRef v15 = BSDName;
    __int16 v16 = 2080;
    os_log_type_t v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = SCErrorString(v11);
    uint64_t v7 = "SCNetworkInterfaceSetPrimaryRank(%@, %s) failed, %s";
    uint64_t v8 = v12;
    os_log_type_t v9 = v13;
    uint32_t v10 = 32;
  }
  _os_log_impl(&dword_225F82000, v8, v9, v7, (uint8_t *)&v14, v10);
}

void NetIFSetRankDefault(const __SCNetworkInterface *a1)
{
}

uint64_t NetIFCopyNetworkInterface()
{
  return _SCNetworkInterfaceCopyActive();
}

uint64_t NetIFSetNewInterfaceCallBack(uint64_t result)
{
  os_log_type_t v1 = (void *)result;
  if (!S_store)
  {
    CFDictionaryRef v2 = CFDictionaryCreate(0, MEMORY[0x263F1BC18], MEMORY[0x263EFFB40], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    SCDynamicStoreRef v3 = SCDynamicStoreCreateWithOptions(0, @"Captive", v2, 0, 0);
    CFRelease(v2);
    S_store = (uint64_t)v3;
    uint64_t result = getWiFiManagerClient();
    if (result)
    {
      CFRunLoopGetCurrent();
      WiFiManagerClientScheduleWithRunLoop();
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopWakeUp(Current);
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      uint64_t result = WiFiManagerClientRegisterServerRestartCallback();
    }
  }
  S_new_interface_callback = v1;
  return result;
}

void *NetIFSetWiFiManagerRestartCallBack(void *result)
{
  S_wifi_manager_restart_callback = result;
  return result;
}

void NetIFCheckForNewInterfaces()
{
  if (getWiFiManagerClient())
  {
    CFArrayRef v0 = (const __CFArray *)WiFiManagerClientCopyDevices();
    if (v0)
    {
      CFArrayRef v1 = v0;
      CFIndex Count = CFArrayGetCount(v0);
      if (Count >= 1)
      {
        CFIndex v3 = Count;
        for (CFIndex i = 0; i != v3; ++i)
        {
          CFArrayGetValueAtIndex(v1, i);
          int v5 = (void (*)(uint64_t))S_new_interface_callback;
          if (S_new_interface_callback)
          {
            uint64_t InterfaceName = WiFiDeviceClientGetInterfaceName();
            v5(InterfaceName);
          }
        }
      }
      CFRelease(v1);
    }
    else
    {
      logger = mysyslog_get_logger();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        *(_WORD *)os_log_type_t v9 = 0;
        _os_log_impl(&dword_225F82000, logger, v8, "failed to get the Wi-Fi devices", v9, 2u);
      }
    }
  }
}

void *NetIFSetScanResultsCallBack(void *result)
{
  S_scan_results_callback = result;
  return result;
}

void NetIFEnableScanResults(uint64_t a1)
{
}

void registerForScanResults(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (getWiFiManagerClient())
  {
    if (WiFiManagerClientGetDevice())
    {
      MEMORY[0x270F4B498]();
    }
    else
    {
      logger = mysyslog_get_logger();
      os_log_type_t v3 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v3))
      {
        int v4 = 138412290;
        uint64_t v5 = a1;
        _os_log_impl(&dword_225F82000, logger, v3, "WiFiManagerClientGetDevice for %@ returned NULL", (uint8_t *)&v4, 0xCu);
      }
    }
  }
}

void NetIFDisableScanResults(uint64_t a1)
{
}

uint64_t NetIFCopyCurrentWiFiNetwork(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!getWiFiManagerClient()) {
    return 0;
  }
  if (!WiFiManagerClientGetDevice())
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      int v5 = 138412290;
      uint64_t v6 = a1;
      _os_log_impl(&dword_225F82000, logger, v4, "WiFiManagerClientGetDevice for %@ returned NULL", (uint8_t *)&v5, 0xCu);
    }
    return 0;
  }

  return WiFiDeviceClientCopyCurrentNetwork();
}

uint64_t NetIFCopyCurrentWiFiNetworkWithSignal(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!getWiFiManagerClient()) {
    return 0;
  }
  if (!WiFiManagerClientGetDevice())
  {
    logger = mysyslog_get_logger();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v7))
    {
      int v9 = 138412290;
      uint64_t v10 = a1;
      _os_log_impl(&dword_225F82000, logger, v7, "WiFiManagerClientGetDevice for %@ returned NULL", (uint8_t *)&v9, 0xCu);
    }
    return 0;
  }
  uint64_t v2 = WiFiDeviceClientCopyCurrentNetwork();
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x263F55F38];
    uint64_t v4 = WiFiDeviceClientCopyProperty();
    if (v4)
    {
      int v5 = (const void *)v4;
      NetIFWiFiSetProperty(v2, v3);
      CFRelease(v5);
    }
  }
  return v2;
}

uint64_t NetIFWiFiNetworkWasAutoJoined(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFBooleanRef Property = (const void *)WiFiNetworkGetProperty();
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Property || CFGetTypeID(Property) != TypeID) {
    return 0;
  }

  return CFBooleanGetValue((CFBooleanRef)Property);
}

void NetIFSetCarPlayModeChangeCallBack(uint64_t a1, uint64_t (*a2)(void, void))
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (S_carplay_mode_change_callback != a2)
  {
    S_carplay_mode_change_callback = a2;
    uint64_t WiFiManagerClient = getWiFiManagerClient();
    if (a2)
    {
      if (WiFiManagerClient)
      {
        if (WiFiManagerClientGetDevice())
        {
          WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback();
          logger = mysyslog_get_logger();
          os_log_type_t v6 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(logger, v6)) {
            return;
          }
          int v29 = 138412290;
          uint64_t v30 = a1;
          os_log_type_t v7 = "%@: registered callback for carplay mode change";
LABEL_11:
          os_log_type_t v8 = logger;
          os_log_type_t v9 = v6;
          uint32_t v10 = 12;
LABEL_27:
          _os_log_impl(&dword_225F82000, v8, v9, v7, (uint8_t *)&v29, v10);
          return;
        }
        os_log_type_t v17 = mysyslog_get_logger();
        os_log_type_t v18 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v17, v18)) {
          goto LABEL_17;
        }
        int v29 = 138412290;
        uint64_t v30 = a1;
        os_log_type_t v13 = "WiFiManagerClientGetDevice for %@ returned NULL";
        int v14 = v17;
        os_log_type_t v15 = v18;
        uint32_t v16 = 12;
      }
      else
      {
        uint64_t v11 = mysyslog_get_logger();
        os_log_type_t v12 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v11, v12))
        {
LABEL_17:
          uint64_t v19 = mysyslog_get_logger();
          os_log_type_t v20 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v19, v20)) {
            return;
          }
          LOWORD(v29) = 0;
          os_log_type_t v7 = "Failed to register a callback for CarPlay Mode Change";
LABEL_26:
          os_log_type_t v8 = v19;
          os_log_type_t v9 = v20;
          uint32_t v10 = 2;
          goto LABEL_27;
        }
        LOWORD(v29) = 0;
        os_log_type_t v13 = "Failed to find the WiFiManager instance";
        int v14 = v11;
        os_log_type_t v15 = v12;
        uint32_t v16 = 2;
      }
      _os_log_impl(&dword_225F82000, v14, v15, v13, (uint8_t *)&v29, v16);
      goto LABEL_17;
    }
    if (WiFiManagerClient)
    {
      if (WiFiManagerClientGetDevice())
      {
        WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback();
        logger = mysyslog_get_logger();
        os_log_type_t v6 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(logger, v6)) {
          return;
        }
        int v29 = 138412290;
        uint64_t v30 = a1;
        os_log_type_t v7 = "%@: un-registered callback for carplay mode change";
        goto LABEL_11;
      }
      uint64_t v27 = mysyslog_get_logger();
      os_log_type_t v28 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v27, v28)) {
        goto LABEL_24;
      }
      int v29 = 138412290;
      uint64_t v30 = a1;
      uint64_t v23 = "WiFiManagerClientGetDevice for %@ returned NULL";
      __int16 v24 = v27;
      os_log_type_t v25 = v28;
      uint32_t v26 = 12;
    }
    else
    {
      uint64_t v21 = mysyslog_get_logger();
      os_log_type_t v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v21, v22))
      {
LABEL_24:
        uint64_t v19 = mysyslog_get_logger();
        os_log_type_t v20 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v19, v20)) {
          return;
        }
        LOWORD(v29) = 0;
        os_log_type_t v7 = "Failed to un-register the callback for CarPlay Mode Change";
        goto LABEL_26;
      }
      LOWORD(v29) = 0;
      uint64_t v23 = "Failed to find the WiFiManager instance";
      __int16 v24 = v21;
      os_log_type_t v25 = v22;
      uint32_t v26 = 2;
    }
    _os_log_impl(&dword_225F82000, v24, v25, v23, (uint8_t *)&v29, v26);
    goto LABEL_24;
  }
}

BOOL NetIFWiFiNetworkIsCarPlay()
{
  return WiFiNetworkGetType() - 1 < 2;
}

BOOL NetIFWiFiNetworkIsCarPlayOnly()
{
  return WiFiNetworkGetType() == 1;
}

BOOL NetIFWiFiNetworkIsCarPlayAndInternet()
{
  return WiFiNetworkGetType() == 2;
}

const void *NetIfCopyOwnerApplicationForCurrentNetwork(uint64_t a1)
{
  uint64_t v1 = NetIFCopyCurrentWiFiNetwork(a1);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (const void *)v1;
  BundleIdentifier = (const void *)WiFiNetworkGetBundleIdentifier();
  uint64_t v4 = BundleIdentifier;
  if (BundleIdentifier) {
    CFRetain(BundleIdentifier);
  }
  CFRelease(v2);
  return v4;
}

uint64_t NetIFIsQuickProbeRequired()
{
  uint64_t result = getWiFiManagerClient();
  if (result)
  {
    return MEMORY[0x270F4B5D0]();
  }
  return result;
}

uint64_t NetIFReportQuickProbeResult()
{
  uint64_t result = getWiFiManagerClient();
  if (result)
  {
    return MEMORY[0x270F4B5D8]();
  }
  return result;
}

void NetIFTakeWiFiNetworkOffline(uint64_t a1, uint64_t a2, int a3, __CFString *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a2 && getWiFiManagerClient())
  {
    if (WiFiNetworkGetType() == 2)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        int v19 = 138412290;
        uint64_t SSID = WiFiNetworkGetSSID();
        _os_log_impl(&dword_225F82000, logger, v8, "%@: Switching to 'CarPlay Only' mode", (uint8_t *)&v19, 0xCu);
      }
      WiFiManagerClientRemoveNetwork();
    }
    else
    {
      if (a3)
      {
        if (WiFiManagerClientIsNetworkEnabled())
        {
          os_log_type_t v9 = mysyslog_get_logger();
          os_log_type_t v10 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v9, v10))
          {
            uint64_t v11 = WiFiNetworkGetSSID();
            os_log_type_t v12 = @"unknown";
            if (a4) {
              os_log_type_t v12 = a4;
            }
            int v19 = 138412546;
            uint64_t SSID = v11;
            __int16 v21 = 2112;
            os_log_type_t v22 = v12;
            _os_log_impl(&dword_225F82000, v9, v10, "Disabling AutoJoin for %@ [Reason: %@]", (uint8_t *)&v19, 0x16u);
          }
          NetIFWiFiSetProperty(a2, *MEMORY[0x263F30860]);
          if (a4) {
            NetIFWiFiSetProperty(a2, *MEMORY[0x263F30868]);
          }
          WiFiManagerClientDisableNetwork();
        }
      }
      else
      {
        os_log_type_t v13 = mysyslog_get_logger();
        int v14 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v13, (os_log_type_t)v14))
        {
          int v19 = 138412290;
          uint64_t SSID = WiFiNetworkGetSSID();
          _os_log_impl(&dword_225F82000, v13, (os_log_type_t)v14, "Temporarily disabling (blacklisting) %@", (uint8_t *)&v19, 0xCu);
        }
        WiFiManagerClientTemporarilyDisableNetwork();
      }
      if (WiFiManagerClientGetDevice())
      {
        int v15 = WiFiDeviceClientDisassociate();
        if (v15)
        {
          int v16 = v15;
          os_log_type_t v17 = mysyslog_get_logger();
          os_log_type_t v18 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v17, v18))
          {
            int v19 = 67109120;
            LODWORD(SSID) = v16;
            _os_log_impl(&dword_225F82000, v17, v18, "WiFiDeviceClientDisassociate failed: %d", (uint8_t *)&v19, 8u);
          }
        }
      }
    }
  }
}

uint64_t NetIFWiFiNetworkIsCaptive(uint64_t a1, unsigned char *a2)
{
  if (a2) {
    *a2 = 0;
  }
  if (!a1) {
    return 0;
  }
  CFBooleanRef Property = (const void *)WiFiNetworkGetProperty();
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Property || CFGetTypeID(Property) != TypeID) {
    return 0;
  }
  if (a2) {
    *a2 = 1;
  }

  return CFBooleanGetValue((CFBooleanRef)Property);
}

uint64_t NetIFGetWiFiNetworkWasCaptive(uint64_t result)
{
  if (result)
  {
    CFBooleanRef Property = (const void *)WiFiNetworkGetProperty();
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (!Property
      || CFGetTypeID(Property) != TypeID
      || (uint64_t result = CFBooleanGetValue((CFBooleanRef)Property), !result))
    {
      CFBooleanRef v3 = (const __CFBoolean *)WiFiNetworkGetProperty();
      CFTypeID v4 = CFBooleanGetTypeID();
      if (v3 && CFGetTypeID(v3) == v4)
      {
        return CFBooleanGetValue(v3);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

BOOL NetIFWiFiNetworkHasNeverBeenCaptive(BOOL result)
{
  char v3 = 0;
  if (result)
  {
    uint64_t v1 = result;
    int IsCaptive = NetIFWiFiNetworkIsCaptive(result, &v3);
    uint64_t result = 0;
    if (!IsCaptive)
    {
      if (v3) {
        return NetIFGetWiFiNetworkWasCaptive(v1) == 0;
      }
    }
  }
  return result;
}

const void *NetIFWiFiNetworkCopyCaptivePortalAPIURL(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFBooleanRef Property = (const void *)WiFiNetworkGetProperty();
  CFTypeID TypeID = CFStringGetTypeID();
  if (Property)
  {
    if (CFGetTypeID(Property) == TypeID)
    {
      CFRetain(Property);
      return Property;
    }
    return 0;
  }
  return Property;
}

void NetIFWiFiNetworkSetCaptivePortalAPIURL(uint64_t a1, const void *a2)
{
  if (a1)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
      {
        uint64_t v5 = *MEMORY[0x263F30838];
        NetIFWiFiSetProperty(a1, v5);
      }
    }
  }
}

void NetIFWiFiNetworkSetCaptivePortalUserPortalURL(uint64_t a1, const void *a2)
{
  if (a1)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
      {
        uint64_t v5 = *MEMORY[0x263F30850];
        NetIFWiFiSetProperty(a1, v5);
      }
    }
  }
}

void NetIFWiFiNetworkSetCaptivePortalVenueInfoURL(uint64_t a1, const void *a2)
{
  if (a1)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
      {
        uint64_t v5 = *MEMORY[0x263F30858];
        NetIFWiFiSetProperty(a1, v5);
      }
    }
  }
}

void NetIFWiFiNetworkSetCaptivePortalCanExtendSession(uint64_t a1, const void *a2)
{
  if (a1)
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
      {
        uint64_t v5 = *MEMORY[0x263F30840];
        NetIFWiFiSetProperty(a1, v5);
      }
    }
  }
}

void NetIFWiFiNetworkSetCaptivePortalSessionExpiration(uint64_t a1, const void *a2)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
      {
        uint64_t v5 = *MEMORY[0x263F30848];
        NetIFWiFiSetProperty(a1, v5);
      }
    }
  }
}

void NetIFWiFiNetworkSetCaptive(uint64_t a1, unsigned int a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!getWiFiManagerClient()) {
    return;
  }
  if (a2)
  {
    if ((~a2 & 0x18) == 0)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v6))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_225F82000, logger, v6, "network marked captive can't also be marked whitelisted", (uint8_t *)&v29, 2u);
      }
    }
    int v4 = 1;
  }
  else
  {
    int v4 = (a2 >> 3) & 1;
  }
  int v7 = a2 & 1;
  os_log_type_t v8 = (uint64_t *)MEMORY[0x263F30828];
  CFBooleanRef Property = (const void *)WiFiNetworkGetProperty();
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Property || CFGetTypeID(Property) != TypeID)
  {
    int Value = 0;
    if (WiFiNetworkIsEAP()) {
      int v7 = 0;
    }
    goto LABEL_17;
  }
  int Value = CFBooleanGetValue((CFBooleanRef)Property);
  if (WiFiNetworkIsEAP()) {
    int v7 = 0;
  }
  if (v4 || Value != v7)
  {
LABEL_17:
    if (Value != v7) {
      NetIFWiFiSetProperty(a1, *MEMORY[0x263F30878]);
    }
    if (v4)
    {
      NetIFWiFiSetProperty(a1, *MEMORY[0x263F30870]);
      uint64_t v12 = *MEMORY[0x263F308B0];
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFDateRef v14 = CFDateCreate(0, Current);
      NetIFWiFiSetProperty(a1, v12);
      CFRelease(v14);
    }
    if ((a2 & 0x40) == 0) {
      NetIFWiFiSetProperty(a1, *v8);
    }
    int Value = v7;
  }
  int v15 = (uint64_t *)MEMORY[0x263F30860];
  int v16 = (const void *)WiFiNetworkGetProperty();
  CFTypeID v17 = CFBooleanGetTypeID();
  if (v16
    && CFGetTypeID(v16) == v17
    && CFBooleanGetValue((CFBooleanRef)v16)
    && ((IsNetworkEnabled = WiFiManagerClientIsNetworkEnabled(), int v19 = IsNetworkEnabled, (a2 & 2) != 0)
     || !Value
     || IsNetworkEnabled))
  {
    NetIFWiFiSetProperty(a1, *v15);
    NetIFWiFiSetProperty(a1, *MEMORY[0x263F30868]);
    BOOL v20 = v19 == 0;
    if ((a2 & 4) != 0)
    {
LABEL_31:
      __int16 v21 = (uint64_t *)MEMORY[0x263F30820];
      if (!NetIFWiFiNetworkGetBoolean(a1)) {
        NetIFWiFiSetProperty(a1, *v21);
      }
    }
  }
  else
  {
    BOOL v20 = 0;
    if ((a2 & 4) != 0) {
      goto LABEL_31;
    }
  }
  if ((a2 & 0x20) != 0)
  {
    CFAbsoluteTime v22 = CFAbsoluteTimeGetCurrent();
    CFDateRef v23 = CFDateCreate(0, v22);
    __int16 v24 = mysyslog_get_logger();
    os_log_type_t v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v24, v25))
    {
      int v29 = 138412290;
      uint64_t v30 = (uint64_t)v23;
      _os_log_impl(&dword_225F82000, v24, v25, "Updated WebSheet Login time to [%@]", (uint8_t *)&v29, 0xCu);
    }
    NetIFWiFiSetProperty(a1, *MEMORY[0x263F30830]);
    CFRelease(v23);
  }
  if (v20)
  {
    uint32_t v26 = mysyslog_get_logger();
    os_log_type_t v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t SSID = WiFiNetworkGetSSID();
      int v29 = 138412290;
      uint64_t v30 = SSID;
      _os_log_impl(&dword_225F82000, v26, v27, "Re-enabling %@", (uint8_t *)&v29, 0xCu);
    }
    WiFiManagerClientEnableNetwork();
  }
}

uint64_t NetIFWiFiNetworkIsUserBypass(uint64_t a1)
{
  return NetIFWiFiNetworkGetBoolean(a1);
}

void NetIFDisableWiFiNetworkIfCurrent(uint64_t a1, const void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = NetIFCopyCurrentWiFiNetwork(a1);
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    uint64_t SSID = (const void *)WiFiNetworkGetSSID();
    if (SSID && CFEqual(a2, SSID))
    {
      if (getWiFiManagerClient()) {
        WiFiManagerClientDisableNetwork();
      }
    }
    else
    {
      logger = mysyslog_get_logger();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        int v11 = 138412802;
        uint64_t v12 = a1;
        __int16 v13 = 2112;
        CFDateRef v14 = a2;
        __int16 v15 = 2112;
        int v16 = SSID;
        _os_log_impl(&dword_225F82000, logger, v8, "%@: specified SSID '%@' not current '%@'", (uint8_t *)&v11, 0x20u);
      }
    }
    CFRelease(v5);
  }
  else
  {
    os_log_type_t v9 = mysyslog_get_logger();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      int v11 = 138412290;
      uint64_t v12 = a1;
      _os_log_impl(&dword_225F82000, v9, v10, "Can't get Wi-Fi network for %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

BOOL NetIFWiFiNetworkIsProtected(BOOL result)
{
  if (result) {
    return WiFiNetworkIsWEP() || WiFiNetworkIsWPA() || WiFiNetworkIsEAP() != 0;
  }
  return result;
}

uint64_t NetIFWiFiNetworkGetSecurityType()
{
  if (WiFiNetworkIsEAP()) {
    return 4;
  }
  if (WiFiNetworkIsWPA()) {
    return 3;
  }
  if (WiFiNetworkIsWEP()) {
    return 2;
  }
  return 1;
}

BOOL NetIFWiFiNetworkIsProtectedForInterface(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = NetIFCopyCurrentWiFiNetwork(a1);
  if (v2)
  {
    char v3 = (const void *)v2;
    BOOL IsProtected = NetIFWiFiNetworkIsProtected(v2);
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      uint64_t SSID = WiFiNetworkGetSSID();
      os_log_type_t v8 = "secure";
      int v12 = 138412802;
      uint64_t v13 = a1;
      if (!IsProtected) {
        os_log_type_t v8 = "unsecure";
      }
      __int16 v14 = 2112;
      uint64_t v15 = SSID;
      __int16 v16 = 2080;
      uint64_t v17 = v8;
      _os_log_impl(&dword_225F82000, logger, v6, "%@ Wi-Fi network [%@] is %s", (uint8_t *)&v12, 0x20u);
    }
    CFRelease(v3);
  }
  else
  {
    os_log_type_t v9 = mysyslog_get_logger();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      int v12 = 138412290;
      uint64_t v13 = a1;
      _os_log_impl(&dword_225F82000, v9, v10, "NetIFCopyCurrentWiFiNetwork returned NULL for %@", (uint8_t *)&v12, 0xCu);
    }
    return 0;
  }
  return IsProtected;
}

uint64_t NetIFWiFiNetworkGetBoolean(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFBooleanRef Property = (const void *)WiFiNetworkGetProperty();
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Property || CFGetTypeID(Property) != TypeID) {
    return 0;
  }

  return CFBooleanGetValue((CFBooleanRef)Property);
}

uint64_t NetIFWiFiNetworkIsWhitelistedCaptiveNetwork(uint64_t a1)
{
  return NetIFWiFiNetworkGetBoolean(a1);
}

const void *NetIFWiFiNetworkGetWhitelistedCaptiveNetworkProbeDate()
{
  CFBooleanRef Property = (const void *)WiFiNetworkGetProperty();
  CFTypeID TypeID = CFDateGetTypeID();
  if (!Property) {
    return 0;
  }
  if (CFGetTypeID(Property) == TypeID) {
    return Property;
  }
  return 0;
}

const void *NetIFWiFiNetworkGetLastWebSheetLoginDate()
{
  CFBooleanRef Property = (const void *)WiFiNetworkGetProperty();
  CFTypeID TypeID = CFDateGetTypeID();
  if (!Property) {
    return 0;
  }
  if (CFGetTypeID(Property) == TypeID) {
    return Property;
  }
  return 0;
}

uint64_t NetIFWiFiNetworkForgetAppOwnedNetworks()
{
  uint64_t result = getWiFiManagerClient();
  if (result)
  {
    return MEMORY[0x270F4B618]();
  }
  return result;
}

uint64_t NetIFUpdateWiFiNetwork()
{
  uint64_t result = getWiFiManagerClient();
  if (result)
  {
    return MEMORY[0x270F4B6A8]();
  }
  return result;
}

CFDictionaryRef NetIFCopyAllServiceInformation()
{
  uint64_t v0 = 0;
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v1 = *MEMORY[0x263F1BC50];
  v9[0] = *MEMORY[0x263F1BC28];
  v9[1] = v1;
  _DWORD v9[2] = *MEMORY[0x263F1BC58];
  memset(values, 0, sizeof(values));
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263F1BC10];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263F1BBF0];
  do
  {
    values[v0] = (void *)SCDynamicStoreKeyCreateNetworkServiceEntity(0, v2, v3, (CFStringRef)v9[v0]);
    ++v0;
  }
  while (v0 != 3);
  CFArrayRef v4 = CFArrayCreate(0, (const void **)values, 3, MEMORY[0x263EFFF70]);
  for (uint64_t i = 0; i != 3; ++i)
    CFRelease(values[i]);
  CFDictionaryRef v6 = SCDynamicStoreCopyMultiple((SCDynamicStoreRef)S_store, 0, v4);
  CFRelease(v4);
  return v6;
}

CFDictionaryRef NetIFCopySignatures(const __CFDictionary *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = a2;
    uint64_t v3 = 0;
    CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)append_signature, &v2);
    return (const __CFDictionary *)v3;
  }
  return result;
}

void append_signature(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  int Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F1BCC8]);
  if (Value)
  {
    if (CFEqual(Value, *(CFTypeRef *)a3))
    {
      CFDictionaryRef v6 = CFDictionaryGetValue(theDict, @"NetworkSignature");
      if (v6)
      {
        int v7 = v6;
        CFDictionaryRef Mutable = *(__CFArray **)(a3 + 8);
        if (!Mutable)
        {
          CFDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
          *(void *)(a3 + 8) = Mutable;
        }
        CFArrayAppendValue(Mutable, v7);
      }
    }
  }
}

CFDictionaryRef NetIFCopyCaptivePortal(const __CFDictionary *result, uint64_t a2)
{
  if (result)
  {
    CFDictionaryRef v2 = result;
    uint64_t v7 = 0;
    uint64_t v4 = a2;
    uint64_t v5 = 0;
    CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)find_service, &v4);
    uint64_t v3 = v5;
    if (v5)
    {
      long long context = v5;
      CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)find_portal, &context);
      CFRelease(v3);
      return (const __CFDictionary *)v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t find_service(const __CFString *a1, CFDictionaryRef theDict, uint64_t a3)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F1BCC8]);
  if (result)
  {
    uint64_t result = CFEqual((CFTypeRef)result, *(CFTypeRef *)a3);
    if (result)
    {
      if (!*(void *)(a3 + 8))
      {
        uint64_t result = (uint64_t)copy_service_from_path(a1, 0);
        *(void *)(a3 + 8) = result;
      }
    }
  }
  return result;
}

void find_portal(const __CFString *a1, const __CFDictionary *a2, uint64_t a3)
{
  CFTypeRef cf = 0;
  CFStringRef v5 = (const __CFString *)copy_service_from_path(a1, &cf);
  CFStringRef v6 = v5;
  if (!v5 || !*(void *)a3)
  {
    CFStringRef Value = 0;
    goto LABEL_11;
  }
  CFComparisonResult v7 = CFStringCompare(v5, *(CFStringRef *)a3, 0);
  CFTypeRef v8 = cf;
  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = cf == 0;
  }
  if (!v9)
  {
    CFStringRef Value = 0;
    if (CFEqual((CFStringRef)cf, (CFStringRef)*MEMORY[0x263F1BC28])) {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x263F1BCD0]);
    }
LABEL_11:
    CFTypeRef v8 = cf;
    if (!cf) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  CFStringRef Value = 0;
  if (cf)
  {
LABEL_12:
    CFRelease(v8);
    CFTypeRef cf = 0;
  }
LABEL_13:
  if (v6) {
    CFRelease(v6);
  }
  if (!*(void *)(a3 + 8) && Value)
  {
    if (CFStringHasPrefix(Value, @"https://")) {
      *(void *)(a3 + 8) = CFRetain(Value);
    }
  }
}

uint64_t NetIFGetStore()
{
  return S_store;
}

void *handle_device_attach()
{
  uint64_t result = S_new_interface_callback;
  if (S_new_interface_callback)
  {
    CFDictionaryRef v2 = (uint64_t (*)(uint64_t))S_new_interface_callback;
    uint64_t InterfaceName = WiFiDeviceClientGetInterfaceName();
    return (void *)v2(InterfaceName);
  }
  return result;
}

void handle_wifi_manager_restart()
{
  logger = mysyslog_get_logger();
  os_log_type_t v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)CFDictionaryRef v2 = 0;
    _os_log_impl(&dword_225F82000, logger, v1, "wifi manager restarted", v2, 2u);
  }
  if (S_wifi_manager_restart_callback) {
    S_wifi_manager_restart_callback();
  }
}

void handle_scan_results(int a1, int a2, CFArrayRef theArray)
{
  if (theArray && S_scan_results_callback && CFArrayGetCount(theArray))
  {
    keys[0] = @"SCAN_MAXAGE";
    int valuePtr = -1;
    CFTypeRef cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)keys, &cf, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFRelease(cf);
    logger = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      LOWORD(keys[0]) = 0;
      _os_log_impl(&dword_225F82000, logger, v5, "received scan results", (uint8_t *)keys, 2u);
    }
    WiFiDeviceClientScanAsync();
    CFRelease(v3);
  }
}

void handle_cached_scan_results(int a1, CFArrayRef theArray)
{
  if (theArray && S_scan_results_callback && CFArrayGetCount(theArray))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      *(_WORD *)CFComparisonResult v7 = 0;
      _os_log_impl(&dword_225F82000, logger, v4, "received cached scan results", v7, 2u);
    }
    os_log_type_t v5 = (void (*)(uint64_t, CFArrayRef))S_scan_results_callback;
    uint64_t InterfaceName = WiFiDeviceClientGetInterfaceName();
    v5(InterfaceName, theArray);
  }
}

void handle_carplay_mode_change(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v6))
  {
    int v10 = 67109120;
    int v11 = a2;
    _os_log_impl(&dword_225F82000, logger, v6, "CarPlay mode change was notified with %u", (uint8_t *)&v10, 8u);
  }
  if ((a2 - 3) <= 0xFFFFFFFD)
  {
    CFComparisonResult v7 = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v7, v8)) {
      return;
    }
    int v10 = 67109120;
    int v11 = a2;
    BOOL v9 = "Callback received an invalid CarPlay mode %d";
LABEL_9:
    _os_log_impl(&dword_225F82000, v7, v8, v9, (uint8_t *)&v10, 8u);
    return;
  }
  if (handle_carplay_mode_change_current_type == a2)
  {
    CFComparisonResult v7 = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v7, v8)) {
      return;
    }
    int v10 = 67109120;
    int v11 = a2;
    BOOL v9 = "CarPlay mode change to %d was already handled";
    goto LABEL_9;
  }
  if (S_carplay_mode_change_callback) {
    S_carplay_mode_change_callback(a2 == 2, a3);
  }
  handle_carplay_mode_change_current_type = a2;
}

const void *copy_service_from_path(CFStringRef theString, void *a2)
{
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, theString, @"/");
  CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
  os_log_type_t v5 = 0;
  if (Count < 4
    || (v6 = Count, os_log_type_t v5 = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3), CFRetain(v5), !a2)
    || v6 == 4)
  {
    if (!a2) {
      goto LABEL_8;
    }
    CFDictionaryRef ValueAtIndex = 0;
  }
  else
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 4);
  }
  CFRetain(ValueAtIndex);
  *a2 = ValueAtIndex;
LABEL_8:
  if (ArrayBySeparatingStrings) {
    CFRelease(ArrayBySeparatingStrings);
  }
  return v5;
}

const char *CNPCommandTypeGetString(unsigned int a1)
{
  if (a1 <= 6) {
    return CNPCommandTypeGetString_strings[a1];
  }
  else {
    return "<unknown>";
  }
}

const char *CNPResultGetString(unsigned int a1)
{
  if (a1 <= 6) {
    return CNPResultGetString_strings[a1];
  }
  else {
    return "<unknown>";
  }
}

const char *CNPConfidenceGetString(unsigned int a1)
{
  if (a1 <= 2) {
    return CNPConfidenceGetString_strings[a1];
  }
  else {
    return "<unknown>";
  }
}

const char *CNPCaptiveDetectionTypeGetString(unsigned int a1)
{
  if (a1 <= 3) {
    return CNPCaptiveDetectionTypeGetString_strings[a1];
  }
  else {
    return "<unknown>";
  }
}

uint64_t CNAccountsVZWValidate()
{
  CFStringRef v0 = VZWCopyPhoneNumber();
  if (!v0) {
    return 0;
  }
  CFStringRef v1 = v0;
  id v2 = CopyMobileEquipmentInfo();
  BOOL v3 = v2 != 0;
  CFRelease(v1);
  if (v2)
  {
    CFRelease(v2);
    return 1;
  }
  return v3;
}

CFStringRef VZWCopyPhoneNumber()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFStringRef v0 = (const __CFString *)CopyPhoneNumber();
  if (!v0
    || (CFStringRef v1 = v0, Length = CFStringGetLength(v0), Length >= 0xB)
    && (v12.CFIndex location = Length - 10,
        v12.length = 10,
        CFStringRef v3 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, v12),
        CFRelease(v1),
        (CFStringRef v1 = v3) == 0))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v7))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_225F82000, logger, v7, "failed to obtain the device phone number", (uint8_t *)&v9, 2u);
    }
    return 0;
  }
  if (CFStringHasPrefix(v1, @"000000"))
  {
    os_log_type_t v4 = mysyslog_get_logger();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v4, v5))
    {
      int v9 = 138412290;
      CFStringRef v10 = v1;
      _os_log_impl(&dword_225F82000, v4, v5, "ignoring device phone number %@ (cold SIM)", (uint8_t *)&v9, 0xCu);
    }
    CFRelease(v1);
    return 0;
  }
  return v1;
}

_OWORD *CNAccountsVZWQueryStart(uint64_t a1, const void *a2, uint64_t a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = malloc_type_malloc(0x38uLL, 0xE00409C3A2E09uLL);
  CFRange v12 = v11;
  if (v11)
  {
    v15.version = 0;
    memset(&v15.retain, 0, 56);
    v15.info = v11;
    v15.perform = (void (__cdecl *)(void *))VZWQueryDo;
    *uint64_t v11 = 0u;
    v11[1] = 0u;
    v11[2] = 0u;
    *((void *)v11 + 6) = 0;
    *((void *)v11 + 1) = VZWQueryAbort;
    *((void *)v11 + 2) = a6;
    *((void *)v11 + 3) = a7;
    *((void *)v11 + 4) = a2;
    CFRetain(a2);
    if (a4 && CFStringGetLength(a4) >= 1)
    {
      *((void *)v12 + 5) = a4;
      CFRetain(a4);
    }
    *((void *)v12 + 6) = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &v15);
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, *((CFRunLoopSourceRef *)v12 + 6), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)v12 + 6));
  }
  return v12;
}

void VZWQueryDo(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 48));
  CFAbsoluteTime Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 48), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  CFStringRef v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 48) = 0;
  }
  memset(&c, 0, sizeof(c));
  CNAccountsCredentialQueryInvalidate((uint64_t *)a1);
  os_log_type_t v4 = (const void *)_CTServerConnectionCreateWithIdentifier();
  theDict[0] = 0;
  LODWORD(valuePtr) = 0;
  char v56 = 0;
  id v5 = CopyRATSelection();
  unint64_t v6 = _CTServerConnectionCopySystemCapabilities();
  if (v6)
  {
    unint64_t v7 = HIDWORD(v6);
    if (v6 == 2)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(logger, v9)) {
        goto LABEL_15;
      }
      *(_DWORD *)__CFString buf = 136315394;
      *(void *)&uint8_t buf[4] = "_CTServerConnectionCopySystemCapabilities";
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = mach_error_string(v7);
      CFStringRef v10 = "%s failed, %s";
    }
    else
    {
      if (v6 != 1)
      {
        __int16 v14 = mysyslog_get_logger();
        os_log_type_t v15 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v14, v15)) {
          goto LABEL_15;
        }
        *(_DWORD *)__CFString buf = 136315138;
        *(void *)&uint8_t buf[4] = "_CTServerConnectionCopySystemCapabilities";
        CFStringRef v10 = "%s failed";
        uint64_t v11 = v14;
        os_log_type_t v12 = v15;
        uint32_t v13 = 12;
        goto LABEL_14;
      }
      logger = mysyslog_get_logger();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(logger, v9)) {
        goto LABEL_15;
      }
      *(_DWORD *)__CFString buf = 136315394;
      *(void *)&uint8_t buf[4] = "_CTServerConnectionCopySystemCapabilities";
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = strerror(v7);
      CFStringRef v10 = "%s failed, %s";
    }
    uint64_t v11 = logger;
    os_log_type_t v12 = v9;
    uint32_t v13 = 22;
LABEL_14:
    _os_log_impl(&dword_225F82000, v11, v12, v10, buf, v13);
  }
LABEL_15:
  if (v5) {
    CFRelease(v5);
  }
  CFNumberRef v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryRef v17 = (const __CFDictionary *)CopyMobileEquipmentInfo();
  CFRelease(v4);
  CFStringRef v18 = VZWCopyPhoneNumber();
  CFStringRef Value = (__CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"AuthenticationRealm");
  BOOL v20 = @"hds.vzw3g.com";
  if (Value) {
    BOOL v20 = Value;
  }
  __int16 v21 = (__CFString *)CFStringCreateWithFormat(0, 0, @"VzW3652987!%@@%@", v18, v20);
  CFAbsoluteTime v22 = CFAbsoluteTimeGetCurrent();
  *(void *)__CFString buf = 0;
  size_t valuePtr = 0;
  theDict[0] = 0;
  CFDateRef v23 = CFCalendarCreateWithIdentifier(0, (CFCalendarIdentifier)*MEMORY[0x263EFFC90]);
  CFCalendarDecomposeAbsoluteTime(v23, v22, "yMd", &valuePtr, theDict, buf);
  CFRelease(v23);
  CFStringRef v24 = CFStringCreateWithFormat(0, 0, @"%02d%02d%04d", theDict[0], *(void *)buf, valuePtr);
  CFStringRef v25 = v24;
  uint32_t v26 = 0;
  if (!v17 || !v18 || !v21)
  {
    os_log_type_t v27 = 0;
    os_log_type_t v28 = 0;
    CFStringRef v29 = 0;
    goto LABEL_30;
  }
  os_log_type_t v27 = 0;
  os_log_type_t v28 = 0;
  CFStringRef v29 = 0;
  if (!v24) {
    goto LABEL_30;
  }
  CC_SHA1_Init(&c);
  if (!addCFStringToHash(&c, v25)) {
    goto LABEL_76;
  }
  CFStringRef v29 = 0;
  if (!addCFStringToHash(&c, v18) || !v16) {
    goto LABEL_77;
  }
  *(_DWORD *)__CFString buf = 0;
  if (!CFNumberGetValue(v16, kCFNumberIntType, buf)) {
    goto LABEL_76;
  }
  if ((*(_DWORD *)buf - 1) <= 1)
  {
    uint64_t v30 = (const void **)MEMORY[0x263F02E58];
    goto LABEL_54;
  }
  if (*(_DWORD *)buf != 3)
  {
LABEL_76:
    CFStringRef v29 = 0;
LABEL_77:
    (*(void (**)(void, void))(a1 + 16))(*(void *)(a1 + 24), 0);
    os_log_type_t v28 = 0;
    os_log_type_t v27 = 0;
    uint32_t v26 = 0;
    goto LABEL_78;
  }
  uint64_t v30 = (const void **)MEMORY[0x263F02E50];
LABEL_54:
  CFStringRef v33 = (const __CFString *)CFDictionaryGetValue(v17, *v30);
  CFStringRef v29 = v33;
  if (!v33) {
    goto LABEL_76;
  }
  CFRetain(v33);
  CFLocaleRef v34 = CFLocaleCopyCurrent();
  if (v34)
  {
    CFLocaleRef v35 = v34;
    CFIndex Length = CFStringGetLength(v29);
    CFMutableDictionaryRef MutableCopy = CFStringCreateMutableCopy(0, Length, v29);
    if (MutableCopy)
    {
      os_log_type_t v38 = MutableCopy;
      CFStringLowercase(MutableCopy, v35);
      CFRelease(v29);
      CFStringRef v29 = v38;
    }
    CFRelease(v35);
  }
  if (!addCFStringToHash(&c, v29)) {
    goto LABEL_77;
  }
  CC_SHA1_Final((unsigned __int8 *)theDict, &c);
  os_log_type_t v39 = dataCopyHexString((unsigned __int8 *)theDict, 20);
  if (!v39) {
    goto LABEL_77;
  }
  uint32_t v26 = v39;
  CFStringRef v40 = *(const __CFString **)(a1 + 40);
  if (!v40)
  {
    os_log_type_t v27 = 0;
    goto LABEL_81;
  }
  os_log_type_t v41 = stringToUTF8String(v40);
  if (!v41) {
    goto LABEL_72;
  }
  __int16 v42 = v41;
  unsigned int v43 = if_nametoindex(v41);
  free(v42);
  if (!v43
    || (size_t valuePtr = 0,
        *(_OWORD *)__CFString buf = xmmword_225FB19B0,
        *(_DWORD *)&uint8_t buf[16] = 3,
        *(_DWORD *)&buf[20] = v43,
        sysctl((int *)buf, 6u, 0, &valuePtr, 0, 0) < 0)
    || (__int16 v44 = (char *)malloc_type_malloc(valuePtr, 0x5CA7404EuLL)) == 0)
  {
LABEL_72:
    CFTypeID v49 = mysyslog_get_logger();
    os_log_type_t v50 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v49, v50))
    {
      *(_WORD *)__CFString buf = 0;
      _os_log_impl(&dword_225F82000, v49, v50, "VZWCopyHardwareAddressHexString: failed to obtain the WiFi interface MAC", buf, 2u);
    }
    os_log_type_t v27 = 0;
    goto LABEL_75;
  }
  uint64_t v45 = v44;
  if (sysctl((int *)buf, 6u, v44, &valuePtr, 0, 0) < 0 || !valuePtr)
  {
LABEL_71:
    free(v45);
    goto LABEL_72;
  }
  size_t v46 = 0;
  int v47 = 0;
  while (1)
  {
    int v48 = &v45[v46];
    if (v48[3] == 14) {
      break;
    }
    size_t v46 = v47 + *(unsigned __int16 *)v48;
    int v47 = v46;
    if (valuePtr <= v46) {
      goto LABEL_71;
    }
  }
  os_log_type_t v27 = dataCopyHexString((unsigned __int8 *)&v48[v48[117] + 120], v48[118]);
  free(v45);
  if (!v27) {
    goto LABEL_72;
  }
LABEL_81:
  CFDictionaryRef v51 = WISPrCredentialsDictionaryCreate(v21, v26);
  if (!v51)
  {
LABEL_75:
    os_log_type_t v28 = 0;
    goto LABEL_30;
  }
  CFDictionaryRef v52 = v51;
  CFDictionaryRef cf = v51;
  CFIndex Count = CFDictionaryGetCount(v51);
  os_log_type_t v28 = CFDictionaryCreateMutableCopy(0, Count + 3, v52);
  CFRelease(cf);
  if (v28)
  {
    CFDictionaryAddValue(v28, @"device-type", v16);
    CFDictionaryAddValue(v28, @"calling-station-id", v27);
    CFDictionaryAddValue(v28, @"device-model-number", @"iOS-devices");
  }
LABEL_30:
  (*(void (**)(void, __CFDictionary *))(a1 + 16))(*(void *)(a1 + 24), v28);
  if (!v17)
  {
    if (!v18) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_78:
  CFRelease(v17);
  if (v18) {
LABEL_32:
  }
    CFRelease(v18);
LABEL_33:
  if (v25) {
    CFRelease(v25);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v29) {
    CFRelease(v29);
  }
  if (v28) {
    CFRelease(v28);
  }
  uint64_t v31 = *(const void **)(a1 + 32);
  if (v31)
  {
    CFRelease(v31);
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v32 = *(const void **)(a1 + 40);
  if (v32) {
    CFRelease(v32);
  }
  free((void *)a1);
}

void VZWQueryAbort(uint64_t a1)
{
  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 48));
  CFAbsoluteTime Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 48), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  CFStringRef v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 48) = 0;
  }
  os_log_type_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 32) = 0;
  }
  id v5 = *(const void **)(a1 + 40);
  if (v5) {
    CFRelease(v5);
  }

  free((void *)a1);
}

char *addCFStringToHash(CC_SHA1_CTX *a1, CFStringRef theString)
{
  if (CFStringGetLength(theString) < 1) {
    return 0;
  }
  uint64_t result = stringToUTF8String(theString);
  if (result)
  {
    id v5 = result;
    CC_LONG v6 = strlen(result);
    CC_SHA1_Update(a1, v5, v6);
    free(v5);
    return (char *)1;
  }
  return result;
}

__CFString *dataCopyHexString(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  CFDictionaryRef Mutable = CFStringCreateMutable(0, 2 * a2);
  if (Mutable && v2)
  {
    do
    {
      unsigned int v5 = *a1++;
      CFStringAppendFormat(Mutable, 0, @"%02x", v5);
      --v2;
    }
    while (v2);
  }
  return Mutable;
}

char *stringToUTF8String(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v3 = Length + 1;
  if (Length == -1) {
    return 0;
  }
  os_log_type_t v4 = (char *)malloc_type_malloc(Length + 1, 0x7FEC8D0EuLL);
  if (v4) {
    CFStringGetCString(a1, v4, v3, 0x8000100u);
  }
  return v4;
}

void CNPluginMonitorHandlerInitialize()
{
}

uint64_t CNPluginMonitorHandlerPluginListChanged()
{
  CFDictionaryRef v0 = CNPluginMonitorHandlerCopyCurrentCommand();
  CommandHandlerListApplyFunction(6u, (uint64_t)CNPluginMonitorAppendCommand, (uint64_t)v0);
  CFRelease(v0);

  return notify_post("com.apple.networking.captive.CNPluginListChanged");
}

CFDictionaryRef CNPluginMonitorHandlerCopyCurrentCommand()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CFMutableArrayRef v0 = CNPluginStateListCopyDisplayIDs();
  CFIndex v1 = 1;
  int valuePtr = 1;
  os_log_type_t v9 = 0;
  CFMutableArrayRef v7 = 0;
  CFNumberRef v2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  keys = @"EventType";
  values = v2;
  if (v0)
  {
    os_log_type_t v9 = @"DisplayIDs";
    CFMutableArrayRef v7 = v0;
    CFIndex v1 = 2;
  }
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, v1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(v2);
  if (v0) {
    CFRelease(v0);
  }
  return v3;
}

uint64_t CNPluginMonitorAuthorize(long long *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v2 = a1[1];
  long long v7 = *a1;
  long long v8 = v2;
  if (!audit_token_get_euid(&v7)) {
    return 1;
  }
  long long v3 = a1[1];
  long long v7 = *a1;
  long long v8 = v3;
  uint64_t result = audit_token_has_BOOLean_entitlement(&v7, @"com.apple.captive.private");
  if (!result)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    uint64_t result = os_log_type_enabled(logger, v6);
    if (result)
    {
      LODWORD(v7) = 136315138;
      *(void *)((char *)&v7 + 4) = "com.apple.captive.private";
      _os_log_impl(&dword_225F82000, logger, v6, "CNPluginMonitor requires root or '%s' entitlement", (uint8_t *)&v7, 0xCu);
      return 0;
    }
  }
  return result;
}

uint64_t CNPluginMonitorRegister(uint64_t *a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CommandHandlerSetInformation(*a1, Mutable);
  CFRelease(Mutable);
  return 1;
}

void CNPluginMonitorRemove(uint64_t a1)
{
}

uint64_t CNPluginMonitorProvideCommand(uint64_t *a1)
{
  CFDictionaryRef Information = (const __CFDictionary *)CommandHandlerGetInformation(*a1);
  CFStringRef Value = CFDictionaryGetValue(Information, @"CommandList");
  if (Value)
  {
    a1[1] = (uint64_t)CFRetain(Value);
    os_log_type_t v4 = (__CFDictionary *)CommandHandlerGetInformation(*a1);
    if (v4) {
      CFDictionaryRemoveValue(v4, @"CommandList");
    }
  }
  return 1;
}

uint64_t CNPluginMonitorProcessResponse()
{
  return 0;
}

uint64_t CNPluginMonitorProcessControl(uint64_t a1)
{
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), @"Type");
  long long v3 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), @"EventType");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  uint64_t valuePtr = 0;
  uint64_t result = CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr);
  if (!result) {
    return result;
  }
  CFTypeID v6 = CFNumberGetTypeID();
  if (!v3 || CFGetTypeID(v3) != v6) {
    return 0;
  }
  int v7 = CFNumberGetValue((CFNumberRef)v3, kCFNumberSInt32Type, (char *)&valuePtr + 4);
  uint64_t result = 0;
  if (v7 && HIDWORD(valuePtr) == 1)
  {
    if (valuePtr == 1)
    {
      int v8 = 1;
      goto LABEL_14;
    }
    if (valuePtr == 2)
    {
      int v8 = 0;
LABEL_14:
      CNPluginMonitorSetIsEnabled(*(void *)a1, v8);
      return 1;
    }
    return 0;
  }
  return result;
}

void CNPluginMonitorSetIsEnabled(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFDictionaryRef Information = (const __CFDictionary *)CommandHandlerGetInformation(a1);
  if (Information)
  {
    unsigned int v5 = Information;
    if (CFDictionaryContainsKey(Information, @"IsEnabled") != a2)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v7 = _SC_syslog_os_log_mapping();
      BOOL v8 = os_log_type_enabled(logger, v7);
      if (a2)
      {
        if (v8)
        {
          int v11 = 67109120;
          int PID = CommandHandlerGetPID(a1);
          _os_log_impl(&dword_225F82000, logger, v7, "PluginMonitor ENABLE [pid %d]", (uint8_t *)&v11, 8u);
        }
        CFDictionarySetValue(v5, @"IsEnabled", (const void *)*MEMORY[0x263EFFB40]);
        CFDictionaryRef v9 = CNPluginMonitorHandlerCopyCurrentCommand();
        CNPluginMonitorAppendCommand(a1, v9);
        CFRelease(v9);
      }
      else
      {
        if (v8)
        {
          int v11 = 67109120;
          int PID = CommandHandlerGetPID(a1);
          _os_log_impl(&dword_225F82000, logger, v7, "PluginMonitor DISABLE [pid %d]", (uint8_t *)&v11, 8u);
        }
        CFDictionaryRemoveValue(v5, @"IsEnabled");
        uint64_t v10 = (__CFDictionary *)CommandHandlerGetInformation(a1);
        if (v10) {
          CFDictionaryRemoveValue(v10, @"CommandList");
        }
      }
    }
  }
}

uint64_t CNPluginMonitorAppendCommand(uint64_t a1, void *a2)
{
  values = a2;
  CFArrayRef v3 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  CNScanListFilterSetCommandList(a1, v3);
  CFRelease(v3);
  return CommandHandlerNotify(a1);
}

uint64_t audit_token_get_pid(_OWORD *a1)
{
  pid_t pidp = 0;
  long long v1 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v1;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  return pidp;
}

uint64_t audit_token_get_euid(_OWORD *a1)
{
  uid_t euidp = 0;
  long long v1 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v1;
  audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, 0, 0, 0);
  return euidp;
}

uint64_t audit_token_has_BOOLean_entitlement(_OWORD *a1, const __CFString *a2)
{
  long long v3 = a1[1];
  *(_OWORD *)v13.val = *a1;
  *(_OWORD *)&v13.val[4] = v3;
  os_log_type_t v4 = SecTaskCreateWithAuditToken(0, &v13);
  if (v4)
  {
    unsigned int v5 = v4;
    CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, a2, 0);
    if (v6)
    {
      CFBooleanRef v7 = v6;
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (CFGetTypeID(v7) == TypeID) {
        uint64_t Value = CFBooleanGetValue(v7);
      }
      else {
        uint64_t Value = 0;
      }
      CFRelease(v7);
    }
    else
    {
      uint64_t Value = 0;
    }
    CFRelease(v5);
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v11))
    {
      LOWORD(v13.val[0]) = 0;
      _os_log_impl(&dword_225F82000, logger, v11, "SecTaskCreateWithAuditToken failed", (uint8_t *)&v13, 2u);
    }
    return 0;
  }
  return Value;
}

BOOL isCallingInternalProcEntitled(_OWORD *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (isCallingInternalProcEntitled_once != -1) {
    dispatch_once(&isCallingInternalProcEntitled_once, &__block_literal_global_3);
  }
  if (!isCallingInternalProcEntitled_result) {
    return 0;
  }
  logger = mysyslog_get_logger();
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    long long v3 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v3;
    pid_t v4 = audit_token_to_pid(&atoken);
    proc_name(v4, &atoken, 0x40u);
    unsigned int v5 = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      int v11 = 136315138;
      p_audit_token_t atoken = &atoken;
      _os_log_impl(&dword_225F82000, v5, v6, "Process [%s] is requesting current Wi-Fi network information", (uint8_t *)&v11, 0xCu);
    }
  }
  CFBooleanRef v7 = (void *)xpc_copy_entitlement_for_token();
  if (!v7) {
    return 0;
  }
  BOOL v8 = v7;
  BOOL value = xpc_BOOL_get_value(v7);
  xpc_release(v8);
  return value;
}

uint64_t __isCallingInternalProcEntitled_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  isCallingInternalProcEntitled_uint64_t result = result;
  return result;
}

uint64_t IsChinaDevice()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((IsChinaDevice_done & 1) == 0)
  {
    IsChinaDevice_done = 1;
    CFMutableArrayRef v0 = (const void *)CPGetDeviceRegionCode();
    long long v1 = v0;
    if (v0) {
      BOOL v2 = CFEqual(v0, @"CH") != 0;
    }
    else {
      BOOL v2 = 0;
    }
    IsChinaDevice_is_china = v2;
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      int v6 = 138412290;
      CFBooleanRef v7 = v1;
      _os_log_impl(&dword_225F82000, logger, v4, "Region code is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return IsChinaDevice_is_china;
}

__CFRunLoopSource *my_CFRunLoopSourceCreateForBSDNotification(const char *a1, uint64_t a2, uint64_t a3, _DWORD *a4, __CFMachPort **a5)
{
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  *(void *)out_token = 0;
  if (notify_register_mach_port(a1, (mach_port_t *)&out_token[1], 0, out_token))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v9))
    {
      __int16 v20 = 0;
      _os_log_impl(&dword_225F82000, logger, v9, "notify_register_mach_port() failed", (uint8_t *)&v20, 2u);
    }
    return 0;
  }
  *((void *)&v22 + 1) = a3;
  uint64_t v10 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
  if (!v10)
  {
    os_log_type_t v15 = mysyslog_get_logger();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      __int16 v20 = 0;
      _os_log_impl(&dword_225F82000, v15, v16, "CFMachPortCreateWithPort() failed", (uint8_t *)&v20, 2u);
    }
    goto LABEL_12;
  }
  int v11 = v10;
  CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0, v10, 0);
  if (!RunLoopSource)
  {
    CFDictionaryRef v17 = mysyslog_get_logger();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      __int16 v20 = 0;
      _os_log_impl(&dword_225F82000, v17, v18, "CFMachPortCreateRunLoopSource() failed", (uint8_t *)&v20, 2u);
    }
    CFRelease(v11);
LABEL_12:
    notify_cancel(out_token[0]);
    return 0;
  }
  audit_token_t v13 = RunLoopSource;
  CFAbsoluteTime Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, v13, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  *a5 = v11;
  *a4 = out_token[0];
  return v13;
}

void CaptiveSetBundle(CFTypeRef cf)
{
}

uint64_t CaptiveGetBundle()
{
  return sBundleRef;
}

const void *CaptiveCopySettings()
{
  uint64_t result = (const void *)CaptiveCopySettings_settingsPlist;
  if (CaptiveCopySettings_settingsPlist) {
    goto LABEL_2;
  }
  if (!sBundleRef)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v12))
    {
      LOWORD(format[0]) = 0;
      _os_log_impl(&dword_225F82000, logger, v12, "CaptiveGetBundle is NULL", (uint8_t *)format, 2u);
    }
    return 0;
  }
  CFURLRef v1 = CFBundleCopyResourceURL((CFBundleRef)sBundleRef, @"Settings", @"plist", 0);
  if (v1)
  {
    CFURLRef v2 = v1;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    os_log_type_t v4 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], v1);
    unsigned int v5 = v4;
    if (v4 && CFReadStreamOpen(v4))
    {
      format[0] = 0;
      CFPropertyListRef v6 = CFPropertyListCreateWithStream(v3, v5, 0, 0, format, 0);
      CaptiveCopySettings_settingsPlist = (uint64_t)v6;
      if (v6)
      {
        CFBooleanRef v7 = v6;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (CFGetTypeID(v7) != TypeID)
        {
          os_log_type_t v9 = mysyslog_get_logger();
          os_log_type_t v10 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v9, v10))
          {
            *(_WORD *)CFDictionaryRef v17 = 0;
            _os_log_impl(&dword_225F82000, v9, v10, "Settings.plist is not a dictionary", v17, 2u);
          }
          if (CaptiveCopySettings_settingsPlist)
          {
            CFRelease((CFTypeRef)CaptiveCopySettings_settingsPlist);
            CaptiveCopySettings_settingsPlist = 0;
          }
        }
      }
    }
    else
    {
      audit_token_t v13 = mysyslog_get_logger();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v13, v14))
      {
        LOWORD(format[0]) = 0;
        _os_log_impl(&dword_225F82000, v13, v14, "Could not read Settings file", (uint8_t *)format, 2u);
      }
      if (!v5) {
        goto LABEL_20;
      }
    }
    CFRelease(v5);
LABEL_20:
    CFRelease(v2);
    goto LABEL_23;
  }
  os_log_type_t v15 = mysyslog_get_logger();
  os_log_type_t v16 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v15, v16))
  {
    LOWORD(format[0]) = 0;
    _os_log_impl(&dword_225F82000, v15, v16, "Could not locate Settings file", (uint8_t *)format, 2u);
  }
LABEL_23:
  uint64_t result = (const void *)CaptiveCopySettings_settingsPlist;
  if (CaptiveCopySettings_settingsPlist)
  {
LABEL_2:
    CFRetain(result);
    return (const void *)CaptiveCopySettings_settingsPlist;
  }
  return result;
}

const void *CaptiveCopyProbeSettings()
{
  CFDictionaryRef v0 = (const __CFDictionary *)CaptiveCopySettings();
  if (!v0) {
    return 0;
  }
  CFDictionaryRef v1 = v0;
  uint64_t Value = CFDictionaryGetValue(v0, @"ProbeParameters");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID) {
      CFRetain(Value);
    }
    else {
      uint64_t Value = 0;
    }
  }
  CFRelease(v1);
  return Value;
}

void NetCacheEntryDestroy(uint64_t *a1)
{
  NetCacheEntryLog("Destroy: ", (uint64_t)a1);
  uint64_t v2 = *a1;
  if (*a1) {
    *(void *)(v2 + 8) = a1[1];
  }
  *(void *)a1[1] = v2;
  CFAllocatorRef v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  os_log_type_t v4 = (const void *)a1[5];
  if (v4)
  {
    CFRelease(v4);
    a1[5] = 0;
  }
  unsigned int v5 = (const void *)a1[6];
  if (v5)
  {
    CFRelease(v5);
    a1[6] = 0;
  }
  CFPropertyListRef v6 = (const void *)a1[7];
  if (v6)
  {
    CFRelease(v6);
    a1[7] = 0;
  }
  CFBooleanRef v7 = (const void *)a1[8];
  if (v7) {
    CFRelease(v7);
  }

  free(a1);
}

void NetCacheEntryLog(const char *a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v4 = *(unsigned __int8 *)(a2 + 24);
  logger = mysyslog_get_logger();
  os_log_type_t v6 = _SC_syslog_os_log_mapping();
  BOOL v7 = os_log_type_enabled(logger, v6);
  if (v4)
  {
    if (!v7) {
      return;
    }
    uint64_t v8 = *(void *)(a2 + 16);
    os_log_type_t v9 = "";
    uint64_t v11 = *(void *)(a2 + 40);
    uint64_t v10 = *(void *)(a2 + 48);
    if (a1) {
      os_log_type_t v9 = a1;
    }
    uint64_t v12 = *(void *)(a2 + 32);
    int v21 = 136316418;
    long long v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = a2;
    __int16 v25 = 2048;
    uint64_t v26 = v8;
    __int16 v27 = 2112;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    uint64_t v30 = v12;
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    audit_token_t v13 = "%s<%p> %0.09g DisplayID %@ SSID=%@ Signatures=%@";
    os_log_type_t v14 = logger;
    os_log_type_t v15 = v6;
    uint32_t v16 = 62;
  }
  else
  {
    if (!v7) {
      return;
    }
    uint64_t v17 = *(void *)(a2 + 16);
    os_log_type_t v18 = "";
    if (a1) {
      os_log_type_t v18 = a1;
    }
    uint64_t v19 = *(void *)(a2 + 32);
    uint64_t v20 = *(void *)(a2 + 40);
    int v21 = 136316162;
    long long v22 = v18;
    __int16 v23 = 2048;
    uint64_t v24 = a2;
    __int16 v25 = 2048;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    uint64_t v28 = v19;
    __int16 v29 = 2112;
    uint64_t v30 = v20;
    audit_token_t v13 = "%s<%p> %0.09g Not Captive SSID=%@ Signatures=%@";
    os_log_type_t v14 = logger;
    os_log_type_t v15 = v6;
    uint32_t v16 = 52;
  }
  _os_log_impl(&dword_225F82000, v14, v15, v13, (uint8_t *)&v21, v16);
}

uint64_t NetCacheEntryGetIsCaptive(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t NetCacheEntryGetLogoffURL(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

void NetCacheEntrySetLogoffURL(uint64_t a1, const void *a2)
{
}

uint64_t NetCacheEntryGetRedirectionURL(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 64;
  uint64_t result = *(void *)(a1 + 64);
  *a2 = *(void *)(v3 + 8);
  return result;
}

void NetCacheEntrySetRedirectionURL(uint64_t a1, const void *a2, uint64_t a3)
{
  *(void *)(a1 + 72) = a3;
}

void *NetCacheCreate()
{
  uint64_t result = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  *uint64_t result = 0;
  return result;
}

void *NetCacheApplyFunction(void **a1, uint64_t (*a2)(void))
{
  uint64_t result = *a1;
  do
  {
    if (!result) {
      break;
    }
    int v4 = (void *)*result;
    int v5 = a2();
    uint64_t result = v4;
  }
  while (v5);
  return result;
}

uint64_t *NetCacheLookupEntry(uint64_t **a1, const __CFArray *a2, const void *a3, double a4)
{
  if (a2)
  {
    int v4 = *a1;
    if (*a1)
    {
      int v8 = 0;
      do
      {
        while (1)
        {
          os_log_type_t v9 = v4;
          int v4 = (uint64_t *)*v4;
          if (!v8) {
            break;
          }
LABEL_11:
          NetCacheEntryDestroy(v9);
          if (!v4) {
            return 0;
          }
        }
        if (*((double *)v9 + 2) + 259200.0 <= a4)
        {
          int v8 = 1;
          goto LABEL_11;
        }
        if (my_CFEqual(a3, (const void *)v9[4])
          && my_CFArrayContainsAnyArrayValues((CFArrayRef)v9[5], a2))
        {
          return v9;
        }
        int v8 = 0;
      }
      while (v4);
    }
  }
  return 0;
}

void *NetCacheUpdateEntry(uint64_t **a1, CFArrayRef theArray, const void *a3, char a4, const void *a5, double a6)
{
  if (!theArray || !CFArrayGetCount(theArray)) {
    return 0;
  }
  uint64_t v12 = NetCacheLookupEntry(a1, theArray, a3, a6);
  if (v12)
  {
    NetCacheEntryLog("Remove: ", (uint64_t)v12);
    uint64_t v13 = *v12;
    if (*v12) {
      *(void *)(v13 + 8) = v12[1];
    }
    *(void *)v12[1] = v13;
    os_log_type_t v14 = v12;
  }
  else
  {
    os_log_type_t v14 = malloc_type_malloc(0x50uLL, 0x10E00407254A7C1uLL);
    *(_OWORD *)os_log_type_t v14 = 0u;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 3) = 0u;
    *((_OWORD *)v14 + 4) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
    my_FieldSetRetainedCFType((const void **)v14 + 4, a3);
  }
  my_FieldSetRetainedCFType((const void **)v14 + 5, theArray);
  *((double *)v14 + 2) = a6;
  *((unsigned char *)v14 + 24) = a4;
  my_FieldSetRetainedCFType((const void **)v14 + 6, a5);
  os_log_type_t v15 = *a1;
  *(void *)os_log_type_t v14 = *a1;
  if (v15) {
    v15[1] = (uint64_t)v14;
  }
  *a1 = (uint64_t *)v14;
  *((void *)v14 + 1) = a1;
  if (v12) {
    uint32_t v16 = "Add: ";
  }
  else {
    uint32_t v16 = "New: ";
  }
  NetCacheEntryLog(v16, (uint64_t)v14);
  return v14;
}

uint64_t CNSServer_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 28047727) >= 0xFFFFFFE6) {
    return (uint64_t)*(&CNSServerCNSServer_subsystem + 5 * (v1 - 28047701) + 5);
  }
  else {
    return 0;
  }
}

const char *_XParsePost(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_31;
  }
  uint64_t v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x44 || v4 > 0x4044) {
    goto LABEL_31;
  }
  unsigned int v6 = *((_DWORD *)result + 10);
  if (v6 > 0x1000) {
    goto LABEL_31;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 68 < v6 || v4 < v7 + 68) {
    goto LABEL_31;
  }
  os_log_type_t v9 = (char *)&result[v7];
  unsigned int v10 = *((_DWORD *)v9 + 12);
  if (v10 > 0x1000) {
    goto LABEL_31;
  }
  unsigned int v11 = v4 - v7;
  unsigned int v12 = (v10 + 3) & 0xFFFFFFFC;
  if (v11 - 68 < v10 || v11 < v12 + 68) {
    goto LABEL_31;
  }
  os_log_type_t v14 = v9 - 4096;
  uint64_t v15 = (uint64_t)&v9[v12 - 4096];
  unsigned int v16 = *(_DWORD *)(v15 + 4152);
  if (v16 > 0x1000) {
    goto LABEL_31;
  }
  unsigned int v17 = v11 - v12;
  unsigned int v18 = (v16 + 3) & 0xFFFFFFFC;
  if (v17 - 68 < v16 || v17 < v18 + 68) {
    goto LABEL_31;
  }
  uint64_t v20 = v15 - 4096;
  unsigned int v21 = v17 - v18;
  uint64_t v22 = v15 - 4096 + v18;
  unsigned int v23 = *(_DWORD *)(v22 + 8256);
  BOOL v24 = v23 <= 0x1000 && v21 - 68 >= v23;
  unsigned int v25 = ((v23 + 3) & 0xFFFFFFFC) + 68;
  if (!v24 || v21 != v25) {
    goto LABEL_31;
  }
  uint64_t v29 = 4140;
  if (*((unsigned int *)result + 1) < 0x102CuLL) {
    uint64_t v29 = *((unsigned int *)result + 1);
  }
  uint64_t result = (const char *)memchr((void *)(result + 44), 0, v29 - 44);
  if (!result) {
    goto LABEL_31;
  }
  uint64_t v30 = &v3[v4];
  __int16 v31 = v14 + 4148;
  size_t v32 = &v3[v4] - v31 >= 4096 ? 4096 : &v3[v4] - v31;
  uint64_t result = (const char *)memchr(v31, 0, v32);
  if (!result
    || ((uint64_t v33 = (unsigned char *)(v20 + 8252), v30 - v33 >= 4096) ? (v34 = 4096) : (v34 = v30 - v33),
        (uint64_t result = (const char *)memchr(v33, 0, v34)) == 0
     || ((v35 = (unsigned char *)(v22 + 8260), v30 - v35 >= 4096) ? (size_t v36 = 4096) : (size_t v36 = v30 - v35),
         (uint64_t result = (const char *)memchr(v35, 0, v36)) == 0)))
  {
LABEL_31:
    int v27 = -304;
LABEL_32:
    *(_DWORD *)(a2 + 32) = v27;
    uint64_t v28 = *MEMORY[0x263EF80C8];
    goto LABEL_33;
  }
  uint64_t v37 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v37 || *((_DWORD *)v37 + 1) <= 0x1Fu)
  {
    int v27 = -309;
    goto LABEL_32;
  }
  uint64_t result = (const char *)CNSServerParsePost(*((unsigned int *)v3 + 3), *((_DWORD *)v3 + 8), v3 + 44, v31, v33, v35, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v28 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v28;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_33:
  *(void *)(a2 + 24) = v28;
  return result;
}

const char *_XLogoff(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_13;
  }
  uint64_t v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  BOOL v5 = v4 < 0x28 || v4 > 0x1028;
  if (v5
    || ((v6 = *((_DWORD *)result + 9), v6 <= 0x1000) ? (BOOL v7 = (int)v4 - 40 >= v6) : (BOOL v7 = 0),
        (unsigned int v8 = ((v6 + 3) & 0xFFFFFFFC) + 40, v7) ? (v9 = v4 == v8) : (v9 = 0),
        !v9 || (uint64_t result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
LABEL_13:
    int v10 = -304;
  }
  else
  {
    unsigned int v11 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v11 && *((_DWORD *)v11 + 1) > 0x1Fu)
    {
      uint64_t result = (const char *)CNSServerLogoff(*((unsigned int *)v3 + 3), *((_DWORD *)v3 + 2), v3 + 40);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_15;
    }
    int v10 = -309;
  }
  *(_DWORD *)(a2 + 32) = v10;
LABEL_15:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

uint64_t _XForgetNetwork(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0
    && (uint64_t v3 = *(unsigned int *)(result + 4), v3 >= 0x24)
    && v3 <= 0x424
    && ((CFIndex v4 = *(unsigned int *)(result + 32), v4 <= 0x400)
      ? (BOOL v5 = (int)v3 - 36 >= v4)
      : (BOOL v5 = 0),
        v5 ? (BOOL v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 36) : (BOOL v6 = 0),
        v6))
  {
    unsigned int v8 = (_DWORD *)(((v3 + 3) & 0x1FFFFFFFCLL) + result);
    if (!*v8 && v8[1] > 0x1Fu)
    {
      uint64_t result = CNSServerForgetNetwork(*(_DWORD *)(result + 12), (const UInt8 *)(result + 36), v4);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v7 = -309;
  }
  else
  {
    int v7 = -304;
  }
  *(_DWORD *)(a2 + 32) = v7;
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

uint64_t _XPurgeAccountRecord(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0
    && (uint64_t v3 = *(unsigned int *)(result + 4), v3 >= 0x24)
    && v3 <= 0x424
    && ((CFIndex v4 = *(unsigned int *)(result + 32), v4 <= 0x400)
      ? (BOOL v5 = (int)v3 - 36 >= v4)
      : (BOOL v5 = 0),
        v5 ? (BOOL v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 36) : (BOOL v6 = 0),
        v6))
  {
    unsigned int v8 = (_DWORD *)(((v3 + 3) & 0x1FFFFFFFCLL) + result);
    if (!*v8 && v8[1] > 0x1Fu)
    {
      uint64_t result = CNSServerPurgeAccountRecord(*(_DWORD *)(result + 12), (const UInt8 *)(result + 36), v4);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v7 = -309;
  }
  else
  {
    int v7 = -304;
  }
  *(_DWORD *)(a2 + 32) = v7;
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

uint64_t _XDebugLaunchWebsheet(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x263EF80C8];
    goto LABEL_11;
  }
  uint64_t v6 = *(unsigned int *)(result + 12);
  int v7 = *(UInt8 **)(result + 28);
  long long v8 = *(_OWORD *)(result + 92);
  v9[0] = *(_OWORD *)(result + 76);
  v9[1] = v8;
  uint64_t result = CNSServerDebugLaunchWebsheet(v6, v7, v3, (_DWORD *)(a2 + 36), v9);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_11:
  *(void *)(a2 + 24) = v5;
  return result;
}

_DWORD *_XDumpState(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  }
  else
  {
    uint64_t result = (_DWORD *)CNSServerDumpState();
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_XCopySupportedInterfaces(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)CNSServerCopySupportedInterfaces(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52), (_DWORD *)(a2 + 56));
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 60;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

_DWORD *_XCopyCurrentNetworkInfo(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_13;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  BOOL v5 = v4 < 0x2C || v4 > 0x102C;
  if (v5
    || ((v6 = result[10], v6 <= 0x1000) ? (BOOL v7 = (int)v4 - 44 >= v6) : (BOOL v7 = 0),
        (unsigned int v8 = ((v6 + 3) & 0xFFFFFFFC) + 44, v7) ? (v9 = v4 == v8) : (v9 = 0),
        !v9 || (uint64_t result = memchr(result + 11, 0, v4 - 44)) == 0))
  {
LABEL_13:
    int v10 = -304;
LABEL_14:
    *(_DWORD *)(a2 + 32) = v10;
    goto LABEL_15;
  }
  unsigned int v11 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
  if (*v11 || v11[1] <= 0x1Fu)
  {
    int v10 = -309;
    goto LABEL_14;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)CNSServerCopyCurrentNetworkInfo(v3[3], v3[8], (uint64_t)(v3 + 11), (void *)(a2 + 28), (_DWORD *)(a2 + 52), (_DWORD *)(a2 + 56));
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 60;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_15:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

_DWORD *_XCopyAccountList(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)CNSServerCopyAccountList(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52), (_DWORD *)(a2 + 56));
  if (!result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 60;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

const char *_XAddAccount(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_44;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x40 || v4 > 0x3440) {
    goto LABEL_44;
  }
  unsigned int v6 = *((_DWORD *)result + 9);
  if (v6 > 0x1000) {
    goto LABEL_44;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 64 < v6 || v4 < v7 + 64) {
    goto LABEL_44;
  }
  BOOL v9 = (char *)&result[v7];
  unsigned int v10 = *((_DWORD *)v9 + 10);
  if (v10 > 0x400) {
    goto LABEL_44;
  }
  unsigned int v11 = v4 - v7;
  unsigned int v12 = (v10 + 3) & 0xFFFFFFFC;
  if (v11 - 64 < v10 || v11 < v12 + 64) {
    goto LABEL_44;
  }
  os_log_type_t v14 = v9 - 4096;
  uint64_t v15 = (uint64_t)&v9[v12 - 4096];
  unsigned int v16 = *(_DWORD *)(v15 + 4144);
  if (v16 > 0x1000) {
    goto LABEL_44;
  }
  unsigned int v17 = v11 - v12;
  unsigned int v18 = (v16 + 3) & 0xFFFFFFFC;
  if (v17 - 64 < v16 || v17 < v18 + 64) {
    goto LABEL_44;
  }
  uint64_t v20 = v15 - 1024;
  uint64_t v21 = v15 - 1024 + v18;
  unsigned int v22 = *(_DWORD *)(v21 + 5176);
  if (v22 > 0x1000) {
    goto LABEL_44;
  }
  unsigned int v23 = (v22 + 3) & 0xFFFFFFFC;
  unsigned int v24 = v17 - v18;
  if (v24 - 64 < v22 || v24 != v23 + 64) {
    goto LABEL_44;
  }
  uint64_t v26 = 4136;
  if (*((unsigned int *)result + 1) < 0x1028uLL) {
    uint64_t v26 = *((unsigned int *)result + 1);
  }
  uint64_t result = (const char *)memchr((void *)(result + 40), 0, v26 - 40);
  if (!result) {
    goto LABEL_44;
  }
  int v27 = &v3[v4];
  uint64_t v28 = (unsigned char *)(v20 + 5172);
  size_t v29 = &v3[v4] - v28 >= 4096 ? 4096 : &v3[v4] - v28;
  uint64_t result = (const char *)memchr(v28, 0, v29);
  if (!result
    || ((v38 = v21 - 4096, uint64_t v30 = (unsigned char *)(v21 + 5180), v27 - v30 >= 4096) ? (v31 = 4096) : (v31 = v27 - v30),
        (uint64_t result = (const char *)memchr(v30, 0, v31)) == 0))
  {
LABEL_44:
    int v33 = -304;
    goto LABEL_45;
  }
  size_t v32 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v32 || *((_DWORD *)v32 + 1) <= 0x1Fu)
  {
    int v33 = -309;
LABEL_45:
    *(_DWORD *)(a2 + 32) = v33;
    uint64_t v34 = *MEMORY[0x263EF80C8];
    goto LABEL_46;
  }
  uint64_t v35 = *((unsigned int *)v3 + 3);
  int v36 = *(_DWORD *)(v38 + v23 + 9276);
  long long v37 = *(_OWORD *)(v32 + 36);
  v39[0] = *(_OWORD *)(v32 + 20);
  v39[1] = v37;
  uint64_t result = (const char *)CNSServerAddAccount(v35, v3 + 40, (const UInt8 *)v14 + 4140, v10, v28, v30, v36, (int *)(a2 + 36), v39);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v34 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v34;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_46:
  *(void *)(a2 + 24) = v34;
  return result;
}

_DWORD *_XResolveAccount(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_13;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  BOOL v5 = v4 < 0x28 || v4 > 0x1028;
  if (v5
    || ((v6 = result[9], v6 <= 0x1000) ? (BOOL v7 = (int)v4 - 40 >= v6) : (BOOL v7 = 0),
        (unsigned int v8 = ((v6 + 3) & 0xFFFFFFFC) + 40, v7) ? (v9 = v4 == v8) : (v9 = 0),
        !v9 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0))
  {
LABEL_13:
    int v10 = -304;
LABEL_14:
    *(_DWORD *)(a2 + 32) = v10;
    uint64_t v11 = *MEMORY[0x263EF80C8];
    goto LABEL_15;
  }
  unsigned int v12 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
  if (*v12 || v12[1] <= 0x1Fu)
  {
    int v10 = -309;
    goto LABEL_14;
  }
  uint64_t result = (_DWORD *)CNSServerResolveAccount(v3[3], (uint64_t)(v3 + 10), (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v11 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v11;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_15:
  *(void *)(a2 + 24) = v11;
  return result;
}

uint64_t _XAuthenticateUsing(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v5 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(result + 4);
  if (v6 < 0x40 || v6 > 0x2040) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1179648)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v8 = *(_DWORD *)(result + 52);
  if (v8 > 0x1000) {
    goto LABEL_2;
  }
  int v3 = -304;
  if ((int)v6 - 64 < v8) {
    goto LABEL_3;
  }
  unsigned int v9 = (v8 + 3) & 0xFFFFFFFC;
  if (v6 < v9 + 64) {
    goto LABEL_3;
  }
  int v10 = v6 - v9;
  uint64_t v11 = result + v9;
  unsigned int v12 = *(_DWORD *)(v11 + 60);
  BOOL v13 = v12 <= 0x1000 && v10 - 64 >= v12;
  if (!v13 || v10 != ((v12 + 3) & 0xFFFFFFFC) + 64) {
    goto LABEL_2;
  }
  uint64_t v14 = 4152;
  if (*(unsigned int *)(result + 4) < 0x1038uLL) {
    uint64_t v14 = *(unsigned int *)(result + 4);
  }
  uint64_t result = (uint64_t)memchr((void *)(result + 56), 0, v14 - 56);
  if (!result
    || ((v15 = (void *)(v11 + 64), v5 + v6 - (uint64_t)v15 >= 4096) ? (size_t v16 = 4096) : (size_t v16 = v5 + v6 - (void)v15),
        (uint64_t result = (uint64_t)memchr(v15, 0, v16)) == 0))
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x263EF80C8];
    goto LABEL_4;
  }
  unsigned int v17 = (_DWORD *)(((v6 + 3) & 0x1FFFFFFFCLL) + v5);
  if (*v17 || v17[1] <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  uint64_t result = CNSServerAuthenticateUsing(*(unsigned int *)(v5 + 12), (const char *)(v5 + 56), (const char *)v15, (int *)(a2 + 36), *(_DWORD *)(v5 + 28));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _XAuthenticateUsingToken(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v5 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(result + 4);
  if (v6 < 0x3C || v6 > 0x143C) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1179648)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v8 = *(_DWORD *)(result + 52);
  if (v8 > 0x1000) {
    goto LABEL_2;
  }
  int v3 = -304;
  if ((int)v6 - 60 < v8) {
    goto LABEL_3;
  }
  unsigned int v9 = (v8 + 3) & 0xFFFFFFFC;
  if (v6 < v9 + 60) {
    goto LABEL_3;
  }
  int v10 = v6 - v9;
  uint64_t v11 = result + v9;
  unsigned int v12 = *(_DWORD *)(v11 + 56);
  unsigned int v13 = v6 - v9 - 60;
  BOOL v14 = v12 <= 0x400 && v13 >= v12;
  if (!v14 || v10 != ((v12 + 3) & 0xFFFFFFFC) + 60) {
    goto LABEL_2;
  }
  uint64_t v15 = 4152;
  if (*(unsigned int *)(result + 4) < 0x1038uLL) {
    uint64_t v15 = *(unsigned int *)(result + 4);
  }
  uint64_t result = (uint64_t)memchr((void *)(result + 56), 0, v15 - 56);
  if (!result)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x263EF80C8];
    goto LABEL_4;
  }
  uint64_t v16 = ((v6 + 3) & 0x1FFFFFFFCLL) + v5;
  if (*(_DWORD *)v16 || *(_DWORD *)(v16 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  uint64_t v17 = *(unsigned int *)(v5 + 12);
  int v18 = *(_DWORD *)(v5 + 28);
  long long v19 = *(_OWORD *)(v16 + 36);
  v20[0] = *(_OWORD *)(v16 + 20);
  v20[1] = v19;
  uint64_t result = CNSServerAuthenticateUsingToken(v17, (const char *)(v5 + 56), (const UInt8 *)(v11 + 60), v12, (int *)(a2 + 36), v18, v20);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _XConnectionEstablish(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 68)
  {
    int v3 = -304;
    goto LABEL_11;
  }
  if (*(unsigned char *)(result + 39) != 1
    || *(unsigned __int16 *)(result + 54) << 16 != 1114112
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 64))
  {
    int v3 = -300;
    goto LABEL_11;
  }
  if (*(_DWORD *)(result + 68) || *(_DWORD *)(result + 72) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }
  uint64_t v4 = (_DWORD *)(a2 + 28);
  *(void *)(a2 + 32) = 0x11000000000000;
  int v5 = *(_DWORD *)(result + 12);
  uint64_t v6 = *(UInt8 **)(result + 28);
  unsigned int v7 = *(_DWORD *)(result + 40);
  mach_port_name_t v8 = *(_DWORD *)(result + 44);
  long long v9 = *(_OWORD *)(result + 104);
  v10[0] = *(_OWORD *)(result + 88);
  v10[1] = v9;
  uint64_t result = CNSServerConnectionEstablish(v5, v6, v7, v8, v4, (int *)(a2 + 48), v10);
  if (!result)
  {
    *(void *)(a2 + 40) = *MEMORY[0x263EF80C8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_12:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

_DWORD *_XConnectionGetCommandInfo(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)CNSServerConnectionGetCommandInfo(result[3], (const __CFData **)(a2 + 28), (_DWORD *)(a2 + 52), (int *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XConnectionProvideResponse(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x263EF80C8];
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }
  uint64_t result = CNSServerConnectionProvideResponse(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _XConnectionSendCmdAck(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x263EF80C8];
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }
  uint64_t result = CNSServerConnectionSendCmdAck(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + 24) = v4;
  return result;
}

_DWORD *_XCopyLandingPageURL(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)CNSServerCopyLandingPageURL(result[3], (void *)(a2 + 28), (_DWORD *)(a2 + 52), (void *)(a2 + 56), (_DWORD *)(a2 + 64));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 68;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XConnectionProcessControl(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = CNSServerConnectionProcessControl(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), *(_DWORD *)(result + 40), (const __CFData **)(a2 + 28), (_DWORD *)(a2 + 52), (int *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *_XUserInteractionIsRequired(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x263EF80C8];
    goto LABEL_8;
  }
  uint64_t v6 = result[3];
  long long v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = (_DWORD *)CNSServerUserInteractionIsRequired(v6, (int *)(a2 + 36), (_DWORD *)(a2 + 40), v8);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t CNSServer_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 28047727) >= 0xFFFFFFE6
    && (uint64_t v5 = (void (*)(void))*(&CNSServerCNSServer_subsystem + 5 * (v4 - 28047701) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t LogoffReply(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF80C8];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 28047703;
  msg.mach_port_t msgh_remote_port = a1;
  msg.mach_port_name_t msgh_local_port = 0;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t AuthenticateUsingReply(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF80C8];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 28047705;
  msg.mach_port_t msgh_remote_port = a1;
  msg.mach_port_name_t msgh_local_port = 0;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x270F5D220]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x270EE42E0](theArray, range.location, range.length, value, comparator, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x270EE4540](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4548](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x270EE4570](locArray, prefArray);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x270EE4580]();
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x270EE46C8](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x270EE46D0](calendar, v3, at);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  MEMORY[0x270EE48D0](theDate, otherDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x270EE4B00](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B90]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x270EE4D60](propertyList, stream, format, options, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFTypeID CFRunLoopGetTypeID(void)
{
  return MEMORY[0x270EE4E78]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x270EE4F00](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x270EE50A0](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50A8](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.CFIndex location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5330](anURL);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x270EE5358](anURL, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE53D0](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapesUsingEncoding(CFAllocatorRef allocator, CFStringRef origString, CFStringRef charsToLeaveEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE53E0](allocator, origString, charsToLeaveEscaped, *(void *)&encoding);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x270EE5528](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5530](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x270F0CD50]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x270EF4000](notifier);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x270F4A8C0]();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x270F054F8](store, keys, patterns);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270F05510](allocator, store, order);
}

SCDynamicStoreRef SCDynamicStoreCreateWithOptions(CFAllocatorRef allocator, CFStringRef name, CFDictionaryRef storeOptions, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05518](allocator, name, storeOptions, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05538](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05540](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x270F05560](store, keys, patterns);
}

Boolean SCDynamicStoreSetValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x270F05568](store, key, value);
}

int SCError(void)
{
  return MEMORY[0x270F05570]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x270F05578](*(void *)&status);
}

uint64_t SCNetworkInterfaceAdvisoryIsSpecificSet()
{
  return MEMORY[0x270F05588]();
}

uint64_t SCNetworkInterfaceCopyAdvisoryNotificationKey()
{
  return MEMORY[0x270F05590]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055A8](interface);
}

uint64_t SCNetworkInterfaceSetAdvisory()
{
  return MEMORY[0x270F055D0]();
}

uint64_t SCNetworkInterfaceSetPrimaryRank()
{
  return MEMORY[0x270F055D8]();
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x270F056F0](prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x270F056F8](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05710](prefs, key);
}

Boolean SCPreferencesRemoveValue(SCPreferencesRef prefs, CFStringRef key)
{
  return MEMORY[0x270F05720](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x270F05728](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x270F05730](prefs, callout, context);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x270F05750](prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x270F4B418]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x270F4B438]();
}

uint64_t WiFiDeviceClientDisassociate()
{
  return MEMORY[0x270F4B440]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x270F4B450]();
}

uint64_t WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback()
{
  return MEMORY[0x270F4B470]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x270F4B4A0]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x270F4B4C8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiManagerClientDisableNetwork()
{
  return MEMORY[0x270F4B528]();
}

uint64_t WiFiManagerClientEnableNetwork()
{
  return MEMORY[0x270F4B540]();
}

uint64_t WiFiManagerClientGetDevice()
{
  return MEMORY[0x270F4B548]();
}

uint64_t WiFiManagerClientIsNetworkEnabled()
{
  return MEMORY[0x270F4B598]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x270F4B5E0]();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return MEMORY[0x270F4B600]();
}

uint64_t WiFiManagerClientRemoveNetwork()
{
  return MEMORY[0x270F4B610]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x270F4B620]();
}

uint64_t WiFiManagerClientSetNetworkProperty()
{
  return MEMORY[0x270F4B658]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x270F4B688]();
}

uint64_t WiFiManagerClientTemporarilyDisableNetwork()
{
  return MEMORY[0x270F4B698]();
}

uint64_t WiFiNetworkGetBundleIdentifier()
{
  return MEMORY[0x270F4B710]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x270F4B770]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x270F4B780]();
}

uint64_t WiFiNetworkGetSSIDData()
{
  return MEMORY[0x270F4B790]();
}

uint64_t WiFiNetworkGetType()
{
  return MEMORY[0x270F4B798]();
}

uint64_t WiFiNetworkIsEAP()
{
  return MEMORY[0x270F4B7C8]();
}

uint64_t WiFiNetworkIsWEP()
{
  return MEMORY[0x270F4B810]();
}

uint64_t WiFiNetworkIsWPA()
{
  return MEMORY[0x270F4B818]();
}

uint64_t WiFiNetworkSetProperty()
{
  return MEMORY[0x270F4B868]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CTServerConnectionCopySystemCapabilities()
{
  return MEMORY[0x270EE87A8]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x270EE87D0]();
}

uint64_t _SCNetworkInterfaceCopyActive()
{
  return MEMORY[0x270F05778]();
}

uint64_t _SCNetworkInterfaceCreateWithBSDName()
{
  return MEMORY[0x270F05780]();
}

uint64_t _SC_CFMachPortCreateWithPort()
{
  return MEMORY[0x270F057B0]();
}

uint64_t _SC_cfstring_to_cstring()
{
  return MEMORY[0x270F057C0]();
}

uint64_t _SC_sendMachMessage()
{
  return MEMORY[0x270F057C8]();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x270F057D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _scprefs_observer_watch()
{
  return MEMORY[0x270F057F8]();
}

void abort(void)
{
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x270F18A78]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8768](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x270EDA220](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint64_t managed_event_fetch()
{
  return MEMORY[0x270F79540]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x270EDA778](name, notify_port, *(void *)&flags, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x270EDA7B0]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x270EDA7E8]();
}

uint64_t nwi_state_get_ifstate()
{
  return MEMORY[0x270EDA800]();
}

uint64_t nwi_state_get_notify_key()
{
  return MEMORY[0x270EDA810]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x270EDA820]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x270F794F8]();
}

uint64_t symptom_new()
{
  return MEMORY[0x270F79508]();
}

uint64_t symptom_send()
{
  return MEMORY[0x270F79520]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x270F79530]();
}

uint64_t symptom_set_qualifier()
{
  return MEMORY[0x270F79538]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x270EDBAB0](*(void *)&target_task, address, size, data, dataCnt);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDBAF0](msg);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}