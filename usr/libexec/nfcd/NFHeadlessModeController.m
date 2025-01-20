@interface NFHeadlessModeController
- (BOOL)hasAppleLPM;
- (NFHeadlessModeController)init;
- (char)getIndexFromLocale;
- (id)getLPMControl;
- (id)pushB0LPToSMC:(unsigned __int16)a3;
- (id)pushIndexToPMU:(char)a3;
- (unsigned)copyPMUService;
- (void)_setHeadlessModeFeature:(unint64_t)a3;
- (void)headlessTimerLogic;
- (void)kickRTCTimer;
- (void)localeChanged;
- (void)print;
- (void)queryPMUCapability;
@end

@implementation NFHeadlessModeController

- (NFHeadlessModeController)init
{
  v56.receiver = self;
  v56.super_class = (Class)NFHeadlessModeController;
  v3 = [(NFHeadlessModeController *)&v56 init];
  if (v3)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    v5 = NFBootUUID();
    v6 = [v4 dataForKey:@"LastBootUUID"];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nfcd.lpem", v8);
    v10 = (void *)*((void *)v3 + 3);
    *((void *)v3 + 3) = v9;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v3 + 3), kNFLOG_DISPATCH_SPECIFIC_KEY, 0, 0);
    if (v6 && ([v5 isEqualToData:v6] & 1) != 0)
    {
      id v11 = [v4 integerForKey:@"HeadlessFeatures"];
      *((void *)v3 + 4) = v11;
      if (v11) {
        id v12 = sub_10021ADE4(v3);
      }
      else {
        id v26 = sub_10021AD90(v3);
      }
      char v25 = 1;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v14 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v3);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v3);
        Name = sel_getName(a2);
        uint64_t v18 = 45;
        if (isMetaClass) {
          uint64_t v18 = 43;
        }
        v14(6, "%c[%{public}s %{public}s]:%i LPEM first config after boot", v18, ClassName, Name, 190);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = object_getClass(v3);
        if (class_isMetaClass(v20)) {
          int v21 = 43;
        }
        else {
          int v21 = 45;
        }
        v22 = object_getClassName(v3);
        v23 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v58 = v21;
        __int16 v59 = 2082;
        v60 = v22;
        __int16 v61 = 2082;
        v62 = v23;
        __int16 v63 = 1024;
        int v64 = 190;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i LPEM first config after boot", buf, 0x22u);
      }

      id v24 = sub_10021AD90(v3);
      char v25 = 0;
    }
    v3[9] = v25;
    if (v5) {
      [v4 setObject:v5 forKey:@"LastBootUUID"];
    }
    v3[10] = 0;
    v27 = +[NSDictionary dictionaryWithContentsOfFile:@"/Library/Preferences/Logging/Subsystems/com.apple.nfc.plist"];
    v28 = v27;
    if (v27)
    {
      v29 = [v27 objectForKey:@"OverrideB0LP"];
      if (v29)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v30 = NFLogGetLogger();
          if (v30)
          {
            v31 = (void (*)(uint64_t, const char *, ...))v30;
            v32 = object_getClass(v3);
            BOOL v33 = class_isMetaClass(v32);
            v34 = object_getClassName(v3);
            v54 = sel_getName(a2);
            uint64_t v35 = 45;
            if (v33) {
              uint64_t v35 = 43;
            }
            v31(6, "%c[%{public}s %{public}s]:%i SMC value will be overwritten by Profile", v35, v34, v54, 216);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v36 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = object_getClass(v3);
            if (class_isMetaClass(v37)) {
              int v38 = 43;
            }
            else {
              int v38 = 45;
            }
            v39 = object_getClassName(v3);
            v40 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v58 = v38;
            __int16 v59 = 2082;
            v60 = v39;
            __int16 v61 = 2082;
            v62 = v40;
            __int16 v63 = 1024;
            int v64 = 216;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SMC value will be overwritten by Profile", buf, 0x22u);
          }

          v3[10] = 1;
        }
      }
    }
    if ([v4 BOOLForKey:@"OverrideB0LP"])
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v41 = NFLogGetLogger();
      if (v41)
      {
        v42 = (void (*)(uint64_t, const char *, ...))v41;
        v43 = object_getClass(v3);
        BOOL v44 = class_isMetaClass(v43);
        v45 = object_getClassName(v3);
        v55 = sel_getName(a2);
        uint64_t v46 = 45;
        if (v44) {
          uint64_t v46 = 43;
        }
        v42(6, "%c[%{public}s %{public}s]:%i SMC value will be overwritten by defaults", v46, v45, v55, 221);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v47 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = object_getClass(v3);
        if (class_isMetaClass(v48)) {
          int v49 = 43;
        }
        else {
          int v49 = 45;
        }
        v50 = object_getClassName(v3);
        v51 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v58 = v49;
        __int16 v59 = 2082;
        v60 = v50;
        __int16 v61 = 2082;
        v62 = v51;
        __int16 v63 = 1024;
        int v64 = 221;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SMC value will be overwritten by defaults", buf, 0x22u);
      }

      v3[10] = 1;
    }
    v3[11] = 1;
    [v3 queryPMUCapability];
  }
  return (NFHeadlessModeController *)v3;
}

