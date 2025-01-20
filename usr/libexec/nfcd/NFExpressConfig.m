@interface NFExpressConfig
+ (id)atlConfigKeyForType:(unsigned __int8)a3;
+ (unsigned)expressTypeForATLConfigKey:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isSEOperational;
- (id)arrayConfigFromDictionary:(id)a3;
- (id)deactivateExpressConfig;
- (id)getExpressAidsForType:(unsigned __int8)a3;
- (id)getExpressAidsForType:(unsigned __int8)a3 onlyInExpress:(BOOL)a4;
- (id)initFromStorageWithDriverWrapper:(id)a3;
- (id)passForAid:(id)a3;
- (id)reconfigureWithArray:(id)a3 restoreAuthorization:(BOOL)a4 updateStorage:(BOOL)a5;
- (id)reconfigureWithArray:(id)a3 updateStorage:(BOOL)a4 avoidChangingRouting:(BOOL)a5 restoreAuthorization:(BOOL)a6;
- (id)restoreAuthForApplet:(id)a3;
- (unint64_t)getNumberOfExpressAidsForType:(unsigned __int8)a3;
- (void)dumpConfig:(id)a3 logLevel:(int)a4 prefix:(id)a5;
- (void)removeAppletsFromConfig:(id)a3;
- (void)updateAppletCountOnMap:(id)a3;
- (void)updateExpressAppletNumbers;
@end

@implementation NFExpressConfig

+ (id)atlConfigKeyForType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (qword_100347478 != -1) {
    dispatch_once(&qword_100347478, &stru_100304E08);
  }
  v4 = (void *)qword_100347470;
  v5 = +[NSNumber numberWithUnsignedChar:v3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

+ (unsigned)expressTypeForATLConfigKey:(id)a3
{
  id v3 = a3;
  if (qword_100347488 != -1) {
    dispatch_once(&qword_100347488, &stru_100304E28);
  }
  v4 = [(id)qword_100347480 objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 unsignedIntValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)dumpConfig:(id)a3 logLevel:(int)a4 prefix:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if ((int)v6 <= 6)
  {
    uint64_t v61 = v6;
    if (v9)
    {
      uint64_t Logger = NFLogGetLogger();
      unsigned int v12 = v6;
      if (Logger)
      {
        v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v16 = 45;
        if (isMetaClass) {
          uint64_t v16 = 43;
        }
        v13(v6, "%c[%{public}s %{public}s]:%i %@: [", v16, ClassName, Name, 141, v10);
      }
      v17 = NFSharedLogGetLogger();
      v18 = v17;
      unint64_t v19 = 0x1010000000uLL >> (8 * v12);
      if (v12 >= 7) {
        LOBYTE(v19) = 0;
      }
      os_log_type_t v20 = v19;
      if (os_log_type_enabled(v17, (os_log_type_t)v19))
      {
        v21 = object_getClass(self);
        if (class_isMetaClass(v21)) {
          int v22 = 43;
        }
        else {
          int v22 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v70 = v22;
        __int16 v71 = 2082;
        v72 = object_getClassName(self);
        __int16 v73 = 2082;
        v74 = sel_getName(a2);
        __int16 v75 = 1024;
        int v76 = 141;
        __int16 v77 = 2112;
        v78 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, v20, "%c[%{public}s %{public}s]:%i %@: [", buf, 0x2Cu);
      }

      uint64_t v6 = v61;
    }
    v59 = v10;
    id v60 = v8;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = v8;
    id v23 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v65;
      if (v6 >= 7) {
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      }
      else {
        os_log_type_t v26 = (0x1010000000uLL >> (8 * v6));
      }
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v65 != v25) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v29 = NFLogGetLogger();
          if (v29)
          {
            v30 = (void (*)(uint64_t, const char *, ...))v29;
            v31 = object_getClass(self);
            BOOL v32 = class_isMetaClass(v31);
            v55 = object_getClassName(self);
            v57 = sel_getName(a2);
            uint64_t v33 = 45;
            if (v32) {
              uint64_t v33 = 43;
            }
            v30(v6, "%c[%{public}s %{public}s]:%i   %@", v33, v55, v57, 144, v28);
          }
          v34 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v34, v26))
          {
            v35 = object_getClass(self);
            if (class_isMetaClass(v35)) {
              int v36 = 43;
            }
            else {
              int v36 = 45;
            }
            v37 = object_getClassName(self);
            v38 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v70 = v36;
            uint64_t v6 = v61;
            __int16 v71 = 2082;
            v72 = v37;
            __int16 v73 = 2082;
            v74 = v38;
            __int16 v75 = 1024;
            int v76 = 144;
            __int16 v77 = 2112;
            v78 = v28;
            _os_log_impl((void *)&_mh_execute_header, v34, v26, "%c[%{public}s %{public}s]:%i   %@", buf, 0x2Cu);
          }
        }
        id v24 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
      }
      while (v24);
    }

    uint64_t v39 = NFLogGetLogger();
    uint64_t v40 = v6;
    if (v39)
    {
      v41 = (void (*)(uint64_t, const char *, ...))v39;
      v42 = object_getClass(self);
      BOOL v43 = class_isMetaClass(v42);
      v44 = object_getClassName(self);
      v58 = sel_getName(a2);
      uint64_t v45 = 45;
      if (v43) {
        uint64_t v45 = 43;
      }
      v41(v40, "%c[%{public}s %{public}s]:%i ]", v45, v44, v58, 146);
    }
    v46 = NFSharedLogGetLogger();
    v47 = v46;
    unint64_t v48 = 0x1010000000uLL >> (8 * v40);
    if (v40 >= 7) {
      LOBYTE(v48) = 0;
    }
    os_log_type_t v49 = v48;
    id v8 = v60;
    if (os_log_type_enabled(v46, (os_log_type_t)v48))
    {
      v50 = object_getClass(self);
      if (class_isMetaClass(v50)) {
        int v51 = 43;
      }
      else {
        int v51 = 45;
      }
      v52 = object_getClassName(self);
      v53 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v70 = v51;
      __int16 v71 = 2082;
      v72 = v52;
      __int16 v73 = 2082;
      v74 = v53;
      __int16 v75 = 1024;
      int v76 = 146;
      _os_log_impl((void *)&_mh_execute_header, v47, v49, "%c[%{public}s %{public}s]:%i ]", buf, 0x22u);
    }

    v10 = v59;
  }
}

