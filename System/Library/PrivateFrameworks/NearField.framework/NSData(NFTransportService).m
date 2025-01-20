@interface NSData(NFTransportService)
- (id)decodeCHForRequest:()NFTransportService;
- (id)decodeCHRequestRetry;
- (id)decodeCHSelect;
- (id)decodeSelectErrorDictionary;
- (uint64_t)decodeCHRequest;
- (uint64_t)encodeToCBOR;
@end

@implementation NSData(NFTransportService)

- (uint64_t)encodeToCBOR
{
  id CBORClass = getCBORClass();
  return [CBORClass cborWithData:a1];
}

- (uint64_t)decodeCHRequest
{
  return [a1 decodeCHForRequest:1];
}

- (id)decodeCHSelect
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[a1 length] <= 1)
  {
    v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v11 = [a1 debugDescription];
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i Unexpected response received: %{public}@", v12, ClassName, Name, 61, v11);
    }
    dispatch_get_specific(*v4);
    v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    v14 = object_getClass(a1);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    v16 = object_getClassName(a1);
    v17 = sel_getName(a2);
    v18 = [a1 debugDescription];
    *(_DWORD *)buf = 67110146;
    int v42 = v15;
    __int16 v43 = 2082;
    v44 = v16;
    __int16 v45 = 2082;
    v46 = v17;
    __int16 v47 = 1024;
    int v48 = 61;
    __int16 v49 = 2114;
    v50 = v18;
    v19 = "%c[%{public}s %{public}s]:%i Unexpected response received: %{public}@";
    v20 = v13;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
LABEL_22:
    _os_log_impl(&dword_19D636000, v20, v21, v19, buf, 0x2Cu);

LABEL_23:
    v38 = 0;
    goto LABEL_26;
  }
  id v22 = a1;
  uint64_t v23 = [v22 bytes];
  uint64_t v24 = [v22 length] - 2;
  if (*(unsigned __int16 *)(v23 + v24) == (unsigned __int16)SW_STATUS_DATA_NOT_FOUND)
  {
    v39 = objc_msgSend(v22, "subdataWithRange:", 0, objc_msgSend(v22, "length") - 2);
    v38 = [v39 decodeSelectErrorDictionary];
  }
  else
  {
    if (*(unsigned __int16 *)(v23 + v24) != (unsigned __int16)SW_STATUS_SUCCESS)
    {
      v25 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v26 = NFLogGetLogger();
      if (v26)
      {
        v27 = (void (*)(uint64_t, const char *, ...))v26;
        v28 = object_getClass(v22);
        BOOL v29 = class_isMetaClass(v28);
        v30 = object_getClassName(v22);
        v31 = sel_getName(a2);
        v32 = [v22 debugDescription];
        uint64_t v33 = 45;
        if (v29) {
          uint64_t v33 = 43;
        }
        v27(6, "%c[%{public}s %{public}s]:%i SW status error: %{public}@", v33, v30, v31, 73, v32);
      }
      dispatch_get_specific(*v25);
      v13 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      v34 = object_getClass(v22);
      if (class_isMetaClass(v34)) {
        int v35 = 43;
      }
      else {
        int v35 = 45;
      }
      v36 = object_getClassName(v22);
      v37 = sel_getName(a2);
      v18 = [v22 debugDescription];
      *(_DWORD *)buf = 67110146;
      int v42 = v35;
      __int16 v43 = 2082;
      v44 = v36;
      __int16 v45 = 2082;
      v46 = v37;
      __int16 v47 = 1024;
      int v48 = 73;
      __int16 v49 = 2114;
      v50 = v18;
      v19 = "%c[%{public}s %{public}s]:%i SW status error: %{public}@";
      v20 = v13;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_22;
    }
    v38 = [v22 decodeCHForRequest:0];
  }
LABEL_26:
  return v38;
}

