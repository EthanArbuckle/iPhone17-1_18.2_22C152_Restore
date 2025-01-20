@interface SUBaseAlertItem
- (BOOL)_createNotification;
- (BOOL)_updateNotification;
- (BOOL)allowInSetup;
- (BOOL)allowLockScreenDismissal;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)allowNoButton;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)isUILocked;
- (BOOL)present;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowCountdown;
- (BOOL)shouldShowInLockScreen;
- (BOOL)showButtonsOnLockScreen;
- (BOOL)undimsScreen;
- (BOOL)update;
- (SUBaseAlertItem)init;
- (id)_notificationButtonActions;
- (id)_notificationButtons;
- (id)_notificationOptions;
- (id)allowedApps;
- (id)buildAlertItemDefinition;
- (id)buttons;
- (id)contentExtensionID;
- (id)extensionDictionary;
- (id)message;
- (id)title;
- (int)_SBPresentationStyleForSUSPresentationStyle:(unint64_t)a3;
- (unint64_t)_notificationFlags;
- (void)_cancelNotification;
- (void)_notificationWasDismissed:(unint64_t)a3;
- (void)_setPresentationManager:(id)a3;
- (void)alertWasDismissed:(unint64_t)a3;
- (void)dealloc;
- (void)dismiss;
- (void)setIsUILocked:(BOOL)a3;
- (void)willPresentAlert;
@end

@implementation SUBaseAlertItem

- (SUBaseAlertItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUBaseAlertItem;
  v2 = [(SUBaseAlertItem *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_isUILocked = 0;
    v2->_notification = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.sus.alertItem.stateQ", v4);
    stateQ = v3->_stateQ;
    v3->_stateQ = (OS_dispatch_queue *)v5;

    objc_storeWeak((id *)&v3->_manager, 0);
  }
  return v3;
}

- (void)dealloc
{
  stateQ = self->_stateQ;
  self->_notification = 0;
  self->_stateQ = 0;

  v4.receiver = self;
  v4.super_class = (Class)SUBaseAlertItem;
  [(SUBaseAlertItem *)&v4 dealloc];
}

- (BOOL)present
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQ);
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQ = v2->_stateQ;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__SUBaseAlertItem_present__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQ, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __26__SUBaseAlertItem_present__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _createNotification];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)update
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQ);
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQ = v2->_stateQ;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__SUBaseAlertItem_update__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQ, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __25__SUBaseAlertItem_update__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateNotification];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dismiss
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQ);
  stateQ = self->_stateQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SUBaseAlertItem_dismiss__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(stateQ, block);
}

uint64_t __26__SUBaseAlertItem_dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelNotification];
}

- (void)willPresentAlert
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  SULogAlerts();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  SULogInfoForSubsystem(v10, @"[%@] willPresentAlert", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
}

