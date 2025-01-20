@interface UMDPersonaManifest
+ (Class)platformClass;
+ (id)dataForPersonaSet:(id)a3;
+ (id)dictForUserSet:(id)a3;
+ (id)manifest;
+ (id)manifestFromData:(id)a3;
+ (id)personaSetFromData:(id)a3;
+ (id)userSetFromDict:(id)a3;
+ (unsigned)currentVersion;
- (NSData)dataValue;
- (NSSet)users;
- (UMDPersonaManifest)init;
- (unint64_t)generation;
- (unsigned)version;
- (void)setGeneration:(unint64_t)a3;
- (void)setUsers:(id)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation UMDPersonaManifest

+ (Class)platformClass
{
  return (Class)objc_opt_class();
}

+ (unsigned)currentVersion
{
  id v2 = [a1 platformClass];

  return [v2 currentVersion];
}

+ (id)manifest
{
  id v2 = [a1 platformClass];

  return [v2 manifest];
}

+ (id)manifestFromData:(id)a3
{
  id v4 = a3;
  v5 = [objc_msgSend(a1, "platformClass") manifestFromData:v4];

  return v5;
}

- (UMDPersonaManifest)init
{
  v7.receiver = self;
  v7.super_class = (Class)UMDPersonaManifest;
  id v2 = [(UMDPersonaManifest *)&v7 init];
  if (!v2) {
    sub_1000B08C8();
  }
  v3 = v2;
  uint64_t v4 = +[NSSet set];
  users = v3->_users;
  v3->_users = (NSSet *)v4;

  return v3;
}

- (NSData)dataValue
{
  if (qword_1000E4190 != -1) {
    dispatch_once(&qword_1000E4190, &stru_1000D5C10);
  }
  id v2 = (id)qword_1000E4188;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    unsigned int v3 = sub_100055404(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      unsigned int v4 = v3;
    }
    else {
      unsigned int v4 = v3 & 0xFFFFFFFE;
    }
    if (v4)
    {
      v5 = (const char *)_os_log_send_and_compose_impl();
      v6 = (char *)v5;
      if (v5) {
        sub_100055434(v5);
      }
    }
    else
    {
      v6 = 0;
    }
    free(v6);
  }

  return 0;
}

+ (id)personaSetFromData:(id)a3
{
  unsigned int v3 = sub_10008AFE0((uint64_t)a3);
  unsigned int v4 = v3;
  if (!v3)
  {
    if (qword_1000E4190 != -1) {
      dispatch_once(&qword_1000E4190, &stru_1000D5C10);
    }
    v5 = (id)qword_1000E4188;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(void *)v52 = 0;
      unsigned int v24 = sub_100055404(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = v24 & 0xFFFFFFFE;
      }
      if (v25)
      {
        LOWORD(v50) = 0;
        v26 = (const char *)_os_log_send_and_compose_impl();
        v27 = (char *)v26;
        if (v26) {
          sub_100055434(v26);
        }
      }
      else
      {
        v27 = 0;
      }
      free(v27);
    }
    v19 = 0;
    goto LABEL_98;
  }
  v5 = [v3 objectForKeyedSubscript:@"NUMENT"];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (qword_1000E4190 != -1) {
      dispatch_once(&qword_1000E4190, &stru_1000D5C10);
    }
    v6 = (id)qword_1000E4188;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(void *)v52 = 0;
      unsigned int v20 = sub_100055404(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        unsigned int v21 = v20;
      }
      else {
        unsigned int v21 = v20 & 0xFFFFFFFE;
      }
      if (v21)
      {
        LOWORD(v50) = 0;
        v22 = (const char *)_os_log_send_and_compose_impl();
        v23 = (char *)v22;
        if (v22) {
          sub_100055434(v22);
        }
      }
      else
      {
        v23 = 0;
      }
      free(v23);
    }
    v19 = 0;
    goto LABEL_97;
  }
  v6 = [v4 objectForKeyedSubscript:@"BLOB"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (qword_1000E4190 != -1) {
      dispatch_once(&qword_1000E4190, &stru_1000D5C10);
    }
    v8 = (id)qword_1000E4188;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(void *)v52 = 0;
      unsigned int v28 = sub_100055404(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v29 = v28;
      }
      else {
        unsigned int v29 = v28 & 0xFFFFFFFE;
      }
      if (v29)
      {
        LOWORD(v50) = 0;
        v30 = (const char *)_os_log_send_and_compose_impl();
        v31 = (char *)v30;
        if (v30) {
          sub_100055434(v30);
        }
      }
      else
      {
        v31 = 0;
      }
      free(v31);
    }
    v19 = 0;
    goto LABEL_96;
  }
  objc_super v7 = sub_10008B270((uint64_t)v6);
  v8 = v7;
  if (!v7)
  {
    if (qword_1000E4190 != -1) {
      dispatch_once(&qword_1000E4190, &stru_1000D5C10);
    }
    v18 = (id)qword_1000E4188;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_94;
    }
    *(void *)v52 = 0;
    unsigned int v32 = sub_100055404(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      unsigned int v33 = v32;
    }
    else {
      unsigned int v33 = v32 & 0xFFFFFFFE;
    }
    if (v33)
    {
      LOWORD(v50) = 0;
      v34 = (void *)_os_log_send_and_compose_impl();
      if (!v34) {
        goto LABEL_72;
      }
      goto LABEL_70;
    }
