id ApplicationElementRetrieval()
{
  return (id)*MEMORY[0x1E4F43630];
}

uint64_t _UIAccessibilityBlockPostingOfNotification(uint64_t a1)
{
  if (_UIAccessibilityBlockPostingOfNotification_onceToken != -1) {
    dispatch_once(&_UIAccessibilityBlockPostingOfNotification_onceToken, &__block_literal_global_6);
  }
  [(id)_BlockNotificationsLock lock];
  if (!_BlockedNotifications)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v3 = (void *)_BlockedNotifications;
    _BlockedNotifications = (uint64_t)v2;
  }
  _UIBlockNotificationsForNotification(a1);
  v4 = (void *)_BlockNotificationsLock;

  return [v4 unlock];
}

void _UIBlockNotificationsForNotification(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = UINotificationsToBlockUnblockForNotification(a1);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend((id)_BlockedNotifications, "addObject:", *(void *)(*((void *)&v6 + 1) + 8 * v5++), (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t _UIAccessibilityFocusedElements()
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    _AXAssert();
  }
  v0 = (void *)__UIAccessibilityFocusedElements;

  return [v0 allValues];
}

void _UIAXBroadcastMainThread(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = v6;
  long long v9 = (id *)MEMORY[0x1E4F43630];
  if (([(id)*MEMORY[0x1E4F43630] _accessibilityIsSystemAppServer] & 1) == 0
    && (MEMORY[0x19F3C9A80]() & 1) == 0
    && (AXProcessIsCommandAndControl() & 1) == 0)
  {
    if ((a1 - 1009) <= 0x19 && ((1 << (a1 + 15)) & 0x3001001) != 0)
    {

      goto LABEL_11;
    }
    if (a1 == 4002)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        uint64_t v3 = [v8 objectForKey:@"event"];
        if ([v3 isEqualToString:@"AnimationsNonActive"])
        {
          char v10 = 1;
          goto LABEL_57;
        }
      }
      if (MEMORY[0x19F3C9A90]()) {
        goto LABEL_56;
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
    if (([*v9 _accessibilityAllowsNotificationsDuringSuspension] & 1) == 0
      && [*v9 isSuspended])
    {
      char v28 = [(id)objc_opt_class() safeBoolForKey:@"_isSystemUIService"];
      if (isKindOfClass) {

      }
      if (v28) {
        goto LABEL_4;
      }
      v29 = [MEMORY[0x1E4F28B50] mainBundle];
      v30 = [v29 bundleIdentifier];
      char v31 = [v30 hasPrefix:@"com.apple.AdSheet"];

      v32 = [MEMORY[0x1E4F28B50] mainBundle];
      v33 = [v32 infoDictionary];
      uint64_t v3 = [v33 objectForKey:@"SBAppTags"];

      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 containsObject:@"hidden"]) {
        char v10 = v31 ^ 1;
      }
      else {
        char v10 = 0;
      }
LABEL_57:

      goto LABEL_5;
    }
LABEL_56:
    char v10 = 1;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_57;
  }
LABEL_4:
  char v10 = 1;
LABEL_5:
  if (a1 == 1000 && ((AXProcessIsChronod() & 1) != 0 || AXProcessIsPosterBoard()))
  {
  }
  else
  {

    if (v10)
    {
LABEL_11:
      if (UIAccessibilityMoveToElementNotification == a1
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v8 objectForKey:UIAccessibilityMoveToElementNotificationKeyElement],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            v11))
      {
        uint64_t v12 = _preprocessNotificationDataForMoveToElementNotification(v8);
      }
      else
      {
        uint64_t v12 = _massageNotificationDataBeforePost(a1, v8);
      }
      v13 = (void *)v12;

      uint64_t v15 = _massageAssociatedElementBeforePost(v14, v7);

      if (_AXUnitTestNotificationWillBeSentCallback)
      {
        v16 = AXRuntimeLogNotifications();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          _UIAXBroadcastMainThread_cold_1(v16);
        }

        _AXUnitTestNotificationWillBeSentCallback(a1, v13, v15);
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v17 = objc_msgSend((id)NotificationCallbacks, "allValues", 0);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v17);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v34 + 1) + 8 * i) + 16))();
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v19);
      }

      v22 = (const void *)_AXCreateAXUIElementWithElement();
      int v23 = AXPushNotificationToSystemForBroadcast();
      if (v22) {
        CFRelease(v22);
      }
      v24 = AXRuntimeLogNotifications();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v23)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138413059;
          v39 = &stru_1EF1680E8;
          __int16 v40 = 1024;
          int v41 = a1;
          __int16 v42 = 1024;
          LODWORD(v43[0]) = v23;
          WORD2(v43[0]) = 2117;
          *(void *)((char *)v43 + 6) = v13;
          v26 = "Post notification failed. notification: %@ (%d) error:%d data:%{sensitive}@";
LABEL_34:
          _os_log_impl(&dword_19F2DB000, v24, OS_LOG_TYPE_INFO, v26, buf, 0x22u);
        }
      }
      else if (v25)
      {
        *(_DWORD *)buf = 138413059;
        v39 = &stru_1EF1680E8;
        __int16 v40 = 1024;
        int v41 = a1;
        __int16 v42 = 1024;
        LODWORD(v43[0]) = 0;
        WORD2(v43[0]) = 2117;
        *(void *)((char *)v43 + 6) = v13;
        v26 = "Did post notification. notification: %@ (%d) error:%d data:%{sensitive}@";
        goto LABEL_34;
      }
      id v7 = (id)v15;
      id v8 = v13;
      goto LABEL_36;
    }
  }
  if (_AXSInUnitTestMode()) {
    goto LABEL_11;
  }
  v24 = AXRuntimeLogNotifications();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412803;
    v39 = &stru_1EF1680E8;
    __int16 v40 = 1024;
    int v41 = a1;
    __int16 v42 = 2113;
    v43[0] = v8;
    _os_log_impl(&dword_19F2DB000, v24, OS_LOG_TYPE_INFO, "Did not post. Not allowed. notification: %@ (%d) data:%{private}@", buf, 0x1Cu);
  }
LABEL_36:
}

void _UIAXCleanupRotorCache(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)RotorCache allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [(id)RotorCache objectForKey:v7];
        long long v9 = [v8 targetElement];

        if (v9 == a1) {
          [(id)RotorCache removeObjectForKey:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void _UIAccessibilityCompleteUnregistration(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    _AXAssert();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend((id)__UIAccessibilityFocusedElements, "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = [(id)__UIAccessibilityFocusedElements objectForKeyedSubscript:v7];
        if (v8 == a1) {
          [(id)__UIAccessibilityFocusedElements removeObjectForKey:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

id _massageNotificationDataBeforePost(uint64_t a1, void *a2)
{
  v75[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if a1 != 1079 && (isKindOfClass)
  {
    id v5 = v3;
    if ([v5 count] != 2) {
      _AXAssert();
    }
    id v6 = [v5 firstObject];
    char v7 = [v6 isEqualToString:*MEMORY[0x1E4F48C88]];

    if ((v7 & 1) == 0) {
      _AXAssert();
    }
    id v8 = [v5 lastObject];
    long long v9 = _massageNotificationDataBeforePost(a1, v8);

    uint64_t v10 = [v5 firstObject];
    long long v11 = (void *)v10;
    if (v9)
    {
      v75[0] = v10;
      v75[1] = v9;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];

      long long v11 = (void *)v12;
    }
    else
    {
    }
    id v20 = v11;

    goto LABEL_79;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = [v3 accessibilityLanguage];

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v3];
      uint64_t v15 = [v3 accessibilityLanguage];
      [v14 setAttribute:v15 forKey:*MEMORY[0x1E4F48A18]];

      id v3 = v14;
    }
  }
  id v5 = 0;
  if (_notificationRequiresElementConversion(a1) && v3)
  {
    CFTypeID v16 = CFGetTypeID(v3);
    if (v16 == AXUIElementGetTypeID()
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), uint64_t v17 = objc_opt_isKindOfClass(), (v17 & 1) != 0))
    {
      id v5 = 0;
    }
    else
    {
      _axuiElementForNotificationData(v17, v3);
      id v5 = v3;
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (!_notificationRequiresSenderPID(a1))
  {
    uint64_t v19 = v3;
    goto LABEL_75;
  }
  if (MEMORY[0x19F3C9A80]()) {
    uint64_t v18 = *MEMORY[0x1E4F48DC0];
  }
  else {
    uint64_t v18 = getpid();
  }
  if (UIAccessibilityNativeFocusItemDidChangeWithContextNotification == a1)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v21 = 0x1E4F28000uLL;
    v22 = [NSNumber numberWithInt:v18];
    [v19 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F48C98]];

    if (!v3) {
      goto LABEL_71;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = (void *)MEMORY[0x1E4F48BD8];
      v24 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F48BD8]];
      [v19 setObject:v24 forKeyedSubscript:*v23];

      BOOL v25 = (void *)MEMORY[0x1E4F48BD0];
      v26 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F48BD0]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v26 CGRectValue];
        v27 = NSStringFromRect(v77);
        [v19 setObject:v27 forKeyedSubscript:*v25];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v19 setObject:v26 forKeyedSubscript:*v25];
        }
      }

      goto LABEL_71;
    }
    id v31 = v5;
    v32 = v31;
    if (!v31)
    {
      id v54 = 0;
      id v50 = 0;
      id v48 = 0;
      goto LABEL_70;
    }
    v60 = v19;
    v61 = v3;
    int v62 = a1;
    v33 = 0;
    long long v34 = v31;
    while (1)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v35 = [v34 _accessibilityUnderlyingElementForFocusItem];

        long long v34 = (void *)v35;
      }
      if (!objc_msgSend(v34, "isAccessibilityElement", v60, v61)) {
        goto LABEL_58;
      }
      if (v34 != v32)
      {
        long long v36 = [MEMORY[0x1E4F1CA48] array];
        long long v37 = [v34 _accessibilitySupplementaryHeaderViews];
        [v36 addObjectsFromArray:v37];

        v38 = [v34 _accessibilitySupplementaryFooterViews];
        [v36 addObjectsFromArray:v38];

        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v39 = v36;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          v63 = v33;
          char v42 = 0;
          uint64_t v43 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v65 != v43) {
                objc_enumerationMutation(v39);
              }
              if ([v32 _accessibilityIsDescendantOfElement:*(void *)(*((void *)&v64 + 1) + 8 * i)])
              {
                uint64_t v45 = AXRuntimeLogNotifications();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v71 = v32;
                  __int16 v72 = 2112;
                  id v73 = v34;
                  _os_log_impl(&dword_19F2DB000, v45, OS_LOG_TYPE_DEFAULT, "Native focus change: Not swapping %@ for %@ because it's a supplementary view (or descendant of one)", buf, 0x16u);
                }

                char v42 = 1;
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v64 objects:v74 count:16];
          }
          while (v41);

          v33 = v63;
          if (v42) {
            goto LABEL_58;
          }
        }
        else
        {
        }
      }
      id v46 = v34;

      v33 = v46;
LABEL_58:
      uint64_t v47 = [v34 accessibilityContainer];

      long long v34 = (void *)v47;
      if (!v47)
      {
        id v48 = v32;
        uint64_t v19 = v60;
        id v3 = v61;
        if (v33)
        {
          char v49 = [v33 isEqual:v48];
          LODWORD(a1) = v62;
          id v50 = v33;
          unint64_t v21 = 0x1E4F28000;
          if ((v49 & 1) == 0)
          {
            id v50 = v50;

            v51 = AXRuntimeLogNotifications();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v71 = v32;
              __int16 v72 = 2112;
              id v73 = v50;
              _os_log_impl(&dword_19F2DB000, v51, OS_LOG_TYPE_DEFAULT, "Native focus change: Swapping %@ for %@ because it's the accessible element", buf, 0x16u);
            }

            uint64_t v53 = _axuiElementForNotificationData(v52, v50);

            id v48 = v50;
            id v3 = (id)v53;
          }
        }
        else
        {
          id v50 = 0;
          LODWORD(a1) = v62;
          unint64_t v21 = 0x1E4F28000uLL;
        }
LABEL_70:
        [v19 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F48BC8]];

LABEL_71:
        v55 = [MEMORY[0x1E4F28B50] mainBundle];
        v29 = [v55 bundleIdentifier];

        if (v29) {
          [v19 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F48BA0]];
        }
        v56 = [*(id *)(v21 + 3792) numberWithBool:_UIApplicationIsExtension()];
        [v19 setObject:v56 forKeyedSubscript:*MEMORY[0x1E4F48B78]];

LABEL_74:
        goto LABEL_75;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v68[0] = *MEMORY[0x1E4F48C98];
    v29 = [NSNumber numberWithInt:v18];
    v69[0] = v29;
    v68[1] = *MEMORY[0x1E4F48C78];
    v30 = v3;
    if (!v3)
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
    }
    v69[1] = v30;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];

    if (!v3) {
    goto LABEL_74;
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
  char v28 = [NSNumber numberWithInt:v18];
  [v19 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F48C98]];

LABEL_75:
  if (a1 == 2041)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = (void *)[v19 mutableCopy];
      v58 = [NSNumber numberWithUnsignedInteger:_massageNotificationDataBeforePost_IdToken];
      [v57 setObject:v58 forKeyedSubscript:@"idToken"];

      ++_massageNotificationDataBeforePost_IdToken;
    }
  }
  id v20 = v19;
LABEL_79:

  return v20;
}

BOOL _notificationRequiresSenderPID(int a1)
{
  return *MEMORY[0x1E4F43470] == a1
      || *MEMORY[0x1E4F43488] == a1
      || *MEMORY[0x1E4F43400] == a1
      || UIAccessibilityNativeFocusItemDidChangeWithContextNotification == a1
      || UIAccessibilityDevicePointerDidEnterElementNotification == a1
      || *MEMORY[0x1E4F43450] == a1
      || *MEMORY[0x1E4F43490] == a1
      || UIAccessibilityMoveToElementNotification == a1;
}

uint64_t _notificationRequiresElementConversion(int a1)
{
  if (UIAccessibilityElementMovedNotification == a1
    || *MEMORY[0x1E4F43490] == a1
    || *MEMORY[0x1E4F43450] == a1
    || UIAccessibilityNativeFocusItemDidChangeWithContextNotification == a1)
  {
    return 1;
  }
  BOOL v5 = a1 == 1057;
  if (a1 == 1026) {
    BOOL v5 = 1;
  }
  return (a1 - 3032) < 2 || v5;
}

id _massageAssociatedElementBeforePost(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = v2;
    _axuiElementForNotificationData((uint64_t)v2, v2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = (id)*MEMORY[0x1E4F43630];
  }

  return v4;
}

id UINotificationsToBlockUnblockForNotification(uint64_t a1)
{
  int v1 = a1;
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [NSNumber numberWithUnsignedInt:a1];
  v7[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = (void *)[v3 mutableCopy];

  if (*MEMORY[0x1E4F43490] == v1)
  {
    BOOL v5 = [NSNumber numberWithUnsignedInt:UIAccessibilityScreenWillChangeNotification];
    [v4 addObject:v5];
  }

  return v4;
}

uint64_t _UIAccessibilityIsNotificationQueued(uint64_t a1)
{
  [(id)_QueuedNotificationsLock lock];
  id v2 = (void *)_QueuedNotifications;
  id v3 = [NSNumber numberWithUnsignedInt:a1];
  uint64_t v4 = [v2 containsObject:v3];

  [(id)_QueuedNotificationsLock unlock];
  return v4;
}

void _UIAccessibilityBroadcastNotificationFunction(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AXRuntimeLogNotifications();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    id v6 = (__CFString *)v3;
    if (a1 == 1005 || a1 == 1008 || a1 == 1072 && (os_variant_has_internal_ui() & 1) == 0)
    {

      id v6 = @"<Announcement data redacted>";
    }
    char v7 = AXRuntimeLogNotifications();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412803;
      *(void *)v33 = &stru_1EF1680E8;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = a1;
      *(_WORD *)&v33[14] = 2117;
      *(void *)&v33[16] = v6;
      _os_log_impl(&dword_19F2DB000, v7, OS_LOG_TYPE_INFO, "Attempting to send notification: %@ (%d) %{sensitive}@", buf, 0x1Cu);
    }
  }
  id v8 = v3;
  int v9 = *MEMORY[0x1E4F43488];
  if (*MEMORY[0x1E4F43470] == a1 || v9 == a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v8 isEqualToString:*MEMORY[0x1E4F43458]] & 1) == 0)
    {
      long long v11 = @"pause";
      if (v9 == a1) {
        long long v11 = @"resume";
      }
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"You must pass the identifier of the assistive technology to %@.  See UIAccessibilityConstants.h for the list of valid values.", v11 format];
    }
  }

  if (_AXBlockAllNotifications == 1)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v13 = [NSNumber numberWithUnsignedInt:a1];
    [v12 setObject:v13 forKeyedSubscript:@"notification"];

    [v12 setObject:v8 forKeyedSubscript:@"notificationData"];
    [v12 setObject:_UIAXAssociatedElementContextForNextNotification forKeyedSubscript:@"associatedObject"];
    [(id)_BlockNotificationsLock lock];
    [(id)_BlockedNotificationQueue addObject:v12];
    [(id)_BlockNotificationsLock unlock];
    uint64_t v14 = AXRuntimeLogNotifications();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109379;
      *(_DWORD *)v33 = a1;
      *(_WORD *)&v33[4] = 2117;
      *(void *)&v33[6] = v8;
      _os_log_impl(&dword_19F2DB000, v14, OS_LOG_TYPE_INFO, "Did not post. Blocking all notifications: %d (%{sensitive}@)", buf, 0x12u);
    }

    uint64_t v15 = (void *)_UIAXAssociatedElementContextForNextNotification;
    _UIAXAssociatedElementContextForNextNotification = 0;
LABEL_42:

    goto LABEL_43;
  }
  if (_AXNextIgnoredNotification() == a1)
  {
    _AXIgnoreNextNotification();
    CFTypeID v16 = AXRuntimeLogNotifications();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v33 = a1;
      uint64_t v17 = "Did not post. Ignore next notification was set: %d";
LABEL_30:
      _os_log_impl(&dword_19F2DB000, v16, OS_LOG_TYPE_INFO, v17, buf, 8u);
    }
  }
  else
  {
    [(id)_BlockNotificationsLock lock];
    uint64_t v18 = (void *)_BlockedNotifications;
    uint64_t v19 = [NSNumber numberWithUnsignedInt:a1];
    LODWORD(v18) = [v18 containsObject:v19];

    [(id)_BlockNotificationsLock unlock];
    if (!v18)
    {
      unint64_t v20 = (unint64_t)(id)_UIAXAssociatedElementContextForNextNotification;
      if (v20)
      {
        unint64_t v21 = AXRuntimeLogNotifications();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          *(void *)v33 = v22;
          *(_WORD *)&v33[8] = 2048;
          *(void *)&v33[10] = v20;
          *(_WORD *)&v33[18] = 1024;
          *(_DWORD *)&v33[20] = a1;
          id v23 = v22;
          _os_log_impl(&dword_19F2DB000, v21, OS_LOG_TYPE_INFO, "consuming associated object for notification: <%@: %p> %d", buf, 0x1Cu);
        }
      }
      v24 = (void *)_UIAXAssociatedElementContextForNextNotification;
      _UIAXAssociatedElementContextForNextNotification = 0;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = ___UIAccessibilityBroadcastNotificationFunction_block_invoke;
      aBlock[3] = &unk_1E59B97F8;
      int v31 = a1;
      unint64_t v25 = (unint64_t)v8;
      id v29 = (id)v25;
      id v30 = (id)v20;
      id v12 = (id)v20;
      v26 = _Block_copy(aBlock);
      v27 = v26;
      if (a1 == 1021)
      {
        (*((void (**)(void *))v26 + 2))(v26);
      }
      else if (v25 | v20 || (_UIAccessibilityIsNotificationQueued(a1) & 1) == 0)
      {
        _UIAccessibilityQueueNotification(a1);
        AXPerformBlockOnMainThreadAfterDelay();
      }

      uint64_t v15 = v29;
      goto LABEL_42;
    }
    CFTypeID v16 = AXRuntimeLogNotifications();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v33 = a1;
      uint64_t v17 = "Did not post. Was among blocked notifications: %d";
      goto LABEL_30;
    }
  }

  id v12 = (id)_UIAXAssociatedElementContextForNextNotification;
  _UIAXAssociatedElementContextForNextNotification = 0;
LABEL_43:
}

uint64_t _UIAccessibilityQueueNotification(uint64_t a1)
{
  if (_UIAccessibilityQueueNotification_onceToken != -1) {
    dispatch_once(&_UIAccessibilityQueueNotification_onceToken, &__block_literal_global_309);
  }
  [(id)_QueuedNotificationsLock lock];
  id v2 = (void *)_QueuedNotifications;
  if (!_QueuedNotifications)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = (void *)_QueuedNotifications;
    _QueuedNotifications = (uint64_t)v3;

    id v2 = (void *)_QueuedNotifications;
  }
  BOOL v5 = [NSNumber numberWithUnsignedInt:a1];
  [v2 addObject:v5];

  id v6 = (void *)_QueuedNotificationsLock;

  return [v6 unlock];
}

id UIAXTimeStringForDuration(double a1)
{
  int v1 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld:%f", (uint64_t)a1 / 3600, (uint64_t)a1 % 3600 / 60, a1 - (double)(3600 * ((uint64_t)a1 / 3600) + 60 * ((uint64_t)a1 % 3600 / 60)));
  id v2 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v1];
  [v2 setAttribute:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F489B8]];

  return v2;
}

uint64_t _UIAXAppIsSystemAppServer()
{
  return [(id)*MEMORY[0x1E4F43630] _accessibilityIsSystemAppServer];
}

uint64_t _UIAXAppIsReadyToBeProbed()
{
  return [(id)*MEMORY[0x1E4F43630] _accessibilityIsAppReadyToBeProbed];
}

uint64_t _UIAXAppBundleIdentifier()
{
  return [(id)*MEMORY[0x1E4F43630] _accessibilityBundleIdentifier];
}

uint64_t _UIAXIsApplicationAccessiblityReady()
{
  return _gUIAXIsApplicationAccessiblityReady;
}

void _UIAXPostAccessibilityLoadedNotification()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F48B48], 0, 0, 1u);
  int v1 = AXLogLoading();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_19F2DB000, v1, OS_LOG_TYPE_INFO, "Posted kAXAccessibilityLoaded notification", v2, 2u);
  }
}