- (void)alertWasDismissed:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  SULogAlerts();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  SULogInfoForSubsystem(v11, @"[%@] was dismissed for %ld", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (id)title
{
  return @"SUBaseAlertItem Default Title";
}

- (id)message
{
  return 0;
}

- (id)buttons
{
  return 0;
}

- (id)contentExtensionID
{
  return 0;
}

- (id)extensionDictionary
{
  return 0;
}

- (BOOL)shouldShowCountdown
{
  return 0;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)reappearsAfterLock
{
  return 0;
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (BOOL)forcesModalAlertAppearance
{
  return 0;
}

- (BOOL)allowNoButton
{
  return 0;
}

- (BOOL)showButtonsOnLockScreen
{
  return 0;
}

- (BOOL)allowInSetup
{
  return 0;
}

- (BOOL)undimsScreen
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 1;
}

- (BOOL)allowMenuButtonDismissal
{
  return 1;
}

- (id)allowedApps
{
  return 0;
}

- (BOOL)_createNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  if (self->_notification)
  {
    v3 = SULogAlerts();
    SULogErrorForSubsystem(v3, @"%@ is being presented for %@. Dismiss it first", v4, v5, v6, v7, v8, v9, (uint64_t)self->_notification);

    return 0;
  }
  else
  {
    [(SUBaseAlertItem *)self willPresentAlert];
    CFOptionFlags v11 = [(SUBaseAlertItem *)self _notificationFlags];
    CFDictionaryRef v12 = [(SUBaseAlertItem *)self _notificationOptions];
    v13 = [(SUBaseAlertItem *)self _notificationButtonActions];
    SInt32 error = -1;
    v14 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, v11, &error, v12);
    v15 = SULogAlerts();
    objc_opt_class();
    SULogDebugForSubsystem(v15, @"created %@ for %@ with error %ld", v16, v17, v18, v19, v20, v21, (uint64_t)v14);

    if (v14) {
      BOOL v22 = error == 0;
    }
    else {
      BOOL v22 = 0;
    }
    BOOL v10 = v22;
    if (v22)
    {
      self->_notification = v14;
      v23 = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__SUBaseAlertItem__createNotification__block_invoke;
      block[3] = &unk_26447C918;
      v34 = v14;
      block[4] = self;
      id v33 = v13;
      dispatch_async(v23, block);
    }
    else
    {
      v24 = SULogAlerts();
      SULogInfoForSubsystem(v24, @"failed to display notification: %ld", v25, v26, v27, v28, v29, v30, error);

      if (v14) {
        CFRelease(v14);
      }
    }
  }
  return v10;
}