- (id)decodeCHForRequest:()NFTransportService
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  if (CBORLibraryLibraryCore())
  {
    if (a3) {
      v5 = "request";
    }
    else {
      v5 = "select";
    }
    v6 = [getCBORClass() decodeFromData:a1];
    if ([v6 type] != 5)
    {
      __int16 v49 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v51 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v56 = [v6 description];
        uint64_t v57 = 45;
        if (isMetaClass) {
          uint64_t v57 = 43;
        }
        v51(6, "%c[%{public}s %{public}s]:%i Unexpected %s received: %@", v57, ClassName, Name, 88, v5, v56);
      }
      dispatch_get_specific(*v49);
      v7 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v58 = object_getClass(a1);
        if (class_isMetaClass(v58)) {
          int v59 = 43;
        }
        else {
          int v59 = 45;
        }
        v60 = object_getClassName(a1);
        v61 = sel_getName(a2);
        v62 = [v6 description];
        *(_DWORD *)buf = 67110402;
        int v109 = v59;
        __int16 v110 = 2082;
        v111 = v60;
        __int16 v112 = 2082;
        v113 = v61;
        __int16 v114 = 1024;
        int v115 = 88;
        __int16 v116 = 2080;
        v117 = v5;
        __int16 v118 = 2112;
        v119 = v62;
        _os_log_impl(&dword_19D636000, v7, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected %s received: %@", buf, 0x36u);
      }
      int v48 = 0;
      goto LABEL_64;
    }
    v7 = [getCBORClass() cborWithInteger:0];
    v8 = [getCBORClass() cborWithInteger:1];
    v9 = [getCBORClass() cborWithInteger:2];
    uint64_t v10 = [getCBORClass() cborWithInteger:3];
    v11 = [v6 dictionary];
    uint64_t v12 = [v11 objectForKeyedSubscript:v7];

    v13 = [v6 dictionary];
    v99 = [v13 objectForKeyedSubscript:v8];

    v14 = [v6 dictionary];
    v100 = [v14 objectForKeyedSubscript:v9];

    int v15 = [v6 dictionary];
    v96 = (void *)v10;
    v98 = [v15 objectForKeyedSubscript:v10];

    v97 = v12;
    v16 = [v12 string];
    if ([v16 length])
    {
      v17 = [v99 string];
      if ([v17 length] && v100)
      {
        v95 = v9;
        uint64_t v18 = [v100 type];

        BOOL v19 = v18 == 4;
        v9 = v95;
        if (v19)
        {
          v92 = v8;
          v93 = v7;
          v94 = v6;
          v20 = objc_opt_new();
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          os_log_type_t v21 = [v100 array];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v103 objects:v107 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v104;
            v25 = (const void **)MEMORY[0x1E4FBA898];
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v104 != v24) {
                  objc_enumerationMutation(v21);
                }
                v27 = *(void **)(*((void *)&v103 + 1) + 8 * i);
                if ([v27 type] == 5)
                {
                  v28 = [v27 asJSON];
                  [v20 addObject:v28];
                }
                else
                {
                  dispatch_get_specific(*v25);
                  uint64_t v29 = NFLogGetLogger();
                  if (v29)
                  {
                    v30 = (void (*)(uint64_t, const char *, ...))v29;
                    v31 = object_getClass(a1);
                    BOOL v32 = class_isMetaClass(v31);
                    uint64_t v33 = object_getClassName(a1);
                    v89 = sel_getName(a2);
                    uint64_t v34 = 45;
                    if (v32) {
                      uint64_t v34 = 43;
                    }
                    v30(6, "%c[%{public}s %{public}s]:%i Not a valid transport service dictionary; skipping",
                      v34,
                      v33,
                      v89,
                      115);
                  }
                  dispatch_get_specific(*v25);
                  v28 = NFSharedLogGetLogger();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    int v35 = object_getClass(a1);
                    if (class_isMetaClass(v35)) {
                      int v36 = 43;
                    }
                    else {
                      int v36 = 45;
                    }
                    v37 = object_getClassName(a1);
                    v38 = sel_getName(a2);
                    *(_DWORD *)buf = 67109890;
                    int v109 = v36;
                    __int16 v110 = 2082;
                    v111 = v37;
                    __int16 v112 = 2082;
                    v113 = v38;
                    __int16 v114 = 1024;
                    int v115 = 115;
                    _os_log_impl(&dword_19D636000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not a valid transport service dictionary; skipping",
                      buf,
                      0x22u);
                  }
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v103 objects:v107 count:16];
            }
            while (v23);
          }

          int v48 = objc_opt_new();
          v82 = v97;
          v85 = [v97 string];
          [v48 setVersion:v85];

          v86 = [v99 string];
          [v48 setApplicationLabel:v86];

          v75 = v20;
          [v48 setTransportServiceList:v20];
          v7 = v93;
          v6 = v94;
          v8 = v92;
          v9 = v95;
          v83 = v98;
          if (!v98)
          {
            v81 = v96;
            goto LABEL_63;
          }
          v87 = [v98 asJSON];
          [v48 setUserInfo:v87];

          v81 = v96;
LABEL_62:
          v83 = v98;
LABEL_63:

LABEL_64:
          goto LABEL_65;
        }