void _UIAXInformSystemAppServerIsReady()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = (uint64_t *)MEMORY[0x1E4F43630];
  char v1 = [(id)*MEMORY[0x1E4F43630] _accessibilitySystemAppServerIsReady];
  id v2 = AXLogLoading();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
  if (v1)
  {
    if (v3)
    {
      uint64_t v4 = *v0;
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_19F2DB000, v2, OS_LOG_TYPE_INFO, "System app server is ready: %@", (uint8_t *)&v6, 0xCu);
    }

    _UIAXPostAccessibilityLoadedNotification();
  }
  else
  {
    if (v3)
    {
      uint64_t v5 = *v0;
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_19F2DB000, v2, OS_LOG_TYPE_INFO, "System app server is not ready: %@, waiting", (uint8_t *)&v6, 0xCu);
    }

    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void _UIAXInformPreBoardIsReadyToBeProbed()
{
  if ([(id)*MEMORY[0x1E4F43630] _accessibilityIsAppReadyToBeProbed])
  {
    _UIAXPostAccessibilityLoadedNotification();
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t AXServerCacheSetEnabled(int a1)
{
  if (a1)
  {
    uint64_t v1 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  else
  {
    uint64_t v1 = 0;
  }
  AXServerCache = v1;

  return MEMORY[0x1F41817F8]();
}

void _AXServerCacheInsertPossiblyNilObjectForKey(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  if (v5 && AXServerCache)
  {
    if (v3)
    {
      [(id)AXServerCache setObject:v3 forKeyedSubscript:v5];
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
      [(id)AXServerCache setObject:v4 forKeyedSubscript:v5];
    }
  }
}

BOOL _AXServerCacheGetPossiblyNilObjectForKey(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2)
  {
    if (v3 && AXServerCache)
    {
      id v5 = [(id)AXServerCache objectForKeyedSubscript:v3];
      BOOL v6 = v5 != 0;
      if (v5)
      {
        uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
        if ([v5 isEqual:v7]) {
          uint64_t v8 = 0;
        }
        else {
          uint64_t v8 = v5;
        }
        *a2 = v8;
      }
      else
      {
        *a2 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
      *a2 = 0;
    }
  }
  else
  {
    int v9 = AXLogAppAccessibility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      _AXServerCacheGetPossiblyNilObjectForKey_cold_1(v9);
    }

    BOOL v6 = 0;
  }

  return v6;
}

void _UIAccessibilityStart()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((_AccessibilityStarted & 1) == 0)
  {
    _AccessibilityStarted = 1;
    long long v9 = xmmword_1EF165140;
    long long v10 = *(_OWORD *)&off_1EF165150;
    uint64_t v11 = qword_1EF165160;
    long long v7 = xmmword_1EF165120;
    long long v8 = *(_OWORD *)&off_1EF165130;
    int IsSystemAppServer = _UIAXAppIsSystemAppServer();
    CFRunLoopGetCurrent();
    if (IsSystemAppServer) {
      int v1 = _AXUIElementRegisterSystemWideServerWithRunLoop();
    }
    else {
      int v1 = _AXUIElementRegisterServerWithRunLoop();
    }
    int v2 = v1;
    if (v1)
    {
      id v3 = AXLogAppAccessibility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _UIAccessibilityStart_cold_1(v2, v3);
      }
    }
    _AXSetApplicationElementHandler();
    if (_UIAXInitializeConstantValues_onceToken != -1) {
      dispatch_once(&_UIAXInitializeConstantValues_onceToken, &__block_literal_global_0);
    }
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F48340], "sharedInstance", v7, v8, v9, v10, v11);
    [v4 setIgnoreLogging:_UIAXAutomationIgnoreLogging()];

    id v5 = AXLogAppAccessibility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = _UIAXAppIsSystemAppServer();
      _os_log_impl(&dword_19F2DB000, v5, OS_LOG_TYPE_INFO, "Started AXRuntime server. SystemApp=%i", buf, 8u);
    }

    BOOL v6 = AXLogAppAccessibility();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F2DB000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UIAccessibilityStart", (const char *)&unk_19F34FEBA, buf, 2u);
    }

    MACaptionAppearanceSetDidDisplayCaptionsCallback();
  }
}

uint64_t _copyAttributeValueCallback(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v23 = a1;
  uint64_t v24 = a2;
  BOOL v6 = AXLogAppAccessibility();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, &v23);

  long long v8 = AXLogAppAccessibility();
  long long v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 134218496;
    v26 = v23;
    __int16 v27 = 2048;
    uint64_t v28 = v24;
    __int16 v29 = 2048;
    uint64_t v30 = a3;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyAttribute", "UID:[hash:%llu id:%llu] attr:%ld", buf, 0x20u);
  }

  if (!a4) {
    return 4294942095;
  }
  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode()) {
    return 4294942078;
  }
  uint64_t v10 = MEMORY[0x19F3CA0A0](0);
  uint64_t v11 = _AXElementForAXUIElementUniqueId();
  id v12 = v11;
  if (v11 && ![v11 _accessibilityElementShouldBeInvalid])
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    CFTypeID v16 = (void *)AXServerCache;
    AXServerCache = v15;

    uint64_t v17 = [v12 _iosAccessibilityAttributeValue:a3];
    int v13 = UIAXRuntimeConvertOutgoingParameterizedValue(a3, v17, 0);

    if (v13) {
      CFTypeRef v18 = CFRetain(v13);
    }
    else {
      CFTypeRef v18 = 0;
    }
    *a4 = v18;
    uint64_t v19 = (void *)AXServerCache;
    AXServerCache = 0;

    MEMORY[0x19F3CA080](v10);
    unint64_t v20 = AXLogAppAccessibility();
    unint64_t v21 = v20;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F2DB000, v21, OS_SIGNPOST_INTERVAL_END, v7, "AXCopyAttribute", (const char *)&unk_19F34FEBA, buf, 2u);
    }

    uint64_t v14 = 0;
  }
  else
  {
    MEMORY[0x19F3CA080](v10);
    int v13 = AXLogUIA();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl(&dword_19F2DB000, v13, OS_LOG_TYPE_INFO, "Returning invalid element for copy attribute: %@", buf, 0xCu);
    }
    uint64_t v14 = 4294942094;
  }

  return v14;
}

uint64_t _setAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode()) {
    return 4294942078;
  }
  uint64_t v4 = MEMORY[0x19F3CA0A0](0);
  id v5 = _AXElementForAXUIElementUniqueId();
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    os_signpost_id_t v7 = (void *)AXServerCache;
    AXServerCache = v6;

    long long v8 = AXConvertIncomingValue();
    [v5 _iosAccessibilitySetValue:v8 forAttribute:a3];
    long long v9 = (void *)AXServerCache;
    AXServerCache = 0;

    MEMORY[0x19F3CA080](v4);
    uint64_t v10 = 0;
  }
  else
  {
    MEMORY[0x19F3CA080](v4);
    uint64_t v11 = AXLogUIA();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = 0;
      _os_log_impl(&dword_19F2DB000, v11, OS_LOG_TYPE_INFO, "Returning invalid element: for set attribute %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v10 = 4294942094;
  }

  return v10;
}

uint64_t _performActionCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v4 = AXLogAppAccessibility();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, &v19);

  uint64_t v6 = AXLogAppAccessibility();
  os_signpost_id_t v7 = v6;
  unint64_t v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v22 = v19;
    __int16 v23 = 2048;
    uint64_t v24 = v20;
    __int16 v25 = 2048;
    uint64_t v26 = a3;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PerformAction", "UID:[hash:%llu id:%llu] action:%ld", buf, 0x20u);
  }

  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode()) {
    return 4294942078;
  }
  uint64_t v9 = MEMORY[0x19F3CA0A0](0);
  uint64_t v10 = _AXElementForAXUIElementUniqueId();
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = (void *)AXServerCache;
    AXServerCache = v11;

    if ([v10 _iosAccessibilityPerformAction:a3 withValue:0 fencePort:0]) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 4294942096;
    }
    uint64_t v14 = (void *)AXServerCache;
    AXServerCache = 0;

    MEMORY[0x19F3CA080](v9);
    uint64_t v15 = AXLogAppAccessibility();
    CFTypeID v16 = v15;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F2DB000, v16, OS_SIGNPOST_INTERVAL_END, v5, "PerformAction", (const char *)&unk_19F34FEBA, buf, 2u);
    }
  }
  else
  {
    MEMORY[0x19F3CA080](v9);
    uint64_t v17 = AXLogAppAccessibility();
    CFTypeID v16 = v17;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F2DB000, v16, OS_SIGNPOST_INTERVAL_END, v5, "PerformAction", (const char *)&unk_19F34FEBA, buf, 2u);
    }
    uint64_t v13 = 4294942094;
  }

  return v13;
}

uint64_t _performActionWithValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  unint64_t v8 = AXLogAppAccessibility();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, &v25);

  uint64_t v10 = AXLogAppAccessibility();
  uint64_t v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v28 = v25;
    __int16 v29 = 2048;
    uint64_t v30 = v26;
    __int16 v31 = 2048;
    uint64_t v32 = a3;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformActionWithValue", "UID:[hash:%llu id:%llu] action:%ld", buf, 0x20u);
  }

  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode()) {
    return 4294942078;
  }
  uint64_t v13 = MEMORY[0x19F3CA0A0](0);
  uint64_t v14 = _AXElementForAXUIElementUniqueId();
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    CFTypeID v16 = (void *)AXServerCache;
    AXServerCache = v15;

    uint64_t v17 = AXConvertIncomingValue();
    int v18 = [v14 _iosAccessibilityPerformAction:a3 withValue:v17 fencePort:a6];

    if (v18) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 4294942096;
    }
    uint64_t v20 = (void *)AXServerCache;
    AXServerCache = 0;

    MEMORY[0x19F3CA080](v13);
    unint64_t v21 = AXLogAppAccessibility();
    uint64_t v22 = v21;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F2DB000, v22, OS_SIGNPOST_INTERVAL_END, v9, "PerformActionWithValue", (const char *)&unk_19F34FEBA, buf, 2u);
    }
  }
  else
  {
    __int16 v23 = AXLogAppAccessibility();
    uint64_t v22 = v23;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F2DB000, v22, OS_SIGNPOST_INTERVAL_END, v9, "PerformActionWithValue", (const char *)&unk_19F34FEBA, buf, 2u);
    }
    uint64_t v19 = 4294942094;
  }

  return v19;
}

uint64_t _copyElementAtPositionCallback(uint64_t a1, uint64_t a2, unsigned int a3, int a4, uint64_t *a5, float a6, float a7)
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  uint64_t ptr = a1;
  uint64_t v161 = a2;
  uint64_t v10 = AXLogAppAccessibility();
  os_signpost_id_t spid = os_signpost_id_make_with_pointer(v10, &ptr);

  uint64_t v11 = AXLogAppAccessibility();
  unint64_t v12 = v11;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 134218752;
    *(void *)&uint8_t buf[4] = ptr;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v161;
    *(_WORD *)&buf[22] = 2048;
    double v171 = a6;
    LOWORD(v172) = 2048;
    *(double *)((char *)&v172 + 2) = a7;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CopyElementAtPosition", "UID:[hash:%llu id:%llu] Point:[%.2f %.2f]", buf, 0x2Au);
  }

  if (!_UIAXAppIsReadyToBeProbed()) {
    return 4294942078;
  }
  uint64_t v125 = MEMORY[0x19F3CA0A0](0);
  uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = (void *)AXServerCache;
  AXServerCache = v13;

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  double v171 = COERCE_DOUBLE(__Block_byref_object_copy_);
  *(void *)&long long v172 = __Block_byref_object_dispose_;
  *((void *)&v172 + 1) = 0;
  CFTypeRef cf = 0;
  uint64_t v15 = (void *)UIAccessibilityCreateEventForSceneReferencePoint(&cf, a6, a7);
  CFTypeID v16 = v15;
  if (!v15)
  {
    uint64_t v22 = 4294942096;
    goto LABEL_133;
  }
  [v15 _setAccessibilityHitTestType:a3];
  GSEventGetLocationInWindow();
  double v19 = v17;
  double v20 = v18;
  if (a4)
  {
    id v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F43058], "_findWithDisplayPoint:", v17, v18);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  *(void *)v153 = 0;
  v154 = v153;
  uint64_t v155 = 0x3032000000;
  v156 = __Block_byref_object_copy_;
  v157 = __Block_byref_object_dispose_;
  id v158 = 0;
  uint64_t v148 = MEMORY[0x1E4F143A8];
  uint64_t v124 = 3221225472;
  uint64_t v149 = 3221225472;
  v150 = ___copyElementAtPositionCallback_block_invoke;
  v151 = &unk_1E59B89A0;
  v152 = v153;
  AXPerformSafeBlock();
  if (a4 && !v21)
  {
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v23 = *((id *)v154 + 5);
    id v24 = 0;
    uint64_t v25 = [v23 countByEnumeratingWithState:&v144 objects:v169 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v145;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v145 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v144 + 1) + 8 * i);
          if (objc_msgSend(v28, "_accessibilityContextId", v124) == a4 && v24 == 0) {
            id v24 = v28;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v144 objects:v169 count:16];
      }
      while (v25);
    }

    id v21 = v24;
  }
  if (!v21 && v161 == 9999)
  {
    uint64_t v30 = _AXElementForAXUIElementUniqueId();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v31 = [v30 accessibilityElements];
      uint64_t v32 = [v31 firstObject];
      id v21 = [v32 _accessibilityWindow];

      uint64_t v33 = AXLogUIA();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v162 = 138412546;
        id v163 = v30;
        __int16 v164 = 2112;
        id v165 = v21;
        _os_log_impl(&dword_19F2DB000, v33, OS_LOG_TYPE_INFO, "Incoming remote element hit test -> %@/%@", v162, 0x16u);
      }
    }
    else
    {
      id v21 = 0;
    }
  }
  if (_copyElementAtPositionCallback_onceToken == -1)
  {
    if (v21) {
      goto LABEL_37;
    }
  }
  else
  {
    dispatch_once(&_copyElementAtPositionCallback_onceToken, &__block_literal_global_274);
    if (v21)
    {
LABEL_37:
      if ((objc_msgSend(v21, "accessibilityElementsHidden", v124) & 1) == 0)
      {
        [v21 alpha];
        if (v34 > 0.0
          && ([v21 isHidden] & 1) == 0
          && (([v21 isUserInteractionEnabled] & 1) != 0
           || [v21 _accessibilityIsUserInteractionEnabled])
          && (objc_opt_isKindOfClass() & 1) == 0)
        {
          goto LABEL_54;
        }
      }
    }
  }
  uint64_t v35 = objc_msgSend(MEMORY[0x1E4F43058], "_findWithDisplayPoint:", v19, v20, v124);

  if ([v35 accessibilityElementsHidden])
  {
    long long v36 = AXLogUIA();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v162 = 138412290;
      id v163 = v35;
      long long v37 = "Window is marked accessibilityHidden: %@";
LABEL_52:
      _os_log_impl(&dword_19F2DB000, v36, OS_LOG_TYPE_INFO, v37, v162, 0xCu);
      goto LABEL_53;
    }
    goto LABEL_53;
  }
  [v35 alpha];
  if (v38 <= 0.0)
  {
    long long v36 = AXLogUIA();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v162 = 138412290;
      id v163 = v35;
      long long v37 = "Window has alpha <= 0: %@";
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  if ([v35 isHidden])
  {
    long long v36 = AXLogUIA();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v162 = 138412290;
      id v163 = v35;
      long long v37 = "Window has hidden = true: %@";
      goto LABEL_52;
    }
LABEL_53:

    id v21 = 0;
    goto LABEL_54;
  }
  id v21 = v35;
LABEL_54:
  id v39 = AXLogUIA();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v162 = 138412290;
    id v163 = v21;
    _os_log_impl(&dword_19F2DB000, v39, OS_LOG_TYPE_INFO, "Hit testing with window: %@", v162, 0xCu);
  }

  double v40 = AXConvertFromDisplayPointToWindowPoint(v21, v19, v20);
  double v126 = v41;
  double v127 = v40;
  uint64_t GSEventRecord = _GSEventGetGSEventRecord();
  *(double *)(GSEventRecord + 8) = v19;
  *(double *)(GSEventRecord + 16) = v20;
  *(_OWORD *)(GSEventRecord + 24) = *(_OWORD *)(GSEventRecord + 8);
  uint64_t v43 = [v21 screen];
  if ([v16 _gsEvent])
  {
    uint64_t v44 = _GSEventGetGSEventRecord();
    *(double *)(v44 + 8) = v19;
    *(double *)(v44 + 16) = v20;
  }

  uint64_t v45 = [MEMORY[0x1E4F42738] sharedApplication];
  int v46 = [v45 _isClassic];

  if (v46)
  {
    *(double *)(GSEventRecord + 8) = v127;
    *(double *)(GSEventRecord + 16) = v126;
    *(double *)(GSEventRecord + 24) = v127;
    *(double *)(GSEventRecord + 32) = v126;
  }
  uint64_t v47 = [v21 windowScene];
  id v48 = [v47 statusBarManager];
  [v48 statusBarFrame];
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  double v56 = v55;

  if (NSClassFromString(&cfstr_Sbwindowscenes.isa))
  {
    v57 = [v21 windowScene];
    v58 = [v57 statusBarManager];
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & (v56 == 0.0)) != 0)
    {
      v60 = [v21 windowScene];
      v61 = [v60 statusBarManager];
      int v62 = [v61 safeUIViewForKey:@"statusBar"];
      [v62 frame];
      CGFloat v64 = v63;
      CGFloat v66 = v65;
      CGFloat v68 = v67;
      CGFloat v70 = v69;

      v177.origin.x = v64;
      v177.origin.y = v66;
      v177.size.width = v68;
      v177.size.height = v70;
      if (!CGRectIsNull(v177))
      {
        CGFloat v50 = v64;
        CGFloat v52 = v66;
        CGFloat v54 = v68;
        double v56 = v70;
      }
    }
  }
  if ([v21 _accessibilityIgnoresStatusBarFrame])
  {
    BOOL v71 = 0;
  }
  else
  {
    __int16 v72 = [v21 windowScene];
    id v73 = [v72 statusBarManager];
    if ([v73 isStatusBarHidden])
    {
      BOOL v71 = 0;
    }
    else
    {
      v178.origin.x = v50;
      v178.origin.y = v52;
      v178.size.width = v54;
      v178.size.height = v56;
      v176.y = v126;
      v176.x = v127;
      BOOL v71 = CGRectContainsPoint(v178, v176);
    }
  }
  if (AXProcessIsSpringBoard())
  {
    if ([(id)*MEMORY[0x1E4F43630] _accessibilityShouldHitTestStatusBarWindow]
      && ([v21 _accessibilityIsInWidgetStack] & 1) == 0)
    {
      int v96 = [v21 _accessibilityIsInJindo];
      id v74 = v21;
      if (((!v71 | v96) & 1) == 0)
      {
        v97 = AXLogHitTest();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
        {
          v175.y = v126;
          v175.x = v127;
          NSStringFromCGPoint(v175);
          id v120 = (id)objc_claimAutoreleasedReturnValue();
          v121 = [v74 windowScene];
          v122 = [v121 statusBarManager];
          [v122 statusBarFrame];
          NSStringFromCGRect(v179);
          id v123 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v162 = 138412546;
          id v163 = v120;
          __int16 v164 = 2112;
          id v165 = v123;
          _os_log_debug_impl(&dword_19F2DB000, v97, OS_LOG_TYPE_DEBUG, "Hit test was in the status bar frame, point: %@. Status bar frame: %@", v162, 0x16u);
        }
        long long v142 = 0u;
        long long v143 = 0u;
        long long v141 = 0u;
        long long v140 = 0u;
        id v98 = *((id *)v154 + 5);
        uint64_t v99 = [v98 countByEnumeratingWithState:&v140 objects:v168 count:16];
        v100 = v74;
        if (v99)
        {
          uint64_t v101 = *(void *)v141;
          v100 = v74;
          do
          {
            for (uint64_t j = 0; j != v99; ++j)
            {
              if (*(void *)v141 != v101) {
                objc_enumerationMutation(v98);
              }
              v103 = *(void **)(*((void *)&v140 + 1) + 8 * j);
              if ([v103 _isStatusBarWindow])
              {
                id v104 = v103;

                v100 = v104;
              }
            }
            uint64_t v99 = [v98 countByEnumeratingWithState:&v140 objects:v168 count:16];
          }
          while (v99);
        }

        id v105 = v100;
        id v74 = v105;
      }
    }
    else
    {
      id v74 = v21;
    }
  }
  else
  {
    id v74 = v21;
    if (v71) {
      goto LABEL_113;
    }
  }
  uint64_t v75 = objc_msgSend(v74, "_accessibilityHitTest:withEvent:", v16, v127, v126);
  v76 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v75;

  NSRect v77 = AXLogUIA();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
  {
    UIAXMassageElementDescription(*(void **)(*(void *)&buf[8] + 40));
    id v78 = (id)objc_claimAutoreleasedReturnValue();
    v174.y = v126;
    v174.x = v127;
    NSStringFromPoint(v174);
    id v79 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v162 = 138412802;
    id v163 = v78;
    __int16 v164 = 2112;
    id v165 = v74;
    __int16 v166 = 2112;
    id v167 = v79;
    _os_log_impl(&dword_19F2DB000, v77, OS_LOG_TYPE_INFO, "Hit testing found: %@ with window: %@ > %@", v162, 0x20u);
  }
  if (a3 == 2 && !*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v80 = objc_msgSend(v74, "hitTest:withEvent:", v16, v127, v126);
    v81 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v80;

    v82 = AXLogUIA();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      v83 = *(void **)(*(void *)&buf[8] + 40);
      *(_DWORD *)v162 = 138412546;
      id v163 = v74;
      __int16 v164 = 2112;
      id v165 = v83;
      _os_log_impl(&dword_19F2DB000, v82, OS_LOG_TYPE_INFO, "Is visible query using real hit test: %@ %@", v162, 0x16u);
    }
  }
  if (v74) {
    char v84 = v71;
  }
  else {
    char v84 = 1;
  }
  if ((v84 & 1) == 0)
  {
    id v85 = *(id *)(*(void *)&buf[8] + 40);
    if (!v85 || a3 != 2 && v74 == v85)
    {
      if ([v74 accessibilityViewIsModal])
      {
        [v74 windowLevel];
        if (v86 > *MEMORY[0x1E4F43C70])
        {
          [v74 windowLevel];
          double v88 = v87;
          v89 = [MEMORY[0x1E4F42B08] activeKeyboard];
          v90 = [v89 window];
          [v90 windowLevel];
          BOOL v92 = v88 > v91;

          if (v92)
          {
            v93 = 0;
LABEL_112:
            v138[0] = MEMORY[0x1E4F143A8];
            v138[1] = v124;
            v138[2] = ___copyElementAtPositionCallback_block_invoke_2;
            v138[3] = &unk_1E59B89E8;
            id v106 = v74;
            id v139 = v106;
            v107 = [v93 axFilterObjectsUsingBlock:v138];

            v131[0] = MEMORY[0x1E4F143A8];
            v131[1] = v124;
            v131[2] = ___copyElementAtPositionCallback_block_invoke_3;
            v131[3] = &unk_1E59B8A10;
            id v132 = v106;
            id v74 = v132;
            double v136 = v127;
            double v137 = v126;
            id v133 = v74;
            v135 = buf;
            id v134 = v16;
            [v107 enumerateObjectsUsingBlock:v131];

            goto LABEL_113;
          }
        }
        v94 = AXUIAllKeyboardWindows();
        if ([v94 containsObject:v74])
        {

          v94 = 0;
        }
        uint64_t v95 = [0 arrayByAddingObjectsFromArray:v94];
      }
      else
      {
        v94 = [(id)*MEMORY[0x1E4F43630] _accessibilityAllWindowsOnlyVisibleWindows:1];
        uint64_t v95 = [v94 sortedArrayUsingComparator:&__block_literal_global_289];
      }
      v93 = (void *)v95;

      goto LABEL_112;
    }
  }
LABEL_113:
  v108 = *(void **)(*(void *)&buf[8] + 40);
  if (a3 == 3)
  {
    uint64_t v109 = [v108 _accessibilityScrollParent];
LABEL_115:
    v110 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v109;

    goto LABEL_123;
  }
  if (([v108 isAccessibilityElement] & 1) == 0)
  {
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v111 = [*(id *)(*(void *)&buf[8] + 40) _accessibilityIsTouchContainer];
        char v112 = a3 == 2 ? 1 : v111;
        if ((v112 & 1) == 0)
        {
          uint64_t v109 = [*(id *)(*(void *)&buf[8] + 40) _accessibilityTouchContainer];
          goto LABEL_115;
        }
      }
    }
  }