- (void)updateExpressAppletNumbers
{
  *(_OWORD *)&self->_unint64_t numberOfExpressFelicaTransitApplets = 0u;
  p_unint64_t numberOfExpressFelicaTransitApplets = &self->_numberOfExpressFelicaTransitApplets;
  *(_OWORD *)&self->_unint64_t numberOfExpressECPAccessApplets = 0u;
  *(_OWORD *)&self->_unint64_t numberOfExpressECP2Applets = 0u;
  v4 = (NSArray *)objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v53 = p_numberOfExpressFelicaTransitApplets;
  id v5 = (id)*(p_numberOfExpressFelicaTransitApplets - 1);
  id v6 = [v5 countByEnumeratingWithState:&v57 objects:v83 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v58;
    id v54 = v5;
    v55 = v4;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v11 = [v10 objectForKeyedSubscript:@"expressEnabled"];
        unsigned int v12 = [v11 BOOLValue];

        if (v12)
        {
          v13 = [v10 objectForKeyedSubscript:@"ExpressType"];
          unsigned int v14 = +[NFExpressConfig expressTypeForATLConfigKey:v13];

          switch(v14)
          {
            case 1u:
              ++*v53;
              break;
            case 2u:
              ++self->_numberOfExpressECPAccessApplets;
              break;
            case 3u:
              ++self->_numberOfExpressGenericAApplets;
              break;
            case 4u:
              ++self->_numberOfExpressECP2Applets;
              break;
            case 5u:
              ++self->_numberOfExpressCathayTransitApplets;
              break;
            case 6u:
              ++self->_numberOfExpressSinglePollApplets;
              break;
            default:
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t Logger = NFLogGetLogger();
              if (Logger)
              {
                uint64_t v16 = (void (*)(uint64_t, const char *, ...))Logger;
                Class = object_getClass(self);
                BOOL isMetaClass = class_isMetaClass(Class);
                ClassName = object_getClassName(self);
                Name = sel_getName(a2);
                v21 = [v10 objectForKeyedSubscript:@"ExpressType"];
                int v51 = ClassName;
                v52 = Name;
                id v5 = v54;
                v4 = v55;
                uint64_t v22 = 45;
                if (isMetaClass) {
                  uint64_t v22 = 43;
                }
                v16(4, "%c[%{public}s %{public}s]:%i unknown express type %{public}@", v22, v51, v52, 188, v21);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              id v23 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                id v24 = object_getClass(self);
                if (class_isMetaClass(v24)) {
                  int v25 = 43;
                }
                else {
                  int v25 = 45;
                }
                os_log_type_t v26 = object_getClassName(self);
                v27 = sel_getName(a2);
                v28 = [v10 objectForKeyedSubscript:@"ExpressType"];
                *(_DWORD *)buf = 67110146;
                int v62 = v25;
                id v5 = v54;
                __int16 v63 = 2082;
                long long v64 = v26;
                __int16 v65 = 2082;
                long long v66 = v27;
                __int16 v67 = 1024;
                int v68 = 188;
                __int16 v69 = 2114;
                int v70 = v28;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i unknown express type %{public}@", buf, 0x2Cu);

                v4 = v55;
              }

              break;
          }
          uint64_t v29 = [v10 objectForKeyedSubscript:@"appletIdentifier"];
          [(NSArray *)v4 addObject:v29];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v57 objects:v83 count:16];
    }
    while (v7);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v30 = NFLogGetLogger();
  if (v30)
  {
    v31 = (void (*)(uint64_t, const char *, ...))v30;
    BOOL v32 = object_getClass(self);
    BOOL v33 = class_isMetaClass(v32);
    v34 = object_getClassName(self);
    v35 = sel_getName(a2);
    int v36 = [(NFExpressConfig *)self seName];
    uint64_t v37 = 43;
    if (!v33) {
      uint64_t v37 = 45;
    }
    v31(6, "%c[%{public}s %{public}s]:%i %{public}@: num suica = %d, num cathay = %d, num access = %d, num generic-A = %d, num ecp2 = %d, num single poll = %d", v37, v34, v35, 200, v36, *(_OWORD *)&self->_numberOfExpressFelicaTransitApplets, *(_OWORD *)&self->_numberOfExpressECPAccessApplets, self->_numberOfExpressECP2Applets, self->_numberOfExpressSinglePollApplets);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v38 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = object_getClass(self);
    if (class_isMetaClass(v39)) {
      int v40 = 43;
    }
    else {
      int v40 = 45;
    }
    v41 = object_getClassName(self);
    v42 = sel_getName(a2);
    BOOL v43 = [(NFExpressConfig *)self seName];
    unint64_t numberOfExpressFelicaTransitApplets = self->_numberOfExpressFelicaTransitApplets;
    unint64_t numberOfExpressCathayTransitApplets = self->_numberOfExpressCathayTransitApplets;
    unint64_t numberOfExpressECPAccessApplets = self->_numberOfExpressECPAccessApplets;
    unint64_t numberOfExpressGenericAApplets = self->_numberOfExpressGenericAApplets;
    unint64_t numberOfExpressECP2Applets = self->_numberOfExpressECP2Applets;
    unint64_t numberOfExpressSinglePollApplets = self->_numberOfExpressSinglePollApplets;
    *(_DWORD *)buf = 67111682;
    int v62 = v40;
    __int16 v63 = 2082;
    long long v64 = v41;
    __int16 v65 = 2082;
    long long v66 = v42;
    __int16 v67 = 1024;
    int v68 = 200;
    __int16 v69 = 2114;
    int v70 = v43;
    __int16 v71 = 1024;
    int v72 = numberOfExpressFelicaTransitApplets;
    __int16 v73 = 1024;
    int v74 = numberOfExpressCathayTransitApplets;
    __int16 v75 = 1024;
    int v76 = numberOfExpressECPAccessApplets;
    __int16 v77 = 1024;
    int v78 = numberOfExpressGenericAApplets;
    __int16 v79 = 1024;
    int v80 = numberOfExpressECP2Applets;
    __int16 v81 = 1024;
    int v82 = numberOfExpressSinglePollApplets;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@: num suica = %d, num cathay = %d, num access = %d, num generic-A = %d, num ecp2 = %d, num single poll = %d", buf, 0x50u);
  }
  allAids = self->_allAids;
  self->_allAids = v4;
}

