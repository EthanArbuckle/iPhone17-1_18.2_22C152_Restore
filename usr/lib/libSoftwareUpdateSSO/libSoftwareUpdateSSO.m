id SoftwareUpdateSSOlogInfo()
{
  void *v0;
  uint64_t vars8;

  if (SoftwareUpdateSSOlogInfo_logInfoOnce != -1) {
    dispatch_once(&SoftwareUpdateSSOlogInfo_logInfoOnce, &__block_literal_global_1);
  }
  v0 = (void *)SoftwareUpdateSSOlogInfo_infoLog;

  return v0;
}

uint64_t __SoftwareUpdateSSOlogInfo_block_invoke()
{
  SoftwareUpdateSSOlogInfo_infoLog = (uint64_t)os_log_create("com.apple.SoftwareUpdateSSO", "Notice");

  return MEMORY[0x270F9A758]();
}

id SoftwareUpdateSSOlogError()
{
  if (SoftwareUpdateSSOlogError_logErrorOnce != -1) {
    dispatch_once(&SoftwareUpdateSSOlogError_logErrorOnce, &__block_literal_global_4);
  }
  v0 = (void *)SoftwareUpdateSSOlogError_infoError;

  return v0;
}

uint64_t __SoftwareUpdateSSOlogError_block_invoke()
{
  SoftwareUpdateSSOlogError_infoError = (uint64_t)os_log_create("com.apple.SoftwareUpdateSSO", "Error");

  return MEMORY[0x270F9A758]();
}

id SoftwareUpdateSSOlogDebug()
{
  if (SoftwareUpdateSSOlogDebug_logDebugOnce != -1) {
    dispatch_once(&SoftwareUpdateSSOlogDebug_logDebugOnce, &__block_literal_global_7);
  }
  v0 = (void *)SoftwareUpdateSSOlogDebug_infoDebug;

  return v0;
}

uint64_t __SoftwareUpdateSSOlogDebug_block_invoke()
{
  SoftwareUpdateSSOlogDebug_infoDebug = (uint64_t)os_log_create("com.apple.SoftwareUpdateSSO", "Debug");

  return MEMORY[0x270F9A758]();
}

id SoftwareUpdateSSOlogFault()
{
  if (SoftwareUpdateSSOlogFault_logFaultOnce != -1) {
    dispatch_once(&SoftwareUpdateSSOlogFault_logFaultOnce, &__block_literal_global_10);
  }
  v0 = (void *)SoftwareUpdateSSOlogFault_infoFault;

  return v0;
}

uint64_t __SoftwareUpdateSSOlogFault_block_invoke()
{
  SoftwareUpdateSSOlogFault_infoFault = (uint64_t)os_log_create("com.apple.SoftwareUpdateSSO", "Fault");

  return MEMORY[0x270F9A758]();
}

id copyPersonID(void *a1, void *a2)
{
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if ((MSUSSOIsAvailable(@"1205") & 1) == 0)
  {
    NSLog(&cfstr_SNotSupportedI.isa, "copyPersonID");
    id v6 = 0;
    goto LABEL_25;
  }
  if (v3)
  {
    uint64_t v4 = [v3 valueForKey:@"stealthMode"];
    if (v4 == *MEMORY[0x263EFFB40]) {
      v5 = @"1";
    }
    else {
      v5 = @"0";
    }
    NSLog(&cfstr_SAttemptingToR.isa, "copyPersonID", v4 == *MEMORY[0x263EFFB40]);
  }
  else
  {
    NSLog(&cfstr_SAttemptingToR.isa, "copyPersonID", 0);
    v5 = @"0";
  }
  v14[0] = @"applicationIdentifier";
  v14[1] = @"environmentIdentifier";
  v15[0] = @"1205";
  v15[1] = @"APPLECONNECT.APPLE.COM";
  v14[2] = @"interactivity";
  v15[2] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v8 = [[SoftwareUpdateSSO alloc] initWithOptions:v7];
  if ([(SoftwareUpdateSSO *)v8 ssoIsSupported])
  {
    NSLog(&cfstr_Softwareupdate_1.isa);
    id v9 = [(SoftwareUpdateSSO *)v8 copyUserInfo];
    v10 = v9;
    if (!v9)
    {
      NSLog(&cfstr_Softwareupdate_4.isa);
      if (a2)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"SoftwareUpdateSSOError" code:1 userInfo:0];
        v12 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_23;
    }
    v11 = [v9 objectForKeyedSubscript:@"personId"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = (void *)[v11 copy];
      if (v12)
      {
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
      NSLog(&cfstr_Softwareupdate_2.isa, v10);
    }
    NSLog(&cfstr_Softwareupdate_3.isa);
    if (a2)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"SoftwareUpdateSSOError" code:2 userInfo:0];
      v12 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_22;
  }
  NSLog(&cfstr_Softwareupdate_0.isa);
  v12 = 0;