LABEL_123:
  CFRelease(cf);
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    v114 = AXLogUIA();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v162 = 0;
      _os_log_impl(&dword_19F2DB000, v114, OS_LOG_TYPE_INFO, "Returning invalid element for copy element at position", v162, 2u);
    }
    goto LABEL_131;
  }
  uint64_t v113 = _AXCreateAXUIElementWithElement();
  if (!v113)
  {
    v114 = AXLogUIA();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
      v115 = *(void **)(*(void *)&buf[8] + 40);
      *(_DWORD *)v162 = 138412290;
      id v163 = v115;
      _os_log_impl(&dword_19F2DB000, v114, OS_LOG_TYPE_INFO, "Returning invalid element in copy element for position: %@", v162, 0xCu);
    }
LABEL_131:

    uint64_t v22 = 4294942094;
    goto LABEL_132;
  }
  uint64_t v22 = 0;
  *a5 = v113;
LABEL_132:

  _Block_object_dispose(v153, 8);
LABEL_133:
  v116 = AXLogAppAccessibility();
  v117 = v116;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v116))
  {
    *(_WORD *)v153 = 0;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v117, OS_SIGNPOST_INTERVAL_END, spid, "CopyElementAtPosition", (const char *)&unk_19F34FEBA, v153, 2u);
  }

  v118 = (void *)AXServerCache;
  AXServerCache = 0;

  MEMORY[0x19F3CA080](v125);
  _Block_object_dispose(buf, 8);

  return v22;
}

void sub_19F2E3258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t _copyParameterizedAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  os_signpost_id_t v7 = AXLogAppAccessibility();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, &v25);

  os_signpost_id_t v9 = AXLogAppAccessibility();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v28 = v25;
    __int16 v29 = 2048;
    uint64_t v30 = v26;
    __int16 v31 = 2048;
    uint64_t v32 = a3;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CopyParameterizedAttribute", "UID:[hash:%llu id:%llu] attr:%ld", buf, 0x20u);
  }

  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode()) {
    return 4294942078;
  }
  uint64_t v11 = MEMORY[0x19F3CA0A0](0);
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = (void *)AXServerCache;
  AXServerCache = v12;

  if (a5)
  {
    uint64_t v14 = AXConvertIncomingValue();
    if (v14)
    {
      uint64_t v15 = _AXElementForAXUIElementUniqueId();
      CFTypeID v16 = v15;
      if (v15)
      {
        double v17 = [v15 _iosAccessibilityAttributeValue:a3 forParameter:v14];
        double v18 = UIAXRuntimeConvertOutgoingParameterizedValue(a3, v17, v14);
        double v19 = v18;
        if (v18) {
          double v18 = (void *)CFRetain(v18);
        }
        *a5 = v18;

        uint64_t v20 = 0;
      }
      else
      {
        *a5 = 0;
        uint64_t v20 = 4294942094;
      }
    }
    else
    {
      *a5 = 0;
      uint64_t v20 = 4294942095;
    }
  }
  else
  {
    uint64_t v20 = 4294942095;
  }
  id v21 = (void *)AXServerCache;
  AXServerCache = 0;

  MEMORY[0x19F3CA080](v11);
  uint64_t v22 = AXLogAppAccessibility();
  id v23 = v22;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v23, OS_SIGNPOST_INTERVAL_END, v8, "CopyParameterizedAttribute", (const char *)&unk_19F34FEBA, buf, 2u);
  }

  return v20;
}

uint64_t _copyMultipleAttributeValuesCallback(void *a1, uint64_t a2, const __CFArray *a3, uint64_t a4, __CFArray **a5)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t ptr = a1;
  uint64_t v39 = a2;
  os_signpost_id_t v7 = AXLogAppAccessibility();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, &ptr);

  os_signpost_id_t v9 = AXLogAppAccessibility();
  uint64_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    uint64_t v12 = ptr;
    uint64_t v13 = v39;
    CFIndex Count = CFArrayGetCount(a3);
    *(_DWORD *)buf = 134218496;
    double v41 = v12;
    __int16 v42 = 2048;
    uint64_t v43 = v13;
    __int16 v44 = 2048;
    CFIndex v45 = Count;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CopyMultiAttribute", "UID:[hash:%llu id:%llu] attrCount:%ld", buf, 0x20u);
  }

  if ((_UIAXAppIsReadyToBeProbed() & 1) == 0 && !_AXSInUnitTestMode()) {
    return 4294942078;
  }
  uint64_t v15 = MEMORY[0x19F3CA0A0](0);
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  double v17 = (void *)AXServerCache;
  AXServerCache = v16;

  if (a3)
  {
    double v18 = _AXElementForAXUIElementUniqueId();
    double v19 = v18;
    if (v18 && ![v18 _accessibilityElementShouldBeInvalid])
    {
      CFIndex v22 = CFArrayGetCount(a3);
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v35 = v15;
        long long v36 = a5;
        os_signpost_id_t v37 = v8;
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v22, MEMORY[0x1E4F1D510]);
        if (v23 >= 1)
        {
          for (CFIndex i = 0; i != v23; ++i)
          {
            uint64_t v26 = (void *)MEMORY[0x19F3CA890]();
            uint64_t v27 = objc_msgSend((id)CFArrayGetValueAtIndex(a3, i), "unsignedIntValue");
            uint64_t v28 = [v19 _iosAccessibilityAttributeValue:v27];
            __int16 v29 = UIAXRuntimeConvertOutgoingParameterizedValue(v27, v28, 0);

            if (v29)
            {
              CFArraySetValueAtIndex(Mutable, i, v29);
            }
            else
            {
              *(_DWORD *)buf = -25205;
              AXValueRef v30 = AXValueCreate(kAXValueTypeAXError, buf);
              CFArraySetValueAtIndex(Mutable, i, v30);
              CFRelease(v30);
            }
          }
        }
        uint64_t v21 = 0;
        uint64_t v15 = v35;
        *long long v36 = Mutable;
        os_signpost_id_t v8 = v37;
      }
      else
      {
        uint64_t v21 = 4294942095;
      }
    }
    else
    {
      uint64_t v20 = AXLogUIA();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v41 = v19;
        _os_log_impl(&dword_19F2DB000, v20, OS_LOG_TYPE_INFO, "Returning invalid element for copy multiple attribute: %@", buf, 0xCu);
      }

      uint64_t v21 = 4294942094;
    }
  }
  else
  {
    uint64_t v21 = 4294942095;
  }
  __int16 v31 = (void *)AXServerCache;
  AXServerCache = 0;

  MEMORY[0x19F3CA080](v15);
  uint64_t v32 = AXLogAppAccessibility();
  uint64_t v33 = v32;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v33, OS_SIGNPOST_INTERVAL_END, v8, "CopyMultiAttribute", (const char *)&unk_19F34FEBA, buf, 2u);
  }

  return v21;
}

void _UIAXInitializeConstantValues()
{
  if (_UIAXInitializeConstantValues_onceToken != -1) {
    dispatch_once(&_UIAXInitializeConstantValues_onceToken, &__block_literal_global_0);
  }
}

void _accessibilityCaptionsDidDisplay(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *MEMORY[0x1E4F48BB0];
    v5[0] = a1;
    int v1 = (void *)MEMORY[0x1E4F1C9E8];
    id v2 = a1;
    id v3 = [v1 dictionaryWithObjects:v5 forKeys:&v4 count:1];

    UIAccessibilityPostNotification(0x42Cu, v3);
  }
}

void _UIAccessibilityStop()
{
  if (_AccessibilityStarted == 1)
  {
    _AccessibilityStarted = 0;
    int v0 = _AXUIElementUnregisterServer();
    if (v0)
    {
      int v1 = v0;
      id v2 = AXLogAppAccessibility();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        _UIAccessibilityStop_cold_1(v1, v2);
      }
    }
    id v3 = AXLogAppAccessibility();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)os_signpost_id_t v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F2DB000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UIAccessibilityStop", (const char *)&unk_19F34FEBA, v5, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)1, (CFNotificationName)*MEMORY[0x1E4FB9388], 0);
  }
}

uint64_t _UIAccessibilitySetDisplayPointForEvent(void *a1, double a2, double a3)
{
  uint64_t result = [a1 _gsEvent];
  if (result)
  {
    uint64_t result = _GSEventGetGSEventRecord();
    *(double *)(result + 8) = a2;
    *(double *)(result + 16) = a3;
  }
  return result;
}

double AXConvertFromDisplayPointToWindowPoint(void *a1, double a2, double a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (v5)
  {
    os_signpost_id_t v7 = [v5 windowScene];
    os_signpost_id_t v8 = [v7 _FBSScene];

    id v9 = v8;
    id v10 = v6;
    unint64_t v11 = [v10 windowScene];
    id v12 = [v11 _FBSScene];

    if (v12 != v9)
    {
      if (v9)
      {
        uint64_t v13 = [v9 settings];
        [v13 frame];
        double v15 = v14;
        double v17 = v16;
        [v13 interfaceOrientation];
        _UIConvertPointFromOrientationToOrientation();
        a2 = v15 + v18;
        a3 = v17 + v19;
      }
      if (v12)
      {
        uint64_t v20 = [v12 settings];
        [v20 frame];
        [v20 interfaceOrientation];
        _UIConvertPointFromOrientationToOrientation();
        a2 = v21;
        a3 = v22;
      }
    }
    uint64_t v23 = [v10 layer];
    objc_msgSend(v23, "convertPoint:fromLayer:", 0, a2, a3);
    a2 = v24;
  }
  return a2;
}

id UIAccessibilityWindowForContextId(int a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x3032000000;
  double v21 = __Block_byref_object_copy_;
  double v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __UIAccessibilityWindowForContextId_block_invoke;
  double v16 = &unk_1E59B89A0;
  double v17 = &v18;
  AXPerformSafeBlock();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)v19[5];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "_accessibilityContextId", (void)v9) == a1)
        {
          id v7 = v6;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v24 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v7 = 0;
LABEL_11:

  _Block_object_dispose(&v18, 8);

  return v7;
}

void sub_19F2E44CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
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

uint64_t __UIAccessibilityWindowForContextId_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)*MEMORY[0x1E4F43630] _accessibilityAllWindowsOnlyVisibleWindows:1];

  return MEMORY[0x1F41817F8]();
}

id AXConvertOutgoingParameterizedValueByFindingLeafDescendant(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = 1;
  if (a1 > 3071)
  {
    if (a1 <= 92599)
    {
      if (a1 == 3072) {
        goto LABEL_18;
      }
      unsigned __int16 v6 = 26975;
    }
    else
    {
      if (a1 == 92600 || a1 == 95234) {
        goto LABEL_18;
      }
      unsigned __int16 v6 = 29714;
    }
    if (a1 != (v6 | 0x10000)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (a1 > 2999)
  {
    if ((unint64_t)(a1 - 3000) > 0x32) {
      goto LABEL_19;
    }
    if (((1 << (a1 + 72)) & 0x4000000810203) == 0)
    {
      if (a1 != 3006) {
        goto LABEL_19;
      }
      uint64_t v5 = 10;
    }
    goto LABEL_18;
  }
  if (a1 == 2013 || a1 == 2026 || a1 == 2231)
  {
LABEL_18:
    uint64_t v7 = _accessibleElementFromElement(v3, v5);

    uint64_t v4 = (void *)v7;
  }
LABEL_19:

  return v4;
}

uint64_t AXContextIdForPoint(uint64_t a1, double a2, double a3)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  *(double *)valuePtr = a2;
  *(double *)&valuePtr[1] = a3;
  CFTypeRef cf = 0;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  SystemWide = AXUIElementCreateSystemWide();
  v15[0] = v4;
  unsigned __int16 v6 = [NSNumber numberWithUnsignedInt:a1];
  v15[1] = v6;
  AXError v7 = AXUIElementCopyParameterizedAttributeValue(SystemWide, (CFStringRef)0x16573, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2], &cf);

  if (SystemWide) {
    CFRelease(SystemWide);
  }
  if (v4) {
    CFRelease(v4);
  }
  CFTypeRef v8 = cf;
  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = cf == 0;
  }
  if (v9)
  {
    uint64_t v10 = 0;
    if (!cf) {
      return v10;
    }
    goto LABEL_16;
  }
  CFTypeID v11 = CFGetTypeID(cf);
  if (v11 == CFNumberGetTypeID()) {
    uint64_t v10 = [(id)cf unsignedIntValue];
  }
  else {
    uint64_t v10 = 0;
  }
  CFTypeRef v8 = cf;
  if (cf) {
LABEL_16:
  }
    CFRelease(v8);
  return v10;
}

id UIAXRuntimeConvertOutgoingValue(uint64_t a1, void *a2)
{
  return UIAXRuntimeConvertOutgoingParameterizedValue(a1, a2, 0);
}

id UIAXRuntimeConvertOutgoingParameterizedValue(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (_AXSAutomationLocalizedStringLookupInfoEnabled() || _AXSAutomationPreferredLocalization())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        AXError v7 = [v5 _accessibilityAttributedLocalizedString];
        CFTypeRef v8 = v7;
        if (v7)
        {
          id v9 = v7;

          id v5 = v9;
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __UIAXRuntimeConvertOutgoingParameterizedValue_block_invoke;
      v13[3] = &unk_1E59B8A38;
      id v14 = v5;
      [v14 enumerateAttributesUsingBlock:v13];
    }
    uint64_t v10 = AXConvertOutgoingParameterizedValueByFindingLeafDescendant(a1, v5);
    CFTypeID v11 = AXConvertOutgoingValue();
  }
  else
  {
    CFTypeID v11 = 0;
  }

  return v11;
}

uint64_t _UIAXPerformValidationChecks()
{
  return MEMORY[0x1F41061B8]();
}

uint64_t ___copyElementAtPositionCallback_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)*MEMORY[0x1E4F43630] _accessibilityAllWindowsOnlyVisibleWindows:1];

  return MEMORY[0x1F41817F8]();
}

Class ___copyElementAtPositionCallback_block_invoke_272()
{
  Class result = NSClassFromString(&cfstr_Uibackgroundhi.isa);
  _copyElementAtPositionCallback_backgroundHitTestWindowClass = (uint64_t)result;
  return result;
}

uint64_t ___copyElementAtPositionCallback_block_invoke_286(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 windowLevel];
  double v6 = v5;
  [v4 windowLevel];
  double v8 = v7;

  uint64_t v9 = -1;
  if (v6 >= v8) {
    uint64_t v9 = 1;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

BOOL ___copyElementAtPositionCallback_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = 0;
  }
  else if (*(void *)(a1 + 32))
  {
    double v5 = [v3 windowScene];
    double v6 = [*(id *)(a1 + 32) windowScene];
    BOOL v4 = v5 == v6;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

void ___copyElementAtPositionCallback_block_invoke_3(double *a1, void *a2, uint64_t a3, char *a4)
{
  double v6 = (void *)*((void *)a1 + 4);
  double v7 = (void *)*((void *)a1 + 5);
  double v8 = a1[8];
  double v9 = a1[9];
  id v10 = a2;
  objc_msgSend(v7, "convertPoint:toView:", v6, v8, v9);
  objc_msgSend(v6, "convertPoint:toWindow:", v10);
  uint64_t v11 = objc_msgSend(v10, "_accessibilityHitTest:withEvent:", *((void *)a1 + 6));
  uint64_t v12 = *(void *)(*((void *)a1 + 7) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = *(id *)(*(void *)(*((void *)a1 + 7) + 8) + 40);
  if (v14) {
    BOOL v15 = v14 == v10;
  }
  else {
    BOOL v15 = 1;
  }
  char v16 = !v15;
  *a4 = v16;
}

id _accessibleElementFromElement(void *a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_28;
  }
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 == AXUIElementGetTypeID())
  {
    id v6 = v4;
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = _accessibleElementFromElement(*(void *)(*((void *)&v26 + 1) + 8 * i), a2);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v6 addObjectsFromArray:v12];
          }
          else if (v12)
          {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_28:
    id v6 = 0;
    goto LABEL_35;
  }
  id v7 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  uint64_t v13 = [v4 _accessibilityLeafDescendantsWithCount:(int)a2 options:v7];
  if (v13)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = (void *)_AXCreateAXUIElementWithElement();
          objc_msgSend(v6, "axSafelyAddObject:", v19, v22);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    if ([v6 count] == 1)
    {
      uint64_t v20 = [v6 firstObject];
LABEL_32:

      id v6 = (id)v20;
      goto LABEL_33;
    }
    if (![v6 count])
    {
      uint64_t v20 = 0;
      goto LABEL_32;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_33:

LABEL_34:
LABEL_35:

  return v6;
}

void __UIAXRuntimeConvertOutgoingParameterizedValue_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  id v7 = [v11 objectForKey:@"UIAccessibilityTextAttributeContext"];

  uint64_t v8 = v11;
  if (v7)
  {
    uint64_t v9 = [v11 objectForKey:*MEMORY[0x1E4F434A0]];
    uint64_t v10 = AXSSTextualContextFromUITextualContext(v9);

    if (v10) {
      objc_msgSend(*(id *)(a1 + 32), "setAttribute:forKey:withRange:", v10, *MEMORY[0x1E4F488E8], a3, a4);
    }

    uint64_t v8 = v11;
  }
}

void AXApplyAttributedLocalizedStringToCopy(void *a1, void *a2)
{
  id v6 = a2;
  id v3 = [a1 _accessibilityAttributedLocalizedString];
  BOOL v4 = v3;
  if (v3)
  {
    CFTypeID v5 = (void *)[v3 copyWithZone:0];
    [v6 _setAccessibilityAttributedLocalizedString:v5];
  }
}

id _UIAXCCFindAncestorContentModuleContainerViewController(void *a1)
{
  id v1 = a1;
  Class v2 = NSClassFromString(&cfstr_Ccuicontentmod.isa);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___UIAXCCFindAncestorContentModuleContainerViewController_block_invoke;
  v6[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v6[4] = v2;
  id v3 = [v1 _accessibilityFindAncestor:v6 startWithSelf:1];

  BOOL v4 = [v3 _accessibilityViewController];

  return v4;
}

uint64_t UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction(void *a1, char a2)
{
  id v3 = a1;
  if (a2) {
    goto LABEL_11;
  }
  BOOL v4 = NSProtocolFromString(&cfstr_Ccuicontentmod_0.isa);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction_block_invoke;
  v16[3] = &unk_1E59B8A80;
  id v5 = v4;
  id v17 = v5;
  id v6 = [v3 _accessibilityFindAncestor:v16 startWithSelf:1];
  id v7 = [v6 _accessibilityViewController];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [v6 _accessibilityViewController];
    uint64_t v10 = [v9 safeBoolForKey:@"_accessibilityControlCenterShouldExpandContentModule"];

    int v11 = 0;
    goto LABEL_10;
  }
  if (v6)
  {
    uint64_t v12 = [v6 _accessibilityViewController];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [v6 _accessibilityViewController];
      int v14 = [v13 safeBoolForKey:@"shouldBeginTransitionToExpandedContentModule"];

      if (!v14)
      {
        int v11 = 0;
        uint64_t v10 = 0;
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  uint64_t v10 = 0;
  int v11 = 1;
LABEL_10:

  if (v11) {
LABEL_11:
  }
    uint64_t v10 = UIAccessibilityControlCenterModuleIsExpanded(v3) ^ 1;

  return v10;
}

uint64_t __UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _accessibilityViewController];
  uint64_t v4 = [v3 conformsToProtocol:*(void *)(a1 + 32)];

  return v4;
}

uint64_t UIAccessibilityControlCenterModuleIsExpanded(void *a1)
{
  id v1 = _UIAXCCFindAncestorContentModuleContainerViewController(a1);
  uint64_t v2 = [v1 safeBoolForKey:@"isExpanded"];

  return v2;
}

id UIAccessibilityControlCenterOpenModuleCustomAction(void *a1)
{
  id v1 = a1;
  objc_initWeak(&location, v1);
  id v2 = objc_alloc(MEMORY[0x1E4F426C0]);
  id v3 = UIKitAccessibilityLocalizedString(@"controlcenter.open.module.custom.action");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __UIAccessibilityControlCenterOpenModuleCustomAction_block_invoke;
  v6[3] = &unk_1E59B8AD0;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = (void *)[v2 initWithName:v3 actionHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);

  return v4;
}

void sub_19F2E676C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __UIAccessibilityControlCenterOpenModuleCustomAction_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = _UIAXCCFindAncestorContentModuleContainerViewController(WeakRetained);

  id v8 = v5;
  AXPerformSafeBlock();
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_19F2E687C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __UIAccessibilityControlCenterOpenModuleCustomAction_block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) expandModule];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

id UIAccessibilityControlCenterCloseModuleCustomAction(void *a1)
{
  id v1 = a1;
  objc_initWeak(&location, v1);
  id v2 = objc_alloc(MEMORY[0x1E4F426C0]);
  id v3 = UIKitAccessibilityLocalizedString(@"controlcenter.close.module.custom.action");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __UIAccessibilityControlCenterCloseModuleCustomAction_block_invoke;
  v6[3] = &unk_1E59B8AD0;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = (void *)[v2 initWithName:v3 actionHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);

  return v4;
}

void sub_19F2E69C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __UIAccessibilityControlCenterCloseModuleCustomAction_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = _UIAXCCFindAncestorContentModuleContainerViewController(WeakRetained);

  id v8 = v5;
  AXPerformSafeBlock();
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_19F2E6AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __UIAccessibilityControlCenterCloseModuleCustomAction_block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dismissExpandedModuleAnimated:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded(void *a1, void *a2, char a3)
{
  id v10 = a1;
  id v5 = a2;
  int ShouldIncludeOpenModuleAction = UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction(v10, a3);
  int IsExpanded = UIAccessibilityControlCenterModuleIsExpanded(v10);
  if (ShouldIncludeOpenModuleAction)
  {
    id v8 = [v10 _accessibilityValueForKey:@"openModuleAction"];
    if (!v8)
    {
      id v8 = UIAccessibilityControlCenterOpenModuleCustomAction(v10);
      [v10 _accessibilitySetRetainedValue:v8 forKey:@"openModuleAction"];
    }
    if (([v5 containsObject:v8] & 1) == 0) {
      [v5 axSafelyAddObject:v8];
    }
  }
  if (IsExpanded)
  {
    uint64_t v9 = [v10 _accessibilityValueForKey:@"closeModuleAction"];
    if (!v9)
    {
      uint64_t v9 = UIAccessibilityControlCenterCloseModuleCustomAction(v10);
      [v10 _accessibilitySetRetainedValue:v9 forKey:@"closeModuleAction"];
    }
    if (([v5 containsObject:v9] & 1) == 0) {
      [v5 axSafelyAddObject:v9];
    }
  }
}

id UIAccessibilityControlCenterModuleExpandPlatterHint()
{
  return UIKitAccessibilityLocalizedString(@"control.center.expand.platter.hint");
}