- (void)updateAppletCountOnMap:(id)a3
{
  id v4 = a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  if (self) {
    passes = self->_passes;
  }
  else {
    passes = 0;
  }
  id v6 = passes;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v49 objects:v65 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v50;
    CFStringRef v10 = @"expressEnabled";
    BOOL v43 = v6;
    v44 = self;
    v46 = v4;
    uint64_t v47 = *(void *)v50;
    do
    {
      v11 = 0;
      id v48 = v8;
      do
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v12 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v11);
        v13 = [v12 objectForKeyedSubscript:v10];
        unsigned int v14 = [v13 BOOLValue];

        if (v14)
        {
          v15 = [v12 objectForKeyedSubscript:@"appletIdentifier"];
          uint64_t v16 = [v12 objectForKeyedSubscript:@"ExpressType"];
          uint64_t v17 = +[NFExpressConfig expressTypeForATLConfigKey:v16];

          uint64_t v18 = [v4 objectForKeyedSubscript:v15];
          if (v18)
          {
            unint64_t v19 = (void *)v18;
            os_log_type_t v20 = [v4 objectForKeyedSubscript:v15];
            CFStringRef v21 = v10;
            id v22 = [v20 integerValue];

            uint64_t v9 = v47;
            BOOL v23 = v22 == (id)v17;
            CFStringRef v10 = v21;
            if (!v23)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t Logger = NFLogGetLogger();
              if (Logger)
              {
                int v25 = (void (*)(uint64_t, const char *, ...))Logger;
                Class = object_getClass(self);
                BOOL isMetaClass = class_isMetaClass(Class);
                ClassName = object_getClassName(self);
                Name = sel_getName(a2);
                uint64_t v30 = [v46 objectForKeyedSubscript:v15];
                id v42 = [v30 integerValue];
                v41 = Name;
                self = v44;
                BOOL v23 = !isMetaClass;
                uint64_t v9 = v47;
                uint64_t v31 = 45;
                if (!v23) {
                  uint64_t v31 = 43;
                }
                int v40 = ClassName;
                CFStringRef v10 = v21;
                v25(4, "%c[%{public}s %{public}s]:%i same aid has different express types?! (%ld vs %d)", v31, v40, v41, 216, v42, v17);

                id v6 = v43;
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              BOOL v32 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                BOOL v33 = object_getClass(self);
                if (class_isMetaClass(v33)) {
                  int v34 = 43;
                }
                else {
                  int v34 = 45;
                }
                v35 = object_getClassName(self);
                int v36 = sel_getName(a2);
                uint64_t v37 = [v46 objectForKeyedSubscript:v15];
                id v38 = [v37 integerValue];
                *(_DWORD *)buf = 67110402;
                int v54 = v34;
                CFStringRef v10 = v21;
                __int16 v55 = 2082;
                v56 = v35;
                __int16 v57 = 2082;
                long long v58 = v36;
                id v6 = v43;
                self = v44;
                __int16 v59 = 1024;
                int v60 = 216;
                __int16 v61 = 2048;
                id v62 = v38;
                __int16 v63 = 1024;
                int v64 = v17;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i same aid has different express types?! (%ld vs %d)", buf, 0x32u);

                uint64_t v9 = v47;
              }

              id v4 = v46;
            }
          }
          uint64_t v39 = +[NSNumber numberWithUnsignedChar:v17];
          [v4 setObject:v39 forKeyedSubscript:v15];

          id v8 = v48;
        }
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v49 objects:v65 count:16];
    }
    while (v8);
  }
}