LABEL_71:
    v34 = 0;
    goto LABEL_72;
  }
  id v9 = [v7 count];
  if (v9 != [v5 unsignedLongValue])
  {
    if (qword_1000E4190 != -1) {
      dispatch_once(&qword_1000E4190, &stru_1000D5C10);
    }
    v18 = (id)qword_1000E4188;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_94;
    }
    uint64_t v50 = 0;
    int v35 = sub_100055404(0);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v35 &= ~1u;
    }
    if (v35)
    {
      v36 = v18;
      *(_DWORD *)v52 = 134218240;
      *(void *)&v52[4] = [v8 count];
      __int16 v53 = 2048;
      id v54 = [v5 unsignedLongValue];
      v34 = (void *)_os_log_send_and_compose_impl();

      if (!v34)
      {
LABEL_72:
        free(v34);
LABEL_94:
        v19 = 0;
        goto LABEL_95;
      }
LABEL_70:
      sub_100055434((const char *)v34);
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  v10 = +[NSMutableSet set];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v11) {
    goto LABEL_17;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v47;
  while (2)
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v47 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_1000E4190 != -1) {
          dispatch_once(&qword_1000E4190, &stru_1000D5C10);
        }
        v18 = v10;
        v37 = (id)qword_1000E4188;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          goto LABEL_93;
        }
        *(void *)v52 = 0;
        unsigned int v38 = sub_100055404(0);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          unsigned int v39 = v38;
        }
        else {
          unsigned int v39 = v38 & 0xFFFFFFFE;
        }
        if (v39)
        {
          LOWORD(v50) = 0;
          goto LABEL_89;
        }
LABEL_91:
        v43 = 0;
LABEL_92:
        free(v43);
LABEL_93:

        goto LABEL_94;
      }
      uint64_t v16 = sub_10007928C((uint64_t)UMDPersonaManifestPersona, v15);
      if (!v16)
      {
        if (qword_1000E4190 != -1) {
          dispatch_once(&qword_1000E4190, &stru_1000D5C10);
        }
        v18 = v10;
        v37 = (id)qword_1000E4188;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          goto LABEL_93;
        }
        *(void *)v52 = 0;
        unsigned int v40 = sub_100055404(0);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          unsigned int v41 = v40;
        }
        else {
          unsigned int v41 = v40 & 0xFFFFFFFE;
        }
        if (v41)
        {
          LOWORD(v50) = 0;
LABEL_89:
          v42 = (const char *)_os_log_send_and_compose_impl();
          v43 = (char *)v42;
          if (v42) {
            sub_100055434(v42);
          }
          goto LABEL_92;
        }
        goto LABEL_91;
      }
      v17 = (void *)v16;
      [v10 addObject:v16];
    }
    id v12 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_17:

  v18 = v10;
  v19 = v18;
LABEL_95:

LABEL_96:
LABEL_97:

LABEL_98:

  return v19;
}