- (void)queryPMUCapability
{
  io_registry_entry_t v4 = [(NFHeadlessModeController *)self copyPMUService];
  if (v4)
  {
    io_object_t v5 = v4;
    id CFProperty = (id)IORegistryEntryCreateCFProperty(v4, @"IOPMUBootLPMFWSCC", 0, 0);
    IOObjectRelease(v5);
    if (CFProperty)
    {
      self->_requiresSilentCapabilityChecks = [CFProperty intValue] == 0;
    }
    else
    {
      self->_requiresSilentCapabilityChecks = 1;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Could not find service: %s", v10, ClassName, Name, 238, "AppleDialogSPMIPMU");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v18 = v13;
      __int16 v19 = 2082;
      v20 = object_getClassName(self);
      __int16 v21 = 2082;
      v22 = sel_getName(a2);
      __int16 v23 = 1024;
      int v24 = 238;
      __int16 v25 = 2080;
      id v26 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find service: %s", buf, 0x2Cu);
    }
  }
}

- (BOOL)hasAppleLPM
{
  if (qword_100347698 != -1) {
    dispatch_once(&qword_100347698, &stru_100307A80);
  }
  return byte_100347680;
}

- (char)getIndexFromLocale
{
  [(NFHeadlessModeController *)self print];
  if ([(NFHeadlessModeController *)self hasAppleLPM]) {
    io_registry_entry_t v4 = &off_100322988;
  }
  else {
    io_registry_entry_t v4 = &off_1003229A0;
  }
  io_object_t v5 = +[NSLocale preferredLanguages];
  v6 = +[NSBundle preferredLocalizationsFromArray:v4 forPreferences:v5];

  if (v6)
  {
    v7 = [v6 firstObject];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      dispatch_queue_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(6, "%c[%{public}s %{public}s]:%i Best match: %{public}@", v12, ClassName, Name, 360, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v22 = v15;
      __int16 v23 = 2082;
      int v24 = object_getClassName(self);
      __int16 v25 = 2082;
      id v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 360;
      __int16 v29 = 2114;
      uint64_t v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Best match: %{public}@", buf, 0x2Cu);
    }

    id v16 = [v4 indexOfObject:v7];
    if (v16 == (id)0x7FFFFFFFFFFFFFFFLL) {
      char v17 = 1;
    }
    else {
      char v17 = (_BYTE)v16 + 1;
    }
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

- (void)print
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    io_object_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    +[NSLocale currentLocale];
    v10 = id v26 = a2;
    id v11 = [v10 objectForKey:NSLocaleIdentifier];
    uint64_t v12 = +[NSLocale currentLocale];
    int v13 = [v12 objectForKey:NSLocaleLanguageCode];
    v14 = +[NSLocale preferredLanguages];
    uint64_t v15 = 43;
    if (!isMetaClass) {
      uint64_t v15 = 45;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Locale code = %{public}@, Language code = %{public}@, Preferred : %{public}@", v15, ClassName, Name, 378, v11, v13, v14);

    a2 = v26;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    char v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    __int16 v19 = object_getClassName(self);
    v20 = sel_getName(a2);
    __int16 v21 = +[NSLocale currentLocale];
    int v22 = [v21 objectForKey:NSLocaleIdentifier];
    __int16 v23 = +[NSLocale currentLocale];
    int v24 = [v23 objectForKey:NSLocaleLanguageCode];
    __int16 v25 = +[NSLocale preferredLanguages];
    *(_DWORD *)buf = 67110658;
    int v28 = v18;
    __int16 v29 = 2082;
    uint64_t v30 = v19;
    __int16 v31 = 2082;
    v32 = v20;
    __int16 v33 = 1024;
    int v34 = 378;
    __int16 v35 = 2114;
    v36 = v22;
    __int16 v37 = 2114;
    int v38 = v24;
    __int16 v39 = 2114;
    v40 = v25;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Locale code = %{public}@, Language code = %{public}@, Preferred : %{public}@", buf, 0x40u);
  }
}

- (id)pushB0LPToSMC:(unsigned __int16)a3
{
  kern_return_t v9;
  id v10;
  void *v11;
  void *v12;
  void **v13;
  NSErrorUserInfoKey *v14;
  void *v15;
  id v16;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  BOOL isMetaClass;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  kern_return_t v28;
  void (*v29)(uint64_t, const char *, ...);
  NSObject *v30;
  const char *ClassName;
  const char *Name;
  io_connect_t connect;
  size_t outputStructCnt;
  char v35[8];
  NSErrorUserInfoKey v36;
  void *v37;
  NSErrorUserInfoKey v38;
  void *v39;
  uint8_t v40[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  char *v45;
  __int16 v46;
  kern_return_t v47;
  __int16 v48;
  int v49;
  _OWORD outputStruct[2];
  long long v51;
  long long v52;
  long long v53;
  uint8_t buf[4];
  long long v55;
  long long v56;
  long long v57;
  unsigned char v58[28];
  uint64_t vars8;

  unsigned int v3 = a3;
  connect = 0;
  CFDictionaryRef v6 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
  if (!MatchingService
    || (v8 = MatchingService, dispatch_queue_t v9 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect), IOObjectRelease(v8), v9)
    || !connect
    || IOConnectCallScalarMethod(connect, 0, 0, 0, 0, 0))
  {
    connect = 0;
LABEL_4:
    uint64_t v10 = objc_alloc((Class)NSError);
    id v11 = +[NSString stringWithUTF8String:"nfcd"];
    int v38 = NSLocalizedDescriptionKey;
    uint64_t v12 = +[NSString stringWithUTF8String:"Unknown Error"];
    __int16 v39 = v12;
    int v13 = &v39;
    v14 = &v38;
    goto LABEL_5;
  }
  if (!connect) {
    goto LABEL_4;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    __int16 v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v22 = 45;
    if (isMetaClass) {
      int v22 = 43;
    }
    v19(6, "%c[%{public}s %{public}s]:%i Setting B0LP to %d", v22, ClassName, Name, 394, v3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v23 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = object_getClass(self);
    if (class_isMetaClass(v24)) {
      __int16 v25 = 43;
    }
    else {
      __int16 v25 = 45;
    }
    id v26 = object_getClassName(self);
    __int16 v27 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    LODWORD(v55) = v25;
    WORD2(v55) = 2082;
    *(void *)((char *)&v55 + 6) = v26;
    HIWORD(v55) = 2082;
    *(void *)&objc_super v56 = v27;
    WORD4(v56) = 1024;
    *(_DWORD *)((char *)&v56 + 10) = 394;
    HIWORD(v56) = 1024;
    LODWORD(v57) = v3;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting B0LP to %d", buf, 0x28u);
  }

  outputStructCnt = 80;
  v57 = 0u;
  objc_super v56 = 0u;
  v55 = 0u;
  memset(v58, 0, sizeof(v58));
  memset(outputStruct, 0, sizeof(outputStruct));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  strcpy(v35, "B0LP");
  BYTE6(v57) = 6;
  *(_DWORD *)buf = 1110461520;
  DWORD2(v56) = 2;
  WORD6(v57) = v3;
  int v28 = IOConnectCallStructMethod(connect, 2u, buf, 0x50uLL, outputStruct, &outputStructCnt);
  if (!v28 && !BYTE8(v51)) {
    goto LABEL_32;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v29) {
    v29(3, "%s:%i Write failed for key '%s' (0x%X, 0x%X)\n", "_writeSMCKey", 131, v35, v28, BYTE8(v51));
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v30 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v40 = 136447234;
    uint64_t v41 = "_writeSMCKey";
    v42 = 1024;
    v43 = 131;
    BOOL v44 = 2080;
    v45 = v35;
    uint64_t v46 = 1024;
    v47 = v28;
    v48 = 1024;
    int v49 = BYTE8(v51);
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}s:%i Write failed for key '%s' (0x%X, 0x%X)\n", v40, 0x28u);
  }

  if (!v28)
  {
LABEL_32:
    id v16 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = objc_alloc((Class)NSError);
  id v11 = +[NSString stringWithUTF8String:"nfcd"];
  v36 = NSLocalizedDescriptionKey;
  uint64_t v12 = +[NSString stringWithUTF8String:"Unknown Error"];
  __int16 v37 = v12;
  int v13 = &v37;
  v14 = &v36;
LABEL_5:
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v14 count:1];
  id v16 = [v10 initWithDomain:v11 code:6 userInfo:v15];

LABEL_6:
  if (connect && !IOConnectCallScalarMethod(connect, 1u, 0, 0, 0, 0)) {
    IOServiceClose(connect);
  }

  return v16;
}

- (unsigned)copyPMUService
{
  io_iterator_t existing = 0;
  CFDictionaryRef v4 = IOServiceNameMatching("AppleDialogSPMIPMU");
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing);
  if (MatchingServices)
  {
    uint64_t v6 = MatchingServices;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      io_object_t v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Error retrieving services : %d", v11, ClassName, Name, 416, v6);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      uint64_t v15 = object_getClassName(self);
      id v16 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v40 = v14;
      *(_WORD *)&v40[4] = 2082;
      *(void *)&v40[6] = v15;
      __int16 v41 = 2082;
      v42 = v16;
      __int16 v43 = 1024;
      int v44 = 416;
      __int16 v45 = 1024;
      LODWORD(v46) = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error retrieving services : %d", buf, 0x28u);
    }

    return 0;
  }
  io_iterator_t v18 = existing;
  if (!existing)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      int v24 = (void (*)(uint64_t, const char *, ...))v23;
      __int16 v25 = object_getClass(self);
      BOOL v26 = class_isMetaClass(v25);
      __int16 v35 = object_getClassName(self);
      __int16 v37 = sel_getName(a2);
      uint64_t v27 = 45;
      if (v26) {
        uint64_t v27 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Could not find service: %s", v27, v35, v37, 421, "AppleDialogSPMIPMU");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      __int16 v31 = object_getClassName(self);
      v32 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v40 = v30;
      *(_WORD *)&v40[4] = 2082;
      *(void *)&v40[6] = v31;
      __int16 v41 = 2082;
      v42 = v32;
      __int16 v43 = 1024;
      int v44 = 421;
      __int16 v45 = 2080;
      uint64_t v46 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find service: %s", buf, 0x2Cu);
    }

    return 0;
  }
  do
  {
    if (!IOIteratorIsValid(v18)) {
      break;
    }
    io_registry_entry_t v19 = IOIteratorNext(existing);
    io_object_t v17 = v19;
    if (!v19) {
      goto LABEL_34;
    }
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v19, @"IOPMUPrimary", 0, 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      goto LABEL_34;
    }
    IOObjectRelease(v17);
    io_iterator_t v18 = existing;
  }
  while (existing);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v21) {
    v21(3, "%s:%i Invalid iterator", "-[NFHeadlessModeController copyPMUService]", 428);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v22 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)v40 = "-[NFHeadlessModeController copyPMUService]";
    *(_WORD *)&v40[8] = 1024;
    *(_DWORD *)&v40[10] = 428;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid iterator", buf, 0x12u);
  }

  io_object_t v17 = 0;