- (id)initFromStorageWithDriverWrapper:(id)a3
{
  id v6 = a3;
  v113.receiver = self;
  v113.super_class = (Class)NFExpressConfig;
  id v7 = [(NFExpressConfig *)&v113 init];
  id v8 = v7;
  if (!v7) {
    goto LABEL_87;
  }
  objc_storeStrong((id *)&v7->_driverWrapper, a3);
  uint64_t v9 = [(NFExpressConfig *)v8 fetchFromStorage];
  if (!v9)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v8);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v8);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v13(6, "%c[%{public}s %{public}s]:%i Failed to read expressConfig from storage", v17, ClassName, Name, 234);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    CFStringRef v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = object_getClass(v8);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      os_log_type_t v20 = object_getClassName(v8);
      CFStringRef v21 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v115 = v19;
      __int16 v116 = 2082;
      v117 = v20;
      __int16 v118 = 2082;
      v119 = v21;
      __int16 v120 = 1024;
      int v121 = 234;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to read expressConfig from storage", buf, 0x22u);
    }
    goto LABEL_85;
  }
  CFStringRef v10 = v9;
  if ([v9 count])
  {
    BOOL v11 = 0;
  }
  else
  {
    id v22 = [(NFExpressConfig *)v8 migrateFromDefaults];
    BOOL v11 = v22 == 0;
    if (!v22)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v23 = NFLogGetLogger();
      if (v23)
      {
        id v24 = (void (*)(uint64_t, const char *, ...))v23;
        int v25 = object_getClass(v8);
        BOOL v26 = class_isMetaClass(v25);
        v27 = object_getClassName(v8);
        v106 = sel_getName(a2);
        uint64_t v28 = 45;
        if (v26) {
          uint64_t v28 = 43;
        }
        v24(3, "%c[%{public}s %{public}s]:%i Failed to migrate config from defaults - init with epmty config", v28, v27, v106, 243);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = object_getClass(v8);
        if (class_isMetaClass(v30)) {
          int v31 = 43;
        }
        else {
          int v31 = 45;
        }
        BOOL v32 = object_getClassName(v8);
        BOOL v33 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v115 = v31;
        __int16 v116 = 2082;
        v117 = v32;
        __int16 v118 = 2082;
        v119 = v33;
        __int16 v120 = 1024;
        int v121 = 243;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to migrate config from defaults - init with epmty config", buf, 0x22u);
      }

      uint64_t v34 = +[NSMutableArray array];

      CFStringRef v10 = v34;
    }
    id v35 = [v22 count];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v36 = NFLogGetLogger();
    uint64_t v37 = (void (*)(uint64_t, const char *, ...))v36;
    if (v35)
    {
      if (v36)
      {
        id v38 = object_getClass(v8);
        BOOL v39 = class_isMetaClass(v38);
        int v40 = object_getClassName(v8);
        v107 = sel_getName(a2);
        uint64_t v41 = 45;
        if (v39) {
          uint64_t v41 = 43;
        }
        v37(6, "%c[%{public}s %{public}s]:%i Successfully migrated from defaults", v41, v40, v107, 248);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v42 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v43 = object_getClass(v8);
        if (class_isMetaClass(v43)) {
          int v44 = 43;
        }
        else {
          int v44 = 45;
        }
        uint64_t v45 = object_getClassName(v8);
        v46 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v115 = v44;
        __int16 v116 = 2082;
        v117 = v45;
        __int16 v118 = 2082;
        v119 = v46;
        __int16 v120 = 1024;
        int v121 = 248;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Successfully migrated from defaults", buf, 0x22u);
      }

      uint64_t v47 = v10;
      BOOL v11 = 1;
      CFStringRef v10 = v22;
    }
    else
    {
      if (v36)
      {
        id v48 = object_getClass(v8);
        BOOL v49 = class_isMetaClass(v48);
        long long v50 = object_getClassName(v8);
        v108 = sel_getName(a2);
        uint64_t v51 = 45;
        if (v49) {
          uint64_t v51 = 43;
        }
        v37(6, "%c[%{public}s %{public}s]:%i No express aids in defaults", v51, v50, v108, 253);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v47 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        long long v52 = object_getClass(v8);
        if (class_isMetaClass(v52)) {
          int v53 = 43;
        }
        else {
          int v53 = 45;
        }
        int v54 = object_getClassName(v8);
        __int16 v55 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v115 = v53;
        __int16 v116 = 2082;
        v117 = v54;
        __int16 v118 = 2082;
        v119 = v55;
        __int16 v120 = 1024;
        int v121 = 253;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No express aids in defaults", buf, 0x22u);
      }
    }
  }
  [(NFExpressConfig *)v8 dumpConfig:v10 logLevel:6 prefix:@"init config"];
  uint64_t v56 = [(NFExpressConfig *)v8 reconfigureWithArray:v10 updateStorage:v11 avoidChangingRouting:1 restoreAuthorization:0];
  if (!v56) {
    goto LABEL_86;
  }
  __int16 v57 = (void *)v56;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v58 = NFLogGetLogger();
  if (v58)
  {
    __int16 v59 = (void (*)(uint64_t, const char *, ...))v58;
    int v60 = object_getClass(v8);
    BOOL v61 = class_isMetaClass(v60);
    v103 = object_getClassName(v8);
    v109 = sel_getName(a2);
    uint64_t v62 = 45;
    if (v61) {
      uint64_t v62 = 43;
    }
    v59(3, "%c[%{public}s %{public}s]:%i failed to initialize with stored config - %{public}@", v62, v103, v109, 261, v57);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v63 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    int v64 = object_getClass(v8);
    if (class_isMetaClass(v64)) {
      int v65 = 43;
    }
    else {
      int v65 = 45;
    }
    long long v66 = object_getClassName(v8);
    __int16 v67 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v115 = v65;
    __int16 v116 = 2082;
    v117 = v66;
    __int16 v118 = 2082;
    v119 = v67;
    __int16 v120 = 1024;
    int v121 = 261;
    __int16 v122 = 2114;
    v123 = v57;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i failed to initialize with stored config - %{public}@", buf, 0x2Cu);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v68 = NFLogGetLogger();
  if (v68)
  {
    __int16 v69 = (void (*)(uint64_t, const char *, ...))v68;
    int v70 = object_getClass(v8);
    BOOL v71 = class_isMetaClass(v70);
    int v72 = object_getClassName(v8);
    v110 = sel_getName(a2);
    uint64_t v73 = 45;
    if (v71) {
      uint64_t v73 = 43;
    }
    v69(3, "%c[%{public}s %{public}s]:%i init with empty config instead", v73, v72, v110, 262);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v74 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
  {
    __int16 v75 = object_getClass(v8);
    if (class_isMetaClass(v75)) {
      int v76 = 43;
    }
    else {
      int v76 = 45;
    }
    __int16 v77 = object_getClassName(v8);
    int v78 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v115 = v76;
    __int16 v116 = 2082;
    v117 = v77;
    __int16 v118 = 2082;
    v119 = v78;
    __int16 v120 = 1024;
    int v121 = 262;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i init with empty config instead", buf, 0x22u);
  }

  __int16 v79 = [(NFExpressConfig *)v8 reconfigureWithArray:&__NSArray0__struct updateStorage:1 avoidChangingRouting:1 restoreAuthorization:0];

  if (!v79)
  {
LABEL_86:

LABEL_87:
    v101 = v8;
    goto LABEL_88;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v80 = NFLogGetLogger();
  if (v80)
  {
    __int16 v81 = (void (*)(uint64_t, const char *, ...))v80;
    int v82 = object_getClass(v8);
    BOOL v83 = class_isMetaClass(v82);
    v104 = object_getClassName(v8);
    v111 = sel_getName(a2);
    uint64_t v84 = 45;
    if (v83) {
      uint64_t v84 = 43;
    }
    v81(3, "%c[%{public}s %{public}s]:%i failed to initialize with empty config - %{public}@", v84, v104, v111, 265, v79);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v85 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
  {
    v86 = object_getClass(v8);
    if (class_isMetaClass(v86)) {
      int v87 = 43;
    }
    else {
      int v87 = 45;
    }
    v88 = object_getClassName(v8);
    v89 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v115 = v87;
    __int16 v116 = 2082;
    v117 = v88;
    __int16 v118 = 2082;
    v119 = v89;
    __int16 v120 = 1024;
    int v121 = 265;
    __int16 v122 = 2114;
    v123 = v79;
    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i failed to initialize with empty config - %{public}@", buf, 0x2Cu);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v90 = NFLogGetLogger();
  if (v90)
  {
    v91 = (void (*)(uint64_t, const char *, ...))v90;
    v92 = object_getClass(v8);
    BOOL v93 = class_isMetaClass(v92);
    v94 = object_getClassName(v8);
    v112 = sel_getName(a2);
    uint64_t v95 = 45;
    if (v93) {
      uint64_t v95 = 43;
    }
    v91(3, "%c[%{public}s %{public}s]:%i Express Mode is disabled", v95, v94, v112, 266);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v96 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
  {
    v97 = object_getClass(v8);
    if (class_isMetaClass(v97)) {
      int v98 = 43;
    }
    else {
      int v98 = 45;
    }
    v99 = object_getClassName(v8);
    v100 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v115 = v98;
    __int16 v116 = 2082;
    v117 = v99;
    __int16 v118 = 2082;
    v119 = v100;
    __int16 v120 = 1024;
    int v121 = 266;
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Express Mode is disabled", buf, 0x22u);
  }

LABEL_85:
  v101 = 0;
LABEL_88:

  return v101;
}

- (id)arrayConfigFromDictionary:(id)a3
{
  id v5 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10014CF74;
  v10[3] = &unk_100304E50;
  v10[4] = self;
  id v6 = (id)objc_opt_new();
  id v11 = v6;
  SEL v12 = a2;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)restoreAuthForApplet:(id)a3
{
  id v5 = a3;
  if ([v5 authTransientSupport])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Applet already requires auth", v11, ClassName, Name, 392);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    SEL v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v66 = v14;
      __int16 v67 = 2082;
      uint64_t v68 = object_getClassName(self);
      __int16 v69 = 2082;
      int v70 = sel_getName(a2);
      __int16 v71 = 1024;
      int v72 = 392;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet already requires auth", buf, 0x22u);
    }
    goto LABEL_37;
  }
  uint64_t v15 = [(NFExpressConfig *)self getSecureElementWrapperAndSetRouting];
  if (v15)
  {
    SEL v12 = v15;
    id v62 = v5;
    uint64_t v16 = +[NSArray arrayWithObjects:&v62 count:1];
    unsigned int v17 = sub_1001FE394(v12, 1, 0xFFFFFFFF, v16, 0);

    if (!v17)
    {
      id v53 = sub_10024379C(v12);
LABEL_37:
      id v37 = 0;
      goto LABEL_38;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      int v19 = (void (*)(uint64_t, const char *, ...))v18;
      os_log_type_t v20 = object_getClass(self);
      BOOL v21 = class_isMetaClass(v20);
      id v22 = object_getClassName(self);
      __int16 v57 = sel_getName(a2);
      uint64_t v23 = 45;
      if (v21) {
        uint64_t v23 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Failed to restore authorization on applet", v23, v22, v57, 407);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      v27 = object_getClassName(self);
      uint64_t v28 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v66 = v26;
      __int16 v67 = 2082;
      uint64_t v68 = v27;
      __int16 v69 = 2082;
      int v70 = v28;
      __int16 v71 = 1024;
      int v72 = 407;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore authorization on applet", buf, 0x22u);
    }

    id v59 = objc_alloc((Class)NSError);
    uint64_t v29 = +[NSString stringWithUTF8String:"nfcd"];
    uint64_t v30 = v17;
    v60[0] = NSLocalizedDescriptionKey;
    if (v17 >= 0x47) {
      int v31 = 71;
    }
    else {
      int v31 = v17;
    }
    BOOL v32 = +[NSString stringWithUTF8String:off_100304E70[v31]];
    v61[0] = v32;
    v61[1] = &off_10031C360;
    v60[1] = @"Line";
    v60[2] = @"Method";
    id v33 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v61[2] = v33;
    v60[3] = NSDebugDescriptionErrorKey;
    id v34 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 408];
    v61[3] = v34;
    v60[4] = NSLocalizedFailureReasonErrorKey;
    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to restore transient auth"];
    v61[4] = v35;
    uint64_t v36 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:5];
    id v37 = [v59 initWithDomain:v29 code:v30 userInfo:v36];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v38 = NFLogGetLogger();
    if (v38)
    {
      BOOL v39 = (void (*)(uint64_t, const char *, ...))v38;
      int v40 = object_getClass(self);
      BOOL v41 = class_isMetaClass(v40);
      __int16 v55 = object_getClassName(self);
      uint64_t v58 = sel_getName(a2);
      uint64_t v42 = 45;
      if (v41) {
        uint64_t v42 = 43;
      }
      v39(3, "%c[%{public}s %{public}s]:%i Failed to load SE for applet: %{public}@", v42, v55, v58, 398, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      int v44 = object_getClass(self);
      if (class_isMetaClass(v44)) {
        int v45 = 43;
      }
      else {
        int v45 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v66 = v45;
      __int16 v67 = 2082;
      uint64_t v68 = object_getClassName(self);
      __int16 v69 = 2082;
      int v70 = sel_getName(a2);
      __int16 v71 = 1024;
      int v72 = 398;
      __int16 v73 = 2114;
      id v74 = v5;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to load SE for applet: %{public}@", buf, 0x2Cu);
    }

    id v46 = objc_alloc((Class)NSError);
    uint64_t v47 = +[NSString stringWithUTF8String:"nfcd"];
    v63[0] = NSLocalizedDescriptionKey;
    id v48 = +[NSString stringWithUTF8String:"Stack Error"];
    v64[0] = v48;
    v64[1] = &off_10031C348;
    v63[1] = @"Line";
    v63[2] = @"Method";
    id v49 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v64[2] = v49;
    v63[3] = NSDebugDescriptionErrorKey;
    id v50 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 399];
    v64[3] = v50;
    v63[4] = NSLocalizedFailureReasonErrorKey;
    id v51 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to initialize SE wrapper"];
    v64[4] = v51;
    long long v52 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:5];
    id v37 = [v46 initWithDomain:v47 code:15 userInfo:v52];

    SEL v12 = 0;
  }
LABEL_38:

  return v37;
}

- (id)passForAid:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_passes;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"appletIdentifier" v15];
        id v12 = [v4 caseInsensitiveCompare:v11];

        if (!v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (void)removeAppletsFromConfig:(id)a3
{
  id v5 = a3;
  id v6 = [(NFExpressConfig *)self getSecureElementWrapperAndSetRouting];
  if (v6)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (!v8)
    {

      goto LABEL_31;
    }
    id v9 = v8;
    int v31 = v6;
    id v32 = v5;
    char v10 = 0;
    uint64_t v11 = *(void *)v34;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          id v15 = [v14 identifier];
          if (!v15) {
            goto LABEL_16;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v14 = 0;
            goto LABEL_16;
          }
          id v15 = v13;
          id v14 = 0;
          if (!v15) {
            goto LABEL_16;
          }
        }
        long long v16 = [(NFExpressConfig *)self passForAid:v15];
        if (v16)
        {
          [(NSMutableArray *)self->_passes removeObject:v16];
          char v10 = 1;
        }

LABEL_16:
      }
      id v9 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (!v9)
      {

        id v6 = v31;
        id v5 = v32;
        if (v10)
        {
          [(NFExpressConfig *)self updateExpressAppletNumbers];
          [(NFExpressConfig *)self updateStorage];
        }
        goto LABEL_31;
      }
    }
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    long long v18 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v23 = [(NFExpressConfig *)self seName];
    uint64_t v24 = 45;
    if (isMetaClass) {
      uint64_t v24 = 43;
    }
    v18(3, "%c[%{public}s %{public}s]:%i Failed to initialize %{public}@ wrapper", v24, ClassName, Name, 433, v23);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    int v26 = object_getClass(self);
    if (class_isMetaClass(v26)) {
      int v27 = 43;
    }
    else {
      int v27 = 45;
    }
    uint64_t v28 = object_getClassName(self);
    uint64_t v29 = sel_getName(a2);
    uint64_t v30 = [(NFExpressConfig *)self seName];
    *(_DWORD *)buf = 67110146;
    int v39 = v27;
    id v6 = 0;
    __int16 v40 = 2082;
    BOOL v41 = v28;
    __int16 v42 = 2082;
    BOOL v43 = v29;
    __int16 v44 = 1024;
    int v45 = 433;
    __int16 v46 = 2114;
    uint64_t v47 = v30;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initialize %{public}@ wrapper", buf, 0x2Cu);
  }