+ (id)dataForPersonaSet:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[NSMutableDictionary dictionary];
  v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = sub_1000797E4(*(void *)(*((void *)&v16 + 1) + 8 * i));
        [v5 addObject:v11, v16];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
  [v4 setObject:v12 forKeyedSubscript:@"NUMENT"];

  uint64_t v13 = sub_10008AE50((uint64_t)v5);
  [v4 setObject:v13 forKeyedSubscript:@"BLOB"];

  v14 = sub_10008ACC0((uint64_t)v4);

  return v14;
}

+ (id)userSetFromDict:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v61;
    v10 = &AKSGetLastUser_ptr;
    v52 = v6;
    __int16 v53 = v5;
    uint64_t v49 = *(void *)v61;
    id v50 = a1;
LABEL_3:
    id v11 = 0;
    id v51 = v8;
    while (1)
    {
      if (*(void *)v61 != v9) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v11);
      uint64_t v13 = sub_1000173F4((uint64_t)v10[406], v12);
      if (!v13) {
        break;
      }
      v14 = v13;
      v15 = [v6 objectForKeyedSubscript:v12];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_1000E4190 != -1) {
          dispatch_once(&qword_1000E4190, &stru_1000D5C10);
        }
        long long v17 = (id)qword_1000E4188;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(void *)v64 = 0;
          unsigned int v41 = sub_100055404(0);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            unsigned int v42 = v41;
          }
          else {
            unsigned int v42 = v41 & 0xFFFFFFFE;
          }
          if (v42)
          {
            LOWORD(v59) = 0;
            v43 = (const char *)_os_log_send_and_compose_impl();
            v44 = (char *)v43;
            if (v43) {
              sub_100055434(v43);
            }
          }
          else
          {
            v44 = 0;
          }
          free(v44);
        }
        goto LABEL_37;
      }
      long long v16 = [a1 personaSetFromData:v15];
      long long v17 = v16;
      if (!v16)
      {
        if (qword_1000E4190 != -1) {
          dispatch_once(&qword_1000E4190, &stru_1000D5C10);
        }
        long long v18 = (id)qword_1000E4188;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(void *)v64 = 0;
          unsigned int v45 = sub_100055404(0);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            unsigned int v46 = v45;
          }
          else {
            unsigned int v46 = v45 & 0xFFFFFFFE;
          }
          if (v46)
          {
            LOWORD(v59) = 0;
            long long v47 = (const char *)_os_log_send_and_compose_impl();
            long long v48 = (char *)v47;
            if (v47) {
              sub_100055434(v47);
            }
          }
          else
          {
            long long v48 = 0;
          }
          free(v48);
        }
LABEL_36:

LABEL_37:
LABEL_38:

        id v29 = 0;
        goto LABEL_39;
      }
      id v54 = v15;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v18 = v16;
      id v19 = [v18 countByEnumeratingWithState:&v55 objects:v67 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v56;
        while (2)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v56 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            if (v23)
            {
              id v24 = *(id *)(v23 + 120);
              if (v24)
              {
                unsigned int v25 = v24;
                unsigned __int8 v26 = [*(id *)(v23 + 120) isEqual:v14];

                if ((v26 & 1) == 0)
                {
                  if (qword_1000E4190 != -1) {
                    dispatch_once(&qword_1000E4190, &stru_1000D5C10);
                  }
                  v5 = v53;
                  v30 = (id)qword_1000E4188;
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v59 = 0;
                    unsigned int v31 = sub_100055404(0);
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                      unsigned int v32 = v31;
                    }
                    else {
                      unsigned int v32 = v31 & 0xFFFFFFFE;
                    }
                    if (v32)
                    {
                      uint64_t v33 = *(void *)(v23 + 120);
                      *(_DWORD *)v64 = 138543618;
                      *(void *)&v64[4] = v33;
                      __int16 v65 = 2114;
                      v66 = v14;
                      v34 = v30;
                      int v35 = (char *)_os_log_send_and_compose_impl();

                      if (v35) {
                        sub_100055434(v35);
                      }
                    }
                    else
                    {
                      int v35 = 0;
                    }
                    free(v35);
                  }

                  id v6 = v52;
                  v15 = v54;
                  goto LABEL_36;
                }
              }
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      v27 = objc_alloc_init(UMDPersonaManifestUser);
      sub_100019084((uint64_t)v27, v14);
      if (v27) {
        objc_setProperty_nonatomic_copy(v27, v28, v18, 16);
      }
      v5 = v53;
      [v53 addObject:v27];

      id v11 = (char *)v11 + 1;
      id v6 = v52;
      uint64_t v9 = v49;
      a1 = v50;
      v10 = &AKSGetLastUser_ptr;
      if (v11 == v51)
      {
        id v8 = [v52 countByEnumeratingWithState:&v60 objects:v68 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_23;
      }
    }
    if (qword_1000E4190 != -1) {
      dispatch_once(&qword_1000E4190, &stru_1000D5C10);
    }
    v14 = (id)qword_1000E4188;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v59 = 0;
      unsigned int v37 = sub_100055404(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        unsigned int v38 = v37;
      }
      else {
        unsigned int v38 = v37 & 0xFFFFFFFE;
      }
      if (v38)
      {
        *(_DWORD *)v64 = 138543362;
        *(void *)&v64[4] = v12;
        unsigned int v39 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v40 = (char *)v39;
        if (v39) {
          sub_100055434(v39);
        }
      }
      else
      {
        unsigned int v40 = 0;
      }
      free(v40);
    }
    goto LABEL_38;
  }
