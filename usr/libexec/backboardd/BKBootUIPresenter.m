@interface BKBootUIPresenter
+ (id)sharedInstance;
- (BKBootUIPresenter)initWithSystemAppSentinel:(id)a3 alternateSystemAppManager:(id)a4 firstBootDetector:(id)a5 bootUIOverlayVendor:(id)a6 renderOverlayManager:(id)a7;
- (BKDisplayRenderOverlay)overlay;
- (BKDisplayRenderOverlay)underlay;
- (BOOL)isShowingBootUI;
- (BOOL)sustainOverlayForReason:(id)a3;
- (NSString)description;
- (SWSystemActivityAssertion)systemActivityAssertion;
- (void)_queue_acquireActivityAssertionForReason:(id)a3 generation:(unint64_t)a4 continuation:(id)a5;
- (void)_queue_addOverlayForReason:(id)a3;
- (void)_queue_addUnderlay;
- (void)_queue_continueAddingOverlayForReason:(id)a3 generation:(unint64_t)a4;
- (void)_queue_removeOverlayWithAnimationSettings:(id)a3;
- (void)_queue_removeUnderlay;
- (void)_queue_setScreenOwnerPID:(int)a3;
- (void)_queue_updateOverlayForReason:(id)a3;
- (void)_sync;
- (void)dealloc;
- (void)dismissOverlayWithAnimationSettings:(id)a3 requstedByPID:(int)a4;
- (void)firstBootDetectorDidFinishFirstBoot:(id)a3;
- (void)setOverlay:(id)a3;
- (void)setSystemActivityAssertion:(id)a3;
- (void)setUnderlay:(id)a3;
- (void)systemShellChangedWithPrimary:(id)a3;
- (void)systemShellDidFinishLaunching:(id)a3;
- (void)unsustainOverlayForReason:(id)a3;
@end

@implementation BKBootUIPresenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenOwnerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_systemActivityAssertion, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_underlay, 0);
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_renderOverlayManager, 0);
  objc_storeStrong((id *)&self->_firstBootDetector, 0);
  objc_storeStrong((id *)&self->_systemAppSentinel, 0);
  objc_storeStrong((id *)&self->_bootUIOverlayVendor, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setOverlay:(id)a3
{
}

- (BKDisplayRenderOverlay)overlay
{
  return self->_overlay;
}

- (void)setUnderlay:(id)a3
{
}

- (BKDisplayRenderOverlay)underlay
{
  return self->_underlay;
}

- (void)setSystemActivityAssertion:(id)a3
{
}

- (SWSystemActivityAssertion)systemActivityAssertion
{
  return self->_systemActivityAssertion;
}

- (void)_queue_removeUnderlay
{
  BSDispatchQueueAssert();
  if (self->_underlay)
  {
    v3 = sub_10005F9DC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_queue_removeUnderlay: Removing the underlay", v5, 2u);
    }

    [(BKDisplayRenderOverlayManager *)self->_renderOverlayManager removeOverlay:self->_underlay withAnimationSettings:0];
    underlay = self->_underlay;
    self->_underlay = 0;
  }
}

- (void)_queue_addUnderlay
{
  BSDispatchQueueAssert();
  v3 = +[BKSDefaults localDefaults];
  unsigned int v4 = [v3 hideAppleLogoOnLaunch];

  if (v4)
  {
    v5 = sub_10005F9DC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "addUnderlay: Not showing the boot UI underlay because we were told to hide it", buf, 2u);
    }
  }
  else
  {
    underlay = self->_underlay;
    v7 = sub_10005F9DC();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (underlay)
    {
      if (v8)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "addUnderlay: Underlay already in place", v12, 2u);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "addUnderlay:  Adding the underlay", v13, 2u);
      }

      LODWORD(v9) = -1.0;
      v10 = [(BKBootUIOverlayVendor *)self->_bootUIOverlayVendor currentOverlayWithLevel:v9];
      v11 = self->_underlay;
      self->_underlay = v10;

      [(BKDisplayRenderOverlayManager *)self->_renderOverlayManager applyOverlay:self->_underlay withAnimationSettings:0];
    }
  }
}