LABEL_34:
  IOObjectRelease(existing);
  return v17;
}

- (id)getLPMControl
{
  io_registry_entry_t v4 = [(NFHeadlessModeController *)self copyPMUService];
  if (v4)
  {
    io_object_t v5 = v4;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, @"IOPMUBootLPMCtrl", 0, 0);
    IOObjectRelease(v5);
    if (CFProperty) {
      v7 = (void *)CFProperty;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      dispatch_queue_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Could not find service: %s", v12, ClassName, Name, 460, "AppleDialogSPMIPMU");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v20 = v15;
      __int16 v21 = 2082;
      int v22 = object_getClassName(self);
      __int16 v23 = 2082;
      int v24 = sel_getName(a2);
      __int16 v25 = 1024;
      int v26 = 460;
      __int16 v27 = 2080;
      int v28 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find service: %s", buf, 0x2Cu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)pushIndexToPMU:(char)a3
{
  int v3 = a3;
  int valuePtr = 0;
  io_registry_entry_t v6 = [(NFHeadlessModeController *)self copyPMUService];
  if (!v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Could not find service: %s", v27, ClassName, Name, 486, "AppleDialogSPMIPMU");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v140 = v30;
      __int16 v141 = 2082;
      v142 = object_getClassName(self);
      __int16 v143 = 2082;
      v144 = sel_getName(a2);
      __int16 v145 = 1024;
      int v146 = 486;
      __int16 v147 = 2080;
      v148 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not find service: %s", buf, 0x2Cu);
    }

    id v31 = objc_alloc((Class)NSError);
    v32 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v151 = NSLocalizedDescriptionKey;
    __int16 v33 = +[NSString stringWithUTF8String:"Unknown Error"];
    v152 = v33;
    int v34 = &v152;
    __int16 v35 = &v151;
    goto LABEL_88;
  }
  io_registry_entry_t v7 = v6;
  CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v6, @"IOPMUBootLPMCtrl", 0, 0);
  CFDictionaryRef v9 = CFProperty;
  if (!CFProperty || (CFTypeID v10 = CFGetTypeID(CFProperty), v10 != CFDictionaryGetTypeID()))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFLogGetLogger();
    if (v11)
    {
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))v11;
      int v13 = object_getClass(self);
      BOOL v14 = class_isMetaClass(v13);
      v123 = object_getClassName(self);
      v127 = sel_getName(a2);
      uint64_t v15 = 45;
      if (v14) {
        uint64_t v15 = 43;
      }
      v12(4, "%c[%{public}s %{public}s]:%i Failed to fetch property: %s.", v15, v123, v127, 492, "IOPMUBootLPMCtrl");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      io_object_t v17 = object_getClass(self);
      int v18 = v3;
      io_registry_entry_t v19 = v7;
      if (class_isMetaClass(v17)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v140 = v20;
      io_registry_entry_t v7 = v19;
      int v3 = v18;
      __int16 v141 = 2082;
      v142 = object_getClassName(self);
      __int16 v143 = 2082;
      v144 = sel_getName(a2);
      __int16 v145 = 1024;
      int v146 = 492;
      __int16 v147 = 2080;
      v148 = "IOPMUBootLPMCtrl";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to fetch property: %s.", buf, 0x2Cu);
    }
  }
  unint64_t headlessModeFeature = self->_headlessModeFeature;
  io_registry_entry_t v135 = v7;
  if (v9) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 4, v9);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 4, 0, 0);
  }
  v36 = MutableCopy;
  if ((headlessModeFeature & 3) != 0 || (headlessModeFeature & 0x1C) == 0)
  {
    int v49 = v3;
  }
  else
  {
    int v134 = v3;
    __int16 v37 = a2;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v38 = NFLogGetLogger();
    if (v38)
    {
      __int16 v39 = (void (*)(uint64_t, const char *, ...))v38;
      v40 = object_getClass(self);
      BOOL v41 = class_isMetaClass(v40);
      v42 = object_getClassName(self);
      v129 = sel_getName(v37);
      uint64_t v43 = 45;
      if (v41) {
        uint64_t v43 = 43;
      }
      v39(6, "%c[%{public}s %{public}s]:%i Overriding image index to 0 since no express.", v43, v42, v129, 508);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v44 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v45 = object_getClass(self);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      v47 = object_getClassName(self);
      v48 = sel_getName(v37);
      *(_DWORD *)buf = 67109890;
      int v140 = v46;
      __int16 v141 = 2082;
      v142 = v47;
      __int16 v143 = 2082;
      v144 = v48;
      __int16 v145 = 1024;
      int v146 = 508;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding image index to 0 since no express.", buf, 0x22u);
    }

    int v49 = 0;
    a2 = v37;
    int v3 = v134;
  }
  int valuePtr = v49;
  CFNumberRef v50 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v36, @"imgIdx", v50);
  CFRelease(v50);
  if ((headlessModeFeature & 4) != 0) {
    int v51 = v3;
  }
  else {
    int v51 = 0;
  }
  int valuePtr = v51;
  CFNumberRef v52 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v36, @"imgIdxFindMy", v52);
  CFRelease(v52);
  int valuePtr = (headlessModeFeature & 0x1F) != 0;
  CFNumberRef v53 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v36, @"lpm0", v53);
  CFRelease(v53);
  int valuePtr = (headlessModeFeature & 2) >> 1;
  CFNumberRef v54 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v36, @"lpm1", v54);
  CFRelease(v54);
  int valuePtr = (headlessModeFeature & 4) >> 2;
  CFNumberRef v55 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v36, @"lpm2", v55);
  CFRelease(v55);
  int valuePtr = (headlessModeFeature & 0x18) != 0;
  CFNumberRef v56 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v36, @"lpm3", v56);
  CFRelease(v56);
  unsigned int v57 = [(__CFDictionary *)v36 isEqualToDictionary:v9];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v58 = NFLogGetLogger();
  __int16 v59 = (void (*)(uint64_t, const char *, ...))v58;
  if (v57)
  {
    if (v58)
    {
      v60 = object_getClass(self);
      BOOL v61 = class_isMetaClass(v60);
      v62 = object_getClassName(self);
      __int16 v63 = sel_getName(a2);
      if (v9) {
        CFStringRef v64 = (const __CFString *)v9;
      }
      else {
        CFStringRef v64 = @"NULL";
      }
      uint64_t v65 = 45;
      if (v61) {
        uint64_t v65 = 43;
      }
      v59(6, "%c[%{public}s %{public}s]:%i No change to LPEM : %{public}@", v65, v62, v63, 551, v64);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v66 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = object_getClass(self);
      if (class_isMetaClass(v67)) {
        int v68 = 43;
      }
      else {
        int v68 = 45;
      }
      v69 = object_getClassName(self);
      v70 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      if (v9) {
        CFStringRef v71 = (const __CFString *)v9;
      }
      else {
        CFStringRef v71 = @"NULL";
      }
      int v140 = v68;
      __int16 v141 = 2082;
      v142 = v69;
      __int16 v143 = 2082;
      v144 = v70;
      __int16 v145 = 1024;
      int v146 = 551;
      __int16 v147 = 2114;
      v148 = (const char *)v71;
      v72 = "%c[%{public}s %{public}s]:%i No change to LPEM : %{public}@";
      v73 = v66;
      uint32_t v74 = 44;
LABEL_74:
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
    }
  }
  else
  {
    if (v58)
    {
      v75 = object_getClass(self);
      BOOL v76 = class_isMetaClass(v75);
      v77 = object_getClassName(self);
      v78 = sel_getName(a2);
      if (v9) {
        CFStringRef v79 = (const __CFString *)v9;
      }
      else {
        CFStringRef v79 = @"nil";
      }
      CFStringRef v133 = v79;
      uint64_t v80 = 45;
      if (v76) {
        uint64_t v80 = 43;
      }
      v59(6, "%c[%{public}s %{public}s]:%i Changing new LPM control %{public}@ -> %{public}@", v80, v77, v78, 553, v133, v36);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v66 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v81 = object_getClass(self);
      if (class_isMetaClass(v81)) {
        int v82 = 43;
      }
      else {
        int v82 = 45;
      }
      v83 = object_getClassName(self);
      v84 = sel_getName(a2);
      *(_DWORD *)buf = 67110402;
      if (v9) {
        CFStringRef v85 = (const __CFString *)v9;
      }
      else {
        CFStringRef v85 = @"nil";
      }
      int v140 = v82;
      __int16 v141 = 2082;
      v142 = v83;
      __int16 v143 = 2082;
      v144 = v84;
      __int16 v145 = 1024;
      int v146 = 553;
      __int16 v147 = 2114;
      v148 = (const char *)v85;
      __int16 v149 = 2114;
      v150 = v36;
      v72 = "%c[%{public}s %{public}s]:%i Changing new LPM control %{public}@ -> %{public}@";
      v73 = v66;
      uint32_t v74 = 54;
      goto LABEL_74;
    }
  }

  if (v9) {
    CFRelease(v9);
  }
  uint64_t v86 = IORegistryEntrySetCFProperty(v135, @"IOPMUBootLPMCtrl", v36);
  if (v86)
  {
    uint64_t v87 = v86;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v88 = NFLogGetLogger();
    if (v88)
    {
      v89 = (void (*)(uint64_t, const char *, ...))v88;
      v90 = object_getClass(self);
      BOOL v91 = class_isMetaClass(v90);
      v125 = object_getClassName(self);
      v130 = sel_getName(a2);
      uint64_t v92 = 45;
      if (v91) {
        uint64_t v92 = 43;
      }
      v89(3, "%c[%{public}s %{public}s]:%i Failed to set dictionary : 0x%x", v92, v125, v130, 562, v87);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v93 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      v94 = object_getClass(self);
      if (class_isMetaClass(v94)) {
        int v95 = 43;
      }
      else {
        int v95 = 45;
      }
      v96 = object_getClassName(self);
      v97 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v140 = v95;
      __int16 v141 = 2082;
      v142 = v96;
      __int16 v143 = 2082;
      v144 = v97;
      __int16 v145 = 1024;
      int v146 = 562;
      __int16 v147 = 1024;
      LODWORD(v148) = v87;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set dictionary : 0x%x", buf, 0x28u);
    }

    CFRelease(v36);
    IOObjectRelease(v135);
    id v31 = objc_alloc((Class)NSError);
    v32 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v137 = NSLocalizedDescriptionKey;
    __int16 v33 = +[NSString stringWithUTF8String:"Unknown Error"];
    v138 = v33;
    int v34 = &v138;
    __int16 v35 = &v137;
LABEL_88:
    v98 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v35 count:1];
    id v99 = [v31 initWithDomain:v32 code:6 userInfo:v98];

    goto LABEL_89;
  }
  v32 = [(NFHeadlessModeController *)self getLPMControl];
  if (([v32 isEqualToDictionary:v36] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v101 = NFLogGetLogger();
    if (v101)
    {
      v102 = (void (*)(uint64_t, const char *, ...))v101;
      v103 = object_getClass(self);
      BOOL v104 = class_isMetaClass(v103);
      v126 = object_getClassName(self);
      v131 = sel_getName(a2);
      uint64_t v105 = 45;
      if (v104) {
        uint64_t v105 = 43;
      }
      v102(3, "%c[%{public}s %{public}s]:%i Read back of LPM control error : %{public}@", v105, v126, v131, 570, v32);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v106 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      v107 = object_getClass(self);
      if (class_isMetaClass(v107)) {
        int v108 = 43;
      }
      else {
        int v108 = 45;
      }
      v109 = object_getClassName(self);
      v110 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v140 = v108;
      __int16 v141 = 2082;
      v142 = v109;
      __int16 v143 = 2082;
      v144 = v110;
      __int16 v145 = 1024;
      int v146 = 570;
      __int16 v147 = 2114;
      v148 = v32;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Read back of LPM control error : %{public}@", buf, 0x2Cu);
    }
  }
  CFRelease(v36);
  IOObjectRelease(v135);
  if (!NFProductHasB0LPKey())
  {
    id v99 = 0;
    goto LABEL_89;
  }
  if ((headlessModeFeature & 2) != 0)
  {
    uint64_t v111 = 3;
    goto LABEL_110;
  }
  if ((headlessModeFeature & 5) == 5)
  {
    uint64_t v111 = 2;
    goto LABEL_110;
  }
  uint64_t v111 = (headlessModeFeature & 5) != 0;
  if ((headlessModeFeature & 5) != 0)
  {
LABEL_110:
    if (self->_b0lpOverride)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v112 = NFLogGetLogger();
      if (v112)
      {
        v113 = (void (*)(uint64_t, const char *, ...))v112;
        v114 = object_getClass(self);
        BOOL v115 = class_isMetaClass(v114);
        v116 = object_getClassName(self);
        v132 = sel_getName(a2);
        uint64_t v117 = 45;
        if (v115) {
          uint64_t v117 = 43;
        }
        v113(6, "%c[%{public}s %{public}s]:%i SMC value has been overwritten", v117, v116, v132, 590);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v118 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        v119 = object_getClass(self);
        if (class_isMetaClass(v119)) {
          int v120 = 43;
        }
        else {
          int v120 = 45;
        }
        v121 = object_getClassName(self);
        v122 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v140 = v120;
        __int16 v141 = 2082;
        v142 = v121;
        __int16 v143 = 2082;
        v144 = v122;
        __int16 v145 = 1024;
        int v146 = 590;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i SMC value has been overwritten", buf, 0x22u);
      }

      uint64_t v111 = 1;
    }
  }
  id v99 = [(NFHeadlessModeController *)self pushB0LPToSMC:v111];