void sub_19F2E743C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UIAccessibilityCustomActionLaunchAppFloatImage()
{
  int v0 = (void *)MEMORY[0x1E4F42A80];
  id v1 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/CoreServices/AssistiveTouch.app"];
  id v2 = [v0 imageNamed:@"SCATIcon_floatApp_launchFloatFromDock" inBundle:v1];
  id v3 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

id _UIAccessibilityCustomActionLaunchAppPinLeftImage()
{
  int v0 = (void *)MEMORY[0x1E4F42A80];
  id v1 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/CoreServices/AssistiveTouch.app"];
  id v2 = [v0 imageNamed:@"SCATIcon_floatApp_launchPinFromDockLeft" inBundle:v1];
  id v3 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

id _UIAccessibilityCustomActionLaunchAppPinRightImage()
{
  int v0 = (void *)MEMORY[0x1E4F42A80];
  id v1 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/CoreServices/AssistiveTouch.app"];
  id v2 = [v0 imageNamed:@"SCATIcon_floatApp_launchPinFromDockRight" inBundle:v1];
  id v3 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

id _UIAccessibilityCustomActionDeleteImage()
{
  int v0 = (void *)MEMORY[0x1E4F42A80];
  id v1 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/CoreServices/AssistiveTouch.app"];
  id v2 = [v0 imageNamed:@"SCATIcon_action_delete" inBundle:v1];
  id v3 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

id _UIAccessibilityCustomActionMoreImage()
{
  int v0 = (void *)MEMORY[0x1E4F42A80];
  id v1 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/CoreServices/AssistiveTouch.app"];
  id v2 = [v0 imageNamed:@"SCATIcon_action_more" inBundle:v1];
  id v3 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

void sub_19F2E8980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19F2E987C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2E9F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_19F2ECD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_19F2EF418(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_19F2F0A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id axAuditSwizzlePreferredContentSizeCategory1()
{
  if (_axFontSizeToReturn) {
    return (id)_axFontSizeToReturn;
  }
  else {
    return (id)*MEMORY[0x1E4F437B8];
  }
}

id axAuditSwizzlePreferredContentSizeCategory2()
{
  if (_axFontSizeToReturn) {
    return (id)_axFontSizeToReturn;
  }
  else {
    return (id)*MEMORY[0x1E4F437B8];
  }
}

void sub_19F2F3B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_GCGamepadEventImplClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  int v0 = (void *)get_GCGamepadEventImplClass_softClass;
  uint64_t v7 = get_GCGamepadEventImplClass_softClass;
  if (!get_GCGamepadEventImplClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __get_GCGamepadEventImplClass_block_invoke;
    v3[3] = &unk_1E59B89A0;
    v3[4] = &v4;
    __get_GCGamepadEventImplClass_block_invoke((uint64_t)v3);
    int v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19F2F3F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getGCExtendedGamepadClass_block_invoke(uint64_t a1)
{
  GameControllerLibrary();
  Class result = objc_getClass("GCExtendedGamepad");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getGCExtendedGamepadClass_block_invoke_cold_1();
  }
  getGCExtendedGamepadClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t GameControllerLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!GameControllerLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __GameControllerLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E59B8E78;
    uint64_t v4 = 0;
    GameControllerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = GameControllerLibraryCore_frameworkLibrary;
  if (!GameControllerLibraryCore_frameworkLibrary) {
    GameControllerLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __GameControllerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GameControllerLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getGCControllerClass_block_invoke(uint64_t a1)
{
  GameControllerLibrary();
  Class result = objc_getClass("GCController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getGCControllerClass_block_invoke_cold_1();
  }
  getGCControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__get_publishCustomControllerSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)GameControllerLibrary();
  Class result = dlsym(v2, "_publishCustomController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_publishCustomControllerSymbolLoc_uint64_t ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id UIAXMassageElementDescription(void *a1)
{
  id v1 = a1;
  NSClassFromString(&cfstr_Ictk2textview.isa);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v2 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), v1];
  }
  else
  {
    uint64_t v2 = [v1 description];
  }
  long long v3 = (void *)v2;

  return v3;
}

void sub_19F2F6C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2F6DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2F6FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_19F2F72DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2F7534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _switchControlNegatesPerformEscapeAnswer(void *a1)
{
  id v1 = a1;
  if (_AXSAssistiveTouchScannerEnabled())
  {
    uint64_t v2 = 0;
  }
  else
  {
    if (_switchControlNegatesPerformEscapeAnswer_onceToken != -1) {
      dispatch_once(&_switchControlNegatesPerformEscapeAnswer_onceToken, &__block_literal_global_366);
    }
    uint64_t v2 = [(id)_switchControlNegatesPerformEscapeAnswer_DisregardClasses containsObject:objc_opt_class()];
  }

  return v2;
}

uint64_t ___switchControlNegatesPerformEscapeAnswer_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v1 = (void *)_switchControlNegatesPerformEscapeAnswer_DisregardClasses;
  _switchControlNegatesPerformEscapeAnswer_DisregardClasses = (uint64_t)v0;

  [(id)_switchControlNegatesPerformEscapeAnswer_DisregardClasses axSafelyAddObject:NSClassFromString(&cfstr_Uinavigationba.isa)];
  [(id)_switchControlNegatesPerformEscapeAnswer_DisregardClasses axSafelyAddObject:NSClassFromString(&cfstr_Uinavigationbu.isa)];
  uint64_t v2 = (void *)_switchControlNegatesPerformEscapeAnswer_DisregardClasses;
  Class v3 = NSClassFromString(&cfstr_Uikeyboardlayo.isa);

  return [v2 axSafelyAddObject:v3];
}

void sub_19F2F7884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19F2F7F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2F849C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19F2F8A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19F2F8C54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19F2F9218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2F9A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2FAD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2FB03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2FB38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F2FC98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19F2FD76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F3002A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F300474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLGRRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getLGRRequestClass_softClass;
  uint64_t v7 = getLGRRequestClass_softClass;
  if (!getLGRRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLGRRequestClass_block_invoke;
    v3[3] = &unk_1E59B89A0;
    v3[4] = &v4;
    __getLGRRequestClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19F30605C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLGRRuntimeManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getLGRRuntimeManagerClass_softClass;
  uint64_t v7 = getLGRRuntimeManagerClass_softClass;
  if (!getLGRRuntimeManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLGRRuntimeManagerClass_block_invoke;
    v3[3] = &unk_1E59B89A0;
    v3[4] = &v4;
    __getLGRRuntimeManagerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19F306140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getTinkerRuntimeClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getTinkerRuntimeClass_softClass;
  uint64_t v7 = getTinkerRuntimeClass_softClass;
  if (!getTinkerRuntimeClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getTinkerRuntimeClass_block_invoke;
    v3[3] = &unk_1E59B89A0;
    v3[4] = &v4;
    __getTinkerRuntimeClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19F306224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _accessibilityPostProcessContextKitData(void *a1)
{
  id v1 = a1;
  uint64_t v2 = AXAccessibilityBundlesDirectory();
  Class v3 = [v2 stringByAppendingPathComponent:@"ContextKitAccessibilityProcessor.bundle"];

  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithPath:v3];
  id v12 = 0;
  char v5 = [v4 loadAndReturnError:&v12];
  id v6 = v12;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = objc_alloc_init((Class)[v4 principalClass]);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v8 performSelector:sel_processContextKitAccessibilityData_ withObject:v1];
    }
    else
    {
      NSLog(&cfstr_NeedsToImpleme.isa, v8);
      id v9 = v1;
    }
    id v10 = v9;
  }
  else
  {
    NSLog(&cfstr_CouldNotLoad.isa, v3, v6);
    id v10 = v1;
  }

  return v10;
}

void sub_19F30AFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_19F30B618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F30BC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F30BD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F30BEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F30C1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F30D65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F30FE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F310A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F3115B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19F3118F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _checkSortPriority(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v5 = v4;
  if (!v3 || !v4)
  {
    id v30 = v3;
    id v31 = v4;
    _AXAssert();
  }
  id v35 = 0;
  uint64_t v6 = objc_msgSend(v3, "_accessibilitySortPriorityWithReturningElement:", &v35, v30, v31);
  id v7 = v35;
  id v8 = [v3 _accessibilitySortPriorityContainer];
  id v34 = 0;
  uint64_t v9 = [v5 _accessibilitySortPriorityWithReturningElement:&v34];
  id v10 = v34;
  uint64_t v11 = [v5 _accessibilitySortPriorityContainer];
  id v12 = (void *)v11;
  BOOL v13 = v11 == 0;
  BOOL v14 = v8 == (void *)v11 || v8 == 0;
  uint64_t v15 = UIAccessibilityDefaultSortPriority;
  if (v8 == (void *)v11) {
    BOOL v13 = 1;
  }
  if (v14) {
    uint64_t v16 = v6;
  }
  else {
    uint64_t v16 = UIAccessibilityDefaultSortPriority;
  }
  if (v13) {
    uint64_t v17 = v9;
  }
  else {
    uint64_t v17 = UIAccessibilityDefaultSortPriority;
  }
  if (v7 == v10)
  {
    uint64_t v17 = UIAccessibilityDefaultSortPriority;
    goto LABEL_20;
  }
  if ([v7 _accessibilityIsDescendantOfElement:v10])
  {
    uint64_t v15 = UIAccessibilityDefaultSortPriority;
    uint64_t v17 = UIAccessibilityDefaultSortPriority;
    goto LABEL_21;
  }
  char v18 = [v10 _accessibilityIsDescendantOfElement:v7];
  uint64_t v15 = UIAccessibilityDefaultSortPriority;
  if (v18)
  {
LABEL_20:
    uint64_t v16 = v15;
    goto LABEL_21;
  }
  if (v16 != UIAccessibilityDefaultSortPriority && v17 != UIAccessibilityDefaultSortPriority)
  {
    uint64_t v33 = v8;
    double v21 = [v7 accessibilityContainer];
    long long v22 = [v10 accessibilityContainer];
    long long v23 = [v22 _accessibilitySubviews];

    if (v21)
    {
      while (1)
      {
        uint64_t v24 = [v21 _accessibilitySortPriority];
        if (v16 <= v24) {
          uint64_t v16 = v24;
        }
        if ([v23 containsObject:v21]) {
          break;
        }
        uint64_t v25 = [v21 accessibilityContainer];

        double v21 = (void *)v25;
        if (!v25) {
          goto LABEL_36;
        }
      }
      long long v26 = v23;
    }
    else
    {
LABEL_36:
      double v21 = [v10 accessibilityContainer];
      uint64_t v32 = [v7 accessibilityContainer];
      long long v26 = [v32 _accessibilitySubviews];

      if (!v21)
      {
LABEL_41:
        long long v29 = _accessibilityCommonAncestor(v7, v10);
        uint64_t v19 = [v29 _accessibilityCompareElement:v7 toElement:v10];

        if (v19)
        {

          id v8 = v33;
          goto LABEL_28;
        }
        id v8 = v33;
        goto LABEL_46;
      }
      while (1)
      {
        uint64_t v27 = [v21 _accessibilitySortPriority];
        if (v17 <= v27) {
          uint64_t v17 = v27;
        }
        if ([v26 containsObject:v21]) {
          break;
        }
        uint64_t v28 = [v21 accessibilityContainer];

        double v21 = (void *)v28;
        if (!v28) {
          goto LABEL_41;
        }
      }
    }
    id v8 = v33;

LABEL_46:
    uint64_t v15 = UIAccessibilityDefaultSortPriority;
  }
LABEL_21:
  if (v16 != v15 || v17 != v15)
  {
    if (v16 > v17)
    {
      uint64_t v19 = -1;
      goto LABEL_28;
    }
    if (v17 > v16)
    {
      uint64_t v19 = 1;
      goto LABEL_28;
    }
  }
  uint64_t v19 = 0;
LABEL_28:

  return v19;
}

id _accessibilityCommonAncestor(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 _accessibilityProxyView];
  char v5 = [v3 _accessibilityProxyView];

  objc_opt_class();
  uint64_t v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  id v7 = __UIAccessibilityCastAsClass();

  id v8 = [MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    do
    {
      [v8 addObject:v6];
      uint64_t v9 = [v6 superview];

      uint64_t v6 = (void *)v9;
    }
    while (v9);
  }
  if (v7)
  {
    do
    {
      if ([v8 containsObject:v7]) {
        break;
      }
      uint64_t v10 = [v7 superview];

      id v7 = (void *)v10;
    }
    while (v10);
  }

  return v7;
}

void sub_19F313BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _scrollParentForComparingGeometryOfView(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_scrollParentForComparingGeometryOfView", v1);
  id v3 = [(id)AXServerCache objectForKeyedSubscript:v2];

  if (v3)
  {
    id v4 = [(id)AXServerCache objectForKeyedSubscript:v2];
    goto LABEL_12;
  }
  char v5 = [v1 _accessibilityContainingParentForOrdering];
  if ([v1 _accessibilityUsesScrollParentForOrdering])
  {
    id v4 = [v1 _accessibilityScrollParent];
    if ([v4 _accessibilityUsesScrollParentForOrdering])
    {
      if (v4)
      {
        if (v5 && [v5 _accessibilityIsDescendantOfElement:v4])
        {
          id v6 = v5;

          id v4 = v6;
        }
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  id v4 = v5;
LABEL_11:
  [(id)AXServerCache setObject:v4 forKeyedSubscript:v2];

LABEL_12:

  return v4;
}

void sub_19F31549C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F315FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F317280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _UIAccessibilitySetFocusedElement(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = a2;
  if (!v3) {
    _AXAssert();
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    _AXAssert();
  }
  if (v3)
  {
    if (_UIAccessibilitySetFocusedElement_onceToken != -1) {
      dispatch_once(&_UIAccessibilitySetFocusedElement_onceToken, &__block_literal_global_1502);
    }
    id v4 = [(id)__UIAccessibilityFocusedElements objectForKeyedSubscript:v3];
    if (v4 != v7)
    {
      if (v4) {
        [(id)__UIAccessibilityFocusedElements removeObjectForKey:v3];
      }
      if (v7) {
        [(id)__UIAccessibilityFocusedElements setObject:v7 forKeyedSubscript:v3];
      }
      char v5 = [MEMORY[0x1E4F1CA60] dictionary];
      if (v7) {
        [v5 setObject:v7 forKey:*MEMORY[0x1E4F43428]];
      }
      if (v4) {
        [v5 setObject:v4 forKey:*MEMORY[0x1E4F43578]];
      }
      [v5 setObject:v3 forKey:*MEMORY[0x1E4F43408]];
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 postNotificationName:*MEMORY[0x1E4F43420] object:0 userInfo:v5];
    }
  }
}

void _UIAccessibilityClearFocusedElementsStore()
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    _AXAssert();
  }
  id v0 = (void *)__UIAccessibilityFocusedElements;
  __UIAccessibilityFocusedElements = 0;
}

id _UIAccessibilityFocusedElementForAssistiveTech(uint64_t a1)
{
  if (a1)
  {
    id v1 = objc_msgSend((id)__UIAccessibilityFocusedElements, "objectForKeyedSubscript:");
  }
  else
  {
    uint64_t v2 = [(id)__UIAccessibilityFocusedElements allValues];
    id v1 = [v2 firstObject];
  }

  return v1;
}

id _beaxTextMarkerRangeForArray(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  if ([v1 count] == 2)
  {
    id v3 = [v1 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v1 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v6 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v7 = objc_opt_class();
        id v8 = [v1 objectAtIndexedSubscript:0];
        id v20 = 0;
        uint64_t v9 = [v6 unarchivedObjectOfClass:v7 fromData:v8 error:&v20];
        id v10 = v20;
        [v2 setStartMarker:v9];

        if (v10)
        {
          uint64_t v11 = AXLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v22 = v10;
            _os_log_impl(&dword_19F2DB000, v11, OS_LOG_TYPE_DEFAULT, "Could not deserialize start marker: %@", buf, 0xCu);
          }
        }
        id v12 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v13 = objc_opt_class();
        BOOL v14 = [v1 objectAtIndexedSubscript:1];
        id v19 = v10;
        uint64_t v15 = [v12 unarchivedObjectOfClass:v13 fromData:v14 error:&v19];
        id v16 = v19;

        [v2 setEndMarker:v15];
        if (v16)
        {
          uint64_t v17 = AXLogCommon();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v22 = v16;
            _os_log_impl(&dword_19F2DB000, v17, OS_LOG_TYPE_DEFAULT, "Could not deserialize end marker: %@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
    }
  }

  return v2;
}

id _beaxRangeToArray(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F1C978];
  id v2 = a1;
  id v3 = [v2 startMarker];
  id v4 = [v2 endMarker];

  char v5 = objc_msgSend(v1, "arrayWithObjects:", v3, v4, 0);

  return v5;
}

void sub_19F31B334(_Unwind_Exception *a1)
{
}

void sub_19F31D328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F31E3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19F321B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v7 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t LookingGlassRuntimeSupportLibraryCore()
{
  if (!LookingGlassRuntimeSupportLibraryCore_frameworkLibrary) {
    LookingGlassRuntimeSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return LookingGlassRuntimeSupportLibraryCore_frameworkLibrary;
}

uint64_t __LookingGlassRuntimeSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LookingGlassRuntimeSupportLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLGRRequestClass_block_invoke(uint64_t a1)
{
  LookingGlassRuntimeSupportLibrary();
  Class result = objc_getClass("LGRRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLGRRequestClass_block_invoke_cold_1();
  }
  getLGRRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void LookingGlassRuntimeSupportLibrary()
{
  id v0 = 0;
  if (!LookingGlassRuntimeSupportLibraryCore()) {
    LookingGlassRuntimeSupportLibrary_cold_1(&v0);
  }
}

Class __getLGRRuntimeManagerClass_block_invoke(uint64_t a1)
{
  LookingGlassRuntimeSupportLibrary();
  Class result = objc_getClass("LGRRuntimeManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLGRRuntimeManagerClass_block_invoke_cold_1();
  }
  getLGRRuntimeManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AXTinkerKitLibraryCore()
{
  if (!AXTinkerKitLibraryCore_frameworkLibrary) {
    AXTinkerKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AXTinkerKitLibraryCore_frameworkLibrary;
}

uint64_t __AXTinkerKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXTinkerKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getTinkerRuntimeClass_block_invoke(uint64_t a1)
{
  id v3 = 0;
  if (!AXTinkerKitLibraryCore()) {
    __getTinkerRuntimeClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("TinkerRuntime");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getTinkerRuntimeClass_block_invoke_cold_2();
  }
  getTinkerRuntimeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void _UIUnblockNotificationsForNotification(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = UINotificationsToBlockUnblockForNotification(a1);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend((id)_BlockedNotifications, "removeObject:", *(void *)(*((void *)&v6 + 1) + 8 * v5++), (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t _UIAccessibilityUnblockPostingOfNotification(uint64_t a1)
{
  [(id)_BlockNotificationsLock lock];
  _UIUnblockNotificationsForNotification(a1);
  uint64_t v2 = (void *)_BlockNotificationsLock;

  return [v2 unlock];
}

void _UIAccessibilityBlockPostingOfAllNotifications()
{
  [(id)_BlockNotificationsLock lock];
  if (!_BlockedNotificationQueue)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v1 = (void *)_BlockedNotificationQueue;
    _BlockedNotificationQueue = (uint64_t)v0;
  }
  [(id)_BlockNotificationsLock unlock];
  _AXLastBlockTime = CFAbsoluteTimeGetCurrent();
  _AXBlockAllNotifications = 1;
  uint64_t v2 = AXRuntimeLogNotifications();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_19F2DB000, v2, OS_LOG_TYPE_INFO, "Blocking all notifications", v3, 2u);
  }
}

double _UIAccessibilityNotificationLastBlockTime()
{
  return *(double *)&_AXLastBlockTime;
}

uint64_t _UIAccessibilityAllNotificationsBlocked()
{
  return _AXBlockAllNotifications;
}

id _UIAccessibilityNotificationsBlocked()
{
  [(id)_BlockNotificationsLock lock];
  if ([(id)_BlockedNotificationQueue count]) {
    id v0 = (void *)[(id)_BlockedNotificationQueue copy];
  }
  else {
    id v0 = 0;
  }
  [(id)_BlockNotificationsLock unlock];

  return v0;
}

void _UIAccessibilityUnblockPostingOfAllNotifications()
{
  [(id)_BlockNotificationsLock lock];
  id v0 = (void *)_BlockedNotifications;
  _BlockedNotifications = 0;

  [(id)_BlockedNotificationQueue removeAllObjects];
  [(id)_BlockNotificationsLock unlock];
  _AXBlockAllNotifications = 0;
  id v1 = AXRuntimeLogNotifications();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_19F2DB000, v1, OS_LOG_TYPE_INFO, "Unblocking all notifications", v2, 2u);
  }
}

void _UIAccessibilityPostPlaybackControlsVisibilityChangedNotification(uint64_t a1, void *a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 length])
  {
    uint64_t v4 = [NSNumber numberWithBool:a1];
    v6[0] = v4;
    v6[1] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
    UIAccessibilityPostNotification(0x437u, v5);
  }
}

__CFString *_debugNameForUIAXNotification()
{
  return &stru_1EF1680E8;
}

id _axuiElementForNotificationData(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    uint64_t v5 = v3;
    if (v4 == AXUIElementGetTypeID()) {
      goto LABEL_36;
    }
    id v6 = v3;
    do
    {
      if ([v6 isAccessibilityElement]) {
        break;
      }
      NSClassFromString(&cfstr_Uitableviewcel.isa);
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if ([v6 _accessibilityHasOrderedChildren]
        && [v6 accessibilityElementCount] >= 1)
      {
        uint64_t v7 = [v6 accessibilityElementAtIndex:0];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 isViewLoaded])
        {
          uint64_t v8 = [v6 view];

          id v6 = (id)v8;
        }
        uint64_t v7 = [v6 _accessibilityFindDescendant:&__block_literal_global_279];
      }
      long long v9 = (void *)v7;

      id v6 = v9;
    }
    while (v9);
  }
  else
  {
    id v6 = 0;
  }
  NSClassFromString(&cfstr_Uimenuitem.isa);
  if (objc_opt_isKindOfClass())
  {
    id v10 = v3;
    id v11 = v6;
    uint64_t v12 = [NSClassFromString(&cfstr_Uicalloutbar.isa) safeValueForKey:@"activeCalloutBar"];
    uint64_t v13 = [v12 safeValueForKey:@"m_currentSystemButtons"];
    BOOL v14 = [v12 safeValueForKey:@"m_extraButtons"];
    if (v14)
    {
      uint64_t v15 = [v13 arrayByAddingObjectsFromArray:v14];

      uint64_t v13 = (void *)v15;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    id v6 = v11;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v28 = v14;
      long long v29 = v12;
      id v30 = v11;
      id v31 = v3;
      uint64_t v19 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v22 = objc_msgSend(v21, "accessibilityLabel", v28, v29);
          uint64_t v23 = [v10 safeValueForKey:@"title"];
          int v24 = [v22 isEqualToString:v23];

          if (v24)
          {
            id v6 = v21;
            id v11 = v30;

            goto LABEL_29;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      id v11 = v30;
      id v6 = v30;
LABEL_29:
      id v3 = v31;
      BOOL v14 = v28;
      uint64_t v12 = v29;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = [v3 safeValueForKey:@"_view"];

    id v6 = (id)v25;
  }
  if (!v6) {
    id v6 = v3;
  }
  uint64_t v5 = (void *)_AXCreateAXUIElementWithElement();

LABEL_36:
  id v26 = v5;

  return v26;
}

uint64_t ___axuiElementForNotificationData_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAccessibilityElement])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = [v2 _accessibilityViewIsVisible];
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id _preprocessNotificationDataForMoveToElementNotification(void *a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (MEMORY[0x19F3C9A80]()) {
    uint64_t v2 = *MEMORY[0x1E4F48DC0];
  }
  else {
    uint64_t v2 = getpid();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = (void *)[v1 mutableCopy];
    CFTypeID v4 = [v3 objectForKeyedSubscript:UIAccessibilityMoveToElementNotificationKeyElement];
    if (v4)
    {
      CFTypeID v5 = CFGetTypeID(v1);
      CFTypeID TypeID = AXUIElementGetTypeID();
      if (v5 != TypeID)
      {
        uint64_t v7 = _axuiElementForNotificationData(TypeID, v4);
        [v3 setObject:v7 forKeyedSubscript:UIAccessibilityMoveToElementNotificationKeyElement];
      }
    }
    uint64_t v8 = [NSNumber numberWithInt:v2];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F48C98]];
  }
  else if (v1)
  {
    CFTypeID v9 = CFGetTypeID(v1);
    CFTypeID v10 = AXUIElementGetTypeID();
    if (v9 == v10)
    {
      v15[0] = *MEMORY[0x1E4F48C98];
      id v11 = [NSNumber numberWithInt:v2];
      v15[1] = UIAccessibilityMoveToElementNotificationKeyElement;
      v16[0] = v11;
      v16[1] = v1;
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    }
    else
    {
      uint64_t v12 = _axuiElementForNotificationData(v10, v1);
      v17[0] = *MEMORY[0x1E4F48C98];
      id v11 = [NSNumber numberWithInt:v2];
      v17[1] = UIAccessibilityMoveToElementNotificationKeyElement;
      v18[0] = v11;
      uint64_t v13 = v12;
      if (!v12)
      {
        uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
      }
      v18[1] = v13;
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

      if (!v12) {
    }
      }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void *AXUnitTestNotificationWillBeSentSetter(void *result)
{
  _AXUnitTestNotificationWillBeSentCallback = result;
  return result;
}

void AXAddNotificationCallback(void *a1, void *a2)
{
  id aBlock = a1;
  id v3 = a2;
  if (!NotificationCallbacks)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    CFTypeID v5 = (void *)NotificationCallbacks;
    NotificationCallbacks = v4;
  }
  id v6 = _Block_copy(aBlock);
  [(id)NotificationCallbacks setObject:v6 forKeyedSubscript:v3];
}

