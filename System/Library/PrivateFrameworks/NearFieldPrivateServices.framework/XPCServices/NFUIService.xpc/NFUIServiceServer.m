@interface NFUIServiceServer
- (void)runService:(id)a3 callback:(id)a4;
- (void)sendInvalidationNotification:(id)a3 error:(id)a4 userCanceled:(BOOL)a5;
@end

@implementation NFUIServiceServer

- (void)runService:(id)a3 callback:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [v6 valueForKey:@"Action"];
  v9 = [v6 valueForKey:@"Parameter"];
  v10 = [v6 valueForKey:@"UserData"];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v22 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      v24 = v7;
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      BOOL v26 = !isMetaClass;
      v7 = v24;
      uint64_t v27 = 45;
      if (!v26) {
        uint64_t v27 = 43;
      }
      v22(3, "%c[%{public}s %{public}s]:%i Unknown action for context %@", v27, ClassName, Name, 32, v10);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v152 = v30;
      __int16 v153 = 2082;
      v154 = object_getClassName(self);
      __int16 v155 = 2082;
      v156 = sel_getName(a2);
      __int16 v157 = 1024;
      int v158 = 32;
      __int16 v159 = 2112;
      v160 = v10;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown action for context %@", buf, 0x2Cu);
    }

    NSErrorUserInfoKey v173 = NSLocalizedDescriptionKey;
    CFStringRef v174 = @"Invalid parameter";
    v31 = &v174;
    v32 = &v173;
LABEL_24:
    v33 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v32 count:1];
    uint64_t v34 = 2;