void __38__SUBaseAlertItem__createNotification__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  SInt32 v2 = CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 48), 0.0, &responseFlags);
  if (v2)
  {
    SInt32 v3 = v2;
    uint64_t v4 = SULogAlerts();
    SULogInfoForSubsystem(v4, @"failed to get response from CFUserNotification: %ld", v5, v6, v7, v8, v9, v10, v3);

    uint64_t v11 = *(void *)(a1 + 32);
    CFDictionaryRef v12 = *(NSObject **)(v11 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__SUBaseAlertItem__createNotification__block_invoke_2;
    block[3] = &unk_26447CDC0;
    uint64_t v13 = *(void *)(a1 + 48);
    v98 = 0;
    uint64_t v99 = v13;
    block[4] = v11;
    dispatch_async(v12, block);
    v14 = v98;
  }
  else if ((~(_BYTE)responseFlags & 3) != 0)
  {
    CFDictionaryRef ResponseDictionary = CFUserNotificationGetResponseDictionary(*(CFUserNotificationRef *)(a1 + 48));
    uint64_t v26 = (void *)CFRetain(ResponseDictionary);
    v14 = v26;
    if (v26)
    {
      uint64_t v27 = [v26 objectForKeyedSubscript:*MEMORY[0x263F79588]];
      uint64_t v28 = SULogAlerts();
      v35 = v28;
      if (v27)
      {
        uint64_t v36 = [v27 unsignedIntegerValue];
        SULogInfoForSubsystem(v35, @"User clicked button index %ld", v37, v38, v39, v40, v41, v42, v36);

        unint64_t v43 = [v27 unsignedIntegerValue];
        if (v43 >= [*(id *)(a1 + 40) count])
        {
          v70 = SULogAlerts();
          SULogInfoForSubsystem(v70, @"index does not match any button", v71, v72, v73, v74, v75, v76, v81);

          uint64_t v77 = *(void *)(a1 + 32);
          v78 = *(NSObject **)(v77 + 16);
          v85[0] = MEMORY[0x263EF8330];
          v85[1] = 3221225472;
          v85[2] = __38__SUBaseAlertItem__createNotification__block_invoke_6;
          v85[3] = &unk_26447CDC0;
          uint64_t v79 = *(void *)(a1 + 48);
          v86 = 0;
          uint64_t v87 = v79;
          v85[4] = v77;
          dispatch_async(v78, v85);
          id v56 = v86;
        }
        else
        {
          v44 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v27, "integerValue"));
          if (!v44)
          {
            v45 = SULogAlerts();
            uint64_t v46 = [v27 unsignedIntegerValue];
            SULogInfoForSubsystem(v45, @"No action registered for button %ld", v47, v48, v49, v50, v51, v52, v46);
          }
          uint64_t v53 = *(void *)(a1 + 32);
          v54 = *(NSObject **)(v53 + 16);
          v82[0] = MEMORY[0x263EF8330];
          v82[1] = 3221225472;
          v82[2] = __38__SUBaseAlertItem__createNotification__block_invoke_7;
          v82[3] = &unk_26447CDC0;
          uint64_t v55 = *(void *)(a1 + 48);
          id v83 = v44;
          uint64_t v84 = v55;
          v82[4] = v53;
          id v56 = v44;
          dispatch_async(v54, v82);
        }
      }
      else
      {
        SULogInfoForSubsystem(v28, @"failed to get button index from response dictionary", v29, v30, v31, v32, v33, v34, v80);

        uint64_t v67 = *(void *)(a1 + 32);
        v68 = *(NSObject **)(v67 + 16);
        v88[0] = MEMORY[0x263EF8330];
        v88[1] = 3221225472;
        v88[2] = __38__SUBaseAlertItem__createNotification__block_invoke_5;
        v88[3] = &unk_26447CDC0;
        uint64_t v69 = *(void *)(a1 + 48);
        v89 = 0;
        uint64_t v90 = v69;
        v88[4] = v67;
        dispatch_async(v68, v88);
        id v56 = v89;
      }
    }
    else
    {
      v57 = SULogAlerts();
      SULogInfoForSubsystem(v57, @"failed to get response dictionary from CFUserNotification: %ld", v58, v59, v60, v61, v62, v63, 0);

      uint64_t v64 = *(void *)(a1 + 32);
      v65 = *(NSObject **)(v64 + 16);
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __38__SUBaseAlertItem__createNotification__block_invoke_4;
      v91[3] = &unk_26447CDC0;
      uint64_t v66 = *(void *)(a1 + 48);
      v92 = 0;
      uint64_t v93 = v66;
      v91[4] = v64;
      dispatch_async(v65, v91);
      uint64_t v27 = v92;
    }
  }
  else
  {
    v15 = SULogAlerts();
    SULogInfoForSubsystem(v15, @"notification was canceled (alert = %@)", v16, v17, v18, v19, v20, v21, *(void *)(a1 + 32));

    uint64_t v22 = *(void *)(a1 + 32);
    v23 = *(NSObject **)(v22 + 16);
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = __38__SUBaseAlertItem__createNotification__block_invoke_3;
    v94[3] = &unk_26447CDC0;
    uint64_t v24 = *(void *)(a1 + 48);
    v95 = 0;
    uint64_t v96 = v24;
    v94[4] = v22;
    dispatch_async(v23, v94);
    v14 = v95;
  }
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  SInt32 v3 = (const void *)a1[6];
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1[4] + 8) = 0;
  uint64_t v4 = (void *)a1[4];

  return [v4 _notificationWasDismissed:0];
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_3(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  SInt32 v3 = (const void *)a1[6];
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1[4] + 8) = 0;
  uint64_t v4 = (void *)a1[4];

  return [v4 _notificationWasDismissed:2];
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_4(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  SInt32 v3 = (const void *)a1[6];
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1[4] + 8) = 0;
  uint64_t v4 = (void *)a1[4];

  return [v4 _notificationWasDismissed:0];
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_5(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  SInt32 v3 = (const void *)a1[6];
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1[4] + 8) = 0;
  uint64_t v4 = (void *)a1[4];

  return [v4 _notificationWasDismissed:0];
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_6(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  SInt32 v3 = (const void *)a1[6];
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1[4] + 8) = 0;
  uint64_t v4 = (void *)a1[4];

  return [v4 _notificationWasDismissed:0];
}

