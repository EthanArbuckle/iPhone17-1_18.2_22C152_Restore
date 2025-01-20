@interface NFATLMobileSettings
+ (BOOL)findAID:(id)a3 filterType:(int64_t)a4;
+ (id)_getFilterWithType:(int64_t)a3;
@end

@implementation NFATLMobileSettings

+ (BOOL)findAID:(id)a3 filterType:(int64_t)a4
{
  id v6 = a3;
  v21 = [a1 _getFilterWithType:a4];
  v7 = v21;
  if (![v21 count]) {
    goto LABEL_14;
  }
  if (a4 == 2)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v21;
    id v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v32;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v30 = 0;
          v13 = +[NSRegularExpression regularExpressionWithPattern:v12 options:0 error:&v30];
          id v14 = v30;
          uint64_t v26 = 0;
          v27 = &v26;
          uint64_t v28 = 0x2020000000;
          char v29 = 0;
          id v15 = [v6 length];
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100200568;
          v25[3] = &unk_1003071E0;
          v25[4] = &v26;
          [v13 enumerateMatchesInString:v6 options:0 range:0 usingBlock:v15, v25];
          BOOL v16 = *((unsigned char *)v27 + 24) == 0;
          _Block_object_dispose(&v26, 8);

          if (!v16)
          {

            BOOL v19 = 1;
            v7 = v21;
            goto LABEL_16;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    v7 = v21;
    goto LABEL_14;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100200588;
  v22[3] = &unk_100307208;
  id v23 = v6;
  int64_t v24 = a4;
  id v17 = [v21 indexOfObjectPassingTest:v22];
  BOOL v18 = v17 < [v21 count];

  v7 = v21;
  if (!v18)
  {
LABEL_14:
    BOOL v19 = 0;
    goto LABEL_16;
  }
  BOOL v19 = 1;
LABEL_16:

  return v19;
}

+ (id)_getFilterWithType:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    id v6 = +[AppletTranslator getNFCSettings];
    v7 = [v6 objectForKeyedSubscript:@"Version"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v7 floatValue], v8 >= 1.0))
    {
      id v23 = [v6 objectForKeyedSubscript:@"ISO7816_SELECT_BLACKLIST"];

      if (!v23)
      {
        v7 = 0;
        goto LABEL_16;
      }
      v7 = v23;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = 0;
        switch(a3)
        {
          case 0:
            CFStringRef v33 = @"AID_FILTER_EXACT";
            goto LABEL_37;
          case 1:
            CFStringRef v33 = @"AID_FILTER_PREFIX";
            goto LABEL_37;
          case 2:
            CFStringRef v33 = @"AID_FILTER_REGEX";
LABEL_37:
            uint64_t v34 = [v7 objectForKeyedSubscript:v33];
            goto LABEL_42;
          case 3:
            uint64_t v35 = [v6 objectForKeyedSubscript:@"ISO7816_SELECT_PACE_APP_LIST"];

            if (v35) {
              v7 = (_UNKNOWN **)v35;
            }
            else {
              v7 = &off_100322970;
            }
            goto LABEL_43;
          case 4:
            CFStringRef v38 = @"F049442E43484E";
            uint64_t v34 = +[NSArray arrayWithObjects:&v38 count:1];
LABEL_42:
            v36 = (_UNKNOWN **)v34;

            v7 = v36;
            goto LABEL_43;
          case 5:
            goto LABEL_16;
          default:
LABEL_43:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_15;
            }
            v7 = v7;
            id v23 = v7;
            break;
        }
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        [v7 floatValue];
        uint64_t v16 = 45;
        if (isMetaClass) {
          uint64_t v16 = 43;
        }
        v10(3, "%c[%{public}s %{public}s]:%i Invalid config version: %f", v16, ClassName, Name, 88, v15);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        BOOL v18 = object_getClass(a1);
        if (class_isMetaClass(v18)) {
          int v19 = 43;
        }
        else {
          int v19 = 45;
        }
        v20 = object_getClassName(a1);
        v21 = sel_getName(a2);
        [v7 floatValue];
        *(_DWORD *)buf = 67110146;
        int v40 = v19;
        __int16 v41 = 2082;
        v42 = v20;
        __int16 v43 = 2082;
        v44 = v21;
        __int16 v45 = 1024;
        int v46 = 88;
        __int16 v47 = 2048;
        double v48 = v22;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid config version: %f", buf, 0x2Cu);
      }
    }
LABEL_15:
    id v23 = 0;
LABEL_16:

    goto LABEL_27;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v24 = NFLogGetLogger();
  if (v24)
  {
    v25 = (void (*)(uint64_t, const char *, ...))v24;
    uint64_t v26 = object_getClass(a1);
    BOOL v27 = class_isMetaClass(v26);
    uint64_t v28 = object_getClassName(a1);
    v37 = sel_getName(a2);
    uint64_t v29 = 45;
    if (v27) {
      uint64_t v29 = 43;
    }
    v25(3, "%c[%{public}s %{public}s]:%i Unable to read NFC settings from ATL", v29, v28, v37, 78);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v30 = object_getClass(a1);
    if (class_isMetaClass(v30)) {
      int v31 = 43;
    }
    else {
      int v31 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v40 = v31;
    __int16 v41 = 2082;
    v42 = object_getClassName(a1);
    __int16 v43 = 2082;
    v44 = sel_getName(a2);
    __int16 v45 = 1024;
    int v46 = 78;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to read NFC settings from ATL", buf, 0x22u);
  }
  id v23 = 0;
LABEL_27:

  return v23;
}

@end