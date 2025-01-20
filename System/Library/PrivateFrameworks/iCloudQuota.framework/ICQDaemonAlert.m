@interface ICQDaemonAlert
+ (BOOL)shouldShowForDaemonOffer:(id)a3;
+ (void)dismissAlertsWithNotificationID:(id)a3;
- (BOOL)handleActionsBeforeCallingCompletionHandler;
- (BOOL)showAlertWithCompletion:(id)a3;
- (BOOL)showOnlyInSpringboard;
- (ICQDaemonAlert)init;
- (ICQDaemonAlert)initWithDaemonOffer:(id)a3;
- (ICQDaemonOffer)daemonOffer;
- (void)_handleLink:(id)a3;
- (void)dealloc;
- (void)dismissAlert;
- (void)setHandleActionsBeforeCallingCompletionHandler:(BOOL)a3;
- (void)setShowOnlyInSpringboard:(BOOL)a3;
@end

@implementation ICQDaemonAlert

+ (void)dismissAlertsWithNotificationID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (_ICQDaemonAlertMemoryInitOnce_onceToken != -1)
  {
    dispatch_once(&_ICQDaemonAlertMemoryInitOnce_onceToken, &__block_literal_global_10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_14:
    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "dismissing all alerts", (uint8_t *)&v12, 2u);
    }

    [(id)_ICQDaemonAlertMemoryLock lock];
    v10 = [(id)_ICQDaemonAlertMemoryDict copy];
    [(id)_ICQDaemonAlertMemoryLock unlock];
    [v10 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_67];
    goto LABEL_17;
  }
  if (!v3) {
    goto LABEL_14;
  }
LABEL_3:
  [(id)_ICQDaemonAlertMemoryLock lock];
  v5 = [(id)_ICQDaemonAlertMemoryDict objectForKey:v4];
  if (v5)
  {
LABEL_8:
    [(id)_ICQDaemonAlertMemoryLock unlock];
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v12) = 138412290;
      *(void *)((char *)&v12 + 4) = v4;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "dismissing alert for notification %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = dispatch_get_global_queue(0, 0);
    *(void *)&long long v12 = MEMORY[0x1E4F143A8];
    *((void *)&v12 + 1) = 3221225472;
    v13 = ___ICQDismissAlertsWithNotificationID_block_invoke;
    v14 = &unk_1E6A524A0;
    id v15 = v5;
    v10 = v5;
    dispatch_async(v9, &v12);

    goto LABEL_17;
  }
  uint64_t v6 = [(id)_ICQDaemonAlertMemoryDict objectForKey:&stru_1F2DCE430];
  if (v6)
  {
    v5 = (void *)v6;
    v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v12) = 138412290;
      *(void *)((char *)&v12 + 4) = v4;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Could not find alert for notification %@, dismissing unlabeled alert", (uint8_t *)&v12, 0xCu);
    }

    goto LABEL_8;
  }
  [(id)_ICQDaemonAlertMemoryLock unlock];
  v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v12) = 138412290;
    *(void *)((char *)&v12 + 4) = v4;
    _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "Could not find alert for notification %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_17:
}

+ (BOOL)shouldShowForDaemonOffer:(id)a3
{
  id v3 = a3;
  v4 = [v3 alertSpecification];
  if (v4) {
    BOOL v5 = [v3 level] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (ICQDaemonAlert)init
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "attempt to create alert with nil daemonOffer", v5, 2u);
  }

  return 0;
}

- (ICQDaemonAlert)initWithDaemonOffer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(id)objc_opt_class() shouldShowForDaemonOffer:v5])
  {
    v17.receiver = self;
    v17.super_class = (Class)ICQDaemonAlert;
    uint64_t v6 = [(ICQDaemonAlert *)&v17 init];
    v7 = v6;
    if (v6)
    {
      v6->_alertState = 0;
      uint64_t v8 = objc_opt_new();
      alertLock = v7->_alertLock;
      v7->_alertLock = (NSLock *)v8;

      [(NSLock *)v7->_alertLock setName:@"ICQDaemonAlertLock"];
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      alertSema = v7->_alertSema;
      v7->_alertSema = (OS_dispatch_semaphore *)v10;

      long long v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
      dispatch_queue_t v13 = dispatch_queue_create("ICQDaemonAlertQueue", v12);
      alertQueue = v7->_alertQueue;
      v7->_alertQueue = (OS_dispatch_queue *)v13;

      objc_storeStrong((id *)&v7->_daemonOffer, a3);
      *(_WORD *)&v7->_showOnlyInSpringboard = 257;
    }
  }
  else
  {
    id v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "attempt to create alert for invalid daemonOffer %@", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(ICQDaemonAlert *)self dismissAlert];
  cfAlert = self->_cfAlert;
  if (cfAlert) {
    CFRelease(cfAlert);
  }
  v4.receiver = self;
  v4.super_class = (Class)ICQDaemonAlert;
  [(ICQDaemonAlert *)&v4 dealloc];
}