uint64_t AXRemoveNotificationCallback(uint64_t a1)
{
  uint64_t result = NotificationCallbacks;
  if (NotificationCallbacks) {
    return [(id)NotificationCallbacks setObject:0 forKeyedSubscript:a1];
  }
  return result;
}

void _UIAccessibilitySetAssociatedElementContextForNextNotification(void *a1)
{
  id v2 = a1;
  if (!AXProcessIsMobileMail()
    || ![(id)*MEMORY[0x1E4F43630] isSuspended]
    || (NSClassFromString(&cfstr_Mfwindow.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_storeStrong((id *)&_UIAXAssociatedElementContextForNextNotification, a1);
  }
}

id _UIAccessibilityAssociatedElementContextForNextNotification()
{
  return (id)_UIAXAssociatedElementContextForNextNotification;
}

void sub_19F32625C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __GameControllerLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  GameControllerLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id UIAXCurrentLanguage()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 pathForResource:@"GlobalPreferences" ofType:@"plist"];

  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v1];
  id v3 = [v2 objectForKey:@"AppleLanguages"];
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndex:0];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t _UIAXSetLastKeyboardUsed(void *a1)
{
  _LastKeyboardUsed = [a1 copy];

  return MEMORY[0x1F41817F8]();
}

id _UIAXLastKeyboardUsed()
{
  return (id)_LastKeyboardUsed;
}

__CFString *_UIAccessibilityVoiceOverVersion()
{
  return @"VoiceOver";
}

uint64_t UIAXFormatFloat()
{
  return MEMORY[0x1F4105F40]();
}

uint64_t UIAXFormatFloatWithPercentage()
{
  return MEMORY[0x1F4105F48]();
}

id accessibilityUIKitSymbolNamesLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = AXSSAccessibilityDescriptionForSymbolName();
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = v1;
  }
  id v4 = v3;

  return v4;
}

id accessibilityUIKitLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = (void *)accessibilityUIKitLocalizedString_axBundle;
  if (accessibilityUIKitLocalizedString_axBundle) {
    goto LABEL_6;
  }
  if (_CFMZEnabled()) {
    [MEMORY[0x1E4F28B50] accessibilityMacCalystBundleWithLastPathComponent:@"UIKit.axbundle"];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4F28B50] accessibilityBundleWithLastPathComponent:@"UIKit.axbundle"];
  }
  id v4 = (void *)accessibilityUIKitLocalizedString_axBundle;
  accessibilityUIKitLocalizedString_axBundle = v3;

  id v2 = (void *)accessibilityUIKitLocalizedString_axBundle;
  if (accessibilityUIKitLocalizedString_axBundle)
  {
LABEL_6:
    CFTypeID v5 = [v2 localizedStringForKey:v1 value:&stru_1EF1680E8 table:@"Accessibility"];
  }
  else
  {
    CFTypeID v5 = 0;
  }

  return v5;
}

void UIAccessibilitySpeak(id argument)
{
}

void UIAccessibilitySpeakOrQueueIfNeeded(uint64_t a1)
{
  if (a1)
  {
    id argument = [MEMORY[0x1E4F488F0] axAttributedStringWithString:a1];
    [argument setAttribute:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F48AB0]];
    UIAccessibilityPostNotification(*MEMORY[0x1E4F43400], argument);
  }
}

void UIAccessibilitySpeakIfNotSpeaking(uint64_t a1)
{
  if (a1)
  {
    id argument = [MEMORY[0x1E4F488F0] axAttributedStringWithString:a1];
    [argument setAttribute:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F48B40]];
    UIAccessibilityPostNotification(*MEMORY[0x1E4F43400], argument);
  }
}

void UIAccessibilitySpeakAndDoNotBeInterrupted(void *a1)
{
  if (a1)
  {
    id v1 = (objc_class *)MEMORY[0x1E4F488F0];
    id v2 = a1;
    id argument = (id)[[v1 alloc] initWithStringOrAttributedString:v2];

    [argument setAttribute:&unk_1EF171980 forKey:*MEMORY[0x1E4F48958]];
    UIAccessibilityPostNotification(*MEMORY[0x1E4F43400], argument);
  }
}

BOOL UIAccessibilityColorEqualToColor(void *a1, void *a2)
{
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  id v3 = a2;
  [a1 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  [v3 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];

  return vabdd_f64(v12, v8) < 2.22044605e-16
      && vabdd_f64(v11, v7) < 2.22044605e-16
      && vabdd_f64(v10, v6) < 2.22044605e-16
      && vabdd_f64(v9, v5) < 2.22044605e-16;
}

id UIAccessibilitySafeTextForCoreTextObject(void *a1)
{
  if (a1)
  {
    uint64_t v3 = 0;
    id v4 = &v3;
    uint64_t v5 = 0x2020000000;
    uint64_t v6 = 0;
    AXPerformSafeBlock();
    uint64_t v1 = v4[3];
    _Block_object_dispose(&v3, 8);
    if (v1 == CTFrameGetTypeID()) {
      a1 = (void *)CTFrameCopyVisibleString();
    }
    else {
      a1 = 0;
    }
  }

  return a1;
}

void sub_19F3278BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFTypeID __UIAccessibilitySafeTextForCoreTextObject_block_invoke(uint64_t a1)
{
  CFTypeID result = CFGetTypeID(*(CFTypeRef *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void UIAccessibilityRelateElements(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  if (v8 && v3)
  {
    id v4 = [v8 _accessibilityUserDefinedLinkedUIElements];
    uint64_t v5 = AXGuaranteedMutableArray();

    uint64_t v6 = [v3 _accessibilityUserDefinedLinkedUIElements];
    double v7 = AXGuaranteedMutableArray();

    if (([v5 containsObject:v3] & 1) == 0)
    {
      [v5 addObject:v3];
      [v8 _setAccessibilityLinkedUIElements:v5];
    }
    if (([v7 containsObject:v8] & 1) == 0)
    {
      [v7 addObject:v8];
      [v3 _setAccessibilityLinkedUIElements:v7];
    }
  }
}

void UIAccessibilityUnrelateElements(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  if (v8 && v3)
  {
    id v4 = [v8 _accessibilityUserDefinedLinkedUIElements];
    uint64_t v5 = AXGuaranteedMutableArray();

    uint64_t v6 = [v3 _accessibilityUserDefinedLinkedUIElements];
    double v7 = AXGuaranteedMutableArray();

    if ([v5 containsObject:v3])
    {
      [v5 removeObject:v3];
      [v8 _setAccessibilityLinkedUIElements:v5];
    }
    if ([v7 containsObject:v8])
    {
      [v7 removeObject:v8];
      [v3 _setAccessibilityLinkedUIElements:v7];
    }
  }
}

void UIAccessibilityUnrelateAllElements(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = [v1 _accessibilityUserDefinedLinkedUIElements];
    id v4 = AXGuaranteedMutableArray();

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
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
          double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          double v11 = objc_msgSend(v10, "_accessibilityUserDefinedLinkedUIElements", (void)v13);
          double v12 = AXGuaranteedMutableArray();

          if ([v12 containsObject:v2])
          {
            [v12 removeObject:v2];
            [v10 _setAccessibilityLinkedUIElements:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v2 _setAccessibilityLinkedUIElements:MEMORY[0x1E4F1CBF0]];
  }
}

BOOL _AXStrictIsKindOfClass(void *a1, objc_class *a2)
{
  Class = object_getClass(a1);
  for (BOOL i = Class != 0; Class != a2 && Class; BOOL i = Class != 0)
    Class = class_getSuperclass(Class);
  return i;
}

void sub_19F328E10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void UIAccessibilityStartCapturingStringDrawingText()
{
  AXCaptureStringDrawingText = 1;
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v1 = (void *)AXCapturedString;
  AXCapturedString = (uint64_t)v0;

  if (UIAccessibilityStartCapturingStringDrawingText_onceToken != -1)
  {
    dispatch_once(&UIAccessibilityStartCapturingStringDrawingText_onceToken, &__block_literal_global_10);
  }
}

void __UIAccessibilityStartCapturingStringDrawingText_block_invoke()
{
  id v0 = [MEMORY[0x1E4F483A8] sharedInstance];
  [v0 performValidations:&__block_literal_global_324 withPreValidationHandler:&__block_literal_global_335 postValidationHandler:&__block_literal_global_341 safeCategoryInstallationHandler:&__block_literal_global_344];
}

uint64_t __UIAccessibilityStartCapturingStringDrawingText_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"NSString", @"drawAtPoint: withAttributes:", "v", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"NSAttributedString", @"drawAtPoint:", "v", "{CGPoint=dd}", 0);

  return 1;
}

uint64_t __UIAccessibilityStartCapturingStringDrawingText_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"NSString AX Extras"];
  [v2 setOverrideProcessName:@"NSString AX Extras"];

  return 1;
}

void __UIAccessibilityStartCapturingStringDrawingText_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"NSString__UIKitStringObserver__Foundation" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NSAttributedString__UIKitStringObserver__Foundation" canInteractWithTargetClass:1];
}

id UIAccessibilityStopCapturingStringDrawingText()
{
  AXCaptureStringDrawingText = 0;
  id v0 = (void *)[(id)AXCapturedString copy];
  uint64_t v1 = (void *)AXCapturedString;
  AXCapturedString = 0;

  return v0;
}

uint64_t UIAXKeyboardIsOnScreen()
{
  id v0 = [(id)AXServerCache objectForKeyedSubscript:@"UIAXKeyboardIsOnScreen"];

  if (v0)
  {
    uint64_t v1 = [(id)AXServerCache objectForKeyedSubscript:@"UIAXKeyboardIsOnScreen"];
    uint64_t v2 = [v1 BOOLValue];
  }
  else
  {
    uint64_t v2 = AXUIKeyboardIsOnScreen();
    uint64_t v1 = [NSNumber numberWithBool:v2];
    [(id)AXServerCache setObject:v1 forKeyedSubscript:@"UIAXKeyboardIsOnScreen"];
  }

  return v2;
}

uint64_t _UIAXObjectIsBehindKeyboard(void *a1)
{
  return _UIAXObjectIsBehindKeyboardWithIntersectionType(a1, 0);
}

uint64_t _UIAXObjectIsBehindKeyboardWithIntersectionType(void *a1, int a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (AXUIKeyboardIsOnScreen())
  {
    id v4 = AXUIKeyboardWindow();
    id v5 = [v3 _accessibilityWindow];
    uint64_t v6 = [v5 screen];

    if ([v3 _accessibilityIsDescendantOfElement:v4]) {
      goto LABEL_5;
    }
    uint64_t v7 = [MEMORY[0x1E4F42B08] activeKeyboardForScreen:v6];
    char v8 = [v3 _accessibilityIsDescendantOfElement:v7];

    if (v8) {
      goto LABEL_5;
    }
    double v9 = [v3 _accessibilityParentView];
    double v10 = [v9 window];
    [v10 windowLevel];
    double v12 = v11;
    [v4 windowLevel];
    double v14 = v13;

    if (v12 > v14)
    {
LABEL_5:
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F43058] _applicationKeyWindow];
      uint64_t v18 = [v17 firstResponder];
      uint64_t v19 = [v18 inputAccessoryView];

      id v20 = [MEMORY[0x1E4F42C68] sharedInstance];
      double v21 = [v20 safeValueForKey:@"containerRootController"];
      id v22 = [v21 safeValueForKey:@"_inputAccessoryView"];

      if (v19) {
        BOOL v23 = v19 == v22;
      }
      else {
        BOOL v23 = 0;
      }
      int v24 = !v23;
      if (v23 && ([v3 _accessibilityIsDescendantOfElement:v19] & 1) != 0)
      {
        uint64_t v15 = 0;
      }
      else
      {
        AXUIKeyboardScreenFrame();
        uint64_t v26 = v25;
        uint64_t v28 = v27;
        uint64_t v30 = v29;
        uint64_t v32 = v31;
        [v3 accessibilityFrame];
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        uint64_t v41 = v26;
        uint64_t v42 = v28;
        uint64_t v43 = v30;
        uint64_t v44 = v32;
        CGFloat v45 = v34;
        CGFloat v46 = v36;
        CGFloat v47 = v38;
        CGFloat v48 = v40;
        if (a2)
        {
          AXMIntersectionOverUnion();
          uint64_t v15 = v49 > 0.75;
        }
        else
        {
          uint64_t v15 = CGRectIntersectsRect(*(CGRect *)&v41, *(CGRect *)&v45);
        }
        if (((v24 | v15 ^ 1) & 1) == 0
          && [v19 _accessibilityIsKeyboardPassthroughInputAccessoryView])
        {
          [v19 accessibilityFrame];
          v57.origin.x = v34;
          v57.origin.y = v36;
          v57.size.width = v38;
          v57.size.height = v40;
          uint64_t v15 = v15 & !CGRectIntersectsRect(v56, v57);
        }
        CGFloat v50 = AXLogUIA();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          double v51 = UIAXMassageElementDescription(v3);
          v52[0] = 67109378;
          v52[1] = v15;
          __int16 v53 = 2112;
          CGFloat v54 = v51;
          _os_log_impl(&dword_19F2DB000, v50, OS_LOG_TYPE_INFO, "Object is behind keyboard? %d - %@", (uint8_t *)v52, 0x12u);
        }
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t _UIAXObjectIsCompletelyBehindKeyboard(void *a1)
{
  return _UIAXObjectIsBehindKeyboardWithIntersectionType(a1, 1);
}

const void *UIAccessibilityCreateEventForSceneReferencePoint(void *a1, double a2, double a3)
{
  if (!UIAccessibilityCreateEventForSceneReferencePoint_TouchEventClass) {
    UIAccessibilityCreateEventForSceneReferencePoint_TouchEventClass = (uint64_t)NSClassFromString(&cfstr_Uitouchesevent_0.isa);
  }
  CFTypeID result = (const void *)GSEventCreateWithEventRecord();
  if (result)
  {
    uint64_t v7 = result;
    if (a1)
    {
      *a1 = result;
    }
    else
    {
      CFRelease(result);
      uint64_t v7 = 0;
    }
    return (const void *)objc_msgSend(objc_allocWithZone((Class)UIAccessibilityCreateEventForSceneReferencePoint_TouchEventClass), "_initWithEvent:touches:", v7, 0, 1, *(void *)&a2, *(void *)&a3, *(void *)&a2, *(void *)&a3, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

double UIAXMidPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

id _UIAccessibilityLocalizedKeyboardName(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [v4 displayName];
  uint64_t v6 = [v4 primaryLanguage];

  if (![v5 length])
  {
    uint64_t v7 = [MEMORY[0x1E4F49440] nonlocalizedNameForLanguage:v6];

    id v5 = (void *)v7;
  }
  if ([v5 length])
  {
    char v8 = objc_msgSend(NSString, "stringWithFormat:", v3, v5);
    double v9 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v8];
    uint64_t v10 = [v9 rangeOfString:v5];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      if (([v6 isEqualToString:@"emoji"] & 1) == 0) {
        objc_msgSend(v9, "setAttribute:forKey:withRange:", v6, *MEMORY[0x1E4F48A70], v12, v13);
      }
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

id UIAccessibilityLocalizedKeyboardName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = UIKitAccessibilityLocalizedString(@"keyboard.type");
  id v3 = _UIAccessibilityLocalizedKeyboardName(v1, v2);

  return v3;
}

id UIKitAccessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  if ([0 length])
  {
    uint64_t v2 = UIKitAccessibilityLocalizedStringInTable(v1, 0);
    id v3 = v2;
    if (!v2 || [v2 isEqual:v1])
    {
      uint64_t v4 = UIKitAccessibilityLocalizedStringInTable(v1, @"Accessibility");

      id v3 = (void *)v4;
    }
  }
  else
  {
    id v3 = UIKitAccessibilityLocalizedStringInTable(v1, @"Accessibility");
  }

  return v3;
}

id UIAccessibilityLocalizedCurrentKeyboardName()
{
  id v0 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  id v1 = [v0 currentInputMode];

  uint64_t v2 = UIKitAccessibilityLocalizedString(@"keyboard.type");
  id v3 = _UIAccessibilityLocalizedKeyboardName(v1, v2);

  return v3;
}

id UIAccessibilityAvailableLanguages()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v0 = (void *)UIAccessibilityAvailableLanguages__AvailableLanguages;
  if (!UIAccessibilityAvailableLanguages__AvailableLanguages)
  {
    uint64_t v1 = [objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
    uint64_t v2 = (void *)UIAccessibilityAvailableLanguages__AvailableLanguages;
    UIAccessibilityAvailableLanguages__AvailableLanguages = v1;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = (id)_AXSVoiceOverTouchCopyLanguageRotorItems();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          char v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7), "objectForKey:", @"RotorItem", (void)v12);
          if ([v8 length])
          {
            double v9 = (void *)UIAccessibilityAvailableLanguages__AvailableLanguages;
            uint64_t v10 = [v8 lowercaseString];
            [v9 addObject:v10];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    id v0 = (void *)UIAccessibilityAvailableLanguages__AvailableLanguages;
  }

  return v0;
}

id UIAccessibilityLanguageForCurrentInputMode()
{
  id v0 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  uint64_t v1 = [v0 currentInputMode];
  uint64_t v2 = [v1 primaryLanguage];
  id v3 = AXCRemapLanguageCodeToFallbackIfNeccessary();

  return v3;
}

id UIAccessibilityLocalizedNextKeyboardName()
{
  id v0 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  uint64_t v1 = [v0 activeInputModes];
  uint64_t v2 = [v0 nextInputModeFromList:v1 withFilter:0 withTraits:0];

  id v3 = UIKitAccessibilityLocalizedString(@"next.international.keyboard.key");
  uint64_t v4 = _UIAccessibilityLocalizedKeyboardName(v2, v3);

  if (!v4)
  {
    uint64_t v4 = UIKitAccessibilityLocalizedString(@"next.international.keyboard.key.fallback");
  }

  return v4;
}

uint64_t _UIAXDismissKeyboardIfNecessary(void *a1)
{
  id v1 = a1;
  if ([(id)*MEMORY[0x1E4F43630] _accessibilitySoftwareKeyboardActive])
  {
    uint64_t v2 = 0;
    if (_UIAXObjectIsBehindKeyboardWithIntersectionType(v1, 0))
    {
      _UIAccessibilityIgnoreNextNotification(*MEMORY[0x1E4F43490]);
      if (([v1 _accessibilityUsesSpecialKeyboardDismiss] & 1) == 0)
      {
        id v3 = [v1 _accessibilityWindow];
        uint64_t v4 = [v3 firstResponder];
        [v4 resignFirstResponder];
      }
      uint64_t v2 = 1;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id UIAXApplyPhoneContextTokenToString(void *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 componentsSeparatedByString:@","];
  uint64_t v2 = [MEMORY[0x1E4F28E58] decimalDigitCharacterSet];
  [v2 addCharactersInString:@"-"];
  uint64_t v25 = v2;
  id v3 = [v2 invertedSet];
  uint64_t v4 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __UIAXApplyPhoneContextTokenToString_block_invoke;
  v35[3] = &unk_1E59B98D0;
  id v24 = v3;
  id v36 = v24;
  id v5 = v4;
  id v37 = v5;
  [v1 enumerateObjectsUsingBlock:v35];
  uint64_t v6 = [MEMORY[0x1E4F28E78] string];
  uint64_t v7 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
  uint64_t v8 = [v5 count];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __UIAXApplyPhoneContextTokenToString_block_invoke_2;
  v30[3] = &unk_1E59B98F8;
  id v9 = v6;
  id v31 = v9;
  id v23 = v1;
  id v32 = v23;
  id v10 = v7;
  id v33 = v10;
  uint64_t v34 = v8;
  [v5 enumerateObjectsUsingBlock:v30];
  uint64_t v11 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v9];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    uint64_t v16 = *MEMORY[0x1E4F1CFD0];
    uint64_t v17 = (uint64_t *)MEMORY[0x1E4F48A90];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *v17;
        uint64_t v20 = [*(id *)(*((void *)&v26 + 1) + 8 * i) rangeValue];
        objc_msgSend(v11, "setAttribute:forKey:withRange:", v16, v19, v20, v21);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v14);
  }

  return v11;
}

void __UIAXApplyPhoneContextTokenToString_block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a2;
  id v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v9 = [v4 stringByTrimmingCharactersInSet:v5];

  BOOL v6 = [v9 rangeOfCharacterFromSet:*(void *)(a1 + 32)] == 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [NSNumber numberWithBool:v6];
  [v7 addObject:v8];
}

void __UIAXApplyPhoneContextTokenToString_block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 length];
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) objectAtIndex:a3];
  [v8 appendString:v9];

  LODWORD(v8) = [v6 BOOLValue];
  if (v8)
  {
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v7, objc_msgSend(*(id *)(a1 + 32), "length") - v7);
    [v10 addObject:v11];
  }
  if (*(void *)(a1 + 56) - 1 > a3)
  {
    id v12 = *(void **)(a1 + 32);
    [v12 appendString:@", "];
  }
}

id UIAXStringForAllChildren(void *a1)
{
  return _UIAXStringForAllChildren(a1, 0);
}

id _UIAXStringForAllChildren(void *a1, char a2)
{
  id v3 = a1;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___UIAXStringForAllChildren_block_invoke;
  v10[3] = &unk_1E59B9A10;
  char v13 = a2;
  id v11 = v3;
  id v12 = v4;
  id v5 = v4;
  id v6 = v3;
  id v7 = (id)[v6 _accessibilityFindDescendant:v10];
  uint64_t v8 = AXLabelAndValueForElements();

  return v8;
}

id UIAXStringForAllChildrenIncludingNonAXElements(void *a1)
{
  return _UIAXStringForAllChildren(a1, 1);
}

id UIAccessibilityConvertAttachmentsInAttributedStringToAX(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length])
  {
    uint64_t v12 = 0;
    char v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__4;
    uint64_t v16 = __Block_byref_object_dispose__4;
    id v17 = 0;
    uint64_t v5 = [v3 length];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __UIAccessibilityConvertAttachmentsInAttributedStringToAX_block_invoke;
    v8[3] = &unk_1E59B9920;
    id v11 = &v12;
    id v9 = v3;
    id v10 = v4;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v8);
    id v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F488F0]) initWithString:&stru_1EF1680E8];
  }

  return v6;
}