- (void)_queue_addOverlayForReason:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssert();
  unint64_t addOverlayGeneration = self->_addOverlayGeneration;
  if (addOverlayGeneration + 1 > 1) {
    unint64_t v7 = addOverlayGeneration + 1;
  }
  else {
    unint64_t v7 = 1;
  }
  self->_unint64_t addOverlayGeneration = v7;
  BOOL v8 = +[BKSDefaults localDefaults];
  unsigned int v9 = [v8 hideAppleLogoOnLaunch];

  if (v9)
  {
    v10 = sub_10005F9DC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v20 = v7;
      *(_WORD *)&v20[4] = 2114;
      *(void *)&v20[6] = v5;
      v11 = "addOverlay(%d-%{public}@): Not showing the boot UI overlay because we were told to hide it";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0x12u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (self->_systemActivityAssertion)
  {
    v10 = sub_10005F9DC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v20 = v7;
      *(_WORD *)&v20[4] = 2114;
      *(void *)&v20[6] = v5;
      v11 = "addOverlay(%d-%{public}@): Overlay pending or already in place";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (self->_overlay)
  {
    v12 = +[NSString stringWithFormat:@"overlay should have been removed"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromSelector(a2);
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      *(void *)v20 = v13;
      *(_WORD *)&v20[8] = 2114;
      *(void *)&v20[10] = v15;
      __int16 v21 = 2048;
      v22 = self;
      __int16 v23 = 2114;
      CFStringRef v24 = @"BKBootUIPresenter.m";
      __int16 v25 = 1024;
      int v26 = 373;
      __int16 v27 = 2114;
      v28 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009C864);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009C86C;
  v16[3] = &unk_1000F8F88;
  v16[4] = self;
  id v17 = v5;
  unint64_t v18 = v7;
  [(BKBootUIPresenter *)self _queue_acquireActivityAssertionForReason:v17 generation:v7 continuation:v16];

LABEL_12:
}

- (void)_queue_acquireActivityAssertionForReason:(id)a3 generation:(unint64_t)a4 continuation:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  BSDispatchQueueAssert();
  id v11 = [objc_alloc((Class)SWSystemActivityAssertion) initWithIdentifier:@"BKBootUIPresenter"];
  if (!v11)
  {
    v20 = +[NSString stringWithFormat:@"nil activity assertion"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = NSStringFromSelector(a2);
      v22 = (objc_class *)objc_opt_class();
      __int16 v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      *(void *)v31 = v21;
      *(_WORD *)&v31[8] = 2114;
      *(void *)&v31[10] = v23;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v34 = 2114;
      CFStringRef v35 = @"BKBootUIPresenter.m";
      __int16 v36 = 1024;
      int v37 = 339;
      __int16 v38 = 2114;
      v39 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009CCDCLL);
  }
  v12 = v11;
  v13 = sub_10005F9DC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v31 = a4;
    *(_WORD *)&v31[4] = 2114;
    *(void *)&v31[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "addOverlay(%d-%{public}@): waiting for activity assertion", buf, 0x12u);
  }

  BSContinuousMachTimeNow();
  uint64_t v15 = v14;
  objc_storeStrong((id *)&self->_systemActivityAssertion, v12);
  systemActivityAssertion = self->_systemActivityAssertion;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10009CCE4;
  v24[3] = &unk_1000F8F38;
  uint64_t v29 = v15;
  id v27 = v10;
  unint64_t v28 = a4;
  id v25 = v9;
  id v26 = v12;
  id v17 = v12;
  id v18 = v10;
  id v19 = v9;
  [(SWSystemActivityAssertion *)systemActivityAssertion acquireWithTimeout:v24 handler:16.0];
}

- (void)_queue_continueAddingOverlayForReason:(id)a3 generation:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  BSDispatchQueueAssert();
  systemActivityAssertion = self->_systemActivityAssertion;
  BOOL v8 = sub_10005F9DC();
  id v9 = v8;
  if (systemActivityAssertion)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109378;
      int v15 = v4;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "addOverlay(%d-%{public}@): Adding the overlay", (uint8_t *)&v14, 0x12u);
    }

    LODWORD(v10) = 1161523200;
    id v11 = [(BKBootUIOverlayVendor *)self->_bootUIOverlayVendor currentOverlayWithLevel:v10];
    overlay = self->_overlay;
    self->_overlay = v11;

    [(BKDisplayRenderOverlay *)self->_overlay setAnimates:1];
    v13 = [(BKDisplayRenderOverlay *)self->_overlay descriptor];
    [v13 _setInterstitial:1];

    [(BKDisplayRenderOverlayManager *)self->_renderOverlayManager applyOverlay:self->_overlay withAnimationSettings:0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 67109378;
      int v15 = v4;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "addOverlay(%d-%{public}@): canceled adding overlay", (uint8_t *)&v14, 0x12u);
    }
  }
}

