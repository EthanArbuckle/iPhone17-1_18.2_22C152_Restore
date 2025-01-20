@interface MGNotificationObserver
- (MGNotificationObserver)initWithType:(int)a3 argument:(id)a4;
- (void)_addBlock:(id)a3;
- (void)_cancelRegistration;
- (void)_removeBlock:(id)a3;
- (void)dealloc;
- (void)invokeBlocks;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
- (void)startDynaStoreMonitoringWithArgument:(id)a3;
@end

@implementation MGNotificationObserver

- (void)startDynaStoreMonitoringWithArgument:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  context.version = 0;
  context.info = self;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
  context.copyDescription = 0;
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle) {
    CFStringRef Identifier = CFBundleGetIdentifier(MainBundle);
  }
  else {
    CFStringRef Identifier = @"com.apple.mobilegestaltlistener";
  }
  if (Identifier) {
    CFStringRef v7 = Identifier;
  }
  else {
    CFStringRef v7 = @"com.apple.mobilegestaltlistener";
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v9 = (NSMutableArray *)SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, (SCDynamicStoreCallBack)sub_1A6ED906C, &context);
  self->_registration._darwinTokens = v9;
  if (v9)
  {
    CFStringRef ComputerName = SCDynamicStoreKeyCreateComputerName(v8);
    v34[0] = ComputerName;
    CFArrayRef v13 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v11, v34, v12, count:1];
    if (ComputerName) {
      CFRelease(ComputerName);
    }
    if (SCDynamicStoreSetNotificationKeys(self->_registration._scPrefs, v13, 0))
    {
      darwinTokens = self->_registration._darwinTokens;
      global_queue = dispatch_get_global_queue(0, 0);
      SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)darwinTokens, global_queue);
    }
    else
    {
      v23 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
      if (v23) {
        v29 = v23 + 1;
      }
      else {
        v29 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
      }
      sub_1A6ED7C4C((uint64_t)v29, 285, @"Failed to register for %@", v24, v25, v26, v27, v28, (char)a3);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = a3;
        _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to register for %@", buf, 0xCu);
      }
      CFRelease(self->_registration._darwinTokens);
      self->_registration._darwinTokens = 0;
    }
  }
  else
  {
    v16 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
    if (v16) {
      v22 = v16 + 1;
    }
    else {
      v22 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
    }
    sub_1A6ED7C4C((uint64_t)v22, 294, @"Failed to create dynamic store", v17, v18, v19, v20, v21, v30);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to create dynamic store", buf, 2u);
    }
  }
}

- (MGNotificationObserver)initWithType:(int)a3 argument:(id)a4
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  v159.receiver = self;
  v159.super_class = (Class)MGNotificationObserver;
  v6 = [(MGNotificationObserver *)&v159 init];
  if (v6)
  {
    v6->_blocks = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v6->_int type = a3;
    CFStringRef v7 = (NSString *)a4;
    v6->_CFIndex argument = v7;
    switch(v6->_type)
    {
      case 1:
        uint64_t v12 = [v7 componentsSeparatedByString:v8];
        v6->_registration._darwinTokens = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v155 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        uint64_t v14 = [v12 countByEnumeratingWithState:v13 objects:(id *)&v155 count:16];
        if (!v14) {
          goto LABEL_48;
        }
        uint64_t v19 = v14;
        uint64_t v20 = *(void *)v156;
        while (1)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v156 != v20) {
              objc_enumerationMutation(v12);
            }
            v22 = *(void **)(*((void *)&v155 + 1) + 8 * i);
            int out_token = -1;
            v23 = (const char *)[v22 v15:v16 v17:v18 UTF8String];
            global_queue = dispatch_get_global_queue(0, 0);
            handler[0] = MEMORY[0x1E4F143A8];
            handler[1] = 3221225472;
            handler[2] = sub_1A6ED9094;
            handler[3] = &unk_1E5CB24F0;
            handler[4] = v6;
            if (notify_register_dispatch(v23, &out_token, global_queue, handler))
            {
              v90 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
              if (v90) {
                v96 = v90 + 1;
              }
              else {
                v96 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
              }
              sub_1A6ED7C4C((uint64_t)v96, 317, @"failed to register for %@ notification", v91, v92, v93, v94, v95, (char)v22);
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.version) = 138412290;
                *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v22;
                _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failed to register for %@ notification", (uint8_t *)&buf, 0xCu);
              }
              long long v151 = 0u;
              long long v152 = 0u;
              long long v149 = 0u;
              long long v150 = 0u;
              darwinTokens = v6->_registration._darwinTokens;
              uint64_t v99 = [darwinTokens countByEnumeratingWithState:v97 objects:v149 count:16];
              if (v99)
              {
                uint64_t v104 = v99;
                uint64_t v105 = *(void *)v150;
                do
                {
                  for (uint64_t j = 0; j != v104; ++j)
                  {
                    if (*(void *)v150 != v105) {
                      objc_enumerationMutation(darwinTokens);
                    }
                    int v107 = [*(void **)(*((void *)&v149 + 1) + 8 * j) intValue];
                    notify_cancel(v107);
                  }
                  uint64_t v104 = [darwinTokens countByEnumeratingWithState:v100 objects:(id *)&v149 count:16];
                }
                while (v104);
              }

              v6->_registration._darwinTokens = 0;
              goto LABEL_90;
            }
            uint64_t v28 = v6->_registration._darwinTokens;
            uint64_t v29 = [NSNumber numberWithInt:v25 out_token:v26 v27];
            [v28 addObject:v30, v29, v31, v32];
          }
          uint64_t v19 = [v12 countByEnumeratingWithState:v15 objects:v162 count:16];
          if (!v19) {
            goto LABEL_48;
          }
        }
      case 2:
        v41 = SCPreferencesCreate(0, @"MobileGestalt", (CFStringRef)a4);
        v6->_registration._darwinTokens = (NSMutableArray *)v41;
        if (v41)
        {
          buf.version = 0;
          buf.info = v6;
          buf.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
          buf.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
          buf.copyDescription = 0;
          SCPreferencesSetCallback(v41, (SCPreferencesCallBack)sub_1A6ED909C, &buf);
          scPrefs = v6->_registration._scPrefs;
          v43 = dispatch_get_global_queue(0, 0);
          SCPreferencesSetDispatchQueue(scPrefs, v43);
          goto LABEL_48;
        }
        v115 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v115) {
          v121 = v115 + 1;
        }
        else {
          v121 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        }
        sub_1A6ED7C4C((uint64_t)v121, 339, @"failed to register for %@ notification", v116, v117, v118, v119, v120, (char)v6->_argument);
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_90;
        }
