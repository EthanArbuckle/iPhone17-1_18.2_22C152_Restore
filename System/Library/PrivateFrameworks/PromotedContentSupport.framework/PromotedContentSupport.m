void sub_220C1D190(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  NSObject *v6;
  BOOL v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x263EF8340];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = APLogForCategory();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      v8 = *(void *)(a1 + 32);
      v12 = 138477827;
      v13 = v8;
      v9 = "Fetched configuration: %{private}@";
      v10 = v6;
      v11 = 12;
LABEL_6:
      _os_log_impl(&dword_220C1C000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v7)
  {
    LOWORD(v12) = 0;
    v9 = "No configuration found";
    v10 = v6;
    v11 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4);
  [WeakRetained finished];
}

void sub_220C1D2B0(uint64_t a1, void *a2)
{
  v3 = *(objc_class **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [MEMORY[0x263F20A80] sharedInstance];
  id v8 = (id)[v5 initWithConfig:v4 notifier:v6];

  v7 = [MEMORY[0x263F20A80] sharedInstance];
  [v7 setConfiguration:v8];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_220C1D67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_220C1D7DC(float a1)
{
  self;
  if (a1 >= 0.0)
  {
    v3 = NSNumber;
    LODWORD(v2) = 1.0;
    if (a1 <= 1.0) {
      *(float *)&double v2 = a1;
    }
  }
  else
  {
    v3 = NSNumber;
    double v2 = 0.0;
  }
  id v4 = [v3 numberWithFloat:v2];
  return v4;
}

void sub_220C1DEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_220C1DEC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_220C1DED8(uint64_t a1)
{
}

void sub_220C1DEE0(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_220C1C000, v3, OS_LOG_TYPE_ERROR, "Received error from fetchGenderAndAgeGroupData. %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_220C1DF90(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v6 = APLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v12 = 138477827;
      uint64_t v13 = v8;
      v9 = "Fetched gender and age group data: %{private}@";
      v10 = v6;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl(&dword_220C1C000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v7)
  {
    LOWORD(v12) = 0;
    v9 = "There was no gender and age group data to fetch";
    v10 = v6;
    uint32_t v11 = 2;
    goto LABEL_6;
  }
}

void sub_220C1E18C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_220C1E1A8(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = APLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      int v10 = 138477827;
      id v11 = v3;
      BOOL v7 = "Fetched gender and age group data: %{private}@";
      uint64_t v8 = v5;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_220C1C000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v10) = 0;
    BOOL v7 = "There was no gender and age group data to fetch";
    uint64_t v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
  [WeakRetained finished];
}

void sub_220C1E3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C1E400(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = APLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      int v10 = 138477827;
      id v11 = v3;
      BOOL v7 = "Fetched ad policy: %{private}@";
      uint64_t v8 = v5;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_220C1C000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v10) = 0;
    BOOL v7 = "There were no policies returned.";
    uint64_t v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
  [WeakRetained finished];
}

void sub_220C1E5F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_220C1E614(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = APLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      int v10 = 138477827;
      id v11 = v3;
      BOOL v7 = "Fetched ad policy: %{private}@";
      uint64_t v8 = v5;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_220C1C000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v10) = 0;
    BOOL v7 = "There were no policies returned.";
    uint64_t v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
  [WeakRetained finished];
}

void sub_220C1E860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C1E87C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained finished];
}

uint64_t sub_220C1EA04()
{
  qword_26AB31B98 = objc_alloc_init(PCRingBuffer);
  return MEMORY[0x270F9A758]();
}

void sub_220C1EF64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_220C1EF90(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x223C709D0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_220C1EFBC(uint64_t a1)
{
}

uint64_t sub_220C1EFC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_220C1EFD4(uint64_t a1)
{
}

void sub_220C1EFDC(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lock];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v3)
  {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) unlock];
}

void sub_220C1F074(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_220C1C000, v2, OS_LOG_TYPE_INFO, "PCStatusConditions XPC connection invalidated. Lost connection.", v6, 2u);
  }

  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = @"A serious error occurred. The XPC connection was invalidated.";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v3 errorWithDomain:@"PCStatusConditionsErrorDomain" code:-1101 userInfo:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_220C1F194(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_220C1C000, v2, OS_LOG_TYPE_ERROR, "PCStatusConditions XPC connection interrupted. Lost connection.", v6, 2u);
  }

  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = @"A serious error occurred. The XPC connection was interrupted.";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v3 errorWithDomain:@"PCStatusConditionsErrorDomain" code:-1101 userInfo:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_220C1F2B4(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_220C1C000, v4, OS_LOG_TYPE_ERROR, "Failed to set the status condition due to error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
}

void sub_220C1F688(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_220C1F6B4(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lock];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v3)
  {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) unlock];
}

void sub_220C1F74C(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_220C1C000, v2, OS_LOG_TYPE_INFO, "PCStatusConditions XPC connection invalidated. Lost connection.", v6, 2u);
  }

  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = @"A serious error occurred. The XPC connection was invalidated.";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v5 = [v3 errorWithDomain:@"PCStatusConditionsErrorDomain" code:-1101 userInfo:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_220C1F86C(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_220C1C000, v2, OS_LOG_TYPE_ERROR, "PCStatusConditions XPC connection interrupted. Lost connection.", v6, 2u);
  }

  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = @"A serious error occurred. The XPC connection was interrupted.";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v5 = [v3 errorWithDomain:@"PCStatusConditionsErrorDomain" code:-1101 userInfo:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_220C1F98C(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_220C1C000, v4, OS_LOG_TYPE_ERROR, "Failed to clear the status condition due to error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
}

void sub_220C1FD48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_220C1FD74(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lock];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v8);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) unlock];
}

void sub_220C1FE14(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_220C1C000, v2, OS_LOG_TYPE_INFO, "PCStatusConditions XPC connection invalidated. Lost connection.", v6, 2u);
  }

  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = @"The XPC connection was invalidated.";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v3 errorWithDomain:@"PCStatusConditionsErrorDomain" code:-1101 userInfo:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_220C1FF38(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_220C1C000, v2, OS_LOG_TYPE_ERROR, "PCStatusConditions XPC connection interrupted due to an error.", v6, 2u);
  }

  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = @"A serious error occurred. The XPC connection was interrupted.";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v3 errorWithDomain:@"PCStatusConditionsErrorDomain" code:-1101 userInfo:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_220C2005C(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  uint64_t v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"has not";
    if (a2) {
      uint64_t v7 = @"has";
    }
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_220C1C000, v6, OS_LOG_TYPE_INFO, "The status condition %{public}@ been registered.", (uint8_t *)&v9, 0xCu);
  }

  if (v5)
  {
    id v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      int v10 = v5;
      _os_log_impl(&dword_220C1C000, v8, OS_LOG_TYPE_ERROR, "Failed to read the status condition due to error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
}

uint64_t sub_220C205F0(uint64_t a1, void *a2)
{
  id v3 = [a2 statusCondition];
  LODWORD(a1) = [v3 isEqual:*(void *)(a1 + 32)];

  return a1 ^ 1;
}

BOOL sub_220C20758(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 setTime];

  BOOL v9 = 0;
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 setTime];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    if ((int)v8 < 86400) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

uint64_t sub_220C20968(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_220C20A20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_220C20AFC()
{
  qword_26AB31B80 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  return MEMORY[0x270F9A758]();
}

uint64_t APLogForCategory()
{
  return MEMORY[0x270F08BC8]();
}

uint64_t APSimulateCrash()
{
  return MEMORY[0x270F08BD8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}