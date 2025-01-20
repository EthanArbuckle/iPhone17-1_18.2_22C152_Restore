@interface NFSettingsNotification
- (id)_getLocalizedText:(id)a3 withBundle:(id)a4;
- (void)_requestUserNotificationWithCompletion:(id)a3 popupInterval:(double)a4;
@end

@implementation NFSettingsNotification

- (id)_getLocalizedText:(id)a3 withBundle:(id)a4
{
  v7 = (__CFString *)a3;
  id v8 = a4;
  v9 = v8;
  if (!v8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v54 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v58 = 45;
      if (isMetaClass) {
        uint64_t v58 = 43;
      }
      v54(3, "%c[%{public}s %{public}s]:%i Failed to get bundle", v58, ClassName, Name, 44);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v59 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = object_getClass(self);
      if (class_isMetaClass(v60)) {
        int v61 = 43;
      }
      else {
        int v61 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v65 = v61;
      __int16 v66 = 2082;
      v67 = object_getClassName(self);
      __int16 v68 = 2082;
      v69 = sel_getName(a2);
      __int16 v70 = 1024;
      int v71 = 44;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get bundle", buf, 0x22u);
    }

    goto LABEL_45;
  }
  if (!v7) {
    v7 = @"NFC_RADIO_DISABLED_TITLE";
  }
  v10 = [v8 localizedStringForKey:v7 value:@"Translation missing" table:@"LowPowerMode_NFC_Localizable"];
  if ([v10 isEqualToString:@"Translation missing"])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFLogGetLogger();
    if (v11)
    {
      v12 = (void (*)(uint64_t, const char *, ...))v11;
      v13 = object_getClass(self);
      BOOL v14 = class_isMetaClass(v13);
      v15 = object_getClassName(self);
      v16 = sel_getName(a2);
      v17 = [v9 localizations];
      uint64_t v18 = 45;
      if (v14) {
        uint64_t v18 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i Available locs are  %@", v18, v15, v16, 54, v17);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      v22 = object_getClassName(self);
      v23 = sel_getName(a2);
      v24 = [v9 localizations];
      *(_DWORD *)buf = 67110146;
      int v65 = v21;
      __int16 v66 = 2082;
      v67 = v22;
      __int16 v68 = 2082;
      v69 = v23;
      __int16 v70 = 1024;
      int v71 = 54;
      __int16 v72 = 2112;
      v73 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Available locs are  %@", buf, 0x2Cu);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v25 = NFLogGetLogger();
    if (v25)
    {
      v26 = (void (*)(uint64_t, const char *, ...))v25;
      v27 = object_getClass(self);
      BOOL v28 = class_isMetaClass(v27);
      v29 = object_getClassName(self);
      v30 = sel_getName(a2);
      v31 = [v9 preferredLocalizations];
      uint64_t v32 = 45;
      if (v28) {
        uint64_t v32 = 43;
      }
      v26(3, "%c[%{public}s %{public}s]:%i Prefered loc is %@", v32, v29, v30, 55, v31);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = object_getClass(self);
      if (class_isMetaClass(v34)) {
        int v35 = 43;
      }
      else {
        int v35 = 45;
      }
      v36 = object_getClassName(self);
      v37 = sel_getName(a2);
      v38 = [v9 preferredLocalizations];
      *(_DWORD *)buf = 67110146;
      int v65 = v35;
      __int16 v66 = 2082;
      v67 = v36;
      __int16 v68 = 2082;
      v69 = v37;
      __int16 v70 = 1024;
      int v71 = 55;
      __int16 v72 = 2112;
      v73 = v38;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Prefered loc is %@", buf, 0x2Cu);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v39 = NFLogGetLogger();
    if (v39)
    {
      v40 = (void (*)(uint64_t, const char *, ...))v39;
      v41 = object_getClass(self);
      BOOL v42 = class_isMetaClass(v41);
      v43 = object_getClassName(self);
      v44 = sel_getName(a2);
      v45 = +[NSLocale preferredLanguages];
      uint64_t v46 = 45;
      if (v42) {
        uint64_t v46 = 43;
      }
      v40(3, "%c[%{public}s %{public}s]:%i Current loc is %@", v46, v43, v44, 56, v45);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = object_getClass(self);
      if (class_isMetaClass(v48)) {
        int v49 = 43;
      }
      else {
        int v49 = 45;
      }
      v50 = object_getClassName(self);
      v51 = sel_getName(a2);
      v52 = +[NSLocale preferredLanguages];
      *(_DWORD *)buf = 67110146;
      int v65 = v49;
      __int16 v66 = 2082;
      v67 = v50;
      __int16 v68 = 2082;
      v69 = v51;
      __int16 v70 = 1024;
      int v71 = 56;
      __int16 v72 = 2112;
      v73 = v52;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Current loc is %@", buf, 0x2Cu);
    }
  }
  if (!v10)
  {
LABEL_45:
    v7 = v7;
    v10 = v7;
  }

  return v10;
}

- (void)_requestUserNotificationWithCompletion:(id)a3 popupInterval:(double)a4
{
  v7 = (void (**)(id, id, void))a3;
  SInt32 error = 0;
  id v8 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/NearField.framework"];
  [v8 load];
  v115[0] = kCFUserNotificationAlertHeaderKey;
  v9 = [(NFSettingsNotification *)self _getLocalizedText:@"NFC_RADIO_DISABLED_TITLE" withBundle:v8];
  v116[0] = v9;
  v115[1] = kCFUserNotificationAlertMessageKey;
  v10 = [(NFSettingsNotification *)self _getLocalizedText:@"NFC_RADIO_DISABLED_GOTO_SETTINGS" withBundle:v8];
  v116[1] = v10;
  v115[2] = kCFUserNotificationDefaultButtonTitleKey;
  uint64_t v11 = [(NFSettingsNotification *)self _getLocalizedText:@"NFC_RADIO_DISABLED_OK" withBundle:v8];
  v116[2] = v11;
  v115[3] = kCFUserNotificationAlternateButtonTitleKey;
  v12 = [(NFSettingsNotification *)self _getLocalizedText:@"NFC_RADIO_DISABLED_CANCEL" withBundle:v8];
  v115[4] = kCFUserNotificationAlertTopMostKey;
  v116[3] = v12;
  v116[4] = &__kCFBooleanTrue;
  v13 = &CFUserNotificationCreate_ptr;
  CFDictionaryRef v14 = +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:5];

  [v8 unload];
  v15 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v14);
  v16 = v15;
  if (!v15 || error)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v34 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v39 = 45;
      if (isMetaClass) {
        uint64_t v39 = 43;
      }
      v34(3, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", v39, ClassName, Name, 87, error);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = object_getClass(self);
      if (class_isMetaClass(v41)) {
        int v42 = 43;
      }
      else {
        int v42 = 45;
      }
      v43 = object_getClassName(self);
      v44 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v102 = v42;
      __int16 v103 = 2082;
      v104 = v43;
      __int16 v105 = 2082;
      v106 = v44;
      __int16 v107 = 1024;
      int v108 = 87;
      __int16 v109 = 1024;
      LODWORD(v110) = error;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", buf, 0x28u);
    }

    id v45 = objc_alloc((Class)NSError);
    uint64_t v46 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v113 = NSLocalizedDescriptionKey;
    v47 = +[NSString stringWithUTF8String:"No resources"];
    v114 = v47;
    v48 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
    id v49 = [v45 initWithDomain:v46 code:34 userInfo:v48];
    v7[2](v7, v49, 0);
  }
  else
  {
    CFOptionFlags responseFlags = 0;
    if (CFUserNotificationReceiveResponse(v15, a4, &responseFlags))
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v17 = NFLogGetLogger();
      if (v17)
      {
        uint64_t v18 = (void (*)(uint64_t, const char *, ...))v17;
        v19 = object_getClass(self);
        BOOL v20 = class_isMetaClass(v19);
        int v21 = object_getClassName(self);
        v92 = sel_getName(a2);
        uint64_t v22 = 45;
        if (v20) {
          uint64_t v22 = 43;
        }
        v18(3, "%c[%{public}s %{public}s]:%i Failed to display radio status alert.", v22, v21, v92, 99);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = object_getClass(self);
        if (class_isMetaClass(v24)) {
          int v25 = 43;
        }
        else {
          int v25 = 45;
        }
        v26 = object_getClassName(self);
        v27 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v102 = v25;
        __int16 v103 = 2082;
        v104 = v26;
        __int16 v105 = 2082;
        v106 = v27;
        __int16 v107 = 1024;
        int v108 = 99;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to display radio status alert.", buf, 0x22u);
      }

      id v28 = objc_alloc((Class)NSError);
      id v29 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v111 = NSLocalizedDescriptionKey;
      v30 = +[NSString stringWithUTF8String:"No resources"];
      v112 = v30;
      v31 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      id v32 = [v28 initWithDomain:v29 code:34 userInfo:v31];
      v7[2](v7, v32, 0);
    }
    else
    {
      if (responseFlags)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v50 = NFLogGetLogger();
        if (v50)
        {
          v51 = (void (*)(uint64_t, const char *, ...))v50;
          v52 = object_getClass(self);
          BOOL v53 = class_isMetaClass(v52);
          v54 = object_getClassName(self);
          v93 = sel_getName(a2);
          uint64_t v55 = 45;
          if (v53) {
            uint64_t v55 = 43;
          }
          v51(6, "%c[%{public}s %{public}s]:%i No action taken", v55, v54, v93, 125);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v56 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = object_getClass(self);
          if (class_isMetaClass(v57)) {
            int v58 = 43;
          }
          else {
            int v58 = 45;
          }
          v59 = object_getClassName(self);
          v60 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v102 = v58;
          __int16 v103 = 2082;
          v104 = v59;
          __int16 v105 = 2082;
          v106 = v60;
          __int16 v107 = 1024;
          int v108 = 125;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No action taken", buf, 0x22u);
        }
        id v29 = 0;
        uint64_t v61 = 3;
      }
      else
      {
        v56 = +[NSURL URLWithString:@"prefs:root=General&path=NFC_LINK"];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v62 = NFLogGetLogger();
        if (v62)
        {
          v63 = (void (*)(uint64_t, const char *, ...))v62;
          v64 = object_getClass(self);
          BOOL v65 = class_isMetaClass(v64);
          v90 = object_getClassName(self);
          v94 = sel_getName(a2);
          uint64_t v66 = 45;
          if (v65) {
            uint64_t v66 = 43;
          }
          v13 = &CFUserNotificationCreate_ptr;
          v63(6, "%c[%{public}s %{public}s]:%i Launching URL: %@", v66, v90, v94, 114, v56);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v67 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v68 = object_getClass(self);
          v96 = v56;
          v69 = v13;
          if (class_isMetaClass(v68)) {
            int v70 = 43;
          }
          else {
            int v70 = 45;
          }
          int v71 = object_getClassName(self);
          __int16 v72 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v102 = v70;
          v13 = v69;
          v56 = v96;
          __int16 v103 = 2082;
          v104 = v71;
          __int16 v105 = 2082;
          v106 = v72;
          __int16 v107 = 1024;
          int v108 = 114;
          __int16 v109 = 2112;
          v110 = v96;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Launching URL: %@", buf, 0x2Cu);
        }

        v73 = +[LSApplicationWorkspace defaultWorkspace];
        unsigned __int8 v74 = [v73 openSensitiveURL:v56 withOptions:0];

        if (v74)
        {
          id v29 = 0;
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v75 = NFLogGetLogger();
          if (v75)
          {
            v76 = (void (*)(uint64_t, const char *, ...))v75;
            v77 = object_getClass(self);
            BOOL v78 = class_isMetaClass(v77);
            v79 = object_getClassName(self);
            v95 = sel_getName(a2);
            uint64_t v80 = 45;
            if (v78) {
              uint64_t v80 = 43;
            }
            v91 = v79;
            v13 = &CFUserNotificationCreate_ptr;
            v76(3, "%c[%{public}s %{public}s]:%i Failed to open URL", v80, v91, v95, 117);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v81 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            v82 = object_getClass(self);
            if (class_isMetaClass(v82)) {
              int v83 = 43;
            }
            else {
              int v83 = 45;
            }
            v84 = object_getClassName(self);
            v85 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v102 = v83;
            __int16 v103 = 2082;
            v104 = v84;
            __int16 v105 = 2082;
            v106 = v85;
            __int16 v107 = 1024;
            int v108 = 117;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open URL", buf, 0x22u);
          }

          id v86 = objc_alloc((Class)NSError);
          v87 = +[NSString stringWithUTF8String:"nfcd"];
          NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
          v88 = +[NSString stringWithUTF8String:"No resources"];
          v100 = v88;
          v89 = [v13[48] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
          id v29 = [v86 initWithDomain:v87 code:34 userInfo:v89];
        }
        uint64_t v61 = 2;
      }

      v7[2](v7, v29, v61);
    }
  }
}

@end