LABEL_72:
        CFIndex argument = (CFIndex)v6->_argument;
        LODWORD(buf.version) = 138412290;
        *(CFIndex *)((char *)&buf.version + 4) = argument;
        v78 = MEMORY[0x1E4F14500];
        v79 = "failed to register for %@ notification";
        uint32_t v123 = 12;
        goto LABEL_89;
      case 3:
        v44 = [MGFileWatcher alloc];
        v148[0] = MEMORY[0x1E4F143A8];
        v148[1] = 3221225472;
        v148[2] = sub_1A6ED90AC;
        v148[3] = &unk_1E5CB24A8;
        v148[4] = v6;
        uint64_t v47 = [v44 initWithPath:v45 block:^(uint64_t a4, uint64_t v148, uint64_t v46) {
        v6->_registration._darwinTokens = (NSMutableArray *)v47;
        if (v47) {
          goto LABEL_48;
        }
        v48 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v48) {
          v54 = v48 + 1;
        }
        else {
          v54 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        }
        sub_1A6ED7C4C((uint64_t)v54, 359, @"failed to register for %@ notification", v49, v50, v51, v52, v53, (char)v6->_argument);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_72;
        }
        goto LABEL_90;
      case 4:
        v55 = *(void **)(qword_1EB283D08 + 752);
        if (!v55) {
          v55 = sub_1A6ED8170(94, 3);
        }
        v56 = (NSMutableArray *)[v55 v8:v9 v10:v11];
        v6->_registration._darwinTokens = v56;
        if (v56)
        {
          [v56 addObserver:v57 forKeyPath:v58 options:(NSKeyValueObservingOptions)v6 context:(void *)v59];
          goto LABEL_48;
        }
        v124 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v124) {
          v130 = v124 + 1;
        }
        else {
          v130 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        }
        sub_1A6ED7C4C((uint64_t)v130, 370, @"failed to register for notification", v125, v126, v127, v128, v129, v146);
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_90;
        }
        LOWORD(buf.version) = 0;
        v78 = MEMORY[0x1E4F14500];
        v79 = "failed to register for notification";
        goto LABEL_88;
      case 5:
        if (MGGetSInt32Answer() == 4)
        {
          v64 = *(void **)qword_1EB283D08;
          if (!*(void *)qword_1EB283D08) {
            v64 = sub_1A6ED8170(0, 3);
          }
          v65 = (NSMutableArray *)[v64 v60:v61 v62:v62 v63:v63];
          v6->_registration._darwinTokens = v65;
          if (v65)
          {
            [v65 addObserver:v66 forKeyPath:@"currentMode" options:0 context:v6];
            [v6->_registration._darwinTokens v67:v68 v69:v70];
            goto LABEL_48;
          }
          v138 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
          if (v138) {
            v144 = v138 + 1;
          }
          else {
            v144 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
          }
          sub_1A6ED7C4C((uint64_t)v144, 383, @"failed to register for notification", v139, v140, v141, v142, v143, v146);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.version) = 0;
            v78 = MEMORY[0x1E4F14500];
            v79 = "failed to register for notification";
            goto LABEL_88;
          }
        }
        else
        {
          v108 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
          if (v108) {
            v114 = v108 + 1;
          }
          else {
            v114 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
          }
          sub_1A6ED7C4C((uint64_t)v114, 395, @"can't observe display mode changes", v109, v110, v111, v112, v113, v146);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.version) = 0;
            v78 = MEMORY[0x1E4F14500];
            v79 = "can't observe display mode changes";
            goto LABEL_88;
          }
        }
        goto LABEL_90;
      case 6:
        v71 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v71) {
          v77 = v71 + 1;
        }
        else {
          v77 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        }
        sub_1A6ED7C4C((uint64_t)v77, 403, @"MGNotificationTypeSWBehavior not supported", v72, v73, v74, v75, v76, v146);
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_90;
        }
        LOWORD(buf.version) = 0;
        v78 = MEMORY[0x1E4F14500];
        v79 = "MGNotificationTypeSWBehavior not supported";
        goto LABEL_88;
      case 7:
        v80 = *(uint64_t (**)(uint64_t, __CFString *, dispatch_queue_global_t, void))(qword_1EB283D08 + 152);
        if (!v80) {
          v80 = (uint64_t (*)(uint64_t, __CFString *, dispatch_queue_global_t, void))sub_1A6ED8170(19, 2);
        }
        uint64_t v81 = *MEMORY[0x1E4F1CF80];
        dispatch_queue_global_t v82 = dispatch_get_global_queue(0, 0);
        v83 = (NSMutableArray *)v80(v81, @"com.apple.mobilegestalt", v82, 0);
        v6->_registration._darwinTokens = v83;
        if (v83)
        {
          CFRetain(v83);
          uint64_t v84 = qword_1EB283D08;
          v85 = *(void (**)(NSMutableArray *, uint64_t, void *))(qword_1EB283D08 + 192);
          if (!v85)
          {
            v85 = (void (*)(NSMutableArray *, uint64_t, void *))sub_1A6ED8170(24, 2);
            uint64_t v84 = qword_1EB283D08;
          }
          v86 = v6->_registration._darwinTokens;
          v87 = *(uint64_t **)(v84 + 600);
          if (!v87) {
            v87 = (uint64_t *)sub_1A6ED8170(75, 1);
          }
          uint64_t v88 = *v87;
          v147[0] = MEMORY[0x1E4F143A8];
          v147[1] = 3221225472;
          v147[2] = sub_1A6ED90B4;
          v147[3] = &unk_1E5CB2518;
          v147[4] = v6;
          v85(v86, v88, v147);
LABEL_48:
          if (v6->_type != -1) {
            v89 = v6;
          }
        }
        else
        {
          v131 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
          if (v131) {
            v137 = v131 + 1;
          }
          else {
            v137 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
          }
          sub_1A6ED7C4C((uint64_t)v137, 412, @"failed to connect to CTServer", v132, v133, v134, v135, v136, v146);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.version) = 0;
            v78 = MEMORY[0x1E4F14500];
            v79 = "failed to connect to CTServer";