void sub_19F32D130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __UIAccessibilityConvertAttachmentsInAttributedStringToAX_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F488F0];
    id v9 = [*(id *)(a1 + 32) string];
    uint64_t v10 = [v8 axAttributedStringWithString:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = *MEMORY[0x1E4F243C0];
  uint64_t v14 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F243C0]];

  uint64_t v15 = (void *)MEMORY[0x1E4F42508];
  uint64_t v16 = (uint64_t *)MEMORY[0x1E4F42510];
  if (v14)
  {
    id v17 = [v7 objectForKeyedSubscript:v13];
    uint64_t v18 = __UIAccessibilitySafeClass();

    if (v18)
    {
      uint64_t v19 = [v18 contentDescription];
      if ([v19 length])
      {
        uint64_t v20 = [[UITextAttachmentAccessibilityElement alloc] initWithAccessibilityContainer:*(void *)(a1 + 40)];
        [(UITextAttachmentAccessibilityElement *)v20 setGlyph:v18];
        [(UITextAttachmentAccessibilityElement *)v20 setAccessibilityLabel:v19];
        uint64_t v21 = *(void **)(a1 + 40);
        objc_msgSend(NSString, "stringWithFormat:", @"AdaptiveGlyph-%p", v20);
        id v23 = v22 = v15;
        [v21 _accessibilitySetRetainedValue:v20 forKey:v23];

        uint64_t v15 = v22;
        uint64_t v16 = (uint64_t *)MEMORY[0x1E4F42510];
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v20, *MEMORY[0x1E4F48968], a3, a4);
      }
    }
LABEL_9:

    goto LABEL_18;
  }
  uint64_t v24 = *MEMORY[0x1E4F424C0];
  uint64_t v25 = [v7 objectForKey:*MEMORY[0x1E4F424C0]];

  if (v25)
  {
    long long v26 = [v7 objectForKey:v24];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = v26;
      long long v28 = [(UITextAttachmentAccessibilityElement *)v27 accessibilityLabel];
      uint64_t v29 = [v28 length];

      if (v29)
      {
        [(UITextAttachmentAccessibilityElement *)v27 setAccessibilityTraits:*MEMORY[0x1E4F43550]];
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v27, *MEMORY[0x1E4F48968], a3, a4);
        long long v26 = v27;
      }
      else
      {
        uint64_t v43 = [(UITextAttachmentAccessibilityElement *)v27 image];

        if (v43)
        {
          _UIAccessibilityProcessImageAttachment(v27);
          long long v26 = (UITextAttachmentAccessibilityElement *)objc_claimAutoreleasedReturnValue();

          uint64_t v44 = [(UITextAttachmentAccessibilityElement *)v26 accessibilityLabel];
          uint64_t v45 = [v44 length];

          if (v45) {
            objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v26, *MEMORY[0x1E4F48968], a3, a4);
          }
        }
        else
        {
          CGFloat v52 = [(UITextAttachmentAccessibilityElement *)v27 fileType];

          long long v26 = v27;
          if (v52)
          {
            __int16 v53 = NSString;
            CGFloat v54 = [(UITextAttachmentAccessibilityElement *)v27 fileWrapper];
            uint64_t v55 = [v54 preferredFilename];
            CGRect v56 = [v53 stringWithFormat:@"TextAttachment-%@", v55];

            CGRect v57 = [*(id *)(a1 + 40) _accessibilityValueForKey:v56];
            v58 = v57;
            if (v57)
            {
              long long v26 = v57;
            }
            else
            {
              long long v26 = [[UITextAttachmentAccessibilityElement alloc] initWithAccessibilityContainer:*(void *)(a1 + 40)];
              [(UITextAttachmentAccessibilityElement *)v26 setAttachment:v27];
              id v60 = _UIAccessibilityProcessImageAttachment(v27);
              v61 = [(UITextAttachmentAccessibilityElement *)v27 accessibilityLabel];
              [(UITextAttachmentAccessibilityElement *)v26 setAccessibilityLabel:v61];

              [(UITextAttachmentAccessibilityElement *)v26 setAccessibilityTraits:[(UITextAttachmentAccessibilityElement *)v27 accessibilityTraits]];
              int v62 = [(UITextAttachmentAccessibilityElement *)v27 accessibilityValue];
              [(UITextAttachmentAccessibilityElement *)v26 setAccessibilityValue:v62];

              [*(id *)(a1 + 40) _accessibilitySetRetainedValue:v26 forKey:v56];
            }

            objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v26, *MEMORY[0x1E4F48968], a3, a4);
            uint64_t v15 = (void *)MEMORY[0x1E4F42508];
          }
        }
      }
    }
LABEL_15:

    goto LABEL_18;
  }
  uint64_t v30 = [v7 objectForKey:*MEMORY[0x1E4F42530]];

  if (!v30)
  {
    uint64_t v41 = [v7 objectForKey:@"UIAccessibilityTextAttributeContext"];

    if (v41)
    {
      uint64_t v42 = [v7 objectForKey:*MEMORY[0x1E4F434A0]];
      uint64_t v18 = AXSSTextualContextFromUITextualContext(v42);

      if (v18) {
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v18, *MEMORY[0x1E4F488E8], a3, a4);
      }
      goto LABEL_9;
    }
    uint64_t v46 = [v7 objectForKeyedSubscript:@"animatedPlaceholderIdentifier"];
    if (!v46) {
      goto LABEL_35;
    }
    CGFloat v47 = (void *)v46;
    CGFloat v48 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    double v49 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"􀮷"];
    CGFloat v50 = [v48 stringByTrimmingCharactersInSet:v49];
    uint64_t v51 = [v50 length];

    if (v51)
    {
LABEL_35:
      uint64_t v18 = (void *)[v7 mutableCopy];
      if (!AXDoesRequestingClientDeserveAutomation())
      {
        [v18 removeObjectForKey:*MEMORY[0x1E4F42540]];
        [v18 removeObjectForKey:*v15];
        [v18 removeObjectForKey:*MEMORY[0x1E4F42560]];
        [v18 removeObjectForKey:*v16];
      }
      [v18 removeObjectForKey:*MEMORY[0x1E4F42580]];
      [v18 removeObjectForKey:*MEMORY[0x1E4F42588]];
      [v18 removeObjectForKey:@"_UITextInputDictationResultMetadata"];
      [v18 removeObjectForKey:*MEMORY[0x1E4F42538]];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttributes:withRange:", v18, a3, a4);
      goto LABEL_9;
    }
    v59 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    UIKitAccessibilityLocalizedString(@"textview.animated.placeholder");
    long long v26 = (UITextAttachmentAccessibilityElement *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setAttribute:forKey:withRange:", v26, *MEMORY[0x1E4F48B30], a3, a4);
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F48A20], a3, a4);
LABEL_18:
  uint64_t v31 = *v16;
  id v32 = [v7 objectForKey:*v16];
  uint64_t v33 = _UIAXColorForObject(v32);

  if (v33) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v33, v31, a3, a4);
  }
  uint64_t v34 = *MEMORY[0x1E4F424C8];
  double v35 = [v7 objectForKey:*MEMORY[0x1E4F424C8]];
  uint64_t v36 = _UIAXColorForObject(v35);

  if (v36) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v36, v34, a3, a4);
  }
  uint64_t v37 = *v15;
  CGFloat v38 = [v7 objectForKey:*v15];

  if (v38)
  {
    objc_opt_class();
    uint64_t v39 = [v7 objectForKeyedSubscript:v37];
    CGFloat v40 = __UIAccessibilityCastAsClass();

    if (v40) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v40, v37, a3, a4);
    }
  }
}

id _UIAccessibilityProcessImageAttachment(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 image];
  [v2 size];
  BOOL v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8) == v4 && *MEMORY[0x1E4F1DB30] == v3;
  if (v2) {
    int v6 = v5;
  }
  else {
    int v6 = 1;
  }
  if (v6) {
    id v7 = v1;
  }
  else {
    id v7 = v2;
  }
  id v8 = v7;
  if (([v8 isAccessibilityElement] & 1) == 0 && !v5)
  {
    if (v2)
    {
      uint64_t v9 = [v2 accessibilityTraits];
      if ((*MEMORY[0x1E4F43550] & v9) == 0) {
        [v8 setAccessibilityTraits:*MEMORY[0x1E4F43508]];
      }
    }
    uint64_t v10 = [v2 accessibilityLabel];
    if (!v10)
    {
      uint64_t v11 = [v1 fileWrapper];
      uint64_t v12 = [v11 preferredFilename];

      uint64_t v13 = [v1 fileWrapper];
      uint64_t v14 = [v13 filename];
      uint64_t v15 = [v14 pathExtension];
      uint64_t v16 = UIAXFileTypeDescriptionForFileExtension();

      uint64_t v18 = v16;
      uint64_t v19 = @"__AXStringForVariablesSentinel";
      uint64_t v10 = __UIAXStringForVariables();
    }
    objc_msgSend(v8, "setAccessibilityLabel:", v10, v18, v19);
    [v8 setIsAccessibilityElement:1];
  }

  return v8;
}

id AXSSTextualContextFromUITextualContext(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F434D8]])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v2 = (id *)getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_ptr;
    uint64_t v14 = getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_ptr)
    {
      double v3 = (void *)AccessibilitySharedSupportLibrary();
      v12[3] = (uint64_t)dlsym(v3, "AXSSVoiceOverTextualContextWordProcessing");
      getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_uint64_t ptr = v12[3];
      uint64_t v2 = (id *)v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v2) {
      AXSSTextualContextFromUITextualContext_cold_1();
    }
LABEL_25:
    id v8 = *v2;
LABEL_26:
    uint64_t v9 = v8;
    goto LABEL_27;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F434D0]])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v2 = (id *)getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_ptr;
    uint64_t v14 = getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_ptr)
    {
      double v4 = (void *)AccessibilitySharedSupportLibrary();
      v12[3] = (uint64_t)dlsym(v4, "AXSSVoiceOverTextualContextSpreadsheet");
      getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_uint64_t ptr = v12[3];
      uint64_t v2 = (id *)v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v2) {
      AXSSTextualContextFromUITextualContext_cold_2();
    }
    goto LABEL_25;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F434C8]])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v2 = (id *)getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_ptr;
    uint64_t v14 = getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_ptr)
    {
      BOOL v5 = (void *)AccessibilitySharedSupportLibrary();
      v12[3] = (uint64_t)dlsym(v5, "AXSSVoiceOverTextualContextSourceCode");
      getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_uint64_t ptr = v12[3];
      uint64_t v2 = (id *)v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v2) {
      AXSSTextualContextFromUITextualContext_cold_3();
    }
    goto LABEL_25;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F434A8]])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v2 = (id *)getAXSSVoiceOverTextualContextConsoleSymbolLoc_ptr;
    uint64_t v14 = getAXSSVoiceOverTextualContextConsoleSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextConsoleSymbolLoc_ptr)
    {
      int v6 = (void *)AccessibilitySharedSupportLibrary();
      v12[3] = (uint64_t)dlsym(v6, "AXSSVoiceOverTextualContextConsole");
      getAXSSVoiceOverTextualContextConsoleSymbolLoc_uint64_t ptr = v12[3];
      uint64_t v2 = (id *)v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v2) {
      AXSSTextualContextFromUITextualContext_cold_4();
    }
    goto LABEL_25;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F434B0]])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v2 = (id *)getAXSSVoiceOverTextualContextFileSystemSymbolLoc_ptr;
    uint64_t v14 = getAXSSVoiceOverTextualContextFileSystemSymbolLoc_ptr;
    if (!getAXSSVoiceOverTextualContextFileSystemSymbolLoc_ptr)
    {
      id v7 = (void *)AccessibilitySharedSupportLibrary();
      v12[3] = (uint64_t)dlsym(v7, "AXSSVoiceOverTextualContextFileSystem");
      getAXSSVoiceOverTextualContextFileSystemSymbolLoc_uint64_t ptr = v12[3];
      uint64_t v2 = (id *)v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v2) {
      AXSSTextualContextFromUITextualContext_cold_5();
    }
    goto LABEL_25;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F434C0]])
  {
    getAXSSVoiceOverTextualContextNarrative();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F434B8]])
  {
    getAXSSVoiceOverTextualContextMessaging();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  uint64_t v9 = 0;
LABEL_27:

  return v9;
}

void sub_19F32DFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIAXColorForObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      uint64_t v2 = __UIAccessibilityCastAsClass();
      if (v2) {
        uint64_t v3 = [v1 CGColor];
      }
      else {
        uint64_t v3 = 0;
      }
    }
    else
    {
      CFTypeID v4 = CFGetTypeID(v1);
      if (v4 == CGColorGetTypeID()) {
        uint64_t v3 = (uint64_t)v1;
      }
      else {
        uint64_t v3 = 0;
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id getAXSSVoiceOverTextualContextNarrative()
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2020000000;
  id v0 = (void **)getAXSSVoiceOverTextualContextNarrativeSymbolLoc_ptr;
  uint64_t v7 = getAXSSVoiceOverTextualContextNarrativeSymbolLoc_ptr;
  if (!getAXSSVoiceOverTextualContextNarrativeSymbolLoc_ptr)
  {
    id v1 = (void *)AccessibilitySharedSupportLibrary();
    v5[3] = (uint64_t)dlsym(v1, "AXSSVoiceOverTextualContextNarrative");
    getAXSSVoiceOverTextualContextNarrativeSymbolLoc_uint64_t ptr = v5[3];
    id v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getAXSSVoiceOverTextualContextNarrative_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_19F32E194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAXSSVoiceOverTextualContextMessaging()
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2020000000;
  id v0 = (void **)getAXSSVoiceOverTextualContextMessagingSymbolLoc_ptr;
  uint64_t v7 = getAXSSVoiceOverTextualContextMessagingSymbolLoc_ptr;
  if (!getAXSSVoiceOverTextualContextMessagingSymbolLoc_ptr)
  {
    id v1 = (void *)AccessibilitySharedSupportLibrary();
    v5[3] = (uint64_t)dlsym(v1, "AXSSVoiceOverTextualContextMessaging");
    getAXSSVoiceOverTextualContextMessagingSymbolLoc_uint64_t ptr = v5[3];
    id v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getAXSSVoiceOverTextualContextMessaging_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_19F32E29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXAttributedStringForBetterPronuciation(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:a2];
  BOOL v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v6 = [v5 firstObject];
  int v7 = [v6 hasPrefix:@"en"];

  if (v7 && [v3 isEqualToString:UIAXBetterPronuciationKeyLive]) {
    [v4 setAttribute:&unk_1EF171D90 forKey:*MEMORY[0x1E4F488C8]];
  }

  return v4;
}

uint64_t UIAccessibilityIsAppExtension()
{
  if (UIAccessibilityIsAppExtension_onceToken != -1) {
    dispatch_once(&UIAccessibilityIsAppExtension_onceToken, &__block_literal_global_585);
  }
  return UIAccessibilityIsAppExtension_IsExtension;
}

void __UIAccessibilityIsAppExtension_block_invoke()
{
  objc_opt_class();
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 infoDictionary];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"NSExtension"];
  id v3 = __UIAccessibilityCastAsClass();

  uint64_t v4 = [v3 objectForKey:@"NSExtensionPointIdentifier"];
  UIAccessibilityIsAppExtension_IsExtension = v4 != 0;
}

uint64_t UIAccessibilityIsWidgetExtension()
{
  if (UIAccessibilityIsWidgetExtension_onceToken != -1) {
    dispatch_once(&UIAccessibilityIsWidgetExtension_onceToken, &__block_literal_global_595);
  }
  return UIAccessibilityIsWidgetExtension_IsWidget;
}

void __UIAccessibilityIsWidgetExtension_block_invoke()
{
  objc_opt_class();
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 infoDictionary];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"NSExtension"];
  id v3 = __UIAccessibilityCastAsClass();

  uint64_t v4 = [v3 objectForKey:@"NSExtensionPointIdentifier"];
  UIAccessibilityIsWidgetExtension_IsWidget = [v4 isEqualToString:@"com.apple.widget-extension"];
}

void sub_19F32F388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

double UIAccessibilityFrameForBounds(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v9, "_axConvertRect:toWindow:", 0, a2, a3, a4, a5);
    double v11 = v10;
  }
  else
  {
    uint64_t v12 = [v9 window];
    if (v12)
    {
      objc_msgSend(v9, "convertRect:toView:", 0, a2, a3, a4, a5);
      objc_msgSend(v12, "_axConvertRect:toWindow:", 0);
      double v11 = v13;
    }
    else
    {
      uint64_t v14 = [v9 _accessibilityProxyViewAncestorWhenMissingWindow];

      objc_msgSend(v14, "convertRect:toView:", 0, a2, a3, a4, a5);
      double v11 = v15;
      id v9 = v14;
    }
  }
  return v11;
}

id _UIAccessibilityPathForPath(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___UIAccessibilityPathForPath_block_invoke;
  v9[3] = &unk_1E59B9998;
  id v10 = v5;
  uint64_t v11 = a3;
  id v6 = v5;
  int v7 = UIAccessibilityPathForPath((uint64_t)v6, a2, v9);

  return v7;
}

id UIAccessibilityPathForPath(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (a2)
  {
    [a2 CGPath];
    CGMutablePathRef Mutable = CGPathCreateMutable();
    uint64_t v8 = MEMORY[0x1E4F143A8];
    id v9 = v4;
    AX_CGPathEnumerateElementsUsingBlock();
    id v6 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithCGPath:", Mutable, v8, 3221225472, __UIAccessibilityPathForPath_block_invoke, &unk_1E59B99C0);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __UIAccessibilityPathForPath_block_invoke(uint64_t a1, int a2, double *a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v7 = a4;
    uint64_t v8 = a3 + 1;
    do
    {
      *(v8 - 1) = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(*(v8 - 1), *v8);
      *(void *)uint64_t v8 = v9;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  switch(a2)
  {
    case 0:
      id v10 = *(CGPath **)(a1 + 40);
      CGFloat v11 = *a3;
      CGFloat v12 = a3[1];
      CGPathMoveToPoint(v10, 0, v11, v12);
      break;
    case 1:
      double v13 = *(CGPath **)(a1 + 40);
      CGFloat v14 = *a3;
      CGFloat v15 = a3[1];
      CGPathAddLineToPoint(v13, 0, v14, v15);
      break;
    case 2:
      uint64_t v16 = *(CGPath **)(a1 + 40);
      CGFloat v17 = *a3;
      CGFloat v18 = a3[1];
      CGFloat v19 = a3[2];
      CGFloat v20 = a3[3];
      CGPathAddQuadCurveToPoint(v16, 0, v17, v18, v19, v20);
      break;
    case 3:
      uint64_t v21 = *(CGPath **)(a1 + 40);
      CGFloat v22 = *a3;
      CGFloat v23 = a3[1];
      CGFloat v24 = a3[2];
      CGFloat v25 = a3[3];
      CGFloat v26 = a3[4];
      CGFloat v27 = a3[5];
      CGPathAddCurveToPoint(v21, 0, v22, v23, v24, v25, v26, v27);
      break;
    case 4:
      long long v28 = *(CGPath **)(a1 + 40);
      CGPathCloseSubpath(v28);
      break;
    default:
      return;
  }
}

id UIAccessibilityPathForAccessibilityPath(void *a1, void *a2)
{
  return _UIAccessibilityPathForPath(a1, a2, (uint64_t)UIAccessibilityPointToPoint);
}

double UIAccessibilityPointToPoint(void *a1, double a2, double a3)
{
  id v5 = a1;
  id v6 = [v5 window];
  objc_msgSend(v6, "convertPoint:fromWindow:", 0, a2, a3);
  objc_msgSend(v5, "convertPoint:fromView:", v6);
  double v8 = v7;

  return v8;
}

id UIAccessibilityConvertPathFunction(void *a1, void *a2)
{
  return _UIAccessibilityPathForPath(a2, a1, (uint64_t)UIAccessibilityPointForPoint);
}

double UIAccessibilityPointForPoint(void *a1, double a2, double a3)
{
  id v5 = a1;
  id v6 = [v5 window];
  objc_msgSend(v5, "convertPoint:toView:", v6, a2, a3);
  double v8 = v7;
  double v10 = v9;

  if (v6)
  {
    objc_msgSend(v6, "convertPoint:toWindow:", 0, v8, v10);
    double v8 = v11;
  }

  return v8;
}

id UIAccessibilityConvertAccessibilityPathToViewFunction(void *a1, void *a2)
{
  return _UIAccessibilityPathForPath(a2, a1, (uint64_t)UIAccessibilityPointToPoint);
}

id UIAccessibilitySceneReferencePathForScreenPath(void *a1)
{
  return _UIAccessibilityPathForPath(0, a1, (uint64_t)_UIAccessibilitySceneReferencePointForScreenPoint);
}

id UIAccessibilitySceneReferencePathToScreenPath(void *a1)
{
  return _UIAccessibilityPathForPath(0, a1, (uint64_t)_UIAccessibilitySceneReferencePointToScreenPoint);
}

id UIAccessibilitySceneReferencePathToScreenPathWithView(void *a1, void *a2)
{
  return _UIAccessibilityPathForPath(a1, a2, (uint64_t)UIAccessibilitySceneReferencePointToScreenPointWithView);
}

double UIAccessibilitySceneReferencePointToScreenPointWithView(void *a1, double a2, double a3)
{
  id v5 = a1;
  id v6 = [v5 window];
  objc_msgSend(v6, "convertPoint:fromWindow:", 0, a2, a3);
  double v8 = v7;
  double v10 = v9;

  double v11 = [v5 window];

  objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", v8, v10);
  double v13 = v12;

  return v13;
}

id UIAccessibilityInsetBezierPath(void *a1, CGFloat a2, CGFloat a3)
{
  if (a1)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithCGPath:", objc_msgSend(a1, "CGPath"));
    [v5 bounds];
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
    CGRect v29 = CGRectInset(v28, a2, a3);
    CGFloat v10 = v29.size.width;
    CGFloat v11 = v29.size.height;
    double v12 = v29.origin.x;
    double v13 = v29.origin.y;
    double v22 = CGRectGetWidth(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    sCGFloat x = v22 / CGRectGetWidth(v30);
    v31.origin.CGFloat x = v12;
    v31.origin.CGFloat y = v13;
    v31.size.CGFloat width = v10;
    v31.size.CGFloat height = v11;
    double v14 = CGRectGetHeight(v31);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGFloat v15 = CGRectGetHeight(v32);
    memset(&v26, 0, sizeof(v26));
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x1E4F1DAB8];
    long long v21 = *(_OWORD *)&v25.a;
    *(_OWORD *)&v25.c = v23;
    *(_OWORD *)&v25.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v20 = *(_OWORD *)&v25.tx;
    CGAffineTransformScale(&v26, &v25, sx, v14 / v15);
    CGAffineTransform v25 = v26;
    [v5 applyTransform:&v25];
    [v5 bounds];
    *(_OWORD *)&v24.a = v21;
    *(_OWORD *)&v24.c = v23;
    *(_OWORD *)&v24.tCGFloat x = v20;
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformTranslate(&v25, &v24, v12 - v16, v13 - v17);
    CGAffineTransform v24 = v25;
    [v5 applyTransform:&v24];
    [v5 closePath];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

double UIAccessibilityFrameToBounds(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [v9 window];
  }
  CGFloat v11 = v10;
  objc_msgSend(v10, "convertRect:fromWindow:", 0, a2, a3, a4, a5);
  objc_msgSend(v9, "convertRect:fromView:", 0);
  double v13 = v12;

  return v13;
}

double UIAccessibilitySceneReferencePointForScreenPoint(double a1, double a2)
{
  id v4 = _anyMainScreenWindow();
  objc_msgSend(v4, "convertPoint:fromWindow:", 0, a1, a2);
  objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
  double v6 = v5;

  return v6;
}

id _anyMainScreenWindow()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F43058] _applicationKeyWindow];
  id v1 = [v0 screen];
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];

  if (v1 != v2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = AXUIApplicationWindows();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v9 = objc_msgSend(v8, "screen", (void)v13);
          id v10 = [MEMORY[0x1E4F42D90] mainScreen];

          if (v9 == v10)
          {
            id v11 = v8;

            id v0 = v11;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
  }

  return v0;
}