uint64_t __38__SUBaseAlertItem__createNotification__block_invoke_7(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  SInt32 v3 = (const void *)a1[6];
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1[4] + 8) = 0;
  uint64_t v4 = (void *)a1[4];

  return [v4 _notificationWasDismissed:1];
}

- (BOOL)_updateNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  if (!self->_notification)
  {
    uint64_t v4 = SULogAlerts();
    SULogErrorForSubsystem(v4, @"No notification for %@", v14, v15, v16, v17, v18, v19, (uint64_t)self);
    goto LABEL_5;
  }
  CFOptionFlags v3 = [(SUBaseAlertItem *)self _notificationFlags];
  uint64_t v4 = [(SUBaseAlertItem *)self _notificationOptions];
  SInt32 v5 = CFUserNotificationUpdate(self->_notification, 0.0, v3, (CFDictionaryRef)v4);
  BOOL v6 = v5 == 0;
  if (v5)
  {
    uint64_t v7 = SULogAlerts();
    SULogErrorForSubsystem(v7, @"Failed to update %@ for %@", v8, v9, v10, v11, v12, v13, (uint64_t)self->_notification);

LABEL_5:
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_cancelNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  notification = self->_notification;
  if (notification)
  {
    CFUserNotificationCancel(notification);
  }
}

- (void)_notificationWasDismissed:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQ);
  SInt32 v5 = SULogAlerts();
  SULogInfoForSubsystem(v5, @"notification was dismissed for %ld", v6, v7, v8, v9, v10, v11, a3);

  [(SUBaseAlertItem *)self alertWasDismissed:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained _noteAlertDeactivated:self];
}

- (id)buildAlertItemDefinition
{
  CFOptionFlags v3 = objc_alloc_init(SUAlertItemDefinition);
  uint64_t v4 = [(SUBaseAlertItem *)self title];
  [(SUAlertItemDefinition *)v3 setTitle:v4];

  SInt32 v5 = [(SUBaseAlertItem *)self message];
  [(SUAlertItemDefinition *)v3 setMessage:v5];

  uint64_t v6 = [(SUBaseAlertItem *)self buttons];
  [(SUAlertItemDefinition *)v3 setButtons:v6];

  return v3;
}

- (id)_notificationOptions
{
  v38[1] = *MEMORY[0x263EF8340];
  CFOptionFlags v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(SUBaseAlertItem *)self buildAlertItemDefinition];
  SInt32 v5 = [v4 title];

  if (v5)
  {
    uint64_t v6 = [v4 title];
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263EFFFC8]];
  }
  uint64_t v7 = [(SUBaseAlertItem *)self contentExtensionID];

  if (v7)
  {
    uint64_t v8 = [(SUBaseAlertItem *)self contentExtensionID];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x263F79630]];

    uint64_t v9 = [(SUBaseAlertItem *)self extensionDictionary];

    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F08810]);
      uint64_t v11 = [(SUBaseAlertItem *)self extensionDictionary];
      [v10 setUserInfo:v11];

      uint64_t v12 = (void *)MEMORY[0x263F08910];
      v38[0] = v10;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
      uint64_t v14 = [v12 archivedDataWithRootObject:v13 requiringSecureCoding:1 error:0];

      if (v14) {
        [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x263F79638]];
      }

      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v15 = [v4 message];

    if (v15)
    {
      id v10 = [v4 message];
      [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x263EFFFD8]];