LABEL_88:
            uint32_t v123 = 2;
LABEL_89:
            _os_log_impl(&dword_1A6ED5000, v78, OS_LOG_TYPE_DEFAULT, v79, (uint8_t *)&buf, v123);
          }
LABEL_90:
          v6->_int type = -1;
        }
        break;
      case 8:
        [v6 startDynaStoreMonitoringWithArgument:v8, (uint64_t)v7, v10, v11];
        goto LABEL_48;
      default:
        id v33 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
        if (v33) {
          v39 = v33 + 1;
        }
        else {
          v39 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
        }
        sub_1A6ED7C4C((uint64_t)v39, 424, @"can't create observer of type %d", v34, v35, v36, v37, v38, v6->_type);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int type = v6->_type;
          LODWORD(buf.version) = 67109120;
          HIDWORD(buf.version) = type;
          _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "can't create observer of type %d", (uint8_t *)&buf, 8u);
        }
        goto LABEL_48;
    }
  }
  return v6;
}

- (void)_addBlock:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1EB283CF0);
  blocks = self->_blocks;

  [blocks addObject:v5 withKey:a3 withValue:v6 withValue:v7];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MGNotificationObserver;
  [(MGNotificationObserver *)&v3 dealloc];
}

- (void)invokeBlocks
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A6ED8F70;
  block[3] = &unk_1E5CB24A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_1EB283CF0, block);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (void)_cancelRegistration
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1EB283CF0);
  int type = self->_type;
  switch(type)
  {
    case 1:
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      darwinTokens = self->_registration._darwinTokens;
      uint64_t v9 = [darwinTokens countByEnumeratingWithState:v3 objects:v43 count:16];
      if (v9)
      {
        uint64_t v14 = v9;
        uint64_t v15 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v38 != v15) {
              objc_enumerationMutation(darwinTokens);
            }
            int v17 = [[*(void **)(*((void *)&v37 + 1) + 8 * i) performSelector:v10 withObject:v11 withObject:v12 withObject:v13] intValue];
            notify_cancel(v17);
          }
          uint64_t v14 = [darwinTokens countByEnumeratingWithState:v10 objects:v43 count:16];
        }
        while (v14);
      }

      self->_registration._darwinTokens = 0;
      goto LABEL_15;
    case 2:
      p_registration = &self->_registration;
      uint64_t v26 = self->_registration._darwinTokens;
      if (!v26) {
        goto LABEL_38;
      }
      SCPreferencesSetDispatchQueue((SCPreferencesRef)v26, 0);
      SCPreferencesSetCallback(p_registration->_scPrefs, 0, 0);
      goto LABEL_36;
    case 3:
      p_registration = &self->_registration;
      uint64_t v28 = self->_registration._darwinTokens;
      if (!v28) {
        goto LABEL_38;
      }
      [v28 v3:v4 v5:v6];
      uint64_t v29 = p_registration->_darwinTokens;
      goto LABEL_26;
    case 4:
      p_registration = &self->_registration;
      char v30 = self->_registration._darwinTokens;
      if (!v30) {
        goto LABEL_38;
      }
      [v30 removeObserver:self forKeyPath:v5 context:v6];
      goto LABEL_25;
    case 5:
      p_registration = &self->_registration;
      uint64_t v31 = self->_registration._darwinTokens;
      if (!v31) {
        goto LABEL_38;
      }
      [v31 removeObserver:v3 forKeyPath:@"currentMode"];