LABEL_31:
}

- (id)reconfigureWithArray:(id)a3 updateStorage:(BOOL)a4 avoidChangingRouting:(BOOL)a5 restoreAuthorization:(BOOL)a6
{
  if (!a3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v91 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v95 = 45;
      if (isMetaClass) {
        uint64_t v95 = 43;
      }
      v91(3, "%c[%{public}s %{public}s]:%i no array supplied", v95, ClassName, Name, 524);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v96 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      v97 = object_getClass(self);
      if (class_isMetaClass(v97)) {
        int v98 = 43;
      }
      else {
        int v98 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v168 = v98;
      __int16 v169 = 2082;
      v170 = object_getClassName(self);
      __int16 v171 = 2082;
      v172 = sel_getName(a2);
      __int16 v173 = 1024;
      int v174 = 524;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i no array supplied", buf, 0x22u);
    }

    id v99 = objc_alloc((Class)NSError);
    v132 = +[NSString stringWithUTF8String:"nfcd"];
    v159[0] = NSLocalizedDescriptionKey;
    v133 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v160[0] = v133;
    v160[1] = &off_10031C390;
    v159[1] = @"Line";
    v159[2] = @"Method";
    id v89 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v160[2] = v89;
    v159[3] = NSDebugDescriptionErrorKey;
    id obja = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 525];
    v160[3] = obja;
    id v100 = +[NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:4];
    id v131 = [v99 initWithDomain:v132 code:10 userInfo:v100];
    goto LABEL_113;
  }
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  if (self) {
    passes = self->_passes;
  }
  else {
    passes = 0;
  }
  v132 = passes;
  v133 = [(NFExpressConfig *)self extractConfigFrom:a3];
  if (!v133)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v101 = NFLogGetLogger();
    if (v101)
    {
      v102 = (void (*)(uint64_t, const char *, ...))v101;
      v103 = object_getClass(self);
      BOOL v104 = class_isMetaClass(v103);
      v105 = object_getClassName(self);
      v128 = sel_getName(a2);
      uint64_t v106 = 45;
      if (v104) {
        uint64_t v106 = 43;
      }
      v102(3, "%c[%{public}s %{public}s]:%i Failed to create expressConfig", v106, v105, v128, 533);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v107 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      v108 = object_getClass(self);
      if (class_isMetaClass(v108)) {
        int v109 = 43;
      }
      else {
        int v109 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v168 = v109;
      __int16 v169 = 2082;
      v170 = object_getClassName(self);
      __int16 v171 = 2082;
      v172 = sel_getName(a2);
      __int16 v173 = 1024;
      int v174 = 533;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create expressConfig", buf, 0x22u);
    }

    id v110 = objc_alloc((Class)NSError);
    id v89 = +[NSString stringWithUTF8String:"nfcd"];
    v157[0] = NSLocalizedDescriptionKey;
    id obja = +[NSString stringWithUTF8String:"Unknown Error"];
    v158[0] = obja;
    v158[1] = &off_10031C3A8;
    v157[1] = @"Line";
    v157[2] = @"Method";
    id v100 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v158[2] = v100;
    v157[3] = NSDebugDescriptionErrorKey;
    id v111 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 534];
    v158[3] = v111;
    id v112 = +[NSDictionary dictionaryWithObjects:v158 forKeys:v157 count:4];
    id v131 = [v110 initWithDomain:v89 code:6 userInfo:v112];
    goto LABEL_112;
  }
  id v12 = self;
  if (-[NSMutableArray count](v132, "count") && ![v133 count])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFLogGetLogger();
    if (v13)
    {
      id v14 = (void (*)(uint64_t, const char *, ...))v13;
      id v15 = object_getClass(self);
      BOOL v16 = class_isMetaClass(v15);
      long long v17 = object_getClassName(self);
      v126 = sel_getName(a2);
      uint64_t v18 = 45;
      if (v16) {
        uint64_t v18 = 43;
      }
      v14(6, "%c[%{public}s %{public}s]:%i Config is now empty! Need to deselect all", v18, v17, v126, 538);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v168 = v21;
      __int16 v169 = 2082;
      v170 = object_getClassName(self);
      __int16 v171 = 2082;
      v172 = sel_getName(a2);
      __int16 v173 = 1024;
      int v174 = 538;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Config is now empty! Need to deselect all", buf, 0x22u);
    }

    id v22 = [(NFExpressConfig *)self deactivateExpressConfig];
    id v12 = self;
  }
  if (([(NFExpressConfig *)v12 validateAndUpdateExpressConfig:v133 avoidChangingRouting:v8] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    objc_super v113 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v113)
    {
      v114 = object_getClass(self);
      if (class_isMetaClass(v114)) {
        uint64_t v115 = 43;
      }
      else {
        uint64_t v115 = 45;
      }
      __int16 v116 = object_getClassName(self);
      v117 = sel_getName(a2);
      v113(3, "%c[%{public}s %{public}s]:%i Validation of express config failed", v115, v116, v117, 543);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v118 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      v119 = object_getClass(self);
      if (class_isMetaClass(v119)) {
        int v120 = 43;
      }
      else {
        int v120 = 45;
      }
      int v121 = object_getClassName(self);
      __int16 v122 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v168 = v120;
      __int16 v169 = 2082;
      v170 = v121;
      __int16 v171 = 2082;
      v172 = v122;
      __int16 v173 = 1024;
      int v174 = 543;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation of express config failed", buf, 0x22u);
    }

    id v123 = objc_alloc((Class)NSError);
    id v89 = +[NSString stringWithUTF8String:"nfcd"];
    v155[0] = NSLocalizedDescriptionKey;
    id obja = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v156[0] = obja;
    v156[1] = &off_10031C3C0;
    v155[1] = @"Line";
    v155[2] = @"Method";
    id v100 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v156[2] = v100;
    v155[3] = NSDebugDescriptionErrorKey;
    id v111 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 544];
    v156[3] = v111;
    v155[4] = NSLocalizedFailureReasonErrorKey;
    id v112 = [objc_alloc((Class)NSString) initWithFormat:@"Validation failed for express config"];
    v156[4] = v112;
    v124 = +[NSDictionary dictionaryWithObjects:v156 forKeys:v155 count:5];
    id v131 = [v123 initWithDomain:v89 code:10 userInfo:v124];

