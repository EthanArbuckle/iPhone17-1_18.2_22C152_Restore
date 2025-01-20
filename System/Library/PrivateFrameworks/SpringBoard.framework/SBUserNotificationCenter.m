@interface SBUserNotificationCenter
+ (void)_userNotificationDone:(id)a3;
+ (void)dispatchUserNotification:(id)a3 flags:(int)a4 replyPort:(unsigned int)a5 auditToken:(id)a6;
+ (void)startUserNotificationCenter;
@end

@implementation SBUserNotificationCenter

+ (void)_userNotificationDone:(id)a3
{
  id v6 = [a3 object];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:a1 name:@"SBUserNotificationDoneNotification" object:v6];

  [(id)__userNotifications removeObject:v6];
  if (![(id)__userNotifications count])
  {
    v5 = (void *)__userNotifications;
    __userNotifications = 0;
  }
}

+ (void)dispatchUserNotification:(id)a3 flags:(int)a4 replyPort:(unsigned int)a5 auditToken:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if ((v8 & 8) != 0)
  {
    v19 = [v10 objectForKey:*MEMORY[0x1E4F1DA38]];
    int v20 = [v19 intValue];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = (id)__userNotifications;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v26 token] == v20)
          {
            v14 = v26;
            goto LABEL_18;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    v14 = 0;
LABEL_18:

    [(SBUserNotificationAlert *)v14 cancel];
  }
  else if ((v8 & 0x10) != 0)
  {
    v27 = [v10 objectForKey:*MEMORY[0x1E4F1DA38]];
    int v28 = [v27 intValue];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v14 = (SBUserNotificationAlert *)(id)__userNotifications;
    uint64_t v29 = [(SBUserNotificationAlert *)v14 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v36;
LABEL_23:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v14);
        }
        v33 = *(void **)(*((void *)&v35 + 1) + 8 * v32);
        if (objc_msgSend(v33, "token", (void)v35) == v28) {
          break;
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [(SBUserNotificationAlert *)v14 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v30) {
            goto LABEL_23;
          }
          goto LABEL_19;
        }
      }
      v34 = v33;

      if (!v34) {
        goto LABEL_20;
      }
      [(SBUserNotificationAlert *)v34 updateWithMessage:v10 requestFlags:v8];
      v14 = v34;
    }
  }
  else
  {
    v12 = SBLogCFUserNotifications();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [v11 pid];
      v13 = BSProcessDescriptionForPID();
      *(_DWORD *)buf = 67109378;
      int v44 = v7;
      __int16 v45 = 2114;
      v46 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Presenting a CFUserNotification with reply port: %u on behalf of: %{public}@", buf, 0x12u);
    }
    v14 = [[SBUserNotificationAlert alloc] initWithMessage:v10 replyPort:v7 requestFlags:v8 auditToken:v11];
    v15 = (void *)__userNotifications;
    if (!__userNotifications)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v17 = (void *)__userNotifications;
      __userNotifications = (uint64_t)v16;

      v15 = (void *)__userNotifications;
    }
    [v15 addObject:v14];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:a1 selector:sel__userNotificationDone_ name:@"SBUserNotificationDoneNotification" object:v14];
  }
LABEL_19:

LABEL_20:
}

+ (void)startUserNotificationCenter
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "com.apple.SBUserNotification";
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "unable to bootstrap service: %s", (uint8_t *)&v1, 0xCu);
}

void __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 8)
  {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], *(_DWORD *)(a1 + 40), 1u, -1);
  }
  else if (a2 == 2)
  {
    msg = (UInt8 *)dispatch_mach_msg_get_msg();
    uint64_t v7 = msg;
    if ((*(_DWORD *)msg & 0x80000000) != 0
      || ((uint64_t v8 = *((unsigned int *)msg + 1), v8 >= 0x1C) ? (v9 = v8 == 0) : (v9 = 0), !v9))
    {
      id v10 = SBLogCFUserNotifications();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke_cold_2(v10);
      }
      goto LABEL_25;
    }
    uint64_t v11 = *((unsigned int *)msg + 2);
    *((_DWORD *)msg + 2) = 0;
    id v10 = [MEMORY[0x1E4F4F6A8] tokenFromMachMessage:msg];
    if (_SBUserNotificationAuthenticator_onceToken != -1) {
      dispatch_once(&_SBUserNotificationAuthenticator_onceToken, &__block_literal_global_40);
    }
    id v23 = 0;
    id v12 = (id)_SBUserNotificationAuthenticator___authenticator;
    char v13 = [v12 authenticateAuditToken:v10 error:&v23];
    id v14 = v23;

    if (v13)
    {

      uint64_t v15 = *((unsigned int *)v7 + 5);
      CFDataRef v16 = CFDataCreate(0, v7 + 28, *((unsigned int *)v7 + 1) - 28);
      if (v16)
      {
        CFDataRef v17 = v16;
        v18 = (void *)CFPropertyListCreateWithData(0, v16, 0, 0, 0);
        CFRelease(v17);
        if (v18)
        {
          CFTypeID v19 = CFGetTypeID(v18);
          if (v19 == CFDictionaryGetTypeID())
          {
            [*(id *)(a1 + 32) dispatchUserNotification:v18 flags:v15 replyPort:v11 auditToken:v10];

LABEL_25:
            mach_msg_destroy((mach_msg_header_t *)v7);
            goto LABEL_26;
          }
          CFRelease(v18);
        }
      }
    }
    else
    {
      int v20 = SBLogCFUserNotifications();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke_cold_1(v10, (uint64_t)v14, v20);
      }
    }
    id v21 = (char *)malloc_type_calloc(0x1CuLL, 1uLL, 0x3E6A277BuLL);
    if (v21)
    {
      uint64_t v22 = (mach_msg_header_t *)v21;
      *(void *)id v21 = 0x1C00000012;
      *((_DWORD *)v21 + 2) = v11;
      *((_DWORD *)v21 + 3) = 0;
      *(void *)(v21 + 20) = 3;
      if (mach_msg((mach_msg_header_t *)v21, 1, 0x1Cu, 0, 0, 0, 0)) {
        mach_msg_destroy(v22);
      }
      free(v22);
    }
    goto LABEL_25;
  }
LABEL_26:
}

void __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a1 pid];
  id v5 = BSProcessDescriptionForPID();
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "CFUserNotification authorization failure: %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

void __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Invalid message received", v1, 2u);
}

@end