LABEL_23:

  id v29 = v5;
LABEL_39:

  return v29;
}

+ (id)dictForUserSet:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v45;
    unsigned int v38 = v5;
    unsigned int v39 = v4;
    uint64_t v36 = *(void *)v45;
    while (2)
    {
      id v37 = v6;
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        if (!v9 || !*(void *)(v9 + 24))
        {
          if (qword_1000E4190 != -1) {
            dispatch_once(&qword_1000E4190, &stru_1000D5C10);
          }
          v10 = (id)qword_1000E4188;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(void *)long long v48 = 0;
            unsigned int v32 = sub_100055404(0);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              unsigned int v33 = v32;
            }
            else {
              unsigned int v33 = v32 & 0xFFFFFFFE;
            }
            if (v33)
            {
              v34 = (const char *)_os_log_send_and_compose_impl();
              int v35 = (char *)v34;
              if (v34) {
                sub_100055434(v34);
              }
            }
            else
            {
              int v35 = 0;
            }
            free(v35);
          }
LABEL_34:

          id v23 = 0;
          goto LABEL_35;
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v10 = *(id *)(v9 + 16);
        id v11 = [v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v41;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v41 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
              if (v15)
              {
                id v16 = *(id *)(v15 + 120);
                if (v16)
                {
                  long long v17 = v16;
                  uint64_t v18 = *(void *)(v9 + 24);
                  id v19 = *(id *)(v15 + 120);
                  LOBYTE(v18) = [v19 isEqual:v18];

                  if ((v18 & 1) == 0)
                  {
                    if (qword_1000E4190 != -1) {
                      dispatch_once(&qword_1000E4190, &stru_1000D5C10);
                    }
                    id v5 = v38;
                    id v24 = (id)qword_1000E4188;
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                    {
                      int v25 = sub_100055404(0);
                      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                        v25 &= ~1u;
                      }
                      if (v25)
                      {
                        unsigned __int8 v26 = *(void **)(v15 + 120);
                        uint64_t v27 = *(void *)(v9 + 24);
                        *(_DWORD *)long long v48 = 138543618;
                        *(void *)&v48[4] = v26;
                        __int16 v49 = 2114;
                        uint64_t v50 = v27;
                        id v28 = v26;
                        id v29 = v24;
                        v30 = (char *)_os_log_send_and_compose_impl();

                        if (v30) {
                          sub_100055434(v30);
                        }
                      }
                      else
                      {
                        v30 = 0;
                      }
                      free(v30);
                    }

                    id v4 = v39;
                    goto LABEL_34;
                  }
                }
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        id v5 = v38;
        id v4 = v39;
        uint64_t v7 = v36;
        id v20 = *(id *)(v9 + 16);
        uint64_t v21 = +[UMDPersonaManifest dataForPersonaSet:v20];
        v22 = [*(id *)(v9 + 24) UUIDString];
        [v39 setObject:v21 forKeyedSubscript:v22];
      }
      id v6 = [v38 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v23 = v4;
LABEL_35:

  return v23;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (NSSet)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end