LABEL_25:
      uint64_t v29 = self->_registration._darwinTokens;
LABEL_26:

      goto LABEL_37;
    case 6:
      p_registration = &self->_registration;
      goto LABEL_37;
    case 7:
      p_registration = &self->_registration;
      SCPreferencesRef scPrefs = self->_registration._scPrefs;
      if (!scPrefs) {
        goto LABEL_38;
      }
      uint64_t v33 = qword_1EB283D08;
      uint64_t v34 = *(void (**)(SCPreferencesRef, void))(qword_1EB283D08 + 200);
      if (!v34)
      {
        uint64_t v34 = (void (*)(SCPreferencesRef, void))sub_1A6ED8170(25, 2);
        SCPreferencesRef scPrefs = (SCPreferencesRef)p_registration->_darwinTokens;
        uint64_t v33 = qword_1EB283D08;
      }
      uint64_t v35 = *(void **)(v33 + 600);
      if (!v35) {
        uint64_t v35 = sub_1A6ED8170(75, 1);
      }
      v34(scPrefs, *v35);
      goto LABEL_36;
    case 8:
      p_registration = &self->_registration;
      uint64_t v36 = self->_registration._darwinTokens;
      if (!v36) {
        goto LABEL_38;
      }
      SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)v36, 0);
LABEL_36:
      CFRelease(p_registration->_darwinTokens);
LABEL_37:
      p_registration->_darwinTokens = 0;
LABEL_38:
      self->_int type = -1;
LABEL_39:

      return;
    default:
      uint64_t v18 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
      if (v18) {
        uint64_t v24 = v18 + 1;
      }
      else {
        uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
      }
      sub_1A6ED7C4C((uint64_t)v24, 519, @"can't cancel registration of type %d", v19, v20, v21, v22, v23, self->_type);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v25 = self->_type;
        *(_DWORD *)SCPreferencesContext buf = 67109120;
        int v42 = v25;
        _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "can't cancel registration of type %d", buf, 8u);
      }
LABEL_15:
      self->_int type = -1;
      if (type == -1) {
        return;
      }
      goto LABEL_39;
  }
}

- (void)_removeBlock:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1EB283CF0);
  [self->_blocks removeObject:v5 atIndex:(uint64_t)a3];
  if (!objc_msgSend_count(self->_blocks, v8, v9, v10, v11))
  {
    uint64_t v16 = [NSNumber numberWithInt:v12 type:self->_type v14 v15];
    CFIndex argument = self->_argument;
    v28[0] = v16;
    v28[1] = argument;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18, v28, v19, count:2];
    [objc_msgSend_removeObjectForKey_((void *)qword_1EB283CE0, v21, v20, v22, v23)];
    [self _cancelRegistration:v24 v25:v25 v26:v26 v27:v27];
  }
  if (!objc_msgSend_count((void *)qword_1EB283CE0, v12, v13, v14, v15))
  {

    qword_1EB283CE0 = 0;
  }
}

@end