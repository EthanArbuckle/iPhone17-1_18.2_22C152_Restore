@interface NFWalletPresentationSettingsSESD
+ (id)defaultSetting;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)doubleClickEnable;
- (BOOL)isEligibleForDoubleClick;
- (NFWalletPresentationSettingsSESD)initWithSuiteName:(id)a3;
- (NSString)defaultAppIdentifier;
- (unint64_t)walletDomain;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDefaultAppIdentifier:(id)a3;
- (void)setDoubleClickEnable:(BOOL)a3;
- (void)setWalletDomain:(unint64_t)a3;
@end

@implementation NFWalletPresentationSettingsSESD

+ (id)defaultSetting
{
  v2 = [[NFWalletPresentationSettingsSESD alloc] initWithSuiteName:@"com.apple.seserviced.contactlessCredential.settings"];

  return v2;
}

- (NFWalletPresentationSettingsSESD)initWithSuiteName:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NFWalletPresentationSettingsSESD;
  v3 = [(NFWalletPresentationSettings *)&v10 initWithSuiteName:a3];
  v4 = v3;
  if (v3)
  {
    [(NFWalletPresentationSettingsSESD *)v3 setWalletDomain:-1];
    v5 = [(NFWalletPresentationSettings *)v4 defaults];
    [v5 addObserver:v4 forKeyPath:@"defaultAppIdentifier" options:5 context:off_100346E00];

    v6 = [(NFWalletPresentationSettings *)v4 defaults];
    [v6 addObserver:v4 forKeyPath:@"domain" options:5 context:off_100346E08];

    v7 = [(NFWalletPresentationSettings *)v4 defaults];
    [v7 addObserver:v4 forKeyPath:@"doubleClickEnabled" options:5 context:off_100346E10];

    v8 = v4;
  }

  return v4;
}

- (void)dealloc
{
  v3 = [(NFWalletPresentationSettings *)self defaults];
  [v3 removeObserver:self forKeyPath:@"defaultAppIdentifier"];

  v4 = [(NFWalletPresentationSettings *)self defaults];
  [v4 removeObserver:self forKeyPath:@"domain"];

  v5 = [(NFWalletPresentationSettings *)self defaults];
  [v5 removeObserver:self forKeyPath:@"doubleClickEnabled"];

  v6.receiver = self;
  v6.super_class = (Class)NFWalletPresentationSettingsSESD;
  [(NFWalletPresentationSettingsSESD *)&v6 dealloc];
}

