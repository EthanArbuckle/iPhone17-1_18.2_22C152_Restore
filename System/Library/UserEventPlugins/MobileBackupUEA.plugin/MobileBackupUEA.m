void sub_5438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14, id *a15)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a15);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v17 - 152));
  _Unwind_Resume(a1);
}

void sub_54F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[5];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_55C8;
    block[3] = &unk_C308;
    id v11 = v6;
    id v12 = v5;
    v13 = v8;
    dispatch_async(v9, block);
  }
}

void sub_55C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = MBGetDefaultLog();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Registering ACMonitoredAccountStore failed:%@", buf, 0xCu);
      _MBLog();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 134217984;
      id v19 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Loading %lu accounts", buf, 0xCu);
      id v12 = [*(id *)(a1 + 40) count];
      _MBLog();
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = *(id *)(a1 + 40);
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(a1 + 48), "_updateEnabledStateForAccount:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11), v12);
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    [*(id *)(a1 + 48) _updateGlobalEnabledState];
  }
}

void sub_57B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && [WeakRetained enabled])
  {
    int v3 = MKBGetDeviceLockState();
    v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v6 = kMobileKeyBagLockStatusNotifyToken;
      __int16 v7 = 1024;
      int v8 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Received %{public}s: %d", buf, 0x12u);
      _MBLog();
    }

    if (v3)
    {
      if (v3 == 1)
      {
        [v2 setIsLocked:1];
      }
      else if (v3 == 2)
      {
        [v2 notifyDaemonThatKeyBagIsLocking];
      }
    }
    else
    {
      [v2 notifyDaemonThatKeyBagIsUnlocked];
    }
  }
}

void sub_58EC(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  int v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v8 = kSBSLockStateNotifyKey;
    __int16 v9 = 2048;
    uint64_t v10 = state64;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "Received %{public}s: %llu", buf, 0x16u);
    _MBLog();
  }

  BOOL v4 = state64 != 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsLocked:v4];
}

uint64_t sub_5A08(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(_DWORD *)(v2 + 8) != -1)
  {
    result = (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
    uint64_t v2 = *(void *)(v1 + 32);
  }
  if (*(_DWORD *)(v2 + 20) != -1)
  {
    int v3 = *(uint64_t (**)(void))(*(void *)(v1 + 48) + 16);
    return v3();
  }
  return result;
}

void sub_5A80(uint64_t a1)
{
  uint64_t v2 = IOPSDrawingUnlimitedPower();
  int v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v6 = "com.apple.system.powersources.source";
    __int16 v7 = 1024;
    int v8 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Received %{public}s: %d", buf, 0x12u);
    _MBLog();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsOnPower:v2];
}

uint64_t sub_5B7C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(*(void *)(a1 + 32) + 12));
}

void sub_5B94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _boostBackgroundRestore:0];
}

void sub_5BD8(uint64_t a1, void *a2)
{
  int v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_16;
  }
  unsigned __int32 v5 = nw_path_get_status(v3) & 0xFFFFFFFD;
  uint64_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    BOOL v13 = v7;
    __int16 v14 = 2114;
    *(void *)long long v15 = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "status:%d, %{public}@", buf, 0x12u);
    _MBLog();
  }

  if (v5 != 1)
  {
    BOOL v8 = 0;
LABEL_12:
    BOOL v10 = 0;
    BOOL is_expensive = 0;
    goto LABEL_13;
  }
  BOOL v8 = nw_path_uses_interface_type(v3, nw_interface_type_wifi)
    || nw_path_uses_interface_type(v3, nw_interface_type_wired);
  if (!nw_path_uses_interface_type(v3, nw_interface_type_cellular)) {
    goto LABEL_12;
  }
  BOOL is_expensive = nw_path_is_expensive(v3);
  BOOL v10 = !is_expensive;
