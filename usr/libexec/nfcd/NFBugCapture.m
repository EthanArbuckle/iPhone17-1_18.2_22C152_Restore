@interface NFBugCapture
+ (id)_getInstance;
+ (void)handleCallback:(unint64_t)a3;
+ (void)requestAutoBugCapture:(id)a3 withSubType:(id)a4 withSubTypeContext:(id)a5;
- (NFBugCapture)init;
- (id)_buildTapToRadarURL;
- (void)_handleCallbackSync:(unint64_t)a3;
- (void)_requestAutoBugCapture:(id)a3 withSubType:(id)a4 withSubTypeContext:(id)a5;
- (void)_requestTapToRadarSync:(id)a3 componentName:(id)a4 preferences:(id)a5 withType:(id)a6 withSubTypeContext:(id)a7 additionalInfo:(id)a8;
@end

@implementation NFBugCapture

- (NFBugCapture)init
{
  v29.receiver = self;
  v29.super_class = (Class)NFBugCapture;
  v3 = [(NFBugCapture *)&v29 init];
  if (!v3) {
    goto LABEL_4;
  }
  Class v4 = NSClassFromString(@"LSApplicationWorkspace");
  v3->_lsApplicationWorkspace = v4;
  if (v4)
  {
    pendingRequest = v3->_pendingRequest;
    v3->_pendingRequest = 0;

    componentName = v3->_componentName;
    v3->_componentName = 0;

    additionalInfo = v3->_additionalInfo;
    v3->_additionalInfo = 0;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.stockholm.BugCapture", v9);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v10;

    userDefaults = v3->_userDefaults;
    v3->_userDefaults = 0;

    type = v3->_type;
    v3->_type = 0;

    subTypeContext = v3->_subTypeContext;
    v3->_subTypeContext = 0;

LABEL_4:
    v15 = v3;
    goto LABEL_15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v17 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v3);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v3);
    Name = sel_getName(a2);
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v17(3, "%c[%{public}s %{public}s]:%i Failed to get class %{public}@", v20, ClassName, Name, 77, @"LSApplicationWorkspace");
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = object_getClass(v3);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    v24 = object_getClassName(v3);
    v25 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v31 = v23;
    __int16 v32 = 2082;
    v33 = v24;
    __int16 v34 = 2082;
    v35 = v25;
    __int16 v36 = 1024;
    int v37 = 77;
    __int16 v38 = 2114;
    CFStringRef v39 = @"LSApplicationWorkspace";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get class %{public}@", buf, 0x2Cu);
  }

  v15 = 0;
LABEL_15:

  return v15;
}

+ (id)_getInstance
{
  if (qword_100347538 != -1) {
    dispatch_once(&qword_100347538, &stru_100306420);
  }
  v2 = (void *)qword_100347530;

  return v2;
}