LABEL_89:

  return v99;
}

- (void)_setHeadlessModeFeature:(unint64_t)a3
{
  self->_unint64_t headlessModeFeature = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setInteger:self->_headlessModeFeature forKey:@"HeadlessFeatures"];
  +[NSDate timeIntervalSinceReferenceDate];
  [v4 setDouble:@"HeadlessFeaturesSetTime" forKey:];
  [v4 synchronize];
}

- (void)localeChanged
{
  if (self->_headlessModeFeature) {
    id v2 = sub_10021ADE4(self);
  }
}

- (void)headlessTimerLogic
{
  CFDateRef v4 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
  [(NFTimer *)self->_rtcKickTimer startTimer:1200.0];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    io_registry_entry_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i Setting RTC timer", v10, ClassName, Name, 755);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v28 = v13;
    __int16 v29 = 2082;
    int v30 = object_getClassName(self);
    __int16 v31 = 2082;
    v32 = sel_getName(a2);
    __int16 v33 = 1024;
    int v34 = 755;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting RTC timer", buf, 0x22u);
  }

  if (IOPMSchedulePowerEvent(v4, @"com.apple.nfcd.headless", @"poweron"))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFLogGetLogger();
    if (v14)
    {
      uint64_t v15 = (void (*)(uint64_t, const char *, ...))v14;
      id v16 = object_getClass(self);
      BOOL v17 = class_isMetaClass(v16);
      int v18 = object_getClassName(self);
      int v26 = sel_getName(a2);
      uint64_t v19 = 45;
      if (v17) {
        uint64_t v19 = 43;
      }
      v15(3, "%c[%{public}s %{public}s]:%i Failed to set RTC timer", v19, v18, v26, 759);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      __int16 v23 = object_getClassName(self);
      int v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v28 = v22;
      __int16 v29 = 2082;
      int v30 = v23;
      __int16 v31 = 2082;
      v32 = v24;
      __int16 v33 = 1024;
      int v34 = 759;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set RTC timer", buf, 0x22u);
    }
  }
}

- (void)kickRTCTimer
{
  if (self->_requiresSilentCapabilityChecks)
  {
    if (!self->_rtcKickTimer)
    {
      objc_initWeak(&location, self);
      id v3 = objc_alloc((Class)NFTimer);
      io_registry_entry_t v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472;
      CFDictionaryRef v9 = sub_10021E1B0;
      uint64_t v10 = &unk_100301C18;
      objc_copyWeak(&v11, &location);
      CFDateRef v4 = dispatch_get_global_queue(0, 0);
      io_object_t v5 = (NFTimer *)[v3 initSleepTimerWithCallback:&v7 queue:v4];
      rtcKickTimer = self->_rtcKickTimer;
      self->_rtcKickTimer = v5;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    [(NFHeadlessModeController *)self headlessTimerLogic];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_rtcKickTimer, 0);
}

@end