LABEL_13:
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    BOOL v13 = v8;
    __int16 v14 = 1024;
    *(_DWORD *)long long v15 = v10;
    *(_WORD *)&v15[4] = 1024;
    *(_DWORD *)&v15[6] = is_expensive;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "isOnWiFi:%d, isOnCellular:%d(%d)", buf, 0x14u);
    _MBLog();
  }

  [WeakRetained setIsOnWiFi:v8];
  [WeakRetained setIsOnCellular:v10];
LABEL_16:
}

void sub_607C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_60AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id WeakRetained = MBGetDefaultLog();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v10;
    _os_log_impl(&dword_0, WeakRetained, OS_LOG_TYPE_INFO, "Background restore boost finished successfully (%llu)", buf, 0xCu);
LABEL_10:
    _MBLog();
    goto LABEL_11;
  }
  if ((+[MBError isError:v3 withCode:19] & 1) == 0)
  {
    id WeakRetained = MBGetDefaultLog();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_0, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to boost background restore (%llu): %@", buf, 0x16u);
    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int32 v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = 2;
    __int16 v15 = 2048;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Retrying background restore boost in %llu seconds after error (%llu): %@", buf, 0x20u);
    _MBLog();
  }

  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  isa = WeakRetained[5].isa;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6328;
  block[3] = &unk_C3F8;
  uint64_t v9 = *(void *)(a1 + 40);
  void block[4] = WeakRetained;
  block[5] = v9;
  dispatch_after(v7, isa, block);
LABEL_11:
}

id sub_6328(uint64_t a1)
{
  return [*(id *)(a1 + 32) _boostBackgroundRestore:*(void *)(a1 + 40) + 1];
}

id sub_6998(uint64_t a1)
{
  id result = (id)sub_69E4();
  if (result)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 72);
    return [v3 wakeUp];
  }
  return result;
}

uint64_t sub_69E4()
{
  int v0 = MKBDeviceUnlockedSinceBoot();
  int v1 = MKBGetDeviceLockState();
  int v2 = v1;
  if (v0) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0;
  }
  uint64_t v4 = v3;
  unsigned __int32 v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    int v8 = v4;
    __int16 v9 = 1024;
    BOOL v10 = v0 != 0;
    __int16 v11 = 1024;
    int v12 = v2;
    __int16 v13 = 1024;
    BOOL v14 = v2 == 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "MBDeviceUnlockedSinceBoot %d, MKBDeviceUnlockedSinceBoot %d, deviceLockState %d, deviceIsUnlocked %d", buf, 0x1Au);
    _MBLog();
  }

  return v4;
}

id sub_70E4(uint64_t a1)
{
  id result = (id)sub_69E4();
  if (result)
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 72);
    return [v3 wakeUp];
  }
  return result;
}

void sub_7208(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 == 3)
  {
    [*(id *)(a1 + 40) _clearEnabledStateForAccount:*(void *)(a1 + 32)];
LABEL_7:
    [*(id *)(a1 + 40) _updateGlobalEnabledState];
    if (v2)
    {
      uint64_t v4 = [*(id *)(a1 + 32) personaIdentifier];
      id v5 = objc_msgSend(objc_alloc((Class)MBAccountChange), "initWithAccountIdentifier:personaIdentifier:isPrimaryAccount:changeType:", v2, v4, objc_msgSend(*(id *)(a1 + 32), "aa_isAccountClass:", AAAccountClassPrimary), *(void *)(a1 + 48));
      [*(id *)(a1 + 40) _notifyDaemonOfAccountChange:v5];
      uint64_t v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v8 = v5;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notified daemon of account change:%@", buf, 0xCu);
        _MBLog();
      }
    }
    else
    {
      uint64_t v4 = MBGetDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Nil account identifier found", buf, 2u);
        _MBLog();
      }
    }

    goto LABEL_14;
  }
  if (!v3) {
    sub_8594();
  }
  if (([*(id *)(a1 + 40) _updateEnabledStateForAccount:*(void *)(a1 + 32)] & 1) != 0
    || *(void *)(a1 + 48) == 1)
  {
    goto LABEL_7;
  }
LABEL_14:
}

id sub_81BC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) accountChanged:*(void *)(a1 + 40)];
}