LABEL_112:
LABEL_113:

    goto LABEL_114;
  }
  if (self)
  {
    sub_10026E2D8(v23);
    int v25 = *(void **)(v24 + 3824);
    int v26 = self->_passes;
    id v27 = v133;
    uint64_t v28 = [v25 processConfigurationChange:v26 newConfiguration:v27];

    id v29 = v28;
    uint64_t v30 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v27];
    int v31 = self->_passes;
    self->_passes = v30;

    [(NFExpressConfig *)self updateExpressAppletNumbers];
    id v32 = objc_alloc((Class)NSString);
    long long v33 = [(NFExpressConfig *)self seName];
    id v34 = [v32 initWithFormat:@"%@: new config", v33];
    [(NFExpressConfig *)self dumpConfig:v27 logLevel:7 prefix:v34];

    self->_expressConfigUpdateRequired = 1;
  }
  else
  {
    id v29 = 0;
  }
  id v130 = v29;
  long long v35 = self;
  if (v9)
  {
    [(NFExpressConfig *)self updateStorage];
    long long v35 = self;
  }
  id v131 = 0;
  if (v7 && !v8)
  {
    v129 = v132;
    if (v35)
    {
      id obj = [(NFExpressConfig *)v35 getSecureElementWrapperAndSetRouting];
      v134 = objc_opt_new();
      v135 = objc_opt_new();
      uint64_t v148 = 0;
      v149 = &v148;
      uint64_t v150 = 0x3032000000;
      v151 = sub_10000B868;
      v152 = sub_10014E108;
      id v153 = 0;
      long long v144 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      long long v36 = v129;
      id v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v144 objects:buf count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v145;
        do
        {
          for (i = 0; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v145 != v38) {
              objc_enumerationMutation(v36);
            }
            __int16 v40 = *(void **)(*((void *)&v144 + 1) + 8 * i);
            BOOL v41 = [v40 objectForKeyedSubscript:@"appletIdentifier"];
            __int16 v42 = [v40 objectForKeyedSubscript:@"keyIdentifier"];
            BOOL v43 = sub_1002473C8(obj, v41);
            if (([(NSMutableArray *)self->_passes containsObject:v40] & 1) == 0)
            {
              if (v42) {
                BOOL v44 = v43 == 0;
              }
              else {
                BOOL v44 = 1;
              }
              if (v44)
              {
                if (v43 && ([v43 authTransientSupport] & 1) == 0) {
                  [v134 addObject:v43];
                }
              }
              else
              {
                int v45 = [v135 objectForKeyedSubscript:v41];
                BOOL v46 = v45 == 0;

                if (v46)
                {
                  uint64_t v47 = objc_opt_new();
                  [v135 setObject:v47 forKeyedSubscript:v41];
                }
                id v48 = [v135 objectForKeyedSubscript:v41];
                [v48 addObject:v42];
              }
            }
          }
          id v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v144 objects:buf count:16];
        }
        while (v37);
      }

      id v49 = self;
      if ([v134 count])
      {
        uint64_t v50 = sub_1001FE394(obj, 1, 0xFFFFFFFF, v134, 0);
        if (v50)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v51)
          {
            long long v52 = object_getClass(self);
            if (class_isMetaClass(v52)) {
              uint64_t v53 = 43;
            }
            else {
              uint64_t v53 = 45;
            }
            int v54 = object_getClassName(self);
            __int16 v55 = sel_getName("_restoreAuthorizationOnRemovedAppletsAndKeysWithOldConfig:");
            v51(3, "%c[%{public}s %{public}s]:%i Failed to restore authorization on applet (%d)", v53, v54, v55, 499, v50);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v56 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            __int16 v57 = object_getClass(self);
            if (class_isMetaClass(v57)) {
              int v58 = 43;
            }
            else {
              int v58 = 45;
            }
            id v59 = object_getClassName(self);
            int v60 = sel_getName("_restoreAuthorizationOnRemovedAppletsAndKeysWithOldConfig:");
            *(_DWORD *)v161 = 67110146;
            *(_DWORD *)&v161[4] = v58;
            *(_WORD *)v162 = 2082;
            *(void *)&v162[2] = v59;
            *(_WORD *)&v162[10] = 2082;
            *(void *)&v162[12] = v60;
            *(_WORD *)&v162[20] = 1024;
            *(_DWORD *)&v162[22] = 499;
            *(_WORD *)&v162[26] = 1024;
            *(_DWORD *)&v162[28] = v50;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore authorization on applet (%d)", v161, 0x28u);
          }

          id v61 = objc_alloc((Class)NSError);
          id v62 = +[NSString stringWithUTF8String:"nfcd"];
          v165[0] = NSLocalizedDescriptionKey;
          if (v50 >= 0x47) {
            int v63 = 71;
          }
          else {
            int v63 = v50;
          }
          int v64 = +[NSString stringWithUTF8String:off_100304E70[v63]];
          v166[0] = v64;
          v166[1] = &off_10031C378;
          v165[1] = @"Line";
          v165[2] = @"Method";
          id v65 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_restoreAuthorizationOnRemovedAppletsAndKeysWithOldConfig:")];
          v166[2] = v65;
          v165[3] = NSDebugDescriptionErrorKey;
          id v66 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_restoreAuthorizationOnRemovedAppletsAndKeysWithOldConfig:"), 500];
          v166[3] = v66;
          v165[4] = NSLocalizedFailureReasonErrorKey;
          id v67 = [objc_alloc((Class)NSString) initWithFormat:@"Restoring authorization failed"];
          v166[4] = v67;
          uint64_t v68 = +[NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:5];
          id v69 = [v61 initWithDomain:v62 code:v50 userInfo:v68];
          int v70 = (void *)v149[5];
          v149[5] = (uint64_t)v69;

          id v49 = self;
        }
        id v71 = sub_10024379C(obj);
      }
      *(void *)v161 = _NSConcreteStackBlock;
      *(void *)v162 = 3221225472;
      *(void *)&v162[8] = sub_10014E110;
      *(void *)&v162[16] = &unk_1003050B8;
      id v72 = obj;
      *(void *)&v162[24] = v72;
      v163 = v49;
      v164 = &v148;
      [v135 enumerateKeysAndObjectsUsingBlock:v161];
      id v131 = (id)v149[5];

      _Block_object_dispose(&v148, 8);
    }
    else
    {
      id v131 = 0;
    }
  }
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id obja = v130;
  id v73 = [obja countByEnumeratingWithState:&v140 objects:v154 count:16];
  if (v73)
  {
    uint64_t v74 = *(void *)v141;
    do
    {
      for (j = 0; j != v73; j = (char *)j + 1)
      {
        if (*(void *)v141 != v74) {
          objc_enumerationMutation(obja);
        }
        uint64_t v76 = *(void *)(*((void *)&v140 + 1) + 8 * (void)j);
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v77 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v77)
        {
          int v78 = object_getClass(self);
          if (class_isMetaClass(v78)) {
            uint64_t v79 = 43;
          }
          else {
            uint64_t v79 = 45;
          }
          uint64_t v80 = object_getClassName(self);
          __int16 v81 = sel_getName(a2);
          v77(6, "%c[%{public}s %{public}s]:%i posting %{public}@ to SESD", v79, v80, v81, 563, v76);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v82 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v83 = object_getClass(self);
          if (class_isMetaClass(v83)) {
            int v84 = 43;
          }
          else {
            int v84 = 45;
          }
          v85 = object_getClassName(self);
          v86 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v168 = v84;
          __int16 v169 = 2082;
          v170 = v85;
          __int16 v171 = 2082;
          v172 = v86;
          __int16 v173 = 1024;
          int v174 = 563;
          __int16 v175 = 2114;
          uint64_t v176 = v76;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i posting %{public}@ to SESD", buf, 0x2Cu);
        }

        int v87 = +[_NFHardwareManager sharedHardwareManager];
        v88 = [v87 sesdEventPublisher];
        [v88 sendXpcNotificationEventWithDictionary:v76];
      }
      id v73 = [obja countByEnumeratingWithState:&v140 objects:v154 count:16];
    }
    while (v73);
  }
  id v89 = obja;