LABEL_52:
        v101 = v5;
        v63 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t v64 = NFLogGetLogger();
        if (v64)
        {
          v65 = (void (*)(uint64_t, const char *, ...))v64;
          v66 = object_getClass(a1);
          BOOL v67 = class_isMetaClass(v66);
          v68 = v9;
          v69 = object_getClassName(a1);
          v70 = v7;
          v71 = sel_getName(a2);
          [v6 description];
          v73 = v72 = v8;
          v91 = v71;
          v7 = v70;
          uint64_t v74 = 45;
          if (v67) {
            uint64_t v74 = 43;
          }
          v88 = v69;
          v9 = v68;
          v65(6, "%c[%{public}s %{public}s]:%i Unexpected %s received: %@", v74, v88, v91, 107, v101, v73);

          v8 = v72;
          v63 = (const void **)MEMORY[0x1E4FBA898];
        }
        dispatch_get_specific(*v63);
        v75 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          v76 = object_getClass(a1);
          if (class_isMetaClass(v76)) {
            int v77 = 43;
          }
          else {
            int v77 = 45;
          }
          v78 = object_getClassName(a1);
          v79 = sel_getName(a2);
          v80 = [v6 description];
          *(_DWORD *)buf = 67110402;
          int v109 = v77;
          __int16 v110 = 2082;
          v111 = v78;
          __int16 v112 = 2082;
          v113 = v79;
          __int16 v114 = 1024;
          int v115 = 107;
          __int16 v116 = 2080;
          v117 = v101;
          __int16 v118 = 2112;
          v119 = v80;
          _os_log_impl(&dword_19D636000, v75, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected %s received: %@", buf, 0x36u);
        }
        int v48 = 0;
        v81 = v96;
        v82 = v97;
        goto LABEL_62;
      }
    }
    goto LABEL_52;
  }
  v39 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v40 = NFLogGetLogger();
  if (v40)
  {
    v41 = (void (*)(uint64_t, const char *, ...))v40;
    int v42 = object_getClass(a1);
    BOOL v43 = class_isMetaClass(v42);
    v44 = object_getClassName(a1);
    v90 = sel_getName(a2);
    uint64_t v45 = 45;
    if (v43) {
      uint64_t v45 = 43;
    }
    v41(3, "%c[%{public}s %{public}s]:%i CBOR library unavailable", v45, v44, v90, 80);
  }
  dispatch_get_specific(*v39);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v46 = object_getClass(a1);
    if (class_isMetaClass(v46)) {
      int v47 = 43;
    }
    else {
      int v47 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v109 = v47;
    __int16 v110 = 2082;
    v111 = object_getClassName(a1);
    __int16 v112 = 2082;
    v113 = sel_getName(a2);
    __int16 v114 = 1024;
    int v115 = 80;
    _os_log_impl(&dword_19D636000, v6, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i CBOR library unavailable", buf, 0x22u);
  }
  int v48 = 0;
LABEL_65:

  return v48;
}