- (BOOL)isEligibleForDoubleClick
{
  v3 = [(NFWalletPresentationSettingsSESD *)self defaultAppIdentifier];
  if ([v3 lengthOfBytesUsingEncoding:4]
    && ((id)[(NFWalletPresentationSettingsSESD *)self walletDomain] == (id)1
     || (id)[(NFWalletPresentationSettingsSESD *)self walletDomain] == (id)2))
  {
    BOOL v4 = [(NFWalletPresentationSettingsSESD *)self doubleClickEnable];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  if (off_100346E00 == a6)
  {
    v15 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v157 = v11;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v63 = [(__CFString *)v15 lengthOfBytesUsingEncoding:4];
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          v65 = (void (*)(uint64_t, const char *, ...))Logger;
          if (v63)
          {
            if (Logger)
            {
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v69 = [(NFWalletPresentationSettingsSESD *)self defaultAppIdentifier];
              uint64_t v70 = 43;
              if (!isMetaClass) {
                uint64_t v70 = 45;
              }
              v65(6, "%c[%{public}s %{public}s]:%i %@ existing=%{public}@, new=%{public}@", v70, ClassName, Name, 112, @"defaultAppIdentifier", v69, v15);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v71 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              v72 = object_getClass(self);
              if (class_isMetaClass(v72)) {
                int v73 = 43;
              }
              else {
                int v73 = 45;
              }
              v74 = object_getClassName(self);
              v75 = sel_getName(a2);
              v76 = [(NFWalletPresentationSettingsSESD *)self defaultAppIdentifier];
              *(_DWORD *)buf = 67110658;
              int v161 = v73;
              __int16 v162 = 2082;
              v163 = v74;
              __int16 v164 = 2082;
              v165 = v75;
              __int16 v166 = 1024;
              int v167 = 112;
              __int16 v168 = 2112;
              CFStringRef v169 = @"defaultAppIdentifier";
              __int16 v170 = 2114;
              *(void *)v171 = v76;
              *(_WORD *)&v171[8] = 2114;
              v172 = v15;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@ existing=%{public}@, new=%{public}@", buf, 0x40u);
            }
            [(NFWalletPresentationSettingsSESD *)self setDefaultAppIdentifier:v15];
            goto LABEL_131;
          }
          if (Logger)
          {
            v135 = object_getClass(self);
            BOOL v136 = class_isMetaClass(v135);
            v137 = object_getClassName(self);
            v153 = sel_getName(a2);
            uint64_t v138 = 45;
            if (v136) {
              uint64_t v138 = 43;
            }
            v65(4, "%c[%{public}s %{public}s]:%i Invalid appId; 0 length", v138, v137, v153, 108);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v62 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v139 = object_getClass(self);
            if (class_isMetaClass(v139)) {
              int v140 = 43;
            }
            else {
              int v140 = 45;
            }
            *(_DWORD *)buf = 67109890;
            int v161 = v140;
            __int16 v162 = 2082;
            v163 = object_getClassName(self);
            __int16 v164 = 2082;
            v165 = sel_getName(a2);
            __int16 v166 = 1024;
            int v167 = 108;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid appId; 0 length",
              buf,
              0x22u);
          }
LABEL_47:

LABEL_107:
          goto LABEL_108;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v91 = NFLogGetLogger();
        if (v91)
        {
          v92 = (void (*)(uint64_t, const char *, ...))v91;
          v93 = object_getClass(self);
          BOOL v94 = class_isMetaClass(v93);
          v141 = object_getClassName(self);
          v149 = sel_getName(a2);
          uint64_t v95 = 45;
          if (v94) {
            uint64_t v95 = 43;
          }
          v92(4, "%c[%{public}s %{public}s]:%i Unexpected data type for appId: %@", v95, v141, v149, 103, v15);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v22 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v96 = object_getClass(self);
          if (class_isMetaClass(v96)) {
            int v97 = 43;
          }
          else {
            int v97 = 45;
          }
          *(_DWORD *)buf = 67110146;
          int v161 = v97;
          __int16 v162 = 2082;
          v163 = object_getClassName(self);
          __int16 v164 = 2082;
          v165 = sel_getName(a2);
          __int16 v166 = 1024;
          int v167 = 103;
          __int16 v168 = 2112;
          CFStringRef v169 = v15;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected data type for appId: %@", buf, 0x2Cu);
        }
LABEL_46:

        v62 = objc_opt_new();
        [(NFWalletPresentationSettingsSESD *)self setDefaultAppIdentifier:v62];
        goto LABEL_47;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v16 = NFLogGetLogger();
      if (v16)
      {
        v17 = (void (*)(uint64_t, const char *, ...))v16;
        v18 = object_getClass(self);
        BOOL v19 = class_isMetaClass(v18);
        v20 = object_getClassName(self);
        v144 = sel_getName(a2);
        uint64_t v21 = 45;
        if (v19) {
          uint64_t v21 = 43;
        }
        v17(4, "%c[%{public}s %{public}s]:%i No settings found; init to default empty id", v21, v20, v144, 98);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v22 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      v23 = object_getClass(self);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v161 = v24;
      __int16 v162 = 2082;
      v163 = object_getClassName(self);
      __int16 v164 = 2082;
      v165 = sel_getName(a2);
      __int16 v166 = 1024;
      int v167 = 98;
      v25 = "%c[%{public}s %{public}s]:%i No settings found; init to default empty id";
      v26 = v22;
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v54 = NFLogGetLogger();
      if (v54)
      {
        v55 = (void (*)(uint64_t, const char *, ...))v54;
        v56 = object_getClass(self);
        BOOL v57 = class_isMetaClass(v56);
        v58 = object_getClassName(self);
        v147 = sel_getName(a2);
        uint64_t v59 = 45;
        if (v57) {
          uint64_t v59 = 43;
        }
        v55(5, "%c[%{public}s %{public}s]:%i Invalid setting, default to none", v59, v58, v147, 93);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v22 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      v60 = object_getClass(self);
      if (class_isMetaClass(v60)) {
        int v61 = 43;
      }
      else {
        int v61 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v161 = v61;
      __int16 v162 = 2082;
      v163 = object_getClassName(self);
      __int16 v164 = 2082;
      v165 = sel_getName(a2);
      __int16 v166 = 1024;
      int v167 = 93;
      v25 = "%c[%{public}s %{public}s]:%i Invalid setting, default to none";
      v26 = v22;
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, 0x22u);
    goto LABEL_46;
  }
  if (off_100346E08 == a6)
  {
    v15 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    int v29 = objc_opt_isKindOfClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v30 = NFLogGetLogger();
      if (v30)
      {
        v31 = (void (*)(uint64_t, const char *, ...))v30;
        v32 = object_getClass(self);
        BOOL v33 = class_isMetaClass(v32);
        v34 = object_getClassName(self);
        v145 = sel_getName(a2);
        uint64_t v35 = 45;
        if (v33) {
          uint64_t v35 = 43;
        }
        v31(4, "%c[%{public}s %{public}s]:%i No settings found; init to unknown domain", v35, v34, v145, 120);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_94;
      }
      v37 = object_getClass(self);
      if (class_isMetaClass(v37)) {
        int v38 = 43;
      }
      else {
        int v38 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v161 = v38;
      __int16 v162 = 2082;
      v163 = object_getClassName(self);
      __int16 v164 = 2082;
      v165 = sel_getName(a2);
      __int16 v166 = 1024;
      int v167 = 120;
      v39 = "%c[%{public}s %{public}s]:%i No settings found; init to unknown domain";
      v40 = v36;
      uint32_t v41 = 34;
LABEL_93:
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
LABEL_94:

      [(NFWalletPresentationSettingsSESD *)self setWalletDomain:0];
      goto LABEL_107;
    }
    if (((isKindOfClass | v29) & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v98 = NFLogGetLogger();
      if (v98)
      {
        v99 = (void (*)(uint64_t, const char *, ...))v98;
        v100 = object_getClass(self);
        BOOL v101 = class_isMetaClass(v100);
        v142 = object_getClassName(self);
        v150 = sel_getName(a2);
        uint64_t v102 = 45;
        if (v101) {
          uint64_t v102 = 43;
        }
        v99(4, "%c[%{public}s %{public}s]:%i Unexpected data type for domain: %@, reset to unknown domain", v102, v142, v150, 125, v15);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_94;
      }
      v103 = object_getClass(self);
      if (class_isMetaClass(v103)) {
        int v104 = 43;
      }
      else {
        int v104 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v161 = v104;
      __int16 v162 = 2082;
      v163 = object_getClassName(self);
      __int16 v164 = 2082;
      v165 = sel_getName(a2);
      __int16 v166 = 1024;
      int v167 = 125;
      __int16 v168 = 2112;
      CFStringRef v169 = v15;
      v39 = "%c[%{public}s %{public}s]:%i Unexpected data type for domain: %@, reset to unknown domain";
      v40 = v36;
      uint32_t v41 = 44;
      goto LABEL_93;
    }
    if (isKindOfClass) {
      v77 = (__CFString *)[(__CFString *)v15 integerValue];
    }
    else {
      v77 = (__CFString *)[(__CFString *)v15 unsignedIntegerValue];
    }
    v112 = v77;
    id v157 = v11;
    if ((unint64_t)v77 >= 6)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v113 = NFLogGetLogger();
      if (v113)
      {
        v114 = (void (*)(uint64_t, const char *, ...))v113;
        v115 = object_getClass(self);
        BOOL v116 = class_isMetaClass(v115);
        v117 = object_getClassName(self);
        v152 = sel_getName(a2);
        uint64_t v118 = 45;
        if (v116) {
          uint64_t v118 = 43;
        }
        v114(5, "%c[%{public}s %{public}s]:%i Invalid setting, default to unknown", v118, v117, v152, 133);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v119 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
      {
        v120 = object_getClass(self);
        if (class_isMetaClass(v120)) {
          int v121 = 43;
        }
        else {
          int v121 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v161 = v121;
        __int16 v162 = 2082;
        v163 = object_getClassName(self);
        __int16 v164 = 2082;
        v165 = sel_getName(a2);
        __int16 v166 = 1024;
        int v167 = 133;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid setting, default to unknown", buf, 0x22u);
      }

      v112 = 0;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v122 = NFLogGetLogger();
    if (v122)
    {
      v123 = (void (*)(uint64_t, const char *, ...))v122;
      v124 = object_getClass(self);
      BOOL v125 = class_isMetaClass(v124);
      v126 = object_getClassName(self);
      v127 = sel_getName(a2);
      unint64_t v155 = [(NFWalletPresentationSettingsSESD *)self walletDomain];
      uint64_t v128 = 43;
      if (!v125) {
        uint64_t v128 = 45;
      }
      v123(6, "%c[%{public}s %{public}s]:%i %@ existing=%{public}lu, new=%{public}lu", v128, v126, v127, 137, @"domain", v155, v112);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v129 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v130 = object_getClass(self);
      if (class_isMetaClass(v130)) {
        int v131 = 43;
      }
      else {
        int v131 = 45;
      }
      v132 = object_getClassName(self);
      v133 = sel_getName(a2);
      unint64_t v134 = [(NFWalletPresentationSettingsSESD *)self walletDomain];
      *(_DWORD *)buf = 67110658;
      int v161 = v131;
      __int16 v162 = 2082;
      v163 = v132;
      __int16 v164 = 2082;
      v165 = v133;
      __int16 v166 = 1024;
      int v167 = 137;
      __int16 v168 = 2112;
      CFStringRef v169 = @"domain";
      __int16 v170 = 2050;
      *(void *)v171 = v134;
      *(_WORD *)&v171[8] = 2050;
      v172 = v112;
      _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@ existing=%{public}lu, new=%{public}lu", buf, 0x40u);
    }

    [(NFWalletPresentationSettingsSESD *)self setWalletDomain:v112];
LABEL_131:

    id v11 = v157;
    goto LABEL_108;
  }
  if (off_100346E10 == a6)
  {
    v15 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v42 = NFLogGetLogger();
      if (v42)
      {
        v43 = (void (*)(uint64_t, const char *, ...))v42;
        v44 = object_getClass(self);
        BOOL v45 = class_isMetaClass(v44);
        v46 = object_getClassName(self);
        v146 = sel_getName(a2);
        uint64_t v47 = 45;
        if (v45) {
          uint64_t v47 = 43;
        }
        v43(4, "%c[%{public}s %{public}s]:%i No settings found; init to default dbl click", v47, v46, v146, 143);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v48 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_105;
      }
      v49 = object_getClass(self);
      if (class_isMetaClass(v49)) {
        int v50 = 43;
      }
      else {
        int v50 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v161 = v50;
      __int16 v162 = 2082;
      v163 = object_getClassName(self);
      __int16 v164 = 2082;
      v165 = sel_getName(a2);
      __int16 v166 = 1024;
      int v167 = 143;
      v51 = "%c[%{public}s %{public}s]:%i No settings found; init to default dbl click";
      v52 = v48;
      uint32_t v53 = 34;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v78 = [(__CFString *)v15 BOOLValue];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v79 = NFLogGetLogger();
        if (v79)
        {
          v80 = (void (*)(uint64_t, const char *, ...))v79;
          v81 = object_getClass(self);
          BOOL v82 = class_isMetaClass(v81);
          v158 = object_getClassName(self);
          id v83 = v11;
          v84 = sel_getName(a2);
          uint64_t v154 = [(NFWalletPresentationSettingsSESD *)self doubleClickEnable];
          v148 = v84;
          id v11 = v83;
          uint64_t v85 = 45;
          if (v82) {
            uint64_t v85 = 43;
          }
          v80(6, "%c[%{public}s %{public}s]:%i %@ existing=%{public}d, new=%{public}d", v85, v158, v148, 155, @"doubleClickEnabled", v154, v78);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v86 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          v87 = object_getClass(self);
          if (class_isMetaClass(v87)) {
            int v88 = 43;
          }
          else {
            int v88 = 45;
          }
          *(_DWORD *)buf = 67110658;
          int v161 = v88;
          __int16 v162 = 2082;
          v163 = object_getClassName(self);
          __int16 v164 = 2082;
          v165 = sel_getName(a2);
          __int16 v166 = 1024;
          int v167 = 155;
          __int16 v168 = 2112;
          CFStringRef v169 = @"doubleClickEnabled";
          __int16 v170 = 1026;
          *(_DWORD *)v171 = [(NFWalletPresentationSettingsSESD *)self doubleClickEnable];
          *(_WORD *)&v171[4] = 1026;
          *(_DWORD *)&v171[6] = v78;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@ existing=%{public}d, new=%{public}d", buf, 0x38u);
        }

        v89 = self;
        id v90 = v78;
        goto LABEL_106;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v105 = NFLogGetLogger();
      if (v105)
      {
        v106 = (void (*)(uint64_t, const char *, ...))v105;
        v107 = object_getClass(self);
        BOOL v108 = class_isMetaClass(v107);
        v143 = object_getClassName(self);
        v151 = sel_getName(a2);
        uint64_t v109 = 45;
        if (v108) {
          uint64_t v109 = 43;
        }
        v106(4, "%c[%{public}s %{public}s]:%i Unexpected data type for dbl click: %@", v109, v143, v151, 148, v15);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v48 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
LABEL_105:

        v89 = self;
        id v90 = 0;
LABEL_106:
        [(NFWalletPresentationSettingsSESD *)v89 setDoubleClickEnable:v90];
        goto LABEL_107;
      }
      v110 = object_getClass(self);
      if (class_isMetaClass(v110)) {
        int v111 = 43;
      }
      else {
        int v111 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v161 = v111;
      __int16 v162 = 2082;
      v163 = object_getClassName(self);
      __int16 v164 = 2082;
      v165 = sel_getName(a2);
      __int16 v166 = 1024;
      int v167 = 148;
      __int16 v168 = 2112;
      CFStringRef v169 = v15;
      v51 = "%c[%{public}s %{public}s]:%i Unexpected data type for dbl click: %@";
      v52 = v48;
      uint32_t v53 = 44;
    }
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v51, buf, v53);
    goto LABEL_105;
  }
  v159.receiver = self;
  v159.super_class = (Class)NFWalletPresentationSettingsSESD;
  [(NFWalletPresentationSettingsSESD *)&v159 observeValueForKeyPath:v11 ofObject:v12 change:v13 context:a6];
LABEL_108:
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___NFWalletPresentationSettingsSESD;
  id v3 = a3;
  BOOL v4 = [super keyPathsForValuesAffectingValueForKey:v3];
  unsigned int v5 = [v3 isEqualToString:@"isEligibleForDoubleClick" v8.receiver, v8.super_class];

  if (v5)
  {
    uint64_t v6 = [v4 setByAddingObjectsFromArray:&off_1003229B8];

    BOOL v4 = (void *)v6;
  }

  return v4;
}

- (NSString)defaultAppIdentifier
{
  return self->_defaultAppIdentifier;
}

- (void)setDefaultAppIdentifier:(id)a3
{
}

- (unint64_t)walletDomain
{
  return self->_walletDomain;
}

- (void)setWalletDomain:(unint64_t)a3
{
  self->_walletDomain = a3;
}

- (BOOL)doubleClickEnable
{
  return self->_doubleClickEnable;
}

- (void)setDoubleClickEnable:(BOOL)a3
{
  self->_doubleClickEnable = a3;
}

- (void).cxx_destruct
{
}

@end