- (void)_queue_removeOverlayWithAnimationSettings:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert();
  if (self->_systemActivityAssertion)
  {
    id v5 = sub_10005F9DC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removeOverlayWithAnimationSettings: Removing the overlay", v9, 2u);
    }

    overlay = self->_overlay;
    if (overlay)
    {
      [(BKDisplayRenderOverlayManager *)self->_renderOverlayManager removeOverlay:overlay withAnimationSettings:v4];
      unint64_t v7 = self->_overlay;
      self->_overlay = 0;
    }
    [(SWSystemActivityAssertion *)self->_systemActivityAssertion invalidate];
    systemActivityAssertion = self->_systemActivityAssertion;
    self->_systemActivityAssertion = 0;
  }
}

- (void)_queue_updateOverlayForReason:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert();
  uint64_t v5 = [(BKSystemShellSentinel *)self->_systemAppSentinel systemShellState];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = *(id *)(v5 + 16);
    if (*(unsigned char *)(v6 + 8))
    {
      BOOL v8 = sub_10005F9DC();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)v54 = v7;
      id v9 = "updateOverlay: Waiting for alternate shells -- (%{public}@) is temporary screen owner";
      double v10 = v8;
      uint32_t v11 = 12;
      goto LABEL_5;
    }
    uint64_t v48 = v6;
    p_int screenOwnerPID = &self->_screenOwnerPID;
    if (self->_screenOwnerPID > 0)
    {
      v13 = *(void **)(v48 + 24);
LABEL_8:
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      BOOL v8 = v13;
      id v14 = [v8 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v50;
        id v47 = v4;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v50 != v16) {
              objc_enumerationMutation(v8);
            }
            id v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            int v19 = *p_screenOwnerPID;
            if (v19 == [v18 pid])
            {
              id v27 = sub_10005F9DC();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                int v28 = *p_screenOwnerPID;
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v54 = v28;
                *(_WORD *)&v54[4] = 2114;
                *(void *)&v54[6] = v18;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "updateOverlay: pid:%d still exists (%{public}@)", buf, 0x12u);
              }

              id v29 = v18;
              id v7 = v29;
              id v4 = v47;
              goto LABEL_25;
            }
            screenOwnerBundleIdentifier = self->_screenOwnerBundleIdentifier;
            if (screenOwnerBundleIdentifier)
            {
              __int16 v21 = [v18 bundleIdentifier];
              unsigned int v22 = [(NSString *)screenOwnerBundleIdentifier isEqual:v21];

              if (v22)
              {
                __int16 v23 = sub_10005F9DC();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)v54 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "updateOverlay: New instance of owner shell (%{public}@)", buf, 0xCu);
                }

                id v24 = v18;
                self->_int screenOwnerPID = [v24 pid];
                id v25 = [v24 bundleIdentifier];
                id v26 = self->_screenOwnerBundleIdentifier;
                self->_screenOwnerBundleIdentifier = v25;

                id v7 = v24;
              }
            }
          }
          id v15 = [v8 countByEnumeratingWithState:&v49 objects:v55 count:16];
          id v4 = v47;
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_25:

      v30 = self->_screenOwnerBundleIdentifier;
      v31 = [v7 bundleIdentifier];
      LOBYTE(v30) = [(NSString *)v30 isEqual:v31];

      if (v30)
      {
        uint64_t v6 = v48;
      }
      else
      {
        __int16 v32 = sub_10005F9DC();
        uint64_t v6 = v48;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = self->_screenOwnerBundleIdentifier;
          __int16 v34 = [v7 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          *(void *)v54 = v33;
          *(_WORD *)&v54[8] = 2114;
          *(void *)&v54[10] = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "updateOverlay: Screen owner missing (expected:%{public}@) got:%{public}@", buf, 0x16u);
        }
        self->_int screenOwnerPID = -1;
        CFStringRef v35 = self->_screenOwnerBundleIdentifier;
        self->_screenOwnerBundleIdentifier = 0;
      }
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v48 = 0;
    id v7 = 0;
    p_int screenOwnerPID = &self->_screenOwnerPID;
    if (self->_screenOwnerPID > 0)
    {
      v13 = 0;
      goto LABEL_8;
    }
  }
  BOOL v8 = sub_10005F9DC();
  uint64_t v6 = v48;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v9 = "updateOverlay: No explicit screen owner";
    double v10 = v8;
    uint32_t v11 = 2;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
  }
