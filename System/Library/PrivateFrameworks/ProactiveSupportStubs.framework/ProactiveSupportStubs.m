void sub_23D380E68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D381098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D381150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_23D381248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void registerOnceForFirstUnlock(void *a1)
{
  id v4 = a1;
  v1 = objc_opt_class();
  objc_sync_enter(v1);
  if (!_firstUnlockCallback)
  {
    uint64_t v2 = [v4 copy];
    v3 = (void *)_firstUnlockCallback;
    _firstUnlockCallback = v2;
  }
  objc_sync_exit(v1);
}

void sub_23D3812E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void unregisterForAKSEvents(uint64_t a1)
{
  if (a1)
  {
    objc_opt_class();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    uint64_t v2 = (void *)_callbackMapAKS;
    if (_callbackMapAKS)
    {
      v3 = [NSNumber numberWithInt:a1];
      [v2 removeObjectForKey:v3];
    }
    objc_sync_exit(obj);
  }
}

void sub_23D381398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t registerForAKSEvents(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = objc_opt_class();
  objc_sync_enter(v5);
  ++_tokenCounter;
  v6 = objc_msgSend(NSNumber, "numberWithInt:");
  v7 = (void *)[v4 copy];
  v8 = (void *)MEMORY[0x23ECFE970]();
  [(id)_callbackMapAKS setObject:v8 forKeyedSubscript:v6];

  uint64_t v9 = [v6 integerValue];
  objc_sync_exit(v5);

  return v9;
}

void sub_23D381480(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void unregisterForLockStateChanges(void *a1)
{
  id v2 = a1;
  v1 = objc_opt_class();
  objc_sync_enter(v1);
  if (_callbackMap) {
    [(id)_callbackMap removeObjectForKey:v2];
  }
  objc_sync_exit(v1);
}

void sub_23D38150C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id registerForLockStateChanges(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = objc_opt_class();
  objc_sync_enter(v5);
  ++_tokenCounter;
  v6 = objc_msgSend(NSNumber, "numberWithInt:");
  v7 = (void *)[v4 copy];
  v8 = (void *)MEMORY[0x23ECFE970]();
  [(id)_callbackMap setObject:v8 forKeyedSubscript:v6];

  objc_sync_exit(v5);

  return v6;
}

void sub_23D3815F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id currentOsBuild()
{
  v0 = objc_opt_class();
  objc_sync_enter(v0);
  v1 = (void *)_currentOsBuild;
  if (!_currentOsBuild)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    v5 = [NSString stringWithUTF8String:"NSString *currentOsBuild(void)"];
    [v4 handleFailureInFunction:v5 file:@"_PASDeviceStateStub.m" lineNumber:48 description:@"You must set the current Os Build"];

    v1 = (void *)_currentOsBuild;
  }
  id v2 = v1;
  objc_sync_exit(v0);

  return v2;
}

void sub_23D3816D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t lockState()
{
  v0 = objc_opt_class();
  objc_sync_enter(v0);
  uint64_t v1 = _lockState;
  objc_sync_exit(v0);

  return v1;
}

uint64_t formattedForContentProtection()
{
  v0 = objc_opt_class();
  objc_sync_enter(v0);
  uint64_t v1 = _deviceFormattedForProtection;
  objc_sync_exit(v0);

  return v1;
}

BOOL unlockedSinceBoot()
{
  v0 = objc_opt_class();
  objc_sync_enter(v0);
  BOOL v1 = _classCLocked == 0;
  objc_sync_exit(v0);

  return v1;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}