- (id)_buildTapToRadarURL
{
  Class v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = self->_pendingRequest;
  if ([(NSString *)self->_componentName isEqualToString:@"NFC-SE"])
  {
    [(NSMutableDictionary *)self->_additionalInfo removeObjectForKey:@"FailureKey"];

    v7 = @"Crash/Hang/Data Loss";
    if (self->_additionalInfo)
    {
      v8 = +[NSString stringWithFormat:@"%@\n", self->_additionalInfo];
      v9 = [(NSMutableDictionary *)self->_additionalInfo objectForKeyedSubscript:@"Status Word"];

      if (v9)
      {
        dispatch_queue_t v10 = [(NSMutableDictionary *)self->_additionalInfo objectForKeyedSubscript:@"Status Word"];
        v11 = +[NSString stringWithFormat:@"Returned with status: %@ \n", v10];
        uint64_t v12 = [(__CFString *)v8 stringByAppendingString:v11];

        v8 = (__CFString *)v12;
      }
      uint64_t v13 = [(NSMutableDictionary *)self->_additionalInfo objectForKey:@"Classification"];
      v14 = (void *)v13;
      if (v13) {
        v15 = (__CFString *)v13;
      }
      else {
        v15 = @"Crash/Hang/Data Loss";
      }
      v7 = v15;
    }
    else
    {
      v8 = &stru_100309C40;
    }
    v28 = +[NSString stringWithFormat:@"Error: %@\n", self->_pendingRequest];
    v6 = [(__CFString *)v8 stringByAppendingString:v28];

    v16 = @"1414626";
    CFStringRef v17 = @"TTR";
    goto LABEL_23;
  }
  if ([(NSString *)self->_componentName isEqualToString:@"Purple Stockholm"])
  {
    v16 = @"483780";
    v7 = @"Crash/Hang/Data Loss";
    CFStringRef v17 = @"1.0";
LABEL_23:
    if (([(__CFString *)v16 isEqual:@"483780"] & 1) == 0)
    {
      uint64_t v29 = [(NSString *)v6 stringByAppendingString:@"Please provide the following details inline (in RADAR DESCRIPTION) for transaction failures.\n\n****IMPORTANT****\n\nTransactional issues frequently require follow up at the site of the failure. Without merchant name and location, this is not possible. In order to facilitate and expedite investigation into your issue, please provide the following details inline (in RADAR DESCRIPTION). Thanks.\n\n1. Merchant name and location: \n\n2. Where was the error reported (e.g. in-store terminal, gas pump, transit gate, on phone/watch)? \n\n3. Has the card been used successfully at other merchants? (Yes/No): \n\n4. When was the last time this card worked at this merchant? (Specific date/'n' days ago/Never/I don't remember): \n\n5.Apple Card (yes/no)? \n\nPlease provide responses inline (in RADAR DESCRIPTION)"];

      v6 = (NSString *)v29;
    }
    v30 = +[NSURLQueryItem queryItemWithName:@"ComponentID" value:v16];
    [v4 addObject:v30];

    int v31 = +[NSURLQueryItem queryItemWithName:@"ComponentName" value:self->_componentName];
    [v4 addObject:v31];

    __int16 v32 = +[NSURLQueryItem queryItemWithName:@"ComponentVersion" value:v17];
    [v4 addObject:v32];

    v33 = +[NSURLQueryItem queryItemWithName:@"Classification" value:v7];
    [v4 addObject:v33];

    __int16 v34 = +[NSURLQueryItem queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
    [v4 addObject:v34];

    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"NFC/SE TTR - %@", self->_pendingRequest];
    __int16 v36 = +[NSURLQueryItem queryItemWithName:@"Title" value:v35];
    [v4 addObject:v36];

    int v37 = +[NSURLQueryItem queryItemWithName:@"Description" value:v6];
    [v4 addObject:v37];

    __int16 v38 = +[NSURLQueryItem queryItemWithName:@"IncludeDevicePrefixInTitle" value:@"1"];
    [v4 addObject:v38];

    [v5 setScheme:@"tap-to-radar"];
    [v5 setHost:@"new"];
    [v5 setQueryItems:v4];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v40 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v43 = 45;
      if (isMetaClass) {
        uint64_t v43 = 43;
      }
      v40(6, "%c[%{public}s %{public}s]:%i URL: %{public}@", v43, ClassName, Name, 156, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v44 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = object_getClass(self);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v52 = v46;
      __int16 v53 = 2082;
      v54 = object_getClassName(self);
      __int16 v55 = 2082;
      v56 = sel_getName(a2);
      __int16 v57 = 1024;
      int v58 = 156;
      __int16 v59 = 2114;
      v60 = v5;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i URL: %{public}@", buf, 0x2Cu);
    }

    v27 = [v5 URL];
    goto LABEL_35;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFLogGetLogger();
  if (v18)
  {
    v19 = (void (*)(uint64_t, const char *, ...))v18;
    uint64_t v20 = object_getClass(self);
    BOOL v21 = class_isMetaClass(v20);
    v22 = object_getClassName(self);
    v49 = sel_getName(a2);
    uint64_t v23 = 45;
    if (v21) {
      uint64_t v23 = 43;
    }
    v19(3, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with wrong component name. Should either be NFC-SE or Purple Stockholm", v23, v22, v49, 135);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = object_getClass(self);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v52 = v26;
    __int16 v53 = 2082;
    v54 = object_getClassName(self);
    __int16 v55 = 2082;
    v56 = sel_getName(a2);
    __int16 v57 = 1024;
    int v58 = 135;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with wrong component name. Should either be NFC-SE or Purple Stockholm", buf, 0x22u);
  }

  v27 = 0;
  v7 = @"Crash/Hang/Data Loss";
LABEL_35:

  return v27;
}

- (void)_handleCallbackSync:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequest)
  {
    if (self->_componentName)
    {
      userDefaults = self->_userDefaults;
      v7 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
      [(NSUserDefaults *)userDefaults setObject:v7 forKey:@"NFTTRProhibitRequestsUntil"];

      [(NSUserDefaults *)self->_userDefaults synchronize];
      if (a3 == 1)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          __int16 v38 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v42 = 45;
          if (isMetaClass) {
            uint64_t v42 = 43;
          }
          v38(6, "%c[%{public}s %{public}s]:%i NotNow response", v42, ClassName, Name, 191);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v43 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = object_getClass(self);
          if (class_isMetaClass(v44)) {
            int v45 = 43;
          }
          else {
            int v45 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v61 = v45;
          __int16 v62 = 2082;
          v63 = object_getClassName(self);
          __int16 v64 = 2082;
          v65 = sel_getName(a2);
          __int16 v66 = 1024;
          int v67 = 191;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NotNow response", buf, 0x22u);
        }
      }
      else
      {
        if (a3 != 2)
        {
          int v46 = [(NFBugCapture *)self _buildTapToRadarURL];
          if (v46)
          {
            v47 = [(objc_class *)self->_lsApplicationWorkspace defaultWorkspace];
            [v47 openURL:v46 configuration:0 completionHandler:0];
          }
          goto LABEL_48;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v8 = NFLogGetLogger();
        if (v8)
        {
          v9 = (void (*)(uint64_t, const char *, ...))v8;
          dispatch_queue_t v10 = object_getClass(self);
          BOOL v11 = class_isMetaClass(v10);
          uint64_t v12 = object_getClassName(self);
          v56 = sel_getName(a2);
          uint64_t v13 = 45;
          if (v11) {
            uint64_t v13 = 43;
          }
          v9(6, "%c[%{public}s %{public}s]:%i User canceled response", v13, v12, v56, 183);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v14 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = object_getClass(self);
          if (class_isMetaClass(v15)) {
            int v16 = 43;
          }
          else {
            int v16 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v61 = v16;
          __int16 v62 = 2082;
          v63 = object_getClassName(self);
          __int16 v64 = 2082;
          v65 = sel_getName(a2);
          __int16 v66 = 1024;
          int v67 = 183;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i User canceled response", buf, 0x22u);
        }

        CFStringRef v17 = self->_userDefaults;
        uint64_t v18 = +[NSDate distantFuture];
        [(NSUserDefaults *)v17 setObject:v18 forKey:@"NFTTRProhibitRequestsUntil"];

        [(NSUserDefaults *)self->_userDefaults synchronize];
      }
      +[NFBugCapture requestAutoBugCapture:self->_type withSubType:self->_pendingRequest withSubTypeContext:self->_subTypeContext];
LABEL_48:
      Main = CFRunLoopGetMain();
      CFRunLoopRemoveSource(Main, self->_runLoopSource, kCFRunLoopCommonModes);
      runLoopSource = self->_runLoopSource;
      if (runLoopSource) {
        CFRelease(runLoopSource);
      }
      self->_runLoopSource = 0;
      userNotification = self->_userNotification;
      if (userNotification) {
        CFRelease(userNotification);
      }
      self->_userNotification = 0;
      pendingRequest = self->_pendingRequest;
      self->_pendingRequest = 0;

      componentName = self->_componentName;
      self->_componentName = 0;

      additionalInfo = self->_additionalInfo;
      self->_additionalInfo = 0;

      v54 = self->_userDefaults;
      self->_userDefaults = 0;

      type = self->_type;
      self->_type = 0;

      subTypeContext = self->_subTypeContext;
      self->_subTypeContext = 0;
      goto LABEL_53;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v29 = NFLogGetLogger();
    if (v29)
    {
      v30 = (void (*)(uint64_t, const char *, ...))v29;
      int v31 = object_getClass(self);
      BOOL v32 = class_isMetaClass(v31);
      v33 = object_getClassName(self);
      int v58 = sel_getName(a2);
      uint64_t v34 = 45;
      if (v32) {
        uint64_t v34 = 43;
      }
      v30(3, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no component name", v34, v33, v58, 172);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    subTypeContext = NFSharedLogGetLogger();
    if (os_log_type_enabled(subTypeContext, OS_LOG_TYPE_ERROR))
    {
      id v35 = object_getClass(self);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v61 = v36;
      __int16 v62 = 2082;
      v63 = object_getClassName(self);
      __int16 v64 = 2082;
      v65 = sel_getName(a2);
      __int16 v66 = 1024;
      int v67 = 172;
      v28 = "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no component name";
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, subTypeContext, OS_LOG_TYPE_ERROR, v28, buf, 0x22u);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v19 = NFLogGetLogger();
    if (v19)
    {
      uint64_t v20 = (void (*)(uint64_t, const char *, ...))v19;
      BOOL v21 = object_getClass(self);
      BOOL v22 = class_isMetaClass(v21);
      uint64_t v23 = object_getClassName(self);
      __int16 v57 = sel_getName(a2);
      uint64_t v24 = 45;
      if (v22) {
        uint64_t v24 = 43;
      }
      v20(3, "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no pending request", v24, v23, v57, 169);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    subTypeContext = NFSharedLogGetLogger();
    if (os_log_type_enabled(subTypeContext, OS_LOG_TYPE_ERROR))
    {
      int v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v61 = v27;
      __int16 v62 = 2082;
      v63 = object_getClassName(self);
      __int16 v64 = 2082;
      v65 = sel_getName(a2);
      __int16 v66 = 1024;
      int v67 = 169;
      v28 = "%c[%{public}s %{public}s]:%i Ignoring TTR callback with no pending request";
      goto LABEL_33;
    }
  }
LABEL_53:
}

+ (void)handleCallback:(unint64_t)a3
{
  Class v4 = +[NFBugCapture _getInstance];
  v5 = v4;
  if (v4)
  {
    v6 = v4[1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100198D9C;
    v7[3] = &unk_100301C40;
    uint64_t v8 = v4;
    unint64_t v9 = a3;
    dispatch_async(v6, v7);
  }
}

- (void)_requestTapToRadarSync:(id)a3 componentName:(id)a4 preferences:(id)a5 withType:(id)a6 withSubTypeContext:(id)a7 additionalInfo:(id)a8
{
  id v15 = a3;
  id v169 = a4;
  int v16 = (__CFString *)a5;
  id v168 = a6;
  id v17 = a7;
  id v18 = a8;
  if ((NFProductIsDevBoard() & 1) == 0 && (NFProductIsVM() & 1) == 0 && !NFProductIsNED())
  {
    int v27 = [v18 objectForKey:@"FailureKey"];
    v166 = v18;
    v167 = v16;
    if (v27)
    {
      id v32 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"nfcd"];
      v33 = [v32 objectForKey:v27];

      if (v33
        && ([v32 objectForKey:v27],
            uint64_t v34 = objc_claimAutoreleasedReturnValue(),
            id v35 = [v34 integerValue],
            v34,
            !v35))
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          v164 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v41 = 45;
          if (isMetaClass) {
            uint64_t v41 = 43;
          }
          v164(6, "%c[%{public}s %{public}s]:%i Ignoring TTR callback. Toggle switch for this failure is set to OFF in Stockholm internal settings.", v41, ClassName, Name, 371);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v42 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = object_getClass(self);
          if (class_isMetaClass(v43)) {
            int v44 = 43;
          }
          else {
            int v44 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v174 = v44;
          __int16 v175 = 2082;
          v176 = object_getClassName(self);
          __int16 v177 = 2082;
          v178 = sel_getName(a2);
          __int16 v179 = 1024;
          int v180 = 371;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignoring TTR callback. Toggle switch for this failure is set to OFF in Stockholm internal settings.", buf, 0x22u);
        }

        char v162 = 0;
      }
      else
      {
        if ([v27 isEqual:@"ttrTransaction"]) {
          usleep(0x2625A0u);
        }
        if (v17)
        {
          uint64_t v36 = [v15 stringByAppendingString:v17];

          char v162 = 1;
          id v15 = (id)v36;
        }
        else
        {
          char v162 = 1;
        }
      }
      int v16 = v167;

      id v18 = v166;
    }
    else
    {
      char v162 = 1;
    }
    SInt32 error = 0;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (self->_pendingRequest && self->_componentName)
    {
      id v45 = v18;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v46 = NFLogGetLogger();
      if (v46)
      {
        v47 = (void (*)(uint64_t, const char *, ...))v46;
        v48 = object_getClass(self);
        BOOL v49 = class_isMetaClass(v48);
        v50 = object_getClassName(self);
        v156 = sel_getName(a2);
        uint64_t v51 = 45;
        if (v49) {
          uint64_t v51 = 43;
        }
        v148 = v50;
        int v16 = v167;
        v47(3, "%c[%{public}s %{public}s]:%i Discarding TTR request, already in flight", v51, v148, v156, 391);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v52 = NFSharedLogGetLogger();
      v165 = v52;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        __int16 v53 = object_getClass(self);
        if (class_isMetaClass(v53)) {
          int v54 = 43;
        }
        else {
          int v54 = 45;
        }
        __int16 v55 = object_getClassName(self);
        v56 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v174 = v54;
        __int16 v175 = 2082;
        v176 = v55;
        __int16 v177 = 2082;
        v178 = v56;
        __int16 v179 = 1024;
        int v180 = 391;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Discarding TTR request, already in flight", buf, 0x22u);
      }
      int v31 = v168;
      v30 = v169;
      id v18 = v45;
      goto LABEL_118;
    }
    if (!sub_10000AF94()
      || (sub_10019A40C(), __int16 v57 = objc_claimAutoreleasedReturnValue(), v57, !v57))
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v58 = NFLogGetLogger();
      if (v58)
      {
        __int16 v59 = (void (*)(uint64_t, const char *, ...))v58;
        v60 = object_getClass(self);
        BOOL v61 = class_isMetaClass(v60);
        __int16 v62 = object_getClassName(self);
        v157 = sel_getName(a2);
        uint64_t v63 = 45;
        if (v61) {
          uint64_t v63 = 43;
        }
        v149 = v62;
        int v16 = v167;
        v59(3, "%c[%{public}s %{public}s]:%i Missing SB notif key SBUserNotificationDismissOnLock", v63, v149, v157, 397);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v64 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v65 = object_getClass(self);
        if (class_isMetaClass(v65)) {
          int v66 = 43;
        }
        else {
          int v66 = 45;
        }
        int v67 = object_getClassName(self);
        v68 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v174 = v66;
        int v16 = v167;
        __int16 v175 = 2082;
        v176 = v67;
        __int16 v177 = 2082;
        v178 = v68;
        __int16 v179 = 1024;
        int v180 = 397;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing SB notif key SBUserNotificationDismissOnLock", buf, 0x22u);
      }

      char v162 = 0;
      id v18 = v166;
    }
    id v69 = objc_alloc((Class)NSUserDefaults);
    if (v16) {
      CFStringRef v70 = v16;
    }
    else {
      CFStringRef v70 = @"com.apple.nfcd.nfttr";
    }
    v71 = (NSUserDefaults *)[v69 initWithSuiteName:v70];
    userDefaults = self->_userDefaults;
    self->_userDefaults = v71;

    uint64_t v73 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"NFTTRProhibitRequestsUntil"];
    if (v73)
    {
      v74 = v73;
      objc_opt_class();
      v75 = v74;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_65;
      }
      v76 = v74;
      id v77 = objc_alloc_init((Class)NSDateFormatter);
      id v78 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
      [v77 setLocale:v78];

      [v77 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
      uint64_t v79 = [v77 dateFromString:v76];

      v75 = v79;
      if (!v79)
      {
        v165 = 0;
      }
      else
      {
LABEL_65:
        objc_opt_class();
        v165 = v75;
        if (objc_opt_isKindOfClass())
        {
          v80 = +[NSDate date];
          id v81 = [v75 compare:v80];

          if (v81 == (id)1)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v82 = NFLogGetLogger();
            if (v82)
            {
              v83 = (void (*)(uint64_t, const char *, ...))v82;
              v84 = object_getClass(self);
              BOOL v85 = class_isMetaClass(v84);
              v150 = object_getClassName(self);
              v158 = sel_getName(a2);
              uint64_t v86 = 45;
              if (v85) {
                uint64_t v86 = 43;
              }
              v83(6, "%c[%{public}s %{public}s]:%i TTR is prohibited until %{public}@", v86, v150, v158, 416, v165);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v87 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              v88 = object_getClass(self);
              if (class_isMetaClass(v88)) {
                int v89 = 43;
              }
              else {
                int v89 = 45;
              }
              v90 = object_getClassName(self);
              v91 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v174 = v89;
              __int16 v175 = 2082;
              v176 = v90;
              __int16 v177 = 2082;
              v178 = v91;
              __int16 v179 = 1024;
              int v180 = 416;
              __int16 v181 = 2114;
              v182 = v165;
              _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TTR is prohibited until %{public}@", buf, 0x2Cu);
            }

            v92 = self->_userDefaults;
            self->_userDefaults = 0;

            id v18 = v166;
            int v16 = v167;
            goto LABEL_103;
          }
        }
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v93 = NFLogGetLogger();
      if (v93)
      {
        v94 = (void (*)(uint64_t, const char *, ...))v93;
        v95 = object_getClass(self);
        BOOL v96 = class_isMetaClass(v95);
        v97 = object_getClassName(self);
        v159 = sel_getName(a2);
        uint64_t v98 = 45;
        if (v96) {
          uint64_t v98 = 43;
        }
        v94(3, "%c[%{public}s %{public}s]:%i TTR Prohibition time is in Unexpected format", v98, v97, v159, 421);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v99 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        v100 = object_getClass(self);
        if (class_isMetaClass(v100)) {
          int v101 = 43;
        }
        else {
          int v101 = 45;
        }
        v102 = object_getClassName(self);
        v103 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v174 = v101;
        __int16 v175 = 2082;
        v176 = v102;
        __int16 v177 = 2082;
        v178 = v103;
        __int16 v179 = 1024;
        int v180 = 421;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i TTR Prohibition time is in Unexpected format", buf, 0x22u);
      }

      id v18 = v166;
      int v16 = v167;
    }
    else
    {
      v165 = 0;
    }
    if ((v162 & 1) == 0)
    {
LABEL_103:
      int v31 = v168;
      +[NFBugCapture requestAutoBugCapture:v168 withSubType:v15 withSubTypeContext:v17];
      v30 = v169;
LABEL_118:

      goto LABEL_14;
    }
    v163 = v17;
    v171[0] = kCFUserNotificationAlertHeaderKey;
    v171[1] = kCFUserNotificationAlertMessageKey;
    v172[0] = @"NFC/SE Error Detected!";
    v172[1] = @"Please file a Radar";
    v171[2] = kCFUserNotificationDefaultButtonTitleKey;
    v171[3] = kCFUserNotificationAlternateButtonTitleKey;
    v172[2] = @"File Radar";
    v172[3] = @"Not Now";
    v171[4] = kCFUserNotificationOtherButtonTitleKey;
    v171[5] = kCFUserNotificationAlertTopMostKey;
    v172[4] = @"Never bother me again";
    v172[5] = &__kCFBooleanTrue;
    v104 = sub_10019A40C();
    v171[6] = v104;
    v172[6] = &__kCFBooleanFalse;
    CFDictionaryRef v105 = +[NSDictionary dictionaryWithObjects:v172 forKeys:v171 count:7];

    v106 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v105);
    self->_userNotification = v106;
    if (!v106 || error)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v124 = NFLogGetLogger();
      if (v124)
      {
        v125 = (void (*)(uint64_t, const char *, ...))v124;
        v126 = object_getClass(self);
        BOOL v127 = class_isMetaClass(v126);
        v128 = object_getClassName(self);
        v129 = sel_getName(a2);
        uint64_t v130 = 45;
        if (v127) {
          uint64_t v130 = 43;
        }
        v152 = v128;
        int v16 = v167;
        v125(3, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", v130, v152, v129, 445, error);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v131 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        v132 = object_getClass(self);
        if (class_isMetaClass(v132)) {
          int v133 = 43;
        }
        else {
          int v133 = 45;
        }
        v134 = object_getClassName(self);
        v135 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v174 = v133;
        int v16 = v167;
        __int16 v175 = 2082;
        v176 = v134;
        __int16 v177 = 2082;
        v178 = v135;
        __int16 v179 = 1024;
        int v180 = 445;
        __int16 v181 = 1024;
        LODWORD(v182) = error;
        _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Couldn't create notification! %d", buf, 0x28u);
      }

      userNotification = self->_userNotification;
      if (userNotification) {
        CFRelease(userNotification);
      }
      self->_userNotification = 0;
      subTypeContext = self->_userDefaults;
      self->_userDefaults = 0;
    }
    else
    {
      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v106, (CFUserNotificationCallBack)sub_10019A550, 0);
      self->_runLoopSource = RunLoopSource;
      if (!RunLoopSource)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v137 = NFLogGetLogger();
        if (v137)
        {
          v138 = (void (*)(uint64_t, const char *, ...))v137;
          v139 = object_getClass(self);
          BOOL v140 = class_isMetaClass(v139);
          v141 = object_getClassName(self);
          v161 = sel_getName(a2);
          uint64_t v142 = 45;
          if (v140) {
            uint64_t v142 = 43;
          }
          v153 = v141;
          int v16 = v167;
          v138(3, "%c[%{public}s %{public}s]:%i Couldn't create runloop source", v142, v153, v161, 455);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v143 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
        {
          v144 = object_getClass(self);
          if (class_isMetaClass(v144)) {
            int v145 = 43;
          }
          else {
            int v145 = 45;
          }
          v146 = object_getClassName(self);
          v147 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v174 = v145;
          int v16 = v167;
          __int16 v175 = 2082;
          v176 = v146;
          __int16 v177 = 2082;
          v178 = v147;
          __int16 v179 = 1024;
          int v180 = 455;
          _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Couldn't create runloop source", buf, 0x22u);
        }

        CFRelease(self->_userNotification);
        self->_userNotification = 0;
        subTypeContext = self->_userDefaults;
        self->_userDefaults = 0;
        int v31 = v168;
        v30 = v169;
        id v18 = v166;
        goto LABEL_117;
      }
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, self->_runLoopSource, kCFRunLoopCommonModes);
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v109 = NFLogGetLogger();
      if (v109)
      {
        v110 = (void (*)(uint64_t, const char *, ...))v109;
        v111 = object_getClass(self);
        BOOL v112 = class_isMetaClass(v111);
        v113 = object_getClassName(self);
        v160 = sel_getName(a2);
        uint64_t v114 = 45;
        if (v112) {
          uint64_t v114 = 43;
        }
        v151 = v113;
        int v16 = v167;
        v110(6, "%c[%{public}s %{public}s]:%i TTR prompt created", v114, v151, v160, 463);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v115 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        v116 = object_getClass(self);
        if (class_isMetaClass(v116)) {
          int v117 = 43;
        }
        else {
          int v117 = 45;
        }
        v118 = object_getClassName(self);
        v119 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v174 = v117;
        int v16 = v167;
        __int16 v175 = 2082;
        v176 = v118;
        __int16 v177 = 2082;
        v178 = v119;
        __int16 v179 = 1024;
        int v180 = 463;
        _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TTR prompt created", buf, 0x22u);
      }

      objc_storeStrong((id *)&self->_pendingRequest, v15);
      objc_storeStrong((id *)&self->_componentName, a4);
      id v18 = v166;
      v120 = (NSMutableDictionary *)[v166 mutableCopy];
      additionalInfo = self->_additionalInfo;
      self->_additionalInfo = v120;

      objc_storeStrong((id *)&self->_type, a6);
      v122 = v163;
      subTypeContext = (NSUserDefaults *)self->_subTypeContext;
      self->_subTypeContext = v122;
    }
    int v31 = v168;
    v30 = v169;
LABEL_117:

    id v17 = v163;
    goto LABEL_118;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v19 = NFLogGetLogger();
  if (v19)
  {
    uint64_t v20 = (void (*)(uint64_t, const char *, ...))v19;
    BOOL v21 = object_getClass(self);
    id v22 = v18;
    BOOL v23 = class_isMetaClass(v21);
    uint64_t v24 = object_getClassName(self);
    v154 = sel_getName(a2);
    BOOL v25 = !v23;
    id v18 = v22;
    uint64_t v26 = 45;
    if (!v25) {
      uint64_t v26 = 43;
    }
    v20(3, "%c[%{public}s %{public}s]:%i Disabled NF TTR on devboards and VMs", v26, v24, v154, 356);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v27 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28)) {
      int v29 = 43;
    }
    else {
      int v29 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v174 = v29;
    __int16 v175 = 2082;
    v176 = object_getClassName(self);
    __int16 v177 = 2082;
    v178 = sel_getName(a2);
    __int16 v179 = 1024;
    int v180 = 356;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Disabled NF TTR on devboards and VMs", buf, 0x22u);
  }
  int v31 = v168;
  v30 = v169;