LABEL_34:

  int screenOwnerPID = self->_screenOwnerPID;
  unsigned int v37 = [v7 pid];
  if (v7)
  {
    if (v6) {
      __int16 v38 = *(void **)(v6 + 32);
    }
    else {
      __int16 v38 = 0;
    }
    id v39 = v38;
    unsigned int v40 = [v39 containsObject:v7];
  }
  else
  {
    unsigned int v40 = 0;
  }
  if (screenOwnerPID != v37 && v40 == 0)
  {
    [(BKBootUIPresenter *)self _queue_addOverlayForReason:v4];
  }
  else
  {
    v42 = sub_10005F9DC();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v43 = [v7 pid];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v54 = v43;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = screenOwnerPID == v37;
      *(_WORD *)&v54[10] = 1024;
      *(_DWORD *)&v54[12] = v40;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "updateOverlay: pid:%d explicitlyDismissed:%{BOOL}u finishedStartup:%{BOOL}u", buf, 0x14u);
    }

    if (self->_isOverlaySustained)
    {
      uint64_t v44 = v6;
      self->_dismissSustainedOverlayIfUnsustained = 1;
      v45 = sub_10005F9DC();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v54 = v4;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "updateOverlay: Not dismissing because overlay has been sustained by the system app: %{public}@ ", buf, 0xCu);
      }

      uint64_t v6 = v44;
    }
    else
    {
      v46 = sub_10005F9DC();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v54 = v4;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "updateOverlay: Dismissing overlay: %{public}@ ", buf, 0xCu);
      }

      [(BKBootUIPresenter *)self _queue_removeOverlayWithAnimationSettings:0];
    }
  }
}

- (void)_queue_setScreenOwnerPID:(int)a3
{
  self->_int screenOwnerPID = a3;
  [(BKSystemShellSentinel *)self->_systemAppSentinel systemShells];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "pid", (void)v18) == a3)
        {
          v13 = [v10 bundleIdentifier];
          id v14 = (NSString *)[v13 copy];
          screenOwnerBundleIdentifier = self->_screenOwnerBundleIdentifier;
          self->_screenOwnerBundleIdentifier = v14;

          v12 = (NSString *)v5;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BSBundleIDForPID();
  uint32_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = self->_screenOwnerBundleIdentifier;
  self->_screenOwnerBundleIdentifier = v11;
LABEL_11:

  uint64_t v16 = sub_10005F9DC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = self->_screenOwnerBundleIdentifier;
    *(_DWORD *)buf = 67109378;
    int v23 = a3;
    __int16 v24 = 2114;
    id v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "screen owner is now pid:%d (%{public}@)", buf, 0x12u);
  }
}

- (void)_sync
{
}

- (void)systemShellChangedWithPrimary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D8D8;
  v7[3] = &unk_1000F8E50;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009DA4C;
  v7[3] = &unk_1000F8E50;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)firstBootDetectorDidFinishFirstBoot:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009DBC0;
  v7[3] = &unk_1000F8E50;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)unsustainOverlayForReason:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009DD70;
  v7[3] = &unk_1000F8E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)sustainOverlayForReason:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009DF60;
  block[3] = &unk_1000F8EF0;
  block[4] = self;
  id v9 = v4;
  double v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)dismissOverlayWithAnimationSettings:(id)a3 requstedByPID:(int)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009E128;
  block[3] = &unk_1000F8EC8;
  int v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (BOOL)isShowingBootUI
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009E2F8;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)description
{
  char v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [(BKDisplayRenderOverlay *)self->_overlay succinctDescription];
  id v5 = [v3 appendObject:v4 withName:@"_overlay" skipIfNil:1];

  uint64_t v6 = [(BKDisplayRenderOverlay *)self->_underlay succinctDescription];
  id v7 = [v3 appendObject:v6 withName:@"_underlay" skipIfNil:1];

  uint64_t v8 = [v3 build];

  return (NSString *)v8;
}