LABEL_114:

  return v131;
}

- (id)reconfigureWithArray:(id)a3 restoreAuthorization:(BOOL)a4 updateStorage:(BOOL)a5
{
  return [(NFExpressConfig *)self reconfigureWithArray:a3 updateStorage:a5 avoidChangingRouting:0 restoreAuthorization:a4];
}

- (id)getExpressAidsForType:(unsigned __int8)a3 onlyInExpress:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  id v19 = (id)objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v7 = self->_passes;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v4)
        {
          uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKeyedSubscript:@"expressEnabled"];
          unsigned int v14 = [v13 BOOLValue];

          if (!v14) {
            continue;
          }
        }
        id v15 = [v12 objectForKeyedSubscript:@"appletIdentifier"];
        BOOL v16 = [v12 objectForKeyedSubscript:@"ExpressType"];
        unsigned int v17 = +[NFExpressConfig expressTypeForATLConfigKey:v16];

        if (v17 == v5) {
          [v19 addObject:v15];
        }
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v19;
}

- (id)getExpressAidsForType:(unsigned __int8)a3
{
  return [(NFExpressConfig *)self getExpressAidsForType:a3 onlyInExpress:1];
}

- (unint64_t)getNumberOfExpressAidsForType:(unsigned __int8)a3
{
  id v3 = [(NFExpressConfig *)self getExpressAidsForType:a3];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)deactivateExpressConfig
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 630);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v18 = v12;
    __int16 v19 = 2082;
    long long v20 = object_getClassName(self);
    __int16 v21 = 2082;
    long long v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 630;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  uint64_t v13 = [(NFExpressConfig *)self getSecureElementWrapperAndSetRouting];
  unsigned int v14 = sub_1002457D4(v13);

  return v14;
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_passes count] == 0;
}

- (BOOL)isSEOperational
{
  v2 = [(NFExpressConfig *)self getSecureElementWrapper];
  unsigned __int8 v3 = [v2 isOperational];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_allAids, 0);

  objc_storeStrong((id *)&self->_passes, 0);
}

@end