- (void)_handleLink:(id)a3
{
}

- (BOOL)showAlertWithCompletion:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_alertLock lock];
  if (!self->_alertState)
  {
    v7 = [(ICQDaemonAlert *)self daemonOffer];
    uint64_t v8 = [v7 alertSpecification];

    if (v8)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __42__ICQDaemonAlert_showAlertWithCompletion___block_invoke;
      v13[3] = &unk_1E6A52920;
      v13[4] = self;
      id v14 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v13);

      BOOL v9 = 1;
      goto LABEL_13;
    }
  }
  [(NSLock *)self->_alertLock unlock];
  if (self->_alertState)
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "alert already shown; skipping";
LABEL_5:
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else
  {
    dispatch_semaphore_t v10 = [(ICQDaemonAlert *)self daemonOffer];
    v11 = [v10 alertSpecification];

    if (v11) {
      goto LABEL_10;
    }
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "alert not shown: no alert specification";
      goto LABEL_5;
    }
  }

LABEL_10:
  if (v4) {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, MEMORY[0x1E4F1CC08]);
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

void __42__ICQDaemonAlert_showAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 16) = 1;
  id v2 = *(id *)(a1 + 32);
  if (_ICQDaemonAlertMemoryInitOnce_onceToken != -1) {
    dispatch_once(&_ICQDaemonAlertMemoryInitOnce_onceToken, &__block_literal_global_10);
  }
  id v3 = [v2 daemonOffer];
  uint64_t v4 = [v3 notificationID];
  id v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1F2DCE430;
  }
  v7 = v6;

  uint64_t v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v7;
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "remember alert for notification %@", buf, 0xCu);
  }

  [(id)_ICQDaemonAlertMemoryLock lock];
  BOOL v9 = [(id)_ICQDaemonAlertMemoryDict objectForKey:v7];
  if (v9)
  {
    [(id)_ICQDaemonAlertMemoryLock unlock];
    dispatch_semaphore_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v7;
      _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "dismissing old alert for notification %@", buf, 0xCu);
    }

    [v9 dismissAlert];
    [(id)_ICQDaemonAlertMemoryLock lock];
  }
  [(id)_ICQDaemonAlertMemoryDict setObject:v2 forKey:v7];
  [(id)_ICQDaemonAlertMemoryLock unlock];

  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = [*(id *)(a1 + 32) daemonOffer];
  dispatch_queue_t v13 = [v12 alertSpecification];

  id v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v13 disableLockScreenAlert];
    uint64_t v16 = @" (but not on lock screen)";
    if (!v15) {
      uint64_t v16 = &stru_1F2DCE430;
    }
    *(_DWORD *)buf = 138412290;
    v51 = v16;
    _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "showing alert for daemonOffer%@", buf, 0xCu);
  }

  objc_super v17 = [v13 title];
  [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

  v18 = [v13 message];
  id v19 = [v13 altMessage];
  uint64_t v20 = +[ICQDaemonOffer stringWithPlaceholderFormat:v18 alternateString:v19];
  [v11 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

  v21 = [v13 linkForButtonIndex:1];
  v22 = [v21 text];

  v23 = [v13 linkForButtonIndex:2];
  v24 = [v23 text];

  v25 = [v13 linkForButtonIndex:3];
  v26 = [v25 text];

  [v11 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
  [v11 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
  [v11 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
  uint64_t v27 = [v13 defaultButtonIndex];
  if ((unint64_t)(v27 - 1) > 2) {
    v28 = &unk_1F2DE0098;
  }
  else {
    v28 = (void *)qword_1E6A53118[v27 - 1];
  }
  [v11 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4FA7308]];
  if ([v13 disableLockScreenAlert])
  {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FA7328]];
  }
  else
  {
    v29 = [v13 lockScreenMessage];
    v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      id v31 = [v13 message];
    }
    v32 = v31;

    v33 = [v13 altLockScreenMessage];
    v34 = v33;
    if (v33)
    {
      id v35 = v33;
    }
    else
    {
      id v35 = [v13 altMessage];
    }
    v36 = v35;

    v37 = +[ICQDaemonOffer stringWithPlaceholderFormat:v32 alternateString:v36];
    [v11 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4FA73B8]];

    v38 = [v13 lockScreenTitle];
    if (v38)
    {
      [v11 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4FA73A8]];
    }
    else
    {
      v39 = [v13 title];
      [v11 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4FA73A8]];
    }
  }
  uint64_t v40 = MEMORY[0x1E4F1CC38];
  [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];
  [v11 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4FA7340]];
  if ([*(id *)(a1 + 32) showOnlyInSpringboard]) {
    [v11 setObject:&unk_1F2DE1B10 forKeyedSubscript:*MEMORY[0x1E4FA72B0]];
  }
  CFUserNotificationRef v41 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 32 * (v26 == 0), 0, (CFDictionaryRef)v11);
  *(void *)(*(void *)(a1 + 32) + 24) = v41;
  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  uint64_t v42 = *(void *)(a1 + 32);
  v43 = *(NSObject **)(v42 + 40);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __42__ICQDaemonAlert_showAlertWithCompletion___block_invoke_15;
  v45[3] = &unk_1E6A530D8;
  CFUserNotificationRef v49 = v41;
  id v46 = v13;
  uint64_t v47 = v42;
  id v48 = *(id *)(a1 + 40);
  id v44 = v13;
  dispatch_async(v43, v45);
}