LABEL_10:
    }
  }
  uint64_t v16 = [(SUBaseAlertItem *)self _notificationButtons];
  uint64_t v17 = v16;
  if (v16 && [v16 count])
  {
    uint64_t v18 = [(SUBaseAlertItem *)self _notificationButtons];
    [v3 setObject:v18 forKeyedSubscript:*MEMORY[0x263F79590]];
  }
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[SUBaseAlertItem shouldShowInLockScreen](self, "shouldShowInLockScreen"));
  [v3 setObject:v19 forKeyedSubscript:*MEMORY[0x263EFFFE0]];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", -[SUBaseAlertItem reappearsAfterLock](self, "reappearsAfterLock") ^ 1);
  [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x263F79610]];

  uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", -[SUBaseAlertItem reappearsAfterUnlock](self, "reappearsAfterUnlock"));
  [v3 setObject:v21 forKeyedSubscript:*MEMORY[0x263F79628]];

  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[SUBaseAlertItem forcesModalAlertAppearance](self, "forcesModalAlertAppearance"));
  [v3 setObject:v22 forKeyedSubscript:*MEMORY[0x263F79640]];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[SUBaseAlertItem showButtonsOnLockScreen](self, "showButtonsOnLockScreen"));
  [v3 setObject:v23 forKeyedSubscript:*MEMORY[0x263F79618]];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", -[SUBaseAlertItem allowInSetup](self, "allowInSetup"));
  [v3 setObject:v24 forKeyedSubscript:*MEMORY[0x263F795B8]];

  uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[SUBaseAlertItem undimsScreen](self, "undimsScreen"));
  [v3 setObject:v25 forKeyedSubscript:*MEMORY[0x263F796A0]];

  uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", -[SUBaseAlertItem allowLockScreenDismissal](self, "allowLockScreenDismissal"));
  [v3 setObject:v26 forKeyedSubscript:*MEMORY[0x263F795C0]];

  uint64_t v27 = objc_msgSend(NSNumber, "numberWithBool:", -[SUBaseAlertItem allowMenuButtonDismissal](self, "allowMenuButtonDismissal"));
  [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x263F795D0]];

  uint64_t v28 = [(SUBaseAlertItem *)self allowedApps];

  if (v28)
  {
    uint64_t v29 = [(SUBaseAlertItem *)self allowedApps];
    [v3 setObject:v29 forKeyedSubscript:*MEMORY[0x263F795D8]];
  }
  uint64_t v30 = SULogAlerts();
  SULogInfoForSubsystem(v30, @"notificationOptions %@", v31, v32, v33, v34, v35, v36, (uint64_t)v3);

  return v3;
}

- (unint64_t)_notificationFlags
{
  if ([(SUBaseAlertItem *)self allowNoButton]) {
    return 35;
  }
  else {
    return 3;
  }
}

- (id)_notificationButtons
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CFOptionFlags v3 = [MEMORY[0x263EFF980] array];
  [(SUBaseAlertItem *)self buildAlertItemDefinition];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v16 = v20 = 0u;
  uint64_t v4 = [v16 buttons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x263F793D8]);
        uint64_t v11 = [v9 label];
        uint64_t v12 = (void *)[v10 initWithTitle:v11];

        objc_msgSend(v12, "setPresentationStyle:", -[SUBaseAlertItem _SBPresentationStyleForSUSPresentationStyle:](self, "_SBPresentationStyleForSUSPresentationStyle:", objc_msgSend(v9, "presentationStyle")));
        objc_msgSend(v12, "setIsPreferredButton:", objc_msgSend(v9, "isPreferredButton"));
        uint64_t v13 = [v12 build];
        [v3 addObject:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  uint64_t v14 = (void *)[v3 copy];

  return v14;
}

- (id)_notificationButtonActions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFOptionFlags v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(SUBaseAlertItem *)self buildAlertItemDefinition];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(v4, "buttons", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) handler];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

- (int)_SBPresentationStyleForSUSPresentationStyle:(unint64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (void)_setPresentationManager:(id)a3
{
}

- (BOOL)isUILocked
{
  return self->_isUILocked;
}

- (void)setIsUILocked:(BOOL)a3
{
  self->_isUILocked = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);

  objc_storeStrong((id *)&self->_stateQ, 0);
}

@end