LABEL_24:
  id v6 = v12;

LABEL_25:

  return v6;
}

uint64_t MSUSSOIsAvailable(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v9 = @"applicationIdentifier";
  v10 = @"environmentIdentifier";
  v12 = a1;
  v13 = @"APPLECONNECT.APPLE.COM";
  v11 = @"interactivity";
  v14 = @"0";
  v1 = NSDictionary;
  id v2 = a1;
  id v3 = [v1 dictionaryWithObjects:&v12 forKeys:&v9 count:3];
  uint64_t v4 = [SoftwareUpdateSSO alloc];

  v5 = [(SoftwareUpdateSSO *)v4 initWithOptions:v3];
  uint64_t v6 = [(SoftwareUpdateSSO *)v5 ssoIsSupported];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  NSLog(&cfstr_Msussoisavaila.isa, v7, v9, v10, v11, v12, v13, v14, v15);

  return v6;
}

id copyPersonalizationSSOToken(void *a1, void *a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (MSUSSOIsAvailable(@"1205"))
  {
    if (v3)
    {
      uint64_t v4 = [v3 valueForKey:@"stealthMode"];
      BOOL v5 = v4 == *MEMORY[0x263EFFB40];
    }
    else
    {
      BOOL v5 = 0;
    }
    NSLog(&cfstr_CallingCopydaw.isa, v5);
    id v17 = 0;
    v7 = copyDawTokenAndUsername(@"1205", v5, &v17);
    id v8 = v17;
    id v9 = v8;
    if (v7 && v8)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
      id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
      v12 = [NSString stringWithFormat:@"%@/%@", v9, @"1205"];
      [v10 setLength:[v12 length] + 1];
      id v13 = v10;
      [v12 getCString:[v13 mutableBytes] maxLength:[v13 length] encoding:4];
      [v11 setLength:[v7 length] + 1];
      id v14 = v11;
      [v7 getCString:[v14 mutableBytes] maxLength:[v14 length] encoding:4];
      id v15 = v14;
      [v13 appendBytes:objc_msgSend(v15, "mutableBytes") length:objc_msgSend(v15, "length") - 1];
      v18 = @"ssodata";
      v19[0] = v13;
      uint64_t v6 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    }
    else
    {
      NSLog(&cfstr_Copydawtokenan.isa, v7, v8);
      if (a2)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"SoftwareUpdateSSOError" code:1 userInfo:0];
        uint64_t v6 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
  }
  else
  {
    NSLog(&cfstr_SNotSupportedI_0.isa, "copyPersonalizationSSOToken");
    uint64_t v6 = 0;
  }

  return v6;
}

id copyDawTokenAndUsername(void *a1, int a2, void *a3)
{
  v19[3] = *MEMORY[0x263EF8340];
  BOOL v5 = a1;
  uint64_t v6 = v5;
  v7 = @"177666";
  if (v5) {
    v7 = v5;
  }
  id v8 = v7;
  if ((MSUSSOIsAvailable(v8) & 1) == 0)
  {
    NSLog(&cfstr_SNotSupportedI_0.isa, "copyDawTokenAndUsername");
    goto LABEL_15;
  }
  NSLog(&cfstr_AttemptingToGe.isa);
  if (!v6)
  {
LABEL_15:
    id v16 = 0;
    goto LABEL_18;
  }
  id v9 = @"0";
  if (a2 == 1) {
    id v9 = @"1";
  }
  if (a2 == 2) {
    id v10 = @"2";
  }
  else {
    id v10 = v9;
  }
  NSLog(&cfstr_SettingInterac.isa, v10);
  v18[0] = @"applicationIdentifier";
  v18[1] = @"environmentIdentifier";
  v19[0] = v6;
  v19[1] = @"APPLECONNECT.APPLE.COM";
  v18[2] = @"interactivity";
  void v19[2] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  v12 = [[SoftwareUpdateSSO alloc] initWithOptions:v11];
  if ([(SoftwareUpdateSSO *)v12 ssoIsSupported])
  {
    NSLog(&cfstr_Softwareupdate_5.isa);
    id v13 = [(SoftwareUpdateSSO *)v12 getDawToken];
    id v14 = [(SoftwareUpdateSSO *)v12 userName];
    id v15 = v14;
    if (a3 && v14)
    {
      id v15 = v14;
      *a3 = v15;
    }
  }
  else
  {
    NSLog(&cfstr_Softwareupdate_0.isa);
    id v15 = 0;
    id v13 = 0;
  }
  id v16 = v13;

LABEL_18:

  return v16;
}

id copyDawToken(void *a1, int a2)
{
  return copyDawTokenAndUsername(a1, a2, 0);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

void NSLog(NSString *format, ...)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}