LABEL_14:
}

- (void)_requestAutoBugCapture:(id)a3 withSubType:(id)a4 withSubTypeContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v9)
  {
    if (v10)
    {
      if (v11)
      {
        uint64_t v13 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.nfcd.nfttr"];
        userDefaults = self->_userDefaults;
        self->_userDefaults = v13;

        id v15 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"NFABCProhibitRequestsUntil"];
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_64;
          }
          int v16 = v15;
          id v17 = objc_alloc_init((Class)NSDateFormatter);
          id v18 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
          [v17 setLocale:v18];

          [v17 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
          id v15 = [v17 dateFromString:v16];

          if (v15)
          {
LABEL_64:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = +[NSDate date];
              id v20 = [v15 compare:v19];

              if (v20 == (id)1)
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t Logger = NFLogGetLogger();
                if (Logger)
                {
                  id v22 = (void (*)(uint64_t, const char *, ...))Logger;
                  Class = object_getClass(self);
                  BOOL isMetaClass = class_isMetaClass(Class);
                  ClassName = object_getClassName(self);
                  Name = sel_getName(a2);
                  uint64_t v25 = 45;
                  if (isMetaClass) {
                    uint64_t v25 = 43;
                  }
                  v22(6, "%c[%{public}s %{public}s]:%i ABC is prohibited until %{public}@", v25, ClassName, Name, 500, v15);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v26 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  int v27 = object_getClass(self);
                  if (class_isMetaClass(v27)) {
                    int v28 = 43;
                  }
                  else {
                    int v28 = 45;
                  }
                  *(_DWORD *)buf = 67110146;
                  *(_DWORD *)&uint8_t buf[4] = v28;
                  *(_WORD *)id v81 = 2082;
                  *(void *)&v81[2] = object_getClassName(self);
                  *(_WORD *)&v81[10] = 2082;
                  *(void *)&v81[12] = sel_getName(a2);
                  *(_WORD *)&v81[20] = 1024;
                  *(_DWORD *)&v81[22] = 500;
                  *(_WORD *)&v81[26] = 2114;
                  *(void *)&v81[28] = v15;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ABC is prohibited until %{public}@", buf, 0x2Cu);
                }

                int v29 = self->_userDefaults;
                self->_userDefaults = 0;
LABEL_60:

                goto LABEL_61;
              }
            }
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v55 = NFLogGetLogger();
          if (v55)
          {
            v56 = (void (*)(uint64_t, const char *, ...))v55;
            __int16 v57 = object_getClass(self);
            BOOL v58 = class_isMetaClass(v57);
            __int16 v59 = object_getClassName(self);
            v74 = sel_getName(a2);
            uint64_t v60 = 45;
            if (v58) {
              uint64_t v60 = 43;
            }
            v56(3, "%c[%{public}s %{public}s]:%i ABC Prohibition time is in Unexpected format", v60, v59, v74, 505);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          BOOL v61 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            __int16 v62 = object_getClass(self);
            if (class_isMetaClass(v62)) {
              int v63 = 43;
            }
            else {
              int v63 = 45;
            }
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)&uint8_t buf[4] = v63;
            *(_WORD *)id v81 = 2082;
            *(void *)&v81[2] = object_getClassName(self);
            *(_WORD *)&v81[10] = 2082;
            *(void *)&v81[12] = sel_getName(a2);
            *(_WORD *)&v81[20] = 1024;
            *(_DWORD *)&v81[22] = 505;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ABC Prohibition time is in Unexpected format", buf, 0x22u);
          }
        }
        __int16 v64 = self->_userDefaults;
        v65 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
        [(NSUserDefaults *)v64 setObject:v65 forKey:@"NFABCProhibitRequestsUntil"];

        [(NSUserDefaults *)self->_userDefaults synchronize];
        uint64_t v76 = 0;
        id v77 = &v76;
        uint64_t v78 = 0x2050000000;
        int v66 = (void *)qword_100347518;
        uint64_t v79 = qword_100347518;
        if (!qword_100347518)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)id v81 = 3221225472;
          *(void *)&v81[8] = sub_10019B648;
          *(void *)&v81[16] = &unk_100301E40;
          *(void *)&v81[24] = &v76;
          sub_10019B648((uint64_t)buf);
          int v66 = (void *)v77[3];
        }
        int v67 = v66;
        _Block_object_dispose(&v76, 8);
        int v29 = (NSUserDefaults *)objc_alloc_init(v67);
        v68 = [(NSUserDefaults *)v29 signatureWithDomain:@"NFC/SE" type:v9 subType:v10 subtypeContext:v12 detectedProcess:@"Stockholm" triggerThresholdValues:0];
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        v75[2] = sub_10019AE40;
        v75[3] = &unk_100306470;
        v75[4] = self;
        v75[5] = a2;
        [(NSUserDefaults *)v29 snapshotWithSignature:v68 delay:0 events:0 payload:0 actions:v75 reply:0.0];

        goto LABEL_60;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v47 = NFLogGetLogger();
      if (v47)
      {
        v48 = (void (*)(uint64_t, const char *, ...))v47;
        BOOL v49 = object_getClass(self);
        BOOL v50 = class_isMetaClass(v49);
        uint64_t v51 = object_getClassName(self);
        uint64_t v73 = sel_getName(a2);
        uint64_t v52 = 45;
        if (v50) {
          uint64_t v52 = 43;
        }
        v48(3, "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error subtype context.", v52, v51, v73, 481);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v53 = object_getClass(self);
        if (class_isMetaClass(v53)) {
          int v54 = 43;
        }
        else {
          int v54 = 45;
        }
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v54;
        *(_WORD *)id v81 = 2082;
        *(void *)&v81[2] = object_getClassName(self);
        *(_WORD *)&v81[10] = 2082;
        *(void *)&v81[12] = sel_getName(a2);
        *(_WORD *)&v81[20] = 1024;
        *(_DWORD *)&v81[22] = 481;
        __int16 v38 = "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error subtype context.";
LABEL_46:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v38, buf, 0x22u);
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v39 = NFLogGetLogger();
      if (v39)
      {
        v40 = (void (*)(uint64_t, const char *, ...))v39;
        uint64_t v41 = object_getClass(self);
        BOOL v42 = class_isMetaClass(v41);
        uint64_t v43 = object_getClassName(self);
        v72 = sel_getName(a2);
        uint64_t v44 = 45;
        if (v42) {
          uint64_t v44 = 43;
        }
        v40(3, "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error subtype.", v44, v43, v72, 478);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v45 = object_getClass(self);
        if (class_isMetaClass(v45)) {
          int v46 = 43;
        }
        else {
          int v46 = 45;
        }
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v46;
        *(_WORD *)id v81 = 2082;
        *(void *)&v81[2] = object_getClassName(self);
        *(_WORD *)&v81[10] = 2082;
        *(void *)&v81[12] = sel_getName(a2);
        *(_WORD *)&v81[20] = 1024;
        *(_DWORD *)&v81[22] = 478;
        __int16 v38 = "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error subtype.";
        goto LABEL_46;
      }
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v30 = NFLogGetLogger();
    if (v30)
    {
      int v31 = (void (*)(uint64_t, const char *, ...))v30;
      id v32 = object_getClass(self);
      BOOL v33 = class_isMetaClass(v32);
      uint64_t v34 = object_getClassName(self);
      v71 = sel_getName(a2);
      uint64_t v35 = 45;
      if (v33) {
        uint64_t v35 = 43;
      }
      v31(3, "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error type.", v35, v34, v71, 475);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = object_getClass(self);
      if (class_isMetaClass(v36)) {
        int v37 = 43;
      }
      else {
        int v37 = 45;
      }
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v37;
      *(_WORD *)id v81 = 2082;
      *(void *)&v81[2] = object_getClassName(self);
      *(_WORD *)&v81[10] = 2082;
      *(void *)&v81[12] = sel_getName(a2);
      *(_WORD *)&v81[20] = 1024;
      *(_DWORD *)&v81[22] = 475;
      __int16 v38 = "%c[%{public}s %{public}s]:%i Ignoring ABC callback with no error type.";
      goto LABEL_46;
    }
  }
LABEL_61:
}

+ (void)requestAutoBugCapture:(id)a3 withSubType:(id)a4 withSubTypeContext:(id)a5
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    uint64_t v18 = 45;
    if (isMetaClass) {
      uint64_t v18 = 43;
    }
    v14(6, "%c[%{public}s %{public}s]:%i Requesting Auto Bug Capture!", v18, ClassName, Name, 537);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = object_getClass(a1);
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v25 = v21;
    __int16 v26 = 2082;
    int v27 = object_getClassName(a1);
    __int16 v28 = 2082;
    int v29 = sel_getName(a2);
    __int16 v30 = 1024;
    int v31 = 537;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Requesting Auto Bug Capture!", buf, 0x22u);
  }

  id v22 = +[NFBugCapture _getInstance];
  [v22 _requestAutoBugCapture:v12 withSubType:v11 withSubTypeContext:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTypeContext, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end