double UIAccessibilitySceneReferencePointToScreenPoint(double a1, double a2)
{
  uint64_t v4 = _anyMainScreenWindow();
  objc_msgSend(v4, "_convertPointFromSceneReferenceSpace:", a1, a2);
  objc_msgSend(v4, "convertPoint:toWindow:", 0);
  double v6 = v5;

  return v6;
}

double UIAXFrameForElements(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  double v3 = *MEMORY[0x1E4F1DB20];
  CGFloat v2 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v9) accessibilityFrame];
        CGFloat x = v21.origin.x;
        CGFloat y = v21.origin.y;
        CGFloat width = v21.size.width;
        CGFloat height = v21.size.height;
        if (!CGRectIsEmpty(v21))
        {
          v22.origin.CGFloat x = v3;
          v22.origin.CGFloat y = v2;
          v22.size.CGFloat width = v5;
          v22.size.CGFloat height = v4;
          if (CGRectIsEmpty(v22))
          {
            CGFloat v4 = height;
            CGFloat v5 = width;
            CGFloat v2 = y;
            double v3 = x;
          }
          else
          {
            v23.origin.CGFloat x = v3;
            v23.origin.CGFloat y = v2;
            v23.size.CGFloat width = v5;
            v23.size.CGFloat height = v4;
            v25.origin.CGFloat x = x;
            v25.origin.CGFloat y = y;
            v25.size.CGFloat width = width;
            v25.size.CGFloat height = height;
            CGRect v24 = CGRectUnion(v23, v25);
            double v3 = v24.origin.x;
            CGFloat v2 = v24.origin.y;
            CGFloat v5 = v24.size.width;
            CGFloat v4 = v24.size.height;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

id UIKitAccessibilityLocalizedStringInTable(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CGFloat v5 = (void *)UIKitAccessibilityLocalizedStringInTable_axBundle;
  if (UIKitAccessibilityLocalizedStringInTable_axBundle) {
    goto LABEL_6;
  }
  if (_CFMZEnabled()) {
    [MEMORY[0x1E4F28B50] accessibilityMacCalystBundleWithLastPathComponent:@"UIKit.axbundle"];
  }
  else {
  uint64_t v6 = [MEMORY[0x1E4F28B50] accessibilityBundleWithLastPathComponent:@"UIKit.axbundle"];
  }
  uint64_t v7 = (void *)UIKitAccessibilityLocalizedStringInTable_axBundle;
  UIKitAccessibilityLocalizedStringInTable_axBundle = v6;

  CGFloat v5 = (void *)UIKitAccessibilityLocalizedStringInTable_axBundle;
  if (UIKitAccessibilityLocalizedStringInTable_axBundle)
  {
LABEL_6:
    uint64_t v8 = [v5 localizedStringForKey:v3 value:&stru_1EF1680E8 table:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x1F4106418]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x1F4106450]();
}

id __UIAXStringForVariables()
{
  id v0 = __AXStringForVariablesWithVariadics();

  return v0;
}

__CFString *UIAXPrivateLocalizedString(void *a1)
{
  id v1 = a1;
  CGFloat v2 = (void *)UIAXPrivateLocalizedString_axBundle;
  if (UIAXPrivateLocalizedString_axBundle
    || ([MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AXExtraExtras.axbundle"],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = (void *)UIAXPrivateLocalizedString_axBundle,
        UIAXPrivateLocalizedString_axBundle = v3,
        v4,
        (CGFloat v2 = (void *)UIAXPrivateLocalizedString_axBundle) != 0))
  {
    CGFloat v5 = [v2 localizedStringForKey:v1 value:&stru_1EF1680E8 table:@"Accessibility"];
  }
  else
  {
    CGFloat v5 = 0;
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = &stru_1EF1680E8;
  }
  uint64_t v7 = v6;

  return v7;
}

id UIAXLocalizedStringForKnownAXIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"UIButtonBarPlay"])
  {
    CGFloat v2 = @"play.button";
LABEL_15:
    uint64_t v3 = UIKitAccessibilityLocalizedString(v2);
    goto LABEL_16;
  }
  if ([v1 isEqualToString:@"UIButtonBarListIcon"])
  {
    CGFloat v2 = @"item.list.button";
    goto LABEL_15;
  }
  if ([v1 containsString:@"UITabBarMoreTemplate"])
  {
    CGFloat v2 = @"more.button";
    goto LABEL_15;
  }
  if ([v1 containsString:@"UIButtonBarArrowUp"])
  {
    CGFloat v2 = @"previous.input.item";
    goto LABEL_15;
  }
  if ([v1 containsString:@"UIButtonBarArrowDown"])
  {
    CGFloat v2 = @"next.input.item";
    goto LABEL_15;
  }
  if ([v1 containsString:@"UIButtonBarMarkup"])
  {
    CGFloat v2 = @"markup.button.label";
    goto LABEL_15;
  }
  if ([v1 containsString:@"UniversalSearchBarButtonIcon"])
  {
    CGFloat v2 = @"search.button";
    goto LABEL_15;
  }
  uint64_t v3 = 0;
LABEL_16:

  return v3;
}

id UIAXPriceRangeDescription(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    CGFloat v2 = NSString;
    uint64_t v3 = UIKitAccessibilityLocalizedString(@"price.range.output");
    id v4 = objc_msgSend(v2, "stringWithFormat:", v3, v1);

    id v5 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v4];
    uint64_t v6 = [v5 rangeOfString:v1];
    objc_msgSend(v5, "setAttribute:forKey:withRange:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F48B18], v6, v7);
  }
  else
  {
    id v5 = v1;
  }

  return v5;
}

id UIAXStarRatingStringForRatingWithMaxRatingGranularity(uint64_t a1, int a2, double a3)
{
  if (a2 == 1)
  {
    if (a3 < 0.25 && a3 >= -0.25) {
      goto LABEL_65;
    }
    if (a3 < 0.5 && a3 >= 0.0)
    {
LABEL_62:
      uint64_t v8 = @"star.count.onequarters";
      goto LABEL_63;
    }
    if (a3 < 0.75 && a3 >= 0.25)
    {
LABEL_80:
      id v11 = @"star.count.onehalf";
      goto LABEL_66;
    }
    if (a3 >= 1.0 || a3 < 0.5)
    {
      if (a3 >= 1.25 || a3 < 0.75)
      {
        if (a3 >= 1.5 || a3 < 1.0)
        {
          if (a3 >= 1.75 || a3 < 1.25)
          {
            if (a3 >= 2.0 || a3 < 1.5)
            {
              if (a3 >= 2.25 || a3 < 1.75)
              {
                if (a3 >= 2.5 || a3 < 2.0)
                {
                  if (a3 >= 2.75 || a3 < 2.25)
                  {
                    if (a3 >= 3.0 || a3 < 2.5)
                    {
                      if (a3 >= 3.25 || a3 < 2.75)
                      {
                        if (a3 >= 3.5 || a3 < 3.0)
                        {
                          if (a3 >= 3.75 || a3 < 3.25)
                          {
                            if (a3 >= 4.0 || a3 < 3.5)
                            {
                              if (a3 >= 4.25 || a3 < 3.75)
                              {
                                if (a3 >= 4.5 || a3 < 4.0)
                                {
                                  if (a3 >= 4.75 || a3 < 4.25)
                                  {
                                    if (a3 >= 5.0 || a3 < 4.5)
                                    {
                                      if (a3 >= 5.25 || a3 < 4.75) {
                                        goto LABEL_132;
                                      }
                                      goto LABEL_131;
                                    }
                                    goto LABEL_128;
                                  }
LABEL_125:
                                  id v11 = @"star.count.fourandhalf";
                                  goto LABEL_66;
                                }
LABEL_122:
                                uint64_t v8 = @"star.count.fourandquarters";
                                goto LABEL_63;
                              }
LABEL_119:
                              id v11 = @"star.count.four";
                              goto LABEL_66;
                            }
LABEL_116:
                            uint64_t v8 = @"star.count.threeandthreequarters";
                            goto LABEL_63;
                          }
LABEL_113:
                          id v11 = @"star.count.threeandhalf";
                          goto LABEL_66;
                        }
LABEL_110:
                        uint64_t v8 = @"star.count.threeandquarters";
                        goto LABEL_63;
                      }
LABEL_107:
                      id v11 = @"star.count.three";
                      goto LABEL_66;
                    }
LABEL_104:
                    uint64_t v8 = @"star.count.twoandthreequarters";
                    goto LABEL_63;
                  }
LABEL_101:
                  id v11 = @"star.count.twoandhalf";
                  goto LABEL_66;
                }
LABEL_98:
                uint64_t v8 = @"star.count.twoandquarters";
                goto LABEL_63;
              }
LABEL_95:
              id v11 = @"star.count.two";
              goto LABEL_66;
            }
LABEL_92:
            uint64_t v8 = @"star.count.oneandthreequarters";
            goto LABEL_63;
          }
LABEL_89:
          id v11 = @"star.count.oneandhalf";
          goto LABEL_66;
        }
LABEL_86:
        uint64_t v8 = @"star.count.oneandquarters";
        goto LABEL_63;
      }
LABEL_83:
      id v11 = @"star.count.one";
      goto LABEL_66;
    }
LABEL_79:
    uint64_t v8 = @"star.count.onethreequarters";
    goto LABEL_63;
  }
  if (a2 || (a3 < 0.125 ? (BOOL v4 = a3 < -0.125) : (BOOL v4 = 1), !v4))
  {
LABEL_65:
    id v11 = @"star.count.zerostars";
LABEL_66:
    uint64_t v12 = UIKitAccessibilityLocalizedString(v11);
    goto LABEL_67;
  }
  if (a3 < 0.375 && a3 >= 0.125) {
    goto LABEL_62;
  }
  if (a3 < 0.625 && a3 >= 0.375) {
    goto LABEL_80;
  }
  if (a3 < 0.875 && a3 >= 0.625) {
    goto LABEL_79;
  }
  if (a3 < 1.125 && a3 >= 0.875) {
    goto LABEL_83;
  }
  if (a3 < 1.375 && a3 >= 1.125) {
    goto LABEL_86;
  }
  if (a3 < 1.625 && a3 >= 1.375) {
    goto LABEL_89;
  }
  if (a3 < 1.875 && a3 >= 1.625) {
    goto LABEL_92;
  }
  if (a3 < 2.125 && a3 >= 1.875) {
    goto LABEL_95;
  }
  if (a3 < 2.375 && a3 >= 2.125) {
    goto LABEL_98;
  }
  if (a3 < 2.625 && a3 >= 2.375) {
    goto LABEL_101;
  }
  if (a3 < 2.875 && a3 >= 2.625) {
    goto LABEL_104;
  }
  if (a3 < 3.125 && a3 >= 2.875) {
    goto LABEL_107;
  }
  if (a3 < 3.375 && a3 >= 3.125) {
    goto LABEL_110;
  }
  if (a3 < 3.625 && a3 >= 3.375) {
    goto LABEL_113;
  }
  if (a3 < 3.875 && a3 >= 3.625) {
    goto LABEL_116;
  }
  if (a3 < 4.125 && a3 >= 3.875) {
    goto LABEL_119;
  }
  if (a3 < 4.375 && a3 >= 4.125) {
    goto LABEL_122;
  }
  if (a3 < 4.625 && a3 >= 4.375) {
    goto LABEL_125;
  }
  if (a3 >= 4.875 || a3 < 4.625)
  {
    if (a3 >= 5.125 || a3 < 4.875)
    {
LABEL_132:
      uint64_t v12 = UIAXFormatInteger((uint64_t)a3);
LABEL_67:
      uint64_t v9 = (void *)v12;
      if (a1) {
        goto LABEL_68;
      }
LABEL_64:
      id v10 = v9;
      goto LABEL_69;
    }
LABEL_131:
    id v11 = @"star.count.five";
    goto LABEL_66;
  }
LABEL_128:
  uint64_t v8 = @"star.count.fourandthreequarters";
LABEL_63:
  uint64_t v9 = UIKitAccessibilityLocalizedString(v8);
  if (!a1) {
    goto LABEL_64;
  }
LABEL_68:
  long long v13 = NSString;
  long long v14 = UIKitAccessibilityLocalizedString(@"star.verbose.count.format");
  long long v15 = UIAXFormatFloat();
  objc_msgSend(v13, "localizedStringWithFormat:", v14, v15, a1);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_69:

  return v10;
}

id UIAXStarRatingStringForRatingWithGranularity(int a1, double a2)
{
  return UIAXStarRatingStringForRatingWithMaxRatingGranularity(0, a1, a2);
}

id UIAXStarRatingStringForRatingWithMaxRating(uint64_t a1, double a2)
{
  return UIAXStarRatingStringForRatingWithMaxRatingGranularity(a1, 1, a2);
}

id UIAXStarRatingStringForRating(double a1)
{
  return UIAXStarRatingStringForRatingWithMaxRatingGranularity(0, 1, a1);
}

id UIAXPriceRangeRating(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  uint64_t v3 = objc_msgSend(v1, "stringWithFormat:", @"UnicodeHex.%04hx", objc_msgSend(v2, "characterAtIndex:", 0));
  BOOL v4 = VOTBundle();
  id v5 = AXNSLocalizedStringForLocale();

  uint64_t v6 = NSString;
  uint64_t v7 = UIKitAccessibilityLocalizedString(@"price.range.output");
  [v2 length];

  uint64_t v8 = AXFormatInteger();
  uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8, v5);

  return v9;
}

uint64_t UIAXHasPurpleBuddyCompleted()
{
  return MEMORY[0x1F4105F88]();
}

id UIAccessibilityGetKeyboardLayoutStar()
{
  id v0 = [MEMORY[0x1E4F42B20] activeInstance];
  id v1 = v0;
  if (v0)
  {
    id v2 = [v0 safeValueForKey:@"_layout"];
    NSClassFromString(&cfstr_Uikeyboardlayo.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _AXAssert();
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void UIAccessibilityPerformBlockForOrientationChange(void *a1, void *a2)
{
  id v8 = a1;
  uint64_t v3 = a2;
  BOOL v4 = [v8 _accessibilityWindow];
  id v5 = [v4 windowScene];
  uint64_t v6 = [v5 interfaceOrientation];

  uint64_t v7 = [v8 _accessibilityValueForKey:@"__accessibilityLastSeenInterfaceOrientation"];

  if (v7)
  {
    if ([v8 _accessibilityIntegerValueForKey:@"__accessibilityLastSeenInterfaceOrientation"] != v6)
    {
      [v8 _accessibilitySetIntegerValue:v6 forKey:@"__accessibilityLastSeenInterfaceOrientation"];
      v3[2](v3);
    }
  }
  else
  {
    [v8 _accessibilitySetIntegerValue:v6 forKey:@"__accessibilityLastSeenInterfaceOrientation"];
  }
}

void UIAccessibilityConvertRectToPortraitCoordinates()
{
  id v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 bounds];
}

uint64_t UIAccessibilityViewHasHiddenOrZeroAlphaAncestor(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
    while (!v4 || v7 != v4)
    {
      if (([v7 isHidden] & 1) != 0 || (objc_msgSend(v7, "alpha"), v8 < 2.22044605e-16))
      {
        uint64_t v9 = 1;
        goto LABEL_12;
      }
      uint64_t v9 = [v7 superview];

      id v7 = (id)v9;
      if (!v9) {
        goto LABEL_12;
      }
    }
    uint64_t v9 = 0;
    id v7 = v4;
LABEL_12:
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id AXUIKeyboardEntryNotificationBlockTimer()
{
  id v0 = (void *)_UnblockTimer;
  if (!_UnblockTimer)
  {
    id v1 = objc_alloc(MEMORY[0x1E4F48318]);
    uint64_t v2 = [v1 initWithTargetSerialQueue:MEMORY[0x1E4F14428]];
    id v3 = (void *)_UnblockTimer;
    _UnblockTimer = v2;

    id v0 = (void *)_UnblockTimer;
  }

  return v0;
}

void AXUIUnblockKeyboardEntryNotifications()
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(id)_UnblockTimer cancel];
  id v0 = _UIAccessibilityNotificationsBlocked();
  id v1 = AXLogUIA();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v38 = [v0 count];
    _os_log_impl(&dword_19F2DB000, v1, OS_LOG_TYPE_INFO, "Finished keyboard task, unblocking notifications[%d]", buf, 8u);
  }

  _UIAccessibilityUnblockPostingOfAllNotifications();
  if ([v0 count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v3 = v0;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
    CGRect v25 = v0;
    if (v4)
    {
      uint64_t v5 = v4;
      *(_DWORD *)&v26[8] = 0;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v32;
      *(void *)CGAffineTransform v26 = *MEMORY[0x1E4F43490];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v10 = [v9 objectForKeyedSubscript:@"notification"];
          int v11 = [v10 unsignedIntValue];

          if (v11 == UIAccessibilitySelectionChangedNotification)
          {
            id v12 = v9;

            uint64_t v6 = v12;
          }
          else if (v11 == UIAccessibilityValueChangedNotification)
          {
            id v13 = v9;

            *(void *)&v26[4] = v13;
          }
          else if (v11 != *(_DWORD *)v26)
          {
            [v2 addObject:v9];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v5);

      if (v6) {
        [v2 insertObject:v6 atIndex:0];
      }
      CGRect v24 = v6;
      if (*(void *)&v26[4]) {
        [v2 insertObject:*(void *)&v26[4] atIndex:0];
      }
      else {
        *(void *)&v26[4] = 0;
      }
    }
    else
    {

      *(void *)&v26[4] = 0;
      CGRect v24 = 0;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v2;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          CGFloat v19 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          uint64_t v20 = [v19 objectForKeyedSubscript:@"notification"];
          UIAccessibilityNotifications v21 = [v20 unsignedIntValue];

          CGRect v22 = [v19 objectForKeyedSubscript:@"notificationData"];
          CGRect v23 = [v19 objectForKeyedSubscript:@"associatedObject"];
          _UIAccessibilitySetAssociatedElementContextForNextNotification(v23);
          UIAccessibilityPostNotification(v21, v22);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);
    }

    id v0 = v25;
  }
}

uint64_t AXSelectionModeVoiceOverSelectionMovement()
{
  return AXIsVoiceOverSelectionMovement;
}

uint64_t AXSetSelectionModeVoiceOverSelectionMovement(uint64_t result)
{
  AXIsVoiceOverSelectionMovement = result;
  return result;
}

void *__getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AccessibilitySharedSupportLibrary();
  CFTypeID result = dlsym(v2, "AXSSVoiceOverTextualContextWordProcessing");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSSVoiceOverTextualContextWordProcessingSymbolLoc_uint64_t ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AccessibilitySharedSupportLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!AccessibilitySharedSupportLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilitySharedSupportLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E59B9A30;
    uint64_t v4 = 0;
    AccessibilitySharedSupportLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = AccessibilitySharedSupportLibraryCore_frameworkLibrary;
  if (!AccessibilitySharedSupportLibraryCore_frameworkLibrary) {
    AccessibilitySharedSupportLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AccessibilitySharedSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilitySharedSupportLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AccessibilitySharedSupportLibrary();
  uint64_t result = dlsym(v2, "AXSSVoiceOverTextualContextSpreadsheet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSSVoiceOverTextualContextSpreadsheetSymbolLoc_uint64_t ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AccessibilitySharedSupportLibrary();
  uint64_t result = dlsym(v2, "AXSSVoiceOverTextualContextSourceCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSSVoiceOverTextualContextSourceCodeSymbolLoc_uint64_t ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXSSVoiceOverTextualContextConsoleSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AccessibilitySharedSupportLibrary();
  uint64_t result = dlsym(v2, "AXSSVoiceOverTextualContextConsole");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSSVoiceOverTextualContextConsoleSymbolLoc_uint64_t ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXSSVoiceOverTextualContextFileSystemSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AccessibilitySharedSupportLibrary();
  uint64_t result = dlsym(v2, "AXSSVoiceOverTextualContextFileSystem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSSVoiceOverTextualContextFileSystemSymbolLoc_uint64_t ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXSSVoiceOverTextualContextNarrativeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AccessibilitySharedSupportLibrary();
  uint64_t result = dlsym(v2, "AXSSVoiceOverTextualContextNarrative");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSSVoiceOverTextualContextNarrativeSymbolLoc_uint64_t ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXSSVoiceOverTextualContextMessagingSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AccessibilitySharedSupportLibrary();
  uint64_t result = dlsym(v2, "AXSSVoiceOverTextualContextMessaging");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSSVoiceOverTextualContextMessagingSymbolLoc_uint64_t ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void AXUIAutomationHandleKeyComplete(__CFString *a1, __CFString *a2, void *a3)
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v16[0] = @"event";
  v16[1] = @"ModifiedInput";
  uint64_t v5 = &stru_1EF1680E8;
  if (a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = &stru_1EF1680E8;
  }
  v17[0] = @"KeyEventComplete";
  v17[1] = v6;
  if (a2) {
    uint64_t v5 = a2;
  }
  void v16[2] = @"UnmodifiedInput";
  v16[3] = @"ModifierFlags";
  uint64_t v7 = &unk_1EF1719C8;
  if (a3) {
    uint64_t v7 = a3;
  }
  void v17[2] = v5;
  v17[3] = v7;
  double v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a3;
  id v10 = a2;
  int v11 = a1;
  id v12 = [v8 dictionaryWithObjects:v17 forKeys:v16 count:4];

  id v13 = AXLogUIA();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 138543362;
    uint64_t v15 = v12;
    _os_log_impl(&dword_19F2DB000, v13, OS_LOG_TYPE_INFO, "Posting key notification: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  UIAccessibilityPostNotification(0xFA2u, v12);
}

uint64_t _UIAXAutomationIgnoreLogging()
{
  if (_UIAXAutomationIgnoreLogging_onceToken != -1) {
    dispatch_once(&_UIAXAutomationIgnoreLogging_onceToken, &__block_literal_global_11);
  }
  return _UIAXAutomationIgnoreLogging_IgnoreLogging;
}

id _accessibilityAttributesForObject(void *a1, void *a2, unint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v41 = a5;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a1;
  id v9 = a2;
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v11 = v9;
  uint64_t v50 = [v11 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v50)
  {
    id v48 = 0;
    uint64_t v12 = *(void *)v54;
    uint64_t v42 = v58;
    uint64_t v49 = *(void *)v54;
    uint64_t v44 = v10;
    id v45 = v8;
    unsigned int v43 = a4;
    id v47 = v11;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v54 != v12) {
          objc_enumerationMutation(v11);
        }
        int v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x19F3CA890]();
        CGFloat v52 = v14;
        uint64_t v16 = [v14 integerValue];
        uint64_t v17 = [v8 _iosAccessibilityAttributeValue:v16];
        if (v17)
        {
          long long v18 = (void *)v17;
          objc_opt_class();
          uint64_t v51 = v15;
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 count] > a3)
          {
            id v19 = v18;
            uint64_t v20 = v48;
            if (!v48)
            {
              uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
            }
            UIAccessibilityNotifications v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count", v41, v42));
            id v48 = v20;
            [v20 setObject:v21 forKeyedSubscript:v52];

            long long v18 = v19;
            if ([v19 count] > a3)
            {
              long long v18 = objc_msgSend(v19, "subarrayWithRange:", 0, a3);
            }
            uint64_t v12 = v49;
          }
          CGRect v22 = UIAXRuntimeConvertOutgoingValue(v16, v18);
          id v23 = v22;
          if (v22) {
            BOOL v24 = a4 == 0;
          }
          else {
            BOOL v24 = 1;
          }
          if (!v24)
          {
            id v25 = v22;
            id v26 = v11;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v25, "count"));
              id v23 = (id)objc_claimAutoreleasedReturnValue();
              long long v62 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              id v46 = v25;
              id v27 = v25;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v62 objects:v67 count:16];
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v63;
                do
                {
                  for (uint64_t j = 0; j != v29; ++j)
                  {
                    if (*(void *)v63 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    long long v32 = _fetchAttributesIfNecessary(*(void **)(*((void *)&v62 + 1) + 8 * j), v26, a3);
                    if (v32) {
                      [v23 addObject:v32];
                    }
                  }
                  uint64_t v29 = [v27 countByEnumeratingWithState:&v62 objects:v67 count:16];
                }
                while (v29);
              }

              id v10 = v44;
              id v8 = v45;
              a4 = v43;
              uint64_t v12 = v49;
              id v25 = v46;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v33 = [MEMORY[0x1E4F1CA60] dictionary];
                v57[0] = MEMORY[0x1E4F143A8];
                v57[1] = 3221225472;
                v58[0] = ___fetchAttributesForAllAXUIElementsInOutgoingValue_block_invoke;
                v58[1] = &unk_1E59B9AE0;
                id v59 = v26;
                unint64_t v61 = a3;
                id v34 = v33;
                id v60 = v34;
                [v25 enumerateKeysAndObjectsUsingBlock:v57];
                uint64_t v35 = a4;
                uint64_t v36 = v10;
                id v37 = v25;
                int v38 = v60;
                id v39 = v34;
                uint64_t v12 = v49;
                id v23 = v39;

                id v25 = v37;
                id v10 = v36;
                a4 = v35;
                id v8 = v45;
              }
              else
              {
                _fetchAttributesIfNecessary(v25, v26, a3);
                id v23 = (id)objc_claimAutoreleasedReturnValue();
              }
            }

            id v11 = v47;
          }
          if (v23) {
            [v10 setObject:v23 forKeyedSubscript:v52];
          }

          uint64_t v15 = v51;
        }
      }
      uint64_t v50 = [v11 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v50);
  }
  else
  {
    id v48 = 0;
  }

  if (v41) {
    *uint64_t v41 = v48;
  }

  return v10;
}