LABEL_25:
    v35 = +[NSError errorWithDomain:@"NFUIService" code:v34 userInfo:v33];
    v7[2](v7, 0, v35);

    goto LABEL_26;
  }
  v139 = v9;
  v140 = (const char *)v10;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFLogGetLogger();
  if (v11)
  {
    v12 = (void (*)(uint64_t, const char *, ...))v11;
    v13 = object_getClass(self);
    BOOL v14 = class_isMetaClass(v13);
    v15 = object_getClassName(self);
    v126 = sel_getName(a2);
    uint64_t v16 = 45;
    if (v14) {
      uint64_t v16 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i Got message %@ for context %@", v16, v15, v126, 37, v8, v140);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67110402;
    int v152 = v19;
    __int16 v153 = 2082;
    v154 = object_getClassName(self);
    __int16 v155 = 2082;
    v156 = sel_getName(a2);
    __int16 v157 = 1024;
    int v158 = 37;
    __int16 v159 = 2112;
    v160 = v8;
    __int16 v161 = 2112;
    SEL v162 = v140;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Got message %@ for context %@", buf, 0x36u);
  }

  v9 = v139;
  v10 = (void *)v140;
  if ([v8 isEqualToString:@"CoreNFCUI_Activate"])
  {
    v20 = +[NFServiceCoreNFCUI instance];
    v145[0] = _NSConcreteStackBlock;
    v145[1] = 3221225472;
    v145[2] = sub_100009964;
    v145[3] = &unk_10000C6F8;
    v146 = v7;
    [v20 activate:self context:v140 withCompletion:v145];

    goto LABEL_26;
  }
  if ([v8 isEqualToString:@"CoreNFCUI_Mode"])
  {
    if (v139 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v36 = [v139 integerValue];
      v37 = +[NFServiceCoreNFCUI instance];
      [v37 setUIOperationMode:0];

      if (v36 == (id)3)
      {
        v96 = +[NFServiceCoreNFCUI instance];
        [v96 setUIOperationMode:1];

        v97 = +[NFServiceCoreNFCUI instance];
        [v97 setUIMode:20];

        v7[2](v7, 0, 0);
        v10 = (void *)v140;
        goto LABEL_26;
      }
      v10 = (void *)v140;
      if (v36 == (id)2)
      {
        v38 = +[NFServiceCoreNFCUI instance];
        v39 = v38;
        uint64_t v40 = 30;
        goto LABEL_94;
      }
      if (v36 == (id)1)
      {
        v38 = +[NFServiceCoreNFCUI instance];
        v39 = v38;
        uint64_t v40 = 20;
LABEL_94:
        [v38 setUIMode:v40];
        goto LABEL_95;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v98 = NFLogGetLogger();
      if (v98)
      {
        v99 = (void (*)(uint64_t, const char *, ...))v98;
        v100 = object_getClass(self);
        BOOL v101 = class_isMetaClass(v100);
        v102 = object_getClassName(self);
        v131 = sel_getName(a2);
        uint64_t v103 = 45;
        if (v101) {
          uint64_t v103 = 43;
        }
        v124 = v102;
        v9 = v139;
        v10 = (void *)v140;
        v99(3, "%c[%{public}s %{public}s]:%i Invalid parameter", v103, v124, v131, 73);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v104 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        v105 = object_getClass(self);
        if (class_isMetaClass(v105)) {
          int v106 = 43;
        }
        else {
          int v106 = 45;
        }
        v107 = object_getClassName(self);
        v108 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v152 = v106;
        __int16 v153 = 2082;
        v154 = v107;
        __int16 v155 = 2082;
        v156 = v108;
        __int16 v157 = 1024;
        int v158 = 73;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid parameter", buf, 0x22u);
      }

      NSErrorUserInfoKey v169 = NSLocalizedDescriptionKey;
      CFStringRef v170 = @"Invalid parameter";
      v31 = &v170;
      v32 = &v169;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v43 = NFLogGetLogger();
      if (v43)
      {
        v44 = (void (*)(uint64_t, const char *, ...))v43;
        v45 = object_getClass(self);
        BOOL v46 = class_isMetaClass(v45);
        v47 = object_getClassName(self);
        v128 = sel_getName(a2);
        uint64_t v48 = 45;
        if (v46) {
          uint64_t v48 = 43;
        }
        v121 = v47;
        v9 = v139;
        v10 = (void *)v140;
        v44(3, "%c[%{public}s %{public}s]:%i Invalid parameter", v48, v121, v128, 49);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
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
        int v152 = v51;
        __int16 v153 = 2082;
        v154 = v52;
        __int16 v155 = 2082;
        v156 = v53;
        __int16 v157 = 1024;
        int v158 = 49;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid parameter", buf, 0x22u);
      }

      NSErrorUserInfoKey v171 = NSLocalizedDescriptionKey;
      CFStringRef v172 = @"Invalid parameter";
      v31 = &v172;
      v32 = &v171;
    }
    goto LABEL_24;
  }
  if ([v8 isEqualToString:@"CoreNFCUI_TagCount"])
  {
    if (v139)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v41 = v139;
        v42 = +[NFServiceCoreNFCUI instance];
        [v42 tagCount:v41];
LABEL_52:

        v7[2](v7, 0, 0);
LABEL_76:

        goto LABEL_26;
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v54 = NFLogGetLogger();
    if (v54)
    {
      v55 = (void (*)(uint64_t, const char *, ...))v54;
      v56 = object_getClass(self);
      BOOL v57 = class_isMetaClass(v56);
      v58 = object_getClassName(self);
      v129 = sel_getName(a2);
      uint64_t v59 = 45;
      if (v57) {
        uint64_t v59 = 43;
      }
      v122 = v58;
      v9 = v139;
      v10 = (void *)v140;
      v55(3, "%c[%{public}s %{public}s]:%i Invalid parameter", v59, v122, v129, 83);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = object_getClass(self);
      if (class_isMetaClass(v61)) {
        int v62 = 43;
      }
      else {
        int v62 = 45;
      }
      v63 = object_getClassName(self);
      v64 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v152 = v62;
      __int16 v153 = 2082;
      v154 = v63;
      __int16 v155 = 2082;
      v156 = v64;
      __int16 v157 = 1024;
      int v158 = 83;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid parameter", buf, 0x22u);
    }

    NSErrorUserInfoKey v167 = NSLocalizedDescriptionKey;
    CFStringRef v168 = @"Invalid parameter";
    v65 = &v168;
    v66 = &v167;
    goto LABEL_75;
  }
  if ([v8 isEqualToString:@"CoreNFCUI_ScanText"])
  {
    if (v139)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v41 = v139;
        v42 = +[NFServiceCoreNFCUI instance];
        [v42 setPurpose:v41];
        goto LABEL_52;
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v67 = NFLogGetLogger();
    if (v67)
    {
      v68 = (void (*)(uint64_t, const char *, ...))v67;
      v69 = object_getClass(self);
      BOOL v70 = class_isMetaClass(v69);
      v71 = object_getClassName(self);
      v130 = sel_getName(a2);
      uint64_t v72 = 45;
      if (v70) {
        uint64_t v72 = 43;
      }
      v123 = v71;
      v9 = v139;
      v10 = (void *)v140;
      v68(3, "%c[%{public}s %{public}s]:%i Invalid parameter", v72, v123, v130, 97);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v73 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v74 = object_getClass(self);
      if (class_isMetaClass(v74)) {
        int v75 = 43;
      }
      else {
        int v75 = 45;
      }
      v76 = object_getClassName(self);
      v77 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v152 = v75;
      __int16 v153 = 2082;
      v154 = v76;
      __int16 v155 = 2082;
      v156 = v77;
      __int16 v157 = 1024;
      int v158 = 97;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid parameter", buf, 0x22u);
    }

    NSErrorUserInfoKey v165 = NSLocalizedDescriptionKey;
    CFStringRef v166 = @"Invalid parameter";
    v65 = &v166;
    v66 = &v165;
LABEL_75:
    id v41 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v66 count:1];
    v78 = +[NSError errorWithDomain:@"NFUIService" code:2 userInfo:v41];
    v7[2](v7, 0, v78);

    goto LABEL_76;
  }
  if ([v8 isEqualToString:@"CoreNFCUI_Invalidate"])
  {
    v39 = +[NFServiceCoreNFCUI instance];
    [v39 invalidate];
LABEL_95:

    v7[2](v7, 0, 0);
    goto LABEL_26;
  }
  if (![v8 isEqualToString:@"launchBundle"])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v109 = NFLogGetLogger();
    if (v109)
    {
      v110 = (void (*)(uint64_t, const char *, ...))v109;
      v111 = object_getClass(self);
      BOOL v112 = class_isMetaClass(v111);
      v125 = object_getClassName(self);
      v132 = sel_getName(a2);
      BOOL v26 = !v112;
      v9 = v139;
      v10 = (void *)v140;
      uint64_t v113 = 45;
      if (!v26) {
        uint64_t v113 = 43;
      }
      v110(3, "%c[%{public}s %{public}s]:%i Unknown action %@", v113, v125, v132, 140, v8);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v114 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
    {
      v115 = object_getClass(self);
      if (class_isMetaClass(v115)) {
        int v116 = 43;
      }
      else {
        int v116 = 45;
      }
      v117 = object_getClassName(self);
      v118 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v152 = v116;
      __int16 v153 = 2082;
      v154 = v117;
      __int16 v155 = 2082;
      v156 = v118;
      __int16 v157 = 1024;
      int v158 = 140;
      __int16 v159 = 2112;
      v160 = v8;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown action %@", buf, 0x2Cu);
    }

    NSErrorUserInfoKey v147 = NSLocalizedDescriptionKey;
    CFStringRef v148 = @"Unknown Action";
    v33 = +[NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
    uint64_t v34 = 1;
    goto LABEL_25;
  }
  v79 = objc_msgSend(v6, "NF_stringForKey:", @"launchBundleIdentifier");
  v80 = objc_msgSend(v6, "NF_numberForKey:", @"launchReason");
  v81 = objc_msgSend(v6, "NF_numberForKey:", @"walletDomain");
  if (v79 && [v79 lengthOfBytesUsingEncoding:4] && v80 && v81)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v82 = NFLogGetLogger();
    if (v82)
    {
      v83 = (void (*)(uint64_t, const char *, ...))v82;
      v84 = object_getClass(self);
      BOOL v136 = class_isMetaClass(v84);
      v137 = object_getClassName(self);
      v135 = sel_getName(a2);
      id v133 = [v80 unsignedIntegerValue];
      id v134 = [v81 integerValue];
      uint64_t v85 = 43;
      if (!v136) {
        uint64_t v85 = 45;
      }
      v9 = v139;
      v83(6, "%c[%{public}s %{public}s]:%i Launching %{public}@, reason=%lu, domain=%lu", v85, v137, v135, 121, v79, v133, v134);
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
      int v138 = v88;
      v89 = object_getClassName(self);
      v90 = sel_getName(a2);
      SEL sela = (SEL)[v80 unsignedIntegerValue];
      id v91 = [v81 integerValue];
      *(_DWORD *)buf = 67110658;
      int v152 = v138;
      __int16 v153 = 2082;
      v154 = v89;
      __int16 v155 = 2082;
      v156 = v90;
      __int16 v157 = 1024;
      int v158 = 121;
      __int16 v159 = 2114;
      v160 = v79;
      __int16 v161 = 2048;
      SEL v162 = sela;
      v9 = v139;
      __int16 v163 = 2048;
      id v164 = v91;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Launching %{public}@, reason=%lu, domain=%lu", buf, 0x40u);
    }

    v92 = v81;
    BOOL v93 = [v81 integerValue] != 0;
    id v94 = [v80 unsignedIntegerValue];
    v143[0] = _NSConcreteStackBlock;
    v143[1] = 3221225472;
    v143[2] = sub_10000997C;
    v143[3] = &unk_10000C720;
    v144 = v7;
    +[NFWindowSceneEventLauncher launchBundleWithIdentifier:v79 reason:v94 domain:v93 completion:v143];
    v95 = v144;
    v10 = (void *)v140;
  }
  else
  {
    v92 = v81;
    NSErrorUserInfoKey v149 = NSLocalizedDescriptionKey;
    CFStringRef v150 = @"Invalid parameter";
    v95 = +[NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];
    v119 = +[NSError errorWithDomain:@"NFUIService" code:2 userInfo:v95];
    v7[2](v7, 0, v119);
  }
LABEL_26:
}

- (void)sendInvalidationNotification:(id)a3 error:(id)a4 userCanceled:(BOOL)a5
{
  BOOL v5 = a5;
  v15[0] = @"Action";
  v15[1] = @"Parameter";
  v16[0] = @"CoreNFCUI_Invalidate";
  CFStringRef v13 = @"UserCancelled";
  id v7 = a4;
  id v8 = a3;
  v9 = +[NSNumber numberWithBool:v5];
  BOOL v14 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v16[1] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v12 = [v8 remoteObjectProxy];

  [v12 serviceNotificationReceived:v11 error:v7];
}

@end