- (id)decodeSelectErrorDictionary
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v4 = [getCBORClass() decodeFromData:a1];
  if ([v4 type] == 5)
  {
    v5 = [getCBORClass() cborWithInteger:1];
    v6 = [v4 dictionary];
    v7 = [v6 objectForKeyedSubscript:v5];

    v8 = [getCBORClass() cborWithInteger:2];
    v9 = [v4 dictionary];
    uint64_t v10 = [v9 objectForKeyedSubscript:v8];

    if (v7 && v10)
    {
      v11 = objc_opt_new();
      uint64_t v12 = [v7 numeric];
      [v11 setRetryInMS:v12];

      v13 = [v10 numeric];
      [v11 setRetryRandom:v13];
    }
    else
    {
      sel = a2;
      v28 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v30 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        v46 = v8;
        ClassName = object_getClassName(a1);
        Name = sel_getName(sel);
        int v35 = [v4 description];
        uint64_t v45 = Name;
        v28 = (const void **)MEMORY[0x1E4FBA898];
        uint64_t v36 = 45;
        if (isMetaClass) {
          uint64_t v36 = 43;
        }
        v44 = ClassName;
        v8 = v46;
        v30(3, "%c[%{public}s %{public}s]:%i Unexpected error dictionary: %@", v36, v44, v45, 164, v35);
      }
      dispatch_get_specific(*v28);
      v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = object_getClass(a1);
        if (class_isMetaClass(v38)) {
          int v39 = 43;
        }
        else {
          int v39 = 45;
        }
        uint64_t v40 = object_getClassName(a1);
        v41 = sel_getName(sel);
        int v42 = [v4 description];
        *(_DWORD *)buf = 67110146;
        int v49 = v39;
        __int16 v50 = 2082;
        uint64_t v51 = v40;
        __int16 v52 = 2082;
        v53 = v41;
        __int16 v54 = 1024;
        int v55 = 164;
        __int16 v56 = 2112;
        uint64_t v57 = v42;
        _os_log_impl(&dword_19D636000, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected error dictionary: %@", buf, 0x2Cu);
      }
      v11 = 0;
    }
  }
  else
  {
    v14 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v15 = NFLogGetLogger();
    if (v15)
    {
      v16 = (void (*)(uint64_t, const char *, ...))v15;
      v17 = object_getClass(a1);
      BOOL v18 = class_isMetaClass(v17);
      BOOL v19 = object_getClassName(a1);
      v20 = sel_getName(a2);
      os_log_type_t v21 = [v4 description];
      uint64_t v22 = 45;
      if (v18) {
        uint64_t v22 = 43;
      }
      v16(6, "%c[%{public}s %{public}s]:%i Unexpected response received: %@", v22, v19, v20, 148, v21);
    }
    dispatch_get_specific(*v14);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = object_getClass(a1);
      if (class_isMetaClass(v23)) {
        int v24 = 43;
      }
      else {
        int v24 = 45;
      }
      v25 = object_getClassName(a1);
      uint64_t v26 = sel_getName(a2);
      v27 = [v4 description];
      *(_DWORD *)buf = 67110146;
      int v49 = v24;
      __int16 v50 = 2082;
      uint64_t v51 = v25;
      __int16 v52 = 2082;
      v53 = v26;
      __int16 v54 = 1024;
      int v55 = 148;
      __int16 v56 = 2112;
      uint64_t v57 = v27;
      _os_log_impl(&dword_19D636000, v5, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected response received: %@", buf, 0x2Cu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)decodeCHRequestRetry
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v4 = [getCBORClass() decodeFromData:a1];
  if ([v4 type] == 5)
  {
    v5 = [getCBORClass() cborWithInteger:0];
    v6 = [v4 dictionary];
    v7 = [v6 objectForKeyedSubscript:v5];

    v8 = [getCBORClass() cborWithInteger:4];
    v9 = [v4 dictionary];
    uint64_t v10 = [v9 objectForKeyedSubscript:v8];

    if (v10
      && ([v7 string],
          v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v11 length],
          v11,
          v12))
    {
      v13 = objc_opt_new();
      v14 = [v10 numeric];
      [v13 setRetryRandom:v14];

      uint64_t v15 = [v7 string];
      [v13 setVersion:v15];
    }
    else
    {
      sel = a2;
      v30 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        BOOL v32 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        uint64_t v51 = v7;
        ClassName = object_getClassName(a1);
        uint64_t v36 = v10;
        v37 = v8;
        Name = sel_getName(sel);
        int v39 = [v4 description];
        __int16 v50 = Name;
        v8 = v37;
        uint64_t v10 = v36;
        v30 = (const void **)MEMORY[0x1E4FBA898];
        uint64_t v40 = 45;
        if (isMetaClass) {
          uint64_t v40 = 43;
        }
        int v49 = ClassName;
        v7 = v51;
        v32(3, "%c[%{public}s %{public}s]:%i Unexpected retry request: %@", v40, v49, v50, 185, v39);
      }
      dispatch_get_specific(*v30);
      v41 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        int v42 = object_getClass(a1);
        if (class_isMetaClass(v42)) {
          int v43 = 43;
        }
        else {
          int v43 = 45;
        }
        v44 = object_getClassName(a1);
        uint64_t v45 = sel_getName(sel);
        [v4 description];
        int v47 = v46 = v8;
        *(_DWORD *)buf = 67110146;
        int v54 = v43;
        __int16 v55 = 2082;
        __int16 v56 = v44;
        __int16 v57 = 2082;
        uint64_t v58 = v45;
        __int16 v59 = 1024;
        int v60 = 185;
        __int16 v61 = 2112;
        v62 = v47;
        _os_log_impl(&dword_19D636000, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected retry request: %@", buf, 0x2Cu);

        v8 = v46;
      }

      v13 = 0;
    }
  }
  else
  {
    v16 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v17 = NFLogGetLogger();
    if (v17)
    {
      BOOL v18 = (void (*)(uint64_t, const char *, ...))v17;
      BOOL v19 = object_getClass(a1);
      BOOL v20 = class_isMetaClass(v19);
      os_log_type_t v21 = object_getClassName(a1);
      uint64_t v22 = sel_getName(a2);
      uint64_t v23 = [v4 description];
      uint64_t v24 = 45;
      if (v20) {
        uint64_t v24 = 43;
      }
      v18(6, "%c[%{public}s %{public}s]:%i Unexpected response received: %@", v24, v21, v22, 173, v23);
    }
    dispatch_get_specific(*v16);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v25 = object_getClass(a1);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      v27 = object_getClassName(a1);
      v28 = sel_getName(a2);
      uint64_t v29 = [v4 description];
      *(_DWORD *)buf = 67110146;
      int v54 = v26;
      __int16 v55 = 2082;
      __int16 v56 = v27;
      __int16 v57 = 2082;
      uint64_t v58 = v28;
      __int16 v59 = 1024;
      int v60 = 173;
      __int16 v61 = 2112;
      v62 = v29;
      _os_log_impl(&dword_19D636000, v5, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected response received: %@", buf, 0x2Cu);
    }
    v13 = 0;
  }

  return v13;
}

@end