- (void)dealloc
{
  if (self->_systemActivityAssertion)
  {
    id v5 = +[NSString stringWithFormat:@"Must dismiss overlay before releasing"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      long long v19 = v6;
      __int16 v20 = 2114;
      long long v21 = v8;
      __int16 v22 = 2048;
      int v23 = self;
      __int16 v24 = 2114;
      CFStringRef v25 = @"BKBootUIPresenter.m";
      __int16 v26 = 1024;
      int v27 = 105;
      __int16 v28 = 2114;
      id v29 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009E57CLL);
  }
  if (self->_overlay)
  {
    char v9 = +[NSString stringWithFormat:@"Must dismiss overlay before releasing"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v10 = NSStringFromSelector(a2);
      int v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      long long v19 = v10;
      __int16 v20 = 2114;
      long long v21 = v12;
      __int16 v22 = 2048;
      int v23 = self;
      __int16 v24 = 2114;
      CFStringRef v25 = @"BKBootUIPresenter.m";
      __int16 v26 = 1024;
      int v27 = 106;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009E668);
  }
  if (self->_underlay)
  {
    uint64_t v13 = +[NSString stringWithFormat:@"Must dismiss underlay before releasing"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      char v14 = NSStringFromSelector(a2);
      id v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      long long v19 = v14;
      __int16 v20 = 2114;
      long long v21 = v16;
      __int16 v22 = 2048;
      int v23 = self;
      __int16 v24 = 2114;
      CFStringRef v25 = @"BKBootUIPresenter.m";
      __int16 v26 = 1024;
      int v27 = 107;
      __int16 v28 = 2114;
      id v29 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009E754);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v17.receiver = self;
  v17.super_class = (Class)BKBootUIPresenter;
  [(BKBootUIPresenter *)&v17 dealloc];
}

- (BKBootUIPresenter)initWithSystemAppSentinel:(id)a3 alternateSystemAppManager:(id)a4 firstBootDetector:(id)a5 bootUIOverlayVendor:(id)a6 renderOverlayManager:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v37.receiver = self;
  v37.super_class = (Class)BKBootUIPresenter;
  uint64_t v16 = [(BKBootUIPresenter *)&v37 init];
  objc_super v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_systemAppSentinel, a3);
    objc_storeStrong((id *)&v17->_bootUIOverlayVendor, a6);
    objc_storeStrong((id *)&v17->_renderOverlayManager, a7);
    objc_storeStrong((id *)&v17->_firstBootDetector, a5);
    long long v18 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v18);
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)SerialWithQoS;

    v17->_int screenOwnerPID = -1;
    [(BKFirstBootDetector *)v17->_firstBootDetector addObserver:v17];
    uint64_t v22 = [(BKSystemShellSentinel *)v17->_systemAppSentinel addSystemShellObserver:v17 reason:@"BootUIPresenter"];
    systemShellObserving = v17->_systemShellObserving;
    v17->_systemShellObserving = (BSInvalidatable *)v22;

    __int16 v24 = +[BKSDefaults localDefaults];
    CFStringRef v25 = +[NSString stringWithUTF8String:"hideAppleLogoOnLaunch"];
    __int16 v26 = v17->_queue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10009E9C4;
    v34[3] = &unk_1000F8E50;
    id v35 = v24;
    int v27 = v17;
    __int16 v36 = v27;
    id v28 = v24;
    id v29 = [v28 observeDefault:v25 onQueue:v26 withBlock:v34];

    v30 = v17->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009EA20;
    block[3] = &unk_1000F8E78;
    v33 = v27;
    dispatch_sync(v30, block);
  }
  return v17;
}

+ (id)sharedInstance
{
  if (qword_1001231A8 != -1) {
    dispatch_once(&qword_1001231A8, &stru_1000F8E28);
  }
  v2 = (void *)qword_1001231A0;

  return v2;
}

@end