void __42__ICQDaemonAlert_showAlertWithCompletion___block_invoke_15(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 56), 0.0, &responseFlags);
  if (responseFlags <= 2
    && ([*(id *)(a1 + 32) linkForButtonIndex:qword_1D58D3260[responseFlags]],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = (void *)v2;
    if ([*(id *)(a1 + 40) handleActionsBeforeCallingCompletionHandler]) {
      [*(id *)(a1 + 40) _handleLink:v3];
    }
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      uint64_t v5 = [v3 action];
      uint64_t v6 = [v3 parameters];
      (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, 1, MEMORY[0x1E4F1CC08]);
    }
    id v3 = 0;
  }
  [*(id *)(*(void *)(a1 + 40) + 8) lock];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(v8 + 16);
  *(void *)(v8 + 16) = 3;
  uint64_t v10 = *(void *)(a1 + 40);
  v11 = *(const void **)(v10 + 24);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(*(void *)(a1 + 40) + 24) = 0;
    uint64_t v10 = *(void *)(a1 + 40);
  }
  [*(id *)(v10 + 8) unlock];
  if (v9 == 2) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 32));
  }
}

- (void)dismissAlert
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ICQDaemonAlert *)self daemonOffer];
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "dismissing alert for daemonOffer %@", (uint8_t *)&v18, 0xCu);
  }
  [(NSLock *)self->_alertLock lock];
  if (self->_alertState == 1)
  {
    self->_alertState = 2;
    uint64_t v5 = self;
    if (_ICQDaemonAlertMemoryInitOnce_onceToken != -1) {
      dispatch_once(&_ICQDaemonAlertMemoryInitOnce_onceToken, &__block_literal_global_10);
    }
    uint64_t v6 = [(ICQDaemonAlert *)v5 daemonOffer];
    uint64_t v7 = [v6 notificationID];
    uint64_t v8 = (void *)v7;
    uint64_t v9 = &stru_1F2DCE430;
    if (v7) {
      uint64_t v9 = (__CFString *)v7;
    }
    uint64_t v10 = v9;

    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = (ICQDaemonAlert *)v10;
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "forget alert for notification %@", (uint8_t *)&v18, 0xCu);
    }

    [(id)_ICQDaemonAlertMemoryLock lock];
    [(id)_ICQDaemonAlertMemoryDict removeObjectForKey:v10];
    [(id)_ICQDaemonAlertMemoryLock unlock];

    cfAlert = v5->_cfAlert;
    if (cfAlert) {
      CFUserNotificationCancel(cfAlert);
    }
    [(NSLock *)self->_alertLock unlock];
    dispatch_queue_t v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "waiting for alert %@ to dismiss", (uint8_t *)&v18, 0xCu);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)v5->_alertSema, 0xFFFFFFFFFFFFFFFFLL);
    id v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v5;
      int v15 = "finished waiting for alert %@ to dismiss";
      uint64_t v16 = v14;
      uint32_t v17 = 12;
LABEL_18:
      _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, v17);
    }
  }
  else
  {
    [(NSLock *)self->_alertLock unlock];
    id v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      int v15 = "alert not showing; skipping dismiss";
      uint64_t v16 = v14;
      uint32_t v17 = 2;
      goto LABEL_18;
    }
  }
}

- (ICQDaemonOffer)daemonOffer
{
  return self->_daemonOffer;
}

- (BOOL)showOnlyInSpringboard
{
  return self->_showOnlyInSpringboard;
}

- (void)setShowOnlyInSpringboard:(BOOL)a3
{
  self->_showOnlyInSpringboard = a3;
}

- (BOOL)handleActionsBeforeCallingCompletionHandler
{
  return self->_handleActionsBeforeCallingCompletionHandler;
}

- (void)setHandleActionsBeforeCallingCompletionHandler:(BOOL)a3
{
  self->_handleActionsBeforeCallingCompletionHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonOffer, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
  objc_storeStrong((id *)&self->_alertSema, 0);
  objc_storeStrong((id *)&self->_alertLock, 0);
}

@end