id sub_823C(uint64_t a1)
{
  id result = (id)sub_69E4();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 72);
    return [v3 keyBagIsLocking];
  }
  return result;
}

id sub_82FC(uint64_t a1)
{
  id result = (id)sub_69E4();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 72);
    return [v3 keyBagIsUnlocked];
  }
  return result;
}

void MBInstallAgent()
{
  if (!qword_D7E8)
  {
    int v1 = [MBUEAPlugin alloc];
    xpc_event_module_get_queue();
  }
}

void sub_8510()
{
}

void sub_853C()
{
}

void sub_8568()
{
}

void sub_8594()
{
  __assert_rtn("-[MBUEAPlugin _handleAccountChange:account:]_block_invoke", "MobileBackupUEA_plugin.m", 535, "changeType != MBAccountChangeTypeUnspecified");
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return _IOPSDrawingUnlimitedPower();
}

uint64_t MBGetDefaultLog()
{
  return _MBGetDefaultLog();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t _MBLog()
{
  return __MBLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return _nw_path_is_expensive(path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return _nw_path_monitor_create();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return _nw_path_uses_interface_type(path, interface_type);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__install(void *a1, const char *a2, ...)
{
  return [a1 _install];
}

id objc_msgSend__lastBackupDate(void *a1, const char *a2, ...)
{
  return [a1 _lastBackupDate];
}

id objc_msgSend__refetchAllAccounts(void *a1, const char *a2, ...)
{
  return [a1 _refetchAllAccounts];
}

id objc_msgSend__removeTemporaryDirectories(void *a1, const char *a2, ...)
{
  return [a1 _removeTemporaryDirectories];
}

id objc_msgSend__stateDidChange(void *a1, const char *a2, ...)
{
  return [a1 _stateDidChange];
}

id objc_msgSend__updateGlobalEnabledState(void *a1, const char *a2, ...)
{
  return [a1 _updateGlobalEnabledState];
}

id objc_msgSend__updatePCTimer(void *a1, const char *a2, ...)
{
  return [a1 _updatePCTimer];
}

id objc_msgSend_accountsWithBackupEnabled(void *a1, const char *a2, ...)
{
  return [a1 accountsWithBackupEnabled];
}

id objc_msgSend_accountsWithBackupOnCellularEnabled(void *a1, const char *a2, ...)
{
  return [a1 accountsWithBackupOnCellularEnabled];
}

id objc_msgSend_allPersonae(void *a1, const char *a2, ...)
{
  return [a1 allPersonae];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBackupOnCellularEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBackupOnCellularEnabled];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isOnCellular(void *a1, const char *a2, ...)
{
  return [a1 isOnCellular];
}

id objc_msgSend_isOnPower(void *a1, const char *a2, ...)
{
  return [a1 isOnPower];
}

id objc_msgSend_isOnWiFi(void *a1, const char *a2, ...)
{
  return [a1 isOnWiFi];
}

id objc_msgSend_isPersonalPersona(void *a1, const char *a2, ...)
{
  return [a1 isPersonalPersona];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_monitoredAccounts(void *a1, const char *a2, ...)
{
  return [a1 monitoredAccounts];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_notifyDaemonThatKeyBagIsLocking(void *a1, const char *a2, ...)
{
  return [a1 notifyDaemonThatKeyBagIsLocking];
}

id objc_msgSend_notifyDaemonThatKeyBagIsUnlocked(void *a1, const char *a2, ...)
{
  return [a1 notifyDaemonThatKeyBagIsUnlocked];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_personaLayoutPathURL(void *a1, const char *a2, ...)
{
  return [a1 personaLayoutPathURL];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_volumeMountPoint(void *a1, const char *a2, ...)
{
  return [a1 volumeMountPoint];
}

id objc_msgSend_volumesToBackUp(void *a1, const char *a2, ...)
{
  return [a1 volumesToBackUp];
}

id objc_msgSend_wakeBackupOnDisconnect(void *a1, const char *a2, ...)
{
  return [a1 wakeBackupOnDisconnect];
}