id _fetchAttributesIfNecessary(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 == AXUIElementGetTypeID())
  {
    uint64_t v8 = _UIAXElementForAXUIElementRef();
    id v9 = (void *)v8;
    if (v8)
    {
      id v15 = 0;
      id v10 = _accessibilityAttributesForObject(v8, v6, a3, 0, &v15);
      id v11 = v15;
      if ([v10 count])
      {
        id v12 = [MEMORY[0x1E4F1CA60] dictionary];
        [v12 setObject:v5 forKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];
        id v13 = AXLogUIA();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          _fetchAttributesIfNecessary_cold_1();
        }

        [v12 setObject:v10 forKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributes"];
        if (v11) {
          [v12 setObject:v11 forKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributeArrayCounts"];
        }
      }
      else
      {
        id v12 = v5;
      }
    }
    else
    {
      id v12 = v5;
    }
  }
  else
  {
    id v12 = v5;
  }

  return v12;
}

void ___fetchAttributesForAllAXUIElementsInOutgoingValue_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = _fetchAttributesIfNecessary(a3, *(void **)(a1 + 32), *(void *)(a1 + 48));
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v6];
  }
}

void ___accessibilityPluginPostProcessAutomationData_block_invoke()
{
  uint64_t v0 = AXAccessibilityBundlesDirectory();
  id v1 = [v0 stringByAppendingPathComponent:@"UIAutomationSnapshotProcessing.bundle"];

  id v2 = [MEMORY[0x1E4F28B50] bundleWithPath:v1];
  id v8 = 0;
  int v3 = [v2 loadAndReturnError:&v8];
  id v4 = v8;
  if (!v3)
  {
    CFTypeID v7 = AXLogUIA();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      ___accessibilityPluginPostProcessAutomationData_block_invoke_cold_2((uint64_t)v1, (uint64_t)v4, v7);
    }
    goto LABEL_8;
  }
  id v5 = objc_alloc_init((Class)[v2 principalClass]);
  id v6 = (void *)_accessibilityPluginPostProcessAutomationData_Processor;
  _accessibilityPluginPostProcessAutomationData_Processor = (uint64_t)v5;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    CFTypeID v7 = AXLogUIA();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___accessibilityPluginPostProcessAutomationData_block_invoke_cold_1(v7);
    }
LABEL_8:

    goto LABEL_9;
  }
  _accessibilityPluginPostProcessAutomationData_Loaded = 1;
LABEL_9:
}

uint64_t ___defaultSnapshotAttributes_block_invoke()
{
  _defaultSnapshotAttributes_defaultAttributes = [&unk_1EF171DB8 copy];

  return MEMORY[0x1F41817F8]();
}

void sub_19F33849C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_19F339764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *location, id *a16, uint64_t a17, uint64_t a18, id *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id a48)
{
}

void sub_19F33C008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSCRCMathExpressionClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ScreenReaderCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ScreenReaderCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E59B9C90;
    uint64_t v5 = 0;
    ScreenReaderCoreLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!ScreenReaderCoreLibraryCore_frameworkLibrary) {
    __getSCRCMathExpressionClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SCRCMathExpression");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSCRCMathExpressionClass_block_invoke_cold_2();
  }
  getSCRCMathExpressionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ScreenReaderCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ScreenReaderCoreLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_19F33E02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id UIAccessibilityBundle()
{
  if (UIAccessibilityBundle_onceToken != -1) {
    dispatch_once(&UIAccessibilityBundle_onceToken, &__block_literal_global_18);
  }
  uint64_t v0 = (void *)UIAccessibilityBundle_UIAXBundle;

  return v0;
}

uint64_t __UIAccessibilityBundle_block_invoke()
{
  UIAccessibilityBundle_UIAXBundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

void _AXServerCacheGetPossiblyNilObjectForKey_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_19F2DB000, log, OS_LOG_TYPE_ERROR, "Getting AXServerCache with a nil object pointer!", v1, 2u);
}

void _UIAccessibilityStart_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19F2DB000, a2, OS_LOG_TYPE_ERROR, "unable to start accessibility server. error=%d", (uint8_t *)v2, 8u);
}

void _UIAccessibilityStop_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19F2DB000, a2, OS_LOG_TYPE_ERROR, "unable to stop accessibility server. error=%d", (uint8_t *)v2, 8u);
}

void __getGCExtendedGamepadClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getGCExtendedGamepadClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIAccessibilityGameController.m", 20, @"Unable to find class %s", "GCExtendedGamepad");

  __break(1u);
}

void GameControllerLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *GameControllerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIAccessibilityGameController.m", 17, @"%s", *a1);

  __break(1u);
}

void __getGCControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getGCControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIAccessibilityGameController.m", 19, @"Unable to find class %s", "GCController");

  __break(1u);
}

void __getLGRRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLGRRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"NSObjectAccessibility.m", 96, @"Unable to find class %s", "LGRRequest");

  __break(1u);
}

void LookingGlassRuntimeSupportLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *LookingGlassRuntimeSupportLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"NSObjectAccessibility.m", 94, @"%s", *a1);

  __break(1u);
}

void __getLGRRuntimeManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLGRRuntimeManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"NSObjectAccessibility.m", 95, @"Unable to find class %s", "LGRRuntimeManager");

  __break(1u);
}

void __getTinkerRuntimeClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AXTinkerKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"NSObjectAccessibility.m", 104, @"%s", *a1);

  __break(1u);
}

void __getTinkerRuntimeClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getTinkerRuntimeClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"NSObjectAccessibility.m", 105, @"Unable to find class %s", "TinkerRuntime");

  __break(1u);
}

void _UIAXBroadcastMainThread_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_19F2DB000, log, OS_LOG_TYPE_DEBUG, "Unit test callback sending", v1, 2u);
}

void AXSSTextualContextFromUITextualContext_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getAXSSVoiceOverTextualContextWordProcessing(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIKitAccessibility.m", 32, @"%s", dlerror());

  __break(1u);
}

void AXSSTextualContextFromUITextualContext_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getAXSSVoiceOverTextualContextSpreadsheet(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIKitAccessibility.m", 44, @"%s", dlerror());

  __break(1u);
}

void AXSSTextualContextFromUITextualContext_cold_3()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getAXSSVoiceOverTextualContextSourceCode(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIKitAccessibility.m", 40, @"%s", dlerror());

  __break(1u);
}

void AXSSTextualContextFromUITextualContext_cold_4()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getAXSSVoiceOverTextualContextConsole(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIKitAccessibility.m", 42, @"%s", dlerror());

  __break(1u);
}

void AXSSTextualContextFromUITextualContext_cold_5()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getAXSSVoiceOverTextualContextFileSystem(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIKitAccessibility.m", 38, @"%s", dlerror());

  __break(1u);
}

void getAXSSVoiceOverTextualContextNarrative_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getAXSSVoiceOverTextualContextNarrative(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIKitAccessibility.m", 36, @"%s", dlerror());

  __break(1u);
}

void getAXSSVoiceOverTextualContextMessaging_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getAXSSVoiceOverTextualContextMessaging(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIKitAccessibility.m", 34, @"%s", dlerror());

  __break(1u);
}

void AccessibilitySharedSupportLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccessibilitySharedSupportLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIKitAccessibility.m", 30, @"%s", *a1);

  __break(1u);
}

void _fetchAttributesIfNecessary_cold_1()
{
  OUTLINED_FUNCTION_7();
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v1, v2, "Set snapshot element %{private}@ for outgoing value %{private}@", v3, v4, v5, v6, 3u);
}

void ___accessibilityPluginPostProcessAutomationData_block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = _accessibilityPluginPostProcessAutomationData_Processor;
  _os_log_error_impl(&dword_19F2DB000, log, OS_LOG_TYPE_ERROR, "%{public}@ needs to implement: processSnapshot:options:", (uint8_t *)&v1, 0xCu);
}

void ___accessibilityPluginPostProcessAutomationData_block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19F2DB000, log, OS_LOG_TYPE_DEBUG, "Could not load: %{public}@ %public}@", (uint8_t *)&v3, 0x16u);
}

void __getSCRCMathExpressionClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *ScreenReaderCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIAccessibilityMathExpression.m", 16, @"%s", *a1);

  __break(1u);
}

void __getSCRCMathExpressionClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getSCRCMathExpressionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIAccessibilityMathExpression.m", 17, @"Unable to find class %s", "SCRCMathExpression");

  __break(1u);
  AXAccessibilityBundlesDirectory();
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x1F4105E28]();
}

uint64_t AXAccessibilityMacCatalystBundlesDirectory()
{
  return MEMORY[0x1F4105E30]();
}

uint64_t AXAttributeAllowsRequeryWhenRemoteElementFails()
{
  return MEMORY[0x1F4106420]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x1F4105E38]();
}

uint64_t AXCRemapLanguageCodeToFallbackIfNeccessary()
{
  return MEMORY[0x1F4105E58]();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x1F4106650]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x1F4105E90]();
}

uint64_t AXConvertIncomingValue()
{
  return MEMORY[0x1F4106428]();
}

uint64_t AXConvertOutgoingValue()
{
  return MEMORY[0x1F4106430]();
}

uint64_t AXConvertPointFromHostedCoordinates()
{
  return MEMORY[0x1F4106438]();
}

uint64_t AXDeviceGetMainScreenBounds()
{
  return MEMORY[0x1F41066D8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x1F4105EE0]();
}

uint64_t AXDeviceIsWatch()
{
  return MEMORY[0x1F4105F08]();
}

uint64_t AXDevicePrimeDisplayManager()
{
  return MEMORY[0x1F41066F0]();
}

uint64_t AXDisallowsUIBasedAccessibilityFeatures()
{
  return MEMORY[0x1F41787E0]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x1F4106440]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x1F4105F50]();
}

uint64_t AXGuaranteedMutableArray()
{
  return MEMORY[0x1F4105F68]();
}

uint64_t AXInternalAccessibilityBundlesDirectory()
{
  return MEMORY[0x1F4105F78]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x1F4105F90]();
}

uint64_t AXLabelAndValueForElements()
{
  return MEMORY[0x1F4106448]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x1F4105FA0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1F4105FE0]();
}

uint64_t AXLogDragging()
{
  return MEMORY[0x1F4105FF0]();
}

uint64_t AXLogElementTraversal()
{
  return MEMORY[0x1F4105FF8]();
}

uint64_t AXLogFocusEngine()
{
  return MEMORY[0x1F4106008]();
}

uint64_t AXLogHitTest()
{
  return MEMORY[0x1F4106018]();
}

uint64_t AXLogLoading()
{
  return MEMORY[0x1F4106028]();
}

uint64_t AXLogOpaqueElements()
{
  return MEMORY[0x1F4106040]();
}

uint64_t AXLogScrollToVisible()
{
  return MEMORY[0x1F4106060]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x1F4106080]();
}

uint64_t AXLogUI()
{
  return MEMORY[0x1F41060C8]();
}

uint64_t AXLogUIA()
{
  return MEMORY[0x1F41060D0]();
}

uint64_t AXLogValidations()
{
  return MEMORY[0x1F41060E0]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x1F41060E8]();
}

uint64_t AXMIntersectionOverUnion()
{
  return MEMORY[0x1F4106408]();
}

uint64_t AXMediaLogMLElement()
{
  return MEMORY[0x1F4106130]();
}

uint64_t AXNSLocalizedStringForLocale()
{
  return MEMORY[0x1F41787F8]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x1F4106188]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x1F4106190]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x1F4106198]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x1F41061A0]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x1F41061B0]();
}

uint64_t AXProcessCanContactSystemWideServer()
{
  return MEMORY[0x1F4106458]();
}

uint64_t AXProcessIsAXUIServer()
{
  return MEMORY[0x1F41061C8]();
}

uint64_t AXProcessIsAssistiveTouch()
{
  return MEMORY[0x1F41061D0]();
}

uint64_t AXProcessIsChronod()
{
  return MEMORY[0x1F41061E8]();
}

uint64_t AXProcessIsCommandAndControl()
{
  return MEMORY[0x1F41061F0]();
}

uint64_t AXProcessIsMobileMail()
{
  return MEMORY[0x1F4106200]();
}

uint64_t AXProcessIsPosterBoard()
{
  return MEMORY[0x1F4106208]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x1F4106220]();
}

uint64_t AXProcessIsSystemApplication()
{
  return MEMORY[0x1F4106228]();
}

uint64_t AXPushNotificationToSystemForBroadcast()
{
  return MEMORY[0x1F4106460]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x1F4106468]();
}

uint64_t AXRuntimeLogCommon()
{
  return MEMORY[0x1F4106290]();
}

uint64_t AXRuntimeLogNotifications()
{
  return MEMORY[0x1F4106298]();
}

uint64_t AXSAssistiveTouchCursorColor()
{
  return MEMORY[0x1F41062B0]();
}

uint64_t AXSSAccessibilityDescriptionForSymbolName()
{
  return MEMORY[0x1F4106648]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x1F41062B8]();
}

uint64_t AXShouldLogValidationErrors()
{
  return MEMORY[0x1F41062D0]();
}

uint64_t AXUIAllKeyboardWindows()
{
  return MEMORY[0x1F4106658]();
}

uint64_t AXUIApplicationWindows()
{
  return MEMORY[0x1F4106660]();
}

uint64_t AXUIConvertPointFromScreenToContextSpace()
{
  return MEMORY[0x1F4106668]();
}

uint64_t AXUIConvertRectFromScreenToContextSpace()
{
  return MEMORY[0x1F4106670]();
}

AXError AXUIElementCopyAttributeValue(AXUIElementRef element, CFStringRef attribute, CFTypeRef *value)
{
  return MEMORY[0x1F4106470](element, attribute, value);
}

AXError AXUIElementCopyParameterizedAttributeValue(AXUIElementRef element, CFStringRef parameterizedAttribute, CFTypeRef parameter, CFTypeRef *result)
{
  return MEMORY[0x1F4106478](element, parameterizedAttribute, parameter, result);
}

AXUIElementRef AXUIElementCreateSystemWide(void)
{
  return (AXUIElementRef)MEMORY[0x1F4106480]();
}

CFTypeID AXUIElementGetTypeID(void)
{
  return MEMORY[0x1F4106488]();
}

uint64_t AXUIKeyboardIsOnScreen()
{
  return MEMORY[0x1F4106678]();
}

uint64_t AXUIKeyboardScreenFrame()
{
  return MEMORY[0x1F4106680]();
}

uint64_t AXUIKeyboardWindow()
{
  return MEMORY[0x1F4106688]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x1F4106490](*(void *)&theType, valuePtr);
}

uint64_t AX_CGPathEnumerateElementsUsingBlock()
{
  return MEMORY[0x1F4106768]();
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x1F4106770]();
}

uint64_t AX_CGRectAlmostEqualToRect()
{
  return MEMORY[0x1F4106778]();
}

uint64_t AX_CGRectBySubtractingRect()
{
  return MEMORY[0x1F4106780]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x1F4106788]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

uint64_t BSGetVersionedPID()
{
  return MEMORY[0x1F410C378]();
}

uint64_t CALayerGetDelegate()
{
  return MEMORY[0x1F40F4BE0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1F40DB008](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0D0](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1F40DB120](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t CTFrameCopyVisibleString()
{
  return MEMORY[0x1F40DF6A0]();
}

CFTypeID CTFrameGetTypeID(void)
{
  return MEMORY[0x1F40DF6C8]();
}

uint64_t GSEventCreateWithEventRecord()
{
  return MEMORY[0x1F411C898]();
}

uint64_t GSEventGetLocationInWindow()
{
  return MEMORY[0x1F411C8C0]();
}

uint64_t MACaptionAppearanceSetDidDisplayCaptionsCallback()
{
  return MEMORY[0x1F40ECFE8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.id location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x1F40E71E0]();
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1F40E71E8](namestr);
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x1F40E71F0]();
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E71F8](aString);
  result.length = v2;
  result.id location = v1;
  return result;
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4102AF0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t UIAXFileTypeDescriptionForFileExtension()
{
  return MEMORY[0x1F4106410]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x1F4102B20](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1F4102B30]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1F4102B48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4102B58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4102BE0]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

uint64_t UIImageGetNavigationBarBackArrow()
{
  return MEMORY[0x1F4102C68]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4102C80](image);
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1F4102DF8]();
}

uint64_t VOTBundle()
{
  return MEMORY[0x1F4163FE8]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x1F4106368]();
}

uint64_t _AXCreateAXUIElementWithElement()
{
  return MEMORY[0x1F41064B8]();
}

uint64_t _AXElementForAXUIElementUniqueId()
{
  return MEMORY[0x1F41064C0]();
}

uint64_t _AXIgnoreNextNotification()
{
  return MEMORY[0x1F41064C8]();
}

uint64_t _AXInitializeSafeSwiftValueSupport()
{
  return MEMORY[0x1F4106370]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x1F4106378]();
}

uint64_t _AXNextIgnoredNotification()
{
  return MEMORY[0x1F41064D0]();
}

uint64_t _AXRetrieveExistingAXUIElementWithElement()
{
  return MEMORY[0x1F41064D8]();
}

uint64_t _AXSAccessibilityPreferenceDomain()
{
  return MEMORY[0x1F4178858]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x1F41788D0]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x1F4178908]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x1F4178968]();
}

uint64_t _AXSAutomationLocalizedStringLookupInfoEnabled()
{
  return MEMORY[0x1F4178988]();
}

uint64_t _AXSAutomationPreferredLocalization()
{
  return MEMORY[0x1F4178998]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x1F4178CC0]();
}

uint64_t _AXSMossdeepEnabled()
{
  return MEMORY[0x1F4178DA8]();
}

uint64_t _AXSVoiceOverTouchCopyLanguageRotorItems()
{
  return MEMORY[0x1F4179108]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1F4179120]();
}

uint64_t _AXSVoiceOverTouchSetEnabledAppTemporaryOverride()
{
  return MEMORY[0x1F4179190]();
}

uint64_t _AXSetApplicationElementHandler()
{
  return MEMORY[0x1F41064E0]();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason()
{
  return MEMORY[0x1F41064E8]();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason()
{
  return MEMORY[0x1F41064F0]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x1F4106380]();
}

uint64_t _AXTraitsAsString()
{
  return MEMORY[0x1F41064F8]();
}

uint64_t _AXUIElementCopyElementAtPositionWithParams()
{
  return MEMORY[0x1F4106500]();
}

uint64_t _AXUIElementCreateAppElementWithPid()
{
  return MEMORY[0x1F4106508]();
}

uint64_t _AXUIElementCreateData()
{
  return MEMORY[0x1F4106510]();
}

uint64_t _AXUIElementCreateWithPIDAndID()
{
  return MEMORY[0x1F4106518]();
}

uint64_t _AXUIElementRegisterServerWithRunLoop()
{
  return MEMORY[0x1F4106520]();
}

uint64_t _AXUIElementRegisterSystemWideServerWithRunLoop()
{
  return MEMORY[0x1F4106528]();
}

uint64_t _AXUIElementSetElementBeingHitTested()
{
  return MEMORY[0x1F4106530]();
}

uint64_t _AXUIElementSetMachPortForNextMessage()
{
  return MEMORY[0x1F4106538]();
}

uint64_t _AXUIElementUnregisterServer()
{
  return MEMORY[0x1F4106540]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1F40D8EA0]();
}

uint64_t _GSEventGetGSEventRecord()
{
  return MEMORY[0x1F411CA30]();
}

uint64_t _UIAXAssignFocusToItem()
{
  return MEMORY[0x1F4102E68]();
}

uint64_t _UIAXElementForAXUIElementRef()
{
  return MEMORY[0x1F4106548]();
}

uint64_t _UIAccessibilitySetBroadcastCallback()
{
  return MEMORY[0x1F4102E78]();
}

uint64_t _UIAccessibilitySetConvertAccessibilityPathToViewCallback()
{
  return MEMORY[0x1F4102E80]();
}

uint64_t _UIAccessibilitySetConvertFrameCallback()
{
  return MEMORY[0x1F4102E88]();
}

uint64_t _UIAccessibilitySetConvertPathCallback()
{
  return MEMORY[0x1F4102E90]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1F4102EB8]();
}

uint64_t _UIConvertPointFromOrientationToOrientation()
{
  return MEMORY[0x1F4102EC8]();
}

uint64_t _UIConvertRectFromOrientationToOrientation()
{
  return MEMORY[0x1F4102ED0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXRuntimeApplicationElement()
{
  return MEMORY[0x1F4106550]();
}

uint64_t __AXStringForVariablesWithVariadics()
{
  return MEMORY[0x1F4106560]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x1F4106388]();
}

uint64_t __UIAccessibilityCastAsProtocol()
{
  return MEMORY[0x1F4106390]();
}

uint64_t __UIAccessibilityGetAssociatedInt()
{
  return MEMORY[0x1F41063A8]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x1F41063B8]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x1F41063C8]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x1F41063F8]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1F4181578](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x1F41815D8](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1F4181628](m, imp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}